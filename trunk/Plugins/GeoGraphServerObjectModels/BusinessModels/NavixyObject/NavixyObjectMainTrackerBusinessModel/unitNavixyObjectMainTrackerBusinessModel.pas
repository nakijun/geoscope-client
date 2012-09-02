unit unitNavixyObjectMainTrackerBusinessModel;
Interface
uses
  Windows,
  SysUtils,
  Classes,
  Forms,
  Graphics,
  unitObjectModel,
  unitNavixyObjectModel,
  //.
  unitBusinessModel,
  unitNavixyObjectBusinessModel;

Type
  TTrackLoggerAlertSeverity = (
    tlasNone = 0,
    tlasMinor = 1,
    tlasMajor = 2,
    tlasCritical = 3
  );

  TBatteryState = (bsOff,bsOn,bsLowVoltage,bsNormalVoltage);

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

  BatteryStateStrings: array[TBatteryState] of string = (
    'Off',
    'On',
    'Low voltage',
    'Normal voltage'
  );

  BatteryStateColors: array[TBatteryState] of TColor = (
    clRed,
    clYellow,
    clYellow,
    clGreen
  );

Type
  TNavixyObjectMainTrackerBusinessModel = class(TNavixyObjectBusinessModel)
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
    procedure setDeviceConnectionServiceProviderTariff(Value: Word);
    function getDeviceConnectionServiceProviderTariff: Word;
    procedure setDeviceConnectionServiceNumber(Value: double);
    function getDeviceConnectionServiceNumber: double;
    procedure setDeviceConnectionServiceProviderKeepAliveInterval(Value: Word);
    function getDeviceConnectionServiceProviderKeepAliveInterval(): Word;
    function getDeviceConnectionServiceProviderAccount: Word;
    procedure setDeviceConnectionPassword(Value: string);
    function getDeviceConnectionPassword(): string;
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
    function getDeviceBatteryInternalState(): TBatteryState;
    function getDeviceBatteryExternalState(): TBatteryState;
    //. in
    function getAlertSeverity: TTrackLoggerAlertSeverity;
    //. out
    procedure setDisableObjectMoving(Value: boolean);
    function getDisableObjectMoving: boolean;
    procedure setDisableObject(Value: boolean);
    function getDisableObject: boolean;
  public
    NavixyObjectModel: TNavixyObjectModel;
    ObjectRootComponent: TNavixyObjectComponent;
    DeviceRootComponent: TNavixyObjectDeviceComponent;

    class function ID: integer; override;
    class function Name: string; override; 
    class function CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel; override;

    Constructor Create(const pNavixyObjectModel: TNavixyObjectModel);
    procedure Update; override;
    function GetControlPanel: TBusinessModelControlPanel; override;
    function CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel; override;
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
    property DeviceConnectionServiceProviderTariff: Word read getDeviceConnectionServiceProviderTariff write setDeviceConnectionServiceProviderTariff;
    property DeviceConnectionServiceNumber: double read getDeviceConnectionServiceNumber write setDeviceConnectionServiceNumber;
    property DeviceConnectionServiceProviderKeepAliveInterval: Word read getDeviceConnectionServiceProviderKeepAliveInterval write setDeviceConnectionServiceProviderKeepAliveInterval;
    property DeviceConnectionPassword: string read getDeviceConnectionPassword write setDeviceConnectionPassword;
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
    property DeviceBatteryInternalState: TBatteryState read getDeviceBatteryInternalState;
    property DeviceBatteryExternalState: TBatteryState read getDeviceBatteryExternalState;
    //. out properties
    property DisableObjectMoving: boolean read getDisableObjectMoving write setDisableObjectMoving;
    property DisableObject: boolean read getDisableObject write setDisableObject;
  end;

Implementation
uses
  unitNavixyObjectMainTrackerBusinessModelControlPanel,
  unitNavixyObjectMainTrackerBusinessModelConstructorPanel,
  unitNavixyObjectMainTrackerBusinessModelDeviceInitializerPanel;


Const
  NavixyObjectMainTrackerBusinessModelID = 1;


