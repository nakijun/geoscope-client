unit unitEnforaMT3000ObjectControlPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  unitObjectModel,
  unitGEOGraphServerController,
  unitEnforaMT3000ObjectModel,
  Buttons, Menus;

type
  TEnforaMT3000ObjectControlPanel = class(TObjectModelControlPanel)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edVisualizationType: TEdit;
    Label3: TLabel;
    edVisualizationID: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edHintID: TEdit;
    gbConnectorModule: TGroupBox;
    Label6: TLabel;
    edConnectionModuleCheckpointInterval: TEdit;
    Label7: TLabel;
    edConnectionModuleLastCheckpointTime: TEdit;
    gbGPSModule: TGroupBox;
    Label8: TLabel;
    edGPSModuleFixLatitude: TEdit;
    Label9: TLabel;
    edGPSModuleFixLongitude: TEdit;
    Label10: TLabel;
    edGPSModuleFixAltitude: TEdit;
    Label11: TLabel;
    edGPSModuleFixPrecision: TEdit;
    Label12: TLabel;
    edGPSModuleFixTime: TEdit;
    Label13: TLabel;
    edGPSModuleDistanceThreshold: TEdit;
    Label14: TLabel;
    edGPSModuleDatumID: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    edGeoSpaceID: TEdit;
    bbUpdatePanel: TBitBtn;
    cbGPSModuleDatumID: TComboBox;
    lbConnectionModuleStatus: TLabel;
    stConnectionModuleStatus: TStaticText;
    Updater: TTimer;
    Label15: TLabel;
    edGPSModuleFixSpeed: TEdit;
    Label18: TLabel;
    edGPSModuleFixBearing: TEdit;
    gbBatteryModule: TGroupBox;
    Label20: TLabel;
    edBatteryModuleVoltage: TEdit;
    Label21: TLabel;
    edBatteryModuleCharge: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    edUserAlertID: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    edOnlineFlagID: TEdit;
    gbConnectionModuleServiceProvider: TGroupBox;
    edConnectionModuleServiceProviderAccount: TEdit;
    Label19: TLabel;
    Label26: TLabel;
    edConnectionModuleServiceProviderID: TEdit;
    Label27: TLabel;
    edConnectionModuleServiceProviderSignal: TEdit;
    Label28: TLabel;
    edConnectionModuleServiceNumber: TEdit;
    gbDeviceDescriptor: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    edDeviceDescriptorVendorID: TEdit;
    edDeviceDescriptorModelID: TEdit;
    Label31: TLabel;
    edDeviceDescriptorSerialNumber: TEdit;
    Label32: TLabel;
    edDeviceDescriptorProductionDate: TEdit;
    Label33: TLabel;
    edDeviceDescriptorHWVersion: TEdit;
    Label34: TLabel;
    edDeviceDescriptorSWVersion: TEdit;
    Label35: TLabel;
    edLocationIsAvailableFlagID: TEdit;
    PopupMenu: TPopupMenu;
    Geographserverobjecttracing1: TMenuItem;
    Geographservercontroltracing1: TMenuItem;
    sbGeoSpace: TSpeedButton;
    cbBatteryModuleIsExternalPower: TCheckBox;
    Label36: TLabel;
    edDeviceDescriptorFOTA: TEdit;
    cbBatteryModuleIsLowPowerMode: TCheckBox;
    gbAccelerometerModule: TGroupBox;
    Label37: TLabel;
    edAccelerometerModuleValue: TEdit;
    cbAccelerometerModuleIsCalibrated: TCheckBox;
    gbIgnitionModule: TGroupBox;
    cbIgnitionModuleValue: TCheckBox;
    gbTowAlertModule: TGroupBox;
    cbTowAlertModuleValue: TCheckBox;
    gbOBDIIModule: TGroupBox;
    gbOBDIIModuleStateModule: TGroupBox;
    Label38: TLabel;
    edOBDIIModuleStateModuleProtocol: TEdit;
    cbOBDIIModuleStateModuleIsPresent: TCheckBox;
    gbOBDIIModuleBatteryModule: TGroupBox;
    Label39: TLabel;
    edOBDIIModuleBatteryModuleValue: TEdit;
    gbOBDIIModuleFuelModule: TGroupBox;
    Label40: TLabel;
    edOBDIIModuleFuelModuleValue: TEdit;
    gbOBDIIModuleTachometerModule: TGroupBox;
    Label41: TLabel;
    edOBDIIModuleTachometerModuleValue: TEdit;
    gbOBDIIModuleSpeedometerModule: TGroupBox;
    Label42: TLabel;
    edOBDIIModuleSpeedometerModuleValue: TEdit;
    gbOBDIIModuleMILAlertModule: TGroupBox;
    Label43: TLabel;
    edOBDIIModuleMILAlertModuleAlertCodes: TEdit;
    gbOBDIIModuleOdometerModule: TGroupBox;
    Label44: TLabel;
    edOBDIIModuleOdometerModuleValue: TEdit;
    Label45: TLabel;
    edOBDIIModuleStateModuleVIN: TEdit;
    gbStatusModule: TGroupBox;
    cbStatusModuleIsMotion: TCheckBox;
    cbStatusModuleIsStop: TCheckBox;
    cbStatusModuleIsIdle: TCheckBox;
    Label46: TLabel;
    edOBDIIModuleStateModuleEnforaPKG: TEdit;
    cbOBDIIModuleBatteryModuleIsLow: TCheckBox;
    cbOBDIIModuleFuelModuleIsLow: TCheckBox;
    cbStatusModuleIsMIL: TCheckBox;
    N1: TMenuItem;
    Devicecontrolpanel1: TMenuItem;
    cbGPSModuleIsActive: TCheckBox;
    procedure edGeoSpaceIDKeyPress(Sender: TObject; var Key: Char);
    procedure edVisualizationTypeKeyPress(Sender: TObject; var Key: Char);
    procedure edVisualizationIDKeyPress(Sender: TObject; var Key: Char);
    procedure edHintIDKeyPress(Sender: TObject; var Key: Char);
    procedure edConnectionModuleCheckpointIntervalKeyPress(Sender: TObject;
      var Key: Char);
    procedure edGPSModuleDistanceThresholdKeyPress(Sender: TObject;
      var Key: Char);
    procedure bbUpdatePanelClick(Sender: TObject);
    procedure cbGPSModuleDatumIDChange(Sender: TObject);
    procedure UpdaterTimer(Sender: TObject);
    procedure edUserAlertIDKeyPress(Sender: TObject; var Key: Char);
    procedure edOnlineFlagIDKeyPress(Sender: TObject; var Key: Char);
    procedure edConnectionModuleServiceProviderIDKeyPress(Sender: TObject;
      var Key: Char);
    procedure edConnectionModuleServiceNumberKeyPress(Sender: TObject;
      var Key: Char);
    procedure edDeviceDescriptorVendorIDKeyPress(Sender: TObject;
      var Key: Char);
    procedure edDeviceDescriptorModelIDKeyPress(Sender: TObject;
      var Key: Char);
    procedure edDeviceDescriptorSerialNumberKeyPress(Sender: TObject;
      var Key: Char);
    procedure edDeviceDescriptorProductionDateKeyPress(Sender: TObject;
      var Key: Char);
    procedure edDeviceDescriptorHWVersionKeyPress(Sender: TObject;
      var Key: Char);
    procedure edDeviceDescriptorSWVersionKeyPress(Sender: TObject;
      var Key: Char);
    procedure edLocationIsAvailableFlagIDKeyPress(Sender: TObject;
      var Key: Char);
    procedure Geographserverobjecttracing1Click(Sender: TObject);
    procedure Geographservercontroltracing1Click(Sender: TObject);
    procedure sbGeoSpaceClick(Sender: TObject);
    procedure cbStatusModuleIsMotionClick(Sender: TObject);
    procedure Devicecontrolpanel1Click(Sender: TObject);
    procedure cbGPSModuleIsActiveClick(Sender: TObject);
  private
    { Private declarations }
    Model: TEnforaMT3000ObjectModel;
    flUpdating: boolean;
    ObjectRootComponent: TEnforaMT3000ObjectComponent;
    DeviceRootComponent: TEnforaMT3000ObjectDeviceComponent;
  public
    { Public declarations }

    Constructor Create(const pModel: TEnforaMT3000ObjectModel);
    Destructor Destroy(); override;
    procedure Update; override;
  end;


