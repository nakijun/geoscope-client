unit unitGMMDCardiographBusinessModel;
Interface
uses
  Windows,
  SysUtils,
  Classes,
  Forms,
  Graphics,
  unitObjectModel,
  unitGeoMonitoredMedDeviceModel,
  //.
  unitBusinessModel,
  unitGMMDBusinessModel;

Type
  TTrackLoggerAlertSeverity = (
    tlasNone = 0,
    tlasMinor = 1,
    tlasMajor = 2,
    tlasCritical = 3
  );

Const
  TrackLoggerAlertSeverityStrings: array[TTrackLoggerAlertSeverity] of string = (
    'None',
    'Minor',
    'Major',
    'Critical'
  );

  TrackLoggerAlertSeverityColors: array[TTrackLoggerAlertSeverity] of TColor = (
    clSilver,
    clYellow,
    clFuchsia,
    clRed
  );

Type
  TGMMDCardiographBusinessModel = class(TGMMDBusinessModel)
  private
    procedure setCheckpointInterval(Value: integer);
    function getCheckpointInterval: integer;
    procedure setDeviceDescriptorVendor(Value: DWord);
    function getDeviceDescriptorVendor: DWord;
    procedure setDeviceDescriptorModel(Value: DWord);
    function getDeviceDescriptorModel: DWord;
    procedure setDeviceDescriptorSerialNumber(Value: DWord);
    function getDeviceDescriptorSerialNumber: DWord;
    procedure setDeviceDescriptorProductionDate(Value: TDateTime);
    function getDeviceDescriptorProductionDate: TDateTime;
    procedure setDeviceDescriptorHWVersion(Value: DWord);
    function getDeviceDescriptorHWVersion: DWord;
    procedure setDeviceDescriptorSWVersion(Value: DWord);
    function getDeviceDescriptorSWVersion: DWord;
    procedure setDeviceConnectionServiceProviderID(Value: Word);
    function getDeviceConnectionServiceProviderID: Word;
    procedure setDeviceConnectionServiceNumber(Value: double);
    function getDeviceConnectionServiceNumber: double;
    function getDeviceConnectionServiceProviderAccount: Word;
    procedure setDeviceConnectionServiceProviderTariff(Value: Word);
    function getDeviceConnectionServiceProviderTariff: Word;
    procedure setDeviceMedDeviceDomains(Value: string);
    function getDeviceMedDeviceDomains(): string;
    procedure setGeoSpaceID(Value: integer);
    function getGeoSpaceID: integer;
    procedure setVisualization(Value: TObjectDescriptor);
    function getVisualization: TObjectDescriptor;
    procedure setHintID(Value: integer);
    function getHintID: integer;
    procedure setUserAlertID(Value: integer);
    function getUserAlertID: integer;
    procedure setOnlineFlagID(Value: integer);
    function getOnlineFlagID: integer;
    procedure setLocationIsAvailableFlagID(Value: integer);
    function getLocationIsAvailableFlagID: integer;
    procedure setDeviceDatumID(Value: integer);
    function getDeviceDatumID: integer;
    procedure setDeviceGeoDistanceThreshold(Value: integer);
    function getDeviceGeoDistanceThreshold: integer;
    function getDeviceBatteryVoltage: Word;
    function getDeviceBatteryCharge: Word;
    //. in
    function getAlertSeverity: TTrackLoggerAlertSeverity;
    //. out
    procedure setDisableObjectMoving(Value: boolean);
    function getDisableObjectMoving: boolean;
    procedure setDisableObject(Value: boolean);
    function getDisableObject: boolean;
  public
    GeoMonitoredMedDeviceModel: TGeoMonitoredMedDeviceModel;
    ObjectRootComponent: TGeoMonitoredMedDeviceComponent;
    DeviceRootComponent: TGeoMonitoredMedDeviceDeviceComponent;

    class function ID: integer; override;
    class function Name: string; override; 
    class function CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel; override;

    Constructor Create(const pGeoMonitoredMedDeviceModel: TGeoMonitoredMedDeviceModel);
    procedure Update; override;
    function GetControlPanel: TBusinessModelControlPanel; override;
    function IsObjectOnline: boolean; override;
    function CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer; override;

    property CheckpointInterval: integer read getCheckpointInterval write setCheckpointInterval;
    property DeviceDescriptorVendor: DWord read getDeviceDescriptorVendor write setDeviceDescriptorVendor;
    property DeviceDescriptorModel: DWord read getDeviceDescriptorModel write setDeviceDescriptorModel;
    property DeviceDescriptorSerialNumber: DWord read getDeviceDescriptorSerialNumber write setDeviceDescriptorSerialNumber;
    property DeviceDescriptorProductionDate: TDateTime read getDeviceDescriptorProductionDate write setDeviceDescriptorProductionDate;
    property DeviceDescriptorHWVersion: DWord read getDeviceDescriptorHWVersion write setDeviceDescriptorHWVersion;
    property DeviceDescriptorSWVersion: DWord read getDeviceDescriptorSWVersion write setDeviceDescriptorSWVersion;
    property DeviceConnectionServiceProviderID: Word read getDeviceConnectionServiceProviderID write setDeviceConnectionServiceProviderID;
    property DeviceConnectionServiceNumber: double read getDeviceConnectionServiceNumber write setDeviceConnectionServiceNumber;
    property DeviceConnectionServiceProviderTariff: Word read getDeviceConnectionServiceProviderTariff write setDeviceConnectionServiceProviderTariff;
    property DeviceMedDeviceDomains: string read getDeviceMedDeviceDomains write setDeviceMedDeviceDomains;
    property GeoSpaceID: integer read getGeoSpaceID write setGeoSpaceID;
    property Visualization: TObjectDescriptor read getVisualization write setVisualization;
    property HintID: integer read getHintID write setHintID;
    property UserAlertID: integer read getUserAlertID write setUserAlertID;
    property OnlineFlagID: integer read getOnlineFlagID write setOnlineFlagID;
    property LocationIsAvailableFlagID: integer read getLocationIsAvailableFlagID write setLocationIsAvailableFlagID;
    property DeviceDatumID: integer read getDeviceDatumID write setDeviceDatumID;
    property DeviceGeoDistanceThreshold: integer read getDeviceGeoDistanceThreshold write setDeviceGeoDistanceThreshold;
    //. in properties
    property AlertSeverity: TTrackLoggerAlertSeverity read getAlertSeverity;
    property DeviceConnectionServiceProviderAccount: Word read getDeviceConnectionServiceProviderAccount;
    property DeviceBatteryVoltage: Word read getDeviceBatteryVoltage;
    property DeviceBatteryCharge: Word read getDeviceBatteryCharge;
    //. out properties
    property DisableObjectMoving: boolean read getDisableObjectMoving write setDisableObjectMoving;
    property DisableObject: boolean read getDisableObject write setDisableObject;
  end;

