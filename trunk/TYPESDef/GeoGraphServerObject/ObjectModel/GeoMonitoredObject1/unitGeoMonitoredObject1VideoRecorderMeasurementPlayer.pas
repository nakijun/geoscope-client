unit unitGeoMonitoredObject1VideoRecorderMeasurementPlayer;

interface
uses
  Windows,
  SysUtils,
  Classes,
  SyncObjs,
  unitGeoMonitoredObject1Model,
  unitVideoRecorderMeasurement;

type
  TChannelType = (ctAudio,ctVideo);

  TVideoRecorderMeasurementChannel = class(TThread)
  private
    Lock: TCriticalSection;
    //.
    ChannelType: TChannelType;
    ChannelFileName: string;
    //.
    ReceiverPort: integer;
    //.
    flSetStartPosition: boolean;
    StartPosition: integer;
    //.
    ExceptionMessage: string;
  public
    flActive: boolean;
    ReadyToStartEvent: THandle;
    SynchronizeEvent: THandle;

    Constructor Create(const pChannelType: TChannelType; const pChannelFileName: string; const pReceiverPort: integer);
    Destructor Destroy(); override;
    procedure Execute; override;
    procedure SetStartPosition(const SP: integer);
    function  GetStartPosition(out SP: integer): boolean;
    function  IsStartPositionSet(): boolean;
    {$IFDEF Plugin}
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    {$ENDIF}
    procedure DoOnException();
  end;

  TDoOnPlayerClosed = procedure of object;
  TDoOnStartStreaming = procedure of object;

  TVideoRecorderMeasurementPlayer = class(TThread)
  private
    DatabaseFolder: string;
    MeasurementID: string;
    //.
    Mode: integer;
    flAudio: boolean;
    flVideo: boolean;
    AudioPort: integer;
    VideoPort: integer;
    AudioFileName: string;
    VideoFileName: string;
    ClientsLock: TCriticalSection;
    AudioClient: TVideoRecorderMeasurementChannel;
    VideoClient: TVideoRecorderMeasurementChannel;
    //.
    Measurement: TVideoRecorderMeasurement;
    //.
    ExceptionMessage: string;
  public
    OnPlayerClosed: TDoOnPlayerClosed;
    OnStartStreaming: TDoOnStartStreaming;

    Constructor Create(const pDatabaseFolder: string; const pMeasurementID: string);
    Destructor Destroy(); override;
    procedure Execute(); override;
    {$IFDEF Plugin}
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    {$ENDIF}
    procedure CreateChannels();
    procedure FreeChannels();
    procedure StartChannels();
    procedure SetStartPosition(const SP: double);
    procedure DoOnException();
    procedure DoOnPlayerClosing();
    procedure DoOnStartStreaming;
  end;


implementation
uses
  {$IFDEF Plugin}
  FunctionalityImport,
  {$ENDIF}
  winsock,
  Sockets,
  Forms,
  Registry;


{TVideoRecorderMeasurementChannel}
Constructor TVideoRecorderMeasurementChannel.Create(const pChannelType: TChannelType; const pChannelFileName: string; const pReceiverPort: integer);
begin
Lock:=TCriticalSection.Create();
//.
ChannelType:=pChannelType;
ChannelFileName:=pChannelFileName;
//.
ReceiverPort:=pReceiverPort;
//.
StartPosition:=0;
flSetStartPosition:=true;
//.
ReadyToStartEvent:=CreateEvent(nil,false,false,nil);
SynchronizeEvent:=0;
//.
Inherited Create(true);
Priority:=tpTimeCritical;
end;

Destructor TVideoRecorderMeasurementChannel.Destroy();
begin
Inherited;
if (ReadyToStartEvent <> 0) then CloseHandle(ReadyToStartEvent);
Lock.Free();
end;

procedure TVideoRecorderMeasurementChannel.Execute();
const
  SynchronizeTimeout = 100;