implementation
{$IFNDEF Plugin}
uses
  unitGeoGraphServerLogPanel,
  GeoTransformations,
  unitTGeoSpaceInstanceSelector,
  unitEnforaMT3000ObjectControlModulePanel;
{$ELSE}
uses
  unitGeoGraphServerLogPanel,
  unitTGeoSpaceInstanceSelector,
  unitEnforaMT3000ObjectControlModulePanel;

Type
  TEllipsoid = record
    ID: integer;
    DatumName: string;
    Ellipsoide_EquatorialRadius: Extended;
    Ellipsoid_EccentricitySquared: Extended;
  end;

Const //. well-known Datums definition
  DatumsCount = 24;
  Datums: array[0..DatumsCount-1] of TEllipsoid = (
    (ID: -1;    DatumName: 'Placeholder';           Ellipsoide_EquatorialRadius: 0;            Ellipsoid_EccentricitySquared: 0), //. to allow array indices to match id numbers
    (ID: 1;     DatumName: 'Airy';                  Ellipsoide_EquatorialRadius: 6377563.0;    Ellipsoid_EccentricitySquared: 0.00667054),
    (ID: 2;     DatumName: 'Australian National';   Ellipsoide_EquatorialRadius: 6378160.0;    Ellipsoid_EccentricitySquared: 0.006694542),
    (ID: 3;     DatumName: 'Bessel 1841';           Ellipsoide_EquatorialRadius: 6377397.0;    Ellipsoid_EccentricitySquared: 0.006674372),
    (ID: 4;     DatumName: 'Bessel 1841 (Nambia)';  Ellipsoide_EquatorialRadius: 6377484.0;    Ellipsoid_EccentricitySquared: 0.006674372),
    (ID: 5;     DatumName: 'Clarke 1866';           Ellipsoide_EquatorialRadius: 6378206.0;    Ellipsoid_EccentricitySquared: 0.006768658),
    (ID: 6;     DatumName: 'Clarke 1880';           Ellipsoide_EquatorialRadius: 6378249.0;    Ellipsoid_EccentricitySquared: 0.006803511),
    (ID: 7;     DatumName: 'Everest';               Ellipsoide_EquatorialRadius: 6377276.0;    Ellipsoid_EccentricitySquared: 0.006637847),
    (ID: 8;     DatumName: 'Fischer 1960 (Mercury)';Ellipsoide_EquatorialRadius: 6378166.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 9;     DatumName: 'Fischer 1968';          Ellipsoide_EquatorialRadius: 6378150.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 10;    DatumName: 'GRS-1967';              Ellipsoide_EquatorialRadius: 6378160.0;    Ellipsoid_EccentricitySquared: 0.006694605),
    (ID: 11;    DatumName: 'GRS-1980';              Ellipsoide_EquatorialRadius: 6378137.0;    Ellipsoid_EccentricitySquared: 0.00669438),
    (ID: 12;    DatumName: 'Helmert 1906';          Ellipsoide_EquatorialRadius: 6378200.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 13;    DatumName: 'Hough';                 Ellipsoide_EquatorialRadius: 6378270.0;    Ellipsoid_EccentricitySquared: 0.00672267),
    (ID: 14;    DatumName: 'International';         Ellipsoide_EquatorialRadius: 6378388.0;    Ellipsoid_EccentricitySquared: 0.00672267),
    (ID: 15;    DatumName: 'SK-42';                 Ellipsoide_EquatorialRadius: 6378245.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 16;    DatumName: 'Modified Airy';         Ellipsoide_EquatorialRadius: 6377340.0;    Ellipsoid_EccentricitySquared: 0.00667054),
    (ID: 17;    DatumName: 'Modified Everest';      Ellipsoide_EquatorialRadius: 6377304.0;    Ellipsoid_EccentricitySquared: 0.006637847),
    (ID: 18;    DatumName: 'Modified Fischer 1960'; Ellipsoide_EquatorialRadius: 6378155.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 19;    DatumName: 'South American 1969';   Ellipsoide_EquatorialRadius: 6378160.0;    Ellipsoid_EccentricitySquared: 0.006694542),
    (ID: 20;    DatumName: 'WGS-60';                Ellipsoide_EquatorialRadius: 6378165.0;    Ellipsoid_EccentricitySquared: 0.006693422),
    (ID: 21;    DatumName: 'WGS-66';                Ellipsoide_EquatorialRadius: 6378145.0;    Ellipsoid_EccentricitySquared: 0.006694542),
    (ID: 22;    DatumName: 'WGS-72';                Ellipsoide_EquatorialRadius: 6378135.0;    Ellipsoid_EccentricitySquared: 0.006694318),
    (ID: 23;    DatumName: 'WGS-84';                Ellipsoide_EquatorialRadius: 6378137.0;    Ellipsoid_EccentricitySquared: 0.00669438)
  );
{$ENDIF}

