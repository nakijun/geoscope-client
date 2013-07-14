unit unitGeoMonitoredObject1DeviceConnectionRepeaterPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  unitGeoMonitoredObject1Model,
  unitGeoMonitoredObject1DeviceConnectionRepeater, Buttons, ExtCtrls,
  StdCtrls;

type
  TfmGeoMonitoredObject1DeviceConnectionRepeaterPanel = class(TForm)
    gbLocalPort: TGroupBox;
    gbStatus: TGroupBox;
    btnStartStop: TBitBtn;
    lbStatus: TLabel;
    edLocalPort: TEdit;
    Label3: TLabel;
    Updater: TTimer;
    GroupBox1: TGroupBox;
    btnGetGPSFix: TBitBtn;
    procedure btnStartStopClick(Sender: TObject);
    procedure UpdaterTimer(Sender: TObject);
    procedure btnGetGPSFixClick(Sender: TObject);
  private
    { Private declarations }
    Model: TGeoMonitoredObject1Model;
    Repeater: TGeographProxyServerDeviceConnectionRepeater;

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
  unitGEOGraphServerController,
{$IFNDEF Plugin}
  unitProxySpace;
{$ELSE}
  FunctionalityImport;
{$ENDIF}


{$R *.dfm}



Constructor TfmGeoMonitoredObject1DeviceConnectionRepeaterPanel.Create(const pModel: TGeoMonitoredObject1Model);
begin
Inherited Create(nil);
Model:=pModel;
Repeater:=nil;
UpdateStatus();
end;

Destructor TfmGeoMonitoredObject1DeviceConnectionRepeaterPanel.Destroy();
begin
Stop();
Inherited;
end;

procedure TfmGeoMonitoredObject1DeviceConnectionRepeaterPanel.Start();
const
  DefaultServerPort = 2010;
var
  LocalPort: integer;
  ServerAddress: string;
  Idx: integer;
  UserName,UserPassword: WideString;
begin
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
Repeater:=TGeographProxyServerDeviceConnectionRepeater.Create('2:3&4', LocalPort, ServerAddress,DefaultServerPort, UserName,UserPassword, Model.ObjectController.idGeoGraphServerObject, Model.ControlModule_StartDeviceConnection,Model.ControlModule_StopDeviceConnection);
//.
gbLocalPort.Enabled:=false;
btnStartStop.Caption:='Stop';
UpdateStatus();
Updater.Enabled:=true;
end;

procedure TfmGeoMonitoredObject1DeviceConnectionRepeaterPanel.Stop();
begin
FreeAndNil(Repeater);
//.
Updater.Enabled:=false;
gbLocalPort.Enabled:=true;
btnStartStop.Caption:='Start';
UpdateStatus();
end;

function  TfmGeoMonitoredObject1DeviceConnectionRepeaterPanel.IsStarted(): boolean;
begin
Result:=(Repeater <> nil);
end;

procedure TfmGeoMonitoredObject1DeviceConnectionRepeaterPanel.UpdateStatus();
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

procedure TfmGeoMonitoredObject1DeviceConnectionRepeaterPanel.UpdaterTimer(Sender: TObject);
begin
UpdateStatus();
end;

procedure TfmGeoMonitoredObject1DeviceConnectionRepeaterPanel.btnStartStopClick(Sender: TObject);
begin
if (IsStarted()) then Stop() else Start();
end;


procedure TfmGeoMonitoredObject1DeviceConnectionRepeaterPanel.btnGetGPSFixClick(Sender: TObject);
var
  GSOC: TGEOGraphServerObjectController;
  GeoMonitoredObject1Model: TGeoMonitoredObject1Model;
  DeviceRootComponent: TGeoMonitoredObject1DeviceComponent;
  SC: TCursor;
begin
if (NOT IsStarted()) then Raise Exception.Create('Repeater is not active'); //. =>
GSOC:=TGEOGraphServerObjectController.Create(Model.ObjectController.idGeoGraphServerObject, Model.ObjectController.ObjectID, Model.ObjectController.UserID,Model.ObjectController.UserName,Model.ObjectController.UserPassword, '127.0.0.1',Repeater.GetPort(), true,true);
GeoMonitoredObject1Model:=TGeoMonitoredObject1Model.Create(GSOC,true);
try
DeviceRootComponent:=TGeoMonitoredObject1DeviceComponent(GeoMonitoredObject1Model.ObjectDeviceSchema.RootComponent);
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
DeviceRootComponent.GPSModule.GPSFixData.ReadDeviceCUAC();
finally
Screen.Cursor:=SC;
end;
ShowMessage('Latitude: '+FormatFloat('0.000',DeviceRootComponent.GPSModule.GPSFixData.Value.Latitude)+', Longitude: '+FormatFloat('0.000',DeviceRootComponent.GPSModule.GPSFixData.Value.Longitude)+', Altitude: '+FormatFloat('0.000',DeviceRootComponent.GPSModule.GPSFixData.Value.Altitude)+', Precision: '+FormatFloat('0.0',DeviceRootComponent.GPSModule.GPSFixData.Value.Precision));
finally
GeoMonitoredObject1Model.Destroy();
end;
end;


end.
