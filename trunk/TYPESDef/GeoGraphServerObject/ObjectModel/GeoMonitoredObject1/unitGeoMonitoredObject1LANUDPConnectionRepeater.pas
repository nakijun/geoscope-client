unit unitGeoMonitoredObject1LANUDPConnectionRepeater;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Sockets, Graphics, Controls, Forms,
  Dialogs,
  unitGeoMonitoredObject1Model;

const
  SERVICE_NONE                          = 0;
  SERVICE_LANCONNECTION_DESTINATION     = 7;
  SERVICE_LANCONNECTION_DESTINATION_V1  = 8;

  //. error messages
  MESSAGE_OK                    = 0;
  MESSAGE_ERROR                 = -1;
  MESSAGE_UNKNOWNSERVICE        = -10;
  MESSAGE_AUTHENTICATIONFAILED  = -11;
  MESSAGE_ACCESSISDENIED        = -12;
  MESSAGE_TOOMANYCLIENTS        = -13;
  //. custom error messages
  MESSAGE_LANCONNECTIONISNOTFOUND       = -101;

const
  ServerReadWriteTimeout = 1000*60; //. Seconds

type
  TDoStartLANUDPConnection = procedure (const ConnectionType: TLANConnectionModuleConnectionType; const ReceivingPort: integer; const ReceivingPacketSize: integer; const Address: string; const TransmittingPort: integer; const TransmittingPacketSize: integer; const ServerAddress: string; const ServerPort: integer; const ConnectionID: integer) of object;
  TDoStopLANUDPConnection = procedure (const ConnectionID: integer) of object;

  TGeographProxyServerLANUDPConnectionRepeater = class;
  
  TGeographProxyServerLANUDPConnectionClient = class(TThread)
  private
    Repeater: TGeographProxyServerLANUDPConnectionRepeater;
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
    ExceptionMessage: string;

    function ServerSocket_ReceiveBuf(var Buf; BufSize: Integer): Integer;
    function ServerSocket_ReceiveBuf1(var Buf; BufSize: Integer): Integer;
    procedure Connect();
    procedure Disconnect();
  public
    flActive: boolean;
    flRunning: boolean;

    Constructor Create(const pRepeater: TGeographProxyServerLANUDPConnectionRepeater);
    Destructor Destroy(); override;
    procedure Execute; override;
    {$IFDEF Plugin}
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    {$ENDIF}
    procedure DoOnException();
  end;

  EPortBindingException = class(Exception);

  TGeographProxyServerLANUDPConnectionRepeater = class(TThread)
  private
    ConnectionType: TLANConnectionModuleConnectionType;
    //. 
    ReceivingPort: integer;
    ReceivingPacketSize: integer; 
    //.
    Address: string;
    TransmittingPort: integer;
    TransmittingPacketSize: integer;
    //.
    LocalReceivingPort: integer;
    LocalReceivingPacketSize: integer;
    //.
    LocalTransmittingPort: integer;
    LocalTransmittingPacketSize: integer;
    //.
    ServerAddress: string;
    ServerPort: integer; 
    UserName: WideString;
    UserPassword: WideString;
    idGeographServerObject: Int64;
    //.
    DoStartLANUDPConnection: TDoStartLANUDPConnection;
    DoStopLANUDPConnection: TDoStopLANUDPConnection;

  public
    Constructor Create(const pConnectionType: TLANConnectionModuleConnectionType; const pReceivingPort: integer; const pReceivingPacketSize: integer; const pAddress: string; const pTransmittingPort: integer; const pTransmittingPacketSize: integer; const pLocalReceivingPort: integer; const pLocalReceivingPacketSize: integer; const pLocalTransmittingPort: integer; const pLocalTransmittingPacketSize: integer; const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServerObject: Int64; const pDoStartLANUDPConnection: TDoStartLANUDPConnection; const pDoStopLANUDPConnection: TDoStopLANUDPConnection);
    Destructor Destroy(); override;
    procedure Execute(); override;
  end;


  function GetNextFreeUDPPort(const UDPPortMin: integer): integer;

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


