unit unitGSTraqObjectModel;
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
  GSTraqObjectModelID = 5;
                                                      
Type
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

  TGSTraqObjectComponent = class;                 

  TConfigurationValue = class(TComponentValue)
  private
    ObjectComponent: TGSTraqObjectComponent;
  public
    Value: TConfigurationData;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
  end;

  TGSTraqObjectComponent = class(TSchemaComponent)
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

  TGSTraqObjectSchema = class(TComponentSchema)
  public
    Constructor Create(const pObjectModel: TObjectModel);
  end;


  //. Object device schema side
  TConnectionModuleServiceProvider = class(TSchemaComponent)
  public
    ProviderID: TComponentUInt16Value;
    Number: TComponentDoubleValue;
    Account: TComponentUInt16Value;
    Tariff: TComponentUInt16Value;
    KeepAliveInterval: TComponentUInt16Value;
    IMEI: TComponentANSIStringValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TConnectionModuleVoiceModule = class(TSchemaComponent)
  public
    WiretappingPhoneNumber: TComponentANSIStringValue;
    
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TConnectionModule = class(TSchemaComponent)
  public
    CheckPointInterval: TComponentInt16Value;
    LastCheckpointTime: TComponentDoubleValue;
    IsOnline: TComponentBooleanValue;
    ServiceProvider: TConnectionModuleServiceProvider;
    Password: TComponentANSIStringValue;
    VoiceModule: TConnectionModuleVoiceModule;

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

  TGPSModuleMapPOIComponent = class(TSchemaComponent)
  public
    MapPOIData: TMapPOIDataValue;

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
    Value1: TComponentDoubleValue;
    Value2: TComponentDoubleValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;

  TBatteryModule = class(TSchemaComponent)
  public
    Voltage: TComponentUInt16Value;
    Charge: TComponentUInt16Value;
    State: TComponentUInt16Value;

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

  TCommandModule = class(TSchemaComponent)
  public
    Command: TComponentANSIStringValue;
    Response: TComponentANSIStringValue;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer);
  end;


  TDeviceConfigurationData = packed record
    CheckpointInterval: smallint;
    GeoDistanceThreshold: smallint;
  end;

  TGSTraqObjectDeviceComponent = class;

  TDeviceConfigurationValue = class(TComponentValue)
  private
    DeviceComponent: TGSTraqObjectDeviceComponent;
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
    DeviceComponent: TGSTraqObjectDeviceComponent;
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
    DeviceComponent: TGSTraqObjectDeviceComponent;
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


  TGSTraqObjectDeviceComponent = class(TSchemaComponent)
  public
    ConnectionModule:   TConnectionModule;
    GPSModule:          TGPSModule;
    GPIModule:          TGPIModule;
    GPOModule:          TGPOModule;
    ADCModule:          TADCModule;
    BatteryModule:      TBatteryModule;
    DeviceDescriptor:   TDeviceDescriptor;
    CommandModule:      TCommandModule;
    //. referenced values
    Configuration:      TDeviceConfigurationValue;
    Checkpoint1:        TDeviceCheckpointValue1;
    GPIValueFixValue:   TGPIValueFixValue;

    Constructor Create(const pSchema: TComponentSchema);
  end;

  TGSTraqObjectDeviceSchema = class(TComponentSchema)
  public
    Constructor Create(const pObjectModel: TObjectModel);
  end;


  //. MODEL
  TGSTraqObjectModel = class(TObjectModel)
  public
    class function ID: integer; override;
    class function Name: string; override;

    Constructor Create(const pObjectController: TGEOGraphServerObjectController; const flFreeController: boolean);
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
  unitGSTraqObjectControlPanel;


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
ObjectComponent:=TGSTraqObjectComponent(Owner);
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


