unit unitGeoMonitoredObjectModel;
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
  GeoMonitoredObjectModelID = 1;
                                                      
Type
  TGeoMonitoredObjectComponent = class;                 
  TGeoMonitoredObjectDeviceComponent = class;

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
    ObjectComponent: TGeoMonitoredObjectComponent;
  public
    Value: TConfigurationData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
  end;

  TGeoMonitoredObjectComponent = class(TSchemaComponent)
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

  TGeoMonitoredObjectSchema = class(TComponentSchema)
  public
    Constructor Create(const pObjectModel: TObjectModel);
  end;


  //. Object device schema side
  TConnectionModuleServiceProvider = class(TSchemaComponent)
  public
    ProviderID: TComponentUInt16Value;
    Number: TComponentDoubleValue;
    Account: TComponentUInt16Value;
    Signal: TComponentUInt16Value;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TConnectionModule = class(TSchemaComponent)
  public
    CheckPointInterval: TComponentInt16Value;
    LastCheckpointTime: TComponentDoubleValue;
    IsOnline: TComponentBooleanValue;
    ServiceProvider: TConnectionModuleServiceProvider;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;


  TGPSFixData = packed record
    TimeStamp: double;
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

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackNode(): pointer; override;
    function ToTrackEvent(): pointer; override;
  end;

  TMapPOIData = packed record
    TimeStamp: double;
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

  TMapPOITextValue = class(TComponentValue)
  public
    Value: string;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TMapPOIImageValue = class(TComponentValue)
  public
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    function ToTrackEvent(): pointer; override;
  end;

  TMapPOIDataFileValue = class(TComponentValue)
  public
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
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
    GPSFixData: TGPSFixDataValue;
    DistanceThreshold: TComponentInt16Value;
    MapPOI: TGPSModuleMapPOIComponent;
    FixMark: TGPSModuleFixMarkComponent;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;


  TGPIModule = class(TSchemaComponent)
  public
    Value: TComponentUInt16Value;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TGPOModule = class(TSchemaComponent)
  public
    Value: TComponentUInt16Value;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TADCModule = class(TSchemaComponent)
  public
    Value: TComponentDoubleArrayValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TDACModule = class(TSchemaComponent)
  public
    Value: TComponentDoubleArrayValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TBatteryModule = class(TSchemaComponent)
  public
    Voltage: TComponentUInt16Value;
    Charge: TComponentUInt16Value;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TDeviceDescriptor = class(TSchemaComponent)
  public
    Vendor: TComponentUInt32Value;
    Model: TComponentUInt32Value;
    SerialNumber: TComponentUInt32Value;
    ProductionDate: TComponentDoubleValue;
    HWVersion: TComponentUInt32Value;
    SWVersion: TComponentUInt32Value;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TTelemetryModule = class(TSchemaComponent)
  public
    TelemetryData: TComponentTimestampedDataValue;
    TelemetryString: TComponentTimestampedANSIStringValue;
    //.
    TelemetryModel: TComponentTimestampedANSIStringValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TDeviceConfigurationData = packed record
    CheckpointInterval: smallint;
    GeoDistanceThreshold: smallint;
  end;

  TDeviceConfigurationValue = class(TComponentValue)
  private
    DeviceComponent: TGeoMonitoredObjectDeviceComponent;
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
    DeviceComponent: TGeoMonitoredObjectDeviceComponent;
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


  TGPIValueFixData = packed record
    GPIValue: smallint;
    GPSFixData: TGPSFixData;
  end;

  TGPIValueFixValue = class(TComponentValue)
  private
    DeviceComponent: TGeoMonitoredObjectDeviceComponent;
  public
    Value: TGPIValueFixData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackNode(): pointer; override;
    function ToTrackEvent(): pointer; override;
  end;


  TGeoMonitoredObjectDeviceComponent = class(TSchemaComponent)
  public
    ConnectionModule:   TConnectionModule;
    GPSModule:          TGPSModule;
    GPIModule:          TGPIModule;
    GPOModule:          TGPOModule;
    ADCModule:          TADCModule;
    DACModule:          TDACModule;
    BatteryModule:      TBatteryModule;
    DeviceDescriptor:   TDeviceDescriptor;
    TelemetryModule:    TTelemetryModule;
    //. referenced values
    Configuration:      TDeviceConfigurationValue;
    Checkpoint1:        TDeviceCheckpointValue1;
    GPIValueFixValue:   TGPIValueFixValue;

    Constructor Create(const pSchema: TComponentSchema);
  end;

  TGeoMonitoredObjectDeviceSchema = class(TComponentSchema)
  public
    Constructor Create(const pObjectModel: TObjectModel);
  end;


  //. MODEL
  TGeoMonitoredObjectModel = class(TObjectModel)
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
  end;

  