{UDP}
function GetNextFreeUDPPort(const UDPPortMin: integer): integer;
const
  UDPPortLimit = 65535;
var
  Port: integer;
  ReceiverSocket: TSocket;
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
    Result:=Port;
    Exit; //. ->
    end;
  finally
  CloseSocket(ReceiverSocket);
  end;
  Inc(Port);
until (Port > UDPPortLimit);
end;


{TGeographProxyServerLANUDPConnectionClient}
Constructor TGeographProxyServerLANUDPConnectionClient.Create(const pRepeater: TGeographProxyServerLANUDPConnectionRepeater);
begin
Repeater:=pRepeater;
//.
flAlwaysUseProxy:=false;
ProxyServerHost:='';
ProxyServerPort:=0;
ProxyServerUserName:='';
ProxyServerUserPassword:='';
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
Inherited Create(true);
Priority:=tpHigher;
end;

Destructor TGeographProxyServerLANUDPConnectionClient.Destroy();
begin
Inherited;
if (ServerSocket <> nil)
 then begin
  Disconnect();
  FreeAndNil(ServerSocket);
  end;
end;

function TGeographProxyServerLANUDPConnectionClient.ServerSocket_ReceiveBuf(var Buf; BufSize: Integer): Integer;
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

function TGeographProxyServerLANUDPConnectionClient.ServerSocket_ReceiveBuf1(var Buf; BufSize: Integer): Integer;
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

procedure TGeographProxyServerLANUDPConnectionClient.Connect();
const
  ReadTimeout = 100;
  WriteTimeout = 100;
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
if (Descriptor = 0) then Raise Exception.Create('Wrong LANConnection, CID: '+IntToStr(Descriptor)); //. =>
ConnectionID:=Descriptor;
//. make connection from device side
Repeater.DoStartLANUDPConnection(Repeater.ConnectionType, Repeater.ReceivingPort,Repeater.ReceivingPacketSize, Repeater.Address,Repeater.TransmittingPort,Repeater.TransmittingPacketSize, Repeater.ServerAddress,Repeater.ServerPort, ConnectionID);
except
  on E: Exception do Raise Exception.Create('login failed, '+E.Message+', connection: '+ConnectionMethod); //. =>
  end;
//.
ServerSocket.SetTimeouts(ReadTimeout,WriteTimeout);
//.
flActive:=true;
end;

procedure TGeographProxyServerLANUDPConnectionClient.Disconnect();
begin
if (ConnectionID > 0) then Repeater.DoStopLANUDPConnection(ConnectionID);
ServerSocket.Close();
ConnectionID:=0;
flActive:=false;
end;

procedure TGeographProxyServerLANUDPConnectionClient.Execute();
var
  ReceiverSocket: TSocket;
  ReceiverSocketAddress: TSockAddr;
  TransferBuffer: array of byte;
  ActualSize: integer;
  PacketSize: integer;
  SE: integer;
begin
try
try
if (Repeater.LocalReceivingPort > 0)
 then begin
  ReceiverSocket:=Socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
  try
  ReceiverSocketAddress.sin_family:=AF_INET;
  ReceiverSocketAddress.sin_port:=htons(Repeater.LocalReceivingPort);
  ReceiverSocketAddress.sin_addr.s_addr:=inet_addr('127.0.0.1');
  //.
  SetLength(TransferBuffer,Repeater.ReceivingPacketSize);
  case (Repeater.ConnectionType) of
  lcmctNormal:
    while (NOT Terminated) do begin
      ActualSize:=ServerSocket.ReceiveBuf(TransferBuffer,Length(TransferBuffer));
      if (ActualSize > 0)
       then begin
        SendTo(ReceiverSocket, Pointer(@TransferBuffer[0])^,ActualSize, 0, ReceiverSocketAddress,SizeOf(ReceiverSocketAddress));
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
      end;
  lcmctPacketted:
    while (NOT Terminated) do begin
      ActualSize:=ServerSocket_ReceiveBuf1(Pointer(@TransferBuffer[0])^,SizeOf(PacketSize));
      if (ActualSize > 0)
       then begin
        if (ActualSize <> SizeOf(PacketSize)) then Raise Exception.Create('wrong PacketSize data'); //. =>
        PacketSize:=Integer(Pointer(@TransferBuffer[0])^);
        if (PacketSize > Length(TransferBuffer)) then Raise Exception.Create('insufficient buffer size'); //. =>
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
      if (PacketSize > 0)
       then begin
        ActualSize:=ServerSocket_ReceiveBuf1(Pointer(@TransferBuffer[0])^,PacketSize);
        if (ActualSize > 0)
         then begin
          if (ActualSize <> PacketSize) then Raise Exception.Create('wrong Packet data'); //. =>
          SendTo(ReceiverSocket, Pointer(@TransferBuffer[0])^,PacketSize, 0, ReceiverSocketAddress,SizeOf(ReceiverSocketAddress));
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
      end;
  end;
  finally
  CloseSocket(ReceiverSocket);
  end;
  end
 else
  while (NOT Terminated) do Sleep(100);
