unit unitGSTraqObjectMainTrackerBusinessModel;
Interface
uses
  Windows,
  SysUtils,
  Classes,
  Forms,
  Graphics,
  unitObjectModel,
  unitGSTraqObjectModel,
  //.
  unitBusinessModel,
  unitGSTraqObjectBusinessModel;

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
  TGSTraqObjectMainTrackerBusinessModel = class(TGSTraqObjectBusinessModel)
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
    procedure setDeviceConnectionServiceProviderIMEI(Value: string);
    function getDeviceConnectionServiceProviderIMEI(): string;
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
    GSTraqObjectModel: TGSTraqObjectModel;
    ObjectRootComponent: TGSTraqObjectComponent;
    DeviceRootComponent: TGSTraqObjectDeviceComponent;

    class function ID: integer; override;
    class function Name: string; override; 
    class function CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel; override;

    Constructor Create(const pGSTraqObjectModel: TGSTraqObjectModel);
    procedure Update; override;
    function GetControlPanel: TBusinessModelControlPanel; override;
    function CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel; override;
    function IsObjectOnline: boolean; override;
    function CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer; override;
    procedure ResetAlert();

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
    property DeviceConnectionServiceProviderIMEI: string read getDeviceConnectionServiceProviderIMEI write setDeviceConnectionServiceProviderIMEI;
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
  unitGSTraqObjectMainTrackerBusinessModelControlPanel,
  unitGSTraqObjectMainTrackerBusinessModelConstructorPanel,
  unitGSTraqObjectMainTrackerBusinessModelDeviceInitializerPanel;


Const
  GSTraqObjectMainTrackerBusinessModelID = 1;


{TGSTraqObjectMainTrackerBusinessModel}
class function TGSTraqObjectMainTrackerBusinessModel.ID: integer;
begin
Result:=GSTraqObjectMainTrackerBusinessModelID;
end;

class function TGSTraqObjectMainTrackerBusinessModel.Name: string;
begin
Result:='Personal tracker';
end;

class function TGSTraqObjectMainTrackerBusinessModel.CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel;
begin
Result:=TTGSTraqObjectMainTrackerBusinessModelConstructorPanel.Create(TGSTraqObjectMainTrackerBusinessModel);
end;

Constructor TGSTraqObjectMainTrackerBusinessModel.Create(const pGSTraqObjectModel: TGSTraqObjectModel);
begin
GSTraqObjectModel:=pGSTraqObjectModel;
ObjectRootComponent:=TGSTraqObjectComponent(GSTraqObjectModel.ObjectSchema.RootComponent);
DeviceRootComponent:=TGSTraqObjectDeviceComponent(GSTraqObjectModel.ObjectDeviceSchema.RootComponent);
Inherited Create(pGSTraqObjectModel);
end;

procedure TGSTraqObjectMainTrackerBusinessModel.Update;
begin
//. prepare object schema side
ObjectRootComponent.LoadAll();
//. prepare object device schema side
DeviceRootComponent.LoadAll();
//.
Inherited;
end;

function TGSTraqObjectMainTrackerBusinessModel.GetControlPanel: TBusinessModelControlPanel;
begin
ControlPanelLock.Enter;
try
if (ControlPanel = nil) then ControlPanel:=TGSTraqObjectMainTrackerBusinessModelControlPanel.Create(Self);
Result:=ControlPanel;
finally
ControlPanelLock.Leave;
end;
end;

function TGSTraqObjectMainTrackerBusinessModel.CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
Result:=TfmGSTraqObjectMainTrackerBusinessModelDeviceInitializerPanel.Create(Self);
end;

function TGSTraqObjectMainTrackerBusinessModel.IsObjectOnline: boolean;
begin
Result:=(GSTraqObjectModel.IsObjectOnline());
end;

function TGSTraqObjectMainTrackerBusinessModel.CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer;

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
GSTraqObjectModel.Lock.Enter;
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
  end else
if ((ComponentElement = DeviceRootComponent.GPIValueFixValue) AND (flSetCommand))
 then begin
  ProcessForAlertState(Result);
  end else