{$R *.dfm}


Constructor TEnforaMT3000ObjectControlPanel.Create(const pModel: TEnforaMT3000ObjectModel);
var
  I: integer;
begin
Inherited Create(pModel);
Model:=pModel;
flUpdating:=false;
ObjectRootComponent:=TEnforaMT3000ObjectComponent(Model.ObjectSchema.RootComponent);
DeviceRootComponent:=TEnforaMT3000ObjectDeviceComponent(Model.ObjectDeviceSchema.RootComponent);
//.
cbGPSModuleDatumID.Items.Clear;
for I:=0 to DatumsCount-1 do cbGPSModuleDatumID.Items.Add(Datums[I].DatumName);
cbGPSModuleDatumID.ItemIndex:=23; //. default: WGS-84
//.
ObjectRootComponent.ReadAllCUAC();
DeviceRootComponent.ReadAllCUAC();
//.
Update();
end;

Destructor TEnforaMT3000ObjectControlPanel.Destroy();
begin
Inherited;
end;

procedure TEnforaMT3000ObjectControlPanel.Update;
begin
flUpdating:=true;
Model.Lock.Enter();
try
//. update object schema side
edGeoSpaceID.Text:=IntToStr(ObjectRootComponent.GeoSpaceID.Value);
edVisualizationType.Text:=IntToStr(ObjectRootComponent.Visualization.Descriptor.Value.idTObj);
edVisualizationID.Text:=IntToStr(ObjectRootComponent.Visualization.Descriptor.Value.idObj);
edHintID.Text:=IntToStr(ObjectRootComponent.Hint.Value);
edUserAlertID.Text:=IntToStr(ObjectRootComponent.UserAlert.Value);
edOnlineFlagID.Text:=IntToStr(ObjectRootComponent.OnlineFlag.Value);
edLocationIsAvailableFlagID.Text:=IntToStr(ObjectRootComponent.LocationIsAvailableFlag.Value);
//. update object device schema side
edDeviceDescriptorVendorID.Text:=IntToStr(DeviceRootComponent.DeviceDescriptor.Vendor.Value);
edDeviceDescriptorModelID.Text:=IntToStr(DeviceRootComponent.DeviceDescriptor.Model.Value);
edDeviceDescriptorSerialNumber.Text:=IntToStr(DeviceRootComponent.DeviceDescriptor.SerialNumber.Value);
edDeviceDescriptorProductionDate.Text:=FormatDateTime('DD/MM/YYYY',DeviceRootComponent.DeviceDescriptor.ProductionDate.Value);
edDeviceDescriptorHWVersion.Text:=IntToStr(DeviceRootComponent.DeviceDescriptor.HWVersion.Value);
edDeviceDescriptorSWVersion.Text:=IntToStr(DeviceRootComponent.DeviceDescriptor.SWVersion.Value);
edDeviceDescriptorFOTA.Text:=DeviceRootComponent.DeviceDescriptor.FOTA.Value;
//.
edBatteryModuleVoltage.Text:=IntToStr(DeviceRootComponent.BatteryModule.Voltage.Value.Value);
edBatteryModuleCharge.Text:=IntToStr(DeviceRootComponent.BatteryModule.Charge.Value.Value);
cbBatteryModuleIsExternalPower.Checked:=DeviceRootComponent.BatteryModule.IsExternalPower.BoolValue.Value;
cbBatteryModuleIsLowPowerMode.Checked:=DeviceRootComponent.BatteryModule.IsLowPowerMode.BoolValue.Value;
//.
edConnectionModuleCheckpointInterval.Text:=IntToStr(DeviceRootComponent.ConnectionModule.CheckPointInterval.Value);
edConnectionModuleLastCheckpointTime.Text:=FormatDateTime('DD/MM/YY HH:NN:SS',TDateTime(DeviceRootComponent.ConnectionModule.LastCheckpointTime.Value)+TimeZoneDelta);
edConnectionModuleServiceProviderID.Text:=IntToStr(DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value);
edConnectionModuleServiceNumber.Text:=FormatFloat('0',DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value);
edConnectionModuleServiceProviderAccount.Text:=IntToStr(DeviceRootComponent.ConnectionModule.ServiceProvider.Account.Value.Value);
edConnectionModuleServiceProviderSignal.Text:=IntToStr(DeviceRootComponent.ConnectionModule.ServiceProvider.Signal.Value.Value);
if (Model.IsObjectOnline)
 then begin
  lbConnectionModuleStatus.Caption:='Online';
  stConnectionModuleStatus.Color:=clGreen;
  end
 else begin
  lbConnectionModuleStatus.Caption:='offline';
  stConnectionModuleStatus.Color:=clGray;
  end;
