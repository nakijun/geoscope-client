unit unitGMO1TrackLogger1BusinessModel;
Interface
uses
  Windows,
  SysUtils,
  Classes,
  Forms,
  Graphics,
  GlobalSpaceDefines,
  unitObjectModel,
  unitGeoMonitoredObject1Model,
  //.
  unitBusinessModel,
  unitGMO1BusinessModel;

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
  TGMO1TrackLogger1BusinessModel = class(TGMO1BusinessModel)
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
    GeoMonitoredObject1Model: TGeoMonitoredObject1Model;
    ObjectRootComponent: TGeoMonitoredObject1Component;
    DeviceRootComponent: TGeoMonitoredObject1DeviceComponent;

    class function ID: integer; override;
    class function Name: string; override;
    class function CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel; override;

    Constructor Create(const pGeoMonitoredObject1Model: TGeoMonitoredObject1Model);
    procedure Update; override;
    function GetControlPanel: TBusinessModelControlPanel; override;
    function Object_GetHintInfo(const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean; override;
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
  TypesDefines,
  FunctionalityImport,
  unitGMO1TrackLogger1BusinessModelControlPanel,
  unitGMO1TrackLogger1BusinessModelConstructorPanel;


Const
  GMO1TrackLogger1BusinessModelID = 1;


{TGMO1TrackLogger1BusinessModel}
class function TGMO1TrackLogger1BusinessModel.ID: integer;
begin
Result:=GMO1TrackLogger1BusinessModelID;
end;

class function TGMO1TrackLogger1BusinessModel.Name: string;
begin
Result:='TrackLogger1';
end;

class function TGMO1TrackLogger1BusinessModel.CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel;
begin
Result:=TTGMO1TrackLogger1BusinessModelConstructorPanel.Create(TGMO1TrackLogger1BusinessModel);
end;

Constructor TGMO1TrackLogger1BusinessModel.Create(const pGeoMonitoredObject1Model: TGeoMonitoredObject1Model);
begin
GeoMonitoredObject1Model:=pGeoMonitoredObject1Model;
ObjectRootComponent:=TGeoMonitoredObject1Component(GeoMonitoredObject1Model.ObjectSchema.RootComponent);
DeviceRootComponent:=TGeoMonitoredObject1DeviceComponent(GeoMonitoredObject1Model.ObjectDeviceSchema.RootComponent);
Inherited Create(pGeoMonitoredObject1Model);
end;

procedure TGMO1TrackLogger1BusinessModel.Update;
begin
//. prepare object schema side
ObjectRootComponent.LoadAll();
//. prepare object device schema side
DeviceRootComponent.LoadAll();
//.
Inherited;
end;

function TGMO1TrackLogger1BusinessModel.GetControlPanel: TBusinessModelControlPanel;
begin
ControlPanelLock.Enter;
try
if (ControlPanel = nil) then ControlPanel:=TGMO1TrackLogger1BusinessModelControlPanel.Create(Self);
Result:=ControlPanel;
finally
ControlPanelLock.Leave;
end;
end;

function TGMO1TrackLogger1BusinessModel.Object_GetHintInfo(const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean;
var
  Infos: string;
  _Name: string;
  idTOwner,idOwner: integer;
  flOnline,flLocationIsAvailable: boolean;
  TimeStamp: double;
  DatumID: integer;
  Latitude: double;
  Longitude: double;
  Altitude: double;
  Speed: double;
  Bearing: double;
  Precision: double;
  LocationInfo: string;
begin
Info:=nil;
Result:=false;
//.
GeoMonitoredObject1Model.Lock.Enter();
try
case InfoType of
1: begin //. simple state+location
  case InfoFormat of
  1: begin //. txt format
    flOnline:=IsObjectOnline();
    if (flOnline)
     then flLocationIsAvailable:=(DeviceRootComponent.GPSModule.GPSFixData.Value.Precision <> NoFixPrecision);
    //.
    Infos:='Tracker: ';
    with TComponentFunctionality_Create(idTGeoGraphServerObject,ObjectModel.ObjectController.idGeoGraphServerObject) do
    try
    if (GetOwner({out} idTOwner,idOwner))
     then with TComponentFunctionality_Create(idTOwner,idOwner) do
      try
      _Name:=Name;
      finally
      Release();
      end
     else _Name:=Name; 
    finally
    Release();
    end;
    Infos:=Infos+_Name+#$0D#$0A+#$0D#$0A;
    Infos:=Infos+'State: '; if (flOnline) then Infos:=Infos+'Online' else Infos:=Infos+'offline'; Infos:=Infos+#$0D#$0A;
    if (true) ///? (flOnline)
     then begin
      Infos:=Infos+'Coordinates: ';
      if (NOT flLocationIsAvailable) then Infos:=Infos+'not available'; Infos:=Infos+#$0D#$0A;
      GeoMonitoredObject1Model.Object_GetLocationFix({out} TimeStamp,{out} DatumID,Latitude,Longitude,Altitude,Speed,Bearing,Precision);
      Infos:=Infos+#$0D#$0A+'  Time: '+FormatDateTime('DD/MM/YY HH:NN:SS',TimeStamp+TimeZoneDelta)+#$0D#$0A;
      Infos:=Infos+#$0D#$0A+'  Latitude: '+FormatFloat('0.000',Latitude)+#$0D#$0A;
      Infos:=Infos+'  Longitude: '+FormatFloat('0.000',Longitude)+#$0D#$0A;
      Infos:=Infos+'  Altitude: '+FormatFloat('0.000',Altitude)+#$0D#$0A+#$0D#$0A;
      Infos:=Infos+'  Speed: '+FormatFloat('00.0'+' Km/h',Speed)+#$0D#$0A;
      if (flLocationIsAvailable) then Infos:=Infos+'  Precision: '+FormatFloat('0'+' m',Precision)+#$0D#$0A;
      Infos:=Infos+#$0D#$0A;
      //.
      Infos:=Infos+'Location: '+#$0D#$0A;
      try
      GeoCoder_LatLongToNearestObjects(1{GEOCODER_YANDEXMAPS}, DatumID,Latitude,Longitude, {out} LocationInfo);
      if (LocationInfo = '') then LocationInfo:='?';
      except
        on E: Exception do LocationInfo:='!ERROR: '+E.Message;
        end;
      Infos:=Infos+LocationInfo+#$0D#$0A;
      end;
    Infos:=Infos+'Alert: '; Infos:=Infos+TrackLoggerAlertSeverityStrings[AlertSeverity]+#$0D#$0A;
    SetLength(Info,Length(Infos));
    if (Length(Infos) > 0) then Move(Pointer(@Infos[1])^,Pointer(@Info[0])^,Length(Infos));
    //.
    Result:=true;
    end;
  end;
  end;
end;
finally
GeoMonitoredObject1Model.Lock.Leave();
end;
end;

function TGMO1TrackLogger1BusinessModel.IsObjectOnline: boolean;
begin
Result:=(GeoMonitoredObject1Model.IsObjectOnline());
end;

function TGMO1TrackLogger1BusinessModel.CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer;

  procedure ProcessForAlertState(var ptrTrackEvent: pointer);
  var
    Alert: TTrackLoggerAlertSeverity;
    _Severity: TObjectTrackEventSeverity;
  begin
  if ((DeviceRootComponent.GPIModule.Value.Value.Value AND 3) <> (DeviceRootComponent.GPIModule.Value.LastValue.Value AND 3))
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
GeoMonitoredObject1Model.Lock.Enter;
try
if ((ComponentElement = DeviceRootComponent.Configuration) AND (NOT flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMajor;
  EventMessage:='Reinitialize device';
  end;
  end else
if ((ComponentElement = DeviceRootComponent.ConnectorModule.IsOnline) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  if (DeviceRootComponent.ConnectorModule.IsOnline.BoolValue.Value)
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
  EventMessage:='Battery voltage: '+FormatFloat('0.0',DeviceRootComponent.BatteryModule.Voltage.Value.Value/1000.0)+' v';
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
  EventMessage:=DeviceRootComponent.GPSModule.MapPOI.Text.Value.Value;
  SetLength(EventExtra,0);
  end;
  end else
if ((ComponentElement = DeviceRootComponent.GPSModule.MapPOI.DataFile) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesMinor;
  EventTag:=EVENTTAG_POI_ADDDATAFILE;
  EventMessage:=DeviceRootComponent.GPSModule.MapPOI.Text.Value.Value;
  SetLength(EventExtra,0);
  end;
  end ;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setCheckpointInterval(Value: integer);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.ConnectorModule.CheckPointInterval.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.ConnectorModule.CheckPointInterval.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getCheckpointInterval: integer;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectorModule.CheckPointInterval.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setDeviceDescriptorVendor(Value: DWord);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Vendor.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Vendor.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getDeviceDescriptorVendor: DWord;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Vendor.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setDeviceDescriptorModel(Value: DWord);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Model.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Model.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getDeviceDescriptorModel: DWord;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Model.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setDeviceDescriptorSerialNumber(Value: DWord);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SerialNumber.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SerialNumber.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getDeviceDescriptorSerialNumber: DWord;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SerialNumber.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setDeviceDescriptorProductionDate(Value: TDateTime);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.ProductionDate.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.ProductionDate.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getDeviceDescriptorProductionDate: TDateTime;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.ProductionDate.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setDeviceDescriptorHWVersion(Value: DWord);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.HWVersion.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.HWVersion.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getDeviceDescriptorHWVersion: DWord;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.HWVersion.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setDeviceDescriptorSWVersion(Value: DWord);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SWVersion.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SWVersion.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getDeviceDescriptorSWVersion: DWord;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SWVersion.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setDeviceConnectionServiceProviderID(Value: Word);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.ConnectorModule.ServiceProvider.ProviderID.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.ConnectorModule.ServiceProvider.ProviderID.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getDeviceConnectionServiceProviderID: Word;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectorModule.ServiceProvider.ProviderID.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setDeviceConnectionServiceNumber(Value: double);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.ConnectorModule.ServiceProvider.Number.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.ConnectorModule.ServiceProvider.Number.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getDeviceConnectionServiceNumber: double;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectorModule.ServiceProvider.Number.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

function TGMO1TrackLogger1BusinessModel.getDeviceConnectionServiceProviderSignal: Word;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectorModule.ServiceProvider.Signal.Value.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setGeoSpaceID(Value: integer);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
ObjectRootComponent.GeoSpaceID.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
ObjectRootComponent.GeoSpaceID.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getGeoSpaceID: integer;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=ObjectRootComponent.GeoSpaceID.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setVisualization(Value: TObjectDescriptor);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
ObjectRootComponent.Visualization.Descriptor.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
ObjectRootComponent.Visualization.Descriptor.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getVisualization: TObjectDescriptor;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=ObjectRootComponent.Visualization.Descriptor.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setHintID(Value: integer);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
ObjectRootComponent.Hint.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
ObjectRootComponent.Hint.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getHintID: integer;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=ObjectRootComponent.Hint.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setUserAlertID(Value: integer);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
ObjectRootComponent.UserAlert.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
ObjectRootComponent.UserAlert.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getUserAlertID: integer;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=ObjectRootComponent.UserAlert.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setOnlineFlagID(Value: integer);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
ObjectRootComponent.OnlineFlag.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
ObjectRootComponent.OnlineFlag.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getOnlineFlagID: integer;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=ObjectRootComponent.OnlineFlag.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setLocationIsAvailableFlagID(Value: integer);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
ObjectRootComponent.LocationIsAvailableFlag.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
ObjectRootComponent.LocationIsAvailableFlag.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getLocationIsAvailableFlagID: integer;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=ObjectRootComponent.LocationIsAvailableFlag.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setDeviceDatumID(Value: integer);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.GPSModule.DatumID.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DatumID.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getDeviceDatumID: integer;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DatumID.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setDeviceGeoDistanceThreshold(Value: integer);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.GPSModule.DistanceThreshold.Value:=Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DistanceThreshold.WriteCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getDeviceGeoDistanceThreshold: integer;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DistanceThreshold.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

function TGMO1TrackLogger1BusinessModel.getDeviceConnectionServiceProviderAccount: Word;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectorModule.ServiceProvider.Account.Value.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

function TGMO1TrackLogger1BusinessModel.getDeviceBatteryVoltage: Word;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Voltage.Value.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

function TGMO1TrackLogger1BusinessModel.getDeviceBatteryCharge: Word;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Charge.Value.Value;
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

function TGMO1TrackLogger1BusinessModel.getAlertSeverity: TTrackLoggerAlertSeverity;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=TTrackLoggerAlertSeverity(DeviceRootComponent.GPIModule.Value.Value.Value AND 3);
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setDisableObjectMoving(Value: boolean);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.GPOModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value.Value OR 1)
 else DeviceRootComponent.GPOModule.Value.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value.Value AND (NOT 1));
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.GPOModule.Value.WriteDeviceCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getDisableObjectMoving: boolean;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value.Value AND 1) = 1);
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;

procedure TGMO1TrackLogger1BusinessModel.setDisableObject(Value: boolean);
begin
GeoMonitoredObject1Model.Lock.Enter;
try
DeviceRootComponent.GPOModule.Value.Value.Timestamp:=Now-TimeZoneDelta;
if (Value)
 then DeviceRootComponent.GPOModule.Value.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value.Value OR 2)
 else DeviceRootComponent.GPOModule.Value.Value.Value:=(DeviceRootComponent.GPOModule.Value.Value.Value AND (NOT 2));
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
DeviceRootComponent.GPOModule.Value.WriteDeviceCUAC();
end;

function TGMO1TrackLogger1BusinessModel.getDisableObject: boolean;
begin
GeoMonitoredObject1Model.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value.Value AND 2) = 2);
finally
GeoMonitoredObject1Model.Lock.Leave;
end;
end;




end.
