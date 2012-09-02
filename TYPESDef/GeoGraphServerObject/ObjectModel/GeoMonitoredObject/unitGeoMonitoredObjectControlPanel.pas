unit unitGeoMonitoredObjectControlPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  unitObjectModel,
  unitGeoMonitoredObjectModel,
  Buttons,
  unitUInt16BitMap, Menus;

type
  TGeoMonitoredObjectControlPanel = class(TObjectModelControlPanel)
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
    GroupBox2: TGroupBox;
    Label6: TLabel;
    edConnectionModuleCheckpointInterval: TEdit;
    Label7: TLabel;
    edConnectionModuleLastCheckpointTime: TEdit;
    GroupBox3: TGroupBox;
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
    gbGPIModule: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    edGeoSpaceID: TEdit;
    edGPIModuleValue: TEdit;
    bbUpdatePanel: TBitBtn;
    cbGPSModuleDatumID: TComboBox;
    lbConnectionModuleStatus: TLabel;
    stConnectionModuleStatus: TStaticText;
    Updater: TTimer;
    gbGPOModule: TGroupBox;
    edGPOModuleValue: TEdit;
    Label15: TLabel;
    edGPSModuleFixSpeed: TEdit;
    Label18: TLabel;
    edGPSModuleFixBearing: TEdit;
    GroupBox4: TGroupBox;
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
    GroupBox5: TGroupBox;
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
    gbADCModule: TGroupBox;
    edADCModuleValue: TEdit;
    gbDACModule: TGroupBox;
    edDACModuleValue: TEdit;
    sbGeoSpace: TSpeedButton;
    procedure edGeoSpaceIDKeyPress(Sender: TObject; var Key: Char);
    procedure edVisualizationTypeKeyPress(Sender: TObject; var Key: Char);
    procedure edVisualizationIDKeyPress(Sender: TObject; var Key: Char);
    procedure edHintIDKeyPress(Sender: TObject; var Key: Char);
    procedure edConnectionModuleCheckpointIntervalKeyPress(Sender: TObject;
      var Key: Char);
    procedure edGPSModuleDistanceThresholdKeyPress(Sender: TObject;
      var Key: Char);
    procedure edGPIModuleValueKeyPress(Sender: TObject; var Key: Char);
    procedure bbUpdatePanelClick(Sender: TObject);
    procedure cbGPSModuleDatumIDChange(Sender: TObject);
    procedure UpdaterTimer(Sender: TObject);
    procedure edGPOModuleValueKeyPress(Sender: TObject; var Key: Char);
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
  private
    { Private declarations }
    Model: TGeoMonitoredObjectModel;
    ObjectRootComponent: TGeoMonitoredObjectComponent;
    DeviceRootComponent: TGeoMonitoredObjectDeviceComponent;
    fmGPIModuleValueBitmap: TfmUInt16BitMap;
    fmGPOModuleValueBitmap: TfmUInt16BitMap;

    procedure fmGPIModuleValueBitMapValueSet(const Value: word);
    procedure fmGPIModuleValueBitMapValueSetBit(const Index: integer; const Value: boolean);
    procedure fmGPOModuleValueBitMapValueSet(const Value: word);
    procedure fmGPOModuleValueBitMapValueSetBit(const Index: integer; const Value: boolean);
  public
    { Public declarations }

    Constructor Create(const pModel: TGeoMonitoredObjectModel);
    procedure Update; override;
  end;


implementation
{$IFNDEF Plugin}
Uses
  unitGeoGraphServerLogPanel,
  unitTGeoSpaceInstanceSelector,
  GeoTransformations;
{$ELSE}
Uses
  unitGeoGraphServerLogPanel,
  unitTGeoSpaceInstanceSelector;

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


Constructor TGeoMonitoredObjectControlPanel.Create(const pModel: TGeoMonitoredObjectModel);
var
  I: integer;
