unit unitGeoObjectAreaNotifier;

interface

uses
  Windows, Messages, SysUtils, SyncObjs, Variants, Classes, GlobalSpaceDefines, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ImgList, Menus, StdCtrls,
  FunctionalityImport,
  CoFunctionality,
  Buttons;

type
  TNotificationAreaEventHandler = procedure (const AreaPtr: TPtr; const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const flIncomingEvent: boolean; const NotificationAddresses: string) of object;
  TStateEventHandler = procedure (const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const OnlineFlag: boolean; const OnlineFlag_SetTimeStamp: TDateTime; const NotificationAddresses: string) of object;
  TUserAlertEventHandler = procedure (const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const AlertTimeStamp: TDateTime; const AlertSeverity: integer; const AlertDescription: string; const NotificationAddresses: string) of object;

const
  GeoObjectAreaNotifierItemsFile = 'GeoObjectAreaNotifierItems.xml';

type
  TAreaNotificationServerProfile = record //. do not modify: defined in unitAreaNotificationServer.pas
    GUID: string;
    Name: string;
    flEnabled: boolean;
    ComponentServerURL: string;
    UserName: string;
    UserPassword: string;
    UserProxySpaceIndex: integer;
    ServiceGeographServerID: integer;
    flNotificationAreaServer: boolean;
  end;
  
type
  TNotifyArea = record
    AreaType: integer;
    AreaID: integer;
    AreaObjectPtr: TPtr;
    flVisibleInside: boolean;
  end;

  TGeoObjectAreaNotifier = class;

  TItemUpdater = class
  private
    GeoObjectAreaNotifier: TGeoObjectAreaNotifier;
    ItemIndex: integer;

    Constructor Create(const pGeoObjectAreaNotifier: TGeoObjectAreaNotifier; const pItemIndex: integer);
    procedure DoOnUpdate();
    procedure DoOnDestroy();
    procedure DoOnOnlineFlagUpdate();
    procedure DoOnOnlineFlagDestroy();
    procedure DoOnUserAlertUpdate();
    procedure DoOnUserAlertDestroy();
  end;

  TNotifierItem = record
    idGeoObject: integer;
    VisualizationType: integer;
    VisualizationID: integer;
    VisualizationPtr: TPtr;
    OnlineFlagID: integer;
    UserAlertID: integer;
    ItemUpdater: TItemUpdater;
    Updater: TComponentPresentUpdater;
    OnlineFlagUpdater: TComponentPresentUpdater;
    UserAlertUpdater: TComponentPresentUpdater;
    InNotificationAreas: array of TNotifyArea;
    OutNotificationAreas: array of TNotifyArea;
    InOutNotificationAreas: array of TNotifyArea;
    NotificationAddresses: string;
    flDisabled: boolean;
  end;

  TGeoObjectAreaNotifierProcessing = class(TThread)
  private
    GeoObjectAreaNotifier: TGeoObjectAreaNotifier;

    Constructor Create(const pGeoObjectAreaNotifier: TGeoObjectAreaNotifier);
    Destructor Destroy; override;
    procedure Execute(); override;
  end;

  TGeoObjectAreaNotifier = class
  private
    Lock: TCriticalSection;
    Items: array of TNotifierItem;
    Server_TypeSystemUpdater: TTypeSystemPresentUpdater;
    Processing: TGeoObjectAreaNotifierProcessing;
    StateEventHandler: TStateEventHandler;
    EventHandler: TNotificationAreaEventHandler;
    UserAlertEventHandler: TUserAlertEventHandler;
    NotifyEventHandlerThreads: TThreadList;

    procedure ClearItem(const ItemIndex: integer);
    procedure UpdateItem(const ItemIndex: integer);
    procedure Server_ValidateItems;
    procedure Server_AddItem(const pidGeoObject: integer);
    procedure Server_DoOnTypeSystemUpdate(const idObj: integer; const Operation: TComponentOperation);
  public
    _ChangesCount: integer;

    Constructor Create;
    Destructor Destroy; override;
    procedure Clear;
    procedure Load;
    procedure Save;
    procedure Update;
    procedure AddItem(const pidGeoObject: integer);
    procedure RemoveItem(const ItemIndex: integer);
    procedure RenewItem(ItemIndex: integer);
    function IsItemExists(const pidGeoObject: integer): boolean;
    procedure ExchangeItems(const SrsIndex,DistIndex: integer);
    function Empty: boolean;
    procedure DisableEnableItem(const ItemIndex: integer; const Disable: boolean);
    procedure DisableEnableAll(const Disable: boolean);
    procedure DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
    procedure DoOnVisualizationOperation(const ptrObj: TPtr; const Act: TRevisionAct; const flRaiseEvent: boolean);
    function ChangesCount: integer; 
  end;


  TfmGeoObjectAreaNotifier = class(TForm)
    lvNotifierItems: TListView;
    Updater: TTimer;
    lvNotifierItems_ImageList: TImageList;
    PopupMenu: TPopupMenu;
    Removeselecteditem1: TMenuItem;
    Showgeoobjectpanel1: TMenuItem;
    Showgeoobjectvisualizationpanel1: TMenuItem;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Image3: TImage;
    Label3: TLabel;
    N1: TMenuItem;
    N2: TMenuItem;
    Disableselecteditem1: TMenuItem;
    Enableselecteditem1: TMenuItem;
    DisableAll1: TMenuItem;
    Enableall1: TMenuItem;
    bbShowEventsProcessor: TBitBtn;
    Bevel1: TBevel;
    procedure UpdaterTimer(Sender: TObject);
    procedure Removeselecteditem1Click(Sender: TObject);
    procedure lvNotifierItemsClick(Sender: TObject);
    procedure Showgeoobjectpanel1Click(Sender: TObject);
    procedure Showgeoobjectvisualizationpanel1Click(Sender: TObject);
    procedure lvNotifierItemsDblClick(Sender: TObject);
    procedure lvNotifierItemsDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lvNotifierItemsDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure Disableselecteditem1Click(Sender: TObject);
    procedure Enableselecteditem1Click(Sender: TObject);
    procedure DisableAll1Click(Sender: TObject);
    procedure Enableall1Click(Sender: TObject);
    procedure bbShowEventsProcessorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
    LastChange: integer;
    SelectedItemIndex: integer;

    procedure lvNotifierItems_ExchangeItems(SrsIndex,DistIndex: integer);
  public
    { Public declarations }
    Constructor Create;
    procedure UpdateItems;
  end;

var
  flServer: boolean = false;
  ServerProfile: TAreaNotificationServerProfile;
  GeoObjectAreaNotifier: TGeoObjectAreaNotifier = nil;
  GeoObjectAreaNotifierMonitor: TfmGeoObjectAreaNotifier = nil;

  procedure GeoObjectAreaNotifier_Initialize();
  procedure GeoObjectAreaNotifier_Finalize();
  procedure GeoObjectAreaNotifier_ShowPanel();

implementation
Uses
  ActiveX,
  MSXML,
  TypesDefines,
  unitCoGeoMonitorObjectFunctionality,
  unitCoGeoMonitorObjectPanelProps,
  unitNotificationAreaEventsProcessor;

{$R *.dfm}


{TStateNotifyEventHandling}
type
  TStateNotifyEventHandling = class(TThread)
  private
    Notifier: TGeoObjectAreaNotifier;
    VisualizationPtr: TPtr;
    VisualizationEventPositionX: Extended;
    VisualizationEventPositionY: Extended;
    OnlineFlag: boolean;
    OnlineFlag_SetTimeStamp: TDateTime;
    NotificationAddresses: string;

    Constructor Create(const pNotifier: TGeoObjectAreaNotifier; const pVisualizationPtr: TPtr; const pVisualizationEventPositionX,pVisualizationEventPositionY: Extended; const pOnlineFlag: boolean; const pOnlineFlag_SetTimeStamp: TDateTime; const pNotificationAddresses: string);
    procedure Execute; override;
  end;

