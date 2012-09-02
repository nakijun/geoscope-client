unit unitGMOGeoLogAndroidBusinessModel;
Interface
uses
  Windows,
  SysUtils,
  Classes,
  Forms,
  Graphics,
  unitObjectModel,
  unitGeoMonitoredObjectModel,
  //.
  unitBusinessModel,
  unitGMOBusinessModel;

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
  TGMOGeoLogAndroidBusinessModel = class(TGMOBusinessModel)
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
    function getAlertSeverity: TTrackLoggerAlertSeverity;
    //. out
    procedure setDisableObjectMoving(Value: boolean);
    function getDisableObjectMoving: boolean;
    procedure setDisableObject(Value: boolean);
    function getDisableObject: boolean;
  public
    GeoMonitoredObjectModel: TGeoMonitoredObjectModel;
    ObjectRootComponent: TGeoMonitoredObjectComponent;
    DeviceRootComponent: TGeoMonitoredObjectDeviceComponent;

    class function ID: integer; override;
    class function Name: string; override; 
    class function CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel; override;

    Constructor Create(const pGeoMonitoredObjectModel: TGeoMonitoredObjectModel);
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
  unitGMOGeoLogAndroidBusinessModelControlPanel,
  unitGMOGeoLogAndroidBusinessModelConstructorPanel,
  unitGMOGeoLogAndroidBusinessModelDeviceInitializerPanel;


Const
  GMOGeoLogAndroidBusinessModelID = 2;


{TGMOGeoLogAndroidBusinessModel}
class function TGMOGeoLogAndroidBusinessModel.ID: integer;
begin
Result:=GMOGeoLogAndroidBusinessModelID;
end;

class function TGMOGeoLogAndroidBusinessModel.Name: string;
begin
Result:='GeoLog.Android';
end;

class function TGMOGeoLogAndroidBusinessModel.CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel;
begin
Result:=TTGMOGeoLogAndroidBusinessModelConstructorPanel.Create(TGMOGeoLogAndroidBusinessModel);
end;

Constructor TGMOGeoLogAndroidBusinessModel.Create(const pGeoMonitoredObjectModel: TGeoMonitoredObjectModel);
begin
GeoMonitoredObjectModel:=pGeoMonitoredObjectModel;
ObjectRootComponent:=TGeoMonitoredObjectComponent(GeoMonitoredObjectModel.ObjectSchema.RootComponent);
DeviceRootComponent:=TGeoMonitoredObjectDeviceComponent(GeoMonitoredObjectModel.ObjectDeviceSchema.RootComponent);
Inherited Create(pGeoMonitoredObjectModel);
end;

procedure TGMOGeoLogAndroidBusinessModel.Update;
begin
//. prepare object schema side
ObjectRootComponent.LoadAll();
//. prepare object device schema side
DeviceRootComponent.LoadAll();
//.
Inherited;
end;

function TGMOGeoLogAndroidBusinessModel.GetControlPanel: TBusinessModelControlPanel;
begin
ControlPanelLock.Enter;
try
if (ControlPanel = nil) then ControlPanel:=TGMOGeoLogAndroidBusinessModelControlPanel.Create(Self);
Result:=ControlPanel;
finally
ControlPanelLock.Leave;
end;
end;

function TGMOGeoLogAndroidBusinessModel.CreateDeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
Result:=TfmGMOGeoLogAndroidBusinessModelDeviceInitializerPanel.Create(Self);
end;

function TGMOGeoLogAndroidBusinessModel.IsObjectOnline: boolean;
begin
Result:=(GeoMonitoredObjectModel.IsObjectOnline());
end;

function TGMOGeoLogAndroidBusinessModel.CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer;

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
  POIID: Int64;