begin
Inherited Create(pModel);
Model:=pModel;
ObjectRootComponent:=TGeoMonitoredObjectComponent(Model.ObjectSchema.RootComponent);
DeviceRootComponent:=TGeoMonitoredObjectDeviceComponent(Model.ObjectDeviceSchema.RootComponent);
//.
cbGPSModuleDatumID.Items.Clear;
for I:=0 to DatumsCount-1 do cbGPSModuleDatumID.Items.Add(Datums[I].DatumName);
cbGPSModuleDatumID.ItemIndex:=23; //. default: WGS-84
//.
fmGPIModuleValueBitmap:=TfmUInt16BitMap.Create(Self);
fmGPIModuleValueBitmap.OnSetBitEvent:=fmGPIModuleValueBitMapValueSetBit;
fmGPIModuleValueBitmap.Left:=8;
fmGPIModuleValueBitmap.Top:=16;                                       
fmGPIModuleValueBitmap.Width:=264;
fmGPIModuleValueBitmap.Parent:=gbGPIModule;
fmGPIModuleValueBitmap.Show();
//.
fmGPOModuleValueBitmap:=TfmUInt16BitMap.Create(Self);
fmGPOModuleValueBitmap.OnSetBitEvent:=fmGPOModuleValueBitMapValueSetBit;
fmGPOModuleValueBitmap.Left:=8;
fmGPOModuleValueBitmap.Top:=16;
fmGPOModuleValueBitmap.Width:=264;
fmGPOModuleValueBitmap.Parent:=gbGPOModule;
fmGPOModuleValueBitmap.Show();
//.
ObjectRootComponent.ReadAll();
DeviceRootComponent.ReadAll();
//.
Update();
end;

procedure TGeoMonitoredObjectControlPanel.Update;
begin
Model.Lock.Enter;
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
edConnectionModuleCheckpointInterval.Text:=IntToStr(DeviceRootComponent.ConnectionModule.CheckPointInterval.Value);
edConnectionModuleLastCheckpointTime.Text:=FormatDateTime('DD/MM/YY HH:NN:SS',TDateTime(DeviceRootComponent.ConnectionModule.LastCheckpointTime.Value)+TimeZoneDelta);
edConnectionModuleServiceProviderID.Text:=IntToStr(DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value);
edConnectionModuleServiceNumber.Text:=FormatFloat('0',DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value);
edConnectionModuleServiceProviderAccount.Text:=IntToStr(DeviceRootComponent.ConnectionModule.ServiceProvider.Account.Value);
edConnectionModuleServiceProviderSignal.Text:=IntToStr(DeviceRootComponent.ConnectionModule.ServiceProvider.Signal.Value);
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
edGPIModuleValue.Text:=IntToStr(DeviceRootComponent.GPIModule.Value.Value);
fmGPIModuleValueBitmap.Value:=DeviceRootComponent.GPIModule.Value.Value;
//.
edGPOModuleValue.Text:=IntToStr(DeviceRootComponent.GPOModule.Value.Value);
fmGPOModuleValueBitmap.Value:=DeviceRootComponent.GPOModule.Value.Value;
//.
edADCModuleValue.Text:=DeviceRootComponent.ADCModule.Value.ToString();
//.
edDACModuleValue.Text:=DeviceRootComponent.DACModule.Value.ToString();
//.
edBatteryModuleVoltage.Text:=IntToStr(DeviceRootComponent.BatteryModule.Voltage.Value);
edBatteryModuleCharge.Text:=IntToStr(DeviceRootComponent.BatteryModule.Charge.Value);
finally
Model.Lock.Leave;
end;
end;

procedure TGeoMonitoredObjectControlPanel.edGeoSpaceIDKeyPress(Sender: TObject; var Key: Char);
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
  ObjectRootComponent.GeoSpaceID.Write();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.sbGeoSpaceClick(Sender: TObject);
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

