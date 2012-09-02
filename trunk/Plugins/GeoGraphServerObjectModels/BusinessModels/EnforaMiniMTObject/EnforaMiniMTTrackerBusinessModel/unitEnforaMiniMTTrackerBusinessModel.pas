unit unitEnforaMiniMTTrackerBusinessModel;
Interface
uses
  Windows,
  SysUtils,
  Classes,
  Forms,
  Graphics,
  unitObjectModel,
  unitEnforaMiniMTObjectModel,
  //.
  unitBusinessModel,
  unitEnforaMiniMTObjectBusinessModel;

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
  TEnforaMiniMTTrackerBusinessModel = class(TEnforaMiniMTObjectBusinessModel)
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
    ObjectModel: TEnforaMiniMTObjectModel;
    ObjectRootComponent: TEnforaMiniMTObjectComponent;
    DeviceRootComponent: TEnforaMiniMTObjectDeviceComponent;

    class function ID: integer; override;
    class function Name: string; override; 
    class function CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel; override;

    Constructor Create(const pEnforaMiniMTObjectModel: TEnforaMiniMTObjectModel);
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
  unitEnforaMiniMTTrackerBusinessModelControlPanel,
  unitEnforaMiniMTTrackerBusinessModelConstructorPanel,
  unitEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel;


Const
  EnforaMiniMTTrackerBusinessModelID = 1;


{TEnforaMiniMTTrackerBusinessModel}
class function TEnforaMiniMTTrackerBusinessModel.ID: integer;
begin
Result:=EnforaMiniMTTrackerBusinessModelID;
end;

class function TEnforaMiniMTTrackerBusinessModel.Name: string;
begin
Result:='EnforaMiniMT.Tracker';
end;

class function TEnforaMiniMTTrackerBusinessModel.CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel;
begin
Result:=TTEnforaMiniMTTrackerBusinessModelConstructorPanel.Create(TEnforaMiniMTTrackerBusinessModel);
end;

Constructor TEnforaMiniMTTrackerBusinessModel.Create(const pEnforaMiniMTObjectModel: TEnforaMiniMTObjectModel);
begin
ObjectModel:=pEnforaMiniMTObjectModel;
ObjectRootComponent:=TEnforaMiniMTObjectComponent(ObjectModel.ObjectSchema.RootComponent);
DeviceRootComponent:=TEnforaMiniMTObjectDeviceComponent(ObjectModel.ObjectDeviceSchema.RootComponent);
Inherited Create(pEnforaMiniMTObjectModel);
end;

procedure TEnforaMiniMTTrackerBusinessModel.Update();
begin
//. prepare object schema side
ObjectRootComponent.LoadAll();
//. prepare object device schema side
DeviceRootComponent.LoadAll();
//.
Inherited;
end;

function TEnforaMiniMTTrackerBusinessModel.GetControlPanel: TBusinessModelControlPanel;
begin
ControlPanelLock.Enter;
try
if (ControlPanel = nil) then ControlPanel:=TEnforaMiniMTTrackerBusinessModelControlPanel.Create(Self);
Result:=ControlPanel;
finally
ControlPanelLock.Leave;
end;
end;

function TEnforaMiniMTTrackerBusinessModel.CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
Result:=TfmEnforaMiniMTTrackerBusinessModelDeviceInitializerPanel.Create(Self);
end;

function TEnforaMiniMTTrackerBusinessModel.IsObjectOnline: boolean;
begin
Result:=(ObjectModel.IsObjectOnline());
end;