Implementation
uses
  unitGMMDCardiographBusinessModelControlPanel,
  unitGMMDCardiographBusinessModelConstructorPanel;


Const
  GMMDCardiographBusinessModelID = 1;


{TGMMDCardiographBusinessModel}
class function TGMMDCardiographBusinessModel.ID: integer;
begin
Result:=GMMDCardiographBusinessModelID;
end;

class function TGMMDCardiographBusinessModel.Name: string;
begin
Result:='Cardiograph';
end;

class function TGMMDCardiographBusinessModel.CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel;
begin
Result:=TTGMMDCardiographBusinessModelConstructorPanel.Create(TGMMDCardiographBusinessModel);
end;

Constructor TGMMDCardiographBusinessModel.Create(const pGeoMonitoredMedDeviceModel: TGeoMonitoredMedDeviceModel);
begin
GeoMonitoredMedDeviceModel:=pGeoMonitoredMedDeviceModel;
ObjectRootComponent:=TGeoMonitoredMedDeviceComponent(GeoMonitoredMedDeviceModel.ObjectSchema.RootComponent);
DeviceRootComponent:=TGeoMonitoredMedDeviceDeviceComponent(GeoMonitoredMedDeviceModel.ObjectDeviceSchema.RootComponent);
Inherited Create(pGeoMonitoredMedDeviceModel);
end;