Constructor TStateNotifyEventHandling.Create(const pNotifier: TGeoObjectAreaNotifier; const pVisualizationPtr: TPtr; const pVisualizationEventPositionX,pVisualizationEventPositionY: Extended; const pOnlineFlag: boolean; const pOnlineFlag_SetTimeStamp: TDateTime; const pNotificationAddresses: string);
begin
Notifier:=pNotifier;
Notifier.NotifyEventHandlerThreads.Add(Self);
VisualizationPtr:=pVisualizationPtr;
VisualizationEventPositionX:=pVisualizationEventPositionX;
VisualizationEventPositionY:=pVisualizationEventPositionY;
OnlineFlag:=pOnlineFlag;
OnlineFlag_SetTimeStamp:=pOnlineFlag_SetTimeStamp;
NotificationAddresses:=pNotificationAddresses;
FreeOnTerminate:=true;
Inherited Create(false);
end;

procedure TStateNotifyEventHandling.Execute;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
try
Notifier.StateEventHandler(VisualizationPtr,VisualizationEventPositionX,VisualizationEventPositionY,OnlineFlag,OnlineFlag_SetTimeStamp,NotificationAddresses);
finally
Notifier.NotifyEventHandlerThreads.Remove(Self);
end;
finally
CoUnInitialize;
end;
end;


{TUserAlertNotifyEventHandling}
type
  TUserAlertNotifyEventHandling = class(TThread)
  private
    Notifier: TGeoObjectAreaNotifier;
    VisualizationPtr: TPtr;
    VisualizationEventPositionX: Extended;
    VisualizationEventPositionY: Extended;
    AlertTimeStamp: TDateTime;
    AlertSeverity: integer;
    AlertDescription: string;
    NotificationAddresses: string;

    Constructor Create(const pNotifier: TGeoObjectAreaNotifier; const pVisualizationPtr: TPtr; const pVisualizationEventPositionX,pVisualizationEventPositionY: Extended; const pAlertTimeStamp: TDateTime; const pAlertSeverity: integer; const pAlertDescription: string; const pNotificationAddresses: string);
    procedure Execute; override;
  end;

Constructor TUserAlertNotifyEventHandling.Create(const pNotifier: TGeoObjectAreaNotifier; const pVisualizationPtr: TPtr; const pVisualizationEventPositionX,pVisualizationEventPositionY: Extended; const pAlertTimeStamp: TDateTime; const pAlertSeverity: integer; const pAlertDescription: string; const pNotificationAddresses: string);
begin
Notifier:=pNotifier;
Notifier.NotifyEventHandlerThreads.Add(Self);
VisualizationPtr:=pVisualizationPtr;
VisualizationEventPositionX:=pVisualizationEventPositionX;
VisualizationEventPositionY:=pVisualizationEventPositionY;
AlertTimeStamp:=pAlertTimeStamp;
AlertSeverity:=pAlertSeverity;
AlertDescription:=pAlertDescription;
NotificationAddresses:=pNotificationAddresses;
FreeOnTerminate:=true;
Inherited Create(false);
end;

procedure TUserAlertNotifyEventHandling.Execute;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
try
Notifier.UserAlertEventHandler(VisualizationPtr,VisualizationEventPositionX,VisualizationEventPositionY, AlertTimeStamp,AlertSeverity,AlertDescription, NotificationAddresses);
finally
Notifier.NotifyEventHandlerThreads.Remove(Self);
end;
finally
CoUnInitialize;
end;
end;


{TItemUpdater}
Constructor TItemUpdater.Create(const pGeoObjectAreaNotifier: TGeoObjectAreaNotifier; const pItemIndex: integer);
begin
Inherited Create;
GeoObjectAreaNotifier:=pGeoObjectAreaNotifier;
ItemIndex:=pItemIndex;
end;

procedure TItemUpdater.DoOnUpdate();
begin
GeoObjectAreaNotifier.RenewItem(ItemIndex);
end;

procedure TItemUpdater.DoOnDestroy();
begin
GeoObjectAreaNotifier.RemoveItem(ItemIndex);
end;

procedure TItemUpdater.DoOnOnlineFlagUpdate();

  procedure RaiseNotificationEvent(const VisualizationPtr: TPtr; const OnlineFlag: boolean; const OnlineFlag_SetTimeStamp: TDateTime; const NotificationAddresses: string);
  var
    VisualizationEventPositionX: Extended;
    VisualizationEventPositionY: Extended;
  begin
  //. get visualization Position
  try
  if (NOT ProxySpace__Obj_GetCenter(VisualizationEventPositionX,VisualizationEventPositionY, VisualizationPtr)) then Raise Exception.Create('could not get visualization position, Ptr = '+IntToStr(VisualizationPtr)); //. =>
  except
    Exit; //. ->
    end;
  //. create worker thread
  try
  if (Assigned(GeoObjectAreaNotifier.StateEventHandler)) then TStateNotifyEventHandling.Create(GeoObjectAreaNotifier, VisualizationPtr,VisualizationEventPositionX,VisualizationEventPositionY,OnlineFlag, OnlineFlag_SetTimeStamp, NotificationAddresses); //. start event handling thread
  except
    On E: Exception do ProxySpace__EventLog_WriteMajorEvent('TItemUpdater.DoOnOnlineFlagUpdate','Cannot create state notification event worker thread',E.Message);
    end;
  end;

var
  OnlineFlag: boolean;
  OnlineFlag_SetTimeStamp: TDateTime;
begin
with GeoObjectAreaNotifier do begin
Lock.Enter;
try
if (NOT ((0 <= ItemIndex) AND (ItemIndex < Length(Items)))) then Exit; //. ->
with Items[ItemIndex] do
if (OnlineFlagID <> 0)
 then begin
  with TBoolVarFunctionality(TComponentFunctionality_Create(idTBoolVar,OnlineFlagID)) do
  try
  OnlineFlag:=Value;
  OnlineFlag_SetTimeStamp:=SetTimeStamp;
  finally
  Release;
  end;
  //. fire the state event
  RaiseNotificationEvent(VisualizationPtr,OnlineFlag,OnlineFlag_SetTimeStamp,NotificationAddresses);
  end;
finally
Lock.Leave;
end;
end;
end;

procedure TItemUpdater.DoOnOnlineFlagDestroy();
begin
GeoObjectAreaNotifier.RenewItem(ItemIndex);
end;

procedure TItemUpdater.DoOnUserAlertUpdate();

  procedure RaiseNotificationEvent(const VisualizationPtr: TPtr; const AlertTimeStamp: TDateTime; const AlertSeverity: integer; const AlertDescription: string; const NotificationAddresses: string);
  var
    VisualizationEventPositionX: Extended;
    VisualizationEventPositionY: Extended;
  begin
  //. get visualization Position
  try
  if (NOT ProxySpace__Obj_GetCenter(VisualizationEventPositionX,VisualizationEventPositionY, VisualizationPtr)) then Raise Exception.Create('could not get visualization position, Ptr = '+IntToStr(VisualizationPtr)); //. =>
  except
    Exit; //. ->
    end;
  //. create worker thread
  try
  if (Assigned(GeoObjectAreaNotifier.UserAlertEventHandler)) then TUserAlertNotifyEventHandling.Create(GeoObjectAreaNotifier, VisualizationPtr,VisualizationEventPositionX,VisualizationEventPositionY, AlertTimeStamp,AlertSeverity,AlertDescription, NotificationAddresses); //. start event handling thread
  except
    On E: Exception do ProxySpace__EventLog_WriteMajorEvent('TItemUpdater.DoOnUserAlertUpdate','Cannot create notification event worker thread',E.Message);
    end;
  end;

var
  AlertIsActive: boolean;
  AlertTimeStamp: TDateTime;
  AlertSeverity: integer;
  AlertDescription: string;
begin
with GeoObjectAreaNotifier do begin
Lock.Enter;
try
if (NOT ((0 <= ItemIndex) AND (ItemIndex < Length(Items)))) then Exit; //. ->
with Items[ItemIndex] do
if (UserAlertID <> 0)
 then begin
  with TUserAlertFunctionality(TComponentFunctionality_Create(idTUserAlert,UserAlertID)) do
  try
  AlertIsActive:=Active;
  AlertTimeStamp:=TimeStamp;
  AlertSeverity:=Severity;
  AlertDescription:=Description;
  finally
  Release;
  end;
  //. fire the state event
  if (AlertIsActive) then RaiseNotificationEvent(VisualizationPtr, AlertTimeStamp,AlertSeverity,AlertDescription, NotificationAddresses);
  end;
