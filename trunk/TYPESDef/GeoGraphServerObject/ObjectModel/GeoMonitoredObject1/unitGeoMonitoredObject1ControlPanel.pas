unit unitGeoMonitoredObject1ControlPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  GlobalSpaceDefines,
  unitObjectModel,
  unitGEOGraphServerController,
  unitGeoMonitoredObject1Model,
  Buttons,
  unitUInt16BitMap, Menus;

type
  TGeoMonitoredObject1ControlPanel = class(TObjectModelControlPanel)
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
    edConnectorModuleCheckpointInterval: TEdit;
    Label7: TLabel;
    edConnectorModuleLastCheckpointTime: TEdit;
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
    gbGPIModule: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    edGeoSpaceID: TEdit;
    edGPIModuleValue: TEdit;
    bbUpdatePanel: TBitBtn;
    cbGPSModuleDatumID: TComboBox;
    lbConnectorModuleStatus: TLabel;
    stConnectorModuleStatus: TStaticText;
    Updater: TTimer;
    gbGPOModule: TGroupBox;
    edGPOModuleValue: TEdit;
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
    gbConnectorModuleServiceProvider: TGroupBox;
    edConnectorModuleServiceProviderAccount: TEdit;
    Label19: TLabel;
    Label26: TLabel;
    edConnectorModuleServiceProviderID: TEdit;
    Label27: TLabel;
    edConnectorModuleServiceProviderSignal: TEdit;
    Label28: TLabel;
    edConnectorModuleServiceNumber: TEdit;
    gbDescriptorModule: TGroupBox;
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
    gbVideoRecorderModule: TGroupBox;
    Label41: TLabel;
    edVideoRecorderModuleReceivers: TEdit;
    cbVideoRecorderModuleActive: TCheckBox;
    cbVideoRecorderModuleRecording: TCheckBox;
    Label36: TLabel;
    edVideoRecorderModuleSDP: TEdit;
    btnVideoRecorderModulePlayer: TBitBtn;
    cbVideoRecorderModuleAudio: TCheckBox;
    cbVideoRecorderModuleVideo: TCheckBox;
    cbVideoRecorderModuleTransmitting: TCheckBox;
    cbVideoRecorderModuleSaving: TCheckBox;
    btnFileSystem: TBitBtn;
    Label37: TLabel;
    edVideoRecorderModuleSavingServer: TEdit;
    sbGeoSpace: TSpeedButton;
    btnControlModule: TBitBtn;
    btnVideoRecorderModuleConfigurationPanel: TBitBtn;
    Label38: TLabel;
    edGPSModuleMode: TEdit;
    Label39: TLabel;
    edGPSModuleStatus: TEdit;
    btnConnectorModuleConfigurationPanel: TBitBtn;
    btnGPSModuleConfigurationPanel: TBitBtn;
    procedure edGeoSpaceIDKeyPress(Sender: TObject; var Key: Char);
    procedure edVisualizationTypeKeyPress(Sender: TObject; var Key: Char);
    procedure edVisualizationIDKeyPress(Sender: TObject; var Key: Char);
    procedure edHintIDKeyPress(Sender: TObject; var Key: Char);
    procedure edConnectorModuleCheckpointIntervalKeyPress(Sender: TObject;
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
    procedure edConnectorModuleServiceProviderIDKeyPress(Sender: TObject;
      var Key: Char);
    procedure edConnectorModuleServiceNumberKeyPress(Sender: TObject;
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
    procedure edVideoRecorderModuleReceiversKeyPress(Sender: TObject;
      var Key: Char);
    procedure edVideoRecorderModuleSDPKeyPress(Sender: TObject;
      var Key: Char);
    procedure cbVideoRecorderModuleRecordingClick(Sender: TObject);
    procedure cbVideoRecorderModuleAudioClick(Sender: TObject);
    procedure cbVideoRecorderModuleVideoClick(Sender: TObject);
    procedure btnVideoRecorderModulePlayerClick(Sender: TObject);
    procedure cbVideoRecorderModuleActiveClick(Sender: TObject);
    procedure cbVideoRecorderModuleTransmittingClick(Sender: TObject);
    procedure cbVideoRecorderModuleSavingClick(Sender: TObject);
    procedure btnFileSystemClick(Sender: TObject);
    procedure edVideoRecorderModuleSavingServerKeyPress(Sender: TObject;
      var Key: Char);
    procedure sbGeoSpaceClick(Sender: TObject);
    procedure btnControlModuleClick(Sender: TObject);
    procedure btnVideoRecorderModuleConfigurationPanelClick(
      Sender: TObject);
    procedure btnConnectorModuleConfigurationPanelClick(Sender: TObject);
    procedure btnGPSModuleConfigurationPanelClick(Sender: TObject);
  private
    { Private declarations }
    Model: TGeoMonitoredObject1Model;
    flUpdating: boolean;
    ObjectRootComponent: TGeoMonitoredObject1Component;
    DeviceRootComponent: TGeoMonitoredObject1DeviceComponent;
    fmGPIModuleValueBitmap: TfmUInt16BitMap;
    fmGPOModuleValueBitmap: TfmUInt16BitMap;
    VideoPlayer: TObject;

    procedure fmGPIModuleValueBitMapValueSet(const Value: word);
    procedure fmGPIModuleValueBitMapValueSetBit(const Index: integer; const Value: boolean);
    procedure fmGPOModuleValueBitMapValueSet(const Value: word);
    procedure fmGPOModuleValueBitMapValueSetBit(const Index: integer; const Value: boolean);
    procedure VideoPlayer_Restart();
    procedure VideoPlayer_Stop();
  public
    { Public declarations }

    Constructor Create(const pModel: TGeoMonitoredObject1Model);
    Destructor Destroy(); override;
    procedure Update; override;
  end;


implementation
{$IFNDEF Plugin}
uses
  unitProxySpace,
  unitGeoGraphServerLogPanel,
  GeoTransformations,
  unitTGeoSpaceInstanceSelector,
  unitGeoMonitoredObject1ConnectorConfigurationPanel,
  unitGeoMonitoredObject1GPSModuleConfigurationPanel,
  unitGeoMonitoredObject1VideoRecorderVisor,
  unitGeoMonitoredObject1VideoRecorderConfigurationPanel,
  unitGeoMonitoredObject1FileSystemExplorerPanel,
  unitGeoMonitoredObject1ControlModulePanel;
{$ELSE}
uses
  FunctionalityImport,
  unitGeoGraphServerLogPanel,
  unitTGeoSpaceInstanceSelector,
  unitGeoMonitoredObject1ConnectorConfigurationPanel,
  unitGeoMonitoredObject1GPSModuleConfigurationPanel,
  unitGeoMonitoredObject1VideoRecorderVisor,
  unitGeoMonitoredObject1VideoRecorderConfigurationPanel,
  unitGeoMonitoredObject1FileSystemExplorerPanel,
  unitGeoMonitoredObject1ControlModulePanel;

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


Constructor TGeoMonitoredObject1ControlPanel.Create(const pModel: TGeoMonitoredObject1Model);
var
  I: integer;
begin
Inherited Create(pModel);
Model:=pModel;
flUpdating:=false;
ObjectRootComponent:=TGeoMonitoredObject1Component(Model.ObjectSchema.RootComponent);
DeviceRootComponent:=TGeoMonitoredObject1DeviceComponent(Model.ObjectDeviceSchema.RootComponent);
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
VideoPlayer:=nil;
//.
ObjectRootComponent.ReadAllCUAC();
DeviceRootComponent.ReadAllCUAC();
//.
Update();
end;

Destructor TGeoMonitoredObject1ControlPanel.Destroy();
begin
VideoPlayer.Free();
Inherited;
end;

procedure TGeoMonitoredObject1ControlPanel.Update;
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
//.
edBatteryModuleVoltage.Text:=IntToStr(DeviceRootComponent.BatteryModule.Voltage.Value.Value);
edBatteryModuleCharge.Text:=IntToStr(DeviceRootComponent.BatteryModule.Charge.Value.Value);
//.
edConnectorModuleCheckpointInterval.Text:=IntToStr(DeviceRootComponent.ConnectorModule.CheckPointInterval.Value);
edConnectorModuleLastCheckpointTime.Text:=FormatDateTime('DD/MM/YY HH:NN:SS',TDateTime(DeviceRootComponent.ConnectorModule.LastCheckpointTime.Value)+TimeZoneDelta);
edConnectorModuleServiceProviderID.Text:=IntToStr(DeviceRootComponent.ConnectorModule.ServiceProvider.ProviderID.Value);
edConnectorModuleServiceNumber.Text:=FormatFloat('0',DeviceRootComponent.ConnectorModule.ServiceProvider.Number.Value);
edConnectorModuleServiceProviderAccount.Text:=IntToStr(DeviceRootComponent.ConnectorModule.ServiceProvider.Account.Value.Value);
edConnectorModuleServiceProviderSignal.Text:=IntToStr(DeviceRootComponent.ConnectorModule.ServiceProvider.Signal.Value.Value);
if (Model.IsObjectOnline)
 then begin
  lbConnectorModuleStatus.Caption:='Online';
  stConnectorModuleStatus.Color:=clGreen;
  end
 else begin
  lbConnectorModuleStatus.Caption:='offline';
  stConnectorModuleStatus.Color:=clGray;
  end;
//.
if (DeviceRootComponent.GPSModule.Mode.Value.Value > 0)
 then edGPSModuleMode.Text:='ON'
 else edGPSModuleMode.Text:='off'; 
if (DeviceRootComponent.GPSModule.Mode.Value.Timestamp > 0.0) then edGPSModuleMode.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.GPSModule.Mode.Value.Timestamp+TimeZoneDelta);
case TGPSModuleStatus(DeviceRootComponent.GPSModule.Status.Value.Value) of
GPSMODULESTATUS_PERMANENTLYUNAVAILABLE: edGPSModuleStatus.Text:='not available';
GPSMODULESTATUS_TEMPORARILYUNAVAILABLE: edGPSModuleStatus.Text:='temp not available';
GPSMODULESTATUS_UNKNOWN:                edGPSModuleStatus.Text:='?';
GPSMODULESTATUS_AVAILABLE:              edGPSModuleStatus.Text:='AVAILABLE';
else
  edGPSModuleMode.Text:='??';
end;
if (DeviceRootComponent.GPSModule.Status.Value.Timestamp > 0.0) then edGPSModuleStatus.Hint:='Set time: '+FormatDateTime('DD-MM-YYYY HH:NN:SS',DeviceRootComponent.GPSModule.Status.Value.Timestamp+TimeZoneDelta);
if ((1 <= DeviceRootComponent.GPSModule.DatumID.Value) AND (DeviceRootComponent.GPSModule.DatumID.Value < cbGPSModuleDatumID.Items.Count))
 then cbGPSModuleDatumID.ItemIndex:=DeviceRootComponent.GPSModule.DatumID.Value
 else cbGPSModuleDatumID.ItemIndex:=-1;
edGPSModuleDatumID.Text:=IntToStr(DeviceRootComponent.GPSModule.DatumID.Value);
edGPSModuleDistanceThreshold.Text:=IntToStr(DeviceRootComponent.GPSModule.DistanceThreshold.Value);
edGPSModuleFixTime.Text:=FormatDateTime('DD/MM/YY HH:NN:SS',TDateTime(DeviceRootComponent.GPSModule.GPSFixData.Value.TimeStamp)+TimeZoneDelta);
edGPSModuleFixLatitude.Text:=FormatFloat('0.00000',DeviceRootComponent.GPSModule.GPSFixData.Value.Latitude);
edGPSModuleFixLongitude.Text:=FormatFloat('0.00000',DeviceRootComponent.GPSModule.GPSFixData.Value.Longitude);
edGPSModuleFixAltitude.Text:=FormatFloat('0.00000',DeviceRootComponent.GPSModule.GPSFixData.Value.Altitude);
edGPSModuleFixSpeed.Text:=FormatFloat('0.00000',DeviceRootComponent.GPSModule.GPSFixData.Value.Speed);
edGPSModuleFixBearing.Text:=FormatFloat('0.00000',DeviceRootComponent.GPSModule.GPSFixData.Value.Bearing);
edGPSModuleFixPrecision.Text:=FormatFloat('0.00000',DeviceRootComponent.GPSModule.GPSFixData.Value.Precision);
//.
edGPIModuleValue.Text:=IntToStr(DeviceRootComponent.GPIModule.Value.Value.Value);
fmGPIModuleValueBitmap.Value:=DeviceRootComponent.GPIModule.Value.Value.Value;
//.
edGPOModuleValue.Text:=IntToStr(DeviceRootComponent.GPOModule.Value.Value.Value);
fmGPOModuleValueBitmap.Value:=DeviceRootComponent.GPOModule.Value.Value.Value;
//.
edADCModuleValue.Text:=DeviceRootComponent.ADCModule.Value.ToString();
//.
edDACModuleValue.Text:=DeviceRootComponent.DACModule.Value.ToString();
//.
cbVideoRecorderModuleActive.Checked:=DeviceRootComponent.VideoRecorderModule.Active.BoolValue.Value;
cbVideoRecorderModuleRecording.Checked:=DeviceRootComponent.VideoRecorderModule.Recording.BoolValue.Value;
cbVideoRecorderModuleAudio.Checked:=DeviceRootComponent.VideoRecorderModule.Audio.BoolValue.Value;
cbVideoRecorderModuleVideo.Checked:=DeviceRootComponent.VideoRecorderModule.Video.BoolValue.Value;
cbVideoRecorderModuleTransmitting.Checked:=DeviceRootComponent.VideoRecorderModule.Transmitting.BoolValue.Value;
cbVideoRecorderModuleSaving.Checked:=DeviceRootComponent.VideoRecorderModule.Saving.BoolValue.Value;
edVideoRecorderModuleSDP.Text:=DeviceRootComponent.VideoRecorderModule.SDP.Value.Value;
edVideoRecorderModuleReceivers.Text:=DeviceRootComponent.VideoRecorderModule.Receivers.Value.Value;
edVideoRecorderModuleSavingServer.Text:=DeviceRootComponent.VideoRecorderModule.SavingServer.Value.Value;
btnVideoRecorderModulePlayer.Enabled:=DeviceRootComponent.VideoRecorderModule.Recording.BoolValue.Value;
finally
Model.Lock.Leave();
flUpdating:=false;
end;
end;

procedure TGeoMonitoredObject1ControlPanel.edGeoSpaceIDKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.sbGeoSpaceClick(Sender: TObject);
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

procedure TGeoMonitoredObject1ControlPanel.edVisualizationTypeKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.edVisualizationIDKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.edHintIDKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.edUserAlertIDKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.edOnlineFlagIDKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.edLocationIsAvailableFlagIDKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.edDeviceDescriptorVendorIDKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.edDeviceDescriptorModelIDKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.edDeviceDescriptorSerialNumberKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.edDeviceDescriptorProductionDateKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.edDeviceDescriptorHWVersionKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.edDeviceDescriptorSWVersionKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.edConnectorModuleCheckpointIntervalKeyPress(Sender: TObject; var Key: Char);
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
    DeviceRootComponent.ConnectorModule.CheckPointInterval.Value:=StrToInt(edConnectorModuleCheckpointInterval.Text);
    finally
    Model.Lock.Leave;
    end;
    DeviceRootComponent.ConnectorModule.CheckPointInterval.WriteCUAC();
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
    DeviceRootComponent.ConnectorModule.CheckPointInterval.Value:=StrToInt(edConnectorModuleCheckpointInterval.Text);
    finally
    Model.Lock.Leave;
    end;
    DeviceRootComponent.ConnectorModule.CheckPointInterval.WriteDeviceCUAC();
    finally
    Screen.Cursor:=SC;
    end;
    end;
  end;
end;

procedure TGeoMonitoredObject1ControlPanel.edConnectorModuleServiceProviderIDKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key <> #$0D) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.ConnectorModule.ServiceProvider.ProviderID.Value:=StrToInt(edConnectorModuleServiceProviderID.Text);
finally
Model.Lock.Leave;
end;
DeviceRootComponent.ConnectorModule.ServiceProvider.ProviderID.WriteCUAC();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1ControlPanel.edConnectorModuleServiceNumberKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key <> #$0D) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.ConnectorModule.ServiceProvider.Number.Value:=StrToFloat(edConnectorModuleServiceNumber.Text);
finally
Model.Lock.Leave;
end;
DeviceRootComponent.ConnectorModule.ServiceProvider.Number.WriteCUAC();
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1ControlPanel.btnConnectorModuleConfigurationPanelClick(Sender: TObject);
var
  SC: TCursor;
  ConfigurationData: TByteArray;
  Configuration: TConnectorModuleConfiguration;
  flApply: boolean;
begin
if (NOT Model.IsObjectOnline) then Raise Exception.Create('Could not edit configuration: îbject is offline.'); //. =>
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
ConfigurationData:=Model.ConnectorModule_GetConfiguration();
finally
Screen.Cursor:=SC;
end;
Configuration:=TConnectorModuleConfiguration.Create(ConfigurationData);
try
with TGeoMonitoredObject1ConnectorConfigurationPanel.Create(Configuration) do
try
flApply:=Dialog();
finally
Destroy();
end;
if (flApply)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  Model.ConnectorModule_SetConfiguration(Configuration.ToByteArray());
  finally
  Screen.Cursor:=SC;
  end;
  ShowMessage('A new configuration has been set for connector');
  end;
finally
Configuration.Destroy();
end;
end;

procedure TGeoMonitoredObject1ControlPanel.cbGPSModuleDatumIDChange(Sender: TObject);
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

procedure TGeoMonitoredObject1ControlPanel.edGPSModuleDistanceThresholdKeyPress(Sender: TObject; var Key: Char);
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

procedure TGeoMonitoredObject1ControlPanel.btnGPSModuleConfigurationPanelClick(Sender: TObject);
var
  SC: TCursor;
  ConfigurationData: TByteArray;
  Configuration: TGPSModuleConfiguration;
  flApply: boolean;
begin
if (NOT Model.IsObjectOnline) then Raise Exception.Create('Could not edit configuration: îbject is offline.'); //. =>
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
ConfigurationData:=Model.GPSModule_GetConfiguration();
finally
Screen.Cursor:=SC;
end;
Configuration:=TGPSModuleConfiguration.Create(ConfigurationData);
try
with TGeoMonitoredObject1GPSModuleConfigurationPanel.Create(Configuration) do
try
flApply:=Dialog();                                                                                                       
finally
Destroy();
end;
if (flApply)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  Model.GPSModule_SetConfiguration(Configuration.ToByteArray());
  finally
  Screen.Cursor:=SC;
  end;
  ShowMessage('A new configuration has been set for GPS module');
  end;
finally
Configuration.Destroy();
end;
end;

procedure TGeoMonitoredObject1ControlPanel.edGPIModuleValueKeyPress(Sender: TObject; var Key: Char);
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
  DeviceRootComponent.GPIModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
  DeviceRootComponent.GPIModule.Value.Value.Value:=StrToInt(edGPIModuleValue.Text);
  finally
  Model.Lock.Leave;
  end;
  DeviceRootComponent.GPIModule.Value.WriteDeviceCUAC();
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObject1ControlPanel.edGPOModuleValueKeyPress(Sender: TObject; var Key: Char);
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
    DeviceRootComponent.GPOModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
    DeviceRootComponent.GPOModule.Value.Value.Value:=StrToInt(edGPOModuleValue.Text);
    finally
    Model.Lock.Leave;
    end;
    DeviceRootComponent.GPOModule.Value.WriteCUAC();
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
    DeviceRootComponent.GPOModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
    DeviceRootComponent.GPOModule.Value.Value.Value:=StrToInt(edGPOModuleValue.Text);
    finally
    Model.Lock.Leave;
    end;
    DeviceRootComponent.GPOModule.Value.WriteDeviceCUAC();
    finally
    Screen.Cursor:=SC;
    end;
    end;
  end;
end;

procedure TGeoMonitoredObject1ControlPanel.fmGPIModuleValueBitMapValueSet(const Value: word);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter;
try
DeviceRootComponent.GPIModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
DeviceRootComponent.GPIModule.Value.Value.Value:=Value;
finally
Model.Lock.Leave;
end;
DeviceRootComponent.GPIModule.Value.WriteCUAC();
//.
Model.Lock.Enter;
try
edGPIModuleValue.Text:=IntToStr(DeviceRootComponent.GPIModule.Value.Value.Value);
finally
Model.Lock.Leave;
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1ControlPanel.fmGPIModuleValueBitMapValueSetBit(const Index: integer; const Value: boolean);
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
DeviceRootComponent.GPIModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
if (Value)
 then DeviceRootComponent.GPIModule.Value.Value.Value:=(DeviceRootComponent.GPIModule.Value.Value.Value OR W)
 else DeviceRootComponent.GPIModule.Value.Value.Value:=(DeviceRootComponent.GPIModule.Value.Value.Value AND (NOT W));
finally
Model.Lock.Leave;
end;
DeviceRootComponent.GPIModule.Value.WriteByAddressCUAC(Address);
//.
Model.Lock.Enter;
try
edGPIModuleValue.Text:=IntToStr(DeviceRootComponent.GPIModule.Value.Value.Value);
finally
Model.Lock.Leave;
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1ControlPanel.fmGPOModuleValueBitMapValueSet(const Value: word);
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
  DeviceRootComponent.GPOModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
  DeviceRootComponent.GPOModule.Value.Value.Value:=Value;
  finally
  Model.Lock.Leave;
  end;
  DeviceRootComponent.GPOModule.Value.WriteCUAC();
  //.
  Model.Lock.Enter;
  try
  edGPOModuleValue.Text:=IntToStr(DeviceRootComponent.GPOModule.Value.Value.Value);
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
  DeviceRootComponent.GPOModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
  DeviceRootComponent.GPOModule.Value.Value.Value:=Value;
  finally
  Model.Lock.Leave;
  end;
  DeviceRootComponent.GPOModule.Value.WriteDeviceCUAC();
  //.
  Model.Lock.Enter;
  try
  edGPOModuleValue.Text:=IntToStr(DeviceRootComponent.GPOModule.Value.Value.Value);
  finally
  Model.Lock.Leave;
  end;
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObject1ControlPanel.fmGPOModuleValueBitMapValueSetBit(const Index: integer; const Value: boolean);
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
  DeviceRootComponent.GPOModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
  if (Value)
   then DeviceRootComponent.GPOModule.Value.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value.Value OR W)
   else DeviceRootComponent.GPOModule.Value.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value.Value AND (NOT W));
  finally
  Model.Lock.Leave;
  end;
  DeviceRootComponent.GPOModule.Value.WriteByAddressCUAC(Address);
  //.
  Model.Lock.Enter;
  try
  edGPOModuleValue.Text:=IntToStr(DeviceRootComponent.GPOModule.Value.Value.Value);
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
  DeviceRootComponent.GPOModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
  if (Value)
   then DeviceRootComponent.GPOModule.Value.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value.Value OR W)
   else DeviceRootComponent.GPOModule.Value.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value.Value AND (NOT W));
  finally
  Model.Lock.Leave;
  end;
  DeviceRootComponent.GPOModule.Value.WriteDeviceByAddressCUAC(Address);
  //.
  Model.Lock.Enter;
  try
  edGPOModuleValue.Text:=IntToStr(DeviceRootComponent.GPOModule.Value.Value.Value);
  finally
  Model.Lock.Leave;
  end;
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObject1ControlPanel.cbVideoRecorderModuleActiveClick(Sender: TObject);
var
  SC: TCursor;
  V,LV: TComponentTimestampedBooleanData;
