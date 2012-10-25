unit unitCoGeoMonitorObjectFunctionality;
Interface
Uses
  Windows,
  Classes, Dialogs,
  Forms,
  Graphics,
  GlobalSpaceDefines,
  FunctionalityImport,
  CoFunctionality,
  unitObjectModel,
  unitBusinessModel;


Const
  idTCoGeoMonitorObject = 1111143;
  //.
  OnlineFlagComponentTag = 1;
  LocationIsAvailableFlagComponentTag = 1;
  //.
  DATATag = 1;
  DynamicDATATag = 2;
  OwnerReferenceTag = 1;
  //.
  ReferenceComponentPrototypeTag = 1;
  InNotificationAreaComponentTag = 3;
  OutNotificationAreaComponentTag = 2;
  InOutNotificationAreaComponentTag = 4;
  //.
  ReferenceComponentWithDoubleVarPrototypeTag = 101;
  DoubleVarDistanceComponentTag = 1;
  ObjectMinDistanceComponentTag = 102;
  ObjectMaxDistanceComponentTag = 103;
  ObjectMinMaxDistanceComponentTag = 104;
  //.
  NotificationAddressesTag = 1;
Type
  TCoGeoMonitorObjectTypeSystem = class(TCoComponentTypeSystem)
  private
    function GetCreateCompletionObject(): TCreateCompletionObject; override;
  end;

  TCreateCoGeoMonitorObjectCompletionObject = class(TCreateCompletionObject)
  private
    procedure DoOnCreateClone(const idTClone,idClone: integer); override;
  end;

  TNotificationAreaType = (natUnknown,natIn,natOut,natInOut);

  TUserAlertSeverity = (uasNone = 0,uasMinor = 1,uasMajor = 2,uasCritical = 3);

  TObjectDistanceItem = record
    idTVisualization: integer;
    idVisualization: integer;
    Distance: double;
  end;

  TObjectDistanceType = (odtUnknown,odtMin,odtMax,odtMinMax);

  TObjectDistanceItems = array of TObjectDistanceItem;

  TGeoMonitorObjectKind = (
    gmokUnknown = 0,
    gmokPerson = 1,
    gmokAutomobile = 2,
    gmokAirplane = 3
  );

  TTCoGeoMonitorObjectFunctionality = class(TFunctionality)
  public
    Constructor Create();
    procedure DestroyInstance(const idCoComponent: integer);
  end;

  TCoGeoMonitorObjectFunctionality = class(TCoComponentFunctionality)
  public
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    procedure GetTypedData(const pUserName: WideString; const pUserPassword: WideString; const DataType: Integer; out Data: GlobalSpaceDefines.TByteArray); override;
    function TPropsPanel_Create: TForm; override;
    function getName: string;
    procedure setName(Value: string);
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    procedure SetOwner(const idTOwner,idOwner: integer);
    procedure GetGeoGraphServerComponent(out idGeoGraphServerObject: integer);
    procedure GetVisualizationComponent(out VisualizationType,VisualizationID: integer);
    function GetVisualizationHintComponent(out HintID: integer): boolean;
    function GetOnlineFlagComponent(out BoolVarID: integer): boolean;
    function GetLocationIsAvailableFlagComponent(const OnlineFlagBoolVarID: integer; out BoolVarID: integer): boolean;
    function GetUserAlertComponent(out UserAlertID: integer): boolean;
    function GetObjectModel(const pUserName: WideString; const pUserPassword: WideString): TObjectModel;
    function GetBusinessModel(const pUserName: WideString; const pUserPassword: WideString): TBusinessModel; {! free Result.ObjectModel after use also}
    function IsOnline(): boolean;
    function LocationIsAvailable(): boolean;
    procedure GetLocationFix(const pUserName: WideString; const pUserPassword: WideString; out TimeStamp: double; out DatumID: integer; out Latitude: double; out Longitude: double; Altitude: double; out Speed: double; out Bearing: double; out Precision: double);
    procedure GetUserAlertStatus(out oAlertID: integer; out oSeverity: integer; out oTimeStamp: TDateTime);
    function GetDATA(out DATA: TMemoryStream): boolean;
    procedure SetDATA(const DATA: TMemoryStream);
    function GetDynamicDATA(out DATA: TMemoryStream): boolean;
    procedure SetDynamicDATA(const DATA: TMemoryStream);
    procedure GetInOutNotificationAreaComponents(out InComponents: TComponentsList; out OutComponents: TComponentsList; out InOutComponents: TComponentsList);
    procedure GetInOutNotificationAreaReferences(out InReferences: TComponentsList; out OutReferences: TComponentsList; out InOutReferences: TComponentsList);
    procedure GetObjectDistanceItems(out ObjectMinDistanceItems: TObjectDistanceItems; out ObjectMaxDistanceItems: TObjectDistanceItems; out ObjectMinMaxDistanceItems: TObjectDistanceItems);
    procedure GetObjectDistanceReferences(out ObjectMinDistanceReferences: TComponentsList; out ObjectMaxDistanceReferences: TComponentsList; out ObjectMinMaxDistanceReferences: TComponentsList);
    function GetObjectDistanceReferenceDoubleVarDistance(const idCoReference: integer; out Distance: double): boolean;
    function SetObjectDistanceReferenceDoubleVarDistance(const idCoReference: integer; const Distance: double): boolean;
    procedure GetReferenceComponentPrototype(out idCoReference: integer);
    procedure GetReferenceComponentWithDoubleVarPrototype(out idCoReference: integer);
    function AddNotificationAreaComponent(const pName: string; const idTArea,idArea: integer; const AreaType: TNotificationAreaType): integer;
    procedure RemoveNotificationAreaComponent(const idTArea,idArea: integer; const AreaType: TNotificationAreaType);
    function AddObjectDistanceComponent(const pName: string; const idTVisualization,idVisualization: integer; const ObjectDistanceType: TObjectDistanceType; const Distance: double): integer;
    procedure RemoveObjectDistanceComponent(const idTVisualization,idVisualization: integer; const ObjectDistanceType: TObjectDistanceType; const Distance: double); overload;
    procedure RemoveObjectDistanceComponent(const idCoReference: integer); overload;
    function GetGeoGraphServerObject(out idGeoGraphServerObject: integer): boolean;
    function GetGeoGraphServer(out idGeoGraphServer: integer): boolean;
    function getNotificationAddresses: string;
    procedure setNotificationAddresses(Value: string);
    procedure GetTrackData(const pUserName: WideString; const pUserPassword: WideString; const GeoSpaceID: integer; const BeginTime: double; const EndTime: double; DataType: Integer; out Data: GlobalSpaceDefines.TByteArray); 
    function GetHintInfo(const pUserName: WideString; const pUserPassword: WideString; const InfoType: integer; const InfoFormat: integer; out Info: GlobalSpaceDefines.TByteArray): boolean; override;
    function TStatusBar_Create(const pUpdateNotificationProc: TComponentStatusBarUpdateNotificationProc): TAbstractComponentStatusBar; override;
    property Name: string read getName write setName;
    property NotificationAddresses: string read getNotificationAddresses write setNotificationAddresses;
  end;

  TCoGeoMonitorObjectDATA = class(TMemoryStream)
  public
    //. --- obsolete fields (use GeoGraphServerObject component)
    ServerType: integer;
    ServerID: integer;
    ServerObjectID: integer;
    ServerObjectType: integer;
    //. --------------------------------------------------------

    Constructor Create(const AStream: TStream = nil);
    destructor Destroy; override;
    procedure ClearProperties;
    procedure GetProperties;
    procedure SetProperties;
  end;

Const
  UserAlertSeverityColors: array[TUserAlertSeverity] of TColor = (
    clGreen,
    clYellow,
    clFuchsia,
    clRed
  );

  UserAlertSeverityNames: array[TUserAlertSeverity] of string = (
    'none',
    'Minor',
    'Major',
    'Critical'
  );

  GeoMonitorObjectKindNames: array[TGeoMonitorObjectKind] of string = (
    'Unknown',
    'Person',
    'Automobile',
    'Airplane'
  );

Type
  TCoGeoMonitorObjectStatusBar = class(TAbstractComponentStatusBar)
  private
    procedure ValidateUpdaters();
    procedure OnlineFlagComponentUpdate();
    procedure LocationIsAvailableFlagComponentUpdate();
    procedure UserAlertComponentUpdate();
  public
    OnlineFlagComponentID: integer;
    OnlineFlag: boolean;
    OnlineFlagComponentUpdater: TComponentPresentUpdater;
    //.
    LocationIsAvailableFlagComponentID: integer;
    LocationIsAvailableFlag: boolean;
    LocationIsAvailableFlagComponentUpdater: TComponentPresentUpdater;
    //.
    UserAlertComponentID: integer;
    UserAlertSeverity: integer;
    UserAlertFlag: boolean;
    UserAlertComponentUpdater: TComponentPresentUpdater;

    Destructor Destroy(); override;
    procedure Update(); override;
    procedure SaveToStream(const Stream: TMemoryStream); override;
    function  LoadFromStream(const Stream: TMemoryStream): boolean; override;
    function Status_IsOnline(): boolean; override;
    function Status_LocationIsAvailable(): boolean; override;
    procedure DrawOnCanvas(const Canvas: TCanvas; const Rect: TRect; const Version: integer); override;
  end;

  function ConstructCoGeoMonitorObject(const BusinessModelClass: TBusinessModelClass; const pName: string; const pGeoSpaceID: integer): integer;

  procedure Initialize; stdcall;
  procedure Finalize; stdcall;


var
  CoGeoMonitorObjectTypeSystem: TCoGeoMonitorObjectTypeSystem = nil;

Implementation
Uses
  SysUtils,
  ActiveX,
  MSXML,
  DBClient,
  TypesDefines,  
  unitGEOGraphServerController, 
  unitCoGeoMonitorObjectPanelProps;







