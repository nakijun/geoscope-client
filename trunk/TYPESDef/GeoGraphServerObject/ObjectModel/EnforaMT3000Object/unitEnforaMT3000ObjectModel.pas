unit unitEnforaMT3000ObjectModel;
Interface
uses
  Windows,
  SysUtils,
  Classes,
  MSXML,
  ActiveX,
  Forms,
  GlobalSpaceDefines,
  unitGEOGraphServerController,
  unitObjectModel;

Const
  EnforaMT3000ObjectModelID = 201;
                                                      
Const
  UnavailableFixPrecision = 1000000000.0;
  UnknownFixPrecision     = -1000000000.0;
  
Type
  TEnforaMT3000ObjectComponent = class;                 
  TEnforaMT3000ObjectDeviceComponent = class;

  //. Object schema side
  TVisualizationComponent = class(TSchemaComponent)
  public
    Descriptor:         TComponentObjectDescriptorValue;
    LastXYPosition:     TComponentXYCrdValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TConfigurationData = packed record
    GeoSpaceID: integer;
    idTVisualization: integer;
    idVisualization: integer;
    idHint: integer;
    idUserAlert: integer;
    idOnlineFlag: integer;
    idLocationIsAvailableFlag: integer;
  end;

  TConfigurationValue = class(TComponentValue)
  private
    ObjectComponent: TEnforaMT3000ObjectComponent;
  public
    Value: TConfigurationData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
  end;

  TEnforaMT3000ObjectComponent = class(TSchemaComponent)
  public
    GeoSpaceID:                 TComponentInt32Value;
    Visualization:              TVisualizationComponent;
    Hint:                       TComponentInt32Value;
    UserAlert:                  TComponentInt32Value;
    OnlineFlag:                 TComponentInt32Value;
    LocationIsAvailableFlag:    TComponentInt32Value;
    //. referenced values
    Configuration:      TConfigurationValue;

    Constructor Create(const pSchema: TComponentSchema);
  end;

  TEnforaMT3000ObjectSchema = class(TComponentSchema)
  public
    Constructor Create(const pObjectModel: TObjectModel);
  end;


  //. Object device schema side
  TDeviceDescriptor = class(TSchemaComponent)
  public
    Vendor: TComponentUInt32Value;
    Model: TComponentUInt32Value;
    SerialNumber: TComponentUInt32Value;
    ProductionDate: TComponentDoubleValue;
    HWVersion: TComponentUInt32Value;
    SWVersion: TComponentUInt32Value;
    FOTA: TComponentANSIStringValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TControlDataValue = class(TComponentTimestampedDataValue)
  public
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    function ToTrackEvent(): pointer; override;
  end;

  TControlCommandResponse = class(TComponentTimestampedDataValue)
  public
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    function ToTrackEvent(): pointer; override;
  end;

  TControlModule = class(TSchemaComponent)
  public
    //. referenced values
    ControlDataValue: TControlDataValue;
    ControlCommandResponse: TControlCommandResponse;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TBatteryModule = class(TSchemaComponent)
  public
    Voltage: TComponentTimestampedUInt16Value;
    Charge: TComponentTimestampedUInt16Value;
    IsExternalPower: TComponentTimestampedBooleanValue;
    IsLowPowerMode: TComponentTimestampedBooleanValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TConnectionModuleServiceProvider = class(TSchemaComponent)
  public
    ProviderID: TComponentUInt16Value;
    Number: TComponentDoubleValue;
    Account: TComponentTimestampedUInt16Value;
    Signal: TComponentTimestampedUInt16Value;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TConnectionModule = class(TSchemaComponent)
  public
    ServiceProvider: TConnectionModuleServiceProvider;
    CheckPointInterval: TComponentInt16Value;
    LastCheckpointTime: TComponentDoubleValue;
    IsOnline: TComponentTimestampedBooleanValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TGPSFixData = packed record
    Timestamp: double;
    Latitude: double;
    Longitude: double;
    Altitude: double;
    Speed: double;
    Bearing: double;
    Precision: double;
  end;

  TGPSFixDataValue = class(TComponentValue)
  public
    Value: TGPSFixData;
    LastValue: TGPSFixData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackNode(): pointer; override;
    function ToTrackEvent(): pointer; override;
  end;

  TMapPOIData = packed record
    Timestamp: Double;
    MapID: DWord;
    POIID: DWord;
    POIType: DWord;
    POIName: shortstring;
    flPrivate: boolean;
  end;

  TMapPOIDataValue = class(TComponentValue)
  public
    Value: TMapPOIData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TMapPOITextData = packed record
    Timestamp: Double;
    Value: string;
  end;

  TMapPOITextValue = class(TComponentValue)
  public
    Value: TMapPOITextData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TMapPOIImageData = packed record
    Timestamp: Double;
    Data: TByteArray;
  end;

  TMapPOIImageValue = class(TComponentValue)
  public
    Value: TMapPOIImageData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TMapPOIDataFileData = packed record
    Timestamp: Double;
    FileName: string;
    Data: TByteArray;
  end;

  TMapPOIDataFileValue = class(TComponentValue)
  public
    Value: TMapPOIDataFileData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TGPSModuleMapPOIComponent = class(TSchemaComponent)
  public
    MapPOIData: TMapPOIDataValue;
    Text: TMapPOITextValue;
    Image: TMapPOIImageValue;
    DataFile: TMapPOIDataFileValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TFixMarkData = packed record
    Timestamp: Double;
    ObjID: DWord;
    ID: DWord;
  end;

  TFixMarkDataValue = class(TComponentValue)
  public
    Value: TFixMarkData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TGPSModuleFixMarkComponent = class(TSchemaComponent)
  public
    FixMarkData: TFixMarkDataValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TGPSModule = class(TSchemaComponent)
  public
    DatumID: TComponentInt32Value;
    DistanceThreshold: TComponentInt16Value;
    GPSFixData: TGPSFixDataValue;
    MapPOI: TGPSModuleMapPOIComponent;
    FixMark: TGPSModuleFixMarkComponent;
    IsActive: TComponentTimestampedBooleanValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TAccelerometerModule = class(TSchemaComponent)
  public
    Value: TComponentTimestampedDoubleValue;
    Thresholds: TComponentTimestampedDataValue;
    IsCalibrated: TComponentTimestampedBooleanValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TIgnitionModule = class(TSchemaComponent)
  public
    Value: TComponentTimestampedBooleanValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TTowAlertModule = class(TSchemaComponent)
  public
    Value: TComponentTimestampedBooleanValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TOBDIIModuleStateModule = class(TSchemaComponent)
  public
    IsPresented: TComponentTimestampedBooleanValue;
    Protocol: TComponentTimestampedUInt16Value;
    VIN: TComponentTimestampedANSIStringValue;
    EnforaPKG: TComponentTimestampedUInt32Value;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TOBDIIModuleBatteryModule = class(TSchemaComponent)
  public
    Value: TComponentTimestampedDoubleValue;
    Thresholds: TComponentTimestampedDataValue;
    IsLow: TComponentTimestampedBooleanValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TOBDIIModuleFuelModule = class(TSchemaComponent)
  public
    Value: TComponentTimestampedDoubleValue;
    Thresholds: TComponentTimestampedDataValue;
    IsLow: TComponentTimestampedBooleanValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TOBDIIModuleTachometerModule = class(TSchemaComponent)
  public
    Value: TComponentTimestampedUInt32Value;
    Thresholds: TComponentTimestampedDataValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TOBDIIModuleSpeedometerModule = class(TSchemaComponent)
  public
    Value: TComponentTimestampedDoubleValue;
    Thresholds: TComponentTimestampedDataValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TOBDIIModuleMILAlertModule = class(TSchemaComponent)
  public
    AlertCodes: TComponentTimestampedANSIStringValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TOBDIIModuleOdometerModule = class(TSchemaComponent)
  public
    Value: TComponentTimestampedDoubleValue;
    Thresholds: TComponentTimestampedDataValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TOBDIIModule = class(TSchemaComponent)
  public
    StateModule: TOBDIIModuleStateModule;
    BatteryModule: TOBDIIModuleBatteryModule;
    FuelModule: TOBDIIModuleFuelModule;
    TachometerModule: TOBDIIModuleTachometerModule;
    SpeedometerModule: TOBDIIModuleSpeedometerModule;
    MILAlertModule: TOBDIIModuleMILAlertModule;
    OdometerModule: TOBDIIModuleOdometerModule;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TStatusModule = class(TSchemaComponent)
  public
    IsStop: TComponentTimestampedBooleanValue;
    IsIdle: TComponentTimestampedBooleanValue;
    IsMotion: TComponentTimestampedBooleanValue;
    IsMIL: TComponentTimestampedBooleanValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TDeviceConfigurationData = packed record
    idGeographServerObject: Int64;
    CheckpointInterval: smallint;
    GeoDistanceThreshold: smallint;
  end;

  TDeviceConfigurationValue = class(TComponentValue)
  private
    DeviceComponent: TEnforaMT3000ObjectDeviceComponent;
  public
    Value: TDeviceConfigurationData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TDeviceCheckpointData1 = packed record
    CheckpointInterval: smallint;
    GPSFixData: TGPSFixData;
  end;

  TDeviceCheckpointValue1 = class(TComponentValue)
  private
    DeviceComponent: TEnforaMT3000ObjectDeviceComponent;
  public
    Value: TDeviceCheckpointData1;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackNode(): pointer; override;
    function ToTrackEvent(): pointer; override;
  end;


  TEnforaMT3000ObjectDeviceComponent = class(TSchemaComponent)
  public
    DeviceDescriptor:           TDeviceDescriptor;
    ControlModule:              TControlModule;
    BatteryModule:              TBatteryModule;
    ConnectionModule:           TConnectionModule;
    GPSModule:                  TGPSModule;
    AccelerometerModule:        TAccelerometerModule;
    IgnitionModule:             TIgnitionModule;
    TowAlertModule:             TTowAlertModule;
    OBDIIModule:                TOBDIIModule;
    StatusModule:               TStatusModule;               
    //. referenced values
    Configuration:      TDeviceConfigurationValue;
    Checkpoint1:        TDeviceCheckpointValue1;

    Constructor Create(const pSchema: TComponentSchema);
  end;

  TEnforaMT3000ObjectDeviceSchema = class(TComponentSchema)
  public
    Constructor Create(const pObjectModel: TObjectModel);
  end;


  //. MODEL
  TEnforaMT3000ObjectModel = class(TObjectModel)
  public
    class function ID: integer; override;
    class function Name: string; override;

    Constructor Create(const pObjectController: TGEOGraphServerObjectController; const flFreeController: boolean); override;
    function GetControlPanel(): TObjectModelControlPanel; override;
    function IsObjectOnline: boolean; override;
    function ObjectVisualization: TObjectDescriptor; override;
    function ObjectGeoSpaceID: integer; override;
    function ObjectDatumID: integer; override;
    procedure Object_GetLocationFix(out TimeStamp: double; out DatumID: integer; out Latitude: double; out Longitude: double; out Altitude: double; out Speed: double; out Bearing: double; out Precision: double); override;
    function DeviceConnectorServiceProviderNumber: double;
    procedure GetDayLogGeoData(const DayDate: TDateTime; out GeoDataStream: TMemoryStream);
    //. Control Module
    function  ControlModule_GetDeviceStateInfo(): string;
    function  ControlModule_GetDeviceLogData(): TByteArray;
    procedure ControlModule_RestartDevice();
    procedure ControlModule_RestartDeviceProcess();
    function  ControlModule_ExecuteCommand(const Command: string): string;
  end;

  function OBDProtocolName(const Protocol: integer): string;
  