procedure TGeoMonitoredObjectControlPanel.edVisualizationTypeKeyPress(Sender: TObject; var Key: Char);
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
  ObjectRootComponent.Visualization.Descriptor.Write();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.edVisualizationIDKeyPress(Sender: TObject; var Key: Char);
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
  ObjectRootComponent.Visualization.Descriptor.Write();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.edHintIDKeyPress(Sender: TObject; var Key: Char);
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
  ObjectRootComponent.Hint.Write();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.edUserAlertIDKeyPress(Sender: TObject; var Key: Char);
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
  ObjectRootComponent.UserAlert.Write();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.edOnlineFlagIDKeyPress(Sender: TObject; var Key: Char);
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
  ObjectRootComponent.OnlineFlag.Write();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.edLocationIsAvailableFlagIDKeyPress(Sender: TObject; var Key: Char);
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
  ObjectRootComponent.LocationIsAvailableFlag.Write();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.edDeviceDescriptorVendorIDKeyPress(Sender: TObject; var Key: Char);
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
DeviceRootComponent.DeviceDescriptor.Vendor.Write();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObjectControlPanel.edDeviceDescriptorModelIDKeyPress(Sender: TObject; var Key: Char);
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
DeviceRootComponent.DeviceDescriptor.Model.Write();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObjectControlPanel.edDeviceDescriptorSerialNumberKeyPress(Sender: TObject; var Key: Char);
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
DeviceRootComponent.DeviceDescriptor.SerialNumber.Write();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObjectControlPanel.edDeviceDescriptorProductionDateKeyPress(Sender: TObject; var Key: Char);
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
DeviceRootComponent.DeviceDescriptor.ProductionDate.Write();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObjectControlPanel.edDeviceDescriptorHWVersionKeyPress(Sender: TObject; var Key: Char);
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
DeviceRootComponent.DeviceDescriptor.HWVersion.Write();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObjectControlPanel.edDeviceDescriptorSWVersionKeyPress(Sender: TObject; var Key: Char);
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
DeviceRootComponent.DeviceDescriptor.SWVersion.Write();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObjectControlPanel.edConnectionModuleCheckpointIntervalKeyPress(Sender: TObject; var Key: Char);
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
    DeviceRootComponent.ConnectionModule.CheckPointInterval.Write();
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
    DeviceRootComponent.ConnectionModule.CheckPointInterval.WriteDevice();
    finally
    Screen.Cursor:=SC;
    end;
    end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.edConnectionModuleServiceProviderIDKeyPress(Sender: TObject; var Key: Char);
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
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Write();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObjectControlPanel.edConnectionModuleServiceNumberKeyPress(Sender: TObject; var Key: Char);
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
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Write();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObjectControlPanel.cbGPSModuleDatumIDChange(Sender: TObject);
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
DeviceRootComponent.GPSModule.DatumID.Write();
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

procedure TGeoMonitoredObjectControlPanel.edGPSModuleDistanceThresholdKeyPress(Sender: TObject; var Key: Char);
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
    DeviceRootComponent.GPSModule.DistanceThreshold.Write();
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
    DeviceRootComponent.GPSModule.DistanceThreshold.WriteDevice();
    finally
    Screen.Cursor:=SC;
    end;
    end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.edGPIModuleValueKeyPress(Sender: TObject; var Key: Char);
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
  DeviceRootComponent.GPIModule.Value.Value:=StrToInt(edGPIModuleValue.Text);
  finally
  Model.Lock.Leave;
  end;
  DeviceRootComponent.GPIModule.Value.WriteDevice();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.edGPOModuleValueKeyPress(Sender: TObject; var Key: Char);
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
    DeviceRootComponent.GPOModule.Value.Value:=StrToInt(edGPOModuleValue.Text);
    finally
    Model.Lock.Leave;
    end;
    DeviceRootComponent.GPOModule.Value.Write();
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
    DeviceRootComponent.GPOModule.Value.Value:=StrToInt(edGPOModuleValue.Text);
    finally
    Model.Lock.Leave;
    end;
    DeviceRootComponent.GPOModule.Value.WriteDevice();
    finally
    Screen.Cursor:=SC;
    end;
    end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.fmGPIModuleValueBitMapValueSet(const Value: word);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.GPIModule.Value.Value:=Value;