//.
cbGPSModuleIsActive.Checked:=DeviceRootComponent.GPSModule.IsActive.BoolValue.Value;
if ((1 <= DeviceRootComponent.GPSModule.DatumID.Value) AND (DeviceRootComponent.GPSModule.DatumID.Value < cbGPSModuleDatumID.Items.Count))
 then cbGPSModuleDatumID.ItemIndex:=DeviceRootComponent.GPSModule.DatumID.Value
 else cbGPSModuleDatumID.ItemIndex:=-1;
edGPSModuleDatumID.Text:=IntToStr(DeviceRootComponent.GPSModule.DatumID.Value);
edGPSModuleFixLatitude.Text:=FormatFloat('0.00000',DeviceRootComponent.GPSModule.GPSFixData.Value.Latitude);
edGPSModuleFixLongitude.Text:=FormatFloat('0.00000',DeviceRootComponent.GPSModule.GPSFixData.Value.Longitude);
edGPSModuleFixAltitude.Text:=FormatFloat('0.00000',DeviceRootComponent.GPSModule.GPSFixData.Value.Altitude);
edGPSModuleFixSpeed.Text:=FormatFloat('0.00000',DeviceRootComponent.GPSModule.GPSFixData.Value.Speed);
edGPSModuleFixBearing.Text:=FormatFloat('0.00000',DeviceRootComponent.GPSModule.GPSFixData.Value.Bearing);
edGPSModuleFixPrecision.Text:=FormatFloat('0.00000',DeviceRootComponent.GPSModule.GPSFixData.Value.Precision);
edGPSModuleFixTime.Text:=FormatDateTime('DD/MM/YY HH:NN:SS',TDateTime(DeviceRootComponent.GPSModule.GPSFixData.Value.TimeStamp)+TimeZoneDelta);
edGPSModuleDistanceThreshold.Text:=IntToStr(DeviceRootComponent.GPSModule.DistanceThreshold.Value);
//.
cbStatusModuleIsStop.Checked:=DeviceRootComponent.StatusModule.IsStop.BoolValue.Value;
cbStatusModuleIsIdle.Checked:=DeviceRootComponent.StatusModule.IsIdle.BoolValue.Value;
cbStatusModuleIsMotion.Checked:=DeviceRootComponent.StatusModule.IsMotion.BoolValue.Value;
cbStatusModuleIsMIL.Checked:=DeviceRootComponent.StatusModule.IsMIL.BoolValue.Value;
//.
edAccelerometerModuleValue.Text:=FormatFloat('0.0',DeviceRootComponent.AccelerometerModule.Value.Value.Value);
cbAccelerometerModuleIsCalibrated.Checked:=DeviceRootComponent.AccelerometerModule.IsCalibrated.BoolValue.Value;
//.
cbIgnitionModuleValue.Checked:=DeviceRootComponent.IgnitionModule.Value.BoolValue.Value;
//.
cbTowAlertModuleValue.Checked:=DeviceRootComponent.TowAlertModule.Value.BoolValue.Value;
//.
cbOBDIIModuleStateModuleIsPresent.Checked:=DeviceRootComponent.OBDIIModule.StateModule.IsPresented.BoolValue.Value;
gbOBDIIModule.Enabled:=true; ///? cbOBDIIModuleStateModuleIsPresent.Checked;
if (true) ///? (gbOBDIIModule.Enabled)
 then begin
  edOBDIIModuleStateModuleProtocol.Text:=OBDProtocolName(DeviceRootComponent.OBDIIModule.StateModule.Protocol.Value.Value);
  edOBDIIModuleStateModuleVIN.Text:=DeviceRootComponent.OBDIIModule.StateModule.VIN.Value.Value;
  edOBDIIModuleStateModuleEnforaPKG.Text:=IntToStr(DeviceRootComponent.OBDIIModule.StateModule.EnforaPKG.Value.Value);
  //.
  edOBDIIModuleBatteryModuleValue.Text:=FormatFloat('0.00',DeviceRootComponent.OBDIIModule.BatteryModule.Value.Value.Value);
  cbOBDIIModuleBatteryModuleIsLow.Checked:=DeviceRootComponent.OBDIIModule.BatteryModule.IsLow.BoolValue.Value;
  //.
  edOBDIIModuleFuelModuleValue.Text:=FormatFloat('0.000',DeviceRootComponent.OBDIIModule.FuelModule.Value.Value.Value);
  cbOBDIIModuleFuelModuleIsLow.Checked:=DeviceRootComponent.OBDIIModule.FuelModule.IsLow.BoolValue.Value;
  //.
  edOBDIIModuleTachometerModuleValue.Text:=FormatFloat('0.0',DeviceRootComponent.OBDIIModule.TachometerModule.Value.Value.Value);
  //.
  edOBDIIModuleSpeedometerModuleValue.Text:=FormatFloat('0.0',DeviceRootComponent.OBDIIModule.SpeedometerModule.Value.Value.Value);
  //.
  edOBDIIModuleMILAlertModuleAlertCodes.Text:=DeviceRootComponent.OBDIIModule.MILAlertModule.AlertCodes.Value.Value;
  if (edOBDIIModuleMILAlertModuleAlertCodes.Text = '')
   then edOBDIIModuleMILAlertModuleAlertCodes.Color:=clBtnFace
   else edOBDIIModuleMILAlertModuleAlertCodes.Color:=clRed;
  //.
  edOBDIIModuleOdometerModuleValue.Text:=FormatFloat('0.0',DeviceRootComponent.OBDIIModule.OdometerModule.Value.Value.Value);
  end;