Implementation
uses
  unitEnforaMT3000ObjectControlPanel;


//. Object schema side

{TVisualizationValue}
Constructor TVisualizationComponent.Create(const pOwner: TSchemaComponent; const pID: integer);
begin                                                             
Inherited Create(pOwner,pID,'Visualization');
Descriptor      :=TComponentObjectDescriptorValue.Create(Self,1,'Descriptor');
LastXYPosition  :=TComponentXYCrdValue.Create           (Self,2,'LastXYPosition');
end;


{TConfigurationValue}
Constructor TConfigurationValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'Configuration');
Value.GeoSpaceID:=0;
Value.idTVisualization:=0;
Value.idVisualization:=0;
Value.idHint:=0;
Value.idUserAlert:=0;
Value.idOnlineFlag:=0;
Value.idLocationIsAvailableFlag:=0;
flVirtualValue:=true;
ObjectComponent:=TEnforaMT3000ObjectComponent(Owner);
end;

procedure TConfigurationValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TConfigurationData(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TConfigurationValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TConfigurationData(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TEnforaMT3000ObjectComponent}
Constructor TEnforaMT3000ObjectComponent.Create(const pSchema: TComponentSchema);
begin
Inherited Create(pSchema,1,'EnforaMT3000ObjectComponent');
GeoSpaceID              :=TComponentInt32Value.Create   (Self,1,'GeoSpaceID');
Visualization           :=TVisualizationComponent.Create(Self,2);
Hint                    :=TComponentInt32Value.Create   (Self,3,'Hint');
UserAlert               :=TComponentInt32Value.Create   (Self,4,'UserAlert');
OnlineFlag              :=TComponentInt32Value.Create   (Self,5,'OnlineFlag');
LocationIsAvailableFlag :=TComponentInt32Value.Create   (Self,6,'LocationIsAvailableFlag');
//. referenced values
Configuration           :=TConfigurationValue.Create    (Self,1000);
end;


{TEnforaMT3000ObjectSchema}
Constructor TEnforaMT3000ObjectSchema.Create(const pObjectModel: TObjectModel);
begin
Inherited Create(pObjectModel);
Name:='ObjectSchema';
RootComponent:=TEnforaMT3000ObjectComponent.Create(Self);
end;


//. Object Device schema side

{TDeviceDescriptor}
Constructor TDeviceDescriptor.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'DeviceDescriptor');
Vendor:=TComponentUInt32Value.Create(Self,1,'Vendor');
Model:=TComponentUInt32Value.Create(Self,2,'Model');
SerialNumber:=TComponentUInt32Value.Create(Self,3,'SerialNumber');
ProductionDate:=TComponentDoubleValue.Create(Self,4,'ProductionDate');
HWVersion:=TComponentUInt32Value.Create(Self,5,'HWVersion');
SWVersion:=TComponentUInt32Value.Create(Self,6,'SWVersion');
FOTA:=TComponentANSIStringValue.Create(Self,7,'FOTA');
end;


