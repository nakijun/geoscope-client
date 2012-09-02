unit unitEnforaMT3000TrackerBusinessModel;
Interface
uses
  Windows,
  SysUtils,
  Classes,
  Forms,
  Graphics,
  unitObjectModel,
  unitEnforaMT3000ObjectModel,
  //.
  unitBusinessModel,
  unitEnforaMT3000ObjectBusinessModel;

Type
  TTrackerAlertSeverity = (
    asNone = 0,
    asMinor = 1,
    asMajor = 2,
    asCritical = 3
  );

Const
  TrackerAlertSeverityStrings: array[TTrackerAlertSeverity] of string = (
    'None',
    'Minor',
    'Major',
    'Critical'
  );

  TrackerAlertSeverityColors: array[TTrackerAlertSeverity] of TColor = (
    clSilver,
    clYellow,
    clFuchsia,
    clRed
  );

Type
  TEnforaMT3000TrackerBusinessModel = class(TEnforaMT3000ObjectBusinessModel)
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
    function getDeviceConnectionServiceProviderSignal: Word;
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
    function getAlertSeverity: TTrackerAlertSeverity;
    //. out
    procedure setDisableObjectMoving(Value: boolean);
    function getDisableObjectMoving: boolean;
    procedure setDisableObject(Value: boolean);
    function getDisableObject: boolean;
  public
    ObjectModel: TEnforaMT3000ObjectModel;
    ObjectRootComponent: TEnforaMT3000ObjectComponent;
    DeviceRootComponent: TEnforaMT3000ObjectDeviceComponent;

    class function ID: integer; override;
    class function Name: string; override; 
    class function CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel; override;

    Constructor Create(const pEnforaMT3000ObjectModel: TEnforaMT3000ObjectModel);
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
    property DeviceConnectionServiceProviderSignal: Word read getDeviceConnectionServiceProviderSignal;
    property GeoSpaceID: integer read getGeoSpaceID write setGeoSpaceID;
    property Visualization: TObjectDescriptor read getVisualization write setVisualization;
    property HintID: integer read getHintID write setHintID;
    property UserAlertID: integer read getUserAlertID write setUserAlertID;
    property OnlineFlagID: integer read getOnlineFlagID write setOnlineFlagID;
    property LocationIsAvailableFlagID: integer read getLocationIsAvailableFlagID write setLocationIsAvailableFlagID;
    property DeviceDatumID: integer read getDeviceDatumID write setDeviceDatumID;
    property DeviceGeoDistanceThreshold: integer read getDeviceGeoDistanceThreshold write setDeviceGeoDistanceThreshold;
    //. in properties
    property AlertSeverity: TTrackerAlertSeverity read getAlertSeverity;
    property DeviceConnectionServiceProviderAccount: Word read getDeviceConnectionServiceProviderAccount;
    property DeviceBatteryVoltage: Word read getDeviceBatteryVoltage;
    property DeviceBatteryCharge: Word read getDeviceBatteryCharge;
    //. out properties
    property DisableObjectMoving: boolean read getDisableObjectMoving write setDisableObjectMoving;
    property DisableObject: boolean read getDisableObject write setDisableObject;
  end;

Implementation
uses
  unitEnforaMT3000TrackerBusinessModelControlPanel,
  unitEnforaMT3000TrackerBusinessModelConstructorPanel,
  unitEnforaMT3000TrackerBusinessModelDeviceInitializerPanel;


Const
  EnforaMT3000TrackerBusinessModelID = 1;


{TEnforaMT3000TrackerBusinessModel}
class function TEnforaMT3000TrackerBusinessModel.ID: integer;
begin
Result:=EnforaMT3000TrackerBusinessModelID;
end;

class function TEnforaMT3000TrackerBusinessModel.Name: string;
begin
Result:='EnforaMT3000.Tracker';
end;

class function TEnforaMT3000TrackerBusinessModel.CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel;
begin
Result:=TTEnforaMT3000TrackerBusinessModelConstructorPanel.Create(TEnforaMT3000TrackerBusinessModel);
end;

