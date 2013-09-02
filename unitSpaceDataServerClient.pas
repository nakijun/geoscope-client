unit unitSpaceDataServerClient;

interface

uses
  Windows,
  Classes,
  Messages,
  SysUtils,
  Sockets,
  IdException,
  IdSocks,
  IdStack,
  Hash,
  Cipher,
  GlobalSpaceDefines;

const
  SERVICE_NONE                          = 0;
  SERVICE_TILESERVER                    = 1;
  SERVICE_TILESERVER_V1                 = 2;
  SERVICE_COMPONENTSTREAMSERVER         = 3;
  SERVICE_COMPONENTSTREAMSERVER_V1      = 4;
  //. TileServer commands 
  SERVICE_TILESERVER_COMMAND_GETDATA = 0;
  SERVICE_TILESERVER_COMMAND_GETSERVERDATA = 1;
  SERVICE_TILESERVER_COMMAND_GETPROVIDERDATA = 2;
  SERVICE_TILESERVER_COMMAND_GETCOMPILATIONDATA = 3;
  SERVICE_TILESERVER_COMMAND_GETTILES = 4;
  SERVICE_TILESERVER_COMMAND_GETTILES_V1 = 5;
  SERVICE_TILESERVER_COMMAND_GETTILESTIMESTAMPS = 6;
  SERVICE_TILESERVER_COMMAND_GETTILESTIMESTAMPS_V1 = 7;
  SERVICE_TILESERVER_COMMAND_GETTILESTIMESTAMPS_V2 = 11;
  SERVICE_TILESERVER_COMMAND_GETTILES_V2 = 8;
  SERVICE_TILESERVER_COMMAND_GETTILES_V3 = 9;
  SERVICE_TILESERVER_COMMAND_GETTILES_V4 = 10;
  SERVICE_TILESERVER_COMMAND_SETTILES = 12;
  SERVICE_TILESERVER_COMMAND_RESETTILES = 13;
  SERVICE_TILESERVER_COMMAND_RESETTILES_V1 = 14;
  //. ComponentStreamServer commands
  SERVICE_COMPONENTSTREAMSERVER_COMMAND_GETCOMPONENTSTREAM = 0;
  //.
  MESSAGE_DISCONNECT = 0;
  //. error messages
  MESSAGE_OK                    = 0;
  MESSAGE_ERROR                 = -1;
  MESSAGE_NOTFOUND              = -2;
  MESSAGE_UNKNOWNSERVICE        = -10;
  MESSAGE_AUTHENTICATIONFAILED  = -11;
  MESSAGE_ACCESSISDENIED        = -12;
  MESSAGE_TOOMANYCLIENTS        = -13;
  MESSAGE_UNKNOWNCOMMAND        = -14;
  MESSAGE_WRONGPARAMETERS       = -15;

const
  SpaceDataServerPort = 5555;
const
  ServerReadWriteTimeout = 1000*60; //. Seconds

type
  TSegmentTimestamp = packed record
    X: DWord;
    Y: DWord;
    Timestamp: double;
  end;

  TSegmentTimestampV1 = packed record
    X: Int64;
    Y: Int64;
    Timestamp: double;
  end;

  TSegmentTimestampV2 = packed record
    X: Int64;
    Y: Int64;
    Timestamp: double;
  end;

  TSegmentTimestamps = array of TSegmentTimestamp;
  TSegmentTimestampsV1 = array of TSegmentTimestampV1;
  TSegmentTimestampsV2 = array of TSegmentTimestampV2;

  TDoOnReadProgress = procedure (const Size: Int64; const ReadSize: Int64) of object; 

  TSpaceDataServerClient = class
  private
    { Private declarations }
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

    function  Connect(Service: smallint; Command: integer): TTcpClient;
    procedure Disconnect(var Connection: TTcpClient);
  public
    { Public declarations }

    Constructor Create(const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString);
    Destructor Destroy(); override;
    //. TileServer
    procedure TileServer_GetData(out ServerData: TMemoryStream);
    procedure TileServer_GetServerData(idTileServerVisualization: Int64; out ServerData: TMemoryStream);
    procedure TileServer_GetProviderData(idTileServerVisualization: Int64; ProviderID: DWord; out ProviderData: TMemoryStream);
    procedure TileServer_GetCompilationData(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; out CompilationData: TMemoryStream);
    function  TileServer_GetTiles_Begin(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: DWord; const ExceptSegments: TByteArray; out SegmentsCount: integer): TTcpClient;
    procedure TileServer_GetTiles_Read(const Connection: TTcpClient; out SegmentX,SegmentY: DWord; const SegmentStream: TMemoryStream);
    procedure TileServer_GetTiles_End(var Connection: TTcpClient);
    function  TileServer_GetTilesV1_Begin(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: Int64; const ExceptSegments: TByteArray; out SegmentsCount: integer): TTcpClient;
    procedure TileServer_GetTilesV1_Read(const Connection: TTcpClient; out SegmentX,SegmentY: Int64; const SegmentStream: TMemoryStream);
    procedure TileServer_GetTilesV1_End(var Connection: TTcpClient);
    function  TileServer_GetTilesTimeStamps(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: DWord; const ExceptSegments: TByteArray): TSegmentTimestamps;
    function  TileServer_GetTilesTimeStampsV1(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: Int64; const ExceptSegments: TByteArray): TSegmentTimestampsV1;
    function  TileServer_GetTilesTimeStampsV2(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: Int64; const HistoryTime: double; const ExceptSegments: TByteArray): TSegmentTimestampsV2;
    function  TileServer_GetTilesV2_Begin(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: DWord; const ExceptSegments: TByteArray; out SegmentsCount: integer): TTcpClient;
    procedure TileServer_GetTilesV2_Read(const Connection: TTcpClient; out Timestamp: double; out SegmentX,SegmentY: DWord; const SegmentStream: TMemoryStream);
    procedure TileServer_GetTilesV2_End(var Connection: TTcpClient);
    function  TileServer_GetTilesV3_Begin(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: Int64; const ExceptSegments: TByteArray; out SegmentsCount: integer): TTcpClient;
    procedure TileServer_GetTilesV3_Read(const Connection: TTcpClient; out SegmentX,SegmentY: Int64; out Timestamp: double; const SegmentStream: TMemoryStream);
    procedure TileServer_GetTilesV3_End(var Connection: TTcpClient);
    function  TileServer_GetTilesV4_Begin(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: Int64; const HistoryTime: double; const ExceptSegments: TByteArray; out SegmentsCount: integer): TTcpClient;
    procedure TileServer_GetTilesV4_Read(const Connection: TTcpClient; out SegmentX,SegmentY: Int64; out Timestamp: double; const SegmentStream: TMemoryStream);
    procedure TileServer_GetTilesV4_End(var Connection: TTcpClient);
    procedure TileServer_SetTiles(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; const SecurityFileID: Int64; const Segments: TByteArray; out Timestamp: double);
    procedure TileServer_ReSetTiles(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; const SecurityFileID: Int64; const Segments: TByteArray; out Timestamp: double);
    procedure TileServer_ReSetTilesV1(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; const SecurityFileID: Int64; const ReSetInterval: double; const Segments: TByteArray; out Timestamp: double);
    //. ComponentStreamServer
    function  ComponentStreamServer_GetComponentStream_Begin(const idTComponent: integer; const idComponent: Int64; out ItemsCount: integer): TTcpClient;
    procedure ComponentStreamServer_GetComponentStream_Read(const Connection: TTcpClient; var ComponentStreamDataID: string; const ComponentStream: TStream; const OnReadProgress: TDoOnReadProgress = nil);
    procedure ComponentStreamServer_GetComponentStream_End(var Connection: TTcpClient);
  end;