{TCoGeoMonitorObjectTypeSystem}
function TCoGeoMonitorObjectTypeSystem.GetCreateCompletionObject(): TCreateCompletionObject;
begin
Result:=TCreateCoGeoMonitorObjectCompletionObject.Create(nil);
end;


{TCreateCoGeoMonitorObjectCompletionObject}
procedure TCreateCoGeoMonitorObjectCompletionObject.DoOnCreateClone(const idTClone,idClone: integer);
begin
TCoGeoMonitorObjectPanelProps.RegisterServerObject(idClone);
end;



{TTCoGeoMonitorObjectFunctionality}
Constructor TTCoGeoMonitorObjectFunctionality.Create();
begin
Inherited Create();
end;

procedure TTCoGeoMonitorObjectFunctionality.DestroyInstance(const idCoComponent: integer);
var
  idGeoGraphServerObject: integer;
  _GeoGraphServerID: integer;
  _ObjectID: integer;
  _ObjectType: integer;
  _BusinessModel: integer;
begin
_GeoGraphServerID:=0;
_ObjectID:=0;
try
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
if (GetGeoGraphServerObject(idGeoGraphServerObject))
 then with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
  try
  GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
  finally
  Release;
  end;
finally
Release;
end;
//. unregister GeographServer object
if ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))
 then with TGeoGraphServerFunctionality(TComponentFunctionality_Create(idTGeoGraphServer,_GeoGraphServerID)) do
  try
  try
  UnRegisterObject(_ObjectID);
  except
    //. catch exceptions if object is not registered
    end;
  finally
  Release();
  end;
finally
//. destroy this instance
with TTypeFunctionality_Create(idTCoComponent) do
try
DestroyInstance(idCoComponent);
finally
Release();
end;
end;
end;


{TCoGeoMonitorObjectFunctionality}
Constructor TCoGeoMonitorObjectFunctionality.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
end;

Destructor TCoGeoMonitorObjectFunctionality.Destroy;
begin
Inherited;
end;

procedure TCoGeoMonitorObjectFunctionality.GetTypedData(const pUserName: WideString; const pUserPassword: WideString; const DataType: Integer; out Data: GlobalSpaceDefines.TByteArray);
var
  Idx: integer;
  V: byte;
  AlertID: integer;
  Severity: integer;
  TimeStamp: TDateTime;
  ObjectModelID,BusinessModelID: integer;
  ObjectSchemaData,ObjectDeviceSchemaData: GlobalSpaceDefines.TByteArray;
  ObjectSchemaDataSize,ObjectDeviceSchemaDataSize: integer;
  BusinessModel: TBusinessModel;
begin
Data:=nil;
//.
TComponentFunctionality(CoComponentFunctionality).SetUser(pUserName,pUserPassword);
case (DataType) of
0: begin
  SetLength(Data,1{SizeOf(Online flag)}+1{SizeOf(LocationIsAvailable flag)}+4{SizeOf(UserAlert value)}+8{SizeOf(UserAlert timestamp)});
  //. Online flag
  if (IsOnline()) then V:=1 else V:=0;
  Data[0]:=V;
  //. LocationIsAvailable flag
  if (LocationIsAvailable()) then V:=1 else V:=0;
  Data[1]:=V;
  //. UserAlert status
  GetUserAlertStatus({out} AlertID,Severity,TimeStamp);
  Integer(Pointer(@Data[2])^):=Severity;
  Double(Pointer(@Data[6])^):=Double(TimeStamp);
  end;
1000000: begin //. Object-Model data
  ObjectModelID:=0;
  BusinessModelID:=0;
  ObjectSchemaData:=nil;
  ObjectDeviceSchemaData:=nil;
  //.
  BusinessModel:=GetBusinessModel(pUserName,pUserPassword);
  if (BusinessModel <> nil)
   then
    try
    ObjectModelID:=BusinessModel.ObjectTypeID();
    BusinessModelID:=BusinessModel.ID();
    ObjectSchemaData:=BusinessModel.ObjectModel.ObjectSchema.RootComponent.ToByteArray();
    ObjectDeviceSchemaData:=BusinessModel.ObjectModel.ObjectDeviceSchema.RootComponent.ToByteArray();
    finally
    BusinessModel.ObjectModel.Destroy();
    BusinessModel.Destroy();
    end;
  //.
  ObjectSchemaDataSize:=Length(ObjectSchemaData);
  ObjectDeviceSchemaDataSize:=Length(ObjectDeviceSchemaData);
  SetLength(Data,4{SizeOf(ObjectModelID)}+4{SizeOf(BusinessModelID)}+4{SizeOf(ObjectSchemaDataSize)}+ObjectSchemaDataSize+4{SizeOf(ObjectDeviceSchemaDataSize)}+ObjectDeviceSchemaDataSize);
  Idx:=0;
  Integer(Pointer(@Data[Idx])^):=ObjectModelID; Inc(Idx,SizeOf(ObjectModelID));
  Integer(Pointer(@Data[Idx])^):=BusinessModelID; Inc(Idx,SizeOf(BusinessModelID));
  Integer(Pointer(@Data[Idx])^):=ObjectSchemaDataSize; Inc(Idx,SizeOf(ObjectSchemaDataSize));
  if (ObjectSchemaDataSize > 0)
   then begin
    Move(Pointer(@ObjectSchemaData[0])^,Pointer(@Data[Idx])^,ObjectSchemaDataSize);
    Inc(Idx,ObjectSchemaDataSize);
    end;
  Integer(Pointer(@Data[Idx])^):=ObjectDeviceSchemaDataSize; Inc(Idx,SizeOf(ObjectDeviceSchemaDataSize));
  if (ObjectDeviceSchemaDataSize > 0)
   then begin
    Move(Pointer(@ObjectDeviceSchemaData[0])^,Pointer(@Data[Idx])^,ObjectDeviceSchemaDataSize);
    Inc(Idx,ObjectDeviceSchemaDataSize);
    end;
  end;
end;
end;

function TCoGeoMonitorObjectFunctionality.TPropsPanel_Create: TForm;
begin
Result:=TCoGeoMonitorObjectPanelProps.Create(idCoComponent);
end;

function TCoGeoMonitorObjectFunctionality.getName: string;
var
  idT,TypeMarkerID: integer;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTCoComponentTypeMarker, idT,TypeMarkerID))
 then with TCoComponentTypeMarkerFunctionality(TComponentFunctionality_Create(idT,TypeMarkerID)) do
  try
  Result:=Name;
  finally
  Release;
  end
 else Raise Exception.Create('type-marker is not found'); //. =>
end;

procedure TCoGeoMonitorObjectFunctionality.setName(Value: string);
var
  idT,TypeMarkerID: integer;
  HintID: integer;
  PrivateDATA: TMemoryStream;
  DATA: THintVisualizationDATA;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTCoComponentTypeMarker, idT,TypeMarkerID))
 then with TCoComponentTypeMarkerFunctionality(TComponentFunctionality_Create(idT,TypeMarkerID)) do
  try
  Name:=Value;
  //. set visualization hint params
  if (GetVisualizationHintComponent({out} HintID))
   then with THINTVisualizationFunctionality(TComponentFunctionality_Create(idTHINTVisualization,HintID)) do
    try
    GetPrivateDATA2(PrivateDATA);
    with PrivateDATA do
    try
    DATA:=THintVisualizationDATA.Create(PrivateDATA);
    with DATA do
    try
    InfoString:=Value;
    InfoComponent.idType:=idTCoComponent;
    InfoComponent.idObj:=idCoComponent;
    //.
    SetProperties();
    Position:=0;
    SetPrivateDATA1(DATA);
    finally
    Destroy;
    end;
    finally
    Destroy;
    end;
    finally
    Release;
    end;
  //. notify update operation
  TComponentFunctionality(CoComponentFunctionality).NotifyOnComponentUpdate();
  finally
  Release;
  end
 else Raise Exception.Create('type-marker is not found'); //. =>
end;

function TCoGeoMonitorObjectFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
var
  idT,CoReferenceID: integer;
begin
Result:=false;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTCoReference, OwnerReferenceTag,{out} idT,CoReferenceID))
 then with TCoReferenceFunctionality(TComponentFunctionality_Create(idT,CoReferenceID)) do
  try
  GetReferencedObject(idTOwner,idOwner);
  if ((idTOwner <> 0) AND (idOwner <> 0)) then Result:=true;
  finally
  Release;
  end;
end;

procedure TCoGeoMonitorObjectFunctionality.SetOwner(const idTOwner,idOwner: integer);
var
  OwnerName: string;
  idT,CoReferenceID: integer;
begin
with TComponentFunctionality_Create(idTOwner,idOwner) do
try
OwnerName:=Name;
finally
Release;
end;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTCoReference, OwnerReferenceTag,{out} idT,CoReferenceID))
 then with TCoReferenceFunctionality(TComponentFunctionality_Create(idT,CoReferenceID)) do
  try
  SetReferencedObject(idTOwner,idOwner);
  Name:=OwnerName;
  //. notify update operation
  TComponentFunctionality(CoComponentFunctionality).NotifyOnComponentUpdate();
  finally
  Release;
  end
 else Raise Exception.Create('no owner reference component is found'); //. =>
end;

procedure TCoGeoMonitorObjectFunctionality.GetGeoGraphServerComponent(out idGeoGraphServerObject: integer);
var
  idT: integer;
begin
idGeoGraphServerObject:=0;
if (NOT TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTGeoGraphServerObject,{out} idT,idGeoGraphServerObject))
 then Raise Exception.Create('GeoGraph server component is not found'); //. =>
end;

procedure TCoGeoMonitorObjectFunctionality.GetVisualizationComponent(out VisualizationType,VisualizationID: integer);
var
  CL: TComponentsList;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponents(TBase2DVisualizationFunctionality,CL))
 then
  try
  VisualizationType:=TItemComponentsList(CL[0]^).idTComponent;
  VisualizationID:=TItemComponentsList(CL[0]^).idComponent;
  finally
  CL.Destroy;
  end
 else Raise Exception.Create('visualization-component is not found'); //. =>
end;

