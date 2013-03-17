unit unitGeoMonitoredObject1VideoRecorderVisor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  unitGeoMonitoredObject1Model;

const
  SERVICE_NONE                  = 0;
  SERVICE_AUDIOCHANNEL_V1       = 1;
  SERVICE_VIDEOCHANNEL_V1       = 2;

  MESSAGE_CHECKPOINT = 1;
  MESSAGE_DISCONNECT = 0;
  //. error messages
  MESSAGE_OK                    = 0;
  MESSAGE_ERROR                 = -1;
  MESSAGE_UNKNOWNSERVICE        = -10;
  MESSAGE_AUTHENTICATIONFAILED  = -11;
  MESSAGE_ACCESSISDENIED        = -12;
  MESSAGE_TOOMANYCLIENTS        = -13;

const
  GeographProxyServerPort = 2010;

type
  TGeographProxyServerVideoClient = class(TThread)
  private
    ServerAddress: string;
    ServerPort: integer;
    //.
    flAlwaysUseProxy: boolean;
    ProxyServerHost: string;
    ProxyServerPort: integer;
    ProxyServerUserName: string;
    ProxyServerUserPassword: string;
    //.
    UserName: WideString;
    UserPassword: WideString;
    //.
    idGeographServerObject: Int64;
    Service: word;
    ReceiverPort: integer;
    //.
    ExceptionMessage: string;
  public
    flActive: boolean;
    ReadyToStartEvent: THandle;
    SynchronizeEvent: THandle;

    Constructor Create(const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServerObject: Int64; const pService: word; const pReceiverPort: integer);
    Destructor Destroy(); override;
    procedure Execute; override;
    {$IFDEF Plugin}
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    {$ENDIF}
    procedure DoOnException();
  end;

  TGeographServerObjectVideoPlayer = class(TThread)
  private
    ServerAddress: string;
    ServerPort: integer;
    //.
    UserName: WideString;
    UserPassword: WideString;
    //.
    ObjectModel: TGeoMonitoredObject1Model;
    //.
    Mode: integer;
    flAudio: boolean;
    flVideo: boolean;
    AudioPort: integer;
    VideoPort: integer;
    AudioClient: TGeographProxyServerVideoClient;
    VideoClient: TGeographProxyServerVideoClient;
    //.
    ExceptionMessage: string;
  public
    Constructor Create(const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pObjectModel: TGeoMonitoredObject1Model);
    Destructor Destroy(); override;
    procedure Execute(); override;
    {$IFDEF Plugin}
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    {$ENDIF}
    procedure CreateServerClients();                                          
    procedure FreeServerClients();
    procedure DoOnException();
  end;

  TfmGeoGraphServerObjectVideoVisor = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses
  {$IFDEF Plugin}
  FunctionalityImport,
  {$ENDIF}
  Registry,
  winsock,
  Sockets,
  IdException,
  IdSocks,
  IdStack,
  Hash,
  Cipher;

{$R *.dfm}


{TGeographProxyServerVideoClient}
Constructor TGeographProxyServerVideoClient.Create(const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServerObject: Int64; const pService: word; const pReceiverPort: integer);
begin
ServerAddress:=pServerAddress;
ServerPort:=pServerPort;
//.
flAlwaysUseProxy:=false;
ProxyServerHost:='';
ProxyServerPort:=0;
ProxyServerUserName:='';
ProxyServerUserPassword:='';
//.
UserName:=pUserName;
UserPassword:=pUserPassword;
//.
idGeographServerObject:=pidGeographServerObject;
Service:=pService;
ReceiverPort:=pReceiverPort;
//.
ReadyToStartEvent:=CreateEvent(nil,false,false,nil);
SynchronizeEvent:=0;
//.
Inherited Create(false);
Priority:=tpHigher;
end;