{TControlDataValue}
Constructor TControlDataValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ControlData');
flVirtualValue:=true;
end;

function TControlDataValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter();
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatFloat('0.00000',Value.Timestamp)+#$0D#$0A+
           'Control data, length'+IntToStr(Length(Value.Value));
end;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;


{TControlCommandResponse}
Constructor TControlCommandResponse.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ControlCommandResponse');
flVirtualValue:=true;
end;

function TControlCommandResponse.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter();
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatFloat('0.00000',Value.Timestamp)+#$0D#$0A+
           'Control command response, length'+IntToStr(Length(Value.Value));
end;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;


{TControlModule}
Constructor TControlModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ControlModule');
//. referencing items
ControlDataValue:=TControlDataValue.Create(Self,1000);
ControlCommandResponse:=TControlCommandResponse.Create(Self,1001);
end;


{TBatteryModule}
Constructor TBatteryModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'BatteryModule');
Voltage:=TComponentTimestampedUInt16Value.Create(Self,1,'Voltage');
Charge:=TComponentTimestampedUInt16Value.Create(Self,2,'Charge');
IsExternalPower:=TComponentTimestampedBooleanValue.Create(Self,3,'IsExternalPower');
IsLowPowerMode:=TComponentTimestampedBooleanValue.Create(Self,4,'IsLowPowerMode');
end;


{TConnectionModuleServiceProvider}
Constructor TConnectionModuleServiceProvider.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ServiceProvider');
ProviderID:=TComponentUInt16Value.Create(Self,1,'ProviderID');
Number:=TComponentDoubleValue.Create(Self,2,'Number');
Account:=TComponentTimestampedUInt16Value.Create(Self,3,'Account');
Signal:=TComponentTimestampedUInt16Value.Create(Self,4,'Signal');
end;