Implementation
uses
  unitGeoMonitoredObjectControlPanel;


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
ObjectComponent:=TGeoMonitoredObjectComponent(Owner);
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


{TGeoMonitoredObjectComponent}
Constructor TGeoMonitoredObjectComponent.Create(const pSchema: TComponentSchema);
begin
Inherited Create(pSchema,1,'GeoMonitoredObjectComponent');
GeoSpaceID              :=TComponentInt32Value.Create   (Self,1,'GeoSpaceID');
Visualization           :=TVisualizationComponent.Create(Self,2);
Hint                    :=TComponentInt32Value.Create   (Self,3,'Hint');
UserAlert               :=TComponentInt32Value.Create   (Self,4,'UserAlert');
OnlineFlag              :=TComponentInt32Value.Create   (Self,5,'OnlineFlag');
LocationIsAvailableFlag :=TComponentInt32Value.Create   (Self,6,'LocationIsAvailableFlag');
//. referenced values
Configuration           :=TConfigurationValue.Create    (Self,1000);
end;


{TGeoMonitoredObjectSchema}
Constructor TGeoMonitoredObjectSchema.Create(const pObjectModel: TObjectModel);
begin
Inherited Create(pObjectModel);
Name:='ObjectSchema';
RootComponent:=TGeoMonitoredObjectComponent.Create(Self);
end;


//. Object Device schema side

{TConnectionModuleServiceProvider}
Constructor TConnectionModuleServiceProvider.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ServiceProvider');
ProviderID:=TComponentUInt16Value.Create(Self,1,'ProviderID');
Number:=TComponentDoubleValue.Create(Self,2,'Number');
Account:=TComponentUInt16Value.Create(Self,3,'Account');
Signal:=TComponentuInt16Value.Create(Self,4,'Signal');
end;


{TConnectionModule}
Constructor TConnectionModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ConnectionModule');
CheckPointInterval:=TComponentInt16Value.Create(Self,1,'CheckPointInterval');
LastCheckpointTime:=TComponentDoubleValue.Create(Self,2,'LastCheckpointTime');
IsOnline:=TComponentBooleanValue.Create(Self,3,'IsOnline');
ServiceProvider:=TConnectionModuleServiceProvider.Create(Self,4);
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
SubNode:=ValueNode.SelectSingleNode('TimeStamp');
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
GetMem(Result,SizeOf(TObjectTrackNode));
FillChar(Result^,SizeOf(TObjectTrackNode), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackNode(Result^) do begin
Next:=nil;
TimeStamp:=Value.TimeStamp;
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
EventInfo:='Latitude: '+FormatFloat('0.00000',Value.Latitude)+#$0D#$0A+
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
if ((Index+4+4+4+256+1) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value.TimeStamp:=0.0;
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
SetLength(Result,4+4+4+256+1);
Owner.Schema.ObjectModel.Lock.Enter;
try
DWord(Pointer(@Result[0])^):=Value.MapID;
//.
DWord(Pointer(@Result[4])^):=Value.POIID;
//.
DWord(Pointer(@Result[8])^):=Value.POIType;
//.
Result[12]:=Byte(Length(Value.POIName));
for I:=0 to Length(Value.POIName)-1 do Result[13+I]:=Ord(Value.POIName[1+I]);
//.
if (Value.flPrivate) then V:=1 else V:=0;
Result[4+4+4+256]:=V;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TMapPOIDataValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;             
try
SubNode:=ValueNode.SelectSingleNode('TimeStamp');
if (SubNode <> nil) then Value.TimeStamp:=SubNode.nodeTypedValue else Value.TimeStamp:=0.0;
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
EventInfo:='MapID: '+IntToStr(Value.MapID)+#$0D#$0A+
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
Value:='';
flVirtualValue:=true;
end;

procedure TMapPOITextValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
Owner.Schema.ObjectModel.Lock.Enter();
try
Value:='';
ValueNode:=Node.SelectSingleNode(Name);
if (ValueNode = nil) then Exit; //. ->
SubNode:=ValueNode.SelectSingleNode('Text');
Value:=SubNode.nodeTypedValue;
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
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='Text: '+Value;
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

function TMapPOIImageValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Severity:=otesMinor;
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

function TMapPOIDataFileValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Severity:=otesMinor;
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
if ((Index+4+4) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
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
SetLength(Result,4+4);
Owner.Schema.ObjectModel.Lock.Enter;
try
DWord(Pointer(@Result[0])^):=Value.ObjID;
//.
DWord(Pointer(@Result[4])^):=Value.ID;
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
EventInfo:='ObjID: '+IntToStr(Value.ObjID)+#$0D#$0A+
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
DatumID                 :=TComponentInt32Value.Create           (Self,1,'DatumID');
GPSFixData              :=TGPSFixDataValue.Create               (Self,2,'GPSFixData');
DistanceThreshold       :=TComponentInt16Value.Create           (Self,3,'DistanceThreshold');
MapPOI                  :=TGPSModuleMapPOIComponent.Create      (Self,4);
FixMark                 :=TGPSModuleFixMarkComponent.Create     (Self,5);
end;


{TGPIModule}
Constructor TGPIModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'GPIModule');
Value:=TComponentUInt16Value.Create(Self,1,'Value');
end;


{TGPOModule}
Constructor TGPOModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'GPOModule');
Value:=TComponentUInt16Value.Create(Self,1,'Value');
end;


{TADCModule}
Constructor TADCModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ADCModule');
Value:=TComponentDoubleArrayValue.Create(Self,1,'Value');
end;


{TDACModule}
Constructor TDACModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'DACModule');
Value:=TComponentDoubleArrayValue.Create(Self,1,'Value');
end;