Destructor TGeographProxyServerVideoClient.Destroy();
begin
Inherited;
if (ReadyToStartEvent <> 0) then CloseHandle(ReadyToStartEvent);
end;

procedure TGeographProxyServerVideoClient.Execute();
const
  SynchronizeTimeout = 100;
  //.
  CheckPointInterval = (1.0/(24*3600))*3600; //. seconds
  ServerReadWriteTimeout = 1000*10; //. Seconds

var
  ServerSocket: TTcpClient;
  Descriptor: integer;

  function ServerSocket_ReceiveBuf(var Buf; BufSize: Integer): Integer;
  var
    ActualSize,SumActualSize: integer;
  begin
  SumActualSize:=0;
  repeat
    ActualSize:=ServerSocket.ReceiveBuf(Pointer(DWord(@Buf)+SumActualSize)^,(BufSize-SumActualSize));
    if (ActualSize <= 0) then Raise Exception.Create('error of reading socket data'); //. =>
    Inc(SumActualSize,ActualSize);
  until (SumActualSize = BufSize);
  Result:=SumActualSize;
  end;

  function ServerSocket_ReceiveBuf1(var Buf; BufSize: Integer): Integer;
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

  procedure Connect();
  const
    { Socks messages }
    RSSocksRequestFailed = 'Request rejected or failed.';
    RSSocksRequestServerFailed = 'Request rejected because SOCKS server cannot connect.';
    RSSocksRequestIdentFailed = 'Request rejected because the client program and identd report different user-ids.';
    RSSocksUnknownError = 'Unknown socks error.';
    RSSocksServerRespondError = 'Socks server did not respond.';
    RSSocksAuthMethodError = 'Invalid socks authentication method.';
    RSSocksAuthError = 'Authentication error to socks server.';
    RSSocksServerGeneralError = 'General SOCKS server failure.';
    RSSocksServerPermissionError = 'Connection not allowed by ruleset.';
    RSSocksServerNetUnreachableError = 'Network unreachable.';
    RSSocksServerHostUnreachableError = 'Host unreachable.';
    RSSocksServerConnectionRefusedError = 'Connection refused.';
    RSSocksServerTTLExpiredError = 'TTL expired.';
    RSSocksServerCommandError = 'Command not supported.';
    RSSocksServerAddressError = 'Address type not supported.';

    function MakeSOCKSv4Connection(): boolean;
    var
      AHost: string;
      APort: integer;
      UserName,Password: string;
      i: Integer;
      LRequest: TIdSocksRequest;
      LResponse: TIdSocksResponse;
    begin
      Result:=false;
      try
      if ((ProxyServerHost = '') OR (ProxyServerPort = 0)) then Exit; //. ->
      ServerSocket.RemoteHost:=ProxyServerHost;
      ServerSocket.RemotePort:=IntToStr(ProxyServerPort);
      ServerSocket.Close();
      ServerSocket.Open(ServerReadWriteTimeout,ServerReadWriteTimeout);
      AHost:=ServerAddress;
      APort:=ServerPort;
      //.
      if (GStack = nil) then GStack:=TIdStack.CreateStack();
      LRequest.Version := 4;
      LRequest.OpCode  := 1;
      LRequest.Port := GStack.WSHToNs(APort);
      LRequest.IpAddr := GStack.StringToTInAddr(GStack.ResolveHost(AHost));
      LRequest.UserName := Username;
      i := Length(LRequest.UserName); // calc the len of username
      LRequest.UserName[i + 1] := #0;
      i := 8 + i + 1; // calc the len of request
      LResponse.OpCode:=93;
      ServerSocket.SendBuf(LRequest, i);
      ServerSocket_ReceiveBuf(LResponse, Sizeof(LResponse));
      case LResponse.OpCode of
        90: ;// request granted, do nothing
        91: Raise Exception.Create(RSSocksRequestFailed); //. =>
        92: Raise Exception.Create(RSSocksRequestServerFailed); //. =>
        93: Raise Exception.Create(RSSocksRequestIdentFailed); //. =>
        else Raise Exception.Create(RSSocksUnknownError); //. =>
      end;
      Result:=true;
      except
        end;
    end;

    function MakeSOCKSv5Connection(const flUserAuthentication: boolean): boolean;
    var
      AHost: string;
      APort: Integer;
      Authentication: TSocksAuthentication;
      UserName,Password: string;

      len, pos, sz: Integer;
      tempBuffer: array [0..255] of Byte;
      ReqestedAuthMethod,
      ServerAuthMethod: Byte;
      tempPort: Word;
    begin
      Result:=false;
      try
      if ((ProxyServerHost = '') OR (ProxyServerPort = 0)) then Exit; //. ->
      ServerSocket.RemoteHost:=ProxyServerHost;
      ServerSocket.RemotePort:=IntToStr(ProxyServerPort);
      ServerSocket.Close();
      ServerSocket.Open(ServerReadWriteTimeout,ServerReadWriteTimeout);
      AHost:=ServerAddress;
      APort:=ServerPort;
      if (flUserAuthentication)
       then begin
        Authentication:=saUsernamePassword;
        UserName:=ProxyServerUserName;
        Password:=ProxyServerUserPassword;
        end
       else Authentication:=saNoAuthentication;
      //.
      if (GStack = nil) then GStack:=TIdStack.CreateStack();
      // defined in rfc 1928
      if Authentication = saNoAuthentication then begin
        tempBuffer[2] := $0   // No authentication
      end else begin
        tempBuffer[2] := $2;  // Username password authentication
      end;
      //.
      ReqestedAuthMethod := tempBuffer[2];
      tempBuffer[0] := $5;     // socks version
      tempBuffer[1] := $1;     // number of possible authentication methods
      //.
      len := 2 + tempBuffer[1];
      ServerSocket.SendBuf(tempBuffer, len);
      try
        sz:=ServerSocket_ReceiveBuf(tempBuffer, 2); // Socks server sends the selected authentication method
        if (sz <> 2) then Raise Exception.Create('');
      except
        On E: Exception do begin
          raise EIdSocksServerRespondError.Create(RSSocksServerRespondError);
        end;
      end;
      //.
      ServerAuthMethod := tempBuffer[1];
      if (ServerAuthMethod <> ReqestedAuthMethod) or (ServerAuthMethod = $FF) then begin
        raise EIdSocksAuthMethodError.Create(RSSocksAuthMethodError);
      end;
      // Authentication process
      if Authentication = saUsernamePassword then begin
        tempBuffer[0] := 1; // version of subnegotiation
        tempBuffer[1] := Length(Username);
        pos := 2;
        if Length(Username) > 0 then begin
          Move(Username[1], tempBuffer[pos], Length(Username));
        end;
        pos := pos + Length(Username);
        tempBuffer[pos] := Length(Password);
        pos := pos + 1;
        if Length(Password) > 0 then begin
          Move(Password[1], tempBuffer[pos], Length(Password));
        end;
        pos := pos + Length(Password);

        ServerSocket.SendBuf(tempBuffer, pos); // send the username and password
        try
          sz:=ServerSocket_ReceiveBuf(tempBuffer, 2);    // Socks server sends the authentication status
          if (sz <> 2) then Raise Exception.Create('');
        except
          On E: Exception do begin
            raise EIdSocksServerRespondError.Create(RSSocksServerRespondError);
          end;
        end;
        if tempBuffer[1] <> $0 then begin
          raise EIdSocksAuthError.Create(RSSocksAuthError);
        end;
      end;
      // Connection process
      tempBuffer[0] := $5;   // socks version
      tempBuffer[1] := $1;   // connect method
      tempBuffer[2] := $0;   // reserved
      // for now we stick with domain name, must ask Chad how to detect
      // address type
      tempBuffer[3] := $3;   // address type: IP V4 address: X'01'    {Do not Localize}
                             //               DOMAINNAME:    X'03'    {Do not Localize}
                             //               IP V6 address: X'04'    {Do not Localize}
      // host name
      tempBuffer[4] := Length(AHost);
      pos := 5;
      if Length(AHost) > 0 then begin
        Move(AHost[1], tempBuffer[pos], Length(AHost));
      end;
      pos := pos + Length(AHost);
      // port
      tempPort := GStack.WSHToNs(APort);
      Move(tempPort, tempBuffer[pos], SizeOf(tempPort));
      pos := pos + 2;
      ServerSocket.SendBuf(tempBuffer, pos); // send the connection packet
      try
        sz:=ServerSocket_ReceiveBuf(tempBuffer, 5);    // Socks server replies on connect, this is the first part
        if (sz <> 5) then Raise Exception.Create('');
      except
        raise EIdSocksServerRespondError.Create(RSSocksServerRespondError);
      end;
      //.
      case tempBuffer[1] of
        0: ;// success, do nothing
        1: raise EIdSocksServerGeneralError.Create(RSSocksServerGeneralError);
        2: raise EIdSocksServerPermissionError.Create(RSSocksServerPermissionError);
        3: raise EIdSocksServerNetUnreachableError.Create(RSSocksServerNetUnreachableError);
        4: raise EIdSocksServerHostUnreachableError.Create(RSSocksServerHostUnreachableError);
        5: raise EIdSocksServerConnectionRefusedError.Create(RSSocksServerConnectionRefusedError);
        6: raise EIdSocksServerTTLExpiredError.Create(RSSocksServerTTLExpiredError);
        7: raise EIdSocksServerCommandError.Create(RSSocksServerCommandError);
        8: raise EIdSocksServerAddressError.Create(RSSocksServerAddressError);
        else
           raise EIdSocksUnknownError.Create(RSSocksUnknownError);
      end;
      // type of destination address is domain name
      case tempBuffer[3] of
        // IP V4
        1: len := 4 + 2; // 4 is for address and 2 is for port length
        // FQDN
        3: len := tempBuffer[4] + 2; // 2 is for port length
        // IP V6
        4: len := 16 + 2; // 16 is for address and 2 is for port length
      end;
      //.
      try
        // Socks server replies on connect, this is the second part
        sz:=ServerSocket_ReceiveBuf(tempBuffer[5], len-1);
        if (sz <> (len-1)) then Raise Exception.Create('');
      except
        raise EIdSocksServerRespondError.Create(RSSocksServerRespondError);
      end;
      Result:=true;
      except
        end;
    end;

    procedure EncodeStream(const Key: string; const Stream: TMemoryStream);
    begin
    with TCipher_RC5.Create do
    try
    Mode:=cmCTS;
    InitKey(Key, nil);
    EncodeBuffer(Stream.Memory^,Stream.Memory^,Stream.Size);
    finally
    Destroy;
    end;
    end;

    procedure CheckLoginMessage(Message: integer);
    begin
    case (Message) of
    MESSAGE_OK:                         ;
    MESSAGE_ERROR:                      Raise Exception.Create('error'); //. =>
    MESSAGE_UNKNOWNSERVICE:             Raise Exception.Create('unknown service'); //. =>
    MESSAGE_AUTHENTICATIONFAILED:       Raise Exception.Create('authentication failed'); //. =>
    MESSAGE_ACCESSISDENIED:             Raise Exception.Create('access is denied'); //. =>
    MESSAGE_TOOMANYCLIENTS:             Raise Exception.Create('too many clients'); //. =>
    else
      Raise Exception.Create('unknown error, RC: '+IntToStr(Message)); //. =>        
    end;
    end;

  var
    LoginStream: TMemoryStream;
    ConnectionMethod: string;
    Size,ActualSize: integer;
    PasswordStream: TMemoryStream;
  begin
  try
  if ((ServerSocket.RemoteHost = '') OR (ServerSocket.RemotePort = '')) then Raise Exception.Create('server is not specified'); //. =>
  //.
  if (NOT flAlwaysUseProxy AND ServerSocket.Connect(ServerReadWriteTimeout,ServerReadWriteTimeout))
   then ConnectionMethod:='direct connection'
   else
    if (MakeSOCKSv4Connection())
     then ConnectionMethod:='Proxy ('+ProxyServerHost+':'+IntToStr(ProxyServerPort)+', SOCKS v4)'
     else
      if (MakeSOCKSv5Connection(false))
       then ConnectionMethod:='Proxy ('+ProxyServerHost+':'+IntToStr(ProxyServerPort)+', SOCKS v5: authentication - off)'
       else
        if (MakeSOCKSv5Connection(true))
         then ConnectionMethod:='Proxy ('+ProxyServerHost+':'+IntToStr(ProxyServerPort)+', SOCKS v5: authentication - on, user - '+ProxyServerUserName+')'
         else Raise Exception.Create('could not connect to the server'); //. =>
  LoginStream:=TMemoryStream.Create();
  try
  //. service descriptor
  LoginStream.Write(Service,SizeOf(Service));
  //. usename and encrypted userpassword
  Size:=Length(UserName)*SizeOf(WideChar);
  LoginStream.Write(Size,SizeOf(Size));
  if (Size > 0) then LoginStream.Write(UserName[1],Size);
  //.
  PasswordStream:=TMemoryStream.Create;
  try
  Size:=Length(UserPassword)*SizeOf(WideChar);
  PasswordStream.Write(UserPassword[1],Size);
  EncodeStream(THash_MD5.CalcString(nil,UserPassword), PasswordStream);
  Size:=PasswordStream.Size;
  LoginStream.Write(Size,SizeOf(Size));
  if (Size > 0) then LoginStream.Write(PasswordStream.Memory^,Size);
  finally
  PasswordStream.Destroy();
  end;
  //. idGeographServerObject
  LoginStream.Write(idGeographServerObject,SizeOf(idGeographServerObject));
  //. send Login data
  ActualSize:=ServerSocket.SendBuf(LoginStream.Memory^,LoginStream.Size);
  if (ActualSize <> LoginStream.Size) then Raise Exception.Create('could not send login data'); //. =>
  finally
  LoginStream.Destroy();
  end;
  //. check login
  ActualSize:=ServerSocket_ReceiveBuf(Descriptor,SizeOf(Descriptor));
  if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
  CheckLoginMessage(Descriptor);
  except
    on E: Exception do Raise Exception.Create('login failed, '+E.Message+', connection: '+ConnectionMethod); //. =>
    end;
  //.
  flActive:=true;
  end;

  procedure Disconnect();
  var
    Command: integer;
    ActualSize: integer;
  begin
  if (ServerSocket.Connected)
   then begin
    try
    Command:=MESSAGE_DISCONNECT;
    ActualSize:=ServerSocket.SendBuf(Command,SizeOf(Command));
    if (ActualSize <> SizeOf(Command)) then Raise Exception.Create('could not send command'); //. =>
    except
      end;
    end;
  ServerSocket.Close();
  flActive:=false;
  end;