var
  WSAData: TWSAData;
  ErrorCode: integer;
  ReceiverSocket: TSocket;
  ReceiverSocketAddress: TSockAddr;
  PacketStream: TMemoryStream;
  ChannelFileStream: TFileStream;
  _StartPosition: integer;
  I: integer;
  flNewPosition: boolean;
  Descriptor: integer;
  LastTimestamp,Timestamp: dword;
  FragmentTSBase,PacketTS,PacketTSBase: integer;
begin
try
ErrorCode:=WSAStartup($0202,WSAData);
if (ErrorCode <> 0) then Raise Exception.Create('error of WSA initializing'); //. =>
try
ReceiverSocket:=Socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
try
ReceiverSocketAddress.sin_family:=AF_INET;
ReceiverSocketAddress.sin_port:=htons(ReceiverPort);
ReceiverSocketAddress.sin_addr.s_addr:=inet_addr('127.0.0.1');
//.
PacketStream:=TMemoryStream.Create();
try
PacketStream.Size:=(1024*1024)*1;
//.
ChannelFileStream:=TFileStream.Create(ChannelFileName,(fmOpenRead OR fmShareDenyWrite));
try
LastTimestamp:=0;
FragmentTSBase:=0;
while (NOT Terminated) do begin
  if (GetStartPosition({out} _StartPosition))
   then begin
    //. search start position
    ChannelFileStream.Position:=0;
    I:=0;
    while (NOT Terminated) do begin
      if ((ChannelFileStream.Size-ChannelFileStream.Position) < SizeOf(Descriptor)) then Break; //. ->
      //.
      if (I = _StartPosition) then Break; //. >
      //.
      ChannelFileStream.Read(Descriptor,SizeOf(Descriptor));
      if (Descriptor > 0) then ChannelFileStream.Position:=ChannelFileStream.Position+Descriptor;
      //.
      Inc(I);
      end;
    //.
    SetEvent(ReadyToStartEvent);
    //. wait for synchronization
    if (SynchronizeEvent <> 0)
     then begin
      flNewPosition:=false;
      while (WaitForSingleObject(SynchronizeEvent, SynchronizeTimeout) = WAIT_TIMEOUT) do begin
        if (Terminated) then Exit; //. ->
        if (IsStartPositionSet())
         then begin
          flNewPosition:=true;
          Break; //. >                                                             
          end;
        end;
      if (flNewPosition) then Break; //. >
      end;
    //.
    PacketTSBase:=-1;
    while (NOT Terminated) do begin
      if ((ChannelFileStream.Size-ChannelFileStream.Position) < SizeOf(Descriptor)) then Break; //. >
      //.
      ChannelFileStream.Read(Descriptor,SizeOf(Descriptor));
      if (Descriptor > 0)
       then begin
        if (Descriptor > PacketStream.Size) then PacketStream.Size:=Descriptor;
        ChannelFileStream.Read(PacketStream.Memory^,Descriptor);
        //.
        PacketTS:=(Byte(Pointer(DWord(PacketStream.Memory)+4)^) SHL 24)+((Byte(Pointer(DWord(PacketStream.Memory)+5)^) AND $FF) SHL 16)+((Byte(Pointer(DWord(PacketStream.Memory)+6)^) AND $FF) SHL 8)+(Byte(Pointer(DWord(PacketStream.Memory)+7)^) AND $FF);
        if (PacketTSBase < 0) then PacketTSBase:=PacketTS;
        PacketTS:=FragmentTSBase+(PacketTS-PacketTSBase);
        Timestamp:=PacketTS;
        case ChannelType of
        ctAudio: Sleep(1000 DIV 50);
        ctVideo: Sleep((Timestamp-LastTimestamp) DIV 90);
        end;
        LastTimestamp:=Timestamp;
        //.
        Byte(Pointer(DWord(PacketStream.Memory)+7)^):=Byte(PacketTS AND $FF);
        Byte(Pointer(DWord(PacketStream.Memory)+6)^):=Byte((PacketTS SHR 8) AND $FF);
        Byte(Pointer(DWord(PacketStream.Memory)+5)^):=Byte((PacketTS SHR 16) AND $FF);
        Byte(Pointer(DWord(PacketStream.Memory)+4)^):=Byte(PacketTS SHR 24);
        //.
        SendTo(ReceiverSocket, PacketStream.Memory^,Descriptor, 0, ReceiverSocketAddress,SizeOf(ReceiverSocketAddress));
        end;
      //.
      if (IsStartPositionSet()) then Break; //. >
      end;
    FragmentTSBase:=LastTimestamp;
    end
   else Sleep(100);
  end;