finally
Lock.Leave;
end;
end;
end;

procedure TItemUpdater.DoOnUserAlertDestroy();
begin
GeoObjectAreaNotifier.RenewItem(ItemIndex);
end;


{TGeoObjectAreaNotifierProcessing}
Constructor TGeoObjectAreaNotifierProcessing.Create(const pGeoObjectAreaNotifier: TGeoObjectAreaNotifier);
begin
GeoObjectAreaNotifier:=pGeoObjectAreaNotifier;
Inherited Create(false);
end;

Destructor TGeoObjectAreaNotifierProcessing.Destroy;
var
  EC: DWord;
begin
//. workaround of strange behavior of ExitThread function in Dll
GetExitCodeThread(Handle,EC);
TerminateThread(Handle,EC);
//.
Inherited;
end;

procedure TGeoObjectAreaNotifierProcessing.Execute();
var
  I,J: integer;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
while (NOT Terminated) do begin
  //. validate items if they are out of context
  with GeoObjectAreaNotifier do begin
  Lock.Enter;
  try
  for I:=0 to Length(Items)-1 do if ((NOT Items[I].flDisabled) AND (Items[I].VisualizationPtr <> nilPtr)) then DoOnVisualizationOperation(Items[I].VisualizationPtr,actChangeRecursively,false);
  finally
  Lock.Leave;
  end;
  end;
  //. wait a minute
  for J:=1 to 60 do begin
    for I:=1 to 10 do begin
      if (Terminated) then Break; //. ->
      Sleep(100);
      end;
    if (Terminated) then Break; //. ->
    end;
  end;
finally
CoUnInitialize;
end;
end;


{TNotifyEventHandling}
type
  TNotifyEventHandling = class(TThread)
  private
    Notifier: TGeoObjectAreaNotifier;
    AreaPtr: TPtr;
    VisualizationPtr: TPtr;
    VisualizationEventPositionX: Extended;
    VisualizationEventPositionY: Extended;
    flIncomingEvent: boolean;
    NotificationAddresses: string;

    Constructor Create(const pNotifier: TGeoObjectAreaNotifier; const pAreaPtr: TPtr; const pVisualizationPtr: TPtr; const pVisualizationEventPositionX,pVisualizationEventPositionY: Extended; const pflIncomingEvent: boolean; const pNotificationAddresses: string);
    procedure Execute; override;
  end;

Constructor TNotifyEventHandling.Create(const pNotifier: TGeoObjectAreaNotifier; const pAreaPtr: TPtr; const pVisualizationPtr: TPtr; const pVisualizationEventPositionX,pVisualizationEventPositionY: Extended; const pflIncomingEvent: boolean; const pNotificationAddresses: string);
begin
Notifier:=pNotifier;
Notifier.NotifyEventHandlerThreads.Add(Self);
AreaPtr:=pAreaPtr;
VisualizationPtr:=pVisualizationPtr;
VisualizationEventPositionX:=pVisualizationEventPositionX;
VisualizationEventPositionY:=pVisualizationEventPositionY;
flIncomingEvent:=pflIncomingEvent;
NotificationAddresses:=pNotificationAddresses;
FreeOnTerminate:=true;
Inherited Create(false);
end;

procedure TNotifyEventHandling.Execute;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
try
Notifier.EventHandler(AreaPtr,VisualizationPtr,VisualizationEventPositionX,VisualizationEventPositionY,flIncomingEvent,NotificationAddresses);
finally
Notifier.NotifyEventHandlerThreads.Remove(Self);
end;
finally
CoUnInitialize;
end;
end;


{TGeoObjectAreaNotifier}
Constructor TGeoObjectAreaNotifier.Create;
begin
Inherited Create;
Lock:=TCriticalSection.Create;
Items:=nil;
_ChangesCount:=0;
EventHandler:=nil;
NotifyEventHandlerThreads:=TThreadList.Create;
//.
Load();
//.
if (flServer)
 then begin
  //. revise items if server works
  Server_ValidateItems();
  //.
  Server_TypeSystemUpdater:=TTypeSystemPresentUpdater_Create(idTCoComponent,Server_DoOnTypeSystemUpdate);
  end
 else Server_TypeSystemUpdater:=nil;
//.
Processing:=TGeoObjectAreaNotifierProcessing.Create(Self);
end;

Destructor TGeoObjectAreaNotifier.Destroy;
begin
if (NotifyEventHandlerThreads <> nil)
 then begin
  repeat
    with NotifyEventHandlerThreads.LockList do
    try
    if (Count = 0) then Break; //. >
    finally
    NotifyEventHandlerThreads.UnlockList;
    end;
    Sleep(100);
  until false;
  NotifyEventHandlerThreads.Destroy;
  end;
Processing.Free;
Server_TypeSystemUpdater.Free;
if (ChangesCount > 0)
 then Save();
Clear();
Lock.Free;
Inherited;
end;

procedure TGeoObjectAreaNotifier.Clear;
var
  I: integer;
begin
Lock.Enter;
try
for I:=0 to Length(Items)-1 do with Items[I] do begin
  FreeAndNil(UserAlertUpdater);
  FreeAndNil(OnlineFlagUpdater);
  FreeAndNil(Updater);
  FreeAndNil(ItemUpdater);
  SetLength(InNotificationAreas,0);
  SetLength(OutNotificationAreas,0);
  SetLength(InOutNotificationAreas,0);
  SetLength(NotificationAddresses,0);
  end;
SetLength(Items,0);
finally
Lock.Leave;
end;
end;

procedure TGeoObjectAreaNotifier.ClearItem(const ItemIndex: integer);
begin
with Items[ItemIndex] do begin
//. clear fields
VisualizationPtr:=nilPtr;
FreeAndNil(UserAlertUpdater);
FreeAndNil(OnlineFlagUpdater);
FreeAndNil(Updater);
FreeAndNil(ItemUpdater);
SetLength(InNotificationAreas,0);
SetLength(OutNotificationAreas,0);
SetLength(InOutNotificationAreas,0);
SetLength(NotificationAddresses,0);
end;
end;

procedure TGeoObjectAreaNotifier.UpdateItem(const ItemIndex: integer);
var
  CGMOF: TCoGeoMonitorObjectFunctionality;
  InComponents: TComponentsList;
  OutComponents: TComponentsList;
  InOutComponents: TComponentsList;
  I: integer;
begin
with Items[ItemIndex] do begin
ClearItem(ItemIndex);
//. set fields
try
CGMOF:=TCoGeoMonitorObjectFunctionality.Create(idGeoObject);
try
CGMOF.GetVisualizationComponent(VisualizationType,VisualizationID);
with TBaseVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
try
VisualizationPtr:=Ptr;
finally
Release;
end;
//.
CGMOF.GetInOutNotificationAreaComponents({out} InComponents,OutComponents,InOutComponents);
try
SetLength(InNotificationAreas,InComponents.Count);
SetLength(OutNotificationAreas,OutComponents.Count);
SetLength(InOutNotificationAreas,InOutComponents.Count);
for I:=0 to InComponents.Count-1 do with TItemComponentsList(InComponents[I]^) do
  try
  with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)) do
  try
  InNotificationAreas[I].AreaObjectPtr:=Ptr;
  InNotificationAreas[I].AreaType:=idTComponent;
  InNotificationAreas[I].AreaID:=idComponent;
  InNotificationAreas[I].flVisibleInside:=false;
  finally
  Release;
  end;
  except
    InNotificationAreas[I].AreaObjectPtr:=nilPtr;
    end;
for I:=0 to OutComponents.Count-1 do with TItemComponentsList(OutComponents[I]^) do
  try
  with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)) do
  try
  OutNotificationAreas[I].AreaObjectPtr:=Ptr;
  OutNotificationAreas[I].AreaType:=idTComponent;
  OutNotificationAreas[I].AreaID:=idComponent;
  OutNotificationAreas[I].flVisibleInside:=true;
  finally
  Release;
  end;
  except
    OutNotificationAreas[I].AreaObjectPtr:=nilPtr;
    end;