finally
Model.Lock.Leave();
flUpdating:=false;
end;
end;

procedure TEnforaMT3000ObjectControlPanel.edGeoSpaceIDKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter;
  try
  ObjectRootComponent.GeoSpaceID.Value:=StrToInt(edGeoSpaceID.Text);
  finally
  Model.Lock.Leave;
  end;
  ObjectRootComponent.GeoSpaceID.WriteCUAC();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TEnforaMT3000ObjectControlPanel.sbGeoSpaceClick(Sender: TObject);
var
  GeoSpaceID: integer;
  GeoSpaceName: string;
  SC: TCursor;
begin
with TfmTGeoSpaceInstanceSelector.Create() do
try
if (Select(GeoSpaceID,GeoSpaceName))
 then begin
  edGeoSpaceID.Text:=IntToStr(GeoSpaceID);
  //.
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter;
  try
  ObjectRootComponent.GeoSpaceID.Value:=GeoSpaceID;
  finally
  Model.Lock.Leave;
  end;
  ObjectRootComponent.GeoSpaceID.WriteCUAC();
  finally
  Screen.Cursor:=SC;
  end;
  end
finally
Destroy();
end;
end;

procedure TEnforaMT3000ObjectControlPanel.edVisualizationTypeKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter;
  try
  ObjectRootComponent.Visualization.Descriptor.Value.idTObj:=StrToInt(edVisualizationType.Text);
  finally
  Model.Lock.Leave;
  end;
  ObjectRootComponent.Visualization.Descriptor.WriteCUAC();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TEnforaMT3000ObjectControlPanel.edVisualizationIDKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter;
  try
  ObjectRootComponent.Visualization.Descriptor.Value.idObj:=StrToInt(edVisualizationID.Text);
  finally
  Model.Lock.Leave;
  end;
  ObjectRootComponent.Visualization.Descriptor.WriteCUAC();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TEnforaMT3000ObjectControlPanel.edHintIDKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter;
  try
  ObjectRootComponent.Hint.Value:=StrToInt(edHintID.Text);
  finally
  Model.Lock.Leave;
  end;
  ObjectRootComponent.Hint.WriteCUAC();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TEnforaMT3000ObjectControlPanel.edUserAlertIDKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter;
  try
  ObjectRootComponent.UserAlert.Value:=StrToInt(edUserAlertID.Text);
  finally
  Model.Lock.Leave;
  end;
  ObjectRootComponent.UserAlert.WriteCUAC();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TEnforaMT3000ObjectControlPanel.edOnlineFlagIDKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter;
  try
  ObjectRootComponent.OnlineFlag.Value:=StrToInt(edOnlineFlagID.Text);
  finally
  Model.Lock.Leave;
  end;
  ObjectRootComponent.OnlineFlag.WriteCUAC();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TEnforaMT3000ObjectControlPanel.edLocationIsAvailableFlagIDKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter;
  try
  ObjectRootComponent.LocationIsAvailableFlag.Value:=StrToInt(edLocationIsAvailableFlagID.Text);
  finally
  Model.Lock.Leave;
  end;
  ObjectRootComponent.LocationIsAvailableFlag.WriteCUAC();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TEnforaMT3000ObjectControlPanel.edDeviceDescriptorVendorIDKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key <> #$0D) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Vendor.Value:=StrToInt(edDeviceDescriptorVendorID.Text);
