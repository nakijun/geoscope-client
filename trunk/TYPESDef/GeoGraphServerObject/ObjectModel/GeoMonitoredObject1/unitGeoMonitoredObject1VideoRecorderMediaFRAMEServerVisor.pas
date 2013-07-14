unit unitGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor;

interface

uses
  Windows,
  Messages,
  Variants,
  Classes,
  SysUtils,
  SyncObjs,
  Winsock,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  MMSystem,
  JPEG,
  ExtCtrls,
  ComCtrls,
  StdCtrls,
  unitGeoMonitoredObject1Model,
  unitGeoMonitoredObject1LANConnectionRepeater,
  PasLibVlcPlayerUnit;

const
  //. SERVER DEFINES
  AudioSampleServer_Service_SamplePackets 	= 1;
  AudioSampleServer_Service_SampleZippedPackets = 2;
  AudioSampleServer_Service_AACPackets          = 3;
  AudioSampleServer_Service_AACRTPPackets       = 4;
  //. SERVER DEFINES
  VideoFrameServer_Service_JPEGFrames = 1;
  VideoFrameServer_Service_H264Frames = 2;
  //.
  GeographProxyServerPort = 2010;
  //.
  AudioRemotePort = 10001;
  VideoRemotePort = 10002;
  //.
  AudioLocalPort = 10001;
  VideoLocalPort = 10002;

type
  TDoOnException = procedure (const ExceptionMessage: string) of object;
  TDoOnAudioClientInitialization = procedure (const SampleRate: integer) of object;
  TDoOnBeforeAudioClientFinalization = procedure () of object;

  TMediaFrameServerAudioClient = class(TThread);

  TDoOnAudioSampleFrame = procedure (const Timestamp: double; const FrameBufferPtr: pointer; const FrameBufferSize: integer) of object;

  TMediaFrameServerAudioSampleClient = class(TMediaFrameServerAudioClient)
  private
    Port: integer;
    SampleRate: integer;
    SamplePacketSize: integer;
    Quality: integer;
    //.
    FrameTimestamp: double;
    FrameBufferPtr: pointer;
    FrameBufferSize: integer;
    //.
    ExceptionMessage: string;
    //.
    OnAudioClientInitialization: TDoOnAudioClientInitialization;
    OnBeforeAudioClientFinalization: TDoOnBeforeAudioClientFinalization;
    OnAudioSampleFrame: TDoOnAudioSampleFrame;
    OnException: TDoOnException;

    procedure DoOnAudioClientInitialization();
    procedure DoOnBeforeAudioClientFinalization();
    procedure DoOnAudioSampleFrame();
    procedure DoOnException();
  public
    Constructor Create(const pPort: integer; const pSampleRate: integer; const pSamplePacketSize: integer; const pQuality: integer; const pOnAudioClientInitialization: TDoOnAudioClientInitialization; const pOnBeforeAudioClientFinalization: TDoOnBeforeAudioClientFinalization; const pOnAudioSampleFrame: TDoOnAudioSampleFrame; const pOnException: TDoOnException);
    Destructor Destroy(); override;
    procedure Execute(); override;
    {$IFDEF Plugin}
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    {$ENDIF}
  end;

  TMediaFrameServerAudioAACClient = class;
  
  TDoOnAudioAACConfiguration = procedure (const SampleRate: integer; const ConfigWord: word) of object;
  TDoOnAudioAACFrame = procedure (const AACClient: TMediaFrameServerAudioAACClient; const FrameBufferPtr: pointer; const FrameBufferSize: integer) of object;

  TMediaFrameServerAudioAACClient = class(TMediaFrameServerAudioClient)
  private
    Port: integer;
    SampleRate: integer;
    SamplePacketSize: integer;
    Quality: integer;
    //.
    flConfigIsArrived: boolean;
    ConfigWord: word;
    //.
    ObjectType: byte;
    FrequencyIndex: byte;
    ChannelConfiguration: byte;
    //.
    FrameBufferPtr: pointer;
    FrameBufferSize: integer;
    //.
    ExceptionMessage: string;
    //.
    OnAudioClientInitialization: TDoOnAudioClientInitialization;
    OnBeforeAudioClientFinalization: TDoOnBeforeAudioClientFinalization;
    OnAudioAACConfiguration: TDoOnAudioAACConfiguration;
    OnAudioAACFrame: TDoOnAudioAACFrame;
    OnException: TDoOnException;

    procedure DoOnAudioClientInitialization();
    procedure DoOnBeforeAudioClientFinalization();
    procedure DoOnAudioAACConfiguration();
    procedure DoOnAudioAACFrame();
    procedure DoOnException();
  public
    Constructor Create(const pPort: integer; const pSampleRate: integer; const pSamplePacketSize: integer; const pQuality: integer; const pOnAudioClientInitialization: TDoOnAudioClientInitialization; const pOnBeforeAudioClientFinalization: TDoOnBeforeAudioClientFinalization; const pOnAudioAACConfiguration: TDoOnAudioAACConfiguration; const pOnAudioAACFrame: TDoOnAudioAACFrame; const pOnException: TDoOnException);
    Destructor Destroy(); override;
    procedure Execute(); override;
    {$IFDEF Plugin}
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    {$ENDIF}
  end;

  TMediaFrameServerAudioAACRTPClient = class;
  
  TDoOnAudioRTPPacket = procedure (const AACClient: TMediaFrameServerAudioAACRTPClient; const PacketBufferPtr: pointer; const PacketBufferSize: integer) of object;
  TDoOnAudioRTCPPacket = procedure (const AACClient: TMediaFrameServerAudioAACRTPClient; const PacketBufferPtr: pointer; const PacketBufferSize: integer) of object;

  TMediaFrameServerAudioAACRTPClient = class(TMediaFrameServerAudioClient)
  private
    Port: integer;
    SampleRate: integer;
    SamplePacketSize: integer;
    Quality: integer;
    //.
    flConfigIsArrived: boolean;
    ConfigWord: word;
    //.
    ObjectType: byte;
    FrequencyIndex: byte;
    ChannelConfiguration: byte;
    //.
    BufferPtr: pointer;
    BufferSize: word;
    //.
    ExceptionMessage: string;
    //.
    OnAudioClientInitialization: TDoOnAudioClientInitialization;
    OnBeforeAudioClientFinalization: TDoOnBeforeAudioClientFinalization;
    OnAudioAACConfiguration: TDoOnAudioAACConfiguration;
    OnAudioRTPPacket: TDoOnAudioRTPPacket;
    OnAudioRTCPPacket: TDoOnAudioRTCPPacket;
    OnException: TDoOnException;

    procedure DoOnAudioClientInitialization();
    procedure DoOnBeforeAudioClientFinalization();
    procedure DoOnAudioAACConfiguration();
    procedure DoOnAudioRTPPacket();
    procedure DoOnAudioRTCPPacket();
    procedure DoOnException();
  public
    Constructor Create(const pPort: integer; const pSampleRate: integer; const pSamplePacketSize: integer; const pQuality: integer; const pOnAudioClientInitialization: TDoOnAudioClientInitialization; const pOnBeforeAudioClientFinalization: TDoOnBeforeAudioClientFinalization; const pOnAudioAACConfiguration: TDoOnAudioAACConfiguration; const pOnAudioRTPPacket: TDoOnAudioRTPPacket; const pOnAudioRTCPPacket: TDoOnAudioRTCPPacket; const pOnException: TDoOnException);
    Destructor Destroy(); override;
    procedure Execute(); override;
    {$IFDEF Plugin}
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    {$ENDIF}
  end;


  TMediaFrameServerVideoClient = class(TThread);
  
  TDoOnVideoJPEGFrame = procedure (const Timestamp: double; const Frame: TJPEGImage) of object;

  TMediaFrameServerVideoMJPEGClient = class(TMediaFrameServerVideoClient)
  private
    Port: integer;
    FrameRate: integer;
    FrameQuality: integer;
    //.
    FrameTimestamp: double;
    FrameJPEG: TJPEGImage;
    //.
    ExceptionMessage: string;
    //.
    OnVideoJPEGFrame: TDoOnVideoJPEGFrame;
    OnException: TDoOnException;

    procedure DoOnVideoJPEGFrame();
    procedure DoOnException();
  public

    Constructor Create(const pPort: integer; const pFrameRate: integer; const pFrameQuality: integer; const pOnVideoJPEGFrame: TDoOnVideoJPEGFrame; const pOnException: TDoOnException);
    Destructor Destroy(); override;
    procedure Execute(); override;
    {$IFDEF Plugin}
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    {$ENDIF}
  end;

  TDoOnVideoH264Frame = procedure (const FrameBufferPtr: pointer; const FrameBufferSize: integer) of object;

  TMediaFrameServerVideoH264Client = class(TMediaFrameServerVideoClient)
  private
    Port: integer;
    FrameRate: integer;
    FrameQuality: integer;
    //.
    FrameBuffer: array of byte;
    FrameBufferSize: integer;
    //.
    ExceptionMessage: string;
    //.
    OnVideoH264Frame: TDoOnVideoH264Frame;
    OnException: TDoOnException;

    procedure DoOnVideoH264Frame();
    procedure DoOnException();
  public

    Constructor Create(const pPort: integer; const pFrameRate: integer; const pFrameQuality: integer; const pOnVideoH264Frame: TDoOnVideoH264Frame; const pOnException: TDoOnException);
    Destructor Destroy(); override;
    procedure Execute(); override;
    {$IFDEF Plugin}
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    {$ENDIF}
  end;


  TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor = class;

  TAudioBufferingItem = record
    DATAPtr: pointer;
    DATASize: integer;
  end;

  TAudioBuffering = class(TThread)
  private
    Lock: TCriticalSection;
    Owner: TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor;
    Items: pointer;
    ItemsCount: integer;
    ItemsSize: integer;
    evtItemInserted: THandle;
    WritePosition: integer;
    ReadPosition: integer;

    Constructor Create(const pOwner: TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor; const pItemsCount: integer);
    Destructor Destroy(); override;
    procedure Clear();
    procedure Execute(); override;
    procedure Insert(const pDATAPtr: pointer; const pDATASize: integer);
    procedure SkipItems();
    function UnReadCount(): integer;
  end;

  TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor = class(TForm)
    pnlVideoOfMJPEG: TPanel;
    tbVideoQuality: TTrackBar;
    imgVideoOfMJPEG: TImage;
    pnlAudio: TPanel;
    Label2: TLabel;
    cbAudioOutputDevices: TComboBox;
    pnlVideo: TPanel;
    cbVideoIsActive: TCheckBox;
    pnlVideoOfH264: TPanel;
    cbAudioIsActive: TCheckBox;
    Label1: TLabel;
    cbVideoService: TComboBox;
    Starter: TTimer;
    pnlAudioPlayer: TPanel;
    Synchronizer: TTimer;
    procedure FormHide(Sender: TObject);
    procedure cbVideoServiceChange(Sender: TObject);
    procedure StarterTimer(Sender: TObject);
  private
    { Private declarations }
    ServerAddress: string;
    ServerPort: integer;
    //.
    UserName: WideString;
    UserPassword: WideString;
    //.
    ObjectModel: TGeoMonitoredObject1Model;
    //.
    AudioLocalServer: TGeographProxyServerLANConnectionRepeater;
    VideoLocalServer: TGeographProxyServerLANConnectionRepeater;
    //.
    AudioService: integer;
    VideoService: integer;
    //.
    AudioClient: TMediaFrameServerAudioClient;
    VideoClient: TMediaFrameServerVideoClient;
    //.
    AudioFirstActivity: double;
    AudioLastActivity: double;
    Audio_WF: TWaveFormatEx;
    Audio_HWO: HWaveOut;
    Audio_wh:  TWaveHdr;
    Audio_evtDone: THandle;
    Audio_Buffering: TAudioBuffering;
    Audio_flSignal: boolean;
    Audio_WroteSize: integer;
    //.
    AudioPlayer: TPasLibVlcPlayer;
    AudioPlayerAudioSocket: TSocket;
    AudioPlayerAudioSocketPort: integer;
    AudioPlayerAudioSocketAddress: TSockAddr;
    AudioPlayerAudioControlSocket: TSocket;
    AudioPlayerAudioControlSocketPort: integer;
    AudioPlayerAudioControlSocketAddress: TSockAddr;
    AudioBuffer: array of byte;
    //.
    VideoFirstActivity: double;
    VideoLastActivity: double;
    //.
    VideoPlayer: TPasLibVlcPlayer;
    VideoPlayerVideoSocket: TSocket;
    VideoPlayerVideoSocketPort: integer;
    VideoPlayerVideoSocketAddress: TSockAddr;
    //.
    flInitialRestart: boolean; //. workaround on first start freezing 

    procedure SetVideoService(const pService: integer);
    //.
    procedure StartAudio();
    procedure StopAudio();
    procedure RestartAudio();
    //.
    procedure StartVideo();
    procedure StopVideo();
    procedure RestartVideo();
    //.
    procedure DoOnAudioClientInitialization(const SampleRate: integer);
    procedure DoOnBeforeAudioClientFinalization();
    procedure DoOnAudioSampleFrame(const Timestamp: double; const FrameBufferPtr: pointer; const FrameBufferSize: integer);
    procedure DoOnAudioAACFrame(const AACClient: TMediaFrameServerAudioAACClient; const FrameBufferPtr: pointer; const FrameBufferSize: integer);
    procedure DoOnAudioAACConfiguration(const SampleRate: integer; const ConfigWord: word);
    procedure DoOnAudioRTPPacket(const AACClient: TMediaFrameServerAudioAACRTPClient; const PacketBufferPtr: pointer; const PacketBufferSize: integer);
    procedure DoOnAudioRTCPPacket(const AACClient: TMediaFrameServerAudioAACRTPClient; const PacketBufferPtr: pointer; const PacketBufferSize: integer);
    procedure DoOnAudioDATAPacket(const DATAPtr: pointer; const DATASize: Integer);
    procedure DoOnAudioTimeChanged(Sender: TObject; time: Int64);
    procedure DoOnVideoJPEGFrame(const Timestamp: double; const Frame: TJPEGImage);
    procedure DoOnVideoH264Frame(const FrameBufferPtr: pointer; const FrameBufferSize: integer);
    procedure DoOnVideoTimeChanged(Sender: TObject; time: Int64);
    procedure DoOnException(const ExceptionMessage: string);
  public
    { Public declarations }
    Constructor Create(const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pObjectModel: TGeoMonitoredObject1Model);
    Destructor Destroy(); override;
    procedure Update(); reintroduce;
    procedure UpdateLayout(const flShowControl: boolean);
    //.
    procedure Start(const Delay: integer); overload;
    procedure Start(); overload;
    procedure Stop();
    procedure Restart(); overload;
    procedure Restart(const Delay: integer); overload;
  end;