for I:=0 to InOutComponents.Count-1 do with TItemComponentsList(InOutComponents[I]^) do
  try
  with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)) do
  try
  InOutNotificationAreas[I].AreaObjectPtr:=Ptr;
  InOutNotificationAreas[I].AreaType:=idTComponent;
  InOutNotificationAreas[I].AreaID:=idComponent;
  InOutNotificationAreas[I].flVisibleInside:=false;
  finally
  Release;
  end;
  except
    InOutNotificationAreas[I].AreaObjectPtr:=nilPtr;
    end;
NotificationAddresses:=CGMOF.NotificationAddresses;
finally
InComponents.Destroy;
OutComponents.Destroy;
InOutComponents.Destroy;
end;
ItemUpdater:=TItemUpdater.Create(Self,ItemIndex);
//.
Updater:=TComponentPresentUpdater_Create(idTCoComponent,idGeoObject, ItemUpdater.DoOnUpdate,ItemUpdater.DoOnDestroy);
//.
if (CGMOF.GetOnlineFlagComponent(OnlineFlagID))
 then OnlineFlagUpdater:=TComponentPresentUpdater_Create(idTBoolVar,OnlineFlagID, ItemUpdater.DoOnOnlineFlagUpdate,ItemUpdater.DoOnOnlineFlagDestroy)
 else begin
  OnlineFlagID:=0;
  OnlineFlagUpdater:=nil;
  end;
if (CGMOF.GetUserAlertComponent(UserAlertID))
 then UserAlertUpdater:=TComponentPresentUpdater_Create(idTUserAlert,UserAlertID, ItemUpdater.DoOnUserAlertUpdate,ItemUpdater.DoOnUserAlertDestroy)
 else begin
  UserAlertID:=0;
  UserAlertUpdater:=nil;
  end;
finally
CGMOF.Release;
end;
except
  //. invalidate item
  ClearItem(ItemIndex);
  end;
end;
end;

procedure TGeoObjectAreaNotifier.Load; 
var
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  SpacePackIDNode: IXMLDOMNode;
  SpacePackID: integer;
  flSpacePackIDIsChanged: boolean;
  ItemsNode: IXMLDOMNode;
  I,J: integer;
  ItemNode: IXMLDOMNode;
  AreasNode,AreaNode: IXMLDOMNode;
  CGMOF: TCoGeoMonitorObjectFunctionality;