implementation
uses
  StrUtils;

function StrToFloat(const S: string): Extended;
begin
DecimalSeparator:='.';
Result:=SysUtils.StrToFloat(S);
end;


{TGeoMonitoredObject1VideoRecorderMeasurementsPanel}
Constructor TSpaceDataServerClient.Create(const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString);
begin
Inherited Create();
//.
ServerAddress:=pServerAddress;
ServerPort:=pServerPort;
if (ServerPort = 0) then ServerPort:=SpaceDataServerPort;
//.
flAlwaysUseProxy:=false;
ProxyServerHost:='';
ProxyServerPort:=0;
ProxyServerUserName:='';
ProxyServerUserPassword:='';
//.
UserName:=pUserName;
UserPassword:=pUserPassword;
end;

Destructor TSpaceDataServerClient.Destroy();
begin
Inherited;
end;

function ServerSocket_ReceiveBuf(const ServerSocket: TTcpClient; var Buf; BufSize: Integer): Integer;
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

procedure CheckMessage(Message: integer);
begin
if (Message >= 0) then Exit; //. ->
case (Message) of
MESSAGE_ERROR:                      Raise Exception.Create('error'); //. =>
MESSAGE_NOTFOUND:                   Raise Exception.Create('data is not found'); //. =>
MESSAGE_UNKNOWNSERVICE:             Raise Exception.Create('unknown service'); //. =>
MESSAGE_AUTHENTICATIONFAILED:       Raise Exception.Create('authentication failed'); //. =>
MESSAGE_ACCESSISDENIED:             Raise Exception.Create('access is denied'); //. =>
MESSAGE_TOOMANYCLIENTS:             Raise Exception.Create('too many clients'); //. =>
MESSAGE_UNKNOWNCOMMAND:             Raise Exception.Create('unknown command'); //. =>
else
  Raise Exception.Create('unknown error, RC: '+IntToStr(Message)); //. =>        
end;
end;

function TSpaceDataServerClient.Connect(Service: smallint; Command: integer): TTcpClient;
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

var
  ServerSocket: TTcpClient;

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
    ServerSocket_ReceiveBuf(ServerSocket, LResponse,Sizeof(LResponse));
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
      sz:=ServerSocket_ReceiveBuf(ServerSocket, tempBuffer,2); // Socks server sends the selected authentication method
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
        sz:=ServerSocket_ReceiveBuf(ServerSocket, tempBuffer,2);    // Socks server sends the authentication status
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
      sz:=ServerSocket_ReceiveBuf(ServerSocket, tempBuffer,5);    // Socks server replies on connect, this is the first part
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
      sz:=ServerSocket_ReceiveBuf(ServerSocket, tempBuffer[5],len-1);
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
  Descriptor: integer;
begin
ServerSocket:=TTcpClient.Create(nil);
try
with ServerSocket do begin
RemoteHost:=ServerAddress;
RemotePort:=IntToStr(ServerPort);
end;
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
//. Command
LoginStream.Write(Command,SizeOf(Command));
//. send login data
ActualSize:=ServerSocket.SendBuf(LoginStream.Memory^,LoginStream.Size);
if (ActualSize <> LoginStream.Size) then Raise Exception.Create('could not send connect data'); //. =>
finally
LoginStream.Destroy();
end;
except
  on E: Exception do Raise Exception.Create('connect failed, '+E.Message+', connection: '+ConnectionMethod); //. =>
  end;
//.
except
  ServerSocket.Destroy();
  Raise; //. =>
  end;
Result:=ServerSocket;
end;

procedure TSpaceDataServerClient.Disconnect(var Connection: TTcpClient);
var
  Command: integer;
  ActualSize: integer;
begin
try
Connection.Close();
finally
FreeAndNil(Connection);
end;
end;

