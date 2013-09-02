unit unitObjectModel;
interface
uses
  SysUtils,
  Windows,
  SyncObjs,                                     
  ActiveX,                                                      
  MSXML,
  Messages,
  Classes,
  Controls,
  Graphics,
  Forms,                                         
  GlobalSpaceDefines,
  {$IFNDEF Plugin}                           
  Functionality,
  TypesFunctionality,
  {$ELSE}
  FunctionalityImport,         
  {$ENDIF}                            
  TypesDefines,
  unitGEOGraphServerController;


Const
  WM_UPDATECONTROLPANEL = WM_USER+1;
  
Type                                             
  TAddress = array of integer;
  EAddressIsNotFound = class(Exception);

  TObjectDescriptor = packed record
    idTObj: integer;
    idObj: integer;                                
  end;

  TGeoObjectTrack = record
    Next: pointer;
    //.
    ID: integer;
    TrackName: string;                                  
    idTOwner: integer;
    idOwner: integer;
    flEnabled: boolean;
    DatumID: integer;
    Nodes: pointer;
    ObjectModelEvents: pointer;
    BusinessModelEvents: pointer;
    Color: TColor;
    CoComponentID: integer;
    StopsAndMovementsAnalysis: TObject;
    //.
    Reflection_IntervalTimestamp: TDateTime;
    Reflection_IntervalDuration: TDateTime;
    Reflection_flShowTrack: boolean;
    Reflection_flShowTrackNodes: boolean;
    Reflection_flSpeedColoredTrack: boolean;
    Reflection_flShowStopsAndMovementsGraph: boolean;
    Reflection_flHideMovementsGraph: boolean;
    Reflection_flShowObjectModelEvents: boolean;
    Reflection_flShowBusinessModelEvents: boolean;
    Reflection_PropsPanel: TObject;
  end;

  TGeoObjectTrackDecriptor = packed record //. modify with the same in FunctionalityImport
    ObjectName: string;
    ObjectDomain: string;
    ptrTrack: pointer;
  end;

  TGeoObjectTrackDecriptors = array of TGeoObjectTrackDecriptor;

  TObjectTrackNode = record
    Next: pointer;
    //.
    TimeStamp: TDateTime;
    Latitude: double;
    Longitude: double;
    Altitude: double;
    Speed: double;
    Bearing: double;
    Precision: double;
    X,Y: TCrd;
  end;

const
  EVENTTAG_NONE = 0;
  //.
  EVENTTAG_POI_TAGBASE = 1000001;
  EVENTTAG_POI_TAGLENGTH = 20;
  EVENTTAG_POI_NEW = EVENTTAG_POI_TAGBASE;
  EVENTTAG_POI_ADDTEXT = EVENTTAG_POI_TAGBASE+1;
  EVENTTAG_POI_ADDIMAGE = EVENTTAG_POI_TAGBASE+2;
  EVENTTAG_POI_ADDDATAFILE = EVENTTAG_POI_TAGBASE+3;