{TNavixyObjectMainTrackerBusinessModel}
class function TNavixyObjectMainTrackerBusinessModel.ID: integer;
begin
Result:=NavixyObjectMainTrackerBusinessModelID;
end;

class function TNavixyObjectMainTrackerBusinessModel.Name: string;
begin
Result:='Main (Car tracker)';
end;

class function TNavixyObjectMainTrackerBusinessModel.CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel;
begin
Result:=TTNavixyObjectMainTrackerBusinessModelConstructorPanel.Create(TNavixyObjectMainTrackerBusinessModel);
end;

Constructor TNavixyObjectMainTrackerBusinessModel.Create(const pNavixyObjectModel: TNavixyObjectModel);
begin
NavixyObjectModel:=pNavixyObjectModel;
ObjectRootComponent:=TNavixyObjectComponent(NavixyObjectModel.ObjectSchema.RootComponent);
DeviceRootComponent:=TNavixyObjectDeviceComponent(NavixyObjectModel.ObjectDeviceSchema.RootComponent);
Inherited Create(pNavixyObjectModel);
end;

procedure TNavixyObjectMainTrackerBusinessModel.Update;
begin
//. prepare object schema side
ObjectRootComponent.LoadAll();
//. prepare object device schema side
DeviceRootComponent.LoadAll();
//.
Inherited;
end;

function TNavixyObjectMainTrackerBusinessModel.GetControlPanel: TBusinessModelControlPanel;
begin
ControlPanelLock.Enter;
try
if (ControlPanel = nil) then ControlPanel:=TNavixyObjectMainTrackerBusinessModelControlPanel.Create(Self);
Result:=ControlPanel;
finally
ControlPanelLock.Leave;
end;
end;

function TNavixyObjectMainTrackerBusinessModel.CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
Result:=TfmNavixyObjectMainTrackerBusinessModelDeviceInitializerPanel.Create(Self);
end;

function TNavixyObjectMainTrackerBusinessModel.IsObjectOnline: boolean;
begin
Result:=(NavixyObjectModel.IsObjectOnline());
end;