var
  GeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor: TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor;
  
implementation
uses
  Registry,
  {$IFDEF Plugin}
  FunctionalityImport,
  {$ENDIF}
  Sockets,
  ShellAPI;

{$R *.dfm}


function GenerateGUID(): string;
var
  GUID: TGUID;
begin
if (CreateGUID({out} GUID) <> S_OK) then Raise Exception.Create('could not generate GUID'); //. =>
Result:=GUIDToString(GUID);
end;


{TMediaFrameServerAudioSampleClient}
Constructor TMediaFrameServerAudioSampleClient.Create(const pPort: integer; const pSampleRate: integer; const pSamplePacketSize: integer; const pQuality: integer; const pOnAudioClientInitialization: TDoOnAudioClientInitialization; const pOnBeforeAudioClientFinalization: TDoOnBeforeAudioClientFinalization; const pOnAudioSampleFrame: TDoOnAudioSampleFrame; const pOnException: TDoOnException);
begin
Port:=pPort;
SampleRate:=pSampleRate;
SamplePacketSize:=pSamplePacketSize;
Quality:=pQuality;
//.
OnAudioClientInitialization:=pOnAudioClientInitialization;
OnBeforeAudioClientFinalization:=pOnBeforeAudioClientFinalization;
OnAudioSampleFrame:=pOnAudioSampleFrame;
OnException:=pOnException;
//.
Inherited Create(false);
end;

Destructor TMediaFrameServerAudioSampleClient.Destroy();
begin
TerminateAndWaitForThread(Self);
//.
Inherited;
end;

procedure TMediaFrameServerAudioSampleClient.Execute();
const
  AudioFrameServer_Initialization_Code_Ok 			= 0;
  AudioFrameServer_Initialization_Code_Error 		        = -1;
  AudioFrameServer_Initialization_Code_UnknownServiceError      = -2;
  AudioFrameServer_Initialization_Code_ServiceIsNotActiveError 	= -3;

  ReadWriteTimeout = 1000;

  function ServerSocket_ReceiveBuf(const ServerSocket: TTCPClient; var Buf; BufSize: Integer): Integer;
  var
    ActualSize,SumActualSize: integer;
  begin
  SumActualSize:=0;
  repeat
    ActualSize:=ServerSocket.ReceiveBuf(Pointer(DWord(@Buf)+SumActualSize)^,(BufSize-SumActualSize));
    if (ActualSize <= 0)
     then begin
      Result:=ActualSize;
      Exit; //. ->
      end;
    Inc(SumActualSize,ActualSize);
  until (SumActualSize = BufSize);
  Result:=SumActualSize;
  end;

var
  ServerSocket: TTcpClient;
  Service: integer;
  Descriptor: integer;
  FrameBuffer: array of byte;
  ActualSize: integer;
  SE: integer;
  Idx: integer;
