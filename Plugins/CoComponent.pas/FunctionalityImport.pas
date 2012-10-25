unit FunctionalityImport;
Interface
Uses
  Windows,
  SysUtils,
  Classes,
  SyncObjs,
  DB, DBClient,
  Variants,
  Controls,
  Forms,
  Graphics,
  MSXML,
  GlobalSpaceDefines;



Type
  //. Дескриптор объекта
  TObjectDescr = packed record
    idType: integer;
    idObj: integer;
  end;

Const
  //. an empty object
  nilObject: TObjectDescr = (idType: 0;idObj: 0);

  //. user component operations (tranferred from SecurityComponentOperations table)
  idCreateOperation = 1;
  idDestroyOperation = 2;
  idReadOperation = 3;
  idWriteOperation = 4;
  idCloneOperation = 5;
  idExecuteOperation = 6;
  idChangeSecurityOperation = 7;

  function ObjectIsNil(const pObj: TObjectDescr): boolean; stdcall;



Type
  TProc = procedure of object;
  TFunctionality = class;
  TFunctionalityClass = class of TFunctionality;

  TFunctionality = class
  private
    RefCount: integer;
  public
    flDATAPresented: boolean;
    BestBeforeTime: TDateTime;
    
    Constructor Create; virtual;
    Destructor Destroy; override;

    procedure UpdateDATA; virtual;
    procedure ClearDATA; virtual; 
    
    function AddRef: integer; virtual;
    function Release: integer; virtual;
    function QueryFunctionality(RequiredFunctionalityClass: TFunctionalityClass; out F: TFunctionality): boolean; virtual;
  end;

  TProxySpaceServerType = (pssClient,pssFunctional,pssAreaNotification);
  
  TProxySpace = TObject;
  TTypeSystem = TObject;
  
  EComponentNotExist = class(Exception);

  TItemComponentsList = record
    idTComponent: integer;
    idComponent: integer;
    id: integer;
  end;

  TComponentsList = class(TList)
  public
    Destructor Destroy; override;
    procedure AddComponent(const pidTComponent,pidComponent,pid: integer);
    procedure Clear;
  end;

  TComponentData = packed record
    Owner: TID;
    Name: string;
    ActualityInterval: TComponentActualityInterval;
  end;

  TComponentDatas = array of TComponentData;

  TContainerCoord = record
    Xmin,Ymin,
    Xmax,Ymax: Extended;
  end;

  TUpdateProcOfTypesSystemPresentUpdater = procedure(const idTObj,idObj: integer; const Operation: TComponentOperation) of object;
  TUpdateProcOfTypeSystemPresentUpdater = procedure(const idObj: integer; const Operation: TComponentOperation) of object;

  TTypeSystemPresentUpdater = TObject;
  TComponentPresentUpdater = TObject;
  TTypeImage = TBitmap;
  TObjectVisualization = TObject;
  TFigureWinRefl = TObject;
  TReflectionWindow = TObject;
  TWindow = TObject;
  TReflecting = TThread;
  TReflector = TForm;
  TAbstractReflector = TForm;
  TScene = TObject;
  TMeshes = TList;

  TCreateCompletionObject = class  
  public
    EditingOrCreatingObject: TObject;

    Constructor Create(const pEditingOrCreatingObject: TObject);
    procedure DoOnCreateClone(const idTClone,idClone: integer); virtual;
  end;

  TAbstractSpaceObjPanelProps = class(TForm)
  public
    Lock: TCriticalSection;
    FflFreeOnClose: boolean;
    flUpdating: boolean;

    procedure Update;
    procedure _Update; virtual; abstract;
    procedure Show;
    procedure SaveChanges; virtual; abstract;
    procedure Controls_ClearPropData; virtual; abstract;

    procedure setflFreeOnClose(Value: boolean); virtual;
    property flFreeOnClose: boolean read FflFreeOnClose write setflFreeOnClose;
  end;

  TAbstractSpaceObjPanelsProps = class(TList)
  public
  end;

  TComponentStatusBarUpdateNotificationProc = procedure of object;

  TAbstractComponentStatusBar = class
  public
    idTComponent: integer;
    idComponent: integer;
    //.
    UpdateNotificationProc: TComponentStatusBarUpdateNotificationProc;

    Constructor Create(const pidTComponent,pidComponent: integer; const pUpdateNotificationProc: TComponentStatusBarUpdateNotificationProc);
    procedure Update(); virtual; abstract;
    procedure SaveToStream(const Stream: TMemoryStream); virtual; abstract;
    function  LoadFromStream(const Stream: TMemoryStream): boolean; virtual; abstract;
    function Status_IsOnline(): boolean; virtual; abstract;
    function Status_LocationIsAvailable(): boolean; virtual; abstract;
    procedure DrawOnCanvas(const Canvas: TCanvas; const Rect: TRect; const Version: integer); virtual; abstract;
    procedure GetBitmapStream(const pWidth,pHeight: integer; const Version: integer; out BitmapStream: TMemoryStream); virtual;
  end;

  TGeoObjectTrackDecriptor = packed record //. modify with the same in unitObjectModel
    ObjectName: string;
    ObjectDomain: string;
    ptrTrack: pointer;
  end;

  TGeoObjectTrackDecriptors = array of TGeoObjectTrackDecriptor;

  {$I FunctionalityImportInterface.inc}


  //. system routines
  procedure SynchronizeMethodWithMainThread(const CallingThread: TThread; Method: TThreadMethod); stdcall;
  //.
  procedure ProxySpace__Plugins_Add(const PluginFileName: string); stdcall;
  procedure ProxySpace__Plugins_Remove(const PluginHandle: THandle); stdcall;
  //. proxy-space EventLog routines
  procedure ProxySpace__Log_OperationStarting(const strOperation: shortstring); stdcall;
  procedure ProxySpace__Log_OperationProgress(const Percent: integer); stdcall;
  procedure ProxySpace__Log_OperationDone; stdcall;
  procedure ProxySpace__EventLog_WriteInfoEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0); stdcall;
  procedure ProxySpace__EventLog_WriteMinorEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0); stdcall;
  procedure ProxySpace__EventLog_WriteMajorEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0); stdcall;
  procedure ProxySpace__EventLog_WriteCriticalEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0); stdcall;
  procedure ProxySpace__EventLog_WriteQoSValue(const Value: double); stdcall;
  //. proxy-space routines
  function ProxySpace_SOAPServerURL: WideString; stdcall;
  function ProxySpace_SpacePackID: integer; stdcall;
  function ProxySpace_UserID: integer; stdcall;
  function ProxySpace_UserName: WideString; stdcall;
  function ProxySpace_UserPassword: WideString; stdcall;
  function ProxySpace_ProxySpaceServerType: TProxySpaceServerType; stdcall;
  function ProxySpace_ProxySpaceServerProfile: pointer; stdcall;
  function ProxySpace__Context_flLoaded(): boolean; stdcall;
  function ProxySpace_GetCurrentUserProfile: string; stdcall;
  procedure ProxySpace_StayUpToDate; stdcall;
  //. proxy-space Obj routines
  function ProxySpace__Obj_Ptr(const idTObj,idObj: integer): integer; stdcall;
  function ProxySpace__Obj_IDType(ptrObj: TPtr): integer; stdcall;
  function ProxySpace__Obj_ID(ptrObj: TPtr): integer; stdcall;
  function ProxySpace__Obj_GetMinMax(var minX,minY,maxX,maxY: Extended; const ptrSelf: TPtr): boolean; stdcall;
  function ProxySpace__Obj_ObjIsVisibleInside(const ptrAnObj: TPtr; const ptrSelf: TPtr): boolean; stdcall;
  procedure ProxySpace__Obj_GetLaysOfVisibleObjectsInside(const ptrSelf: TPtr; out ptrLays: pointer); stdcall;
  function ProxySpace__Obj_GetCenter(var Xc,Yc: Extended; const ptrSelf: TPtr): boolean; stdcall;
  function ProxySpace__Obj_GetFirstNode(const ptrObj: TPtr; out Node: TPoint): boolean; stdcall; 
  function ProxySpace__Obj_GetRootPtr(ptrObj: TPtr): TPtr; stdcall;
  //. proxy-space types-system routines
  function ProxySpace__TypesSystem_GetClipboardComponent(out idTComponent,idComponent: integer): boolean; stdcall;
  procedure ProxySpace__TypesSystem_SetClipboardComponent(const idTComponent,idComponent: integer); stdcall;
  function ProxySpace___TypesSystem__Reflector_ID: integer; stdcall;
  procedure ProxySpace___TypesSystem__Reflector_ShowObjAtCenter(const ptrObj: TPtr); stdcall;
  function ProxySpace___TypesSystem__Reflector_GetObjectEditorSelectedHandle: integer; stdcall;
  procedure ProxySpace___TypesSystem__Reflector_SetVisualizationForEditingInSputink(const idTVisualization,idVisualization: integer); stdcall;
  procedure ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItem(const idTVisualization,idVisualization: integer; const pName: string); stdcall;
  procedure ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItemDialog(const idTVisualization,idVisualization: integer; const pName: string); stdcall;
  procedure ProxySpace____TypesSystem___Reflector__ElectedObjects_AddNewItem(const pidType: integer; const pidObj: integer; const pObjectName: string); stdcall;
  procedure ProxySpace____TypesSystem___Reflector__GeoSpace_ShowPanel(); stdcall;
  procedure ProxySpace____TypesSystem___Reflector__GeoSpace_HidePanel(); stdcall;
  function ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_AddNewTrackFromGeoDataStream(const GeoDataStream: TMemoryStream; const GeoDataDatumID: integer; const pTrackName: string; const pTrackColor: TColor; const TrackCoComponentID: integer): pointer; stdcall;
  procedure ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_InsertTrack(const ptrTrack: pointer); stdcall;
  procedure ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_RemoveTrack(const ptrRemoveTrack: pointer); stdcall;
  function ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_GetTrackPanel(const ptrTrack: pointer; const PositionTime: TDateTime): TForm; stdcall;
  function ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_CreatePanel(const pCoComponentID: integer; const Parent: TWinControl): TForm; stdcall;
  procedure ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_FreePanel(var Panel: TForm); stdcall;
  procedure ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_UpdatePanel(const Panel: TForm); stdcall;
  //. proxy-space updates notification subscription routines
  function ProxySpace__NotificationSubscription_AddComponent(const pidTComponent: integer; const pidComponent: integer): boolean; stdcall;
  procedure ProxySpace__NotificationSubscription_RemoveComponent(const pidTComponent: integer; const pidComponent: integer); stdcall;
  function ProxySpace__NotificationSubscription_AddWindow(const pX0,pY0,pX1,pY1,pX2,pY2,pX3,pY3: double; const pName: shortstring): boolean; stdcall;
  procedure ProxySpace__NotificationSubscription_RemoveWindow(const pName: shortstring); stdcall;
  //. Functionality creators
  function TTypeFunctionality_Create(const idType: integer): TTypeFunctionality; stdcall;
  function TComponentFunctionality_Create(const idTObj,idObj: integer): TComponentFunctionality; stdcall;
  //.
  function GeoSpace_Converter_ConvertLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): boolean; stdcall;
  function GeoSpace_Converter_ConvertDatumLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; DatumID: integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): boolean; stdcall;
  //.
  procedure GeoCoder_LatLongToNearestObjects(const GeoCoderID: integer; const DatumID: integer; const Lat,Long: Extended; out ObjectsNames: string); stdcall;
  procedure GeoCoder_NearestObjectLatLong(const GeoCoderID: integer; const ObjectName: string; out Locations: TMemoryStream); stdcall;
  //.
  procedure GeoObjectTrack_Decode(const ptrTrack: pointer); stdcall;
  //.
  function GeoObjectTracks_GetReportPanel(var TrackDecriptors: TGeoObjectTrackDecriptors; const ReportName: string): TForm; stdcall;
  //. Updaters creators
  function TTypeSystemPresentUpdater_Create(const idType: integer; pUpdateProc: TUpdateProcOfTypeSystemPresentUpdater): TTypeSystemPresentUpdater; stdcall;
  function TComponentPresentUpdater_Create(const idTObj,idObj: integer; pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater; stdcall;
  function ProxySpace__TSpaceWindowUpdater_Create(const pXmin,pYmin,pXmax,pYmax: double): TObject; stdcall;
  //.
  function ObjectIsInheritedFrom(Obj: TObject; IC: TClass): boolean;
  function FunctionalityIsInheritedFrom(Functionality: TFunctionality; IC: TClass): boolean;


Type
  TStringOrientedTTFVisualization = shortstring;
  TTransforMatrix = array[0..3,0..3] of Extended;
  TNodesApproximator = TObject;
  TRouteNodesList = TList;
  TStringTTFVisualization = shortstring;
  TMRKVisualizationAlign = (mvaLT,mvaTC,mvaTR,mvaRC,mvaRB,mvaBC,mvaBL,mvaLC,mvaC);
Type
  TImageDATAType = (idtBMP,idtJPG,idtGIF);
Const
  ImagesDATATypesFilesExtensions: array[TImageDATAType] of string = ('bmp','jpg','gif');
Type
  TTextureDATAType = (tdtBMP,tdtJPG,tdtGIF);
Const
  TexturesDATATypesFilesExtensions: array[TTextureDATAType] of string = ('bmp','jpg','gif');
Type
  TMODELUSerClientProgram  = (
      mucpSOAPClient = 1,
      mucpCSharpSOAPClient = 2,
      mucpModel1GeoLogAndroidClient = 3,
      mucpModel2TrackLogger1Client = 4,
      mucpModel2GeoLogAndroidClient = 5
  );

Type
  TAbonentKind = (
    akNormal,   // не спаренный
    akSparedA,  // спаренный A
    akSparedB,  // спаренный B
    akBlockA,   // спаренный через блокиратор A
    akBlockB);  // спаренный через блокиратор B
Const
  TAbonentKindStrings: array[TAbonentKind] of string = (
    'основной',
    'спаренный А',
    'спаренный Б',
    'блок. А',
    'блок. Б'
  );


  {$I TypesFunctionalityImportInterface.inc}


Type
    THintVisualizationDATA = class(TMemoryStream) //. transferred form TypesFunctionality.pas
    private
      InfoStringFontDefaultName: string;
      InfoStringFontDefaultSize: integer;
      InfoStringFontDefaultColor: TColor;
      InfoTextFontDefaultName: string;
      InfoTextFontDefaultSize: integer;
      InfoTextFontDefaultColor: TColor;
    public
      InfoString: string;
      InfoStringFontName: string;
      InfoStringFontSize: integer;
      InfoStringFontColor: TColor;
      InfoText: string;
      InfoTextFontName: string;
      InfoTextFontSize: integer;
      InfoTextFontColor: TColor;
      InfoComponent: TID;
      StatusInfoText: ANSIString;
      Transparency: integer;

      Constructor Create(const AStream: TStream = nil);
      Destructor Destroy; override;
      procedure ClearProperties;
      procedure GetProperties;
      procedure SetProperties;
    end;

Implementation
Uses
  Math,
  ActiveX;



//. system routines
procedure SynchronizeMethodWithMainThread(const CallingThread: TThread; Method: TThreadMethod); stdcall; external TypesDll;
//.
procedure ProxySpace__Plugins_Add(const PluginFileName: string); stdcall; external TypesDll;
procedure ProxySpace__Plugins_Remove(const PluginHandle: THandle); stdcall; external TypesDll;
//. proxy-space EventLog routines
procedure ProxySpace__Log_OperationStarting(const strOperation: shortstring); stdcall; external TypesDll;
procedure ProxySpace__Log_OperationProgress(const Percent: integer); stdcall; external TypesDll;
procedure ProxySpace__Log_OperationDone; stdcall; external TypesDll;
procedure ProxySpace__EventLog_WriteInfoEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0); stdcall; external TypesDll;
procedure ProxySpace__EventLog_WriteMinorEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0); stdcall; external TypesDll;
procedure ProxySpace__EventLog_WriteMajorEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0); stdcall; external TypesDll;
procedure ProxySpace__EventLog_WriteCriticalEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0); stdcall; external TypesDll;
procedure ProxySpace__EventLog_WriteQoSValue(const Value: double); stdcall; external TypesDll;
//. proxy-space routines
function ProxySpace_SOAPServerURL: WideString; stdcall; external TypesDll;
function ProxySpace_SpacePackID: integer; stdcall; external TypesDll;
function ProxySpace_UserID: integer; stdcall; external TypesDll;
function ProxySpace_UserName: WideString; stdcall; external TypesDll;
function ProxySpace_UserPassword: WideString; stdcall; external TypesDll;
function ProxySpace_ProxySpaceServerType: TProxySpaceServerType; stdcall; external TypesDll;
function ProxySpace_ProxySpaceServerProfile: pointer; stdcall; external TypesDll;
function ProxySpace__Context_flLoaded(): boolean; stdcall; external TypesDll;
function ProxySpace_GetCurrentUserProfile: string; stdcall; external TypesDll;
procedure ProxySpace_StayUpToDate; stdcall; external TypesDll;
//. proxy-space Obj routines
function ProxySpace__Obj_Ptr(const idTObj,idObj: integer): integer; stdcall; external TypesDll;
function ProxySpace__Obj_IDType(ptrObj: TPtr): integer; stdcall; external TypesDll;
function ProxySpace__Obj_ID(ptrObj: TPtr): integer; stdcall; external TypesDll;
function ProxySpace__Obj_GetMinMax(var minX,minY,maxX,maxY: Extended; const ptrSelf: TPtr): boolean; stdcall; external TypesDll;
function ProxySpace__Obj_GetCenter(var Xc,Yc: Extended; const ptrSelf: TPtr): boolean; stdcall; external TypesDll;
function ProxySpace__Obj_GetFirstNode(const ptrObj: TPtr; out Node: TPoint): boolean; stdcall; external TypesDll;
function ProxySpace__Obj_ObjIsVisibleInside(const ptrAnObj: TPtr; const ptrSelf: TPtr): boolean; stdcall; external TypesDll;
procedure ProxySpace__Obj_GetLaysOfVisibleObjectsInside(const ptrSelf: TPtr; out ptrLays: pointer); stdcall; external TypesDll;
function ProxySpace__Obj_GetRootPtr(ptrObj: TPtr): TPtr; stdcall; external TypesDll;
//. proxy-space types-system routines
function ProxySpace__TypesSystem_GetClipboardComponent(out idTComponent,idComponent: integer): boolean; stdcall; external TypesDll;
procedure ProxySpace__TypesSystem_SetClipboardComponent(const idTComponent,idComponent: integer); stdcall; external TypesDll;
function ProxySpace___TypesSystem__Reflector_ID: integer; stdcall; external TypesDll;
procedure ProxySpace___TypesSystem__Reflector_ShowObjAtCenter(const ptrObj: TPtr); stdcall; external TypesDll;
function ProxySpace___TypesSystem__Reflector_GetObjectEditorSelectedHandle: integer; stdcall; external TypesDll;
procedure ProxySpace___TypesSystem__Reflector_SetVisualizationForEditingInSputink(const idTVisualization,idVisualization: integer); stdcall; external TypesDll;
procedure ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItem(const idTVisualization,idVisualization: integer; const pName: string); stdcall; external TypesDll;
procedure ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItemDialog(const idTVisualization,idVisualization: integer; const pName: string); stdcall; external TypesDll;
procedure ProxySpace____TypesSystem___Reflector__ElectedObjects_AddNewItem(const pidType: integer; const pidObj: integer; const pObjectName: string); stdcall; external TypesDll;
procedure ProxySpace____TypesSystem___Reflector__GeoSpace_ShowPanel(); stdcall; external TypesDll;
procedure ProxySpace____TypesSystem___Reflector__GeoSpace_HidePanel(); stdcall; external TypesDll;
function ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_AddNewTrackFromGeoDataStream(const GeoDataStream: TMemoryStream; const GeoDataDatumID: integer; const pTrackName: string; const pTrackColor: TColor; const TrackCoComponentID: integer): pointer; stdcall; external TypesDll;
procedure ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_InsertTrack(const ptrTrack: pointer); stdcall; external TypesDll;
procedure ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_RemoveTrack(const ptrRemoveTrack: pointer); stdcall; external TypesDll;
function ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_GetTrackPanel(const ptrTrack: pointer; const PositionTime: TDateTime): TForm; stdcall; external TypesDll;
function ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_CreatePanel(const pCoComponentID: integer; const Parent: TWinControl): TForm; stdcall; external TypesDll;
procedure ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_FreePanel(var Panel: TForm); stdcall; external TypesDll;
procedure ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_UpdatePanel(const Panel: TForm); stdcall; external TypesDll;
//. proxy-space updates notification subscription routines
function ProxySpace__NotificationSubscription_AddComponent(const pidTComponent: integer; const pidComponent: integer): boolean; stdcall; external TypesDll;
procedure ProxySpace__NotificationSubscription_RemoveComponent(const pidTComponent: integer; const pidComponent: integer); stdcall; external TypesDll;
function ProxySpace__NotificationSubscription_AddWindow(const pX0,pY0,pX1,pY1,pX2,pY2,pX3,pY3: double; const pName: shortstring): boolean; stdcall; external TypesDll;
procedure ProxySpace__NotificationSubscription_RemoveWindow(const pName: shortstring); stdcall; external TypesDll;
//. Functionality creators
function TTypeFunctionality_Create(const idType: integer): TTypeFunctionality; stdcall; external TypesDll;
function TComponentFunctionality_Create(const idTObj,idObj: integer): TComponentFunctionality; stdcall; external TypesDll;
//.
function GeoSpace_Converter_ConvertLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): boolean; stdcall; external TypesDll;
function GeoSpace_Converter_ConvertDatumLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; DatumID: integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): boolean; stdcall; external TypesDll;
//.
procedure GeoCoder_LatLongToNearestObjects(const GeoCoderID: integer; const DatumID: integer; const Lat,Long: Extended; out ObjectsNames: string); stdcall; external TypesDll;
procedure GeoCoder_NearestObjectLatLong(const GeoCoderID: integer; const ObjectName: string; out Locations: TMemoryStream); stdcall; external TypesDll;
//.
procedure GeoObjectTrack_Decode(const ptrTrack: pointer); stdcall; external TypesDll;
//.
function GeoObjectTracks_GetReportPanel(var TrackDecriptors: TGeoObjectTrackDecriptors; const ReportName: string): TForm; stdcall; external TypesDll;
//. Updaters creators
function TTypeSystemPresentUpdater_Create(const idType: integer; pUpdateProc: TUpdateProcOfTypeSystemPresentUpdater): TTypeSystemPresentUpdater; stdcall; external TypesDll;
function TComponentPresentUpdater_Create(const idTObj,idObj: integer; pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater; stdcall; external TypesDll;
function ProxySpace__TSpaceWindowUpdater_Create(const pXmin,pYmin,pXmax,pYmax: double): TObject; stdcall; external TypesDll;




function ObjectIsInheritedFrom(Obj: TObject; IC: TClass): boolean;
var
  FC: TClass;
begin
Result:=false;
FC:=Obj.ClassType;
while FC <> nil do begin
  if FC.ClassName = IC.ClassName
   then begin
    Result:=true;
    Exit; //. ->
    end;
  FC:=FC.ClassParent;
  end;
end;

function FunctionalityIsInheritedFrom(Functionality: TFunctionality; IC: TClass): boolean;
begin
Result:=ObjectIsInheritedFrom(Functionality,IC);
end;


Function ObjectIsNil(const pObj: TObjectDescr): boolean; stdcall;
begin
Result:=((pObj.idType = 0) OR (pObj.idObj = 0));
end;


{TFunctionality}
Constructor TFunctionality.Create;
begin
Inherited Create;
flDATAPresented:=false;
BestBeforeTime:=MaxDouble;
RefCount:=1;
end;

Destructor TFunctionality.Destroy;
begin
ClearDATA;
Inherited;
end;

procedure TFunctionality.UpdateDATA;
begin
ClearDATA;
flDATAPresented:=true;
end;

procedure TFunctionality.ClearDATA;
begin
flDATAPresented:=false;
end;

function TFunctionality.AddRef: integer;
begin
Inc(RefCount);
Result:=RefCount;
end;

function TFunctionality.Release: integer;
begin    
if (Self = nil) then Exit; //. ->
Dec(RefCount);
if (RefCount = 0)
 then begin Destroy; Result:=0 end
 else Result:=RefCount;
end;

function TFunctionality.QueryFunctionality(RequiredFunctionalityClass: TFunctionalityClass; out F: TFunctionality): boolean;
begin
Result:=false;
F:=nil;
end;


{TComponentsList}
Destructor TComponentsList.Destroy;
begin
Clear;
Inherited;
end;

procedure TComponentsList.AddComponent(const pidTComponent,pidComponent,pid: integer);
var
  ptrNewItem: pointer;
begin
GetMem(ptrNewItem,SizeOf(TItemComponentsList));
with TItemComponentsList(ptrNewItem^) do begin
idTComponent:=pidTComponent;
idComponent:=pidComponent;
id:=pid;
end;
Add(ptrNewItem);
end;

procedure TComponentsList.Clear;
var
  I: integer;
begin
for I:=0 to Count-1 do FreeMem(Items[I],SizeOf(TItemComponentsList));
Inherited Clear;
end;



{TCreateCompletionObject}
Constructor TCreateCompletionObject.Create(const pEditingOrCreatingObject: TObject);
begin
Inherited Create();
EditingOrCreatingObject:=pEditingOrCreatingObject;
end;

procedure TCreateCompletionObject.DoOnCreateClone(const idTClone,idClone: integer);
begin
end;


{TAbstractSpaceObjPanelProps}
procedure TAbstractSpaceObjPanelProps.Update;
begin
try
if Lock <> nil then Lock.Enter;
try
flUpdating:=true;
try
_Update;
finally
flUpdating:=false;
end;
finally
if Lock <> nil then Lock.Leave;
end;
except
  end;
end;

procedure TAbstractSpaceObjPanelProps.setflFreeOnClose(Value: boolean);
begin
FflFreeOnClose:=Value;
end;

procedure TAbstractSpaceObjPanelProps.Show;
begin
Inherited Show;
end;


{TAbstractComponentStatusBar}
Constructor TAbstractComponentStatusBar.Create(const pidTComponent,pidComponent: integer; const pUpdateNotificationProc: TComponentStatusBarUpdateNotificationProc);
begin
Inherited Create();
idTComponent:=pidTComponent;
idComponent:=pidComponent;
UpdateNotificationProc:=pUpdateNotificationProc;
end;

procedure TAbstractComponentStatusBar.GetBitmapStream(const pWidth,pHeight: integer; const Version: integer; out BitmapStream: TMemoryStream);
begin
BitmapStream:=TMemoryStream.Create();
try
with TBitmap.Create() do
try
Canvas.Lock();
try
Width:=pWidth;
Height:=pHeight;
//.
DrawOnCanvas(Canvas, Classes.Rect(0,0,pWidth,pHeight), Version);
finally
Canvas.Unlock();
end;
//.
SaveToStream(BitmapStream);
BitmapStream.Position:=0;
finally
Destroy();
end;
except
  FreeAndNil(BitmapStream);
  //.
  Raise; //. =>
  end;
end;


{$I FunctionalityImportImplementation.inc}

{$I TypesFunctionalityImportImplementation.inc}


{THintVisualizationDATA}
Constructor THintVisualizationDATA.Create(const AStream: TStream = nil);
begin
Inherited Create;
InfoStringFontDefaultName:='Tahoma';
InfoStringFontDefaultSize:=12;
InfoStringFontDefaultColor:=clWhite;
InfoTextFontDefaultName:='Arial';
InfoTextFontDefaultSize:=10;
InfoTextFontDefaultColor:=clGray;
//.
if (AStream <> nil)
 then begin
  AStream.Position:=0;
  Self.LoadFromStream(AStream);
  GetProperties;
  end
 else ClearProperties;
end;

destructor THintVisualizationDATA.Destroy;
begin
Inherited;
end;

procedure THintVisualizationDATA.ClearProperties;
begin
StatusInfoText:='';
InfoString:='';
InfoText:='';
InfoStringFontName:=InfoStringFontDefaultName;
InfoStringFontSize:=InfoStringFontDefaultSize;
InfoStringFontColor:=InfoStringFontDefaultColor;
InfoTextFontName:=InfoTextFontDefaultName;
InfoTextFontSize:=InfoTextFontDefaultSize;
InfoTextFontColor:=InfoTextFontDefaultColor;
with InfoComponent do begin
idType:=0;
idObj:=0;
end;
Transparency:=0;
end;

procedure THintVisualizationDATA.GetProperties;
var
  OLEStream: IStream;
  Doc: IXMLDOMDocument;
  RootNode: IXMLDOMNode;
  VersionNode: IXMLDOMNode;
  Version: integer;
  InfoNode: IXMLDOMNode;
  StatusInfoNode: IXMLDOMNode;
  FontNode: IXMLDOMNode;
  Node: IXMLDOMNode;
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
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Raise Exception.Create('unknown version'); //. =>
  InfoNode:=RootNode.selectSingleNode('Info');
  Node:=InfoNode.selectSingleNode('String');
  if (Node <> nil)
   then begin
    InfoString:=Node.selectSingleNode('Chars').nodeTypedValue;
    FontNode:=Node.selectSingleNode('Font');
    if (FontNode <> nil)
     then begin
      Node:=FontNode.selectSingleNode('Name');
      if (Node <> nil) then InfoStringFontName:=Node.nodeTypedValue;
      Node:=FontNode.selectSingleNode('Size');
      if (Node <> nil) then InfoStringFontSize:=Node.nodeTypedValue;
      Node:=FontNode.selectSingleNode('Color');
      if (Node <> nil) then InfoStringFontColor:=Node.nodeTypedValue;
      end;
    end;
  Node:=InfoNode.selectSingleNode('Text');
  if (Node <> nil)
   then begin
    InfoText:=Node.selectSingleNode('Chars').nodeTypedValue;
    FontNode:=Node.selectSingleNode('Font');
    if (FontNode <> nil)
     then begin
      Node:=FontNode.selectSingleNode('Name');
      if (Node <> nil) then InfoTextFontName:=Node.nodeTypedValue;
      Node:=FontNode.selectSingleNode('Size');
      if (Node <> nil) then InfoTextFontSize:=Node.nodeTypedValue;
      Node:=FontNode.selectSingleNode('Color');
      if (Node <> nil) then InfoTextFontColor:=Node.nodeTypedValue;
      end;
    end;
  Node:=InfoNode.selectSingleNode('Component');
  if (Node <> nil)
   then begin
    InfoComponent.idType:=Node.selectSingleNode('idType').nodeTypedValue;
    InfoComponent.idObj:=Node.selectSingleNode('ID').nodeTypedValue;
    end;
  StatusInfoNode:=RootNode.selectSingleNode('StatusInfo');
  if (StatusInfoNode <> nil)
   then begin
    Node:=StatusInfoNode.selectSingleNode('Text');
    if (Node <> nil) then StatusInfoText:=Node.nodeTypedValue;
    end;
  Node:=RootNode.selectSingleNode('Transparency');
  if (Node <> nil) then Transparency:=Node.nodeTypedValue;
  end;
end;

procedure THintVisualizationDATA.SetProperties;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  InfoNode: IXMLDOMElement;
  InfoStringNode: IXMLDOMElement;
  InfoStringCharsNode: IXMLDOMElement;
  InfoStringFontNode: IXMLDOMElement;
  InfoStringFontNameNode: IXMLDOMElement;
  InfoStringFontSizeNode: IXMLDOMElement;
  InfoStringFontColorNode: IXMLDOMElement;
  InfoTextNode: IXMLDOMElement;
  InfoTextCharsNode: IXMLDOMElement;
  InfoTextFontNode: IXMLDOMElement;
  InfoTextFontNameNode: IXMLDOMElement;
  InfoTextFontSizeNode: IXMLDOMElement;
  InfoTextFontColorNode: IXMLDOMElement;
  InfoComponentNode: IXMLDOMElement;
  InfoComponentIDTypeNode: IXMLDOMElement;
  InfoComponentIDNode: IXMLDOMElement;
  StatusInfoNode: IXMLDOMElement;
  StatusInfoTextNode: IXMLDOMElement;
  TransparencyNode: IXMLDOMElement;
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
InfoNode:=Doc.createElement('Info');
Root.appendChild(InfoNode);
if (InfoString <> '')
 then begin
  InfoStringNode:=Doc.createElement('String');
    InfoStringCharsNode:=Doc.createElement('Chars');
    InfoStringCharsNode.nodeTypedValue:=InfoString;
    InfoStringNode.appendChild(InfoStringCharsNode);
  if ((InfoStringFontName <> InfoStringFontDefaultName) OR (InfoStringFontSize <> InfoStringFontDefaultSize) OR (InfoStringFontColor <> InfoStringFontDefaultColor))
   then begin
    InfoStringFontNode:=Doc.createElement('Font');
    if (InfoStringFontName <> InfoStringFontDefaultName)
     then begin
      InfoStringFontNameNode:=Doc.createElement('Name');
      InfoStringFontNameNode.nodeTypedValue:=InfoStringFontName;
      InfoStringFontNode.appendChild(InfoStringFontNameNode);
      end;
    if (InfoStringFontSize <> InfoStringFontDefaultSize)
     then begin
      InfoStringFontSizeNode:=Doc.createElement('Size');
      InfoStringFontSizeNode.nodeTypedValue:=InfoStringFontSize;
      InfoStringFontNode.appendChild(InfoStringFontSizeNode);
      end;
    if (InfoStringFontColor <> InfoStringFontDefaultColor)
     then begin
      InfoStringFontColorNode:=Doc.createElement('Color');
      InfoStringFontColorNode.nodeTypedValue:=InfoStringFontColor;
      InfoStringFontNode.appendChild(InfoStringFontColorNode);
      end;
    InfoStringNode.appendChild(InfoStringFontNode);
    end;
  InfoNode.appendChild(InfoStringNode);
  end;
if (InfoText <> '')
 then begin
  InfoTextNode:=Doc.createElement('Text');
    InfoTextCharsNode:=Doc.createElement('Chars');
    InfoTextCharsNode.nodeTypedValue:=InfoText;
    InfoTextNode.appendChild(InfoTextCharsNode);
  if ((InfoTextFontName <> InfoTextFontDefaultName) OR (InfoTextFontSize <> InfoTextFontDefaultSize) OR (InfoTextFontColor <> InfoTextFontDefaultColor))
   then begin
    InfoTextFontNode:=Doc.createElement('Font');
    if (InfoTextFontName <> InfoTextFontDefaultName)
     then begin
      InfoTextFontNameNode:=Doc.createElement('Name');
      InfoTextFontNameNode.nodeTypedValue:=InfoTextFontName;
      InfoTextFontNode.appendChild(InfoTextFontNameNode);
      end;
    if (InfoTextFontSize <> InfoTextFontDefaultSize)
     then begin
      InfoTextFontSizeNode:=Doc.createElement('Size');
      InfoTextFontSizeNode.nodeTypedValue:=InfoTextFontSize;
      InfoTextFontNode.appendChild(InfoTextFontSizeNode);
      end;
    if (InfoTextFontColor <> InfoTextFontDefaultColor)
     then begin
      InfoTextFontColorNode:=Doc.createElement('Color');
      InfoTextFontColorNode.nodeTypedValue:=InfoTextFontColor;
      InfoTextFontNode.appendChild(InfoTextFontColorNode);
      end;
    InfoTextNode.appendChild(InfoTextFontNode);
    end;
  InfoNode.appendChild(InfoTextNode);
  end;
if (InfoComponent.idObj <> 0)
 then begin
  InfoComponentNode:=Doc.createElement('Component');
    InfoComponentIDTypeNode:=Doc.createElement('idType');
    InfoComponentIDTypeNode.nodeTypedValue:=InfoComponent.idType;
    InfoComponentNode.appendChild(InfoComponentIDTypeNode);
    InfoComponentIDNode:=Doc.createElement('ID');
    InfoComponentIDNode.nodeTypedValue:=InfoComponent.idObj;
    InfoComponentNode.appendChild(InfoComponentIDNode);
  InfoNode.appendChild(InfoComponentNode);
  end;
if (StatusInfoText <> '')
 then begin
  StatusInfoNode:=Doc.createElement('StatusInfo');
  StatusInfoTextNode:=Doc.createElement('Text');
  StatusInfoTextNode.nodeTypedValue:=StatusInfoText;
  StatusInfoNode.appendChild(StatusInfoTextNode);
  Root.appendChild(StatusInfoNode);
  end;
if (Transparency <> 0)
 then begin
  TransparencyNode:=Doc.createElement('Transparency');
  TransparencyNode.nodeTypedValue:=Transparency;
  Root.appendChild(TransparencyNode);
  end;
//.
Self.Size:=0;
OLEStream:=TStreamAdapter.Create(Self);
Doc.Save(OLEStream);
end;


Initialization
DecimalSeparator:='.';

Finalization

end.