function TCoGeoMonitorObjectFunctionality.GetVisualizationHintComponent(out HintID: integer): boolean;
var
  VisualizationType: integer;
  VisualizationID: integer;
  DetailsList: TComponentsList;
  I: integer;
begin
Result:=false;
GetVisualizationComponent(VisualizationType,VisualizationID);
if (VisualizationType = idTCoVisualization)
 then with TCoVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
  try
  Result:=GetOwnSpaceHINTVisualization({out} HintID);
  finally
  Release;
  end;
if (NOT Result)
 then with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
  try
  if (GetDetailsList(DetailsList))
   then
    try
    for I:=0 to DetailsList.Count-1 do with TItemComponentsList(DetailsList[I]^) do
      if (idTComponent = idTHintVisualization)
       then begin
        HintID:=idComponent;
        Result:=true;
        Exit; //. ->
        end;
    finally
    DetailsList.Destroy;
    end;
  finally
  Release;
  end;
end;

function TCoGeoMonitorObjectFunctionality.GetOnlineFlagComponent(out BoolVarID: integer): boolean;
var
  idT: integer;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTBoolVar,OnlineFlagComponentTag,{out} idT, BoolVarID))
 then Result:=true
 else Result:=false;
end;

function TCoGeoMonitorObjectFunctionality.GetLocationIsAvailableFlagComponent(const OnlineFlagBoolVarID: integer; out BoolVarID: integer): boolean;
var
  idT: integer;
begin
with TComponentFunctionality_Create(idTBoolVar,OnlineFlagBoolVarID) do
try
if (QueryComponentWithTag1(idTBoolVar,LocationIsAvailableFlagComponentTag,{out} idT,BoolVarID))
 then Result:=true
 else Result:=false;
finally
Release;
end;
end;

function TCoGeoMonitorObjectFunctionality.GetUserAlertComponent(out UserAlertID: integer): boolean;
var
  idT: integer;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTUserAlert, idT, UserAlertID))
 then Result:=true
 else Result:=false;
end;

function TCoGeoMonitorObjectFunctionality.GetObjectModel(const pUserName: WideString; const pUserPassword: WideString): TObjectModel;
var
  idGeoGraphServerObject: integer;
  GSOF: TGeoGraphServerObjectFunctionality;
  _GeoGraphServerID: integer;
  _ObjectType: integer;
  _ObjectID: integer;
  _BusinessModel: integer;
  MSF: TMODELServerFunctionality;
  UserID: integer;
  ServerObjectController: TGEOGraphServerObjectController;
begin
Result:=nil;
TComponentFunctionality(CoComponentFunctionality).SetUser(pUserName,pUserPassword);
//.
if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
GSOF:=TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject));
try
TComponentFunctionality(GSOF).SetUser(TComponentFunctionality(CoComponentFunctionality).UserName,TComponentFunctionality(CoComponentFunctionality).UserPassword);
//.
GSOF.GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
finally
GSOF.Release();
end;
//.
if (NOT ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))) then Exit; //. ->
if ((_ObjectType = 0) OR (_BusinessModel = 0)) then Exit; //. ->
//.
MSF:=TMODELServerFunctionality(TComponentFunctionality_Create(idTMODELServer,0));
try
TComponentFunctionality(MSF).SetUser(TComponentFunctionality(CoComponentFunctionality).UserName(),TComponentFunctionality(CoComponentFunctionality).UserPassword());
//.
UserID:=MSF.GetUserID(TComponentFunctionality(MSF).UserName(),TComponentFunctionality(MSF).UserPassword());
finally
MSF.Release();
end;
ServerObjectController:=TGEOGraphServerObjectController.Create(idGeoGraphServerObject,_ObjectID,UserID,TComponentFunctionality(CoComponentFunctionality).UserPassword(),'',0,false);
Result:=TObjectModel.GetModel(_ObjectType,ServerObjectController,true);
end;

function TCoGeoMonitorObjectFunctionality.GetBusinessModel(const pUserName: WideString; const pUserPassword: WideString): TBusinessModel;
var
  idGeoGraphServerObject: integer;
  GSOF: TGeoGraphServerObjectFunctionality;
  _GeoGraphServerID: integer;
  _ObjectType: integer;
  _ObjectID: integer;
  _BusinessModel: integer;
  MSF: TMODELServerFunctionality;
  UserID: integer;
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TObjectModel;
begin
Result:=nil;
TComponentFunctionality(CoComponentFunctionality).SetUser(pUserName,pUserPassword);
//.
if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
GSOF:=TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject));
try
TComponentFunctionality(GSOF).SetUser(TComponentFunctionality(CoComponentFunctionality).UserName,TComponentFunctionality(CoComponentFunctionality).UserPassword);
//.
GSOF.GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
finally
GSOF.Release();
end;
//.
if (NOT ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))) then Exit; //. ->
if ((_ObjectType = 0) OR (_BusinessModel = 0)) then Exit; //. ->
//.
MSF:=TMODELServerFunctionality(TComponentFunctionality_Create(idTMODELServer,0));
try
TComponentFunctionality(MSF).SetUser(TComponentFunctionality(CoComponentFunctionality).UserName(),TComponentFunctionality(CoComponentFunctionality).UserPassword());
//.
UserID:=MSF.GetUserID(TComponentFunctionality(MSF).UserName(),TComponentFunctionality(MSF).UserPassword());
finally
MSF.Release();
end;
ServerObjectController:=TGEOGraphServerObjectController.Create(idGeoGraphServerObject,_ObjectID,UserID,TComponentFunctionality(CoComponentFunctionality).UserPassword(),'',0,false);
ObjectModel:=TObjectModel.GetModel(_ObjectType,ServerObjectController,true);
if (ObjectModel = nil) then Exit; //. ->
Result:=TBusinessModel.GetModel(ObjectModel,_BusinessModel);
if (Result = nil) then ObjectModel.Destroy();
end;

function TCoGeoMonitorObjectFunctionality.IsOnline(): boolean;
var
  BoolVarID: integer;
  BVF: TBoolVarFunctionality;
begin
Result:=false; 
if (GetOnlineFlagComponent({out} BoolVarID))
 then begin 
  BVF:=TBoolVarFunctionality(TComponentFunctionality_Create(idTBoolVar,BoolVarID));
  try
  TComponentFunctionality(BVF).SetUser(TComponentFunctionality(CoComponentFunctionality).UserName,TComponentFunctionality(CoComponentFunctionality).UserPassword);
  //.
  Result:=BVF.Value; 
  finally
  BVF.Release();
  end;
  end;    
end;

function TCoGeoMonitorObjectFunctionality.LocationIsAvailable(): boolean;
var
  OnineFlagID,LocationIsAvailableID: integer;
  BVF: TBoolVarFunctionality;
begin
Result:=false;
if (GetOnlineFlagComponent({out} OnineFlagID) AND GetLocationIsAvailableFlagComponent(OnineFlagID,{out} LocationIsAvailableID))
 then begin
  BVF:=TBoolVarFunctionality(TComponentFunctionality_Create(idTBoolVar,LocationIsAvailableID));
  try
  TComponentFunctionality(BVF).SetUser(TComponentFunctionality(CoComponentFunctionality).UserName,TComponentFunctionality(CoComponentFunctionality).UserPassword);
  //.
  Result:=BVF.Value;
  finally
  BVF.Release();
  end;
  end;
end;

procedure TCoGeoMonitorObjectFunctionality.GetLocationFix(const pUserName: WideString; const pUserPassword: WideString; out TimeStamp: double; out DatumID: integer; out Latitude: double; out Longitude: double; Altitude: double; out Speed: double; out Bearing: double; out Precision: double);
var
  ObjectModel: TObjectModel;
begin
TimeStamp:=0.0;
DatumID:=0;
Latitude:=0.0;
Longitude:=0.0;
Altitude:=0.0;
Speed:=0.0;
Bearing:=0.0;
Precision:=0.0;
//.
ObjectModel:=GetObjectModel(pUserName,pUserPassword);
if (ObjectModel = nil) then Raise Exception.Create('could not get Object-Model'); //. =>
try
//. update Object Model
if (ObjectModel.flComponentUserAccessControl)
 then begin
  ObjectModel.ObjectSchema.RootComponent.ReadAllCUAC();
  ObjectModel.ObjectDeviceSchema.RootComponent.ReadAllCUAC();
  end
 else begin
  ObjectModel.ObjectSchema.RootComponent.ReadAll();
  ObjectModel.ObjectDeviceSchema.RootComponent.ReadAll();
  end;
//.
ObjectModel.Object_GetLocationFix({out} TimeStamp,{out}DatumID,{out} Latitude,Longitude,Altitude,Speed,Bearing,Precision);
finally
ObjectModel.Destroy();
end;
end;

procedure TCoGeoMonitorObjectFunctionality.GetUserAlertStatus(out oAlertID: integer; out oSeverity: integer; out oTimeStamp: TDateTime);
var
  UserAlertID: integer;
  UAF: TUserAlertFunctionality;
begin
oAlertID:=0;
oTimeStamp:=0;
oSeverity:=0;
if (GetUserAlertComponent({out} UserAlertID))
 then begin
  UAF:=TUserAlertFunctionality(TComponentFunctionality_Create(idTUserAlert,UserAlertID));
  try
  TComponentFunctionality(UAF).SetUser(TComponentFunctionality(CoComponentFunctionality).UserName,TComponentFunctionality(CoComponentFunctionality).UserPassword);
  //.
  oAlertID:=UAF.AlertID;
  oSeverity:=UAF.Severity;
  oTimeStamp:=UAF.TimeStamp;
  finally
  UAF.Release();
  end;
  end;
end;

function TCoGeoMonitorObjectFunctionality.GetDATA(out DATA: TMemoryStream): boolean;
var
  idTComponent,idComponent: integer;
  DATAFileFunctionality: TDATAFileFunctionality;
  DetailsList: TComponentsList;
  CompositionNameFunctionality: TTTFVisualizationFunctionality;