var
  WSAData: TWSAData;
  ErrorCode: integer;
  ReceiverSocket: TSocket;
  ReceiverSocketAddress: TSockAddr;
  LastChekpointTime: TDateTime;
  PacketStream: TMemoryStream;
  ActualSize: integer;
  SE: integer;
  {$IFDEF DEBUG}
  Log: TextFile;
  LastTimestamp,Timestamp,Delta: TDateTime;
  {$ENDIF}
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
ServerSocket:=TTcpClient.Create(nil);
try
with ServerSocket do begin
RemoteHost:=ServerAddress;
RemotePort:=IntToStr(ServerPort);
end;
PacketStream:=TMemoryStream.Create();
try
PacketStream.Size:=1024*1024;
//.
Connect();
try
SetEvent(ReadyToStartEvent);
//. wait for synchronization
if (SynchronizeEvent <> 0)
 then
  while (WaitForSingleObject(SynchronizeEvent, SynchronizeTimeout) = WAIT_TIMEOUT) do
    if (Terminated) then Exit; //. ->
//.
{$IFDEF DEBUG}
AssignFile(Log,'Log\VideoRecorderVisorPacketInterval.log');
ReWrite(Log);
try
LastTimestamp:=Now;
{$ENDIF}
LastChekpointTime:=Now;
while (NOT Terminated) do begin
  ActualSize:=ServerSocket_ReceiveBuf1(Descriptor,SizeOf(Descriptor));
  if (ActualSize > 0)
   then begin
    if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading packet descriptor'); //. =>
    end
   else
    if (ActualSize = 0)
     then Break //. > connection is closed
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: Continue; //. ^
      else
        Raise Exception.Create('unexpected error of reading server socket data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  if (Descriptor > 0)
   then begin
    if (Descriptor > PacketStream.Size) then PacketStream.Size:=Descriptor;
    ActualSize:=ServerSocket_ReceiveBuf1(PacketStream.Memory^,Descriptor);
    if (ActualSize > 0)
     then begin
      if (ActualSize <> Descriptor) then Raise Exception.Create('error of reading packet'); //. =>
      //.
      SendTo(ReceiverSocket, PacketStream.Memory^,Descriptor, 0, ReceiverSocketAddress,SizeOf(ReceiverSocketAddress));
      {$IFDEF DEBUG}
      Timestamp:=Now;
      Delta:=Timestamp-LastTimestamp;
      WriteLn(Log,IntToStr(Descriptor)+':  '+IntToStr(Trunc(Delta*24.0*3600.0*1000.0)));
      //.
      LastTimestamp:=Now;
      {$ENDIF}
      end
     else
      if (ActualSize = 0)
       then Break //. > connection is closed
       else begin
        SE:=WSAGetLastError();
        case SE of
        WSAETIMEDOUT: Raise Exception.Create('unexpected timeout error of reading server socket data, '+SysErrorMessage(SE)); //. =>
        else
          Raise Exception.Create('unexpected error of reading server socket data, '+SysErrorMessage(SE)); //. =>
        end;
        end;
    end;
  if ((Now-LastChekpointTime) >= CheckPointInterval)
   then begin
    Descriptor:=MESSAGE_CHECKPOINT;
    ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor));
    //.
    LastChekpointTime:=Now;
    end;
  end;
{$IFDEF DEBUG}
finally
CloseFile(Log);
end;
{$ENDIF}
finally
Disconnect();
end;
finally
PacketStream.Destroy();
end;
finally
ServerSocket.Destroy();
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