Type
  TObjectTrackEventSeverity = (
    otesInfo,
    otesMinor,
    otesMajor,
    otesCritical
  );

  TObjectTrackEventSeverities = set of TObjectTrackEventSeverity;

  TObjectTrackEvent = record
    Next: pointer;
    //.
    TimeStamp: TDateTime;
    Severity: TObjectTrackEventSeverity;
    EventTag: integer;
    EventMessage: string;
    EventInfo: string;
    EventExtra: TByteArray;
    flBelongsToLastLocation: boolean;
    //.
    X,Y: TCrd;
  end;

  TObjectTrackEvents = array of TObjectTrackEvent;

  TSchemaComponent = class;

  TComponentElement = class
  private
    class procedure PrepareAddressArray(const Address: TAddress; out AddressArray: TByteArray);
    procedure GetAddress(out Address: TAddress);
    procedure GetAddressArray(out Address: TByteArray);
    function GetAddressString(): string;
  public
    Owner: TSchemaComponent;
    ID: integer;
    Name: string;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
    function FullName(const ExceptRootComponent: boolean = true): string;
    procedure FromByteArray(const BA: TByteArray; var Index: integer); virtual;
    procedure FromByteArrayByAddress(const BA: TByteArray; var Index: integer; const Address: TAddress; const AddressIndex: integer); virtual; abstract;
    function ToByteArray(): TByteArray; virtual;
    function ToByteArrayByAddress(const Address: TAddress; const AddressIndex: integer): TByteArray; virtual; abstract;
    procedure FromXMLNode(const Node: IXMLDOMNode); virtual;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); virtual; 
    procedure ToXMLNode(const Node: IXMLDOMElement); virtual; abstract;
    procedure ToXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMElement); virtual; abstract;
    function ToTrackNode(): pointer; virtual;
    function ToTrackEvent(): pointer; virtual;
    procedure Read(); virtual; //. read from server schema
    procedure ReadCUAC(); virtual; //. read from server schema with component specific user access(read) check
    procedure ReadByAddress(const Address: TAddress); virtual; abstract; //. read from server schema by address with component specific user access(read) check
    procedure ReadByAddressCUAC(const Address: TAddress); virtual; abstract; //. read from server schema by address
    procedure ReadByAddressData(const AddressData: TByteArray); virtual; //. read from server schema
    procedure ReadByAddressDataCUAC(const AddressData: TByteArray); virtual; //. read from server schema with component specific user access(read) check
    procedure ReadDevice(); virtual; //. read from device schema
    procedure ReadDeviceCUAC; virtual; //. read from device schema with component specific user access(read) check
    procedure ReadDeviceByAddress(const Address: TAddress); virtual; abstract; //. read from device schema by address
    procedure ReadDeviceByAddressCUAC(const Address: TAddress); virtual; abstract; //. read from device schema by address with component specific user access(read) check
    procedure ReadDeviceByAddressData(const AddressData: TByteArray); virtual; //. read from device schema
    procedure ReadDeviceByAddressDataCUAC(const AddressData: TByteArray); virtual; //. read from device schema with component specific user access(read) check
    procedure Write(); virtual; //. write to server schema
    procedure WriteCUAC(); virtual; //. write to server schema by address data with component specific user access(write) check
    procedure WriteByAddress(const Address: TAddress); virtual; abstract; //. write to server schema by address
    procedure WriteByAddressCUAC(const Address: TAddress); virtual; abstract; //. write to server schema by address with component specific user access(write) check
    procedure WriteByAddressData(const AddressData: TByteArray); virtual; //. write to server schema by address data
    procedure WriteByAddressDataCUAC(const AddressData: TByteArray); virtual; //. write to server schema by address data with component specific user access(write) check
    procedure WriteDevice(); virtual; //. write to device schema 
    procedure WriteDeviceCUAC(); virtual; //. write to device schema with component specific user access(write) check
    procedure WriteDeviceByAddress(const Address: TAddress); virtual; abstract; //. write to device schema by address
    procedure WriteDeviceByAddressCUAC(const Address: TAddress); virtual; abstract; //. write to device schema by address with component specific user access(write) check
    procedure WriteDeviceByAddressData(const AddressData: TByteArray); virtual; //. write to device schema by address data
    procedure WriteDeviceByAddressDataCUAC(const AddressData: TByteArray); virtual; //. write to device schema by address data with component specific user access(write) check
  end;


  TComponentItem = class(TComponentElement)
  public
    flVirtualValue: boolean;

    Constructor Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
  end;


  TComponentValue = class(TComponentItem);


  TComponentSchema = class;

  TSchemaComponent = class(TComponentElement)
  private
    procedure GetAddressArrayForItems(out Address: TByteArray);
  public
    Items: TList;
    OwnComponents: TList;
    Schema: TComponentSchema;

    class function GetAddressFromString(const AddressString: string): TAddress;

    Constructor Create(const pSchema: TComponentSchema; const pID: integer; const pName: string); overload;
    Constructor Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string); overload;
    Destructor Destroy; override;
    function GetComponentElement(const Address: TAddress; var AddressIndex: integer): TComponentElement;
    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure Read(); override;           //. read all items from server schema
    procedure ReadCUAC(); override;           //. read all items from server schema with component specific user access(read) check
    procedure ReadDevice(); override;     //. read all items from device schema
    procedure ReadDeviceCUAC(); override;     //. read all items from device schema with component specific user access(read) check
    procedure ReadAll(); virtual;         //. read (items + own components) from server schema
    procedure ReadAllCUAC(); virtual;         //. read (items + own components) from server schema with component specific user access(read) check
    procedure LoadAll();
    procedure ReadAllDevice(); virtual;   //. read (items + own components) from device schema
    procedure ReadAllDeviceCUAC(); virtual;   //. read (items + own components) from device schema with component specific user access(read) check
    procedure Write(); override;          //. write all items to server schema
    procedure WriteCUAC(); override;          //. write all items to server schema with component specific user access(write) check
    procedure WriteDevice(); override;    //. write all items to device schema
    procedure WriteDeviceCUAC; override;    //. write all items to device schema with component specific user access(write) check
    procedure WriteAll(); virtual;        //. write (items + own components) to server schema
    procedure WriteAllCUAC(); virtual;        //. write (items + own components) to server schema with component specific user access(write) check
    procedure WriteAllDevice(); virtual;  //. write (items + own components) to device schema
    procedure WriteAllDeviceCUAC(); virtual;  //. write (items + own components) to device schema with component specific user access(write) check
  end;


  TObjectModel = class;

  TComponentSchema = class
  public
    Name: string;
    ObjectModel: TObjectModel;
    RootComponent: TSchemaComponent;

    Constructor Create(const pObjectModel: TObjectModel);
    Destructor Destroy; override;
  end;

                                                       
  TObjectModelControlPanel = class(TForm)
  private                                                        
    _Model: TObjectModel;
    Updater: TComponentPresentUpdater;

    procedure wmUPDATECONTROLPANEL(var Message: TMessage); message WM_UPDATECONTROLPANEL;
  public
    Constructor Create(const pModel: TObjectModel);
    Destructor Destroy; override;
    procedure PostUpdate; virtual;
    procedure Update; reintroduce; virtual;               
  end;


  TCreateObjectModelTrackEventFunc = function (const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer of object;
  TCreateBusinessModelTrackEventFunc = function (const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer of object;

  TObjectModelClass = class of TObjectModel;

  TObjectModel = class(TInterfacedObject)
  public
    Lock: TCriticalSection;
    ObjectController: TGEOGraphServerObjectController;
    flFreeObjectController: boolean;
    ObjectSchema: TComponentSchema;
    ObjectDeviceSchema: TComponentSchema;
    flComponentUserAccessControl: boolean;
    ControlPanel: TObjectModelControlPanel;

    class function GetModelClass(const pModelID: integer): TObjectModelClass;
    class function GetModel(const pModelID: integer; const pObjectController: TGEOGraphServerObjectController; const flFreeController: boolean = false): TObjectModel;

    class function ID: integer; virtual; abstract;
    class function Name: string; virtual; abstract;

    Constructor Create(const pObjectController: TGEOGraphServerObjectController; const flFreeController: boolean); virtual;
    Destructor Destroy; override;
    function  Object_GetInfo(const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean; virtual;
    function  Object_GetHintInfo(const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean; virtual;
    function  IsObjectOnline: boolean; virtual; abstract;
    function  ObjectGeoSpaceID: integer; virtual;
    function  ObjectVisualization: TObjectDescriptor; virtual;
    function  ObjectDatumID: integer; virtual;
    procedure Object_GetLocationFix(out TimeStamp: double; out DatumID: integer; out Latitude: double; out Longitude: double; out Altitude: double; out Speed: double; out Bearing: double; out Precision: double); virtual;
    procedure GetData(const DataType: Integer; out Data: TByteArray); virtual; abstract;
    procedure SetData(const DataType: Integer; const Data: TByteArray); virtual; abstract;
    function CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer; virtual;
    function            Log_CreateTrackByDay(const DayDate: TDateTime; const pTrackName: string; const pTrackColor: TColor; const TrackCoComponentID: integer; const CreateObjectModelTrackEventFunc: TCreateObjectModelTrackEventFunc; const CreateBusinessModelTrackEventFunc: TCreateBusinessModelTrackEventFunc): pointer;
    function            Log_CreateTrackByDays(const DayDate: TDateTime; const DaysCount: integer; const pTrackName: string; const pTrackColor: TColor; const TrackCoComponentID: integer; const CreateObjectModelTrackEventFunc: TCreateObjectModelTrackEventFunc; const CreateBusinessModelTrackEventFunc: TCreateBusinessModelTrackEventFunc): pointer;
    class procedure     Log_DestroyTrack(var ptrDestroyTrack: pointer);
    class procedure     Log_Track_ClearNodes(var ptrTrack: pointer);
    function GetControlPanel(): TObjectModelControlPanel; virtual;
  end;

  TBaseBusinessModel = class
  public
    function CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer; virtual; abstract;
  end;

  //===== COMPONENT VALUE TYPES =====//
  TComponentByteValue = class(TComponentValue)
  public
    Value: Byte;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TComponentTimestampedByteData = packed record
    Timestamp: Double;
    Value: Byte;
  end;

  TComponentTimestampedByteValue = class(TComponentValue)
  public
    Value: TComponentTimestampedByteData;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;


  TComponentBooleanValue = class(TComponentByteValue)
  public
    procedure setBoolValue(_Value: boolean);
    function getBoolValue: boolean;
    property BoolValue: boolean read getBoolValue write setBoolValue;
  end;

  TComponentTimestampedBooleanData = packed record
    Timestamp: Double;
    Value: boolean;
  end;

  TComponentTimestampedBooleanValue = class(TComponentTimestampedByteValue)
  public
    procedure setBoolValue(_Value: TComponentTimestampedBooleanData);
    function getBoolValue: TComponentTimestampedBooleanData;
    property BoolValue: TComponentTimestampedBooleanData read getBoolValue write setBoolValue;
  end;


  TComponentUInt16Value = class(TComponentValue)
  public
    LastValue: Word;
    Value: Word;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    function ToByteArrayByAddress(const Address: TAddress; const AddressIndex: integer): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    procedure ReadByAddress(const Address: TAddress); override;
    procedure ReadByAddressCUAC(const Address: TAddress); override;
    procedure ReadDeviceByAddress(const Address: TAddress); override;
    procedure ReadDeviceByAddressCUAC(const Address: TAddress); override;
    procedure WriteByAddress(const Address: TAddress); override;
    procedure WriteByAddressCUAC(const Address: TAddress); override;
    procedure WriteDeviceByAddress(const Address: TAddress); override;
    procedure WriteDeviceByAddressCUAC(const Address: TAddress); override;
    function ToTrackEvent(): pointer; override;
  end;

  TComponentTimestampedUInt16Data = packed record
    Timestamp: Double;
    Value: Word;
  end;

  TComponentTimestampedUInt16Value = class(TComponentValue)
  public
    LastValue: TComponentTimestampedUInt16Data;
    Value: TComponentTimestampedUInt16Data;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    function ToByteArrayByAddress(const Address: TAddress; const AddressIndex: integer): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    procedure ReadByAddress(const Address: TAddress); override;
    procedure ReadByAddressCUAC(const Address: TAddress); override;
    procedure ReadDeviceByAddress(const Address: TAddress); override;
    procedure ReadDeviceByAddressCUAC(const Address: TAddress); override;
    procedure WriteByAddress(const Address: TAddress); override;
    procedure WriteByAddressCUAC(const Address: TAddress); override;
    procedure WriteDeviceByAddress(const Address: TAddress); override;
    procedure WriteDeviceByAddressCUAC(const Address: TAddress); override;
    function ToTrackEvent(): pointer; override;
  end;


  TComponentInt16Value = class(TComponentValue)
  public
    Value: SmallInt;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TComponentTimestampedInt16Data = packed record
    Timestamp: Double;
    Value: SmallInt;
  end;

  TComponentTimestampedInt16Value = class(TComponentValue)
  public
    Value: TComponentTimestampedInt16Data;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;


  TComponentUInt32Value = class(TComponentValue)
  public                                                    
    Value: DWord;                                           

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TComponentTimestampedUInt32Data = packed record
    Timestamp: Double;
    Value: DWord;
  end;

  TComponentTimestampedUInt32Value = class(TComponentValue)
  public
    Value: TComponentTimestampedUInt32Data;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;


  TComponentInt32Value = class(TComponentValue)
  public
    Value: integer;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TComponentTimestampedInt32Data = packed record
    Timestamp: Double;
    Value: Integer;
  end;

  TComponentTimestampedInt32Value = class(TComponentValue)
  public
    Value: TComponentTimestampedInt32Data;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;


  TComponentDoubleValue = class(TComponentValue)
  public
    Value: double;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;

  TComponentTimestampedDoubleData = packed record
    Timestamp: Double;
    Value: Double;
  end;

  TComponentTimestampedDoubleValue = class(TComponentValue)
  public
    Value: TComponentTimestampedDoubleData;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;


  TComponentObjectDescriptorValue = class(TComponentValue)
  public
    Value: TObjectDescriptor;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
  end;


  TXYCrdData = packed record
    X: double;
    Y: double;
  end;

  TComponentXYCrdValue = class(TComponentValue)
  public
    Value: TXYCrdData;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
  end;


  TComponentANSIStringValue = class(TComponentValue)
  public
    Value: ANSIString;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
  end;

  TComponentTimestampedANSIStringData = packed record
    Timestamp: Double;
    Value: ANSIString;
  end;

  TComponentTimestampedANSIStringValue = class(TComponentValue)
  public
    Value: TComponentTimestampedANSIStringData;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    procedure FromXMLNode(const Node: IXMLDOMNode); override;
    procedure FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); override;
    function ToTrackEvent(): pointer; override;
  end;


  TComponentInt32AndANSIStringValue = class(TComponentValue)
  public
    Int32Value: integer;
    StringValue: ANSIString;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
  end;


  TComponentInt32AndInt32AndANSIStringValue = class(TComponentValue)
  public
    Int32Value: integer;
    Int32Value1: integer;
    StringValue: ANSIString;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
  end;


  TComponentDataValue = class(TComponentValue)
  public
    Value: TByteArray;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
  end;

  TComponentTimestampedData = packed record
    Timestamp: Double;
    Value: TByteArray;
  end;

  TComponentTimestampedDataValue = class(TComponentValue)
  public
    Value: TComponentTimestampedData;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
  end;


  TDoubleArray = array of Double;

  TComponentDoubleArrayValue = class(TComponentValue)
  public
    Value: TDoubleArray;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    function ToString(): string;
  end;

  TComponentTimestampedDoubleArrayData = packed record
    Timestamp: Double;
    Value: TDoubleArray;
  end;

  TComponentTimestampedDoubleArrayValue = class(TComponentValue)
  public
    Value: TComponentTimestampedDoubleArrayData;

    procedure FromByteArray(const BA: TByteArray; var Index: integer); override;
    function ToByteArray(): TByteArray; override;
    function ToString(): string;
  end;


Const
  ObjectTrackEventSeverityStrings: array[TObjectTrackEventSeverity] of string = (
    'Info',
    'Minor',
    'Major',
    'Critical'
  );

  ObjectTrackEventSeverityColors: array[TObjectTrackEventSeverity] of TColor = (
    clInfoBk,
    clYellow,
    clFuchsia,
    clRed
  );

  ObjectTrackEventSeverityFontColors: array[TObjectTrackEventSeverity] of TColor = (
    clBlack,
    clBlack,
    clBlack,
    clWhite
  );

var
  NoFixPrecision: double = 1000000000.0;
  EmptyTime: double = 0.0;
  TimeZoneInfo: TTimeZoneInformation;
  TimeZoneDelta: TDateTime = 0.0;


  //. misc routines
  function SplitString(const S: string; Delimiter: Char; out SL: TStringList): boolean;

implementation
Uses
  ZLibEx,
  {$IFNDEF Plugin}
  unitEventLog,
  {$ENDIF}
  unitGeoMonitoredObjectModel,
  unitGeoMonitoredObject1Model,
  unitEnforaObjectModel,
  unitEnforaMT3000ObjectModel,
  unitEnforaMiniMTObjectModel,
  unitNavixyObjectModel,
  unitGeoMonitoredMedDeviceModel,
  unitGSTraqObjectModel;


function SplitString(const S: string; Delimiter: Char; out SL: TStringList): boolean;
var
  SS: string;
  I: integer;
begin
SL:=TStringList.Create();
try
SS:='';
for I:=1 to Length(S) do
  if (S[I] = Delimiter)
   then begin
    if (SS <> '')
     then begin
      SL.Add(SS);
      SS:='';
      end;
    end
  else
   if (S[I] <> ' ') then SS:=SS+S[I];
if (SS <> '')
 then begin
  SL.Add(SS);
  SS:='';
  end;
if (SL.Count > 0)
 then Result:=true
 else begin
  FreeAndNil(SL);
  Result:=false;
  end;
except
  FreeAndNil(SL);
  Raise; //. =>
  end;
end;

function StrToFloat(const S: string): Double;
begin
DecimalSeparator:='.';
Result:=SysUtils.StrToFloat(S);
end;


{TComponentElement}
class procedure TComponentElement.PrepareAddressArray(const Address: TAddress; out AddressArray: TByteArray);
var
  AddressCount: word;
  AddressItem: word;
  AddressSize: integer;
  P: pointer;
  I: integer;
begin
AddressCount:=Length(Address);
AddressSize:=SizeOf(AddressCount)+AddressCount*SizeOf(AddressItem);
SetLength(AddressArray,AddressSize);
P:=@AddressArray[0];
Word(P^):=AddressCount; Inc(Integer(P),SizeOf(AddressCount));
for I:=0 to AddressCount-1 do begin
  AddressItem:=Word(Address[I]);
  Word(P^):=AddressItem; Inc(Integer(P),SizeOf(AddressItem));
  end;
end;

Constructor TComponentElement.Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
begin
Inherited Create;
Owner:=pOwner;
ID:=pID;
Name:=pName;
end;

procedure TComponentElement.GetAddress(out Address: TAddress);
var
  AddressCount: word;
  AddressItem: word;
  C: TSchemaComponent;
begin
AddressCount:=1;
C:=Owner;
while (C <> nil) do begin
  Inc(AddressCount);
  C:=C.Owner;
  end;
SetLength(Address,AddressCount);
Dec(AddressCount);
Address[AddressCount]:=ID; Dec(AddressCount);
C:=Owner;
while (C <> nil) do begin
  Address[AddressCount]:=C.ID; Dec(AddressCount);
  C:=C.Owner;
  end;
end;

procedure TComponentElement.GetAddressArray(out Address: TByteArray);
var
  AddressCount: word;
  AddressItem: word;
  C: TSchemaComponent;
  AddressSize: integer;
  P: pointer;
begin
AddressCount:=1;
C:=Owner;
while (C <> nil) do begin
  Inc(AddressCount);
  C:=C.Owner;
  end;
AddressSize:=SizeOf(AddressCount)+AddressCount*SizeOf(AddressItem);
SetLength(Address,AddressSize);
P:=@Address[0];
Word(P^):=AddressCount; Inc(Integer(P),SizeOf(AddressCount));
AddressItem:=Word(ID);
P:=@Address[Length(Address)-SizeOf(AddressItem)];
Word(P^):=AddressItem; Dec(Integer(P),SizeOf(AddressItem));
C:=Owner;
while (C <> nil) do begin
  AddressItem:=Word(C.ID);
  Word(P^):=AddressItem; Dec(Integer(P),SizeOf(AddressItem));
  C:=C.Owner;
  end;
end;

function TComponentElement.GetAddressString(): string;
var
  C: TSchemaComponent;                                     
begin
Result:=IntToStr(ID);
C:=Owner;                             
while (C <> nil) do begin
  Result:=IntToStr(C.ID)+'.'+Result;
  C:=C.Owner;
  end;
end;

function TComponentElement.FullName(const ExceptRootComponent: boolean = true): string;
var
  _Owner: TSchemaComponent;
begin
Result:=Name;
_Owner:=Owner;
while (_Owner <> nil) do begin
  if (NOT ExceptRootComponent OR (_Owner.Owner <> nil))
   then Result:=_Owner.Name+'/'+Result;                             
  _Owner:=_Owner.Owner;                                       
  end;                                      
end;

procedure TComponentElement.FromByteArray(const BA: TByteArray; var Index: integer);
begin
end;

function TComponentElement.ToByteArray(): TByteArray;
begin
Result:=nil;
end;

procedure TComponentElement.FromXMLNode(const Node: IXMLDOMNode);
begin
end;

procedure TComponentElement.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode); 
begin
end;

procedure TComponentElement.Read();
var
  AddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
begin
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.ObjectOperation_GetComponentDataCommand(AddressArray,Value);
Idx:=0;
FromByteArray(Value,Idx);
end;

procedure TComponentElement.ReadCUAC();
var
  AddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
begin
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.ObjectOperation_GetComponentDataCommand2(AddressArray,Value);
Idx:=0;
FromByteArray(Value,Idx);
end;

procedure TComponentElement.ReadByAddressData(const AddressData: TByteArray);
var
  AddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
begin
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.ObjectOperation_AddressDataGetComponentDataCommand(AddressArray,AddressData,Value);
Idx:=0;
FromByteArray(Value,Idx);
end;

procedure TComponentElement.ReadByAddressDataCUAC(const AddressData: TByteArray);
var
  AddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
begin
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.ObjectOperation_AddressDataGetComponentDataCommand1(AddressArray,AddressData,Value);
Idx:=0;
FromByteArray(Value,Idx);
end;

procedure TComponentElement.Write();
var
  AddressArray: TByteArray;
  Value: TByteArray;
begin
Value:=ToByteArray();
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.ObjectOperation_SetComponentDataCommand(AddressArray,Value);
end;

procedure TComponentElement.WriteCUAC();
var
  AddressArray: TByteArray;
  Value: TByteArray;
begin
Value:=ToByteArray();
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.ObjectOperation_SetComponentDataCommand2(AddressArray,Value);
end;

procedure TComponentElement.WriteByAddressData(const AddressData: TByteArray);
var
  AddressArray: TByteArray;
  Value: TByteArray;
begin
Value:=ToByteArray();
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.ObjectOperation_AddressDataSetComponentDataCommand(AddressArray,AddressData,Value);
end;

procedure TComponentElement.WriteByAddressDataCUAC(const AddressData: TByteArray);
var
  AddressArray: TByteArray;
  Value: TByteArray;
begin
Value:=ToByteArray();
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.ObjectOperation_AddressDataSetComponentDataCommand1(AddressArray,AddressData,Value);
end;

procedure TComponentElement.ReadDevice();
var
  AddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
begin
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.DeviceOperation_GetComponentDataCommand(AddressArray,Value);
Idx:=0;
FromByteArray(Value,Idx);
end;

procedure TComponentElement.ReadDeviceCUAC();
var
  AddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
begin
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.DeviceOperation_GetComponentDataCommand2(AddressArray,Value);
Idx:=0;
FromByteArray(Value,Idx);
end;

procedure TComponentElement.ReadDeviceByAddressData(const AddressData: TByteArray);
var
  AddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
begin
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.DeviceOperation_AddressDataGetComponentDataCommand(AddressArray,AddressData,Value);
Idx:=0;
FromByteArray(Value,Idx);
end;

procedure TComponentElement.ReadDeviceByAddressDataCUAC(const AddressData: TByteArray);
var
  AddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
begin
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.DeviceOperation_AddressDataGetComponentDataCommand1(AddressArray,AddressData,Value);
Idx:=0;
FromByteArray(Value,Idx);
end;

procedure TComponentElement.WriteDevice();
var
  AddressArray: TByteArray;
  Value: TByteArray;
begin
Value:=ToByteArray();
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.DeviceOperation_SetComponentDataCommand(AddressArray,Value);
end;

procedure TComponentElement.WriteDeviceCUAC();
var
  AddressArray: TByteArray;
  Value: TByteArray;
begin
Value:=ToByteArray();
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.DeviceOperation_SetComponentDataCommand2(AddressArray,Value);
end;

procedure TComponentElement.WriteDeviceByAddressData(const AddressData: TByteArray);
var
  AddressArray: TByteArray;
  Value: TByteArray;
begin
Value:=ToByteArray();
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.DeviceOperation_AddressDataSetComponentDataCommand(AddressArray,AddressData,Value);
end;

procedure TComponentElement.WriteDeviceByAddressDataCUAC(const AddressData: TByteArray);
var
  AddressArray: TByteArray;
  Value: TByteArray;
begin
Value:=ToByteArray();
GetAddressArray(AddressArray);
Owner.Schema.ObjectModel.ObjectController.DeviceOperation_AddressDataSetComponentDataCommand2(AddressArray,AddressData,Value);
end;

function TComponentElement.ToTrackNode(): pointer;
begin
Result:=nil;
end;

function TComponentElement.ToTrackEvent(): pointer;
begin
Result:=nil;
end;


{TComponentItem}
Constructor TComponentItem.Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
begin
Inherited Create(pOwner,pID,pName);
flVirtualValue:=false;
if (Owner <> nil)
 then begin
  if (Owner.Items = nil) then Owner.Items:=TList.Create(); 
  Owner.Items.Add(Self);
  end;
end;


{TSchemaComponent}
class function TSchemaComponent.GetAddressFromString(const AddressString: string): TAddress;

  procedure SplitStringIntoArray(const S: string; out SL: TStringList);
  var
    I: integer;
    Item: string;
  begin
  SL:=TStringList.Create;
  I:=1;
  Item:='';
  while (I <= Length(S)) do begin
    if (S[I] = '.')
     then begin
      if (Item <> '')
       then begin
        SL.Add(Item);
        Item:='';
        end;
      end
     else Item:=Item+S[I];
    Inc(I);
    end;
  if (Item <> '') then SL.Add(Item);
  end;

var
  SL: TStringList;
  I: integer;
begin
SplitStringIntoArray(AddressString, SL);
try
SetLength(Result,SL.Count);
for I:=0 to Length(Result)-1 do Result[I]:=StrToInt(SL[I]);
finally
SL.Destroy;
end;
end;

Constructor TSchemaComponent.Create(const pSchema: TComponentSchema; const pID: integer; const pName: string);
begin
Inherited Create(nil,pID,pName);
Items:=TList.Create();
Schema:=pSchema;
end;

Constructor TSchemaComponent.Create(const pOwner: TSchemaComponent; const pID: integer; const pName: string);
begin
Inherited Create(pOwner,pID,pName);
Items:=TList.Create();
if (Owner <> nil)
 then begin
  //. add myself as owner component
  if (Owner.OwnComponents = nil) then Owner.OwnComponents:=TList.Create;
  Owner.OwnComponents.Add(Self);
  //.
  Schema:=Owner.Schema;
  end;
end;

Destructor TSchemaComponent.Destroy;
var
  I: integer;
begin
if (OwnComponents <> nil)
 then begin
  for I:=0 to OwnComponents.Count-1 do TObject(OwnComponents[I]).Destroy();
  FreeAndNil(OwnComponents);
  end;
if (Items <> nil)
 then begin
  for I:=0 to Items.Count-1 do TObject(Items[I]).Destroy();
  FreeAndNil(Items);
  end;
Inherited;
end;

function TSchemaComponent.GetComponentElement(const Address: TAddress; var AddressIndex: integer): TComponentElement;
var
  AddressComponentID,AddressID: integer;
  I: integer;
begin
Result:=nil;
//.                             
AddressComponentID:=Address[AddressIndex];
if (AddressComponentID <> ID) then Exit; //. ->
Inc(AddressIndex);
if (AddressIndex >= Length(Address))
 then begin
  Result:=Self;
  Exit; //. ->
  end;
AddressID:=Address[AddressIndex];
//. search for item
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (TComponentItem(Items[I]).ID = AddressID)
     then begin
      Inc(AddressIndex);
      Result:=Items[I];
      Exit; //. ->
      end;
//. search for own component  
if (OwnComponents <> nil)
 then
  for I:=0 to OwnComponents.Count-1 do begin
    Result:=TSchemaComponent(OwnComponents[I]).GetComponentElement(Address, AddressIndex);
    if (Result <> nil) then Exit; //. ->
    end;
end;

procedure TSchemaComponent.GetAddressArrayForItems(out Address: TByteArray);
var
  AddressArray: TByteArray;
  AddressArrayForItems: TByteArray;
  P: pointer;
begin
GetAddressArray(AddressArray);
SetLength(AddressArrayForItems,SizeOf(AddressArray)+2{plus zero address item});
Move(Pointer(@AddressArray[0])^, Pointer(@AddressArrayForItems[0])^,Length(AddressArray));
Word(Pointer(@AddressArray[Length(AddressArray)-2])^):=0; //. zero address item as address of all component items
Inc(Word(Pointer(@AddressArray[0])^));
end;

procedure TSchemaComponent.FromByteArray(const BA: TByteArray; var Index: integer);
var
  I: integer;
begin
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then TComponentItem(Items[I]).FromByteArray(BA, Index);
if (OwnComponents <> nil)
 then
  for I:=0 to OwnComponents.Count-1 do TSchemaComponent(OwnComponents[I]).FromByteArray(BA, Index);
end;

function TSchemaComponent.ToByteArray(): TByteArray;
var
  I: integer;
  MS: TMemoryStream;
  ItemValue,ComponentValue: TByteArray;
begin
MS:=TMemoryStream.Create;
try
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then begin
      ItemValue:=TComponentItem(Items[I]).ToByteArray();
      MS.Write(Pointer(@ItemValue[0])^,Length(ItemValue));
      end;
if (OwnComponents <> nil)
 then
  for I:=0 to OwnComponents.Count-1 do begin
    ComponentValue:=TSchemaComponent(OwnComponents[I]).ToByteArray();
    MS.Write(Pointer(@ComponentValue[0])^,Length(ComponentValue));
    end;
SetLength(Result,MS.Size);
MS.Position:=0;
MS.Read(Pointer(@Result[0])^,Length(Result));
finally
MS.Destroy;
end;
end;

procedure TSchemaComponent.Read();
var
  ItemsAddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
  I: integer;
begin
GetAddressArrayForItems(ItemsAddressArray);
Schema.ObjectModel.ObjectController.ObjectOperation_GetComponentDataCommand(ItemsAddressArray,Value);
if (Items <> nil)
 then begin
  Idx:=0;
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then TComponentItem(Items[I]).FromByteArray(Value, Idx);
  end;
end;

procedure TSchemaComponent.ReadCUAC();
var
  ItemsAddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
  I: integer;
begin
GetAddressArrayForItems(ItemsAddressArray);
Schema.ObjectModel.ObjectController.ObjectOperation_GetComponentDataCommand2(ItemsAddressArray,Value);
if (Items <> nil)
 then begin
  Idx:=0;
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then TComponentItem(Items[I]).FromByteArray(Value, Idx);
  end;
end;

procedure TSchemaComponent.Write();
var                                                                   
  I: integer;                                         
  MS: TMemoryStream;                                   
  ItemValue,Value: TByteArray;                                 
  ItemsAddressArray: TByteArray;
begin
if (Items = nil) then Exit; //. ->
MS:=TMemoryStream.Create;
try                                                        
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then begin
      ItemValue:=TComponentItem(Items[I]).ToByteArray();
      MS.Write(Pointer(@ItemValue[0])^,Length(ItemValue));
      end;
SetLength(Value,MS.Size);
MS.Position:=0;
MS.Read(Pointer(Value[0])^,Length(Value));
finally
MS.Destroy;
end;
GetAddressArray(ItemsAddressArray);
Schema.ObjectModel.ObjectController.ObjectOperation_SetComponentDataCommand(ItemsAddressArray,Value);
end;

procedure TSchemaComponent.WriteCUAC();
var
  I: integer;
  MS: TMemoryStream;
  ItemValue,Value: TByteArray;
  ItemsAddressArray: TByteArray;
begin
if (Items = nil) then Exit; //. ->
MS:=TMemoryStream.Create;
try
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then begin
      ItemValue:=TComponentItem(Items[I]).ToByteArray();
      MS.Write(Pointer(@ItemValue[0])^,Length(ItemValue));
      end;
SetLength(Value,MS.Size);
MS.Position:=0;
MS.Read(Pointer(Value[0])^,Length(Value));
finally
MS.Destroy;
end;
GetAddressArray(ItemsAddressArray);
Schema.ObjectModel.ObjectController.ObjectOperation_SetComponentDataCommand2(ItemsAddressArray,Value);
end;

procedure TSchemaComponent.ReadDevice();
var
  ItemsAddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
  I: integer;
begin
GetAddressArrayForItems(ItemsAddressArray);
Schema.ObjectModel.ObjectController.DeviceOperation_GetComponentDataCommand(ItemsAddressArray,Value);
if (Items <> nil)
 then begin
  Idx:=0;
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then TComponentItem(Items[I]).FromByteArray(Value, Idx);
  end;
end;

procedure TSchemaComponent.ReadDeviceCUAC();
var
  ItemsAddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
  I: integer;
begin
GetAddressArrayForItems(ItemsAddressArray);
Schema.ObjectModel.ObjectController.DeviceOperation_GetComponentDataCommand2(ItemsAddressArray,Value);
if (Items <> nil)
 then begin
  Idx:=0;
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then TComponentItem(Items[I]).FromByteArray(Value, Idx);
  end;
end;

procedure TSchemaComponent.WriteDevice();
var
  I: integer;
  MS: TMemoryStream;
  ItemValue,Value: TByteArray;
  ItemsAddressArray: TByteArray;
begin
if (Items = nil) then Exit; //. ->
MS:=TMemoryStream.Create;
try
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then begin
      ItemValue:=TComponentItem(Items[I]).ToByteArray();
      MS.Write(Pointer(@ItemValue[0])^,Length(ItemValue));
      end;
SetLength(Value,MS.Size);
MS.Position:=0;
MS.Read(Pointer(Value[0])^,Length(Value));
finally
MS.Destroy;
end;
GetAddressArray(ItemsAddressArray);
Schema.ObjectModel.ObjectController.DeviceOperation_SetComponentDataCommand(ItemsAddressArray,Value);
end;

procedure TSchemaComponent.WriteDeviceCUAC();
var
  I: integer;
  MS: TMemoryStream;
  ItemValue,Value: TByteArray;
  ItemsAddressArray: TByteArray;
begin
if (Items = nil) then Exit; //. ->
MS:=TMemoryStream.Create;
try
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then begin
      ItemValue:=TComponentItem(Items[I]).ToByteArray();
      MS.Write(Pointer(@ItemValue[0])^,Length(ItemValue));
      end;
SetLength(Value,MS.Size);
MS.Position:=0;
MS.Read(Pointer(Value[0])^,Length(Value));
finally
MS.Destroy;
end;
GetAddressArray(ItemsAddressArray);
Schema.ObjectModel.ObjectController.DeviceOperation_SetComponentDataCommand2(ItemsAddressArray,Value);
end;

procedure TSchemaComponent.ReadAll();
var
  AddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
  I: integer;
begin
GetAddressArray(AddressArray);
Schema.ObjectModel.ObjectController.ObjectOperation_GetComponentDataCommand(AddressArray,Value);
Idx:=0;
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then TComponentItem(Items[I]).FromByteArray(Value, Idx);
if (OwnComponents <> nil)
 then
  for I:=0 to OwnComponents.Count-1 do TSchemaComponent(OwnComponents[I]).FromByteArray(Value, Idx);
end;

procedure TSchemaComponent.ReadAllCUAC();
var
  AddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
  I: integer;
begin
GetAddressArray(AddressArray);
Schema.ObjectModel.ObjectController.ObjectOperation_GetComponentDataCommand2(AddressArray,Value);
Idx:=0;
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then TComponentItem(Items[I]).FromByteArray(Value, Idx);
if (OwnComponents <> nil)
 then
  for I:=0 to OwnComponents.Count-1 do TSchemaComponent(OwnComponents[I]).FromByteArray(Value, Idx);
end;

procedure TSchemaComponent.LoadAll();
begin
if (Schema.ObjectModel.flComponentUserAccessControl)
 then ReadAllCUAC()
 else ReadAll();
end;

procedure TSchemaComponent.WriteAll();
var
  I: integer;
  MS: TMemoryStream;
  ItemValue,ComponentValue,Value: TByteArray;
  AddressArray: TByteArray;
begin
if (Items = nil) then Exit; //. ->
MS:=TMemoryStream.Create;
try
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then begin
      ItemValue:=TComponentItem(Items[I]).ToByteArray();
      MS.Write(Pointer(@ItemValue[0])^,Length(ItemValue));
      end;
if (OwnComponents <> nil)
 then
  for I:=0 to OwnComponents.Count-1 do begin
    ComponentValue:=TSchemaComponent(OwnComponents[I]).ToByteArray();
    MS.Write(Pointer(@ComponentValue[0])^,Length(ComponentValue));
    end;
SetLength(Value,MS.Size);
MS.Position:=0;
MS.Read(Pointer(Value[0])^,Length(Value));
finally
MS.Destroy;
end;
GetAddressArray(AddressArray);
Schema.ObjectModel.ObjectController.ObjectOperation_SetComponentDataCommand(AddressArray,Value);
end;

procedure TSchemaComponent.WriteAllCUAC();
var
  I: integer;
  MS: TMemoryStream;
  ItemValue,ComponentValue,Value: TByteArray;
  AddressArray: TByteArray;
begin
if (Items = nil) then Exit; //. ->
MS:=TMemoryStream.Create;
try
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then begin
      ItemValue:=TComponentItem(Items[I]).ToByteArray();
      MS.Write(Pointer(@ItemValue[0])^,Length(ItemValue));
      end;
if (OwnComponents <> nil)
 then
  for I:=0 to OwnComponents.Count-1 do begin
    ComponentValue:=TSchemaComponent(OwnComponents[I]).ToByteArray();
    MS.Write(Pointer(@ComponentValue[0])^,Length(ComponentValue));
    end;
SetLength(Value,MS.Size);
MS.Position:=0;
MS.Read(Pointer(Value[0])^,Length(Value));
finally
MS.Destroy;
end;
GetAddressArray(AddressArray);
Schema.ObjectModel.ObjectController.ObjectOperation_SetComponentDataCommand2(AddressArray,Value);
end;

procedure TSchemaComponent.ReadAllDevice;
var
  AddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
  I: integer;
begin
GetAddressArray(AddressArray);
Schema.ObjectModel.ObjectController.DeviceOperation_GetComponentDataCommand(AddressArray,Value);
Idx:=0;
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then TComponentItem(Items[I]).FromByteArray(Value, Idx);
if (OwnComponents <> nil)
 then
  for I:=0 to OwnComponents.Count-1 do TSchemaComponent(OwnComponents[I]).FromByteArray(Value, Idx);
end;

procedure TSchemaComponent.ReadAllDeviceCUAC;
var
  AddressArray: TByteArray;
  Value: TByteArray;
  Idx: integer;
  I: integer;
begin
GetAddressArray(AddressArray);
Schema.ObjectModel.ObjectController.DeviceOperation_GetComponentDataCommand2(AddressArray,Value);
Idx:=0;
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then TComponentItem(Items[I]).FromByteArray(Value, Idx);
if (OwnComponents <> nil)
 then
  for I:=0 to OwnComponents.Count-1 do TSchemaComponent(OwnComponents[I]).FromByteArray(Value, Idx);
end;

procedure TSchemaComponent.WriteAllDevice();
var
  I: integer;
  MS: TMemoryStream;
  ItemValue,ComponentValue,Value: TByteArray;
  AddressArray: TByteArray;
begin
if (Items = nil) then Exit; //. ->
MS:=TMemoryStream.Create;
try
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then begin
      ItemValue:=TComponentItem(Items[I]).ToByteArray();
      MS.Write(Pointer(@ItemValue[0])^,Length(ItemValue));
      end;
if (OwnComponents <> nil)
 then
  for I:=0 to OwnComponents.Count-1 do begin
    ComponentValue:=TSchemaComponent(OwnComponents[I]).ToByteArray();
    MS.Write(Pointer(@ComponentValue[0])^,Length(ComponentValue));
    end;
SetLength(Value,MS.Size);
MS.Position:=0;
MS.Read(Pointer(Value[0])^,Length(Value));
finally
MS.Destroy;
end;
GetAddressArray(AddressArray);
Schema.ObjectModel.ObjectController.DeviceOperation_SetComponentDataCommand(AddressArray,Value);
end;

procedure TSchemaComponent.WriteAllDeviceCUAC();
var
  I: integer;
  MS: TMemoryStream;
  ItemValue,ComponentValue,Value: TByteArray;
  AddressArray: TByteArray;
begin
if (Items = nil) then Exit; //. ->
MS:=TMemoryStream.Create;
try
if (Items <> nil)
 then
  for I:=0 to Items.Count-1 do
    if (NOT TComponentItem(Items[I]).flVirtualValue)
     then begin
      ItemValue:=TComponentItem(Items[I]).ToByteArray();
      MS.Write(Pointer(@ItemValue[0])^,Length(ItemValue));
      end;
if (OwnComponents <> nil)
 then
  for I:=0 to OwnComponents.Count-1 do begin
    ComponentValue:=TSchemaComponent(OwnComponents[I]).ToByteArray();
    MS.Write(Pointer(@ComponentValue[0])^,Length(ComponentValue));
    end;
SetLength(Value,MS.Size);
MS.Position:=0;
MS.Read(Pointer(Value[0])^,Length(Value));
finally
MS.Destroy;
end;
GetAddressArray(AddressArray);
Schema.ObjectModel.ObjectController.DeviceOperation_SetComponentDataCommand2(AddressArray,Value);
end;


{TComponentSchema}
Constructor TComponentSchema.Create(const pObjectModel: TObjectModel);
begin
Inherited Create;
ObjectModel:=pObjectModel;
Name:='Abstract';
RootComponent:=nil;
end;

Destructor TComponentSchema.Destroy;
begin
RootComponent.Free;
Inherited;
end;


{TObjectModelControlPanel}
Constructor TObjectModelControlPanel.Create(const pModel: TObjectModel);
begin
Inherited Create(nil);
_Model:=pModel;
{$IFNDEF Plugin}
with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,pModel.ObjectController.idGeoGraphServerObject)) do
try
Updater:=TPresentUpdater_Create(PostUpdate,nil);
finally
Release;
end;
{$ELSE}
Updater:=TComponentPresentUpdater_Create(idTGeoGraphServerObject,pModel.ObjectController.idGeoGraphServerObject, PostUpdate,nil)
{$ENDIF}
end;