finally
flRunning:=false;
end;
except
  On E: Exception do begin
    ExceptionMessage:=E.Message;
    //. Synchronize(DoOnException);
    end;
  end;
end;

{$IFDEF Plugin}
procedure TGeographProxyServerLANUDPConnectionClient.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;
{$ENDIF}

procedure TGeographProxyServerLANUDPConnectionClient.DoOnException();
begin
if (Terminated) then Exit; //. ->
//.
Application.MessageBox(PChar('LANConnectionClient error, '+ExceptionMessage),'error',MB_ICONEXCLAMATION+MB_OK);
end;


{TGeographProxyServerLANUDPConnectionRepeater}
Constructor TGeographProxyServerLANUDPConnectionRepeater.Create(const pConnectionType: TLANConnectionModuleConnectionType; const pReceivingPort: integer; const pReceivingPacketSize: integer; const pAddress: string; const pTransmittingPort: integer; const pTransmittingPacketSize: integer; const pLocalReceivingPort: integer; const pLocalReceivingPacketSize: integer; const pLocalTransmittingPort: integer; const pLocalTransmittingPacketSize: integer; const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServerObject: Int64; const pDoStartLANUDPConnection: TDoStartLANUDPConnection; const pDoStopLANUDPConnection: TDoStopLANUDPConnection);
const
  MinBufferSize = 4;
begin
ConnectionType:=pConnectionType;
if (ConnectionType <> lcmctPacketted) then Raise Exception.Create('unsupported ConnectionType'); //. =>
//.
ReceivingPort:=pReceivingPort;
ReceivingPacketSize:=pReceivingPacketSize;
if ((ReceivingPort <> 0) AND (ReceivingPacketSize < MinBufferSize)) then Raise Exception.Create('packet size is too short'); //. =>
//.
Address:=pAddress;
TransmittingPort:=pTransmittingPort;
TransmittingPacketSize:=pTransmittingPacketSize;
if ((TransmittingPort <> 0) AND (TransmittingPacketSize < MinBufferSize)) then Raise Exception.Create('packet size is too short'); //. =>
//.
LocalReceivingPort:=pLocalReceivingPort;
LocalReceivingPacketSize:=pLocalReceivingPacketSize;
if ((LocalReceivingPort <> 0) AND (LocalReceivingPacketSize < MinBufferSize)) then Raise Exception.Create('packet size is too short'); //. =>
//.
LocalTransmittingPort:=pLocalTransmittingPort;
LocalTransmittingPacketSize:=pLocalTransmittingPacketSize;
if ((LocalTransmittingPort <> 0) AND (LocalTransmittingPacketSize < MinBufferSize)) then Raise Exception.Create('packet size is too short'); //. =>
//.
ServerAddress:=pServerAddress;
ServerPort:=pServerPort;
UserName:=pUserName;
UserPassword:=pUserPassword;
idGeographServerObject:=pidGeographServerObject;
//.
DoStartLANUDPConnection:=pDoStartLANUDPConnection;
DoStopLANUDPConnection:=pDoStopLANUDPConnection;
Inherited Create(false);
end;

Destructor TGeographProxyServerLANUDPConnectionRepeater.Destroy();
begin
Inherited;
end;