{TBatteryModule}
Constructor TBatteryModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'BatteryModule');
Voltage:=TComponentUInt16Value.Create(Self,1,'Voltage');
Charge:=TComponentUInt16Value.Create(Self,2,'Charge');
end;


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
end;


{TTelemetryModule}
Constructor TTelemetryModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'TelemetryModule');
TelemetryData:=TComponentTimestampedDataValue.Create(Self,1,'TelemetryData');
TelemetryString:=TComponentTimestampedANSIStringValue.Create(Self,2,'TelemetryString');
TelemetryModel:=TComponentTimestampedANSIStringValue.Create(Self,3,'TelemetryModel');
end;


{TDeviceConfigurationValue}
Constructor TDeviceConfigurationValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'Configuration');
Value.CheckpointInterval:=0;
Value.GeoDistanceThreshold:=0;
flVirtualValue:=true;
DeviceComponent:=TGeoMonitoredObjectDeviceComponent(Owner);
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
DeviceComponent:=TGeoMonitoredObjectDeviceComponent(Owner);
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


{TGPIValueFixValue}
Constructor TGPIValueFixValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'GPIValueFix');
FillChar(Value,SizeOf(Value),0);
flVirtualValue:=true;
DeviceComponent:=TGeoMonitoredObjectDeviceComponent(Owner);
end;