{TConnectionModule}
Constructor TConnectionModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ConnectionModule');
ServiceProvider:=TConnectionModuleServiceProvider.Create(Self,1);
CheckPointInterval:=TComponentInt16Value.Create(Self,2,'CheckPointInterval');
LastCheckpointTime:=TComponentDoubleValue.Create(Self,3,'LastCheckpointTime');
IsOnline:=TComponentTimestampedBooleanValue.Create(Self,4,'IsOnline');
end;


{TGPSFixData}
function GPSFixData_IsNull(const Data: TGPSFixData): boolean;
begin
Result:=((Data.Latitude = 0.0) AND (Data.Longitude = 0.0));
end;


{TGPSFixDataValue}
Constructor TGPSFixDataValue.Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
begin
Inherited Create(pOwner,pID,pName);
end;

procedure TGPSFixDataValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
LastValue:=Value;
Value:=TGPSFixData(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TGPSFixDataValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TGPSFixData(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TGPSFixDataValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
LastValue:=Value;
SubNode:=ValueNode.SelectSingleNode('Timestamp');
Value.TimeStamp:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('Latitude');
Value.Latitude:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('Longitude');
Value.Longitude:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('Altitude');
Value.Altitude:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('Speed');
Value.Speed:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('Bearing');
Value.Bearing:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('Precision');
Value.Precision:=SubNode.nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TGPSFixDataValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TGPSFixDataValue.ToTrackNode(): pointer;
begin
if (GPSFixData_IsNull(Value))
 then begin
  Result:=nil;
  Exit; //. ->
  end; 
GetMem(Result,SizeOf(TObjectTrackNode));
FillChar(Result^,SizeOf(TObjectTrackNode), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackNode(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Latitude:=Value.Latitude;
Longitude:=Value.Longitude;
Altitude:=Value.Altitude;
Speed:=Value.Speed;
Bearing:=Value.Bearing;
Precision:=Value.Precision;
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TGPSFixDataValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+#$0D#$0A+
           'Latitude: '+FormatFloat('0.00000',Value.Latitude)+#$0D#$0A+
           'Longitude: '+FormatFloat('0.00000',Value.Longitude)+#$0D#$0A+
           'Altitude: '+FormatFloat('0.00000',Value.Altitude)+#$0D#$0A+
           'Speed: '+FormatFloat('0.00000',Value.Speed)+#$0D#$0A+
           'Bearing: '+FormatFloat('0.00000',Value.Bearing)+#$0D#$0A+
           'Precision: '+FormatFloat('0.00000',Value.Precision);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TMapPOIDataValue}
Constructor TMapPOIDataValue.Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
begin
Inherited Create(pOwner,pID,pName);
end;

procedure TMapPOIDataValue.FromByteArray(const BA: TByteArray; var Index: integer);
var
  LI,I: integer;
begin
if ((Index+8+4+4+4+256+1) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value.TimeStamp:=Double(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.TimeStamp));
//.
Value.MapID:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.MapID));
//.
Value.POIID:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.POIID));
//.
Value.POIType:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.POIType)); LI:=Index;
//.
SetLength(Value.POIName,BA[Index]); Inc(Index);
if (Length(Value.POIName) > 0)
 then
  for I:=1 to Length(Value.POIName) do begin
    Value.POIName[I]:=Char(BA[Index]);
    Inc(Index);
    if (Index > Length(BA)) then Break; //. >
    end;
Index:=LI+256;
//.
Value.flPrivate:=(BA[Index] <> 0); Inc(Index);
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TMapPOIDataValue.ToByteArray(): TByteArray;
var
  I: integer;
  V: byte;
begin
SetLength(Result,8+4+4+4+256+1);
Owner.Schema.ObjectModel.Lock.Enter;
try
Double(Pointer(@Result[0])^):=Value.Timestamp;
//.
DWord(Pointer(@Result[8])^):=Value.MapID;
//.
DWord(Pointer(@Result[12])^):=Value.POIID;
//.
DWord(Pointer(@Result[16])^):=Value.POIType;
//.
Result[20]:=Byte(Length(Value.POIName));
for I:=0 to Length(Value.POIName)-1 do Result[21+I]:=Ord(Value.POIName[1+I]);
//.
if (Value.flPrivate) then V:=1 else V:=0;
Result[8+4+4+4+256]:=V;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TMapPOIDataValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
if (ValueNode = nil) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
SubNode:=ValueNode.SelectSingleNode('Timestamp');
Value.Timestamp:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('MapID');
Value.MapID:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('POIID');
Value.POIID:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('POIType');
Value.POIType:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('POIName');
Value.POIName:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('flPrivate');
Value.flPrivate:=(SubNode.nodeTypedValue <> '0');
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TMapPOIDataValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TMapPOIDataValue.ToTrackEvent(): pointer;
var
  PS: string;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));                
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
if (Value.flPrivate) then PS:='yes' else PS:='no';
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+#$0D#$0A+
           'MapID: '+IntToStr(Value.MapID)+#$0D#$0A+
           'POIType: '+IntToHex(Value.POIType,4)+#$0D#$0A+
           'POIName: '+Value.POIName+#$0D#$0A+
           'Private: '+PS;
flBelongsToLastLocation:=true;
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TMapPOITextValue}
Constructor TMapPOITextValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'Text');
flVirtualValue:=true;
end;

procedure TMapPOITextValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
if (ValueNode = nil) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter();
try
Value.Timestamp:=ValueNode.SelectSingleNode('Timestamp').nodeTypedValue;
Value.Value:=ValueNode.SelectSingleNode('Data').nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;