Destructor TObjectModelControlPanel.Destroy;
begin
Updater.Free;
Inherited;
end;                                                      

procedure TObjectModelControlPanel.PostUpdate;
var
  WM: TMessage;
begin
if (_Model.flComponentUserAccessControl)
 then begin
  //. prepare object schema side (using CUAC)
  _Model.ObjectSchema.RootComponent.ReadAllCUAC();
  //. prepare object device schema side (using CUAC)
  _Model.ObjectDeviceSchema.RootComponent.ReadAllCUAC();
  end
 else begin
  //. prepare object schema side
  _Model.ObjectSchema.RootComponent.ReadAll();
  //. prepare object device schema side
  _Model.ObjectDeviceSchema.RootComponent.ReadAll();
  end;
//.
if (GetCurrentThreadID = MainThreadID) then wmUPDATECONTROLPANEL(WM) else PostMessage(Handle, WM_UPDATECONTROLPANEL,0,0);
end;

procedure TObjectModelControlPanel.Update;
begin
Inherited Update();
end;

procedure TObjectModelControlPanel.wmUPDATECONTROLPANEL(var Message: TMessage);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
try
Update();
except
  {$IFNDEF Plugin}
  On E: Exception do EventLog.WriteMajorEvent('ObjectModelControlPanel','Unable to update a control panel.',E.Message);
  {$ELSE}
  On E: Exception do ProxySpace__EventLog_WriteMinorEvent('ObjectModelControlPanel','Unable to update a control panel.',E.Message);
  {$ENDIF}
  end;                             