finally
Model.Lock.Leave;
end;
DeviceRootComponent.GPIModule.Value.Write();
//.
Model.Lock.Enter;
try
edGPIModuleValue.Text:=IntToStr(DeviceRootComponent.GPIModule.Value.Value);
finally
Model.Lock.Leave;
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObjectControlPanel.fmGPIModuleValueBitMapValueSetBit(const Index: integer; const Value: boolean);
var
  W: word;
  Address: TAddress;
  SC: TCursor;
begin
W:=(1 SHL Index);
SetLength(Address,1);
Address[0]:=Index;
//.
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
if (Value)
 then DeviceRootComponent.GPIModule.Value.Value:=(DeviceRootComponent.GPIModule.Value.Value OR W)
 else DeviceRootComponent.GPIModule.Value.Value:=(DeviceRootComponent.GPIModule.Value.Value AND (NOT W));
finally
Model.Lock.Leave;
end;
DeviceRootComponent.GPIModule.Value.WriteByAddress(Address);
//.
Model.Lock.Enter;
try
edGPIModuleValue.Text:=IntToStr(DeviceRootComponent.GPIModule.Value.Value);
finally
Model.Lock.Leave;
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObjectControlPanel.fmGPOModuleValueBitMapValueSet(const Value: word);
var
  SC: TCursor;
begin
if ((NOT Model.IsObjectOnline) AND (MessageDlg('Object is offline.'#$0D#$0A'Do you want to set it on the server side ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes))
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter;
  try
  DeviceRootComponent.GPOModule.Value.Value:=Value;
  finally
  Model.Lock.Leave;
  end;
  DeviceRootComponent.GPOModule.Value.Write();
  //.
  Model.Lock.Enter;
  try
  edGPOModuleValue.Text:=IntToStr(DeviceRootComponent.GPOModule.Value.Value);
  finally
  Model.Lock.Leave;
  end;
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
  DeviceRootComponent.GPOModule.Value.Value:=Value;
  finally
  Model.Lock.Leave;
  end;
  DeviceRootComponent.GPOModule.Value.WriteDevice();
  //.
  Model.Lock.Enter;
  try
  edGPOModuleValue.Text:=IntToStr(DeviceRootComponent.GPOModule.Value.Value);
  finally
  Model.Lock.Leave;
  end;
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.fmGPOModuleValueBitMapValueSetBit(const Index: integer; const Value: boolean);
var
  W: word;
  Address: TAddress;
  SC: TCursor;
begin
W:=(1 SHL Index);
SetLength(Address,1);
Address[0]:=Index;
//.
if ((NOT Model.IsObjectOnline) AND (MessageDlg('Object is offline.'#$0D#$0A'Do you want to set it on the server side ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes))
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter;
  try
  if (Value)
   then DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value OR W)
   else DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value AND (NOT W));
  finally
  Model.Lock.Leave;
  end;
  DeviceRootComponent.GPOModule.Value.WriteByAddress(Address);
  //.
  Model.Lock.Enter;
  try
  edGPOModuleValue.Text:=IntToStr(DeviceRootComponent.GPOModule.Value.Value);
  finally
  Model.Lock.Leave;
  end;
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
  if (Value)
   then DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value OR W)
   else DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value AND (NOT W));
  finally
  Model.Lock.Leave;
  end;
  DeviceRootComponent.GPOModule.Value.WriteDeviceByAddress(Address);
  //.
  Model.Lock.Enter;
  try
  edGPOModuleValue.Text:=IntToStr(DeviceRootComponent.GPOModule.Value.Value);
  finally
  Model.Lock.Leave;
  end;
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObjectControlPanel.bbUpdatePanelClick(Sender: TObject);
begin
//. update object model
ObjectRootComponent.ReadAll();
DeviceRootComponent.ReadAll();
//.
Update();
end;

procedure TGeoMonitoredObjectControlPanel.UpdaterTimer(Sender: TObject);
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

procedure TGeoMonitoredObjectControlPanel.Geographserverobjecttracing1Click(Sender: TObject);
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

procedure TGeoMonitoredObjectControlPanel.Geographservercontroltracing1Click(Sender: TObject);
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


end.