begin
Result:=false;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTDATAFile, DATATag,{out} idTComponent,idComponent))
 then begin
  DATAFileFunctionality:=TDATAFileFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  try
  DATAFileFunctionality.GetDATA1(TClientBlobStream(DATA));
  Result:=true;
  finally
  DATAFileFunctionality.Release;
  end;
  end;
end;

procedure TCoGeoMonitorObjectFunctionality.SetDATA(const DATA: TMemoryStream);
var
  idTComponent,idComponent: integer;
  DATAFileFunctionality: TDATAFileFunctionality;
  DetailsList: TComponentsList;
  CompositionNameFunctionality: TTTFVisualizationFunctionality;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTDATAFile, DATATag,{out} idTComponent,idComponent))
 then begin
  DATAFileFunctionality:=TDATAFileFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  try
  DATAFileFunctionality.SetDATA1(DATA);
  DATAFileFunctionality.DATAType:='.xml';
  finally
  DATAFileFunctionality.Release;
  end;
  end
 else Raise Exception.Create('data-file component with Tag = '+IntToStr(DATATag)+' is not found'); //. =>
end;

function TCoGeoMonitorObjectFunctionality.GetDynamicDATA(out DATA: TMemoryStream): boolean;
var
  idTComponent,idComponent: integer;
  DATAFileFunctionality: TDATAFileFunctionality;
  DetailsList: TComponentsList;
  CompositionNameFunctionality: TTTFVisualizationFunctionality;
begin
Result:=false;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTDATAFile, DynamicDATATag,{out} idTComponent,idComponent))
 then begin
  DATAFileFunctionality:=TDATAFileFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  try
  DATAFileFunctionality.GetDATA1(TClientBlobStream(DATA));
  Result:=true;
  finally
  DATAFileFunctionality.Release;
  end;
  end;
end;

procedure TCoGeoMonitorObjectFunctionality.SetDynamicDATA(const DATA: TMemoryStream);
var
  idTComponent,idComponent: integer;
  DATAFileFunctionality: TDATAFileFunctionality;
  DetailsList: TComponentsList;
  CompositionNameFunctionality: TTTFVisualizationFunctionality;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTDATAFile, DynamicDATATag,{out} idTComponent,idComponent))
 then begin
  DATAFileFunctionality:=TDATAFileFunctionality(TComponentFunctionality_Create(idTComponent,idComponent));
  try
  DATAFileFunctionality.SetDATA1(DATA);
  DATAFileFunctionality.DATAType:='.xml';
  finally
  DATAFileFunctionality.Release;
  end;
  end
 else Raise Exception.Create('data-file component with Tag = '+IntToStr(DynamicDATATag)+' is not found'); //. =>
end;

procedure TCoGeoMonitorObjectFunctionality.GetInOutNotificationAreaComponents(out InComponents: TComponentsList; out OutComponents: TComponentsList; out InOutComponents: TComponentsList);
var
  CL: TComponentsList;
  I: integer;
  RF: TCoReferenceFunctionality;
  idTRefObj,idRefObj: integer;
begin
InComponents:=TComponentsList.Create;
OutComponents:=TComponentsList.Create;
InOutComponents:=TComponentsList.Create;
try
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference,OutNotificationAreaComponentTag,{out} CL))
 then
  try
  for I:=0 to CL.Count-1 do begin
    RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent));
    try
    RF.GetReferencedObject(idTRefObj,idRefObj);
    OutComponents.AddComponent(idTRefObj,idRefObj,0);
    finally
    RF.Release;
    end;
    end;
  finally
  CL.Destroy;
  end;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference,InNotificationAreaComponentTag,{out} CL))
 then
  try
  for I:=0 to CL.Count-1 do begin
    RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent));
    try
    RF.GetReferencedObject(idTRefObj,idRefObj);
    InComponents.AddComponent(idTRefObj,idRefObj,0);
    finally
    RF.Release;
    end;
    end;
  finally
  CL.Destroy;
  end;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference,InOutNotificationAreaComponentTag,{out} CL))
 then
  try
  for I:=0 to CL.Count-1 do begin
    RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent));
    try
    RF.GetReferencedObject(idTRefObj,idRefObj);
    InOutComponents.AddComponent(idTRefObj,idRefObj,0);
    finally
    RF.Release;
    end;
    end;
  finally
  CL.Destroy;
  end;
except
  FreeAndNil(InComponents);
  FreeAndNil(OutComponents);
  FreeAndNil(InOutComponents);
  Raise; //. =>
  end;
end;

procedure TCoGeoMonitorObjectFunctionality.GetInOutNotificationAreaReferences(out InReferences: TComponentsList; out OutReferences: TComponentsList; out InOutReferences: TComponentsList);
var
  CL: TComponentsList;
  I: integer;
begin
InReferences:=TComponentsList.Create;
OutReferences:=TComponentsList.Create;
InOutReferences:=TComponentsList.Create;
try
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference,OutNotificationAreaComponentTag,{out} CL))
 then
  try
  for I:=0 to CL.Count-1 do OutReferences.AddComponent(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent,0);
  finally
  CL.Destroy;
  end;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference,InNotificationAreaComponentTag,{out} CL))
 then
  try
  for I:=0 to CL.Count-1 do InReferences.AddComponent(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent,0);
  finally
  CL.Destroy;
  end;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference,InOutNotificationAreaComponentTag,{out} CL))
 then
  try
  for I:=0 to CL.Count-1 do InOutReferences.AddComponent(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent,0);
  finally
  CL.Destroy;
  end;
except
  FreeAndNil(InReferences);
  FreeAndNil(OutReferences);
  FreeAndNil(InOutReferences);
  Raise; //. =>
  end;
end;

procedure TCoGeoMonitorObjectFunctionality.GetObjectDistanceItems(out ObjectMinDistanceItems: TObjectDistanceItems; out ObjectMaxDistanceItems: TObjectDistanceItems; out ObjectMinMaxDistanceItems: TObjectDistanceItems);
var
  CL: TComponentsList;
  I: integer;
  RF: TCoReferenceFunctionality;
  idT: integer;
  idDoubleVar: integer;
begin
ObjectMinDistanceItems:=nil;
ObjectMaxDistanceItems:=nil;
ObjectMinMaxDistanceItems:=nil;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference,ObjectMinMaxDistanceComponentTag,{out} CL))
 then
  try
  SetLength(ObjectMinMaxDistanceItems,CL.Count);
  for I:=0 to CL.Count-1 do begin
    ObjectMinMaxDistanceItems[I].idTVisualization:=0;
    ObjectMinMaxDistanceItems[I].idVisualization:=0;
    ObjectMinMaxDistanceItems[I].Distance:=-1.0;
    //.
    RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent));
    try
    RF.GetReferencedObject(ObjectMinMaxDistanceItems[I].idTVisualization,ObjectMinMaxDistanceItems[I].idVisualization);
    if (TComponentFunctionality(RF).QueryComponentWithTag1(idTDoubleVar, DoubleVarDistanceComponentTag,{out} idT,idDoubleVar))
     then with TDoubleVarFunctionality(TComponentFunctionality_Create(idT,idDoubleVar)) do
      try
      ObjectMinMaxDistanceItems[I].Distance:=Value;
      finally
      Release;
      end;
    finally
    RF.Release;
    end;
    end;
  finally
  CL.Destroy;
  end;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference,ObjectMinDistanceComponentTag,{out} CL))
 then
  try
  SetLength(ObjectMinDistanceItems,CL.Count);
  for I:=0 to CL.Count-1 do begin
    ObjectMinDistanceItems[I].idTVisualization:=0;
    ObjectMinDistanceItems[I].idVisualization:=0;
    ObjectMinDistanceItems[I].Distance:=-1.0;
    //.
    RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent));
    try
    RF.GetReferencedObject(ObjectMinDistanceItems[I].idTVisualization,ObjectMinDistanceItems[I].idVisualization);
    if (TComponentFunctionality(RF).QueryComponentWithTag1(idTDoubleVar, DoubleVarDistanceComponentTag,{out} idT,idDoubleVar))
     then with TDoubleVarFunctionality(TComponentFunctionality_Create(idT,idDoubleVar)) do
      try
      ObjectMinDistanceItems[I].Distance:=Value;
      finally
      Release;
      end;
    finally
    RF.Release;
    end;
    end;
  finally
  CL.Destroy;
  end;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference,ObjectMaxDistanceComponentTag,{out} CL))
 then
  try
  SetLength(ObjectMaxDistanceItems,CL.Count);
  for I:=0 to CL.Count-1 do begin
    ObjectMaxDistanceItems[I].idTVisualization:=0;
    ObjectMaxDistanceItems[I].idVisualization:=0;
    ObjectMaxDistanceItems[I].Distance:=-1.0;
    //.
    RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent));
    try
    RF.GetReferencedObject(ObjectMaxDistanceItems[I].idTVisualization,ObjectMaxDistanceItems[I].idVisualization);
    if (TComponentFunctionality(RF).QueryComponentWithTag1(idTDoubleVar, DoubleVarDistanceComponentTag,{out} idT,idDoubleVar))
     then with TDoubleVarFunctionality(TComponentFunctionality_Create(idT,idDoubleVar)) do
      try
      ObjectMaxDistanceItems[I].Distance:=Value;
      finally
      Release;
      end;
    finally
    RF.Release;
    end;
    end;
  finally
  CL.Destroy;
  end;
end;

procedure TCoGeoMonitorObjectFunctionality.GetObjectDistanceReferences(out ObjectMinDistanceReferences: TComponentsList; out ObjectMaxDistanceReferences: TComponentsList; out ObjectMinMaxDistanceReferences: TComponentsList);
var
  CL: TComponentsList;
  I: integer;
