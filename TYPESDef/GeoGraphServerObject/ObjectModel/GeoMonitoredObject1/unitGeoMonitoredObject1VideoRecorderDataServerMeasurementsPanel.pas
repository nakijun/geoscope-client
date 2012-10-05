unit unitGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  Sockets,
  IdException,
  IdSocks,
  IdStack,
  Hash,
  Cipher,
  unitGeoMonitoredObject1Model, ComCtrls, Menus;

const
  SERVICE_GETVIDEORECORDERDATA_V1       = 1001;
  //.
  SERVICE_GETVIDEORECORDERDATA_V1_COMMAND_GETMEASUREMENTLIST = 1;
  SERVICE_GETVIDEORECORDERDATA_V1_COMMAND_GETMEASUREMENTDATA = 2;
  SERVICE_GETVIDEORECORDERDATA_V1_COMMAND_DELETEMEASUREMENTDATA = 3;
  //. error messages
  MESSAGE_OK                    = 0;
  MESSAGE_ERROR                 = -1;
  MESSAGE_UNKNOWNSERVICE        = -10;
  MESSAGE_AUTHENTICATIONFAILED  = -11;
  MESSAGE_ACCESSISDENIED        = -12;
  MESSAGE_TOOMANYCLIENTS        = -13;
  MESSAGE_UNKNOWNCOMMAND        = -14;

const
  GeographDataServerPort = 5000;
const
  ServerReadWriteTimeout = 1000*60; //. Seconds

type
  TMeasurement = record
    MeasurementID: shortstring;
    MeasurementStartTimestamp: double;
    MeasurementFinishTimestamp: double;
    AudioSize: integer;
    VideoSize: integer;
    Completed: double;
  end;

  TMeasurements = array of TMeasurement;