//.
finally                                                             
Screen.Cursor:=SC;
end;                                      
end;                                                             
                                        

{TObjectModel}              
class function TObjectModel.GetModelClass(const pModelID: integer): TObjectModelClass;
begin
case pModelID of
GeoMonitoredObjectModelID:      Result:=TGeoMonitoredObjectModel;
GeoMonitoredObject1ModelID:     Result:=TGeoMonitoredObject1Model;
EnforaObjectModelID:            Result:=TEnforaObjectModel;
EnforaMT3000ObjectModelID:      Result:=TEnforaMT3000ObjectModel;
EnforaMiniMTObjectModelID:      Result:=TEnforaMiniMTObjectModel;
NavixyObjectModelID:            Result:=TNavixyObjectModel;
GeoMonitoredMedDeviceModelID:   Result:=TGeoMonitoredMedDeviceModel;
GSTraqObjectModelID:            Result:=TGSTraqObjectModel;
else
  Result:=nil;
end;
end;

class function TObjectModel.GetModel(const pModelID: integer; const pObjectController: TGEOGraphServerObjectController; const flFreeController: boolean = false): TObjectModel;
var
  ModelClass: TObjectModelClass;
begin
ModelClass:=GetModelClass(pModelID);
if (ModelClass = nil)
 then begin
  Result:=nil;
  if (flFreeController) then pObjectController.Free();
  end
 else Result:=ModelClass.Create(pObjectController,flFreeController); 
end;

Constructor TObjectModel.Create(const pObjectController: TGEOGraphServerObjectController; const flFreeController: boolean);
begin
Inherited Create;
Lock:=TCriticalSection.Create;
ObjectController:=pObjectController;
flFreeObjectController:=flFreeController;
ObjectSchema:=nil;
ObjectDeviceSchema:=nil;
flComponentUserAccessControl:=false;                                         
ControlPanel:=nil;
end;

Destructor TObjectModel.Destroy;
begin                                               
ControlPanel.Free;
ObjectDeviceSchema.Free;
ObjectSchema.Free;
if (flFreeObjectController) then ObjectController.Free;
Lock.Free;
Inherited;
end;

function TObjectModel.GetControlPanel(): TObjectModelControlPanel;
begin
Result:=nil;
end;

