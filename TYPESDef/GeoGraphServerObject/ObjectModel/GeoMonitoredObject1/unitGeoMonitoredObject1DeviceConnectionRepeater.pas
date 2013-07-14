unit unitGeoMonitoredObject1DeviceConnectionRepeater;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Sockets, Graphics, Controls, Forms,
  Dialogs,
  GlobalSpaceDefines,
  unitGeoMonitoredObject1Model,
  unitGeoMonitoredObject1LANConnectionRepeater;

type
  TDoStartDeviceConnection = procedure (const CUAL: ANSIString; const ServerAddress: string; const ServerPort: integer; const ConnectionID: integer) of object;
  TDoStopDeviceConnection = procedure (const ConnectionID: integer) of object;

  TDoOnException = procedure (const E: Exception) of object;

  TDoOnBytesTransmite = procedure (const Bytes: TByteArray; const Size: integer) of object;

  TGeographProxyServerDeviceConnectionRepeater = class;
  
  TGeographProxyServerDeviceConnectionClient = class(TThread)
  private
    Repeater: TGeographProxyServerDeviceConnectionRepeater; 
    //.
    flAlwaysUseProxy: boolean;
    ProxyServerHost: string;
    ProxyServerPort: integer;
    ProxyServerUserName: string;
    ProxyServerUserPassword: string;
    //.
    ServerSocket: TTcpClient;
    //.
    ConnectionID: integer;
    //.
    DestinationSocket: TCustomIpClient;
    //.
    ExceptionMessage: string;

    function ServerSocket_ReceiveBuf(var Buf; BufSize: Integer): Integer;
    function ServerSocket_ReceiveBuf1(var Buf; BufSize: Integer): Integer;
    procedure Connect();
    procedure Disconnect();
  public
    flActive: boolean;
    flRunning: boolean;

    Constructor Create(const pRepeater: TGeographProxyServerDeviceConnectionRepeater; const pDestinationSocket: TCustomIpClient);
    Destructor Destroy(); override;
    procedure Execute; override;
    {$IFDEF Plugin}
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    {$ENDIF}
    procedure DoOnException();
  end;

  EPortBindingException = class(Exception);

  TGeographProxyServerDeviceConnectionRepeater = class
  private
    CUAL: ANSIString;
    //.
    LocalPort: integer;
    //.
    RepeaterServer: TTcpServer;
    //.
    ServerAddress: string;
    ServerPort: integer; 
    UserName: WideString;
    UserPassword: WideString;
    idGeographServerObject: Int64;
    //.
    DoStartDeviceConnection: TDoStartDeviceConnection;
    DoStopDeviceConnection: TDoStopDeviceConnection;
    //.
    OnException: TDoOnException; 
    //.
    OnSourceBytesTransmite: TDoOnBytesTransmite;
    OnDestinationBytesTransmite: TDoOnBytesTransmite;
    //.
    ConnectionsCount: integer;

    procedure DoOnServerAccept(sender: TObject; ClientSocket: TCustomIpClient);
  public

    Constructor Create(const pCUAL: ANSIString; const pLocalPort: integer; const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServerObject: Int64; const pDoStartDeviceConnection: TDoStartDeviceConnection; const pDoStopDeviceConnection: TDoStopDeviceConnection; const pOnException: TDoOnException = nil; const pOnSourceBytesTransmite: TDoOnBytesTransmite = nil; const pOnDestinationBytesTransmite: TDoOnBytesTransmite = nil);
    Destructor Destroy(); override;
    function GetPort(): integer;
    function GetConnectionsCount(): integer;
  end;

implementation
uses
  {$IFDEF Plugin}
  FunctionalityImport,
  {$ENDIF}
  Registry,
  winsock,
  IdException,
  IdSocks,
  IdStack,
  Hash,
  Cipher;


{TGeographProxyServerDeviceConnectionClient}
Constructor TGeographProxyServerDeviceConnectionClient.Create(const pRepeater: TGeographProxyServerDeviceConnectionRepeater; const pDestinationSocket: TCustomIpClient);
begin
Repeater:=pRepeater;
//.
flAlwaysUseProxy:=false;
ProxyServerHost:='';
ProxyServerPort:=0;
ProxyServerUserName:='';
ProxyServerUserPassword:='';
//.
DestinationSocket:=pDestinationSocket;
//.
ServerSocket:=TTcpClient.Create(nil);
with ServerSocket do begin
RemoteHost:=Repeater.ServerAddress;
RemotePort:=IntToStr(Repeater.ServerPort);
end;
Connect();
//.
flRunning:=true;
//.
Inherited Create(false);
Priority:=tpHigher;
end;

Destructor TGeographProxyServerDeviceConnectionClient.Destroy();
begin
{$IFDEF Plugin}
TerminateAndWaitForThread(Self);
{$ENDIF}
//.
Inherited;
if (ServerSocket <> nil)
 then begin
  Disconnect();
  FreeAndNil(ServerSocket);
  end;
end;