begin
ObjectMinDistanceReferences:=TComponentsList.Create;
ObjectMaxDistanceReferences:=TComponentsList.Create;
ObjectMinMaxDistanceReferences:=TComponentsList.Create;
try
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference, ObjectMinMaxDistanceComponentTag,{out} CL))
 then
  try
  for I:=0 to CL.Count-1 do ObjectMinMaxDistanceReferences.AddComponent(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent,0);
  finally
  CL.Destroy;
  end;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference, ObjectMinDistanceComponentTag,{out} CL))
 then
  try
  for I:=0 to CL.Count-1 do ObjectMinDistanceReferences.AddComponent(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent,0);
  finally
  CL.Destroy;
  end;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference, ObjectMaxDistanceComponentTag,{out} CL))
 then
  try
  for I:=0 to CL.Count-1 do ObjectMaxDistanceReferences.AddComponent(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent,0);
  finally
  CL.Destroy;
  end;
except
  FreeAndNil(ObjectMinDistanceReferences);
  FreeAndNil(ObjectMaxDistanceReferences);
  FreeAndNil(ObjectMinMaxDistanceReferences);
  Raise; //. =>
  end;
end;

function TCoGeoMonitorObjectFunctionality.GetObjectDistanceReferenceDoubleVarDistance(const idCoReference: integer; out Distance: double): boolean;
var
  RF: TCoReferenceFunctionality;
  idT: integer;
  idDoubleVar: integer;
begin
Result:=false;
RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(idTCoReference,idCoReference));
try
if (TComponentFunctionality(RF).QueryComponentWithTag1(idTDoubleVar, DoubleVarDistanceComponentTag,{out} idT,idDoubleVar))
 then with TDoubleVarFunctionality(TComponentFunctionality_Create(idT,idDoubleVar)) do
  try
  Distance:=Value;
  Result:=true;
  finally
  Release;
  end;
finally
RF.Release;
end;
end;

function TCoGeoMonitorObjectFunctionality.SetObjectDistanceReferenceDoubleVarDistance(const idCoReference: integer; const Distance: double): boolean;
var
  RF: TCoReferenceFunctionality;
  idT: integer;
  idDoubleVar: integer;
begin
Result:=false;
RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(idTCoReference,idCoReference));
try
if (TComponentFunctionality(RF).QueryComponentWithTag1(idTDoubleVar, DoubleVarDistanceComponentTag,{out} idT,idDoubleVar))
 then with TDoubleVarFunctionality(TComponentFunctionality_Create(idT,idDoubleVar)) do
  try
  Value:=Distance;
  Result:=true;
  finally
  Release;
  end;
finally
RF.Release;
end;
end;

procedure TCoGeoMonitorObjectFunctionality.GetReferenceComponentPrototype(out idCoReference: integer);
var
  idT: integer;
begin
if (NOT TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTCoReference, ReferenceComponentPrototypeTag,{out} idT,idCoReference)) then Raise Exception.Create('reference component prototype is not found'); //. =>
end;

procedure TCoGeoMonitorObjectFunctionality.GetReferenceComponentWithDoubleVarPrototype(out idCoReference: integer);
var
  idT: integer;
begin
if (NOT TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTCoReference, ReferenceComponentWithDoubleVarPrototypeTag,{out} idT,idCoReference)) then Raise Exception.Create('reference component with double variable prototype is not found'); //. =>
end;

function TCoGeoMonitorObjectFunctionality.AddNotificationAreaComponent(const pName: string; const idTArea,idArea: integer; const AreaType: TNotificationAreaType): integer;
var
  idCoReferencePrototype,idCoReference: integer;
  CF: TComponentFunctionality;
  CID: integer;
begin
GetReferenceComponentPrototype(idCoReferencePrototype);
TComponentFunctionality(CoComponentFunctionality).CloneAndInsertComponent(idTCoReference,idCoReferencePrototype,  {out}idCoReference,{out} CID);
CF:=TComponentFunctionality_Create(idTCoReference,idCoReference);
try
TCoReferenceFunctionality(CF).Name:=pName;
case AreaType of
natUnknown:     CF.Tag:=0;
natIn:          CF.Tag:=InNotificationAreaComponentTag;
natOut:         CF.Tag:=OutNotificationAreaComponentTag;
natInOut:       CF.Tag:=InOutNotificationAreaComponentTag;
end;
TCoReferenceFunctionality(CF).SetReferencedObject(idTArea,idArea);
//. set left and top props panel corners to undefined position
CF.SetPanelPropsLeftTop(MaxInt,MaxInt);
//. notify update operation
TComponentFunctionality(CoComponentFunctionality).NotifyOnComponentUpdate();
finally
CF.Release;
end;
Result:=idCoReference;
end;

procedure TCoGeoMonitorObjectFunctionality.RemoveNotificationAreaComponent(const idTArea,idArea: integer; const AreaType: TNotificationAreaType);
var
  _Tag: integer;
  CL: TComponentsList;
  I: integer;
  RF: TCoReferenceFunctionality;
  idTRefObj,idRefObj: integer;
begin
case AreaType of
natUnknown:   _Tag:=0;
natIn:        _Tag:=InNotificationAreaComponentTag;
natOut:       _Tag:=OutNotificationAreaComponentTag;
natInOut:     _Tag:=InOutNotificationAreaComponentTag;
else
  _Tag:=0;
end;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference, _Tag,{out} CL))
 then
  try
  for I:=0 to CL.Count-1 do begin
    RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent));
    try
    RF.GetReferencedObject(idTRefObj,idRefObj);
    if (((idTRefObj = idTArea) AND (idRefObj = idArea)) AND (TComponentFunctionality(RF).Tag = _Tag))
     then begin
      TComponentFunctionality(CoComponentFunctionality).DestroyComponent(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent);
      //. notify update operation
      TComponentFunctionality(CoComponentFunctionality).NotifyOnComponentUpdate();
      end;
    finally
    RF.Release;
    end;
    end;
  finally
  CL.Destroy;
  end;
end;

function TCoGeoMonitorObjectFunctionality.AddObjectDistanceComponent(const pName: string; const idTVisualization,idVisualization: integer; const ObjectDistanceType: TObjectDistanceType; const Distance: double): integer;
var
  idCoReferencePrototype,idCoReference: integer;
  CF: TComponentFunctionality;
  CID: integer;
  idT,idDoubleVar: integer;
begin
GetReferenceComponentWithDoubleVarPrototype(idCoReferencePrototype);
TComponentFunctionality(CoComponentFunctionality).CloneAndInsertComponent(idTCoReference,idCoReferencePrototype,  idCoReference, CID);
CF:=TComponentFunctionality_Create(idTCoReference,idCoReference);
try
TCoReferenceFunctionality(CF).Name:=pName;
case ObjectDistanceType of
odtUnknown:     CF.Tag:=0;
odtMin:         CF.Tag:=ObjectMinDistanceComponentTag;
odtMax:         CF.Tag:=ObjectMaxDistanceComponentTag;
odtMinMax:      CF.Tag:=ObjectMinMaxDistanceComponentTag;
end;
TCoReferenceFunctionality(CF).SetReferencedObject(idTVisualization,idVisualization);
if (CF.QueryComponentWithTag1(idTDoubleVar, DoubleVarDistanceComponentTag,{out} idT,idDoubleVar))
 then with TDoubleVarFunctionality(TComponentFunctionality_Create(idT,idDoubleVar)) do
  try
  Value:=Distance;
  finally
  Release;
  end;
//. set left and top props panel corners to undefined position
CF.SetPanelPropsLeftTop(MaxInt,MaxInt);
//. notify update operation
TComponentFunctionality(CoComponentFunctionality).NotifyOnComponentUpdate();
finally
CF.Release;
end;
Result:=idCoReference;
end;

procedure TCoGeoMonitorObjectFunctionality.RemoveObjectDistanceComponent(const idTVisualization,idVisualization: integer; const ObjectDistanceType: TObjectDistanceType; const Distance: double);
var
  _Tag: integer;
  CL: TComponentsList;
  I: integer;
  RF: TCoReferenceFunctionality;
  idTRefObj,idRefObj: integer;
  flToRemove: boolean;
  idT,idDoubleVar: integer;
begin
case ObjectDistanceType of
odtUnknown:     _Tag:=0;
odtMin:         _Tag:=ObjectMinDistanceComponentTag;
odtMax:         _Tag:=ObjectMaxDistanceComponentTag;
odtMinMax:      _Tag:=ObjectMinMaxDistanceComponentTag;
else
  _Tag:=0;
end;
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentsWithTag(idTCoReference, _Tag,{out} CL))
 then
  try
  for I:=0 to CL.Count-1 do begin
    RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent));
    try
    RF.GetReferencedObject(idTRefObj,idRefObj);
    if (((idTRefObj = idTVisualization) AND (idRefObj = idTVisualization)) AND (TComponentFunctionality(RF).Tag = _Tag))
     then begin
      flToRemove:=false;
      if (TComponentFunctionality(RF).QueryComponentWithTag1(idTDoubleVar, DoubleVarDistanceComponentTag,{out} idT,idDoubleVar))
       then with TDoubleVarFunctionality(TComponentFunctionality_Create(idT,idDoubleVar)) do
        try
        flToRemove:=(Value = Distance);
        finally
        Release;
        end
       else flToRemove:=true;
      if (flToRemove)
       then begin
        TComponentFunctionality(CoComponentFunctionality).DestroyComponent(TItemComponentsList(CL[I]^).idTComponent,TItemComponentsList(CL[I]^).idComponent);
        //. notify update operation
        TComponentFunctionality(CoComponentFunctionality).NotifyOnComponentUpdate();
        end;
      end;
    finally
    RF.Release;
    end;
    end;
  finally
  CL.Destroy;
  end;
end;

procedure TCoGeoMonitorObjectFunctionality.RemoveObjectDistanceComponent(const idCoReference: integer);
begin
TComponentFunctionality(CoComponentFunctionality).DestroyComponent(idTCoReference,idCoReference);
//. notify update operation
TComponentFunctionality(CoComponentFunctionality).NotifyOnComponentUpdate();
end;

function TCoGeoMonitorObjectFunctionality.getNotificationAddresses: string;
var
  idT,DescriptionID: integer;
  SL: TStringList;