finally
ChannelFileStream.Destroy();
end;
finally
PacketStream.Destroy();
end;
finally
CloseSocket(ReceiverSocket);
end;
finally
WSACleanup();
end;
except
  On E: Exception do begin
    ExceptionMessage:=E.Message;
    Synchronize(DoOnException);
    end;
  end;
end;

procedure TVideoRecorderMeasurementChannel.SetStartPosition(const SP: integer);
begin
Lock.Enter();
try
StartPosition:=SP;
flSetStartPosition:=true;
finally
Lock.Leave();
end;
end;

function TVideoRecorderMeasurementChannel.GetStartPosition(out SP: integer): boolean;
begin
Lock.Enter();
try
if (flSetStartPosition)
 then begin
  flSetStartPosition:=false;
  //. 
  SP:=StartPosition;
  Result:=true;
  end
 else Result:=false;
finally
Lock.Leave();
end;
end;

function TVideoRecorderMeasurementChannel.IsStartPositionSet(): boolean;
begin
Lock.Enter();
try
Result:=flSetStartPosition;
finally
Lock.Leave();
end;
end;

{$IFDEF Plugin}
procedure TVideoRecorderMeasurementChannel.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;
{$ENDIF}

procedure TVideoRecorderMeasurementChannel.DoOnException();
begin
if (Terminated) then Exit; //. ->
//.
Application.MessageBox(PChar('Video/Audio server client error, '+ExceptionMessage),'error',MB_ICONEXCLAMATION+MB_OK);
end;


const
  UDPPortMin = 3000;
var
  UDPPort: integer = UDPPortMin;

function GetNextFreeUDPPort(): integer;
const
  UDPPortLimit = 65535;
var
  Port: integer;
  ReceiverSocket: TSocket;
  ListeningAddress: TSockAddr;
begin
Result:=0;
repeat
  Port:=InterlockedExchangeAdd(UDPPort,10);
  if (Port > UDPPortLimit)
   then begin
    InterlockedExchange(UDPPort,UDPPortMin);
    Continue; //. ^
    end;
  ReceiverSocket:=Socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
  try
  ListeningAddress.sin_family:=AF_INET;
  ListeningAddress.sin_port:=htons(Port);
  ListeningAddress.sin_addr.s_addr:=INADDR_ANY;
  if (Bind(ReceiverSocket,ListeningAddress,SizeOf(ListeningAddress)) = 0)
   then begin
    Result:=Port;
    Exit; //. ->
    end;
  finally
  CloseSocket(ReceiverSocket);
  end;
until (false);
end;


{TVideoRecorderMeasurementPlayer}
Constructor TVideoRecorderMeasurementPlayer.Create(const pDatabaseFolder: string; const pMeasurementID: string);
begin
DatabaseFolder:=pDatabaseFolder;
MeasurementID:=pMeasurementID;
Measurement:=TVideoRecorderMeasurement.Create(DatabaseFolder,MeasurementID);
//.
OnPlayerClosed:=nil;
OnStartStreaming:=nil;
//.
ClientsLock:=TCriticalSection.Create();;
//.
Inherited Create(true);
end;

Destructor TVideoRecorderMeasurementPlayer.Destroy();
begin
Inherited;
ClientsLock.Free();
Measurement.Free();
end;