procedure TSpaceDataServerClient.TileServer_GetData(out ServerData: TMemoryStream);
var
  Connection: TTcpClient;
  Descriptor: integer;
  ActualSize: integer;
  ServerDataSize: integer;
  Buffer: array[0..8191] of byte;
  Portion: integer;
  BytesRead: integer;
begin
ServerData:=TMemoryStream.Create();
try
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_GETDATA);
try
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. get server data size
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading Data size'); //. =>
CheckMessage(Descriptor);
ServerDataSize:=Descriptor;
//. get server data
Portion:=Length(Buffer);
while (ServerDataSize > 0) do begin
  if (Portion > ServerDataSize) then Portion:=ServerDataSize;
  BytesRead:=Connection.ReceiveBuf(Pointer(@Buffer[0])^,Portion);
  if (BytesRead <= 0) then Raise Exception.Create('error of reading data'); //. =>
  //.
  ServerData.Write(Pointer(@Buffer[0])^,BytesRead);
  //.
  Dec(ServerDataSize,BytesRead);
  end;
finally
Disconnect({ref} Connection);
end;
except
  FreeAndNil(ServerData);
  Raise; //. =>
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetServerData(idTileServerVisualization: Int64; out ServerData: TMemoryStream);
var
  Connection: TTcpClient;
  Descriptor: integer;
  ActualSize: integer;
  ServerDataSize: integer;
  Buffer: array[0..8191] of byte;
  Portion: integer;
  BytesRead: integer;
begin
ServerData:=TMemoryStream.Create();
try
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_GETSERVERDATA);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. get server data size
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading ServerData size'); //. =>
CheckMessage(Descriptor);
ServerDataSize:=Descriptor;
//. get server data
Portion:=Length(Buffer);
while (ServerDataSize > 0) do begin
  if (Portion > ServerDataSize) then Portion:=ServerDataSize;
  BytesRead:=Connection.ReceiveBuf(Pointer(@Buffer[0])^,Portion);
  if (BytesRead <= 0) then Raise Exception.Create('error of reading server data'); //. =>
  //.
  ServerData.Write(Pointer(@Buffer[0])^,BytesRead);
  //.
  Dec(ServerDataSize,BytesRead);
  end;
finally
Disconnect({ref} Connection);
end;
except
  FreeAndNil(ServerData);
  Raise; //. =>
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetProviderData(idTileServerVisualization: Int64; ProviderID: DWord; out ProviderData: TMemoryStream);
var
  Connection: TTcpClient;
  Descriptor: integer;
  ActualSize: integer;
  ProviderDataSize: integer;
  Buffer: array[0..8191] of byte;
  Portion: integer;
  BytesRead: integer;
begin
ProviderData:=TMemoryStream.Create();
try
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_GETPROVIDERDATA);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send ProviderID
ActualSize:=Connection.SendBuf(ProviderID,SizeOf(ProviderID));
if (ActualSize <> SizeOf(ProviderID)) then Raise Exception.Create('could not send ProviderID'); //. =>
//. get provider data size
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading ProviderData size'); //. =>
CheckMessage(Descriptor);
ProviderDataSize:=Descriptor;
//. get server data
Portion:=Length(Buffer);
while (ProviderDataSize > 0) do begin
  if (Portion > ProviderDataSize) then Portion:=ProviderDataSize;
  BytesRead:=Connection.ReceiveBuf(Pointer(@Buffer[0])^,Portion);
  if (BytesRead <= 0) then Raise Exception.Create('error of reading provider data'); //. =>
  //.
  ProviderData.Write(Pointer(@Buffer[0])^,BytesRead);
  //.
  Dec(ProviderDataSize,BytesRead);
  end;
finally
Disconnect({ref} Connection);
end;
except
  FreeAndNil(ProviderData);
  Raise; //. =>
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetCompilationData(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; out CompilationData: TMemoryStream);
var
  Connection: TTcpClient;
  Descriptor: integer;
  ActualSize: integer;
  Params: array[0..7] of byte;
  CompilationDataSize: integer;
  Buffer: array[0..8191] of byte;
  Portion: integer;
  BytesRead: integer;
begin
CompilationData:=TMemoryStream.Create();
try
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_GETCOMPILATIONDATA);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send params
DWord(Pointer(@Params[0])^):=ProviderID;
DWord(Pointer(@Params[4])^):=CompilationID;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
//. get compilation data size
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading CompilationData size'); //. =>
CheckMessage(Descriptor);
CompilationDataSize:=Descriptor;
//. get compilation data
Portion:=Length(Buffer);
while (CompilationDataSize > 0) do begin
  if (Portion > CompilationDataSize) then Portion:=CompilationDataSize;
  BytesRead:=Connection.ReceiveBuf(Pointer(@Buffer[0])^,Portion);
  if (BytesRead <= 0) then Raise Exception.Create('error of reading compilation data'); //. =>
  //.
  CompilationData.Write(Pointer(@Buffer[0])^,BytesRead);
  //.
  Dec(CompilationDataSize,BytesRead);
  end;
finally
Disconnect({ref} Connection);
end;
except
  FreeAndNil(CompilationData);
  Raise; //. =>
  end;
end;

function TSpaceDataServerClient.TileServer_GetTiles_Begin(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: DWord; const ExceptSegments: TByteArray; out SegmentsCount: integer): TTcpClient;
var
  Connection: TTcpClient;
  Params: array[0..31] of byte;
  Descriptor: integer;
  ActualSize: integer;