procedure TGeographProxyServerLANUDPConnectionRepeater.Execute();
const
  ReadTimeout = 100;
var
  LANConnectionClient: TGeographProxyServerLANUDPConnectionClient;
  TransmittingSocket: TSocket;
  TransmittingSocketAddress: TSockAddr;
  _Timeout:TTimeVal;
  TransferBuffer: array of byte;
  ClientAddress: TSockAddr;
  ClientAddressLength: integer;
  ActualSize: integer;
  SE: integer;
begin
LANConnectionClient:=TGeographProxyServerLANUDPConnectionClient.Create(Self);
try
if (LocalReceivingPort > 0)
 then LANConnectionClient.Resume();
//.
if (LocalTransmittingPort > 0)
 then begin
  TransmittingSocket:=Socket(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
  try
  TransmittingSocketAddress.sin_family:=AF_INET;
  TransmittingSocketAddress.sin_port:=htons(TransmittingPort);
  TransmittingSocketAddress.sin_addr.s_addr:=INADDR_ANY;
  if (Bind(TransmittingSocket,TransmittingSocketAddress,SizeOf(TransmittingSocketAddress)) <> 0) then Raise Exception.Create('could not bind socket to UDP listening address'); //. =>
  //. set reading timeout
  _Timeout.tv_usec:=0;
  _Timeout.tv_sec:=ReadTimeout;
  WinSock.setsockopt(TransmittingSocket, SOL_SOCKET, SO_RCVTIMEO, @_Timeout, sizeof(TTimeval));
  //.
  SetLength(TransferBuffer,TransmittingPacketSize);
  ClientAddressLength:=SizeOf(ClientAddress);
  case (ConnectionType) of
  lcmctNormal:
    while ((NOT Terminated) AND LANConnectionClient.flRunning) do begin
      ActualSize:=RecvFrom(TransmittingSocket, Pointer(@TransferBuffer[0])^,Length(TransferBuffer), 0, ClientAddress,ClientAddressLength);
      if (ActualSize > 0)
       then begin
        if (LANConnectionClient.ServerSocket.SendBuf(Pointer(@TransferBuffer[0])^,ActualSize) <> ActualSize) then Raise Exception.Create('error of writing server socket data, '+SysErrorMessage(WSAGetLastError())); //. =>
        end
       else begin
        if (ActualSize < 0)
         then begin
          SE:=WSAGetLastError();
          case SE of
          WSAETIMEDOUT: ;
          else
            Raise Exception.Create('error of reading Repeater UDP socket data, '+SysErrorMessage(SE)); //. =>
          end;
          end;
        end;
      end;
  lcmctPacketted:
    while ((NOT Terminated) AND LANConnectionClient.flRunning) do begin
      ActualSize:=RecvFrom(TransmittingSocket, Pointer(@TransferBuffer[0])^,Length(TransferBuffer), 0, ClientAddress,ClientAddressLength);
      if (ActualSize > 0)
       then begin
        if (LANConnectionClient.ServerSocket.SendBuf(ActualSize,SizeOf(ActualSize)) <> SizeOf(ActualSize)) then Raise Exception.Create('error of writing server socket packet descriptor, '+SysErrorMessage(WSAGetLastError())); //. =>
        if (LANConnectionClient.ServerSocket.SendBuf(Pointer(@TransferBuffer[0])^,ActualSize) <> ActualSize) then Raise Exception.Create('error of writing server socket packet, '+SysErrorMessage(WSAGetLastError())); //. =>
        end
       else begin
        if (ActualSize < 0)
         then begin
          SE:=WSAGetLastError();
          case SE of
          WSAETIMEDOUT: ;
          else
            Raise Exception.Create('error of reading Repeater UDP socket data, '+SysErrorMessage(SE)); //. =>
          end;
          end;
        end;
      end;
  end;
  finally
  CloseSocket(TransmittingSocket);
  end;
  end
 else 
  while ((NOT Terminated) AND LANConnectionClient.flRunning) do Sleep(100);
finally
LANConnectionClient.Destroy();
end;
end;


end.