begin
if (flUpdating) then Exit; //. ->
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter();
try
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=cbVideoRecorderModuleActive.Checked;
//.
LV:=DeviceRootComponent.VideoRecorderModule.Active.BoolValue;
try
DeviceRootComponent.VideoRecorderModule.Active.BoolValue:=V;
try
DeviceRootComponent.VideoRecorderModule.Active.WriteDeviceCUAC();
except
  on E: OperationException do
    case E.Code of
    -1000001: Raise Exception.Create('Video recorder is disabled'); //. =>
    else
      Raise; //. =>
    end;
  else
    Raise; //. =>
  end;
except
  DeviceRootComponent.VideoRecorderModule.Active.BoolValue:=LV;
  Raise; //. =>
  end;
finally
Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
except
  flUpdating:=true;
  try
  cbVideoRecorderModuleActive.Checked:=false;
  finally
  flUpdating:=false;
  end;
  //.
  Raise; //. =>
  end;
end;

procedure TGeoMonitoredObject1ControlPanel.cbVideoRecorderModuleRecordingClick(Sender: TObject);
var
  SC: TCursor;
  flRecording: boolean;
  V,LV: TComponentTimestampedBooleanData;
begin
if (flUpdating) then Exit; //. ->
flRecording:=cbVideoRecorderModuleRecording.Checked;
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter();
try
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=flRecording;
//.
if (flRecording)
 then begin
  if (NOT DeviceRootComponent.VideoRecorderModule.Active.BoolValue.Value)
   then begin
    LV:=DeviceRootComponent.VideoRecorderModule.Active.BoolValue;
    try
    DeviceRootComponent.VideoRecorderModule.Active.BoolValue:=V;
    try
    DeviceRootComponent.VideoRecorderModule.Active.WriteDeviceCUAC();
    except
      on E: OperationException do
        case E.Code of
        -1000001: Raise Exception.Create('Video recorder is disabled'); //. =>
        else
          Raise; //. =>
        end;
      else
        Raise; //. =>
      end;
    except
      DeviceRootComponent.VideoRecorderModule.Active.BoolValue:=LV;
      Raise; //. =>
      end;
    end;
  end;