function TGeographProxyServerDeviceConnectionClient.ServerSocket_ReceiveBuf(var Buf; BufSize: Integer): Integer;
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

function TGeographProxyServerDeviceConnectionClient.ServerSocket_ReceiveBuf1(var Buf; BufSize: Integer): Integer;
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

procedure TGeographProxyServerDeviceConnectionClient.Connect();
const
  ReadTimeout = 100;
  WriteTimeout = 1000;
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
    AHost:=Repeater.ServerAddress;
    APort:=Repeater.ServerPort;
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
    AHost:=Repeater.ServerAddress;
    APort:=Repeater.ServerPort;
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
  Service: smallint;
  ConnectionMethod: string;
  Size,ActualSize: integer;
  PasswordStream: TMemoryStream;
  Descriptor: integer;
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
Service:=SERVICE_LANCONNECTION_DESTINATION;
LoginStream.Write(Service,SizeOf(Service));
//. usename and encrypted userpassword
Size:=Length(Repeater.UserName)*SizeOf(WideChar);
LoginStream.Write(Size,SizeOf(Size));
if (Size > 0) then LoginStream.Write(Repeater.UserName[1],Size);
//.
PasswordStream:=TMemoryStream.Create();
try
Size:=Length(Repeater.UserPassword)*SizeOf(WideChar);
PasswordStream.Write(Repeater.UserPassword[1],Size);
EncodeStream(THash_MD5.CalcString(nil,Repeater.UserPassword), PasswordStream);
Size:=PasswordStream.Size;
LoginStream.Write(Size,SizeOf(Size));
if (Size > 0) then LoginStream.Write(PasswordStream.Memory^,Size);
finally
PasswordStream.Destroy();
end;
//. idGeographServerObject
LoginStream.Write(Repeater.idGeographServerObject,SizeOf(Repeater.idGeographServerObject));
//. send Login data
ActualSize:=ServerSocket.SendBuf(LoginStream.Memory^,LoginStream.Size);
if (ActualSize <> LoginStream.Size) then Raise Exception.Create('could not send login data'); //. =>
finally
LoginStream.Destroy();
end;
//. check login
ActualSize:=ServerSocket_ReceiveBuf(Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
if (Descriptor < 0) then CheckLoginMessage(Descriptor);
if (Descriptor = 0) then Raise Exception.Create('Wrong DeviceConnection, CID: '+IntToStr(Descriptor)); //. =>
ConnectionID:=Descriptor;
//. make connection from device side
Repeater.DoStartDeviceConnection(Repeater.CUAL, Repeater.ServerAddress,Repeater.ServerPort, ConnectionID);
except
  on E: Exception do Raise Exception.Create('login failed, '+E.Message+', connection: '+ConnectionMethod); //. =>
  end;
//.
ServerSocket.SetTimeouts(ReadTimeout,WriteTimeout);
//.
flActive:=true;
end;

procedure TGeographProxyServerDeviceConnectionClient.Disconnect();
begin
//. not needed: connection is dropped automatically if (ConnectionID > 0) then Repeater.DoStopDeviceConnection(ConnectionID);
if (ConnectionID > 0) then Repeater.DoStopDeviceConnection(ConnectionID);
ServerSocket.Close();
ConnectionID:=0;
flActive:=false;
end;

procedure TGeographProxyServerDeviceConnectionClient.Execute();
const
  TransferBufferSize = 1024*1024;
var
  TransferBuffer: TByteArray;
  ActualSize: integer;
  PacketSize: integer;
  SE: integer;
begin
try
try
SetLength(TransferBuffer,TransferBufferSize);
while (NOT Terminated) do begin
  ActualSize:=ServerSocket.ReceiveBuf(Pointer(@TransferBuffer[0])^,TransferBufferSize);
  if (ActualSize > 0)
   then begin
    if (Assigned(Repeater.OnSourceBytesTransmite)) then Repeater.OnSourceBytesTransmite(TransferBuffer,ActualSize);
    //.
    if (DestinationSocket.SendBuf(Pointer(@TransferBuffer[0])^,ActualSize) <> ActualSize) then Raise Exception.Create('error of writing destination socket data, '+SysErrorMessage(WSAGetLastError())); //. =>
    end
   else
    if (ActualSize = 0)
     then Break //. > connection is closed
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: ;
      else
        Raise Exception.Create('unexpected error of reading server socket data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  end;
finally
flRunning:=false;
end;
except
  on E: Exception do begin
    if (Assigned(Repeater.OnException))
     then Repeater.OnException(E)
     else begin
      //. ExceptionMessage:=E.Message;
      //. Synchronize(DoOnException);
      end;
    end;
  end;
end;

{$IFDEF Plugin}
procedure TGeographProxyServerDeviceConnectionClient.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;
{$ENDIF}

procedure TGeographProxyServerDeviceConnectionClient.DoOnException();
begin
if (Terminated) then Exit; //. ->
//.
Application.MessageBox(PChar('DeviceConnectionClient error, '+ExceptionMessage),'error',MB_ICONEXCLAMATION+MB_OK);
end;


{TGeographProxyServerDeviceConnectionRepeater}
Constructor TGeographProxyServerDeviceConnectionRepeater.Create(const pCUAL: ANSIString; const pLocalPort: integer; const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServerObject: Int64; const pDoStartDeviceConnection: TDoStartDeviceConnection; const pDoStopDeviceConnection: TDoStopDeviceConnection; const pOnException: TDoOnException = nil; const pOnSourceBytesTransmite: TDoOnBytesTransmite = nil; const pOnDestinationBytesTransmite: TDoOnBytesTransmite = nil);
const
  MaxListeningPort = 65535;
begin
Inherited Create();
//.
CUAL:=pCUAL;
//.
LocalPort:=pLocalPort;
//.
ServerAddress:=pServerAddress;
ServerPort:=pServerPort;
UserName:=pUserName;
UserPassword:=pUserPassword;
idGeographServerObject:=pidGeographServerObject;
//.
DoStartDeviceConnection:=pDoStartDeviceConnection;
DoStopDeviceConnection:=pDoStopDeviceConnection;
//.
OnException:=pOnException;
//.
OnSourceBytesTransmite:=pOnSourceBytesTransmite;
OnDestinationBytesTransmite:=pOnDestinationBytesTransmite;
//.
ConnectionsCount:=0;
//.
RepeaterServer:=TTcpServer.Create(nil);
with RepeaterServer do begin
BlockMode:=bmThreadBlocking;
OnAccept:=DoOnServerAccept;
LocalHost:='127.0.0.1';
end;
repeat
  try
  try
  RepeaterServer.LocalPort:=IntToStr(LocalPort);
  RepeaterServer.Active:=true;
  Break; //. >
  except
    on E: Exception do Raise EPortBindingException.Create(''); //. =>
    end;
  except
    on E: EPortBindingException do begin
      Inc(LocalPort);
      if (LocalPort > MaxListeningPort) then Raise; //. =>
      end;
    end;
until (false);
end;

Destructor TGeographProxyServerDeviceConnectionRepeater.Destroy();
begin
if (RepeaterServer <> nil)
 then begin
  RepeaterServer.Active:=false;
  FreeAndNil(RepeaterServer);
  end;
Inherited;
end;

function TGeographProxyServerDeviceConnectionRepeater.GetPort(): integer;
begin
Result:=StrToInt(RepeaterServer.LocalPort);
end;

function TGeographProxyServerDeviceConnectionRepeater.GetConnectionsCount(): integer;
begin
Result:=InterlockedIncrement(ConnectionsCount)-1;
InterlockedDecrement(ConnectionsCount);
end;

procedure TGeographProxyServerDeviceConnectionRepeater.DoOnServerAccept(sender: TObject; ClientSocket: TCustomIpClient);
const
  TransferBufferSize = 1024*1024;
  ReadTimeout = 100;
  WriteTimeout = 1000;

  function ClientSocket_ReceiveBuf(var Buf; BufSize: Integer): Integer;
  var
    ActualSize,SumActualSize: integer;
  begin
  SumActualSize:=0;
  repeat
    ActualSize:=ClientSocket.ReceiveBuf(Pointer(DWord(@Buf)+SumActualSize)^,(BufSize-SumActualSize));
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
  DeviceConnectionClient: TGeographProxyServerDeviceConnectionClient;
  TransferBuffer: TByteArray;
  ActualSize: integer;
  PacketSize: integer;
  SE: integer;
begin
try
ClientSocket.SetTimeouts(ReadTimeout,WriteTimeout);
//.
InterlockedIncrement(ConnectionsCount);
try
DeviceConnectionClient:=TGeographProxyServerDeviceConnectionClient.Create(Self,ClientSocket);
try
SetLength(TransferBuffer,TransferBufferSize);
while (ClientSocket.Active AND DeviceConnectionClient.flRunning) do begin
  ActualSize:=ClientSocket.ReceiveBuf(Pointer(@TransferBuffer[0])^,TransferBufferSize);
  if (ActualSize > 0)
   then begin
    if (Assigned(OnDestinationBytesTransmite)) then OnDestinationBytesTransmite(TransferBuffer,ActualSize);
    //.
    if (DeviceConnectionClient.ServerSocket.SendBuf(Pointer(@TransferBuffer[0])^,ActualSize) <> ActualSize) then Raise Exception.Create('error of writing server socket data, '+SysErrorMessage(WSAGetLastError())); //. =>
    end
   else
    if (ActualSize = 0)
     then Break //. > connection is closed
     else begin
      SE:=WSAGetLastError();
      case SE of
      WSAETIMEDOUT: ;
      else
        Raise Exception.Create('error of reading Repeater socket data, '+SysErrorMessage(SE)); //. =>
      end;
      end;
  end;
finally
DeviceConnectionClient.Destroy();
end;
finally
InterlockedDecrement(ConnectionsCount);
end;
except
  on E: Exception do begin
    if (Assigned(OnException))
     then OnException(E);
    end;
  end;
end;


end.