{$IFDEF Plugin}
procedure TGeographProxyServerVideoClient.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;
{$ENDIF}

procedure TGeographProxyServerVideoClient.DoOnException();
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


{TGeographServerObjectVideoPlayer}
Constructor TGeographServerObjectVideoPlayer.Create(const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pObjectModel: TGeoMonitoredObject1Model);
begin
ServerAddress:=pServerAddress;
ServerPort:=pServerPort;
if (ServerPort = 0) then ServerPort:=GeographProxyServerPort;
//.
UserName:=pUserName;
UserPassword:=pUserPassword;
//.
ObjectModel:=pObjectModel;
//.
Inherited Create(false);
end;

Destructor TGeographServerObjectVideoPlayer.Destroy();
begin
Inherited;
end;

procedure TGeographServerObjectVideoPlayer.Execute();
const
  PathTempDATA = 'TempDATA'; //. do not modify

  function ShellExecAndWait(ExeFile: string; Parameters: string = ''; ShowWindow: Word = SW_SHOWNORMAL): Boolean;
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
    repeat
      ExitCode:=WaitForSingleObject(ProcessInfo.hProcess,100);
    until ((ExitCode <> WAIT_TIMEOUT) OR Terminated);
    if (Terminated) then TerminateProcess(ProcessInfo.hProcess,0);
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
  DeviceRootComponent: TGeoMonitoredObject1DeviceComponent;
  SDPFN: string;
  SDP: TextFile;
  PlayerExecutive: string;