begin
Result:='';
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTDescription, NotificationAddressesTag,{out} idT,DescriptionID))
 then with TDescriptionFunctionality(TComponentFunctionality_Create(idT,DescriptionID)) do
  try
  SL:=TStringList.Create();
  try
  GetValue1(SL);
  Result:=SL.Text;
  finally
  SL.Destroy();
  end;
  //. remove ending #$0D#$0A
  if (Length(Result) >= 2) then SetLength(Result,Length(Result)-2);
  finally
  Release();
  end;
end;

procedure TCoGeoMonitorObjectFunctionality.setNotificationAddresses(Value: string);
var
  idT,DescriptionID: integer;
  SL: TStringList;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponentWithTag1(idTDescription, NotificationAddressesTag,{out} idT,DescriptionID))
 then with TDescriptionFunctionality(TComponentFunctionality_Create(idT,DescriptionID)) do
  try
  SL:=TStringList.Create();
  try
  if (Value = '') then Value:=' ';
  SL.Text:=Value;
  SetValue1(SL);
  finally
  SL.Destroy();
  end;
  //. notify update operation
  TComponentFunctionality(CoComponentFunctionality).NotifyOnComponentUpdate();
  finally
  Release();
  end
 else Raise Exception.Create('no description component is found'); //. =>
end;

function TCoGeoMonitorObjectFunctionality.GetGeoGraphServerObject(out idGeoGraphServerObject: integer): boolean;
var
  idT: integer;
begin
if (TComponentFunctionality(CoComponentFunctionality).QueryComponent(idTGeoGraphServerObject, idT,idGeoGraphServerObject))
 then Result:=true
 else Result:=false;
end;

function TCoGeoMonitorObjectFunctionality.GetGeoGraphServer(out idGeoGraphServer: integer): boolean;
var
  idGeoGraphServerObject: integer;
  GSOF: TGeoGraphServerObjectFunctionality;
  _ObjectType: integer;
  _ObjectID: integer;
  _BusinessModel: integer;
begin
Result:=false;
if (NOT GetGeoGraphServerObject({out} idGeoGraphServerObject)) then Exit; //. ->
GSOF:=TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject));
try
GSOF.GetParams(idGeoGraphServer,_ObjectID,_ObjectType,_BusinessModel);
finally
GSOF.Release();
end;
Result:=true;
end;

procedure TCoGeoMonitorObjectFunctionality.GetTrackData(const pUserName: WideString; const pUserPassword: WideString; const GeoSpaceID: integer; const BeginTime: double; const EndTime: double; DataType: Integer; out Data: GlobalSpaceDefines.TByteArray);
var
  idGeoGraphServerObject: integer;
  GSOF: TGeoGraphServerObjectFunctionality;
  _GeoGraphServerID: integer;
  _ObjectType: integer;
  _ObjectID: integer;
  _BusinessModel: integer;
  MSF: TMODELServerFunctionality;
  UserID: integer;
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TObjectModel;
  ObjectBusinessModel: TBusinessModel;
  CreateObjectModelTrackEventFunc: TCreateObjectModelTrackEventFunc;
  CreateBusinessModelTrackEventFunc: TCreateBusinessModelTrackEventFunc;
  ptrNewTrack: pointer;
  ptrTrackNode: pointer;
  _X,_Y: double;
  ptrApproxNode0,ptrApproxNode1: pointer;
  ptrTrackEvent: pointer;
  F: double;
  RS: TMemoryStream;
  NodesCount: DWord;
  _TimeStamp: double;
begin
Data:=nil;
//.
TComponentFunctionality(CoComponentFunctionality).SetUser(pUserName,pUserPassword);
//.
if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
GSOF:=TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject));
try
TComponentFunctionality(GSOF).SetUser(TComponentFunctionality(CoComponentFunctionality).UserName,TComponentFunctionality(CoComponentFunctionality).UserPassword);
//.
GSOF.GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
finally
GSOF.Release();
end;
//.
if (NOT ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))) then Exit; //. ->
if ((_ObjectType = 0) OR (_BusinessModel = 0)) then Exit; //. ->
//.
MSF:=TMODELServerFunctionality(TComponentFunctionality_Create(idTMODELServer,0));
try
TComponentFunctionality(MSF).SetUser(TComponentFunctionality(CoComponentFunctionality).UserName(),TComponentFunctionality(CoComponentFunctionality).UserPassword());
//.
UserID:=MSF.GetUserID(TComponentFunctionality(MSF).UserName(),TComponentFunctionality(MSF).UserPassword());
finally
MSF.Release();
end;
ServerObjectController:=TGEOGraphServerObjectController.Create(idGeoGraphServerObject,_ObjectID,UserID,TComponentFunctionality(CoComponentFunctionality).UserPassword(),'',0,false);
//.
ObjectModel:=TObjectModel.GetModel(_ObjectType,ServerObjectController,true);
if (ObjectModel = nil) then Exit; //. ->
try
ObjectBusinessModel:=TBusinessModel.GetModel(ObjectModel,_BusinessModel);
if (ObjectBusinessModel = nil) then Exit; //. ->
try
CreateObjectModelTrackEventFunc:=ObjectModel.CreateTrackEvent;
CreateBusinessModelTrackEventFunc:=ObjectBusinessModel.CreateTrackEvent;
//.
ptrNewTrack:=ObjectModel.Log_CreateTrackByDay(BeginTime,'O'+IntToStr(idCoComponent)+'_'+FormatDateTime('YY.MM.DD_HH:NN:SS',BeginTime),clYellow,idCoComponent,CreateObjectModelTrackEventFunc,CreateBusinessModelTrackEventFunc);
if (ptrNewTrack = nil) then Exit; //. ->
try
with TGeoObjectTrack(ptrNewTrack^) do begin
//. process track nodes for new X,Y
ptrTrackNode:=Nodes;
while (ptrTrackNode <> nil) do with TObjectTrackNode(ptrTrackNode^) do begin
  //. prepare node local X,Y
  if (GeoSpace_Converter_ConvertDatumLatLongToXY(pUserName,pUserPassword, GeoSpaceID, DatumID, Latitude,Longitude,{out} _X,_Y))
   then begin
    X:=_X;
    Y:=_Y;
    end
   else begin
    X:=0.0;
    Y:=0.0;
    end;
  //. next node
  ptrTrackNode:=Next;
  end;
//. recalculating X,Y for object model events
ptrApproxNode1:=Nodes;
if (ptrApproxNode1 <> nil)
 then begin
  ptrApproxNode0:=nil;
  ptrTrackEvent:=ObjectModelEvents;
  while (ptrTrackEvent <> nil) do with TObjectTrackEvent(ptrTrackEvent^) do begin
    while (NOT ((ptrApproxNode1 = nil) OR (TimeStamp < TObjectTrackNode(ptrApproxNode1^).TimeStamp))) do begin
      ptrApproxNode0:=ptrApproxNode1;
      ptrApproxNode1:=TObjectTrackNode(ptrApproxNode1^).Next;
      end;
    if (ptrApproxNode0 = nil)
     then begin
      X:=TObjectTrackNode(ptrApproxNode1^).X;
      Y:=TObjectTrackNode(ptrApproxNode1^).Y;
      end
     else
      if (ptrApproxNode1 = nil)
       then begin
        X:=TObjectTrackNode(ptrApproxNode0^).X;
        Y:=TObjectTrackNode(ptrApproxNode0^).Y;
        end
       else begin
        if (NOT flBelongsToLastLocation)
         then begin//. linear approximation by time
          F:=(TimeStamp-TObjectTrackNode(ptrApproxNode0^).TimeStamp)/(TObjectTrackNode(ptrApproxNode1^).TimeStamp-TObjectTrackNode(ptrApproxNode0^).TimeStamp);
          X:=TObjectTrackNode(ptrApproxNode0^).X+(TObjectTrackNode(ptrApproxNode1^).X-TObjectTrackNode(ptrApproxNode0^).X)*F;
          Y:=TObjectTrackNode(ptrApproxNode0^).Y+(TObjectTrackNode(ptrApproxNode1^).Y-TObjectTrackNode(ptrApproxNode0^).Y)*F;
          end
         else begin
          X:=TObjectTrackNode(ptrApproxNode0^).X;
          Y:=TObjectTrackNode(ptrApproxNode0^).Y;
          end;
        end;
    //. next event
    ptrTrackEvent:=Next;
    end;
  end;
//. recalculating X,Y for business model events
ptrApproxNode1:=Nodes;
if (ptrApproxNode1 <> nil)
 then begin
  ptrApproxNode0:=nil;
  ptrTrackEvent:=BusinessModelEvents;
  while (ptrTrackEvent <> nil) do with TObjectTrackEvent(ptrTrackEvent^) do begin
    while (NOT ((ptrApproxNode1 = nil) OR (TimeStamp < TObjectTrackNode(ptrApproxNode1^).TimeStamp))) do begin
      ptrApproxNode0:=ptrApproxNode1;
      ptrApproxNode1:=TObjectTrackNode(ptrApproxNode1^).Next;
      end;
    if (ptrApproxNode0 = nil)
     then begin
      X:=TObjectTrackNode(ptrApproxNode1^).X;
      Y:=TObjectTrackNode(ptrApproxNode1^).Y;
      end
     else
      if (ptrApproxNode1 = nil)
       then begin
        X:=TObjectTrackNode(ptrApproxNode0^).X;
        Y:=TObjectTrackNode(ptrApproxNode0^).Y;
        end
       else begin
        if (NOT flBelongsToLastLocation)
         then begin//. linear approximation by time
          F:=(TimeStamp-TObjectTrackNode(ptrApproxNode0^).TimeStamp)/(TObjectTrackNode(ptrApproxNode1^).TimeStamp-TObjectTrackNode(ptrApproxNode0^).TimeStamp);
          X:=TObjectTrackNode(ptrApproxNode0^).X+(TObjectTrackNode(ptrApproxNode1^).X-TObjectTrackNode(ptrApproxNode0^).X)*F;
          Y:=TObjectTrackNode(ptrApproxNode0^).Y+(TObjectTrackNode(ptrApproxNode1^).Y-TObjectTrackNode(ptrApproxNode0^).Y)*F;
          end
         else begin
          X:=TObjectTrackNode(ptrApproxNode0^).X;
          Y:=TObjectTrackNode(ptrApproxNode0^).Y;
          end;
        end;
    //. next event
    ptrTrackEvent:=Next;
    end;
  end;