function TNavixyObjectMainTrackerBusinessModel.CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer;

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
NavixyObjectModel.Lock.Enter;
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
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setCheckpointInterval(Value: integer);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.CheckPointInterval.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.CheckPointInterval.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getCheckpointInterval: integer;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.CheckPointInterval.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceDescriptorVendor(Value: DWord);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Vendor.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Vendor.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceDescriptorVendor: DWord;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Vendor.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceDescriptorModel(Value: DWord);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Model.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Model.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceDescriptorModel: DWord;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Model.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceDescriptorSerialNumber(Value: DWord);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SerialNumber.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SerialNumber.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceDescriptorSerialNumber: DWord;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SerialNumber.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceDescriptorProductionDate(Value: TDateTime);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.ProductionDate.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.ProductionDate.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceDescriptorProductionDate: TDateTime;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.ProductionDate.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceDescriptorHWVersion(Value: DWord);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.HWVersion.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.HWVersion.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceDescriptorHWVersion: DWord;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.HWVersion.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceDescriptorSWVersion(Value: DWord);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SWVersion.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SWVersion.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceDescriptorSWVersion: DWord;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SWVersion.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceConnectionServiceProviderID(Value: Word);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceConnectionServiceProviderID: Word;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceConnectionServiceProviderTariff(Value: Word);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Tariff.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Tariff.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceConnectionServiceProviderTariff: Word;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Tariff.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceConnectionServiceNumber(Value: double);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceConnectionServiceNumber: double;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceConnectionServiceProviderKeepAliveInterval(Value: Word);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.KeepAliveInterval.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.KeepAliveInterval.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceConnectionServiceProviderKeepAliveInterval(): Word;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.KeepAliveInterval.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceConnectionPassword(Value: string);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.Password.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.Password.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceConnectionPassword(): string;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.Password.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setGeoSpaceID(Value: integer);
begin
NavixyObjectModel.Lock.Enter;
try
ObjectRootComponent.GeoSpaceID.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
ObjectRootComponent.GeoSpaceID.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getGeoSpaceID: integer;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.GeoSpaceID.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setVisualization(Value: TObjectDescriptor);
begin
NavixyObjectModel.Lock.Enter;
try
ObjectRootComponent.Visualization.Descriptor.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
ObjectRootComponent.Visualization.Descriptor.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getVisualization: TObjectDescriptor;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Visualization.Descriptor.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setHintID(Value: integer);
begin
NavixyObjectModel.Lock.Enter;
try
ObjectRootComponent.Hint.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
ObjectRootComponent.Hint.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getHintID: integer;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Hint.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setUserAlertID(Value: integer);
begin
NavixyObjectModel.Lock.Enter;
try
ObjectRootComponent.UserAlert.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
ObjectRootComponent.UserAlert.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getUserAlertID: integer;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.UserAlert.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setOnlineFlagID(Value: integer);
begin
NavixyObjectModel.Lock.Enter;
try
ObjectRootComponent.OnlineFlag.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
ObjectRootComponent.OnlineFlag.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getOnlineFlagID: integer;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.OnlineFlag.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setLocationIsAvailableFlagID(Value: integer);
begin
NavixyObjectModel.Lock.Enter;
try
ObjectRootComponent.LocationIsAvailableFlag.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
ObjectRootComponent.LocationIsAvailableFlag.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getLocationIsAvailableFlagID: integer;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.LocationIsAvailableFlag.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceDatumID(Value: integer);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DatumID.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DatumID.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceDatumID: integer;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DatumID.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDeviceGeoDistanceThreshold(Value: integer);
begin
NavixyObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DistanceThreshold.Value:=Value;
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DistanceThreshold.Write();
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceGeoDistanceThreshold: integer;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DistanceThreshold.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceConnectionServiceProviderAccount: Word;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Account.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceBatteryVoltage: Word;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Voltage.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceBatteryCharge: Word;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Charge.Value;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

function TNavixyObjectMainTrackerBusinessModel.getAlertSeverity: TTrackLoggerAlertSeverity;
begin
NavixyObjectModel.Lock.Enter;
try
if ((DeviceRootComponent.GPIModule.Value.Value AND 8) = 8)
 then Result:=tlasCritical
 else Result:=tlasNone;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceBatteryInternalState(): TBatteryState;
begin
NavixyObjectModel.Lock.Enter;
try
if ((DeviceRootComponent.BatteryModule.State.Value AND 1) = 1)
 then Result:=bsNormalVoltage
 else Result:=bsLowVoltage;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

function TNavixyObjectMainTrackerBusinessModel.getDeviceBatteryExternalState(): TBatteryState;
begin
NavixyObjectModel.Lock.Enter;
try
if ((DeviceRootComponent.BatteryModule.State.Value AND 2) = 2)
 then begin
  if ((DeviceRootComponent.BatteryModule.State.Value AND 4) = 4)
   then Result:=bsNormalVoltage
   else Result:=bsLowVoltage;
  end
 else begin
  Result:=bsOff;
  Exit; //. ->
  end;
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDisableObjectMoving(Value: boolean);
begin
NavixyObjectModel.Lock.Enter;
try
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value OR 8)
 else DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value AND (NOT 8));
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPOModule.Value.WriteDevice();
end;

function TNavixyObjectMainTrackerBusinessModel.getDisableObjectMoving: boolean;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value AND 8) = 8);
finally
NavixyObjectModel.Lock.Leave;
end;
end;

procedure TNavixyObjectMainTrackerBusinessModel.setDisableObject(Value: boolean);
begin
NavixyObjectModel.Lock.Enter;
try
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value OR 1)
 else DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value AND (NOT 1));
finally
NavixyObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPOModule.Value.WriteDevice();
end;

function TNavixyObjectMainTrackerBusinessModel.getDisableObject: boolean;
begin
NavixyObjectModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value AND 1) = 1);
finally
NavixyObjectModel.Lock.Leave;
end;
end;




end.