procedure TGMMDCardiographBusinessModel.Update;
begin
//. prepare object schema side
ObjectRootComponent.LoadAll();
//. prepare object device schema side
DeviceRootComponent.LoadAll();
//.
Inherited;
end;

function TGMMDCardiographBusinessModel.GetControlPanel: TBusinessModelControlPanel;
begin
ControlPanelLock.Enter;
try
if (ControlPanel = nil) then ControlPanel:=TGMMDCardiographBusinessModelControlPanel.Create(Self);
Result:=ControlPanel;
finally
ControlPanelLock.Leave;
end;
end;

function TGMMDCardiographBusinessModel.IsObjectOnline: boolean;
begin
Result:=(GeoMonitoredMedDeviceModel.IsObjectOnline());
end;

function TGMMDCardiographBusinessModel.CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer;

  procedure ProcessForAlertState(var ptrTrackEvent: pointer);
  var
    Alert: TTrackLoggerAlertSeverity;
    _Severity: TObjectTrackEventSeverity;
  begin
  if ((DeviceRootComponent.GPIModule.Value.Value AND 3) <> (DeviceRootComponent.GPIModule.Value.LastValue AND 3))
   then begin
    if (ptrTrackEvent = nil)
     then begin
      ptrTrackEvent:=ComponentElement.ToTrackEvent();
      TObjectTrackEvent(ptrTrackEvent^).EventMessage:='';
      TObjectTrackEvent(ptrTrackEvent^).Severity:=otesInfo;
      end;
    with TObjectTrackEvent(ptrTrackEvent^) do begin
    Alert:=AlertSeverity;
    case Alert of
    tlasNone: _Severity:=otesInfo;
    tlasMinor: _Severity:=otesMinor;
    tlasMajor: _Severity:=otesMajor;
    tlasCritical: _Severity:=otesCritical;
    else
      _Severity:=otesInfo;
    end;
    EventMessage:=EventMessage+'Alert: '+TrackLoggerAlertSeverityStrings[AlertSeverity]+' ';
    if (Integer(_Severity) > Integer(Severity)) then Severity:=_Severity;
    end;
    end;
  end;

var
  S: string;