begin
try
DeviceRootComponent:=TGeoMonitoredObject1DeviceComponent(ObjectModel.ObjectDeviceSchema.RootComponent);
ObjectModel.Lock.Enter();
try
Mode:=DeviceRootComponent.VideoRecorderModule.Mode.Value.Value;
flAudio:=DeviceRootComponent.VideoRecorderModule.Audio.BoolValue.Value;
flVideo:=DeviceRootComponent.VideoRecorderModule.Video.BoolValue.Value;
finally
ObjectModel.Lock.Leave();
end;
if (flAudio OR flVideo) then AudioPort:=GetNextFreeUDPPort();
if (flVideo) then VideoPort:=GetNextFreeUDPPort();
//.
SDPFN:=ExtractFilePath(ParamStr(0))+PathTempDATA+'\'+'Object'+IntToStr(ObjectModel.ObjectController.idGeoGraphServerObject)+'.SDP';
AssignFile(SDP,SDPFN); ReWrite(SDP);
try
WriteLn(SDP,'v=0');
WriteLn(SDP,'s=Unnamed');
if (flVideo) then WriteLn(SDP,'m=video '+IntToStr(VideoPort)+' RTP/AVP 96');
WriteLn(SDP,'b=RR:0');
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
CreateServerClients();
try
PlayerExecutive:=GetExeByExtension('.sdp');
if (PlayerExecutive = '') then Raise Exception.Create('there is no installed video player'#$0D#$0A'please install VLC Player'); //. =>
ShellExecAndWait(PlayerExecutive,'"'+SDPFN+'" --file-caching=2000 --network-caching=2000 --udp-caching=2000');
finally
FreeServerClients();
end;
except
  On E: Exception do begin
    ExceptionMessage:=E.Message;
    Synchronize(DoOnException);
    end;
  end;
end;

{$IFDEF Plugin}
procedure TGeographServerObjectVideoPlayer.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;
{$ENDIF}

procedure TGeographServerObjectVideoPlayer.CreateServerClients();
begin
if (flAudio) then AudioClient:=TGeographProxyServerVideoClient.Create(ServerAddress,ServerPort,UserName,UserPassword,ObjectModel.ObjectController.idGeoGraphServerObject,SERVICE_AUDIOCHANNEL_V1,AudioPort) else AudioClient:=nil;
if (flVideo) then VideoClient:=TGeographProxyServerVideoClient.Create(ServerAddress,ServerPort,UserName,UserPassword,ObjectModel.ObjectController.idGeoGraphServerObject,SERVICE_VIDEOCHANNEL_V1,VideoPort) else VideoClient:=nil;
//.
if ((AudioClient <> nil) AND (VideoClient <> nil))
 then begin
  AudioClient.SynchronizeEvent:=VideoClient.ReadyToStartEvent;
  VideoClient.SynchronizeEvent:=AudioClient.ReadyToStartEvent;
  end;
end;

procedure TGeographServerObjectVideoPlayer.FreeServerClients();
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
FreeAndNil(VideoClient);
FreeAndNil(AudioClient);
end;

procedure TGeographServerObjectVideoPlayer.DoOnException();
begin
if (Terminated) then Exit; //. ->
//.
Application.MessageBox(PChar('Player error, '+ExceptionMessage),'error',MB_ICONEXCLAMATION+MB_OK);
end;


end.