{TGSTraqObjectComponent}
Constructor TGSTraqObjectComponent.Create(const pSchema: TComponentSchema);
begin
Inherited Create(pSchema,1,'GSTraqObjectComponent');
GeoSpaceID              :=TComponentInt32Value.Create   (Self,1,'GeoSpaceID');
Visualization           :=TVisualizationComponent.Create(Self,2);
Hint                    :=TComponentInt32Value.Create   (Self,3,'Hint');
UserAlert               :=TComponentInt32Value.Create   (Self,4,'UserAlert');
OnlineFlag              :=TComponentInt32Value.Create   (Self,5,'OnlineFlag');
LocationIsAvailableFlag :=TComponentInt32Value.Create   (Self,6,'LocationIsAvailableFlag');
//. referenced values
Configuration           :=TConfigurationValue.Create    (Self,1000);
end;


{TGSTraqObjectSchema}
Constructor TGSTraqObjectSchema.Create(const pObjectModel: TObjectModel);
begin
Inherited Create(pObjectModel);
Name:='ObjectSchema';
RootComponent:=TGSTraqObjectComponent.Create(Self);
end;


//. Object Device schema side

{TConnectionModuleServiceProvider}
Constructor TConnectionModuleServiceProvider.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ServiceProvider');
ProviderID:=TComponentUInt16Value.Create(Self,1,'ProviderID');
Number:=TComponentDoubleValue.Create(Self,2,'Number');
Account:=TComponentUInt16Value.Create(Self,3,'Account');
Tariff:=TComponentuInt16Value.Create(Self,4,'Tariff');
KeepAliveInterval:=TComponentuInt16Value.Create(Self,5,'KeepAliveInterval');
IMEI:=TComponentANSIStringValue.Create(Self,6,'IMEI');
end;


{TConnectionModuleVoiceModule}
Constructor TConnectionModuleVoiceModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'VoiceModule');
WiretappingPhoneNumber:=TComponentANSIStringValue.Create(Self,1,'WiretappingPhoneNumber');
end;


{TConnectionModule}
Constructor TConnectionModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'ConnectionModule');
CheckPointInterval:=TComponentInt16Value.Create(Self,1,'CheckPointInterval');
LastCheckpointTime:=TComponentDoubleValue.Create(Self,2,'LastCheckpointTime');
IsOnline:=TComponentBooleanValue.Create(Self,3,'IsOnline');
ServiceProvider:=TConnectionModuleServiceProvider.Create(Self,4);
Password:=TComponentANSIStringValue.Create(Self,5,'Password');
VoiceModule:=TConnectionModuleVoiceModule.Create(Self,6);
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

{TGPSModuleMapPOIComponent}
Constructor TGPSModuleMapPOIComponent.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'MapPOI');
MapPOIData:=TMapPOIDataValue.Create(Self,1,'Data');
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
Value1:=TComponentDoubleValue.Create(Self,1,'Value1');
Value2:=TComponentDoubleValue.Create(Self,2,'Value2');
end;


{TBatteryModule}
Constructor TBatteryModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'BatteryModule');
Voltage:=TComponentUInt16Value.Create(Self,1,'Voltage');
Charge:=TComponentUInt16Value.Create(Self,2,'Charge');
State:=TComponentUInt16Value.Create(Self,3,'State');
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


{TCommandModule}
Constructor TCommandModule.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'CommandModule');
Command:=TComponentANSIStringValue.Create(Self,1,'Command');
Response:=TComponentANSIStringValue.Create(Self,2,'Response');
end;


{TDeviceConfigurationValue}
Constructor TDeviceConfigurationValue.Create(const pOwner: TSchemaComponent; const pID: integer);
begin
Inherited Create(pOwner,pID,'Configuration');
Value.CheckpointInterval:=0;
Value.GeoDistanceThreshold:=0;
flVirtualValue:=true;
DeviceComponent:=TGSTraqObjectDeviceComponent(Owner);
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
DeviceComponent:=TGSTraqObjectDeviceComponent(Owner);
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
DeviceComponent:=TGSTraqObjectDeviceComponent(Owner);
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


