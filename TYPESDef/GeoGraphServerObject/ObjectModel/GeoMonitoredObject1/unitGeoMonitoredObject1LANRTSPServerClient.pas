unit unitGeoMonitoredObject1LANRTSPServerClient;
interface
uses
  Windows,
  SysUtils,
  SyncObjs,
  Classes,
  Controls,
  PasLibVlcPlayerUnit,
  GlobalSpaceDefines,
  unitGeoMonitoredObject1Model,
  unitGeoMonitoredObject1LANUDPConnectionRepeater,
  unitGeoMonitoredObject1LANConnectionRepeater;

type
  TGeoMonitoredObject1LANRTSPServerClient = class(TPasLibVlcPlayer)
  private
    Address: string;
    Port: integer;
    //.
    LocalPort: integer;
    //.
    ServerAddress: string;
    ServerPort: integer;
    UserName: WideString;
    UserPassword: WideString;
    idGeographServerObject: Int64;
    //.
    Model: TGeoMonitoredObject1Model;
    //.
    LANUDPConnectionRepeaters: TList;
    LANConnectionRepeater: TGeographProxyServerLANConnectionRepeater;
    //.
    ClientRequestLock: TCriticalSection;
    ClientRequest: TStringStream;

    procedure DoOnLengthChanged(Sender : TObject; time: Int64);
    procedure DoOnEndReached(Sender: TObject);
    procedure DoOnTimeChanged(Sender : TObject; time: Int64);
    //.
    procedure LANUDPConnectionRepeaters_Clear();
    procedure DoOnClientBytesTransmite(const Bytes: TByteArray; const Size: integer);
    procedure DoOnServerBytesTransmite(const Bytes: TByteArray; const Size: integer);
  public
    Constructor Create(const pAddress: string; const pPort: integer; const pLocalPort: integer; const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServerObject: Int64; const pModel: TGeoMonitoredObject1Model; const pParentWindow: TWinControl);
    Destructor Destroy(); override;
  end;

implementation


Constructor TGeoMonitoredObject1LANRTSPServerClient.Create(const pAddress: string; const pPort: integer; const pLocalPort: integer; const pServerAddress: string; const pServerPort: integer; const pUserName: WideString; const pUserPassword: WideString; const pidGeographServerObject: Int64; const pModel: TGeoMonitoredObject1Model; const pParentWindow: TWinControl);
begin
Inherited Create(nil);
//.
Address:=pAddress;
Port:=pPort;
//.
LocalPort:=pLocalPort;
//.
ServerAddress:=pServerAddress;
ServerPort:=pServerPort;
UserName:=pUserName;
UserPassword:=pUserPassword;
idGeographServerObject:=pidGeographServerObject;
//.
Model:=pModel;
//.
TitleShow:=false;
OnMediaPlayerLengthChanged:=DoOnLengthChanged;
OnMediaPlayerEndReached:=DoOnEndReached;
OnMediaPlayerTimeChanged:=DoOnTimeChanged;
Align:=alClient;
Parent:=pParentWindow;
//.
LANUDPConnectionRepeaters:=TList.Create();
ClientRequestLock:=TCriticalSection.Create();
ClientRequest:=TStringStream.Create('');
LANConnectionRepeater:=TGeographProxyServerLANConnectionRepeater.Create(lcmctNormal, Address,Port, LocalPort, ServerAddress,ServerPort, UserName,UserPassword, idGeographServerObject, Model.ControlModule_StartLANConnection,Model.ControlModule_StopLANConnection, DoOnServerBytesTransmite,DoOnClientBytesTransmite);
LocalPort:=LANConnectionRepeater.GetPort();
//. starting
Play('RTSP://'+'127.0.0.1'+':'+IntToStr(LocalPort));
end;

Destructor TGeoMonitoredObject1LANRTSPServerClient.Destroy();
begin
Pause();
//.
LANConnectionRepeater.Free();
ClientRequest.Free();
ClientRequestLock.Free();
if (LANUDPConnectionRepeaters <> nil)
 then begin
  LANUDPConnectionRepeaters_Clear();
  LANUDPConnectionRepeaters.Destroy();
  end;
Inherited;
end;

procedure TGeoMonitoredObject1LANRTSPServerClient.DoOnLengthChanged(Sender : TObject; time: Int64);
begin
end;

procedure TGeoMonitoredObject1LANRTSPServerClient.DoOnEndReached(Sender: TObject);
begin
end;

procedure TGeoMonitoredObject1LANRTSPServerClient.DoOnTimeChanged(Sender : TObject; time: Int64);
begin
end;

procedure TGeoMonitoredObject1LANRTSPServerClient.LANUDPConnectionRepeaters_Clear();
var
  I: integer;
begin
for I:=0 to LANUDPConnectionRepeaters.Count-1 do TObject(LANUDPConnectionRepeaters[I]).Destroy();
LANUDPConnectionRepeaters.Clear();
end;

procedure TGeoMonitoredObject1LANRTSPServerClient.DoOnClientBytesTransmite(const Bytes: TByteArray; const Size: integer);
const
  ClientPortString = 'CLIENT_PORT=';
  UDPPacketSize = 1024*1024;
var
  Request: string;
  CPI: integer;
  ClientPortRangeString: string;
  I: integer;
  StartPortString,FinishPortString: string;
  StartPort,FinishPort: integer;
  Port: integer;
  LANUDPConnectionRepeater: TGeographProxyServerLANUDPConnectionRepeater;
begin
ClientRequestLock.Enter();
try
ClientRequest.Size:=0;
ClientRequest.Write(Pointer(@Bytes[0])^,Size);
Request:=ANSIUpperCase(ClientRequest.DataString);
finally
ClientRequestLock.Leave();
end;
//. parsing request
if (Pos('SETUP',Request) > 0)
 then begin
  CPI:=Pos(ClientPortString,Request);
  if (CPI > 0)
   then begin
    I:=(CPI+Length(ClientPortString));
    StartPortString:='';
    while (I <= Length(Request)) do begin
      if (Ord(Request[I]) in [$30..$39])
       then StartPortString:=StartPortString+Request[I]
       else Break; //. >
      Inc(I);
      end;
    Inc(I); //. skip delimiter '-'
    FinishPortString:='';
    while (I <= Length(Request)) do begin
      if (Ord(Request[I]) in [$30..$39])
       then FinishPortString:=FinishPortString+Request[I]
       else Break; //. >
      Inc(I);
      end;
    StartPort:=StrToInt(StartPortString);
    FinishPort:=StrToInt(FinishPortString);
    //.
    for Port:=StartPort to FinishPort do begin
      LANUDPConnectionRepeater:=TGeographProxyServerLANUDPConnectionRepeater.Create(lcmctPacketted, Port,UDPPacketSize, Address, 0,0, Port,UDPPacketSize, 0,0, ServerAddress,ServerPort, UserName,UserPassword, idGeographServerObject, Model.ControlModule_StartLANUDPConnection,Model.ControlModule_StopLANUDPConnection);
      LANUDPConnectionRepeaters.Add(LANUDPConnectionRepeater);
      end;
    end;
  end;
end;

procedure TGeoMonitoredObject1LANRTSPServerClient.DoOnServerBytesTransmite(const Bytes: TByteArray; const Size: integer);
begin
ClientRequestLock.Enter();
try
ClientRequest.Size:=0;
finally
ClientRequestLock.Leave();
end;
end;


end.
