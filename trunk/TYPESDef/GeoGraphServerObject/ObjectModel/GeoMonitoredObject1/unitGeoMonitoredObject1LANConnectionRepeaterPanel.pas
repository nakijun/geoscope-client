unit unitGeoMonitoredObject1LANConnectionRepeaterPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  unitGeoMonitoredObject1Model,
  unitGeoMonitoredObject1LANConnectionRepeater, StdCtrls, Buttons, ExtCtrls;

type
  TfmGeoMonitoredObject1LANConnectionRepeaterPanel = class(TForm)
    gbLANEndpoint: TGroupBox;
    gbLocalPort: TGroupBox;
    gbStatus: TGroupBox;
    btnStartStop: TBitBtn;
    lbStatus: TLabel;
    edLocalPort: TEdit;
    Label3: TLabel;
    Updater: TTimer;
    Label1: TLabel;
    edAddress: TEdit;
    Label2: TLabel;
    edPort: TEdit;
    procedure btnStartStopClick(Sender: TObject);
    procedure UpdaterTimer(Sender: TObject);
  private
    { Private declarations }
    Model: TGeoMonitoredObject1Model;
    Repeater: TGeographProxyServerLANConnectionRepeater;

    procedure UpdateStatus();
  public
    { Public declarations }
    Constructor Create(const pModel: TGeoMonitoredObject1Model);
    Destructor Destroy(); override;
    procedure Start();
    procedure Stop();
    function  IsStarted(): boolean;
  end;


implementation
uses
{$IFNDEF Plugin}
  unitProxySpace;
{$ELSE}
  FunctionalityImport;
{$ENDIF}


{$R *.dfm}



Constructor TfmGeoMonitoredObject1LANConnectionRepeaterPanel.Create(const pModel: TGeoMonitoredObject1Model);
begin
Inherited Create(nil);
Model:=pModel;
Repeater:=nil;
UpdateStatus();
end;

Destructor TfmGeoMonitoredObject1LANConnectionRepeaterPanel.Destroy();
begin
Stop();
Inherited;
end;

procedure TfmGeoMonitoredObject1LANConnectionRepeaterPanel.Start();
const
  DefaultServerPort = 2010;
var
  Address: string;
  Port: integer;
  LocalPort: integer; 
  ServerAddress: string;
  Idx: integer;
  UserName,UserPassword: WideString;
begin
Address:=edAddress.Text;
Port:=StrToInt(edPort.Text);
LocalPort:=StrToInt(edLocalPort.Text);
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
FreeAndNil(Repeater);
Repeater:=TGeographProxyServerLANConnectionRepeater.Create(lcmctNormal, Address,Port, LocalPort, ServerAddress,DefaultServerPort, UserName,UserPassword, Model.ObjectController.idGeoGraphServerObject, Model.ControlModule_StartLANConnection,Model.ControlModule_StopLANConnection);
//.
gbLANEndpoint.Enabled:=false;
gbLocalPort.Enabled:=false;
btnStartStop.Caption:='Stop';
UpdateStatus();
Updater.Enabled:=true;
end;

procedure TfmGeoMonitoredObject1LANConnectionRepeaterPanel.Stop();
begin
FreeAndNil(Repeater);
//.
Updater.Enabled:=false;
gbLANEndpoint.Enabled:=true;
gbLocalPort.Enabled:=true;
btnStartStop.Caption:='Start';
UpdateStatus();
end;

function  TfmGeoMonitoredObject1LANConnectionRepeaterPanel.IsStarted(): boolean;
begin
Result:=(Repeater <> nil);
end;

procedure TfmGeoMonitoredObject1LANConnectionRepeaterPanel.UpdateStatus();
begin
if (IsStarted())
 then begin
  edLocalPort.Text:=IntToStr(Repeater.GetPort());
  lbStatus.Font.Color:=clGreen;
  lbStatus.Caption:='Online, connections: '+IntToStr(Repeater.GetConnectionsCount());
  end
 else begin
  lbStatus.Font.Color:=clRed;
  lbStatus.Caption:='offline';
  end;
end;

procedure TfmGeoMonitoredObject1LANConnectionRepeaterPanel.UpdaterTimer(Sender: TObject);
begin
UpdateStatus();
end;

procedure TfmGeoMonitoredObject1LANConnectionRepeaterPanel.btnStartStopClick(Sender: TObject);
begin
if (IsStarted()) then Stop() else Start();
end;


end.