begin
try
ServerSocket:=TTcpClient.Create(nil);
try
ServerSocket.RemoteHost:='127.0.0.1';
ServerSocket.RemotePort:=IntToStr(Port);
//.
ServerSocket.Open(ReadWriteTimeout,ReadWriteTimeout);
//. set service type
Service:=AudioSampleServer_Service_SamplePackets;
if (ServerSocket.SendBuf(Service,SizeOf(Service)) <> SizeOf(Service)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set sample rate
Descriptor:=SampleRate;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set sample packet size
Descriptor:=SamplePacketSize;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set frame quality
Descriptor:=Quality;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. get service initialization result
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Descriptor,SizeOf(Descriptor));
  if (ActualSize > 0)
   then begin
    if (Descriptor >= AudioFrameServer_Initialization_Code_Ok) then Break; //. >
    //.
    case Descriptor of
    AudioFrameServer_Initialization_Code_Error:                   Raise Exception.Create('error of initializing the server'); //. =>
    AudioFrameServer_Initialization_Code_UnknownServiceError:     Raise Exception.Create('unknown service, service: '+IntToStr(Service)); //. =>
    AudioFrameServer_Initialization_Code_ServiceIsNotActiveError: Raise Exception.Create('service is not active, service: '+IntToStr(Service)); //. =>
    else
      Raise Exception.Create('error of initializing the server: '+IntToStr(Descriptor));
    end;
    end
   else
    if (ActualSize = 0)
     then Exit //. ->
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  end;
if (Terminated) then Exit; //. ->
//. get sample rate
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Descriptor,SizeOf(Descriptor));
  if (ActualSize > 0)
   then begin
    SampleRate:=Descriptor;
    Break; //. >
    end
   else
    if (ActualSize = 0)
     then Exit //. ->
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  end;
if (Terminated) then Exit; //. ->
//.
DoOnAudioClientInitialization();
try
FrameBufferSize:=4;
SetLength(FrameBuffer,FrameBufferSize);
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Pointer(@FrameBuffer[0])^,SizeOf(FrameBufferSize));
  if (ActualSize > 0)
   then begin
    if (ActualSize <> SizeOf(FrameBufferSize)) then Raise Exception.Create('wrong PacketSize data'); //. =>
    FrameBufferSize:=Integer(Pointer(@FrameBuffer[0])^);
    if (FrameBufferSize > Length(FrameBuffer)) then SetLength(FrameBuffer,FrameBufferSize);
    end
   else
    if (ActualSize = 0)
     then Break //. > connection is closed
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  if (FrameBufferSize > 0)
   then begin
    ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Pointer(@FrameBuffer[0])^,FrameBufferSize);
    if (ActualSize > 0)
     then begin
      if (ActualSize <> FrameBufferSize) then Raise Exception.Create('wrong frame data'); //. =>
      //.
      Idx:=0;
      FrameTimestamp:=Double(Pointer(@FrameBuffer[Idx])^); Inc(Idx,SizeOf(FrameTimestamp)); Dec(FrameBufferSize,SizeOf(FrameTimestamp));
      //.
      FrameBufferPtr:=Pointer(@FrameBuffer[Idx]);
      //.
      DoOnAudioSampleFrame();
      end
     else
      if (ActualSize = 0)
       then Break //. > connection is closed
       else begin
        SE:=WSAGetLastError();
        case SE of
        WSAETIMEDOUT: Raise Exception.Create('unexpected timeout error on reading frame data, '+SysErrorMessage(SE)); //. =>
        else
          Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
        end;
        end;
    end
   else Break; //. > disconnect
  end;
finally
DoOnBeforeAudioClientFinalization()
end;
finally
ServerSocket.Destroy();
end;
except
  on E: Exception do begin
    ExceptionMessage:=E.Message;
    Synchronize(DoOnException);
    end;
  end;
end;

{$IFDEF Plugin}
procedure TMediaFrameServerAudioSampleClient.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;
{$ENDIF}

procedure TMediaFrameServerAudioSampleClient.DoOnAudioClientInitialization();
begin
if (Assigned(OnAudioClientInitialization)) then OnAudioClientInitialization(SampleRate);
end;

procedure TMediaFrameServerAudioSampleClient.DoOnBeforeAudioClientFinalization();
begin
if (Assigned(OnBeforeAudioClientFinalization)) then OnBeforeAudioClientFinalization();
end;

procedure TMediaFrameServerAudioSampleClient.DoOnAudioSampleFrame();
begin
OnAudioSampleFrame(FrameTimestamp, FrameBufferPtr,FrameBufferSize);
end;

procedure TMediaFrameServerAudioSampleClient.DoOnException();
begin
OnException(ExceptionMessage);
end;

{TMediaFrameServerAudioAACClient}
Constructor TMediaFrameServerAudioAACClient.Create(const pPort: integer; const pSampleRate: integer; const pSamplePacketSize: integer; const pQuality: integer; const pOnAudioClientInitialization: TDoOnAudioClientInitialization; const pOnBeforeAudioClientFinalization: TDoOnBeforeAudioClientFinalization; const pOnAudioAACConfiguration: TDoOnAudioAACConfiguration; const pOnAudioAACFrame: TDoOnAudioAACFrame; const pOnException: TDoOnException);
begin
Port:=pPort;
SampleRate:=pSampleRate;
SamplePacketSize:=pSamplePacketSize;
Quality:=pQuality;
//.
OnAudioClientInitialization:=pOnAudioClientInitialization;
OnBeforeAudioClientFinalization:=pOnBeforeAudioClientFinalization;
OnAudioAACConfiguration:=pOnAudioAACConfiguration;
OnAudioAACFrame:=pOnAudioAACFrame;
OnException:=pOnException;
//.
Inherited Create(false);
end;

Destructor TMediaFrameServerAudioAACClient.Destroy();
begin
TerminateAndWaitForThread(Self);
//.
Inherited;
end;

procedure TMediaFrameServerAudioAACClient.Execute();
const
  AudioFrameServer_Initialization_Code_Ok 			= 0;
  AudioFrameServer_Initialization_Code_Error 		        = -1;
  AudioFrameServer_Initialization_Code_UnknownServiceError      = -2;
  AudioFrameServer_Initialization_Code_ServiceIsNotActiveError 	= -3;

  ReadWriteTimeout = 1000;

  function ServerSocket_ReceiveBuf(const ServerSocket: TTCPClient; var Buf; BufSize: Integer): Integer;
  var
    ActualSize,SumActualSize: integer;
  begin
  SumActualSize:=0;
  repeat
    ActualSize:=ServerSocket.ReceiveBuf(Pointer(DWord(@Buf)+SumActualSize)^,(BufSize-SumActualSize));
    if (ActualSize <= 0)
     then begin
      Result:=ActualSize;
      Exit; //. ->
      end;
    Inc(SumActualSize,ActualSize);
  until (SumActualSize = BufSize);
  Result:=SumActualSize;
  end;

var
  ServerSocket: TTcpClient;
  Service: integer;
  Descriptor: integer;
  FrameBuffer: array of byte;
  ActualSize: integer;
  SE: integer;
begin
try
ServerSocket:=TTcpClient.Create(nil);
try
ServerSocket.RemoteHost:='127.0.0.1';
ServerSocket.RemotePort:=IntToStr(Port);
//.
ServerSocket.Open(ReadWriteTimeout,ReadWriteTimeout);
//. set service type
Service:=AudioSampleServer_Service_AACPackets;
if (ServerSocket.SendBuf(Service,SizeOf(Service)) <> SizeOf(Service)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set sample rate
Descriptor:=SampleRate;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set sample packet size
Descriptor:=SamplePacketSize;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set frame quality
Descriptor:=Quality;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. get service initialization result
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Descriptor,SizeOf(Descriptor));
  if (ActualSize > 0)
   then begin
    if (Descriptor >= AudioFrameServer_Initialization_Code_Ok) then Break; //. >
    //.
    case Descriptor of
    AudioFrameServer_Initialization_Code_Error:                   Raise Exception.Create('error of initializing the server'); //. =>
    AudioFrameServer_Initialization_Code_UnknownServiceError:     Raise Exception.Create('unknown service, service: '+IntToStr(Service)); //. =>
    AudioFrameServer_Initialization_Code_ServiceIsNotActiveError: Raise Exception.Create('service is not active, service: '+IntToStr(Service)); //. =>
    else
      Raise Exception.Create('error of initializing the server: '+IntToStr(Descriptor));
    end;
    end
   else
    if (ActualSize = 0)
     then Exit //. ->
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  end;
if (Terminated) then Exit; //. ->
//. get sample rate
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Descriptor,SizeOf(Descriptor));
  if (ActualSize > 0)
   then begin
    SampleRate:=Descriptor;
    Break; //. >
    end
   else
    if (ActualSize = 0)
     then Exit //. ->
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  end;
if (Terminated) then Exit; //. ->
//.
DoOnAudioClientInitialization();
try
flConfigIsArrived:=false;
FrameBufferSize:=4;
SetLength(FrameBuffer,FrameBufferSize);
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Pointer(@FrameBuffer[0])^,SizeOf(FrameBufferSize));
  if (ActualSize > 0)
   then begin
    if (ActualSize <> SizeOf(FrameBufferSize)) then Raise Exception.Create('wrong PacketSize data'); //. =>
    FrameBufferSize:=Integer(Pointer(@FrameBuffer[0])^);
    if (FrameBufferSize > Length(FrameBuffer)) then SetLength(FrameBuffer,FrameBufferSize);
    end
   else
    if (ActualSize = 0)
     then Break //. > connection is closed
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  if (FrameBufferSize > 0)
   then begin
    ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Pointer(@FrameBuffer[0])^,FrameBufferSize);
    if (ActualSize > 0)
     then begin
      if (ActualSize <> FrameBufferSize) then Raise Exception.Create('wrong frame data'); //. =>
      //.
      FrameBufferPtr:=Pointer(@FrameBuffer[0]);
      //.
      if (flConfigIsArrived)
       then DoOnAudioAACFrame()
       else begin
        flConfigIsArrived:=true;
        //.
        if (FrameBufferSize < SizeOf(ConfigWord)) then Raise Exception.Create('invalid AAC codec configuration data'); //. =>
        //.
        ConfigWord:=Word((FrameBuffer[0] SHL 8) OR FrameBuffer[1]);
        //.
        ObjectType:=((FrameBuffer[0] SHR 3) AND $1F);
        FrequencyIndex:=(((FrameBuffer[0] AND 7) SHL 1) OR (FrameBuffer[1] SHR 7));
        ChannelConfiguration:=((FrameBuffer[1] SHR 3) AND $0F);
        //.
        DoOnAudioAACConfiguration();
        end;
      end
     else
      if (ActualSize = 0)
       then Break //. > connection is closed
       else begin
        SE:=WSAGetLastError();
        case SE of
        WSAETIMEDOUT: Raise Exception.Create('unexpected timeout error on reading frame data, '+SysErrorMessage(SE)); //. =>
        else
          Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
        end;
        end;
    end
   else Break; //. > disconnect
  end;
finally
DoOnBeforeAudioClientFinalization();
end;
finally
ServerSocket.Destroy();
end;
except
  on E: Exception do begin
    ExceptionMessage:=E.Message;
    Synchronize(DoOnException);
    end;
  end;
end;

{$IFDEF Plugin}
procedure TMediaFrameServerAudioAACClient.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;
{$ENDIF}