function TObjectModel.Object_GetInfo(const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean;
begin
Info:=nil;
Result:=false;
end;

function TObjectModel.Object_GetHintInfo(const InfoType: integer; const InfoFormat: integer; out Info: TByteArray): boolean; 
begin
Info:=nil;
Result:=false;
end;

function TObjectModel.CreateTrackEvent(const ComponentElement: TComponentElement; const Address: TAddress; const AddressIndex: integer; const flSetCommand: boolean): pointer;
begin
Result:=ComponentElement.ToTrackEvent();
if (Result <> nil)
 then begin
  if (flSetCommand)
   then TObjectTrackEvent(Result^).EventMessage:='SET '+TObjectTrackEvent(Result^).EventMessage
   else TObjectTrackEvent(Result^).EventMessage:='GET '+TObjectTrackEvent(Result^).EventMessage;
  end;
end;

function TObjectModel.ObjectVisualization: TObjectDescriptor;
begin
Result.idTObj:=0;
Result.idObj:=0;
end;

function TObjectModel.ObjectGeoSpaceID: integer;
begin
Result:=0;
end;

function TObjectModel.ObjectDatumID: integer;
begin
Result:=0;
end;

procedure TObjectModel.Object_GetLocationFix(out TimeStamp: double; out DatumID: integer; out Latitude: double; out Longitude: double; out Altitude: double; out Speed: double; out Bearing: double; out Precision: double);
begin
TimeStamp:=EmptyTime; 
DatumID:=0;
Latitude:=0.0;
Longitude:=0.0;
Altitude:=0.0;
Speed:=0.0;
Bearing:=0.0;
Precision:=0.0;
end;

function TObjectModel.Log_CreateTrackByDay(const DayDate: TDateTime; const pTrackName: string; const pTrackColor: TColor; const TrackCoComponentID: integer; const CreateObjectModelTrackEventFunc: TCreateObjectModelTrackEventFunc; const CreateBusinessModelTrackEventFunc: TCreateBusinessModelTrackEventFunc): pointer;
const
  Portion = 4096;                                    
var                                                    
  DayLogDataStream: TMemoryStream;
  RS: TMemoryStream;
  DS: TZDecompressionStream;
  Sz: Longint;                                                  
  Buffer: array[0..Portion-1] of byte;
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ptrptrLastTrackNode: pointer;
  ptrptrLastTrackObjectModelEvent: pointer;
  ptrptrLastTrackBusinessModelEvent: pointer;
  OperationsLogNode: IXMLDOMNode;
  ObjectVisualizationDescriptor: TObjectDescriptor;
  I: integer;
  OperationsLogItemNode: IXMLDOMNode;
  OperationsLogItem: string;
  flSetCommand: boolean;
  ElementAddress: TAddress;
  AddressIndex: integer;                                     
  ObjectModelElement: TComponentElement;                 
  LastTrackNodeTimeStamp,TimeStamp: TDateTime;
  ptrTrackNode: pointer;                             
  ptrTrackEvent: pointer;
begin
//. update Object Model
if (flComponentUserAccessControl)
 then begin
  ObjectSchema.RootComponent.ReadAllCUAC();
  ObjectDeviceSchema.RootComponent.ReadAllCUAC();
  end
 else begin
  ObjectSchema.RootComponent.ReadAll();
  ObjectDeviceSchema.RootComponent.ReadAll();
  end;
//.
ObjectController.ObjectOperation_GetDayLogData(DayDate, 1{ZLIB zipped XML format}, DayLogDataStream);
try
//. decompressing
RS:=TMemoryStream.Create;
try
DayLogDataStream.Position:=0;
DS:=TZDecompressionStream.Create(DayLogDataStream);
with DS do
try
RS.Size:=(DayLogDataStream.Size SHL 2);
repeat
  Sz:=DS.Read(Buffer,Portion);
  if (Sz > 0) then RS.Write(Buffer,Sz) else break; //. >
until false;
finally
Destroy;
end;
DayLogDataStream.Size:=RS.Position;
RS.Position:=0;
DayLogDataStream.Position:=0;
DayLogDataStream.CopyFrom(RS,DayLogDataStream.Size);
DayLogDataStream.Position:=0;
finally
RS.Destroy;
end;
//.
OLEStream:=TStreamAdapter.Create(DayLogDataStream);
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
Doc.Load(OLEStream);
VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
if VersionNode <> nil
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version <> 0) then Exit; //. ->
OperationsLogNode:=Doc.documentElement.selectSingleNode('/ROOT/OperationsLog');
//.
ObjectVisualizationDescriptor:=ObjectVisualization();
//.
GetMem(Result,SizeOf(TGeoObjectTrack));
try
FillChar(Result^, SizeOf(TGeoObjectTrack), #0);
with TGeoObjectTrack(Result^) do begin
Next:=nil;
TrackName:=pTrackName;
//.
idTOwner:=ObjectVisualizationDescriptor.idTObj;
idOwner:=ObjectVisualizationDescriptor.idObj;
//.
flEnabled:=true;
//.
DatumID:=ObjectDatumID;
//.
Nodes:=nil;
ptrptrLastTrackNode:=@Nodes;
//.
ObjectModelEvents:=nil;
ptrptrLastTrackObjectModelEvent:=@ObjectModelEvents;
//.
BusinessModelEvents:=nil;
ptrptrLastTrackBusinessModelEvent:=@BusinessModelEvents;
//.
Color:=pTrackColor;
CoComponentID:=TrackCoComponentID;
end;
DecimalSeparator:='.'; //. workaround
LastTrackNodeTimeStamp:=0.0;
for I:=0 to OperationsLogNode.childNodes.length-1 do begin
  OperationsLogItemNode:=OperationsLogNode.childNodes[I];
  OperationsLogItem:=OperationsLogItemNode.nodeName;
  if ((OperationsLogItem = 'SET') OR (OperationsLogItem = 'GET'))
   then begin
    flSetCommand:=(OperationsLogItem = 'SET');
    ElementAddress:=TSchemaComponent.GetAddressFromString(OperationsLogItemNode.selectSingleNode('Component').nodeTypedValue);
    AddressIndex:=0;
    if (ElementAddress[0] = 1)
     then ObjectModelElement:=ObjectSchema.RootComponent.GetComponentElement(ElementAddress, AddressIndex)
     else
      if (ElementAddress[0] = 2)
       then ObjectModelElement:=ObjectDeviceSchema.RootComponent.GetComponentElement(ElementAddress, AddressIndex)
       else ObjectModelElement:=nil;
    if (ObjectModelElement <> nil)
     then begin
      try
      TimeStamp:=OperationsLogItemNode.selectSingleNode('Time').nodeTypedValue;
      except
        TimeStamp:=EmptyTime;
        end;
      //.
      ptrTrackNode:=nil;
      try
      ObjectModelElement.FromXMLNodeByAddress(ElementAddress,AddressIndex, OperationsLogItemNode);
      ptrTrackNode:=ObjectModelElement.ToTrackNode();
      except
        {$IFNDEF Plugin}
        on E: Exception do EventLog.WriteMinorEvent('TObjectModel.Log_CreateTrackByDay','could not process log node',E.Message);
        {$ELSE}
        on E: Exception do ProxySpace__EventLog_WriteMinorEvent('TObjectModel.Log_CreateTrackByDay','could not process log node',E.Message);
        {$ENDIF}
        end;
      //. add new track node
      if (ptrTrackNode <> nil)
       then begin
        //. insert new node to the list if it is newest node
        if (TObjectTrackNode(ptrTrackNode^).TimeStamp >= LastTrackNodeTimeStamp)
         then begin
          Pointer(ptrptrLastTrackNode^):=ptrTrackNode;
          ptrptrLastTrackNode:=@TObjectTrackNode(ptrTrackNode^).Next;
          //.
          LastTrackNodeTimeStamp:=TObjectTrackNode(ptrTrackNode^).TimeStamp;
          end
         else FreeMem(ptrTrackNode,SizeOf(TObjectTrackNode));
        end;
      if (Assigned(CreateObjectModelTrackEventFunc))
       then begin
        ptrTrackEvent:=CreateObjectModelTrackEventFunc(ObjectModelElement,ElementAddress,AddressIndex,flSetCommand);
        if (ptrTrackEvent <> nil)
         then begin
          if (TObjectTrackEvent(ptrTrackEvent^).TimeStamp = EmptyTime) then TObjectTrackEvent(ptrTrackEvent^).TimeStamp:=TimeStamp;
          //.
          if (TObjectTrackEvent(ptrTrackEvent^).TimeStamp <= LastTrackNodeTimeStamp)
           then TObjectTrackEvent(ptrTrackEvent^).TimeStamp:=LastTrackNodeTimeStamp;
          //. add new event to the list
          Pointer(ptrptrLastTrackObjectModelEvent^):=ptrTrackEvent;
          ptrptrLastTrackObjectModelEvent:=@TObjectTrackEvent(ptrTrackEvent^).Next;
          end;
        end;
      if (Assigned(CreateBusinessModelTrackEventFunc))
       then begin
        ptrTrackEvent:=CreateBusinessModelTrackEventFunc(ObjectModelElement,ElementAddress,AddressIndex,flSetCommand);
        if (ptrTrackEvent <> nil)
         then begin
          if (TObjectTrackEvent(ptrTrackEvent^).TimeStamp = EmptyTime) then TObjectTrackEvent(ptrTrackEvent^).TimeStamp:=TimeStamp;
          //.
          if (TObjectTrackEvent(ptrTrackEvent^).TimeStamp <= LastTrackNodeTimeStamp)
           then TObjectTrackEvent(ptrTrackEvent^).TimeStamp:=LastTrackNodeTimeStamp;
          //. add new event to the list
          Pointer(ptrptrLastTrackBusinessModelEvent^):=ptrTrackEvent;
          ptrptrLastTrackBusinessModelEvent:=@TObjectTrackEvent(ptrTrackEvent^).Next;
          end;
        end;
      end;
    end;
  end;
except
  Log_DestroyTrack(Result);
  Raise; //. =>
  end;
finally
DayLogDataStream.Destroy;
end;
end;

function TObjectModel.Log_CreateTrackByDays(const DayDate: TDateTime; const DaysCount: integer; const pTrackName: string; const pTrackColor: TColor; const TrackCoComponentID: integer; const CreateObjectModelTrackEventFunc: TCreateObjectModelTrackEventFunc; const CreateBusinessModelTrackEventFunc: TCreateBusinessModelTrackEventFunc): pointer;
const
  Portion = 4096;                                    
var                                                    
  DaysLogDataStream: TMemoryStream;
  DayLogDataStream: TMemoryStream;
  RS: TMemoryStream;
  Day: integer;
  DataSize: integer;
  DS: TZDecompressionStream;
  Sz: Longint;                                                  
  Buffer: array[0..Portion-1] of byte;
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ptrptrLastTrackNode: pointer;
  ptrptrLastTrackObjectModelEvent: pointer;
  ptrptrLastTrackBusinessModelEvent: pointer;
  OperationsLogNode: IXMLDOMNode;
  ObjectVisualizationDescriptor: TObjectDescriptor;
  I: integer;
  OperationsLogItemNode: IXMLDOMNode;
  OperationsLogItem: string;
  flSetCommand: boolean;
  ElementAddress: TAddress;
  AddressIndex: integer;                                     
  ObjectModelElement: TComponentElement;                 
  LastTrackNodeTimeStamp,TimeStamp: TDateTime;
  ptrTrackNode: pointer;                             
  ptrTrackEvent: pointer;
begin
//. update Object Model
if (flComponentUserAccessControl)
 then begin
  ObjectSchema.RootComponent.ReadAllCUAC();
  ObjectDeviceSchema.RootComponent.ReadAllCUAC();
  end
 else begin
  ObjectSchema.RootComponent.ReadAll();
  ObjectDeviceSchema.RootComponent.ReadAll();
  end;
//.
ObjectController.ObjectOperation_GetDaysLogData(DayDate,DaysCount, 1{ZLIB zipped XML format}, DaysLogDataStream);
try
DayLogDataStream:=TMemoryStream.Create();
try
DaysLogDataStream.Position:=0;
//.
RS:=TMemoryStream.Create();
try
ObjectVisualizationDescriptor:=ObjectVisualization();
//.
GetMem(Result,SizeOf(TGeoObjectTrack));
try
FillChar(Result^, SizeOf(TGeoObjectTrack), #0);
with TGeoObjectTrack(Result^) do begin
Next:=nil;
TrackName:=pTrackName;
//.
idTOwner:=ObjectVisualizationDescriptor.idTObj;
idOwner:=ObjectVisualizationDescriptor.idObj;
//.
flEnabled:=true;
//.
DatumID:=ObjectDatumID;
//.
Nodes:=nil;
ptrptrLastTrackNode:=@Nodes;
//.
ObjectModelEvents:=nil;
ptrptrLastTrackObjectModelEvent:=@ObjectModelEvents;
//.
BusinessModelEvents:=nil;
ptrptrLastTrackBusinessModelEvent:=@BusinessModelEvents;
//.
Color:=pTrackColor;
CoComponentID:=TrackCoComponentID;
end;
DecimalSeparator:='.'; //. workaround
LastTrackNodeTimeStamp:=0.0;
for Day:=0 to DaysCount-1 do begin
  DaysLogDataStream.Read(DataSize,SizeOf(DataSize));
  if (DataSize <= 0) then Continue; //. ^
  DayLogDataStream.Size:=DataSize;
  DaysLogDataStream.Read(DayLogDataStream.Memory^,DataSize);
  //.
  DayLogDataStream.Position:=0;
  DS:=TZDecompressionStream.Create(DayLogDataStream);
  with DS do
  try
  RS.Size:=(DayLogDataStream.Size SHL 2);
  RS.Position:=0;
  repeat
    Sz:=DS.Read(Buffer,Portion);
    if (Sz > 0) then RS.Write(Buffer,Sz) else break; //. >
  until false;
  finally
  Destroy;
  end;
  DayLogDataStream.Size:=RS.Position;
  RS.Position:=0;
  DayLogDataStream.Position:=0;
  DayLogDataStream.CopyFrom(RS,DayLogDataStream.Size);
  DayLogDataStream.Position:=0;
  //.
  OLEStream:=TStreamAdapter.Create(DayLogDataStream);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(OLEStream);
  VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Exit; //. ->
  OperationsLogNode:=Doc.documentElement.selectSingleNode('/ROOT/OperationsLog');
  for I:=0 to OperationsLogNode.childNodes.length-1 do begin
    OperationsLogItemNode:=OperationsLogNode.childNodes[I];
    OperationsLogItem:=OperationsLogItemNode.nodeName;
    if ((OperationsLogItem = 'SET') OR (OperationsLogItem = 'GET'))
     then begin
      flSetCommand:=(OperationsLogItem = 'SET');
      ElementAddress:=TSchemaComponent.GetAddressFromString(OperationsLogItemNode.selectSingleNode('Component').nodeTypedValue);
      AddressIndex:=0;
      if (ElementAddress[0] = 1)
       then ObjectModelElement:=ObjectSchema.RootComponent.GetComponentElement(ElementAddress, AddressIndex)
       else
        if (ElementAddress[0] = 2)
         then ObjectModelElement:=ObjectDeviceSchema.RootComponent.GetComponentElement(ElementAddress, AddressIndex)
         else ObjectModelElement:=nil;
      if (ObjectModelElement <> nil)
       then begin
        try
        TimeStamp:=OperationsLogItemNode.selectSingleNode('Time').nodeTypedValue;
        except
          TimeStamp:=EmptyTime;
          end;
        //.
        ptrTrackNode:=nil;
        try
        ObjectModelElement.FromXMLNodeByAddress(ElementAddress,AddressIndex, OperationsLogItemNode);
        ptrTrackNode:=ObjectModelElement.ToTrackNode();
        except
          {$IFNDEF Plugin}
          on E: Exception do EventLog.WriteMinorEvent('TObjectModel.Log_CreateTrackByDay','could not process log node',E.Message);
          {$ELSE}
          on E: Exception do ProxySpace__EventLog_WriteMinorEvent('TObjectModel.Log_CreateTrackByDay','could not process log node',E.Message);
          {$ENDIF}
          end;
        //. add new track node
        if (ptrTrackNode <> nil)
         then begin
          //. insert new node to the list if it is newest node
          if (TObjectTrackNode(ptrTrackNode^).TimeStamp >= LastTrackNodeTimeStamp)
           then begin
            Pointer(ptrptrLastTrackNode^):=ptrTrackNode;
            ptrptrLastTrackNode:=@TObjectTrackNode(ptrTrackNode^).Next;
            //.
            LastTrackNodeTimeStamp:=TObjectTrackNode(ptrTrackNode^).TimeStamp;
            end
           else FreeMem(ptrTrackNode,SizeOf(TObjectTrackNode));
          end;
        if (Assigned(CreateObjectModelTrackEventFunc))
         then begin
          ptrTrackEvent:=CreateObjectModelTrackEventFunc(ObjectModelElement,ElementAddress,AddressIndex,flSetCommand);
          if (ptrTrackEvent <> nil)
           then begin
            if (TObjectTrackEvent(ptrTrackEvent^).TimeStamp = EmptyTime) then TObjectTrackEvent(ptrTrackEvent^).TimeStamp:=TimeStamp;
            //.
            if (TObjectTrackEvent(ptrTrackEvent^).TimeStamp <= LastTrackNodeTimeStamp)
             then TObjectTrackEvent(ptrTrackEvent^).TimeStamp:=LastTrackNodeTimeStamp;
            //. add new event to the list
            Pointer(ptrptrLastTrackObjectModelEvent^):=ptrTrackEvent;
            ptrptrLastTrackObjectModelEvent:=@TObjectTrackEvent(ptrTrackEvent^).Next;
            end;
          end;
        if (Assigned(CreateBusinessModelTrackEventFunc))
         then begin
          ptrTrackEvent:=CreateBusinessModelTrackEventFunc(ObjectModelElement,ElementAddress,AddressIndex,flSetCommand);
          if (ptrTrackEvent <> nil)
           then begin
            if (TObjectTrackEvent(ptrTrackEvent^).TimeStamp = EmptyTime) then TObjectTrackEvent(ptrTrackEvent^).TimeStamp:=TimeStamp;
            //.
            if (TObjectTrackEvent(ptrTrackEvent^).TimeStamp <= LastTrackNodeTimeStamp)
             then TObjectTrackEvent(ptrTrackEvent^).TimeStamp:=LastTrackNodeTimeStamp;
            //. add new event to the list
            Pointer(ptrptrLastTrackBusinessModelEvent^):=ptrTrackEvent;
            ptrptrLastTrackBusinessModelEvent:=@TObjectTrackEvent(ptrTrackEvent^).Next;
            end;
          end;
        end;
      end;
    end;
  end;
except
  Log_DestroyTrack(Result);
  Raise; //. =>
  end;
finally
RS.Destroy();
end;
finally
DayLogDataStream.Destroy();
end;
finally
DaysLogDataStream.Destroy();
end;
end;

class procedure TObjectModel.Log_DestroyTrack(var ptrDestroyTrack: pointer);
var
  ptrDestroyTrackItem: pointer;
begin
with TGeoObjectTrack(ptrDestroyTrack^) do begin
while (Nodes <> nil) do begin
  ptrDestroyTrackItem:=Nodes;
  Nodes:=TObjectTrackNode(ptrDestroyTrackItem^).Next;
  FreeMem(ptrDestroyTrackItem,SizeOf(TObjectTrackNode));
  end;
while (ObjectModelEvents <> nil) do begin
  ptrDestroyTrackItem:=ObjectModelEvents;
  ObjectModelEvents:=TObjectTrackEvent(ptrDestroyTrackItem^).Next;
  //.
  SetLength(TObjectTrackEvent(ptrDestroyTrackItem^).EventExtra,0);
  SetLength(TObjectTrackEvent(ptrDestroyTrackItem^).EventMessage,0);
  SetLength(TObjectTrackEvent(ptrDestroyTrackItem^).EventInfo,0);
  FreeMem(ptrDestroyTrackItem,SizeOf(TObjectTrackEvent));
  end;
while (BusinessModelEvents <> nil) do begin
  ptrDestroyTrackItem:=BusinessModelEvents;
  BusinessModelEvents:=TObjectTrackEvent(ptrDestroyTrackItem^).Next;
  //.
  SetLength(TObjectTrackEvent(ptrDestroyTrackItem^).EventExtra,0);
  SetLength(TObjectTrackEvent(ptrDestroyTrackItem^).EventMessage,0);
  SetLength(TObjectTrackEvent(ptrDestroyTrackItem^).EventInfo,0);
  FreeMem(ptrDestroyTrackItem,SizeOf(TObjectTrackEvent));
  end;
end;
//.
FreeAndNil(TGeoObjectTrack(ptrDestroyTrack^).StopsAndMovementsAnalysis);
FreeAndNil(TGeoObjectTrack(ptrDestroyTrack^).Reflection_PropsPanel);
FreeMem(ptrDestroyTrack,SizeOf(TGeoObjectTrack));
ptrDestroyTrack:=nil;
end;

class procedure TObjectModel.Log_Track_ClearNodes(var ptrTrack: pointer);
var
  ptrDestroyTrackItem: pointer;
begin
with TGeoObjectTrack(ptrTrack^) do begin
while (Nodes <> nil) do begin
  ptrDestroyTrackItem:=Nodes;
  Nodes:=TObjectTrackNode(ptrDestroyTrackItem^).Next;
  FreeMem(ptrDestroyTrackItem,SizeOf(TObjectTrackNode));
  end;
end;
end;




///// COMPONENT VALUE TYPES /////

{TComponentByteValue}
procedure TComponentByteValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=Byte(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentByteValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
Byte(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentByteValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=ValueNode.nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentByteValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TComponentByteValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Value: '+IntToStr(Value);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentTimestampedByteValue}
procedure TComponentTimestampedByteValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TComponentTimestampedByteData(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentTimestampedByteValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TComponentTimestampedByteData(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentTimestampedByteValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
  S: string;
  SL: TStringList;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
S:=ValueNode.nodeTypedValue;
if (SplitString(S,';',{out} SL))
 then
  try
  if (SL.Count = 2)
   then begin
    Value.Timestamp:=StrToFloat(SL[0]);
    Value.Value:=StrToInt(SL[1]);
    end;
  finally
  SL.Destroy();
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentTimestampedByteValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TComponentTimestampedByteValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', Value: '+IntToStr(Value.Value);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentBooleanValue}
procedure TComponentBooleanValue.setBoolValue(_Value: boolean);
begin
Owner.Schema.ObjectModel.Lock.Enter;
try
if (_Value)
 then Value:=1
 else Value:=0;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentBooleanValue.getBoolValue(): boolean;
begin
Owner.Schema.ObjectModel.Lock.Enter;
try
Result:=(Value <> 0);
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentTimestampedBooleanValue}
procedure TComponentTimestampedBooleanValue.setBoolValue(_Value: TComponentTimestampedBooleanData);
var
  V: TComponentTimestampedByteData;
begin
V.Timestamp:=_Value.Timestamp;
if (_Value.Value)
 then V.Value:=1
 else V.Value:=0;
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=V;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentTimestampedBooleanValue.getBoolValue(): TComponentTimestampedBooleanData;
begin
Owner.Schema.ObjectModel.Lock.Enter;
try
Result.Timestamp:=Value.Timestamp;
Result.Value:=(Value.Value <> 0);
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentUInt16Value}
procedure TComponentUInt16Value.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
LastValue:=Value;
Value:=Word(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentUInt16Value.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
Word(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentUInt16Value.ToByteArrayByAddress(const Address: TAddress; const AddressIndex: integer): TByteArray;
var
  BitIdx: integer;
  M: word;
  V: byte;
begin
if (AddressIndex >= Length(Address)) then Raise EAddressIsNotFound.Create(''); //. =>
BitIdx:=Address[AddressIndex];
M:=(1 SHL BitIdx);
Owner.Schema.ObjectModel.Lock.Enter;
try
if ((Value AND M) = M)
 then V:=1
 else V:=0;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
SetLength(Result,SizeOf(V));
Byte(Pointer(@Result[0])^):=V;
end;

procedure TComponentUInt16Value.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
LastValue:=Value;
Value:=ValueNode.nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentUInt16Value.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

procedure TComponentUInt16Value.ReadByAddress(const Address: TAddress);
begin
end;

procedure TComponentUInt16Value.ReadByAddressCUAC(const Address: TAddress);
begin
end;

procedure TComponentUInt16Value.ReadDeviceByAddress(const Address: TAddress);
begin
end;

procedure TComponentUInt16Value.ReadDeviceByAddressCUAC(const Address: TAddress);
begin
end;

procedure TComponentUInt16Value.WriteByAddress(const Address: TAddress);
var
  Value: TByteArray;
  A,R: TAddress;
  I,RI: integer;
  AddressArray: TByteArray;
begin                                                    
Value:=ToByteArrayByAddress(Address,0);
GetAddress({out} A);
SetLength(R,Length(A)+Length(Address));
RI:=0;
for I:=0 to Length(A)-1 do begin
  R[RI]:=A[I];
  Inc(RI);
  end;
for I:=0 to Length(Address)-1 do begin
  R[RI]:=Address[I];
  Inc(RI);
  end;
PrepareAddressArray(R,{out} AddressArray);
Owner.Schema.ObjectModel.ObjectController.ObjectOperation_SetComponentDataCommand(AddressArray,Value);
end;

procedure TComponentUInt16Value.WriteByAddressCUAC(const Address: TAddress);
var
  Value: TByteArray;
  A,R: TAddress;
  I,RI: integer;
  AddressArray: TByteArray;
begin                                                    
Value:=ToByteArrayByAddress(Address,0);
GetAddress({out} A);
SetLength(R,Length(A)+Length(Address));
RI:=0;
for I:=0 to Length(A)-1 do begin
  R[RI]:=A[I];
  Inc(RI);
  end;
for I:=0 to Length(Address)-1 do begin
  R[RI]:=Address[I];
  Inc(RI);
  end;
PrepareAddressArray(R,{out} AddressArray);
Owner.Schema.ObjectModel.ObjectController.ObjectOperation_SetComponentDataCommand2(AddressArray,Value);
end;

procedure TComponentUInt16Value.WriteDeviceByAddress(const Address: TAddress);
var
  Value: TByteArray;
  A,R: TAddress;
  I,RI: integer;
  AddressArray: TByteArray;
begin
Value:=ToByteArrayByAddress(Address,0);
GetAddress({out} A);
SetLength(R,Length(A)+Length(Address));
RI:=0;
for I:=0 to Length(A)-1 do begin
  R[RI]:=A[I];
  Inc(RI);
  end;
for I:=0 to Length(Address)-1 do begin
  R[RI]:=Address[I];
  Inc(RI);
  end;
PrepareAddressArray(R,{out} AddressArray);
Owner.Schema.ObjectModel.ObjectController.DeviceOperation_SetComponentDataCommand(AddressArray,Value);
end;

procedure TComponentUInt16Value.WriteDeviceByAddressCUAC(const Address: TAddress);
var
  Value: TByteArray;
  A,R: TAddress;
  I,RI: integer;
  AddressArray: TByteArray;
begin
Value:=ToByteArrayByAddress(Address,0);
GetAddress({out} A);
SetLength(R,Length(A)+Length(Address));
RI:=0;
for I:=0 to Length(A)-1 do begin
  R[RI]:=A[I];
  Inc(RI);
  end;
for I:=0 to Length(Address)-1 do begin
  R[RI]:=Address[I];
  Inc(RI);
  end;
PrepareAddressArray(R,{out} AddressArray);
Owner.Schema.ObjectModel.ObjectController.DeviceOperation_SetComponentDataCommand2(AddressArray,Value);
end;

function TComponentUInt16Value.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Value: '+IntToStr(Value);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;                                                             


{TComponentTimestampedUInt16Value}
procedure TComponentTimestampedUInt16Value.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
LastValue:=Value;
Value:=TComponentTimestampedUInt16Data(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentTimestampedUInt16Value.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TComponentTimestampedUInt16Data(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentTimestampedUInt16Value.ToByteArrayByAddress(const Address: TAddress; const AddressIndex: integer): TByteArray;
var
  BitIdx: integer;
  M: word;
  T: Double;
  V: byte;
begin
if (AddressIndex >= Length(Address)) then Raise EAddressIsNotFound.Create(''); //. =>
BitIdx:=Address[AddressIndex];
M:=(1 SHL BitIdx);
Owner.Schema.ObjectModel.Lock.Enter;
try
T:=Value.Timestamp;
if ((Value.Value AND M) = M)
 then V:=1
 else V:=0;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
SetLength(Result,SizeOf(Double)+SizeOf(V));
Double(Pointer(@Result[0])^):=T;
Byte(Pointer(@Result[8])^):=V;
end;

procedure TComponentTimestampedUInt16Value.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
  S: string;
  SL: TStringList;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
LastValue:=Value;
S:=ValueNode.nodeTypedValue;
if (SplitString(S,';',{out} SL))
 then
  try
  if (SL.Count = 2)
   then begin
    Value.Timestamp:=StrToFloat(SL[0]);
    Value.Value:=StrToInt(SL[1]);
    end;
  finally
  SL.Destroy();
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentTimestampedUInt16Value.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

procedure TComponentTimestampedUInt16Value.ReadByAddress(const Address: TAddress);
begin
end;

procedure TComponentTimestampedUInt16Value.ReadByAddressCUAC(const Address: TAddress);
begin
end;

procedure TComponentTimestampedUInt16Value.ReadDeviceByAddress(const Address: TAddress);
begin
end;

procedure TComponentTimestampedUInt16Value.ReadDeviceByAddressCUAC(const Address: TAddress);
begin
end;

procedure TComponentTimestampedUInt16Value.WriteByAddress(const Address: TAddress);
var
  Value: TByteArray;
  A,R: TAddress;
  I,RI: integer;
  AddressArray: TByteArray;
begin                                                    
Value:=ToByteArrayByAddress(Address,0);
GetAddress({out} A);
SetLength(R,Length(A)+Length(Address));
RI:=0;
for I:=0 to Length(A)-1 do begin
  R[RI]:=A[I];
  Inc(RI);
  end;
for I:=0 to Length(Address)-1 do begin
  R[RI]:=Address[I];
  Inc(RI);
  end;
PrepareAddressArray(R,{out} AddressArray);
Owner.Schema.ObjectModel.ObjectController.ObjectOperation_SetComponentDataCommand(AddressArray,Value);
end;

procedure TComponentTimestampedUInt16Value.WriteByAddressCUAC(const Address: TAddress);
var
  Value: TByteArray;
  A,R: TAddress;
  I,RI: integer;
  AddressArray: TByteArray;
begin                                                    
Value:=ToByteArrayByAddress(Address,0);
GetAddress({out} A);
SetLength(R,Length(A)+Length(Address));
RI:=0;
for I:=0 to Length(A)-1 do begin
  R[RI]:=A[I];
  Inc(RI);
  end;
for I:=0 to Length(Address)-1 do begin
  R[RI]:=Address[I];
  Inc(RI);
  end;
PrepareAddressArray(R,{out} AddressArray);
Owner.Schema.ObjectModel.ObjectController.ObjectOperation_SetComponentDataCommand2(AddressArray,Value);
end;

procedure TComponentTimestampedUInt16Value.WriteDeviceByAddress(const Address: TAddress);
var
  Value: TByteArray;
  A,R: TAddress;
  I,RI: integer;
  AddressArray: TByteArray;
begin
Value:=ToByteArrayByAddress(Address,0);
GetAddress({out} A);
SetLength(R,Length(A)+Length(Address));
RI:=0;
for I:=0 to Length(A)-1 do begin
  R[RI]:=A[I];
  Inc(RI);
  end;
for I:=0 to Length(Address)-1 do begin
  R[RI]:=Address[I];
  Inc(RI);
  end;
PrepareAddressArray(R,{out} AddressArray);
Owner.Schema.ObjectModel.ObjectController.DeviceOperation_SetComponentDataCommand(AddressArray,Value);
end;

procedure TComponentTimestampedUInt16Value.WriteDeviceByAddressCUAC(const Address: TAddress);
var
  Value: TByteArray;
  A,R: TAddress;
  I,RI: integer;
  AddressArray: TByteArray;
begin
Value:=ToByteArrayByAddress(Address,0);
GetAddress({out} A);
SetLength(R,Length(A)+Length(Address));
RI:=0;
for I:=0 to Length(A)-1 do begin
  R[RI]:=A[I];
  Inc(RI);
  end;
for I:=0 to Length(Address)-1 do begin
  R[RI]:=Address[I];
  Inc(RI);
  end;
PrepareAddressArray(R,{out} AddressArray);
Owner.Schema.ObjectModel.ObjectController.DeviceOperation_SetComponentDataCommand2(AddressArray,Value);
end;

function TComponentTimestampedUInt16Value.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', Value: '+IntToStr(Value.Value);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;                                                             


{TComponentInt16Value}
procedure TComponentInt16Value.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=SmallInt(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentInt16Value.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
SmallInt(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;                 
end;                                                          
end;                                                              

procedure TComponentInt16Value.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=ValueNode.nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentInt16Value.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TComponentInt16Value.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Value: '+IntToStr(Value);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentTimestampedInt16Value}
procedure TComponentTimestampedInt16Value.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TComponentTimestampedInt16Data(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentTimestampedInt16Value.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TComponentTimestampedInt16Data(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;                 
end;                                                          
end;                                                              

procedure TComponentTimestampedInt16Value.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
  S: string;
  SL: TStringList;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
S:=ValueNode.nodeTypedValue;
if (SplitString(S,';',{out} SL))
 then
  try
  if (SL.Count = 2)
   then begin
    Value.Timestamp:=StrToFloat(SL[0]);
    Value.Value:=StrToInt(SL[1]);
    end;
  finally
  SL.Destroy();
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentTimestampedInt16Value.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TComponentTimestampedInt16Value.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', Value: '+IntToStr(Value.Value);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentUInt32Value}
procedure TComponentUInt32Value.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=DWord(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentUInt32Value.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
DWord(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentUInt32Value.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=ValueNode.nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentUInt32Value.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TComponentUInt32Value.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Value: '+IntToStr(Value);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentTimestampedUInt32Value}
procedure TComponentTimestampedUInt32Value.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TComponentTimestampedUInt32Data(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentTimestampedUInt32Value.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TComponentTimestampedUInt32Data(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentTimestampedUInt32Value.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
  S: string;
  SL: TStringList;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
S:=ValueNode.nodeTypedValue;
if (SplitString(S,';',{out} SL))
 then
  try
  if (SL.Count = 2)
   then begin
    Value.Timestamp:=StrToFloat(SL[0]);
    Value.Value:=StrToInt(SL[1]);
    end;
  finally
  SL.Destroy();
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentTimestampedUInt32Value.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TComponentTimestampedUInt32Value.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', Value: '+IntToStr(Value.Value);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentInt32Value}
procedure TComponentInt32Value.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=Integer(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentInt32Value.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
Integer(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentInt32Value.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=ValueNode.nodeTypedValue;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentInt32Value.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TComponentInt32Value.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Value: '+IntToStr(Value);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentTimestampedInt32Value}
procedure TComponentTimestampedInt32Value.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TComponentTimestampedInt32Data(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentTimestampedInt32Value.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TComponentTimestampedInt32Data(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentTimestampedInt32Value.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
  S: string;
  SL: TStringList;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
S:=ValueNode.nodeTypedValue;
if (SplitString(S,';',{out} SL))
 then
  try
  if (SL.Count = 2)
   then begin
    Value.Timestamp:=StrToFloat(SL[0]);
    Value.Value:=StrToInt(SL[1]);
    end;
  finally
  SL.Destroy();
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentTimestampedInt32Value.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TComponentTimestampedInt32Value.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', Value: '+IntToStr(Value.Value);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentDoubleValue}
procedure TComponentDoubleValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=Double(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;                                                   
end;                                                                     

function TComponentDoubleValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
Double(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentDoubleValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
  S: string;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
S:=ValueNode.nodeTypedValue;
Value:=StrToFloat(S);
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentDoubleValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TComponentDoubleValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Value: '+FormatFloat('0.0',Value);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentTimestampedDoubleValue}
procedure TComponentTimestampedDoubleValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TComponentTimestampedDoubleData(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentTimestampedDoubleValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TComponentTimestampedDoubleData(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentTimestampedDoubleValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
  S: string;
  SL: TStringList;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter;
try
S:=ValueNode.nodeTypedValue;
if (SplitString(S,';',{out} SL))
 then
  try
  if (SL.Count = 2)
   then begin
    Value.Timestamp:=StrToFloat(SL[0]);
    Value.Value:=StrToFloat(SL[1]);
    end;
  finally
  SL.Destroy();
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentTimestampedDoubleValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TComponentTimestampedDoubleValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter;
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', Value: '+FormatFloat('0.0',Value.Value);
end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentObjectDescriptorValue}
procedure TComponentObjectDescriptorValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TObjectDescriptor(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentObjectDescriptorValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TObjectDescriptor(Pointer(@Result[0])^):=Value;
finally                                                 
Owner.Schema.ObjectModel.Lock.Leave;
end;                                     
end;


{TComponentXYCrdValue}
procedure TComponentXYCrdValue.FromByteArray(const BA: TByteArray; var Index: integer);
begin
if ((Index+SizeOf(Value)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value:=TXYCrdData(Pointer(@BA[Index])^); Inc(Index,SizeOf(Value));
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentXYCrdValue.ToByteArray(): TByteArray;
begin
SetLength(Result,SizeOf(Value));
Owner.Schema.ObjectModel.Lock.Enter;
try
TXYCrdData(Pointer(@Result[0])^):=Value;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentANSIStringValue}
procedure TComponentANSIStringValue.FromByteArray(const BA: TByteArray; var Index: integer);
var
  StringCounter: cardinal;
begin
if ((Index+SizeOf(StringCounter)) > Length(BA)) then Exit; //. ->
StringCounter:=Cardinal(Pointer(@BA[Index])^); Inc(Index,SizeOf(StringCounter));
if ((Index+StringCounter) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
SetLength(Value,StringCounter);
if (StringCounter > 0)
 then begin
  Move(Pointer(@BA[Index])^,Pointer(@Value[1])^,StringCounter);
  Inc(Index,StringCounter);
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentANSIStringValue.ToByteArray(): TByteArray;
var
  StringCounter: cardinal;
begin
Owner.Schema.ObjectModel.Lock.Enter;
try
StringCounter:=Length(Value);
SetLength(Result,SizeOf(StringCounter)+StringCounter);
Cardinal(Pointer(@Result[0])^):=StringCounter;
if (StringCounter > 0) then Move(Pointer(@Value[1])^,Pointer(@Result[SizeOf(StringCounter)])^,StringCounter);
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentTimestampedANSIStringValue}
procedure TComponentTimestampedANSIStringValue.FromByteArray(const BA: TByteArray; var Index: integer);
var
  DataSize: cardinal;
  StringCounter: cardinal;
  T: Double;
begin
if ((Index+SizeOf(DataSize)) > Length(BA)) then Exit; //. ->
DataSize:=Cardinal(Pointer(@BA[Index])^); Inc(Index,SizeOf(DataSize));
if ((Index+DataSize) > Length(BA)) then Exit; //. ->
if (DataSize < SizeOf(Double)) then Exit; //. ->
T:=Double(Pointer(@BA[Index])^); Inc(Index,SizeOf(T));
StringCounter:=DataSize-SizeOf(T);
Owner.Schema.ObjectModel.Lock.Enter;
try
Value.Timestamp:=T;
SetLength(Value.Value,StringCounter);
if (StringCounter > 0)
 then begin
  Move(Pointer(@BA[Index])^,Pointer(@Value.Value[1])^,StringCounter);
  Inc(Index,StringCounter);
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentTimestampedANSIStringValue.ToByteArray(): TByteArray;
var
  StringCounter,DataSize: cardinal;
begin
Owner.Schema.ObjectModel.Lock.Enter;
try
StringCounter:=Length(Value.Value);
DataSize:=SizeOf(Double)+StringCounter;
SetLength(Result,SizeOf(DataSize)+DataSize);
Cardinal(Pointer(@Result[0])^):=DataSize;
Double(Pointer(@Result[4])^):=Value.Timestamp;
if (StringCounter > 0) then Move(Pointer(@Value.Value[1])^,Pointer(@Result[12])^,StringCounter);
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

procedure TComponentTimestampedANSIStringValue.FromXMLNode(const Node: IXMLDOMNode);
var
  ValueNode: IXMLDOMNode;
  S: string;
  SL: TStringList;
begin
ValueNode:=Node.SelectSingleNode(Name);
Owner.Schema.ObjectModel.Lock.Enter();
try
S:=ValueNode.nodeTypedValue;
if (SplitString(S,';',{out} SL))
 then
  try
  if (SL.Count = 2)
   then begin
    Value.Timestamp:=StrToFloat(SL[0]);
    Value.Value:=SL[1];
    end;
  finally
  SL.Destroy();
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;

procedure TComponentTimestampedANSIStringValue.FromXMLNodeByAddress(const Address: TAddress; const AddressIndex: integer; const Node: IXMLDOMNode);
begin
if (AddressIndex >= Length(Address))
 then FromXMLNode(Node)
 else Inherited FromXMLNodeByAddress(Address,AddressIndex, Node);
end;

function TComponentTimestampedANSIStringValue.ToTrackEvent(): pointer;
begin
GetMem(Result,SizeOf(TObjectTrackEvent));
FillChar(Result^,SizeOf(TObjectTrackEvent), 0);
//.
Owner.Schema.ObjectModel.Lock.Enter();
try
with TObjectTrackEvent(Result^) do begin
Next:=nil;
Timestamp:=Value.Timestamp;
Severity:=otesInfo;
EventMessage:=FullName();
EventInfo:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+', Value: '+Value.Value;
end;
finally
Owner.Schema.ObjectModel.Lock.Leave();
end;
end;


{TComponentInt32AndANSIStringValue}
procedure TComponentInt32AndANSIStringValue.FromByteArray(const BA: TByteArray; var Index: integer);
var
  StringCounter: cardinal;
begin
if ((Index+SizeOf(Int32Value)+SizeOf(StringCounter)) > Length(BA)) then Exit; //. ->
Int32Value:=Integer(Pointer(@BA[Index])^); Inc(Index,SizeOf(Int32Value));
StringCounter:=Cardinal(Pointer(@BA[Index])^); Inc(Index,SizeOf(StringCounter));
if ((Index+StringCounter) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
SetLength(StringValue,StringCounter);
if (StringCounter > 0)
 then begin
  Move(Pointer(@BA[Index])^,Pointer(@StringValue[1])^,StringCounter);
  Inc(Index,StringCounter);
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentInt32AndANSIStringValue.ToByteArray(): TByteArray;
var
  StringCounter: cardinal;
begin
Owner.Schema.ObjectModel.Lock.Enter;
try
StringCounter:=Length(StringValue);
SetLength(Result,SizeOf(Int32Value)+SizeOf(StringCounter)+StringCounter);
Integer(Pointer(@Result[0])^):=Int32Value;
Cardinal(Pointer(@Result[SizeOf(Int32Value)])^):=StringCounter;
if (StringCounter > 0) then Move(Pointer(@StringValue[1])^,Pointer(@Result[SizeOf(Int32Value)+SizeOf(StringCounter)])^,StringCounter);
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentInt32AndInt32AndANSIStringValue}
procedure TComponentInt32AndInt32AndANSIStringValue.FromByteArray(const BA: TByteArray; var Index: integer);
var
  StringCounter: cardinal;
begin
if ((Index+SizeOf(Int32Value)+SizeOf(Int32Value1)+SizeOf(StringCounter)) > Length(BA)) then Exit; //. ->
Int32Value:=Integer(Pointer(@BA[Index])^); Inc(Index,SizeOf(Int32Value));
Int32Value1:=Integer(Pointer(@BA[Index])^); Inc(Index,SizeOf(Int32Value));
StringCounter:=Cardinal(Pointer(@BA[Index])^); Inc(Index,SizeOf(StringCounter));
if ((Index+StringCounter) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
SetLength(StringValue,StringCounter);
if (StringCounter > 0)
 then begin
  Move(Pointer(@BA[Index])^,Pointer(@StringValue[1])^,StringCounter);
  Inc(Index,StringCounter);
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentInt32AndInt32AndANSIStringValue.ToByteArray(): TByteArray;
var
  StringCounter: cardinal;
begin
Owner.Schema.ObjectModel.Lock.Enter;
try
StringCounter:=Length(StringValue);
SetLength(Result,SizeOf(Int32Value)+SizeOf(Int32Value1)+SizeOf(StringCounter)+StringCounter);
Integer(Pointer(@Result[0])^):=Int32Value;
Integer(Pointer(@Result[SizeOf(Int32Value)])^):=Int32Value1;
Cardinal(Pointer(@Result[SizeOf(Int32Value)+SizeOf(Int32Value1)])^):=StringCounter;
if (StringCounter > 0) then Move(Pointer(@StringValue[1])^,Pointer(@Result[SizeOf(Int32Value)+SizeOf(Int32Value1)+SizeOf(StringCounter)])^,StringCounter);
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentDataValue}
procedure TComponentDataValue.FromByteArray(const BA: TByteArray; var Index: integer);
var
  DataSize: cardinal;
begin
if ((Index+SizeOf(DataSize)) > Length(BA)) then Exit; //. ->
DataSize:=Cardinal(Pointer(@BA[Index])^); Inc(Index,SizeOf(DataSize));
if ((Index+DataSize) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
SetLength(Value,DataSize);
if (DataSize > 0)
 then begin
  Move(Pointer(@BA[Index])^,Pointer(@Value[0])^,DataSize);
  Inc(Index,DataSize);
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentDataValue.ToByteArray(): TByteArray;
var
  DataSize: cardinal;
begin
Owner.Schema.ObjectModel.Lock.Enter;
try
DataSize:=Length(Value);
SetLength(Result,SizeOf(DataSize)+DataSize);
Cardinal(Pointer(@Result[0])^):=DataSize;
if (DataSize > 0) then Move(Pointer(@Value[0])^,Pointer(@Result[SizeOf(DataSize)])^,DataSize);
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentTimestampedDataValue}
procedure TComponentTimestampedDataValue.FromByteArray(const BA: TByteArray; var Index: integer);
var
  _DataSize,DataSize: cardinal;
  T: Double;
begin
if ((Index+SizeOf(_DataSize)) > Length(BA)) then Exit; //. ->
_DataSize:=Cardinal(Pointer(@BA[Index])^); Inc(Index,SizeOf(_DataSize));
if ((Index+_DataSize) > Length(BA)) then Exit; //. ->
if (_DataSize < SizeOf(Double)) then Exit; //. ->
T:=Double(Pointer(@BA[Index])^); Inc(Index,SizeOf(T));
DataSize:=_DataSize-SizeOf(T);
Owner.Schema.ObjectModel.Lock.Enter;
try
Value.Timestamp:=T;
SetLength(Value.Value,DataSize);
if (DataSize > 0)
 then begin
  Move(Pointer(@BA[Index])^,Pointer(@Value.Value[0])^,DataSize);
  Inc(Index,DataSize);
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentTimestampedDataValue.ToByteArray(): TByteArray;
var
  DataSize,_DataSize: cardinal;
begin
Owner.Schema.ObjectModel.Lock.Enter;
try
DataSize:=Length(Value.Value);
_DataSize:=SizeOf(Double)+DataSize;
SetLength(Result,SizeOf(_DataSize)+_DataSize);
Cardinal(Pointer(@Result[0])^):=_DataSize;
Double(Pointer(@Result[4])^):=Value.Timestamp;
if (DataSize > 0) then Move(Pointer(@Value.Value[0])^,Pointer(@Result[12])^,DataSize);
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;


{TComponentDoubleArrayValue}
procedure TComponentDoubleArrayValue.FromByteArray(const BA: TByteArray; var Index: integer);
var
  Size: word;
  I: integer;
begin
if ((Index+SizeOf(Size)) > Length(BA)) then Exit; //. ->
Size:=Word(Pointer(@BA[Index])^); Inc(Index,SizeOf(Size));
if ((Index+Size*SizeOf(Double)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
SetLength(Value,Size);
for I:=0 to Size-1 do begin
  Value[I]:=Double(Pointer(@BA[Index])^); Inc(Index,SizeOf(Double));
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentDoubleArrayValue.ToByteArray(): TByteArray;
var
  Size: word;
  Idx: integer;
  I: integer;
begin
Size:=Length(Value);
SetLength(Result,SizeOf(Size)+Size*SizeOf(Double));                           
Owner.Schema.ObjectModel.Lock.Enter;
try
Idx:=0;
Word(Pointer(@Result[Idx])^):=Size; Inc(Idx,SizeOf(Size));
for I:=0 to Size-1 do begin
  Double(Pointer(@Result[Idx])^):=Value[I]; Inc(Idx,SizeOf(Double));
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentDoubleArrayValue.ToString(): string;
var
  I: integer;
begin
Result:='';
Owner.Schema.ObjectModel.Lock.Enter;
try
for I:=0 to Length(Value)-1 do Result:=Result+FormatFloat('0.00',Value[I])+' ';
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
if (Length(Result) > 0) then SetLength(Result,Length(Result)-1);
end;


{TComponentTimestampedDoubleArrayValue}
procedure TComponentTimestampedDoubleArrayValue.FromByteArray(const BA: TByteArray; var Index: integer);
var
  T: Double;
  Size: word;
  I: integer;
begin
if ((Index+SizeOf(Double)+SizeOf(Size)) > Length(BA)) then Exit; //. ->
T:=Double(Pointer(@BA[Index])^); Inc(Index,SizeOf(T));
Size:=Word(Pointer(@BA[Index])^); Inc(Index,SizeOf(Size));
if ((Index+Size*SizeOf(Double)) > Length(BA)) then Exit; //. ->
Owner.Schema.ObjectModel.Lock.Enter;
try
Value.Timestamp:=T;
SetLength(Value.Value,Size);
for I:=0 to Size-1 do begin
  Value.Value[I]:=Double(Pointer(@BA[Index])^); Inc(Index,SizeOf(Double));
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentTimestampedDoubleArrayValue.ToByteArray(): TByteArray;
var
  Size: word;
  Idx: integer;
  I: integer;
begin
Owner.Schema.ObjectModel.Lock.Enter;
try
Size:=Length(Value.Value);
SetLength(Result,SizeOf(Double)+SizeOf(Size)+Size*SizeOf(Double));                           
Idx:=0;
Double(Pointer(@Result[Idx])^):=Value.Timestamp; Inc(Idx,SizeOf(Value.Timestamp));
Word(Pointer(@Result[Idx])^):=Size; Inc(Idx,SizeOf(Size));
for I:=0 to Size-1 do begin
  Double(Pointer(@Result[Idx])^):=Value.Value[I]; Inc(Idx,SizeOf(Double));
  end;
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
end;

function TComponentTimestampedDoubleArrayValue.ToString(): string;
var
  I: integer;
begin
Owner.Schema.ObjectModel.Lock.Enter;
try
Result:='Timestamp: '+FormatDateTime('DD/MM/YYYY HH:NN:SS',Value.Timestamp+TimeZoneDelta)+'; ';
for I:=0 to Length(Value.Value)-1 do Result:=Result+FormatFloat('0.00',Value.Value[I])+' ';
finally
Owner.Schema.ObjectModel.Lock.Leave;
end;
if (Length(Result) > 0) then SetLength(Result,Length(Result)-1);
end;


Initialization
case GetTimeZoneInformation(TimeZoneInfo) of
TIME_ZONE_ID_STANDARD: TimeZoneDelta:=TimeZoneInfo.Bias/(-60.0*24.0);
TIME_ZONE_ID_DAYLIGHT: TimeZoneDelta:=(TimeZoneInfo.Bias+TimeZoneInfo.DaylightBias)/(-60.0*24.0);
else
  TimeZoneDelta:=TimeZoneInfo.Bias/(-60.0*24.0);
end;


end.