procedure TMapPOITextValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TMapPOITextValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', Text: '+Value.Value;
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TMapPOIImageValue}
Constructor TMapPOIImageValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'Image');
flVirtualValue:=true;
end;

procedure TMapPOIImageValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
if (ValueNode = nil) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter();
try
Value.Timestamp:=ValueNode.SelectSingleNode('Timestamp').nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;

procedure TMapPOIImageValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TMapPOIImageValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', POI Image';
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TMapPOIDataFileValue}
Constructor TMapPOIDataFileValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'DataFile');
flVirtualValue:=true;
end;

procedure TMapPOIDataFileValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
if (ValueNode = nil) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter();
try
Value.Timestamp:=ValueNode.SelectSingleNode('Timestamp').nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;

procedure TMapPOIDataFileValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TMapPOIDataFileValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', POI DataFile';
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TGPSModuleMapPOIComponent}
Constructor TGPSModuleMapPOIComponent.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'MapPOI');
MapPOIData:=TMapPOIDataValue.Create(Self,1,'Data');
Text:=TMapPOITextValue.Create(Self,1001);
Image:=TMapPOIImageValue.Create(Self,1000);
DataFile:=TMapPOIDataFileValue.Create(Self,1002);
end;


{TFixMarkDataValue}
Constructor TFixMarkDataValue.Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
begin
Inherited Create(pOwner,pID,pName);
end;

procedure TFixMarkDataValue.FromByteArray(const BA: TByteArray; var Index: integer);
var
  LI,I: integer;
begin
if ((Index+8+4+4) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value.Timestamp:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.Timestamp));
//.
Value.ObjID:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.ObjID));
//.
Value.ID:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value.ID));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TFixMarkDataValue.ToByteArray(): TByteArray;
var
  I: integer;
  V: byte;
begin
SetLength(Result,8+4+4);
Owner.Schema.ObjectModel.Lock.Enter;
try
Double(Pointer(@Result[0])^):=Value.Timestamp;
//.
DWord(Pointer(@Result[8])^):=Value.ObjID;
//.
DWord(Pointer(@Result[12])^):=Value.ID;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TFixMarkDataValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;             
try
SubNode:=ValueNode.SelectSingleNode('Timestamp');
Value.Timestamp:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('ObjID');
Value.ObjID:=SubNode.nodeTypedValue;
SubNode:=ValueNode.SelectSingleNode('ID');
Value.ID:=SubNode.nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TFixMarkDataValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TFixMarkDataValue.ToTrackEvent(): pointer;
var
  PS: string;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+
           'ObjID: '+IntToStr(Value.ObjID)+#$0D#$0A+
           'ID: '+IntToStr(Value.ID);
flBelongsToLastLocation:=true;
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

{TGPSModuleFixMarkComponent}
Constructor TGPSModuleFixMarkComponent.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'FixMark');
FixMarkData:=TFixMarkDataValue.Create(Self,1,'Data');
end;


{TGPSModule}
Constructor TGPSModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'GPSModule');
DatumID                 :=TComponentInt32Value.Create                   (Self,1,'DatumID');
DistanceThreshold       :=TComponentInt16Value.Create                   (Self,2,'DistanceThreshold');
GPSFixData              :=TGPSFixDataValue.Create                       (Self,3,'GPSFixData');
MapPOI                  :=TGPSModuleMapPOIComponent.Create              (Self,4);
FixMark                 :=TGPSModuleFixMarkComponent.Create             (Self,5);
IsActive                :=TComponentTimestampedBooleanValue.Create      (Self,6,'IsActive');
end;


{TAccelerometerModule}
Constructor TAccelerometerModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'AccelerometerModule');
Value           :=TComponentTimestampedDoubleValue.Create       (Self,1,'Value');
Thresholds      :=TComponentTimestampedDataValue.Create         (Self,2,'Thresholds');
IsCalibrated    :=TComponentTimestampedBooleanValue.Create      (Self,3,'IsCalibrated');
end;


{TIgnitionModule}
Constructor TIgnitionModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'IgnitionModule');
Value:=TComponentTimestampedBooleanValue.Create(Self,1,'Value');
end;


{TTowAlertModule}
Constructor TTowAlertModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'TowAlertModule');
Value:=TComponentTimestampedBooleanValue.Create(Self,1,'Value');
end;


{TOBDIIModuleStateModule}
Constructor TOBDIIModuleStateModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'StateModule');
IsPresented     :=TComponentTimestampedBooleanValue.Create      (Self,1,'IsPresented');
Protocol        :=TComponentTimestampedUInt16Value.Create       (Self,2,'Protocol');
VIN             :=TComponentTimestampedANSIStringValue.Create   (Self,3,'VIN');
EnforaPKG       :=TComponentTimestampedUInt32Value.Create       (Self,4,'EnforaPKG');
end;

function OBDProtocolName(const Protocol: integer): string;
begin
case (Protocol) of
0  : Result:='ISO 15765 250kHz 11bit';
1  : Result:='ISO 15765 500kHz 11bit';
2  : Result:='ISO 15765 250kHz 29bit';
3  : Result:='ISO 15765 500kHz 29bit';
4  : Result:='J1850 PWM';
5  : Result:='J1850 VPW';
6  : Result:='ISO 9141 2';
7  : Result:='ISO 14230';
255: Result:='Unknown';
else
  Result:='?';
end;
end;


