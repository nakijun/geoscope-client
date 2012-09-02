unit unitGMOTrackLogger1BusinessModel;
Interface
uses
  Windows,
  SysUtils,
  Classes,
  Forms,
  Graphics,
  GlobalSpaceDefines,
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
  TGMOTrackLogger1BusinessModel = class(TGMOBusinessModel)
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
  unitGMOTrackLogger1BusinessModelControlPanel,
  unitGMOTrackLogger1BusinessModelConstructorPanel;


Const
  GMOTrackLogger1BusinessModelID = 1;


{TGMOTrackLogger1BusinessModel}
class function TGMOTrackLogger1BusinessModel.ID: integer;
begin
Result:=GMOTrackLogger1BusinessModelID;
end;

class function TGMOTrackLogger1BusinessModel.Name: string;
begin
Result:='TrackLogger1';
end;

class function TGMOTrackLogger1BusinessModel.CreateConstructorPanel(const pidGeoGraphServerObject: integer): TBusinessModelConstructorPanel;
begin
Result:=TTGMOTrackLogger1BusinessModelConstructorPanel.Create(TGMOTrackLogger1BusinessModel);
end;

Constructor TGMOTrackLogger1BusinessModel.Create(const pGeoMonitoredObjectModel: TGeoMonitoredObjectModel);
begin
GeoMonitoredObjectModel:=pGeoMonitoredObjectModel;
ObjectRootComponent:=TGeoMonitoredObjectComponent(GeoMonitoredObjectModel.ObjectSchema.RootComponent);
DeviceRootComponent:=TGeoMonitoredObjectDeviceComponent(GeoMonitoredObjectModel.ObjectDeviceSchema.RootComponent);
Inherited Create(pGeoMonitoredObjectModel);
end;

procedure TGMOTrackLogger1BusinessModel.Update;
begin
//. prepare object schema side
ObjectRootComponent.LoadAll();
//. prepare object device schema side
DeviceRootComponent.LoadAll();
//.
Inherited;
end;

function TGMOTrackLogger1BusinessModel.GetControlPanel: TBusinessModelControlPanel;
begin
ControlPanelLock.Enter;
try
if (ControlPanel = nil) then ControlPanel:=TGMOTrackLogger1BusinessModelControlPanel.Create(Self);
Result:=ControlPanel;
finally
ControlPanelLock.Leave;
end;
end;