//.
case (DataType) of
0: begin
  RS:=TMemoryStream.Create();
  try
  NodesCount:=0;
  RS.Write(NodesCount,SizeOf(NodesCount));
  ptrTrackNode:=Nodes;
  while (ptrTrackNode <> nil) do with TObjectTrackNode(ptrTrackNode^) do begin
    _TimeStamp:=TimeStamp;
    _X:=X;
    _Y:=Y;
    RS.Write(_TimeStamp,SizeOf(_TimeStamp));
    RS.Write(_X,SizeOf(_X));
    RS.Write(_Y,SizeOf(_Y));
    //. next node
    Inc(NodesCount);
    ptrTrackNode:=Next;
    end;
  if (NodesCount > 0)
   then begin
    RS.Position:=0;
    RS.Write(NodesCount,SizeOf(NodesCount));
    end;
  SetLength(Data,RS.Size);
  Move(RS.Memory^,Pointer(@Data[0])^,Length(Data));
  finally
  RS.Destroy();
  end;
  end;
1: begin
  end;
end;
end;
with TGeoObjectTrack(ptrNewTrack^) do begin
end;
finally
ObjectModel.Log_DestroyTrack({ref} ptrNewTrack);
end;
finally
ObjectBusinessModel.Destroy();
end;
finally
ObjectModel.Destroy();
end;
end;

function TCoGeoMonitorObjectFunctionality.GetHintInfo(const pUserName: WideString; const pUserPassword: WideString; const InfoType: integer; const InfoFormat: integer; out Info: GlobalSpaceDefines.TByteArray): boolean;
var
  flProcessed: boolean;
  BusinessModel: TBusinessModel;
  flOnline,flLocationIsAvailable: boolean;
  TimeStamp: double;
  DatumID: integer;
  Latitude: double;
  Longitude: double;
  Altitude: double;
  Speed: double;
  Bearing: double;
  Precision: double;
  AlertID: integer;
  AlertSeverity: integer;
  AlertTimeStamp: TDateTime;
  Infos: string;
begin
Info:=nil;
Result:=false;
//.
case InfoType of
1: begin //. simple state+location
  BusinessModel:=GetBusinessModel(pUserName,pUserPassword);
  if (BusinessModel <> nil)
   then
    try
    Result:=BusinessModel.Object_GetHintInfo(InfoType,InfoFormat,{out} Info);
    finally
    BusinessModel.ObjectModel.Destroy();
    BusinessModel.Destroy();
    end;
  //.
  if (NOT Result)
   then begin
    flOnline:=IsOnline();
    flLocationIsAvailable:=LocationIsAvailable();
    GetUserAlertStatus({out} AlertID,AlertSeverity,AlertTimeStamp);
    case InfoFormat of
    1: begin //. txt format
      Infos:='MO: ';
      Infos:=Infos+Name+#$0D#$0A;
      Infos:=Infos+'State: '; if (flOnline) then Infos:=Infos+'Online' else Infos:=Infos+'offline'; Infos:=Infos+#$0D#$0A;
      Infos:=Infos+'Location: ';
      if (NOT flLocationIsAvailable) then Infos:=Infos+'not available'; Infos:=Infos+#$0D#$0A;
      GetLocationFix(pUserName,pUserPassword, {out} TimeStamp,{out} DatumID,Latitude,Longitude,Altitude,Speed,Bearing,Precision);
      Infos:=Infos+#$0D#$0A+'  Latitude: '+FormatFloat('0.000',Latitude)+#$0D#$0A;
      Infos:=Infos+'  Longitude: '+FormatFloat('0.000',Longitude)+#$0D#$0A;
      Infos:=Infos+'  Altitude: '+FormatFloat('0.000',Altitude)+#$0D#$0A+#$0D#$0A;
      Infos:=Infos+'  Speed: '+FormatFloat('00.0'+' Km/h',Speed)+#$0D#$0A;
      Infos:=Infos+'  Precision: '+FormatFloat('0'+' m',Precision)+#$0D#$0A;
      Infos:=Infos+'Alert: '; if (AlertSeverity > 0) then Infos:=Infos+'SIGNALLED('+IntToStr(AlertSeverity)+')' else Infos:=Infos+'none'; Infos:=Infos+#$0D#$0A;
      SetLength(Info,Length(Infos));
      if (Length(Infos) > 0) then Move(Pointer(@Infos[1])^,Pointer(@Info[0])^,Length(Infos));
      //.
      Result:=true;
      end;
    end;
    end;
  end;
end;
end;

function TCoGeoMonitorObjectFunctionality.TStatusBar_Create(const pUpdateNotificationProc: TComponentStatusBarUpdateNotificationProc): TAbstractComponentStatusBar;
begin
Result:=TCoGeoMonitorObjectStatusBar.Create(idTCoComponent,idCoComponent,pUpdateNotificationProc);
end;


{TCoGeoMonitorObjectDATA}
Constructor TCoGeoMonitorObjectDATA.Create(const AStream: TStream = nil);
begin
Inherited Create;
//.
if (AStream <> nil)
 then begin
  AStream.Position:=0;
  Self.LoadFromStream(AStream);
  GetProperties;
  end
 else ClearProperties;
end;

destructor TCoGeoMonitorObjectDATA.Destroy;
begin
Inherited;
end;

procedure TCoGeoMonitorObjectDATA.ClearProperties;
begin
ServerType:=0;
ServerID:=0;
ServerObjectID:=0;
ServerObjectType:=0;
end;

procedure TCoGeoMonitorObjectDATA.GetProperties;
var
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ServerNode,Node: IXMLDOMNode;
begin
ClearProperties;
if (Size > 0)
 then begin
  Self.Position:=0;
  OLEStream:=TStreamAdapter.Create(Self);
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(OLEStream);
  RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
  VersionNode:=RootNode.selectSingleNode('Version');
  if (VersionNode <> nil)
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Raise Exception.Create('unknown version'); //. =>
  ServerNode:=RootNode.selectSingleNode('Server');
  //.
  Node:=ServerNode.selectSingleNode('ServerType');
  ServerType:=Node.nodeTypedValue;
  //.
  Node:=ServerNode.selectSingleNode('ServerID');
  ServerID:=Node.nodeTypedValue;
  //.
  Node:=ServerNode.selectSingleNode('ServerObjectID');
  ServerObjectID:=Node.nodeTypedValue;
  //.
  Node:=ServerNode.selectSingleNode('ServerObjectType');
  ServerObjectType:=Node.nodeTypedValue;
  end;
end;

procedure TCoGeoMonitorObjectDATA.SetProperties;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  ServerNode: IXMLDOMElement;
  Node: IXMLDOMElement;
  OLEStream: IStream;
begin
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=0;
Root.appendChild(VersionNode);
ServerNode:=Doc.createElement('Server');
//.
Node:=Doc.createElement('ServerType');
Node.nodeTypedValue:=ServerType;
ServerNode.appendChild(Node);
//.
Node:=Doc.createElement('ServerID');
Node.nodeTypedValue:=ServerID;
ServerNode.appendChild(Node);
//.
Node:=Doc.createElement('ServerObjectID');
Node.nodeTypedValue:=ServerObjectID;
ServerNode.appendChild(Node);
//.
Node:=Doc.createElement('ServerObjectType');
Node.nodeTypedValue:=ServerObjectType;
ServerNode.appendChild(Node);
//.
Root.appendChild(ServerNode);
//.
Self.Size:=0;
OLEStream:=TStreamAdapter.Create(Self);
Doc.Save(OLEStream);
end;


{TCoGeoMonitorObjectStatusBar}
Destructor TCoGeoMonitorObjectStatusBar.Destroy();
begin
UserAlertComponentUpdater.Free();
LocationIsAvailableFlagComponentUpdater.Free();
OnlineFlagComponentUpdater.Free();
Inherited;
end;

procedure TCoGeoMonitorObjectStatusBar.Update();
var
  LastUpdateNotificationProc: TComponentStatusBarUpdateNotificationProc;
begin
with TCoGeoMonitorObjectFunctionality.Create(idComponent) do
try
if (GetOnlineFlagComponent({out} OnlineFlagComponentID))
 then begin
  if (NOT GetLocationIsAvailableFlagComponent(OnlineFlagComponentID,{out} LocationIsAvailableFlagComponentID))
   then LocationIsAvailableFlagComponentID:=0;
  end
 else begin                                                    
  OnlineFlagComponentID:=0;
  LocationIsAvailableFlagComponentID:=0;
  end;
if (NOT GetUserAlertComponent({out} UserAlertComponentID))
 then UserAlertComponentID:=0;
//.
LastUpdateNotificationProc:=UpdateNotificationProc;
try
UpdateNotificationProc:=nil;
//.
OnlineFlagComponentUpdate();
LocationIsAvailableFlagComponentUpdate();
UserAlertComponentUpdate();
finally
UpdateNotificationProc:=LastUpdateNotificationProc;
end;
finally
Release();
end;
//.
ValidateUpdaters();
end;

procedure TCoGeoMonitorObjectStatusBar.SaveToStream(const Stream: TMemoryStream);
var
  Version: word;
begin
Version:=1;
//.
Stream.Write(Version,SizeOf(Version));
//.
Stream.Write(OnlineFlagComponentID,SizeOf(OnlineFlagComponentID));
Stream.Write(OnlineFlag,SizeOf(OnlineFlag));
Stream.Write(LocationIsAvailableFlagComponentID,SizeOf(LocationIsAvailableFlagComponentID));
Stream.Write(LocationIsAvailableFlag,SizeOf(LocationIsAvailableFlag));
Stream.Write(UserAlertComponentID,SizeOf(UserAlertComponentID));
Stream.Write(UserAlertSeverity,SizeOf(UserAlertSeverity));
end;