{TGSTraqObjectDeviceComponent}
Constructor TGSTraqObjectDeviceComponent.Create(const pSchema: TComponentSchema);
begin
Inherited Create(pSchema,2,'GSTraqObjectDeviceComponent');
//. items
//. components
ConnectionModule        :=TConnectionModule.Create              (Self,1);
GPSModule               :=TGPSModule.Create                     (Self,2);
GPIModule               :=TGPIModule.Create                     (Self,3);
GPOModule               :=TGPOModule.Create                     (Self,4);
ADCModule               :=TADCModule.Create                     (Self,5);
BatteryModule           :=TBatteryModule.Create                 (Self,6);
DeviceDescriptor        :=TDeviceDescriptor.Create              (Self,7);
CommandModule           :=TCommandModule.Create                 (Self,8);
//. referencing items
Configuration           :=TDeviceConfigurationValue.Create      (Self,1000);
Checkpoint1             :=TDeviceCheckpointValue1.Create        (Self,1100);
GPIValueFixValue        :=TGPIValueFixValue.Create              (Self,1200);
end;

                                                       
{TGSTraqObjectDeviceSchema}
Constructor TGSTraqObjectDeviceSchema.Create(const pObjectModel: TObjectModel);
begin
Inherited Create(pObjectModel);
Name:='DeviceSchema';
RootComponent:=TGSTraqObjectDeviceComponent.Create(Self);
end;


//. summary object model

{TGSTraqObjectModel}
class function TGSTraqObjectModel.ID: integer;
begin
Result:=GSTraqObjectModelID;
end;

class function TGSTraqObjectModel.Name: string;
begin
Result:='GSTraq';
end;

Constructor TGSTraqObjectModel.Create(const pObjectController: TGEOGraphServerObjectController; const flFreeController: boolean);
begin
Inherited Create(pObjectController,flFreeController);
ObjectSchema:=TGSTraqObjectSchema.Create(Self);
ObjectDeviceSchema:=TGSTraqObjectDeviceSchema.Create(Self);
end;

function TGSTraqObjectModel.GetControlPanel(): TObjectModelControlPanel;
begin
if (ControlPanel = nil)
 then ControlPanel:=TGSTraqObjectControlPanel.Create(Self);
Result:=ControlPanel;
end;

function TGSTraqObjectModel.IsObjectOnline: boolean;
begin
Lock.Enter;
try
Result:=TGSTraqObjectDeviceComponent(ObjectDeviceSchema.RootComponent).ConnectionModule.IsOnline.BoolValue;
finally
Lock.Leave;
end;
end;

function TGSTraqObjectModel.ObjectVisualization: TObjectDescriptor;
begin
Lock.Enter;
try
Result:=TGSTraqObjectComponent(ObjectSchema.RootComponent).Visualization.Descriptor.Value;
finally
Lock.Leave;
end;
end;

function TGSTraqObjectModel.ObjectGeoSpaceID: integer;
begin
Lock.Enter;
try
Result:=TGSTraqObjectComponent(ObjectSchema.RootComponent).GeoSpaceID.Value;
finally
Lock.Leave;
end;
end;

function TGSTraqObjectModel.ObjectDatumID: integer;
begin
Lock.Enter;
try
Result:=TGSTraqObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.DatumID.Value;
finally
Lock.Leave;
end;
end;

procedure TGSTraqObjectModel.Object_GetLocationFix(out TimeStamp: double; out DatumID: integer; out Latitude: double; out Longitude: double; out Altitude: double; out Speed: double; out Bearing: double; out Precision: double);
begin
Lock.Enter;
try
DatumID:=TGSTraqObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.DatumID.Value;
//.
TimeStamp:=TGSTraqObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.TimeStamp;
Latitude:=TGSTraqObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Latitude;
Longitude:=TGSTraqObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Longitude;
Altitude:=TGSTraqObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Altitude;
Speed:=TGSTraqObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Speed;
Bearing:=TGSTraqObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Bearing;
Precision:=TGSTraqObjectDeviceComponent(ObjectDeviceSchema.RootComponent).GPSModule.GPSFixData.Value.Precision;
finally
Lock.Leave;
end;
end;

function TGSTraqObjectModel.DeviceConnectorServiceProviderNumber: double;
begin
Lock.Enter;
try
Result:=TGSTraqObjectDeviceComponent(ObjectDeviceSchema.RootComponent).ConnectionModule.ServiceProvider.Number.Value;
finally
Lock.Leave;
end;
end;

procedure TGSTraqObjectModel.GetDayLogGeoData(const DayDate: TDateTime; out GeoDataStream: TMemoryStream);
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