Constructor TEnforaMT3000TrackerBusinessModel.Create(const pEnforaMT3000ObjectModel: TEnforaMT3000ObjectModel);
begin
ObjectModel:=pEnforaMT3000ObjectModel;
ObjectRootComponent:=TEnforaMT3000ObjectComponent(ObjectModel.ObjectSchema.RootComponent);
DeviceRootComponent:=TEnforaMT3000ObjectDeviceComponent(ObjectModel.ObjectDeviceSchema.RootComponent);
Inherited Create(pEnforaMT3000ObjectModel);
end;

procedure TEnforaMT3000TrackerBusinessModel.Update();
begin
//. prepare object schema side
ObjectRootComponent.LoadAll();
//. prepare object device schema side
DeviceRootComponent.LoadAll();
//.
Inherited;
end;

function TEnforaMT3000TrackerBusinessModel.GetControlPanel: TBusinessModelControlPanel;
begin
ControlPanelLock.Enter;
try
if (ControlPanel = nil) then ControlPanel:=TEnforaMT3000TrackerBusinessModelControlPanel.Create(Self);
Result:=ControlPanel;
finally
ControlPanelLock.Leave;
end;
end;

function TEnforaMT3000TrackerBusinessModel.CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
Result:=TfmEnforaMT3000TrackerBusinessModelDeviceInitializerPanel.Create(Self);
end;

function TEnforaMT3000TrackerBusinessModel.IsObjectOnline: boolean;
begin
Result:=(ObjectModel.IsObjectOnline());
end;

function TEnforaMT3000TrackerBusinessModel.CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer;

  procedure ProcessForAlertState(var ptrTrackEvent: pointer);
  var
    Alert: TTrackerAlertSeverity;
    _Severity: TObjectTrackEventSeverity;
  begin
  {///? if ((DeviceRootComponent.GPIModule.Value.Value.Value AND 3) <> (DeviceRootComponent.GPIModule.Value.LastValue.Value AND 3))
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
    EventMessage:=EventMessage+'Alert: '+TrackerAlertSeverityStrings[AlertSeverity]+' ';
    if (Integer(_Severity) > Integer(Severity)) then Severity:=_Severity;
    end;
    end;}
  end;

var
  S: string;
  POIID: Int64;