finally
Model.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Vendor.WriteCUAC();
finally
Screen.Cursor:=SC;
end;
end;

procedure TEnforaMT3000ObjectControlPanel.edDeviceDescriptorModelIDKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key <> #$0D) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Model.Value:=StrToInt(edDeviceDescriptorModelID.Text);
finally
Model.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Model.WriteCUAC();
finally
Screen.Cursor:=SC;
end;
end;

procedure TEnforaMT3000ObjectControlPanel.edDeviceDescriptorSerialNumberKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key <> #$0D) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SerialNumber.Value:=StrToInt(edDeviceDescriptorSerialNumber.Text);
finally
Model.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SerialNumber.WriteCUAC();
finally
Screen.Cursor:=SC;
end;
end;

procedure TEnforaMT3000ObjectControlPanel.edDeviceDescriptorProductionDateKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key <> #$0D) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.ProductionDate.Value:=StrToDateTime(edDeviceDescriptorProductionDate.Text);
finally
Model.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.ProductionDate.WriteCUAC();
finally
Screen.Cursor:=SC;
end;
end;

procedure TEnforaMT3000ObjectControlPanel.edDeviceDescriptorHWVersionKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key <> #$0D) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.HWVersion.Value:=StrToInt(edDeviceDescriptorHWVersion.Text);
finally
Model.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.HWVersion.WriteCUAC();
finally
Screen.Cursor:=SC;
end;
end;