begin
Result:=nil;
GeoMonitoredMedDeviceModel.Lock.Enter;
try
if ((ComponentElement = DeviceRootComponent.Configuration) AND (NOT flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMajor;
  EventMessage:='Reinitialize device';
  end;
  end else
if ((ComponentElement = DeviceRootComponent.ConnectionModule.IsOnline) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  if (DeviceRootComponent.ConnectionModule.IsOnline.BoolValue)
   then begin
    S:='Online';
    Severity:=otesMinor;
    end
   else begin
    S:='Offline';
    Severity:=otesMajor;
    end;
  EventMessage:='Device is '+S;
  end;
  end else
if ((ComponentElement = DeviceRootComponent.GPIModule.Value) AND (flSetCommand))
 then begin
  ProcessForAlertState(Result);
  end
 else
if ((ComponentElement = DeviceRootComponent.GPIValueFixValue) AND (flSetCommand))
 then begin
  ProcessForAlertState(Result);
  end;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setCheckpointInterval(Value: integer);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.CheckPointInterval.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.CheckPointInterval.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getCheckpointInterval: integer;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.CheckPointInterval.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDeviceDescriptorVendor(Value: DWord);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Vendor.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Vendor.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getDeviceDescriptorVendor: DWord;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Vendor.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDeviceDescriptorModel(Value: DWord);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Model.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Model.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getDeviceDescriptorModel: DWord;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Model.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDeviceDescriptorSerialNumber(Value: DWord);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SerialNumber.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SerialNumber.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getDeviceDescriptorSerialNumber: DWord;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SerialNumber.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDeviceDescriptorProductionDate(Value: TDateTime);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.ProductionDate.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.ProductionDate.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getDeviceDescriptorProductionDate: TDateTime;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.ProductionDate.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDeviceDescriptorHWVersion(Value: DWord);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.HWVersion.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.HWVersion.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getDeviceDescriptorHWVersion: DWord;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.HWVersion.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDeviceDescriptorSWVersion(Value: DWord);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SWVersion.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SWVersion.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getDeviceDescriptorSWVersion: DWord;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SWVersion.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDeviceConnectionServiceProviderID(Value: Word);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getDeviceConnectionServiceProviderID: Word;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDeviceConnectionServiceNumber(Value: double);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getDeviceConnectionServiceNumber: double;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDeviceConnectionServiceProviderTariff(Value: Word);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Tariff.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Tariff.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getDeviceConnectionServiceProviderTariff: Word;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Tariff.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDeviceMedDeviceDomains(Value: string);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.MedDeviceModule.Domains.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.MedDeviceModule.Domains.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getDeviceMedDeviceDomains(): string;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.MedDeviceModule.Domains.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setGeoSpaceID(Value: integer);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
ObjectRootComponent.GeoSpaceID.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
ObjectRootComponent.GeoSpaceID.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getGeoSpaceID: integer;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=ObjectRootComponent.GeoSpaceID.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setVisualization(Value: TObjectDescriptor);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
ObjectRootComponent.Visualization.Descriptor.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
ObjectRootComponent.Visualization.Descriptor.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getVisualization: TObjectDescriptor;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=ObjectRootComponent.Visualization.Descriptor.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setHintID(Value: integer);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
ObjectRootComponent.Hint.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
ObjectRootComponent.Hint.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getHintID: integer;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=ObjectRootComponent.Hint.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setUserAlertID(Value: integer);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
ObjectRootComponent.UserAlert.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
ObjectRootComponent.UserAlert.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getUserAlertID: integer;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=ObjectRootComponent.UserAlert.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setOnlineFlagID(Value: integer);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
ObjectRootComponent.OnlineFlag.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
ObjectRootComponent.OnlineFlag.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getOnlineFlagID: integer;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=ObjectRootComponent.OnlineFlag.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setLocationIsAvailableFlagID(Value: integer);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
ObjectRootComponent.LocationIsAvailableFlag.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
ObjectRootComponent.LocationIsAvailableFlag.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getLocationIsAvailableFlagID: integer;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=ObjectRootComponent.LocationIsAvailableFlag.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDeviceDatumID(Value: integer);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DatumID.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DatumID.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getDeviceDatumID: integer;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DatumID.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDeviceGeoDistanceThreshold(Value: integer);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DistanceThreshold.Value:=Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DistanceThreshold.WriteCUAC();
end;

function TGMMDCardiographBusinessModel.getDeviceGeoDistanceThreshold: integer;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DistanceThreshold.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

function TGMMDCardiographBusinessModel.getDeviceConnectionServiceProviderAccount: Word;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Account.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

function TGMMDCardiographBusinessModel.getDeviceBatteryVoltage: Word;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Voltage.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

function TGMMDCardiographBusinessModel.getDeviceBatteryCharge: Word;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Charge.Value;
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

function TGMMDCardiographBusinessModel.getAlertSeverity: TTrackLoggerAlertSeverity;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=TTrackLoggerAlertSeverity(DeviceRootComponent.GPIModule.Value.Value AND 3);
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDisableObjectMoving(Value: boolean);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value OR 1)
 else DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value AND (NOT 1));
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.GPOModule.Value.WriteDeviceCUAC();
end;

function TGMMDCardiographBusinessModel.getDisableObjectMoving: boolean;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value AND 1) = 1);
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;

procedure TGMMDCardiographBusinessModel.setDisableObject(Value: boolean);
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value OR 2)
 else DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value AND (NOT 2));
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
DeviceRootComponent.GPOModule.Value.WriteDeviceCUAC();
end;

function TGMMDCardiographBusinessModel.getDisableObject: boolean;
begin
GeoMonitoredMedDeviceModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value AND 2) = 2);
finally
GeoMonitoredMedDeviceModel.Lock.Leave;
end;
end;




end.