begin
Lock.Enter;
try
Clear();
if (FileExists(ProxySpace_GetCurrentUserProfile+'\'+GeoObjectAreaNotifierItemsFile))
 then begin
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(ProxySpace_GetCurrentUserProfile+'\'+GeoObjectAreaNotifierItemsFile);
  VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Exit; //. ->
  SpacePackIDNode:=Doc.documentElement.selectSingleNode('/ROOT/SpacePackID');
  SpacePackID:=SpacePackIDNode.nodeTypedValue;
  flSpacePackIDIsChanged:=(SpacePackID <> ProxySpace_SpacePackID);
  ItemsNode:=Doc.documentElement.selectSingleNode('/ROOT/Items');
  SetLength(Items,ItemsNode.childNodes.length);
  for I:=0 to ItemsNode.childNodes.length-1 do begin
    ItemNode:=ItemsNode.childNodes[I];
    //.
    FillChar(Items[I], SizeOf(TNotifierItem), 0);
    try
    with Items[I] do begin
    idGeoObject:=ItemNode.selectSingleNode('idGeoObject').nodeTypedValue;
    VisualizationType:=ItemNode.selectSingleNode('VisualizationType').nodeTypedValue;
    VisualizationID:=ItemNode.selectSingleNode('VisualizationID').nodeTypedValue;
    VisualizationPtr:=ItemNode.selectSingleNode('VisualizationPtr').nodeTypedValue;
    OnlineFlagID:=ItemNode.selectSingleNode('OnlineFlagID').nodeTypedValue;
    UserAlertID:=ItemNode.selectSingleNode('UserAlertID').nodeTypedValue;
    //.
    if ((VisualizationPtr <> nilPtr) AND (flSpacePackIDIsChanged))
     then with TBaseVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
      try
      VisualizationPtr:=Ptr;
      finally
      Release;
      end;
    //.
    AreasNode:=ItemNode.selectSingleNode('InNotificationAreas');
    if (AreasNode <> nil)
     then begin
      SetLength(InNotificationAreas,AreasNode.childNodes.length);
      for J:=0 to AreasNode.childNodes.length-1 do with InNotificationAreas[J] do begin
        AreaNode:=AreasNode.childNodes[J];
        AreaType:=AreaNode.selectSingleNode('AreaType').nodeTypedValue;
        AreaID:=AreaNode.selectSingleNode('AreaID').nodeTypedValue;
        AreaObjectPtr:=AreaNode.selectSingleNode('AreaObjectPtr').nodeTypedValue;
        //.
        if ((AreaObjectPtr <> nilPtr) AND (flSpacePackIDIsChanged))
         then with TBaseVisualizationFunctionality(TComponentFunctionality_Create(AreaType,AreaID)) do
          try
          AreaObjectPtr:=Ptr;
          finally
          Release;
          end;
        //.
        flVisibleInside:=AreaNode.selectSingleNode('flVisibleInside').nodeTypedValue;
        end;
      end;
    //.
    AreasNode:=ItemNode.selectSingleNode('OutNotificationAreas');
    if (AreasNode <> nil)
     then begin
      SetLength(OutNotificationAreas,AreasNode.childNodes.length);
      for J:=0 to AreasNode.childNodes.length-1 do with OutNotificationAreas[J] do begin
        AreaNode:=AreasNode.childNodes[J];
        AreaType:=AreaNode.selectSingleNode('AreaType').nodeTypedValue;
        AreaID:=AreaNode.selectSingleNode('AreaID').nodeTypedValue;
        AreaObjectPtr:=AreaNode.selectSingleNode('AreaObjectPtr').nodeTypedValue;
        //.
        if ((AreaObjectPtr <> nilPtr) AND (flSpacePackIDIsChanged))
         then with TBaseVisualizationFunctionality(TComponentFunctionality_Create(AreaType,AreaID)) do
          try
          AreaObjectPtr:=Ptr;
          finally
          Release;
          end;
        //.
        flVisibleInside:=AreaNode.selectSingleNode('flVisibleInside').nodeTypedValue;
        end;
      end;
    //.
    AreasNode:=ItemNode.selectSingleNode('InOutNotificationAreas');
    if (AreasNode <> nil)
     then begin
      SetLength(InOutNotificationAreas,AreasNode.childNodes.length);
      for J:=0 to AreasNode.childNodes.length-1 do with InOutNotificationAreas[J] do begin
        AreaNode:=AreasNode.childNodes[J];
        AreaType:=AreaNode.selectSingleNode('AreaType').nodeTypedValue;
        AreaID:=AreaNode.selectSingleNode('AreaID').nodeTypedValue;
        AreaObjectPtr:=AreaNode.selectSingleNode('AreaObjectPtr').nodeTypedValue;
        //.
        if ((AreaObjectPtr <> nilPtr) AND (flSpacePackIDIsChanged))
         then with TBaseVisualizationFunctionality(TComponentFunctionality_Create(AreaType,AreaID)) do
          try
          AreaObjectPtr:=Ptr;
          finally
          Release;
          end;
        //.
        flVisibleInside:=AreaNode.selectSingleNode('flVisibleInside').nodeTypedValue;
        end;
      end;
    //.
    NotificationAddresses:=ItemNode.selectSingleNode('NotificationAddresses').nodeTypedValue;
    flDisabled:=ItemNode.selectSingleNode('flDisabled').nodeTypedValue;
    //.
    ItemUpdater:=TItemUpdater.Create(Self,I);
    //.
    Updater:=TComponentPresentUpdater_Create(idTCoComponent,idGeoObject, ItemUpdater.DoOnUpdate,ItemUpdater.DoOnDestroy);
    //.
    if (OnlineFlagID <> 0)
     then OnlineFlagUpdater:=TComponentPresentUpdater_Create(idTBoolVar,OnlineFlagID, ItemUpdater.DoOnOnlineFlagUpdate,ItemUpdater.DoOnOnlineFlagDestroy)
     else OnlineFlagUpdater:=nil;
    //.
    if (UserAlertID <> 0)
     then UserAlertUpdater:=TComponentPresentUpdater_Create(idTUserAlert,UserAlertID, ItemUpdater.DoOnUserAlertUpdate,ItemUpdater.DoOnUserAlertDestroy)
     else UserAlertUpdater:=nil;
    end;
    except
      //. invalidate item
      ClearItem(I);
      end;
    end;
  end;
_ChangesCount:=0;
finally
Lock.Leave;
end;
end;

procedure TGeoObjectAreaNotifier.Save;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  SpacePackIDNode: IXMLDOMElement;
  ItemsNode: IXMLDOMElement;
  I,J: integer;
  ItemNode: IXMLDOMElement;
  //.
  PropNode: IXMLDOMElement;
  //.
  AreasNode: IXMLDOMElement;
  AreaNode: IXMLDOMElement;
begin
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
SpacePackIDNode:=Doc.createElement('SpacePackID');
SpacePackIDNode.nodeTypedValue:=ProxySpace_SpacePackID;
Root.appendChild(SpacePackIDNode);
ItemsNode:=Doc.createElement('Items');
Root.appendChild(ItemsNode);
for I:=0 to Length(Items)-1 do if (Items[I].VisualizationPtr <> nilPtr) then with Items[I] do begin
  try
  //. create item
  ItemNode:=Doc.CreateElement('Item'+IntToStr(I));
  //.
  PropNode:=Doc.CreateElement('idGeoObject');           PropNode.nodeTypedValue:=idGeoObject;       ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('VisualizationType');     PropNode.nodeTypedValue:=VisualizationType; ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('VisualizationID');       PropNode.nodeTypedValue:=VisualizationID;   ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('VisualizationPtr');      PropNode.nodeTypedValue:=VisualizationPtr;  ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('OnlineFlagID');          PropNode.nodeTypedValue:=OnlineFlagID;      ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('UserAlertID');          PropNode.nodeTypedValue:=UserAlertID;      ItemNode.appendChild(PropNode);
  //.
  AreasNode:=Doc.CreateElement('InNotificationAreas');
  for J:=0 to Length(InNotificationAreas)-1 do with InNotificationAreas[J] do begin
    AreaNode:=Doc.CreateElement('Area'+IntToStr(J));
    PropNode:=Doc.CreateElement('AreaType');        PropNode.nodeTypedValue:=AreaType;        AreaNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('AreaID');          PropNode.nodeTypedValue:=AreaID;          AreaNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('AreaObjectPtr');   PropNode.nodeTypedValue:=AreaObjectPtr;   AreaNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('flVisibleInside'); PropNode.nodeTypedValue:=flVisibleInside; AreaNode.appendChild(PropNode);
    AreasNode.appendChild(AreaNode);
    end;
  ItemNode.appendChild(AreasNode);
  //.
  AreasNode:=Doc.CreateElement('OutNotificationAreas');
  for J:=0 to Length(OutNotificationAreas)-1 do with OutNotificationAreas[J] do begin
    AreaNode:=Doc.CreateElement('Area'+IntToStr(J));
    PropNode:=Doc.CreateElement('AreaType');        PropNode.nodeTypedValue:=AreaType;        AreaNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('AreaID');          PropNode.nodeTypedValue:=AreaID;          AreaNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('AreaObjectPtr');   PropNode.nodeTypedValue:=AreaObjectPtr;   AreaNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('flVisibleInside'); PropNode.nodeTypedValue:=flVisibleInside; AreaNode.appendChild(PropNode);
    AreasNode.appendChild(AreaNode);
    end;
  ItemNode.appendChild(AreasNode);
  //.
  AreasNode:=Doc.CreateElement('InOutNotificationAreas');
  for J:=0 to Length(InOutNotificationAreas)-1 do with InOutNotificationAreas[J] do begin
    AreaNode:=Doc.CreateElement('Area'+IntToStr(J));
    PropNode:=Doc.CreateElement('AreaType');        PropNode.nodeTypedValue:=AreaType;        AreaNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('AreaID');          PropNode.nodeTypedValue:=AreaID;          AreaNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('AreaObjectPtr');   PropNode.nodeTypedValue:=AreaObjectPtr;   AreaNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('flVisibleInside'); PropNode.nodeTypedValue:=flVisibleInside; AreaNode.appendChild(PropNode);
    AreasNode.appendChild(AreaNode);
    end;
  ItemNode.appendChild(AreasNode);
  //.
  PropNode:=Doc.CreateElement('NotificationAddresses'); PropNode.nodeTypedValue:=NotificationAddresses; ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('flDisabled');            PropNode.nodeTypedValue:=flDisabled;            ItemNode.appendChild(PropNode);
  //. add item
  ItemsNode.appendChild(ItemNode);
  except
    end;
  end;
//. save xml document
Doc.Save(ProxySpace_GetCurrentUserProfile+'\'+GeoObjectAreaNotifierItemsFile);
_ChangesCount:=0;
finally
Lock.Leave;
end;
end;

procedure TGeoObjectAreaNotifier.Update;
var
  I: integer;
begin
Lock.Enter;
try
for I:=0 to Length(Items)-1 do begin
  UpdateItem(I);
  //. validate item
  if ((NOT Items[I].flDisabled) AND (Items[I].VisualizationPtr <> nilPtr)) then DoOnVisualizationOperation(Items[I].VisualizationPtr,actChangeRecursively,false);
  end;
//.
Inc(_ChangesCount);
finally
Lock.Leave;
end;
end;

procedure TGeoObjectAreaNotifier.AddItem(const pidGeoObject: integer);
var
  I: integer;
  Idx: integer;
begin
Lock.Enter;
try
for I:=0 to Length(Items)-1 do if (Items[I].idGeoObject = pidGeoObject) then Raise Exception.Create('such item is already exists in the area notifier monitor'); //. =>
Idx:=Length(Items); SetLength(Items,Idx+1);
FillChar(Items[Idx], SizeOf(TNotifierItem), 0);
Items[Idx].idGeoObject:=pidGeoObject;
Items[Idx].flDisabled:=false;
UpdateItem(Idx);
if (Items[Idx].VisualizationPtr <> nilPtr)
 then begin
  //. add Notification Subscription component
  with Items[Idx] do begin
  //. add visualization
  ProxySpace__NotificationSubscription_RemoveComponent(VisualizationType,VisualizationID);
  ProxySpace__NotificationSubscription_AddComponent(VisualizationType,VisualizationID);
  end;
  //. validate item
  DoOnVisualizationOperation(Items[Idx].VisualizationPtr,actChangeRecursively,true);
  //. save after done
  //. not needed if (flSave) then Save();
  //.
  Inc(_ChangesCount);
  end;
finally
Lock.Leave;
end;
end;

procedure TGeoObjectAreaNotifier.RemoveItem(const ItemIndex: integer);
var
  I: integer;
begin
Lock.Enter;
try
if (NOT ((0 <= ItemIndex) AND (ItemIndex < Length(Items)))) then Exit; //. ->
//. remove Notification Subscription component
with Items[ItemIndex] do ProxySpace__NotificationSubscription_RemoveComponent(VisualizationType,VisualizationID);
//.
ClearItem(ItemIndex);
for I:=ItemIndex to Length(Items)-2 do Items[I]:=Items[I+1];
SetLength(Items,Length(Items)-1);
//. save after done
//. not needed Save();
//.
Inc(_ChangesCount);
finally
Lock.Leave;
end;
end;

procedure TGeoObjectAreaNotifier.RenewItem(ItemIndex: integer);
begin
Lock.Enter;
try
if (NOT ((0 <= ItemIndex) AND (ItemIndex < Length(Items)))) then Exit; //. ->
//.
GeoObjectAreaNotifier.UpdateItem(ItemIndex);
//. save after done
//. not needed Save();
//.
Inc(_ChangesCount);
finally
Lock.Leave;
end;
end;

function TGeoObjectAreaNotifier.IsItemExists(const pidGeoObject: integer): boolean;
var
  I: integer;
begin
Result:=false;
Lock.Enter;
try
for I:=0 to Length(Items)-1 do
  if ((Items[I].idGeoObject = pidGeoObject) AND (Items[I].VisualizationPtr <> nilPtr))
   then begin
    Result:=true;
    Exit; //. ->
    end;
finally
Lock.Leave;
end;
end;

procedure TGeoObjectAreaNotifier.ExchangeItems(const SrsIndex,DistIndex: integer);
var
  ExchangeItem: TNotifierItem;
  I: integer;
begin
Lock.Enter;
try
if (NOT (((0 <= SrsIndex) AND (SrsIndex < Length(Items)))
        AND
        ((0 <= DistIndex) AND (DistIndex < Length(Items)))
        AND
        (SrsIndex <> DistIndex)
       ))
 then Exit; //. ->
ExchangeItem:=Items[SrsIndex];
I:=SrsIndex;
if (DistIndex < SrsIndex)
 then begin
  while (I > DistIndex) do begin
    Items[I]:=Items[I-1];
    Dec(I);
    end;
  end
 else begin
  while (I < DistIndex) do begin
    Items[I]:=Items[I+1];
    Inc(I);
    end;
  end;
Items[DistIndex]:=ExchangeItem;
//. save after done
//. not needed Save();
finally
Lock.Leave;
end;
end;

function TGeoObjectAreaNotifier.Empty: boolean;
begin
Lock.Enter;
try
Result:=(Length(Items) = 0);
finally
Lock.Leave;
end;
end;

procedure TGeoObjectAreaNotifier.DisableEnableItem(const ItemIndex: integer; const Disable: boolean);
begin
Lock.Enter;
try
if (NOT ((0 <= ItemIndex) AND (ItemIndex < Length(Items)))) then Exit; //. ->
Items[ItemIndex].flDisabled:=Disable;
//. validate item
if ((NOT Items[ItemIndex].flDisabled) AND (Items[ItemIndex].VisualizationPtr <> nilPtr)) then DoOnVisualizationOperation(Items[ItemIndex].VisualizationPtr,actChangeRecursively,true);
//.
Inc(_ChangesCount);
finally
Lock.Leave;
end;
end;

procedure TGeoObjectAreaNotifier.DisableEnableAll(const Disable: boolean);
var
  I: integer;
begin
Lock.Enter;
try
for I:=0 to Length(Items)-1 do begin
  Items[I].flDisabled:=Disable;
  //. validate item
  if ((NOT Items[I].flDisabled) AND (Items[I].VisualizationPtr <> nilPtr)) then DoOnVisualizationOperation(Items[I].VisualizationPtr,actChangeRecursively,true);
  end;
//.
Inc(_ChangesCount);
finally
Lock.Leave;
end;
end;

procedure TGeoObjectAreaNotifier.DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
var
  flAddItem: boolean;
  idGeoGraphServer: integer;
begin
if ((flServer) AND (Operation = opUpdate) AND (idTObj = idTCoComponent) AND (NOT IsItemExists(idObj)))
 then
  try
  flAddItem:=false;
  with FunctionalityImport.TCoComponentFunctionality(TComponentFunctionality_Create(idTObj,idObj)) do
  try
  if (idCoType = idTCoGeoMonitorObject)
   then begin
    if (ServerProfile.ServiceGeographServerID <> 0)
     then with TCoGeoMonitorObjectFunctionality.Create(idObj) do
      try
      flAddItem:=(GetGeoGraphServer({out} idGeoGraphServer) AND (idGeoGraphServer = ServerProfile.ServiceGeographServerID));
      finally
      Release();
      end
     else flAddItem:=true;
    end;
  finally
  Release;
  end;
  if (flAddItem) then Server_AddItem(idObj);
  except
    On E: Exception do ProxySpace__EventLog_WriteMinorEvent('TGeoObjectAreaNotifier.DoOnComponentOperation','Cannot process a new object for area-notifier (idTObj = '+IntToStr(idTObj)+','+IntToStr(idObj)+')',E.Message);
    end;
end;

procedure TGeoObjectAreaNotifier.DoOnVisualizationOperation(const ptrObj: TPtr; const Act: TRevisionAct; const flRaiseEvent: boolean);

  procedure RaiseNotificationEvent(const AreaPtr: TPtr; const VisualizationPtr: TPtr; const flIncomingEvent: boolean; const NotificationAddresses: string);
  var
    VisualizationEventPositionX: Extended;
    VisualizationEventPositionY: Extended;
  begin
  //. get visualization Position
  try
  if (NOT ProxySpace__Obj_GetCenter(VisualizationEventPositionX,VisualizationEventPositionY, VisualizationPtr)) then Raise Exception.Create('could not get visualization position, Ptr = '+IntToStr(VisualizationPtr)); //. =>
  except
    Exit; //. ->
    end;
  //. create worker thread
  try
  if (Assigned(EventHandler)) then TNotifyEventHandling.Create(Self, AreaPtr,VisualizationPtr,VisualizationEventPositionX,VisualizationEventPositionY,flIncomingEvent,NotificationAddresses); //. start event handling thread
  except
    On E: Exception do ProxySpace__EventLog_WriteMajorEvent('TGeoObjectAreaNotifier.DoOnVisualizationOperation','Cannot create notification event worker thread',E.Message);
    end;
  end;

var
  I,J: integer;
  _flVisibleInside: boolean;
begin
if (Act in [actChange,actChangeRecursively])
 then begin
  Lock.Enter;
  try
  for I:=0 to Length(Items)-1 do with Items[I] do if (NOT flDisabled) then
    if (VisualizationPtr = ptrObj)
     then begin
      for J:=0 to Length(InNotificationAreas)-1 do with InNotificationAreas[J] do
        if (AreaObjectPtr <> nilPtr)
         then
          try
          _flVisibleInside:=ProxySpace__Obj_ObjIsVisibleInside(VisualizationPtr,AreaObjectPtr);
          if (_flVisibleInside <> flVisibleInside)
           then begin
            flVisibleInside:=_flVisibleInside;
            //.
            if (flVisibleInside AND flRaiseEvent) then RaiseNotificationEvent(AreaObjectPtr,VisualizationPtr,true,NotificationAddresses);
            //.
            Inc(_ChangesCount);
            end;
          except
            end;
      for J:=0 to Length(OutNotificationAreas)-1 do with OutNotificationAreas[J] do
        if (AreaObjectPtr <> nilPtr)
         then
          try
          _flVisibleInside:=ProxySpace__Obj_ObjIsVisibleInside(VisualizationPtr,AreaObjectPtr);
          if (_flVisibleInside <> flVisibleInside)
           then begin
            flVisibleInside:=_flVisibleInside;
            //.
            if (NOT flVisibleInside AND flRaiseEvent) then RaiseNotificationEvent(AreaObjectPtr,VisualizationPtr,false,NotificationAddresses);
            //.
            Inc(_ChangesCount);
            end;
          except
            end;
      for J:=0 to Length(InOutNotificationAreas)-1 do with InOutNotificationAreas[J] do
        if (AreaObjectPtr <> nilPtr)
         then
          try
          _flVisibleInside:=ProxySpace__Obj_ObjIsVisibleInside(VisualizationPtr,AreaObjectPtr);
          if (_flVisibleInside <> flVisibleInside)
           then begin
            flVisibleInside:=_flVisibleInside;
            //.
            if (flVisibleInside AND flRaiseEvent) then RaiseNotificationEvent(AreaObjectPtr,VisualizationPtr,true,NotificationAddresses);
            if (NOT flVisibleInside AND flRaiseEvent) then RaiseNotificationEvent(AreaObjectPtr,VisualizationPtr,false,NotificationAddresses);
            //.
            Inc(_ChangesCount);
            end;
          except
            end;
      //.
      Exit; //. ->
      end
     else
      if (VisualizationPtr <> nilPtr)
       then begin
        for J:=0 to Length(InNotificationAreas)-1 do with InNotificationAreas[J] do
          if (AreaObjectPtr = ptrObj)
           then
            try
            _flVisibleInside:=ProxySpace__Obj_ObjIsVisibleInside(VisualizationPtr,AreaObjectPtr);
            if (_flVisibleInside <> flVisibleInside)
             then begin
              flVisibleInside:=_flVisibleInside;
              //.
              if (flVisibleInside AND flRaiseEvent) then RaiseNotificationEvent(AreaObjectPtr,VisualizationPtr,true,NotificationAddresses);
              //.
              Inc(_ChangesCount);
              end;
            except
              end;
        for J:=0 to Length(OutNotificationAreas)-1 do with OutNotificationAreas[J] do
          if (AreaObjectPtr = ptrObj)
           then
            try
            _flVisibleInside:=ProxySpace__Obj_ObjIsVisibleInside(VisualizationPtr,AreaObjectPtr);
            if (_flVisibleInside <> flVisibleInside)
             then begin
              flVisibleInside:=_flVisibleInside;
              //.
              if ((NOT flVisibleInside) AND flRaiseEvent) then RaiseNotificationEvent(AreaObjectPtr,VisualizationPtr,false,NotificationAddresses);
              //.
              Inc(_ChangesCount);
              end;
            except
              end;
        for J:=0 to Length(InOutNotificationAreas)-1 do with InOutNotificationAreas[J] do
          if (AreaObjectPtr = ptrObj)
           then
            try
            _flVisibleInside:=ProxySpace__Obj_ObjIsVisibleInside(VisualizationPtr,AreaObjectPtr);
            if (_flVisibleInside <> flVisibleInside)
             then begin
              flVisibleInside:=_flVisibleInside;
              //.
              if (flVisibleInside AND flRaiseEvent) then RaiseNotificationEvent(AreaObjectPtr,VisualizationPtr,true,NotificationAddresses);
              if ((NOT flVisibleInside) AND flRaiseEvent) then RaiseNotificationEvent(AreaObjectPtr,VisualizationPtr,false,NotificationAddresses);
              //.
              Inc(_ChangesCount);
              end;
            except
              end;
        end
  finally
  Lock.Leave;
  end;
  end
 else
  if (Act in [actRemove,actRemoveRecursively])
   then begin
    Lock.Enter;
    try
    for I:=0 to Length(Items)-1 do with Items[I] do
      if (VisualizationPtr = ptrObj)
       then begin
        {//. not needed here
        ClearItem(I);}
        VisualizationPtr:=nilPtr; 
        Inc(_ChangesCount);
        Exit; //. ->
        end
       else begin
        for J:=0 to Length(InNotificationAreas)-1 do with InNotificationAreas[J] do
          if (AreaObjectPtr = ptrObj)
           then begin
            AreaObjectPtr:=nilPtr;
            Inc(_ChangesCount);
            Exit; //. ->
            end;
        for J:=0 to Length(OutNotificationAreas)-1 do with OutNotificationAreas[J] do
          if (AreaObjectPtr = ptrObj)
           then begin
            AreaObjectPtr:=nilPtr;
            Inc(_ChangesCount);
            Exit; //. ->
            end;
        for J:=0 to Length(InOutNotificationAreas)-1 do with InOutNotificationAreas[J] do
          if (AreaObjectPtr = ptrObj)
           then begin
            AreaObjectPtr:=nilPtr;
            Inc(_ChangesCount);
            Exit; //. ->
            end;
        end;
    finally
    Lock.Leave;
    end;
    end;
end;

function TGeoObjectAreaNotifier.ChangesCount: integer;
begin
Lock.Enter;
try
Result:=_ChangesCount;
finally
Lock.Leave;
end;
end;

procedure TGeoObjectAreaNotifier.Server_ValidateItems;
var
  CL: TList;
  I: integer;
  flAdded: boolean;
  flAddItem: boolean;
  idGeoGraphServer: integer;
begin
with FunctionalityImport.TTCoComponentFunctionality(TTypeFunctionality_Create(idTCoComponent)) do
try
GetInstanceListByCoType(idTCoGeoMonitorObject, CL);
try
Lock.Enter;
try
flAdded:=false;
for I:=0 to CL.Count-1 do
  if (NOT IsItemExists(Integer(CL[I])))
   then
    try
    flAddItem:=false;
    if (ServerProfile.ServiceGeographServerID <> 0)
     then with TCoGeoMonitorObjectFunctionality.Create(Integer(CL[I])) do
      try
      flAddItem:=(GetGeoGraphServer({out} idGeoGraphServer) AND (idGeoGraphServer = ServerProfile.ServiceGeographServerID));
      finally
      Release();
      end
     else flAddItem:=true;
    if (flAddItem)
     then begin
      Server_AddItem(Integer(CL[I]));
      flAdded:=true;
      end;
    except
      On E: Exception do ProxySpace__EventLog_WriteMinorEvent('TGeoObjectAreaNotifier.Server_ValidateItems','Cannot process a new object for area-notifier (idTObj = '+IntToStr(idTCoComponent)+','+IntToStr(Integer(CL[I]))+')',E.Message);
      end;
//. not needed if (flAdded) then Save();
finally
Lock.Leave;
end;
finally
CL.Destroy;
end;
finally
Release;
end;
end;

procedure TGeoObjectAreaNotifier.Server_AddItem(const pidGeoObject: integer);
var
  flHasReadAccess: boolean;
begin
with TComponentFunctionality_Create(idTCoComponent,pidGeoObject) do
try
try
CheckUserOperation(idReadOperation);
flHasReadAccess:=true;
except
  flHasReadAccess:=false;
  end;
finally
Release;
end;
if (flHasReadAccess) then AddItem(pidGeoObject);
end;

procedure TGeoObjectAreaNotifier.Server_DoOnTypeSystemUpdate(const idObj: integer; const Operation: TComponentOperation);
begin
DoOnComponentOperation(idTCoComponent,idObj,Operation);
end;


{TfmGeoObjectAreaNotifier}
Constructor TfmGeoObjectAreaNotifier.Create;
begin
Inherited Create(nil);
LastChange:=-1;
SelectedItemIndex:=-1;
end;

procedure TfmGeoObjectAreaNotifier.UpdateItems;
var
  I,J: integer;
  flIn,flOut: boolean;
begin
with lvNotifierItems do begin
Items.BeginUpdate;
try
Items.Clear;
if (GeoObjectAreaNotifier = nil) then Exit; //. ->
with GeoObjectAreaNotifier do begin
Lock.Enter;
try
for I:=0 to Length(GeoObjectAreaNotifier.Items)-1 do with GeoObjectAreaNotifier.Items[I],lvNotifierItems.Items.Add do begin
  if (NOT flDisabled)
   then begin
    flIn:=false;
    flOut:=false;
    for J:=0 to Length(InNotificationAreas)-1 do with InNotificationAreas[J] do flIn:=(flIn OR flVisibleInside);
    for J:=0 to Length(OutNotificationAreas)-1 do with OutNotificationAreas[J] do flOut:=(flOut OR (NOT flVisibleInside));
    for J:=0 to Length(InOutNotificationAreas)-1 do with InOutNotificationAreas[J] do begin
      flIn:=(flIn OR flVisibleInside);
      flOut:=(flOut OR (NOT flVisibleInside));
      end;
    if (flIn AND flOut)
     then begin
      ImageIndex:=2;
      Caption:='"In-Out"';
      end
     else
      if (flOut)
       then begin
        ImageIndex:=0;
        Caption:='"Out"';
        end
       else
        if (flIn)
         then begin
          ImageIndex:=1;
          Caption:='"In"';
          end
         else ImageIndex:=-1;
    end
   else begin
    Caption:='disabled';
    ImageIndex:=-1;
    end;
  //.
  try
  with TCoGeoMonitorObjectFunctionality.Create(idGeoObject) do
  try
  SubItems.Add(Name);
  finally
  Release;
  end;
  if (VisualizationPtr <> nilPtr)
   then SubItems.Add('valid')
   else SubItems.Add('invalid');
  except
    SubItems.Add('?');
    SubItems.Add('invalid');
    end;
  end;
finally
Lock.Leave;
end;
end;
if (SelectedItemIndex <> -1)
 then
  if ((0 <= SelectedItemIndex) AND (SelectedItemIndex < Items.Count))
   then begin
    Items[SelectedItemIndex].Selected:=true;
    Items[SelectedItemIndex].Focused:=true;
    end
   else SelectedItemIndex:=-1;
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmGeoObjectAreaNotifier.lvNotifierItems_ExchangeItems(SrsIndex,DistIndex: integer);
var
  P: pointer;
  S,S1,S2: string;
  II: integer;
  I: integer;
begin
with lvNotifierItems do begin
if NOT (((0 <= SrsIndex) AND (SrsIndex < Items.Count))
        AND
        ((0 <= DistIndex) AND (DistIndex < Items.Count))
        AND
        (SrsIndex <> DistIndex)
       )
 then Exit;
Items.BeginUpdate;
try
P:=Items[SrsIndex].Data;
S:=Items[SrsIndex].Caption;
S1:=Items[SrsIndex].SubItems[0];
S2:=Items[SrsIndex].SubItems[1];
II:=Items[SrsIndex].ImageIndex;
I:=SrsIndex;
if DistIndex < SrsIndex
 then begin
  while I > DistIndex do begin
    Items[I].Data:=Items[I-1].Data;
    Items[I].Caption:=Items[I-1].Caption;
    Items[I].SubItems[0]:=Items[I-1].SubItems[0];
    Items[I].SubItems[1]:=Items[I-1].SubItems[1];
    Items[I].ImageIndex:=Items[I-1].ImageIndex;
    Dec(I);
    end;
  end
 else begin
  while I < DistIndex do begin
    Items[I].Data:=Items[I+1].Data;
    Items[I].Caption:=Items[I+1].Caption;
    Items[I].SubItems[0]:=Items[I+1].SubItems[0];
    Items[I].SubItems[1]:=Items[I+1].SubItems[1];
    Items[I].ImageIndex:=Items[I+1].ImageIndex;
    Inc(I);
    end;
  end;
Items[DistIndex].Data:=P;
Items[DistIndex].Caption:=S;
Items[DistIndex].SubItems[0]:=S1;
Items[DistIndex].SubItems[1]:=S2;
Items[DistIndex].ImageIndex:=II;
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmGeoObjectAreaNotifier.UpdaterTimer(Sender: TObject);
var
  ChangeNum: integer;
begin
if (GeoObjectAreaNotifier = nil) then Exit; //. ->
if (NOT (Visible AND (WindowState <> wsMinimized))) then Exit; //. ->
ChangeNum:=GeoObjectAreaNotifier.ChangesCount;
if (ChangeNum <> LastChange)
 then begin
  UpdateItems();
  //.
  LastChange:=ChangeNum;
  end;
end;

procedure TfmGeoObjectAreaNotifier.lvNotifierItemsClick(Sender: TObject);
begin
if (lvNotifierItems.Selected <> nil) then SelectedItemIndex:=lvNotifierItems.Selected.Index;
end;

procedure TfmGeoObjectAreaNotifier.Showgeoobjectpanel1Click(Sender: TObject);
var
  idGeoObject: integer;
begin
if (GeoObjectAreaNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1)
 then with GeoObjectAreaNotifier do begin
  Lock.Enter;
  try
  if ((0 <= SelectedItemIndex) AND (SelectedItemIndex < Length(Items)))
   then idGeoObject:=Items[SelectedItemIndex].idGeoObject
   else idGeoObject:=0;
  finally
  Lock.Leave;
  end;
  if (idGeoObject <> 0)
   then
    try
    with TCoGeoMonitorObjectPanelProps.Create(idGeoObject) do begin
    Position:=poScreenCenter;
    Show();
    end;
    except
      with TComponentFunctionality_Create(idTCoComponent,idGeoObject) do
      try
      with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
      Left:=Round((Screen.Width-Width)/2);
      Top:=Screen.Height-Height-20;
      Show();
      end;
      finally
      Release;
      end;
      end;
  end;
end;

procedure TfmGeoObjectAreaNotifier.Showgeoobjectvisualizationpanel1Click(Sender: TObject);
var
  _VisualizationType,_VisualizationID: integer;
begin
if (GeoObjectAreaNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1)
 then with GeoObjectAreaNotifier do begin
  Lock.Enter;
  try
  if ((0 <= SelectedItemIndex) AND (SelectedItemIndex < Length(Items)))
   then with Items[SelectedItemIndex] do begin
    if (VisualizationPtr = nilPtr) then Raise Exception.Create('wrong item'); //. =>
    _VisualizationType:=VisualizationType;
    _VisualizationID:=VisualizationID;
    end
   else Raise Exception.Create('no such item'); //. =>
  finally
  Lock.Leave;
  end;
  end;
with TComponentFunctionality_Create(_VisualizationType,_VisualizationID) do
try
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TfmGeoObjectAreaNotifier.Removeselecteditem1Click(Sender: TObject);
begin
if (GeoObjectAreaNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1) then GeoObjectAreaNotifier.RemoveItem(SelectedItemIndex);
UpdateItems;
end;

procedure TfmGeoObjectAreaNotifier.lvNotifierItemsDblClick(Sender: TObject);
begin
Showgeoobjectpanel1Click(nil);
end;

procedure TfmGeoObjectAreaNotifier.lvNotifierItemsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
if (Sender = Source) then Accept:=true;
end;

procedure TfmGeoObjectAreaNotifier.lvNotifierItemsDragDrop(Sender,Source: TObject; X, Y: Integer);
var
  Item: TListItem;
begin
if (GeoObjectAreaNotifier = nil) then Exit; //. ->
if (Sender = Source)
 then with (Sender as TListView) do begin
  Item:=GetItemAt(X,Y);
  if (Item = nil) then Exit; //. ->
  GeoObjectAreaNotifier.ExchangeItems(Selected.Index,Item.Index);
  lvNotifierItems_ExchangeItems(Selected.Index,Item.Index);
  ItemFocused:=Item;
  Selected:=Item;
  end;
end;

procedure TfmGeoObjectAreaNotifier.Disableselecteditem1Click(Sender: TObject);
begin
if (GeoObjectAreaNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1) then GeoObjectAreaNotifier.DisableEnableItem(SelectedItemIndex,true);
end;

procedure TfmGeoObjectAreaNotifier.Enableselecteditem1Click(Sender: TObject);
begin
if (GeoObjectAreaNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1) then GeoObjectAreaNotifier.DisableEnableItem(SelectedItemIndex,false);
end;

procedure TfmGeoObjectAreaNotifier.DisableAll1Click(Sender: TObject);
begin
if (GeoObjectAreaNotifier = nil) then Exit; //. ->
GeoObjectAreaNotifier.DisableEnableAll(true);
end;

procedure TfmGeoObjectAreaNotifier.Enableall1Click(Sender: TObject);
begin
if (GeoObjectAreaNotifier = nil) then Exit; //. ->
GeoObjectAreaNotifier.DisableEnableAll(false);
end;

procedure TfmGeoObjectAreaNotifier.bbShowEventsProcessorClick(Sender: TObject);
begin
if (NotificationAreaEventsProcessor <> nil) then NotificationAreaEventsProcessor.Panel.Show();
end;

procedure TfmGeoObjectAreaNotifier.FormShow(Sender: TObject);
begin
Updater.Enabled:=true;
end;

procedure TfmGeoObjectAreaNotifier.FormHide(Sender: TObject);
begin
Updater.Enabled:=false;
end;

procedure GeoObjectAreaNotifier_Initialize();
begin
flServer:=(ProxySpace_ProxySpaceServerType = pssAreaNotification);
if (flServer) then ServerProfile:=TAreaNotificationServerProfile(ProxySpace_ProxySpaceServerProfile()^);
//.
GeoObjectAreaNotifier:=TGeoObjectAreaNotifier.Create;
if (NotificationAreaEventsProcessor <> nil)
 then begin
  GeoObjectAreaNotifier.EventHandler:=NotificationAreaEventsProcessor.ProcessEvent;
  GeoObjectAreaNotifier.StateEventHandler:=NotificationAreaEventsProcessor.ProcessStateEvent;
  GeoObjectAreaNotifier.UserAlertEventHandler:=NotificationAreaEventsProcessor.ProcessUserAlertEvent;
  end;
GeoObjectAreaNotifierMonitor:=TfmGeoObjectAreaNotifier.Create();
end;

procedure GeoObjectAreaNotifier_Finalize();
begin
FreeAndNil(GeoObjectAreaNotifierMonitor);
FreeAndNil(GeoObjectAreaNotifier);
end;

procedure GeoObjectAreaNotifier_ShowPanel();
begin
if (GeoObjectAreaNotifierMonitor <> nil) then GeoObjectAreaNotifierMonitor.Show();
end;


Initialization

Finalization
GeoObjectAreaNotifierMonitor.Free;
GeoObjectAreaNotifier.Free;

end.