function TGMOTrackLogger1BusinessModel.Object_GetHintInfo(const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean;
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
GeoMonitoredObjectModel.Lock.Enter();
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
      GeoMonitoredObjectModel.Object_GetLocationFix({out} TimeStamp,{out} DatumID,Latitude,Longitude,Altitude,Speed,Bearing,Precision);
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
GeoMonitoredObjectModel.Lock.Leave();
end;
end;

function TGMOTrackLogger1BusinessModel.IsObjectOnline: boolean;
begin
Result:=(GeoMonitoredObjectModel.IsObjectOnline());
end;

function TGMOTrackLogger1BusinessModel.CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer;

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
if ((ComponentElement = DeviceRootComponent.BatteryModule.Voltage) AND (flSetCommand))
 then begin
  Result:=ComponentElement.ToTrackEvent();
  with TObjectTrackEvent(Result^) do begin
  Severity:=otesInfo;
  EventMessage:='Battery voltage: '+FormatFloat('0.0',DeviceRootComponent.BatteryModule.Voltage.Value/1000.0)+' v';
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

procedure TGMOTrackLogger1BusinessModel.setCheckpointInterval(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.CheckPointInterval.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.CheckPointInterval.Write();
end;

function TGMOTrackLogger1BusinessModel.getCheckpointInterval: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.CheckPointInterval.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setDeviceDescriptorVendor(Value: DWord);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Vendor.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Vendor.Write();
end;

function TGMOTrackLogger1BusinessModel.getDeviceDescriptorVendor: DWord;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Vendor.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setDeviceDescriptorModel(Value: DWord);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.Model.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.Model.Write();
end;

function TGMOTrackLogger1BusinessModel.getDeviceDescriptorModel: DWord;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.Model.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setDeviceDescriptorSerialNumber(Value: DWord);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SerialNumber.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SerialNumber.Write();
end;

function TGMOTrackLogger1BusinessModel.getDeviceDescriptorSerialNumber: DWord;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SerialNumber.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setDeviceDescriptorProductionDate(Value: TDateTime);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.ProductionDate.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.ProductionDate.Write();
end;

function TGMOTrackLogger1BusinessModel.getDeviceDescriptorProductionDate: TDateTime;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.ProductionDate.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setDeviceDescriptorHWVersion(Value: DWord);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.HWVersion.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.HWVersion.Write();
end;

function TGMOTrackLogger1BusinessModel.getDeviceDescriptorHWVersion: DWord;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.HWVersion.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setDeviceDescriptorSWVersion(Value: DWord);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.DeviceDescriptor.SWVersion.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.DeviceDescriptor.SWVersion.Write();
end;

function TGMOTrackLogger1BusinessModel.getDeviceDescriptorSWVersion: DWord;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.DeviceDescriptor.SWVersion.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setDeviceConnectionServiceProviderID(Value: Word);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Write();
end;

function TGMOTrackLogger1BusinessModel.getDeviceConnectionServiceProviderID: Word;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.ProviderID.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setDeviceConnectionServiceNumber(Value: double);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Write();
end;

function TGMOTrackLogger1BusinessModel.getDeviceConnectionServiceNumber: double;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Number.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

function TGMOTrackLogger1BusinessModel.getDeviceConnectionServiceProviderSignal: Word;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Signal.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setGeoSpaceID(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
ObjectRootComponent.GeoSpaceID.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
ObjectRootComponent.GeoSpaceID.Write();
end;

function TGMOTrackLogger1BusinessModel.getGeoSpaceID: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.GeoSpaceID.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setVisualization(Value: TObjectDescriptor);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
ObjectRootComponent.Visualization.Descriptor.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
ObjectRootComponent.Visualization.Descriptor.Write();
end;

function TGMOTrackLogger1BusinessModel.getVisualization: TObjectDescriptor;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Visualization.Descriptor.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setHintID(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
ObjectRootComponent.Hint.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
ObjectRootComponent.Hint.Write();
end;

function TGMOTrackLogger1BusinessModel.getHintID: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.Hint.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setUserAlertID(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
ObjectRootComponent.UserAlert.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
ObjectRootComponent.UserAlert.Write();
end;

function TGMOTrackLogger1BusinessModel.getUserAlertID: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.UserAlert.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setOnlineFlagID(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
ObjectRootComponent.OnlineFlag.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
ObjectRootComponent.OnlineFlag.Write();
end;

function TGMOTrackLogger1BusinessModel.getOnlineFlagID: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.OnlineFlag.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setLocationIsAvailableFlagID(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
ObjectRootComponent.LocationIsAvailableFlag.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
ObjectRootComponent.LocationIsAvailableFlag.Write();
end;

function TGMOTrackLogger1BusinessModel.getLocationIsAvailableFlagID: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=ObjectRootComponent.LocationIsAvailableFlag.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setDeviceDatumID(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DatumID.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DatumID.Write();
end;

function TGMOTrackLogger1BusinessModel.getDeviceDatumID: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DatumID.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setDeviceGeoDistanceThreshold(Value: integer);
begin
GeoMonitoredObjectModel.Lock.Enter;
try
DeviceRootComponent.GPSModule.DistanceThreshold.Value:=Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
DeviceRootComponent.GPSModule.DistanceThreshold.Write();
end;

function TGMOTrackLogger1BusinessModel.getDeviceGeoDistanceThreshold: integer;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.GPSModule.DistanceThreshold.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

function TGMOTrackLogger1BusinessModel.getDeviceConnectionServiceProviderAccount: Word;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.ConnectionModule.ServiceProvider.Account.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

function TGMOTrackLogger1BusinessModel.getDeviceBatteryVoltage: Word;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Voltage.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

function TGMOTrackLogger1BusinessModel.getDeviceBatteryCharge: Word;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=DeviceRootComponent.BatteryModule.Charge.Value;
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

function TGMOTrackLogger1BusinessModel.getAlertSeverity: TTrackLoggerAlertSeverity;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=TTrackLoggerAlertSeverity(DeviceRootComponent.GPIModule.Value.Value AND 3);
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setDisableObjectMoving(Value: boolean);
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

function TGMOTrackLogger1BusinessModel.getDisableObjectMoving: boolean;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value AND 1) = 1);
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;

procedure TGMOTrackLogger1BusinessModel.setDisableObject(Value: boolean);
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

function TGMOTrackLogger1BusinessModel.getDisableObject: boolean;
begin
GeoMonitoredObjectModel.Lock.Enter;
try
Result:=((DeviceRootComponent.GPOModule.Value.Value AND 2) = 2);
finally
GeoMonitoredObjectModel.Lock.Leave;
end;
end;




end.
