unit unitEnforaObjectTracker1BusinessModel;
Interface
uses
  Windows,
  SysUtils,
  Classes,
  Forms,
  Graphics,
  unitObjectModel,
  unitEnforaObjectModel,
  //.
  unitBusinessModel,
  unitEnforaObjectBusinessModel;

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
  TEnforaObjectTracker1BusinessModel = class(TEnforaObjectBusinessModel)
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
    function getDoorsAreLocked: boolean;
    //. out
    procedure setDisableObjectMoving(Value: boolean);
    function getDisableObjectMoving: boolean;
  public
    EnforaObjectModel: TEnforaObjectModel;
    ObjectRootComponent: TEnforaObjectComponent;
    DeviceRootComponent: TEnforaObjectDeviceComponent;

    class function ID: integer; override;
    class function Name: string; override; 
    class function CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel; override;

    Constructor Create(const pEnforaObjectModel: TEnforaObjectModel);
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
    property DeviceConnectionServiceNumber: double read getDeviceConnectionServiceNumber write setDeviceConnectionServiceNumber;
    property DeviceConnectionServiceProviderTariff: Word read getDeviceConnectionServiceProviderTariff write setDeviceConnectionServiceProviderTariff;
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
    property DoorsAreLocked: boolean read getDoorsAreLocked;
    property DeviceConnectionServiceProviderAccount: Word read getDeviceConnectionServiceProviderAccount;
    property DeviceBatteryVoltage: Word read getDeviceBatteryVoltage;
    property DeviceBatteryCharge: Word read getDeviceBatteryCharge;
    //. out properties
    property DisableObjectMoving: boolean read getDisableObjectMoving write setDisableObjectMoving;
  end;

Implementation
uses
  unitEnforaObjectTracker1BusinessModelControlPanel,
  unitEnforaObjectTracker1BusinessModelConstructorPanel,
  unitEnforaObjectTracker1BusinessModelDeviceInitializerPanel;


Const
  EnforaObjectTracker1BusinessModelID = 1;


{TEnforaObjectTracker1BusinessModel}
class function TEnforaObjectTracker1BusinessModel.ID: integer;
begin
Result:=EnforaObjectTracker1BusinessModelID;
end;

class function TEnforaObjectTracker1BusinessModel.Name: string;
begin
Result:='CarTracker';
end;

class function TEnforaObjectTracker1BusinessModel.CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel;
begin
Result:=TTEnforaObjectTracker1BusinessModelConstructorPanel.Create(TEnforaObjectTracker1BusinessModel);
end;

Constructor TEnforaObjectTracker1BusinessModel.Create(const pEnforaObjectModel: TEnforaObjectModel);
begin
EnforaObjectModel:=pEnforaObjectModel;
ObjectRootComponent:=TEnforaObjectComponent(EnforaObjectModel.ObjectSchema.RootComponent);
DeviceRootComponent:=TEnforaObjectDeviceComponent(EnforaObjectModel.ObjectDeviceSchema.RootComponent);
Inherited Create(pEnforaObjectModel);
end;

procedure TEnforaObjectTracker1BusinessModel.Update;
begin
//. prepare object schema side
ObjectRootComponent.LoadAll();
//. prepare object device schema side
DeviceRootComponent.LoadAll();
//.
Inherited;
end;

function TEnforaObjectTracker1BusinessModel.GetControlPanel: TBusinessModelControlPanel;
begin
ControlPanelLock.Enter;
try
if (ControlPanel = nil) then ControlPanel:=TEnforaObjectTracker1BusinessModelControlPanel.Create(Self);
Result:=ControlPanel;
finally
ControlPanelLock.Leave;
end;
end;

function TEnforaObjectTracker1BusinessModel.CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
Result:=TfmEnforaObjectTracker1BusinessModelDeviceInitializerPanel.Create(Self);
end;

function TEnforaObjectTracker1BusinessModel.IsObjectOnline: boolean;
begin
Result:=(EnforaObjectModel.IsObjectOnline());
end;