procedure TMediaFrameServerAudioAACClient.DoOnAudioClientInitialization();
begin
if (Assigned(OnAudioClientInitialization)) then OnAudioClientInitialization(SampleRate);
end;

procedure TMediaFrameServerAudioAACClient.DoOnBeforeAudioClientFinalization();
begin
if (Assigned(OnBeforeAudioClientFinalization)) then OnBeforeAudioClientFinalization();
end;

procedure TMediaFrameServerAudioAACClient.DoOnAudioAACConfiguration();
begin
if (Assigned(OnAudioAACConfiguration)) then OnAudioAACConfiguration(SampleRate,ConfigWord);
end;

procedure TMediaFrameServerAudioAACClient.DoOnAudioAACFrame();
begin
OnAudioAACFrame(Self,FrameBufferPtr,FrameBufferSize);
end;

procedure TMediaFrameServerAudioAACClient.DoOnException();
begin
OnException(ExceptionMessage);
end;

{TMediaFrameServerAudioAACRTPClient}
Constructor TMediaFrameServerAudioAACRTPClient.Create(const pPort: integer; const pSampleRate: integer; const pSamplePacketSize: integer; const pQuality: integer; const pOnAudioClientInitialization: TDoOnAudioClientInitialization; const pOnBeforeAudioClientFinalization: TDoOnBeforeAudioClientFinalization; const pOnAudioAACConfiguration: TDoOnAudioAACConfiguration; const pOnAudioRTPPacket: TDoOnAudioRTPPacket; const pOnAudioRTCPPacket: TDoOnAudioRTCPPacket; const pOnException: TDoOnException);
begin
Port:=pPort;
SampleRate:=pSampleRate;
SamplePacketSize:=pSamplePacketSize;
Quality:=pQuality;
//.
OnAudioClientInitialization:=pOnAudioClientInitialization;
OnBeforeAudioClientFinalization:=pOnBeforeAudioClientFinalization;
OnAudioAACConfiguration:=pOnAudioAACConfiguration;
OnAudioRTPPacket:=pOnAudioRTPPacket;
OnAudioRTCPPacket:=pOnAudioRTCPPacket;
OnException:=pOnException;
//.
Inherited Create(false);
end;

Destructor TMediaFrameServerAudioAACRTPClient.Destroy();
begin
TerminateAndWaitForThread(Self);
//.
Inherited;
end;

procedure TMediaFrameServerAudioAACRTPClient.Execute();
const
  AudioFrameServer_Initialization_Code_Ok 			= 0;
  AudioFrameServer_Initialization_Code_Error 		        = -1;
  AudioFrameServer_Initialization_Code_UnknownServiceError      = -2;
  AudioFrameServer_Initialization_Code_ServiceIsNotActiveError 	= -3;

  ReadWriteTimeout = 1000;

  PACKET_TYPE_RTP       = 0;
  PACKET_TYPE_RTCP 	= 1;

  RTP_HEADER_LENGTH = 12;

  CodecConfigWordOffset = 1+RTP_HEADER_LENGTH+4;

  function ServerSocket_ReceiveBuf(const ServerSocket: TTCPClient; var Buf; BufSize: Integer): Integer;
  var
    ActualSize,SumActualSize: integer;
  begin
  SumActualSize:=0;
  repeat
    ActualSize:=ServerSocket.ReceiveBuf(Pointer(DWord(@Buf)+SumActualSize)^,(BufSize-SumActualSize));
    if (ActualSize <= 0)
     then begin
      Result:=ActualSize;
      Exit; //. ->
      end;
    Inc(SumActualSize,ActualSize);
  until (SumActualSize = BufSize);
  Result:=SumActualSize;
  end;

var
  ServerSocket: TTcpClient;
  Service: integer;
  Descriptor: integer;
  Buffer: array of byte;
  ActualSize: integer;
  SE: integer;
begin
try
ServerSocket:=TTcpClient.Create(nil);
try
ServerSocket.RemoteHost:='127.0.0.1';
ServerSocket.RemotePort:=IntToStr(Port);
//.
ServerSocket.Open(ReadWriteTimeout,ReadWriteTimeout);
//. set service type
Service:=AudioSampleServer_Service_AACRTPPackets;
if (ServerSocket.SendBuf(Service,SizeOf(Service)) <> SizeOf(Service)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set sample rate
Descriptor:=SampleRate;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set sample packet size
Descriptor:=SamplePacketSize;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set frame quality
Descriptor:=Quality;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. get service initialization result
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Descriptor,SizeOf(Descriptor));
  if (ActualSize > 0)
   then begin
    if (Descriptor >= AudioFrameServer_Initialization_Code_Ok) then Break; //. >
    //.
    case Descriptor of
    AudioFrameServer_Initialization_Code_Error:                   Raise Exception.Create('error of initializing the server'); //. =>
    AudioFrameServer_Initialization_Code_UnknownServiceError:     Raise Exception.Create('unknown service, service: '+IntToStr(Service)); //. =>
    AudioFrameServer_Initialization_Code_ServiceIsNotActiveError: Raise Exception.Create('service is not active, service: '+IntToStr(Service)); //. =>
    else
      Raise Exception.Create('error of initializing the server: '+IntToStr(Descriptor));
    end;
    end
   else
    if (ActualSize = 0)
     then Exit //. ->
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  end;
if (Terminated) then Exit; //. ->
//. get sample rate
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Descriptor,SizeOf(Descriptor));
  if (ActualSize > 0)
   then begin
    SampleRate:=Descriptor;
    Break; //. >
    end
   else
    if (ActualSize = 0)
     then Exit //. ->
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  end;
if (Terminated) then Exit; //. ->
//.
DoOnAudioClientInitialization();
try
flConfigIsArrived:=false;
BufferSize:=2;
SetLength(Buffer,BufferSize);
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Pointer(@Buffer[0])^,SizeOf(BufferSize));
  if (ActualSize > 0)
   then begin
    if (ActualSize <> SizeOf(BufferSize)) then Raise Exception.Create('wrong PacketSize data'); //. =>
    BufferSize:=Word(Pointer(@Buffer[0])^);
    if (BufferSize > Length(Buffer)) then SetLength(Buffer,BufferSize);
    end
   else
    if (ActualSize = 0)
     then Break //. > connection is closed
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  if (BufferSize > 0)
   then begin
    ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Pointer(@Buffer[0])^,BufferSize);
    if (ActualSize > 0)
     then begin
      if (ActualSize <> BufferSize) then Raise Exception.Create('wrong data'); //. =>
      //.
      BufferPtr:=Pointer(@Buffer[1]);
      Dec(BufferSize);
      //.
      case Buffer[0]{DataType} of
      PACKET_TYPE_RTP: begin
        if (flConfigIsArrived)
         then DoOnAudioRTPPacket()
         else begin
          flConfigIsArrived:=true;
          //.
          if (BufferSize < (CodecConfigWordOffset-1+SizeOf(ConfigWord))) then Raise Exception.Create('invalid AAC codec configuration data'); //. =>
          //.
          ConfigWord:=Word((Buffer[CodecConfigWordOffset] SHL 8) OR Buffer[CodecConfigWordOffset+1]);
          //.
          ObjectType:=((Buffer[CodecConfigWordOffset] SHR 3) AND $1F);
          FrequencyIndex:=(((Buffer[CodecConfigWordOffset] AND 7) SHL 1) OR (Buffer[CodecConfigWordOffset+1] SHR 7));
          ChannelConfiguration:=((Buffer[CodecConfigWordOffset+1] SHR 3) AND $0F);
          //.
          DoOnAudioAACConfiguration();
          end;
        end;
      PACKET_TYPE_RTCP: begin
        DoOnAudioRTCPPacket();
        end;
      end;
      end
     else
      if (ActualSize = 0)
       then Break //. > connection is closed
       else begin
        SE:=WSAGetLastError();
        case SE of
        WSAETIMEDOUT: Raise Exception.Create('unexpected timeout error on reading frame data, '+SysErrorMessage(SE)); //. =>
        else
          Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
        end;
        end;
    end
   else Break; //. > disconnect
  end;
finally
DoOnBeforeAudioClientFinalization();
end;
finally
ServerSocket.Destroy();
end;
except
  on E: Exception do begin
    ExceptionMessage:=E.Message;
    Synchronize(DoOnException);
    end;
  end;
end;

{$IFDEF Plugin}
procedure TMediaFrameServerAudioAACRTPClient.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;
{$ENDIF}

procedure TMediaFrameServerAudioAACRTPClient.DoOnAudioClientInitialization();
begin
if (Assigned(OnAudioClientInitialization)) then OnAudioClientInitialization(SampleRate);
end;

procedure TMediaFrameServerAudioAACRTPClient.DoOnBeforeAudioClientFinalization();
begin
if (Assigned(OnBeforeAudioClientFinalization)) then OnBeforeAudioClientFinalization();
end;

procedure TMediaFrameServerAudioAACRTPClient.DoOnAudioAACConfiguration();
begin
if (Assigned(OnAudioAACConfiguration)) then OnAudioAACConfiguration(SampleRate,ConfigWord);
end;

procedure TMediaFrameServerAudioAACRTPClient.DoOnAudioRTPPacket();
begin
OnAudioRTPPacket(Self,BufferPtr,BufferSize);
end;

procedure TMediaFrameServerAudioAACRTPClient.DoOnAudioRTCPPacket();
begin
OnAudioRTCPPacket(Self,BufferPtr,BufferSize);
end;

procedure TMediaFrameServerAudioAACRTPClient.DoOnException();
begin
OnException(ExceptionMessage);
end;