begin
Result:=nil;
GeoMonitoredObjectModel.Lock.Enter;
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
if ((ComponentElement = DeviceRootComponent.ConnectionModule.ServiceProvider.Signal) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesInfo;
  EventMessage:='Signal value: '+FormatFloat('0',DeviceRootComponent.ConnectionModule.ServiceProvider.Signal.Value);
  end;
  end else
if ((ComponentElement = DeviceRootComponent.BatteryModule.Charge) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesInfo;
  EventMessage:='Battery charge: '+FormatFloat('0',DeviceRootComponent.BatteryModule.Charge.Value)+' %';
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
  EventMessage:=DeviceRootComponent.GPSModule.MapPOI.Text.Value;
  SetLength(EventExtra,0);
  end;
  end else
if ((ComponentElement = DeviceRootComponent.GPSModule.MapPOI.Image) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMinor;
  EventTag:=EVENTTAG_POI_ADDIMAGE;
  EventMessage:=DeviceRootComponent.GPSModule.MapPOI.Text.Value;
  SetLength(EventExtra,0);
  end;
  end else
if ((ComponentElement = DeviceRootComponent.GPSModule.MapPOI.DataFile) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMinor;
  EventTag:=EVENTTAG_POI_ADDDATAFILE;
  EventMessage:=DeviceRootComponent.GPSModule.MapPOI.Text.Value;
  SetLength(EventExtra,0);
  end;
  end ;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setCheckpointInterval(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.CheckPointInterval.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.CheckPointInterval.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getCheckpointInterval: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.CheckPointInterval.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setDeviceDescriptorVendor(Value: DWord);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Vendor.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Vendor.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceDescriptorVendor: DWord;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Vendor.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setDeviceDescriptorModel(Value: DWord);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Model.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Model.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceDescriptorModel: DWord;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Model.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setDeviceDescriptorSerialNumber(Value: DWord);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SerialNumber.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SerialNumber.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceDescriptorSerialNumber: DWord;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SerialNumber.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setDeviceDescriptorProductionDate(Value: TDateTime);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.ProductionDate.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.ProductionDate.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceDescriptorProductionDate: TDateTime;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.ProductionDate.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setDeviceDescriptorHWVersion(Value: DWord);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.HWVersion.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.HWVersion.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceDescriptorHWVersion: DWord;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.HWVersion.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setDeviceDescriptorSWVersion(Value: DWord);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SWVersion.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SWVersion.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceDescriptorSWVersion: DWord;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SWVersion.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setDeviceConnectionServiceProviderID(Value: Word);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceConnectionServiceProviderID: Word;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setDeviceConnectionServiceNumber(Value: double);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceConnectionServiceNumber: double;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceConnectionServiceProviderSignal: Word;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Signal.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setGeoSpaceID(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
ObjectRootComponent.GeoSpaceID.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
ObjectRootComponent.GeoSpaceID.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getGeoSpaceID: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.GeoSpaceID.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setVisualization(Value: TObjectDescriptor);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
ObjectRootComponent.Visualization.Descriptor.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
ObjectRootComponent.Visualization.Descriptor.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getVisualization: TObjectDescriptor;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Visualization.Descriptor.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setHintID(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
ObjectRootComponent.Hint.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
ObjectRootComponent.Hint.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getHintID: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Hint.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setUserAlertID(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
ObjectRootComponent.UserAlert.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
ObjectRootComponent.UserAlert.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getUserAlertID: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.UserAlert.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setOnlineFlagID(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
ObjectRootComponent.OnlineFlag.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
ObjectRootComponent.OnlineFlag.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getOnlineFlagID: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.OnlineFlag.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setLocationIsAvailableFlagID(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
ObjectRootComponent.LocationIsAvailableFlag.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
ObjectRootComponent.LocationIsAvailableFlag.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getLocationIsAvailableFlagID: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.LocationIsAvailableFlag.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setDeviceDatumID(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DatumID.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DatumID.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceDatumID: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DatumID.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setDeviceGeoDistanceThreshold(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DistanceThreshold.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DistanceThreshold.Write();
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceGeoDistanceThreshold: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DistanceThreshold.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceConnectionServiceProviderAccount: Word;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Account.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceBatteryVoltage: Word;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Voltage.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

function TGMOGeoLogAndroidBusinessModel.getDeviceBatteryCharge: Word;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Charge.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

function TGMOGeoLogAndroidBusinessModel.getAlertSeverity: TTrackLoggerAlertSeverity;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=TTrackLoggerAlertSeverity(DeviceRootComponent.GPIModule.Value.Value AND 3);
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setDisableObjectMoving(Value: boolean);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value OR 1)
 else DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value AND (NOT 1));
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPOModule.Value.WriteDevice();
end;

function TGMOGeoLogAndroidBusinessModel.getDisableObjectMoving: boolean;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value AND 1) = 1);
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOGeoLogAndroidBusinessModel.setDisableObject(Value: boolean);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value OR 2)
 else DeviceRootComponent.GPOModule.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value AND (NOT 2));
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPOModule.Value.WriteDevice();
end;

function TGMOGeoLogAndroidBusinessModel.getDisableObject: boolean;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value AND 2) = 2);
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;




end.