{TOBDIIModuleBatteryModule}
Constructor TOBDIIModuleBatteryModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'BatteryModule');
Value           :=TComponentTimestampedDoubleValue.Create       (Self,1,'Value');
Thresholds      :=TComponentTimestampedDataValue.Create         (Self,2,'Thresholds');
IsLow           :=TComponentTimestampedBooleanValue.Create      (Self,3,'IsLow');
end;

  
{TOBDIIModuleFuelModule}
Constructor TOBDIIModuleFuelModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'FuelModule');
Value           :=TComponentTimestampedDoubleValue.Create       (Self,1,'Value');
Thresholds      :=TComponentTimestampedDataValue.Create         (Self,2,'Thresholds');
IsLow           :=TComponentTimestampedBooleanValue.Create      (Self,3,'IsLow');
end;

  
{TOBDIIModuleTachometerModule}
Constructor TOBDIIModuleTachometerModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'TachometerModule');
Value           :=TComponentTimestampedUInt32Value.Create       (Self,1,'Value');
Thresholds      :=TComponentTimestampedDataValue.Create         (Self,2,'Thresholds');
end;

  
{TOBDIIModuleSpeedometerModule}
Constructor TOBDIIModuleSpeedometerModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'SpeedometerModule');
Value           :=TComponentTimestampedDoubleValue.Create       (Self,1,'Value');
Thresholds      :=TComponentTimestampedDataValue.Create         (Self,2,'Thresholds');
end;

  
{TOBDIIModuleMILAlertModule}
Constructor TOBDIIModuleMILAlertModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'MILAlertModule');
AlertCodes:=TComponentTimestampedANSIStringValue.Create(Self,1,'AlertCodes');
end;


{TOBDIIModuleOdometerModule}
Constructor TOBDIIModuleOdometerModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'OdometerModule');
Value           :=TComponentTimestampedDoubleValue.Create       (Self,1,'Value');
Thresholds      :=TComponentTimestampedDataValue.Create         (Self,2,'Thresholds');
end;

  
{TOBDIIModule}
Constructor TOBDIIModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'OBDIIModule');
StateModule             :=TOBDIIModuleStateModule.Create        (Self,1);
BatteryModule           :=TOBDIIModuleBatteryModule.Create      (Self,2);
FuelModule              :=TOBDIIModuleFuelModule.Create         (Self,3);
TachometerModule        :=TOBDIIModuleTachometerModule.Create   (Self,4);
SpeedometerModule       :=TOBDIIModuleSpeedometerModule.Create  (Self,5);
MILAlertModule          :=TOBDIIModuleMILAlertModule.Create     (Self,6);
OdometerModule          :=TOBDIIModuleOdometerModule.Create     (Self,7);
end;


{TStatusModule}
Constructor TStatusModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'StatusModule');
IsStop  :=TComponentTimestampedBooleanValue.Create      (Self,1,'IsStop');
IsIdle  :=TComponentTimestampedBooleanValue.Create      (Self,2,'IsIdle');
IsMotion:=TComponentTimestampedBooleanValue.Create      (Self,3,'IsMotion');
IsMIL   :=TComponentTimestampedBooleanValue.Create      (Self,4,'IsMIL');
end;


{TDeviceConfigurationValue}
Constructor TDeviceConfigurationValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'Configuration');
Value.idGeographServerObject:=0;
Value.CheckpointInterval:=0;
Value.GeoDistanceThreshold:=0;
flVirtualValue:=true;
DeviceComponent:=TEnforaMT3000ObjectDeviceComponent(Owner);
end;

procedure TDeviceConfigurationValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TDeviceConfigurationData(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
DeviceComponent.ConnectionModule.CheckPointInterval.Value:=Value.CheckpointInterval;
DeviceComponent.GPSModule.DistanceThreshold.Value:=Value.GeoDistanceThreshold;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TDeviceConfigurationValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TDeviceConfigurationData(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TDeviceConfigurationValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
DeviceComponent.ConnectionModule.CheckPointInterval.FromXMLNode(ValueNode);
SubNode:=ValueNode.SelectSingleNode('GeoDistanceThreshold');
DeviceComponent.GPSModule.DistanceThreshold.Value:=SubNode.nodeTypedValue;
Value.CheckpointInterval:=DeviceComponent.ConnectionModule.CheckPointInterval.Value;
Value.GeoDistanceThreshold:=DeviceComponent.GPSModule.DistanceThreshold.Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TDeviceConfigurationValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TDeviceConfigurationValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='CheckpointInterval: '+IntToStr(Value.CheckpointInterval)+' sec'+#$0D#$0A+'GeoDistanceThreshold: '+IntToStr(Value.GeoDistanceThreshold)+' m';
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TDeviceCheckpointValue1}
Constructor TDeviceCheckpointValue1.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'CheckpointValue1');
FillChar(Value,SizeOf(Value),0);
flVirtualValue:=true;
DeviceComponent:=TEnforaMT3000ObjectDeviceComponent(Owner);
end;