{TMediaFrameServerVideoMJPEGClient}
Constructor TMediaFrameServerVideoMJPEGClient.Create(const pPort: integer; const pFrameRate: integer; const pFrameQuality: integer; const pOnVideoJPEGFrame: TDoOnVideoJPEGFrame; const pOnException: TDoOnException);
begin
Port:=pPort;
FrameRate:=pFrameRate;
FrameQuality:=pFrameQuality;
//.
OnVideoJPEGFrame:=pOnVideoJPEGFrame;
OnException:=pOnException;
//.
FrameJPEG:=TJPEGImage.Create();
//.
Inherited Create(false);
end;

Destructor TMediaFrameServerVideoMJPEGClient.Destroy();
begin
TerminateAndWaitForThread(Self);
//.
Inherited;
//.
FrameJPEG.Free();
end;

procedure TMediaFrameServerVideoMJPEGClient.Execute();
const
  VideoFrameServer_Initialization_Code_Ok 			= 0;
  VideoFrameServer_Initialization_Code_Error 		        = -1;
  VideoFrameServer_Initialization_Code_UnknownServiceError      = -2;
  VideoFrameServer_Initialization_Code_ServiceIsNotActiveError 	= -3;

  ReadWriteTimeout = 1000;

  function ServerSocket_ReceiveBuf(const ServerSocket: TTCPClient; var Buf; BufSize: Integer): Integer;
  var
    ActualSize,SumActualSize: integer;
  begin
  SumActualSize:=0;
  repeat
    ActualSize:=ServerSocket.ReceiveBuf(Pointer(DWord(@Buf)+SumActualSize)^,(BufSize-SumActualSize));
    if (ActualSize <= 0)
     then begin
      Result:=ActualSize;
      Exit; //. ->
      end;
    Inc(SumActualSize,ActualSize);
  until (SumActualSize = BufSize);
  Result:=SumActualSize;
  end;

var
  ServerSocket: TTcpClient;
  Service: integer;
  Descriptor: integer;
  FrameBuffer: array of byte;
  FrameBufferSize: integer;
  ActualSize: integer;
  SE: integer;
  Idx: integer;
  FrameStream: TMemoryStream;
begin
try
ServerSocket:=TTcpClient.Create(nil);
try
ServerSocket.RemoteHost:='127.0.0.1';
ServerSocket.RemotePort:=IntToStr(Port);
//.
ServerSocket.Open(ReadWriteTimeout,ReadWriteTimeout);
//. set service type
Service:=VideoFrameServer_Service_JPEGFrames;
if (ServerSocket.SendBuf(Service,SizeOf(Service)) <> SizeOf(Service)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set frame rate
Descriptor:=FrameRate;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set frame quality
Descriptor:=FrameQuality;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. get service initialization result
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Descriptor,SizeOf(Descriptor));
  if (ActualSize > 0)
   then begin
    if (Descriptor >= VideoFrameServer_Initialization_Code_Ok) then Break; //. >
    //.
    case Descriptor of
    VideoFrameServer_Initialization_Code_Error:                   Raise Exception.Create('error of initializing the server'); //. =>
    VideoFrameServer_Initialization_Code_UnknownServiceError:     Raise Exception.Create('unknown service, service: '+IntToStr(Service)); //. =>
    VideoFrameServer_Initialization_Code_ServiceIsNotActiveError: Raise Exception.Create('service is not active, service: '+IntToStr(Service)); //. =>
    else
      Raise Exception.Create('error of initializing the server: '+IntToStr(Descriptor));
    end;
    end
   else
    if (ActualSize = 0)
     then Exit //. ->
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  end;
if (Terminated) then Exit; //. ->
//. get frame rate
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Descriptor,SizeOf(Descriptor));
  if (ActualSize > 0)
   then begin
    FrameRate:=Descriptor;
    Break; //. >
    end
   else
    if (ActualSize = 0)
     then Exit //. ->
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  end;
if (Terminated) then Exit; //. ->
//.
FrameStream:=TMemoryStream.Create();
try
FrameBufferSize:=4;
SetLength(FrameBuffer,FrameBufferSize);
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Pointer(@FrameBuffer[0])^,SizeOf(FrameBufferSize));
  if (ActualSize > 0)
   then begin
    if (ActualSize <> SizeOf(FrameBufferSize)) then Raise Exception.Create('wrong PacketSize data'); //. =>
    FrameBufferSize:=Integer(Pointer(@FrameBuffer[0])^);
    if (FrameBufferSize > Length(FrameBuffer)) then SetLength(FrameBuffer,FrameBufferSize);
    end
   else
    if (ActualSize = 0)
     then Break //. > connection is closed
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  if (FrameBufferSize > 0)
   then begin
    ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Pointer(@FrameBuffer[0])^,FrameBufferSize);
    if (ActualSize > 0)
     then begin
      if (ActualSize <> FrameBufferSize) then Raise Exception.Create('wrong frame data'); //. =>
      //.
      Idx:=0;
      FrameTimestamp:=Double(Pointer(@FrameBuffer[Idx])^); Inc(Idx,SizeOf(FrameTimestamp)); Dec(FrameBufferSize,SizeOf(FrameTimestamp));
      //.
      FrameStream.Clear();
      FrameStream.Write(Pointer(@FrameBuffer[Idx])^,FrameBufferSize);
      //.
      FrameStream.Position:=0;
      FrameJPEG.LoadFromStream(FrameStream);
      //.
      Synchronize(DoOnVideoJPEGFrame);
      end
     else
      if (ActualSize = 0)
       then Break //. > connection is closed
       else begin
        SE:=WSAGetLastError();
        case SE of
        WSAETIMEDOUT: Raise Exception.Create('unexpected timeout error on reading frame data, '+SysErrorMessage(SE)); //. =>
        else
          Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
        end;
        end;
    end
   else Break; //. > disconnect
  end;
finally
FrameStream.Destroy();
end;
finally
ServerSocket.Destroy();
end;
except
  on E: Exception do begin
    ExceptionMessage:=E.Message;
    Synchronize(DoOnException);
    end;
  end;
end;

{$IFDEF Plugin}
procedure TMediaFrameServerVideoMJPEGClient.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;
{$ENDIF}

procedure TMediaFrameServerVideoMJPEGClient.DoOnVideoJPEGFrame();
begin
OnVideoJPEGFrame(FrameTimestamp,FrameJPEG);
end;

procedure TMediaFrameServerVideoMJPEGClient.DoOnException();
begin
OnException(ExceptionMessage);
end;


{TMediaFrameServerVideoH264Client}
Constructor TMediaFrameServerVideoH264Client.Create(const pPort: integer; const pFrameRate: integer; const pFrameQuality: integer; const pOnVideoH264Frame: TDoOnVideoH264Frame; const pOnException: TDoOnException);
begin
Port:=pPort;
FrameRate:=pFrameRate;
FrameQuality:=pFrameQuality;
//.
OnVideoH264Frame:=pOnVideoH264Frame;
OnException:=pOnException;
//.
Inherited Create(false);
end;

Destructor TMediaFrameServerVideoH264Client.Destroy();
begin
TerminateAndWaitForThread(Self);
//.
Inherited;
end;

procedure TMediaFrameServerVideoH264Client.Execute();
const
  VideoFrameServer_Initialization_Code_Ok 			= 0;
  VideoFrameServer_Initialization_Code_Error 		        = -1;
  VideoFrameServer_Initialization_Code_UnknownServiceError      = -2;
  VideoFrameServer_Initialization_Code_ServiceIsNotActiveError 	= -3;

  ReadWriteTimeout = 1000;

  function ServerSocket_ReceiveBuf(const ServerSocket: TTCPClient; var Buf; BufSize: Integer): Integer;
  var
    ActualSize,SumActualSize: integer;
  begin
  SumActualSize:=0;
  repeat
    ActualSize:=ServerSocket.ReceiveBuf(Pointer(DWord(@Buf)+SumActualSize)^,(BufSize-SumActualSize));
    if (ActualSize <= 0)
     then begin
      Result:=ActualSize;
      Exit; //. ->
      end;
    Inc(SumActualSize,ActualSize);
  until (SumActualSize = BufSize);
  Result:=SumActualSize;
  end;

var
  ServerSocket: TTcpClient;
  Service: integer;
  Descriptor: integer;
  ActualSize: integer;
  SE: integer;
  Idx: integer;