type
  TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel = class(TForm)
    lvMeasurements: TListView;
    lvMeasurements_PopupMenu: TPopupMenu;
    Deleteselected1: TMenuItem;
    N2: TMenuItem;
    Updatelist1: TMenuItem;
    N3: TMenuItem;
    Open1: TMenuItem;
    procedure Deleteselected1Click(Sender: TObject);
    procedure lvMeasurementsDblClick(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Updatelist1Click(Sender: TObject);
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
    //.
    idGeographServerObject: Int64;
    //.
    Measurements: TMeasurements;
    //.
    MeasurementVisor: TForm;

    function  Server_Connect(const Command: integer): TTcpClient;
    procedure Server_Disconnect(var ServerSocket: TTcpClient);
    //.
    function  Measurements_GetList(): ANSIString;
    procedure Measurements_Delete(const IDs: ANSIString);
    procedure Measurement_GetData(MeasurementID: double; Flags: integer; StartTimestamp,FinishTimestamp: double; DatabaseFolder: string);
  public
    { Public declarations }

    Constructor Create(const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServerObject: Int64);
    Destructor Destroy(); override;
    procedure Update(); reintroduce;
    function OpenMeasurement(const MeasurementID: string): string;
    procedure PlayMeasurement(const BaseFolder: string; const MeasurementID: string);
    function Measurements_GetItem(const MeasurementID: string; out Measurement: TMeasurement): boolean;
    function lvMeasurements_SelectItem(const MeasurementID: string): boolean;
  end;


implementation
uses
  StrUtils,
  ShellAPI,
  GlobalSpaceDefines,
  unitObjectModel,
  unitGeoMonitoredObject1VideoRecorderDataServerMeasurementVisor,
  unitVideoRecorderMeasurement,
  unitMeasurementMediaPlayer;

{$R *.dfm}


function StrToFloat(const S: string): Extended;
begin
DecimalSeparator:='.';
Result:=SysUtils.StrToFloat(S);
end;


{TGeoMonitoredObject1VideoRecorderMeasurementsPanel}
Constructor TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Create(const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServerObject: Int64);
begin
Inherited Create(nil);
//.
ServerAddress:=pServerAddress;
ServerPort:=pServerPort;
if (ServerPort = 0) then ServerPort:=GeographDataServerPort;
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
//.
MeasurementVisor:=nil;
//.
lvMeasurements.Columns[0].Width:=0;
lvMeasurements.Columns[4].Width:=0;
lvMeasurements.Columns[5].Width:=0;
lvMeasurements.Columns[6].Width:=0;
lvMeasurements.Columns[7].Width:=0;
//.
Update();
end;

Destructor TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Destroy();
begin
MeasurementVisor.Free();
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

procedure CheckLoginMessage(Message: integer);
begin
case (Message) of
MESSAGE_OK:                         ;
MESSAGE_ERROR:                      Raise Exception.Create('error'); //. =>
MESSAGE_UNKNOWNSERVICE:             Raise Exception.Create('unknown service'); //. =>
MESSAGE_AUTHENTICATIONFAILED:       Raise Exception.Create('authentication failed'); //. =>
MESSAGE_ACCESSISDENIED:             Raise Exception.Create('access is denied'); //. =>
MESSAGE_TOOMANYCLIENTS:             Raise Exception.Create('too many clients'); //. =>
MESSAGE_UNKNOWNCOMMAND:             Raise Exception.Create('unknown command'); //. =>
else
  Raise Exception.Create('unknown error, RC: '+IntToStr(Message)); //. =>        
end;
end;

function TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Server_Connect(const Command: integer): TTcpClient;
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
  Service: smallint;
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
Service:=SERVICE_GETVIDEORECORDERDATA_V1;
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

procedure TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Server_Disconnect(var ServerSocket: TTcpClient);
var
  Command: integer;
  ActualSize: integer;
begin
try
ServerSocket.Close();
finally
FreeAndNil(ServerSocket);
end;
end;


function TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Measurements_GetList(): ANSIString;
var
  ServerSocket: TTcpClient;
  ActualSize: integer;
  Descriptor: integer;
begin
ServerSocket:=Server_Connect(SERVICE_GETVIDEORECORDERDATA_V1_COMMAND_GETMEASUREMENTLIST);
try
ActualSize:=ServerSocket.SendBuf(idGeographServerObject,SizeOf(idGeographServerObject));
if (ActualSize <> SizeOf(idGeographServerObject)) then Raise Exception.Create('could not send idGeographServerObject'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(ServerSocket, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckLoginMessage(Descriptor);
ActualSize:=ServerSocket_ReceiveBuf(ServerSocket, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('socket reading error'); //. =>
if (Descriptor < 0) then Exception.Create('error of reading list'); //. =>
SetLength(Result,Descriptor);
if (Descriptor > 0)
 then begin
  ActualSize:=ServerSocket_ReceiveBuf(ServerSocket, Pointer(@Result[1])^, Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('socket reading error'); //. =>
  end;
finally
Server_Disconnect({ref} ServerSocket);
end;
end;

procedure TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Measurements_Delete(const IDs: ANSIString);
var
  ServerSocket: TTcpClient;
  ActualSize: integer;
  Descriptor: integer;
begin
ServerSocket:=Server_Connect(SERVICE_GETVIDEORECORDERDATA_V1_COMMAND_DELETEMEASUREMENTDATA);
try
ActualSize:=ServerSocket.SendBuf(idGeographServerObject,SizeOf(idGeographServerObject));
if (ActualSize <> SizeOf(idGeographServerObject)) then Raise Exception.Create('could not send idGeographServerObject'); //. =>
Descriptor:=Length(IDs);
ActualSize:=ServerSocket.SendBuf(Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('could not send Descriptor'); //. =>
if (Descriptor > 0)
 then begin
  ActualSize:=ServerSocket.SendBuf(Pointer(@IDs[1])^,Descriptor);
  if (ActualSize <> Descriptor) then Raise Exception.Create('could not send IDs'); //. =>
  end;
//. check login
ActualSize:=ServerSocket_ReceiveBuf(ServerSocket, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckLoginMessage(Descriptor);
//. check result
ActualSize:=ServerSocket_ReceiveBuf(ServerSocket, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('could not get Descriptor'); //. =>
if (Descriptor <> MESSAGE_OK) then Raise Exception.Create('error of deleting measurement(s)'); //. =>
finally
Server_Disconnect({ref} ServerSocket);
end;
end;

procedure TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Measurement_GetData(MeasurementID: double; Flags: integer; StartTimestamp,FinishTimestamp: double; DatabaseFolder: string);
var
  ServerSocket: TTcpClient;
  ActualSize: integer;
  Descriptor: integer;
  FilesCount: integer;
  MeasurementFolder: string;
  I: integer;
  FileName: ANSIString;
  FileSize: integer;
  FileBuffer: array of byte;
  Portion: integer;
  BytesRead: integer;
  FileStream: TFileStream;
begin
ServerSocket:=Server_Connect(SERVICE_GETVIDEORECORDERDATA_V1_COMMAND_GETMEASUREMENTDATA);
try
ActualSize:=ServerSocket.SendBuf(idGeographServerObject,SizeOf(idGeographServerObject));
if (ActualSize <> SizeOf(idGeographServerObject)) then Raise Exception.Create('could not send idGeographServerObject'); //. =>
ActualSize:=ServerSocket.SendBuf(MeasurementID,SizeOf(MeasurementID));
if (ActualSize <> SizeOf(MeasurementID)) then Raise Exception.Create('could not send MeasurementID'); //. =>
ActualSize:=ServerSocket.SendBuf(Flags,SizeOf(Flags));
if (ActualSize <> SizeOf(Flags)) then Raise Exception.Create('could not send Flags'); //. =>
ActualSize:=ServerSocket.SendBuf(StartTimestamp,SizeOf(StartTimestamp));
if (ActualSize <> SizeOf(StartTimestamp)) then Raise Exception.Create('could not send StartTimestamp'); //. =>
ActualSize:=ServerSocket.SendBuf(FinishTimestamp,SizeOf(FinishTimestamp));
if (ActualSize <> SizeOf(FinishTimestamp)) then Raise Exception.Create('could not send FinishTimestamp'); //. =>
//. check login
ActualSize:=ServerSocket_ReceiveBuf(ServerSocket, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
CheckLoginMessage(Descriptor);
//.
ActualSize:=ServerSocket_ReceiveBuf(ServerSocket, Descriptor,SizeOf(Descriptor));
if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('access is denied'); //. =>
if (Descriptor < 0) then Raise Exception.Create('error of reading FilesCount'); //. =>
FilesCount:=Descriptor;
if (FilesCount > 0)
 then begin
  MeasurementFolder:=DatabaseFolder+'\'+FloatToStr(MeasurementID);
  ForceDirectories(MeasurementFolder);
  //.
  SetLength(FileBuffer,1024*1024*1);
  for I:=0 to FilesCount-1 do begin
    //. file name
    ActualSize:=ServerSocket_ReceiveBuf(ServerSocket, Descriptor,SizeOf(Descriptor));
    if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('could not get filename size'); //. =>
    if (Descriptor < 0) then Raise Exception.Create('error while reading filename size'); //. =>
    SetLength(FileName,Descriptor);
    if (Descriptor > 0)
     then begin
      ActualSize:=ServerSocket_ReceiveBuf(ServerSocket, Pointer(@FileName[1])^,Descriptor);
      if (ActualSize <> Descriptor) then Raise Exception.Create('could not get filename'); //. =>
      end;
    //.
    ActualSize:=ServerSocket_ReceiveBuf(ServerSocket, Descriptor,SizeOf(Descriptor));
    if (ActualSize <> SizeOf(Descriptor)) then Raise Exception.Create('could not get file size'); //. =>
    if (Descriptor < 0) then Raise Exception.Create('error while reading file size'); //. =>
    FileSize:=Descriptor;
    FileStream:=TFileStream.Create(MeasurementFolder+'\'+FileName,fmCreate);
    try
    Portion:=Length(FileBuffer);
    while (FileSize > 0) do begin
      if (Portion > FileSize) then Portion:=FileSize;
      BytesRead:=ServerSocket.ReceiveBuf(Pointer(@FileBuffer[0])^,Portion);
      if (BytesRead <= 0) then Raise Exception.Create('error of reading file data'); //. =>
      //.                                                
      FileStream.Write(Pointer(@FileBuffer[0])^,BytesRead);
      //.
      Dec(FileSize,BytesRead);
      end;
    finally
    FileStream.Destroy();
    end;
    end;
  end;
finally
Server_Disconnect({ref} ServerSocket);
end;
end;

procedure TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Update();

  function SplitStrings(const S: string; const Delim: string; out SL: TStringList): boolean;
  var
    SS: string;
    I: integer;
  begin
  SL:=TStringList.Create();
  try
  SS:='';
  for I:=1 to Length(S) do
    if (S[I] = Delim)
     then begin
      if (SS <> '')
       then begin
        SL.Add(SS);
        SS:='';
        end;
      end
    else
     if (S[I] <> ' ') then SS:=SS+S[I];
  if (SS <> '')
   then begin
    SL.Add(SS);
    SS:='';
    end;
  if (SL.Count > 0)
   then Result:=true
   else begin
    FreeAndNil(SL);
    Result:=false;
    end;
  except
    FreeAndNil(SL);
    Raise; //. =>
    end;
  end;

var
  L: string;
  _Measurements: TStringList;
  I: integer;
  MeasurementParams: TStringList;
begin
with lvMeasurements do begin
Items.BeginUpdate();
try
Items.Clear();
L:=Measurements_GetList();
if (L = '') then Exit; //. ->
if (SplitStrings(L,';',{out} _Measurements))
 then
  try
  SetLength(Measurements,_Measurements.Count);
  for I:=0 to _Measurements.Count-1 do with Items.Insert(0) do begin
    SplitStrings(_Measurements[I],',',{out} MeasurementParams);
    try
    with Measurements[(_Measurements.Count-1)-I] do begin
    MeasurementID:=MeasurementParams[0];
    MeasurementStartTimestamp:=StrToFloat(MeasurementParams[1]);
    MeasurementFinishTimestamp:=StrToFloat(MeasurementParams[2]);
    AudioSize:=StrToInt(MeasurementParams[3]);
    VideoSize:=StrToInt(MeasurementParams[4]);
    Completed:=StrToFloat(MeasurementParams[5]);
    //.
    Caption:=MeasurementID;
    SubItems.Add(FormatDateTime('YY.MM.DD HH:NN:SS',MeasurementStartTimestamp+TimeZoneDelta));
    if (MeasurementFinishTimestamp <> 0.0)
     then begin
      SubItems.Add(FormatDateTime('YY.MM.DD HH:NN:SS',MeasurementFinishTimestamp+TimeZoneDelta));
      SubItems.Add(IntToStr(Trunc((MeasurementFinishTimestamp-MeasurementStartTimestamp)*24*3600)))
      end
     else begin
      SubItems.Add('not finished');
      SubItems.Add('none');
      end;
    if (AudioSize <> 0)
     then SubItems.Add(IntToStr(AudioSize))
     else SubItems.Add('none');
    if (VideoSize <> 0)
     then SubItems.Add(IntToStr(VideoSize))
     else SubItems.Add('none');
    if ((AudioSize+VideoSize) <> 0)
     then SubItems.Add(IntToStr(AudioSize+VideoSize))
     else SubItems.Add('none');
    SubItems.Add(IntToStr(Trunc(100*Completed))+'%');
    end;
    finally
    MeasurementParams.Free();
    end;
    end
  finally
  _Measurements.Destroy();
  end;
finally
Items.EndUpdate();
end;
end;
end;

function TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.lvMeasurements_SelectItem(const MeasurementID: string): boolean;
var
  I: integer;
begin
Result:=false;
for I:=0 to lvMeasurements.Items.Count-1 do
  if (lvMeasurements.Items[I].Caption = MeasurementID)
   then begin
    lvMeasurements.Items[I].Focused:=true;
    lvMeasurements.Items[I].Selected:=lvMeasurements.Items[I].Focused;
    Result:=true;
    Exit; //. ->
    end;
end;

function TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Measurements_GetItem(const MeasurementID: string; out Measurement: TMeasurement): boolean;
var
  I: integer;
  _MeasurementID,MID: Int64;
begin
Result:=false;
_MeasurementID:=Round(StrToFloat(MeasurementID)*100000);
for I:=0 to Length(Measurements)-1 do begin
  MID:=Round(StrToFloat(Measurements[I].MeasurementID)*100000);
  if (MID = _MeasurementID)
   then begin
    Measurement:=Measurements[I];
    Result:=true;
    Exit; //. ->
    end;
  end;
end;

function TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.OpenMeasurement(const MeasurementID: string): string;
const
  PathTempDATA = 'TempDATA'; //. do not modify
var
  BaseFolder: string;
begin
BaseFolder:=PathTempDATA+'\'+IntToStr(idGeographServerObject);
Result:=BaseFolder;
if (DirectoryExists(BaseFolder+'\'+MeasurementID)) then Exit; //. ->
//. loading entire measurement from the server
Measurement_GetData(StrToFloat(MeasurementID),0,0.0,0.0, BaseFolder);
end;

procedure TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.PlayMeasurement(const BaseFolder: string; const MeasurementID: string);
var
  Measurement: TVideoRecorderMeasurement;
begin
FreeAndNil(MeasurementVisor);
//.
Measurement:=TVideoRecorderMeasurement.Create(BaseFolder,MeasurementID);
case (TVideoRecorderModuleMode(Measurement.Mode)) of
VIDEORECORDERMODULEMODE_H263STREAM1_AMRNBSTREAM1,VIDEORECORDERMODULEMODE_H264STREAM1_AMRNBSTREAM1: MeasurementVisor:=TfmGeoGraphServerObjectDataServerVideoMeasurementVisor.Create(BaseFolder,MeasurementID); 
VIDEORECORDERMODULEMODE_MODE_MPEG4: with TfmMeasurementMediaPlayer.Create(Measurement.MeasurementFolder+'\'+MediaMPEG4FileName,Measurement.StartTimestamp) do
  try
  ShowModal();
  finally
  Destroy();
  end;
VIDEORECORDERMODULEMODE_MODE_3GP: with TfmMeasurementMediaPlayer.Create(Measurement.MeasurementFolder+'\'+Media3GPFileName,Measurement.StartTimestamp) do
  try
  ShowModal();
  finally
  Destroy();
  end
else
  Raise Exception.Create('unknown video-recorder mode'); //. =>
end;
//.
if (MeasurementVisor <> nil) then MeasurementVisor.Show();
end;

procedure TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Deleteselected1Click(Sender: TObject);
var
  SC: TCursor;
  IDs: string;
  I: integer;
begin
IDs:='';
for I:=0 to lvMeasurements.Items.Count-1 do
  if (lvMeasurements.Items[I].Selected)
   then IDs:=IDs+lvMeasurements.Items[I].Caption+',';
if (IDs = '') then Exit; //. ->
SetLength(IDs,Length(IDs)-1);
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
Measurements_Delete(IDs);
//.
Update();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.lvMeasurementsDblClick(Sender: TObject);
var
  SC: TCursor;
  MeasurementID: string;
  BaseFolder: string;
begin
if (lvMeasurements.Selected = nil) then Exit; //. ->
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
MeasurementID:=lvMeasurements.Selected.Caption;
BaseFolder:=OpenMeasurement(MeasurementID);
PlayMeasurement(BaseFolder,MeasurementID);
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Open1Click(Sender: TObject);
begin
lvMeasurementsDblClick(nil);
end;

procedure TGeoMonitoredObject1VideoRecorderDataServerMeasurementsPanel.Updatelist1Click(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
Update();
finally
Screen.Cursor:=SC;
end;
end;


end.