//.
DeviceRootComponent.VideoRecorderModule.Recording.BoolValue:=V;
DeviceRootComponent.VideoRecorderModule.Recording.WriteDeviceCUAC();
//.
if (NOT flRecording)
 then begin
  if (DeviceRootComponent.VideoRecorderModule.Active.BoolValue.Value)
   then begin
    DeviceRootComponent.VideoRecorderModule.Active.BoolValue:=V;
    DeviceRootComponent.VideoRecorderModule.Active.WriteDeviceCUAC();
    end;
  end;
finally
Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
//.
flUpdating:=true;
try
cbVideoRecorderModuleActive.Checked:=flRecording;
finally
flUpdating:=false;
end;
btnVideoRecorderModulePlayer.Enabled:=cbVideoRecorderModuleRecording.Checked;
except
  flUpdating:=true;
  try
  cbVideoRecorderModuleRecording.Checked:=false;
  finally
  flUpdating:=false;
  end;
  //.
  Raise; //. =>
  end;
end;

procedure TGeoMonitoredObject1ControlPanel.cbVideoRecorderModuleTransmittingClick(Sender: TObject);
var
  SC: TCursor;
  V: TComponentTimestampedBooleanData;
begin
if (flUpdating) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter();
try
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=cbVideoRecorderModuleTransmitting.Checked;
DeviceRootComponent.VideoRecorderModule.Transmitting.BoolValue:=V;
//.
DeviceRootComponent.VideoRecorderModule.Transmitting.WriteDeviceCUAC();
finally
Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1ControlPanel.cbVideoRecorderModuleSavingClick(Sender: TObject);
var
  SC: TCursor;
  V: TComponentTimestampedBooleanData;