begin
try
ServerSocket:=TTcpClient.Create(nil);
try
ServerSocket.RemoteHost:='127.0.0.1';
ServerSocket.RemotePort:=IntToStr(Port);
//.
ServerSocket.Open(ReadWriteTimeout,ReadWriteTimeout);
//. set service type
Service:=VideoFrameServer_Service_H264Frames;
if (ServerSocket.SendBuf(Service,SizeOf(Service)) <> SizeOf(Service)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set frame rate
Descriptor:=FrameRate;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. set frame quality
Descriptor:=FrameQuality;
if (ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor)) <> SizeOf(Descriptor)) then Raise Exception.Create('error of writing socket, '+SysErrorMessage(WSAGetLastError())); //. =>
//. get service initialization result
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Descriptor,SizeOf(Descriptor));
  if (ActualSize > 0)
   then begin
    if (Descriptor >= VideoFrameServer_Initialization_Code_Ok) then Break; //. >
    //.
    case Descriptor of
    VideoFrameServer_Initialization_Code_Error:                   Raise Exception.Create('error of initializing the server'); //. =>
    VideoFrameServer_Initialization_Code_UnknownServiceError:     Raise Exception.Create('unknown service, service: '+IntToStr(Service)); //. =>
    VideoFrameServer_Initialization_Code_ServiceIsNotActiveError: Raise Exception.Create('service is not active, service: '+IntToStr(Service)); //. =>
    else
      Raise Exception.Create('error of initializing the server: '+IntToStr(Descriptor));
    end;
    end
   else
    if (ActualSize = 0)
     then Exit //. ->
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  end;
if (Terminated) then Exit; //. ->
//. get frame rate
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Descriptor,SizeOf(Descriptor));
  if (ActualSize > 0)
   then begin
    FrameRate:=Descriptor;
    Break; //. >
    end
   else
    if (ActualSize = 0)
     then Exit //. ->
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  end;
if (Terminated) then Exit; //. ->
//.
FrameBufferSize:=4;
SetLength(FrameBuffer,FrameBufferSize);
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Pointer(@FrameBuffer[0])^,SizeOf(FrameBufferSize));
  if (ActualSize > 0)
   then begin
    if (ActualSize <> SizeOf(FrameBufferSize)) then Raise Exception.Create('wrong PacketSize data'); //. =>
    FrameBufferSize:=Integer(Pointer(@FrameBuffer[0])^);
    if (FrameBufferSize > Length(FrameBuffer)) then SetLength(FrameBuffer,FrameBufferSize);
    end
   else
    if (ActualSize = 0)
     then Break //. > connection is closed
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  if (FrameBufferSize > 0)
   then begin
    ActualSize:=ServerSocket_ReceiveBuf(ServerSocket,Pointer(@FrameBuffer[0])^,FrameBufferSize);
    if (ActualSize > 0)
     then begin
      if (ActualSize <> FrameBufferSize) then Raise Exception.Create('wrong frame data'); //. =>
      //.
      DoOnVideoH264Frame();
      end
     else
      if (ActualSize = 0)
       then Break //. > connection is closed
       else begin
        SE:=WSAGetLastError();
        case SE of
        WSAETIMEDOUT: Raise Exception.Create('unexpected timeout error on reading frame data, '+SysErrorMessage(SE)); //. =>
        else
          Raise Exception.Create('unexpected error on reading frame data, '+SysErrorMessage(SE)); //. =>
        end;
        end;
    end
   else Break; //. > disconnect
  end;
finally
ServerSocket.Destroy();
end;
except
  on E: Exception do begin
    ExceptionMessage:=E.Message;
    Synchronize(DoOnException);
    end;
  end;
end;

{$IFDEF Plugin}
procedure TMediaFrameServerVideoH264Client.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;
{$ENDIF}

procedure TMediaFrameServerVideoH264Client.DoOnVideoH264Frame();
begin
OnVideoH264Frame(Pointer(@FrameBuffer[0]),FrameBufferSize);
end;

procedure TMediaFrameServerVideoH264Client.DoOnException();
begin
OnException(ExceptionMessage);
end;


{TTAudioBuffering}
Constructor TAudioBuffering.Create(const pOwner: TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor; const pItemsCount: integer);
var
  I: integer;
begin
Lock:=TCriticalSection.Create;
Owner:=pOwner;
ItemsCount:=pItemsCount;
ItemsSize:=ItemsCount*SizeOf(TAudioBufferingItem);
Items:=Pointer(GlobalAlloc(GMEM_FIXED or GMEM_NOCOMPACT or GMEM_NODISCARD,ItemsSize));
for I:=0 to ItemsCount-1 do with TAudioBufferingItem(Pointer(Integer(Items)+I*SizeOf(TAudioBufferingItem))^) do begin
  DATAPtr:=nil;
  DATASize:=0;
  end;
WritePosition:=0;
ReadPosition:=0;
evtItemInserted:=CreateEvent(nil,false,false,nil);
Inherited Create(false);
end;

Destructor TAudioBuffering.Destroy;
var
  EC: dword;
begin
//. terminating thread
Inherited;
//.
CloseHandle(evtItemInserted);
Clear();
GlobalFree(Integer(Items));
Lock.Free();
end;

procedure TAudioBuffering.Clear();
var
  I: integer;
begin
for I:=0 to ItemsCount-1 do with TAudioBufferingItem(Pointer(Integer(Items)+I*SizeOf(TAudioBufferingItem))^) do begin
  if DATAPtr <> nil
   then begin
    GlobalFree(Integer(DATAPtr));
    DATAPtr:=nil;
    end;
  DATASize:=0;
  end;
end;

procedure TAudioBuffering.Execute();
const
  AudioBufferMaxSize = 1000000;
var
  R: word;
  DATAPtr: pointer;
  DATASize: integer;
begin
DATAPtr:=Pointer(GlobalAlloc(GMEM_FIXED or GMEM_NOCOMPACT or GMEM_NODISCARD,AudioBufferMaxSize));
try
repeat
  R:=WaitForSingleObject(evtItemInserted, 100);
  if (R = WAIT_OBJECT_0)
   then
    repeat
      Lock.Enter();
      try
      if (ReadPosition = WritePosition) then Break; //. >
      //. move packet
      Move(TAudioBufferingItem(Pointer(Integer(Items)+ReadPosition)^).DATAPtr^,DATAPtr^, TAudioBufferingItem(Pointer(Integer(Items)+ReadPosition)^).DATASize);
      DATASize:=TAudioBufferingItem(Pointer(Integer(Items)+ReadPosition)^).DATASize;
      //.
      Inc(ReadPosition,SizeOf(TAudioBufferingItem));
      if (ReadPosition >= ItemsSize) then ReadPosition:=0;
      finally
      Lock.Leave();
      end;
      Owner.DoOnAudioDATAPacket(DATAPtr,DATASize);
      //.
    until (Terminated);
until (Terminated);
finally
GlobalFree(Integer(DATAPtr));
end;
end;

procedure TAudioBuffering.Insert(const pDATAPtr: pointer; const pDATASize: integer);
begin
Lock.Enter();
try
with TAudioBufferingItem(Pointer(Integer(Items)+WritePosition)^) do begin
if (DATASize < pDATASize)
 then begin
  if (DATAPtr <> nil) then GlobalFree(Integer(DATAPtr));
  DATAPtr:=Pointer(GlobalAlloc(GMEM_FIXED or GMEM_NOCOMPACT or GMEM_NODISCARD,pDATASize));
  end;
Move(pDATAPtr^,DATAPtr^, pDATASize);
DATASize:=pDATASize;
end;
Inc(WritePosition,SizeOf(TAudioBufferingItem));
if (WritePosition >= ItemsSize) then WritePosition:=0;
finally
Lock.Leave();
end;
//.
SetEvent(evtItemInserted);
end;

procedure TAudioBuffering.SkipItems();
begin
Lock.Enter();
try
ReadPosition:=WritePosition;
finally
Lock.Leave();
end;
end;

function TAudioBuffering.UnReadCount(): integer;
begin
Lock.Enter();
try
Result:=WritePosition-ReadPosition;
finally
Lock.Leave();
end;
if (Result < 0) then Result:=ItemsSize+Result;
Result:=(Result div SizeOf(TAudioBufferingItem));
end;


{UDP}
function GetNextFreeUDPPort(const UDPPortMin: integer): integer;
const
  UDPPortLimit = 65535;
var
  Port: integer;
  ReceiverSocket: TSocket;
  ReceiverSocket1: TSocket;
  ListeningAddress: TSockAddr;
begin
Result:=0;
Port:=UDPPortMin;
repeat
  ReceiverSocket:=Socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
  try
  ListeningAddress.sin_family:=AF_INET;
  ListeningAddress.sin_port:=htons(Port);
  ListeningAddress.sin_addr.s_addr:=INADDR_ANY;
  if (Bind(ReceiverSocket,ListeningAddress,SizeOf(ListeningAddress)) = 0)
   then begin
    ReceiverSocket1:=Socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
    try
    ListeningAddress.sin_family:=AF_INET;
    ListeningAddress.sin_port:=htons(Port+1);
    ListeningAddress.sin_addr.s_addr:=INADDR_ANY;
    if (Bind(ReceiverSocket1,ListeningAddress,SizeOf(ListeningAddress)) = 0)
     then begin
      Result:=Port;
      Exit; //. ->
      end;
    finally
    CloseSocket(ReceiverSocket1);
    end;
    end;
  finally
  CloseSocket(ReceiverSocket);
  end;
  Inc(Port,2);
until (Port > UDPPortLimit);
end;


{TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor}
Constructor TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.Create(const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pObjectModel: TGeoMonitoredObject1Model);
begin
Inherited Create(nil);
//.
ServerAddress:=pServerAddress;
ServerPort:=pServerPort;
if (ServerPort = 0) then ServerPort:=GeographProxyServerPort;
//.
UserName:=pUserName;
UserPassword:=pUserPassword;
//.
ObjectModel:=pObjectModel;
//.
AudioService:=AudioSampleServer_Service_AACRTPPackets;
//.
AudioPlayerAudioSocket:=INVALID_SOCKET;
AudioPlayerAudioControlSocket:=INVALID_SOCKET;
//.
VideoService:=VideoFrameServer_Service_H264Frames;
with cbVideoService do begin
Items.Clear();
Items.BeginUpdate();
try
Items.AddObject('H.264 Stream',TObject(VideoFrameServer_Service_H264Frames));
Items.AddObject('MJPEG Stream',TObject(VideoFrameServer_Service_JPEGFrames));
ItemIndex:=0;
finally
Items.EndUpdate();
end;
end;
//.
VideoPlayerVideoSocket:=INVALID_SOCKET;
//.
Update();
//.
flInitialRestart:=false;
//.
GeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor:=Self;
end;

Destructor TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.Destroy();
begin
if (GeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor = Self) then GeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor:=nil;
//.
Stop();
//.
AudioPlayer.Free();
//.
VideoPlayer.Free();
Inherited;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.Update();
var
  WaveNums,
  I: integer;
  WaveOutCaps: TWaveOutCaps;   