function TEnforaObjectTracker1BusinessModel.CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer;

  procedure ProcessForAlertState(var ptrTrackEvent: pointer);
  var
    Alert: TTrackLoggerAlertSeverity;
    _Severity: TObjectTrackEventSeverity;
  begin
  if ((DeviceRootComponent.GPIModule.Value.Value AND 1) <> (DeviceRootComponent.GPIModule.Value.LastValue AND 1))
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

  procedure ProcessForDoorsState(var ptrTrackEvent: pointer);
  var
    _Severity: TObjectTrackEventSeverity;
  begin
  if ((DeviceRootComponent.GPIModule.Value.Value AND 2) <> (DeviceRootComponent.GPIModule.Value.LastValue AND 2))
   then begin
    if (ptrTrackEvent = nil)
     then begin
      ptrTrackEvent:=ComponentElement.ToTrackEvent();
      TObjectTrackEvent(ptrTrackEvent^).EventMessage:='';
      TObjectTrackEvent(ptrTrackEvent^).Severity:=otesInfo;
      end;
    with TObjectTrackEvent(ptrTrackEvent^) do begin
    if (NOT DoorsAreLocked)
     then begin
      EventMessage:=EventMessage+'Doors are unlocked'+' ';
      _Severity:=otesMajor;
      end
     else begin
      EventMessage:=EventMessage+'Doors are locked'+' ';
      _Severity:=otesMinor;
      end;
    if (Integer(_Severity) > Integer(Severity)) then Severity:=_Severity;
    end;
    end;
  end;

var
  S: string;
begin
Result:=nil;
EnforaObjectModel.Lock.Enter;
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
  ProcessForDoorsState(Result);
  end
 else
if ((ComponentElement = DeviceRootComponent.GPIValueFixValue) AND (flSetCommand))
 then begin
  ProcessForAlertState(Result);
  ProcessForDoorsState(Result);
  end else
if ((ComponentElement = DeviceRootComponent.GPOModule.Value) AND (flSetCommand) AND ((DeviceRootComponent.GPOModule.Value.Value AND 4) <> (DeviceRootComponent.GPOModule.Value.LastValue AND 4)))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  if (DisableObjectMoving)
   then begin
    EventMessage:='moving are disabled';
    Severity:=otesCritical;
    end
   else begin
    EventMessage:='moving are enabled';
    Severity:=otesCritical;
    end;
  end;
  end;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setCheckpointInterval(Value: integer);
begin
EnforaObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.CheckPointInterval.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.CheckPointInterval.Write();
end;

function TEnforaObjectTracker1BusinessModel.getCheckpointInterval: integer;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.CheckPointInterval.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setDeviceDescriptorVendor(Value: DWord);
begin
EnforaObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Vendor.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Vendor.Write();
end;

function TEnforaObjectTracker1BusinessModel.getDeviceDescriptorVendor: DWord;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Vendor.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setDeviceDescriptorModel(Value: DWord);
begin
EnforaObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Model.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Model.Write();
end;

function TEnforaObjectTracker1BusinessModel.getDeviceDescriptorModel: DWord;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Model.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setDeviceDescriptorSerialNumber(Value: DWord);
begin
EnforaObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SerialNumber.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SerialNumber.Write();
end;

function TEnforaObjectTracker1BusinessModel.getDeviceDescriptorSerialNumber: DWord;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SerialNumber.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setDeviceDescriptorProductionDate(Value: TDateTime);
begin
EnforaObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.ProductionDate.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.ProductionDate.Write();
end;

function TEnforaObjectTracker1BusinessModel.getDeviceDescriptorProductionDate: TDateTime;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.ProductionDate.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setDeviceDescriptorHWVersion(Value: DWord);
begin
EnforaObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.HWVersion.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.HWVersion.Write();
end;

function TEnforaObjectTracker1BusinessModel.getDeviceDescriptorHWVersion: DWord;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.HWVersion.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setDeviceDescriptorSWVersion(Value: DWord);
begin
EnforaObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SWVersion.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SWVersion.Write();
end;

function TEnforaObjectTracker1BusinessModel.getDeviceDescriptorSWVersion: DWord;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SWVersion.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setDeviceConnectionServiceProviderID(Value: Word);
begin
EnforaObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Write();
end;

function TEnforaObjectTracker1BusinessModel.getDeviceConnectionServiceProviderID: Word;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setDeviceConnectionServiceNumber(Value: double);
begin
EnforaObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Write();
end;

function TEnforaObjectTracker1BusinessModel.getDeviceConnectionServiceNumber: double;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setDeviceConnectionServiceProviderTariff(Value: Word);
begin
EnforaObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Tariff.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Tariff.Write();
end;