begin
if (flUpdating) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter();
try
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=cbVideoRecorderModuleSaving.Checked;
DeviceRootComponent.VideoRecorderModule.Saving.BoolValue:=V;
//.
DeviceRootComponent.VideoRecorderModule.Saving.WriteDeviceCUAC();
finally
Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TGeoMonitoredObject1ControlPanel.edVideoRecorderModuleSDPKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter();
  try
  DeviceRootComponent.VideoRecorderModule.SDP.Value.Timestamp:=Now-TimeZoneDelta;
  DeviceRootComponent.VideoRecorderModule.SDP.Value.Value:=edVideoRecorderModuleSDP.Text;
  //.
  DeviceRootComponent.VideoRecorderModule.SDP.WriteDeviceCUAC();
  finally
  Model.Lock.Leave();
  end;
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObject1ControlPanel.edVideoRecorderModuleReceiversKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter();
  try
  DeviceRootComponent.VideoRecorderModule.Receivers.Value.Timestamp:=Now-TimeZoneDelta;
  DeviceRootComponent.VideoRecorderModule.Receivers.Value.Value:=edVideoRecorderModuleReceivers.Text;
  //.
  DeviceRootComponent.VideoRecorderModule.Receivers.WriteDeviceCUAC();
  finally
  Model.Lock.Leave();
  end;
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObject1ControlPanel.edVideoRecorderModuleSavingServerKeyPress(Sender: TObject; var Key: Char);
var
  SC: TCursor;