procedure TGPIValueFixValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TGPIValueFixData(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
DeviceComponent.GPIModule.Value.Value:=Value.GPIValue;
DeviceComponent.GPSModule.GPSFixData.Value:=Value.GPSFixData;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TGPIValueFixValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TGPIValueFixData(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TGPIValueFixValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode,SubNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
DeviceComponent.GPIModule.Value.FromXMLNode(ValueNode);
DeviceComponent.GPSModule.GPSFixData.FromXMLNode(ValueNode);
Value.GPIValue:=DeviceComponent.GPIModule.Value.Value;
Value.GPSFixData:=DeviceComponent.GPSModule.GPSFixData.Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TGPIValueFixValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TGPIValueFixValue.ToTrackNode(): pointer;
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

function TGPIValueFixValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
TimeStamp:=Value.GPSFixData.TimeStamp;
Severity:=otesMinor;
EventMessage:=FullName();
EventInfo:='GPIValue: '+IntToStr(Value.GPIValue)+#$0D#$0A+
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


{TGeoMonitoredObjectDeviceComponent}
Constructor TGeoMonitoredObjectDeviceComponent.Create(const pSchema: TComponentSchema);
begin
Inherited Create(pSchema,2,'GeoMonitoredObjectDeviceComponent');
//. items
//. components
ConnectionModule        :=TConnectionModule.Create              (Self,1);
GPSModule               :=TGPSModule.Create                     (Self,2);
GPIModule               :=TGPIModule.Create                     (Self,3);
GPOModule               :=TGPOModule.Create                     (Self,4);
ADCModule               :=TADCModule.Create                     (Self,5);
DACModule               :=TDACModule.Create                     (Self,6);
BatteryModule           :=TBatteryModule.Create                 (Self,7);
DeviceDescriptor        :=TDeviceDescriptor.Create              (Self,8);
TelemetryModule         :=TTelemetryModule.Create               (Self,9);
//. referencing items
Configuration           :=TDeviceConfigurationValue.Create      (Self,1000);
Checkpoint1             :=TDeviceCheckpointValue1.Create        (Self,1100);
GPIValueFixValue        :=TGPIValueFixValue.Create              (Self,1200);
end;

                                                       
{TGeoMonitoredObjectDeviceSchema}
Constructor TGeoMonitoredObjectDeviceSchema.Create(const pObjectModel: TObjectModel);
begin
Inherited Create(pObjectModel);
Name:='DeviceSchema';
RootComponent:=TGeoMonitoredObjectDeviceComponent.Create(Self);
end;


//. summary object model

{TGeoMonitoredObjectModel}
class function TGeoMonitoredObjectModel.ID: integer;
begin
Result:=GeoMonitoredObjectModelID;
end;

class function TGeoMonitoredObjectModel.Name: string;
begin
Result:='Model1';
end;

Constructor TGeoMonitoredObjectModel.Create(const pObjectController: TGEOGraphServerObjectController; const flFreeController: boolean);
begin
Inherited Create(pObjectController,flFreeController);
ObjectSchema:=TGeoMonitoredObjectSchema.Create(Self);
ObjectDeviceSchema:=TGeoMonitoredObjectDeviceSchema.Create(Self);
end;

function TGeoMonitoredObjectModel.GetControlPanel(): TObjectModelControlPanel;
begin
if (ControlPanel = nil)
 then ControlPanel:=TGeoMonitoredObjectControlPanel.Create(Self);
Result:=ControlPanel;
end;

function TGeoMonitoredObjectModel.IsObjectOnline: boolean;
begin
Lock.Enter;
try
Result:=TGeoMonitoredObjectDeviceComponent(ObjectDeviceSchema.RootComponent).ConnectionModule.IsOnline.BoolValue;
finally
Lock.Leave;
end;
end;

function TGeoMonitoredObjectModel.ObjectVisualization: TObjectDescriptor;
begin
Lock.Enter;
try
Result:=TGeoMonitoredObjectComponent(ObjectSchema.RootComponent).Visualization.Descriptor.Value;
finally
Lock.Leave;
end;
end;

function TGeoMonitoredObjectModel.ObjectGeoSpaceID: integer;
begin
Lock.Enter;
try
Result:=TGeoMonitoredObjectComponent(ObjectSchema.RootComponent).GeoSpaceID.Value;
finally
Lock.Leave;
end;
end;

function TGeoMonitoredObjectModel.ObjectDatumID: integer;
begin
Lock.Enter;
try
Result:=TGeoMonitoredObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.DatumID.Value;
finally
Lock.Leave;
end;
end;

procedure TGeoMonitoredObjectModel.Object_GetLocationFix(out TimeStamp: double; out DatumID: integer; out Latitude: double; out Longitude: double; out Altitude: double; out Speed: double; out Bearing: double; out Precision: double); 
begin
Lock.Enter;
try
DatumID:=TGeoMonitoredObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.DatumID.Value;
//.
TimeStamp:=TGeoMonitoredObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.TimeStamp;
Latitude:=TGeoMonitoredObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Latitude;
Longitude:=TGeoMonitoredObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Longitude;
Altitude:=TGeoMonitoredObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Altitude;
Speed:=TGeoMonitoredObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Speed;
Bearing:=TGeoMonitoredObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Bearing;
Precision:=TGeoMonitoredObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Precision;
finally
Lock.Leave;
end;
end;

function TGeoMonitoredObjectModel.DeviceConnectorServiceProviderNumber: double;
begin
Lock.Enter;
try
Result:=TGeoMonitoredObjectDeviceComponent(ObjectDeviceSchema.RootComponent).ConnectionModule.ServiceProvider.Number.Value;
finally
Lock.Leave;
end;
end;

procedure TGeoMonitoredObjectModel.GetDayLogGeoData(const DayDate: TDateTime; out GeoDataStream: TMemoryStream);
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


end.