function TEnforaObjectTracker1BusinessModel.getDeviceConnectionServiceProviderTariff: Word;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Tariff.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setGeoSpaceID(Value: integer);
begin
EnforaObjectModel.Lock.Enter;
try
ObjectRootComponent.GeoSpaceID.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
ObjectRootComponent.GeoSpaceID.Write();
end;

function TEnforaObjectTracker1BusinessModel.getGeoSpaceID: integer;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.GeoSpaceID.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setVisualization(Value: TObjectDescriptor);
begin
EnforaObjectModel.Lock.Enter;
try
ObjectRootComponent.Visualization.Descriptor.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
ObjectRootComponent.Visualization.Descriptor.Write();
end;

function TEnforaObjectTracker1BusinessModel.getVisualization: TObjectDescriptor;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Visualization.Descriptor.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setHintID(Value: integer);
begin
EnforaObjectModel.Lock.Enter;
try
ObjectRootComponent.Hint.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
ObjectRootComponent.Hint.Write();
end;

function TEnforaObjectTracker1BusinessModel.getHintID: integer;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Hint.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setUserAlertID(Value: integer);
begin
EnforaObjectModel.Lock.Enter;
try
ObjectRootComponent.UserAlert.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
ObjectRootComponent.UserAlert.Write();
end;

function TEnforaObjectTracker1BusinessModel.getUserAlertID: integer;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.UserAlert.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setOnlineFlagID(Value: integer);
begin
EnforaObjectModel.Lock.Enter;
try
ObjectRootComponent.OnlineFlag.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
ObjectRootComponent.OnlineFlag.Write();
end;

function TEnforaObjectTracker1BusinessModel.getOnlineFlagID: integer;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.OnlineFlag.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setLocationIsAvailableFlagID(Value: integer);
begin
EnforaObjectModel.Lock.Enter;
try
ObjectRootComponent.LocationIsAvailableFlag.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
ObjectRootComponent.LocationIsAvailableFlag.Write();
end;

function TEnforaObjectTracker1BusinessModel.getLocationIsAvailableFlagID: integer;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.LocationIsAvailableFlag.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setDeviceDatumID(Value: integer);
begin
EnforaObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DatumID.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DatumID.Write();
end;

function TEnforaObjectTracker1BusinessModel.getDeviceDatumID: integer;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DatumID.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setDeviceGeoDistanceThreshold(Value: integer);
begin
EnforaObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DistanceThreshold.Value:=Value;
finally
EnforaObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DistanceThreshold.Write();
end;

function TEnforaObjectTracker1BusinessModel.getDeviceGeoDistanceThreshold: integer;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DistanceThreshold.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

function TEnforaObjectTracker1BusinessModel.getDeviceConnectionServiceProviderAccount: Word;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Account.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

function TEnforaObjectTracker1BusinessModel.getDeviceBatteryVoltage: Word;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Voltage.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

function TEnforaObjectTracker1BusinessModel.getDeviceBatteryCharge: Word;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Charge.Value;
finally
EnforaObjectModel.Lock.Leave;
end;
end;

function TEnforaObjectTracker1BusinessModel.getAlertSeverity: TTrackLoggerAlertSeverity;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=TTrackLoggerAlertSeverity((DeviceRootComponent.GPIModule.Value.Value AND 1)*3);
finally
EnforaObjectModel.Lock.Leave;
end;
end;

function TEnforaObjectTracker1BusinessModel.getDoorsAreLocked: boolean;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=Boolean(DeviceRootComponent.GPIModule.Value.Value AND 2);
finally
EnforaObjectModel.Lock.Leave;
end;
end;

procedure TEnforaObjectTracker1BusinessModel.setDisableObjectMoving(Value: boolean);
var
  Address: TAddress;
begin
EnforaObjectModel.Lock.Enter;
try
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value OR 4)
 else DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value AND (NOT 4));
finally
EnforaObjectModel.Lock.Leave;
end;
SetLength(Address,1);
Address[0]:=2;
DeviceRootComponent.GPOModule.Value.WriteDeviceByAddress(Address);
end;

function TEnforaObjectTracker1BusinessModel.getDisableObjectMoving: boolean;
begin
EnforaObjectModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value AND 4) = 4);
finally
EnforaObjectModel.Lock.Leave;
end;
end;


end.