begin
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_GETTILES);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send params
DWord(Pointer(@Params[0])^):=ProviderID;
DWord(Pointer(@Params[4])^):=CompilationID;
DWord(Pointer(@Params[8])^):=Level;
DWord(Pointer(@Params[12])^):=Xmn;
DWord(Pointer(@Params[16])^):=Xmx;
DWord(Pointer(@Params[20])^):=Ymn;
DWord(Pointer(@Params[24])^):=Ymx;
Descriptor:=Length(ExceptSegments);
DWord(Pointer(@Params[28])^):=Descriptor;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
if (Descriptor > 0)
 then begin
  ActualSize:=Connection.SendBuf(Pointer(@ExceptSegments[0])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not send ExceptSegments'); //. =>
  end;
//.
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading SegmentsCount'); //. =>
CheckMessage(Descriptor);
SegmentsCount:=Descriptor;
//.
Result:=Connection;
except
  Disconnect({ref} Connection);
  Raise; //. =>
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetTiles_Read(const Connection: TTcpClient; out SegmentX,SegmentY: DWord; const SegmentStream: TMemoryStream);
type
  TSegmentData = packed record
    X: DWord;
    Y: DWord;
    Size: integer;
  end;
var
  SegmentData: TSegmentData;
  ActualSize: integer;
  SegmentBuffer: array[0..8191] of byte;
  Portion: integer;
  BytesRead: integer;
begin
SegmentStream.Position:=0;
ActualSize:=ServerSocket_ReceiveBuf(Connection, SegmentData,SizeOf(SegmentData));
if (ActualSize <> SizeOf(SegmentData)) then Raise Exception.Create('could not get segment data'); //. =>
//.
SegmentX:=SegmentData.X;
SegmentY:=SegmentData.Y;
//.
if (SegmentData.Size = MESSAGE_NOTFOUND) then Exit; //. ->
if (SegmentData.Size < 0) then Raise Exception.Create('error while reading segment size'); //. =>
//.
if (SegmentData.Size > SegmentStream.Size) then SegmentStream.Size:=SegmentData.Size;
Portion:=Length(SegmentBuffer);
while (SegmentData.Size > 0) do begin
  if (Portion > SegmentData.Size) then Portion:=SegmentData.Size;
  BytesRead:=Connection.ReceiveBuf(Pointer(@SegmentBuffer[0])^,Portion);
  if (BytesRead <= 0) then Raise Exception.Create('error of reading segment data'); //. =>
  //.
  SegmentStream.Write(Pointer(@SegmentBuffer[0])^,BytesRead);
  //.
  Dec(SegmentData.Size,BytesRead);
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetTiles_End(var Connection: TTcpClient);
begin
Disconnect({ref} Connection);
end;

function TSpaceDataServerClient.TileServer_GetTilesV1_Begin(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: Int64; const ExceptSegments: TByteArray; out SegmentsCount: integer): TTcpClient;
var
  Connection: TTcpClient;
  Params: array[0..47] of byte;
  Descriptor: integer;
  ActualSize: integer;
begin
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_GETTILES_V1);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send params
DWord(Pointer(@Params[0])^):=ProviderID;
DWord(Pointer(@Params[4])^):=CompilationID;
DWord(Pointer(@Params[8])^):=Level;
Int64(Pointer(@Params[12])^):=Xmn;
Int64(Pointer(@Params[20])^):=Xmx;
Int64(Pointer(@Params[28])^):=Ymn;
Int64(Pointer(@Params[36])^):=Ymx;
Descriptor:=Length(ExceptSegments);
DWord(Pointer(@Params[44])^):=Descriptor;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
if (Descriptor > 0)
 then begin
  ActualSize:=Connection.SendBuf(Pointer(@ExceptSegments[0])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not send ExceptSegments'); //. =>
  end;
//.
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading SegmentsCount'); //. =>
CheckMessage(Descriptor);
SegmentsCount:=Descriptor;
//.
Result:=Connection;
except
  Disconnect({ref} Connection);
  Raise; //. =>
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetTilesV1_Read(const Connection: TTcpClient; out SegmentX,SegmentY: Int64; const SegmentStream: TMemoryStream);
type
  TSegmentData = packed record
    X: Int64;
    Y: Int64;
    Size: integer;
  end;
var
  SegmentData: TSegmentData;
  ActualSize: integer;
  SegmentBuffer: array[0..8191] of byte;
  Portion: integer;
  BytesRead: integer;
begin
SegmentStream.Position:=0;
ActualSize:=ServerSocket_ReceiveBuf(Connection, SegmentData,SizeOf(SegmentData));
if (ActualSize <> SizeOf(SegmentData)) then Raise Exception.Create('could not get segment data'); //. =>
//.
SegmentX:=SegmentData.X;
SegmentY:=SegmentData.Y;
//.
if (SegmentData.Size = MESSAGE_NOTFOUND) then Exit; //. ->
if (SegmentData.Size < 0) then Raise Exception.Create('error while reading segment size'); //. =>
//.
if (SegmentData.Size > SegmentStream.Size) then SegmentStream.Size:=SegmentData.Size;
Portion:=Length(SegmentBuffer);
while (SegmentData.Size > 0) do begin
  if (Portion > SegmentData.Size) then Portion:=SegmentData.Size;
  BytesRead:=Connection.ReceiveBuf(Pointer(@SegmentBuffer[0])^,Portion);
  if (BytesRead <= 0) then Raise Exception.Create('error of reading segment data'); //. =>
  //.
  SegmentStream.Write(Pointer(@SegmentBuffer[0])^,BytesRead);
  //.
  Dec(SegmentData.Size,BytesRead);
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetTilesV1_End(var Connection: TTcpClient);
begin
Disconnect({ref} Connection);
end;

function TSpaceDataServerClient.TileServer_GetTilesTimeStamps(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: DWord; const ExceptSegments: TByteArray): TSegmentTimestamps;
var
  Connection: TTcpClient;
  Params: array[0..31] of byte;
  Descriptor: integer;
  ActualSize: integer;
  SegmentsCount: integer;
  I: integer;
  STS: TSegmentTimestamp;
begin
Result:=nil;
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_GETTILESTIMESTAMPS);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send params
DWord(Pointer(@Params[0])^):=ProviderID;
DWord(Pointer(@Params[4])^):=CompilationID;
DWord(Pointer(@Params[8])^):=Level;
DWord(Pointer(@Params[12])^):=Xmn;
DWord(Pointer(@Params[16])^):=Xmx;
DWord(Pointer(@Params[20])^):=Ymn;
DWord(Pointer(@Params[24])^):=Ymx;
Descriptor:=Length(ExceptSegments);
DWord(Pointer(@Params[28])^):=Descriptor;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
if (Descriptor > 0)
 then begin
  ActualSize:=Connection.SendBuf(Pointer(@ExceptSegments[0])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not send ExceptSegments'); //. =>
  end;
//.
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading SegmentsCount'); //. =>
CheckMessage(Descriptor);
SegmentsCount:=Descriptor;
//.
SetLength(Result,SegmentsCount);
for I:=0 to SegmentsCount-1 do begin
  ActualSize:=ServerSocket_ReceiveBuf(Connection, STS,SizeOf(STS));
  if (ActualSize <> SizeOf(STS)) then Raise Exception.Create('could not get segment timestamp'); //. =>
  //.
  Result[I]:=STS;
  end;
finally
Disconnect({ref} Connection);
end;
end;

function TSpaceDataServerClient.TileServer_GetTilesTimeStampsV1(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: Int64; const ExceptSegments: TByteArray): TSegmentTimestampsV1;
var
  Connection: TTcpClient;
  Params: array[0..47] of byte;
  Descriptor: integer;
  ActualSize: integer;
  SegmentsCount: integer;
  I: integer;
  STS: TSegmentTimestampV1;
begin
Result:=nil;
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_GETTILESTIMESTAMPS_V1);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send params
DWord(Pointer(@Params[0])^):=ProviderID;
DWord(Pointer(@Params[4])^):=CompilationID;
DWord(Pointer(@Params[8])^):=Level;
Int64(Pointer(@Params[12])^):=Xmn;
Int64(Pointer(@Params[20])^):=Xmx;
Int64(Pointer(@Params[28])^):=Ymn;
Int64(Pointer(@Params[36])^):=Ymx;
Descriptor:=Length(ExceptSegments);
DWord(Pointer(@Params[44])^):=Descriptor;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
if (Descriptor > 0)
 then begin
  ActualSize:=Connection.SendBuf(Pointer(@ExceptSegments[0])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not send ExceptSegments'); //. =>
  end;
//.
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading SegmentsCount'); //. =>
CheckMessage(Descriptor);
SegmentsCount:=Descriptor;
//.
SetLength(Result,SegmentsCount);
for I:=0 to SegmentsCount-1 do begin
  ActualSize:=ServerSocket_ReceiveBuf(Connection, STS,SizeOf(STS));
  if (ActualSize <> SizeOf(STS)) then Raise Exception.Create('could not get segment timestamp'); //. =>
  //.
  Result[I]:=STS;
  end;
finally
Disconnect({ref} Connection);
end;
end;

function TSpaceDataServerClient.TileServer_GetTilesTimeStampsV2(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: Int64; const HistoryTime: double; const ExceptSegments: TByteArray): TSegmentTimestampsV2;
var
  Connection: TTcpClient;
  Params: array[0..55] of byte;
  Descriptor: integer;
  ActualSize: integer;
  SegmentsCount: integer;
  I: integer;
  STS: TSegmentTimestampV2;
begin
Result:=nil;
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_GETTILESTIMESTAMPS_V2);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send params
DWord(Pointer(@Params[0])^):=ProviderID;
DWord(Pointer(@Params[4])^):=CompilationID;
DWord(Pointer(@Params[8])^):=Level;
Int64(Pointer(@Params[12])^):=Xmn;
Int64(Pointer(@Params[20])^):=Xmx;
Int64(Pointer(@Params[28])^):=Ymn;
Int64(Pointer(@Params[36])^):=Ymx;
Double(Pointer(@Params[44])^):=HistoryTime;
Descriptor:=Length(ExceptSegments);
DWord(Pointer(@Params[52])^):=Descriptor;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
if (Descriptor > 0)
 then begin
  ActualSize:=Connection.SendBuf(Pointer(@ExceptSegments[0])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not send ExceptSegments'); //. =>
  end;
//.
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading SegmentsCount'); //. =>
CheckMessage(Descriptor);
SegmentsCount:=Descriptor;
//.
SetLength(Result,SegmentsCount);
for I:=0 to SegmentsCount-1 do begin
  ActualSize:=ServerSocket_ReceiveBuf(Connection, STS,SizeOf(STS));
  if (ActualSize <> SizeOf(STS)) then Raise Exception.Create('could not get segment timestamp'); //. =>
  //.
  Result[I]:=STS;
  end;
finally
Disconnect({ref} Connection);
end;
end;

function TSpaceDataServerClient.TileServer_GetTilesV2_Begin(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: DWord; const ExceptSegments: TByteArray; out SegmentsCount: integer): TTcpClient;
var
  Connection: TTcpClient;
  Params: array[0..31] of byte;
  Descriptor: integer;
  ActualSize: integer;
begin
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_GETTILES_V2);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send params
DWord(Pointer(@Params[0])^):=ProviderID;
DWord(Pointer(@Params[4])^):=CompilationID;
DWord(Pointer(@Params[8])^):=Level;
DWord(Pointer(@Params[12])^):=Xmn;
DWord(Pointer(@Params[16])^):=Xmx;
DWord(Pointer(@Params[20])^):=Ymn;
DWord(Pointer(@Params[24])^):=Ymx;
Descriptor:=Length(ExceptSegments);
DWord(Pointer(@Params[28])^):=Descriptor;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
if (Descriptor > 0)
 then begin
  ActualSize:=Connection.SendBuf(Pointer(@ExceptSegments[0])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not send ExceptSegments'); //. =>
  end;
//.
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading SegmentsCount'); //. =>
CheckMessage(Descriptor);
SegmentsCount:=Descriptor;
//.
Result:=Connection;
except
  Disconnect({ref} Connection);
  Raise; //. =>
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetTilesV2_Read(const Connection: TTcpClient; out Timestamp: double; out SegmentX,SegmentY: DWord; const SegmentStream: TMemoryStream);
type
  TSegmentData = packed record
    X: DWord;
    Y: DWord;
    Timestamp: double;
    Size: integer;
  end;
var
  SegmentData: TSegmentData;
  ActualSize: integer;
  SegmentBuffer: array[0..8191] of byte;
  Portion: integer;
  BytesRead: integer;
begin
SegmentStream.Position:=0;
ActualSize:=ServerSocket_ReceiveBuf(Connection, SegmentData,SizeOf(SegmentData));
if (ActualSize <> SizeOf(SegmentData)) then Raise Exception.Create('could not get segment data'); //. =>
//.
SegmentX:=SegmentData.X;
SegmentY:=SegmentData.Y;
Timestamp:=SegmentData.Timestamp;
//.
if (SegmentData.Size = MESSAGE_NOTFOUND) then Exit; //. ->
if (SegmentData.Size < 0) then Raise Exception.Create('error while reading segment size'); //. =>
//.
if (SegmentData.Size > SegmentStream.Size) then SegmentStream.Size:=SegmentData.Size;
Portion:=Length(SegmentBuffer);
while (SegmentData.Size > 0) do begin
  if (Portion > SegmentData.Size) then Portion:=SegmentData.Size;
  BytesRead:=Connection.ReceiveBuf(Pointer(@SegmentBuffer[0])^,Portion);
  if (BytesRead <= 0) then Raise Exception.Create('error of reading segment data'); //. =>
  //.
  SegmentStream.Write(Pointer(@SegmentBuffer[0])^,BytesRead);
  //.
  Dec(SegmentData.Size,BytesRead);
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetTilesV2_End(var Connection: TTcpClient);
begin
Disconnect({ref} Connection);
end;

function TSpaceDataServerClient.TileServer_GetTilesV3_Begin(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: Int64; const ExceptSegments: TByteArray; out SegmentsCount: integer): TTcpClient;
var
  Connection: TTcpClient;
  Params: array[0..47] of byte;
  Descriptor: integer;
  ActualSize: integer;
begin
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_GETTILES_V3);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send params
DWord(Pointer(@Params[0])^):=ProviderID;
DWord(Pointer(@Params[4])^):=CompilationID;
DWord(Pointer(@Params[8])^):=Level;
Int64(Pointer(@Params[12])^):=Xmn;
Int64(Pointer(@Params[20])^):=Xmx;
Int64(Pointer(@Params[28])^):=Ymn;
Int64(Pointer(@Params[36])^):=Ymx;
Descriptor:=Length(ExceptSegments);
DWord(Pointer(@Params[44])^):=Descriptor;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
if (Descriptor > 0)
 then begin
  ActualSize:=Connection.SendBuf(Pointer(@ExceptSegments[0])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not send ExceptSegments'); //. =>
  end;
//.
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading SegmentsCount'); //. =>
CheckMessage(Descriptor);
SegmentsCount:=Descriptor;
//.
Result:=Connection;
except
  Disconnect({ref} Connection);
  Raise; //. =>
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetTilesV3_Read(const Connection: TTcpClient; out SegmentX,SegmentY: Int64; out Timestamp: double; const SegmentStream: TMemoryStream);
type
  TSegmentData = packed record
    X: Int64;
    Y: Int64;
    Timestamp: double;
    Size: integer;
  end;
var
  SegmentData: TSegmentData;
  ActualSize: integer;
  SegmentBuffer: array[0..8191] of byte;
  Portion: integer;
  BytesRead: integer;
begin
SegmentStream.Position:=0;
ActualSize:=ServerSocket_ReceiveBuf(Connection, SegmentData,SizeOf(SegmentData));
if (ActualSize <> SizeOf(SegmentData)) then Raise Exception.Create('could not get segment data'); //. =>
//.
SegmentX:=SegmentData.X;
SegmentY:=SegmentData.Y;
Timestamp:=SegmentData.Timestamp;
//.
if (SegmentData.Size = MESSAGE_NOTFOUND) then Exit; //. ->
if (SegmentData.Size < 0) then Raise Exception.Create('error while reading segment size'); //. =>
//.
if (SegmentData.Size > SegmentStream.Size) then SegmentStream.Size:=SegmentData.Size;
Portion:=Length(SegmentBuffer);
while (SegmentData.Size > 0) do begin
  if (Portion > SegmentData.Size) then Portion:=SegmentData.Size;
  BytesRead:=Connection.ReceiveBuf(Pointer(@SegmentBuffer[0])^,Portion);
  if (BytesRead <= 0) then Raise Exception.Create('error of reading segment data'); //. =>
  //.
  SegmentStream.Write(Pointer(@SegmentBuffer[0])^,BytesRead);
  //.
  Dec(SegmentData.Size,BytesRead);
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetTilesV3_End(var Connection: TTcpClient);
begin
Disconnect({ref} Connection);
end;

function TSpaceDataServerClient.TileServer_GetTilesV4_Begin(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; Xmn,Xmx,Ymn,Ymx: Int64; const HistoryTime: double; const ExceptSegments: TByteArray; out SegmentsCount: integer): TTcpClient;
var
  Connection: TTcpClient;
  Params: array[0..55] of byte;
  Descriptor: integer;
  ActualSize: integer;
begin
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_GETTILES_V4);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send params
DWord(Pointer(@Params[0])^):=ProviderID;
DWord(Pointer(@Params[4])^):=CompilationID;
DWord(Pointer(@Params[8])^):=Level;
Int64(Pointer(@Params[12])^):=Xmn;
Int64(Pointer(@Params[20])^):=Xmx;
Int64(Pointer(@Params[28])^):=Ymn;
Int64(Pointer(@Params[36])^):=Ymx;
Double(Pointer(@Params[44])^):=HistoryTime;
Descriptor:=Length(ExceptSegments);
DWord(Pointer(@Params[52])^):=Descriptor;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
if (Descriptor > 0)
 then begin
  ActualSize:=Connection.SendBuf(Pointer(@ExceptSegments[0])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not send ExceptSegments'); //. =>
  end;
//.
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading SegmentsCount'); //. =>
CheckMessage(Descriptor);
SegmentsCount:=Descriptor;
//.
Result:=Connection;
except
  Disconnect({ref} Connection);
  Raise; //. =>
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetTilesV4_Read(const Connection: TTcpClient; out SegmentX,SegmentY: Int64; out Timestamp: double; const SegmentStream: TMemoryStream);
type
  TSegmentData = packed record
    X: Int64;
    Y: Int64;
    Timestamp: double;
    Size: integer;
  end;
var
  SegmentData: TSegmentData;
  ActualSize: integer;
  SegmentBuffer: array[0..8191] of byte;
  Portion: integer;
  BytesRead: integer;
begin
SegmentStream.Position:=0;
ActualSize:=ServerSocket_ReceiveBuf(Connection, SegmentData,SizeOf(SegmentData));
if (ActualSize <> SizeOf(SegmentData)) then Raise Exception.Create('could not get segment data'); //. =>
//.
SegmentX:=SegmentData.X;
SegmentY:=SegmentData.Y;
Timestamp:=SegmentData.Timestamp;
//.
if (SegmentData.Size = MESSAGE_NOTFOUND) then Exit; //. ->
if (SegmentData.Size < 0) then Raise Exception.Create('error while reading segment size'); //. =>
//.
if (SegmentData.Size > SegmentStream.Size) then SegmentStream.Size:=SegmentData.Size;
Portion:=Length(SegmentBuffer);
while (SegmentData.Size > 0) do begin
  if (Portion > SegmentData.Size) then Portion:=SegmentData.Size;
  BytesRead:=Connection.ReceiveBuf(Pointer(@SegmentBuffer[0])^,Portion);
  if (BytesRead <= 0) then Raise Exception.Create('error of reading segment data'); //. =>
  //.
  SegmentStream.Write(Pointer(@SegmentBuffer[0])^,BytesRead);
  //.
  Dec(SegmentData.Size,BytesRead);
  end;
end;

procedure TSpaceDataServerClient.TileServer_GetTilesV4_End(var Connection: TTcpClient);
begin
Disconnect({ref} Connection);
end;

procedure TSpaceDataServerClient.TileServer_SetTiles(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; const SecurityFileID: Int64; const Segments: TByteArray; out Timestamp: double);
var
  Connection: TTcpClient;
  Params: array[0..23] of byte;
  Descriptor: integer;
  ActualSize: integer;
begin
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_SETTILES);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send params
DWord(Pointer(@Params[0])^):=ProviderID;
DWord(Pointer(@Params[4])^):=CompilationID;
DWord(Pointer(@Params[8])^):=Level;
Int64(Pointer(@Params[12])^):=SecurityFileID;
Descriptor:=Length(Segments);
DWord(Pointer(@Params[20])^):=Descriptor;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
if (Descriptor > 0)
 then begin
  ActualSize:=Connection.SendBuf(Pointer(@Segments[0])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not send Segments'); //. =>
  end;
//.
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading response descriptor'); //. =>
CheckMessage(Descriptor);
ActualSize:=ServerSocket_ReceiveBuf(Connection, Timestamp,SizeOf(Timestamp));
if (ActualSize <> SizeOf(Timestamp)) then Raise Exception.Create('error of reading Timestamp'); //. =>
finally
Disconnect({ref} Connection);
end;
end;

procedure TSpaceDataServerClient.TileServer_ReSetTiles(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; const SecurityFileID: Int64; const Segments: TByteArray; out Timestamp: double);
var
  Connection: TTcpClient;
  Params: array[0..23] of byte;
  Descriptor: integer;
  ActualSize: integer;
begin
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_RESETTILES);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send params
DWord(Pointer(@Params[0])^):=ProviderID;
DWord(Pointer(@Params[4])^):=CompilationID;
DWord(Pointer(@Params[8])^):=Level;
Int64(Pointer(@Params[12])^):=SecurityFileID;
Descriptor:=Length(Segments);
DWord(Pointer(@Params[20])^):=Descriptor;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
if (Descriptor > 0)
 then begin
  ActualSize:=Connection.SendBuf(Pointer(@Segments[0])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not send Segments'); //. =>
  end;
//.
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading response descriptor'); //. =>
CheckMessage(Descriptor);
ActualSize:=ServerSocket_ReceiveBuf(Connection, Timestamp,SizeOf(Timestamp));
if (ActualSize <> SizeOf(Timestamp)) then Raise Exception.Create('error of reading Timestamp'); //. =>
finally
Disconnect({ref} Connection);
end;
end;


procedure TSpaceDataServerClient.TileServer_ReSetTilesV1(idTileServerVisualization: Int64; ProviderID: DWord; CompilationID: DWord; Level: DWord; const SecurityFileID: Int64; const ReSetInterval: double; const Segments: TByteArray; out Timestamp: double);
var
  Connection: TTcpClient;
  Params: array[0..31] of byte;
  Descriptor: integer;
  ActualSize: integer;
begin
Connection:=Connect(SERVICE_TILESERVER,SERVICE_TILESERVER_COMMAND_RESETTILES);
try
ActualSize:=Connection.SendBuf(idTileServerVisualization,SizeOf(idTileServerVisualization));
if (ActualSize <> SizeOf(idTileServerVisualization)) then Raise Exception.Create('could not send idTileServerVisualization'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. send params
DWord(Pointer(@Params[0])^):=ProviderID;
DWord(Pointer(@Params[4])^):=CompilationID;
DWord(Pointer(@Params[8])^):=Level;
Int64(Pointer(@Params[12])^):=SecurityFileID;
Double(Pointer(@Params[20])^):=ReSetInterval;
Descriptor:=Length(Segments);
DWord(Pointer(@Params[28])^):=Descriptor;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
if (Descriptor > 0)
 then begin
  ActualSize:=Connection.SendBuf(Pointer(@Segments[0])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not send Segments'); //. =>
  end;
//.
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading response descriptor'); //. =>
CheckMessage(Descriptor);
ActualSize:=ServerSocket_ReceiveBuf(Connection, Timestamp,SizeOf(Timestamp));
if (ActualSize <> SizeOf(Timestamp)) then Raise Exception.Create('error of reading Timestamp'); //. =>
finally
Disconnect({ref} Connection);
end;
end;


function TSpaceDataServerClient.ComponentStreamServer_GetComponentStream_Begin(const idTComponent: integer; const idComponent: Int64; out ItemsCount: integer): TTcpClient;
var
  Connection: TTcpClient;
  Params: array[0..11] of byte;
  Descriptor: integer;
  ActualSize: integer;
begin
Connection:=Connect(SERVICE_COMPONENTSTREAMSERVER,SERVICE_COMPONENTSTREAMSERVER_COMMAND_GETCOMPONENTSTREAM);
try
DWord(Pointer(@Params[0])^):=idTComponent;
Int64(Pointer(@Params[4])^):=idComponent;
ActualSize:=Connection.SendBuf(Pointer(@Params[0])^,Length(Params));
if (ActualSize <> Length(Params)) then Raise Exception.Create('could not send Params'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckMessage(Descriptor);
//. get items count
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading ItemsCount'); //. =>
CheckMessage(Descriptor);
ItemsCount:=Descriptor;
//.
Result:=Connection;
except
  Disconnect({ref} Connection);
  Raise; //. =>
  end;
end;

procedure TSpaceDataServerClient.ComponentStreamServer_GetComponentStream_Read(const Connection: TTcpClient; var ComponentStreamDataID: string; const ComponentStream: TStream; const OnReadProgress: TDoOnReadProgress = nil);
const
  MinReadBufferSize = 8192; //. bytes
  MaxReadBufferSize = (1024*1024)*1; //. megabytes
var
  ReadBufferSize: integer;
  ReadBuffer: TByteArray;
var
  Descriptor: integer;
  Portion: integer;
  ActualSize: integer;
  BytesRead: integer;
  DataID: ANSIString;
  DataSize: integer;
  ActualDataSize: integer;
begin
//. DataID string
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading DataID string length'); //. =>
SetLength(DataID,Descriptor);
if (Descriptor > 0)
 then begin
  ActualSize:=ServerSocket_ReceiveBuf(Connection, Pointer(@DataID[1])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not get DataID string'); //. =>
  end;
if (DataID <> ComponentStreamDataID)
 then begin //. reset component stream
  ComponentStreamDataID:=DataID; 
  ComponentStream.Size:=0;
  end;
//. Data size
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading DataSize'); //. =>
CheckMessage(Descriptor);
DataSize:=Descriptor;
//.
if (ComponentStream.Position > DataSize) then Raise Exception.Create('incorrect Data offset'); //. =>
//. send offset
Descriptor:=ComponentStream.Position;
ActualSize:=Connection.SendBuf(Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('could not send Data offset'); //. =>
//. Data actual size
ActualSize:=ServerSocket_ReceiveBuf(Connection, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('error of reading actual DataSize'); //. =>
CheckMessage(Descriptor);
ActualDataSize:=Descriptor;
//.
ReadBufferSize:=(ActualDataSize DIV 100);
if (ReadBufferSize > MaxReadBufferSize)
 then ReadBufferSize:=MaxReadBufferSize
 else
  if (ReadBufferSize < MinReadBufferSize)
   then ReadBufferSize:=MinReadBufferSize;
//.
SetLength(ReadBuffer,ReadBufferSize);
Portion:=ReadBufferSize;
while (ActualDataSize > 0) do begin
  if (Portion > ActualDataSize) then Portion:=ActualDataSize;
  BytesRead:=Connection.ReceiveBuf(Pointer(@ReadBuffer[0])^,Portion);
  if (BytesRead <= 0) then Raise Exception.Create('error of reading Data'); //. =>
  //.
  ComponentStream.Write(Pointer(@ReadBuffer[0])^,BytesRead);
  //.
  Dec(ActualDataSize,BytesRead);
  //.
  if (Assigned(OnReadProgress)) then OnReadProgress(DataSize,ComponentStream.Position);
  end;
end;

procedure TSpaceDataServerClient.ComponentStreamServer_GetComponentStream_End(var Connection: TTcpClient);
begin
Disconnect({ref} Connection);
end;


end.
