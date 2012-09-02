{*******************************************************}
{                                                       }
{                 "Virtual Town" project                }
{                                                       }
{               Copyright (c) 1998-2011 PAS             }
{                                                       }
{Authors: Alex Ponomarev <AlxPonom@mail.ru>             }
{                                                       }
{  This program is free software under the GPL (>= v2)  }
{ Read the file COPYING coming with project for details }
{*******************************************************}

unit unitProxySpace;
interface

Uses
  UnitLinearMemory, unitEventLog, SysUtils, StrUtils, Classes, Math, Controls, Forms, SyncObjs, Windows, Messages, 
  ShellAPI,ComObj,StdVCL,Graphics,DB,DBTables, ActiveX, WinSock, MSXML, SOAPHTTPTrans,
  ZLib, AbUtils, AbArcTyp, AbZipTyp, AbZipPrc, AbUnzPrc,
  DBClient, Variants, Registry, DateUtils, GlobalSpaceDefines, Extctrls, Midas, unitIDsCach,
  FunctionalitySOAPInterface,
  unitConfiguration, unitLog,
  unitProxySpaceControlPanel;

const
  Localization = 'EN';
  //.
  PathLib = 'Lib';
  PathLog = 'Log';
  PathDesigner = 'PanelPropsDesigner';
  PathTempDATA = 'TempDATA';
  ClearTempDATAProc = 'ClearTempDATA.bat';
  PathContexts = 'CONTEXTs';
  ContextFileName = 'Context.xml';
  SUMMARYUserContextFolder = 'SUMMARY';
  PathProfiles = 'PROFILEs';
  DefaultProfile = 'PROFILEs\DEFAULT';
  ServerUserProxySpaceProfiles = 'PROFILEs\ProxySpaces'; 
  SpaceIncreaseDelta = 1024000;
  //.
  User_ReflectSpaceWindow_PoolSize = 20;
  User_SpaceWindow_CachingObjectsPortion = 1024;


Type
  TProxySpace = class;

  TProxySpaceStatus = (pssNormal,pssNormalDisconnected,pssRemoted,pssRemotedBrief);
  TProxySpaceState = (psstCreating,psstDestroying,psstWorking);

  TProcedureOfObject = procedure of object;

  TProxySpaceConfiguration = class
  private
    Space: TProxySpace;

    procedure UpdateBySpace();
  public
    flComponentsPanelsHistoryOn: boolean;
    flShowUserComponentAfterStart: boolean;
    flUserMessagesChecking: boolean;
    VisualizationMaxSize: integer;
    flUseComponentsManager: boolean;
    RemoteStatusLoadingComponentMaxSize: integer;
    ReflectingObjPortion: integer;
    UpdateInterval: integer;

    Constructor Create(pSpace: TProxySpace);
    destructor Destroy; override;
    procedure Open;
    procedure Save;
    procedure Validate;
  end;

  TProxySpaceUserStatus = (susOffLine,susOnLine,susBusy,susFreeForChat,susAway);
  TOnUserChatMessagesProc = procedure (const MessagesList: TList);

  TProxySpaceUserIncomingMessagesItem = record
    TimeStamp: TDateTime;
    Message: TClientBlobStream;
    SenderID: integer;
    id: integer;
  end;

  TProxySpaceUserIncomingMessages = class(TThread)
  private
    Space: TProxySpace;
    UserFunctionality: TObject;

    procedure ProcessUserChatMessages;
  public
    Lock: TCriticalSection;
    Messages: TList;
    OnUserChatMessages: TOnUserChatMessagesProc;

    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Execute; override;
    procedure Clear(const Messages: TList);
    procedure CheckForNewMessages;
    procedure ProcessUserCommand(const CommandMessage: shortstring; const SenderID: integer);
    function GetChatMessagesList(out UserMessages: TList): boolean;
    function GetUserStatus(const idUser: integer; const MinTimeStamp: TDateTime;  out UserStatus: TProxySpaceUserStatus): boolean;
    class procedure ConvertMessageToShortString(const Message: TStream; out ShortStr: shortstring);
    class procedure ConvertShortStringToMessage(const ShortStr: shortstring; out Message: TMemoryStream);
  end;

  TProxySpaceSavedUserContext = class
  public
    Space: TProxySpace;
    ContextFolder: string;

    class procedure DestroyAllContext(); 
    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
    function GetContextsList(out List: TStringList): boolean;
    function IsContextFound(const ContextName: string): boolean;
    procedure DestroyContext(const ContextName: string);
  end;

  TProxySpaceUserProfile = class
  public
    Space: TProxySpace;
    ProxySpacesProfileFolder: string;
    ProfileFolder: string;
    ProfileFile: string;

    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
    function SetProfileFile(const FileName: string): boolean;
    procedure CreateProfile;
    procedure DestroyProfile;
  end;

  TProxySpaceUpdating = class(TThread)
  private
    Lock: TCriticalSection;
    Space: TProxySpace;
    UpdateInterval: integer;
    TimeCounter: integer;
    flForceUpdate: boolean;

    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Execute; override;
    procedure Update;
    procedure Reset();
  end;

  TSpaceObjectsContextRegistryItem = packed record
    Next: pointer;
    Ptr: TPtr;
    Lay: SmallInt;
    SubLay: SmallInt;
  end;

  TSpaceObjectsContextRegistry = class
  public
    Space: TProxySpace;
    Items: pointer;
    ItemsAdrCach: TIDsCach;
    ItemsCount: integer;
    flDisabled: boolean;

    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Clear;
    function ObjectsCount: integer;
    procedure ObjAccessed(const pPtr: TPtr; const pLay: SmallInt = -1; const pSubLay: SmallInt = -1);
    procedure ObjSetLayInfo(const pPtr: TPtr; const pLay,pSubLay: SmallInt);
    procedure Remove(const pPtr: TPtr);
    procedure GetObjects(out Objects: TPtrArray);
    procedure GetItems(out FetchedItems: pointer);
    procedure GetItemsSorted(out SortedItems: pointer; out oItemsCount: integer);
    procedure ClearOldObjects(const StartNumber: integer);
    procedure GetFirstObjectsAndClearRest(const MaxNumber: integer; out Objects: TPtrArray);
    procedure ClearObjectsLaysInfo(); 
  end;

  TContainerCoord = record
    Xmin,Ymin,
    Xmax,Ymax: Extended;
  end;

  TContainerCoordArray = array of TContainerCoord;

  TSpaceWindowUpdater = class
  private
    Space: TProxySpace;
  public
    CC: TContainerCoord;
    Constructor Create(const pSpace: TProxySpace; const Xmin,Ymin,Xmax,Ymax: Extended);
    Destructor Destroy; override;
  end;

  TProxySpaceServerType = (pssClient,pssFunctional,pssAreaNotification);

  TProxySpace = class
  private
    FUpdateIsDisabledCounter: integer;
    FflAutomaticUpdateIsDisabled: boolean;
    FflOffline: boolean;
    Context_HistoryID: integer;
    Context_History_ItemLifeTime: integer;
    //. updating
    Context_LastUpdatesTimeStamp: TDateTime;
    Context_Updating: TProxySpaceUpdating;
    Obj_UpdateLocal__List: TThreadList;
    SpaceWindowUpdaters: TThreadList;
    //.
    User_SpaceWindow_Semaphore: THandle;
    User_SpaceWindow_ObjectCaching_Counter: integer;

    procedure setflAutomaticUpdateIsDisabled(Value: boolean);
    procedure setflOffline(Value: boolean);

    procedure NotificationSubscription_DoOnUpdatesReceived(const ComponentNotifications: pointer; const ComponentNotificationsCount: integer; const ComponentPartialUpdateNotifications: pointer; const ComponentPartialUpdateNotificationsCount: integer; const VisualizationNotifications: pointer; const VisualizationNotificationsCount: integer);

    procedure SynchronizeLocalFolderWithServerUserFolder(const Folder: string; const LocalFolderBase: string; const UserFolderBase: string);
  public
    ReleaseLevel: double;
    flStartedInOffline: boolean;
    ID: integer;
    SpacePackID: integer;
    Lock: TCriticalSection;
    Context_flLoaded: boolean;
    Context_UpdateLock: TCriticalSection;
    WorkLocale: string;
    UserID: integer;
    UserName: WideString;
    UserPassword: WideString;
    UserPasswordHash: string;
    UserCompression: integer;
    UserEncryption: integer;
    UserSecurityFileForCloneID: integer;
    idUserProxySpace: integer;
    ProxySpaceServerType: TProxySpaceServerType;
    Configuration: TProxySpaceConfiguration;
    SOAPServerURL: WideString;
    SOAPServerAddress: string;
    flActionsGroupCall: boolean;
    GlobalSpaceManager: ISpaceManager;
    GlobalSpaceManagerLock: TCriticalSection;
    GlobalSpaceRemoteManager: ISpaceRemoteManager;
    GlobalSpaceRemoteManagerLock: TCriticalSection;
    LocalStorage: TLinearMemory;
    ptrRootObj: TPtr;
    ObjectsContextRegistry: TSpaceObjectsContextRegistry;
    ContextItemsMaxCount: integer;
    Status: TProxySpaceStatus;
    State: TProxySpaceState;

    TypesSystem: TObject;

    //. updating
    flUpdating: boolean;
    StayUpToDate_flNoComponentsContext: boolean;
    StayUpToDate__ContextV0_ComponentsMaxCount: integer;
    StayUpToDate__ContextV0_ReflectionsMaxCount: integer;
    StayUpToDate__ContextV0_VisualizationsMaxCount: integer;
    StayUpToDate_Monitor: TForm;
    NotificationSubscription: TObject;

    //. Representations
    ReflectorsList: TList;
    PropsPanels: TList;

    UserIncomingMessages: TProxySpaceUserIncomingMessages;

    Log: TfmLog;
    ControlPanel: TfmProxySpaceControlPanel;

    ComponentsPanelsHistory: TForm;

    Plugins: TThreadList;
    PluginsDoOnComponentOperationEntries: TThreadList;
    PluginsDoOnVisualizationOperationEntries: TThreadList;

    flNoContextSaving: boolean;

    Constructor Create(const pSOAPServerURL: string; const pUserName,pUserPassword: string; const UserProxySpaceIndex: integer);
    Destructor Destroy; override;

    procedure ClearTempData();
    
    function ServerIsLocal(): boolean;

    procedure GetUserPasswordHash();
    function  IsROOTUser(): boolean;

    procedure LoadSpaceStructure;
    function ReadObj(var Obj; SizeObj: integer; Pntr: TPtr): boolean;
    function ReadObjLocalStorage(var Obj; SizeObj: integer; Pntr: TPtr): boolean;
    function WriteObjLocalStorage(var Obj;SizeObj: integer; var Pntr: TPtr): boolean;
    function IsPtrNull(const ptrPtr: TPtr): boolean;

    function  TObj_Ptr(const idTObj,idObj: integer): TPtr;
    function  Obj_IsCached(const ptrObj: TPtr): boolean; overload;
    function  Obj_IsCached(const Obj: TSpaceObj): boolean; overload;
    function  Obj_StructureIsCached(const ptrObj: TPtr): boolean;
    function  Obj_PtrPtr(const idTObj,idObj: integer): TPtr;
    function  Obj_GetCenter(var Xc,Yc: Extended; ptrSelf: TPtr): boolean;
    function  Obj_GetMinMax(var minX,minY,maxX,maxY: Extended; const SelfObj: TSpaceObj): boolean; overload;
    function  Obj_GetMinMax(var minX,minY,maxX,maxY: Extended; const ptrSelf: TPtr): boolean; overload;
    function  Obj_idLay(const ptrObj: TPtr): integer;
    function  Obj_GetLevel(var Level: integer; ptrSelf: integer): boolean;
    procedure Obj_GetLayLevel(var Level: integer; ptrSelf: integer);
    procedure Obj_GetLayInfo(const ptrObj: TPtr; var Lay: integer; var SubLay: integer);
    procedure Obj_GetObjAround(var vptrObj: TPtr; ptrSelf: TPtr);
    function  Obj_IsInsideObj(ptrObj: TPtr; ptrSelf: TPtr): boolean;
    function  Obj_IsPointInside(const P: TPoint; ptrSelf: TPtr): boolean;
    function  Obj_PointInsideOwnObjects(const P: TPoint; ptrSelf: TPtr): boolean;
    function  Obj_PointOutsideOwner(const P: TPoint; ptrSelf: TPtr): boolean;
    function  Obj_Owner(ptrSelf: TPtr): TPtr;
    function  Obj_IDType(ptrObj: TPtr): integer;
    function  Obj_ID(ptrObj: TPtr): integer;
    function  Obj_IsDetail(const ptrObj: TPtr): boolean;
    procedure Obj_GetRoot(const idTObj,idObj: integer; out idTROOT,idROOT: integer);
    function  Obj_GetRootPtr(ptrObj: TPtr): TPtr;
    function  Obj_ObjIsVisibleInside(const ptrAnObj: TPtr; const ptrSelf: TPtr): boolean;
    procedure Obj_GetLaysOfVisibleObjectsInside(const ptrSelf: TPtr; out ptrLays: pointer);
    procedure Obj_GetLaysOfVisibleObjectsInside1(const ptrSelf: TPtr; out ptrLays: pointer);
    function  Obj_HasNodeInside(const ptrObj: TPtr; const ShiftX,ShiftY: TCrd; const flIgnoreSelf: boolean): boolean;
    function  Obj_IsForbiddenPrivateArea(const ptrObj: TPtr; const ShiftX,ShiftY: TCrd; const flIgnoreSelf: boolean): boolean;
    function  Obj_ActualityInterval_Get(const ptrObj: TPtr): TComponentActualityInterval; overload;
    function  Obj_ActualityInterval_Get(const Obj: TSpaceObj): TComponentActualityInterval; overload;
    function  Obj_ActualityInterval_IsActualForTimeInterval(const ptrObj: TPtr; const pInterval: TComponentActualityInterval): boolean; overload;
    function  Obj_ActualityInterval_IsActualForTimeInterval(const Obj: TSpaceObj; const pInterval: TComponentActualityInterval): boolean; overload;

    procedure Obj_UpdateLocal(const ptrObj: TPtr; const flRecursive: boolean = true);
    procedure Obj_UpdateLocal__Start;
    procedure Obj_UpdateLocal__Finish;
    procedure Obj_UpdateLocal__Add(const ptrObj: TPtr; const flRecursive: boolean = true);
    procedure Obj_CheckCachedState(const ptrObj: TPtr; const flRecursive: boolean = true);
    procedure Obj_ClearCachedState(const ptrObj: TPtr; const flRecursive: boolean = true);

    function LevelsCount: integer;
    function LaysCount: integer;
    function LaysID: integer;

    function Lay_Ptr(Level: integer): TPtr;
    procedure Lay_GetNumber(const ptrLay: TPtr; var Number: integer);
    procedure Lay_GetNumberByID(const LayID: integer; out Number: integer);

    procedure Increase(const Delta: integer);

    procedure DoOnObjectOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
    procedure DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
    procedure DoOnComponentPartialUpdate(const idTObj,idObj: integer; const Data: TByteArray);

    procedure CheckUserDATASize(const pUserName,pUserPassword: WideString; const AddDATASize: integer);
    procedure CheckUserSpaceSquare(const pUserName,pUserPassword: WideString; const AddSpaceSquare: Extended);
    procedure CheckUserMaxSpaceSquarePerObject(const pUserName,pUserPassword: WideString; const ObjectSpaceSquare: Extended);

    //. space user context routines
    procedure RemoveSavedUserContext();
    function SavedUserContext_GetParams(out HistoryID: integer): boolean;
    procedure GetSpaceContext(out ObjectsContext: TPtrArray);
    procedure ReviseSpaceContext; overload;
    procedure ReviseSpaceContext(out ObjectsContext: TPtrArray); overload;
    procedure ClearSpaceContext();
    procedure ClearInactiveSpaceContext(out ObjectsCount: integer; out ObjectsRemains: integer); overload;
    procedure ClearInactiveSpaceContext(); overload;
    procedure SaveSpaceContext(const ContextFile: string);
    function LoadSpaceContext(const ContextFile: string; out flSpacePackLoaded: boolean): boolean;
    procedure SaveUserSpaceContext;
    function Context_GetVisibleObjects(const X0: Double; const Y0: Double; const X1: Double; const Y1: Double; const X2: Double; const Y2: Double; const X3: Double; const Y3: Double; const HidedLaysArray: TByteArray; const MinVisibleSquare: Double; const MinVisibleWidth: Double; const ptrCancelFlag: pointer = nil; const BestBeforeTime: TDateTime = MaxDouble): TByteArray;
    //.
    function SpaceWindowUpdaters__TSpaceWindowUpdater_Create(const Xmin,Ymin,Xmax,Ymax: Extended): TObject;
    procedure SpaceWindowUpdaters__GetWindows(out Windows: TContainerCoordArray);
    //. updating routines
    procedure StayUpToDate(flExcludeNotificationSubscription: boolean = true);
    procedure StayUpToDateWithoutContext; //. obsolete
    procedure DisableUpdating();
    procedure EnableUpdating();

    procedure InitializePlugins;
    procedure FinalizePlugins;
    procedure Plugins_Add(const PluginFileName: string);
    procedure Plugins_Remove(const PluginHandle: THandle);
    procedure Plugins_DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
    procedure Plugins_DoOnVisualizationOperation(const ptrObj: TPtr; const Act: TRevisionAct);
    function  Plugins_Execute(const Code: integer; const InData: TByteArray; out OutData: TByteArray): boolean;
    function  Plugins___CoComponent__TPanelProps_Create(const idCoType,idCoComponent: integer): TForm;
    function  Plugins_CanCreateCoComponentByFile(const FileName: WideString; out idCoPrototype: integer): boolean;
    function  Plugins__CoComponent_LoadByFile(const idCoComponent: integer; const FileName: WideString): boolean;
    procedure Plugins__CoComponent_GetData(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; pidCoType: Integer; DataType: Integer; out Data: GlobalSpaceDefines.TByteArray);
    function  Plugins__CoComponent_GetHintInfo(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; idCoType: Integer; const InfoType: Integer; const InfoFormat: Integer; out Info: GlobalSpaceDefines.TByteArray): boolean; 
    function  Plugins__CoComponent_TStatusBar_Create(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; idCoType: Integer; const pUpdateNotificationProc: TProcedureOfObject): TObject; 
    procedure Plugins__CoGeoMonitorObject_GetTrackData(const pUserName: WideString; const pUserPassword: WideString; idCoGeoMonitorObject: Integer; const GeoSpaceID: integer; const BeginTime: double; const EndTime: double; DataType: Integer; out Data: GlobalSpaceDefines.TByteArray);
    function  Plugins__CoGeoMonitorObjects_GetTreePanel(): TForm;
    function  Plugins__GetStartPanel(const flAutoStartCheck: boolean): TForm;
    function  Plugins__GetCreateCompletionObjectForCoComponentType(const pidCoType: integer): TObject;
    procedure Plugins__ShowUserTaskManager();

    procedure User_ReflectSpaceWindowOnBitmap(const pUserName: WideString; const pUserPassword: WideString; const X0,Y0, X1,Y1, X2,Y2, X3,Y3: TCrd; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const DynamicHintVisibility: double; const DynamicHintDataVersion: integer; const VisualizationUserData: TByteArray; const ActualityInterval: TComponentActualityInterval; const pWidth,pHeight: integer; const Bitmap: TBitmap; out DynamicHintData: TMemoryStream);
    function  User_SpaceWindowBitmap_ObjectAtPosition(const pUserName: WideString; const pUserPassword: WideString; const X0,Y0, X1,Y1, X2,Y2, X3,Y3: TCrd; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const DynamicHintVisibility: double; const ActualityInterval: TComponentActualityInterval; const Bitmap_Width,Bitmap_Height: double; const Bitmap_X,Bitmap_Y: double): TPtr;

    property flAutomaticUpdateIsDisabled: boolean read FflAutomaticUpdateIsDisabled write setflAutomaticUpdateIsDisabled;
    property flOffline: boolean read FflOffline write setflOffline;
  end;

Type
  TReflectorsList = class (TList)
  private
    Space: TProxySpace;
  public
    Constructor Create(pSpace: TProxySpace);
    destructor Destroy; override;
    function CreateReflectorByID(const pid: integer): TForm;
    procedure TReflector_Destroy(const pid: integer);
    procedure DestroyAll;
    procedure ReflectSpace(const HExceptReflector: integer);
    procedure Refresh(const HExceptReflector: integer);
    procedure RecalcReflect(const HExceptReflector: integer);
    procedure RevisionReflect(ptrObj: TPtr; HExceptReflector: integer); overload;
    procedure RevisionReflect(ptrObj: TPtr; pAct: TRevisionAct; HExceptReflector: integer); overload;
    function IsObjOutside(const ptrObj: TPtr): boolean;
    function IsObjVisible(const ptrObj: TPtr): boolean;
  end;

Type
  TNodeSpaceObjPolyLinePolygon = record
    ptrNext: pointer;
    X,Y: TCrd;
  end;

  TSpaceObjPolylinePolygon = class //. многоугольник контура объекта
  private
    Space: TProxySpace;
    Obj: TSpaceObj;
    FNodes: pointer;

    procedure SetNodesFromObject;
    function TNode_Create: pointer;
    procedure Nodes_Init;
    procedure Nodes_Clear;
    function getNode(Index: integer): TNodeSpaceObjPolyLinePolygon;
    procedure setNode(Index: integer; Value: TNodeSpaceObjPolyLinePolygon);
  public
    Count: integer;

    Constructor Create(pSpace: TProxySpace; const pObj: TSpaceObj); overload;
    Constructor Create(pSpace: TProxySpace; const pObj: TSpaceObj; const NewWidth: Extended); overload;
    Destructor Destroy; override;
    procedure Update;
    property Nodes[Index: integer]: TNodeSpaceObjPolyLinePolygon read getNode write setNode;
  end;

  TSpacePolygonNode = packed record
    ptrNext: pointer;
    X: TCrd;
    Y: TCrd;
    end;

  TSpacePolygonTester = class //. retrieved needful info about polygon in space
  private
    Space: TProxySpace;
  public
    PolygonNodesCount: integer;
    PolygonNodes: pointer;
    PolygonLay: integer;
    PolygonSubLay: integer;
    ExceptObjPtr: TPtr;

    Constructor Create(pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Clear;
    procedure AddNode(const pX,pY: TCrd);
    //. testing values
    function HasPointInside: boolean;
    function IsForbiddenPrivateArea: boolean;
    function Square: Extended;
  end;

type
  TPointObjectVisualization = record
    ptrNext: pointer;

    X,Y: Extended;
  end;

  TObjectVisualization = class
  public
    Next: TObjectVisualization;

    idTObj,idObj: integer;
    ptrFirstPoint: pointer;
    PointsCount: integer;
    flLoop: boolean;
    Color: TColor;
    Width: TSpaceObjLineWidth;

    flFill: boolean;
    ColorFill: TColor;

    OwnObjects: TObjectVisualization;

    MinX: Extended;
    MinY: Extended;
    MaxX: Extended;
    MaxY: Extended;

    Constructor Create;
    Destructor Destroy; override;

    procedure AddPoint(const pX,pY: Extended);
    procedure Clear;
    function TOwnObject_Create: TObjectVisualization;
    procedure OwnObjects_Clear;
    procedure DottedReflect(Canvas: TCanvas; const Xcenter,Ycenter: integer);
    function AveragePoint: TPointObjectVisualization;
    procedure Normalize; //. средн€€ точка = 0
    procedure Shift(const dX,dY: Extended);
  end;




  function ContainerCoord_IsObjectOutside(const Coords: TContainerCoord; const Obj_ContainerCoord: TContainerCoord): boolean;

  function SystemName: string;
  function SystemIPAddress: string;

  function ObjectIsInheritedFrom(Obj: TObject; Cl: TClass): boolean;

const
  ProxySpaceStatusStrings: array[TProxySpaceStatus] of string =
    ('Normal','Normal disconnected','Remoted','Remoted Brief');

var
  ProxySpace: TProxySpace = nil;
  //. proxyspace flags
  flRegistrationAllowed: boolean = true;
  flDebugging: boolean = false;
  //.
  ProcessLocaleID: integer = 1049; //. Russian codepage
  //.
  TimeZoneInfo: TTimeZoneInformation;
  TimeZoneDelta: TDateTime = 0.0;

  procedure ProxySpace_Initialize(const pSOAPServerURL: string; const pUserName,pUserPassword: string; const UserProxySpaceIndex: integer);
  procedure ProxySpace_Finalize();
  
implementation
Uses
  Functionality,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesDefines,
  TypesFunctionality,
  unitOpenGL3DSpace,
  {$ENDIF}
  unitSpaceNotificationSubscription,
  unitProxySpaceUpdatesMonitor,
  unitSpaceUpdatesUserNotificator,
  unitUserProxySpaces,
  unitUserChat,
  ComCtrls,
  RichEdit,
  OpenGLEx,
  Dialogs,
  INIFiles,
  unit3DReflector,
  unitReflector,
  unitMODELServersHistory,
  unitComponentsPanelsHistory,
  unitRegistrationForm,
  Hash,
  InvokeRegistry,
  {$IFDEF SpaceWindowReflectingTesting}
  unitProxySpaceSpaceWindowReflectingTesting,
  {$ENDIF}
  unitSpaceFunctionalServer,
  unitAreaNotificationServer;


//. getmem routine overriding
procedure GetMem(var P: pointer; Size: integer);
begin
System.GetMem(P,Size);
//. try to lock memory
/// ? VirtualLock(P,Size);
end;
//.


//. System routins
function SystemName: string;
var
  LocalMachine: array [0..MAX_COMPUTERNAME_LENGTH] of char;
  Size: DWord;
  PStr: PWideChar;
  I: integer;
begin
Size:=Sizeof(LocalMachine);
GetComputerName(LocalMachine,Size);
Result:='';
for I:=0 to MAX_COMPUTERNAME_LENGTH do if LocalMachine[I] = #0 then Break else Result:=Result+LocalMachine[I];
end;

function SystemIPAddress: string;
const
  bufsize=255;
var
  buf: pointer;
  WSADATA: TWSADATA;
  ErrorCode: integer;
  RemoteHost : PHostEnt;
  ptrIPAddresses: pointer;
  my_ip_address: longint;
  ipaddressbytes: array[0..3] of byte absolute my_ip_address;
begin
buf:=NIL;
try
getmem(buf,bufsize);
ErrorCode:=WSAStartup($0101, WSAData);
if (ErrorCode <> 0) then Raise Exception.Create('error of WSA initializing'); //. =>
winsock.gethostname(buf,bufsize);
RemoteHost:=Winsock.GetHostByName(buf);
if RemoteHost <> nil
 then begin
  ptrIPAddresses:=Pointer(RemoteHost^.h_addr_list);
  if Byte(ptrIPAddresses^) = 0 then Raise Exception.Create('error getting ip-address'); //. =>
  asm
     PUSH ESI
     MOV ESI,ptrIPAddresses
     CLD
  @M1:
     LODSD
     MOV EAX,[EAX]
     CMP Byte Ptr [ESI],0
     JNE @M1
     MOV my_ip_address,EAX
     POP ESI
  end;
  end
 else
  Raise Exception.Create('error of GetHostByName'); //. =>
finally
if buf <> nil then freemem(buf,bufsize);
end;
my_ip_address:=winsock.ntohl(my_ip_address);
Result:=IntToStr(ipaddressbytes[3])+'.'+IntToStr(ipaddressbytes[2])+'.'+IntToStr(ipaddressbytes[1])+'.'+IntToStr(ipaddressbytes[0]);
end;


function FormatFloat(const Format: string; Value: Extended): string;
begin
DecimalSeparator:='.';
Result:=SysUtils.FormatFloat(Format,Value);
end;

function StrToFloat(const S: string): Extended;
begin
DecimalSeparator:='.';
Result:=SysUtils.StrToFloat(S);
end;


function ObjectIsInheritedFrom(Obj: TObject; Cl: TClass): boolean;
begin
Result:=(Obj is Cl);
end;



{реализаци€ точки}
procedure ConstrPoint(X,Y: TCrd; var Point: TPoint);
begin
Point.ptrNextObj:=nilPtr;
Point.X:=X;
Point.Y:=Y;
end;


function ContainerCoord_IsObjectOutside(const Coords: TContainerCoord; const Obj_ContainerCoord: TContainerCoord): boolean;
begin
Result:=true;
with Obj_ContainerCoord do begin
if ((Xmax < Coords.Xmin) OR (Xmin > Coords.Xmax)
      OR
    (Ymax < Coords.Ymin) OR (Ymin > Coords.Ymax))
 then Exit; //. ->
end;
Result:=false;
end;


{TProxySpaceConfiguration}
Constructor TProxySpaceConfiguration.Create(pSpace: TProxySpace);
begin
Inherited Create;
Space:=pSpace;
Open;
end;

destructor TProxySpaceConfiguration.Destroy;
begin
Save();
Inherited;
end;

procedure TProxySpaceConfiguration.Open;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;

  procedure ReadFromStream(Stream: TStream);
  begin
  try
  with Stream do begin
  //. read proxy-space status
  Read(Space.Status,SizeOf(Space.Status));
  //.
  Read(flComponentsPanelsHistoryOn,SizeOf(flComponentsPanelsHistoryOn));
  Read(flShowUserComponentAfterStart,SizeOf(flShowUserComponentAfterStart));
  Read(flUserMessagesChecking,SizeOf(flUserMessagesChecking));
  Read(VisualizationMaxSize,SizeOf(VisualizationMaxSize));
  Read(flUseComponentsManager,SizeOf(flUseComponentsManager));
  Read(RemoteStatusLoadingComponentMaxSize,SizeOf(RemoteStatusLoadingComponentMaxSize));
  Read(ReflectingObjPortion,SizeOf(ReflectingObjPortion));
  Read(UpdateInterval,SizeOf(UpdateInterval));
  end;
  except
    On E: Exception do EventLog.WriteMajorEvent('ProxySpaceConfiguration','Cannot read ProxySpace all configuration (idProxySpace = '+IntToStr(ProxySpace.idUserProxySpace)+').',E.Message);
    end;
  end;

begin
//. assign defaults
Space.Status:=pssRemoted;
flComponentsPanelsHistoryOn:=false;
flShowUserComponentAfterStart:=false;
flUserMessagesChecking:=false;
VisualizationMaxSize:=-1;
flUseComponentsManager:=false;
RemoteStatusLoadingComponentMaxSize:=-1;
ReflectingObjPortion:=25;
UpdateInterval:=30;
//. read user-defined config
if (NOT Space.flOffline)
 then with GetISpaceUserProxySpace(Space.SOAPServerURL) do
  if Get_Config(Space.UserName,Space.UserPassword,Space.idUserProxySpace,BA)
   then begin
    MemoryStream:=TMemoryStream.Create;
    try
    ByteArray_PrepareStream(BA,TStream(MemoryStream));
    ReadFromStream(MemoryStream);
    finally
    MemoryStream.Destroy;
    end;
    end;
end;

procedure TProxySpaceConfiguration.Save;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;

  procedure WriteIntoStream(Stream: TStream);
  begin
  with Stream do begin
  //. write proxy-space status
  Write(Space.Status,SizeOf(Space.Status));
  //.
  Write(flComponentsPanelsHistoryOn,SizeOf(flComponentsPanelsHistoryOn));
  Write(flShowUserComponentAfterStart,SizeOf(flShowUserComponentAfterStart));
  Write(flUserMessagesChecking,SizeOf(flUserMessagesChecking));
  Write(VisualizationMaxSize,SizeOf(VisualizationMaxSize));
  Write(flUseComponentsManager,SizeOf(flUseComponentsManager));
  Write(RemoteStatusLoadingComponentMaxSize,SizeOf(RemoteStatusLoadingComponentMaxSize));
  Write(ReflectingObjPortion,SizeOf(ReflectingObjPortion));
  Write(UpdateInterval,SizeOf(UpdateInterval));
  end;
  end;

begin
UpdateBySpace;
//. write user defined config
MemoryStream:=TMemoryStream.Create;
try
WriteIntoStream(MemoryStream);
if (NOT Space.flOffline)
 then with GetISpaceUserProxySpace(Space.SOAPServerURL) do begin
  ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
  Set_Config(Space.UserName,Space.UserPassword,Space.idUserProxySpace,BA);
  end;
finally
MemoryStream.Destroy;
end;
end;

procedure TProxySpaceConfiguration.Validate;
begin
//. do nothing
end;

procedure TProxySpaceConfiguration.UpdateBySpace;
begin
//. do nothing
end;


{TProxySpaceUserIncomingMessages}
Constructor TProxySpaceUserIncomingMessages.Create(const pSpace: TProxySpace);
begin
Lock:=TCriticalSection.Create;
Space:=pSpace;
UserFunctionality:=TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,Space.UserID));
Messages:=TList.Create;
OnUserChatMessages:=nil;
Inherited Create(true);
Priority:=tpNormal;
end;

Destructor TProxySpaceUserIncomingMessages.Destroy;
var
  EC: dword;
begin
{///? if true /// ?+ Space.State = psstDestroying
 then begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end
 else
  Inherited;}
if (Suspended) then Resume();
Inherited;
Clear(Messages);
Messages.Free;
UserFunctionality.Free;
Lock.Free;
end;

procedure TProxySpaceUserIncomingMessages.Execute;
const
  DoOnChatMessagesIntervalCount = 10;
var
  CheckIntervalCount: integer;
  I: integer;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
CheckIntervalCount:=(10*Space.Configuration.UpdateInterval) DIV 2;
if CheckIntervalCount = 0 then Exit; //. ->
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
I:=1;
repeat
  //.
  if (Space.State = psstWorking)
   then begin
    if (I MOD CheckIntervalCount) = 0 then CheckForNewMessages;
    //.
    if ((I MOD DoOnChatMessagesIntervalCount) = 0) AND Assigned(OnUserChatMessages) then Synchronize(ProcessUserChatMessages);
    end;
  //.
  Sleep(100);
  Inc(I);
until Terminated;
finally
CoUnInitialize;
end;
end;

procedure TProxySpaceUserIncomingMessages.Clear(const Messages: TList);
var
  I: integer;
  ptrDestroyItem: pointer;
begin
if Messages = Self.Messages then Lock.Enter;
try
if Messages <> nil
 then begin
  for I:=0 to Messages.Count-1 do begin
    ptrDestroyItem:=Messages[I];
    Messages[I]:=nil;
    TProxySpaceUserIncomingMessagesItem(ptrDestroyItem^).Message.Destroy;
    FreeMem(ptrDestroyItem,SizeOf(TProxySpaceUserIncomingMessagesItem));
    end;
  Messages.Clear;
  end;
finally
if Messages = Self.Messages then Lock.Leave;
end;
end;

procedure TProxySpaceUserIncomingMessages.CheckForNewMessages;
var
  MessageList: TList;
  I: integer;
  MessageTimeStamp: TDateTime;
  MessageStream: TClientBlobStream;
  MessageSenderID: integer;
  MessageID: integer;
  MS: shortstring;
  ptrNewItem: pointer;
begin
if (Space.flOffline OR Space.flAutomaticUpdateIsDisabled) then Exit; //. ->
//.
if TMODELUserFunctionality(UserFunctionality).IncomingMessages_GetUnread(MessageList)
 then begin
  Lock.Enter;
  try
  try
  for I:=0 to MessageList.Count-1 do begin
   MessageID:=Integer(MessageList[I]);
   TMODELUserFunctionality(UserFunctionality).IncomingMessages_GetMessage(MessageID, MessageTimeStamp,MessageStream,MessageSenderID);
   ConvertMessageToShortString(MessageStream, MS);
   if (Length(MS) > 0) AND (MS[1] = '#')
    then
     ProcessUserCommand(MS,MessageSenderID) //. process as user command
    else begin //. process as just a message
     GetMem(ptrNewItem,SizeOf(TProxySpaceUserIncomingMessagesItem));
     with TProxySpaceUserIncomingMessagesItem(ptrNewItem^) do begin
     TimeStamp:=MessageTimeStamp;
     Message:=MessageStream;
     SenderID:=MessageSenderID;
     id:=MessageID;
     end;
     Messages.Add(ptrNewItem);
     end;
   end
  finally
  MessageList.Destroy;
  end;
  finally
  Lock.Leave;
  end;
  end;
end;

procedure TProxySpaceUserIncomingMessages.ProcessUserCommand(const CommandMessage: shortstring; const SenderID: integer);
var
  CMD: string;
  flFound: boolean;
  I: integer;
  Response: shortstring;
  Message: TMemoryStream;
begin
//. #GETUSERSTATUS command
CMD:='#GETUSERSTATUS';
if CommandMessage = CMD
 then begin
  //. send message to sender
  Response:='@USERSTATUS'+' '+IntToStr(Integer(susOnLine));
  ConvertShortStringToMessage(Response, Message);
  try
  with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,SenderID)) do
  try
  IncomingMessages_SendNew(Message,Space.UserID);
  finally
  Release;
  end;
  finally
  Message.Destroy;
  end;
  end;
end;

procedure TProxySpaceUserIncomingMessages.ProcessUserChatMessages;
var
  ML: TList;
begin
if GetChatMessagesList(ML)
 then
  try
  OnUserChatMessages(ML);
  finally
  Clear(ML);
  ML.Destroy;
  end;
end;

function TProxySpaceUserIncomingMessages.GetChatMessagesList(out UserMessages: TList): boolean;
var
  I: integer;
  ptrItem: pointer;
  MS: shortstring;
begin
Result:=false;
UserMessages:=nil;
Lock.Enter;
try
I:=0;
while I < Messages.Count do with TProxySpaceUserIncomingMessagesItem(Messages[I]^) do begin
  ConvertMessageToShortString(Message, MS);
  if NOT ((Length(MS) > 0) AND (MS[1] = '@'))
   then begin
    if UserMessages = nil then UserMessages:=TList.Create;
    ptrItem:=Messages[I];
    Messages.Delete(I);
    UserMessages.Add(ptrItem);
    Result:=true;
    end
   else
    Inc(I);
  end;
finally
Lock.Leave;
end;
end;

function TProxySpaceUserIncomingMessages.GetUserStatus(const idUser: integer; const MinTimeStamp: TDateTime;  out UserStatus: TProxySpaceUserStatus): boolean;
var
  I,J: integer;
  MS: shortstring;
  UserStatusPos: integer;
  C: Char;
  ptrDestroyItem: pointer;
begin
Result:=false;
Lock.Enter;
try
for I:=Messages.Count-1 downto 0 do with TProxySpaceUserIncomingMessagesItem(Messages[I]^) do
  if (SenderID = idUser) AND (TimeStamp >= MinTimeStamp)
   then begin
    ConvertMessageToShortString(Message, MS);
    if (Length(MS) > 11) AND ((MS[1]+MS[2]+MS[3]+MS[4]+MS[5]+MS[6]+MS[7]+MS[8]+MS[9]+MS[10]+MS[11]) = '@USERSTATUS')
     then begin
      UserStatusPos:=13;
      C:=MS[UserStatusPos];
      try
      UserStatus:=TProxySpaceUserStatus(StrToInt(String(C)));
      Result:=true;
      //. remove used item
      ptrDestroyItem:=Messages[I];
      Messages.Delete(I);
      TProxySpaceUserIncomingMessagesItem(ptrDestroyItem^).Message.Destroy;
      FreeMem(ptrDestroyItem,SizeOf(TProxySpaceUserIncomingMessagesItem));
      except
        end;
      end;
    end;
finally
Lock.Leave;
end;
end;

class procedure TProxySpaceUserIncomingMessages.ConvertMessageToShortString(const Message: TStream; out ShortStr: shortstring);
var
  Size: integer;
begin
Size:=Message.Size;
if Size > 255 then Size:=255;
SetLength(ShortStr,Size);
Message.Position:=0;
Message.Read(ShortStr[1],Size);
end;

class procedure TProxySpaceUserIncomingMessages.ConvertShortStringToMessage(const ShortStr: shortstring; out Message: TMemoryStream);
begin
Message:=TMemoryStream.Create;
Message.Size:=Length(ShortStr);
Message.Write(ShortStr[1],Message.Size);
end;


procedure DeleteFolder(const Folder: string);
var
  sr: TSearchRec;
  FN: string;
begin
if (SysUtils.FindFirst(Folder+'\*.*', faAnyFile-faDirectory, sr) = 0)
 then
  try
  repeat
    if (NOT ((sr.Name = '.') OR (sr.Name = '..')))
     then begin
      FN:=Folder+'\'+sr.name;
      SysUtils.DeleteFile(FN);
      end;
  until SysUtils.FindNext(sr) <> 0;
  finally
  SysUtils.FindClose(sr);
  end;
if (SysUtils.FindFirst(Folder+'\*.*', faDirectory, sr) = 0)
 then
  try
  repeat
    if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND ((sr.Attr and faDirectory) = faDirectory)) then DeleteFolder(Folder+'\'+sr.name);
  until SysUtils.FindNext(sr) <> 0;
  finally
  SysUtils.FindClose(sr);
  end;
SysUtils.RemoveDir(Folder);
end;

{TProxySpaceSavedUserContext}
class procedure TProxySpaceSavedUserContext.DestroyAllContext();
begin
DeleteFolder(ExtractFilePath(GetModuleName(HInstance))+PathContexts);
end;

Constructor TProxySpaceSavedUserContext.Create(const pSpace: TProxySpace);
begin
Inherited Create;
Space:=pSpace;
ContextFolder:=Space.WorkLocale+PathContexts+'\'+IntToStr(Space.ID)+'\'+Space.UserName;
end;

Destructor TProxySpaceSavedUserContext.Destroy;
begin
Inherited;
end;

function TProxySpaceSavedUserContext.GetContextsList(out List: TStringList): boolean;
var
  sr: TSearchRec;
  ContextName: string;
begin
Result:=false;
if SysUtils.FindFirst(ContextFolder+'\*.xml', faAnyFile, sr) = 0
 then begin
  List:=TStringList.Create;
  try
  repeat
    ContextName:=ContextFolder+'\'+sr.Name;
    List.Add(ContextName);
  until FindNext(sr) <> 0;
  Result:=true;
  SysUtils.FindClose(sr);
  except
    FreeAndNil(List);
    Raise; //. =>
    end;
  end;
end;

function TProxySpaceSavedUserContext.IsContextFound(const ContextName: string): boolean;
begin
Result:=FileExists(ContextFolder+'\'+ContextName);
end;

procedure TProxySpaceSavedUserContext.DestroyContext(const ContextName: string);
begin
DeleteFolder(ContextFolder+'\'+ChangeFileExt(ContextName,''));
SysUtils.DeleteFile(PChar(ContextFolder+'\'+ContextName));
end;


{TProxySpaceUserProfile}
Constructor TProxySpaceUserProfile.Create(const pSpace: TProxySpace);
begin
Inherited Create;
Space:=pSpace;
ProxySpacesProfileFolder:=Space.WorkLocale+PathProfiles+'\'+IntToStr(Space.ID)+'\'+Space.UserName;
ProfileFolder:=ProxySpacesProfileFolder+'\'+IntToStr(Space.idUserProxySpace);
end;

Destructor TProxySpaceUserProfile.Destroy;
begin
Inherited;
end;

function TProxySpaceUserProfile.SetProfileFile(const FileName: string): boolean;
begin
if (NOT FileExists(ProfileFolder+'\'+FileName))
 then begin
  if ((NOT FileExists(Space.WorkLocale+DefaultProfile+'\'+FileName))) then Raise Exception.Create('there is no default profile file '+FileName+' found'); //. =>
  //.
  ForceDirectories(ExtractFilePath(ProfileFolder+'\'+FileName));
  //.
  with TMemoryStream.Create do
  try
  LoadFromFile(Space.WorkLocale+DefaultProfile+'\'+FileName);
  Position:=0;
  SaveToFile(ProfileFolder+'\'+FileName);
  finally
  Destroy;
  end;
  end;
ProfileFile:=ProfileFolder+'\'+FileName;
end;

procedure TProxySpaceUserProfile.CreateProfile;
begin
ForceDirectories(ProfileFolder);
end;

procedure TProxySpaceUserProfile.DestroyProfile;

  procedure DeleteFolder(const Folder: string);
  var
    sr: TSearchRec;
    FN: string;
  begin
  if (SysUtils.FindFirst(Folder+'\*.*', faAnyFile-faDirectory, sr) = 0)
   then
    try
    repeat
      if (NOT ((sr.Name = '.') OR (sr.Name = '..')))
       then begin
        FN:=Folder+'\'+sr.name;
        SysUtils.DeleteFile(FN);
        end;
    until SysUtils.FindNext(sr) <> 0;
    finally
    SysUtils.FindClose(sr);
    end;
  if (SysUtils.FindFirst(Folder+'\*.*', faDirectory, sr) = 0)
   then
    try
    repeat
      if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND ((sr.Attr and faDirectory) = faDirectory)) then DeleteFolder(Folder+'\'+sr.name);
    until SysUtils.FindNext(sr) <> 0;
    finally
    SysUtils.FindClose(sr);
    end;
  SysUtils.RemoveDir(Folder);
  end;

begin
DeleteFolder(ProfileFolder);
end;


{TProxySpaceUpdating}
Constructor TProxySpaceUpdating.Create(const pSpace: TProxySpace);
begin
Space:=pSpace;
Lock:=TCriticalSection.Create();
UpdateInterval:=10*Space.Configuration.UpdateInterval;
TimeCounter:=1;
flForceUpdate:=false;
Inherited Create(true);
Priority:=tpNormal;
Resume;
end;

Destructor TProxySpaceUpdating.Destroy();
begin
Inherited;
Lock.Free();
end;

procedure TProxySpaceUpdating.Execute();
const
  WaitInterval = 100;
var
  _TimeCounter: integer;
begin
//. set thread locale for ANSIString and WideString conversions
SetThreadLocale(ProcessLocaleID);
//.
if (UpdateInterval = 0) then Exit; //. ->
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
repeat
  try
  Lock.Enter();
  try
  _TimeCounter:=TimeCounter;
  finally
  Lock.Leave();
  end;
  if ((Space.State = psstWorking) AND (((_TimeCounter MOD UpdateInterval) = 0) OR (flForceUpdate)))
   then begin
    flForceUpdate:=false;
    Update();
    end;
  except
    On E: Exception do if (Space.State <> psstDestroying) then EventLog.WriteMajorEvent('ContextUpdating','Error on context update.',E.Message);
    end;
  //.
  Sleep(WaitInterval);
  Lock.Enter();
  try
  Inc(TimeCounter);
  finally
  Lock.Leave();
  end;
until (Terminated);
finally
CoUnInitialize;
end;
end;

procedure TProxySpaceUpdating.Update();
begin
if (Space.flAutomaticUpdateIsDisabled OR Space.flOffline OR (Space.State <> psstWorking)) then Exit; //. ->
Space.StayUpToDate();
end;

procedure TProxySpaceUpdating.Reset();
begin
Lock.Enter();
try
TimeCounter:=1;
finally
Lock.Leave();
end;
end;


procedure ProxySpace_WaitBusyState();
begin
while (ProxySpace = nil) OR (ProxySpace.State = psstCreating) do Sleep(33);
end;


{TSpaceObjectsContextRegistry}
Constructor TSpaceObjectsContextRegistry.Create(const pSpace: TProxySpace);
begin
Inherited Create;
Space:=pSpace;
ItemsAdrCach:=TIDsCach.Create;
Items:=nil;
ItemsCount:=0;
flDisabled:=false;
end;

Destructor TSpaceObjectsContextRegistry.Destroy;
begin
Clear;
ItemsAdrCach.Free;
Inherited;
end;

procedure TSpaceObjectsContextRegistry.Clear;
var
  ptrDestroyItem: pointer;
begin
Space.Lock.Enter;
try
while (Items <> nil) do begin
  ptrDestroyItem:=Items;
  Items:=TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Next;
  ItemsAdrCach[TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Ptr]:=nil;
  FreeMem(ptrDestroyItem,SizeOf(TSpaceObjectsContextRegistryItem));
  end;
ItemsCount:=0;
finally
Space.Lock.Leave;
end;
end;

function TSpaceObjectsContextRegistry.ObjectsCount: integer;
begin
Space.Lock.Enter;
try
Result:=ItemsCount;
finally
Space.Lock.Leave;
end;
end;

procedure TSpaceObjectsContextRegistry.ObjAccessed(const pPtr: TPtr; const pLay: SmallInt = -1; const pSubLay: SmallInt = -1);
var
  ptrptrItem,ptrItem,ptrNextItem: pointer;
begin
Space.Lock.Enter;
try
if ((flDisabled) OR (pPtr = nilPtr)) then Exit; //. ->
//.
try
ptrptrItem:=ItemsAdrCach[pPtr];
if (ptrptrItem <> nil)
 then begin
  ptrItem:=Pointer(ptrptrItem^);
  if (ptrItem = Items) then Exit; //. ->
  ptrNextItem:=TSpaceObjectsContextRegistryItem(ptrItem^).Next;
  Pointer(ptrptrItem^):=ptrNextItem;
  if (ptrNextItem <> nil) then ItemsAdrCach[TSpaceObjectsContextRegistryItem(ptrNextItem^).Ptr]:=ptrptrItem;
  end
 else begin
  GetMem(ptrItem,SizeOf(TSpaceObjectsContextRegistryItem));
  with TSpaceObjectsContextRegistryItem(ptrItem^) do begin
  Ptr:=pPtr;
  Lay:=-1;
  SubLay:=-1;
  end;
  Inc(ItemsCount);
  end;
//. insert item as first
if (Items <> nil) then ItemsAdrCach[TSpaceObjectsContextRegistryItem(Items^).Ptr]:=ptrItem;
TSpaceObjectsContextRegistryItem(ptrItem^).Next:=Items;
Items:=ptrItem;
ItemsAdrCach[TSpaceObjectsContextRegistryItem(ptrItem^).Ptr]:=@Items;
finally
//. set object layer properties
if (pLay <> -1)
 then with TSpaceObjectsContextRegistryItem(ptrItem^) do begin
  Lay:=pLay;
  SubLay:=pSubLay;
  end;
end;
finally
Space.Lock.Leave;
end;
end;

procedure TSpaceObjectsContextRegistry.ObjSetLayInfo(const pPtr: TPtr; const pLay,pSubLay: SmallInt);
var
  ptrptrItem,ptrItem: pointer;
begin
Space.Lock.Enter;
try
if ((flDisabled) OR (pPtr = nilPtr)) then Exit; //. ->
//.
ptrptrItem:=ItemsAdrCach[pPtr];
if (ptrptrItem <> nil)
 then begin
  ptrItem:=Pointer(ptrptrItem^);
  with TSpaceObjectsContextRegistryItem(ptrItem^) do begin
  Lay:=pLay;
  SubLay:=pSubLay;
  end;
  end;
finally
Space.Lock.Leave;
end;
end;

procedure TSpaceObjectsContextRegistry.Remove(const pPtr: TPtr);
var
  ptrptrItem,ptrItem,ptrNextItem: pointer;
begin
Space.Lock.Enter;
try
if ((flDisabled) OR (pPtr = nilPtr)) then Exit; //. ->
//.
ptrptrItem:=ItemsAdrCach[pPtr];
if (ptrptrItem <> nil)
 then begin
  ptrItem:=Pointer(ptrptrItem^);
  ptrNextItem:=TSpaceObjectsContextRegistryItem(ptrItem^).Next;
  Pointer(ptrptrItem^):=ptrNextItem;
  if (ptrNextItem <> nil) then ItemsAdrCach[TSpaceObjectsContextRegistryItem(ptrNextItem^).Ptr]:=ptrptrItem;
  ItemsAdrCach[TSpaceObjectsContextRegistryItem(ptrItem^).Ptr]:=nil;
  //.
  FreeMem(ptrItem,SizeOf(TSpaceObjectsContextRegistryItem));
  Dec(ItemsCount);
  end;
finally
Space.Lock.Leave;
end;
end;

procedure TSpaceObjectsContextRegistry.GetObjects(out Objects: TPtrArray);
var
  SortedItems: pointer;
  ObjectsCount: integer;
  ptrItem,ptrptrSortedItem,ptrNewSortedItem,ptrDestroyItem: pointer;
  I: integer;
begin
SortedItems:=nil;
ObjectsCount:=0;
Space.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TSpaceObjectsContextRegistryItem(ptrItem^) do begin
  //. sorted insert
  GetMem(ptrNewSortedItem,SizeOf(TSpaceObjectsContextRegistryItem));
  TSpaceObjectsContextRegistryItem(ptrNewSortedItem^).Ptr:=Ptr;
  ptrptrSortedItem:=@SortedItems;
  while (Pointer(ptrptrSortedItem^) <> nil) do with TSpaceObjectsContextRegistryItem(Pointer(ptrptrSortedItem^)^) do begin
    if (LongWord(Ptr) > LongWord(TSpaceObjectsContextRegistryItem(ptrNewSortedItem^).Ptr)) then Break; //. >
    //.
    ptrptrSortedItem:=@Next;
    end;
  TSpaceObjectsContextRegistryItem(ptrNewSortedItem^).Next:=Pointer(ptrptrSortedItem^);
  Pointer(ptrptrSortedItem^):=ptrNewSortedItem;
  Inc(ObjectsCount);
  //.
  ptrItem:=Next;
  end;
//.
SetLength(Objects,ObjectsCount);
I:=0;
while (SortedItems <> nil) do begin
  ptrDestroyItem:=SortedItems;
  SortedItems:=TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Next;
  //.
  Objects[I]:=TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Ptr;
  Inc(I);
  //.
  FreeMem(ptrDestroyItem,SizeOf(TSpaceObjectsContextRegistryItem));
  end;
finally
Space.Lock.Leave;
end;
end;

procedure TSpaceObjectsContextRegistry.GetItemsSorted(out SortedItems: pointer; out oItemsCount: integer);
var
  ptrItem,ptrptrSortedItem,ptrNewSortedItem: pointer;
begin
SortedItems:=nil;
oItemsCount:=0;
Space.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TSpaceObjectsContextRegistryItem(ptrItem^) do begin
  //. sorted insert
  GetMem(ptrNewSortedItem,SizeOf(TSpaceObjectsContextRegistryItem));
  TSpaceObjectsContextRegistryItem(ptrNewSortedItem^).Ptr:=Ptr;
  TSpaceObjectsContextRegistryItem(ptrNewSortedItem^).Lay:=Lay;
  TSpaceObjectsContextRegistryItem(ptrNewSortedItem^).SubLay:=SubLay;
  ptrptrSortedItem:=@SortedItems;
  while (Pointer(ptrptrSortedItem^) <> nil) do with TSpaceObjectsContextRegistryItem(Pointer(ptrptrSortedItem^)^) do begin
    if (LongWord(Ptr) > LongWord(TSpaceObjectsContextRegistryItem(ptrNewSortedItem^).Ptr)) then Break; //. >
    //.
    ptrptrSortedItem:=@Next;
    end;
  TSpaceObjectsContextRegistryItem(ptrNewSortedItem^).Next:=Pointer(ptrptrSortedItem^);
  Pointer(ptrptrSortedItem^):=ptrNewSortedItem;
  Inc(oItemsCount);
  //.
  ptrItem:=Next;
  end;
finally
Space.Lock.Leave;
end;
end;

procedure TSpaceObjectsContextRegistry.GetItems(out FetchedItems: pointer);
var
  ptrItem,ptrNewItem: pointer;
begin
FetchedItems:=nil;
Space.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TSpaceObjectsContextRegistryItem(ptrItem^) do begin
  //. insert
  GetMem(ptrNewItem,SizeOf(TSpaceObjectsContextRegistryItem));
  TSpaceObjectsContextRegistryItem(ptrNewItem^).Next:=FetchedItems;
  TSpaceObjectsContextRegistryItem(ptrNewItem^).Ptr:=Ptr;
  TSpaceObjectsContextRegistryItem(ptrNewItem^).Lay:=Lay;
  TSpaceObjectsContextRegistryItem(ptrNewItem^).SubLay:=SubLay;
  FetchedItems:=ptrNewItem;
  //.
  ptrItem:=Next;
  end;
finally
Space.Lock.Leave;
end;
end;

procedure TSpaceObjectsContextRegistry.ClearOldObjects(const StartNumber: integer);
var
  ObjectsCount: integer;
  ptrItem,ptrDestroyItem: pointer;
begin
ObjectsCount:=0;
Space.Context_UpdateLock.Enter;
try
Space.Lock.Enter;
try
if (flDisabled) then Exit; //. ->
//.
ptrItem:=Items;
while (ptrItem <> nil) do with TSpaceObjectsContextRegistryItem(ptrItem^) do begin
  Inc(ObjectsCount);
  if (ObjectsCount >= StartNumber) then Break; //. ->
  ptrItem:=Next;
  end;
if (ptrItem = nil) then Exit; //. ->
//. clear rest objects cached state
while (TSpaceObjectsContextRegistryItem(ptrItem^).Next <> nil) do begin
  ptrDestroyItem:=TSpaceObjectsContextRegistryItem(ptrItem^).Next;
  TSpaceObjectsContextRegistryItem(ptrItem^).Next:=TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Next;
  ItemsAdrCach[TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Ptr]:=nil;
  //. clear cach
  Space.Obj_ClearCachedState(TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Ptr,false);
  //.
  FreeMem(ptrDestroyItem,SizeOf(TSpaceObjectsContextRegistryItem));
  Dec(ItemsCount);
  end;
finally
Space.Lock.Leave;
end;
finally
Space.Context_UpdateLock.Leave;
end;
end;

procedure TSpaceObjectsContextRegistry.GetFirstObjectsAndClearRest(const MaxNumber: integer; out Objects: TPtrArray);
var
  SortedItems: pointer;
  ObjectsCount: integer;
  ptrItem,ptrptrSortedItem,ptrNewSortedItem,ptrDestroyItem: pointer;
  I: integer;
begin
SortedItems:=nil;
ObjectsCount:=0;
Space.Context_UpdateLock.Enter;
try
Space.Lock.Enter;
try
if (flDisabled) then Exit; //. ->
//.
ptrItem:=Items;
while (ptrItem <> nil) do with TSpaceObjectsContextRegistryItem(ptrItem^) do begin
  //. sorted insert
  GetMem(ptrNewSortedItem,SizeOf(TSpaceObjectsContextRegistryItem));
  TSpaceObjectsContextRegistryItem(ptrNewSortedItem^).Ptr:=Ptr;
  ptrptrSortedItem:=@SortedItems;
  while (Pointer(ptrptrSortedItem^) <> nil) do with TSpaceObjectsContextRegistryItem(Pointer(ptrptrSortedItem^)^) do begin
    if (LongWord(Ptr) > LongWord(TSpaceObjectsContextRegistryItem(ptrNewSortedItem^).Ptr)) then Break; //. >
    //.
    ptrptrSortedItem:=@Next;
    end;
  TSpaceObjectsContextRegistryItem(ptrNewSortedItem^).Next:=Pointer(ptrptrSortedItem^);
  Pointer(ptrptrSortedItem^):=ptrNewSortedItem;
  Inc(ObjectsCount);
  //.
  if (ObjectsCount >= MaxNumber) then Break; //. ->
  ptrItem:=Next;
  end;
//.
SetLength(Objects,ObjectsCount);
I:=0;
while (SortedItems <> nil) do begin
  ptrDestroyItem:=SortedItems;
  SortedItems:=TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Next;
  //.
  Objects[I]:=TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Ptr;
  Inc(I);
  //.
  FreeMem(ptrDestroyItem,SizeOf(TSpaceObjectsContextRegistryItem));
  end;
//.
if (ptrItem = nil) then Exit; //. ->
//. clear rest objects cached state
while (TSpaceObjectsContextRegistryItem(ptrItem^).Next <> nil) do begin
  ptrDestroyItem:=TSpaceObjectsContextRegistryItem(ptrItem^).Next;
  TSpaceObjectsContextRegistryItem(ptrItem^).Next:=TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Next;
  ItemsAdrCach[TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Ptr]:=nil;
  //. clear cach
  Space.Obj_ClearCachedState(TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Ptr,false);
  //.
  FreeMem(ptrDestroyItem,SizeOf(TSpaceObjectsContextRegistryItem));
  Dec(ItemsCount);
  end;
finally
Space.Lock.Leave;
end;
finally
Space.Context_UpdateLock.Leave;
end;
end;

procedure TSpaceObjectsContextRegistry.ClearObjectsLaysInfo();
var
  ptrItem: pointer;
begin
Space.Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TSpaceObjectsContextRegistryItem(ptrItem^) do begin
  Lay:=-1;
  //.
  ptrItem:=Next;
  end;
finally
Space.Lock.Leave;
end;
end;


{TSpaceWindowUpdater}
Constructor TSpaceWindowUpdater.Create(const pSpace: TProxySpace; const Xmin,Ymin,Xmax,Ymax: Extended);
begin
Inherited Create;
Space:=pSpace;
CC.Xmin:=Xmin; CC.Ymin:=Ymin;
CC.Xmax:=Xmax; CC.Ymax:=Ymax;
Space.SpaceWindowUpdaters.Add(Self);
end;

Destructor TSpaceWindowUpdater.Destroy;
begin
Space.SpaceWindowUpdaters.Remove(Self);
Inherited;
end;



{TProxySpace}
Constructor TProxySpace.Create(const pSOAPServerURL: string; const pUserName,pUserPassword: string; const UserProxySpaceIndex: integer);
const
  RAMSize = 100*1024000; //. 100 Mb
  RegistrationUser = 'Register';
var
  SURL,UN,UP: WideString;
  SID: integer;
  BA: TByteArray;
  UserProxySpaces: TList;
  Size: integer;
  SpaceLaysID: integer;
  I: integer;
  flContextSpacePackLoaded: boolean;
  SavedContext_HistoryID: integer;
  Prms: string;
  idTStartObj,idStartObj: integer;

  procedure GetReleaseLevel();

    function ConvertReleaseLevelToDateTime(const S: string): TDateTime;
    var
      Days,Months,Years,Hours,Mins: integer;
    begin
    if (Length(S) < 6) then Raise Exception.Create('wrong ReleaseLevel string'); //. =>
    Days:=StrToInt(S[1]+S[2]);
    Months:=StrToInt(S[3]+S[4]);
    Years:=2000+StrToInt(S[5]+S[6]);
    Hours:=0;
    Mins:=0;
    if (Length(S) >= 8)
     then Hours:=StrToInt(S[7]+S[8])
     else
      if (Length(S) >= 10)
       then Mins:=StrToInt(S[9]+S[10]);
    Result:=EncodeDateTime(Years,Months,Days,Hours,Mins,0,0);
    end;

  const
    ReleaseInfoFile = 'ReleaseInfo';
  var
    RFN: string;
    Doc: IXMLDOMDocument;
    RootNode: IXMLDOMNode;
    VersionNode: IXMLDOMNode;
    Version: integer;
    ReleaseLevelNode: IXMLDOMNode;
    V: string;
  begin
  ReleaseLevel:=0.0;
  RFN:=ExtractFilePath(GetModuleName(HInstance))+ReleaseInfoFile;
  if (FileExists(RFN))
   then
    try
    Doc:=CoDomDocument.Create();
    Doc.Set_Async(false);
    Doc.Load(RFN);
    RootNode:=Doc.documentElement.selectSingleNode('/ROOT');
    VersionNode:=RootNode.selectSingleNode('Version');
    if (VersionNode <> nil)
     then Version:=VersionNode.nodeTypedValue
     else Version:=0;
    if (Version <> 1) then Raise Exception.Create('unknown release file version'); //. =>
    ReleaseLevelNode:=RootNode.selectSingleNode('Level');
    V:=ReleaseLevelNode.nodeTypedValue;
    ReleaseLevel:=ConvertReleaseLevelToDateTime(V);
    except
      On E: Exception do MessageDlg('Cannot get release information, error: '+E.Message, mtWarning, [mbOK], 0);
      end
   else MessageDlg('Release info file does not exist', mtWarning, [mbOK], 0);
  end;

  procedure AdjustProcessParameters;
  const
    SE_INC_BASE_PRIORITY_NAME = 'SeIncreaseBasePriorityPrivilege';
  var
    PrivelegeStr: string;
    hTok: THandle;
    tp: TTokenPrivileges;
    hProcess: HWND;
  begin
  PrivelegeStr:=SE_INC_BASE_PRIORITY_NAME;
  //. Get the current process token handle so we can get privilege.
  if (OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES + TOKEN_QUERY, hTok))
   then
    try
    //. Get the LUID for privilege.
    if (LookupPrivilegeValue(nil, PChar(PrivelegeStr), tp.Privileges[0].Luid))
     then begin
      tp.PrivilegeCount:=1; //. one privilege to set
      tp.Privileges[0].Attributes:=SE_PRIVILEGE_ENABLED;
      //. Get privilege for this process.
      if (AdjustTokenPrivileges(hTok, False, tp, 0, PTokenPrivileges(nil)^, PDWord(nil)^))
       then begin
        hProcess:=OpenProcess(PROCESS_SET_QUOTA, False, GetCurrentProcessId);
        if (hProcess <> 0)
         then
          try
          if (NOT SetProcessWorkingSetSize(hProcess,RAMSize,2*RAMSize))
           then SetProcessWorkingSetSize(hProcess,RAMSize DIV 2,RAMSize)
          finally
          CloseHandle(hProcess);
          end;
        end;
     end;
    finally
    CloseHandle(hTok);
    end
  end;

  procedure GetUserData;
  begin
  if (NOT flOffline)
   then with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,UserID)) do
    try
    Self.UserSecurityFileForCloneID:=idSecurityFileForClone;
    finally
    Release;
    end
   else UserSecurityFileForCloneID:=0;
  end;

  function IsUserDisabled(const idUser: integer): boolean;
  begin
  with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,UserID)) do
  try
  Result:=Disabled;
  finally
  Release;
  end;
  end;

  procedure InitializeOpenGL;
  var
    ColorDepth: integer;
  begin
  //. initialize OpenGL server 
  /// ? unitOpenGL3DSpace.Initialize;
  end;

  procedure CreateUserReflectors;
  var
    UserReflectors: TList;
    BA: TByteArray;
    I: integer;
  begin
  if (NOT flOffline)
   then with GetISpaceUserReflectors(SOAPServerURL) do begin
    BA:=GetUserReflectors(UserName,UserPassword, UserID);
    UserReflectors:=TList.Create;
    try
    ByteArray_PrepareList(BA, UserReflectors);
    for I:=UserReflectors.Count-1 downto 0 do with GetISpaceUserReflector(SOAPServerURL) do begin
      if IsEnabled(UserName,UserPassword, Integer(UserReflectors[I]))
       then
        try
        TReflectorsList(ReflectorsList).CreateReflectorByID(Integer(UserReflectors[I]));
        except
          On E: Exception do EventLog.WriteMajorEvent('Initialization','Could not create user reflector (ID: '+IntToStr(Integer(UserReflectors[I]))+')',E.Message);
          end;
      end;
    finally
    UserReflectors.Destroy;
    end;
    end
   else TReflectorsList(ReflectorsList).Add(TReflector.Create(Self,0)); 
  end;

  procedure ShowUserReflectors;
  var
    I: integer;
  begin
  with ReflectorsList do
  for I:=0 to Count-1 do
    if TObject(List[I]) is TReflector
     then with TReflector(List[I]) do Show()
     else
      if TObject(List[I]) is TGL3DReflector
       then with TGL3DReflector(List[I]) do Show;
  end;

var
  StartPanel: TForm;
begin
flNoContextSaving:=true;
//.
State:=psstCreating;
//.
Inherited Create;
//.
Lock:=TCriticalSection.Create; 
//.
GetReleaseLevel();
//.
ID:=-1;
SpacePackID:=-1;
//.
UserCompression:=1; //. Abbrevia zipping
UserEncryption:=1;  //. RC5 chipher
//.
idUserProxySpace:=0;
NotificationSubscription:=nil;
//.
FflAutomaticUpdateIsDisabled:=false;
FflOffline:=false;
//.
AdjustProcessParameters();
//.
ProxySpace:=Self; //. set proxyspace var for callbacks
//. last update time
Context_LastUpdatesTimeStamp:=Now;
//. set locale
WorkLocale:=ExtractFilePath(GetModuleName(HInstance));
ChDir(WorkLocale);
//. log creating
Log:=TfmLog.Create(Self);
Log.AlphaBlendValue:=220;
//.
if (ReleaseLevel <> 0.0)
 then Log.lbLogoHint.Caption:='v'+FormatDateTime('DDMMYY',TDateTime(ReleaseLevel))
 else Log.lbLogoHint.Caption:='?';
//. login
with Log do begin
if pSOAPServerURL <> '' then edServerURL.Text:=pSOAPServerURL;
if (pUserName <> '') AND (pUserPassword <> '')
 then begin
  edUserName.Text:=pUserName;
  edUserPassword.Text:=pUserPassword;
  sbExit.Hide;
  sbAbout.Hide;
  pnlServerURL.Hide;
  end
 else begin
  with TMODELServersHistory.Create do
  try
  if GetLast(SURL,SID,UN,UP)
   then begin
    if pSOAPServerURL = '' then edServerURL.Text:=SURL;
    if pUserName = '' then edUserName.Text:=UN;
    if pUserPassword = '' then edUserPassword.Text:=UP;
    end
   else SID:=-1;
  finally
  Destroy;
  end;
  //.
  ID:=SID;
  UserName:=edUserName.Text;
  UserPassword:=edUserPassword.Text;
  GetUserPasswordHash;
  //.
  ShowLoginPanel;
  try
  ShowModal;
  finally
  HideLoginPanel;
  end;
  end;
end;
Log.Show;
Application.ProcessMessages;
try
//.
User_SpaceWindow_Semaphore:=CreateSemaphore(nil,User_ReflectSpaceWindow_PoolSize,User_ReflectSpaceWindow_PoolSize,'');
User_SpaceWindow_ObjectCaching_Counter:=0;
//.
Context_UpdateLock:=TCriticalSection.Create;
//.
SpaceWindowUpdaters:=TThreadList.Create;
//.
flUpdating:=false;
//. setup interfaces
Log.OperationStarting('START ...');
try
Log.OperationProgress(0);
//.
SOAPServerURL:=Log.edServerURL.Text;
SOAPServerAddress:=SOAPServerURL;
SetLength(SOAPServerAddress,Pos(ANSIUpperCase('SpaceSOAPServer.dll'),ANSIUpperCase(SOAPServerAddress))-2);
I:=Pos('http://',SOAPServerAddress);
if (I = 1) then SOAPServerAddress:=Copy(SOAPServerAddress,8,Length(SOAPServerAddress)-7);
I:=Pos(':',SOAPServerAddress);
if (I > 0) then SetLength(SOAPServerAddress,I-1);
//.
UserName:=Log.edUserName.Text;
UserPassword:=Log.edUserPassword.Text;
GetUserPasswordHash();
//.
ProxySpaceServerType:=pssClient;
if (unitSpaceFunctionalServer.flYes) then ProxySpaceServerType:=pssFunctional else
if (unitAreaNotificationServer.flYes) then ProxySpaceServerType:=pssAreaNotification ;
if (ProxySpaceServerType <> pssClient)
 then begin
  UserCompression:=0; //. no compression
  UserEncryption:=0;  //. no encryption
  end;
//.
Log.OperationProgress(10);
if flDebugging then Log.Log_Write('getting interfaces');
GlobalSpaceManagerLock:=TCriticalSection.Create;
GlobalSpaceManager:=GetISpaceManager(SOAPServerURL);
if (GlobalSpaceManager = nil) then Raise Exception.Create('! no GlobalSpaceManager.'); //. =>
GlobalSpaceRemoteManagerLock:=TCriticalSection.Create;
GlobalSpaceRemoteManager:=GetISpaceRemoteManager(SOAPServerURL);
if (GlobalSpaceRemoteManager = nil) then Raise Exception.Create('! no GlobalSpaceRemoteManager.'); //. =>
Log.OperationProgress(30);
//. getting server params
if (NOT flOffline)
 then
  try
  GetISpaceReports(SOAPServerURL).AllHistory_GetParams2({out} Context_HistoryID,{out} Context_History_ItemLifeTime,{out} StayUpToDate__ContextV0_ComponentsMaxCount,{out} StayUpToDate__ContextV0_ReflectionsMaxCount,{out} StayUpToDate__ContextV0_VisualizationsMaxCount);
  except
    flOffline:=true;
    end;
//.
if (flOffline AND (MessageDlg('Server is currently unavailable or authentication failed.'#$0D#$0A'Do you want to start the program in offline mode using last cached context?', mtWarning, [mbNo,mbYes], 0) <> mrYes)) then Raise EAbort.Create('Program terminated by user'); //. =>
//.
if (flOffline)
 then begin //. set offline mode values
  StayUpToDate__ContextV0_ComponentsMaxCount:=16000;
  StayUpToDate__ContextV0_ReflectionsMaxCount:=128;
  StayUpToDate__ContextV0_VisualizationsMaxCount:=8000;
  end;
//. getting space params
if (NOT flOffline)
 then GlobalSpaceManager.GetSpaceParams({out} ID,SpacePackID,Size,SpaceLaysID)
 else begin //. set offline mode values
  SpacePackID:=0; 
  Size:=0;
  SpaceLaysID:=0;
  end;
//. user data getting
if flDebugging then Log.Log_Write('getting user proxyspace');
if (NOT flOffline)
 then with GetISpaceUserProxySpaces(SOAPServerURL) do begin
  BA:=GetUserProxySpaces(UserName,UserPassword,UserID);
  UserProxySpaces:=TList.Create;
  try
  ByteArray_PrepareList(BA, UserProxySpaces);
  if UserProxySpaces.Count > 0
   then
    if UserProxySpaces.Count = 1
     then
      idUserProxySpace:=Integer(UserProxySpaces[0])
     else
      if (0 <= UserProxySpaceIndex) AND (UserProxySpaceIndex < UserProxySpaces.Count)
       then
        idUserProxySpace:=Integer(UserProxySpaces[UserProxySpaceIndex])
       else with TfmUserProxySpaces.Create(Self, UserID) do
        try
        Select(idUserProxySpace);
        finally
        Destroy;
        end;
  finally
  UserProxySpaces.Destroy;
  end;
  end;
//.
Functionality.TypesSystem.Space:=Self;
//. types system initialization
TypesFunctionality.Initialize;
//. Types system assigning
TypesSystem:=Functionality.TypesSystem;
//. 
if (NOT flOffline)
 then with TMODELServerFunctionality(TComponentFunctionality_Create(idTMODELServer,0)) do
  try
  UserID:=GetUserID(UserName,UserPassword);
  finally
  Release;
  end
 else UserID:=0; //. set offline mode values
//. check for user disable
if flDebugging then Log.Log_Write('check for user disable');
if ((NOT flOffline) AND IsUserDisabled(UserID))
 then begin
  ShowMessage('User disabled');
  Halt(1); //. ==>
  end;
//. read user proxy space local settings
with TProxySpaceUserProfile.Create(Self) do
try
if (ProgramConfiguration.ProxySpace_flSynchronizeUserProfileWithServer AND (NOT flOffline))
 then
  try
  Log.Log_Write('loading user profile ... ');
  try
  SynchronizeLocalFolderWithServerUserFolder(IntToStr(idUserProxySpace){ProxySpace folder},ProxySpacesProfileFolder,ServerUserProxySpaceProfiles);
  finally
  Log.Log_Write('starting ...');
  end;
  except
    On E: Exception do ShowMessage('unable to update user profile from server folder: '+E.Message);
    end;
//. initialize user event log
unitEventLog.Initialize(ProfileFolder+'\'+'UserEventLog.xml');
//.
if flDebugging then Log.Log_Write('configuration creating');
Configuration:=TProxySpaceConfiguration.Create(Self);
//.
SetProfileFile('UserProxySpace.cfg');
with TINIFile.Create(ProfileFile) do
try
ContextItemsMaxCount:=ReadInteger('ProxySpace','CachedObjectsMaxCount',0);
StayUpToDate_flNoComponentsContext:=(ReadInteger('ProxySpace','NoComponentsContextForUpdateFlag',0) = 1);
flActionsGroupCall:=(ReadInteger('Other','UseActionsGroupCall',1) = 1);
finally
Destroy;
end;
finally
Destroy;
end;
//. configuration creating
Log.OperationProgress(40);
//. space initializing
if flDebugging then Log.Log_Write('space initializing');
LocalStorage:=nil;
Case Status of
pssNormal,pssNormalDisconnected: LocalStorage:=TRealMemory.Create(0,Size,true);
pssRemoted: LocalStorage:=TSegMemory.Create();
pssRemotedBrief: LocalStorage:=TVirtualMemory.Create();
end;
//.
ptrRootObj:=0;
//.
ObjectsContextRegistry:=TSpaceObjectsContextRegistry.Create(Self);
//.
Obj_UpdateLocal__List:=TThreadList.Create;
//.
StayUpToDate_Monitor:=TfmProxySpaceUpdatesMonitor.Create(Self);
//.
Log.OperationProgress(50);
//.
InitializeOpenGL;
//. look for saved context
with TProxySpaceSavedUserContext.Create(Self) do
try
Context_flLoaded:=IsContextFound(ContextFileName);
if (Context_flLoaded)
 then begin
  if (NOT flOffline)
   then begin
    Context_flLoaded:=SavedUserContext_GetParams({out} SavedContext_HistoryID);
    if (Context_flLoaded)
     then begin
      Context_flLoaded:=(SavedContext_HistoryID = Context_HistoryID);
      if (NOT Context_flLoaded)
       then begin
        RemoveSavedUserContext() //. remove stored context
        {///- if (flServer OR (MessageDlg('To prevent context data inconsistency it is strongly recommented to remove this context.'#$0D#$0A'Remove it ?', mtWarning, [mbNo,mbYes], 0) = mrYes))
         then RemoveSavedUserContext() //. remove stored context
         else Context_flLoaded:=true;}
        end;
      end;
    end;
  if (Context_flLoaded)
   then begin
    Log.Log_Write('loading cached context ...');
    try
    Context_flLoaded:=LoadSpaceContext(ContextFileName, flContextSpacePackLoaded);
    finally
    Log.Log_Write('starting ...');
    end;
    end;
  end;
finally
Destroy;
end;
if (NOT Context_flLoaded)
 then begin
  if (flOffline) then Raise Exception.Create('can not start program in offline mode without the saved context'); //. =>
  //. reinit space
  ClearSpaceContext();
  end
 else begin
  if (NOT flOffline)
   then begin
    if (flContextSpacePackLoaded)
     then begin
      if (SpaceLaysID <> LaysID())
       then begin
        LoadSpaceStructure();
        //. clear lay-info of loaded space pack objects
        ObjectsContextRegistry.ClearObjectsLaysInfo();
        end;
      end
     else LoadSpaceStructure();
    if (SpaceLaysID <> LaysID()) then Raise Exception.Create('wrong space lays structure'); //. =>
    end;
  end;
//. process on type context is processed
TTypesSystem(TypesSystem).DoOnContextIsInitialized();
//. create Notification-Subscription object
NotificationSubscription:=TSpaceNotificationSubscription.Create(Self);
//.
InitializePlugins();
//.
flNoContextSaving:=false;
//.
Log.OperationProgress(70);
//. representations creating
ReflectorsList:=TReflectorsList.Create(Self);
PropsPanels:=TList.Create;
//.
Log.Log_Write('create user windows ...');
try
CreateUserReflectors;
finally
Log.Log_Write('starting ...');
end;
//.
if (ReflectorsList.Count > 0) then TTypesSystem(TypesSystem).Reflector:=TReflector(ReflectorsList[0]);
//.
Log.OperationProgress(80);
//.
if flDebugging then Log.Log_Write('GetUserDATA');
GetUserDATA();
//. update space context if it is loaded
if ((NOT flOffline) AND Context_flLoaded)
 then
  try
  Log.Log_Write('updating cached context ...');
  try
  StayUpToDate(false);
  finally
  Log.Log_Write('starting ...');
  end;
  except
    //. catch all of the removed objects exceptions
    end;
//. start notification subscription if that is valid
with TSpaceNotificationSubscription(NotificationSubscription) do begin
OnUpdatesReceived:=NotificationSubscription_DoOnUpdatesReceived;
Start();
end;
//.
State:=psstWorking;
//. show registration form if required
if flRegistrationAllowed
 then begin
  if Log.flRegistrationRequired OR (UserName = RegistrationUser) then with TfmRegistration.Create(Self) do Show;
  end
 else
  ShowMessage('Registration is disabled in this version. Use other resistration methods');
//.
Log.OperationProgress(100);
finally
Log.OperationDone;
end;
//.
ProcessOnInitializationEndTasks;
//. initializing updating
Context_Updating:=TProxySpaceUpdating.Create(Self);
//. create incoming messages getting thread
UserIncomingMessages:=TProxySpaceUserIncomingMessages.Create(Self);
//. assigning user chat unit and start
UserIncomingMessages.OnUserChatMessages:=unitUserChat.DoOnUserChatMessages;
UserIncomingMessages.Resume;
//.
ControlPanel:=TfmProxySpaceControlPanel.Create(Self);
//.
if (NOT flOffline AND Configuration.flComponentsPanelsHistoryOn)
 then
  ComponentsPanelsHistory:=TfmComponentsPanelsHistory.Create(Self)
 else ;
  ComponentsPanelsHistory:=nil;
//. show start component if exist
if (NOT flOffline)
 then
  try
  with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,UserID)) do
  try
  GetStartObj(idTStartObj,idStartObj);
  if idStartObj <> 0
   then with TComponentFunctionality_Create(idTStartObj,idStartObj) do
    try
    with TPanelProps_Create(false,0,nil,nilObject) do begin
    Position:=poScreenCenter;
    Show;
    end;
    finally
    Release;
    end;
  finally
  Release;
  end;
  except
    On E: Exception do EventLog.WriteMajorEvent('Initialization','Unable to get "Start object".',E.Message);
    end;
//.
EventLog.WriteInfoEvent('initialization','user "'+UserName+'" is logged successfully.');
//.
if (unitSpaceFunctionalServer.flYes) then unitSpaceFunctionalServer.Initialize();
if (unitAreaNotificationServer.flYes) then unitAreaNotificationServer.Initialize();
//.
flStartedInOffline:=flOffline;
{$IFDEF SpaceWindowReflectingTesting}
fmProxySpaceSpaceWindowReflectingTesting:=TfmProxySpaceSpaceWindowReflectingTesting.Create(Self);
fmProxySpaceSpaceWindowReflectingTesting.Show();
{$ENDIF}
//. reflectors showing
ShowUserReflectors();
finally
Log.Hide;
Log.AlphaBlendValue:=200;
end;
//. show start panel if it is allowed
if (ProxySpaceServerType = pssClient)
 then begin
  StartPanel:=Plugins__GetStartPanel(true);
  if (StartPanel <> nil) then StartPanel.Show();
  end;
end;

Destructor TProxySpace.Destroy;
var
  I: integer;
begin
{$IFDEF SpaceWindowReflectingTesting}
FreeAndNil(fmProxySpaceSpaceWindowReflectingTesting);
{$ENDIF}
if (unitSpaceFunctionalServer.flYes) then unitSpaceFunctionalServer.Finalize();
if (unitAreaNotificationServer.flYes) then unitAreaNotificationServer.Finalize();
//.
EventLog.WriteInfoEvent('finalization','user "'+UserName+'" is logged out.');
//.
if (State = psstCreating)
 then begin
  State:=psstDestroying;
  //.
  UserIncomingMessages.Free();
  //.
  Context_Updating.Free();
  //.
  NotificationSubscription.Free();
  //.
  ControlPanel.Free();
  //.
  FreeAndNil(ReflectorsList);
  //.
  FreeAndNil(PropsPanels);
  //.
  FinalizePlugins();
  //.
  if (SpaceWindowUpdaters <> nil)
   then with SpaceWindowUpdaters.LockList() do
    try
    while (Count > 0) do TSpaceWindowUpdater(Items[0]).Destroy();
    finally
    SpaceWindowUpdaters.UnlockList();
    end;
  //.
  ProxySpace:=nil;
  //.
  StayUpToDate_Monitor.Free();
  //.
  Obj_UpdateLocal__List.Free();
  //.
  ObjectsContextRegistry.Free();
  //.
  LocalStorage.Free();
  //.
  GlobalSpaceRemoteManagerLock.Free();
  GlobalSpaceManagerLock.Free();
  //.
  SpaceWindowUpdaters.Free();
  //.
  Context_UpdateLock.Free();
  //.
  if (User_SpaceWindow_Semaphore <> 0) then CloseHandle(User_SpaceWindow_Semaphore);
  //.
  Configuration.Free();
  //. types system finalizing
  TypesFunctionality.Finalize();
  //.
  Log.Free();
  //.
  Lock.Free();
  //.
  Inherited;
  Exit; //. ->
  end;
State:=psstDestroying;
try
//.
Log.AlphaBlendValue:=220;
Log.OperationStarting('STOPPING ... ');
Log.OperationProgress(100);
try
if (flDebugging) then Log.Log_Write('UserIncomingMessages.Free');
UserIncomingMessages.Free();
//.
if (flDebugging) then Log.Log_Write('Updating.Free');
Context_Updating.Free();
//.
if (flDebugging) then Log.Log_Write('NotificationSubscription.Free');
NotificationSubscription.Free();
//.
if (flDebugging) then Log.Log_Write('ControlPanel.Free');
ControlPanel.Free();
//. freeing representations
if (flDebugging) then Log.Log_Write('FreeAndNil(ReflectorsList)');
FreeAndNil(ReflectorsList);
//.
if (flDebugging) then Log.Log_Write('FreeAndNil(PropsPanels)');
FreeAndNil(PropsPanels);
//.
Log.OperationProgress(80);
//.
if (flDebugging) then Log.Log_Write('FinalizePlugins');
FinalizePlugins();
//.
if flDebugging then Log.Log_Write('Freeing SpaceWindowUpdaters');
if (SpaceWindowUpdaters <> nil)
 then with SpaceWindowUpdaters.LockList() do
  try
  while (Count > 0) do TSpaceWindowUpdater(Items[0]).Destroy();
  finally
  SpaceWindowUpdaters.UnlockList();
  end;
//.
Log.OperationProgress(60);
//. context operation
try
if (NOT flNoContextSaving)
 then with TProxySpace(ProxySpace) do begin //. saving used context
  Log.Log_Write('saving cached context ... ');
  try
  SaveUserSpaceContext();
  finally
  Log.Log_Write('stopping ... ');
  end;
  end
 else with TProxySpaceSavedUserContext.Create(Self) do
  try
  DestroyContext(ContextFileName);
  finally
  Destroy();
  end;
except
  On E: Exception do EventLog.WriteMajorEvent('Finalization','Error on context operation.',E.Message);
  end;
//.
Log.OperationProgress(40);
//.
StayUpToDate_Monitor.Free();
//.
Obj_UpdateLocal__List.Free();
//.
ObjectsContextRegistry.Free();
//.
Log.OperationProgress(20);
//. finalize OpenGLSpace
/// ? unitOpenGL3DSpace.Finalize;
//.
if (flDebugging) then Log.Log_Write('LocalStorage.Free');
LocalStorage.Free();
//.
GlobalSpaceRemoteManagerLock.Free();
GlobalSpaceManagerLock.Free();
//.
SpaceWindowUpdaters.Free();
//.
Context_UpdateLock.Free();
//.
if (User_SpaceWindow_Semaphore <> 0) then CloseHandle(User_SpaceWindow_Semaphore);
//.
Configuration.Free();
//. remove temp files
ClearTempData();
except
  On E: Exception do EventLog.WriteMajorEvent('Finalization','Error during ProxySpace finalization.',E.Message);
  end;
//. finalize eventlog
unitEventLog.Finalize();
//.
if (ProgramConfiguration.ProxySpace_flSynchronizeUserProfileWithServer AND (NOT flOffline))
 then
  try
  Log.Log_Write('saving user profile ... ');
  try
  with TProxySpaceUserProfile.Create(Self) do
  try
  SynchronizeLocalFolderWithServerUserFolder(IntToStr(idUserProxySpace){ProxySpace folder},ProxySpacesProfileFolder,ServerUserProxySpaceProfiles);
  finally
  Destroy;
  end;
  finally
  Log.Log_Write('stopping ... ');
  end;
  except
    On E: Exception do ShowMessage('unable to update server user profile folder: '+E.Message);
    end;
//. logging out
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,UserID)) do
try
Logout();
finally
Release;
end;
//. types system finalizing
if (flDebugging) then Log.Log_Write('TypesFunctionality.Finalize');
TypesFunctionality.Finalize();
//.
ProxySpace:=nil;
//.
Log.OperationProgress(0);
//.
finally
Log.OperationDone();
end;
//.
Log.Free();
//.
Lock.Free();
//.
Inherited;
end;

procedure TProxySpace.ClearTempData();

  procedure EmptyFolder(const Folder: string; const flDeleteFolder: boolean = false);
  var
    sr: TSearchRec;
    FN: string;
  begin
  if (SysUtils.FindFirst(Folder+'\*.*', faAnyFile-faDirectory, sr) = 0)
   then
    try
    repeat
      if (NOT ((sr.Name = '.') OR (sr.Name = '..')))
       then begin
        FN:=Folder+'\'+sr.name;
        SysUtils.DeleteFile(FN);
        end;
    until SysUtils.FindNext(sr) <> 0;
    finally
    SysUtils.FindClose(sr);
    end;
  if (SysUtils.FindFirst(Folder+'\*.*', faDirectory, sr) = 0)
   then
    try
    repeat
      if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND ((sr.Attr and faDirectory) = faDirectory)) then EmptyFolder(Folder+'\'+sr.name,true);
    until SysUtils.FindNext(sr) <> 0;
    finally
    SysUtils.FindClose(sr);
    end;
  if (flDeleteFolder) then SysUtils.RemoveDir(Folder);
  end;

begin
EmptyFolder(PathDesigner);
EmptyFolder(PathTempDATA)
end;

procedure TProxySpace.setflAutomaticUpdateIsDisabled(Value: boolean);
begin
if (Value = FflAutomaticUpdateIsDisabled) then Exit; //. ->
//.
FflAutomaticUpdateIsDisabled:=Value;
//.
if (NOT FflAutomaticUpdateIsDisabled) then StayUpToDate(false);
end;

procedure TProxySpace.setflOffline(Value: boolean);
begin
if (Value = FflOffline) then Exit; //. ->
//.
if (Value AND ((NotificationSubscription <> nil) AND (TSpaceNotificationSubscription(NotificationSubscription).IsValid))) then TSpaceNotificationSubscription(NotificationSubscription).flFinalize:=true;
//.
FflOffline:=Value;
//.
if (NOT Value AND ((NotificationSubscription <> nil) AND (TSpaceNotificationSubscription(NotificationSubscription).IsValid))) then TSpaceNotificationSubscription(NotificationSubscription).flReinitialize:=true;
//.
if (NOT FflOffline)
 then begin //. update proxy-space and reflectors
  TReflectorsList(ReflectorsList).RecalcReflect(-1);
  StayUpToDate(false);
  end;
end;

procedure TProxySpace.GetUserPasswordHash;
begin
UserPasswordHash:=THash_MD5.CalcString(nil, UserPassword);
end;

function TProxySpace.IsROOTUser(): boolean;
begin
Result:=(UserName = 'ROOT');
end;

function TProxySpace.ServerIsLocal(): boolean;
begin
Result:=(SOAPServerURL = 'http://127.0.0.1/SpaceSOAPServer.dll'); 
end;

procedure TProxySpace.LoadSpaceStructure;
const
  SizeOfTSpaceObj = SizeOf(TSpaceObj);
  SizeOfTPoint = SizeOf(TPoint);
var
  ObjPointers,Objects: TByteArray;
  ptrObjectsBuffer,ptrSrs: pointer;
  ObjectsCount: integer;
  I: integer;
  Obj: TSpaceObj;
  ptrObj: TPtr;
begin
SetLength(ObjPointers,0);
GlobalSpaceManagerLock.Enter;
try
Objects:=GlobalSpaceManager.ReadObjects(UserName,UserPassword, ObjPointers,0);
finally
GlobalSpaceManagerLock.Leave;
end;
ptrObjectsBuffer:=@Objects[0];
//. cashing types system
ptrSrs:=ptrObjectsBuffer;
ObjectsCount:=Length(Objects) DIV SizeOfTSpaceObj;
TTypesSystem(TypesSystem).Caching_Start;
try
for I:=0 to ObjectsCount-1 do begin
  //. get object body
  asm
     PUSH ESI
     PUSH EDI
     MOV ESI,ptrSrs
     CLD
     LEA EDI,Obj
     MOV ECX,SizeOfTSpaceObj
     REP MOVSB
     MOV ptrSrs,ESI
     POP EDI
     POP ESI
  end;
  //. add object for cashing
  if Obj.idObj <> 0 then TTypesSystem(TypesSystem).Caching_AddObject(Obj.idTObj,Obj.idObj);
  end;
finally
TTypesSystem(TypesSystem).Caching_Finish;
end;
//. write objects
ptrObj:=ptrRootObj;
ptrSrs:=ptrObjectsBuffer;
for I:=0 to ObjectsCount-1 do begin
  //. get object body
  asm
     PUSH ESI
     PUSH EDI
     MOV ESI,ptrSrs
     CLD
     LEA EDI,Obj
     MOV ECX,SizeOfTSpaceObj
     REP MOVSB
     MOV ptrSrs,ESI
     POP EDI
     POP ESI
  end;
  //. write body
  Lock.Enter;
  try
  WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
  finally
  Lock.Leave;
  end;
  ptrObj:=Obj.ptrListOwnerObj;
  end;
end;

function TProxySpace.TObj_Ptr(const idTObj,idObj: integer): TPtr;
var
  rsPtr: TPtr;

  function FindedResult(ptrObj: TPtr): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Result:=false;
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  if (Obj.idTObj = idTObj) AND (Obj.idObj = idObj)
   then begin
    rsPtr:=ptrObj;
    Result:=true;
    Exit;
    end;
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
   ReadObj(Obj,SizeOf(TSpaceObj), ptrOwnerObj);
   if FindedResult(ptrOwnerObj)
    then begin
     Result:=true;
     Exit;
     end;
   ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
   end;
  end;

begin
Result:=nilPtr;
case Status of
pssNormal,pssNormalDisconnected: begin
  if FindedResult(ptrRootObj)
   then Result:=rsPtr
   else Result:=nilPtr;
  end;
pssRemoted,pssRemotedBrief: begin
  GlobalSpaceRemoteManagerLock.Enter;
  try
  Result:=GlobalSpaceRemoteManager.Obj_Ptr(idTObj,idObj);
  finally
  GlobalSpaceRemoteManagerLock.Leave;
  end;
  end;
end;
end;

function TProxySpace.Obj_PtrPtr(const idTObj,idObj: integer): TPtr;
var
  Res: TPtr;

  function Get(const ptrptrObj: TPtr): boolean;
  var
    ptrObject,ptrNextObject: TPtr;
    Obj: TSpaceObj;
    ptrptrOwnerObj,ptrOwnerObj: TPtr;
  begin
  Result:=false;
  if ptrptrObj = nilPtr
   then ptrObject:=ptrRootObj
   else ReadObj(ptrObject,SizeOf(ptrObject), ptrptrObj);

  ReadObj(Obj,SizeOf(Obj), ptrObject);
  if ((Obj.idTObj = idTObj) AND (Obj.idObj = idObj))
   then begin
    Res:=ptrptrObj;
    Result:=true;
    Exit;
    end;

  ptrOwnerObj:=Obj.ptrListOwnerObj;
  ptrptrOwnerObj:=ptrObject+ofsptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
    Result:=Get(ptrptrOwnerObj);
    if Result then Exit;
    ptrptrOwnerObj:=ptrOwnerObj;
    ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrptrOwnerObj);
    end;
  end;

begin
case Status of
pssNormal,pssNormalDisconnected: begin
  Res:=nilPtr;
  Get(nilPtr);
  Result:=Res;
  end;
pssRemoted,pssRemotedBrief: begin
  /// +
  end;
end;

end;

function TProxySpace.Obj_GetCenter(var Xc,Yc: Extended; ptrSelf: TPtr): boolean;
var
  Obj: TSpaceObj;
  sumX,sumY: Extended;
  PointCount: integer;

  procedure TreateObj(const ptrObj: TPtr);
  var
    Obj: TSpaceObj;
    ptrPoint: TPtr;
    Point: TPoint;
    ptrOwnerObj: TPtr;
  begin
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  ptrPoint:=Obj.ptrFirstPoint;
  while ptrPoint <> nilPtr do begin
    ReadObj(Point,SizeOf(TPoint), ptrPoint);
    sumX:=sumX+Point.X;
    sumY:=sumY+Point.Y;           
    Inc(PointCount);
    ptrPoint:=Point.ptrNextObj;
    end;
  //. обрабатываем собственные объекты
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ptrOwnerObj <> nilPtr do begin
    TreateObj(ptrOwnerObj);
    ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
    end;
  end;



begin
Result:=false;
sumX:=0;sumY:=0;
PointCount:=0;
Lock.Enter;
try
TreateObj(ptrSelf);
finally
Lock.Leave;
end;
if (PointCount = 0) then Raise Exception.Create('object has no points'); //. =>
Xc:=sumX/PointCount;
Yc:=sumY/PointCount;
Result:=true;
end;

function TProxySpace.Obj_GetMinMax(var minX,minY,maxX,maxY: Extended; const ptrSelf: TPtr): boolean;
var
  SelfObj: TSpaceObj;
  Xmin,Ymin, Xmax,Ymax: Double;
begin
ReadObj(SelfObj,SizeOf(SelfObj), ptrSelf);
Result:=Obj_GetMinMax(minX,minY,maxX,maxY, SelfObj);
end;

function TProxySpace.Obj_GetMinMax(var minX,minY,maxX,maxY: Extended; const SelfObj: TSpaceObj): boolean;
var
  ptrPoint: TPtr;
  Point: TPoint;
  I: integer;
begin
Result:=false;
Lock.Enter;
try
if (SelfObj.Width > 0)
  then begin
  with TSpaceObjPolylinePolygon.Create(Self,SelfObj) do
  try
  minX:=Nodes[0].X;minY:=Nodes[0].Y;
  maxX:=Nodes[0].X;maxY:=Nodes[0].Y;
  for I:=1 to Count-1 do with Nodes[I] do begin
    if X < minX
     then minX:=X
     else
      if X > maxX
       then maxX:=X;
    if Y < minY
     then minY:=Y
     else
      if Y > maxY
       then maxY:=Y;
    end;
  finally
  Destroy;
  end;
  Result:=true;
  Exit; // ->
  end;
ptrPoint:=SelfObj.ptrFirstPoint;
if ptrPoint = nilPtr then Exit;
ReadObj(Point,SizeOf(TPoint), ptrPoint);
minX:=Point.X;minY:=Point.Y;
maxX:=Point.X;maxY:=Point.Y;
ptrPoint:=Point.ptrNextObj;
while (ptrPoint <> nilPtr) do begin
  ReadObj(Point,SizeOf(TPoint), ptrPoint);
  if Point.X < minX
   then minX:=Point.X
   else
    if Point.X > maxX
     then maxX:=Point.X;
  if Point.Y < minY
   then minY:=Point.Y
   else
    if Point.Y > maxY
     then maxY:=Point.Y;
  ptrPoint:=Point.ptrNextObj;
  end;
finally
Lock.Leave;
end;
Result:=true;
end;

function TProxySpace.Obj_GetLevel(var Level: integer; ptrSelf: integer): boolean;
var
  curLevel: integer;

    procedure TreateObj(ptrObject: TPtr);
    var
      Obj: TSpaceObj;
      ptrOwnerObj: TPtr;
    begin
    if ptrObject = ptrSelf
     then begin
      Level:=curLevel;
      Result:=true;
      Exit;
      end;
    ReadObj(Obj,SizeOf(Obj), ptrObject);
    Inc(curLevel);
    ptrOwnerObj:=Obj.ptrListOwnerObj;
    While ptrOwnerObj <> nilPtr do begin
     TreateObj(ptrOwnerObj);
     if Result then Exit;
     ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
     end;
    Dec(curLevel);
    end;

begin
Result:=false;
Level:=-1;
curLevel:=0;
TreateObj(ptrRootObj);
end;

function TProxySpace.Obj_idLay(const ptrObj: TPtr): integer;
var
  Res: integer;

  function TreateObj(const ptrObject: TPtr; idLay: integer): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Result:=false;
  if ptrObject = ptrObj
   then begin
    Res:=idLay;
    Result:=true;
    Exit; //. ->
    end;
  ReadObj(Obj,SizeOf(Obj), ptrObject);
  if Obj.idTObj = idTLay2DVisualization then idLay:=Obj.idObj;
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
    if TreateObj(ptrOwnerObj, idLay)
     then begin
      Result:=true;
      Exit; //. ->
      end;
    ReadObj(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
    end;
  end;

var
  Lay,SubLay: integer;
begin
case Status of
pssNormal,pssNormalDisconnected: begin
  if ptrObj = nilPtr
   then begin
    Result:=0;
    Exit; //. ->
    end;
  Res:=0;
  TreateObj(ptrRootObj, 0);
  Result:=Res;
  if (Result = 0) then Raise Exception.Create('Obj_idLay: lay not found'); //. =>
  end;
pssRemoted,pssRemotedBrief: begin
  GlobalSpaceRemoteManagerLock.Enter;
  try
  GlobalSpaceRemoteManager.Obj_GetLayInfo(ptrObj, Result,Lay,SubLay);
  finally
  GlobalSpaceRemoteManagerLock.Leave;
  end;
  if (Result = 0) then Raise Exception.Create('Obj_idLay: lay not found'); //. =>
  end;
end;
end;

procedure TProxySpace.Obj_GetLayLevel(var Level: integer; ptrSelf: integer);

  function TreateObj(const ptrObject: TPtr; curLevel: integer): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Result:=false;
  if ptrObject = ptrSelf
   then begin
    Level:=curLevel;
    Result:=true;
    Exit; //. ->
    end;
  ReadObj(Obj,SizeOf(Obj), ptrObject);
  if Obj.idTObj = idTLay2DVisualization then Inc(curLevel);
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
    if TreateObj(ptrOwnerObj, curLevel)
     then begin
      Result:=true;
      Exit; //. ->
      end;
    ReadObj(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
    end;
  end;

begin
case Status of
pssNormal,pssNormalDisconnected: begin
  Level:=-1;
  TreateObj(ptrRootObj, 0);
  end;
pssRemoted,pssRemotedBrief: begin
  GlobalSpaceRemoteManagerLock.Enter;
  try
  GlobalSpaceRemoteManager.Obj_GetLevel(Level,ptrSelf);
  finally
  GlobalSpaceRemoteManagerLock.Leave;
  end;
  end;
end;
end;

procedure TProxySpace.Obj_GetLayInfo(const ptrObj: TPtr; var Lay: integer; var SubLay: integer);

  function TreateObj(const ptrObject: TPtr; curLay,curSubLay: integer): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Result:=false;
  if ptrObject = ptrObj
   then begin
    Lay:=curLay;
    SubLay:=curSubLay;
    Result:=true;
    Exit;
    end;
  ReadObj(Obj,SizeOf(Obj), ptrObject);
  if Obj.idTObj = idTLay2DVisualization
   then begin
    Inc(curLay);
    curSubLay:=0;
    end
   else
    inc(curSubLay);
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
    if TreateObj(ptrOwnerObj, curLay,curSubLay)
     then begin
      Result:=true;
      Exit;
      end;
    ReadObj(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
    end;
  end;

var
  idLay: integer;
  GSM: ISpaceRemoteManager;
  FStream: pointer;
begin
case Status of
pssNormal,pssNormalDisconnected: begin
  Lay:=-1;
  SubLay:=-1;
  TreateObj(ptrRootObj, 0,0);
  end;
pssRemoted,pssRemotedBrief: begin
  GlobalSpaceRemoteManagerLock.Enter;
  try
  GlobalSpaceRemoteManager.Obj_GetLayInfo(ptrObj, idLay,Lay,SubLay);
  finally
  GlobalSpaceRemoteManagerLock.Leave;
  end;
  if (idLay = 0) then Raise Exception.Create('Obj_idLay: lay not found'); //. =>
  end;
end;
end;

procedure TProxySpace.Obj_GetObjAround(var vptrObj: TPtr; ptrSelf: TPtr);
begin
Raise Exception.Create('not supported'); //. => 
end;

function TProxySpace.Obj_Owner(ptrSelf: TPtr): TPtr;
var
  Res: TPtr;

  function OwnerFinding(ptrObj: TPtr): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Result:=false;
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do
   begin
   if ptrOwnerObj = ptrSelf
    then begin
     Res:=ptrObj;
     Result:=true;
     Exit;
     end
    else
     if OwnerFinding(ptrOwnerObj)
      then begin
       Result:=true;
       Exit;
       end;
   ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
   end;
  end;

begin
Result:=nilPtr;
case Status of
pssNormal,pssNormalDisconnected: begin
  Res:=nilPtr;
  OwnerFinding(ptrRootObj);
  Result:=Res;
  end;
pssRemoted,pssRemotedBrief: begin
  GlobalSpaceRemoteManagerLock.Enter;
  try
  Result:=GlobalSpaceRemoteManager.Obj_Owner(ptrSelf);
  finally
  GlobalSpaceRemoteManagerLock.Leave;
  end;
  end;
end;
end;

function TProxySpace.Obj_ID(ptrObj: TPtr): integer;
var
  Obj: TSpaceObj;
begin
ReadObj(Obj,SizeOf(Obj), ptrObj);
Result:=Obj.idObj;
end;

function TProxySpace.Obj_IDType(ptrObj: TPtr): integer;
var
  Obj: TSpaceObj;
begin
ReadObj(Obj,SizeOf(Obj), ptrObj);
Result:=Obj.idTObj;
end;

function TProxySpace.Obj_IsDetail(const ptrObj: TPtr): boolean;
var
  ptrOwner: TPtr;
  Owner: TSpaceObj;
begin
Result:=false;
Lock.Enter;
try
ptrOwner:=Obj_Owner(ptrObj);
if (ptrOwner = nilPtr) then Exit; //. ->
ReadObj(Owner,SizeOf(Owner), ptrOwner);
if (Owner.idTObj <> idTLay2DVisualization) then Result:=true;
finally
Lock.Leave;
end;
end;


function TProxySpace.ReadObj(var Obj; SizeObj: integer; Pntr: TPtr): boolean;

  function IsTSpaceObj: boolean;
  begin
  Result:=(SizeObj = SizeOf(TSpaceObj));
  end;

var
  flObjAccessed: boolean;
begin
if (IsTSpaceObj)
 then begin
  Lock.Enter;
  try
  if (NOT Obj_IsCached(Pntr))
   then begin //. caching the object with details
    Obj_CheckCachedState(Pntr);
    flObjAccessed:=true;
    end
   else flObjAccessed:=false;
  Result:=ReadObjLocalStorage(Obj,SizeObj, Pntr);
  //. update objects access rating if needed
  if (NOT flObjAccessed AND (TSpaceObj(Obj).idTObj <> idTLay2DVisualization)) then ObjectsContextRegistry.ObjAccessed(Pntr);
  finally
  Lock.Leave;
  end;
  end
 else Result:=ReadObjLocalStorage(Obj,SizeObj, Pntr);
end;

function TProxySpace.ReadObjLocalStorage(var Obj; SizeObj: integer; Pntr: TPtr): boolean;
begin
Lock.Enter;
try
if (LocalStorage is TRealMemory) AND (Pntr >= TRealMemory(LocalStorage).Size) then Increase(SpaceIncreaseDelta);
Result:=LocalStorage.Mem_Read(Obj,SizeObj, UnitLinearMemory.TAddress(Pntr));
finally
Lock.Leave;
end;
end;

function TProxySpace.WriteObjLocalStorage(var Obj;SizeObj: integer; var Pntr: TPtr): boolean;
begin
Lock.Enter;
try
if (Pntr = nilPtr) then Raise Exception.Create('write ptr is nil'); //. =>
if ((LocalStorage is TRealMemory) AND (Pntr >= TRealMemory(LocalStorage).Size)) then Increase(SpaceIncreaseDelta);
Result:=LocalStorage.Mem_Write(Obj,SizeObj, unitLinearMemory.TAddress(Pntr));
finally
Lock.Leave;
end;
end;

function TProxySpace.IsPtrNull(const ptrPtr: TPtr): boolean;
var
  P: TPtr;
begin
ReadObjLocalStorage(P,SizeOf(P), ptrPtr);
Result:=(P = 0);
end;

procedure TProxySpace.Increase(const Delta: integer);
begin
if (LocalStorage is TRealMemory)
 then begin
  Lock.Enter;
  try
  TRealMemory(LocalStorage).Increase(Delta);
  finally
  Lock.Leave;
  end;
  end;
end;

function TProxySpace.Obj_IsInsideObj(ptrObj: TPtr; ptrSelf: TPtr): boolean;
var
  Obj,SelfObj: TSpaceObj;
  ptrPoint: TPtr;
  P: TPoint;
begin
Result:=false;
Lock.Enter;
try
ReadObj(Obj,SizeOf(Obj), ptrObj);
if (NOT Obj.flagLoop) then Exit; //. ->
ReadObj(SelfObj,SizeOf(SelfObj), ptrSelf);
ptrPoint:=SelfObj.ptrFirstPoint;
Result:=true;
while (ptrPoint <> nilPtr) do begin
  ReadObj(P,SizeOf(TPoint), ptrPoint);
  Result:=Obj_IsPointInside(P, ptrObj);
  if (NOT Result) then Exit; //. ->
  ptrPoint:=P.ptrNextObj;
  end;
ptrPoint:=Obj.ptrFirstPoint;
while (ptrPoint <> nilPtr) do begin
  ReadObj(P,SizeOf(TPoint), ptrPoint);
  Result:=(NOT Obj_IsPointInside(P, ptrSelf));
  if (NOT Result) then Exit; //. ->
  ptrPoint:=P.ptrNextObj;
  end;
finally
Lock.Leave;
end;
end;


function TProxySpace.Obj_IsPointInside(const P: TPoint; ptrSelf: TPtr): boolean;
/// +!!! do improve this like in Mosaic project (avoid case when ObjPoint only one)

  function IsPointInside(const X,Y: TCrd): boolean;
  var
    SelfObj: TSpaceObj;
    Side_X0,Side_Y0,
    Side_X1,Side_Y1: Extended;
    ptrPoint: TPtr;
    FirstPoint,Point: TPoint;
    cntCrossedAbove,
    cntCrossedBelow: integer;
    I: integer;

    procedure TreateSide;
    var
      Ycr: extended;
    begin
    if (Side_X0 <= X) AND (X < Side_X1) OR
       (Side_X0 >= X) AND (X > Side_X1)
     then
      if Side_X0 <> Side_X1
       then begin
        Ycr:=Side_Y0+((Side_Y1-Side_Y0)/(Side_X1-Side_X0))*(X-Side_X0);
        if Ycr >= Y
         then Inc(cntCrossedAbove)
         else Inc(cntCrossedBelow);
        end;
    end;

  begin
  Result:=false;
  ReadObj(SelfObj,SizeOf(SelfObj), ptrSelf);
  if SelfObj.flagLoop AND SelfObj.flagFill
   then begin
    ptrPoint:=SelfObj.ptrFirstPoint;
    if ptrPoint <> nilPtr
     then begin
      ReadObj(FirstPoint,SizeOf(FirstPoint), ptrPoint);
      Side_X0:=FirstPoint.X; Side_Y0:=FirstPoint.Y;
      cntCrossedAbove:=0;
      cntCrossedBelow:=0;
      ptrPoint:=FirstPoint.ptrNextObj;
      while ptrPoint <> nilPtr do begin
        ReadObj(Point,SizeOf(Point), ptrPoint);
        Side_X1:=Point.X; Side_Y1:=Point.Y;
        TreateSide;
        Side_X0:=Side_X1; Side_Y0:=Side_Y1;
        //.
        ptrPoint:=Point.ptrNextObj;
        end;
      Side_X1:=FirstPoint.X; Side_Y1:=FirstPoint.Y;
      TreateSide;
      Result:=(((cntCrossedAbove MOD 2) > 0) AND ((cntCrossedBelow MOD 2) > 0));
      if Result then Exit; //. ->
      end;
    end;
  if SelfObj.Width > 0
   then with TSpaceObjPolylinePolygon.Create(Self,SelfObj) do
    try
    if Count > 0
     then begin
      FirstPoint.X:=Nodes[0].X; FirstPoint.Y:=Nodes[0].Y;
      cntCrossedAbove:=0;
      cntCrossedBelow:=0;
      Side_X0:=FirstPoint.X; Side_Y0:=FirstPoint.Y;
      for I:=1 to Count-1 do begin
        Side_X1:=Nodes[I].X; Side_Y1:=Nodes[I].Y;
        TreateSide;
        Side_X0:=Side_X1; Side_Y0:=Side_Y1;
        end;
      Side_X1:=FirstPoint.X; Side_Y1:=FirstPoint.Y;
      TreateSide;
      Result:=(((cntCrossedAbove MOD 2) > 0) AND ((cntCrossedBelow MOD 2) > 0));
      if Result then Exit; //. ->
      end;
    finally
    Destroy;
    end;
 end;

begin
Lock.Enter;
try
Result:=IsPointInside(P.X,P.Y);
finally
Lock.Leave;
end;
end;

function TProxySpace.Obj_PointInsideOwnObjects(const P: TPoint; ptrSelf: TPtr): boolean;
var
  SelfObj: TSpaceObj;
  ptrOwnerObj: TPtr;

  function IsInsideObj(ptrObj: TPtr): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Result:=false;
  if Obj_IsPointInside(P, ptrObj)
   then begin
    Result:=true;
    Exit;
    end;

  ReadObj(Obj,SizeOf(Obj), ptrObj);
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
   if IsInsideObj(ptrOwnerObj)
    then begin
     Result:=true;
     Exit;
     end;
   ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
   end;
  end;

begin
Result:=false;
Lock.Enter;
try
ReadObj(SelfObj,SizeOf(SelfObj), ptrSelf);
ptrOwnerObj:=SelfObj.ptrListOwnerObj;
while (ptrOwnerObj <> nilPtr) do begin
 if IsInsideObj(ptrOwnerObj)
  then begin
   Result:=true;
   Exit;
   end;
 ReadObj(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
 end;
finally
Lock.Leave;
end;
end;

function TProxySpace.Obj_PointOutsideOwner(const P: TPoint; ptrSelf: TPtr): boolean;
var
  ptrOwner: TPtr;
begin
Result:=true;
Lock.Enter;
try
ptrOwner:=Obj_Owner(ptrSelf);
if (ptrOwner = nilPtr) then Exit; //. ->
if (Obj_IsPointInside(P, ptrOwner)) then Result:=false;
finally
Lock.Leave;
end;
end;

function TProxySpace.Obj_IsCached(const ptrObj: TPtr): boolean;
var
  Obj: TSpaceObj;
begin
ReadObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
Result:=(Obj.idTObj <> 0);
end;

function TProxySpace.Obj_IsCached(const Obj: TSpaceObj): boolean;
begin
Result:=(Obj.idTObj <> 0);
end;

function TProxySpace.Obj_StructureIsCached(const ptrObj: TPtr): boolean;
var
  Obj: TSpaceObj;
begin
ReadObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
Result:=(Obj.ptrListOwnerObj <> 0);
end;

function TProxySpace.Lay_Ptr(Level: integer): TPtr;
var
  Rs: TPtr;

  function TreateLay(curLevel: integer; const ptrObj: TPtr): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Result:=false;
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  if (Obj.idTObj = idTLay2DVisualization)
   then
    if (curLevel = Level)
     then begin
      Rs:=ptrObj;
      Result:=true;
      Exit;
      end
     else
      Inc(curLevel)
   else
    Exit; //. ->
  //. обрабатываем собственные объекты
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
    Result:=TreateLay(curLevel, ptrOwnerObj);
    Exit; //. ->
    end;
  end;

begin
Result:=nilPtr;
Rs:=nilPtr;
Lock.Enter;
try
TreateLay(1, ptrRootObj);
finally
Lock.Leave;
end;
Result:=Rs;
end;

procedure TProxySpace.Lay_GetNumber(const ptrLay: TPtr; var Number: integer);
begin
Obj_GetLayLevel(Number, ptrLay);
Inc(Number);
end;

procedure TProxySpace.Lay_GetNumberByID(const LayID: integer; out Number: integer);

  function ProcessLay(const ptrObj: TPtr; const LayID: integer; var Level: integer): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Result:=false;
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  if (Obj.idTObj = idTLay2DVisualization)
   then
    if (Obj.idObj = LayID)
     then begin
      Result:=true;
      Exit; //. ->
      end
     else
      Inc(Level)
   else
    Exit; //. ->
  //. process own objects
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While (ptrOwnerObj <> nilPtr) do begin
    Result:=ProcessLay(ptrOwnerObj,LayID,{ref} Level);
    Exit; //. ->
    end;
  end;

var
  Level: integer;
begin
Lock.Enter;
try
Level:=1;
if (ProcessLay(ptrRootObj,LayID,{ref} Level))
 then Number:=Level
 else Number:=0;
finally
Lock.Leave;
end;
end;

procedure TProxySpace.Obj_GetRoot(const idTObj,idObj: integer; out idTROOT,idROOT: integer);
begin
if (Status <> pssRemoted) then Raise Exception.Create('function not supproted in this status'); //. =>
GlobalSpaceRemoteManagerLock.Enter;
try
GlobalSpaceRemoteManager.Obj_GetROOT(idTObj,idObj, idTROOT,idROOT);
finally
GlobalSpaceRemoteManagerLock.Leave;
end;
end;

function TProxySpace.Obj_GetRootPtr(ptrObj: TPtr): TPtr;
var
  Obj: TSpaceObj;
  ptrOwner: TPtr;
  Owner: TSpaceObj;
begin
Result:=nilPtr;
Lock.Enter;
try
ReadObj(Obj,SizeOf(Obj), ptrObj);
if (Obj.idTObj = idTLay2DVisualization) then Raise Exception.Create('object is not a lay'); //. =>
repeat
  Result:=ptrObj;
  ptrObj:=Obj_Owner(ptrObj);
  if (ptrObj = nilPtr) then Raise Exception.Create('no owner'); //. =>
  ReadObj(Obj,SizeOf(Obj), ptrObj);
until (Obj.idTObj = idTLay2DVisualization);
finally
Lock.Leave;
end;
end;

function TProxySpace.Obj_ObjIsVisibleInside(const ptrAnObj: TPtr; const ptrSelf: TPtr): boolean;
var
  Obj,AnObj: TSpaceObj;
  flagVisibleObjLine: boolean;
  cntLinesUpCenter,
  cntLinesDownCenter: word;
  ptrptrItemList,ptrItemList: pointer;
  ptrPoint: TPtr;
  Point: TPoint;
  Xl0,Yl0: TCrd;
  flagPreSet: boolean;

  procedure TreatePoint(Xl,Yl: Extended; flagLoop,flagFill: boolean);

    function LinesIsCrossed(const Xl0,Yl0,Xl1,Yl1: Extended; Xm0,Ym0,Xm1,Ym1: Extended): boolean;
    var
       dXl,dXm,dYl,dYm,Diff,X,Y: Extended;
    begin
    Result:=false;
    dXl:=Xl1-Xl0;dYl:=Yl1-Yl0;
    dXm:=Xm1-Xm0;dYm:=Ym1-Ym0;
    Diff:=dXl*dYm-dYl*dXm;
    if Diff = 0 then Exit; //. ->
    if Abs(Xm0-Xm1) > Abs(Ym0-Ym1)
     then begin
      X:=((Yl1-Ym1)*dXm*dXl+Xm1*dYm*dXl-Xl1*dYl*dXm)/Diff;
      Result:=(((X-Xl0)*(X-Xl1) < 0) AND ((X-Xm0)*(X-Xm1) < 0));
      end
     else begin
      Y:=((Xl1-Xm1)*dYm*dYl+Ym1*dXm*dYl-Yl1*dXl*dYm)/(-Diff);
      Result:=(((Y-Yl0)*(Y-Yl1) < 0) AND ((Y-Ym0)*(Y-Ym1) < 0));
      end;
    end;

    function IsAnObjInsideEntire: boolean;
    var
      PFirst,P0,P1: TPoint;
      cntLinesUpCenter,
      cntLinesDownCenter: word;
      I: integer;
      
      procedure ProcessCounters(const P0,P1: TPoint);
      var
        dX: Extended;
        Yc: Extended;
      begin
      if (Xl-P0.X)*(Xl-P1.X) <= 0
       then begin
        dX:=P1.X-P0.X;
        if dX <> 0
         then begin
          Yc:=P0.Y+(Xl-P0.X)*(P1.Y-P0.Y)/dX;
          if Yc >= Yl
           then
            inc(cntLinesUpCenter)
           else
            inc(cntLinesDownCenter);
          end;
        end;
      end;

    begin
    if (Obj.ptrFirstPoint = nilPtr) then Raise Exception.Create('can not get first point'); //. =>
    ReadObj(PFirst,SizeOf(PFirst), Obj.ptrFirstPoint);
    if (PFirst.ptrNextObj = nilPtr) then Raise Exception.Create('can not get second point'); //. =>
    ReadObj(P1,SizeOf(P1), PFirst.ptrNextObj);
    cntLinesUpCenter:=0;
    cntLinesDownCenter:=0;
    ProcessCounters(PFirst,P1);
    P0:=P1;
    while (P0.ptrNextObj <> nilPtr) do begin
      ReadObj(P1,SizeOf(P1), P0.ptrNextObj);
      ProcessCounters(P0,P1);
      P0:=P1;
      end;
    ProcessCounters(P0,PFirst);
    //.
    Result:=(((cntLinesUpCenter MOD 2) > 0) AND ((cntLinesDownCenter MOD 2) > 0));
    if Result then Exit; //. ->
    //. process as polyline
    if Obj.Width > 0
     then with TSpaceObjPolylinePolygon.Create(Self,Obj) do
      try
      if (Count = 0) then Raise Exception.Create('can not get first point'); //. =>
      PFirst.X:=Nodes[0].X; PFirst.Y:=Nodes[0].Y;
      if (Count = 1) then Raise Exception.Create('can not get second point'); //. =>
      P1.X:=Nodes[1].X; P1.Y:=Nodes[1].Y;
      cntLinesUpCenter:=0;
      cntLinesDownCenter:=0;
      ProcessCounters(PFirst,P1);
      P0:=P1;
      for I:=2 to Count-1 do begin
        P1.X:=Nodes[I].X; P1.Y:=Nodes[I].Y;
        ProcessCounters(P0,P1);
        P0:=P1;
        end;
      ProcessCounters(P0,PFirst);
      Result:=(((cntLinesUpCenter MOD 2) > 0) AND ((cntLinesDownCenter MOD 2) > 0));
      finally
      Destroy;
      end;
    end;

  var
     Xc,Yc: Extended;
     dX: extended;
     PFirst,P0,P1: TPoint;
     I: integer;
  begin
  if (NOT flagPreSet)
   then begin
    if (Obj.ptrFirstPoint = nilPtr) then Raise Exception.Create('can not get first point'); //. =>
    ReadObj(PFirst,SizeOf(PFirst), Obj.ptrFirstPoint);
    if (PFirst.ptrNextObj = nilPtr) then Raise Exception.Create('can not get second point'); //. =>
    ReadObj(P1,SizeOf(P1), PFirst.ptrNextObj);
    if LinesIsCrossed(Xl0,Yl0,Xl,Yl, PFirst.X,PFirst.Y,P1.X,P1.Y)
     then begin
      flagVisibleObjLine:=true;
      Exit; //. ->
      end;
    P0:=P1;
    while P0.ptrNextObj <> nilPtr do begin
      ReadObj(P1,SizeOf(P1), P0.ptrNextObj);
      if LinesIsCrossed(Xl0,Yl0,Xl,Yl, P0.X,P0.Y,P1.X,P1.Y)
       then begin
        flagVisibleObjLine:=true;
        Exit; //. ->
        end;
      P0:=P1;
      end;
    if LinesIsCrossed(Xl0,Yl0,Xl,Yl, P0.X,P0.Y,PFirst.X,PFirst.Y)
     then begin
      flagVisibleObjLine:=true;
      Exit; //. ->
      end;
    {проверка пересечени€ линии и оси X , проход€щей через точку Xcenter,Ycenter}
    if flagLoop AND flagFill
     then begin
      if (PFirst.X-Xl0)*(PFirst.X-Xl) <= 0
       then begin
        dX:=Xl-Xl0;
        if dX <> 0
         then begin
          Yc:=Yl0+(PFirst.X-Xl0)*(Yl-Yl0)/dX;
          if Yc >= PFirst.Y
           then
            inc(cntLinesUpCenter)
           else
            inc(cntLinesDownCenter);
          end;
        end;
      end;
    //. process as wide polyline
    if Obj.Width > 0
     then with TSpaceObjPolylinePolygon.Create(Self,Obj) do
      try
      if (Count = 0) then Raise Exception.Create('can not get first point'); //. =>
      PFirst.X:=Nodes[0].X; PFirst.Y:=Nodes[0].Y;
      if (Count = 1) then Raise Exception.Create('can not get second point'); //. =>
      P1.X:=Nodes[1].X; P1.Y:=Nodes[1].Y;
      if LinesIsCrossed(Xl0,Yl0,Xl,Yl, PFirst.X,PFirst.Y,P1.X,P1.Y)
       then begin
        flagVisibleObjLine:=true;
        Exit; //. ->
        end;
      P0:=P1;
      for I:=2 to Count-1 do begin
        P1.X:=Nodes[I].X; P1.Y:=Nodes[I].Y;
        if LinesIsCrossed(Xl0,Yl0,Xl,Yl, P0.X,P0.Y,P1.X,P1.Y)
         then begin
          flagVisibleObjLine:=true;
          Exit; //. ->
          end;
        P0:=P1;
        end;
      if LinesIsCrossed(Xl0,Yl0,Xl,Yl, P0.X,P0.Y,PFirst.X,PFirst.Y)
       then begin
        flagVisibleObjLine:=true;
        Exit; //. ->
        end;
      {проверка пересечени€ линии и оси X , проход€щей через точку Xcenter,Ycenter}
      if flagLoop AND flagFill
       then begin
        if (PFirst.X-Xl0)*(PFirst.X-Xl) <= 0
         then begin
          dX:=Xl-Xl0;
          if dX <> 0
           then begin
            Yc:=Yl0+(PFirst.X-Xl0)*(Yl-Yl0)/dX;
            if Yc >= PFirst.Y
             then
              inc(cntLinesUpCenter)
             else
              inc(cntLinesDownCenter);
            end;
          end;
        end;
      finally
      Destroy;
      end;
    //.
    Xl0:=Xl;
    Yl0:=Yl;
    end
   else begin
    //. check for AnObj is inside entire
    flagVisibleObjLine:=IsAnObjInsideEntire;
    //.
    Xl0:=Xl;
    Yl0:=Yl;
    flagPreSet:=false;
    end
  end;

  function ContainerCoord_IsObjectOutside(const Coords: TContainerCoord;const Obj_ContainerCoord: TContainerCoord): boolean;
  begin
  Result:=true;
  with Obj_ContainerCoord do begin
  if ((Xmax < Coords.Xmin) OR (Xmin > Coords.Xmax)
        OR
      (Ymax < Coords.Ymin) OR (Ymin > Coords.Ymax))
   then Exit; //. ->
  end;
  Result:=false;
  end;

var
  I: integer;
  SelfContainerCoord,AnObjContainerCoord: TContainerCoord;
begin
Result:=false;
//.
Lock.Enter;
try
with SelfContainerCoord do if NOT Obj_GetMinMax(Xmin,Ymin,Xmax,Ymax,ptrSelf) then Exit; //. ->
with AnObjContainerCoord do if NOT Obj_GetMinMax(Xmin,Ymin,Xmax,Ymax,ptrAnObj) then Exit; //. ->
if ContainerCoord_IsObjectOutside(SelfContainerCoord, AnObjContainerCoord) then Exit; //. ->
//.
flagVisibleObjLine:=false;
ReadObj(Obj,SizeOf(Obj),ptrSelf);
ReadObj(AnObj,SizeOf(AnObj),ptrAnObj);
ptrPoint:=AnObj.ptrFirstPoint;
cntLinesUpCenter:=0;
cntLinesDownCenter:=0;
flagPreSet:=true;
while ptrPoint <> nilPtr do begin
  ReadObj(Point,SizeOf(TPoint), ptrPoint);
  try TreatePoint(Point.X,Point.Y, AnObj.flagLoop,AnObj.flagFill); except end;
  if flagVisibleObjLine
   then begin
    Result:=true;
    Exit; //. ->
    end;
  ptrPoint:=Point.ptrNextObj;
  end;
if AnObj.flagLoop
 then begin
  ptrPoint:=AnObj.ptrFirstPoint;
  if ptrPoint <> nilPtr
   then begin
    ReadObj(Point,SizeOf(TPoint), ptrPoint);
    try TreatePoint(Point.X,Point.Y, AnObj.flagLoop,AnObj.flagFill) except end;
    if flagVisibleObjLine
     then begin
      Result:=true;
      Exit; //. ->
      end;
    end;
  if (AnObj.flagFill AND (((cntLinesUpCenter MOD 2) > 0) AND ((cntLinesDownCenter MOD 2) > 0)))
   then begin
    Result:=true;
    Exit;// ->
    end;
  end;
if AnObj.Width > 0
 then with TSpaceObjPolylinePolygon.Create(Self,AnObj) do
  try
  flagVisibleObjLine:=false;
  cntLinesUpCenter:=0;
  cntLinesDownCenter:=0;
  flagPreSet:=true;
  for I:=0 to Count-1 do begin
    try TreatePoint(Nodes[I].X,Nodes[I].Y, true,true); except end;
    if flagVisibleObjLine
     then begin
      Result:=true;
      Exit;// ->
      end;
    end;
  try TreatePoint(Nodes[0].X,Nodes[0].Y, true,true); except end;
  if flagVisibleObjLine
   then begin
    Result:=true;
    Exit;// ->
    end;
  if (((cntLinesUpCenter MOD 2) > 0) AND ((cntLinesDownCenter MOD 2) > 0))
   then Result:=true;
  finally
  Destroy;
  end;
finally
Lock.Leave;
end;
end;

procedure TProxySpace.Obj_GetLaysOfVisibleObjectsInside(const ptrSelf: TPtr; out ptrLays: pointer);
var
  S_Xmin,S_Ymin,S_Xmax,S_Ymax: Extended;
  ptrptrLay: pointer;
  curLay,curSubLay: integer;
  ptrNewLay: pointer;
  ptrDestroyLay: pointer;
  ptrDestroyItem: pointer;

  procedure PrepareLaysFromRemoteSpace;
  const
    ObjPointersPortion = 1000;
    SizeOfTSpaceObj = SizeOf(TSpaceObj);
    SizeOfTPoint = SizeOf(TPoint);
  var
    I,J: integer;
    BA: TByteArray;
    DataPtr: pointer;
    NewLaysObjectsCount: integer;
    S_Xmin,S_Ymin,S_Xmax,S_Ymax: Extended;
    LaysCount: word;
    Objects: pointer;
    flLay: boolean;
    ValidObjectsCount,ObjectsCount: integer;
    ptrLast: pointer;
    ptrObj,ptrObjAccessed: TPtr;
    ptrptrLay: pointer;

    ObjPointersCount: longword;
    ptrPointersLay,ptrPointersLayItem: pointer;
    PointerNumber: integer;

    ptrNewLay: pointer;
    ptrFirstLay: pointer;
    ptrLastLay: pointer;
    LayPtr: pointer;
    ptrptrItem: pointer;
    ptrDestroyItem: pointer;

      procedure InsertObj(const ptrObj: TPtr);
      var
        ptrNew: pointer;
        ptrptrItem: pointer;
      begin
      GetMem(ptrNew,SizeOf(TItemLayReflect));
      with TItemLayReflect(ptrNew^) do begin
      ptrNext:=nil;
      ptrObject:=ptrObj;
      with Window do begin
      Xmn:=0;Ymn:=0;
      Xmx:=0;Ymx:=0;
      end;
      end;
      TItemLayReflect(ptrLast^).ptrNext:=ptrNew;
      ptrLast:=ptrNew;
      Inc(ValidObjectsCount);
      end;

      procedure GetObjectsPortion(var ptrPointersLay,ptrPointersLayItem: pointer; var ObjPointersCount: longword);
      var
        ObjPointers: TByteArray;
        ptrPointersBuffer: pointer;
        ValidPointersCount: longword;
        ptrDist: pointer;
        I: integer;
        ptrObj: TPtr;
        Objects: TByteArray;
        ptrObjectsBuffer: pointer;
        ptrSrs: pointer;
        ptrObjPointer: pointer;
        Obj: TSpaceObj;
        ptrPoint: TPtr;
        Point: TPoint;

        function GetObjPointer(var ptrObj: TPtr): boolean;
        begin
        Result:=false;
        repeat
          while (ptrPointersLayItem = nil) do begin
            ptrPointersLay:=TLayReflect(ptrPointersLay^).ptrNext;
            //.
            if (ptrPointersLay = nil) then Exit; //. ->
            //.
            ptrPointersLayItem:=TLayReflect(ptrPointersLay^).Objects;
            end;
          ptrObj:=TItemLayReflect(ptrPointersLayItem^).ptrObject;
          Result:=(NOT Obj_IsCached(ptrObj));
          if (Result)
           then begin //. limiting on concurrent object caching
            Lock.Enter();
            try
            if (User_SpaceWindow_ObjectCaching_Counter >= User_SpaceWindow_CachingObjectsPortion)
             then begin
              Result:=false;
              Exit; //. ->
              end;
            Inc(User_SpaceWindow_ObjectCaching_Counter);
            finally
            Lock.Leave();
            if (NOT Result) then Sleep(20);
            end;
            end;
          //.
          Dec(ObjPointersCount);
          ptrPointersLayItem:=TItemLayReflect(ptrPointersLayItem^).ptrNext;
        until (Result);
        end;

      begin
      SetLength(ObjPointers,ObjPointersPortion*SizeOf(TPtr));
      ptrPointersBuffer:=@ObjPointers[0];
      ptrDist:=ptrPointersBuffer;
      ValidPointersCount:=0;
      {///- deadlock case
      Lock.Enter(); //. !!! to avoid multiple TypeSystem items caching on concurrent function calling
      try}
      while (true) do begin
        if (NOT GetObjPointer(ptrObj)) then Break; //. >
        asm
           PUSH EDI
           MOV EAX,ptrObj
           MOV EDI,ptrDist
           CLD
           STOSD
           MOV ptrDist,EDI
           POP EDI
        end;
        Inc(ValidPointersCount);
        end;
      if (ValidPointersCount > 0)
       then
        try
        SetLength(ObjPointers,ValidPointersCount*SizeOf(TPtr));
        GlobalSpaceManagerLock.Enter;
        try
        Objects:=GlobalSpaceManager.ReadObjects(UserName,UserPassword, ObjPointers,ValidPointersCount);
        finally
        GlobalSpaceManagerLock.Leave;
        end;
        ptrObjectsBuffer:=@Objects[0];
        //. cashing types system for incoming objects
        ptrSrs:=ptrObjectsBuffer;
        Functionality.TypesSystem.Caching_Start();
        try
        for I:=0 to ValidPointersCount-1 do begin
          //. get object body
          asm
             PUSH ESI
             PUSH EDI
             MOV ESI,ptrSrs
             CLD
             LEA EDI,Obj
             MOV ECX,SizeOfTSpaceObj
             REP MOVSB
             MOV ptrSrs,ESI
             POP EDI
             POP ESI
          end;
          //. add object for cashing
          if (Obj.idObj <> 0) then Functionality.TypesSystem.Caching_AddObject(Obj.idTObj,Obj.idObj);
          //. skip points
          ptrPoint:=Obj.ptrFirstPoint;
          while ptrPoint <> nilPtr do begin
            //. get point
            asm
               PUSH ESI
               PUSH EDI
               MOV ESI,ptrSrs
               CLD
               LEA EDI,Point
               MOV ECX,SizeOfTPoint
               REP MOVSB
               MOV ptrSrs,ESI
               POP EDI
               POP ESI
            end;
            //. go to next point
            ptrPoint:=Point.ptrNextObj;
            end;
          end;
        //. release quota
        Lock.Enter();
        try
        Dec(User_SpaceWindow_ObjectCaching_Counter,ValidPointersCount);
        finally
        Lock.Leave();
        end;
        finally
        TTypesSystem(TypesSystem).Caching_Finish();
        end;
        //. write objects
        ptrPointersBuffer:=@ObjPointers[0];
        ptrObjPointer:=ptrPointersBuffer;
        ptrSrs:=ptrObjectsBuffer;
        Lock.Enter;
        try
        for I:=0 to ValidPointersCount-1 do begin
          //. get ptrObj
          asm
             CLD
             PUSH ESI
             MOV ESI,ptrObjPointer
             LODSD
             MOV ptrObj,EAX
             MOV ptrObjPointer,ESI
             POP ESI
          end;
          //. get object body
          asm
             PUSH ESI
             PUSH EDI
             MOV ESI,ptrSrs
             CLD
             LEA EDI,Obj
             MOV ECX,SizeOfTSpaceObj
             REP MOVSB
             MOV ptrSrs,ESI
             POP EDI
             POP ESI
          end;
          //. write body
          ptrObjAccessed:=ptrObj;
          WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
          ptrPoint:=Obj.ptrFirstPoint;
          while ptrPoint <> nilPtr do begin
            //. get point
            asm
               PUSH ESI
               PUSH EDI
               MOV ESI,ptrSrs
               CLD
               LEA EDI,Point
               MOV ECX,SizeOfTPoint
               REP MOVSB
               MOV ptrSrs,ESI
               POP EDI
               POP ESI
            end;
            //. write point
            WriteObjLocalStorage(Point,SizeOf(Point), ptrPoint);
            //. go to next point
            ptrPoint:=Point.ptrNextObj;
            end;
          //. update objects access rating 
          if (Obj.idTObj <> idTLay2DVisualization) then ObjectsContextRegistry.ObjAccessed(ptrObjAccessed);
          end;
        finally
        Lock.Leave;
        end;
        except
          Lock.Enter();
          try
          Dec(User_SpaceWindow_ObjectCaching_Counter,ValidPointersCount);
          finally
          Lock.Leave();
          end;
          //.
          Raise; //. =>
          end;
      {///-
      finally
      Lock.Leave();
      end;}
      end;

  var
    ptrLastObj: TPtr;
  begin
  ptrLays:=nil;
  NewLaysObjectsCount:=0;
  if (NOT Obj_GetMinMax(S_Xmin,S_Ymin,S_Xmax,S_Ymax, ptrSelf)) then Raise Exception.Create('could not get Obj minmax'); //. =>
  //. coordinates transforming
  S_Xmin:=S_XMin*cfTransMeter; S_Ymin:=S_YMin*cfTransMeter; S_Xmax:=S_XMax*cfTransMeter; S_Ymax:=S_YMax*cfTransMeter;
  //.
  if (GlobalSpaceRemoteManager = nil) then Raise Exception.Create('GlobalSpaceRemoteManager is nil'); //. =>
  GlobalSpaceRemoteManagerLock.Enter;
  try
  BA:=GlobalSpaceRemoteManager.GetVisibleObjects(S_Xmin,S_Ymin,S_Xmax,S_Ymin,S_Xmax,S_Ymax,S_Xmin,S_Ymax, 1,0);
  finally
  GlobalSpaceRemoteManagerLock.Leave;
  end;
  //. moving objects pointers into the new lays structure
  DataPtr:=@BA[0];
  asm
     PUSH ESI
     MOV ESI,DataPtr
     CLD
     LODSW
     MOV LaysCount,AX
     MOV DataPtr,ESI
     POP ESI
  end;
  ptrptrLay:=@ptrLays;
  for I:=0 to LaysCount-1 do begin
    ptrLastObj:=nilPtr;
    //. lay performing
    asm
       PUSH ESI
       MOV ESI,DataPtr
       CLD
       LODSD
       MOV ObjectsCount,EAX
       LODSB
       MOV flLay,AL
       MOV DataPtr,ESI
       POP ESI
    end;
    Objects:=nil;
    ValidObjectsCount:=0;
    ptrLast:=@Objects;
    for J:=0 to ObjectsCount-1 do begin
      asm
         //. get ptrObj
         PUSH ESI
         MOV ESI,DataPtr
         CLD
         LODSD
         MOV ptrObj,EAX
         MOV DataPtr,ESI
         POP ESI
      end;
      if (ptrObj <> ptrLastObj)
       then begin
        InsertObj(ptrObj);
        ptrLastObj:=ptrObj;
        end;
      end;
    //. create new lay
    GetMem(ptrNewLay,SizeOf(TLayReflect));
    TLayReflect(ptrNewLay^).ptrNext:=nil;
    TLayReflect(ptrNewLay^).flLay:=flLay;
    TLayReflect(ptrNewLay^).Objects:=Objects;
    TLayReflect(ptrNewLay^).ObjectsCount:=ValidObjectsCount;
    Pointer(ptrptrLay^):=ptrNewLay;
    ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
    //.
    Inc(NewLaysObjectsCount,ValidObjectsCount);
    end;
  //. objects data getting from remote server
  if (ptrLays <> nil)
   then begin
    ObjPointersCount:=NewLaysObjectsCount;
    PointerNumber:=0;
    ptrPointersLay:=ptrLays;
    ptrPointersLayItem:=TLayReflect(ptrPointersLay^).Objects;
    while (ObjPointersCount > 0) do begin
      //. objects portion reading and placing into the local memory
      GetObjectsPortion(ptrPointersLay,ptrPointersLayItem, ObjPointersCount);
      end;
    end;
  //. final checking for visibility inside
  LayPtr:=ptrLays;
  while LayPtr <> nil do with TLayReflect(LayPtr^) do begin
    ptrptrItem:=@Objects;
    while Pointer(ptrptrItem^) <> nil do with TItemLayReflect(Pointer(ptrptrItem^)^) do begin
      if NOT Obj_ObjIsVisibleInside(ptrObject,ptrSelf)
       then begin //. remove insisible item
        ptrDestroyItem:=Pointer(ptrptrItem^);
        Pointer(ptrptrItem^):=TItemLayReflect(ptrDestroyItem^).ptrNext;
        Dec(ObjectsCount);
        FreeMem(ptrDestroyItem,SizeOf(TItemLayReflect));
        end
       else
        ptrptrItem:=@ptrNext;
      end;
    LayPtr:=ptrNext;
    end;
  end;

begin
try
PrepareLaysFromRemoteSpace;
except
  //. lays destroying
  while ptrLays <> nil do begin
    ptrDestroyLay:=ptrLays;
    ptrLays:=TLayReflect(ptrDestroyLay^).ptrNext;
    //. lay destroying
    with TLayReflect(ptrDestroyLay^) do
    while Objects <> nil do begin
      ptrDestroyItem:=Objects;
      Objects:=TItemLayReflect(ptrDestroyItem^).ptrNext;
      //. item of lay destroying
      FreeMem(ptrDestroyItem,SizeOf(TItemLayReflect));
      end;
    FreeMem(ptrDestroyLay,SizeOf(TLayReflect));
    end;
  Raise; //. =>
  end;
end;

procedure TProxySpace.Obj_GetLaysOfVisibleObjectsInside1(const ptrSelf: TPtr; out ptrLays: pointer);
{using GlobalSpaceRemoteManager.GetVisibleObjects() method, no caching in context}
var
  S_Xmin,S_Ymin,S_Xmax,S_Ymax: Extended;
  ptrptrLay: pointer;
  curLay,curSubLay: integer;
  ptrNewLay: pointer;
  ptrDestroyLay: pointer;
  ptrDestroyItem: pointer;

  procedure PrepareLaysFromRemoteSpace;
  var
    I,J: integer;
    BA: TByteArray;
    DataPtr: pointer;
    NewLaysObjectsCount: integer;
    S_Xmin,S_Ymin,S_Xmax,S_Ymax: Extended;
    LaysCount: word;
    Objects: pointer;
    flLay: boolean;
    ValidObjectsCount,ObjectsCount: integer;
    ptrLast: pointer;
    ptrObj,ptrObjAccessed: TPtr;
    ptrptrLay: pointer;

    ObjPointersCount: longword;
    ptrPointersLay,ptrPointersLayItem: pointer;

    ptrNewLay: pointer;
    ptrFirstLay: pointer;
    ptrLastLay: pointer;
    LayPtr: pointer;
    ptrptrItem: pointer;
    ptrDestroyItem: pointer;

      procedure InsertObj(const ptrObj: TPtr);
      var
        ptrNew: pointer;
        ptrptrItem: pointer;
      begin
      GetMem(ptrNew,SizeOf(TItemLayReflect));
      with TItemLayReflect(ptrNew^) do begin
      ptrNext:=nil;
      ptrObject:=ptrObj;
      with Window do begin
      Xmn:=0;Ymn:=0;
      Xmx:=0;Ymx:=0;
      end;
      end;
      TItemLayReflect(ptrLast^).ptrNext:=ptrNew;
      ptrLast:=ptrNew;
      Inc(ValidObjectsCount);
      end;

  var
    ptrLastObj: TPtr;
  begin
  ptrLays:=nil;
  NewLaysObjectsCount:=0;
  if (NOT Obj_GetMinMax(S_Xmin,S_Ymin,S_Xmax,S_Ymax, ptrSelf)) then Raise Exception.Create('could not get Obj minmax'); //. =>
  //. coordinates transforming
  S_Xmin:=S_XMin*cfTransMeter; S_Ymin:=S_YMin*cfTransMeter; S_Xmax:=S_XMax*cfTransMeter; S_Ymax:=S_YMax*cfTransMeter;
  //.
  if (GlobalSpaceRemoteManager = nil) then Raise Exception.Create('GlobalSpaceRemoteManager is nil'); //. =>
  GlobalSpaceRemoteManagerLock.Enter;
  try
  BA:=GlobalSpaceRemoteManager.GetVisibleObjects(S_Xmin,S_Ymin,S_Xmax,S_Ymin,S_Xmax,S_Ymax,S_Xmin,S_Ymax, 1.0,0);
  finally
  GlobalSpaceRemoteManagerLock.Leave;
  end;
  //. moving objects pointers into the new lays structure
  DataPtr:=@BA[0];
  asm
     PUSH ESI
     MOV ESI,DataPtr
     CLD
     LODSW
     MOV LaysCount,AX
     MOV DataPtr,ESI
     POP ESI
  end;
  ptrptrLay:=@ptrLays;
  for I:=0 to LaysCount-1 do begin
    ptrLastObj:=nilPtr;
    //. lay performing
    asm
       PUSH ESI
       MOV ESI,DataPtr
       CLD
       LODSD
       MOV ObjectsCount,EAX
       LODSB
       MOV flLay,AL
       MOV DataPtr,ESI
       POP ESI
    end;
    Objects:=nil;
    ValidObjectsCount:=0;
    ptrLast:=@Objects;
    for J:=0 to ObjectsCount-1 do begin
      asm
         //. get ptrObj
         PUSH ESI
         MOV ESI,DataPtr
         CLD
         LODSD
         MOV ptrObj,EAX
         MOV DataPtr,ESI
         POP ESI
      end;
      if (ptrObj <> ptrLastObj)
       then begin
        InsertObj(ptrObj);
        ptrLastObj:=ptrObj;
        end;
      end;
    //. create new lay
    GetMem(ptrNewLay,SizeOf(TLayReflect));
    TLayReflect(ptrNewLay^).ptrNext:=nil;
    TLayReflect(ptrNewLay^).flLay:=flLay;
    TLayReflect(ptrNewLay^).Objects:=Objects;
    TLayReflect(ptrNewLay^).ObjectsCount:=ValidObjectsCount;
    Pointer(ptrptrLay^):=ptrNewLay;
    ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
    //.
    Inc(NewLaysObjectsCount,ValidObjectsCount);
    end;
  end;

begin
try
PrepareLaysFromRemoteSpace();
except
  //. lays destroying
  while ptrLays <> nil do begin
    ptrDestroyLay:=ptrLays;
    ptrLays:=TLayReflect(ptrDestroyLay^).ptrNext;
    //. lay destroying
    with TLayReflect(ptrDestroyLay^) do
    while Objects <> nil do begin
      ptrDestroyItem:=Objects;
      Objects:=TItemLayReflect(ptrDestroyItem^).ptrNext;
      //. item of lay destroying
      FreeMem(ptrDestroyItem,SizeOf(TItemLayReflect));
      end;
    FreeMem(ptrDestroyLay,SizeOf(TLayReflect));
    end;
  Raise; //. =>
  end;
end;

function TProxySpace.Obj_HasNodeInside(const ptrObj: TPtr; const ShiftX,ShiftY: TCrd; const flIgnoreSelf: boolean): boolean;
var
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;
  Node: TNodeSpaceObjPolyLinePolygon;
  I: integer;
begin
Result:=false;
Lock.Enter;
try
ReadObj(Obj,SizeOf(Obj), ptrObj);
if (Obj.Width > 0)
 then with TSpaceObjPolyLinePolygon.Create(Self,Obj,Obj.Width) do
  try
  Count:=0;
  ptrPoint:=Obj.ptrFirstPoint;
  while ptrPoint <> nilPtr do begin
    ReadObj(Point,SizeOf(Point), ptrPoint);
    Node.X:=Point.X+ShiftX;
    Node.Y:=Point.Y+ShiftY;
    Nodes[Count]:=Node;
    Inc(Count);
    ptrPoint:=Point.ptrNextObj;
    end;
  //.
  Update();
  //.
  with TSpacePolygonTester.Create(Self) do
  try
  Obj_GetLayInfo(ptrObj, PolygonLay,PolygonSubLay);
  for I:=0 to Count-1 do begin
    Node:=Nodes[I];
    AddNode(Node.X,Node.Y);
    end;
  if flIgnoreSelf
   then ExceptObjPtr:=ptrObj
   else ExceptObjPtr:=nilPtr;
  Result:=HasPointInside;
  finally
  Destroy;
  end;
  //.
  finally
  Destroy;
  end;
//.
if Result then Exit; //. ->
//.
if Obj.flagLoop AND Obj.flagFill
 then with TSpacePolygonTester.Create(Self) do
  try
  Obj_GetLayInfo(ptrObj, PolygonLay,PolygonSubLay);
  ptrPoint:=Obj.ptrFirstPoint;
  while ptrPoint <> nilPtr do begin
    ReadObj(Point,SizeOf(Point), ptrPoint);
    AddNode(Point.X+ShiftX,Point.Y+ShiftY);
    ptrPoint:=Point.ptrNextObj;
    end;
  if flIgnoreSelf
   then ExceptObjPtr:=ptrObj
   else ExceptObjPtr:=nilPtr;
  Result:=HasPointInside;
  finally
  Destroy;
  end;
finally
Lock.Leave;
end;
end;

function TProxySpace.Obj_IsForbiddenPrivateArea(const ptrObj: TPtr; const ShiftX,ShiftY: TCrd; const flIgnoreSelf: boolean): boolean;
var
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;
  Node: TNodeSpaceObjPolyLinePolygon;
  I: integer;
begin
Result:=false;
Lock.Enter;
try
ReadObj(Obj,SizeOf(Obj), ptrObj);
if Obj.Width > 0
 then with TSpaceObjPolyLinePolygon.Create(Self,Obj,Obj.Width) do
  try
  Count:=0;
  ptrPoint:=Obj.ptrFirstPoint;
  while ptrPoint <> nilPtr do begin
    ReadObj(Point,SizeOf(Point), ptrPoint);
    Node.X:=Point.X+ShiftX;
    Node.Y:=Point.Y+ShiftY;
    Nodes[Count]:=Node;
    Inc(Count);
    ptrPoint:=Point.ptrNextObj;
    end;
  //.
  Update();
  //.
  with TSpacePolygonTester.Create(Self) do
  try
  Obj_GetLayInfo(ptrObj, PolygonLay,PolygonSubLay);
  for I:=0 to Count-1 do begin
    Node:=Nodes[I];
    AddNode(Node.X,Node.Y);
    end;
  if flIgnoreSelf
   then ExceptObjPtr:=ptrObj
   else ExceptObjPtr:=nilPtr;
  Result:=IsForbiddenPrivateArea;
  finally
  Destroy;
  end;
  //.
  finally
  Destroy;
  end;
//.
if Result then Exit; //. ->
//.
if Obj.flagLoop AND Obj.flagFill
 then with TSpacePolygonTester.Create(Self) do
  try
  Obj_GetLayInfo(ptrObj, PolygonLay,PolygonSubLay);
  ptrPoint:=Obj.ptrFirstPoint;
  while ptrPoint <> nilPtr do begin
    ReadObj(Point,SizeOf(Point), ptrPoint);
    AddNode(Point.X+ShiftX,Point.Y+ShiftY);
    ptrPoint:=Point.ptrNextObj;
    end;
  if flIgnoreSelf
   then ExceptObjPtr:=ptrObj
   else ExceptObjPtr:=nilPtr;
  Result:=IsForbiddenPrivateArea;
  finally
  Destroy;
  end;
finally
Lock.Leave;
end;
end;

function TProxySpace.Obj_ActualityInterval_Get(const ptrObj: TPtr): TComponentActualityInterval; 
var
  Obj: TSpaceObj;
begin
ReadObj(Obj,SizeOf(Obj), ptrObj);
Result:=Obj_ActualityInterval_Get(Obj);
end;

function TProxySpace.Obj_ActualityInterval_Get(const Obj: TSpaceObj): TComponentActualityInterval;
begin
Result.BeginTimestamp:=NullTimestamp;
Result.EndTimestamp:=MaxTimestamp;
try
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
try
Result:=ActualityInterval_GetLocally();
finally
Release();
end;
except
  on E: ETypeNotFound do ; //. ->
  on E: ETypeDisabled do ; //. ->
  else
    Raise; //. =>
  end;
end;

function TProxySpace.Obj_ActualityInterval_IsActualForTimeInterval(const ptrObj: TPtr; const pInterval: TComponentActualityInterval): boolean;
var
  Obj: TSpaceObj;
begin
ReadObj(Obj,SizeOf(Obj), ptrObj);
Result:=Obj_ActualityInterval_IsActualForTimeInterval(Obj,pInterval);
end;

function TProxySpace.Obj_ActualityInterval_IsActualForTimeInterval(const Obj: TSpaceObj; const pInterval: TComponentActualityInterval): boolean;
begin
try
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
try
Result:=ActualityInterval_IsActualForTimeIntervalLocally(pInterval);
finally
Release();
end;
except
  on E: ETypeNotFound do Result:=true; //. ->
  on E: ETypeDisabled do Result:=true; //. ->
  else
    Raise; //. =>
  end;
end;

procedure TProxySpace.Obj_CheckCachedState(const ptrObj: TPtr; const flRecursive: boolean = true);

  procedure PrepareStructuredObjects(ptrObj: TPtr);

    procedure ProcessObject(const ObjPointers: TByteArray; const PointersCount: integer);

      procedure ProcessObjDetails(const ptrObj: TPtr; var StructuresPtr: pointer);
      var
        ptrDetail: TPtr;
        DetailSubDetailsCount: word;
        ptrptrOwnerObj: TPtr;
        I: integer;
      begin
      asm
         CLD
         PUSH ESI
         PUSH EDI
         MOV EDI,StructuresPtr
         MOV ESI,[EDI]
         LODSW
         MOV DetailSubDetailsCount,AX
         MOV [EDI],ESI
         POP EDI
         POP ESI
      end;
      ptrptrOwnerObj:=ptrObj+ofsptrListOwnerObj;
      for I:=0 to DetailSubDetailsCount-1 do begin
        asm
           CLD
           PUSH ESI
           PUSH EDI
           MOV EDI,StructuresPtr
           MOV ESI,[EDI]
           LODSD
           MOV ptrDetail,EAX
           MOV [EDI],ESI
           POP EDI
           POP ESI
        end;
        WriteObjLocalStorage(ptrDetail,SizeOf(ptrDetail),ptrptrOwnerObj);
        ptrptrOwnerObj:=ptrDetail;
        //. process sub-details
        ProcessObjDetails(ptrDetail, StructuresPtr);
        end;
      ptrDetail:=nilPtr;
      WriteObjLocalStorage(ptrDetail,SizeOf(ptrDetail),ptrptrOwnerObj);
      end;

    var
      ObjPointersPtr: pointer;
      Structures: TByteArray;
      StructuresPtr: pointer;
      ptrObj: TPtr;
      ptrDetail: TPtr;
      ptrptrOwnerObj: TPtr;
    begin
    Structures:=GetISpaceManager(SOAPServerURL).ReadObjectsStructures(UserName,UserPassword, ObjPointers,PointersCount);
    ObjPointersPtr:=@ObjPointers[0];
    StructuresPtr:=@Structures[0];
    Lock.Enter;
    try
    //. get ptrObj
    asm
       CLD
       PUSH ESI
       MOV ESI,ObjPointersPtr
       LODSD
       MOV ptrObj,EAX
       POP ESI
    end;
    //.
    if (StructuresPtr <> nil) 
     then ProcessObjDetails(ptrObj,StructuresPtr)
     else begin
      ptrptrOwnerObj:=ptrObj+ofsptrListOwnerObj;
      ptrDetail:=nilPtr;
      WriteObjLocalStorage(ptrDetail,SizeOf(ptrDetail),ptrptrOwnerObj);
      end;
    finally
    Lock.Leave;
    end;
    end;

  var
    ObjPointers: TByteArray;
    ObjPointersPtr: pointer;
  begin
  SetLength(ObjPointers,1*SizeOf(TPtr));
  ObjPointersPtr:=@ObjPointers[0];
  asm
     PUSH EDI
     MOV EAX,ptrObj
     MOV EDI,ObjPointersPtr
     CLD
     STOSD
     POP EDI
  end;
  ProcessObject(ObjPointers,1);
  end;

  procedure ProcessObj(const ptrObj: TPtr; var ObjectsPointersList: TList);
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  if (NOT Obj_IsCached(ptrObj))
   then begin
    if ObjectsPointersList = nil then ObjectsPointersList:=TList.Create;
    ObjectsPointersList.Add(Pointer(ptrObj));
    end
   else Exit; //. ->
  //. process own objects
  ReadObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
  if (Obj.idTObj = idTLay2DVisualization) then Exit; //. ->
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while (ptrOwnerObj <> nilPtr) do begin
    ProcessObj(ptrOwnerObj, ObjectsPointersList);
    ReadObjLocalStorage(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
    end;
  end;

const
  SizeOfTSpaceObj = SizeOf(TSpaceObj);
  SizeOfTPoint = SizeOf(TPoint);
var
  ObjectsPointersList: TList;
  I: integer;
  ptrNonCachedObj: TPtr;
  ObjPointers: TByteArray;
  ptrPointersBuffer: pointer;
  ptrDist: pointer;
  ptrObject: TPtr;
  ptrObjAccessed: TPtr;
  Objects: TByteArray;
  ptrObjectsBuffer: pointer;
  ptrSrs: pointer;
  ptrObjPointer: pointer;
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;
begin
if (unitSpaceFunctionalServer.flYes) then Lock.Enter();
try
if (Obj_IsCached(ptrObj)) then Exit; //. ->
//. map into the space obj tree structure
if (flRecursive) then PrepareStructuredObjects(ptrObj);
//.
ObjectsPointersList:=nil;
try
if (flRecursive)
 then ProcessObj(ptrObj, ObjectsPointersList)
 else begin
  ObjectsPointersList:=TList.Create;
  ObjectsPointersList.Add(Pointer(ptrObj));
  end;
if (ObjectsPointersList <> nil)
 then begin
  //. prepare pointers array
  SetLength(ObjPointers,ObjectsPointersList.Count*SizeOf(TPtr));
  ptrPointersBuffer:=@ObjPointers[0];
  //.
  ptrDist:=ptrPointersBuffer;
  for I:=0 to ObjectsPointersList.Count-1 do begin
    ptrNonCachedObj:=TPtr(ObjectsPointersList[I]);
    //. insert object pointer
    asm
       PUSH EDI
       MOV EAX,ptrNonCachedObj
       MOV EDI,ptrDist
       CLD
       STOSD
       MOV ptrDist,EDI
       POP EDI
    end;
    end;
  //. remote call using pointers array
  Objects:=GetISpaceManager(SOAPServerURL).ReadObjects(UserName,UserPassword, ObjPointers,ObjectsPointersList.Count);
  ptrObjectsBuffer:=@Objects[0];
  //. cashing types system for incoming objects
  ptrSrs:=ptrObjectsBuffer;
  TTypesSystem(TypesSystem).Caching_Start;
  try
  for I:=0 to ObjectsPointersList.Count-1 do begin
    //. get object body
    asm
       PUSH ESI
       PUSH EDI
       MOV ESI,ptrSrs
       CLD
       LEA EDI,Obj
       MOV ECX,SizeOfTSpaceObj
       REP MOVSB
       MOV ptrSrs,ESI
       POP EDI
       POP ESI
    end;
    //. add object for cashing
    if (Obj.idObj <> 0) then TTypesSystem(TypesSystem).Caching_AddObject(Obj.idTObj,Obj.idObj);
    //. skip points
    ptrPoint:=Obj.ptrFirstPoint;
    while ptrPoint <> nilPtr do begin
      //. get point
      asm
         PUSH ESI
         PUSH EDI
         MOV ESI,ptrSrs
         CLD
         LEA EDI,Point
         MOV ECX,SizeOfTPoint
         REP MOVSB
         MOV ptrSrs,ESI
         POP EDI
         POP ESI
      end;
      //. go to next point
      ptrPoint:=Point.ptrNextObj;
      end;
    end;
  finally
  TTypesSystem(TypesSystem).Caching_Finish;
  end;
  //. write objects
  ptrSrs:=ptrObjectsBuffer;
  ptrObjPointer:=ptrPointersBuffer;
  Lock.Enter;
  try
  for I:=0 to ObjectsPointersList.Count-1 do begin
    //. get ptrObject
    asm
       CLD
       PUSH ESI
       MOV ESI,ptrObjPointer
       LODSD
       MOV ptrObject,EAX
       MOV ptrObjPointer,ESI
       POP ESI
    end;
    //. get object body
    asm
       PUSH ESI
       PUSH EDI
       MOV ESI,ptrSrs
       CLD
       LEA EDI,Obj
       MOV ECX,SizeOfTSpaceObj
       REP MOVSB
       MOV ptrSrs,ESI
       POP EDI
       POP ESI
    end;
    //. write body
    ptrObjAccessed:=ptrObject;
    WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObject);
    ptrPoint:=Obj.ptrFirstPoint;
    while ptrPoint <> nilPtr do begin
      //. get point
      asm
         PUSH ESI
         PUSH EDI
         MOV ESI,ptrSrs
         CLD
         LEA EDI,Point
         MOV ECX,SizeOfTPoint
         REP MOVSB
         MOV ptrSrs,ESI
         POP EDI
         POP ESI
      end;
      //. write point
      WriteObjLocalStorage(Point,SizeOf(Point), ptrPoint);
      //. go to next point
      ptrPoint:=Point.ptrNextObj;
      end;
    //. process obj as accessed
    if (Obj.idTObj <> idTLay2DVisualization) then ObjectsContextRegistry.ObjAccessed(ptrObjAccessed);
    end;
  finally
  Lock.Leave;
  end;
  end;
finally
FreeAndNil(ObjectsPointersList);
end;
finally
if (unitSpaceFunctionalServer.flYes) then Lock.Leave();
end;
end;

procedure TProxySpace.Obj_ClearCachedState(const ptrObj: TPtr; const flRecursive: boolean = true);

  procedure ProcessObj(ptrObj: TPtr);
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  ReadObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
  //. if object null then exit
  if (Obj.idTObj = 0) then Exit; //. ->
  //. else, remove item from context
  ObjectsContextRegistry.Remove(ptrObj);
  //.
  TTypesSystem(TypesSystem).Context_RemoveItem(Obj.idTObj,Obj.idObj);
  //. clear obj cached sign
  Obj.idTObj:=0;
  WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
  //.
  if (NOT flRecursive) then Exit; //. ->
  //. process own objects
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ((ptrOwnerObj <> 0) AND (ptrOwnerObj <> nilPtr)) do begin
    ProcessObj(ptrOwnerObj);
    ReadObjLocalStorage(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
    end;
  end;

begin
Lock.Enter;
try
ProcessObj(ptrObj);
finally
Lock.Leave;
end;
end;

procedure TProxySpace.Obj_UpdateLocal(const ptrObj: TPtr; const flRecursive: boolean = true);

  procedure ProcessObj(const ptrObj: TPtr; var ObjectsPointersList: TList);
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  if (ObjectsPointersList = nil) then ObjectsPointersList:=TList.Create;
  ObjectsPointersList.Add(Pointer(ptrObj));
  //. process own objects
  if (NOT flRecursive) then Exit; //. ->
  ReadObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
  if (Obj.idTObj = idTLay2DVisualization) then Exit; //. ->
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ((ptrOwnerObj <> 0) AND (ptrOwnerObj <> nilPtr)) do begin
    ProcessObj(ptrOwnerObj, ObjectsPointersList);
    ReadObjLocalStorage(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
    end;
  end;

const
  SizeOfTSpaceObj = SizeOf(TSpaceObj);
  SizeOfTPoint = SizeOf(TPoint);
var
  ObjectsPointersList: TList;
  I: integer;
  ptrUpdateObj: TPtr;
  ObjPointers: TByteArray;
  ptrPointersBuffer: pointer;
  ptrDist: pointer;
  ptrObject: TPtr;
  Objects: TByteArray;
  ptrObjectsBuffer: pointer;
  ptrSrs: pointer;
  ptrObjPointer: pointer;
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;
begin
if (NOT Obj_IsCached(ptrObj))
 then begin
  Obj_CheckCachedState(ptrObj);
  Exit; //. ->
  end;
ObjectsPointersList:=nil;
try
ProcessObj(ptrObj, ObjectsPointersList);
if (ObjectsPointersList <> nil)
 then begin
  //. prepare pointers array
  SetLength(ObjPointers,ObjectsPointersList.Count*SizeOf(TPtr));
  ptrPointersBuffer:=@ObjPointers[0];
  //.
  ptrDist:=ptrPointersBuffer;
  for I:=0 to ObjectsPointersList.Count-1 do begin
    ptrUpdateObj:=TPtr(ObjectsPointersList[I]);
    //. insert object pointer
    asm
       PUSH EDI
       MOV EAX,ptrUpdateObj
       MOV EDI,ptrDist
       CLD
       STOSD
       MOV ptrDist,EDI
       POP EDI
    end;
    //.
    end;
  //. remote call using pointers array
  Objects:=GetISpaceManager(SOAPServerURL).ReadObjects(UserName,UserPassword, ObjPointers,ObjectsPointersList.Count);
  ptrObjectsBuffer:=@Objects[0];
  //. write objects
  ptrSrs:=ptrObjectsBuffer;
  ptrObjPointer:=ptrPointersBuffer;
  Lock.Enter;
  try
  for I:=0 to ObjectsPointersList.Count-1 do begin
    //. get ptrObject
    asm
       CLD
       PUSH ESI
       MOV ESI,ptrObjPointer
       LODSD
       MOV ptrObject,EAX
       MOV ptrObjPointer,ESI
       POP ESI
    end;
    //. get object body
    asm
       PUSH ESI
       PUSH EDI
       MOV ESI,ptrSrs
       CLD
       LEA EDI,Obj
       MOV ECX,SizeOfTSpaceObj
       REP MOVSB
       MOV ptrSrs,ESI
       POP EDI
       POP ESI
    end;
    //. write body
    WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObject);
    ptrPoint:=Obj.ptrFirstPoint;
    while ptrPoint <> nilPtr do begin
      //. get point
      asm
         PUSH ESI
         PUSH EDI
         MOV ESI,ptrSrs
         CLD
         LEA EDI,Point
         MOV ECX,SizeOfTPoint
         REP MOVSB
         MOV ptrSrs,ESI
         POP EDI
         POP ESI
      end;
      //. write point
      WriteObjLocalStorage(Point,SizeOf(Point), ptrPoint);
      //. go to next point
      ptrPoint:=Point.ptrNextObj;
      end;
    end;
  finally
  Lock.Leave;
  end;
  end;
finally
FreeAndNil(ObjectsPointersList);
end;
end;

procedure TProxySpace.Obj_UpdateLocal__Start;
begin
end;

procedure TProxySpace.Obj_UpdateLocal__Finish;
const
  SizeOfTSpaceObj = SizeOf(TSpaceObj);
  SizeOfTPoint = SizeOf(TPoint);
var
  ObjectsPointersList: TList;
  LockedList: TList;
  I: integer;
  ptrUpdateObj: TPtr;
  ObjPointers: TByteArray;
  ptrPointersBuffer: pointer;
  ptrDist: pointer;
  ptrObject: TPtr;
  Objects: TByteArray;
  ptrObjectsBuffer: pointer;
  ptrSrs: pointer;
  ptrObjPointer: pointer;
  Obj: TSpaceObj;
  ptrPoint: TPtr;
  Point: TPoint;
begin
ObjectsPointersList:=nil;
try
//. get objects to update
LockedList:=Obj_UpdateLocal__List.LockList;
try
if (LockedList.Count > 0)
 then begin
  ObjectsPointersList:=TList.Create;
  ObjectsPointersList.Capacity:=LockedList.Capacity;
  for I:=0 to LockedList.Count-1 do ObjectsPointersList.Add(LockedList[I]);
  LockedList.Clear;
  end;
finally
Obj_UpdateLocal__List.UnLockList;
end;
//. updating ...
if (ObjectsPointersList <> nil)
 then begin
  //. prepare pointers array
  SetLength(ObjPointers,ObjectsPointersList.Count*SizeOf(TPtr));
  ptrPointersBuffer:=@ObjPointers[0];
  //.
  ptrDist:=ptrPointersBuffer;
  for I:=0 to ObjectsPointersList.Count-1 do begin
    ptrUpdateObj:=TPtr(ObjectsPointersList[I]);
    //. insert object pointer
    asm
       PUSH EDI
       MOV EAX,ptrUpdateObj
       MOV EDI,ptrDist
       CLD
       STOSD
       MOV ptrDist,EDI
       POP EDI
    end;
    end;
  //. remote call using pointers array
  Objects:=GetISpaceManager(SOAPServerURL).ReadObjects(UserName,UserPassword, ObjPointers,ObjectsPointersList.Count);
  ptrObjectsBuffer:=@Objects[0];
  //. write objects
  ptrSrs:=ptrObjectsBuffer;
  ptrObjPointer:=ptrPointersBuffer;
  Lock.Enter;
  try
  for I:=0 to ObjectsPointersList.Count-1 do begin
    //. get ptrObject
    asm
       CLD
       PUSH ESI
       MOV ESI,ptrObjPointer
       LODSD
       MOV ptrObject,EAX
       MOV ptrObjPointer,ESI
       POP ESI
    end;
    //. get object body
    asm
       PUSH ESI
       PUSH EDI
       MOV ESI,ptrSrs
       CLD
       LEA EDI,Obj
       MOV ECX,SizeOfTSpaceObj
       REP MOVSB
       MOV ptrSrs,ESI
       POP EDI
       POP ESI
    end;
    //. write body
    WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObject);
    ptrPoint:=Obj.ptrFirstPoint;
    while ptrPoint <> nilPtr do begin
      //. get point
      asm
         PUSH ESI
         PUSH EDI
         MOV ESI,ptrSrs
         CLD
         LEA EDI,Point
         MOV ECX,SizeOfTPoint
         REP MOVSB
         MOV ptrSrs,ESI
         POP EDI
         POP ESI
      end;
      //. write point
      WriteObjLocalStorage(Point,SizeOf(Point), ptrPoint);
      //. go to next point
      ptrPoint:=Point.ptrNextObj;
      end;
    end;
  finally
  Lock.Leave;
  end;
  end;
finally
FreeAndNil(ObjectsPointersList);
end;
end;

procedure TProxySpace.Obj_UpdateLocal__Add(const ptrObj: TPtr; const flRecursive: boolean = true);

  procedure ProcessObj(const ptrObj: TPtr; const flRecurse: boolean);
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Obj_UpdateLocal__List.Add(Pointer(ptrObj));
  //. process own objects
  if (NOT flRecurse) then Exit; //. ->
  ReadObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
  if Obj.idTObj = idTLay2DVisualization then Exit; //. ->
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while ((ptrOwnerObj <> 0) AND (ptrOwnerObj <> nilPtr)) do begin
    ProcessObj(ptrOwnerObj,flRecurse);
    ReadObjLocalStorage(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
    end;
  end;

begin
if (NOT Obj_IsCached(ptrObj))
 then begin
  Obj_CheckCachedState(ptrObj);
  Exit; //. ->
  end;
ProcessObj(ptrObj,flRecursive);
end;

function TProxySpace.LevelsCount: integer;
var
  curLevel: integer;

  procedure TreateObj(ptrObj: TPtr);
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  if curLevel > Result
   then Result:=curLevel;
  Inc(curLevel);
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
   TreateObj(ptrOwnerObj);
   ReadObj(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
   end;
  Dec(curLevel);
  end;

begin
Result:=0;
if ptrRootObj = nilPtr then Exit;
curLevel:=0;
TreateObj(ptrRootObj);
inc(Result);
end;

function TProxySpace.LaysCount: integer;
var
  Count: integer;

  function TreateLay(const ptrObj: TPtr): boolean;
  var
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
  begin
  Result:=false;
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  if Obj.idTObj = idTLay2DVisualization
   then begin
    Inc(Count);
    Result:=true;
    end;
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  While ptrOwnerObj <> nilPtr do begin
   if TreateLay(ptrOwnerObj)
    then begin
     Result:=true;
     Exit; //. -->
     end;
   ReadObj(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
   end;
  end;

begin
Result:=0;
Count:=0;
TreateLay(ptrRootObj);
Result:=Count;
/// - inc(Result);
end;

function TProxySpace.LaysID: integer;

  function ProcessLay(const ptrObj: TPtr; var HashCode: integer): boolean;
  var
    Obj: TSpaceObj;
    Code: integer;
    ptrOwnerObj: TPtr;
  begin
  Result:=false;
  ReadObj(Obj,SizeOf(Obj), ptrObj);
  if (Obj.idTObj = idTLay2DVisualization)
   then begin
    Code:=(HashCode XOR ptrObj);
    asm ROL Code,5 end;
    HashCode:=Code;
    //.
    Result:=true;
    end;
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while (ptrOwnerObj <> nilPtr) do begin
    if ProcessLay(ptrOwnerObj,{ref} HashCode)
     then begin
      Result:=true;
      Exit; //. -->
      end;
    ReadObj(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
    end;
  end;

begin
Result:=0;
ProcessLay(ptrRootObj,{ref} Result);
end;



procedure TProxySpace.DoOnObjectOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
TypesSystem_DoOnComponentOperationLocal(idTObj,idObj, Operation);
end;

procedure TProxySpace.DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
case Operation of
opCreate: DoOnObjectOperation(idTObj,idObj, Operation);
opDestroy,opUpdate: DoOnObjectOperation(idTObj,idObj, Operation);
else begin //. компонентные действи€
  end;
end;
end;

procedure TProxySpace.DoOnComponentPartialUpdate(const idTObj,idObj: integer; const Data: TByteArray);
begin
TypesSystem_DoOnComponentPartialUpdateLocal(idTObj,idObj,Data);
end;

procedure TProxySpace.CheckUserDATASize(const pUserName,pUserPassword: WideString; const AddDATASize: integer);
var
  idUser: integer;
var
  _DATASize,_MaxDATASize: integer;
begin
if pUserName <> ''
 then with TMODELServerFunctionality(TComponentFunctionality_Create(idTMODELServer,0)) do
  try
  idUser:=GetUserID(pUserName,pUserPassword);
  finally
  Release;
  end
 else idUser:=UserID;
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
_DATASize:=DATASize;
_MaxDATASize:=MaxDATASize;
finally
Release;
end;
if _MaxDATASize = -1 then Exit; //. ->
if ((_DATASize+AddDATASize) > _MaxDATASize) then Raise Exception.Create('data size of user components is above than maximum allowed'); //. =>
end;

procedure TProxySpace.CheckUserSpaceSquare(const pUserName,pUserPassword: WideString; const AddSpaceSquare: Extended);
var
  idUser: integer;
var
  _SpaceSquare: Extended;
  _MaxSpaceSquare: integer;
begin
if pUserName <> ''
 then with TMODELServerFunctionality(TComponentFunctionality_Create(idTMODELServer,0)) do
  try
  idUser:=GetUserID(pUserName,pUserPassword);
  finally
  Release;
  end
 else idUser:=UserID;
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
_SpaceSquare:=SpaceSquare;
_MaxSpaceSquare:=MaxSpaceSquare;
finally
Release;
end; 
if _MaxSpaceSquare = -1 then Exit; //. ->
if (_SpaceSquare+AddSpaceSquare) > _MaxSpaceSquare then Raise Exception.Create('summary space square of the user objects is above than maximum allowed'); //. =>
end;

procedure TProxySpace.CheckUserMaxSpaceSquarePerObject(const pUserName,pUserPassword: WideString; const ObjectSpaceSquare: Extended);
var
  idUser: integer;
var
  _SpaceSquare: Extended;
begin
if pUserName <> ''
 then with TMODELServerFunctionality(TComponentFunctionality_Create(idTMODELServer,0)) do
  try
  idUser:=GetUserID(pUserName,pUserPassword);
  finally
  Release;
  end
 else idUser:=UserID;
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
_SpaceSquare:=MaxSpaceSquarePerObject;
finally
Release;
end;
if (_SpaceSquare = -1) then Exit; //. ->
_SpaceSquare:=_SpaceSquare*0.0001;
if (ObjectSpaceSquare > _SpaceSquare) then Raise Exception.Create('object space square is above than maximum allowed for this user'); //. =>
end;

procedure TProxySpace.RemoveSavedUserContext();
begin
with TProxySpaceSavedUserContext.Create(Self) do
try
DestroyContext(ContextFileName);
finally
Destroy;
end;
end;

function TProxySpace.SavedUserContext_GetParams(out HistoryID: integer): boolean;
var
  UserContextFolder: string;
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  Node: IXMLDOMNode;
begin
Result:=false;
UserContextFolder:=WorkLocale+'\'+PathContexts+'\'+IntToStr(ID)+'\'+UserName;
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
Doc.Load(UserContextFolder+'\'+ContextFileName);
VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
if (VersionNode <> nil)
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version <> 0) then Exit; //. ->
//.
Node:=Doc.documentElement.selectSingleNode('/ROOT/HistoryID');
if (Node <> nil)
 then HistoryID:=Node.nodeTypedValue
 else HistoryID:=0;
//.
Result:=true;
end;

procedure TProxySpace.ReviseSpaceContext;
begin
//. rebuld space objects context
if (ContextItemsMaxCount > 0) then ObjectsContextRegistry.ClearOldObjects(ContextItemsMaxCount);
end;

procedure TProxySpace.ReviseSpaceContext(out ObjectsContext: TPtrArray);
begin
//. rebuld space objects context
if (ContextItemsMaxCount > 0) then ObjectsContextRegistry.GetFirstObjectsAndClearRest(ContextItemsMaxCount, ObjectsContext);
end;

procedure TProxySpace.GetSpaceContext(out ObjectsContext: TPtrArray);
begin
ObjectsContextRegistry.GetObjects(ObjectsContext);
end;

procedure TProxySpace.ClearSpaceContext();
var
  SpaceHistory,ComponentsHistory,ComponentsUpdateHistory,VisualizationsHistory: TByteArray;
begin
Context_UpdateLock.Enter;
try
Lock.Enter;
try
//. clear context registry
ObjectsContextRegistry.Clear();
//. clear space storage
LocalStorage.Clear();
//. clear types system cached items
TTypesSystem(TypesSystem).Context_ClearItems();
//. reload space layer's structure
LoadSpaceStructure();
finally
Lock.Leave;
end;
//. set last update time to server value
Context_LastUpdatesTimeStamp:=0.0;
with GetISpaceReports(SOAPServerURL) do AllHistory_GetHistorySinceUsingContext1(UserName,UserPassword,nil, Double(Context_LastUpdatesTimeStamp), SpaceHistory,ComponentsHistory,ComponentsUpdateHistory,VisualizationsHistory);
finally
Context_UpdateLock.Leave;
end;
end;

procedure TProxySpace.ClearInactiveSpaceContext(out ObjectsCount: integer; out ObjectsRemains: integer);

  function ObjIsVisibleInReflectors(const ptrObj: TPtr): boolean;
  var
    minX,minY,maxX,maxY: Extended;

  begin
  Result:=(TReflectorsList(ReflectorsList).IsObjVisible(ptrObj));
  end;

var
  Objects: TPtrArray;
  I: integer;
begin
ObjectsCount:=0;
Context_UpdateLock.Enter;
try
Lock.Enter;
try
ObjectsContextRegistry.GetObjects(Objects);
for I:=0 to Length(Objects)-1 do
  if (NOT Obj_IsCached(Objects[I]) OR NOT ObjIsVisibleInReflectors(Objects[I]))
   then begin
    Obj_ClearCachedState(Objects[I],false);
    Inc(ObjectsCount);
    end;
//. clear types inactive contexts
TTypesSystem(TypesSystem).Context_ClearInactiveItems();
finally
Lock.Leave;
end;
finally
Context_UpdateLock.Leave;
end;
ObjectsRemains:=Length(Objects)-ObjectsCount;
end;

procedure TProxySpace.ClearInactiveSpaceContext();
var
  ObjectsCount: integer;
  ObjectsRemains: integer;
begin
ClearInactiveSpaceContext({out} ObjectsCount,ObjectsRemains);
end;

procedure TProxySpace.SaveSpaceContext(const ContextFile: string);

  function GetSpaceDATAForRealMemory: OLEVariant;
  var
    MS: TMemoryStream;
    DATAPtr: pointer;
  begin
  MS:=TMemoryStream.Create;
  with MS do
  try
  with TCompressionStream.Create(clMax, MS) do
  try
  with TRealMemory(LocalStorage) do Write(ptrBuff^,Size)
  finally
  Destroy;
  end;
  Result:=VarArrayCreate([0,Size-1],varByte);
  DATAPtr:=VarArrayLock(Result);
  try
  Position:=0;
  Read(DATAPtr^,Size);
  finally
  VarArrayUnLock(Result);
  end;
  finally
  Destroy;
  end;
  end;

  function GetSpaceDATAForSegMemory: OLEVariant;

    procedure GetLayersPointers(out LayersPointers: TPtrArray);
    var
      LayersPtrs: TList;
      I: integer;
      ptrLay: TPtr;
      Lay: TSpaceObj;
    begin
    LayersPtrs:=TList.Create;
    try
    ptrLay:=ptrRootObj;
    while (ptrLay <> nilPtr) do begin
      ReadObj(Lay,SizeOf(Lay),ptrLay);
      if (Lay.idTObj <> idTLay2DVisualization) then Raise Exception.Create('invalid space layer structure'); //. =>
      LayersPtrs.Add(Pointer(ptrLay));
      //. next layer
      ptrLay:=Lay.ptrListOwnerObj;
      end;
    SetLength(LayersPointers,LayersPtrs.Count);
    for I:=0 to Length(LayersPointers)-1 do LayersPointers[I]:=TPtr(LayersPtrs[I]);
    finally
    LayersPtrs.Destroy;
    end;
    end;

    procedure ResultSegSpace_ProcessPointers(const SegSpace: TSegMemory; const Pointers: TPtrArray);
    var
      I: integer;
      ptrObj: TPtr;
      Obj: TSpaceObj;
      ptrPoint: TPtr;
      Point: TPoint;
    begin
    for I:=0 to Length(Pointers)-1 do begin
      ptrObj:=Pointers[I];
      TSegMemory(LocalStorage).Mem_Read(Obj,SizeOf(Obj),ptrObj);
      //. write the obj points
      ptrPoint:=Obj.ptrFirstPoint;
      while (ptrPoint <> nilPtr) do begin
        TSegMemory(LocalStorage).Mem_Read(Point,SizeOf(Point),ptrPoint);
        SegSpace.Mem_Write(Point,SizeOf(Point), unitLinearMemory.TAddress(ptrPoint));
        //.
        ptrPoint:=Point.ptrNextObj;
        end;
      //. write the obj body
      SegSpace.Mem_Write(Obj,SizeOf(Obj), unitLinearMemory.TAddress(ptrObj));
      end;
    end;

  var
    SegSpace: TSegMemory;
    ObjPointers: TPtrArray;
    MS,SS: TMemoryStream;
    DATAPtr: pointer;
  begin
  SegSpace:=TSegMemory.Create;
  try
  //. clear space from the disabled(destroyed or de-cached) objects
  GetLayersPointers(ObjPointers);
  ResultSegSpace_ProcessPointers(SegSpace, ObjPointers);
  GetSpaceContext(ObjPointers);
  ResultSegSpace_ProcessPointers(SegSpace, ObjPointers);
 //.
  MS:=TMemoryStream.Create;
  with MS do
  try
  with TCompressionStream.Create(clMax, MS) do
  try
  SegSpace.SaveToStream(SS);
  try
  Write(SS.Memory^,SS.Size);
  finally
  SS.Destroy;
  end;
  finally
  Destroy;
  end;
  Result:=VarArrayCreate([0,Size-1],varByte);
  DATAPtr:=VarArrayLock(Result);
  try
  Position:=0;
  Read(DATAPtr^,Size);
  finally
  VarArrayUnLock(Result);
  end;
  finally
  Destroy;
  end;
  finally
  SegSpace.Destroy;
  end;
  end;

  function GetSpaceObjPointersAndLayInfo: OLEVariant;
  var
    SortedItems: pointer;
    ItemsCount: integer;
    DATAPtr: pointer;
    ptrItem: pointer;
    ptrDestroyItem: pointer;
  begin
  ObjectsContextRegistry.GetItemsSorted(SortedItems,ItemsCount);
  try
  Result:=VarArrayCreate([0,(ItemsCount*(SizeOf(TPtr){size of object pointer}+SizeOf(SmallInt){size of object lay}+SizeOf(SmallInt){size of object sublay}))-1],varByte);
  DATAPtr:=VarArrayLock(Result);
  try
  ptrItem:=SortedItems;
  while (ptrItem <> nil) do with TSpaceObjectsContextRegistryItem(ptrItem^) do begin
    TPtr(DATAPtr^):=Ptr; Inc(Integer(DATAPtr),SizeOf(TPtr));
    SmallInt(DATAPtr^):=Lay; Inc(Integer(DATAPtr),SizeOf(SmallInt));
    SmallInt(DATAPtr^):=SubLay; Inc(Integer(DATAPtr),SizeOf(SmallInt));
    //.
    ptrItem:=Next;
    end;
  finally
  VarArrayUnLock(Result);
  end;
  finally
  while (SortedItems <> nil) do begin
    ptrDestroyItem:=SortedItems;
    SortedItems:=TSpaceObjectsContextRegistryItem(ptrDestroyItem^).Next;
    //.
    FreeMem(ptrDestroyItem,SizeOf(TSpaceObjectsContextRegistryItem));
    end;
  end;
  end;

var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  HistoryIDNode: IXMLDOMElement;
  TimeStampNode: IXMLDOMElement;
  SpaceNode: IXMLDOMElement;
  SpaceIDNode: IXMLDOMElement;
  SpacePackIDNode: IXMLDOMElement;
  SpaceObjectsInfoNode: IXMLDOMElement;
  SpaceDATANode: IXMLDOMElement;
  SpaceTypesSystemNode: IXMLDOMElement;
begin
if (flStartedInOffline) then Exit; //. ->
//.
Lock.Enter;
try
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
HistoryIDNode:=Doc.createElement('HistoryID');
HistoryIDNode.nodeTypedValue:=Context_HistoryID;
Root.appendChild(HistoryIDNode);
TimeStampNode:=Doc.createElement('TimeStamp');
TimeStampNode.nodeTypedValue:=Double(Context_LastUpdatesTimeStamp);
Root.appendChild(TimeStampNode);
SpaceNode:=Doc.createElement('Space');
Root.appendChild(SpaceNode);
SpaceIDNode:=Doc.createElement('ID');
SpaceIDNode.nodeTypedValue:=ID;
SpaceNode.appendChild(SpaceIDNode);
SpacePackIDNode:=Doc.createElement('PackID');
SpacePackIDNode.nodeTypedValue:=SpacePackID;
SpaceNode.appendChild(SpacePackIDNode);
SpaceObjectsInfoNode:=Doc.createElement('ObjectsInfo');
SpaceObjectsInfoNode.Set_dataType('bin.base64');
SpaceObjectsInfoNode.nodeTypedValue:=GetSpaceObjPointersAndLayInfo;
SpaceNode.appendChild(SpaceObjectsInfoNode);
SpaceDATANode:=Doc.createElement('DATA');
SpaceDATANode.Set_dataType('bin.base64');
SpaceDATANode.nodeTypedValue:=GetSpaceDATAForSegMemory;
SpaceNode.appendChild(SpaceDATANode);
//. save types-system data
SpaceTypesSystemNode:=Doc.createElement('TypesSystem');
TTypesSystem(TypesSystem).Context_SaveDATA(Doc,SpaceTypesSystemNode);
SpaceNode.appendChild(SpaceTypesSystemNode);
//.
finally
Lock.Leave;
end;
//. save xml document
Doc.Save(WorkLocale+'\'+PathContexts+'\'+IntToStr(ID)+'\'+UserName+'\'+ContextFile);
end;

function TProxySpace.LoadSpaceContext(const ContextFile: string; out flSpacePackLoaded: boolean): boolean;

  procedure SetSpaceDATAForRealMemory(DATA: Variant);
  const
    Portion = 8192*10;
  var
    DATASize: integer;
    DATAPtr: pointer;
    MS: TMemoryStream;
    DS: TDecompressionStream;
    Buffer: array[0..Portion-1] of byte;
    Sz: integer;
    RS: TMemoryStream;
  begin
  if (DATA <> null)
   then begin
    DATASize:=VarArrayHighBound(DATA,1)+1;
    DATAPtr:=VarArrayLock(DATA);
    try
    MS:=TMemoryStream.Create;
    with MS do
    try
    Size:=DATASize;
    Write(DATAPtr^,DATASize);
    Position:=0;
    DS:=TDecompressionStream.Create(MS);
    try
    RS:=TMemoryStream.Create;
    try
    RS.Size:=(MS.Size SHL 2);
    repeat
      Sz:=DS.Read(Buffer,Portion);
      if Sz > 0 then RS.Write(Buffer,Sz);
    until Sz < Portion;
    RS.Position:=0;
    //. space restoring by context
    with TRealMemory(LocalStorage) do RS.Read(ptrBuff^,Size);
    //.
    finally
    RS.Destroy;
    end;
    finally
    DS.Destroy;
    end;
    finally
    Destroy;
    end;
    finally
    VarArrayUnLock(DATA);
    end;
    end;
  end;

  procedure SetSpaceDATAForSegMemory(DATA: Variant);
  const
    Portion = 8192*10;
  var
    DATASize: integer;
    DATAPtr: pointer;
    MS: TMemoryStream;
    DS: TDecompressionStream;
    Buffer: array[0..Portion-1] of byte;
    Sz: integer;
    RS: TMemoryStream;
  begin
  if (DATA <> null)
   then begin
    DATASize:=VarArrayHighBound(DATA,1)+1;
    DATAPtr:=VarArrayLock(DATA);
    try
    MS:=TMemoryStream.Create;
    with MS do
    try
    Size:=DATASize;
    Write(DATAPtr^,DATASize);
    Position:=0;
    DS:=TDecompressionStream.Create(MS);
    try
    RS:=TMemoryStream.Create;
    try
    RS.Size:=MS.Size;
    repeat
      Sz:=DS.Read(Buffer,Portion);
      if Sz > 0 then RS.Write(Buffer,Sz);
    until Sz < Portion;
    RS.Position:=0;
    //. space restoring by context
    TSegMemory(LocalStorage).LoadFromStream(RS);
    //.
    finally
    RS.Destroy;
    end;
    finally
    DS.Destroy;
    end;
    finally
    Destroy;
    end;
    finally
    VarArrayUnLock(DATA);
    end;
    end;
  end;

  procedure SetSpaceObjPointersAndLayInfo(ObjPointersAndLayInfo: Variant);
  var
    DATASize: integer;
    DATAPtr: pointer;
    Ptr: TPtr;
    Lay,SubLay: SmallInt;
    I: integer;
  begin
  if (ObjPointersAndLayInfo <> null)
   then begin
    DATASize:=VarArrayHighBound(ObjPointersAndLayInfo,1)+1;
    DATAPtr:=VarArrayLock(ObjPointersAndLayInfo);
    try
    for I:=(DATASize DIV (SizeOf(TPtr){size of object pointer}+SizeOf(SmallInt){size of object lay}+SizeOf(SmallInt){size of object sublay}))-1 downto 0 do begin
      Ptr:=TPtr(DATAPtr^); Inc(Integer(DATAPtr),SizeOf(TPtr));
      Lay:=SmallInt(DATAPtr^); Inc(Integer(DATAPtr),SizeOf(SmallInt));
      SubLay:=SmallInt(DATAPtr^); Inc(Integer(DATAPtr),SizeOf(SmallInt));
      //.
      ObjectsContextRegistry.ObjAccessed(Ptr,Lay,SubLay);
      end;
    finally
    VarArrayUnLock(ObjPointersAndLayInfo);
    end;
    end;
  end;

  procedure RealMemory_ProcessForNewSpacePack(ObjPointersAndLayInfo: Variant; DATA: Variant);
  const
    Portion = 8192*10;
    SizeOfTSpaceObj = SizeOf(TSpaceObj);
    SizeOfTPoint = SizeOf(TPoint);
  var
    DATASize: integer;
    DATAPtr: pointer;
    DATASize1: integer;
    DATAPtr1: pointer;
    PointersCounter,PointersCount: integer;
    P: pointer;
    DS: TDecompressionStream;
    Buffer: array[0..Portion-1] of byte;
    Sz: integer;
    MS,RS: TMemoryStream;
    I: integer;
    IDs: TByteArray;
    ID: TID;
    ptrObj: TPtr;
    Lay,SubLay: SmallInt;
    Obj: TSpaceObj;
    NewObjPointers: TByteArray;
    ptrSrs: pointer;
    ptrObjAccessed: TPtr;
    ptrPoint: TPtr;
    Point: TPoint;
  begin
  if (ObjPointersAndLayInfo <> null)
   then begin
    DATASize:=VarArrayHighBound(ObjPointersAndLayInfo,1)+1;
    DATAPtr:=VarArrayLock(ObjPointersAndLayInfo);
    try
    PointersCounter:=(DATASize DIV (SizeOf(TPtr){size of object pointer}+SizeOf(SmallInt){size of object lay}+SizeOf(SmallInt){size of object sublay}));
    if (NOT ((ContextItemsMaxCount > 0) AND (PointersCounter > ContextItemsMaxCount)))
     then PointersCount:=PointersCounter
     else PointersCount:=ContextItemsMaxCount;
    //. translate objects for a new space pack
    if (DATA = null) then Raise Exception.Create('invalid space data'); //. =>
    DATASize1:=VarArrayHighBound(DATA,1)+1;
    DATAPtr1:=VarArrayLock(DATA);
    try
    MS:=TMemoryStream.Create;
    with MS do
    try
    Size:=DATASize1;
    Write(DATAPtr1^,DATASize1);
    Position:=0;
    DS:=TDecompressionStream.Create(MS);
    try
    RS:=TMemoryStream.Create;
    try
    RS.Size:=MS.Size;
    repeat
      Sz:=DS.Read(Buffer,Portion);
      if Sz > 0 then RS.Write(Buffer,Sz);
    until Sz < Portion;
    //.
    SetLength(IDs,PointersCount*SizeOf(ID));
    P:=DATAPtr;
    for I:=0 to PointersCount-1 do begin
      ptrObj:=TPtr(P^); Inc(Integer(P),SizeOf(TPtr));
      Inc(Integer(P),SizeOf(SmallInt)); //. skip Lay
      Inc(Integer(P),SizeOf(SmallInt)); //. skip SubLay
      //.
      RS.Position:=ptrObj;
      RS.Read(Obj,SizeOf(Obj));
      ID.idType:=Obj.idTObj;
      ID.idObj:=Obj.idObj;
      TID(Pointer(Integer(@IDs[0])+I*SizeOf(ID))^):=ID;
      end;
    //.
    with GetISpaceManager(SOAPServerURL) do ReadObjectsByIDs(UserName,UserPassword, IDs,PointersCount, NewObjPointers);
    //.
    ptrSrs:=@NewObjPointers[0];
    for I:=0 to PointersCount-1 do begin
      //. get object pointer
      asm
         PUSH ESI
         MOV ESI,ptrSrs
         CLD
         LODSD
         MOV ptrObj,EAX
         MOV ptrSrs,ESI
         POP ESI
      end;
      //.
      if (ptrObj <> nilPtr)
       then begin
        //. get object body
        asm
           PUSH ESI
           PUSH EDI
           MOV ESI,ptrSrs
           CLD
           LEA EDI,Obj
           MOV ECX,SizeOfTSpaceObj
           REP MOVSB
           MOV ptrSrs,ESI
           POP EDI
           POP ESI
        end;
        //. write body
        ptrObjAccessed:=ptrObj;
        WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
        ptrPoint:=Obj.ptrFirstPoint;
        while ptrPoint <> nilPtr do begin
          //. get point
          asm
             PUSH ESI
             PUSH EDI
             MOV ESI,ptrSrs
             CLD
             LEA EDI,Point
             MOV ECX,SizeOfTPoint
             REP MOVSB
             MOV ptrSrs,ESI
             POP EDI
             POP ESI
          end;
          //. write point
          WriteObjLocalStorage(Point,SizeOf(Point), ptrPoint);
          //. go to next point
          ptrPoint:=Point.ptrNextObj;
          end;
        //. process obj as accessed
        if (Obj.idTObj <> idTLay2DVisualization) then ObjectsContextRegistry.ObjAccessed(ptrObjAccessed);
        end
       else begin //. remove obj from types-system cache
        ID:=TID(Pointer(Integer(@IDs[0])+I*SizeOf(ID))^);
        with TComponentFunctionality_Create(ID.idType,ID.idObj) do
        try
        TypeFunctionality.TypeSystem.DoOnComponentOperationLocal(idTObj,idObj,opDestroy);
        finally
        Release;
        end;
        end;
      end;
    //. remove objects outside of context maximum
    if ((ContextItemsMaxCount > 0) AND (PointersCounter > ContextItemsMaxCount))
     then begin
      P:=DATAPtr;
      for I:=ContextItemsMaxCount to PointersCounter-1 do begin
        ptrObj:=TPtr(P^); Inc(Integer(P),SizeOf(TPtr));
        Lay:=SmallInt(P^); Inc(Integer(P),SizeOf(SmallInt));
        SubLay:=SmallInt(P^); Inc(Integer(P),SizeOf(SmallInt));
        //.
        RS.Position:=ptrObj;
        RS.Read(Obj,SizeOf(Obj));
        with TComponentFunctionality_Create(Obj.idTObj,Obj.idObj) do
        try
        TypeFunctionality.TypeSystem.DoOnComponentOperationLocal(idTObj,idObj,opDestroy);
        finally
        Release;
        end;
        end;
      end;
    //. restore objects lay info
    P:=DATAPtr;
    for I:=0 to PointersCount-1 do begin
      ptrObj:=TPtr(P^); Inc(Integer(P),SizeOf(TPtr));
      Lay:=SmallInt(P^); Inc(Integer(P),SizeOf(SmallInt));
      SubLay:=SmallInt(P^); Inc(Integer(P),SizeOf(SmallInt));
      //.
      ObjectsContextRegistry.ObjSetLayInfo(ptrObj,Lay,SubLay);
      end;
    finally
    RS.Destroy;
    end;
    finally
    DS.Destroy;
    end;
    finally
    Destroy;
    end;
    finally
    VarArrayUnLock(DATA);
    end;
    finally
    VarArrayUnLock(ObjPointersAndLayInfo);
    end;
    end;
  end;

  procedure SegMemory_ProcessForNewSpacePack(ObjPointersAndLayInfo: Variant; DATA: Variant);
  const
    Portion = 8192*10;
    SizeOfTSpaceObj = SizeOf(TSpaceObj);
    SizeOfTPoint = SizeOf(TPoint);
  var
    DATASize: integer;
    DATAPtr: pointer;
    DATASize1: integer;
    DATAPtr1: pointer;
    PointersCounter,PointersCount: integer;
    P: pointer;
    DS: TDecompressionStream;
    Buffer: array[0..Portion-1] of byte;
    Sz: integer;
    MS,RS: TMemoryStream;
    SegSpace: TSegMemory;
    I: integer;
    IDs: TByteArray;
    ID: TID;
    ptrObj: TPtr;
    Lay,SubLay: SmallInt;
    Obj: TSpaceObj;
    NewObjPointers: TByteArray;
    ptrSrs: pointer;
    ptrObjAccessed: TPtr;
    ptrPoint: TPtr;
    Point: TPoint;
  begin
  if (ObjPointersAndLayInfo <> null)
   then begin
    DATASize:=VarArrayHighBound(ObjPointersAndLayInfo,1)+1;
    DATAPtr:=VarArrayLock(ObjPointersAndLayInfo);
    try
    PointersCounter:=(DATASize DIV (SizeOf(TPtr){size of object pointer}+SizeOf(SmallInt){size of object lay}+SizeOf(SmallInt){size of object sublay}));
    if (NOT ((ContextItemsMaxCount > 0) AND (PointersCounter > ContextItemsMaxCount)))
     then PointersCount:=PointersCounter
     else PointersCount:=ContextItemsMaxCount;
    //. translate objects for a new space pack
    if (DATA = null) then Raise Exception.Create('invalid space data'); //. =>
    DATASize1:=VarArrayHighBound(DATA,1)+1;
    DATAPtr1:=VarArrayLock(DATA);
    try
    MS:=TMemoryStream.Create;
    with MS do
    try
    Size:=DATASize1;
    Write(DATAPtr1^,DATASize1);
    Position:=0;
    DS:=TDecompressionStream.Create(MS);
    try
    RS:=TMemoryStream.Create;
    try
    RS.Size:=MS.Size;
    repeat
      Sz:=DS.Read(Buffer,Portion);
      if Sz > 0 then RS.Write(Buffer,Sz);
    until Sz < Portion;
    //.
    SegSpace:=TSegMemory.Create;
    try
    SegSpace.LoadFromStream(RS);
    //.
    SetLength(IDs,PointersCount*SizeOf(ID));
    P:=DATAPtr;
    for I:=0 to PointersCount-1 do begin
      ptrObj:=TPtr(P^); Inc(Integer(P),SizeOf(TPtr));
      Inc(Integer(P),SizeOf(SmallInt)); //. skip Lay
      Inc(Integer(P),SizeOf(SmallInt)); //. skip SubLay
      //.
      SegSpace.Mem_Read(Obj,SizeOf(Obj),ptrObj);
      ID.idType:=Obj.idTObj;
      ID.idObj:=Obj.idObj;
      TID(Pointer(Integer(@IDs[0])+I*SizeOf(ID))^):=ID;
      end;
    //.
    with GetISpaceManager(SOAPServerURL) do ReadObjectsByIDs(UserName,UserPassword, IDs,PointersCount, NewObjPointers);
    //.
    ptrSrs:=@NewObjPointers[0];
    for I:=0 to PointersCount-1 do begin
      //. get object pointer
      asm
         PUSH ESI
         MOV ESI,ptrSrs
         CLD
         LODSD
         MOV ptrObj,EAX
         MOV ptrSrs,ESI
         POP ESI
      end;
      //.
      if (ptrObj <> nilPtr)
       then begin
        //. get object body
        asm
           PUSH ESI
           PUSH EDI
           MOV ESI,ptrSrs
           CLD
           LEA EDI,Obj
           MOV ECX,SizeOfTSpaceObj
           REP MOVSB
           MOV ptrSrs,ESI
           POP EDI
           POP ESI
        end;
        //. write body
        ptrObjAccessed:=ptrObj;
        WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
        ptrPoint:=Obj.ptrFirstPoint;
        while ptrPoint <> nilPtr do begin
          //. get point
          asm
             PUSH ESI
             PUSH EDI
             MOV ESI,ptrSrs
             CLD
             LEA EDI,Point
             MOV ECX,SizeOfTPoint
             REP MOVSB
             MOV ptrSrs,ESI
             POP EDI
             POP ESI
          end;
          //. write point
          WriteObjLocalStorage(Point,SizeOf(Point), ptrPoint);
          //. go to next point
          ptrPoint:=Point.ptrNextObj;
          end;
        //. process obj as accessed
        if (Obj.idTObj <> idTLay2DVisualization) then ObjectsContextRegistry.ObjAccessed(ptrObjAccessed);
        end
       else begin //. remove obj from types-system cache
        ID:=TID(Pointer(Integer(@IDs[0])+I*SizeOf(ID))^);
        with TComponentFunctionality_Create(ID.idType,ID.idObj) do
        try
        TypeFunctionality.TypeSystem.DoOnComponentOperationLocal(idTObj,idObj,opDestroy);
        finally
        Release;
        end;
        end;
      end;
    //. remove objects outside of context maximum
    if ((ContextItemsMaxCount > 0) AND (PointersCounter > ContextItemsMaxCount))
     then begin
      P:=DATAPtr;
      for I:=ContextItemsMaxCount to PointersCounter-1 do begin
        ptrObj:=TPtr(P^); Inc(Integer(P),SizeOf(TPtr));
        Lay:=SmallInt(P^); Inc(Integer(P),SizeOf(SmallInt));
        SubLay:=SmallInt(P^); Inc(Integer(P),SizeOf(SmallInt));
        //.
        SegSpace.Mem_Read(Obj,SizeOf(Obj),ptrObj);
        with TComponentFunctionality_Create(Obj.idTObj,Obj.idObj) do
        try
        TypeFunctionality.TypeSystem.DoOnComponentOperationLocal(idTObj,idObj,opDestroy);
        finally
        Release;
        end;
        end;
      end;
    //. restore objects lay info
    P:=DATAPtr;
    for I:=0 to PointersCount-1 do begin
      ptrObj:=TPtr(P^); Inc(Integer(P),SizeOf(TPtr));
      Lay:=SmallInt(P^); Inc(Integer(P),SizeOf(SmallInt));
      SubLay:=SmallInt(P^); Inc(Integer(P),SizeOf(SmallInt));
      //.
      ObjectsContextRegistry.ObjSetLayInfo(ptrObj,Lay,SubLay);
      end;
    finally
    SegSpace.Destroy;
    end;
    finally
    RS.Destroy;
    end;
    finally
    DS.Destroy;
    end;
    finally
    Destroy;
    end;
    finally
    VarArrayUnLock(DATA);
    end;
    finally
    VarArrayUnLock(ObjPointersAndLayInfo);
    end;
    end;
  end;

  procedure ValidateSpaceObjects;
  var
    ptrptrItem,ptrItem,ptrNextItem: pointer;
    ptrObj: TPtr;
    Obj: TSpaceObj;
    flRemove: boolean;
  begin
  with ObjectsContextRegistry do begin
  Space.Lock.Enter;
  try
  flDisabled:=true;
  try
  ptrptrItem:=@Items;
  while (Pointer(ptrptrItem^) <> nil) do begin
    ptrItem:=Pointer(ptrptrItem^);
    ptrObj:=TSpaceObjectsContextRegistryItem(ptrItem^).Ptr;
    //. check object validity
    ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
    if (Obj.idTObj <> 0)
     then
      try
      with TTypeFunctionality_Create(Obj.idTObj) do
      try
      flRemove:=(NOT TypeSystem.Context_IsItemExist(Obj.idObj));
      finally
      Release;
      end
      except
        flRemove:=true;
        end
     else flRemove:=false;
    //.
    if (flRemove)
     then begin
      ptrNextItem:=TSpaceObjectsContextRegistryItem(ptrItem^).Next;
      Pointer(ptrptrItem^):=ptrNextItem;
      if (ptrNextItem <> nil) then ItemsAdrCach[TSpaceObjectsContextRegistryItem(ptrNextItem^).Ptr]:=ptrptrItem;
      ItemsAdrCach[TSpaceObjectsContextRegistryItem(ptrItem^).Ptr]:=nil;
      //.
      FreeMem(ptrItem,SizeOf(TSpaceObjectsContextRegistryItem));
      Dec(ItemsCount);
      //. clear obj cached sign
      Obj.idTObj:=0;
      WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
      end
     else ptrptrItem:=@TSpaceObjectsContextRegistryItem(ptrItem^).Next;
    end;
  finally
  flDisabled:=false;
  end;
  finally
  Space.Lock.Leave;
  end;
  end;
  end;

var
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  TimeStamp: TDateTime;
  SpaceNode: IXMLDOMNode;
  SpaceID: integer;
  SpacePackID: integer;
  SpaceObjectsInfoNode: IXMLDOMNode;
  SpaceDATANode: IXMLDOMNode;
  SpaceTypesSystemNode: IXMLDOMNode;
begin
Result:=false;
try
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
Doc.Load(WorkLocale+'\'+PathContexts+'\'+IntToStr(ID)+'\'+UserName+'\'+ContextFile);
VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
if VersionNode <> nil
 then Version:=VersionNode.nodeTypedValue
 else Version:=0;
if (Version <> 0) then Exit; //. ->
//.
TimeStamp:=TDateTime(Doc.documentElement.selectSingleNode('/ROOT/TimeStamp').nodeTypedValue);
if (NOT flOffline)
 then begin
  if (TimeStamp < (Now-Context_History_ItemLifeTime)) then Exit; //. ->
  end;
Context_LastUpdatesTimeStamp:=TimeStamp;
//.
SpaceNode:=Doc.documentElement.selectSingleNode('/ROOT/Space');
SpaceID:=SpaceNode.selectSingleNode('ID').nodeTypedValue;
if (SpaceID <> ID) then Exit; //. ->
SpacePackID:=SpaceNode.selectSingleNode('PackID').nodeTypedValue;
SpaceObjectsInfoNode:=SpaceNode.selectSingleNode('ObjectsInfo');
SpaceDATANode:=SpaceNode.selectSingleNode('DATA');
SpaceTypesSystemNode:=SpaceNode.selectSingleNode('TypesSystem');
//.
Lock.Enter;
try
//. load type-system data first
TTypesSystem(TypesSystem).Context_LoadDATA(SpaceTypesSystemNode);
//. load space data
if ((SpacePackID = Self.SpacePackID) OR (Self.SpacePackID = 0))
 then begin
  SetSpaceObjPointersAndLayInfo(SpaceObjectsInfoNode.nodeTypedValue);
  SetSpaceDATAForSegMemory(SpaceDATANode.nodeTypedValue);
  flSpacePackLoaded:=true;
  end
 else begin
  SegMemory_ProcessForNewSpacePack(SpaceObjectsInfoNode.nodeTypedValue,SpaceDATANode.nodeTypedValue);
  flSpacePackLoaded:=false;
  end;
//. validate space objects
ValidateSpaceObjects();
finally
Lock.Leave;
end;
Result:=true;
except
  Result:=false;
  end;
end;

procedure TProxySpace.SaveUserSpaceContext;
var
  UserContextFolder: string;
begin
ReviseSpaceContext();
//.
UserContextFolder:=WorkLocale+'\'+PathContexts+'\'+IntToStr(ID)+'\'+UserName;
ForceDirectories(UserContextFolder);
SaveSpaceContext(ContextFileName);
end;

function TProxySpace.Context_GetVisibleObjects(const X0: Double; const Y0: Double; const X1: Double; const Y1: Double; const X2: Double; const Y2: Double; const X3: Double; const Y3: Double; const HidedLaysArray: TByteArray; const MinVisibleSquare: Double; const MinVisibleWidth: Double; const ptrCancelFlag: pointer = nil; const BestBeforeTime: TDateTime = MaxDouble): TByteArray;

  function LayIsRequired(const pLayNumber: integer): boolean;
  var
    p: pointer;
    L: Word;
    I: integer;
    LayNumber: integer;
  begin
  if (Length(HidedLaysArray) = 0)
   then begin
    Result:=true;
    Exit; //. ->
    end;
  p:=Pointer(@HidedLaysArray[0]);
  L:=Word(p^); Inc(Integer(p),SizeOf(Word));
  for I:=0 to L-1 do begin
    LayNumber:=Word(p^); Inc(Integer(p),SizeOf(Word));
    if (LayNumber = pLayNumber)
     then begin
      Result:=false;
      Exit; //. ->
      end;
    end;
  Result:=true;
  end;

  procedure W_GetMaxMin(var Xmin,Ymin,Xmax,Ymax: Extended);
  begin
  Xmin:=X0;Ymin:=Y0;Xmax:=X0;Ymax:=Y0;
  if X1 < Xmin
   then Xmin:=X1
   else
    if X1 > Xmax
     then Xmax:=X1;
  if Y1 < Ymin
   then Ymin:=Y1
   else
    if Y1 > Ymax
     then Ymax:=Y1;
  if X2 < Xmin
   then Xmin:=X2
   else
    if X2 > Xmax
     then Xmax:=X2;
  if Y2 < Ymin
   then Ymin:=Y2
   else
    if Y2 > Ymax
     then Ymax:=Y2;
  if X3 < Xmin
   then Xmin:=X3
   else
    if X3 > Xmax
     then Xmax:=X3;
  if Y3 < Ymin
   then Ymin:=Y3
   else
    if Y3 > Ymax
     then Ymax:=Y3;
  end;

  {transferred from TRevising}
  procedure Lays_InsertObj(const ptrptrLay: pointer; const ptrObj: TPtr; const Lay,SubLay: integer);
  var
    ptrLay: pointer;
    ptrNewItem: pointer;
    ptrptrItem: pointer;

    function Lay_Get(ptrptrLay: pointer; const Lay,SubLay: integer): pointer;
    var
      I,J,K: integer;
      ptrNewLay,ptrNewItem: pointer;
    begin
    Result:=nil;
    for I:=0 to Lay do begin
      if Pointer(ptrptrLay^) = nil
       then begin
        for J:=I to Lay do begin //. формируем новый слой
          GetMem(ptrNewLay,SizeOf(TLayReflect));
          with TLayReflect(ptrNewLay^) do begin
          ptrNext:=nil;
          Objects:=nil;
          ObjectsCount:=0;
          flLay:=true;
          end;
          Pointer(ptrptrLay^):=ptrNewLay;
          if J = Lay
           then begin
            for K:=1 to SubLay do begin  //. формируем новый подслой
              ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
              GetMem(ptrNewLay,SizeOf(TLayReflect));
              with TLayReflect(ptrNewLay^) do begin
              ptrNext:=nil;
              Objects:=nil;
              ObjectsCount:=0;
              flLay:=false;
              end;
              Pointer(ptrptrLay^):=ptrNewLay;
              end;
            Result:=Pointer(ptrptrLay^);
            Exit; //. ->
            end;
          ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
          end;
        Exit; //. сюда выхода нет 
        end
       else begin
        if I = Lay then Break; //. >
        repeat
          ptrptrLay:=@TLayReflect(Pointer(ptrptrLay^)^).ptrNext;
        until (Pointer(ptrptrLay^) = nil) OR TLayReflect(Pointer(ptrptrLay^)^).flLay;
        end;
      end;
    for I:=1 to SubLay do begin
      ptrptrLay:=@TLayReflect(Pointer(ptrptrLay^)^).ptrNext;
      if (Pointer(ptrptrLay^) = nil) OR TLayReflect(Pointer(ptrptrLay^)^).flLay
       then begin
        for J:=I to SubLay do begin
          GetMem(ptrNewLay,SizeOf(TLayReflect));
          with TLayReflect(ptrNewLay^) do begin
          ptrNext:=nil;
          Objects:=nil;
          ObjectsCount:=0;
          flLay:=false;
          end;
          TLayReflect(ptrNewLay^).ptrNext:=Pointer(ptrptrLay^);
          Pointer(ptrptrLay^):=ptrNewLay;
          if (J = SubLay) then Break; //. >
          ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
          end;
        Break; //. >
        end;
      end;
    Result:=Pointer(ptrptrLay^);
    end;

  begin
  ptrLay:=Lay_Get(ptrptrLay, Lay,SubLay);
  GetMem(ptrNewItem,SizeOf(TItemLayReflect));
  with TItemLayReflect(ptrNewItem^) do begin
  ptrNext:=nil; ///- TLayReflect(ptrLay^).Objects;
  ptrObject:=ptrObj;
  end;
  with TLayReflect(ptrLay^) do begin
  TItemLayReflect(ptrNewItem^).ptrNext:=Objects;
  Objects:=ptrNewItem;
  Inc(ObjectsCount);
  {///? ptrptrItem:=@Objects;
  while Pointer(ptrptrItem^) <> nil do ptrptrItem:=@TItemLayReflect(Pointer(ptrptrItem^)^).ptrNext;
  Pointer(ptrptrItem^):=ptrNewItem;
  Inc(ObjectsCount);}
  end;
  end;

var
  W_CC: TContainerCoord;
  Lays: pointer;
  ptrItem: pointer;
  Obj_CC: TContainerCoord;
  Obj_CS: Extended;
  Obj: TSpaceObj;
  ResultSize: integer;
  LevelsCount: word;
  ptrLay: pointer;
  ptrResult: pointer;
  ptrDelLay,ptrDelItem: pointer;
begin
W_GetMaxMin(W_CC.Xmin,W_CC.Ymin,W_CC.Xmax,W_CC.Ymax);
//.
Lays:=nil;
try
Lock.Enter;
try
ObjectsContextRegistry.flDisabled:=true;
try
ptrItem:=ObjectsContextRegistry.Items;
while (ptrItem <> nil) do with TSpaceObjectsContextRegistryItem(ptrItem^) do begin
  if ((Lay <> -1) AND LayIsRequired(Lay) AND Obj_GetMinMax(Obj_CC.Xmin,Obj_CC.Ymin,Obj_CC.Xmax,Obj_CC.Ymax, Ptr) AND (NOT ContainerCoord_IsObjectOutside(W_CC, Obj_CC)))
   then begin
    with Obj_CC do Obj_CS:=((Xmax-Xmin)*(Ymax-Ymin));
    if (Obj_CS >= MinVisibleSquare)
     then begin
      ReadObj(Obj,SizeOf(Obj), Ptr);
      if ((Obj.flagLoop AND Obj.flagFill) OR (Obj.Width >= MinVisibleWidth))
       then Lays_InsertObj(@Lays, Ptr, Lay,SubLay);
      end;
    end;
  //.
  if ((ptrCancelFlag <> nil) AND (Boolean(ptrCancelFlag^)))
   then Raise EUnnecessaryExecuting.Create('') //. =>
   else
    if (Now > BestBeforeTime) then Break; //. >
  //. next item
  ptrItem:=Next;
  end;
finally
ObjectsContextRegistry.flDisabled:=false;
end;
finally
Lock.Leave;
end;
//. convert a result lays to routine result
ResultSize:=SizeOf(Word){size of levels counter};
LevelsCount:=0;
ptrLay:=Lays;
while (ptrLay <> nil) do with TLayReflect(ptrLay^) do begin
  ResultSize:=ResultSize+SizeOf(DWord){size of lay objects counter}+SizeOf(Byte){size of lay flag}+ObjectsCount*SizeOf(TPtr);
  Inc(LevelsCount);
  //. next Lay
  ptrLay:=ptrNext;
  end;
SetLength(Result,ResultSize);
ptrResult:=@Result[0];
Word(ptrResult^):=LevelsCount; Inc(Integer(ptrResult),SizeOf(Word));
ptrLay:=Lays;
while (ptrLay <> nil) do with TLayReflect(ptrLay^) do begin
  DWord(ptrResult^):=ObjectsCount; Inc(Integer(ptrResult),SizeOf(DWord));
  Boolean(ptrResult^):=flLay; Inc(Integer(ptrResult),SizeOf(Boolean));
  ptrItem:=Objects;
  while (ptrItem <> nil) do with TItemLayReflect(ptrItem^) do begin
    TPtr(ptrResult^):=ptrObject; Inc(Integer(ptrResult),SizeOf(TPtr));
    //. next item
    ptrItem:=ptrNext;
    end;
  //. next Lay
  ptrLay:=ptrNext;
  end;
finally
while (Lays <> nil) do begin
  ptrDelLay:=Lays;
  Lays:=TLayReflect(ptrDelLay^).ptrNext;
  //.
  with TLayReflect(ptrDelLay^) do
  while Objects <> nil do begin
    ptrDelItem:=Objects;
    Objects:=TItemLayReflect(ptrDelItem^).ptrNext;
    //.
    FreeMem(ptrDelItem,SizeOf(TItemLayReflect));
    end;
  //.
  FreeMem(ptrDelLay,SizeOf(TLayReflect));
  end;
end;
end;

function TProxySpace.SpaceWindowUpdaters__TSpaceWindowUpdater_Create(const Xmin,Ymin,Xmax,Ymax: Extended): TObject;
begin
Result:=TSpaceWindowUpdater.Create(Self, Xmin,Ymin,Xmax,Ymax);
end;

procedure TProxySpace.SpaceWindowUpdaters__GetWindows(out Windows: TContainerCoordArray);
var
  I: integer;
begin
with SpaceWindowUpdaters.LockList do
try
SetLength(Windows,Count);
for I:=0 to Count-1 do Windows[I]:=TSpaceWindowUpdater(Items[I]).CC;
finally
SpaceWindowUpdaters.UnlockList;
end;
end;

//. context version #2
(*procedure TProxySpace.StayUpToDate(flExcludeNotificationSubscription: boolean = true);
const
  AllHistory_GetHistorySinceUsingContext1_HistoryIsTooLongErrorStr = 'SOAP-ENV:HistoryIsTooLong';

  procedure ContextComponents_ExcludeSubscriptionComponents(const ContextComponents: TComponentsList);
  var
    idx: integer;
  begin
  if ((NotificationSubscription <> nil) AND (TSpaceNotificationSubscription(NotificationSubscription).flActive))
   then begin
    idx:=0;
    while (idx < ContextComponents.Count) do with TItemComponentsList(ContextComponents[idx]^) do
      if (TSpaceNotificationSubscription(NotificationSubscription).IsComponentExist(idTComponent,idComponent))
       then ContextComponents.Delete(idx)
       else Inc(idx);
    end;
  end;

  procedure ObjectsContext_ExcludeSubscriptionComponents(var ObjectsContext: TPtrArray);
  var
    I: integer;
    VC: integer;
    Obj: TSpaceObj;
    NewObjectsContext: TPtrArray;
  begin
  if ((NotificationSubscription <> nil) AND (TSpaceNotificationSubscription(NotificationSubscription).flActive))
   then begin
    VC:=0;
    for I:=0 to Length(ObjectsContext)-1 do begin
      ReadObjLocalStorage(Obj,SizeOf(Obj),ObjectsContext[I]);
      if (TSpaceNotificationSubscription(NotificationSubscription).IsComponentExist(Obj.idTObj,Obj.idObj))
       then ObjectsContext[I]:=nilPtr
       else Inc(VC);
      end;
    if (VC <> Length(ObjectsContext))
     then begin
      SetLength(NewObjectsContext,VC);
      VC:=0;
      for I:=0 to Length(ObjectsContext)-1 do
        if (ObjectsContext[I] <> nilPtr)
         then begin
          NewObjectsContext[VC]:=ObjectsContext[I];
          Inc(VC);
          end;
      ObjectsContext:=NewObjectsContext;
      end;
    end;
  end;

  function SubscriptionComponents_IsComponentFound(const idTComponent: integer; const idComponent: integer): boolean;
  begin
  Result:=((NotificationSubscription <> nil) AND (TSpaceNotificationSubscription(NotificationSubscription).flActive) AND TSpaceNotificationSubscription(NotificationSubscription).flActive AND TSpaceNotificationSubscription(NotificationSubscription).IsComponentExist(idTComponent,idComponent));
  end;

  function SubscriptionComponents_IsVisualizationFound(const ptrObj: TPtr): boolean;
  var
    Obj: TSpaceObj;
  begin
  Result:=false;
  if ((NotificationSubscription = nil) OR NOT TSpaceNotificationSubscription(NotificationSubscription).flActive) then Exit; //. ->
  ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
  Result:=TSpaceNotificationSubscription(NotificationSubscription).IsComponentExist(Obj.idTObj,Obj.idObj);
  end;

var
  ObjectsContext: TPtrArray;
  ContextComponents: TComponentsList;
  ReflectionsCount: integer;
  SpaceWindowUpdatersWindows: TContainerCoordArray;
  NotificationWindows: TContainerCoordArray;
  flVisualizationsContextUsed,flComponentsContextUsed: boolean;
  ContextSize: integer;
  ptrContext: pointer;
  I: integer;
  Xmin,Ymin,Xmax,Ymax: Extended;
  Scale: Extended;
  VisibleFactor: integer;
  RC: THistoryReflectionContextV1;
  Context: TByteArray;
  {
      ProxySpace context data. Version #2

        Version: word //. context data verion

        ComponentsCount: integer; //. components representations count
          ...
          CC: THistoryComponentRepresentationContext;
          ...

        ReflectionsCount: integer; //. visualizations representation count
          ...
          RC: THistoryReflectionContextV1;
          ...

        VisualizationsCount: integer; //. cached visualizations count
          ...
          Ptr: TPtr;
          ...
  }
  Msg: TMessage;
  SpaceHistory,ComponentsHistory,ComponentsUpdateHistory,VisualizationsHistory: TByteArray;
  _LastUpdatesTimeStamp: TDateTime;
  SrsPtr,EndPtr: pointer;
  _TimeStamp: TDateTime;
  _idTComponent: word;
  _idComponent: Int64;
  _Size: Integer;
  _Data: TByteArray;
  _Pntr: TPtr;
  Ptr: TPtr;
  J: integer;
  CF: TComponentFunctionality;
  CUHI: TComponentsUpdateHistoryItem;
begin
if (State <> psstWorking) then Exit; //. ->
//.
I:=InterlockedDecrement(FUpdateIsDisabledCounter);
InterlockedIncrement(FUpdateIsDisabledCounter);
if (I >= 0) then Exit; //. ->
//. if automatic update is disabled we must update all space context
if (flAutomaticUpdateIsDisabled) then flExcludeNotificationSubscription:=false;
//.
Context_UpdateLock.Enter;
try
if (ControlPanel <> nil)
 then
  if (GetCurrentThreadID = MainThreadID)
   then SendMessage(ControlPanel.Handle, WM_TRAYICONUPDATING, 0,0)
   else PostMessage(ControlPanel.Handle, WM_TRAYICONUPDATING, 0,0);
//.
try
flUpdating:=true;
try
Lock.Enter;
try
//. get ProxySpace context
ReflectionsCount:=0;
if (ReflectorsList <> nil) then for I:=0 to ReflectorsList.Count-1 do if (TObject(ReflectorsList[I]) is TReflector) then Inc(ReflectionsCount);
//.
SpaceWindowUpdaters__GetWindows(SpaceWindowUpdatersWindows);
//.
TfmSpaceUpdatesUserNotificator(TfmProxySpaceUpdatesMonitor(StayUpToDate_Monitor).UpdatesUserNotificator).UpdatesUserNotificator.GetWindowsContainersCoords(NotificationWindows);
//.
if ((ReflectionsCount+Length(SpaceWindowUpdatersWindows)+Length(NotificationWindows)) > StayUpToDate__ContextV0_ReflectionsMaxCount) then Raise Exception.Create('too many reflections'); //. =>
{get space context}
if (NOT StayUpToDate_flNoComponentsContext)
 then
  if (ContextItemsMaxCount > 0)
   then ReviseSpaceContext(ObjectsContext)
   else GetSpaceContext(ObjectsContext)
 else ReviseSpaceContext;
{get components context}
ContextComponents:=nil;
if (NOT StayUpToDate_flNoComponentsContext) then TTypesSystem(TypesSystem).GetContextComponents(ContextComponents);
try
{check context for server validity}
if (NOT StayUpToDate_flNoComponentsContext)
 then begin
  flVisualizationsContextUsed:=(Length(ObjectsContext) <= StayUpToDate__ContextV0_VisualizationsMaxCount);
  flComponentsContextUsed:=((ContextComponents.Count+Length(ObjectsContext)) <= StayUpToDate__ContextV0_ComponentsMaxCount);
  end
 else begin
  flVisualizationsContextUsed:=false;
  flComponentsContextUsed:=false;
  end;
{calculate context}
ContextSize:=2{Version}+4{SizeOf(ConponentsCount)}+4{SizeOf(ReflectionsCount)}+SizeOf(THistoryReflectionContextV1)*(ReflectionsCount+Length(SpaceWindowUpdatersWindows)+Length(NotificationWindows))+4{SizeOf(VisualizationsCount)};
if (flVisualizationsContextUsed) then ContextSize:=ContextSize+SizeOf(TPtr)*Length(ObjectsContext);
if (flComponentsContextUsed) then ContextSize:=ContextSize+ContextComponents.Count*SizeOf(THistoryComponentRepresentationContext);
SetLength(Context,ContextSize);
ptrContext:=@Context[0];
Word(ptrContext^):=2; //. version #2
Inc(Integer(ptrContext),SizeOf(Word));
{components context}
if (flComponentsContextUsed)
 then begin
  //. Exclude Subscription-Components
  if (flExcludeNotificationSubscription) then ContextComponents_ExcludeSubscriptionComponents(ContextComponents);
  //.
  Integer(ptrContext^):=ContextComponents.Count; //. ComponentCount
  Inc(Integer(ptrContext),SizeOf(Integer));
  for I:=0 to ContextComponents.Count-1 do with THistoryComponentRepresentationContext(ptrContext^) do begin
    idTComponent:=TItemComponentsList(ContextComponents[I]^).idTComponent;
    idComponent:=TItemComponentsList(ContextComponents[I]^).idComponent;
    //. next
    Inc(Integer(ptrContext),SizeOf(THistoryComponentRepresentationContext));
    end;
  end
 else begin
  Integer(ptrContext^):=-1; //. ComponentCount
  Inc(Integer(ptrContext),SizeOf(Integer));
  end;
{reflection context}
Integer(ptrContext^):=(ReflectionsCount+Length(SpaceWindowUpdatersWindows)+Length(NotificationWindows)); //. Reflection's Count + Notification's windows count
Inc(Integer(ptrContext),SizeOf(Integer));
for I:=0 to ReflectionsCount-1 do if (TObject(ReflectorsList[I]) is TReflector) then with TReflector(ReflectorsList[I]) do begin
  ReflectionWindow.GetParams({out} Xmin,Ymin,Xmax,Ymax,Scale,VisibleFactor);
  RC.Xmin:=Xmin; RC.Ymin:=Ymin; RC.Xmax:=Xmax; RC.Ymax:=Ymax;
  RC.MinVisibleSquare:=VisibleFactor/sqr(Scale);
  //.
  THistoryReflectionContextV1(ptrContext^):=RC;
  Inc(Integer(ptrContext),SizeOf(THistoryReflectionContextV1));
  end;
for I:=0 to Length(SpaceWindowUpdatersWindows)-1 do with SpaceWindowUpdatersWindows[I] do begin
  RC.Xmin:=Xmin; RC.Ymin:=Ymin; RC.Xmax:=Xmax; RC.Ymax:=Ymax;
  RC.MinVisibleSquare:=0.0;
  //.
  THistoryReflectionContextV1(ptrContext^):=RC;
  Inc(Integer(ptrContext),SizeOf(THistoryReflectionContextV1));
  end;
for I:=0 to Length(NotificationWindows)-1 do with NotificationWindows[I] do begin
  RC.Xmin:=Xmin; RC.Ymin:=Ymin; RC.Xmax:=Xmax; RC.Ymax:=Ymax;
  RC.MinVisibleSquare:=0.0;
  //.
  THistoryReflectionContextV1(ptrContext^):=RC;
  Inc(Integer(ptrContext),SizeOf(THistoryReflectionContextV1));
  end;
{space cached objects context}
if (flVisualizationsContextUsed)
 then begin
  //. Exclude Subscription-Components
  if (flExcludeNotificationSubscription) then ObjectsContext_ExcludeSubscriptionComponents(ObjectsContext);
  //.
  Integer(ptrContext^):=Length(ObjectsContext); //. VisualizationsCount
  Inc(Integer(ptrContext),SizeOf(Integer));
  for I:=0 to Length(ObjectsContext)-1 do begin
    TPtr(ptrContext^):=ObjectsContext[I];
    //. next
    Inc(Integer(ptrContext),SizeOf(TPtr));
    end;
  end
 else begin
  Integer(ptrContext^):=-1; //. VisualizationsCount
  Inc(Integer(ptrContext),SizeOf(Integer));
  end;
finally
ContextComponents.Free;
end;
//.
finally
Lock.Leave;
end;
//. fetching history
//.
_LastUpdatesTimeStamp:=Context_LastUpdatesTimeStamp;
try
with GetISpaceReports(SOAPServerURL) do AllHistory_GetHistorySinceUsingContext1(UserName,UserPassword,Context, Double(Context_LastUpdatesTimeStamp), SpaceHistory,ComponentsHistory,ComponentsUpdateHistory,VisualizationsHistory);
except
  on E: ERemotableException do begin
    if (Pos(AllHistory_GetHistorySinceUsingContext1_HistoryIsTooLongErrorStr,E.FaultCode) > 0)
     then begin
      EventLog.WriteCriticalEvent('ContextUpdating','Unable to update space: returning history is too long. Please clear inactive or all space context using main menu and try to update again.',E.Message);
      //. return without updating
      Exit; //. ->
      end
     else Raise; //. =>
    end;
  else
    Raise ; //. =>
  end;
//.
//.
try
//. update components
for I:=0 to (Length(ComponentsHistory) DIV SizeOf(TComponentsHistoryItem))-1 do with TComponentsHistoryItem(Pointer(Integer(@ComponentsHistory[0])+I*SizeOf(TComponentsHistoryItem))^) do
  try
  if ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsComponentFound(Integer(idTComponent),idComponent)))
   then begin
    try
    CF:=TComponentFunctionality_Create(Integer(idTComponent),idComponent);
    except
      Continue;
      end;
    try
    if (CF is TBaseVisualizationFunctionality)
     then
      case TComponentOperation(idOperation) of
      opCreate: ; //. do nothing
      opDestroy: DoOnComponentOperation(Integer(idTComponent),idComponent,TComponentOperation(idOperation));
      opUpdate: if ((flComponentsContextUsed) OR TBaseVisualizationFunctionality(CF).TypeSystem.ComponentIsCached(idComponent)) then DoOnComponentOperation(Integer(idTComponent),idComponent,TComponentOperation(idOperation));
      end
     else DoOnComponentOperation(Integer(idTComponent),idComponent,TComponentOperation(idOperation));
    finally
    CF.Release;
    end;
    end;
  except
    On E: ESOAPHTTPException do Raise; //. =>
    On E: Exception do EventLog.WriteMinorEvent('ContextUpdating','Unable to update component (Type: '+IntToStr(idTComponent)+', ID: '+IntToStr(idComponent)+', Operation: '+IntToStr(idOperation)+').',E.Message);
    end;
//. component's partial update
SrsPtr:=@ComponentsUpdateHistory[0]; EndPtr:=Pointer(Integer(SrsPtr)+Length(ComponentsUpdateHistory));
while (SrsPtr <> EndPtr) do begin
  _TimeStamp:=TDateTime(SrsPtr^); Inc(Integer(SrsPtr),SizeOf(_TimeStamp));
  _idTComponent:=Word(SrsPtr^); Inc(Integer(SrsPtr),SizeOf(_idTComponent));
  _idComponent:=Int64(SrsPtr^); Inc(Integer(SrsPtr),SizeOf(_idComponent));
  _Size:=Integer(SrsPtr^); Inc(Integer(SrsPtr),SizeOf(_Size));
  SetLength(_Data,_Size);
  Move(SrsPtr^,Pointer(@_Data[0])^,_Size); Inc(Integer(SrsPtr),_Size);
  //.
  try
  if ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsComponentFound(Integer(_idTComponent),_idComponent)))
   then begin
    try
    CF:=TComponentFunctionality_Create(Integer(_idTComponent),_idComponent);
    except
      Continue;
      end;
    try
    DoOnComponentPartialUpdate(Integer(_idTComponent),_idComponent,_Data);
    finally
    CF.Release;
    end;
    end;
  except
    On E: ESOAPHTTPException do Raise; //. =>
    On E: Exception do EventLog.WriteMinorEvent('ContextUpdating','Unable to partial update component (Type: '+IntToStr(_idTComponent)+', ID: '+IntToStr(_idComponent)+').',E.Message);
    end;
  end;
//. update space structure
Lock.Enter;
try
SrsPtr:=@SpaceHistory[0]; EndPtr:=Pointer(Integer(SrsPtr)+Length(SpaceHistory));
while (SrsPtr <> EndPtr) do begin
  with TSpaceHistoryItem(SrsPtr^) do begin
  _Pntr:=Pntr;
  _Size:=Size;
  end;
  Inc(Integer(SrsPtr),SizeOf(TSpaceHistoryItem));
  //.
  if (_Size = SizeOf(TPtr))
   then begin
    if (NOT IsPtrNull(_Pntr))
     then begin
      Ptr:=TPtr(SrsPtr^);
      WriteObjLocalStorage(Ptr,SizeOf(Ptr), _Pntr);
      end;
    end;
  //.
  Inc(Integer(SrsPtr),_Size);
  end;
finally
Lock.Leave;
end;
//. update visualization context
try
Obj_UpdateLocal__Start;
try
for I:=0 to (Length(VisualizationsHistory) DIV SizeOf(TVisualizationsHistoryItem))-1 do with TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^) do
  try
  if ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsVisualizationFound(ptrObj)))
   then
    case TRevisionAct(idAct) of
    actInsert:            Obj_CheckCachedState(ptrObj);
    actInsertRecursively: Obj_CheckCachedState(ptrObj);
    actRemove:            Obj_ClearCachedState(ptrObj);
    actRemoveRecursively: Obj_ClearCachedState(ptrObj);
    actChange:            Obj_UpdateLocal__Add(ptrObj,false); //. more effective for a many dynamic objects Obj_UpdateLocal(ptrObj,false);
    actChangeRecursively: Obj_UpdateLocal__Add(ptrObj,true); //. more effective for a many dynamic objects Obj_UpdateLocal(ptrObj,true);
    else ;
    end;
  except
    On E: ESOAPHTTPException do Raise; //. =>
    On E: Exception do EventLog.WriteMinorEvent('VisualizationContextUpdating','Unable to update visualization (Ptr: '+IntToStr(ptrObj)+', Action: '+IntToStr(idAct)+').',E.Message);
    end;
finally
Obj_UpdateLocal__Finish;
end;
except
  On E: ESOAPHTTPException do Raise; //. =>
  On E: Exception do EventLog.WriteMinorEvent('ContextUpdating','Error during updating the context.',E.Message);
  end;
except
  Context_LastUpdatesTimeStamp:=_LastUpdatesTimeStamp; //. return to the last context time-stamp, if error occurs when updating the context
  Raise; //. =>
  end;
//. update reflectors
if (ReflectorsList <> nil)
 then with ReflectorsList do
  for J:=0 to Count-1 do
    if (TObject(Items[J]) is TReflector)
     then with TReflector(Items[J]) do begin
      Reflecting.Revising.Lock.Enter;
      try
      for I:=0 to (Length(VisualizationsHistory) DIV SizeOf(TVisualizationsHistoryItem))-1 do with TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^) do
        try
        if ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsVisualizationFound(ptrObj)))
         then Reflecting.RevisionReflect(ptrObj,TRevisionAct(idAct));
        except
          end;
      finally
      Reflecting.Revising.Lock.Leave;
      end;
      end
     else
      if (TObject(Items[J]) is TGL3DReflector)
       then with TGL3DReflector(Items[J]) do begin
        for I:=0 to (Length(VisualizationsHistory) DIV SizeOf(TVisualizationsHistoryItem))-1 do with TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^) do
          try
          if ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsVisualizationFound(ptrObj)))
           then Reflecting.RevisionReflect(ptrObj,TRevisionAct(idAct));
          except
            end;
        end;
//. update plugins
for I:=0 to (Length(VisualizationsHistory) DIV SizeOf(TVisualizationsHistoryItem))-1 do with TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^) do
  try
  if ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsVisualizationFound(ptrObj)))
   then Plugins_DoOnVisualizationOperation(ptrObj,TRevisionAct(idAct));
  except
    end;
//. insert to history
if ((Length(SpaceHistory) <> 0) OR (Length(ComponentsHistory) <> 0) OR (Length(VisualizationsHistory) <> 0)) then TfmProxySpaceUpdatesMonitor(StayUpToDate_Monitor).UpdateItems_Insert(Context_LastUpdatesTimeStamp, SpaceHistory,ComponentsHistory,VisualizationsHistory);
finally
flUpdating:=false;
end;
finally
//.
if (ControlPanel <> nil)
 then
  if (GetCurrentThreadID = MainThreadID)
   then SendMessage(ControlPanel.Handle, WM_TRAYICONMAIN, 0,0)
   else PostMessage(ControlPanel.Handle, WM_TRAYICONMAIN, 0,0);
end;
finally
Context_UpdateLock.Leave;
end;
if (ProxySpaceUpdating <> nil) then ProxySpaceUpdating.Reset();
end;*)

procedure TProxySpace.StayUpToDate(flExcludeNotificationSubscription: boolean = true);
const
  AllHistory_GetHistorySinceUsingContext1_HistoryIsTooLongErrorStr = 'SOAP-ENV:HistoryIsTooLong';

  procedure ContextComponents_ExcludeSubscriptionComponents(const ContextComponents: TComponentsList);
  var
    idx: integer;
  begin
  if ((NotificationSubscription <> nil) AND (TSpaceNotificationSubscription(NotificationSubscription).flActive))
   then begin
    idx:=0;
    while (idx < ContextComponents.Count) do with TItemComponentsList(ContextComponents[idx]^) do
      if (TSpaceNotificationSubscription(NotificationSubscription).IsComponentExist(idTComponent,idComponent))
       then ContextComponents.Delete(idx)
       else Inc(idx);
    end;
  end;

  procedure ObjectsContext_ExcludeSubscriptionComponents(var ObjectsContext: TPtrArray);
  var
    I: integer;
    VC: integer;
    Obj: TSpaceObj;
    NewObjectsContext: TPtrArray;
  begin
  if ((NotificationSubscription <> nil) AND (TSpaceNotificationSubscription(NotificationSubscription).flActive))
   then begin
    VC:=0;
    for I:=0 to Length(ObjectsContext)-1 do begin
      ReadObjLocalStorage(Obj,SizeOf(Obj),ObjectsContext[I]);
      if (TSpaceNotificationSubscription(NotificationSubscription).IsComponentExist(Obj.idTObj,Obj.idObj))
       then ObjectsContext[I]:=nilPtr
       else Inc(VC);
      end;
    if (VC <> Length(ObjectsContext))
     then begin
      SetLength(NewObjectsContext,VC);
      VC:=0;
      for I:=0 to Length(ObjectsContext)-1 do
        if (ObjectsContext[I] <> nilPtr)
         then begin
          NewObjectsContext[VC]:=ObjectsContext[I];
          Inc(VC);
          end;
      ObjectsContext:=NewObjectsContext;
      end;
    end;
  end;

  function SubscriptionComponents_IsComponentFound(const idTComponent: integer; const idComponent: integer): boolean;
  begin
  Result:=((NotificationSubscription <> nil) AND (TSpaceNotificationSubscription(NotificationSubscription).flActive) AND TSpaceNotificationSubscription(NotificationSubscription).flActive AND TSpaceNotificationSubscription(NotificationSubscription).IsComponentExist(idTComponent,idComponent));
  end;

  function SubscriptionComponents_IsVisualizationFound(const ptrObj: TPtr): boolean;
  var
    Obj: TSpaceObj;
  begin
  Result:=false;
  if ((NotificationSubscription = nil) OR NOT TSpaceNotificationSubscription(NotificationSubscription).flActive) then Exit; //. ->
  ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
  Result:=TSpaceNotificationSubscription(NotificationSubscription).IsComponentExist(Obj.idTObj,Obj.idObj);
  end;

  function GetAddressMaskSize(const ObjectsContext: TPtrArray): Word;
  const
    DefaultMaskSize = 18;
  begin
  Result:=DefaultMaskSize;
  end;

  procedure Obj_DoOnContentChange(const ptrObj: TPtr; const flRecursive: boolean);
  var
    Obj: TSpaceObj;
    CF: TComponentFunctionality;
    ptrOwnerObj: TPtr;
  begin
  try
  ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
  if ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsComponentFound(Obj.idTObj,Obj.idObj)))
   then begin
    try
    CF:=TComponentFunctionality_Create(Obj.idTObj,Obj.idObj);
    except
      CF:=nil;
      end;
    if (CF <> nil)
     then
      try
      if (TBaseVisualizationFunctionality(CF).TypeSystem.Context_IsItemExist(Obj.idObj)) then DoOnComponentOperation(Obj.idTObj,Obj.idObj,opUpdate);
      finally
      CF.Release;
      end;
    end;
  except
    On E: ESOAPHTTPException do Raise; //. =>
    On E: Exception do EventLog.WriteMinorEvent('VisualizationContextUpdating','Unable to update content of component (Type: '+IntToStr(Obj.idTObj)+', ID: '+IntToStr(Obj.idObj)+').',E.Message);
    end;
  if (NOT flRecursive) then Exit; //. ->
  //. process own objects
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while (ptrOwnerObj <> nilPtr) do begin
    Obj_DoOnContentChange(ptrOwnerObj,flRecursive);
    ReadObjLocalStorage(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
    end;
  end;

var
  ObjectsContext: TPtrArray;
  ContextComponents: TComponentsList;
  ReflectionsCount: integer;
  SpaceWindowUpdatersWindows: TContainerCoordArray;
  NotificationWindows: TContainerCoordArray;
  flVisualizationsContextUsed,flComponentsContextUsed: boolean;
  AddressMaskArray: TAddressMaskArray;
  ContextSize: integer;
  ptrContext: pointer;
  I: integer;
  Xmin,Ymin,Xmax,Ymax: Extended;
  Scale: Extended;
  VisibleFactor: integer;
  RC: THistoryReflectionContextV1;
  Context: TByteArray;
  {
      ProxySpace context data. Version #2

        Version: word //. context data verion

        ComponentsCount: integer; //. components representations count
          ...
          CC: THistoryComponentRepresentationContext;
          ...

        ReflectionsCount: integer; //. visualizations representation count
          ...
          RC: THistoryReflectionContextV1;
          ...

        VisualizationsCount: integer; //. cached visualizations count
          ...
          Ptr: TPtr;
          ...
  }
  {
      ProxySpace context data. Version #3

        Version: word //. context data verion

        ComponentsCount: integer; //. components representations count
          ...
          CC: THistoryComponentRepresentationContext;
          ...

        ReflectionsCount: integer; //. visualizations representation count
          ...
          RC: THistoryReflectionContextV1;
          ...

        VisualizationAddressMasksCount: integer; //. cached visualization address masks count
          MaskSize: Word;
          MaskCount: integer
          ...
          Mask: array[0..MaskSize-1] of bits;
          ...
  }
  Msg: TMessage;
  SpaceHistory,ComponentsHistory,ComponentsUpdateHistory,VisualizationsHistory: TByteArray;
  _LastUpdatesTimeStamp: TDateTime;
  SrsPtr,EndPtr: pointer;
  _TimeStamp: TDateTime;
  _idTComponent: word;
  _idComponent: Int64;
  _Size: Integer;
  _Data: TByteArray;
  _Pntr: TPtr;
  Ptr: TPtr;
  J: integer;
  CF: TComponentFunctionality;
  CUHI: TComponentsUpdateHistoryItem;
  Obj: TSpaceObj;
begin
I:=InterlockedDecrement(FUpdateIsDisabledCounter);
InterlockedIncrement(FUpdateIsDisabledCounter);
if (I >= 0) then Exit; //. ->
//. if automatic update is disabled we must update all space context
if (flAutomaticUpdateIsDisabled) then flExcludeNotificationSubscription:=false;
//.
Context_UpdateLock.Enter;
try
if (ControlPanel <> nil)
 then
  if (GetCurrentThreadID = MainThreadID)
   then SendMessage(ControlPanel.Handle, WM_TRAYICONUPDATING, 0,0)
   else PostMessage(ControlPanel.Handle, WM_TRAYICONUPDATING, 0,0);
//.
try
flUpdating:=true;
try
Lock.Enter;
try
//. get ProxySpace context
ReflectionsCount:=0;
if (ReflectorsList <> nil) then for I:=0 to ReflectorsList.Count-1 do if (TObject(ReflectorsList[I]) is TReflector) then Inc(ReflectionsCount);
//.
SpaceWindowUpdaters__GetWindows(SpaceWindowUpdatersWindows);
//.
TfmSpaceUpdatesUserNotificator(TfmProxySpaceUpdatesMonitor(StayUpToDate_Monitor).UpdatesUserNotificator).UpdatesUserNotificator.GetWindowsContainersCoords(NotificationWindows);
//.
if ((ReflectionsCount+Length(SpaceWindowUpdatersWindows)+Length(NotificationWindows)) > StayUpToDate__ContextV0_ReflectionsMaxCount) then Raise Exception.Create('too many reflections'); //. =>
{get space context}
if (NOT StayUpToDate_flNoComponentsContext)
 then
  if (ContextItemsMaxCount > 0)
   then ReviseSpaceContext(ObjectsContext)
   else GetSpaceContext(ObjectsContext)
 else ReviseSpaceContext;
{get components context}
ContextComponents:=nil;
if (NOT StayUpToDate_flNoComponentsContext) then TTypesSystem(TypesSystem).Context_GetItems(ContextComponents);
try
{check context for server validity}
if (NOT StayUpToDate_flNoComponentsContext)
 then begin
  flVisualizationsContextUsed:=(Length(ObjectsContext) <= StayUpToDate__ContextV0_VisualizationsMaxCount);
  flComponentsContextUsed:=((ContextComponents.Count+Length(ObjectsContext)) <= StayUpToDate__ContextV0_ComponentsMaxCount);
  end
 else begin
  flVisualizationsContextUsed:=false;
  flComponentsContextUsed:=false;
  end;
{calculate context}
AddressMaskArray:=nil;
try
ContextSize:=2{Version}+4{SizeOf(ComponentsCount)}+4{SizeOf(ReflectionsCount)}+SizeOf(THistoryReflectionContextV1)*(ReflectionsCount+Length(SpaceWindowUpdatersWindows)+Length(NotificationWindows))+4{SizeOf(VisualizationAddressMasksCount)};
if (flComponentsContextUsed) then begin
  //. Exclude Subscription-Components
  if (flExcludeNotificationSubscription) then ContextComponents_ExcludeSubscriptionComponents(ContextComponents);
  //.
  ContextSize:=ContextSize+ContextComponents.Count*SizeOf(THistoryComponentRepresentationContext);
  end;
if (flVisualizationsContextUsed)
 then begin
  //. Exclude Subscription-Components
  if (flExcludeNotificationSubscription) then ObjectsContext_ExcludeSubscriptionComponents(ObjectsContext);
  //.
  AddressMaskArray:=TAddressMaskArray.Create();
  AddressMaskArray.FromPointerList(ObjectsContext,GetAddressMaskSize(ObjectsContext));
  ContextSize:=ContextSize+(AddressMaskArray.ByteArraySize-SizeOf(Integer){SizeOf(VisualizationAddressMasksCount)-preallocated});
  end;
SetLength(Context,ContextSize);
ptrContext:=@Context[0];
Word(ptrContext^):=3; //. version #3
Inc(Integer(ptrContext),SizeOf(Word));
{components context}
if (flComponentsContextUsed)
 then begin
  Integer(ptrContext^):=ContextComponents.Count; //. ComponentCount
  Inc(Integer(ptrContext),SizeOf(Integer));
  for I:=0 to ContextComponents.Count-1 do with THistoryComponentRepresentationContext(ptrContext^) do begin
    idTComponent:=TItemComponentsList(ContextComponents[I]^).idTComponent;
    idComponent:=TItemComponentsList(ContextComponents[I]^).idComponent;
    //. next
    Inc(Integer(ptrContext),SizeOf(THistoryComponentRepresentationContext));
    end;
  end
 else begin
  Integer(ptrContext^):=-1; //. ComponentCount
  Inc(Integer(ptrContext),SizeOf(Integer));
  end;
{reflection context}
Integer(ptrContext^):=(ReflectionsCount+Length(SpaceWindowUpdatersWindows)+Length(NotificationWindows)); //. Reflection's Count + Notification's windows count
Inc(Integer(ptrContext),SizeOf(Integer));
for I:=0 to ReflectionsCount-1 do if (TObject(ReflectorsList[I]) is TReflector) then with TReflector(ReflectorsList[I]) do begin
  ReflectionWindow.GetParams({out} Xmin,Ymin,Xmax,Ymax,Scale,VisibleFactor);
  RC.Xmin:=Xmin; RC.Ymin:=Ymin; RC.Xmax:=Xmax; RC.Ymax:=Ymax;
  RC.MinVisibleSquare:=VisibleFactor/sqr(Scale);
  //.
  THistoryReflectionContextV1(ptrContext^):=RC;
  Inc(Integer(ptrContext),SizeOf(THistoryReflectionContextV1));
  end;
for I:=0 to Length(SpaceWindowUpdatersWindows)-1 do with SpaceWindowUpdatersWindows[I] do begin
  RC.Xmin:=Xmin; RC.Ymin:=Ymin; RC.Xmax:=Xmax; RC.Ymax:=Ymax;
  RC.MinVisibleSquare:=0.0;
  //.
  THistoryReflectionContextV1(ptrContext^):=RC;
  Inc(Integer(ptrContext),SizeOf(THistoryReflectionContextV1));
  end;
for I:=0 to Length(NotificationWindows)-1 do with NotificationWindows[I] do begin
  RC.Xmin:=Xmin; RC.Ymin:=Ymin; RC.Xmax:=Xmax; RC.Ymax:=Ymax;
  RC.MinVisibleSquare:=0.0;
  //.
  THistoryReflectionContextV1(ptrContext^):=RC;
  Inc(Integer(ptrContext),SizeOf(THistoryReflectionContextV1));
  end;
{space cached objects context}
if (flVisualizationsContextUsed)
 then begin
  Move(AddressMaskArray.ByteArrayPtr^,ptrContext^,AddressMaskArray.ByteArraySize);
  Inc(Integer(ptrContext),AddressMaskArray.ByteArraySize);
  end
 else begin
  Integer(ptrContext^):=-1; //. VisualizationAddressMasksCount
  Inc(Integer(ptrContext),SizeOf(Integer));
  end;
finally
AddressMaskArray.Free;
end;
finally
ContextComponents.Free;
end;
//.
finally
Lock.Leave;
end;
//. fetching history
//.
_LastUpdatesTimeStamp:=Context_LastUpdatesTimeStamp;
try
with GetISpaceReports(SOAPServerURL) do AllHistory_GetHistorySinceUsingContext1(UserName,UserPassword,Context, Double(Context_LastUpdatesTimeStamp), SpaceHistory,ComponentsHistory,ComponentsUpdateHistory,VisualizationsHistory);
except
  on E: ERemotableException do begin
    if (Pos(AllHistory_GetHistorySinceUsingContext1_HistoryIsTooLongErrorStr,E.FaultCode) > 0)
     then begin
      EventLog.WriteCriticalEvent('ContextUpdating','Unable to update space: returning history is too long. Please clear inactive or all space context using main menu and try to update again.',E.Message);
      //. return without updating
      Exit; //. ->
      end
     else Raise; //. =>
    end;
  else
    Raise ; //. =>
  end;
//.
//.
try
//. update components
for I:=0 to (Length(ComponentsHistory) DIV SizeOf(TComponentsHistoryItem))-1 do with TComponentsHistoryItem(Pointer(Integer(@ComponentsHistory[0])+I*SizeOf(TComponentsHistoryItem))^) do
  try
  if ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsComponentFound(Integer(idTComponent),idComponent)))
   then begin
    try
    CF:=TComponentFunctionality_Create(Integer(idTComponent),idComponent);
    except
      Continue;
      end;
    try
    if (CF is TBaseVisualizationFunctionality)
     then
      case TComponentOperation(idOperation) of
      opCreate: ; //. do nothing
      opDestroy: DoOnComponentOperation(Integer(idTComponent),idComponent,TComponentOperation(idOperation));
      opUpdate: if ((flComponentsContextUsed) OR TBaseVisualizationFunctionality(CF).TypeSystem.Context_IsItemExist(idComponent)) then DoOnComponentOperation(Integer(idTComponent),idComponent,TComponentOperation(idOperation));
      end
     else DoOnComponentOperation(Integer(idTComponent),idComponent,TComponentOperation(idOperation));
    finally
    CF.Release;
    end;
    end;
  except
    On E: ESOAPHTTPException do Raise; //. =>
    On E: Exception do EventLog.WriteMinorEvent('ContextUpdating','Unable to update component (Type: '+IntToStr(idTComponent)+', ID: '+IntToStr(idComponent)+', Operation: '+IntToStr(idOperation)+').',E.Message);
    end;
//. component's partial update
if (Length(ComponentsUpdateHistory) > 0)
 then begin
  SrsPtr:=@ComponentsUpdateHistory[0];
  EndPtr:=Pointer(Integer(SrsPtr)+Length(ComponentsUpdateHistory));
  end
 else begin
  SrsPtr:=nil;
  EndPtr:=nil;
  end;
while (SrsPtr <> EndPtr) do begin
  _TimeStamp:=TDateTime(SrsPtr^); Inc(Integer(SrsPtr),SizeOf(_TimeStamp));
  _idTComponent:=Word(SrsPtr^); Inc(Integer(SrsPtr),SizeOf(_idTComponent));
  _idComponent:=Int64(SrsPtr^); Inc(Integer(SrsPtr),SizeOf(_idComponent));
  _Size:=Integer(SrsPtr^); Inc(Integer(SrsPtr),SizeOf(_Size));
  SetLength(_Data,_Size);
  Move(SrsPtr^,Pointer(@_Data[0])^,_Size); Inc(Integer(SrsPtr),_Size);
  //.
  try
  if ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsComponentFound(Integer(_idTComponent),_idComponent)))
   then begin
    try
    CF:=TComponentFunctionality_Create(Integer(_idTComponent),_idComponent);
    except
      Continue;
      end;
    try
    DoOnComponentPartialUpdate(Integer(_idTComponent),_idComponent,_Data);
    finally
    CF.Release;
    end;
    end;
  except
    On E: ESOAPHTTPException do Raise; //. =>
    On E: Exception do EventLog.WriteMinorEvent('ContextUpdating','Unable to partial update component (Type: '+IntToStr(_idTComponent)+', ID: '+IntToStr(_idComponent)+').',E.Message);
    end;
  end;
//. update space structure
Lock.Enter;
try
if (Length(SpaceHistory) > 0)
 then begin
  SrsPtr:=@SpaceHistory[0];
  EndPtr:=Pointer(Integer(SrsPtr)+Length(SpaceHistory));
  end
 else begin
  SrsPtr:=nil;
  EndPtr:=nil;
  end;
while (SrsPtr <> EndPtr) do begin
  with TSpaceHistoryItem(SrsPtr^) do begin
  _Pntr:=Pntr;
  _Size:=Size;
  end;
  Inc(Integer(SrsPtr),SizeOf(TSpaceHistoryItem));
  //.
  if (_Size = SizeOf(TPtr))
   then begin
    if (NOT IsPtrNull(_Pntr))
     then begin
      Ptr:=TPtr(SrsPtr^);
      WriteObjLocalStorage(Ptr,SizeOf(Ptr), _Pntr);
      end;
    end;
  //.
  Inc(Integer(SrsPtr),_Size);
  end;
finally
Lock.Leave;
end;
//. update visualization context
try
Obj_UpdateLocal__Start;
try
for I:=0 to (Length(VisualizationsHistory) DIV SizeOf(TVisualizationsHistoryItem))-1 do with TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^) do
  try
  if ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsVisualizationFound(ptrObj)))
   then
    case TRevisionAct(idAct) of
    actInsert:                          if (State <> psstCreating) then Obj_CheckCachedState(ptrObj);
    actInsertRecursively:               if (State <> psstCreating) then Obj_CheckCachedState(ptrObj);
    actRemove:                          if (Obj_IsCached(ptrObj)) then Obj_ClearCachedState(ptrObj);
    actRemoveRecursively:               if (Obj_IsCached(ptrObj)) then Obj_ClearCachedState(ptrObj);
    actChange:                          if (Obj_IsCached(ptrObj) OR ((Flags = vhifVisible) AND (State <> psstCreating))) then Obj_UpdateLocal__Add(ptrObj,false); //. more effective for a many dynamic objects Obj_UpdateLocal(ptrObj,false);
    actChangeRecursively:               if (Obj_IsCached(ptrObj) OR ((Flags = vhifVisible) AND (State <> psstCreating))) then Obj_UpdateLocal__Add(ptrObj,true); //. more effective for a many dynamic objects Obj_UpdateLocal(ptrObj,true);
    actContentChange:                   if (Obj_IsCached(ptrObj) OR ((Flags = vhifVisible) AND (State <> psstCreating))) then Obj_DoOnContentChange(ptrObj,false);
    actContentChangeRecursively:        if (Obj_IsCached(ptrObj) OR ((Flags = vhifVisible) AND (State <> psstCreating))) then Obj_DoOnContentChange(ptrObj,true);
    else ;
    end;
  except
    On E: ESOAPHTTPException do Raise; //. =>
    On E: Exception do EventLog.WriteMinorEvent('VisualizationContextUpdating','Unable to update visualization (Ptr: '+IntToStr(ptrObj)+', Action: '+IntToStr(idAct)+').',E.Message);
    end;
finally
Obj_UpdateLocal__Finish;
end;
except
  On E: ESOAPHTTPException do Raise; //. =>
  On E: Exception do EventLog.WriteMinorEvent('ContextUpdating','Error during updating the context.',E.Message);
  end;
except
  Context_LastUpdatesTimeStamp:=_LastUpdatesTimeStamp; //. return to the last context time-stamp, if error occurs when updating the context
  Raise; //. =>
  end;
//. update reflectors
if (ReflectorsList <> nil)
 then with ReflectorsList do
  for J:=0 to Count-1 do
    if (TObject(Items[J]) is TReflector)
     then with TReflector(Items[J]) do begin
      Reflecting.Revising.Lock.Enter;
      try
      for I:=0 to (Length(VisualizationsHistory) DIV SizeOf(TVisualizationsHistoryItem))-1 do with TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^) do
        try
        case TRevisionAct(idAct) of
        actInsert,actInsertRecursively: if (Self.State <> psstCreating) then Reflecting.RevisionReflect(ptrObj,TRevisionAct(idAct));
        actRemove,actRemoveRecursively: Reflecting.RevisionReflect(ptrObj,TRevisionAct(idAct));
        actRefresh,actRefreshRecursively,actChange,actChangeRecursively,actContentChange,actContentChangeRecursively: begin
          if ((Obj_IsCached(ptrObj) OR ((Flags = vhifVisible) AND (Self.State <> psstCreating))) AND ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsVisualizationFound(ptrObj))))
           then Reflecting.RevisionReflect(ptrObj,TRevisionAct(idAct));
          end;
        end;
        except
          On E: ESOAPHTTPException do Raise; //. =>
          On E: Exception do EventLog.WriteMinorEvent('VisualizationContextUpdating','Error on updating reflector (ObjPtr: '+IntToStr(ptrObj)+').',E.Message);
          end;
      finally
      Reflecting.Revising.Lock.Leave;
      end;
      end
     else
      if (TObject(Items[J]) is TGL3DReflector)
       then with TGL3DReflector(Items[J]) do begin
        for I:=0 to (Length(VisualizationsHistory) DIV SizeOf(TVisualizationsHistoryItem))-1 do with TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^) do
          try
          case TRevisionAct(idAct) of
          actInsert,actInsertRecursively: if (Self.State <> psstCreating) then Reflecting.RevisionReflect(ptrObj,TRevisionAct(idAct));
          actRemove,actRemoveRecursively: Reflecting.RevisionReflect(ptrObj,TRevisionAct(idAct));
          actRefresh,actRefreshRecursively,actChange,actChangeRecursively,actContentChange,actContentChangeRecursively: begin
            if ((Obj_IsCached(ptrObj) OR ((Flags = vhifVisible) AND (Self.State <> psstCreating))) AND ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsVisualizationFound(ptrObj))))
             then Reflecting.RevisionReflect(ptrObj,TRevisionAct(idAct));
            end;
          end;
          except
            On E: ESOAPHTTPException do Raise; //. =>
            On E: Exception do EventLog.WriteMinorEvent('VisualizationContextUpdating','Error on updating reflector (ObjPtr: '+IntToStr(ptrObj)+').',E.Message);
            end;
        end;
//. update plugins
for I:=0 to (Length(VisualizationsHistory) DIV SizeOf(TVisualizationsHistoryItem))-1 do with TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^) do
  try
  if (Obj_IsCached(ptrObj) AND ((NOT flExcludeNotificationSubscription) OR (NOT SubscriptionComponents_IsVisualizationFound(ptrObj))))
   then Plugins_DoOnVisualizationOperation(ptrObj,TRevisionAct(idAct));
  except
    On E: ESOAPHTTPException do Raise; //. =>
    On E: Exception do EventLog.WriteMinorEvent('VisualizationContextUpdating','Error on updating plugins (ObjPtr: '+IntToStr(ptrObj)+').',E.Message);
    end;
//. insert to history
if ((Length(SpaceHistory) <> 0) OR (Length(ComponentsHistory) <> 0) OR (Length(VisualizationsHistory) <> 0)) then TfmProxySpaceUpdatesMonitor(StayUpToDate_Monitor).UpdateItems_Insert(Context_LastUpdatesTimeStamp, SpaceHistory,ComponentsHistory,VisualizationsHistory);
finally
flUpdating:=false;
end;
finally
//.
if (ControlPanel <> nil)
 then
  if (GetCurrentThreadID = MainThreadID)
   then SendMessage(ControlPanel.Handle, WM_TRAYICONMAIN, 0,0)
   else PostMessage(ControlPanel.Handle, WM_TRAYICONMAIN, 0,0);
end;
finally
Context_UpdateLock.Leave;
end;
if (Context_Updating <> nil) then Context_Updating.Reset();
end;

procedure TProxySpace.NotificationSubscription_DoOnUpdatesReceived(const ComponentNotifications: pointer; const ComponentNotificationsCount: integer; const ComponentPartialUpdateNotifications: pointer; const ComponentPartialUpdateNotificationsCount: integer; const VisualizationNotifications: pointer; const VisualizationNotificationsCount: integer);

  procedure Obj_DoOnContentChange(const ptrObj: TPtr; const flRecursive: boolean);
  var
    Obj: TSpaceObj;
    CF: TComponentFunctionality;
    ptrOwnerObj: TPtr;
  begin
  try
  ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObj);
  try
  CF:=TComponentFunctionality_Create(Obj.idTObj,Obj.idObj);
  except
    CF:=nil;
    end;
  if (CF <> nil)
   then
    try
    if (TBaseVisualizationFunctionality(CF).TypeSystem.Context_IsItemExist(Obj.idObj)) then DoOnComponentOperation(Obj.idTObj,Obj.idObj,opUpdate);
    finally
    CF.Release;
    end;
  except
    On E: ESOAPHTTPException do Raise; //. =>
    On E: Exception do EventLog.WriteMinorEvent('VisualizationContextUpdating','Unable to update content of component (Type: '+IntToStr(Obj.idTObj)+', ID: '+IntToStr(Obj.idObj)+').',E.Message);
    end;
  if (NOT flRecursive) then Exit; //. ->
  //. process own objects
  ptrOwnerObj:=Obj.ptrListOwnerObj;
  while (ptrOwnerObj <> nilPtr) do begin
    Obj_DoOnContentChange(ptrOwnerObj,flRecursive);
    ReadObjLocalStorage(ptrOwnerObj,SizeOf(TPtr), ptrOwnerObj);
    end;
  end;

var
  I,J: integer;
  CF: TComponentFunctionality;
  Ptr: pointer;
  _idTComponent: smallint;
  _idComponent: Int64;
  _Size: Integer;
  _Data: TByteArray;
begin
Context_UpdateLock.Enter;
try
flUpdating:=true;
try
//. update components
for I:=0 to ComponentNotificationsCount-1 do with TComponentNotification(Pointer(Integer(ComponentNotifications)+I*SizeOf(TComponentNotification))^) do begin
  try
  CF:=TComponentFunctionality_Create(Integer(idTComponent),idComponent);
  except
    Continue;
    end;
  try
  try
  if (CF is TBaseVisualizationFunctionality)
   then
    case Operation of
    opCreate: ; //. do nothing
    opDestroy: DoOnComponentOperation(Integer(idTComponent),idComponent,TComponentOperation(Operation));
    opUpdate: if (TBaseVisualizationFunctionality(CF).TypeSystem.Context_IsItemExist(idComponent)) then DoOnComponentOperation(Integer(idTComponent),idComponent,Operation);
    end
   else DoOnComponentOperation(Integer(idTComponent),idComponent,Operation);
  finally
  CF.Release;
  end;
  except
    On E: ESOAPHTTPException do Raise; //. =>
    On E: Exception do EventLog.WriteMinorEvent('SubscriptionDoOnUpdatesReceived','Unable to update component (Type: '+IntToStr(idTComponent)+', ID: '+IntToStr(idComponent)+', Operation: '+IntToStr(Integer(Operation))+').',E.Message);
    end;
  end;
//. partial update
Ptr:=ComponentPartialUpdateNotifications; 
for I:=0 to ComponentPartialUpdateNotificationsCount-1 do begin
  _idTComponent:=Word(Ptr^); Inc(Integer(Ptr),SizeOf(_idTComponent));
  _idComponent:=Int64(Ptr^); Inc(Integer(Ptr),SizeOf(_idComponent));
  _Size:=Integer(Ptr^); Inc(Integer(Ptr),SizeOf(_Size));
  SetLength(_Data,_Size);
  Move(Ptr^,Pointer(@_Data[0])^,_Size); Inc(Integer(Ptr),_Size);
  //.
  try
  try
  CF:=TComponentFunctionality_Create(Integer(_idTComponent),_idComponent);
  except
    Continue;
    end;
  try
  DoOnComponentPartialUpdate(Integer(_idTComponent),_idComponent,_Data);
  finally
  CF.Release;
  end;
  except
    On E: ESOAPHTTPException do Raise; //. =>
    On E: Exception do EventLog.WriteMinorEvent('SubscriptionDoOnUpdatesReceived','Unable to partial update component (Type: '+IntToStr(_idTComponent)+', ID: '+IntToStr(_idComponent)+').',E.Message);
    end;
  end;
//. update space context
Obj_UpdateLocal__Start;
try
for I:=0 to VisualizationNotificationsCount-1 do with TVisualizationNotification(Pointer(Integer(VisualizationNotifications)+I*SizeOf(TVisualizationNotification))^) do
  try
  case Act of
  actInsert:                    Obj_CheckCachedState(ptrObj);
  actInsertRecursively:         Obj_CheckCachedState(ptrObj);
  actRemove:                    if (Obj_IsCached(ptrObj)) then Obj_ClearCachedState(ptrObj);
  actRemoveRecursively:         if (Obj_IsCached(ptrObj)) then Obj_ClearCachedState(ptrObj);
  actChange:                    if (Obj_IsCached(ptrObj)) then Obj_UpdateLocal__Add(ptrObj,false); //. more effective for a many dynamic objects Obj_UpdateLocal(ptrObj,false);
  actChangeRecursively:         if (Obj_IsCached(ptrObj)) then Obj_UpdateLocal__Add(ptrObj,true); //. more effective for a many dynamic objects Obj_UpdateLocal(ptrObj,true);
  actContentChange:             if (Obj_IsCached(ptrObj)) then Obj_DoOnContentChange(ptrObj,false);
  actContentChangeRecursively:  if (Obj_IsCached(ptrObj)) then Obj_DoOnContentChange(ptrObj,true);
  else ;
  end;
  except
    On E: ESOAPHTTPException do Raise; //. =>
    On E: Exception do EventLog.WriteMinorEvent('SubscriptionDoOnUpdatesReceived','Unable to update visualization (Ptr: '+IntToStr(ptrObj)+', Action: '+IntToStr(Integer(Act))+').',E.Message);
    end;
finally
Obj_UpdateLocal__Finish;
end;
//. update reflectors
if (ReflectorsList <> nil)
 then with ReflectorsList do
  for J:=0 to Count-1 do
    if (TObject(Items[J]) is TReflector)
     then with TReflector(Items[J]) do begin
      Reflecting.Revising.Lock.Enter;
      try
      for I:=0 to VisualizationNotificationsCount-1 do with TVisualizationNotification(Pointer(Integer(VisualizationNotifications)+I*SizeOf(TVisualizationNotification))^) do 
        try
        Reflecting.RevisionReflect(ptrObj,Act);
        except
          end;
      finally
      Reflecting.Revising.Lock.Leave;
      end;
      end
     else
      if (TObject(Items[J]) is TGL3DReflector)
       then with TGL3DReflector(Items[J]) do begin
        for I:=0 to VisualizationNotificationsCount-1 do with TVisualizationNotification(Pointer(Integer(VisualizationNotifications)+I*SizeOf(TVisualizationNotification))^) do 
          Reflecting.RevisionReflect(ptrObj,Act);
        end;
//. update plugins
for I:=0 to VisualizationNotificationsCount-1 do with TVisualizationNotification(Pointer(Integer(VisualizationNotifications)+I*SizeOf(TVisualizationNotification))^) do 
  try
  Plugins_DoOnVisualizationOperation(ptrObj,Act);
  except
    end;
//. insert to history
if ((ComponentNotificationsCount <> 0) OR (VisualizationNotificationsCount <> 0)) then TfmProxySpaceUpdatesMonitor(StayUpToDate_Monitor).UpdateItems_Insert(Now, ComponentNotifications,ComponentNotificationsCount, VisualizationNotifications,VisualizationNotificationsCount);
finally
flUpdating:=false;
end;
finally
Context_UpdateLock.Leave;
end;
if (Context_Updating <> nil) then Context_Updating.Reset();
end;

procedure TProxySpace.StayUpToDateWithoutContext;
var
  Msg: TMessage;
  SpaceHistory,ComponentsHistory,VisualizationsHistory: TByteArray;
  SrsPtr,EndPtr: pointer;
  _Pntr: TPtr;
  _Size: Integer;
  I,J: integer;
  CF: TComponentFunctionality;
begin
Context_UpdateLock.Enter;
try
SendMessage(ControlPanel.Handle, WM_TRAYICONUPDATING, 0,0);
try
//. fetching history
with GetISpaceReports(SOAPServerURL) do AllHistory_GetHistorySince1(UserName,UserPassword, Double(Context_LastUpdatesTimeStamp), SpaceHistory,ComponentsHistory,VisualizationsHistory);
//. update space
if (Length(SpaceHistory) > 0)
 then begin
  SrsPtr:=@SpaceHistory[0];
  EndPtr:=Pointer(Integer(SrsPtr)+Length(SpaceHistory));
  end
 else begin
  SrsPtr:=nil;
  EndPtr:=nil;
  end;
while SrsPtr <> EndPtr do begin
  with TSpaceHistoryItem(SrsPtr^) do begin
  _Pntr:=Pntr;
  _Size:=Size;
  end;
  Inc(Integer(SrsPtr),SizeOf(TSpaceHistoryItem));
  //.
  WriteObjLocalStorage(SrsPtr^,_Size, _Pntr);
  //.
  Inc(Integer(SrsPtr),_Size);
  end;
//. update components
for I:=0 to (Length(ComponentsHistory) DIV SizeOf(TComponentsHistoryItem))-1 do with TComponentsHistoryItem(Pointer(Integer(@ComponentsHistory[0])+I*SizeOf(TComponentsHistoryItem))^) do begin
  try
  CF:=TComponentFunctionality_Create(SmallInt(idTComponent),idComponent);
  except
    Continue;
    end;
  try
  try
  if (TComponentOperation(idOperation) = opCreate) AND (CF is TBaseVisualizationFunctionality)
   then begin
    //. do nothing
    end
   else DoOnComponentOperation(SmallInt(idTComponent),idComponent,TComponentOperation(idOperation));
  finally
  CF.Release;
  end;
  except
    end;
  end;
//. update reflectors
for I:=0 to (Length(VisualizationsHistory) DIV SizeOf(TVisualizationsHistoryItem))-1 do with TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^) do
  case TRevisionAct(idAct) of
  actInsert: if TReflectorsList(ReflectorsList).IsObjOutside(ptrObj) then ptrObj:=nilPtr;
  actChange,actChangeRecursively: if ((NOT Obj_IsCached(ptrObj)) AND TReflectorsList(ReflectorsList).IsObjOutside(ptrObj)) then ptrObj:=nilPtr;
  end;
with ReflectorsList do
for J:=0 to Count-1 do
  if (TObject(Items[J]) is TReflector)
   then with TReflector(Items[J]) do begin
    Reflecting.Revising.Lock.Enter;
    try
    for I:=0 to (Length(VisualizationsHistory) DIV SizeOf(TVisualizationsHistoryItem))-1 do with TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^) do if (ptrObj <> nilPtr) then
      try
      case TRevisionAct(idAct) of
      actInsert: begin
          Obj_CheckCachedState(ptrObj);
          Reflecting.RevisionReflect(ptrObj,actInsert);
          end;
      actChange:
        if (NOT Obj_IsCached(ptrObj))
         then begin
          Obj_CheckCachedState(ptrObj);
          Reflecting.RevisionReflect(ptrObj,actChange);
          end
         else begin
          Obj_UpdateLocal(ptrObj,false);
          Reflecting.RevisionReflect(ptrObj,actChange);
          end;
      actChangeRecursively:
        if (NOT Obj_IsCached(ptrObj))
         then begin
          Obj_CheckCachedState(ptrObj);
          Reflecting.RevisionReflect(ptrObj,actChangeRecursively);
          end
         else begin
          Obj_UpdateLocal(ptrObj,true);
          Reflecting.RevisionReflect(ptrObj,actChangeRecursively);
          end;
      else
        Reflecting.RevisionReflect(ptrObj,TRevisionAct(idAct));
      end;
      except
        On E: Exception do EventLog.WriteMajorEvent('ContextUpdating','Update reflectors error.',E.Message);
        end;
    finally
    Reflecting.Revising.Lock.Leave;
    end;
    end
   else
    if (TObject(Items[J]) is TGL3DReflector)
     then with TGL3DReflector(Items[J]) do begin
      for I:=0 to (Length(VisualizationsHistory) DIV SizeOf(TVisualizationsHistoryItem))-1 do with TVisualizationsHistoryItem(Pointer(Integer(@VisualizationsHistory[0])+I*SizeOf(TVisualizationsHistoryItem))^) do if (ptrObj <> nilPtr) then
        Reflecting.RevisionReflect(ptrObj,TRevisionAct(idAct));
      end;
//.
finally
PostMessage(ControlPanel.Handle, WM_TRAYICONMAIN, 0,0);
end;
finally
Context_UpdateLock.Leave;
end;
end;

procedure TProxySpace.DisableUpdating();
begin
InterlockedIncrement(FUpdateIsDisabledCounter);
end;

procedure TProxySpace.EnableUpdating();
var
  Value: integer;
begin
Value:=InterlockedDecrement(FUpdateIsDisabledCounter);
if (Value <= 0) then StayUpToDate();
end;


procedure TProxySpace.InitializePlugins;
type
  TSetApplication = procedure (const H: THandle); stdcall;
const
  PluginsFolder = 'Plugins';
var
  sr: TSearchRec;
  PluginName: string;
  PluginHandle: THandle;
  Initialize: pointer;
  SetApplication: pointer;
  UpdateProc: pointer;
begin
Plugins:=nil;
PluginsDoOnComponentOperationEntries:=nil;
PluginsDoOnVisualizationOperationEntries:=nil;
try
if FindFirst(PluginsFolder+'\*.dll', faAnyFile, sr) = 0
 then begin
  Log.OperationStarting('Loading User-Plugins ...');
  try
  Plugins:=TThreadList.Create;
  PluginsDoOnComponentOperationEntries:=TThreadList.Create;
  PluginsDoOnVisualizationOperationEntries:=TThreadList.Create;
  repeat
    try
    PluginName:=PluginsFolder+'\'+sr.Name;
    PluginHandle:=LoadLibrary(PChar(PluginName));
    if PluginHandle <> 0
     then begin
      SetApplication:=GetProcAddress(PluginHandle, 'SetApplication');
      if (SetApplication <> nil) then TSetApplication(SetApplication)(Application.Handle);
      Initialize:=GetProcAddress(PluginHandle, 'Initialize');
      if (Initialize <> nil) then TProcedure(Initialize);
      Plugins.Add(Pointer(PluginHandle));
      UpdateProc:=GetProcAddress(PluginHandle, 'DoOnComponentOperation');
      if (UpdateProc <> nil) then PluginsDoOnComponentOperationEntries.Add(UpdateProc);
      UpdateProc:=GetProcAddress(PluginHandle, 'DoOnVisualizationOperation');
      if (UpdateProc <> nil) then PluginsDoOnVisualizationOperationEntries.Add(UpdateProc);
      Log.Log_Write('plugin '+PluginName+' loaded.');
      end
    except
      On E: Exception do EventLog.WriteMajorEvent('PluginInitialization','Error of loading plugin: '+PluginName,E.Message);
      end;
  until FindNext(sr) <> 0;
  SysUtils.FindClose(sr);
  finally
  Log.OperationDone;
  end;
  end;
except
  Plugins.Destroy;
  Raise; //. =>
  end;
end;

procedure TProxySpace.FinalizePlugins;
type
  TSetApplication = procedure (const H: THandle); stdcall;
var
  I: integer;
  PluginHandle: THandle;
  SetApplication: pointer;
  Finalize: pointer;
begin
if Plugins <> nil
 then begin
  with Plugins.LockList do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    SetApplication:=GetProcAddress(PluginHandle, 'SetApplication');
    if (SetApplication <> nil) then TSetApplication(SetApplication)(0);
    Finalize:=GetProcAddress(PluginHandle, PChar('Finalize'));
    if (Finalize <> nil) then TProcedure(Finalize);
    FreeLibrary(PluginHandle);
    end;
  finally
  Plugins.UnLockList;
  end;
  Plugins.Destroy;
  end;
if (PluginsDoOnComponentOperationEntries <> nil) then PluginsDoOnComponentOperationEntries.Destroy;
if (PluginsDoOnVisualizationOperationEntries <> nil) then PluginsDoOnVisualizationOperationEntries.Destroy;
end;

procedure TProxySpace.Plugins_Add(const PluginFileName: string);
type
  TSetApplication = procedure (const H: THandle); stdcall;
const
  PluginsFolder = 'Plugins';

  function Plugin_FileName(const PH: THandle): shortstring;
  begin
  Result:=ExtractFileName(GetModuleName(PH));
  end;

var
  I: integer;
  PN: string;
  PH: THandle;
  Initialize: pointer;
  SetApplication: pointer;
  UpdateProc: pointer;
begin
if ProxySpace.Plugins <> nil
 then with ProxySpace.Plugins.LockList do
  try
  for I:=0 to Count-1 do begin
    PH:=THandle(List[I]);
    if (Plugin_FileName(PH) = PluginFileName) then Raise Exception.Create('such plugin already loaded'); //. =>
    end;
  //.
  PN:=PluginsFolder+'\'+PluginFileName;
  PH:=LoadLibrary(PChar(PN));
  if (PH <> 0)
   then begin
    SetApplication:=GetProcAddress(PH, 'SetApplication');
    if SetApplication <> nil then TSetApplication(SetApplication)(Application.Handle);
    Initialize:=GetProcAddress(PH, 'Initialize');
    if (Initialize <> nil) then TProcedure(Initialize);
    Plugins.Add(Pointer(PH));
    UpdateProc:=GetProcAddress(PH, 'DoOnComponentOperation');
    if (UpdateProc <> nil) then PluginsDoOnComponentOperationEntries.Add(UpdateProc);
    UpdateProc:=GetProcAddress(PH, 'DoOnVisualizationOperation');
    if (UpdateProc <> nil) then PluginsDoOnVisualizationOperationEntries.Add(UpdateProc);
    Log.Log_Write('plugin '+PluginFileName+' added.');
    end
   else
    Raise Exception.Create('error loading plugin - '+PN); //. =>
  finally
  ProxySpace.Plugins.UnLockList;
  end
 else
  Raise Exception.Create('plugins list not found'); //. =>
end;

procedure TProxySpace.Plugins_Remove(const PluginHandle: THandle);
type
  TSetApplication = procedure (const H: THandle); stdcall;
var
  PI: integer;
  SetApplication: pointer;
  UpdateProc: pointer;
  Finalize: pointer;
  flEmpty: boolean;
begin
if Plugins <> nil
 then begin
  with Plugins.LockList do
  try
  PI:=IndexOf(Pointer(PluginHandle));
  if (PI = -1) then Raise Exception.Create('plugin not found'); //. =>
  SetApplication:=GetProcAddress(PluginHandle, 'SetApplication');
  if (SetApplication <> nil) then TSetApplication(SetApplication)(0);
  UpdateProc:=GetProcAddress(PluginHandle, 'DoOnComponentOperation');
  if (UpdateProc <> nil) then PluginsDoOnComponentOperationEntries.Remove(UpdateProc);
  UpdateProc:=GetProcAddress(PluginHandle, 'DoOnVisualizationOperation');
  if (UpdateProc <> nil) then PluginsDoOnVisualizationOperationEntries.Remove(UpdateProc);
  Finalize:=GetProcAddress(PluginHandle, PChar('Finalize'));
  if (Finalize <> nil) then TProcedure(Finalize);
  if (NOT FreeLibrary(PluginHandle)) then Raise Exception.Create('could not unload plugin'); //. =>
  Delete(PI);
  flEmpty:=(Count = 0);
  finally
  Plugins.UnLockList;
  end;
  if flEmpty
   then begin
    FreeAndNil(Plugins);
    FreeAndNil(PluginsDoOnComponentOperationEntries);
    FreeAndNil(PluginsDoOnVisualizationOperationEntries);
    end;
  end
 else
  Raise Exception.Create('plugins list not found'); //. =>
end;

procedure TProxySpace.Plugins_DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
type
  TDoOnComponentOperation = procedure (const idTObj,idObj: integer; const Operation: TComponentOperation); stdcall;
var
  I: integer;
begin
if (PluginsDoOnComponentOperationEntries <> nil)
 then
  with PluginsDoOnComponentOperationEntries.LockList do
  try
  for I:=0 to Count-1 do
    try
    TDoOnComponentOperation(List[I])(idTObj,idObj, Operation);
    except
      On E: Exception do EventLog.WriteMajorEvent('PluginComponentOperation','Error during component operation of plugin: #'+IntToStr(I),E.Message);
      end;
  finally
  PluginsDoOnComponentOperationEntries.UnLockList;
  end;
end;

procedure TProxySpace.Plugins_DoOnVisualizationOperation(const ptrObj: TPtr; const Act: TRevisionAct);
type
  Plugins_DoOnVisualizationOperation = procedure (const ptrObj: TPtr; const Act: TRevisionAct); stdcall;
var
  I: integer;
begin
if (PluginsDoOnVisualizationOperationEntries <> nil)
 then
  with PluginsDoOnVisualizationOperationEntries.LockList do
  try
  for I:=0 to Count-1 do
    try
    Plugins_DoOnVisualizationOperation(List[I])(ptrObj,Act);
    except
      On E: Exception do EventLog.WriteMajorEvent('PluginVisualizationOperation','Error during visualization operation of plugin: #'+IntToStr(I),E.Message);
      end;
  finally
  PluginsDoOnVisualizationOperationEntries.UnLockList;
  end;
end;

function TProxySpace.Plugins_Execute(const Code: integer; const InData: TByteArray; out OutData: TByteArray): boolean;
type
  TExecute = procedure (const Code: integer; const InData: TByteArray; out OutData: TByteArray); stdcall;
var
  I: integer;
  PluginHandle: THandle;
  Routine: pointer;
begin
Result:=false;
if (Plugins <> nil)
 then
  with Plugins.LockList() do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    Routine:=GetProcAddress(PluginHandle, PChar('Execute'));
    if (Routine <> nil)
     then begin
      TExecute(Routine)(Code,InData,{out} OutData);
      //.
      Result:=true;
      end;
    end;
  finally
  Plugins.UnLockList();
  end;
end;

function TProxySpace.Plugins___CoComponent__TPanelProps_Create(const idCoType,idCoComponent: integer): TForm;
type
  TCanSupportCoComponentType = function (const idCoType: integer): boolean; stdcall;
  CoComponent__TPanelProps_Create = function (const idCoType,idCoComponent: integer): TForm; stdcall;
var
  I: integer;
  PluginHandle: THandle;
  Routine: pointer;
begin
Result:=nil;
if Plugins <> nil
 then
  with Plugins.LockList do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    Routine:=GetProcAddress(PluginHandle, PChar('CanSupportCoComponentType'));
    if (Routine <> nil) AND TCanSupportCoComponentType(Routine)(idCoType)
     then begin
      Routine:=GetProcAddress(PluginHandle, PChar('CoComponent__TPanelProps_Create'));
      if (Routine <> nil)
       then begin
        Result:=CoComponent__TPanelProps_Create(Routine)(idCoType,idCoComponent);
        if Result <> nil then Exit; //. ->
        end;
      end;
    end;
  finally
  Plugins.UnLockList;
  end;
end;

function TProxySpace.Plugins_CanCreateCoComponentByFile(const FileName: WideString; out idCoPrototype: integer): boolean;
type
  TCanCreateCoComponentByFile = function (const FileName: WideString; out idCoPrototype: integer): boolean; stdcall;
var
  I: integer;
  PluginHandle: THandle;
  Routine: pointer;
begin
Result:=false;
if Plugins <> nil
 then
  with Plugins.LockList do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    Routine:=GetProcAddress(PluginHandle, PChar('CanCreateCoComponentByFile'));
    if Routine <> nil
     then begin
      Result:=TCanCreateCoComponentByFile(Routine)(FileName, idCoPrototype);
      if Result then Exit; //. ->
      end;
    end;
  finally
  Plugins.UnLockList;
  end;
end;

function TProxySpace.Plugins__CoComponent_LoadByFile(const idCoComponent: integer; const FileName: WideString): boolean;
type
  TCoComponent_LoadByFile = function (const idCoComponent: integer; const FileName: WideString): boolean; stdcall;
var
  I: integer;
  PluginHandle: THandle;
  Routine: pointer;
begin
Result:=false;
if Plugins <> nil
 then
  with Plugins.LockList do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    Routine:=GetProcAddress(PluginHandle, PChar('CoComponent_LoadByFile'));
    if (Routine <> nil)
     then begin
      Result:=TCoComponent_LoadByFile(Routine)(idCoComponent,FileName);
      if Result then Exit; //. ->
      end;
    end;
  finally
  Plugins.UnLockList;
  end;
end;

procedure TProxySpace.Plugins__CoComponent_GetData(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; pidCoType: Integer; DataType: Integer; out Data: GlobalSpaceDefines.TByteArray);
type
  TCoComponent_GetData = procedure (const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; pidCoType: Integer; DataType: Integer; out Data: GlobalSpaceDefines.TByteArray); stdcall;
var
  I: integer;
  PluginHandle: THandle;
  Routine: pointer;
begin
if (Plugins <> nil)
 then
  with Plugins.LockList() do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    Routine:=GetProcAddress(PluginHandle, PChar('CoComponent_GetData'));
    if (Routine <> nil)
     then begin
      TCoComponent_GetData(Routine)(pUserName,pUserPassword, idCoComponent, pidCoType, DataType, {out} Data);
      Exit; //. ->
      end;
    end;
  finally
  Plugins.UnLockList();
  end;
end;

function TProxySpace.Plugins__CoComponent_GetHintInfo(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; idCoType: Integer; const InfoType: Integer; const InfoFormat: Integer; out Info: GlobalSpaceDefines.TByteArray): boolean;
type
  TCoComponent_GetHintInfo = function (const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; idCoType: Integer; const InfoType: Integer; const InfoFormat: Integer; out Info: GlobalSpaceDefines.TByteArray): boolean; stdcall;
var
  I: integer;
  PluginHandle: THandle;
  Routine: pointer;
begin
Result:=false;
if (Plugins <> nil)
 then
  with Plugins.LockList() do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    Routine:=GetProcAddress(PluginHandle, PChar('CoComponent_GetHintInfo'));
    if (Routine <> nil)
     then begin
      Result:=TCoComponent_GetHintInfo(Routine)(pUserName,pUserPassword, idCoComponent, idCoType, InfoType,InfoFormat, {out} Info);
      Exit; //. ->
      end;
    end;
  finally
  Plugins.UnLockList();
  end;
end;

function  TProxySpace.Plugins__CoComponent_TStatusBar_Create(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; idCoType: Integer; const pUpdateNotificationProc: TProcedureOfObject): TObject;
type
  TCoComponent_TStatusBar_Create = function (const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; idCoType: Integer; const pUpdateNotificationProc: TComponentStatusBarUpdateNotificationProc): TAbstractComponentStatusBar; stdcall;
var
  I: integer;
  PluginHandle: THandle;
  Routine: pointer;
begin
Result:=nil;
if (Plugins <> nil)
 then
  with Plugins.LockList() do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    Routine:=GetProcAddress(PluginHandle, PChar('CoComponent_TStatusBar_Create'));
    if (Routine <> nil)
     then begin
      Result:=TCoComponent_TStatusBar_Create(Routine)(pUserName,pUserPassword, idCoComponent, idCoType, TComponentStatusBarUpdateNotificationProc(pUpdateNotificationProc));
      Exit; //. ->
      end;
    end;
  finally
  Plugins.UnLockList();
  end;
end;

procedure TProxySpace.Plugins__CoGeoMonitorObject_GetTrackData(const pUserName: WideString; const pUserPassword: WideString; idCoGeoMonitorObject: Integer; const GeoSpaceID: integer; const BeginTime: double; const EndTime: double; DataType: Integer; out Data: GlobalSpaceDefines.TByteArray);
type
  TCoGeoMonitorObject_GetTrackData = procedure (const pUserName: WideString; const pUserPassword: WideString; idCoGeoMonitorObject: Integer; const GeoSpaceID: integer; const BeginTime: double; const EndTime: double; DataType: Integer; out Data: GlobalSpaceDefines.TByteArray); stdcall;
var
  I: integer;
  PluginHandle: THandle;
  Routine: pointer;
begin
if (Plugins <> nil)
 then
  with Plugins.LockList() do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    Routine:=GetProcAddress(PluginHandle, PChar('CoGeoMonitorObject_GetTrackData'));
    if (Routine <> nil)
     then begin
      TCoGeoMonitorObject_GetTrackData(Routine)(pUserName,pUserPassword, idCoGeoMonitorObject, GeoSpaceID, BeginTime,EndTime, DataType,{out} Data);
      Exit; //. ->
      end;
    end;
  finally
  Plugins.UnLockList();
  end;
end;

function TProxySpace.Plugins__CoGeoMonitorObjects_GetTreePanel(): TForm; 
type
  TCoGeoMonitorObjects_GetTreePanel = function (): TForm; stdcall;
var
  I: integer;
  PluginHandle: THandle;
  Routine: pointer;
begin
Result:=nil;
if (Plugins <> nil)
 then
  with Plugins.LockList() do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    Routine:=GetProcAddress(PluginHandle, PChar('CoGeoMonitorObjects_GetTreePanel'));
    if (Routine <> nil)
     then begin
      Result:=TCoGeoMonitorObjects_GetTreePanel(Routine)();
      Exit; //. ->
      end;
    end;
  finally
  Plugins.UnLockList();
  end;
end;

function TProxySpace.Plugins__GetStartPanel(const flAutoStartCheck: boolean): TForm;
type
  TGetStartPanel = function (const flAutoStartCheck: boolean): TForm; stdcall;
var
  I: integer;
  PluginHandle: THandle;
  Routine: pointer;
begin
Result:=nil;
if (Plugins <> nil)
 then
  with Plugins.LockList() do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    Routine:=GetProcAddress(PluginHandle, PChar('GetStartPanel'));
    if (Routine <> nil)
     then begin
      Result:=TGetStartPanel(Routine)(flAutoStartCheck);
      Exit; //. ->
      end;
    end;
  finally
  Plugins.UnLockList();
  end;
end;

function TProxySpace.Plugins__GetCreateCompletionObjectForCoComponentType(const pidCoType: integer): TObject;
type
  TGetCreateCompletionObjectForCoComponentType = function (const pidCoType: integer): TCreateCompletionObject; stdcall;
var
  I: integer;
  PluginHandle: THandle;
  Routine: pointer;
begin
Result:=nil;
if (Plugins <> nil)
 then
  with Plugins.LockList() do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    Routine:=GetProcAddress(PluginHandle, PChar('GetCreateCompletionObjectForCoComponentType'));
    if (Routine <> nil)
     then begin
      Result:=TGetCreateCompletionObjectForCoComponentType(Routine)(pidCoType);
      if (Result <> nil) then Exit; //. ->
      end;
    end;
  finally
  Plugins.UnLockList;
  end;
end;

procedure TProxySpace.Plugins__ShowUserTaskManager();
type
  TShowUserTaskManager = procedure (); stdcall;
var
  I: integer;
  PluginHandle: THandle;
  Routine: pointer;
begin
if (Plugins <> nil)
 then
  with Plugins.LockList() do
  try
  for I:=0 to Count-1 do begin
    PluginHandle:=THandle(List[I]);
    Routine:=GetProcAddress(PluginHandle, PChar('ShowUserTaskManager'));
    if (Routine <> nil)
     then begin
      TShowUserTaskManager(Routine)();
      end;
    end;
  finally
  Plugins.UnLockList();
  end;
end;

Type
  TDynamicHints = class
  private
    Space: TProxySpace;
    Items: pointer;
  public
    Lock: TCriticalSection;
    Items_MaxCount: integer;
    flEnabled: boolean;
    VisibleFactor: Extended;

    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Clear;
    function IsEmpty: boolean;
    procedure AddItemForShow(const ptrHintObj: TPtr; const idHINTVisualization: integer; const pLevel: word; const pBindingPointX,pBindingPointY: Extended; const pBaseSquare: integer);
    function GetItem(const ptrHintObj: TPtr): pointer;
    function IsItemExist(const ptrHintObj: TPtr): boolean;
    function RemoveItem(const ptrHintObj: TPtr): boolean;
    procedure ShowItems(const BMP: TBitmap);
    procedure GetItemsDataV1(out Data: TMemoryStream);
    function GetHintExtent(const ptrHintObj: TPtr; out Extent: TRect): boolean;
    function GetItemAtPoint(const P: TScreenNode; out ptrItem: pointer): boolean;
    procedure FormItems(const BMP: TBitmap; const flFormExtents: boolean);
    procedure SetVisibleFactor(const Value: Extended);

    function CreateItem: pointer;
    procedure DestroyItem(var ptrDestroy: pointer);
    procedure Item_SetBindingPoint(const ptrItem: pointer; const pBindingPointX,pBindingPointY: Extended; const pBaseSquare: integer);
    procedure Item_UpdateInfo(const ptrItem: pointer);
    procedure Item_UpdateExtent(const BMP: TBitmap; const ptrItem: pointer; const ptrNewExtent: pointer = nil);
    procedure Item_Show(const ptrItem: pointer; const BMP: TBitmap);
  end;

{TDynamicHints}
Constructor TDynamicHints.Create(const pSpace: TProxySpace);
begin
Inherited Create;
Space:=pSpace;
Lock:=TCriticalSection.Create();
Items:=nil;
Items_MaxCount:=333;
flEnabled:=true;
VisibleFactor:=1;
end;

Destructor TDynamicHints.Destroy;
begin
Clear();
Lock.Free();
Inherited;
end;

procedure TDynamicHints.Clear;
var
  ptrDestroyItem: pointer;
begin
Lock.Enter;
try
while (Items <> nil) do begin
  ptrDestroyItem:=Items;
  Items:=TDynamicHint(ptrDestroyItem^).Next;
  //.
  DestroyItem(ptrDestroyItem);
  end;
finally
Lock.Leave;
end;
end;

function TDynamicHints.IsEmpty: boolean;
begin
Lock.Enter;
try
Result:=(Items = nil);
finally
Lock.Leave;
end;
end;

procedure TDynamicHints.AddItemForShow(const ptrHintObj: TPtr; const idHINTVisualization: integer; const pLevel: word; const pBindingPointX,pBindingPointY: Extended; const pBaseSquare: integer);
var
  minX,minY,maxX,maxY: Extended;
  ptrNewItem: pointer;
begin
if (NOT flEnabled) then Exit; //. ->
//.
if (NOT Space.Obj_GetMinMax({out} minX,minY,maxX,maxY, ptrHintObj))
 then begin
  minX:=0.0;
  minY:=0.0;
  maxX:=0.0;
  maxY:=0.0;
  end;
//.
ptrNewItem:=CreateItem();
with TDynamicHint(ptrNewItem^) do begin
id:=idHINTVisualization;
ptrObj:=ptrHintObj;
Level:=pLevel;
//.
Space_BindingPointX:=(minX+maxX)/2.0;
Space_BindingPointY:=(minY+maxY)/2.0;
Space_BaseSquare:=(maxX-minX)*(maxY-minY);
//.
BindingPointX:=pBindingPointX;
BindingPointY:=pBindingPointY;
BaseSquare:=pBaseSquare;
end;
//.
Lock.Enter;
try
TDynamicHint(ptrNewItem^).Next:=Items;
Items:=ptrNewItem;
finally
Lock.Leave;
end;                                
end;

procedure TDynamicHints.ShowItems(const BMP: TBitmap);
var
  ptrItem: pointer;
begin
if (NOT flEnabled) then Exit; //. ->
//.
Lock.Enter;
try
//.
ptrItem:=Items;
while (ptrItem <> nil) do begin
  Item_Show(ptrItem, BMP);
  //. next
  ptrItem:=TDynamicHint(ptrItem^).Next;
  end;
finally
Lock.Leave;
end;
end;

procedure TDynamicHints.GetItemsDataV1(out Data: TMemoryStream);
var
  ptrItem: pointer;
  ItemsCount: integer;
  id64: Int64;
  SS: byte;
  V: double;
begin
Data:=nil;
if (NOT flEnabled) then Exit; //. ->
//.
Data:=TMemoryStream.Create();
try
ItemsCount:=0;
Data.Write(ItemsCount,SizeOf(ItemsCount));
//.
Lock.Enter;
try
//.
ptrItem:=Items;
while (ptrItem <> nil) do with TDynamicHint(ptrItem^) do begin
  id64:=id;
  Data.Write(id64,SizeOf(id64));
  //.
  Data.Write(Level,SizeOf(Level));
  //.
  Data.Write(InfoComponent.idType,SizeOf(InfoComponent.idType));
  id64:=InfoComponent.idObj;
  Data.Write(id64,SizeOf(id64));
  //.
  V:=Space_BindingPointX;
  Data.Write(V,SizeOf(V));
  //.
  V:=Space_BindingPointY;
  Data.Write(V,SizeOf(V));
  //.
  V:=Space_BaseSquare;
  Data.Write(V,SizeOf(V));
  //.
  id64:=InfoImageDATAFileID;
  Data.Write(id64,SizeOf(id64));
  //.
  SS:=Length(InfoString);
  Data.Write(SS,SizeOf(SS));
  if (SS > 0) then Data.Write(Pointer(@InfoString[1])^,SS);
  //.
  Data.Write(InfoStringFontColor,SizeOf(InfoStringFontColor));
  //.
  SS:=InfoStringFontSize;
  Data.Write(SS,SizeOf(SS));
  //.
  SS:=Length(InfoStringFontName);
  Data.Write(SS,SizeOf(SS));
  if (SS > 0) then Data.Write(Pointer(@InfoStringFontName[1])^,SS);
  //.
  Inc(ItemsCount);
  //. next
  ptrItem:=Next;
  end;
if (ItemsCount > 0)
 then begin
  Data.Position:=0;
  Data.Write(ItemsCount,SizeOf(ItemsCount));
  end;
Data.Position:=0;
finally
Lock.Leave;
end;
except
  FreeAndNil(Data);
  Raise; //. =>
  end;
end;

function TDynamicHints.GetHintExtent(const ptrHintObj: TPtr; out Extent: TRect): boolean;
var
  ptrItem: pointer;
begin
Result:=false;
Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do begin
  if (TDynamicHint(ptrItem^).ptrObj = ptrHintObj)
   then begin
    Extent:=TDynamicHint(ptrItem^).Extent;
    Result:=true;
    Exit; //. ->
    end;
  //. next
  ptrItem:=TDynamicHint(ptrItem^).Next;
  end;
finally
Lock.Leave;
end;
end;

function TDynamicHints.GetItemAtPoint(const P: TScreenNode; out ptrItem: pointer): boolean;
var
  _ptrItem: pointer;
begin
Result:=false;
ptrItem:=nil;
Lock.Enter;
try
_ptrItem:=Items;
while (_ptrItem <> nil) do begin
  with TDynamicHint(_ptrItem^).Extent do
  if (((Left <= P.X) AND (P.X <= Right)) AND ((Top <= P.Y) AND (P.Y <= Bottom)))
   then ptrItem:=_ptrItem;
  //. next
  _ptrItem:=TDynamicHint(_ptrItem^).Next;
  end;
finally
Lock.Leave;
end;
Result:=(ptrItem <> nil);
end;

function TDynamicHints.IsItemExist(const ptrHintObj: TPtr): boolean;
begin
Result:=(GetItem(ptrHintObj) <> nil);
end;

function TDynamicHints.GetItem(const ptrHintObj: TPtr): pointer;
begin
Lock.Enter;
try
Result:=Items;
while (Result <> nil) do begin
  if (TDynamicHint(Result^).ptrObj = ptrHintObj) then Exit; //. ->
  //. next
  Result:=TDynamicHint(Result^).Next;
  end;
finally
Lock.Leave;
end;
end;

function TDynamicHints.RemoveItem(const ptrHintObj: TPtr): boolean;
var
  ptrptrHintItem,ptrHintItem: pointer;
begin
Result:=false;
Lock.Enter;
try
ptrptrHintItem:=@Items;
while (Pointer(ptrptrHintItem^) <> nil) do begin
  ptrHintItem:=Pointer(ptrptrHintItem^);
  if (TDynamicHint(ptrHintItem^).ptrObj = ptrHintObj)
   then begin
    Pointer(ptrptrHintItem^):=TDynamicHint(ptrHintItem^).Next;
    DestroyItem(ptrHintItem);
    Result:=true;
    Exit; //. ->
    end
   else ptrptrHintItem:=@TDynamicHint(ptrHintItem^).Next;
  end;
finally
Lock.Leave;
end;
end;

procedure TDynamicHints.FormItems(const BMP: TBitmap; const flFormExtents: boolean);

  function CalculateItemExtentNoIntersection(const ptrCalcItem: pointer; var NewExtent: TRect): boolean;
  var
    ptrItem: pointer;
  begin
  Result:=false;
  NewExtent:=TDynamicHint(ptrCalcItem^).Extent;
  Result:=false;
  ptrItem:=Items;
  while (ptrItem <> nil) do begin
    if (ptrItem <> ptrCalcItem)
     then with TDynamicHint(ptrItem^).Extent do begin
      if (NOT ((Left > NewExtent.Right) OR (Top > NewExtent.Bottom) OR (Right < NewExtent.Left) OR (Bottom < NewExtent.Top)))
       then begin
        if ((Left > NewExtent.Left) AND (Left < NewExtent.Right)) then begin NewExtent.Right:=Left; Result:=true; end;
        end;
      end;
    //. next
    ptrItem:=TDynamicHint(ptrItem^).Next;
    end;
  end;

var
  NewItems: pointer;
  NewItemsCount: integer;
  ptrptrItem,ptrItem: pointer;
  NewExtent: TRect;
begin 
Lock.Enter;
try
//. order items from Max to Min square and remove out of limit items
NewItems:=nil;
NewItemsCount:=0;
while (Items <> nil) do begin
  ptrItem:=Items;
  Items:=TDynamicHint(ptrItem^).Next;
  //.
  ptrptrItem:=@NewItems;
  while ((Pointer(ptrptrItem^) <> nil) AND (TDynamicHint(Pointer(ptrptrItem^)^).BaseSquare > TDynamicHint(ptrItem^).BaseSquare)) do
    ptrptrItem:=@TDynamicHint(Pointer(ptrptrItem^)^).Next;
  TDynamicHint(ptrItem^).Next:=Pointer(ptrptrItem^);
  Pointer(ptrptrItem^):=ptrItem;
  Inc(NewItemsCount);
  end;
//.
if (NewItemsCount > Items_MaxCount)
 then begin
  NewItemsCount:=Items_MaxCount;
  ptrItem:=NewItems;
  while (NewItemsCount > 0) do begin
    ptrItem:=TDynamicHint(ptrItem^).Next;
    Dec(NewItemsCount);
    end;
  //. remove out of limit items
  Items:=TDynamicHint(ptrItem^).Next;
  TDynamicHint(ptrItem^).Next:=nil;
  Clear();
  end;
Items:=NewItems;
if (flFormExtents)                                        
 then begin //. form items extents
  ptrItem:=Items;
  while (ptrItem <> nil) do begin
    Item_UpdateInfo(ptrItem);
    Item_UpdateExtent(BMP,ptrItem);
    //. next
    ptrItem:=TDynamicHint(ptrItem^).Next;
    end;
  end
 else begin
  ptrItem:=Items;
  while (ptrItem <> nil) do begin
    Item_UpdateInfo(ptrItem);
    //. next
    ptrItem:=TDynamicHint(ptrItem^).Next;
    end;
  end;
//. correct item's extents
{///? ptrItem:=Items;
while (ptrItem <> nil) do begin
  if (CalculateItemExtentNoIntersection(ptrItem, NewExtent))
   then Item_UpdateExtent(ptrItem, @NewExtent);
  //. next
  ptrItem:=TDynamicHint(ptrItem^).Next;
  end;}
finally
Lock.Leave;
end;
end;

procedure TDynamicHints.SetVisibleFactor(const Value: Extended);
begin
if (Value = 0)
 then begin
  if (VisibleFactor > 0)
   then begin
    flEnabled:=false;
    end;
  end
 else begin
  if (VisibleFactor = 0)
   then begin
    flEnabled:=true;
    end;
  end;
VisibleFactor:=Value;
end;

function TDynamicHints.CreateItem: pointer;
begin
GetMem(Result,SizeOf(TDynamicHint));
FillChar(Result^,SizeOf(TDynamicHint), 0);
end;

procedure TDynamicHints.DestroyItem(var ptrDestroy: pointer);
begin
with TDynamicHint(ptrDestroy^) do begin
InfoString:='';
InfoStringFontName:='';
{///- InfoText:='';
InfoTextFontName:='';
StatusInfoText:='';}
end;
FreeMem(ptrDestroy,SizeOf(TDynamicHint));
ptrDestroy:=nil;
end;

procedure TDynamicHints.Item_UpdateInfo(const ptrItem: pointer);
var
  ptrCacheItem: pointer;
  DATAFilePtr: pointer;
  MS: TMemoryStream;
begin
//. init
with TDynamicHint(ptrItem^) do begin
InfoString:='';
{///- InfoText:='';
StatusInfoText:='';}
end;
//.
SystemTHINTVisualization.Lock.Enter;
try
if NOT TSystemTHINTVisualization(SystemTHINTVisualization).Cash.GetItem(TDynamicHint(ptrItem^).id, ptrCacheItem) then Exit; //. ->
//.
with TDynamicHint(ptrItem^),TItemTHINTVisualizationCash(ptrCacheItem^) do begin
InfoImageDATAFileID:=idDATAFile;
InfoString:=ParsedDataV1.InfoString;
InfoStringFontName:=ParsedDataV1.InfoStringFontName;
InfoStringFontSize:=ParsedDataV1.InfoStringFontSize;
InfoStringFontColor:=ParsedDataV1.InfoStringFontColor;
{///- InfoText:=ParsedDataV1.InfoText;
InfoTextFontName:=ParsedDataV1.InfoTextFontName;
InfoTextFontSize:=ParsedDataV1.InfoTextFontSize;
InfoTextFontColor:=ParsedDataV1.InfoTextFontColor;}
InfoComponent:=ParsedDataV1.InfoComponent;
///- StatusInfoText:=ParsedDataV1.StatusInfoText;
Transparency:=ParsedDataV1.Transparency;
//.
flInfoIsUpdated:=true;
end;
finally
SystemTHINTVisualization.Lock.Leave;
end;
end;

procedure TDynamicHints.Item_UpdateExtent(const BMP: TBitmap; const ptrItem: pointer; const ptrNewExtent: pointer = nil);
var
  DATAFilePtr: pointer;
  TW: integer;
begin
try
with TDynamicHint(ptrItem^) do begin
//. update extent
if (ptrNewExtent = nil)
 then with Extent do begin
  Left:=Trunc(BindingPointX);
  Bottom:=Trunc(BindingPointY);
  Right:=Left;
  Top:=Bottom;
  //. resize by InfoImage
  if ((InfoImageDATAFileID <> 0) AND TSystemTHINTVisualization(SystemTHINTVisualization).Cash.DATAFileRepository.DATAFile_Lock(InfoImageDATAFileID,{out} DATAFilePtr))
   then with THINTVisualizationDATAFile(DATAFilePtr^) do
    try
    Right:=Right+DATA.Width;
    Top:=Top-DATA.Height;
    finally
    TSystemTHINTVisualization(SystemTHINTVisualization).Cash.DATAFileRepository.DATAFile_Unlock(DATAFilePtr);
    end;
  //.
  with BMP.Canvas do begin
  if (Font.Name <> InfoStringFontName) then Font.Name:=InfoStringFontName;
  if (Font.Size <> InfoStringFontSize) then Font.Size:=InfoStringFontSize;
  TW:=TextWidth(InfoString);
  end;
  Right:=Right+TW;
  end
 else TDynamicHint(ptrItem^).Extent:=TRect(ptrNewExtent^);
end;
except
  end;
end;

procedure TDynamicHints.Item_SetBindingPoint(const ptrItem: pointer; const pBindingPointX,pBindingPointY: Extended; const pBaseSquare: integer);
begin
TDynamicHint(ptrItem^).BindingPointX:=pBindingPointX;
TDynamicHint(ptrItem^).BindingPointY:=pBindingPointY;
TDynamicHint(ptrItem^).BaseSquare:=pBaseSquare;
end;

procedure TDynamicHints.Item_Show(const ptrItem: pointer; const BMP: TBitmap);
var
  DATAFilePtr: pointer;
  OldBkMode: integer;
begin 
try
with TDynamicHint(ptrItem^) do begin
//. 
with Extent do begin
Left:=Trunc(BindingPointX);
Bottom:=Trunc(BindingPointY);
Right:=Left;
Top:=Bottom;
end;
//.
BMP.Canvas.Lock();
try
if ((InfoImageDATAFileID <> 0) AND TSystemTHINTVisualization(SystemTHINTVisualization).Cash.DATAFileRepository.DATAFile_Lock(InfoImageDATAFileID,{out} DATAFilePtr))
 then with THINTVisualizationDATAFile(DATAFilePtr^) do
  try
  with Extent do begin
  Right:=Right+DATA.Width;
  Top:=Top-DATA.Height;
  end;
  DATA.Canvas.Lock();
  try
  TransparentBlt(BMP.Canvas.Handle, Extent.Left,Extent.Top,DATA.Width,DATA.Height, DATA.Canvas.Handle, 0,0,DATA.Width,DATA.Height, DATA.Canvas.Pixels[0,0]);
  finally
  DATA.Canvas.Unlock();
  end;
  finally
  TSystemTHINTVisualization(SystemTHINTVisualization).Cash.DATAFileRepository.DATAFile_Unlock(DATAFilePtr);
  end;
//.
with BMP.Canvas do begin
if (Font.Name <> InfoStringFontName) then Font.Name:=InfoStringFontName;
if (Font.Size <> InfoStringFontSize) then Font.Size:=InfoStringFontSize;
if (Font.Color <> InfoStringFontColor) then Font.Color:=InfoStringFontColor;
if (InfoComponent.idObj <> 0) then Font.Style:=[fsUnderline] else Font.Style:=[];
//.
OldBkMode:=SetBkMode(Handle, TRANSPARENT);
TextOut(Extent.Right,Extent.Top, InfoString);
SetBkMode(Handle, OldBkMode);
//.
with Extent do Right:=Right+TextWidth(InfoString);
end;
finally
BMP.Canvas.Unlock();
end;
end;
except
  end;
end;

procedure TProxySpace.User_ReflectSpaceWindowOnBitmap(const pUserName: WideString; const pUserPassword: WideString; const X0,Y0, X1,Y1, X2,Y2, X3,Y3: TCrd; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const DynamicHintVisibility: double; const DynamicHintDataVersion: integer; const VisualizationUserData: TByteArray; const ActualityInterval: TComponentActualityInterval; const pWidth,pHeight: integer; const Bitmap: TBitmap; out DynamicHintData: TMemoryStream);
var
  RW: TReflectionWindowStrucEx;
  ReflectionWindow: TReflectionWindow;
  WindowRefl: TWindow;
  FigureWinRefl: TFigureWinRefl;
  AdditiveFigureWinRefl: TFigureWinRefl;
  Lays: pointer;
  LaysObjectsCount: integer;

  //. all nested routines below are transferred from Reflecting.inc file

  procedure PrepareLays;
  const
    SizeOfTSpaceObj = SizeOf(TSpaceObj);
    SizeOfTPoint = SizeOf(TPoint);
  var
    RW: TReflectionWindowStrucEx;
    RW_Scale: Extended;
    RW_VisibleFactor: double;
    GlobalSpaceManager: ISpaceManager;
    GlobalSpaceRemoteManager: ISpaceRemoteManager;
    InvisibleLayNumbersArray: TByteArray;
    I,J: integer;
    BA: TByteArray;
    DataPtr: pointer;
    NewLays: pointer;
    NewLaysObjectsCount: integer;
    LaysCount: word;
    LayLevel: integer;
    flSkipObjects: boolean;
    ptrLastObj: TPtr;
    Objects: pointer;
    flLay: boolean;
    ValidObjectsCount,ObjectsCount: integer;
    ptrLast: pointer;
    ptrObj: TPtr;
    ptrptrLay: pointer;

    ObjPointersCount: longword;
    ptrPointersLay,ptrPointersLayItem: pointer;
    Lay,SubLay: integer;
    ptrLayItem: pointer;

    ptrNewLay: pointer;
    ptrFirstLay: pointer;
    ptrLastLay: pointer;
    ptrDumpLay,DumpLay_ptrptrNextLay: pointer;


      procedure PrepareStructuredObjects(DataPtr: pointer);
      const
        ObjPointersMaxSize = 100;

        procedure ProcessObjectPortion(const ObjPointers: TByteArray; const PointersCount: integer);

          procedure ProcessObjDetails(const ptrObj: TPtr; var StructuresPtr: pointer);
          var
            ptrDetail: TPtr;
            DetailSubDetailsCount: word;
            ptrptrOwnerObj: TPtr;
            I: integer;
          begin
          asm
             CLD
             PUSH ESI
             PUSH EDI
             MOV EDI,StructuresPtr
             MOV ESI,[EDI]
             LODSW
             MOV DetailSubDetailsCount,AX
             MOV [EDI],ESI
             POP EDI
             POP ESI
          end;
          ptrptrOwnerObj:=ptrObj+ofsptrListOwnerObj;
          for I:=0 to DetailSubDetailsCount-1 do begin
            asm
               CLD
               PUSH ESI
               PUSH EDI
               MOV EDI,StructuresPtr
               MOV ESI,[EDI]
               LODSD
               MOV ptrDetail,EAX
               MOV [EDI],ESI
               POP EDI
               POP ESI
            end;
            WriteObjLocalStorage(ptrDetail,SizeOf(ptrDetail),ptrptrOwnerObj);
            ptrptrOwnerObj:=ptrDetail;
            //. process sub-details
            ProcessObjDetails(ptrDetail, StructuresPtr);
            end;
          ptrDetail:=nilPtr;
          WriteObjLocalStorage(ptrDetail,SizeOf(ptrDetail),ptrptrOwnerObj);
          end;

        var
          ObjPointersPtr: pointer;
          Structures: TByteArray;
          StructuresPtr: pointer;
          I: integer;
          ptrObj: TPtr;
          ptrDetail: TPtr;
          ptrptrOwnerObj: TPtr;
        begin
        Structures:=GlobalSpaceManager.ReadObjectsStructures(pUserName,pUserPassword, ObjPointers,PointersCount);
        ObjPointersPtr:=@ObjPointers[0];
        StructuresPtr:=@Structures[0];
        Lock.Enter;
        try
        for I:=0 to PointersCount-1 do begin
          //. get ptrObj
          asm
             CLD
             PUSH ESI
             MOV ESI,ObjPointersPtr
             LODSD
             MOV ptrObj,EAX
             MOV ObjPointersPtr,ESI
             POP ESI
          end;
          //.
          if (StructuresPtr <> nil) 
           then ProcessObjDetails(ptrObj,StructuresPtr)
           else begin
            ptrptrOwnerObj:=ptrObj+ofsptrListOwnerObj;
            ptrDetail:=nilPtr;
            WriteObjLocalStorage(ptrDetail,SizeOf(ptrDetail),ptrptrOwnerObj);
            end;
          end;
        finally
        Lock.Leave;
        end;
        end;

      var
        ObjPointers: TByteArray;
        ObjPointersPtr: pointer;
        LaysCount: word;
        ptrObj: TPtr;
        ptrLastObj: TPtr;
        flLay: boolean;
        LayLevel: integer;
        ObjectsCount: integer;
        ValidPointersCount: integer;
        I,J: integer;
      begin
      SetLength(ObjPointers,ObjPointersMaxSize*SizeOf(TPtr));
      ObjPointersPtr:=@ObjPointers[0];
      asm
         PUSH ESI
         MOV ESI,DataPtr
         CLD
         LODSW
         MOV LaysCount,AX
         MOV DataPtr,ESI
         POP ESI
      end;
      LayLevel:=0;
      flSkipObjects:=false;
      ValidPointersCount:=0;
      for I:=0 to LaysCount-1 do begin
        //. lay processing
        ptrLastObj:=nilPtr;
        asm
           PUSH ESI
           MOV ESI,DataPtr
           CLD
           LODSD
           MOV ObjectsCount,EAX
           LODSB
           MOV flLay,AL
           MOV DataPtr,ESI
           POP ESI
        end;
        //.
        if flLay
         then begin
          flSkipObjects:=false; ///+TObjectReflectingCfg(Reflecting.Cfg).HidedLays.IsLayFoundByOrder(LayLevel);
          Inc(LayLevel);
          end;
        for J:=0 to ObjectsCount-1 do begin
          asm
             //. get ptrObj
             PUSH ESI
             MOV ESI,DataPtr
             CLD
             LODSD
             MOV ptrObj,EAX
             MOV DataPtr,ESI
             POP ESI
          end;
          if (NOT flSkipObjects)
           then
            if (ptrObj <> ptrLastObj)
             then ptrLastObj:=ptrObj
             else
              if (NOT Obj_StructureIsCached(ptrObj))
               then begin
                asm
                   PUSH EDI
                   MOV EAX,ptrObj
                   MOV EDI,ObjPointersPtr
                   CLD
                   STOSD
                   MOV ObjPointersPtr,EDI
                   POP EDI
                end;
                Inc(ValidPointersCount);
                if (ValidPointersCount >= ObjPointersMaxSize)
                 then begin
                  ProcessObjectPortion(ObjPointers,ValidPointersCount);
                  ObjPointersPtr:=@ObjPointers[0];
                  ValidPointersCount:=0;
                  end;
                end;
          end;
        end;
      if (ValidPointersCount > 0)
       then begin
        SetLength(ObjPointers,ValidPointersCount*SizeOf(TPtr));
        ProcessObjectPortion(ObjPointers,ValidPointersCount);
        end;
      end;

      procedure InsertObj(const ptrObj: TPtr);
      var
        ptrNew: pointer;
      begin
      GetMem(ptrNew,SizeOf(TItemLayReflect));
      with TItemLayReflect(ptrNew^) do begin
      ptrNext:=nil;
      ptrObject:=ptrObj;
      with Window do begin
      Xmn:=0; Ymn:=0;
      Xmx:=0; Ymx:=0;
      end;
      ObjUpdating:=nil;
      end;
      TItemLayReflect(ptrLast^).ptrNext:=ptrNew;
      ptrLast:=ptrNew;
      Inc(ValidObjectsCount);
      end;

      procedure ProcessObjDetails(const ptrObj: TPtr; ptrptrLay: pointer);
      var
        Obj: TSpaceObj;
        ptrOwnerObj: TPtr;
        ptrLay: pointer;
        Items: pointer;
        ValidObjectsCount: integer;
        ptrNew: pointer;
        ptrptrItem: pointer;
      begin
      //. processing details
      ReadObjLocalStorage(ptrOwnerObj,SizeOf(ptrOwnerObj),ptrObj+ofsptrListOwnerObj);
      if ((ptrOwnerObj <> 0) AND (ptrOwnerObj <> nilPtr))
       then begin
        if (Pointer(ptrptrLay^) = nil)
         then begin
          GetMem(ptrLay,SizeOf(TLayReflect));
          TLayReflect(ptrLay^).ptrNext:=nil;
          TLayReflect(ptrLay^).flLay:=false;
          TLayReflect(ptrLay^).Objects:=nil;
          TLayReflect(ptrLay^).ObjectsCount:=0;
          Pointer(ptrptrLay^):=ptrLay;
          end
         else ptrLay:=Pointer(ptrptrLay^);
        Items:=nil;
        ValidObjectsCount:=0;
        ptrptrItem:=@Items;
        repeat
          //. create new lay item
          GetMem(ptrNew,SizeOf(TItemLayReflect));
          with TItemLayReflect(ptrNew^) do begin
          ptrNext:=nil;
          ptrObject:=ptrOwnerObj;
          with Window do begin
          Xmn:=0; Ymn:=0;
          Xmx:=0; Ymx:=0;
          end;
          ObjUpdating:=nil;
          end;
          TItemLayReflect(ptrptrItem^).ptrNext:=ptrNew;
          ptrptrItem:=ptrNew;
          Inc(ValidObjectsCount);
          //.
          ProcessObjDetails(ptrOwnerObj, ptrLay);
          //. next detail
          ReadObjLocalStorage(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
        until ((ptrOwnerObj = 0) OR (ptrOwnerObj = nilPtr));
        //.
        TItemLayReflect(ptrptrItem^).ptrNext:=TLayReflect(ptrLay^).Objects;
        TLayReflect(ptrLay^).Objects:=Items;
        Inc(TLayReflect(ptrLay^).ObjectsCount,ValidObjectsCount);
        Inc(NewLaysObjectsCount,ValidObjectsCount);
        end;
      end;

      procedure GetObjectsPortion(var ptrPointersLay,ptrPointersLayItem: pointer; var ObjPointersCount: longword);
      var
        ObjPointers: TByteArray;
        ptrPointersBuffer: pointer;
        ValidPointersCount: longword;
        ptrDist: pointer;
        I: integer;
        ptrObj,ptrObjAccessed: TPtr;
        Objects: TByteArray;
        ptrObjectsBuffer: pointer;
        ptrSrs: pointer;
        ptrObjPointer: pointer;
        Obj: TSpaceObj;
        ptrPoint: TPtr;
        Point: TPoint;

        function GetObjPointer(var ptrObj: TPtr): boolean;
        begin
        Result:=false;
        repeat
          while (ptrPointersLayItem = nil) do begin
            ptrPointersLay:=TLayReflect(ptrPointersLay^).ptrNext;
            //.
            if (ptrPointersLay = nil) then Exit; //. ->
            //.
            ptrPointersLayItem:=TLayReflect(ptrPointersLay^).Objects;
            end;
          ptrObj:=TItemLayReflect(ptrPointersLayItem^).ptrObject;
          Result:=(NOT Obj_IsCached(ptrObj));
          if (Result)
           then begin //. limiting on concurrent object caching
            Lock.Enter();
            try
            if (User_SpaceWindow_ObjectCaching_Counter >= User_SpaceWindow_CachingObjectsPortion)
             then begin
              Result:=false;
              Exit; //. ->
              end;
            Inc(User_SpaceWindow_ObjectCaching_Counter);
            finally
            Lock.Leave();
            if (NOT Result) then Sleep(20);
            end;
            end;
          //.
          Dec(ObjPointersCount);
          ptrPointersLayItem:=TItemLayReflect(ptrPointersLayItem^).ptrNext;
        until (Result);
        end;

      begin
      SetLength(ObjPointers,User_SpaceWindow_CachingObjectsPortion*SizeOf(TPtr));
      ptrPointersBuffer:=@ObjPointers[0];
      ptrDist:=ptrPointersBuffer;
      ValidPointersCount:=0;
      {///- deadlock case
      Lock.Enter(); //. !!! to avoid multiple TypeSystem items caching on concurrent function calling
      try}
      while (true) do begin
        if (NOT GetObjPointer(ptrObj)) then Break; //. >
        asm
           PUSH EDI
           MOV EAX,ptrObj
           MOV EDI,ptrDist
           CLD
           STOSD
           MOV ptrDist,EDI
           POP EDI
        end;
        Inc(ValidPointersCount);
        end;
      if (ValidPointersCount > 0)
       then 
        try
        SetLength(ObjPointers,ValidPointersCount*SizeOf(TPtr));
        Objects:=GlobalSpaceManager.ReadObjects(pUserName,pUserPassword, ObjPointers,ValidPointersCount);
        ptrObjectsBuffer:=@Objects[0];
        //. cashing types system for incoming objects
        ptrSrs:=ptrObjectsBuffer;
        TTypesSystem(TypesSystem).Caching_Start();
        try
        for I:=0 to ValidPointersCount-1 do begin
          //. get object body
          asm
             PUSH ESI
             PUSH EDI
             MOV ESI,ptrSrs
             CLD
             LEA EDI,Obj
             MOV ECX,SizeOfTSpaceObj
             REP MOVSB
             MOV ptrSrs,ESI
             POP EDI
             POP ESI
          end;
          //. add object for cashing
          if Obj.idObj <> 0 then TTypesSystem(TypesSystem).Caching_AddObject(Obj.idTObj,Obj.idObj);
          //. skip points
          ptrPoint:=Obj.ptrFirstPoint;
          while ptrPoint <> nilPtr do begin
            //. get point
            asm
               PUSH ESI
               PUSH EDI
               MOV ESI,ptrSrs
               CLD
               LEA EDI,Point
               MOV ECX,SizeOfTPoint
               REP MOVSB
               MOV ptrSrs,ESI
               POP EDI
               POP ESI
            end;
            //. go to next point
            ptrPoint:=Point.ptrNextObj;
            end;
          end;
        //. release quota
        Lock.Enter();
        try
        Dec(User_SpaceWindow_ObjectCaching_Counter,ValidPointersCount);
        finally
        Lock.Leave();
        end;
        finally
        TTypesSystem(TypesSystem).Caching_Finish();
        end;
        //. write objects
        ptrPointersBuffer:=@ObjPointers[0];
        ptrObjPointer:=ptrPointersBuffer;
        ptrSrs:=ptrObjectsBuffer;
        Lock.Enter;
        try
        for I:=0 to ValidPointersCount-1 do begin
          //. get ptrObj
          asm
             CLD
             PUSH ESI
             MOV ESI,ptrObjPointer
             LODSD
             MOV ptrObj,EAX
             MOV ptrObjPointer,ESI
             POP ESI
          end;
          //. get object body
          asm
             PUSH ESI
             PUSH EDI
             MOV ESI,ptrSrs
             CLD
             LEA EDI,Obj
             MOV ECX,SizeOfTSpaceObj
             REP MOVSB
             MOV ptrSrs,ESI
             POP EDI
             POP ESI
          end;
          //. write body
          ptrObjAccessed:=ptrObj;
          WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
          ptrPoint:=Obj.ptrFirstPoint;
          while ptrPoint <> nilPtr do begin
            //. get point
            asm
               PUSH ESI
               PUSH EDI
               MOV ESI,ptrSrs
               CLD
               LEA EDI,Point
               MOV ECX,SizeOfTPoint
               REP MOVSB
               MOV ptrSrs,ESI
               POP EDI
               POP ESI
            end;
            //. write point
            WriteObjLocalStorage(Point,SizeOf(Point), ptrPoint);
            //. go to next point
            ptrPoint:=Point.ptrNextObj;
            end;
          //. process obj as accessed
          if (Obj.idTObj <> idTLay2DVisualization) then ObjectsContextRegistry.ObjAccessed(ptrObjAccessed);
          end;
        finally
        Lock.Leave;
        end;
        except
          Lock.Enter();
          try
          Dec(User_SpaceWindow_ObjectCaching_Counter,ValidPointersCount);
          finally
          Lock.Leave();
          end;
          //.
          Raise; //. =>
          end;
      {///-
      finally
      Lock.Leave();
      end;}
      end;

  begin
  with ReflectionWindow do begin
  Lock.Enter;
  try
  GetWindow(true, RW);
  RW_Scale:=_Scale;
  RW_VisibleFactor:=_VisibleFactor/sqr(_Scale);
  finally
  Lock.Leave;
  end;
  end;
  //.
  GlobalSpaceManager:=GetISpaceManager(SOAPServerURL);
  GlobalSpaceRemoteManager:=GetISpaceRemoteManager(SOAPServerURL);
  //. prepare invisible lays
  InvisibleLayNumbersArray:=HidedLaysArray;
  SystemTLay2DVisualization.AddInvisibleLaysToNumbersArray(RW_Scale,{ref} InvisibleLayNumbersArray);
  //. getting a objects visible in reflector window ...
  with RW do BA:=GlobalSpaceRemoteManager.GetVisibleObjects3(pUserName,pUserPassword, X0,Y0,X1,Y1,X2,Y2,X3,Y3, InvisibleLayNumbersArray, RW_VisibleFactor,0.3/RW_Scale);
  //.
  if (Length(BA) = 0) then Exit; //. ->
  //.
  NewLays:=nil;
  NewLaysObjectsCount:=0;
  try
  //.
  DataPtr:=@BA[0];
  PrepareStructuredObjects(DataPtr);
  //.
  asm
     PUSH ESI
     MOV ESI,DataPtr
     CLD
     LODSW
     MOV LaysCount,AX
     MOV DataPtr,ESI
     POP ESI
  end;
  LayLevel:=0;
  flSkipObjects:=false;
  ptrptrLay:=@NewLays;
  for I:=0 to LaysCount-1 do begin
    //. lay performing
    ptrLastObj:=nilPtr;
    asm
       PUSH ESI
       MOV ESI,DataPtr
       CLD
       LODSD
       MOV ObjectsCount,EAX
       LODSB
       MOV flLay,AL
       MOV DataPtr,ESI
       POP ESI
    end;
    //.
    if (flLay)
     then begin
      flSkipObjects:=false; ///+TObjectReflectingCfg(Cfg).HidedLays.IsLayFoundByOrder(LayLevel);
      while (Pointer(ptrptrLay^) <> nil) do ptrptrLay:=Pointer(ptrptrLay^);
      Inc(LayLevel);
      end;
    //. get processing lay
    if (Pointer(ptrptrLay^) = nil)
     then begin //. prepare new lay
      GetMem(ptrNewLay,SizeOf(TLayReflect));
      TLayReflect(ptrNewLay^).ptrNext:=nil;
      TLayReflect(ptrNewLay^).flLay:=flLay;
      TLayReflect(ptrNewLay^).Objects:=nil;
      TLayReflect(ptrNewLay^).ObjectsCount:=0;
      Pointer(ptrptrLay^):=ptrNewLay;
      end
     else
      ptrNewLay:=Pointer(ptrptrLay^);
    ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
    //.
    Objects:=nil;
    ValidObjectsCount:=0;
    ptrLast:=@Objects;
    for J:=0 to ObjectsCount-1 do begin
      asm
         //. get ptrObj
         PUSH ESI
         MOV ESI,DataPtr
         CLD
         LODSD
         MOV ptrObj,EAX
         MOV DataPtr,ESI
         POP ESI
      end;
      if (NOT flSkipObjects)
       then
        if (ptrObj <> ptrLastObj)
         then begin
          InsertObj(ptrObj);
          ptrLastObj:=ptrObj;
          end
         else ProcessObjDetails(ptrObj, ptrptrLay);
      end;
    if (Objects <> nil)
     then begin
      TItemLayReflect(ptrLast^).ptrNext:=TLayReflect(ptrNewLay^).Objects;
      TLayReflect(ptrNewLay^).Objects:=Objects;
      Inc(TLayReflect(ptrNewLay^).ObjectsCount,ValidObjectsCount);
      //.
      Inc(NewLaysObjectsCount,ValidObjectsCount);
      end;
    end;
  except
    ptrDumpLay:=NewLays;
    NewLays:=nil;
    //. remove incomplete new lays
    TDeletingDump.ForceDelete(Pointer(@ptrDumpLay));
    //.
    Raise; //. =>
    end;
  //. change reflecting lays tree
  Lays:=NewLays;
  LaysObjectsCount:=NewLaysObjectsCount;
  //. objects data getting from remote server
  if (NewLays <> nil)
   then begin
    //.
    ///? try
    ObjPointersCount:=NewLaysObjectsCount;
    ptrPointersLay:=NewLays;
    ptrPointersLayItem:=TLayReflect(ptrPointersLay^).Objects;
    while (ObjPointersCount > 0) do begin
      //. objects reading and placing into the local memory
      GetObjectsPortion(ptrPointersLay,ptrPointersLayItem, ObjPointersCount);
      end;
    (* ///?
    finally
    //. update lays objects lay info
    Lay:=0;
    SubLay:=0;
    ptrNewLay:=NewLays;
    while (ptrNewLay <> nil) do with TLayReflect(ptrNewLay^) do begin
      ptrLayItem:=Objects;
      while (ptrLayItem <> nil) do with TItemLayReflect(ptrLayItem^) do begin
        if (NOT Obj_IsNotCached(ptrObject) AND (Obj_idType(ptrObject) <> idTLay2DVisualization)) then ObjectsContextRegistry.ObjSetLayInfo(ptrObject,Lay,SubLay);
        //. next item
        ptrLayItem:=ptrNext;
        end;
      //. next
      ptrNewLay:=ptrNext;
      if (ptrNewLay = nil) then Break; //. >
      //.
      if (TLayReflect(ptrNewLay^).flLay)
       then begin
        Inc(Lay);
        SubLay:=0;
        end
       else Inc(SubLay);
      end;
    end;
    *)
  end;
  end;

  function VisualizationUserData_Get(const idType: integer; const id: integer): TByteArray;
  var
    Idx: integer;
    DataSize: integer;
    TID: Word;
    TS,TSI: integer;
    CID: Int64;
    CS: Word;
  begin
  Result:=nil;
  DataSize:=Length(VisualizationUserData);
  Idx:=0;
  repeat
    TID:=Word(Pointer(@VisualizationUserData[Idx])^); Inc(Idx,SizeOf(TID));
    TS:=Integer(Pointer(@VisualizationUserData[Idx])^); Inc(Idx,SizeOf(TS));
    if (TID = idType)
     then begin
      TSI:=Idx+TS;
      repeat
        CID:=Int64(Pointer(@VisualizationUserData[Idx])^); Inc(Idx,SizeOf(CID));
        CS:=Word(Pointer(@VisualizationUserData[Idx])^); Inc(Idx,SizeOf(CS));
        if (CID = id)
         then begin
          SetLength(Result,CS);
          if (CS > 0) then Move(Pointer(@VisualizationUserData[Idx])^,Pointer(@Result[0])^,CS);
          //.
          Exit; //. ->
          end;
        Inc(Idx,CS);
      until (Idx >= TSI);
      Exit; //. ->
      end;
    Inc(Idx,TS);
  until (Idx >= DataSize);
  end;

  function Obj_Filled(const Obj: TSpaceObj): boolean;
  begin
  with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
  try
  Result:=ContainerFilled;
  finally
  Release;
  end;
  end;

  procedure Obj_PrepareFigures(const ptrObject: TPtr; pWindowRefl: TWindow;  pFigureWinRefl,pAdditiveFigureWinRefl: TFigureWinRefl; const ptrWindowFilledFlag: pointer = nil);
  var
    I: integer;

    procedure TreatePoint(const RW: TReflectionWindowStrucEx; X,Y: Extended);
    var
      QdA2: Extended;
      X_C,X_QdC,X_A1,X_QdB2: Extended;
      Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
      Node: TNode;
    begin
    with RW do begin
    X:=X*cfTransMeter;
    Y:=Y*cfTransMeter;
    QdA2:=sqr(X-X0)+sqr(Y-Y0);

    X_QdC:=sqr(X1-X0)+sqr(Y1-Y0);
    X_C:=Sqrt(X_QdC);
    X_QdB2:=sqr(X-X1)+sqr(Y-Y1);
    X_A1:=(X_QdC-X_QdB2+QdA2)/(2*X_C);

    Y_QdC:=sqr(X3-X0)+sqr(Y3-Y0);
    Y_C:=Sqrt(Y_QdC);
    Y_QdB2:=sqr(X-X3)+sqr(Y-Y3);
    Y_A1:=(Y_QdC-Y_QdB2+QdA2)/(2*Y_C);

    Node.X:=Xmn+X_A1/X_C*(Xmx-Xmn);
    Node.Y:=Ymn+Y_A1/Y_C*(Ymx-Ymn);

    pFigureWinRefl.Insert(Node)
    end;
    end;

    procedure TreatePointAs3D(const RW: TReflectionWindowStrucEx; X,Y: Extended);
    var
      X_A,X_B,X_C,X_D: Extended;
      Y_A,Y_B,Y_C,Y_D: Extended;
      XC,YC,diffXCX0,diffYCY0,X_L,Y_L: Extended;
      Node: TNode;
    begin
    with RW do begin
    X:=X*cfTransMeter;
    Y:=Y*cfTransMeter;

    X_A:=Y1-Y0;X_B:=X0-X1;X_D:=-(X0*X_A+Y0*X_B);
    Y_A:=Y3-Y0;Y_B:=X0-X3;Y_D:=-(X0*Y_A+Y0*Y_B);
    XC:=(Y_A*X+Y_B*(Y+X_D/X_B))/(Y_A-(X_A*Y_B/X_B));
    diffXCX0:=XC-X0;
    if X_B <> 0
     then begin
      YC:=-(X_A*XC+X_D)/X_B;
      diffYCY0:=YC-Y0;
      X_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
      if (((-X_B) > 0) AND ((diffXCX0) < 0)) OR (((-X_B) < 0) AND ((diffXCX0) > 0)) then X_L:=-X_L;
      end
     else begin
      YC:=(Y_B*Y+Y_A*(X+X_D/X_A))/(Y_B-(X_B*Y_A/X_A));
      diffYCY0:=YC-Y0;
      X_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
      if ((X_A > 0) AND ((diffYCY0) < 0)) OR ((X_A < 0) AND ((diffYCY0) > 0)) then X_L:=-X_L;
      end;
    XC:=(X_A*X+X_B*(Y+Y_D/Y_B))/(X_A-(Y_A*X_B/Y_B));
    diffXCX0:=XC-X0;
    if (Y_B <> 0)
     then begin
      YC:=-(Y_A*XC+Y_D)/Y_B;
      diffYCY0:=YC-Y0;
      Y_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
      if (((-Y_B) > 0) AND ((diffXCX0) < 0)) OR (((-Y_B) < 0) AND ((diffXCX0) > 0)) then Y_L:=-Y_L;
      end
     else begin
      YC:=(X_B*Y+X_A*(X+Y_D/Y_A))/(X_B-(Y_B*X_A/Y_A));
      diffYCY0:=YC-Y0;
      Y_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
      if ((Y_A > 0) AND ((diffYCY0) < 0)) OR ((Y_A < 0) AND ((diffYCY0) > 0)) then Y_L:=-Y_L;
      end;

    Node.X:=Xmn+X_L/Sqrt(sqr(X_A)+sqr(X_B))*(Xmx-Xmn);
    Node.Y:=Ymn+Y_L/Sqrt(sqr(Y_A)+sqr(Y_B))*(Ymx-Ymn);

    pFigureWinRefl.Insert(Node)
    end;
    end;

  var
    Obj: TSpaceObj;
    ptrPoint: TPtr;
    Point: TPoint;

    ptrOwnerObj: TPtr;

  var
    CurPoint: word;
    PenColor: TColor;
    PenStyle: TPenStyle;
    PenWidth: integer;
    FWR_flWindowFilled,AFWR_flWindowFilled: boolean;
  begin
  Lock.Enter;
  try
  ReadObj(Obj,SizeOf(TSpaceObj), ptrObject);
  with pFigureWinRefl do begin
  Clear;
  ptrObj:=ptrObject;
  idTObj:=Obj.idTObj;
  idObj:=Obj.idObj;
  flagLoop:=Obj.flagLoop;
  Color:=Obj.Color;
  flagFill:=Obj.flagFill;
  ColorFill:=Obj.ColorFill;
  Width:=Obj.Width;
  flSelected:=true;
  end;
  pAdditiveFigureWinRefl.Clear;
  ptrPoint:=Obj.ptrFirstPoint;
  CurPoint:=0;
  while (ptrPoint <> nilPtr) do begin
    ReadObj(Point,SizeOf(Point), ptrPoint);
    TreatePoint(RW, Point.X,Point.Y);
    ptrPoint:=Point.ptrNextObj;
    Inc(CurPoint);
    end;
  finally
  Lock.Leave;
  end;
  FWR_flWindowFilled:=false;
  AFWR_flWindowFilled:=false;
  if (Obj.Width > 0)
   then with pAdditiveFigureWinRefl do begin
    Assign(pFigureWinRefl);
    if (ValidateAsPolyLine(ReflectionWindow.Scale))
     then begin
      AttractToLimits(pWindowRefl, @AFWR_flWindowFilled);
      Optimize();
      end;
    end;
  pFigureWinRefl.AttractToLimits(pWindowRefl, @FWR_flWindowFilled);
  pFigureWinRefl.Optimize();
  if (ptrWindowFilledFlag <> nil) then Boolean(ptrWindowFilledFlag^):=(AFWR_flWindowFilled OR FWR_flWindowFilled);
  end;

  procedure Obj_FigureReflect(const pFigureWinRefl,pAdditiveFigureWinRefl: TFigureWinRefl; pAttractionWindow: TWindow; pCanvas: TCanvas; const flPolylineDashing: boolean; var Obj_Window: TObjWinRefl);
  var
    I: word;
    BS: TBrushStyle;

    procedure Obj_Show;
    begin
    with pCanvas.Pen do begin
    Color:=pFigureWinRefl.Color;
    Style:=psSolid;
    Width:=1;
    end;
    if (pFigureWinRefl.CountScreenNodes > 0)
     then with pFigureWinRefl do begin
      if (flagLoop)
       then begin
        if (flagFill)
         then begin
          if (ColorFill <> Graphics.clNone)
           then begin
            pCanvas.Brush.Color:=ColorFill;
            pCanvas.Polygon(Slice(ScreenNodes, CountScreenNodes));
            end;
          end
         else begin
          pCanvas.PolyLine(Slice(ScreenNodes, CountScreenNodes));
          end;
        end
       else begin
        if (pAdditiveFigureWinRefl.CountScreenNodes = 0)
         then with pCanvas do begin
          Pen.Width:=1;
          PolyLine(Slice(ScreenNodes, CountScreenNodes));
          end;
        end;
      end;
    //.
    if (pAdditiveFigureWinRefl.CountScreenNodes > 0)
     then with pAdditiveFigureWinRefl do begin
      pCanvas.Pen.Width:=1;
      if (ColorFill <> Graphics.clNone)
       then begin
        pCanvas.Brush.Color:=ColorFill;
        pCanvas.Polygon(Slice(ScreenNodes, CountScreenNodes));
        end;
      end;
    end;

  var
    SavePenStyle: TPenStyle;
    SaveBrushStyle: TBrushStyle;
    ReflectResult: boolean;
  begin
  with Obj_Window do
  if (((Xmn = 0) AND (Xmx = Xmn)) AND ((Ymn = 0) AND (Ymx = Ymn)))
   then begin //. calculating Min-Max
    if pFigureWinRefl.CountScreenNodes > 0
     then with pFigureWinRefl do begin
      Xmn:=ScreenNodes[0].X; Ymn:=ScreenNodes[0].Y;
      Xmx:=Xmn; Ymx:=Ymn;
      for I:=1 to CountScreenNodes-1 do begin
        if ScreenNodes[I].X < Xmn
         then
          Xmn:=ScreenNodes[I].X
         else
          if ScreenNodes[I].X > Xmx
           then Xmx:=ScreenNodes[I].X;
        if ScreenNodes[I].Y < Ymn
         then
          Ymn:=ScreenNodes[I].Y
         else
          if ScreenNodes[I].Y > Ymx
           then Ymx:=ScreenNodes[I].Y;
        end;
      if pAdditiveFigureWinRefl.CountScreenNodes > 0
       then with pAdditiveFigureWinRefl do begin
        for I:=0 to CountScreenNodes-1 do begin
          if ScreenNodes[I].X < Xmn
           then
            Xmn:=ScreenNodes[I].X
           else
            if ScreenNodes[I].X > Xmx
             then Xmx:=ScreenNodes[I].X;
          if ScreenNodes[I].Y < Ymn
           then
            Ymn:=ScreenNodes[I].Y
           else
            if ScreenNodes[I].Y > Ymx
             then Ymx:=ScreenNodes[I].Y;
          end;
        end;
      end
     else
      if pAdditiveFigureWinRefl.CountScreenNodes > 0
       then with pAdditiveFigureWinRefl do begin
        Xmn:=ScreenNodes[0].X; Ymn:=ScreenNodes[0].Y;
        Xmx:=Xmn; Ymx:=Ymn;
        for I:=1 to CountScreenNodes-1 do begin
          if ScreenNodes[I].X < Xmn
           then
            Xmn:=ScreenNodes[I].X
           else
            if ScreenNodes[I].X > Xmx
             then Xmx:=ScreenNodes[I].X;
          if ScreenNodes[I].Y < Ymn
           then
            Ymn:=ScreenNodes[I].Y
           else
            if ScreenNodes[I].Y > Ymx
             then Ymx:=ScreenNodes[I].Y;
          end;
        end
       else begin
        Xmn:=-1; Ymn:=-1;
        Xmx:=Xmn; Ymx:=Ymn;
        end;
    end;
  //. do reflect
  pCanvas.Lock();
  try
  try
  with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(pFigureWinRefl.idTObj,pFigureWinRefl.idObj)) do
  try
  if (Length(VisualizationUserData) > 0)
   then UserData:=VisualizationUserData_Get(idTObj,idObj)
   else UserData:=nil;
  //. reflecting object
  ReflectResult:=ReflectOnCanvas(pFigureWinRefl,pAdditiveFigureWinRefl,ReflectionWindow,WindowRefl,pCanvas)
  finally
  Release();
  end;
  except
    On E: ETypeNotFound do ReflectResult:=false;
    On E: ETypeDisabled do ReflectResult:=false;
    On E: Exception do begin
      ReflectResult:=false;
      EventLog.WriteMinorEvent('ReflectingVisualization','Error during reflecting visualization (TypeID: '+IntToStr(pFigureWinRefl.idTObj)+',ID: '+IntToStr(pFigureWinRefl.idObj)+')',E.Message);
      end;
    end;
  //.
  if (NOT ReflectResult) then Obj_Show();
  finally
  pCanvas.UnLock();
  end;
  end;

  procedure Bitmap_Init();
  begin
  Bitmap.Canvas.Lock();
  try
  Bitmap.Canvas.Brush.Color:=clEmptySpace;
  Bitmap.Canvas.Rectangle(-1,-1,Bitmap.Width+1,Bitmap.Height+1);
  finally
  Bitmap.Canvas.UnLock();
  end;
  end;

  procedure Bitmap_ShowMarkOfCenter();

    procedure PutLine(const Canvas: TCanvas; const Xs0,Ys0, Xs1,Ys1: integer);
    begin
    with Canvas do begin
    MoveTo(Xs0,Ys0);
    LineTo(Xs1,Ys1);
    end;
    end;

  const
    Length = 15;
  var
    Xmd,Ymd: integer;
  begin
  Bitmap.Canvas.Lock;
  try
  Xmd:=(Bitmap.Width SHR 1);
  Ymd:=(Bitmap.Height SHR 1);
  with Bitmap.Canvas do begin
  Pen.Style:=psSolid;
  Pen.Width:=2;
  //.
  Pen.Color:=clWhite;
  PutLine(Bitmap.Canvas, Xmd,Ymd+1,Xmd,Ymd+1+Length);
  PutLine(Bitmap.Canvas, Xmd-1,Ymd,Xmd-1-Length,Ymd);
  PutLine(Bitmap.Canvas, Xmd,Ymd-1,Xmd,Ymd-1-Length);
  PutLine(Bitmap.Canvas, Xmd+1,Ymd,Xmd+1+Length,Ymd);
  end;
  finally
  Bitmap.Canvas.UnLock;
  end;
  end;

  procedure ProcessForBitmap;
  var
    DynamicHints: TDynamicHints;
    I: integer;
    ptrReflLay: pointer;
    FirstVisibleLay: integer;
    LayNumber: integer;
    flWindowFilled: boolean;
    ptrItem: pointer;
    flClipping: boolean;
    flClipVisible: boolean;
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    ClippingRegion,Rgn: HRGN;
    Xhint,Yhint: Extended;
    idHINTVisualization: integer;
  begin
  //. lays validation for object that filled all window
  FirstVisibleLay:=0;
  {///- not needed speed penalty on huge amount of objects
  LayNumber:=0;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do begin
      with TItemLayReflect(ptrItem^) do begin
      ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
      if (Obj_IsCached(Obj) AND Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval))
       then begin
        if (Obj.flagLoop AND Obj.flagFill)
         then begin
          flWindowFilled:=false;
          //. process clipping
          flClipping:=false;
          if (Obj.Color = Graphics.clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = Graphics.clNone))
               then begin
                flClipping:=true;
                Obj_PrepareFigures(ptrOwnerObj, WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @flWindowFilled);
                end;
              //.
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            end;
          //.
          if (NOT flClipping) then Obj_PrepareFigures(ptrObject, WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @flWindowFilled);
          //.
          if ((NOT (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = Graphics.clNone))) AND flWindowFilled AND Obj_Filled(Obj))
           then begin
            FirstVisibleLay:=LayNumber;
            Break; //. >
            end;
          end;
        end;
      end;
      //. got to next next
      ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
      end;
      //.
      Inc(LayNumber);
      ptrReflLay:=ptrNext;
      end;}
  //. reflecting
  if ((DynamicHintDataVersion >= 0) AND (DynamicHintVisibility > 0.0)) 
   then begin
    DynamicHints:=TDynamicHints.Create(Self);
    DynamicHints.VisibleFactor:=DynamicHintVisibility;
    end
   else DynamicHints:=nil;
  try
  Bitmap.Canvas.Lock();
  try
  Bitmap_Init();
  //.
  LayNumber:=0;
  ptrReflLay:=Lays;
  while (ptrReflLay <> nil) do with TLayReflect(ptrReflLay^) do begin
    if (LayNumber >= FirstVisibleLay)
     then begin
      //. process a layer objects
      ptrItem:=Objects;
      while ptrItem <> nil do begin
        with TItemLayReflect(ptrItem^) do begin
        ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
        if (Obj_IsCached(Obj) AND Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval))
         then begin
          //. clipping if necessary
          flClipping:=false;
          flClipVisible:=false;
          try
          if (Obj.Color = Graphics.clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = Graphics.clNone))
               then begin
                flClipping:=true;
                Obj_PrepareFigures(ptrOwnerObj, WindowRefl, FigureWinRefl,AdditiveFigureWinRefl);
                if (FigureWinRefl.CountScreenNodes > 0)
                 then
                  if (NOT flClipVisible)
                   then begin
                    ClippingRegion:=CreatePolygonRgn(FigureWinRefl.ScreenNodes, FigureWinRefl.CountScreenNodes, ALTERNATE);
                    flClipVisible:=true;
                    end
                   else begin
                    Rgn:=CreatePolygonRgn(FigureWinRefl.ScreenNodes, FigureWinRefl.CountScreenNodes, ALTERNATE);
                    CombineRgn(ClippingRegion, ClippingRegion,Rgn, RGN_XOR);
                    DeleteObject(Rgn);
                    end;
                end;
              //.
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            if (flClipVisible)
             then begin
              SelectClipRgn(Bitmap.Canvas.Handle, ClippingRegion);
              end;
            end;
          //.
          if (NOT flClipping OR flClipVisible)
           then begin
            Obj_PrepareFigures(ptrObject, WindowRefl, FigureWinRefl,AdditiveFigureWinRefl);
            if (AdditiveFigureWinRefl.CountScreenNodes > 0) OR (FigureWinRefl.CountScreenNodes > 0)
             then begin
              //. reflecting obj ...
              Obj_FigureReflect(FigureWinRefl,AdditiveFigureWinRefl,WindowRefl, Bitmap.Canvas,false, Window);
              //.
              if (DynamicHints <> nil)
               then begin
                if (FigureWinRefl.idTObj = idTHINTVisualization)
                 then begin
                  if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint)) then DynamicHints.AddItemForShow(ptrObject,FigureWinRefl.idObj,LayNumber, Xhint,Yhint,((Window.Xmx-Window.Xmn)*(Window.Ymx-Window.Ymn)));
                  end else begin
                   if (FigureWinRefl.idTObj = idTCoVisualization)
                    then begin
                     if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint) AND CoVisualization_GetOwnSpaceHINTVisualizationLocally(FigureWinRefl.idObj,{out} idHINTVisualization)) then DynamicHints.AddItemForShow(ptrObject,idHINTVisualization,LayNumber, Xhint,Yhint,((Window.Xmx-Window.Xmn)*(Window.Ymx-Window.Ymn)));
                     end;
                   //. draw inplace hint
                   TReflecting.Obj_ComponentContext_DrawHint(Self,FigureWinRefl,AdditiveFigureWinRefl,Bitmap.Canvas);
                   end;
                end;
              end;
            end;
          finally
          //. restore clipping
          SelectClipRgn(Bitmap.Canvas.Handle, 0);
          if (flClipVisible) then DeleteObject(ClippingRegion);
          end;
          end;
        end;
        //. go to next item
        ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
        end;
      end;
    //.
    Inc(LayNumber);
    ptrReflLay:=ptrNext;
    end;
  //. show dynamic hint objects
  if (DynamicHints <> nil)
   then begin
    DynamicHints.FormItems(Bitmap,false);
    case DynamicHintDataVersion of
    -1: ; //. no hint data
    0: DynamicHints.ShowItems(Bitmap); //. hints are embedded into image
    1: DynamicHints.GetItemsDataV1({out} DynamicHintData);
    else
      Raise Exception.Create('unknown dynamic hint data version, Version: '+IntToStr(DynamicHintDataVersion)); //. =>
    end;
    end;
  finally
  Bitmap.Canvas.UnLock();
  end;
  finally
  DynamicHints.Free();
  end;
  end;

  procedure ProcessForHints;
  var
    Bitmap: TBitmap;
    DynamicHints: TDynamicHints;
    I: integer;
    ptrReflLay: pointer;
    FirstVisibleLay: integer;
    LayNumber: integer;
    flWindowFilled: boolean;
    ptrItem: pointer;
    flClipping: boolean;
    flClipVisible: boolean;
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    ClippingRegion,Rgn: HRGN;
    Xhint,Yhint: Extended;
    idHINTVisualization: integer;
  begin
  Bitmap:=TBitmap.Create();
  Bitmap.Canvas.Lock();
  try
  //. lays validation for object that filled all window
  FirstVisibleLay:=0;
  {///- not needed speed penalty on huge amount of objects
  LayNumber:=0;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do begin
      with TItemLayReflect(ptrItem^) do begin
      ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
      if (Obj_IsCached(Obj) AND Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval))
       then begin
        if (Obj.flagLoop AND Obj.flagFill)
         then begin
          flWindowFilled:=false;
          //. process clipping
          flClipping:=false;
          if (Obj.Color = Graphics.clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = Graphics.clNone))
               then begin
                flClipping:=true;
                Obj_PrepareFigures(ptrOwnerObj, WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @flWindowFilled);
                end;
              //.
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            end;
          //.
          if (NOT flClipping) then Obj_PrepareFigures(ptrObject, WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @flWindowFilled);
          //.
          if ((NOT (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = Graphics.clNone))) AND flWindowFilled AND Obj_Filled(Obj))
           then begin
            FirstVisibleLay:=LayNumber;
            Break; //. >
            end;
          end;
        end;
      end;
      //. got to next next
      ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
      end;
      //.
      Inc(LayNumber);
      ptrReflLay:=ptrNext;
      end;}
  //. reflecting
  if (DynamicHintVisibility > 0.0)
   then begin
    DynamicHints:=TDynamicHints.Create(Self);
    DynamicHints.VisibleFactor:=DynamicHintVisibility;
    end
   else DynamicHints:=nil;
  try
  LayNumber:=0;
  ptrReflLay:=Lays;
  while (ptrReflLay <> nil) do with TLayReflect(ptrReflLay^) do begin
    if (LayNumber >= FirstVisibleLay)
     then begin
      //. process a layer objects
      ptrItem:=Objects;
      while ptrItem <> nil do begin
        with TItemLayReflect(ptrItem^) do begin
        ReadObjLocalStorage(Obj,SizeOf(Obj),ptrObject);
        if (Obj_IsCached(Obj) AND Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval))
         then begin
          //. clipping if necessary
          ///- flClipping:=false;
          ///- flClipVisible:=false;
          try
          (*///- if (Obj.Color = Graphics.clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = Graphics.clNone))
               then begin
                flClipping:=true;
                Obj_PrepareFigures(ptrOwnerObj, WindowRefl, FigureWinRefl,AdditiveFigureWinRefl);
                if (FigureWinRefl.CountScreenNodes > 0)
                 then
                  if (NOT flClipVisible)
                   then begin
                    ClippingRegion:=CreatePolygonRgn(FigureWinRefl.ScreenNodes, FigureWinRefl.CountScreenNodes, ALTERNATE);
                    flClipVisible:=true;
                    end
                   else begin
                    Rgn:=CreatePolygonRgn(FigureWinRefl.ScreenNodes, FigureWinRefl.CountScreenNodes, ALTERNATE);
                    CombineRgn(ClippingRegion, ClippingRegion,Rgn, RGN_XOR);
                    DeleteObject(Rgn);
                    end;
                end;
              //.
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            if (flClipVisible)
             then begin
              SelectClipRgn(Bitmap.Canvas.Handle, ClippingRegion);
              end;}
            end;*)
          //.
          if (NOT flClipping OR flClipVisible)
           then begin
            Obj_PrepareFigures(ptrObject, WindowRefl, FigureWinRefl,AdditiveFigureWinRefl);
            if (AdditiveFigureWinRefl.CountScreenNodes > 0) OR (FigureWinRefl.CountScreenNodes > 0)
             then begin
              //. reflecting obj ...
              ///- Obj_FigureReflect(FigureWinRefl,AdditiveFigureWinRefl,WindowRefl, Bitmap.Canvas,false, Window);
              //.
              if (DynamicHints <> nil)
               then begin
                if (FigureWinRefl.idTObj = idTHINTVisualization)
                 then begin
                  if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint)) then DynamicHints.AddItemForShow(ptrObject,FigureWinRefl.idObj,LayNumber, Xhint,Yhint,((Window.Xmx-Window.Xmn)*(Window.Ymx-Window.Ymn)));
                  end else begin
                   if (FigureWinRefl.idTObj = idTCoVisualization)
                    then begin
                     if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint) AND CoVisualization_GetOwnSpaceHINTVisualizationLocally(FigureWinRefl.idObj,{out} idHINTVisualization)) then DynamicHints.AddItemForShow(ptrObject,idHINTVisualization,LayNumber, Xhint,Yhint,((Window.Xmx-Window.Xmn)*(Window.Ymx-Window.Ymn)));
                     end;
                   //. draw inplace hint
                   ///- TReflecting.Obj_ComponentContext_DrawHint(Self,FigureWinRefl,AdditiveFigureWinRefl,Bitmap.Canvas);
                   end;
                end;
              end;
            end;
          finally
          //. restore clipping
          ///- SelectClipRgn(Bitmap.Canvas.Handle, 0);
          ///- if (flClipVisible) then DeleteObject(ClippingRegion);
          end;
          end;
        end;
        //. go to next item
        ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
        end;
      end;
    //.
    Inc(LayNumber);
    ptrReflLay:=ptrNext;
    end;
  //. show dynamic hint objects
  if (DynamicHints <> nil)
   then begin
    DynamicHints.FormItems(Bitmap,false);
    case DynamicHintDataVersion of
    1: DynamicHints.GetItemsDataV1({out} DynamicHintData);
    else
      Raise Exception.Create('unknown dynamic hint data version, Version: '+IntToStr(DynamicHintDataVersion)); //. =>
    end;
    end;
  finally
  DynamicHints.Free();
  end;
  finally
  Bitmap.Canvas.Unlock();
  Bitmap.Destroy();
  end;
  end;


begin
DynamicHintData:=nil;
try
if (NOT ((pWidth <= 2500) AND (pHeight <= 1500))) then Raise Exception.Create('bitmap is too big'); //. =>
{$IFDEF SpaceWindowReflectingTesting}
if ((fmProxySpaceSpaceWindowReflectingTesting <> nil) AND (fmProxySpaceSpaceWindowReflectingTesting.ProcedureParamsRecorder <> nil))
 then fmProxySpaceSpaceWindowReflectingTesting.ProcedureParamsRecorder.AddParams(pUserName,pUserPassword,  X0,Y0, X1,Y1, X2,Y2, X3,Y3,  HidedLaysArray, VisibleFactor, DynamicHintVisibility, Bitmap);
{$ENDIF}
//.
{///-
WaitForSingleObject(User_SpaceWindow_Semaphore,INFINITE);
try}
//. get reflection window parameters
RW.X0:=X0; RW.Y0:=Y0;
RW.X1:=X1; RW.Y1:=Y1;
RW.X2:=X2; RW.Y2:=Y2;
RW.X3:=X3; RW.Y3:=Y3;
RW.Xmn:=0; RW.Ymn:=0;
RW.Xmx:=pWidth; RW.Ymx:=pHeight;
ReflectionWindow:=TReflectionWindow.Create(Self,RW);
try
ReflectionWindow.VisibleFactor:=VisibleFactor;
ReflectionWindow.DynamicHints_VisibleFactor:=DynamicHintVisibility;
ReflectionWindow.InvisibleLayNumbersArray:=HidedLaysArray;
//.
ReflectionWindow.Normalize();
//.
ReflectionWindow.GetWindow(false,RW);
//.
WindowRefl:=TWindow.Create(RW.Xmn-3,RW.Ymn-3,RW.Xmx+3,RW.Ymx+3);
try
FigureWinRefl:=TFigureWinRefl.Create;
AdditiveFigureWinRefl:=TFigureWinRefl.Create;
try
//.
Lays:=nil;
try
PrepareLays();
if (Bitmap <> nil)
 then ProcessForBitmap()
 else ProcessForHints();
finally
TDeletingDump.ForceDelete(Pointer(@Lays));
end;
finally
AdditiveFigureWinRefl.Destroy;
FigureWinRefl.Destroy;
end;
finally
WindowRefl.Destroy;
end;
finally
ReflectionWindow.Destroy;
end;
{///-
finally
ReleaseSemaphore(User_SpaceWindow_Semaphore,1,nil);
end;}
except
  On E: Exception do begin
    EventLog.WriteMinorEvent('User_ReflectSpaceWindowOnBitmap','Processing error',E.Message);
    Raise; //. =>
    end;
  end;
end;

function TProxySpace.User_SpaceWindowBitmap_ObjectAtPosition(const pUserName: WideString; const pUserPassword: WideString; const X0,Y0, X1,Y1, X2,Y2, X3,Y3: TCrd; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const DynamicHintVisibility: double; const ActualityInterval: TComponentActualityInterval; const Bitmap_Width,Bitmap_Height: double; const Bitmap_X,Bitmap_Y: double): TPtr;
var
  RW: TReflectionWindowStrucEx;
  ReflectionWindow: TReflectionWindow;
  WindowRefl: TWindow;
  FigureWinRefl: TFigureWinRefl;
  AdditiveFigureWinRefl: TFigureWinRefl;
  Lays: pointer;
  LaysObjectsCount: integer;

  //. all nested routines below are transferred from Reflecting.inc file

  procedure PrepareLays;
  const
    SizeOfTSpaceObj = SizeOf(TSpaceObj);
    SizeOfTPoint = SizeOf(TPoint);
  var
    RW: TReflectionWindowStrucEx;
    RW_Scale: Extended;
    RW_VisibleFactor: double;
    GlobalSpaceManager: ISpaceManager;
    GlobalSpaceRemoteManager: ISpaceRemoteManager;
    InvisibleLayNumbersArray: TByteArray;
    I,J: integer;
    BA: TByteArray;
    DataPtr: pointer;
    NewLays: pointer;
    NewLaysObjectsCount: integer;
    LaysCount: word;
    LayLevel: integer;
    flSkipObjects: boolean;
    ptrLastObj: TPtr;
    Objects: pointer;
    flLay: boolean;
    ValidObjectsCount,ObjectsCount: integer;
    ptrLast: pointer;
    ptrObj: TPtr;
    ptrptrLay: pointer;

    ObjPointersCount: longword;
    ptrPointersLay,ptrPointersLayItem: pointer;
    Lay,SubLay: integer;
    ptrLayItem: pointer;

    ptrNewLay: pointer;
    ptrFirstLay: pointer;
    ptrLastLay: pointer;
    ptrDumpLay,DumpLay_ptrptrNextLay: pointer;


      procedure PrepareStructuredObjects(DataPtr: pointer);
      const
        ObjPointersMaxSize = 100;

        procedure ProcessObjectPortion(const ObjPointers: TByteArray; const PointersCount: integer);

          procedure ProcessObjDetails(const ptrObj: TPtr; var StructuresPtr: pointer);
          var
            ptrDetail: TPtr;
            DetailSubDetailsCount: word;
            ptrptrOwnerObj: TPtr;
            I: integer;
          begin
          asm
             CLD
             PUSH ESI
             PUSH EDI
             MOV EDI,StructuresPtr
             MOV ESI,[EDI]
             LODSW
             MOV DetailSubDetailsCount,AX
             MOV [EDI],ESI
             POP EDI
             POP ESI
          end;
          ptrptrOwnerObj:=ptrObj+ofsptrListOwnerObj;
          for I:=0 to DetailSubDetailsCount-1 do begin
            asm
               CLD
               PUSH ESI
               PUSH EDI
               MOV EDI,StructuresPtr
               MOV ESI,[EDI]
               LODSD
               MOV ptrDetail,EAX
               MOV [EDI],ESI
               POP EDI
               POP ESI
            end;
            WriteObjLocalStorage(ptrDetail,SizeOf(ptrDetail),ptrptrOwnerObj);
            ptrptrOwnerObj:=ptrDetail;
            //. process sub-details
            ProcessObjDetails(ptrDetail, StructuresPtr);
            end;
          ptrDetail:=nilPtr;
          WriteObjLocalStorage(ptrDetail,SizeOf(ptrDetail),ptrptrOwnerObj);
          end;

        var
          ObjPointersPtr: pointer;
          Structures: TByteArray;
          StructuresPtr: pointer;
          I: integer;
          ptrObj: TPtr;
          ptrDetail: TPtr;
          ptrptrOwnerObj: TPtr;
        begin
        Structures:=GlobalSpaceManager.ReadObjectsStructures(pUserName,pUserPassword, ObjPointers,PointersCount);
        ObjPointersPtr:=@ObjPointers[0];
        StructuresPtr:=@Structures[0];
        Lock.Enter;
        try
        for I:=0 to PointersCount-1 do begin
          //. get ptrObj
          asm
             CLD
             PUSH ESI
             MOV ESI,ObjPointersPtr
             LODSD
             MOV ptrObj,EAX
             MOV ObjPointersPtr,ESI
             POP ESI
          end;
          //.
          if (StructuresPtr <> nil) 
           then ProcessObjDetails(ptrObj,StructuresPtr)
           else begin
            ptrptrOwnerObj:=ptrObj+ofsptrListOwnerObj;
            ptrDetail:=nilPtr;
            WriteObjLocalStorage(ptrDetail,SizeOf(ptrDetail),ptrptrOwnerObj);
            end;
          end;
        finally
        Lock.Leave;
        end;
        end;

      var
        ObjPointers: TByteArray;
        ObjPointersPtr: pointer;
        LaysCount: word;
        ptrObj: TPtr;
        ptrLastObj: TPtr;
        flLay: boolean;
        LayLevel: integer;
        ObjectsCount: integer;
        ValidPointersCount: integer;
        I,J: integer;
      begin
      SetLength(ObjPointers,ObjPointersMaxSize*SizeOf(TPtr));
      ObjPointersPtr:=@ObjPointers[0];
      asm
         PUSH ESI
         MOV ESI,DataPtr
         CLD
         LODSW
         MOV LaysCount,AX
         MOV DataPtr,ESI
         POP ESI
      end;
      LayLevel:=0;
      flSkipObjects:=false;
      ValidPointersCount:=0;
      for I:=0 to LaysCount-1 do begin
        //. lay processing
        ptrLastObj:=nilPtr;
        asm
           PUSH ESI
           MOV ESI,DataPtr
           CLD
           LODSD
           MOV ObjectsCount,EAX
           LODSB
           MOV flLay,AL
           MOV DataPtr,ESI
           POP ESI
        end;
        //.
        if flLay
         then begin
          flSkipObjects:=false; ///+TObjectReflectingCfg(Reflecting.Cfg).HidedLays.IsLayFoundByOrder(LayLevel);
          Inc(LayLevel);
          end;
        for J:=0 to ObjectsCount-1 do begin
          asm
             //. get ptrObj
             PUSH ESI
             MOV ESI,DataPtr
             CLD
             LODSD
             MOV ptrObj,EAX
             MOV DataPtr,ESI
             POP ESI
          end;
          if (NOT flSkipObjects)
           then
            if (ptrObj <> ptrLastObj)
             then ptrLastObj:=ptrObj
             else
              if (NOT Obj_StructureIsCached(ptrObj))
               then begin
                asm
                   PUSH EDI
                   MOV EAX,ptrObj
                   MOV EDI,ObjPointersPtr
                   CLD
                   STOSD
                   MOV ObjPointersPtr,EDI
                   POP EDI
                end;
                Inc(ValidPointersCount);
                if (ValidPointersCount >= ObjPointersMaxSize)
                 then begin
                  ProcessObjectPortion(ObjPointers,ValidPointersCount);
                  ObjPointersPtr:=@ObjPointers[0];
                  ValidPointersCount:=0;
                  end;
                end;
          end;
        end;
      if (ValidPointersCount > 0)
       then begin
        SetLength(ObjPointers,ValidPointersCount*SizeOf(TPtr));
        ProcessObjectPortion(ObjPointers,ValidPointersCount);
        end;
      end;

      procedure InsertObj(const ptrObj: TPtr);
      var
        ptrNew: pointer;
      begin
      GetMem(ptrNew,SizeOf(TItemLayReflect));
      with TItemLayReflect(ptrNew^) do begin
      ptrNext:=nil;
      ptrObject:=ptrObj;
      with Window do begin
      Xmn:=0; Ymn:=0;
      Xmx:=0; Ymx:=0;
      end;
      ObjUpdating:=nil;
      end;
      TItemLayReflect(ptrLast^).ptrNext:=ptrNew;
      ptrLast:=ptrNew;
      Inc(ValidObjectsCount);
      end;

      procedure ProcessObjDetails(const ptrObj: TPtr; ptrptrLay: pointer);
      var
        Obj: TSpaceObj;
        ptrOwnerObj: TPtr;
        ptrLay: pointer;
        Items: pointer;
        ValidObjectsCount: integer;
        ptrNew: pointer;
        ptrptrItem: pointer;
      begin
      //. processing details
      ReadObjLocalStorage(ptrOwnerObj,SizeOf(ptrOwnerObj),ptrObj+ofsptrListOwnerObj);
      if ((ptrOwnerObj <> 0) AND (ptrOwnerObj <> nilPtr))
       then begin
        if (Pointer(ptrptrLay^) = nil)
         then begin
          GetMem(ptrLay,SizeOf(TLayReflect));
          TLayReflect(ptrLay^).ptrNext:=nil;
          TLayReflect(ptrLay^).flLay:=false;
          TLayReflect(ptrLay^).Objects:=nil;
          TLayReflect(ptrLay^).ObjectsCount:=0;
          Pointer(ptrptrLay^):=ptrLay;
          end
         else ptrLay:=Pointer(ptrptrLay^);
        Items:=nil;
        ValidObjectsCount:=0;
        ptrptrItem:=@Items;
        repeat
          //. create new lay item
          GetMem(ptrNew,SizeOf(TItemLayReflect));
          with TItemLayReflect(ptrNew^) do begin
          ptrNext:=nil;
          ptrObject:=ptrOwnerObj;
          with Window do begin
          Xmn:=0; Ymn:=0;
          Xmx:=0; Ymx:=0;
          end;
          ObjUpdating:=nil;
          end;
          TItemLayReflect(ptrptrItem^).ptrNext:=ptrNew;
          ptrptrItem:=ptrNew;
          Inc(ValidObjectsCount);
          //.
          ProcessObjDetails(ptrOwnerObj, ptrLay);
          //. next detail
          ReadObjLocalStorage(ptrOwnerObj,SizeOf(ptrOwnerObj), ptrOwnerObj);
        until ((ptrOwnerObj = 0) OR (ptrOwnerObj = nilPtr));
        //.
        TItemLayReflect(ptrptrItem^).ptrNext:=TLayReflect(ptrLay^).Objects;
        TLayReflect(ptrLay^).Objects:=Items;
        Inc(TLayReflect(ptrLay^).ObjectsCount,ValidObjectsCount);
        Inc(NewLaysObjectsCount,ValidObjectsCount);
        end;
      end;

      procedure GetObjectsPortion(var ptrPointersLay,ptrPointersLayItem: pointer; var ObjPointersCount: longword);
      var
        ObjPointers: TByteArray;
        ptrPointersBuffer: pointer;
        ValidPointersCount: longword;
        ptrDist: pointer;
        I: integer;
        ptrObj,ptrObjAccessed: TPtr;
        Objects: TByteArray;
        ptrObjectsBuffer: pointer;
        ptrSrs: pointer;
        ptrObjPointer: pointer;
        Obj: TSpaceObj;
        ptrPoint: TPtr;
        Point: TPoint;

        function GetObjPointer(var ptrObj: TPtr): boolean;
        begin
        Result:=false;
        repeat
          while (ptrPointersLayItem = nil) do begin
            ptrPointersLay:=TLayReflect(ptrPointersLay^).ptrNext;
            //.
            if (ptrPointersLay = nil) then Exit; //. ->
            //.
            ptrPointersLayItem:=TLayReflect(ptrPointersLay^).Objects;
            end;
          ptrObj:=TItemLayReflect(ptrPointersLayItem^).ptrObject;
          Result:=(NOT Obj_IsCached(ptrObj));
          if (Result)
           then begin //. limiting on concurrent object caching
            Lock.Enter();
            try
            if (User_SpaceWindow_ObjectCaching_Counter >= User_SpaceWindow_CachingObjectsPortion)
             then begin
              Result:=false;
              Exit; //. ->
              end;
            Inc(User_SpaceWindow_ObjectCaching_Counter);
            finally
            Lock.Leave();
            if (NOT Result) then Sleep(20);
            end;
            end;
          //.
          Dec(ObjPointersCount);
          ptrPointersLayItem:=TItemLayReflect(ptrPointersLayItem^).ptrNext;
        until (Result);
        end;

      begin
      SetLength(ObjPointers,User_SpaceWindow_CachingObjectsPortion*SizeOf(TPtr));
      ptrPointersBuffer:=@ObjPointers[0];
      ptrDist:=ptrPointersBuffer;
      ValidPointersCount:=0;
      {///- deadlock case
      Lock.Enter(); //. !!! to avoid multiple TypeSystem items caching on concurrent function calling
      try}
      while (true) do begin
        if (NOT GetObjPointer(ptrObj)) then Break; //. >
        asm
           PUSH EDI
           MOV EAX,ptrObj
           MOV EDI,ptrDist
           CLD
           STOSD
           MOV ptrDist,EDI
           POP EDI
        end;
        Inc(ValidPointersCount);
        end;
      if (ValidPointersCount > 0)
       then
        try
        SetLength(ObjPointers,ValidPointersCount*SizeOf(TPtr));
        Objects:=GlobalSpaceManager.ReadObjects(pUserName,pUserPassword, ObjPointers,ValidPointersCount);
        ptrObjectsBuffer:=@Objects[0];
        //. cashing types system for incoming objects
        ptrSrs:=ptrObjectsBuffer;
        TTypesSystem(TypesSystem).Caching_Start();
        try
        for I:=0 to ValidPointersCount-1 do begin
          //. get object body
          asm
             PUSH ESI
             PUSH EDI
             MOV ESI,ptrSrs
             CLD
             LEA EDI,Obj
             MOV ECX,SizeOfTSpaceObj
             REP MOVSB
             MOV ptrSrs,ESI
             POP EDI
             POP ESI
          end;
          //. add object for cashing
          if Obj.idObj <> 0 then TTypesSystem(TypesSystem).Caching_AddObject(Obj.idTObj,Obj.idObj);
          //. skip points
          ptrPoint:=Obj.ptrFirstPoint;
          while ptrPoint <> nilPtr do begin
            //. get point
            asm
               PUSH ESI
               PUSH EDI
               MOV ESI,ptrSrs
               CLD
               LEA EDI,Point
               MOV ECX,SizeOfTPoint
               REP MOVSB
               MOV ptrSrs,ESI
               POP EDI
               POP ESI
            end;
            //. go to next point
            ptrPoint:=Point.ptrNextObj;
            end;
          end;
        //. release quota
        Lock.Enter();
        try
        Dec(User_SpaceWindow_ObjectCaching_Counter,ValidPointersCount);
        finally
        Lock.Leave();
        end;
        finally
        TTypesSystem(TypesSystem).Caching_Finish();
        end;
        //. write objects
        ptrPointersBuffer:=@ObjPointers[0];
        ptrObjPointer:=ptrPointersBuffer;
        ptrSrs:=ptrObjectsBuffer;
        Lock.Enter;
        try
        for I:=0 to ValidPointersCount-1 do begin
          //. get ptrObj
          asm
             CLD
             PUSH ESI
             MOV ESI,ptrObjPointer
             LODSD
             MOV ptrObj,EAX
             MOV ptrObjPointer,ESI
             POP ESI
          end;
          //. get object body
          asm
             PUSH ESI
             PUSH EDI
             MOV ESI,ptrSrs
             CLD
             LEA EDI,Obj
             MOV ECX,SizeOfTSpaceObj
             REP MOVSB
             MOV ptrSrs,ESI
             POP EDI
             POP ESI
          end;
          //. write body
          ptrObjAccessed:=ptrObj;
          WriteObjLocalStorage(Obj,SizeOf(Obj), ptrObj);
          ptrPoint:=Obj.ptrFirstPoint;
          while ptrPoint <> nilPtr do begin
            //. get point
            asm
               PUSH ESI
               PUSH EDI
               MOV ESI,ptrSrs
               CLD
               LEA EDI,Point
               MOV ECX,SizeOfTPoint
               REP MOVSB
               MOV ptrSrs,ESI
               POP EDI
               POP ESI
            end;
            //. write point
            WriteObjLocalStorage(Point,SizeOf(Point), ptrPoint);
            //. go to next point
            ptrPoint:=Point.ptrNextObj;
            end;
          //. process obj as accessed
          if (Obj.idTObj <> idTLay2DVisualization) then ObjectsContextRegistry.ObjAccessed(ptrObjAccessed);
          end;
        finally
        Lock.Leave;
        end;
        except
          Lock.Enter();
          try
          Dec(User_SpaceWindow_ObjectCaching_Counter,ValidPointersCount);
          finally
          Lock.Leave();
          end;
          //.
          Raise; //. =>
          end;
      {///- finally
      Lock.Leave();
      end;}
      end;

  begin
  with ReflectionWindow do begin
  Lock.Enter;
  try
  GetWindow(true, RW);
  RW_Scale:=_Scale;
  RW_VisibleFactor:=_VisibleFactor/sqr(_Scale);
  finally
  Lock.Leave;
  end;
  end;
  //.
  GlobalSpaceManager:=GetISpaceManager(SOAPServerURL);
  GlobalSpaceRemoteManager:=GetISpaceRemoteManager(SOAPServerURL);
  //. prepare invisible lays
  InvisibleLayNumbersArray:=HidedLaysArray;
  SystemTLay2DVisualization.AddInvisibleLaysToNumbersArray(RW_Scale,{ref} InvisibleLayNumbersArray);
  //. getting a objects visible in reflector window ...
  with RW do BA:=GlobalSpaceRemoteManager.GetVisibleObjects3(pUserName,pUserPassword, X0,Y0,X1,Y1,X2,Y2,X3,Y3, InvisibleLayNumbersArray, RW_VisibleFactor,0.3/RW_Scale);
  //.
  if (Length(BA) = 0) then Exit; //. ->
  //.
  NewLays:=nil;
  NewLaysObjectsCount:=0;
  try
  //.
  DataPtr:=@BA[0];
  PrepareStructuredObjects(DataPtr);
  //.
  asm
     PUSH ESI
     MOV ESI,DataPtr
     CLD
     LODSW
     MOV LaysCount,AX
     MOV DataPtr,ESI
     POP ESI
  end;
  LayLevel:=0;
  flSkipObjects:=false;
  ptrptrLay:=@NewLays;
  for I:=0 to LaysCount-1 do begin
    //. lay performing
    ptrLastObj:=nilPtr;
    asm
       PUSH ESI
       MOV ESI,DataPtr
       CLD
       LODSD
       MOV ObjectsCount,EAX
       LODSB
       MOV flLay,AL
       MOV DataPtr,ESI
       POP ESI
    end;
    //.
    if (flLay)
     then begin
      flSkipObjects:=false; ///+TObjectReflectingCfg(Cfg).HidedLays.IsLayFoundByOrder(LayLevel);
      while (Pointer(ptrptrLay^) <> nil) do ptrptrLay:=Pointer(ptrptrLay^);
      Inc(LayLevel);
      end;
    //. get processing lay
    if (Pointer(ptrptrLay^) = nil)
     then begin //. prepare new lay
      GetMem(ptrNewLay,SizeOf(TLayReflect));
      TLayReflect(ptrNewLay^).ptrNext:=nil;
      TLayReflect(ptrNewLay^).flLay:=flLay;
      TLayReflect(ptrNewLay^).Objects:=nil;
      TLayReflect(ptrNewLay^).ObjectsCount:=0;
      Pointer(ptrptrLay^):=ptrNewLay;
      end
     else
      ptrNewLay:=Pointer(ptrptrLay^);
    ptrptrLay:=@TLayReflect(ptrNewLay^).ptrNext;
    //.
    Objects:=nil;
    ValidObjectsCount:=0;
    ptrLast:=@Objects;
    for J:=0 to ObjectsCount-1 do begin
      asm
         //. get ptrObj
         PUSH ESI
         MOV ESI,DataPtr
         CLD
         LODSD
         MOV ptrObj,EAX
         MOV DataPtr,ESI
         POP ESI
      end;
      if (NOT flSkipObjects)
       then
        if (ptrObj <> ptrLastObj)
         then begin
          InsertObj(ptrObj);
          ptrLastObj:=ptrObj;
          end
         else ProcessObjDetails(ptrObj, ptrptrLay);
      end;
    if (Objects <> nil)
     then begin
      TItemLayReflect(ptrLast^).ptrNext:=TLayReflect(ptrNewLay^).Objects;
      TLayReflect(ptrNewLay^).Objects:=Objects;
      Inc(TLayReflect(ptrNewLay^).ObjectsCount,ValidObjectsCount);
      //.
      Inc(NewLaysObjectsCount,ValidObjectsCount);
      end;
    end;
  except
    ptrDumpLay:=NewLays;
    NewLays:=nil;
    //. remove incomplete new lays
    TDeletingDump.ForceDelete(Pointer(@ptrDumpLay));
    //.
    Raise; //. =>
    end;
  //. change reflecting lays tree
  Lays:=NewLays;
  LaysObjectsCount:=NewLaysObjectsCount;
  //. objects data getting from remote server
  if (NewLays <> nil)
   then begin
    //.
    ///? try
    ObjPointersCount:=NewLaysObjectsCount;
    ptrPointersLay:=NewLays;
    ptrPointersLayItem:=TLayReflect(ptrPointersLay^).Objects;
    while (ObjPointersCount > 0) do begin
      //. objects reading and placing into the local memory
      GetObjectsPortion(ptrPointersLay,ptrPointersLayItem, ObjPointersCount);
      end;
    (* ///?
    finally
    //. update lays objects lay info
    Lay:=0;
    SubLay:=0;
    ptrNewLay:=NewLays;
    while (ptrNewLay <> nil) do with TLayReflect(ptrNewLay^) do begin
      ptrLayItem:=Objects;
      while (ptrLayItem <> nil) do with TItemLayReflect(ptrLayItem^) do begin
        if (NOT Obj_IsNotCached(ptrObject) AND (Obj_idType(ptrObject) <> idTLay2DVisualization)) then ObjectsContextRegistry.ObjSetLayInfo(ptrObject,Lay,SubLay);
        //. next item
        ptrLayItem:=ptrNext;
        end;
      //. next
      ptrNewLay:=ptrNext;
      if (ptrNewLay = nil) then Break; //. >
      //.
      if (TLayReflect(ptrNewLay^).flLay)
       then begin
        Inc(Lay);
        SubLay:=0;
        end
       else Inc(SubLay);
      end;
    end;
    *)
  end;
  end;

  procedure ProcessAs2D(const Point: TScreenNode);

    function Obj_Filled(const Obj: TSpaceObj): boolean;
    begin
    with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(Obj.idTObj,Obj.idObj)) do
    try
    Result:=ContainerFilled;
    finally
    Release;
    end;
    end;

    procedure Obj_PrepareFigures(const ptrObject: TPtr; pWindowRefl: TWindow;  pFigureWinRefl,pAdditiveFigureWinRefl: TFigureWinRefl; const ptrWindowFilledFlag: pointer = nil);
    var
      I: integer;

      procedure TreatePoint(const RW: TReflectionWindowStrucEx; X,Y: Extended);
      var
        QdA2: Extended;
        X_C,X_QdC,X_A1,X_QdB2: Extended;
        Y_C,Y_QdC,Y_A1,Y_QdB2: Extended;
        Node: TNode;
      begin
      with RW do begin
      X:=X*cfTransMeter;
      Y:=Y*cfTransMeter;
      QdA2:=sqr(X-X0)+sqr(Y-Y0);

      X_QdC:=sqr(X1-X0)+sqr(Y1-Y0);
      X_C:=Sqrt(X_QdC);
      X_QdB2:=sqr(X-X1)+sqr(Y-Y1);
      X_A1:=(X_QdC-X_QdB2+QdA2)/(2*X_C);

      Y_QdC:=sqr(X3-X0)+sqr(Y3-Y0);
      Y_C:=Sqrt(Y_QdC);
      Y_QdB2:=sqr(X-X3)+sqr(Y-Y3);
      Y_A1:=(Y_QdC-Y_QdB2+QdA2)/(2*Y_C);

      Node.X:=Xmn+X_A1/X_C*(Xmx-Xmn);
      Node.Y:=Ymn+Y_A1/Y_C*(Ymx-Ymn);

      pFigureWinRefl.Insert(Node)
      end;
      end;

      procedure TreatePointAs3D(const RW: TReflectionWindowStrucEx; X,Y: Extended);
      var
        X_A,X_B,X_C,X_D: Extended;
        Y_A,Y_B,Y_C,Y_D: Extended;
        XC,YC,diffXCX0,diffYCY0,X_L,Y_L: Extended;
        Node: TNode;
      begin
      with RW do begin
      X:=X*cfTransMeter;
      Y:=Y*cfTransMeter;

      X_A:=Y1-Y0;X_B:=X0-X1;X_D:=-(X0*X_A+Y0*X_B);
      Y_A:=Y3-Y0;Y_B:=X0-X3;Y_D:=-(X0*Y_A+Y0*Y_B);
      XC:=(Y_A*X+Y_B*(Y+X_D/X_B))/(Y_A-(X_A*Y_B/X_B));
      diffXCX0:=XC-X0;
      if X_B <> 0
       then begin
        YC:=-(X_A*XC+X_D)/X_B;
        diffYCY0:=YC-Y0;
        X_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
        if (((-X_B) > 0) AND ((diffXCX0) < 0)) OR (((-X_B) < 0) AND ((diffXCX0) > 0)) then X_L:=-X_L;
        end
       else begin
        YC:=(Y_B*Y+Y_A*(X+X_D/X_A))/(Y_B-(X_B*Y_A/X_A));
        diffYCY0:=YC-Y0;
        X_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
        if ((X_A > 0) AND ((diffYCY0) < 0)) OR ((X_A < 0) AND ((diffYCY0) > 0)) then X_L:=-X_L;
        end;
      XC:=(X_A*X+X_B*(Y+Y_D/Y_B))/(X_A-(Y_A*X_B/Y_B));
      diffXCX0:=XC-X0;
      if (Y_B <> 0)
       then begin
        YC:=-(Y_A*XC+Y_D)/Y_B;
        diffYCY0:=YC-Y0;
        Y_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
        if (((-Y_B) > 0) AND ((diffXCX0) < 0)) OR (((-Y_B) < 0) AND ((diffXCX0) > 0)) then Y_L:=-Y_L;
        end
       else begin
        YC:=(X_B*Y+X_A*(X+Y_D/Y_A))/(X_B-(Y_B*X_A/Y_A));
        diffYCY0:=YC-Y0;
        Y_L:=Sqrt(sqr(diffXCX0)+sqr(diffYCY0));
        if ((Y_A > 0) AND ((diffYCY0) < 0)) OR ((Y_A < 0) AND ((diffYCY0) > 0)) then Y_L:=-Y_L;
        end;

      Node.X:=Xmn+X_L/Sqrt(sqr(X_A)+sqr(X_B))*(Xmx-Xmn);
      Node.Y:=Ymn+Y_L/Sqrt(sqr(Y_A)+sqr(Y_B))*(Ymx-Ymn);

      pFigureWinRefl.Insert(Node)
      end;
      end;

    var
      Obj: TSpaceObj;
      ptrPoint: TPtr;
      Point: TPoint;

      ptrOwnerObj: TPtr;

    var
      CurPoint: word;
      PenColor: TColor;
      PenStyle: TPenStyle;
      PenWidth: integer;
      FWR_flWindowFilled,AFWR_flWindowFilled: boolean;
    begin
    Lock.Enter;
    try
    ReadObj(Obj,SizeOf(TSpaceObj), ptrObject);
    with pFigureWinRefl do begin
    Clear;
    ptrObj:=ptrObject;
    idTObj:=Obj.idTObj;
    idObj:=Obj.idObj;
    flagLoop:=Obj.flagLoop;
    Color:=Obj.Color;
    flagFill:=Obj.flagFill;
    ColorFill:=Obj.ColorFill;
    Width:=Obj.Width;
    flSelected:=true;
    end;
    pAdditiveFigureWinRefl.Clear;
    ptrPoint:=Obj.ptrFirstPoint;
    CurPoint:=0;
    while (ptrPoint <> nilPtr) do begin
      ReadObj(Point,SizeOf(Point), ptrPoint);
      TreatePoint(RW, Point.X,Point.Y);
      ptrPoint:=Point.ptrNextObj;
      Inc(CurPoint);
      end;
    finally
    Lock.Leave;
    end;
    FWR_flWindowFilled:=false;
    AFWR_flWindowFilled:=false;
    if (Obj.Width > 0)
     then with pAdditiveFigureWinRefl do begin
      Assign(pFigureWinRefl);
      if (ValidateAsPolyLine(ReflectionWindow.Scale))
       then begin
        AttractToLimits(pWindowRefl, @AFWR_flWindowFilled);
        Optimize();
        end;
      end;
    pFigureWinRefl.AttractToLimits(pWindowRefl, @FWR_flWindowFilled);
    pFigureWinRefl.Optimize();
    if (ptrWindowFilledFlag <> nil) then Boolean(ptrWindowFilledFlag^):=(AFWR_flWindowFilled OR FWR_flWindowFilled);
    end;

  var
    Bitmap: TBitmap;
    DynamicHints: TDynamicHints;
    I: integer;
    ptrReflLay: pointer;
    FirstVisibleLay: integer;
    LayNumber: integer;
    flWindowFilled: boolean;
    ptrItem: pointer;
    flClipping: boolean;
    flClipVisible: boolean;
    Obj: TSpaceObj;
    ptrOwnerObj: TPtr;
    ClippingRegion,Rgn: HRGN;
    Xhint,Yhint: Extended;
    idHINTVisualization: integer;
    DynamicHintItemPtr: pointer;
  begin
  Bitmap:=TBitmap.Create();
  Bitmap.Canvas.Lock();
  try
  //. lays validation for object that filled all window
  FirstVisibleLay:=0;
  {///- not needed speed penalty on huge amount of objects
  LayNumber:=0;
  ptrReflLay:=Lays;
  while ptrReflLay <> nil do with TLayReflect(ptrReflLay^) do begin
    ptrItem:=Objects;
    while ptrItem <> nil do begin
      with TItemLayReflect(ptrItem^) do begin
      ReadObj(Obj,SizeOf(Obj),ptrObject);
      if (Obj_IsCached(Obj) AND Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval))
       then begin
        if (Obj.flagLoop AND Obj.flagFill)
         then begin
          flWindowFilled:=false;
          //. process clipping
          flClipping:=false;
          if (Obj.Color = Graphics.clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = Graphics.clNone))
               then begin
                flClipping:=true;
                Obj_PrepareFigures(ptrOwnerObj, WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @flWindowFilled);
                end;
              //.
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            end;
          //.
          if (NOT flClipping) then Obj_PrepareFigures(ptrObject, WindowRefl, FigureWinRefl,AdditiveFigureWinRefl, @flWindowFilled);
          //.
          if ((NOT (Obj.flagLoop AND Obj.flagFill AND (Obj.ColorFill = Graphics.clNone))) AND flWindowFilled AND Obj_Filled(Obj))
           then begin
            FirstVisibleLay:=LayNumber;
            Break; //. >
            end;
          end;
        end;
      end;
      //. got to next next
      ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
      end;
      //.
      Inc(LayNumber);
      ptrReflLay:=ptrNext;
      end;}
  //. reflecting
  if (DynamicHintVisibility > 0.0)
   then begin
    DynamicHints:=TDynamicHints.Create(Self);
    DynamicHints.VisibleFactor:=DynamicHintVisibility;
    end
   else DynamicHints:=nil;
  try
  LayNumber:=0;
  ptrReflLay:=Lays;
  while (ptrReflLay <> nil) do with TLayReflect(ptrReflLay^) do begin
    if (LayNumber >= FirstVisibleLay)
     then begin
      //. process a layer objects
      ptrItem:=Objects;
      while (ptrItem <> nil) do begin
        with TItemLayReflect(ptrItem^) do begin
        ReadObj(Obj,SizeOf(Obj),ptrObject);
        if (Obj_IsCached(Obj) AND Obj_ActualityInterval_IsActualForTimeInterval(Obj,ActualityInterval))
         then begin
          //. clipping if necessary
          flClipping:=false;
          flClipVisible:=false;
          try
          if (Obj.Color = Graphics.clNone)
           then begin
            ptrOwnerObj:=Obj.ptrListOwnerObj;
            while (ptrOwnerObj <> nilPtr) do begin
              ReadObj(Obj,SizeOf(Obj),ptrOwnerObj);
              if ((Obj.ColorFill = Graphics.clNone) AND Obj.flagLoop AND Obj.flagFill)
               then begin
                flClipping:=true;
                Obj_PrepareFigures(ptrOwnerObj, WindowRefl, FigureWinRefl,AdditiveFigureWinRefl);
                if (FigureWinRefl.CountScreenNodes > 0)
                 then
                  if (NOT flClipVisible)
                   then begin
                    ClippingRegion:=CreatePolygonRgn(FigureWinRefl.ScreenNodes, FigureWinRefl.CountScreenNodes, ALTERNATE);
                    flClipVisible:=true;
                    end
                   else begin
                    Rgn:=CreatePolygonRgn(FigureWinRefl.ScreenNodes, FigureWinRefl.CountScreenNodes, ALTERNATE);
                    CombineRgn(ClippingRegion, ClippingRegion,Rgn, RGN_XOR);
                    DeleteObject(Rgn);
                    end;
                end;
              //.
              ptrOwnerObj:=Obj.ptrNextObj;
              end;
            end;
          //.
          if (NOT flClipping OR flClipVisible)
           then begin
            Obj_PrepareFigures(ptrObject, WindowRefl, FigureWinRefl,AdditiveFigureWinRefl);
            if ((AdditiveFigureWinRefl.CountScreenNodes > 0) OR (FigureWinRefl.CountScreenNodes > 0))
             then begin
              if (NOT ((FigureWinRefl.ColorFill = Graphics.clNone) AND FigureWinRefl.flagLoop AND FigureWinRefl.flagFill)) //. obj is not a clipping region
               then
                if (AdditiveFigureWinRefl.PointIsInside(Point) OR (FigureWinRefl.flagFill AND FigureWinRefl.PointIsInside(Point)))
                 then begin
                  if (NOT flClipping)
                   then Result:=ptrObject
                   else
                    if (PtInRegion(ClippingRegion, Point.X,Point.Y))
                     then Result:=ptrObject;
                  end;
              //.
              if (DynamicHints <> nil)
               then begin
                if (FigureWinRefl.idTObj = idTHINTVisualization)
                 then begin
                  if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint)) then DynamicHints.AddItemForShow(ptrObject,FigureWinRefl.idObj,LayNumber, Xhint,Yhint,((Window.Xmx-Window.Xmn)*(Window.Ymx-Window.Ymn)));
                  end else
                if (FigureWinRefl.idTObj = idTCoVisualization)
                 then begin
                  if (FigureWinRefl.Nodes_GetAveragePoint(Xhint,Yhint) AND CoVisualization_GetOwnSpaceHINTVisualizationLocally(FigureWinRefl.idObj,{out} idHINTVisualization)) then DynamicHints.AddItemForShow(ptrObject,idHINTVisualization,LayNumber, Xhint,Yhint,((Window.Xmx-Window.Xmn)*(Window.Ymx-Window.Ymn)));
                  end;
                end;
              end;
            end;
          finally
          if (flClipVisible) then DeleteObject(ClippingRegion);
          end;
          end;
        end;
        //. go to next item
        ptrItem:=TItemLayReflect(ptrItem^).ptrNext;
        end;
      end;
    //.
    Inc(LayNumber);
    ptrReflLay:=ptrNext;
    end;
  //. dynamic hint objects
  if (DynamicHints <> nil)
   then begin
    DynamicHints.FormItems(Bitmap,true);
    if (DynamicHints.GetItemAtPoint(Point,{out} DynamicHintItemPtr))
     then Result:=TDynamicHint(DynamicHintItemPtr^).ptrObj;
    end;
  finally
  DynamicHints.Free();
  end;
  finally
  Bitmap.Canvas.Unlock();
  Bitmap.Destroy();
  end;
  end;

var
  Point: TScreenNode;
begin
try
Result:=nilPtr;
//.
{///-
WaitForSingleObject(User_SpaceWindow_Semaphore,INFINITE);
try}
Point.X:=Trunc(Bitmap_X); Point.Y:=Trunc(Bitmap_Y);
//. get reflection window parameters
RW.X0:=X0; RW.Y0:=Y0;
RW.X1:=X1; RW.Y1:=Y1;
RW.X2:=X2; RW.Y2:=Y2;
RW.X3:=X3; RW.Y3:=Y3;
RW.Xmn:=0; RW.Ymn:=0;
RW.Xmx:=Trunc(Bitmap_Width); RW.Ymx:=Trunc(Bitmap_Height);
ReflectionWindow:=TReflectionWindow.Create(Self,RW);
try
ReflectionWindow.VisibleFactor:=VisibleFactor;
ReflectionWindow.DynamicHints_VisibleFactor:=DynamicHintVisibility;
ReflectionWindow.InvisibleLayNumbersArray:=HidedLaysArray;
//.
ReflectionWindow.Normalize();
//.
ReflectionWindow.GetWindow(false,RW);
//.
WindowRefl:=TWindow.Create(RW.Xmn-3,RW.Ymn-3,RW.Xmx+3,RW.Ymx+3);
try
FigureWinRefl:=TFigureWinRefl.Create;
AdditiveFigureWinRefl:=TFigureWinRefl.Create;
try
//.
Lays:=nil;
try
PrepareLays();
ProcessAs2D(Point);
finally
TDeletingDump.ForceDelete(Pointer(@Lays));
end;
finally
AdditiveFigureWinRefl.Destroy;
FigureWinRefl.Destroy;
end;
finally
WindowRefl.Destroy;
end;
finally
ReflectionWindow.Destroy;
end;
{///-
finally
ReleaseSemaphore(User_SpaceWindow_Semaphore,1,nil);
end;}
except
  On E: Exception do begin
    EventLog.WriteMinorEvent('User_SpaceWindowBitmap_ObjectAtPosition','Processing error',E.Message);
    Raise; //. =>
    end;
  end;
end;

{TZipStream}
type
  TZipStream = class(TAbZipArchive)
  private
    procedure ZipHelper(Sender : TObject; Item : TAbArchiveItem; OutStream : TStream);
    procedure ZipHelperStream(Sender : TObject; Item : TAbArchiveItem; OutStream, InStream : TStream);
    procedure DoExtractHelper(Sender : TObject; Item : TAbArchiveItem; const NewName : string);
    procedure DoOnAbArchiveItemFailureEvent(Sender : TObject; Item : TAbArchiveItem; ProcessType : TAbProcessType; ErrorClass : TAbErrorClass; ErrorCode : Integer);

    Constructor CreateFromStream( aStream : TStream; const ArchiveName : string ); override;
    Constructor CreateFromStreamForZipping( aStream : TStream; const ArchiveName : string );
    Constructor CreateFromStreamForUnzipping( aStream : TStream; const ArchiveName : string );
  end;

Constructor TZipStream.CreateFromStream(aStream: TStream; const ArchiveName: string);
begin
inherited CreateFromStream(aStream,ArchiveName);
OnProcessItemFailure:=DoOnAbArchiveItemFailureEvent;
end;

Constructor TZipStream.CreateFromStreamForZipping(aStream: TStream; const ArchiveName: string);
begin
CreateFromStream(aStream,ArchiveName);
DeflationOption:=doMaximum;
CompressionMethodToUse:=smDeflated;
InsertHelper:=ZipHelper;
InsertFromStreamHelper:=ZipHelperStream;
end;

Constructor TZipStream.CreateFromStreamForUnzipping(aStream: TStream; const ArchiveName: string);
begin
CreateFromStream(aStream,ArchiveName);
ExtractHelper:=DoExtractHelper;
end;

procedure TZipStream.ZipHelper(Sender: TObject; Item: TAbArchiveItem; OutStream: TStream);
begin
AbZip(TAbZipArchive(Sender), TAbZipItem(Item), OutStream);
end;

procedure TZipStream.ZipHelperStream(Sender: TObject; Item: TAbArchiveItem; OutStream, InStream: TStream);
begin
if (Assigned(InStream)) then AbZipFromStream(TAbZipArchive(Sender), TAbZipItem(Item), OutStream, InStream);
end;

procedure TZipStream.DoExtractHelper(Sender : TObject; Item : TAbArchiveItem; const NewName : string);
begin
AbUnzip(Sender,TAbZipItem(Item),NewName);
end;

procedure TZipStream.DoOnAbArchiveItemFailureEvent(Sender : TObject; Item : TAbArchiveItem; ProcessType : TAbProcessType; ErrorClass : TAbErrorClass; ErrorCode : Integer);
begin
Raise Exception.Create('error while processing file: '+Item.FileName); //. =>
end;


procedure TProxySpace.SynchronizeLocalFolderWithServerUserFolder(const Folder: string; const LocalFolderBase: string; const UserFolderBase: string);
const
  ExcludesFileName = 'LocalFiles';
var
  LocalFolder: string;
  MUF: TMODELUserFunctionality;
  RemoteFolderContentData: TByteArray;
  FolderItemsCount: integer;
  OutgoingIncludes: TStringList;
  IncomingExcludes: TStringList;
  flOut,flIn: boolean;

  function RemoteFolderContentData_GetFileData(const FileName: string; out File_LastWriteTime: TDateTime): boolean;
  var
    I: integer;
    ItemsCount: integer;
    p: pointer;
    FN_Length: word;
    J: integer;
    flTheSame: boolean;
  begin
  Result:=false;
  File_LastWriteTime:=0.0;
  if (Length(RemoteFolderContentData) = 0) then Exit; //. ->
  p:=Pointer(@RemoteFolderContentData[0]);
  ItemsCount:=Integer(p^); Inc(DWord(p),SizeOf(ItemsCount));
  for I:=0 to ItemsCount-1 do begin
    FN_Length:=Word(p^); Inc(DWord(p),SizeOf(FN_Length));
    if (FN_Length = Length(FileName))
     then begin
      flTheSame:=true;
      for J:=0 to FN_Length-1 do
        if (Byte(Pointer(DWord(p)+J)^) <> Byte(FileName[1+J]))
         then begin
          flTheSame:=false;
          Break; //. >
          end;
      Inc(DWord(p),FN_Length);
      if (flTheSame)
       then begin
        File_LastWriteTime:=TDateTime(p^);
        //. clear item slot
        Dec(DWord(p),FN_Length);
        Byte(p^):=0;
        //.
        Result:=true;
        Exit; //. ->
        end
       else Inc(DWord(p),SizeOf(File_LastWriteTime)); //. skip item LastWriteTime
      end
     else begin //. skip item
      Inc(DWord(p),FN_Length);
      Inc(DWord(p),SizeOf(File_LastWriteTime));
      end
    end;
  end;

  function RemoteFolderContentData_HasUnusedFile(): boolean;
  var
    I: integer;
    ItemsCount: integer;
    p: pointer;
    FN_Length: word;
  begin
  Result:=false;
  if (Length(RemoteFolderContentData) = 0) then Exit; //. ->
  p:=Pointer(@RemoteFolderContentData[0]);
  ItemsCount:=Integer(p^); Inc(DWord(p),SizeOf(ItemsCount));
  for I:=0 to ItemsCount-1 do begin
    FN_Length:=Word(p^); Inc(DWord(p),SizeOf(FN_Length));
    if (Byte(p^) <> 0)
     then begin
      Result:=true;
      Exit; //. ->
      end;
    //. next item
    Inc(DWord(p),FN_Length);
    Inc(DWord(p),SizeOf(TDateTime));
    end;
  end;  

  function File_GetLastWriteTime(const FN: string): TDateTime;
  var
    F: TSearchRec;
  begin
  SysUtils.FindFirst(FN,faAnyFile,F);
  SysUtils.FindClose(F);
  Result:=SysUtils.FileDateToDatetime(F.Time);
  end;

  function ExcludesFileList_Prepare(const Folder: string): TStringList;
  var
    FN: string;
  begin
  Result:=nil;
  FN:=Folder+'\'+ExcludesFileName;
  if (FileExists(FN))
   then begin
    Result:=TStringList.Create();
    Result.LoadFromFile(FN);
    end;
  end;
  
  function ExcludesFileList_ItemExists(const ExcludesFileList: TStringList; const Item: ANSIString): boolean;
  var
    I: integer;
  begin
  Result:=false;
  if (ExcludesFileList = nil) then Exit; //. ->
  for I:=0 to ExcludesFileList.Count-1 do
    if (ExcludesFileList[I] = Item)
     then begin
      Result:=true;
      Exit; //. ->
      end;
  end;

  procedure ProcessFilesInFolder(const Folder: string);
  var
    ExcludesFileList: TStringList;
    sr: TSearchRec;
    FN: string;
    File_LastWriteTime,LWT: TDateTime;
  begin
  if (SysUtils.FindFirst(LocalFolder+'\'+Folder+'\*.*', faAnyFile-faDirectory, sr) = 0)
   then
    try
    ExcludesFileList:=nil;
    try
    ExcludesFileList:=ExcludesFileList_Prepare(LocalFolder+'\'+Folder);
    repeat
      if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND NOT ExcludesFileList_ItemExists(ExcludesFileList,sr.Name))
       then begin
        if (Folder <> '')
         then FN:=Folder+'\'+sr.name
         else FN:=sr.name;
        //.
        if (RemoteFolderContentData_GetFileData(FN,{out} File_LastWriteTime))
         then begin
          LWT:=File_GetLastWriteTime(LocalFolder+'\'+FN);
          if (LWT >= File_LastWriteTime)
           then begin
            if (LWT > File_LastWriteTime)
             then begin
              OutgoingIncludes.Add(FN);
              flOut:=true;
              end;
            IncomingExcludes.Add(FN);
            end
           else flIn:=true;
          end
         else begin
          OutgoingIncludes.Add(FN);
          flOut:=true;
          end;
        //.
        Inc(FolderItemsCount);
        end;
    until (SysUtils.FindNext(sr) <> 0);
    finally
    ExcludesFileList.Free();
    end;
    finally
    SysUtils.FindClose(sr);
    end;
  if (SysUtils.FindFirst(LocalFolder+'\'+Folder+'\*.*', faDirectory, sr) = 0)
   then
    try
    repeat
      if (NOT ((sr.Name = '.') OR (sr.Name = '..')) AND ((sr.Attr and faDirectory) = faDirectory))
       then begin
        if (Folder <> '')
         then FN:=Folder+'\'+sr.name
         else FN:=sr.name;
        //.
        ProcessFilesInFolder(FN);
        end;
    until (SysUtils.FindNext(sr) <> 0);
    finally
    SysUtils.FindClose(sr);
    end;
  end;

var
  OutgoingData: TByteArray;
  IncomingData: TByteArray;
  Excludes: string;
  I: integer;
  MS: TMemoryStream;
  ZS: TZipStream;
  FN: string;
  FileItem: TAbArchiveItem;
  FA: integer;
begin
if (UserID = 0) then Exit; //. ->
if (UserName = 'Anonymous') then Exit; //. ->
//.
Lock.Enter();
try
LocalFolder:=LocalFolderBase+'\'+Folder;
MUF:=TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,UserID));
try
if (NOT MUF.ServerFolder_ReadSubFolder(1{return folder content}, UserFolderBase,Folder, '', {out} RemoteFolderContentData)) then RemoteFolderContentData:=nil;
//.
OutgoingIncludes:=TStringList.Create();
IncomingExcludes:=TStringList.Create();
try
flOut:=false;
flIn:=false;
FolderItemsCount:=0;
ProcessFilesInFolder('');
flIn:=(flIn OR RemoteFolderContentData_HasUnusedFile());
if (NOT (flOut OR flIn)) then Exit; //. ->
//.
if (flOut)
 then begin
  MS:=TMemoryStream.Create();
  try
  ZS:=TZipStream.CreateFromStreamForZipping(MS,'');
  try
  for I:=0 to OutgoingIncludes.Count-1 do begin
    FN:=OutgoingIncludes[I];
    FileItem:=ZS.CreateItem(FN);
    FileItem.DiskFileName:=LocalFolder+'\'+FN;
    ZS.Add(FileItem);
    end;
  //.
  ZS.SaveArchive();
  ByteArray_PrepareFromStream({ref} OutgoingData,MS);
  finally
  ZS.Destroy();
  end;
  finally
  MS.Destroy();
  end;
  end
 else OutgoingData:=nil;
//.
Excludes:='';
if ((flIn) AND (IncomingExcludes.Count > 0))
 then begin
  for I:=0 to IncomingExcludes.Count-1 do Excludes:=Excludes+IncomingExcludes[I]+',';
  SetLength(Excludes,Length(Excludes)-1);
  end;
//.
if (flOut AND flIn)
 then MUF.ServerFolder_ExchangeSubFolder(UserFolderBase,Folder, OutgoingData, Excludes,{out} IncomingData)
 else
  if (flOut)
   then MUF.ServerFolder_AddSubFolder(UserFolderBase,Folder, OutgoingData)
   else
    if (flIn)
     then MUF.ServerFolder_ReadSubFolder(2{read folder zipped data},UserFolderBase,Folder, Excludes,{out} IncomingData);
if (flIn AND (Length(IncomingData) > 0))
 then begin
  MS:=TMemoryStream.Create();
  try
  MS.Write(Pointer(@IncomingData[0])^,Length(IncomingData));
  with TZipStream.CreateFromStreamForUnzipping(MS,'') do
  try
  ExtractOptions:=ExtractOptions+[eoRestorePath];
  ForceDirectories(LocalFolder);
  BaseDirectory:=LocalFolder;
  Load();
  for I:=0 to ItemList.Count-1 do begin
    FN:=AnsiReplaceStr(ItemList[I].FileName,'/','\');
    ForceDirectories(BaseDirectory+'\'+ExtractFilePath(FN));
    if ((ItemList[I].ExternalFileAttributes AND faDirectory) <> faDirectory)
     then begin
      FN:=BaseDirectory+'\'+ItemList[I].FileName;
      if (SysUtils.FileExists(FN))
       then begin
        if (NOT SysUtils.DeleteFile(FN))
         then begin
          FA:=FileGetAttr(FN);
          FA:=(FA AND (NOT SysUtils.faReadOnly));
          SysUtils.FileSetAttr(FN,FA);
          if (NOT SysUtils.DeleteFile(FN)) then Raise Exception.Create('could not delete old file: '+FN); //. =>
          end;
        end;
      Extract(ItemList[I],ItemList[I].FileName);
      end;
    end;
  finally
  Destroy();
  end;
  finally
  MS.Destroy();
  end;
  end;
finally
IncomingExcludes.Destroy();
OutgoingIncludes.Destroy();
end;
finally
MUF.Release();
end
finally
Lock.Leave();
end;
end;


{TReflectorsList}
Constructor TReflectorsList.Create(pSpace: TProxySpace);
begin
Inherited Create;
Space:=pSpace;
end;

destructor TReflectorsList.Destroy;
begin
DestroyAll;
Inherited;
end;

function TReflectorsList.CreateReflectorByID(const pid: integer): TForm;
begin
with GetISpaceUserReflector(Space.SOAPServerURL) do
case TUserReflectorType(ReflectorType(Space.UserName,Space.UserPassword,pid)) of
urt2DReflector: Result:=TReflector.Create(Space,pid);
urtGL3DReflector: Result:=TGL3DReflector.Create(Space,pid);
else
  Raise Exception.Create('unknown reflector type'); //. =>;
end;
Add(Result);
end;

procedure TReflectorsList.TReflector_Destroy(const pid: integer);
var
  I: integer;
begin
for I:=0 to Count-1 do
  if (TAbstractReflector(List[I]).ID = pid)
   then begin
    TAbstractReflector(List[I]).Destroy;
    Delete(I);
    Exit; //. ->
    end;
end;

procedure TReflectorsList.DestroyAll;
var
  I: integer;
begin
for I:=0 to Count-1 do TObject(Items[I]).Destroy;
Clear;
end;

procedure TReflectorsList.ReflectSpace(const HExceptReflector: integer);
var
  I: integer;
begin
for I:=0 to Count-1 do
  if (TAbstractReflector(List[I]).id <> HExceptReflector)
   then
    if ObjectIsInheritedFrom(TObject(Items[I]),TReflector)
     then
      TReflector(Items[I]).Reflecting.Reflect
     else
      if ObjectIsInheritedFrom(TObject(Items[I]),TGL3DReflector)
       then TGL3DReflector(Items[I]).Reflecting.Reflect;
end;

procedure TReflectorsList.Refresh(const HExceptReflector: integer);
var
  I: integer;
begin
for I:=0 to Count-1 do
  if (TAbstractReflector(List[I]).id <> HExceptReflector)
   then
    if ObjectIsInheritedFrom(TObject(Items[I]),TReflector)
     then
      TReflector(Items[I]).Reflecting.ReFresh
     else
      if ObjectIsInheritedFrom(TObject(Items[I]),TGL3DReflector)
       then TGL3DReflector(Items[I]).Reflecting.ReFresh;
end;

procedure TReflectorsList.RecalcReflect(const HExceptReflector: integer);
var
  I: integer;
begin
for I:=0 to Count-1 do
  if (TAbstractReflector(List[I]).id <> HExceptReflector)
   then
    if ObjectIsInheritedFrom(TObject(Items[I]),TReflector)
     then
      TReflector(Items[I]).Reflecting.RecalcReflect
     else
      if ObjectIsInheritedFrom(TObject(Items[I]),TGL3DReflector)
       then TGL3DReflector(Items[I]).Reflecting.RecalcReflect
end;

procedure TReflectorsList.RevisionReflect(ptrObj: TPtr; HExceptReflector: integer);
begin
RevisionReflect(ptrObj,actChange, HExceptReflector);
end;

procedure TReflectorsList.RevisionReflect(ptrObj: TPtr; pAct: TRevisionAct; HExceptReflector: integer);
var
  I: integer;
begin
for I:=0 to Count-1 do
  if (TAbstractReflector(List[I]).id <> HExceptReflector)
   then
    if ObjectIsInheritedFrom(TObject(Items[I]),TReflector)
     then
      TReflector(Items[I]).Reflecting.RevisionReflect(ptrObj,pAct)
     else
      if ObjectIsInheritedFrom(TObject(Items[I]),TGL3DReflector)
       then TGL3DReflector(Items[I]).Reflecting.RevisionReflect(ptrObj,pAct);
end;

function TReflectorsList.IsObjOutside(const ptrObj: TPtr): boolean;
var
  Obj_CC: TContainerCoord;
  I: integer;
begin
Result:=true;
if Count = 0 then Exit; //. ->
if NOT Space.Obj_GetMinMax(Obj_CC.Xmin,Obj_CC.Ymin, Obj_CC.Xmax,Obj_CC.Ymax, ptrObj) then Exit; //. ->
for I:=0 to Count-1 do
  if ObjectIsInheritedFrom(TObject(Items[I]),TReflector)
   then with TReflector(Items[I]) do
    if NOT ReflectionWindow.IsObjectOutside(Obj_CC)
     then begin
      Result:=false;
      Exit; //. ->
      end;
end;

function TReflectorsList.IsObjVisible(const ptrObj: TPtr): boolean;
var
  Obj_CC: TContainerCoord;
  Obj_CS: Extended;
  I: integer;
begin
Result:=false;
if (Count = 0) then Exit; //. ->
if (NOT Space.Obj_GetMinMax(Obj_CC.Xmin,Obj_CC.Ymin, Obj_CC.Xmax,Obj_CC.Ymax, ptrObj)) then Exit; //. ->
Obj_CS:=((Obj_CC.Xmax-Obj_CC.Xmin)*(Obj_CC.Ymax-Obj_CC.Ymin));
for I:=0 to Count-1 do
  if (ObjectIsInheritedFrom(TObject(Items[I]),TReflector))
   then with TReflector(Items[I]) do begin
    ReflectionWindow.Lock.Enter;
    try
    if ((NOT ReflectionWindow.IsObjectOutside(Obj_CC)) AND ((Obj_CS*sqr(ReflectionWindow._Scale) >= ReflectionWindow._VisibleFactor)))
     then begin
      Result:=true;
      Exit; //. ->
      end;
    finally
    ReflectionWindow.Lock.Leave;
    end;
    end;
end;












{TSpaceObjPolyLinePolygon}
Constructor TSpaceObjPolyLinePolygon.Create(pSpace: TProxySpace; const pObj: TSpaceObj);
begin
Inherited Create;
Space:=pSpace;
Obj:=pObj;
Count:=0;
Nodes_Init;
SetNodesFromObject;
Update;
end;

Constructor TSpaceObjPolyLinePolygon.Create(pSpace: TProxySpace; const pObj: TSpaceObj; const NewWidth: Extended);
begin
Inherited Create;
Space:=pSpace;
Obj:=pObj;
Obj.Width:=NewWidth;
Count:=0;
Nodes_Init;
end;

Destructor TSpaceObjPolyLinePolygon.Destroy;
begin
Nodes_Clear;
Inherited;
end;

procedure TSpaceObjPolyLinePolygon.SetNodesFromObject;
var
  ptrPoint: TPtr;
  Point: TPoint;
  Node: TNodeSpaceObjPolyLinePolygon;
begin
Count:=0;
ptrPoint:=Obj.ptrFirstPoint;
while ptrPoint <> nilPtr do begin
  Space.ReadObj(Point,SizeOf(Point), ptrPoint);
  Node.X:=Point.X;
  Node.Y:=Point.Y;
  Nodes[Count]:=Node;
  inc(Count);
  ptrPoint:=Point.ptrNextObj;
  end;
end;

procedure TSpaceObjPolyLinePolygon.Update;
type
  TLine = record
    X0,Y0,
    X1,Y1: TCrd;
  end;

var
  PrimCount: integer;
  flLastNode: boolean;
  LastNode: TNodeSpaceObjPolyLinePolygon;
  NewNode,NewNode1: TNodeSpaceObjPolyLinePolygon;

  procedure GetTerminators(const Line: TLine; const X,Y: Extended; const Dist: Extended; var T,T1: TNodeSpaceObjPolyLinePolygon);
  var
    Line_Length: Extended;
    diffX1X0,diffY1Y0: Extended;
    V: Extended;
    S0_X3,S0_Y3,S1_X3,S1_Y3: Extended;
  begin
  with Line do begin
  diffX1X0:=X1-X0;
  diffY1Y0:=Y1-Y0;
  if Abs(diffY1Y0) > Abs(diffX1X0)
   then begin
    V:=Dist/Sqrt(1+Sqr(diffX1X0/diffY1Y0));
    T.X:=(V)+X;
    T.Y:=(-V)*(diffX1X0/diffY1Y0)+Y;
    T1.X:=(-V)+X;
    T1.Y:=(V)*(diffX1X0/diffY1Y0)+Y;
    end
   else begin
    if diffX1X0 = 0
     then begin
      T.X:=X;T.Y:=Y;
      T1.X:=X;T1.Y:=Y;
      Exit; ///??? проверь последстви€
      end;
    V:=Dist/Sqrt(1+Sqr(diffY1Y0/diffX1X0));
    T.Y:=(V)+Y;
    T.X:=(-V)*(diffY1Y0/diffX1X0)+X;
    T1.Y:=(-V)+Y;
    T1.X:=(V)*(diffY1Y0/diffX1X0)+X;
    end;
  end;
  end;

  procedure TreateNode(Index: integer; const LinePred,LineNext: TLine; const Width: Extended);
  var
    LinePred_dX1X0,LinePred_dY1Y0,LineNext_dX0X1,LineNext_dY0Y1: Extended;
    ALFA,BETTA,GAMMA: Extended;
    SinGAMMA: Extended;
    LinePred_Len,LineNext_Len: Extended;
    LinePred_Shift,LineNext_Shift: Extended;
    OfsX,OfsY: Extended;
    MirrorIndex: integer;
  begin
  LinePred_dX1X0:=LinePred.X1-LinePred.X0;LinePred_dY1Y0:=LinePred.Y1-LinePred.Y0;
  LineNext_dX0X1:=LineNext.X0-LineNext.X1;LineNext_dY0Y1:=LineNext.Y0-LineNext.Y1;
  LinePred_Len:=Sqrt(sqr(LinePred_dX1X0)+sqr(LinePred_dY1Y0));
  LineNext_Len:=Sqrt(sqr(LineNext_dX0X1)+sqr(LineNext_dY0Y1));
  if (LinePred_Len = 0) OR (LineNext_Len = 0) then Exit;
  if LinePred_dX1X0 <> 0 then ALFA:=Arctan(LinePred_dY1Y0/LinePred_dX1X0) else ALFA:=PI/2;
  if LineNext_dX0X1 <> 0 then BETTA:=Arctan(LineNext_dY0Y1/LineNext_dX0X1) else BETTA:=PI/2;
  GAMMA:=Abs(BETTA-ALFA);SinGAMMA:=Sin(GAMMA);
  if SinGAMMA = 0 then Exit;
  LinePred_Shift:=Width/SinGAMMA;
  LineNext_Shift:=LinePred_Shift;
  OfsX:=(LinePred_dX1X0/LinePred_Len)*LinePred_Shift+(LineNext_dX0X1/LineNext_Len)*LineNext_Shift;
  OfsY:=(LinePred_dY1Y0/LinePred_Len)*LinePred_Shift+(LineNext_dY0Y1/LineNext_Len)*LineNext_Shift;
  NewNode:=Nodes[Index];NewNode1:=Nodes[Index];
  with NewNode do begin
  X:=X+OfsX;
  Y:=Y+OfsY;
  end;
  with NewNode1 do begin
  X:=X-OfsX;
  Y:=Y-OfsY;
  end;
  MirrorIndex:=2*PrimCount-1-Index;
  if (NOT flLastNode) OR (Abs((NewNode.X-LastNode.X)*LinePred_dY1Y0-(NewNode.Y-LastNode.Y)*LinePred_dX1X0) < Abs((NewNode1.X-LastNode.X)*LinePred_dY1Y0-(NewNode1.Y-LastNode.Y)*LinePred_dX1X0))
   then begin
    Nodes[Index]:=NewNode;
    Nodes[MirrorIndex]:=NewNode1;inc(Count);
    LastNode:=NewNode;
    flLastNode:=true;
    end
   else begin
    Nodes[Index]:=NewNode1;
    Nodes[MirrorIndex]:=NewNode;inc(Count);
    LastNode:=NewNode1;
    flLastNode:=true;
    end;
  end;

var
  W: Extended;
  LineFirst,LinePred,LineNext: TLine;
  I: integer;
begin
if (Count > 1)
 then begin
  PrimCount:=Count;
  W:=Obj.Width/2.0;
  LineFirst.X0:=Nodes[0].X;LineFirst.Y0:=Nodes[0].Y;LineFirst.X1:=Nodes[1].X;LineFirst.Y1:=Nodes[1].Y;
  LinePred:=LineFirst;LineNext.X0:=LinePred.X1;LineNext.Y0:=LinePred.Y1;
  flLastNode:=false;
  if NOT Obj.flagLoop
   then begin
    //. обработка начал линии
    GetTerminators(LinePred,LinePred.X0,LinePred.Y0,W, NewNode,NewNode1);
    Nodes[0]:=NewNode;
    Nodes[2*PrimCount-1]:=NewNode1;inc(Count);
    LastNode:=NewNode;
    flLastNode:=true;
    end;
  if PrimCount > 2
   then begin
    I:=1;
    repeat
      LineNext.X1:=Nodes[I+1].X;LineNext.Y1:=Nodes[I+1].Y;
      TreateNode(I, LinePred,LineNext,W);
      LinePred:=LineNext;LineNext.X0:=LineNext.X1;LineNext.Y0:=LineNext.Y1;
      inc(I);
    until I >= PrimCount-1;
    LineNext.X1:=LineFirst.X0;LineNext.Y1:=LineFirst.Y0;
    if Obj.flagLoop
     then begin
      TreateNode(I, LinePred,LineNext,W);
      LinePred:=LineNext;LineNext.X0:=LineNext.X1;LineNext.Y0:=LineNext.Y1;
      LineNext.X1:=LineFirst.X1;LineNext.Y1:=LineFirst.Y1;
      I:=0;
      TreateNode(I, LinePred,LineNext,W);
      Nodes[Count]:=Nodes[PrimCount];Nodes[Count+1]:=Nodes[PrimCount-1];inc(Count,2);
      Exit; //. -->
      end;
    end;
  //. обработка концов линии
  GetTerminators(LinePred,LinePred.X1,LinePred.Y1,W, NewNode,NewNode1);
  if (NOT flLastNode) OR (Abs((NewNode.X-LastNode.X)*(LinePred.Y1-LinePred.Y0)-(NewNode.Y-LastNode.Y)*(LinePred.X1-LinePred.X0)) < Abs((NewNode1.X-LastNode.X)*(LinePred.Y1-LinePred.Y0)-(NewNode1.Y-LastNode.Y)*(LinePred.X1-LinePred.X0)))
   then begin
    Nodes[PrimCount-1]:=NewNode;
    Nodes[PrimCount]:=NewNode1;inc(Count);
    end
   else begin
    Nodes[PrimCount-1]:=NewNode1;
    Nodes[PrimCount]:=NewNode;inc(Count);
    end;
  end;
end;

function TSpaceObjPolyLinePolygon.TNode_Create: pointer;
begin
Result:=nil;
GetMem(Result,SizeOf(TNodeSpaceObjPolyLinePolygon));
with TNodeSpaceObjPolyLinePolygon(Result^) do begin
ptrNext:=nil;
end;
end;

procedure TSpaceObjPolyLinePolygon.Nodes_Init;
const
  N = 10;// среднее число точек незамкнутой фигуры, дл€ начального выделени€ пам€ти
var
  I: integer;
  ptrNewNode: pointer;
begin
FNodes:=nil;
for I:=0 to N-1 do begin
  ptrNewNode:=TNode_Create;
  TNodeSpaceObjPolyLinePolygon(ptrNewNode^).ptrNext:=FNodes;
  FNodes:=ptrNewNode;
  end;
end;

procedure TSpaceObjPolyLinePolygon.Nodes_Clear;
var
  ptrDelNode: pointer;
begin
while FNodes <> nil do begin
  ptrDelNode:=FNodes;
  FNodes:=TNodeSpaceObjPolyLinePolygon(ptrDelNode^).ptrNext;
  FreeMem(ptrDelNode,SizeOf(TNodeSpaceObjPolyLinePolygon));
  end;
end;

function TSpaceObjPolyLinePolygon.getNode(Index: integer): TNodeSpaceObjPolyLinePolygon;
var
  I: integer;
  ptrNode: pointer;
begin
ptrNode:=FNodes;
I:=0;
repeat
  if (ptrNode = nil) then Raise Exception.Create('TSpaceObjPolyLinePolygon.getNode: wrong index.'); //. =>
  if (I = Index)
   then begin
    Result:=TNodeSpaceObjPolyLinePolygon(ptrNode^);
    Exit;
    end;
  Inc(I);
  ptrNode:=TNodeSpaceObjPolyLinePolygon(ptrNode^).ptrNext;
until (false);
end;

procedure TSpaceObjPolyLinePolygon.setNode(Index: integer; Value: TNodeSpaceObjPolyLinePolygon);
var
  I: integer;
  ptrptrNode: pointer;
  ptrNewNode: pointer;
begin
ptrptrNode:=@FNodes;
I:=0;
repeat
  if Pointer(ptrptrNode^) = nil
   then begin
    for I:=I to Index do begin
      ptrNewNode:=TNode_Create;
      Pointer(ptrptrNode^):=ptrNewNode;
      ptrptrNode:=@TNodeSpaceObjPolyLinePolygon(ptrNewNode^).ptrNext;
      end;
    TNodeSpaceObjPolyLinePolygon(ptrNewNode^).X:=Value.X;
    TNodeSpaceObjPolyLinePolygon(ptrNewNode^).Y:=Value.Y;
    Exit;
    end;
  if I = Index
   then begin
    TNodeSpaceObjPolyLinePolygon(Pointer(ptrptrNode^)^).X:=Value.X;
    TNodeSpaceObjPolyLinePolygon(Pointer(ptrptrNode^)^).Y:=Value.Y;
    Exit;
    end;
  Inc(I);
  ptrptrNode:=@TNodeSpaceObjPolyLinePolygon(Pointer(ptrptrNode^)^).ptrNext;
until false;
end;


{TSpacePolygonTester}
Constructor TSpacePolygonTester.Create(pSpace: TProxySpace);
begin
Inherited Create;
Space:=pSpace;
PolygonNodesCount:=0;
PolygonNodes:=nil;
PolygonLay:=0;
PolygonSubLay:=0;
ExceptObjPtr:=nilPtr;
end;

Destructor TSpacePolygonTester.Destroy;
begin
Clear;
Inherited;
end;

procedure TSpacePolygonTester.Clear;
var
  ptrDelItem: pointer;
begin
while PolygonNodes <> nil do begin
  ptrDelItem:=PolygonNodes;
  PolygonNodes:=TSpacePolygonNode(ptrDelItem^).ptrNext;
  FreeMem(ptrDelItem,SizeOf(TSpacePolygonNode));
  end;
PolygonNodes:=0;
end;

procedure TSpacePolygonTester.AddNode(const pX,pY: TCrd);
var
  ptrNewItem: pointer;
begin
GetMem(ptrNewItem,SizeOf(TSpacePolygonNode));
with TSpacePolygonNode(ptrNewItem^) do begin
ptrNext:=PolygonNodes;
X:=pX;
Y:=pY;
end;
PolygonNodes:=ptrNewItem;
Inc(PolygonNodesCount);
end;

function TSpacePolygonTester.HasPointInside: boolean;
var
  PN: TByteArray;
  PolygonDATAPtr: pointer;
  ptrNode: pointer;
begin
Result:=false;
SetLength(PN,SizeOf(Integer)+PolygonNodesCount*(2*Sizeof(TCrd)));
PolygonDATAPtr:=@PN[0];
Integer(PolygonDATAPtr^):=PolygonNodesCount; PolygonDATAPtr:=Pointer(Integer(PolygonDATAPtr)+SizeOf(PolygonNodesCount));
ptrNode:=PolygonNodes;
while ptrNode <> nil do with TSpacePolygonNode(ptrNode^) do begin
  TCrd(PolygonDATAPtr^):=X; PolygonDATAPtr:=Pointer(Integer(PolygonDATAPtr)+SizeOf(X));
  TCrd(PolygonDATAPtr^):=Y; PolygonDATAPtr:=Pointer(Integer(PolygonDATAPtr)+SizeOf(Y));
  //. next
  ptrNode:=ptrNext;
  end;
//.
if (Space.GlobalSpaceRemoteManager = nil) then Raise Exception.Create('could not get SpaceRemoteManager'); //. =>
Space.GlobalSpaceRemoteManagerLock.Enter;
try
Result:=Space.GlobalSpaceRemoteManager.Polygon_HasPointInside(PN, PolygonLay,PolygonSubLay,ExceptObjPtr);
finally
Space.GlobalSpaceRemoteManagerLock.Leave;
end;
end;

function TSpacePolygonTester.IsForbiddenPrivateArea: boolean;
var
  PN: TByteArray;
  PolygonDATAPtr: pointer;
  ptrNode: pointer;
  PrivateAreas: TByteArray;
  PrivateAreasDATAPtr: pointer;
  ptrDATA: pointer;
  PrivateAreasCount: integer;
  I: integer;
  idPrivateAreaVisualization: integer;
  R: boolean;
begin
Result:=false;
SetLength(PN,SizeOf(Integer)+PolygonNodesCount*(2*Sizeof(TCrd)));
PolygonDATAPtr:=@PN[0];
Integer(PolygonDATAPtr^):=PolygonNodesCount; PolygonDATAPtr:=Pointer(Integer(PolygonDATAPtr)+SizeOf(PolygonNodesCount));
ptrNode:=PolygonNodes;
while ptrNode <> nil do with TSpacePolygonNode(ptrNode^) do begin
  TCrd(PolygonDATAPtr^):=X; PolygonDATAPtr:=Pointer(Integer(PolygonDATAPtr)+SizeOf(X));
  TCrd(PolygonDATAPtr^):=Y; PolygonDATAPtr:=Pointer(Integer(PolygonDATAPtr)+SizeOf(Y));
  //. next
  ptrNode:=ptrNext;
  end;
//.
if (Space.GlobalSpaceRemoteManager = nil) then Raise Exception.Create('could not get SpaceRemoteManager'); //. =>
Space.GlobalSpaceRemoteManagerLock.Enter;
try
R:=Space.GlobalSpaceRemoteManager.Polygon_IsPrivateAreaVisible(PN, PolygonLay,PolygonSubLay,ExceptObjPtr,  PrivateAreas)
finally
Space.GlobalSpaceRemoteManagerLock.Leave;
end;
if R
 then begin
  PrivateAreasDATAPtr:=@PrivateAreas[0];
  ptrDATA:=PrivateAreasDATAPtr;
  //. get private areas count
  asm
     PUSH ESI
     MOV ESI,ptrDATA
     CLD
     LODSD
     MOV PrivateAreasCount,EAX
     MOV ptrDATA,ESI
     POP ESI
  end;
  //.
  for I:=0 to PrivateAreasCount-1 do begin
    //. get private area id
    asm
       PUSH ESI
       MOV ESI,ptrDATA
       CLD
       LODSD
       MOV idPrivateAreaVisualization,EAX
       MOV ptrDATA,ESI
       POP ESI
    end;
    //. checking for acceptable
    try
    /// + Space.GlobalSpaceSecurity.CheckUserComponentOperation(Space.UserName,Space.UserPassword, idTPrivateAreaVisualization,idPrivateAreaVisualization, idWriteOperation);
    except
      Result:=true;
      Break; //. >
      end;
    end;
  end;
end;

function TSpacePolygonTester.Square: Extended;
begin
end;


{TObjectVisualization}
Constructor TObjectVisualization.Create;
begin
Inherited Create;
OwnObjects:=nil;
Next:=nil;
ptrFirstPoint:=nil;
PointsCount:=0;
Color:=clBlack;
Width:=0;
flLoop:=false;
flFill:=false;
ColorFill:=clBlack;
MinX:=100000000000000;
MinY:=100000000000000;
MaxX:=-100000000000000;
MaxY:=-100000000000000;
end;

Destructor TObjectVisualization.Destroy;
begin
Clear;
Inherited;
end;

function TObjectVisualization.TOwnObject_Create: TObjectVisualization;
begin
Result:=nil;
Result:=TObjectVisualization.Create;
Result.Next:=OwnObjects;
OwnObjects:=Result;
end;

procedure TObjectVisualization.Clear;
var
  ptrDelPoint: pointer;
begin
OwnObjects_Clear;
while ptrFirstPoint <> nil do begin
  ptrDelPoint:=ptrFirstPoint;
  ptrFirstPoint:=TPointObjectVisualization(ptrDelPoint^).ptrNext;
  FreeMem(ptrDelPoint,SizeOf(TPointObjectVisualization));
  end;
PointsCount:=0;
MinX:=100000000000000;
MinY:=100000000000000;
MaxX:=-100000000000000;
MaxY:=-100000000000000;
end;

procedure TObjectVisualization.AddPoint(const pX,pY: Extended);
var
  ptrNewPoint: pointer;
  ptrptrPoint: pointer;
begin
GetMem(ptrNewPoint,SizeOf(TPointObjectVisualization));
with TPointObjectVisualization(ptrNewPoint^) do begin
ptrNext:=nil;

X:=pX;
Y:=pY;
if X < MinX then MinX:=X;
if X > MaxX then MaxX:=X;
if Y < MinY then MinY:=Y;
if Y > MaxY then MaxY:=Y;
end;

ptrptrPoint:=@ptrFirstPoint;
while Pointer(ptrptrPoint^) <> nil do ptrptrPoint:=@TPointObjectVisualization(Pointer(ptrptrPoint^)^).ptrNext;
Pointer(ptrptrPoint^):=ptrNewPoint;
Inc(PointsCount);
end;

procedure TObjectVisualization.OwnObjects_Clear;
var
  DelObject: TObjectVisualization;
begin
while OwnObjects <> nil do begin
  DelObject:=OwnObjects;
  OwnObjects:=DelObject.Next;
  DelObject.Destroy;
  end;
end;

procedure TObjectVisualization.DottedReflect(Canvas: TCanvas; const Xcenter,Ycenter: integer);
var
  SavePenStyle: TPenStyle;
  SaveBrushStyle: TBrushStyle;
  ArrPoints_Count: integer;
  ArrPoints: Array[0..999] of Windows.TPoint;

  procedure TreateObj(Obj: TObjectVisualization);
  var
    ptrPoint: pointer;
    OwnObject: TObjectVisualization;
  begin
  with Obj do begin
  ptrPoint:=ptrFirstPoint;ArrPoints_Count:=0;
  while ptrPoint <> nil do with TPointObjectVisualization(ptrPoint^) do begin
    ArrPoints[ArrPoints_Count].X:=Xcenter+Round(X);
    ArrPoints[ArrPoints_Count].Y:=Ycenter-Round(Y);
    inc(ArrPoints_Count);
    ptrPoint:=ptrNext;
    end;
  Canvas.Polygon(Slice(ArrPoints, ArrPoints_Count));
  //. обрабатываем собственные объекты
  OwnObject:=OwnObjects;
  while OwnObject <> nil do begin
    TreateObj(OwnObject);
    OwnObject:=OwnObject.Next;
    end;
  end;
  end;

begin
SavePenStyle:=Canvas.Pen.Style;
SaveBrushStyle:=Canvas.Brush.Style;
Canvas.Pen.Color:=clWhite;
Canvas.Pen.Style:=psDash;
Canvas.Brush.Color:=clSilver;
Canvas.Brush.Style:=bsBDiagonal;
TreateObj(Self);
Canvas.Brush.Style:=SaveBrushStyle;
Canvas.Pen.Style:=SavePenStyle;
end;

function TObjectVisualization.AveragePoint: TPointObjectVisualization;
var
  SumX,SumY: Extended;
  PointCount: integer;

  procedure TreateObj(Obj: TObjectVisualization);
  var
    ptrPoint: pointer;
    OwnObject: TObjectVisualization;
  begin
  with Obj do begin
  ptrPoint:=ptrFirstPoint;
  while ptrPoint <> nil do with TPointObjectVisualization(ptrPoint^) do begin
    SumX:=SumX+X;
    SumY:=SumY+Y;
    inc(PointCount);
    ptrPoint:=ptrNext;
    end;
  end;
  //. обрабатываем собственные объекты
  OwnObject:=OwnObjects;
  while OwnObject <> nil do begin
    TreateObj(OwnObject);
    OwnObject:=OwnObject.Next;
    end;
  end;

begin
SumX:=0;
SumY:=0;
PointCount:=0;
TreateObj(Self);
if (PointCount = 0) then Raise Exception.Create('object has no points');
with Result do begin
ptrNext:=nil;
X:=SumX/PointCount;
Y:=SumY/PointCount;
end;
end;

procedure TObjectVisualization.Normalize; //. средн€€ точка = 0
var
  AP: TPointObjectVisualization;

  procedure TreateObj(Obj: TObjectVisualization);
  var
    ptrPoint: pointer;
    OwnObject: TObjectVisualization;
  begin
  with Obj do begin
  ptrPoint:=ptrFirstPoint;
  while ptrPoint <> nil do with TPointObjectVisualization(ptrPoint^) do begin
    X:=X-AP.X;
    Y:=Y-AP.Y;
    ptrPoint:=ptrNext;
    end;
  //. обрабатываем собственные объекты
  OwnObject:=OwnObjects;
  while OwnObject <> nil do begin
    TreateObj(OwnObject);
    OwnObject:=OwnObject.Next;
    end;
  end;
  end;

begin
AP:=AveragePoint;
TreateObj(Self);
end;

procedure TObjectVisualization.Shift(const dX,dY: Extended);

  procedure TreateObj(Obj: TObjectVisualization);
  var
    ptrPoint: pointer;
    OwnObject: TObjectVisualization;
  begin
  with Obj do begin
  ptrPoint:=ptrFirstPoint;
  while ptrPoint <> nil do with TPointObjectVisualization(ptrPoint^) do begin
    X:=X+dX;
    Y:=Y+dY;
    ptrPoint:=ptrNext;
    end;
  //. обрабатываем собственные объекты
  OwnObject:=OwnObjects;
  while OwnObject <> nil do begin
    TreateObj(OwnObject);
    OwnObject:=OwnObject.Next;
    end;
  end;
  end;

begin
TreateObj(Self);
MinX:=MinX+dX;
MinY:=MinY+dY;
MaxX:=MaxX+dX;
MaxY:=MaxY+dY;
end;


procedure ProxySpace_Initialize(const pSOAPServerURL: string; const pUserName,pUserPassword: string; const UserProxySpaceIndex: integer);
begin
if (ProxySpace <> nil) then Exit; //. ->
TProxySpace.Create(pSOAPServerURL, pUserName,pUserPassword, UserProxySpaceIndex);
end;

procedure ProxySpace_Finalize();
begin
try
if (ProxySpace <> nil)
 then begin
  ProxySpace.Destroy();
  ProxySpace:=nil;
  end;
except
  //. catch eny exceptions of thread finalization
  end;
end;

var
  I: integer;
Initialization
ProxySpace:=nil;
//.
for I:=1 to ParamCount do
  if ANSIUpperCase(ParamStr(I)) = '/DEBUG'
   then begin
    flDebugging:=true;
    Break; //. >
    end;
//.
case GetTimeZoneInformation(TimeZoneInfo) of
TIME_ZONE_ID_STANDARD: TimeZoneDelta:=TimeZoneInfo.Bias/(-60.0*24.0);
TIME_ZONE_ID_DAYLIGHT: TimeZoneDelta:=(TimeZoneInfo.Bias+TimeZoneInfo.DaylightBias)/(-60.0*24.0);
else
  TimeZoneDelta:=TimeZoneInfo.Bias/(-60.0*24.0);
end;


Finalization

end.