procedure TVideoRecorderMeasurementPlayer.Execute();
const
  AudioFile = 'Audio.rtp';
  VideoFile = 'Video.rtp';
  PathTempDATA = 'TempDATA'; //. do not modify

  function ExecutePlayer(ExeFile: string; Parameters: string = ''; ShowWindow: Word = SW_SHOWNORMAL): Boolean;
  var
    ExecuteCommand: array[0 .. 512] of Char;
    PathToExeFile: string;
    StartUpInfo: TStartupInfo;
    ProcessInfo: TProcessInformation;
    ExitCode: word;
  begin
  StrPCopy(ExecuteCommand,ExeFile+' '+Parameters);
  FillChar(StartUpInfo,SizeOf(StartUpInfo),#0);
  StartUpInfo.cb :=SizeOf(StartUpInfo);
  StartUpInfo.dwFlags:=STARTF_USESHOWWINDOW;
  StartUpInfo.wShowWindow:=ShowWindow;
  PathToExeFile:=ExtractFileDir(ExeFile);
  if (CreateProcess(nil,
                    ExecuteCommand,
                    nil,
                    nil,
                    False,
                    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS,
                    nil,
                    PChar(PathToExeFile),
                    StartUpInfo,
                   ProcessInfo))
   then
    try
    Sleep(3000); //. to initialize player
    StartChannels();
    Synchronize(DoOnStartStreaming);
    //.
    repeat
      ExitCode:=WaitForSingleObject(ProcessInfo.hProcess,100);
    until ((ExitCode <> WAIT_TIMEOUT) OR Terminated);
    if (Terminated)
     then TerminateProcess(ProcessInfo.hProcess,0)
     else Synchronize(DoOnPlayerClosing);
    Result:=true;
    finally
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
    end
  else Result:=false;
  end;

  function GetExeByExtension(const sExt: string): string;
  var
    sExtDesc: string;
  begin
  Result:='';
  with TRegistry.Create() do
  try
  RootKey:=HKEY_CLASSES_ROOT;
  if (OpenKeyReadOnly(sExt))
   then begin
    sExtDesc:=ReadString('') ;
    CloseKey();
    end;
  if (sExtDesc <> '')
   then 
    if (OpenKeyReadOnly(sExtDesc+'\Shell\Open\Command'))
     then Result:=ReadString('');
  finally
  Destroy();
  end;
  if (Result <> '')
   then
    if (Result[1] = '"')
     then Result:=Copy(Result,2,-1 + Pos('"',Copy(Result,2,MaxINt))) ;
  end;

  
var
  AFN,VFN: string;
  SDPFN: string;
  SDP: TextFile;
  PlayerExecutive: string;
begin
try
Mode:=Measurement.Mode;
AudioFileName:=Measurement.MeasurementFolder+'\'+AudioFile;
VideoFileName:=Measurement.MeasurementFolder+'\'+VideoFile;
flAudio:=FileExists(AudioFileName);
flVideo:=FileExists(VideoFileName);
//.
if (flAudio OR flVideo) then AudioPort:=GetNextFreeUDPPort();
if (flVideo) then VideoPort:=GetNextFreeUDPPort();
//.
SDPFN:=ExtractFilePath(ParamStr(0))+Measurement.MeasurementFolder+'\'+'Session.SDP';
AssignFile(SDP,SDPFN); ReWrite(SDP);
try
WriteLn(SDP,'v=0');
WriteLn(SDP,'s=Unnamed');
if (flVideo) then WriteLn(SDP,'m=video '+IntToStr(VideoPort)+' RTP/AVP 96');
case (TVideoRecorderModuleMode(Mode)) of
VIDEORECORDERMODULEMODE_H263STREAM1_AMRNBSTREAM1: WriteLn(SDP,'a=rtpmap:96 H263-1998/90000');
VIDEORECORDERMODULEMODE_H264STREAM1_AMRNBSTREAM1: WriteLn(SDP,'a=rtpmap:96 H264/90000');
end;
WriteLn(SDP,'a=fmtp:96 packetization-mode=1;profile-level-id=42000a;sprop-parameter-sets=Z0IACpZUBQHogA==,aM44gA==;');
if (flAudio OR flVideo) then WriteLn(SDP,'m=audio '+IntToStr(AudioPort)+' RTP/AVP 96');
WriteLn(SDP,'b=AS:128');
WriteLn(SDP,'b=RR:0');
WriteLn(SDP,'a=rtpmap:96 AMR/8000');
WriteLn(SDP,'a=fmtp:96 octet-align=1');
finally
CloseFile(SDP);
end;
//.
CreateChannels();
try
PlayerExecutive:=GetExeByExtension('.sdp');
if (PlayerExecutive <> '')
 then ExecutePlayer(PlayerExecutive,'"'+SDPFN+'"')
 else begin
  Synchronize(DoOnPlayerClosing);
  Raise Exception.Create('there is no installed video player'#$0D#$0A'please install VLC Player'); //. =>
  end;
finally
FreeChannels();
end;
except
  On E: Exception do begin
    ExceptionMessage:=E.Message;
    Synchronize(DoOnException);
    end;
  end;
end;

{$IFDEF Plugin}
procedure TVideoRecorderMeasurementPlayer.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;
{$ENDIF}

procedure TVideoRecorderMeasurementPlayer.CreateChannels();
begin
ClientsLock.Enter();
try
if (flAudio) then AudioClient:=TVideoRecorderMeasurementChannel.Create(ctAudio,AudioFileName,AudioPort) else AudioClient:=nil;
if (flVideo) then VideoClient:=TVideoRecorderMeasurementChannel.Create(ctVideo,VideoFileName,VideoPort) else VideoClient:=nil;
//.
if ((AudioClient <> nil) AND (VideoClient <> nil))
 then begin
  AudioClient.SynchronizeEvent:=VideoClient.ReadyToStartEvent;
  VideoClient.SynchronizeEvent:=AudioClient.ReadyToStartEvent;
  end;
finally
ClientsLock.Leave();
end;
end;

procedure TVideoRecorderMeasurementPlayer.FreeChannels();
begin
if (VideoClient <> nil)
 then begin
  VideoClient.Terminate();
  VideoClient.WaitFor();
  end;
if (AudioClient <> nil)
 then begin
  AudioClient.Terminate();
  AudioClient.WaitFor();
  end;
//.
ClientsLock.Enter();
try
FreeAndNil(VideoClient);
FreeAndNil(AudioClient);
finally
ClientsLock.Leave();
end;
end;

procedure TVideoRecorderMeasurementPlayer.StartChannels();
begin
ClientsLock.Enter();
try
if (flAudio) then AudioClient.Resume();
if (flVideo) then VideoClient.Resume();
finally
ClientsLock.Leave();
end;
end;

procedure TVideoRecorderMeasurementPlayer.SetStartPosition(const SP: double);
begin
ClientsLock.Enter();
try
if (AudioClient <> nil) then AudioClient.SetStartPosition(Trunc(SP*Measurement.AudioPackets));
if (VideoClient <> nil) then VideoClient.SetStartPosition(Trunc(SP*Measurement.VideoPackets));
finally
ClientsLock.Leave();
end;
end;

procedure TVideoRecorderMeasurementPlayer.DoOnException();
begin
if (Terminated) then Exit; //. ->
//.
Application.MessageBox(PChar('Player error, '+ExceptionMessage),'error',MB_ICONEXCLAMATION+MB_OK);
end;

procedure TVideoRecorderMeasurementPlayer.DoOnPlayerClosing();
begin
if (Assigned(OnPlayerClosed)) then OnPlayerClosed();
end;

procedure TVideoRecorderMeasurementPlayer.DoOnStartStreaming();
begin
if (Assigned(OnStartStreaming)) then OnStartStreaming();
end;


end.