begin
if (Key = #$0D)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  Model.Lock.Enter();
  try
  DeviceRootComponent.VideoRecorderModule.SavingServer.Value.Timestamp:=Now-TimeZoneDelta;
  DeviceRootComponent.VideoRecorderModule.SavingServer.Value.Value:=edVideoRecorderModuleSavingServer.Text;
  //.
  DeviceRootComponent.VideoRecorderModule.SavingServer.WriteDeviceCUAC();
  finally
  Model.Lock.Leave();
  end;
  finally
  Screen.Cursor:=SC;
  end;
  end;
end;

procedure TGeoMonitoredObject1ControlPanel.cbVideoRecorderModuleAudioClick(Sender: TObject);
var
  SC: TCursor;
  V: TComponentTimestampedBooleanData;
begin
if (flUpdating) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter();
try
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=cbVideoRecorderModuleAudio.Checked;
DeviceRootComponent.VideoRecorderModule.Audio.BoolValue:=V;
//.
DeviceRootComponent.VideoRecorderModule.Audio.WriteDeviceCUAC();
finally
Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
if (VideoPlayer <> nil) then VideoPlayer_Restart();
end;

procedure TGeoMonitoredObject1ControlPanel.cbVideoRecorderModuleVideoClick(Sender: TObject);
var
  SC: TCursor;
  V: TComponentTimestampedBooleanData;
begin
if (flUpdating) then Exit; //. ->
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Model.Lock.Enter();
try
V.Timestamp:=Now-TimeZoneDelta;
V.Value:=cbVideoRecorderModuleVideo.Checked;
DeviceRootComponent.VideoRecorderModule.Video.BoolValue:=V;
//.
DeviceRootComponent.VideoRecorderModule.Video.WriteDeviceCUAC();
DeviceRootComponent.VideoRecorderModule.Video.WriteCUAC();
finally
Model.Lock.Leave();
end;
finally
Screen.Cursor:=SC;
end;
if (VideoPlayer <> nil) then VideoPlayer_Restart();
end;

procedure TGeoMonitoredObject1ControlPanel.VideoPlayer_Restart();
var
  ServerAddress: string;
  Idx: integer;
  UserName,UserPassword: WideString;
begin
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
FreeAndNil(VideoPlayer);
VideoPlayer:=TGeographServerObjectVideoPlayer.Create(ServerAddress,0,{default server port} UserName,UserPassword, Model);
end;

procedure TGeoMonitoredObject1ControlPanel.VideoPlayer_Stop();
begin
FreeAndNil(VideoPlayer);
end;

procedure TGeoMonitoredObject1ControlPanel.btnVideoRecorderModulePlayerClick(Sender: TObject);
begin
VideoPlayer_Restart();
end;

procedure TGeoMonitoredObject1ControlPanel.btnVideoRecorderModuleConfigurationPanelClick(Sender: TObject);
var
  SC: TCursor;
  ConfigurationData: TByteArray;
  Configuration: TVideoRecorderModuleConfiguration;
  flApply: boolean;
begin
if (NOT Model.IsObjectOnline) then Raise Exception.Create('Could not edit configuration: îbject is offline.'); //. =>
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
//.
ConfigurationData:=Model.VideoRecorder_GetConfiguration();
finally
Screen.Cursor:=SC;
end;
Configuration:=TVideoRecorderModuleConfiguration.Create(ConfigurationData);
try
with TGeoMonitoredObject1VideoRecorderConfigurationPanel.Create(Configuration) do
try
flApply:=Dialog();
finally
Destroy();
end;
if (flApply)
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  //.
  Model.VideoRecorder_SetConfiguration(Configuration.ToByteArray());
  finally
  Screen.Cursor:=SC;
  end;
  ShowMessage('A new configuration has been set for videorecorder');
  end;
finally
Configuration.Destroy();
end;
end;

procedure TGeoMonitoredObject1ControlPanel.btnFileSystemClick(Sender: TObject);
begin
if (NOT Model.IsObjectOnline) then Raise Exception.Create('Could not get File System Panel: îbject is offline.'); //. =>
with TGeoMonitoredObject1FileSystemExplorerPanel.Create(Model) do
try
ShowModal();
finally
Destroy();
end;
end;

procedure TGeoMonitoredObject1ControlPanel.btnControlModuleClick(Sender: TObject);
begin
if (NOT Model.IsObjectOnline) then Raise Exception.Create('Could not get Control Module Panel: îbject is offline.'); //. =>
with TGeoMonitoredObject1ControlModulePanel.Create(Model) do
try
ShowModal();
finally
Destroy();
end;
end;

procedure TGeoMonitoredObject1ControlPanel.bbUpdatePanelClick(Sender: TObject);
begin
//. update object model
ObjectRootComponent.ReadAllCUAC();
DeviceRootComponent.ReadAllCUAC();
//.
Update();
end;

procedure TGeoMonitoredObject1ControlPanel.UpdaterTimer(Sender: TObject);
begin
if (Model.IsObjectOnline())
 then begin
  lbConnectorModuleStatus.Caption:='Online';
  stConnectorModuleStatus.Color:=clGreen;
  end
 else begin
  lbConnectorModuleStatus.Caption:='offline';
  stConnectorModuleStatus.Color:=clGray;
  end;
end;

procedure TGeoMonitoredObject1ControlPanel.Geographserverobjecttracing1Click(Sender: TObject);
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

procedure TGeoMonitoredObject1ControlPanel.Geographservercontroltracing1Click(Sender: TObject);
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
