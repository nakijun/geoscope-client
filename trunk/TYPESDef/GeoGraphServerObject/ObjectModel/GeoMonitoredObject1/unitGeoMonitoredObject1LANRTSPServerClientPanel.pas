unit unitGeoMonitoredObject1LANRTSPServerClientPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  unitGeoMonitoredObject1Model,
  unitGeoMonitoredObject1LANRTSPServerClient, ExtCtrls;

type
  TGeoMonitoredObject1LANRTSPServerClientPanel = class(TForm)
    pnlPlayer: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Model: TGeoMonitoredObject1Model;
    LANRTSPServerClient: TGeoMonitoredObject1LANRTSPServerClient;
  public
    { Public declarations }
    Constructor Create(const pModel: TGeoMonitoredObject1Model);
    Destructor Destroy(); override;
    procedure Start();
    procedure Stop();
  end;


implementation
uses
{$IFNDEF Plugin}
  unitProxySpace;
{$ELSE}
  FunctionalityImport;
{$ENDIF}

{$R *.dfm}

Constructor TGeoMonitoredObject1LANRTSPServerClientPanel.Create(const pModel: TGeoMonitoredObject1Model);
begin
Inherited Create(nil);
Model:=pModel;
end;

Destructor TGeoMonitoredObject1LANRTSPServerClientPanel.Destroy();
begin
Stop();
Inherited;
end;

procedure TGeoMonitoredObject1LANRTSPServerClientPanel.Start();
const
  DefaultServerPort = 2010;
  DefaultLocalPort = 5000;
var
  Address: string;
  Port: integer;
  LocalPort: integer; 
  ServerAddress: string;
  Idx: integer;
  UserName,UserPassword: WideString;
begin
Address:='192.168.43.65';
Port:=8086;
LocalPort:=DefaultLocalPort;
{$IFNDEF Plugin}
ServerAddress:=ProxySpace.SOAPServerURL;
UserName:=ProxySpace.UserName;
UserPassword:=ProxySpace.UserPassword;
{$ELSE}
ServerAddress:=ProxySpace_SOAPServerURL();
UserName:=ProxySpace_UserName();
UserPassword:=ProxySpace_UserPassword();
{$ENDIF}
SetLength(ServerAddress,Pos(ANSIUpperCase('SpaceSOAPServer.dll'),ANSIUpperCase(ServerAddress))-2);
Idx:=Pos('http://',ServerAddress);
if (Idx = 1) then ServerAddress:=Copy(ServerAddress,8,Length(ServerAddress)-7);
//.
FreeAndNil(LANRTSPServerClient);
LANRTSPServerClient:=TGeoMonitoredObject1LANRTSPServerClient.Create(Address,Port, LocalPort, ServerAddress,DefaultServerPort, UserName,UserPassword, Model.ObjectController.idGeoGraphServerObject, Model, pnlPlayer);
end;

procedure TGeoMonitoredObject1LANRTSPServerClientPanel.Stop();
begin
FreeAndNil(LANRTSPServerClient);
end;

procedure TGeoMonitoredObject1LANRTSPServerClientPanel.FormShow(Sender: TObject);
begin
Start();
end;


end.