begin
Result:=nil;
ObjectModel.Lock.Enter;
try
if ((ComponentElement = DeviceRootComponent.Configuration) AND (NOT flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesInfo;
  EventMessage:='Reinitialize device';
  end;
  end else
if ((ComponentElement = DeviceRootComponent.ConnectionModule.IsOnline) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  if (DeviceRootComponent.ConnectionModule.IsOnline.BoolValue.Value)
   then begin
    S:='Online';
    Severity:=otesMinor;
    end
   else begin
    S:='Offline';
    Severity:=otesMinor;
    end;
  EventMessage:='Device is '+S;
  end;
  end else
if ((ComponentElement = DeviceRootComponent.BatteryModule.Charge) AND (flSetCommand))
 then begin
  if (DeviceRootComponent.BatteryModule.Charge.Value.Value < 30.0{%})
   then begin
    Result:=ComponentElement.ToTrackEvent();
    with TObjectTrackEvent(Result^) do begin
    Severity:=otesMinor;
    EventMessage:='Battery charge: '+FormatFloat('0',DeviceRootComponent.BatteryModule.Charge.Value.Value)+' %';
    end;
    end;
  end else
if ((ComponentElement = DeviceRootComponent.ConnectionModule.ServiceProvider.Signal) AND (flSetCommand))
 then begin
  if (DeviceRootComponent.ConnectionModule.ServiceProvider.Signal.Value.Value < 10.0)
   then begin
    Result:=ComponentElement.ToTrackEvent();
    with TObjectTrackEvent(Result^) do begin
    Severity:=otesMinor;
    EventMessage:='Signal value: '+FormatFloat('0',DeviceRootComponent.ConnectionModule.ServiceProvider.Signal.Value.Value);
    end;
    end;
  end else
if ((ComponentElement = DeviceRootComponent.GPSModule.IsActive) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMinor;
  if (DeviceRootComponent.GPSModule.IsActive.BoolValue.Value)
   then EventMessage:='GPS receiver is ON'
   else EventMessage:='GPS receiver is off';
  end;
  end else
if (((ComponentElement = DeviceRootComponent.GPSModule.GPSFixData) AND (flSetCommand)))
 then begin
  if (DeviceRootComponent.GPSModule.GPSFixData.Value.Precision = UnavailableFixPrecision)
   then begin
    Result:=ComponentElement.ToTrackEvent();
    with TObjectTrackEvent(Result^) do begin
    Severity:=otesInfo;
    EventMessage:='Location fix is unavailable';
    end;
    end
   else
    if ((DeviceRootComponent.GPSModule.GPSFixData.Value.Precision <> UnavailableFixPrecision) AND (DeviceRootComponent.GPSModule.GPSFixData.LastValue.Precision = UnavailableFixPrecision))
     then begin
      Result:=ComponentElement.ToTrackEvent();
      with TObjectTrackEvent(Result^) do begin
      Severity:=otesInfo;
      EventMessage:='Location fix is Available';
      end;
      end;
  end else
if ((ComponentElement = DeviceRootComponent.GPSModule.MapPOI.MapPOIData) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesCritical;
  EventTag:=EVENTTAG_POI_NEW;
  EventMessage:='Created new map hint';
  POIID:=DeviceRootComponent.GPSModule.MapPOI.MapPOIData.Value.POIID;
  SetLength(EventExtra,SizeOf(POIID));
  Int64(Pointer(@EventExtra[0])^):=POIID;
  end;
  end else
if ((ComponentElement = DeviceRootComponent.GPSModule.MapPOI.Text) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesCritical;
  EventTag:=EVENTTAG_POI_ADDTEXT;
  EventMessage:=DeviceRootComponent.GPSModule.MapPOI.Text.Value.Value;
  SetLength(EventExtra,0);
  end;
  end else
if ((ComponentElement = DeviceRootComponent.GPSModule.MapPOI.Image) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMinor;
  EventTag:=EVENTTAG_POI_ADDIMAGE;
  EventMessage:='POI-Image';
  SetLength(EventExtra,0);
  end;
  end else
if ((ComponentElement = DeviceRootComponent.GPSModule.MapPOI.DataFile) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMinor;
  EventTag:=EVENTTAG_POI_ADDDATAFILE;
  EventMessage:='POI-DataFile';
  SetLength(EventExtra,0);
  end;
  end else
if ((ComponentElement = DeviceRootComponent.AccelerometerModule.Value) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesInfo;
  EventMessage:='Acceleration: '+FormatFloat('0.0',DeviceRootComponent.AccelerometerModule.Value.Value.Value);
  end;
  end else
if ((ComponentElement = DeviceRootComponent.IgnitionModule.Value) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesInfo;
  if (DeviceRootComponent.IgnitionModule.Value.BoolValue.Value)
   then EventMessage:='Ignition: ON'
   else EventMessage:='Ignition: off';
  end;
  end else
if ((ComponentElement = DeviceRootComponent.TowAlertModule.Value) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMajor;
  if (DeviceRootComponent.TowAlertModule.Value.BoolValue.Value)
   then EventMessage:='Tow alert: ON'
   else EventMessage:='Tow alert: off';
  end;
  end else
if ((ComponentElement = DeviceRootComponent.OBDIIModule.BatteryModule.IsLow) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMajor;
  if (DeviceRootComponent.OBDIIModule.BatteryModule.IsLow.BoolValue.Value)
   then EventMessage:='Accumulator battery is LOW'
   else EventMessage:='Accumulator battery is ok';
  end;
  end else
if ((ComponentElement = DeviceRootComponent.OBDIIModule.FuelModule.IsLow) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMajor;
  if (DeviceRootComponent.OBDIIModule.FuelModule.IsLow.BoolValue.Value)
   then EventMessage:='Fuel is LOW'
   else EventMessage:='Fuel is ok';
  end;
  end else
if ((ComponentElement = DeviceRootComponent.OBDIIModule.TachometerModule.Value) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesInfo;
  EventMessage:='Tachometer: '+IntToStr(DeviceRootComponent.OBDIIModule.TachometerModule.Value.Value.Value)+' RPM';
  end;
  end else
if ((ComponentElement = DeviceRootComponent.OBDIIModule.SpeedometerModule.Value) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesInfo;
  EventMessage:='Speedometer: '+FormatFloat('0.0',DeviceRootComponent.OBDIIModule.SpeedometerModule.Value.Value.Value)+' Km/h';
  end;
  end else
if ((ComponentElement = DeviceRootComponent.OBDIIModule.MILAlertModule.AlertCodes) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMajor;
  if (DeviceRootComponent.OBDIIModule.MILAlertModule.AlertCodes.Value.Value <> '')
   then EventMessage:='MIL code: '+DeviceRootComponent.OBDIIModule.MILAlertModule.AlertCodes.Value.Value
   else EventMessage:='MIL code is clear'; 
  end;
  end else
if ((ComponentElement = DeviceRootComponent.OBDIIModule.OdometerModule.Value) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesInfo;
  EventMessage:='Odometer: '+FormatFloat('0.0',DeviceRootComponent.OBDIIModule.OdometerModule.Value.Value.Value)+' Km';
  end;
  end else
if ((ComponentElement = DeviceRootComponent.StatusModule.IsStop) AND (flSetCommand))
 then begin
  if (DeviceRootComponent.StatusModule.IsStop.BoolValue.Value)
   then begin
    Result:=ComponentElement.ToTrackEvent();
    with TObjectTrackEvent(Result^) do begin
    Severity:=otesInfo;
    EventMessage:='Stop';
    end;
    end;
  end else
if ((ComponentElement = DeviceRootComponent.StatusModule.IsIdle) AND (flSetCommand))
 then begin
  if (DeviceRootComponent.StatusModule.IsIdle.BoolValue.Value)
   then begin
    Result:=ComponentElement.ToTrackEvent();
    with TObjectTrackEvent(Result^) do begin
    Severity:=otesInfo;
    EventMessage:='Idle';
    end;
    end;
  end else
if ((ComponentElement = DeviceRootComponent.StatusModule.IsMotion) AND (flSetCommand))
 then begin
  if (DeviceRootComponent.StatusModule.IsMotion.BoolValue.Value)
   then begin
    Result:=ComponentElement.ToTrackEvent();
    with TObjectTrackEvent(Result^) do begin
    Severity:=otesInfo;
    EventMessage:='Motion';
    end;
    end;
  end else
if ((ComponentElement = DeviceRootComponent.StatusModule.IsMIL) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMajor;
  if (DeviceRootComponent.StatusModule.IsMIL.BoolValue.Value)
   then EventMessage:='MIL is SET'
   else EventMessage:='MIL is clear'; 
  end;
  end else ;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setCheckpointInterval(Value: integer);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.CheckPointInterval.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.CheckPointInterval.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getCheckpointInterval: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.CheckPointInterval.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setDeviceDescriptorVendor(Value: DWord);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Vendor.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Vendor.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceDescriptorVendor: DWord;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Vendor.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setDeviceDescriptorModel(Value: DWord);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Model.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Model.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceDescriptorModel: DWord;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Model.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setDeviceDescriptorSerialNumber(Value: DWord);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SerialNumber.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SerialNumber.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceDescriptorSerialNumber: DWord;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SerialNumber.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setDeviceDescriptorProductionDate(Value: TDateTime);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.ProductionDate.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.ProductionDate.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceDescriptorProductionDate: TDateTime;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.ProductionDate.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setDeviceDescriptorHWVersion(Value: DWord);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.HWVersion.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.HWVersion.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceDescriptorHWVersion: DWord;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.HWVersion.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setDeviceDescriptorSWVersion(Value: DWord);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SWVersion.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SWVersion.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceDescriptorSWVersion: DWord;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SWVersion.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setDeviceConnectionServiceProviderID(Value: Word);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceConnectionServiceProviderID: Word;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setDeviceConnectionServiceNumber(Value: double);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceConnectionServiceNumber: double;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceConnectionServiceProviderSignal: Word;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Signal.Value.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setGeoSpaceID(Value: integer);
begin
ObjectModel.Lock.Enter;
try
ObjectRootComponent.GeoSpaceID.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
ObjectRootComponent.GeoSpaceID.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getGeoSpaceID: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.GeoSpaceID.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setVisualization(Value: TObjectDescriptor);
begin
ObjectModel.Lock.Enter;
try
ObjectRootComponent.Visualization.Descriptor.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
ObjectRootComponent.Visualization.Descriptor.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getVisualization: TObjectDescriptor;
begin
ObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Visualization.Descriptor.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setHintID(Value: integer);
begin
ObjectModel.Lock.Enter;
try
ObjectRootComponent.Hint.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
ObjectRootComponent.Hint.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getHintID: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Hint.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setUserAlertID(Value: integer);
begin
ObjectModel.Lock.Enter;
try
ObjectRootComponent.UserAlert.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
ObjectRootComponent.UserAlert.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getUserAlertID: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.UserAlert.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setOnlineFlagID(Value: integer);
begin
ObjectModel.Lock.Enter;
try
ObjectRootComponent.OnlineFlag.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
ObjectRootComponent.OnlineFlag.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getOnlineFlagID: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.OnlineFlag.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setLocationIsAvailableFlagID(Value: integer);
begin
ObjectModel.Lock.Enter;
try
ObjectRootComponent.LocationIsAvailableFlag.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
ObjectRootComponent.LocationIsAvailableFlag.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getLocationIsAvailableFlagID: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.LocationIsAvailableFlag.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setDeviceDatumID(Value: integer);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DatumID.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DatumID.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceDatumID: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DatumID.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setDeviceGeoDistanceThreshold(Value: integer);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DistanceThreshold.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DistanceThreshold.WriteCUAC();
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceGeoDistanceThreshold: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DistanceThreshold.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceConnectionServiceProviderAccount: Word;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Account.Value.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceBatteryVoltage: Word;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Voltage.Value.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

function TEnforaMT3000TrackerBusinessModel.getDeviceBatteryCharge: Word;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Charge.Value.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

function TEnforaMT3000TrackerBusinessModel.getAlertSeverity: TTrackerAlertSeverity;
begin
ObjectModel.Lock.Enter;
try
if (DeviceRootComponent.StatusModule.IsMIL.BoolValue.Value)
 then Result:=asMajor
 else Result:=asNone;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setDisableObjectMoving(Value: boolean);
begin
{///? ObjectModel.Lock.Enter;
try
DeviceRootComponent.GPOModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value.Value OR 1)
 else DeviceRootComponent.GPOModule.Value.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value.Value AND (NOT 1));
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPOModule.Value.WriteDeviceCUAC();}
end;

function TEnforaMT3000TrackerBusinessModel.getDisableObjectMoving: boolean;
begin
ObjectModel.Lock.Enter;
try
Result:=false; ///? ((DeviceRootComponent.GPOModule.Value.Value.Value AND 1) = 1);
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMT3000TrackerBusinessModel.setDisableObject(Value: boolean);
begin
{///? ObjectModel.Lock.Enter;
try
DeviceRootComponent.GPOModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value.Value OR 2)
 else DeviceRootComponent.GPOModule.Value.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value.Value AND (NOT 2));
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPOModule.Value.WriteDeviceCUAC();}
end;

function TEnforaMT3000TrackerBusinessModel.getDisableObject: boolean;
begin
{///? ObjectModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value.Value AND 2) = 2);
finally
ObjectModel.Lock.Leave;
end;}
end;


end.