procedure TDeviceCheckpointValue1.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TDeviceCheckpointData1(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
DeviceComponent.ConnectionModule.CheckPointInterval.Value:=Value.CheckpointInterval;
DeviceComponent.GPSModule.GPSFixData.Value:=Value.GPSFixData;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TDeviceCheckpointValue1.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TDeviceCheckpointData1(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TDeviceCheckpointValue1.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
DeviceComponent.ConnectionModule.CheckPointInterval.FromXMLNode(ValueNode);
DeviceComponent.GPSModule.GPSFixData.FromXMLNode(ValueNode);
Value.CheckpointInterval:=DeviceComponent.ConnectionModule.CheckPointInterval.Value;
Value.GPSFixData:=DeviceComponent.GPSModule.GPSFixData.Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TDeviceCheckpointValue1.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TDeviceCheckpointValue1.ToTrackNode(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackNode));
FillChar(Result^,SizeOf(TObjectTrackNode), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackNode(Result^) do begin
Next:=nil;
TimeStamp:=Value.GPSFixData.TimeStamp;
Latitude:=Value.GPSFixData.Latitude;
Longitude:=Value.GPSFixData.Longitude;
Altitude:=Value.GPSFixData.Altitude;
Speed:=Value.GPSFixData.Speed;
Bearing:=Value.GPSFixData.Bearing;
Precision:=Value.GPSFixData.Precision;
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;                              
end;
end;

function TDeviceCheckpointValue1.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.GPSFixData.TimeStamp;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='CheckpointInterval: '+IntToStr(Value.CheckpointInterval)+' sec'+#$0D#$0A+
           'Timestamp: '+FormatFloat('0.00000',Value.GPSFixData.Timestamp)+#$0D#$0A+
           'Latitude: '+FormatFloat('0.00000',Value.GPSFixData.Latitude)+#$0D#$0A+
           'Longitude: '+FormatFloat('0.00000',Value.GPSFixData.Longitude)+#$0D#$0A+
           'Altitude: '+FormatFloat('0.00000',Value.GPSFixData.Altitude)+#$0D#$0A+
           'Speed: '+FormatFloat('0.00000',Value.GPSFixData.Speed)+#$0D#$0A+
           'Bearing: '+FormatFloat('0.00000',Value.GPSFixData.Bearing)+#$0D#$0A+
           'Precision: '+FormatFloat('0.00000',Value.GPSFixData.Precision);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TEnforaMT3000ObjectDeviceComponent}
Constructor TEnforaMT3000ObjectDeviceComponent.Create(const pSchema: TComponentSchema);
begin
Inherited Create(pSchema,2,'EnforaMT3000ObjectDeviceComponent');
//. items
//. components
DeviceDescriptor        :=TDeviceDescriptor.Create              (Self,1);
ControlModule           :=TControlModule.Create                 (Self,2);
BatteryModule           :=TBatteryModule.Create                 (Self,3);
ConnectionModule        :=TConnectionModule.Create              (Self,4);
GPSModule               :=TGPSModule.Create                     (Self,5);
AccelerometerModule     :=TAccelerometerModule.Create           (Self,6);
IgnitionModule          :=TIgnitionModule.Create                (Self,7);
TowAlertModule          :=TTowAlertModule.Create                (Self,8);
OBDIIModule             :=TOBDIIModule.Create                   (Self,9);
StatusModule            :=TStatusModule.Create                  (Self,10);
//. referencing items
Configuration           :=TDeviceConfigurationValue.Create      (Self,1000);
Checkpoint1             :=TDeviceCheckpointValue1.Create        (Self,1100);
end;


{TEnforaMT3000ObjectDeviceSchema}
Constructor TEnforaMT3000ObjectDeviceSchema.Create(const pObjectModel: TObjectModel);
begin
Inherited Create(pObjectModel);
Name:='DeviceSchema';
RootComponent:=TEnforaMT3000ObjectDeviceComponent.Create(Self);
end;


//. summary object model

{TEnforaMT3000ObjectModel}
class function TEnforaMT3000ObjectModel.ID: integer;
begin
Result:=EnforaMT3000ObjectModelID;
end;

class function TEnforaMT3000ObjectModel.Name: string;
begin
Result:='EnforaMT3000';
end;

Constructor TEnforaMT3000ObjectModel.Create(const pObjectController: TGEOGraphServerObjectController; const flFreeController: boolean);
begin
Inherited Create(pObjectController,flFreeController);
flComponentUserAccessControl:=true;
ObjectSchema:=TEnforaMT3000ObjectSchema.Create(Self);
ObjectDeviceSchema:=TEnforaMT3000ObjectDeviceSchema.Create(Self);
end;

function TEnforaMT3000ObjectModel.GetControlPanel(): TObjectModelControlPanel;
begin
if (ControlPanel = nil)
 then ControlPanel:=TEnforaMT3000ObjectControlPanel.Create(Self);
Result:=ControlPanel;
end;

function TEnforaMT3000ObjectModel.IsObjectOnline: boolean;
begin
Lock.Enter;
try
Result:=TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).ConnectionModule.IsOnline.BoolValue.Value;
finally
Lock.Leave;
end;
end;

function TEnforaMT3000ObjectModel.ObjectVisualization: TObjectDescriptor;
begin
Lock.Enter;
try
Result:=TEnforaMT3000ObjectComponent(ObjectSchema.RootComponent).Visualization.Descriptor.Value;
finally
Lock.Leave;
end;
end;

function TEnforaMT3000ObjectModel.ObjectGeoSpaceID: integer;
begin
Lock.Enter;
try
Result:=TEnforaMT3000ObjectComponent(ObjectSchema.RootComponent).GeoSpaceID.Value;
finally
Lock.Leave;
end;
end;

function TEnforaMT3000ObjectModel.ObjectDatumID: integer;
begin
Lock.Enter;
try
Result:=TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.DatumID.Value;
finally
Lock.Leave;
end;
end;