function TCoGeoMonitorObjectStatusBar.LoadFromStream(const Stream: TMemoryStream): boolean;
var
  Version: word;
begin
Result:=false;
//.
Stream.Read(Version,SizeOf(Version));
//.
if (Version <> 1) then Exit; //. ->
//.
Stream.Read(OnlineFlagComponentID,SizeOf(OnlineFlagComponentID));
Stream.Read(OnlineFlag,SizeOf(OnlineFlag));
Stream.Read(LocationIsAvailableFlagComponentID,SizeOf(LocationIsAvailableFlagComponentID));
Stream.Read(LocationIsAvailableFlag,SizeOf(LocationIsAvailableFlag));
Stream.Read(UserAlertComponentID,SizeOf(UserAlertComponentID));
Stream.Read(UserAlertSeverity,SizeOf(UserAlertSeverity));
//.
ValidateUpdaters();
//.
Result:=true;
end;

function TCoGeoMonitorObjectStatusBar.Status_IsOnline(): boolean;
begin
Result:=((OnlineFlagComponentID <> 0) AND OnlineFlag);
end;

function TCoGeoMonitorObjectStatusBar.Status_LocationIsAvailable(): boolean;
begin
Result:=((LocationIsAvailableFlagComponentID <> 0) AND LocationIsAvailableFlag);
end;

procedure TCoGeoMonitorObjectStatusBar.DrawOnCanvas(const Canvas: TCanvas; const Rect: TRect; const Version: integer);
const
  OnColor = clGreen;
  OffColor = clRed;
  UnavailableColor = clGray;
  AlertColor = clRed;
  NoAlertColor = clGreen;
var
  X,StepX: double;
begin
case Version of
0: begin //. simple: 3 bars
  StepX:=(Rect.Right-Rect.Left)/3.0;
  Canvas.Pen.Color:=clBlack;
  //.
  X:=Rect.Left;
  if (OnlineFlagComponentID <> 0)
   then
    if (OnlineFlag)
     then Canvas.Brush.Color:=OnColor
     else Canvas.Brush.Color:=OffColor
   else Canvas.Brush.Color:=UnavailableColor;
  Canvas.Rectangle(Trunc(X),Rect.Top,Trunc(X+StepX),Rect.Bottom);
  //.
  X:=X+StepX;
  if ((LocationIsAvailableFlagComponentID <> 0) AND OnlineFlag)
   then
    if (LocationIsAvailableFlag)
     then Canvas.Brush.Color:=OnColor
     else Canvas.Brush.Color:=OffColor
   else Canvas.Brush.Color:=UnavailableColor;
  Canvas.Rectangle(Trunc(X),Rect.Top,Trunc(X+StepX),Rect.Bottom);
  //.
  X:=X+StepX;
  if ((UserAlertComponentID <> 0) AND OnlineFlag)
   then
    if (UserAlertFlag)
     then Canvas.Brush.Color:=AlertColor
     else Canvas.Brush.Color:=NoAlertColor
   else Canvas.Brush.Color:=UnavailableColor;
  Canvas.Rectangle(Trunc(X),Rect.Top,Trunc(X+StepX),Rect.Bottom);
  end;
end;
end;

procedure TCoGeoMonitorObjectStatusBar.ValidateUpdaters();
begin
if (OnlineFlagComponentID <> 0)
 then begin
  FreeAndNil(OnlineFlagComponentUpdater);
  OnlineFlagComponentUpdater:=TComponentPresentUpdater_Create(idTBoolVar,OnlineFlagComponentID, OnlineFlagComponentUpdate,nil);
  end;
if (LocationIsAvailableFlagComponentID <> 0)
 then begin
  FreeAndNil(LocationIsAvailableFlagComponentUpdater);
  LocationIsAvailableFlagComponentUpdater:=TComponentPresentUpdater_Create(idTBoolVar,LocationIsAvailableFlagComponentID, LocationIsAvailableFlagComponentUpdate,nil);
  end;
if (UserAlertComponentID <> 0)
 then begin
  FreeAndNil(UserAlertComponentUpdater);
  UserAlertComponentUpdater:=TComponentPresentUpdater_Create(idTUserAlert,UserAlertComponentID, UserAlertComponentUpdate,nil);
  end;
end;

procedure TCoGeoMonitorObjectStatusBar.OnlineFlagComponentUpdate();
var
  BVF: TBoolVarFunctionality;
begin
if (OnlineFlagComponentID = 0) then Exit; //. ->
with TCoGeoMonitorObjectFunctionality.Create(idComponent) do
try
BVF:=TBoolVarFunctionality(TComponentFunctionality_Create(idTBoolVar,OnlineFlagComponentID));
try
TComponentFunctionality(BVF).SetUser(TComponentFunctionality(CoComponentFunctionality).UserName,TComponentFunctionality(CoComponentFunctionality).UserPassword);
//.
OnlineFlag:=BVF.Value;
finally
BVF.Release();
end;
finally
Release();
end;
//.
if (Assigned(UpdateNotificationProc)) then UpdateNotificationProc();
end;

procedure TCoGeoMonitorObjectStatusBar.LocationIsAvailableFlagComponentUpdate();
var
  BVF: TBoolVarFunctionality;
begin
if (LocationIsAvailableFlagComponentID = 0) then Exit; //. ->
with TCoGeoMonitorObjectFunctionality.Create(idComponent) do
try
BVF:=TBoolVarFunctionality(TComponentFunctionality_Create(idTBoolVar,LocationIsAvailableFlagComponentID));
try
TComponentFunctionality(BVF).SetUser(TComponentFunctionality(CoComponentFunctionality).UserName,TComponentFunctionality(CoComponentFunctionality).UserPassword);
//.
LocationIsAvailableFlag:=BVF.Value;
finally
BVF.Release();
end;
finally
Release();
end;
//.
if (Assigned(UpdateNotificationProc)) then UpdateNotificationProc();
end;

procedure TCoGeoMonitorObjectStatusBar.UserAlertComponentUpdate();
var
  UAF: TUserAlertFunctionality;
begin
if (UserAlertComponentID = 0) then Exit; //. ->
with TCoGeoMonitorObjectFunctionality.Create(idComponent) do
try
UAF:=TUserAlertFunctionality(TComponentFunctionality_Create(idTUserAlert,UserAlertComponentID));
try
TComponentFunctionality(UAF).SetUser(TComponentFunctionality(CoComponentFunctionality).UserName,TComponentFunctionality(CoComponentFunctionality).UserPassword);
//.
UserAlertSeverity:=UAF.Severity;
UserAlertFlag:=(TUserAlertSeverity(UserAlertSeverity) in [uasMajor,uasCritical]);
finally
UAF.Release();
end;
finally
Release();
end;
//.
if (Assigned(UpdateNotificationProc)) then UpdateNotificationProc();
end;


function ConstructCoGeoMonitorObject(const BusinessModelClass: TBusinessModelClass; const pName: string; const pGeoSpaceID: integer): integer;
const
  PrototypeID = 1865;
var
  BusinessModelConstructorPanel: TBusinessModelConstructorPanel;
  TF: TTypeFunctionality;
  RegistrationServerID: integer;
  idGeoGraphServerObject: integer;
  VisualizationType: integer;
  VisualizationID: integer;
  UserAlertID: integer;
  OnlineFlagID: integer;
  LocationIsAvailableFlagID: integer;
  ObjectID: integer;
begin
Result:=0;
try
//. clone object
with TCoGeoMonitorObjectFunctionality.Create(PrototypeID) do
try
TComponentFunctionality(CoComponentFunctionality).ToClone({out} Result);
finally
Release();
end;
//. set props of new object
with TCoGeoMonitorObjectFunctionality.Create(Result) do
try
Name:=pName;
finally
Release();
end;
//. get data for registration
with TCoGeoMonitorObjectFunctionality.Create(Result) do
try
if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
GetVisualizationComponent(VisualizationType,VisualizationID);
if (NOT GetUserAlertComponent(UserAlertID)) then UserAlertID:=0;
if (GetOnlineFlagComponent(OnlineFlagID))
 then begin
  if (NOT GetLocationIsAvailableFlagComponent(OnlineFlagID, LocationIsAvailableFlagID)) then LocationIsAvailableFlagID:=0;
  end
 else begin
  OnlineFlagID:=0;
  LocationIsAvailableFlagID:=0;
  end;
finally
Release();
end;
//. get appropriate GeographServer instance for registration
TF:=TTypeFunctionality_Create(idTGeoGraphServer);
try
try
RegistrationServerID:=TTGeoGraphServerFunctionality(TF).GetInstanceForRegistration();
except
  RegistrationServerID:=0;
  end;
finally
TF.Release();
end;
//. construct and register as GeopraphServerObject
BusinessModelConstructorPanel:=BusinessModelClass.CreateConstructorPanel(Result);
try
BusinessModelConstructorPanel.Preset1(pGeoSpaceID,VisualizationType,VisualizationID,0,UserAlertID,OnlineFlagID,LocationIsAvailableFlagID);
//. registering
ObjectID:=BusinessModelConstructorPanel.Construct(RegistrationServerID,idGeoGraphServerObject);
finally
BusinessModelConstructorPanel.Destroy();
end;
except
  if (Result <> 0)
   then with TTCoGeoMonitorObjectFunctionality.Create() do
    try
    DestroyInstance(Result);
    finally
    Release();
    end;
  Raise; //. =>
  end;
end;

procedure Initialize;
begin
end;

procedure Finalize;
begin
end;


Initialization
CoGeoMonitorObjectTypeSystem:=TCoGeoMonitorObjectTypeSystem.Create(idTCoGeoMonitorObject,TCoGeoMonitorObjectFunctionality);

Finalization
CoGeoMonitorObjectTypeSystem.Free;

end.