procedure TEnforaMT3000ObjectControlPanel.edDeviceDescriptorSWVersionKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key <> #$0D) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SWVersion.Value:=StrToInt(edDeviceDescriptorSWVersion.Text);
finally
Model.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SWVersion.WriteCUAC();
finally
Screen.Cursor:=SC;
end;
end;

procedure TEnforaMT3000ObjectControlPanel.edConnectionModuleCheckpointIntervalKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  if ((NOT Model.IsObjectOnline) AND (MessageDlg('Object is offline.'#$0D#$0A'Do you want to set it on the server side ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes))
   then begin
    SC:=Screen.Cursor;
    try
    Screen.Cursor:=crHourGlass;
    Model.Lock.Enter;
    try
    DeviceRootComponent.ConnectionModule.CheckPointInterval.Value:=StrToInt(edConnectionModuleCheckpointInterval.Text);
    finally
    Model.Lock.Leave;
    end;
    DeviceRootComponent.ConnectionModule.CheckPointInterval.WriteCUAC();
    finally
    Screen.Cursor:=SC;
    end;
    end
   else begin
    SC:=Screen.Cursor;
    try
    Screen.Cursor:=crHourGlass;
    Model.Lock.Enter;
    try
    DeviceRootComponent.ConnectionModule.CheckPointInterval.Value:=StrToInt(edConnectionModuleCheckpointInterval.Text);
    finally
    Model.Lock.Leave;
    end;
    DeviceRootComponent.ConnectionModule.CheckPointInterval.WriteDeviceCUAC();
    finally
    Screen.Cursor:=SC;
    end;
    end;
  end;
end;

procedure TEnforaMT3000ObjectControlPanel.edConnectionModuleServiceProviderIDKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key <> #$0D) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value:=StrToInt(edConnectionModuleServiceProviderID.Text);
finally
Model.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.WriteCUAC();
finally
Screen.Cursor:=SC;
end;
end;

procedure TEnforaMT3000ObjectControlPanel.edConnectionModuleServiceNumberKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key <> #$0D) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value:=StrToFloat(edConnectionModuleServiceNumber.Text);
finally
Model.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.WriteCUAC();
finally
Screen.Cursor:=SC;
end;
end;

procedure TEnforaMT3000ObjectControlPanel.cbGPSModuleIsActiveClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
flUpdating:=true;
try
TCheckBox(Sender).Checked:=(NOT TCheckBox(Sender).Checked);
finally
flUpdating:=false;
end;
end;

procedure TEnforaMT3000ObjectControlPanel.cbGPSModuleDatumIDChange(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.GPSModule.DatumID.Value:=cbGPSModuleDatumID.ItemIndex;
finally
Model.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DatumID.WriteCUAC();
//.
Model.Lock.Enter;
try
edGPSModuleDatumID.Text:=IntToStr(DeviceRootComponent.GPSModule.DatumID.Value);
finally
Model.Lock.Leave;
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TEnforaMT3000ObjectControlPanel.edGPSModuleDistanceThresholdKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  if ((NOT Model.IsObjectOnline) AND (MessageDlg('Object is offline.'#$0D#$0A'Do you want to set it on the server side ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes))
   then begin
    SC:=Screen.Cursor;
    try
    Screen.Cursor:=crHourGlass;
    Model.Lock.Enter;
    try
    DeviceRootComponent.GPSModule.DistanceThreshold.Value:=StrToInt(edGPSModuleDistanceThreshold.Text);
    finally
    Model.Lock.Leave;
    end;
    DeviceRootComponent.GPSModule.DistanceThreshold.WriteCUAC();
    finally
    Screen.Cursor:=SC;
    end;
    end
   else begin
    SC:=Screen.Cursor;
    try
    Screen.Cursor:=crHourGlass;
    Model.Lock.Enter;
    try
    DeviceRootComponent.GPSModule.DistanceThreshold.Value:=StrToInt(edGPSModuleDistanceThreshold.Text);
    finally
    Model.Lock.Leave;
    end;
    DeviceRootComponent.GPSModule.DistanceThreshold.WriteDeviceCUAC();
    finally
    Screen.Cursor:=SC;
    end;
    end;
  end;
end;

procedure TEnforaMT3000ObjectControlPanel.cbStatusModuleIsMotionClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
flUpdating:=true;
try
TCheckBox(Sender).Checked:=(NOT TCheckBox(Sender).Checked);
finally
flUpdating:=false;
end;
end;

procedure TEnforaMT3000ObjectControlPanel.bbUpdatePanelClick(Sender: TObject);
begin
//. update object model
ObjectRootComponent.ReadAllCUAC();
DeviceRootComponent.ReadAllCUAC();
//.
Update();
end;

procedure TEnforaMT3000ObjectControlPanel.UpdaterTimer(Sender: TObject);
begin
if (Model.IsObjectOnline())
 then begin
  lbConnectionModuleStatus.Caption:='Online';
  stConnectionModuleStatus.Color:=clGreen;
  end
 else begin
  lbConnectionModuleStatus.Caption:='offline';
  stConnectionModuleStatus.Color:=clGray;
  end;
end;

procedure TEnforaMT3000ObjectControlPanel.Geographserverobjecttracing1Click(Sender: TObject);
var
  SC: TCursor;
  LogDataStream: TMemoryStream;
  S: string;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.ObjectController.ServerOperation_GetLogData(1{ObjectServer},2{PlainText}, {out} LogDataStream);
try
SetLength(S,LogDataStream.Size);
LogDataStream.Position:=0;
LogDataStream.Read(Pointer(@S[1])^,Length(S));
finally
LogDataStream.Destroy;
end;
finally
Screen.Cursor:=SC;
end;
with TfmGeographServerLogPanel.Create() do begin
Caption:='Object Server';
memoLog.Text:=S;
Show();
end;
end;

procedure TEnforaMT3000ObjectControlPanel.Geographservercontroltracing1Click(Sender: TObject);
var
  SC: TCursor;
  LogDataStream: TMemoryStream;
  S: string;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.ObjectController.ServerOperation_GetLogData(2{ControlServer},2{PlainText}, {out} LogDataStream);
try
SetLength(S,LogDataStream.Size);
LogDataStream.Position:=0;
LogDataStream.Read(Pointer(@S[1])^,Length(S));
finally
LogDataStream.Destroy;
end;
finally
Screen.Cursor:=SC;
end;
with TfmGeographServerLogPanel.Create() do begin
Caption:='Control Server';
memoLog.Text:=S;
Show();
end;
end;

procedure TEnforaMT3000ObjectControlPanel.Devicecontrolpanel1Click(Sender: TObject);
begin
with TEnforaMT3000ObjectControlModulePanel.Create(Model) do
try
ShowModal();
finally
Destroy();
end;
end;


end.