procedure TEnforaMT3000ObjectModel.Object_GetLocationFix(out TimeStamp: double; out DatumID: integer; out Latitude: double; out Longitude: double; out Altitude: double; out Speed: double; out Bearing: double; out Precision: double);
begin
Lock.Enter;
try
DatumID:=TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.DatumID.Value;
//.
TimeStamp:=TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.TimeStamp;
Latitude:=TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Latitude;
Longitude:=TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Longitude;
Altitude:=TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Altitude;
Speed:=TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Speed;
Bearing:=TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Bearing;
Precision:=TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Precision;
finally
Lock.Leave;
end;
end;

function TEnforaMT3000ObjectModel.DeviceConnectorServiceProviderNumber: double;
begin
Lock.Enter;
try
Result:=TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).ConnectionModule.ServiceProvider.Number.Value;
finally
Lock.Leave;
end;
end;

procedure TEnforaMT3000ObjectModel.GetDayLogGeoData(const DayDate: TDateTime; out GeoDataStream: TMemoryStream);
Type
  TGeoDataItem = packed record //. from Reflector\unitXYToGeoCrdConvertor.pas
    TimeStamp: TDateTime;
    Latitude: double;
    Longitude: double;
    Altitude: double;
    Speed: double;
    Bearing: double;
    Precision: double;
  end;

  //. operation's log parsing routine
  function ProcessOperationsLogItemForTrackItem(const OperationsLogItem: IXMLDOMNode; out GeoDataItem: TGeoDataItem): boolean;
  var
    SIDStr: string;
    Node,GPSFixDataNode: IXMLDOMNode;
  begin
  Result:=false;
  SIDStr:=OperationsLogItem.nodeName;
  //. check for operation
  if (SIDStr <> 'SET') then Exit; //. ->
  //.
  Node:=OperationsLogItem.selectSingleNode('Component');
  if (Node = nil) then Exit; //. ->                               
  if (Node.nodeTypedValue = '2.1100'{Checkpoint1 address})
   then begin
    GPSFixDataNode:=OperationsLogItem.selectSingleNode('CheckpointValue1/GPSFixData');
    Node:=GPSFixDataNode.selectSingleNode('TimeStamp');
    GeoDataItem.TimeStamp:=TDateTime(Node.nodeTypedValue);
    Node:=GPSFixDataNode.selectSingleNode('Latitude');
    GeoDataItem.Latitude:=TDateTime(Node.nodeTypedValue);
    Node:=GPSFixDataNode.selectSingleNode('Longitude');
    GeoDataItem.Longitude:=TDateTime(Node.nodeTypedValue);
    Node:=GPSFixDataNode.selectSingleNode('Altitude');
    GeoDataItem.Altitude:=TDateTime(Node.nodeTypedValue);
    Node:=GPSFixDataNode.selectSingleNode('Speed');
    GeoDataItem.Speed:=TDateTime(Node.nodeTypedValue);
    Node:=GPSFixDataNode.selectSingleNode('Bearing');
    GeoDataItem.Bearing:=TDateTime(Node.nodeTypedValue);
    Node:=GPSFixDataNode.selectSingleNode('Precision');
    GeoDataItem.Precision:=TDateTime(Node.nodeTypedValue);
    //.
    Result:=true;
    end;
  end;

var
  LogDataStream: TMemoryStream;
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  OperationsLogNode: IXMLDOMNode;
  I: integer;
  OperationsLogItemNode: IXMLDOMNode;
  GeoDataItem: TGeoDataItem;
begin
GeoDataStream:=nil;
ObjectController.ObjectOperation_GetDayLogData(DayDate, 0{XML format}, LogDataStream);
try
LogDataStream.Position:=0;
OLEStream:=TStreamAdapter.Create(LogDataStream);
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
Doc.Load(OLEStream);
VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
if VersionNode <> nil
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version <> 0) then Raise Exception.Create('unknown day log version'); //. =>
OperationsLogNode:=Doc.documentElement.selectSingleNode('/ROOT/OperationsLog');
GeoDataStream:=TMemoryStream.Create();
try
for I:=0 to OperationsLogNode.childNodes.length-1 do begin
  OperationsLogItemNode:=OperationsLogNode.childNodes[I];
  if (ProcessOperationsLogItemForTrackItem(OperationsLogItemNode, GeoDataItem))
   then GeoDataStream.Write(GeoDataItem,SizeOf(GeoDataItem));
  end;
except
  FreeAndNil(GeoDataStream);
  Raise; //. =>
  end;
finally
LogDataStream.Destroy;
end;
end;

function TEnforaMT3000ObjectModel.ControlModule_GetDeviceStateInfo(): string;
begin
Result:='';
end;

function TEnforaMT3000ObjectModel.ControlModule_GetDeviceLogData(): TByteArray;
begin
Result:=nil;
end;

procedure TEnforaMT3000ObjectModel.ControlModule_RestartDevice();
begin
end;

procedure TEnforaMT3000ObjectModel.ControlModule_RestartDeviceProcess();
begin
end;

function TEnforaMT3000ObjectModel.ControlModule_ExecuteCommand(const Command: string): string;
var
  Params: String;
  AddressData: TByteArray;
  BA: TByteArray;
begin
Params:=Command;
SetLength(AddressData,Length(Params));
Move(Pointer(@Params[1])^,Pointer(@AddressData[0])^,Length(Params));
Lock.Enter();
try
TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).ControlModule.ControlCommandResponse.ReadDeviceByAddressDataCUAC(AddressData);
BA:=TEnforaMT3000ObjectDeviceComponent(ObjectDeviceSchema.RootComponent).ControlModule.ControlCommandResponse.Value.Value;
SetLength(Result,Length(BA));
Move(Pointer(@BA[0])^,Pointer(@Result[1])^,Length(Result));
finally
Lock.Leave();
end;
end;


end.