begin
cbAudioOutputDevices.Items.Clear();
WaveNums:=waveOutGetNumDevs;
for I:=0 to WaveNums-1 do begin
  waveInGetDevCaps(I,@WaveOutCaps,sizeof(TWaveOutCaps));
  //.
  cbAudioOutputDevices.Items.Add(PChar(@WaveOutCaps.szPname));
  end;
if (cbAudioOutputDevices.Items.Count > 0) then cbAudioOutputDevices.ItemIndex:=0;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.UpdateLayout(const flShowControl: boolean);
begin
if (flShowControl)
 then begin
  pnlVideo.Show();
  pnlAudio.Show();
  end
 else begin
  pnlVideo.Hide();
  pnlAudio.Hide();
  end;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.SetVideoService(const pService: integer);
begin
if (pService = VideoService) then Exit; //. ->
case pService of
VideoFrameServer_Service_H264Frames: begin
  pnlVideoOfMJPEG.Hide();
  pnlVideoOfH264.Show();
  end;
VideoFrameServer_Service_JPEGFrames: begin
  pnlVideoOfH264.Hide();
  pnlVideoOfMJPEG.Show();
  end;
end;
VideoService:=pService;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.StartAudio();
const
  DeviceAddress = '127.0.0.1';
  UDPPortBase = 2000;
begin
AudioLocalServer:=TGeographProxyServerLANConnectionRepeater.Create(lcmctNormal, DeviceAddress,AudioRemotePort, AudioLocalPort, ServerAddress,ServerPort, UserName,UserPassword, ObjectModel.ObjectController.idGeoGraphServerObject, ObjectModel.ControlModule_StartLANConnection,ObjectModel.ControlModule_StopLANConnection);
case AudioService of
AudioSampleServer_Service_SamplePackets: begin
  AudioClient:=TMediaFrameServerAudioSampleClient.Create(AudioLocalServer.GetPort(),0,0,100,DoOnAudioClientInitialization,DoOnBeforeAudioClientFinalization,DoOnAudioSampleFrame,DoOnException);
  end;
AudioSampleServer_Service_AACPackets: begin
  AudioPlayerAudioSocketPort:=GetNextFreeUDPPort(UDPPortBase);
  //.
  AudioPlayerAudioSocketAddress.sin_family:=AF_INET;
  AudioPlayerAudioSocketAddress.sin_port:=htons(AudioPlayerAudioSocketPort);
  AudioPlayerAudioSocketAddress.sin_addr.s_addr:=inet_addr('127.0.0.1');
  //.
  AudioPlayerAudioSocket:=Socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
  //.
  AudioPlayer:=TPasLibVlcPlayer.Create(nil);
  AudioPlayer.OnMediaPlayerTimeChanged:=DoOnAudioTimeChanged;
  AudioPlayer.TitleShow:=false;
  AudioPlayer.Align:=alClient;
  AudioPlayer.Parent:=pnlAudioPlayer;
  //.
  AudioPlayer.Play('udp/m4a://@127.0.0.1:'+IntToStr(AudioPlayerAudioSocketPort));
  //.
  AudioClient:=TMediaFrameServerAudioAACClient.Create(AudioLocalServer.GetPort(),0,0,100,nil,nil,nil,DoOnAudioAACFrame,DoOnException);
  end;
AudioSampleServer_Service_AACRTPPackets: begin
  AudioPlayerAudioSocketPort:=GetNextFreeUDPPort(UDPPortBase);
  AudioPlayerAudioControlSocketPort:=AudioPlayerAudioSocketPort+1;
  //.
  AudioPlayerAudioSocketAddress.sin_family:=AF_INET;
  AudioPlayerAudioSocketAddress.sin_port:=htons(AudioPlayerAudioSocketPort);
  AudioPlayerAudioSocketAddress.sin_addr.s_addr:=inet_addr('127.0.0.1');
  //.
  AudioPlayerAudioSocket:=Socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
  //.
  AudioPlayerAudioControlSocketAddress.sin_family:=AF_INET;
  AudioPlayerAudioControlSocketAddress.sin_port:=htons(AudioPlayerAudioControlSocketPort);
  AudioPlayerAudioControlSocketAddress.sin_addr.s_addr:=inet_addr('127.0.0.1');
  //.
  AudioPlayerAudioControlSocket:=Socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
  //.
  AudioPlayer:=TPasLibVlcPlayer.Create(nil);
  AudioPlayer.OnMediaPlayerTimeChanged:=DoOnAudioTimeChanged;
  AudioPlayer.TitleShow:=false;
  AudioPlayer.Align:=alClient;
  AudioPlayer.Parent:=pnlAudioPlayer;
  //.
  AudioClient:=TMediaFrameServerAudioAACRTPClient.Create(AudioLocalServer.GetPort(),0,0,100,nil,nil,DoOnAudioAACConfiguration,DoOnAudioRTPPacket,DoOnAudioRTCPPacket,DoOnException);
  end;
end;
AudioFirstActivity:=0.0;
AudioLastActivity:=0.0;
//.
pnlAudio.Enabled:=false;
cbAudioIsActive.Checked:=true;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.StopAudio();
begin
FreeAndNil(AudioClient);
case AudioService of
AudioSampleServer_Service_AACPackets,AudioSampleServer_Service_AACRTPPackets: begin
  if (AudioPlayer <> nil)
   then begin
    AudioPlayer.Pause();
    FreeAndNil(AudioPlayer);
    end;
  end;
end;
FreeAndNil(AudioLocalServer);
if (AudioPlayerAudioControlSocket <> INVALID_SOCKET)
 then begin
  CloseSocket(AudioPlayerAudioControlSocket);
  AudioPlayerAudioControlSocket:=INVALID_SOCKET;
  end;
if (AudioPlayerAudioSocket <> INVALID_SOCKET)
 then begin
  CloseSocket(AudioPlayerAudioSocket);
  AudioPlayerAudioSocket:=INVALID_SOCKET;
  end;
//.
pnlAudio.Enabled:=true;
cbAudioIsActive.Checked:=false;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.RestartAudio();
begin
StopAudio();
StartAudio();
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.StartVideo();
const
  DeviceAddress = '127.0.0.1';
  UDPPortBase = 3000;
begin
VideoLocalServer:=TGeographProxyServerLANConnectionRepeater.Create(lcmctNormal, DeviceAddress,VideoRemotePort, VideoLocalPort, ServerAddress,ServerPort, UserName,UserPassword, ObjectModel.ObjectController.idGeoGraphServerObject, ObjectModel.ControlModule_StartLANConnection,ObjectModel.ControlModule_StopLANConnection);
case VideoService of
VideoFrameServer_Service_H264Frames: begin
  VideoPlayerVideoSocketPort:=GetNextFreeUDPPort(UDPPortBase);
  //.
  VideoPlayerVideoSocketAddress.sin_family:=AF_INET;
  VideoPlayerVideoSocketAddress.sin_port:=htons(VideoPlayerVideoSocketPort);
  VideoPlayerVideoSocketAddress.sin_addr.s_addr:=inet_addr('127.0.0.1');
  //.
  VideoPlayerVideoSocket:=Socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
  //.
  VideoPlayer:=TPasLibVlcPlayer.Create(nil);
  VideoPlayer.OnMediaPlayerTimeChanged:=DoOnVideoTimeChanged;
  VideoPlayer.TitleShow:=false;
  VideoPlayer.ShowHint:=false;
  VideoPlayer.Align:=alClient;
  VideoPlayer.Parent:=pnlVideoOfH264;
  //.
  VideoPlayer.Play('udp/h264://@127.0.0.1:'+IntToStr(VideoPlayerVideoSocketPort));
  //.
  VideoClient:=TMediaFrameServerVideoH264Client.Create(VideoLocalServer.GetPort(),0,tbVideoQuality.Position,DoOnVideoH264Frame,DoOnException);
  end;
VideoFrameServer_Service_JPEGFrames: begin
  VideoClient:=TMediaFrameServerVideoMJPEGClient.Create(VideoLocalServer.GetPort(),0,tbVideoQuality.Position,DoOnVideoJPEGFrame,DoOnException);
  end;
end;
//.
VideoFirstActivity:=0.0;
VideoLastActivity:=0.0;
//.
cbVideoService.Enabled:=false;
cbVideoIsActive.Checked:=true;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.StopVideo();
begin
FreeAndNil(VideoClient);
if (VideoPlayer <> nil)
 then begin
  VideoPlayer.Pause();
  FreeAndNil(VideoPlayer);
  end;
FreeAndNil(VideoLocalServer);
if (VideoPlayerVideoSocket <> INVALID_SOCKET)
 then begin
  CloseSocket(VideoPlayerVideoSocket);
  VideoPlayerVideoSocket:=INVALID_SOCKET;
  end;
//.
cbVideoService.Enabled:=true;
cbVideoIsActive.Checked:=false;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.RestartVideo();
begin
StopVideo();
StartVideo();
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.Start();
const
  DeviceAddress = '127.0.0.1';
var
  DeviceRootComponent: TGeoMonitoredObject1DeviceComponent;