if ((ComponentElement = DeviceRootComponent.BatteryModule.Voltage) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesInfo;
  EventMessage:='Battery charge: '+IntToStr(DeviceRootComponent.BatteryModule.Charge.Value)+'%';
  end;
  end ;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setCheckpointInterval(Value: integer);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.CheckPointInterval.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.CheckPointInterval.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getCheckpointInterval: integer;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.CheckPointInterval.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceDescriptorVendor(Value: DWord);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Vendor.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Vendor.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceDescriptorVendor: DWord;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Vendor.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceDescriptorModel(Value: DWord);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Model.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Model.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceDescriptorModel: DWord;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Model.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceDescriptorSerialNumber(Value: DWord);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SerialNumber.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SerialNumber.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceDescriptorSerialNumber: DWord;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SerialNumber.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceDescriptorProductionDate(Value: TDateTime);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.ProductionDate.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.ProductionDate.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceDescriptorProductionDate: TDateTime;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.ProductionDate.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceDescriptorHWVersion(Value: DWord);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.HWVersion.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.HWVersion.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceDescriptorHWVersion: DWord;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.HWVersion.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceDescriptorSWVersion(Value: DWord);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SWVersion.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SWVersion.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceDescriptorSWVersion: DWord;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SWVersion.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceConnectionServiceProviderID(Value: Word);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceConnectionServiceProviderID: Word;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceConnectionServiceProviderTariff(Value: Word);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Tariff.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Tariff.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceConnectionServiceProviderTariff: Word;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Tariff.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceConnectionServiceNumber(Value: double);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceConnectionServiceNumber: double;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceConnectionServiceProviderKeepAliveInterval(Value: Word);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.KeepAliveInterval.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.KeepAliveInterval.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceConnectionServiceProviderKeepAliveInterval(): Word;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.KeepAliveInterval.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceConnectionServiceProviderIMEI(Value: string);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.IMEI.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.IMEI.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceConnectionServiceProviderIMEI(): string;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.IMEI.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceConnectionPassword(Value: string);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.Password.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.Password.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceConnectionPassword(): string;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.Password.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setGeoSpaceID(Value: integer);
begin
GSTraqObjectModel.Lock.Enter;
try
ObjectRootComponent.GeoSpaceID.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
ObjectRootComponent.GeoSpaceID.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getGeoSpaceID: integer;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.GeoSpaceID.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setVisualization(Value: TObjectDescriptor);
begin
GSTraqObjectModel.Lock.Enter;
try
ObjectRootComponent.Visualization.Descriptor.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
ObjectRootComponent.Visualization.Descriptor.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getVisualization: TObjectDescriptor;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Visualization.Descriptor.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setHintID(Value: integer);
begin
GSTraqObjectModel.Lock.Enter;
try
ObjectRootComponent.Hint.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
ObjectRootComponent.Hint.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getHintID: integer;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Hint.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setUserAlertID(Value: integer);
begin
GSTraqObjectModel.Lock.Enter;
try
ObjectRootComponent.UserAlert.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
ObjectRootComponent.UserAlert.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getUserAlertID: integer;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.UserAlert.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setOnlineFlagID(Value: integer);
begin
GSTraqObjectModel.Lock.Enter;
try
ObjectRootComponent.OnlineFlag.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
ObjectRootComponent.OnlineFlag.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getOnlineFlagID: integer;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.OnlineFlag.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setLocationIsAvailableFlagID(Value: integer);
begin
GSTraqObjectModel.Lock.Enter;
try
ObjectRootComponent.LocationIsAvailableFlag.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
ObjectRootComponent.LocationIsAvailableFlag.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getLocationIsAvailableFlagID: integer;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.LocationIsAvailableFlag.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceDatumID(Value: integer);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DatumID.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DatumID.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceDatumID: integer;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DatumID.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDeviceGeoDistanceThreshold(Value: integer);
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DistanceThreshold.Value:=Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DistanceThreshold.Write();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceGeoDistanceThreshold: integer;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DistanceThreshold.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceConnectionServiceProviderAccount: Word;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Account.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceBatteryVoltage: Word;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Voltage.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceBatteryCharge: Word;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Charge.Value;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

function TGSTraqObjectMainTrackerBusinessModel.getAlertSeverity: TTrackLoggerAlertSeverity;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=TTrackLoggerAlertSeverity(DeviceRootComponent.GPIModule.Value.Value AND 3);
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.ResetAlert();
begin
GSTraqObjectModel.Lock.Enter;
try
DeviceRootComponent.GPIModule.Value.Value:=0;
DeviceRootComponent.GPIModule.Value.WriteDevice();
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceBatteryInternalState(): TBatteryState;
begin
GSTraqObjectModel.Lock.Enter;
try
if ((DeviceRootComponent.BatteryModule.State.Value AND 1) = 1)
 then Result:=bsNormalVoltage
 else Result:=bsLowVoltage;
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

function TGSTraqObjectMainTrackerBusinessModel.getDeviceBatteryExternalState(): TBatteryState;
begin
GSTraqObjectModel.Lock.Enter;
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
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDisableObjectMoving(Value: boolean);
begin
GSTraqObjectModel.Lock.Enter;
try
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value OR 8)
 else DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value AND (NOT 8));
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPOModule.Value.WriteDevice();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDisableObjectMoving: boolean;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value AND 8) = 8);
finally
GSTraqObjectModel.Lock.Leave;
end;
end;

procedure TGSTraqObjectMainTrackerBusinessModel.setDisableObject(Value: boolean);
begin
GSTraqObjectModel.Lock.Enter;
try
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value OR 1)
 else DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value AND (NOT 1));
finally
GSTraqObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPOModule.Value.WriteDevice();
end;

function TGSTraqObjectMainTrackerBusinessModel.getDisableObject: boolean;
begin
GSTraqObjectModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value AND 1) = 1);
finally
GSTraqObjectModel.Lock.Leave;
end;
end;




end.