function TEnforaMiniMTTrackerBusinessModel.CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer;

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
if ((ComponentElement = DeviceRootComponent.AlarmStatusModule.IsBatteryAlarm) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMajor;
  if (DeviceRootComponent.AlarmStatusModule.IsBatteryAlarm.BoolValue.Value)
   then EventMessage:='Battery Alarm: ON'
   else EventMessage:='Battery Alarm: off';
  end;
  end else
if ((ComponentElement = DeviceRootComponent.AlarmStatusModule.IsButtonAlarm) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesCritical;
  if (DeviceRootComponent.AlarmStatusModule.IsButtonAlarm.BoolValue.Value)
   then EventMessage:='Button Alarm: ON'
   else EventMessage:='Button Alarm: off';
  end;
  end else
if ((ComponentElement = DeviceRootComponent.AlarmStatusModule.IsSpeedAlarm) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMajor;
  if (DeviceRootComponent.AlarmStatusModule.IsSpeedAlarm.BoolValue.Value)
   then EventMessage:='Speed Alarm: ON'
   else EventMessage:='Speed Alarm: off';
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
  end else ;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setCheckpointInterval(Value: integer);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.CheckPointInterval.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.CheckPointInterval.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getCheckpointInterval: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.CheckPointInterval.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setDeviceDescriptorVendor(Value: DWord);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Vendor.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Vendor.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceDescriptorVendor: DWord;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Vendor.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setDeviceDescriptorModel(Value: DWord);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Model.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Model.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceDescriptorModel: DWord;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Model.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setDeviceDescriptorSerialNumber(Value: DWord);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SerialNumber.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SerialNumber.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceDescriptorSerialNumber: DWord;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SerialNumber.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setDeviceDescriptorProductionDate(Value: TDateTime);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.ProductionDate.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.ProductionDate.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceDescriptorProductionDate: TDateTime;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.ProductionDate.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setDeviceDescriptorHWVersion(Value: DWord);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.HWVersion.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.HWVersion.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceDescriptorHWVersion: DWord;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.HWVersion.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setDeviceDescriptorSWVersion(Value: DWord);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SWVersion.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SWVersion.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceDescriptorSWVersion: DWord;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SWVersion.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setDeviceConnectionServiceProviderID(Value: Word);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceConnectionServiceProviderID: Word;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setDeviceConnectionServiceNumber(Value: double);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceConnectionServiceNumber: double;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceConnectionServiceProviderSignal: Word;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Signal.Value.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setGeoSpaceID(Value: integer);
begin
ObjectModel.Lock.Enter;
try
ObjectRootComponent.GeoSpaceID.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
ObjectRootComponent.GeoSpaceID.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getGeoSpaceID: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.GeoSpaceID.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setVisualization(Value: TObjectDescriptor);
begin
ObjectModel.Lock.Enter;
try
ObjectRootComponent.Visualization.Descriptor.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
ObjectRootComponent.Visualization.Descriptor.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getVisualization: TObjectDescriptor;
begin
ObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Visualization.Descriptor.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setHintID(Value: integer);
begin
ObjectModel.Lock.Enter;
try
ObjectRootComponent.Hint.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
ObjectRootComponent.Hint.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getHintID: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Hint.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setUserAlertID(Value: integer);
begin
ObjectModel.Lock.Enter;
try
ObjectRootComponent.UserAlert.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
ObjectRootComponent.UserAlert.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getUserAlertID: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.UserAlert.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setOnlineFlagID(Value: integer);
begin
ObjectModel.Lock.Enter;
try
ObjectRootComponent.OnlineFlag.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
ObjectRootComponent.OnlineFlag.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getOnlineFlagID: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.OnlineFlag.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setLocationIsAvailableFlagID(Value: integer);
begin
ObjectModel.Lock.Enter;
try
ObjectRootComponent.LocationIsAvailableFlag.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
ObjectRootComponent.LocationIsAvailableFlag.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getLocationIsAvailableFlagID: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.LocationIsAvailableFlag.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setDeviceDatumID(Value: integer);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DatumID.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DatumID.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceDatumID: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DatumID.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setDeviceGeoDistanceThreshold(Value: integer);
begin
ObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DistanceThreshold.Value:=Value;
finally
ObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DistanceThreshold.WriteCUAC();
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceGeoDistanceThreshold: integer;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DistanceThreshold.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceConnectionServiceProviderAccount: Word;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Account.Value.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceBatteryVoltage: Word;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Voltage.Value.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

function TEnforaMiniMTTrackerBusinessModel.getDeviceBatteryCharge: Word;
begin
ObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Charge.Value.Value;
finally
ObjectModel.Lock.Leave;
end;
end;

function TEnforaMiniMTTrackerBusinessModel.getAlertSeverity: TTrackerAlertSeverity;
begin
ObjectModel.Lock.Enter;
try
if (DeviceRootComponent.AlarmStatusModule.IsButtonAlarm.BoolValue.Value)
 then Result:=asCritical
 else Result:=asNone;
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setDisableObjectMoving(Value: boolean);
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

function TEnforaMiniMTTrackerBusinessModel.getDisableObjectMoving: boolean;
begin
ObjectModel.Lock.Enter;
try
Result:=false; ///? ((DeviceRootComponent.GPOModule.Value.Value.Value AND 1) = 1);
finally
ObjectModel.Lock.Leave;
end;
end;

procedure TEnforaMiniMTTrackerBusinessModel.setDisableObject(Value: boolean);
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

function TEnforaMiniMTTrackerBusinessModel.getDisableObject: boolean;
begin
{///? ObjectModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value.Value AND 2) = 2);
finally
ObjectModel.Lock.Leave;
end;}
end;


end.