begin
DeviceRootComponent:=TGeoMonitoredObject1DeviceComponent(ObjectModel.ObjectDeviceSchema.RootComponent);
//.
if (DeviceRootComponent.VideoRecorderModule.Audio.BoolValue.Value) then StartAudio();
//.
if (DeviceRootComponent.VideoRecorderModule.Video.BoolValue.Value) then StartVideo();
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.Start(const Delay: integer);
begin
Starter.Enabled:=false;
//.
Starter.Interval:=Delay;
Starter.Enabled:=true;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.Stop();
begin
Starter.Enabled:=false;
//.
StopVideo();
//.
StopAudio();
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.Restart();
begin
Stop();
Start();
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.Restart(const Delay: integer);
begin
Stop();
Start(Delay);
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnAudioClientInitialization(const SampleRate: integer);
begin
if (cbAudioOutputDevices.ItemIndex <> -1)
 then begin
  //. create done event
  Audio_evtDone:=CreateEvent(nil,true,true,nil);
  //.
  Audio_WF.nChannels:=1;       // один канал - МОНО, 2- СТЕРЕО
  Audio_WF.wFormatTag:=WAVE_FORMAT_PCM; //. формат данных - PCM
  Audio_WF.nSamplesPerSec:=SampleRate; // sample rate, Hz
  Audio_WF.wBitsPerSample:=16;  // бит/выборку
  Audio_WF.nBlockAlign:=Audio_WF.nChannels*Audio_WF.wBitsPerSample div 8;
  Audio_WF.nAvgBytesPerSec:=Audio_WF.nSamplesPerSec*Audio_WF.nChannels*Audio_WF.wBitsPerSample div 8;
  Audio_WF.cbSize:=0; // в данном случае длина буфера
  //. open out device
  if (waveOutOpen(@Audio_HWO,cbAudioOutputDevices.ItemIndex,@Audio_WF,Cardinal(Audio_evtDone),0,CALLBACK_EVENT) <> MMSYSERR_NOERROR) then Raise Exception.Create('could not open device'); //. =>
  //. prepare device header
  Audio_wh.lpData:=nil;
  Audio_wh.dwBufferLength:=0;
  Audio_wh.dwUser:=0;
  Audio_wh.dwFlags:=0;
  Audio_wh.dwLoops:=1;
  Audio_wh.lpNext:=nil;
  Audio_wh.reserved:=0;
  ///? if waveOutPrepareHeader(hwo,@wh,sizeof(TWaveHdr)) <> MMSYSERR_NOERROR then Raise Exception.Create('could not prepare header'); //. =>*)
  //. create writing buffer
  Audio_Buffering.Free();
  Audio_Buffering:=TAudioBuffering.Create(Self,100);
  end;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnBeforeAudioClientFinalization();
begin
if (Audio_evtDone <> 0) then SetEvent(Audio_evtDone);
FreeAndNil(Audio_Buffering);
if (waveOutReset(Audio_hwo) <> MMSYSERR_NOERROR) then Raise Exception.Create('could not reset device'); //. =>
///? if waveOutUnPrepareHeader(hwo,@wh,sizeof(TWaveHdr)) <> MMSYSERR_NOERROR then Raise Exception.Create('could not unprepare header'); //. =>
if (waveOutClose(Audio_hwo) <> MMSYSERR_NOERROR) then Raise Exception.Create('could not close device'); //. =>
if (Audio_evtDone <> 0)
 then begin
  CloseHandle(Audio_evtDone);
  Audio_evtDone:=0;
  end;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnAudioSampleFrame(const Timestamp: double; const FrameBufferPtr: pointer; const FrameBufferSize: integer);
begin
if (Audio_Buffering <> nil) then Audio_Buffering.Insert(FrameBufferPtr,FrameBufferSize);
AudioLastActivity:=Now;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnAudioAACFrame(const AACClient: TMediaFrameServerAudioAACClient; const FrameBufferPtr: pointer; const FrameBufferSize: integer);
var
  AudioBufferPtr: pointer;
  AudioBufferSize: word;
begin
//. prepare AAC ADTS frame
AudioBufferSize:=7{SizeOf(ADTSHeader)}+FrameBufferSize;
if (Length(AudioBuffer) < AudioBufferSize) then SetLength(AudioBuffer,AudioBufferSize);
//.
AudioBuffer[0]:=$FF{SyncWord};
AudioBuffer[1]:=($0F SHL 4){SyncWord} OR (0 SHL 3){MPEG-4} OR (0 SHL 1){Layer} OR 1{ProtectionAbsent};
AudioBuffer[2]:=((AACClient.ObjectType-1) SHL 6){Profile} OR ((AACClient.FrequencyIndex AND $0F) SHL 2){SamplingFrequencyIndex} OR (0 SHL 1){PrivateStream} OR ((AACClient.ChannelConfiguration SHR 2) AND 1){ChannelConfiguration};
AudioBuffer[3]:=((AACClient.ChannelConfiguration AND 3) SHL 6){ChannelConfiguration} OR (0 SHL 5){Originality} OR (0 SHL 4){Home} OR (0 SHL 3){CopyrightedStream} OR (0 SHL 2){CopyrightStart} OR ((AudioBufferSize SHR 11) AND 3){FrameLength};
AudioBuffer[4]:=((AudioBufferSize SHR 3) AND $FF){FrameLength};
AudioBuffer[5]:=((AudioBufferSize AND 7) SHL 5){FrameLength}{5 bits of BufferFullness};
AudioBuffer[6]:={6 bits of BufferFullness}+(0){Number of AAC frames - 1};
Move(FrameBufferPtr^,Pointer(@AudioBuffer[7])^,FrameBufferSize);
//.
AudioBufferPtr:=Pointer(@AudioBuffer[0]);
SendTo(AudioPlayerAudioSocket, AudioBufferPtr^,AudioBufferSize, 0, AudioPlayerAudioSocketAddress,SizeOf(AudioPlayerAudioSocketAddress));
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnAudioAACConfiguration(const SampleRate: integer; const ConfigWord: word);
const
  PathTempDATA = 'TempDATA'; //. do not modify
var
  SDPFN: string;
  SDP: TextFile;
begin
SDPFN:=ExtractFilePath(ParamStr(0))+PathTempDATA+'\'+GenerateGUID()+'.sdp';
AssignFile(SDP,SDPFN); ReWrite(SDP);
try
WriteLn(SDP,'m=audio '+IntToStr(AudioPlayerAudioSocketPort)+' RTP/AVP 96');
WriteLn(SDP,'a=rtpmap:96 mpeg4-generic/'+IntToStr(SampleRate));
WriteLn(SDP,'a=fmtp:96 streamtype=5; profile-level-id=15; mode=AAC-hbr; config='+IntToHex(ConfigWord,4)+'; SizeLength=13; IndexLength=3; IndexDeltaLength=3');
finally
CloseFile(SDP);
end;
AudioPlayer.Play(SDPFN);
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnAudioRTPPacket(const AACClient: TMediaFrameServerAudioAACRTPClient; const PacketBufferPtr: pointer; const PacketBufferSize: integer);
begin
SendTo(AudioPlayerAudioSocket, PacketBufferPtr^,PacketBufferSize, 0, AudioPlayerAudioSocketAddress,SizeOf(AudioPlayerAudioSocketAddress));
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnAudioRTCPPacket(const AACClient: TMediaFrameServerAudioAACRTPClient; const PacketBufferPtr: pointer; const PacketBufferSize: integer);
begin
SendTo(AudioPlayerAudioControlSocket, PacketBufferPtr^,PacketBufferSize, 0, AudioPlayerAudioControlSocketAddress,SizeOf(AudioPlayerAudioControlSocketAddress));
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnAudioDATAPacket(const DATAPtr: pointer; const DATASize: Integer);
begin
ResetEvent(Audio_evtDone);
//.
Audio_wh.lpData:=DATAPtr;
Audio_wh.dwBufferLength:=DATASize;
Audio_wh.dwUser:=0;
Audio_wh.dwFlags:=0;
Audio_wh.dwLoops:=1;
Audio_wh.lpNext:=nil;
Audio_wh.reserved:=0;
//.
Audio_flSignal:=true;
try
if (waveOutPrepareHeader(Audio_hwo,@Audio_wh,sizeof(TWaveHdr)) <> MMSYSERR_NOERROR) then Raise Exception.Create('could not prepare header'); //. =>*)
if (waveOutWrite(Audio_hwo,@Audio_wh,SizeOf(Audio_wh)) <> MMSYSERR_NOERROR) then Raise Exception.Create('could not write device'); //. =>
WaitForSingleObject(Audio_evtDone, INFINITE);
//.
Audio_WroteSize:=Audio_WroteSize+DATASize;
finally
Audio_flSignal:=false;
end;
//.
AudioLastActivity:=Now;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnAudioTimeChanged(Sender: TObject; time: Int64);
begin
if (AudioFirstActivity = 0.0) then AudioFirstActivity:=Now;
AudioLastActivity:=Now;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnVideoJPEGFrame(const Timestamp: double; const Frame: TJPEGImage);
begin
imgVideoOfMJPEG.Picture.Bitmap.Assign(Frame);
//.
VideoLastActivity:=Now;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnVideoH264Frame(const FrameBufferPtr: pointer; const FrameBufferSize: integer);
begin
SendTo(VideoPlayerVideoSocket, FrameBufferPtr^,FrameBufferSize, 0, VideoPlayerVideoSocketAddress,SizeOf(VideoPlayerVideoSocketAddress));
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnVideoTimeChanged(Sender: TObject; time: Int64);
begin
if (VideoFirstActivity = 0.0) then VideoFirstActivity:=Now;
VideoLastActivity:=Now;
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.DoOnException(const ExceptionMessage: string);
begin
Application.MessageBox(PChar('SERVER ERROR: '+ExceptionMessage),'error',MB_ICONEXCLAMATION+MB_OK);
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.FormHide(Sender: TObject);
begin
Stop();
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.StarterTimer(Sender: TObject);
begin
Starter.Enabled:=false;
//.
Start();
end;

procedure TfmGeoMonitoredObject1VideoRecorderMediaFRAMEServerVisor.cbVideoServiceChange(Sender: TObject);
var
  Service: integer;
begin
Service:=Integer(cbVideoService.Items.Objects[cbVideoService.ItemIndex]);
SetVideoService(Service);
end;


end.
