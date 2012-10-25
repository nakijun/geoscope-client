unit unitNotificationAreaNotifier;

interface

uses
  Windows, Messages, SysUtils, SyncObjs, Variants, Classes, GlobalSpaceDefines, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ImgList, Menus,
  FunctionalityImport,
  CoFunctionality,
  unitGeoObjectAreaNotifier,
  StdCtrls, Buttons;

type
  TNotificationAreaEventHandler = procedure (const AreaPtr: TPtr; const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const flIncomingEvent: boolean; const NotificationAddresses: string) of object;

const
  NotificationAreaNotifierItemsFile = 'NotificationAreaNotifierItems.xml';
type
  TVisibleInsideObject = record
    Next: pointer;
    ptrObj: TPtr;
  end;

  TNotificationAreaNotifier = class;

  TItemUpdater = class
  private
    NotificationAreaNotifier: TNotificationAreaNotifier;
    ItemIndex: integer;

    Constructor Create(const pNotificationAreaNotifier: TNotificationAreaNotifier; const pItemIndex: integer);
    procedure DoOnUpdate();
    procedure DoOnDestroy();
  end;

  TNotifierItem = record
    idNotificationArea: integer;
    VisualizationType: integer;
    VisualizationID: integer;
    VisualizationPtr: TPtr;
    ItemUpdater: TItemUpdater;
    Updater: TComponentPresentUpdater;
    SpaceWindowUpdater: TObject;
    VisibleInsideObjects: pointer;
    NotificationAddresses: string;
    flDisabled: boolean;
  end;

  TNotificationAreaNotifierProcessing = class(TThread)
  private
    NotificationAreaNotifier: TNotificationAreaNotifier;

    Constructor Create(const pNotificationAreaNotifier: TNotificationAreaNotifier);
    Destructor Destroy; override;
    procedure Execute(); override;
  end;

  TNotificationAreaNotifier = class
  private
    Lock: TCriticalSection;
    Items: array of TNotifierItem;
    Server_TypeSystemUpdater: TTypeSystemPresentUpdater;
    Processing: TNotificationAreaNotifierProcessing;
    EventHandler: TNotificationAreaEventHandler;
    NotifyEventHandlerThreads: TThreadList;

    procedure ClearItem(const ItemIndex: integer);
    procedure UpdateItem(const ItemIndex: integer);
    procedure Server_ValidateItems;
    procedure Server_AddItem(const pidNotificationArea: integer);
    procedure Server_DoOnTypeSystemUpdate(const idObj: integer; const Operation: TComponentOperation);
  public
    _ChangesCount: integer;

    Constructor Create;
    Destructor Destroy; override;
    procedure Clear;
    procedure Load;
    procedure Save;
    procedure Update;
    procedure AddItem(const pidNotificationArea: integer);
    procedure RemoveItem(const ItemIndex: integer);
    procedure RenewItem(ItemIndex: integer);
    function IsItemExists(const pidNotificationArea: integer): boolean;
    procedure ExchangeItems(const SrsIndex,DistIndex: integer);
    function Empty: boolean;
    procedure DisableEnableItem(const ItemIndex: integer; const Disable: boolean);
    procedure DisableEnableAll(const Disable: boolean);
    procedure DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
    procedure DoOnVisualizationOperation(const ptrObj: TPtr; const Act: TRevisionAct; const flRaiseEvent: boolean);
    function ChangesCount: integer; 
  end;


  TfmNotificationAreaNotifier = class(TForm)
    lvNotifierItems: TListView;
    Updater: TTimer;
    lvNotifierItems_ImageList: TImageList;
    PopupMenu: TPopupMenu;
    Removeselecteditem1: TMenuItem;
    ShowItemPanel1: TMenuItem;
    ShowItemVisualizationpanel1: TMenuItem;
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
    Bevel1: TBevel;
    bbShowEventsProcessor: TBitBtn;
    procedure UpdaterTimer(Sender: TObject);
    procedure Removeselecteditem1Click(Sender: TObject);
    procedure lvNotifierItemsClick(Sender: TObject);
    procedure ShowItemPanel1Click(Sender: TObject);
    procedure ShowItemVisualizationpanel1Click(Sender: TObject);
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
  NotificationAreaNotifier: TNotificationAreaNotifier = nil;
  NotificationAreaNotifierMonitor: TfmNotificationAreaNotifier = nil;

  procedure NotificationAreaNotifier_Initialize();
  procedure NotificationAreaNotifier_Finalize();
  procedure NotificationAreaNotifier_ShowPanel();

implementation
Uses
  ActiveX,
  MSXML,
  unitCoNotificationAreaFunctionality,
  unitCoNotificationAreaPanelProps,
  unitNotificationAreaEventsProcessor;

{$R *.dfm}


{TItemUpdater}
Constructor TItemUpdater.Create(const pNotificationAreaNotifier: TNotificationAreaNotifier; const pItemIndex: integer);
begin
Inherited Create;
NotificationAreaNotifier:=pNotificationAreaNotifier;
ItemIndex:=pItemIndex;
end;

procedure TItemUpdater.DoOnUpdate();
begin
NotificationAreaNotifier.RenewItem(ItemIndex);
end;

procedure TItemUpdater.DoOnDestroy();
begin
NotificationAreaNotifier.RemoveItem(ItemIndex);
end;


{TNotificationAreaNotifierProcessing}
Constructor TNotificationAreaNotifierProcessing.Create(const pNotificationAreaNotifier: TNotificationAreaNotifier);
begin
NotificationAreaNotifier:=pNotificationAreaNotifier;
Inherited Create(false);
end;

Destructor TNotificationAreaNotifierProcessing.Destroy;
var
  EC: DWord;
begin
//. workaround of strange behavior of ExitThread function in Dll
GetExitCodeThread(Handle,EC);
TerminateThread(Handle,EC);
//.
Inherited;
end;

procedure TNotificationAreaNotifierProcessing.Execute();
var
  I,J: integer;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
while (NOT Terminated) do begin
  //. validate items if they are out of context
  with NotificationAreaNotifier do begin
  Lock.Enter;
  try
  for I:=0 to Length(Items)-1 do if ((NOT Items[I].flDisabled) AND (Items[I].VisualizationPtr <> nilPtr)) then DoOnVisualizationOperation(Items[I].VisualizationPtr,actChangeRecursively,true);
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
    Notifier: TNotificationAreaNotifier;
    AreaPtr: TPtr;
    VisualizationPtr: TPtr;
    VisualizationEventPositionX: Extended;
    VisualizationEventPositionY: Extended;
    flIncomingEvent: boolean;
    NotificationAddresses: string;

    Constructor Create(const pNotifier: TNotificationAreaNotifier; const pAreaPtr: TPtr; const pVisualizationPtr: TPtr; const pVisualizationEventPositionX,pVisualizationEventPositionY: Extended; const pflIncomingEvent: boolean; const pNotificationAddresses: string);
    procedure Execute; override;
  end;

Constructor TNotifyEventHandling.Create(const pNotifier: TNotificationAreaNotifier; const pAreaPtr: TPtr; const pVisualizationPtr: TPtr; const pVisualizationEventPositionX,pVisualizationEventPositionY: Extended; const pflIncomingEvent: boolean; const pNotificationAddresses: string);
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


{TNotificationAreaNotifier}
Constructor TNotificationAreaNotifier.Create;
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
  //. revise items if server work
  Server_ValidateItems();
  //.
  Server_TypeSystemUpdater:=TTypeSystemPresentUpdater_Create(idTCoComponent,Server_DoOnTypeSystemUpdate);
  end
 else Server_TypeSystemUpdater:=nil;
//.
Processing:=TNotificationAreaNotifierProcessing.Create(Self);
end;

Destructor TNotificationAreaNotifier.Destroy;
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

procedure TNotificationAreaNotifier.Clear;
var
  I: integer;
  ptrDestroyItem: pointer;
begin
Lock.Enter;
try
for I:=0 to Length(Items)-1 do with Items[I] do begin
  FreeAndNil(Updater);
  FreeAndNil(ItemUpdater);
  FreeAndNil(SpaceWindowUpdater);
  while (VisibleInsideObjects <> nil) do begin
    ptrDestroyItem:=VisibleInsideObjects;
    VisibleInsideObjects:=TVisibleInsideObject(ptrDestroyItem^).Next;
    FreeMem(ptrDestroyItem,SizeOf(TVisibleInsideObject));
    end;
  SetLength(NotificationAddresses,0);
  end;
SetLength(Items,0);
finally
Lock.Leave;
end;
end;

procedure TNotificationAreaNotifier.ClearItem(const ItemIndex: integer);
var
  ptrDestroyItem: pointer;
begin
with Items[ItemIndex] do begin
//. clear fields
VisualizationPtr:=nilPtr;
FreeAndNil(Updater);
FreeAndNil(ItemUpdater);
FreeAndNil(SpaceWindowUpdater);
while (VisibleInsideObjects <> nil) do begin
  ptrDestroyItem:=VisibleInsideObjects;
  VisibleInsideObjects:=TVisibleInsideObject(ptrDestroyItem^).Next;
  FreeMem(ptrDestroyItem,SizeOf(TVisibleInsideObject));
  end;
SetLength(NotificationAddresses,0);
end;
end;

procedure TNotificationAreaNotifier.UpdateItem(const ItemIndex: integer);
var
  minX,minY,maxX,maxY: Extended;
  Objects: TPtrArray;
  I: integer;
  ptrNewVisibleInsideObject: pointer;
  CNF: TCoNotificationAreaFunctionality;
begin
with Items[ItemIndex] do begin
ClearItem(ItemIndex);
//. set fields
try
CNF:=TCoNotificationAreaFunctionality.Create(idNotificationArea);
try
CNF.GetVisualizationComponent(VisualizationType,VisualizationID);
with TBaseVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
try
VisualizationPtr:=Ptr;
finally
Release;
end;
if (NOT ProxySpace__Obj_GetMinMax(minX,minY,maxX,maxY,VisualizationPtr)) then Raise Exception.Create('TNotificationAreaNotifier.UpdateItem: ProxySpace__Obj_GetMinMax is failed'); //. =>
//. add self to the context updating
ItemUpdater:=TItemUpdater.Create(Self,ItemIndex);
Updater:=TComponentPresentUpdater_Create(idTCoComponent,idNotificationArea, ItemUpdater.DoOnUpdate,ItemUpdater.DoOnDestroy);
SpaceWindowUpdater:=ProxySpace__TSpaceWindowUpdater_Create(minX,minY,maxX,maxY);
//. update
CNF.GetObjectsVisibleInside(Objects);
for I:=0 to Length(Objects)-1 do if (Objects[I] <> VisualizationPtr) then begin
  GetMem(ptrNewVisibleInsideObject,SizeOf(TVisibleInsideObject));
  TVisibleInsideObject(ptrNewVisibleInsideObject^).ptrObj:=Objects[I];
  TVisibleInsideObject(ptrNewVisibleInsideObject^).Next:=VisibleInsideObjects;
  VisibleInsideObjects:=ptrNewVisibleInsideObject;
  end;
NotificationAddresses:=CNF.NotificationAddresses;
if (Length(NotificationAddresses) <= 3) then Raise Exception.Create('TNotificationAreaNotifier.UpdateItem: Notifications addresses string length is too short'); //. =>
finally
CNF.Release;
end;
except
  //. invalidate item
  ClearItem(ItemIndex);
  end;
end;
end;

procedure TNotificationAreaNotifier.Load;
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
  VisibleObjectsNode,VisibleObjectNode: IXMLDOMNode;
  idTObj,idObj: integer;
  ptrptrLastVisibleObj,ptrNewVisibleObject: pointer;
  minX,minY,maxX,maxY: Extended;
begin
Lock.Enter;
try
Clear();
if (FileExists(ProxySpace_GetCurrentUserProfile+'\'+NotificationAreaNotifierItemsFile))
 then begin
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(ProxySpace_GetCurrentUserProfile+'\'+NotificationAreaNotifierItemsFile);
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
    idNotificationArea:=ItemNode.selectSingleNode('idNotificationArea').nodeTypedValue;
    VisualizationType:=ItemNode.selectSingleNode('VisualizationType').nodeTypedValue;
    VisualizationID:=ItemNode.selectSingleNode('VisualizationID').nodeTypedValue;
    VisualizationPtr:=ItemNode.selectSingleNode('VisualizationPtr').nodeTypedValue;
    //.
    if ((VisualizationPtr <> nilPtr) AND (flSpacePackIDIsChanged))
     then with TBaseVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
      try
      VisualizationPtr:=Ptr;
      finally
      Release;
      end;
    //.
    VisibleObjectsNode:=ItemNode.selectSingleNode('VisibleObjects');
    ptrptrLastVisibleObj:=@VisibleInsideObjects;
    for J:=0 to VisibleObjectsNode.childNodes.length-1 do begin
      VisibleObjectNode:=VisibleObjectsNode.childNodes[J];
      //.
      GetMem(ptrNewVisibleObject,SizeOf(TVisibleInsideObject));
      TVisibleInsideObject(ptrNewVisibleObject^).Next:=nil;
      TVisibleInsideObject(ptrNewVisibleObject^).ptrObj:=VisibleObjectNode.selectSingleNode('ptrObj').nodeTypedValue;
      //.
      Pointer(ptrptrLastVisibleObj^):=ptrNewVisibleObject;
      ptrptrLastVisibleObj:=@TVisibleInsideObject(ptrNewVisibleObject^).Next;
      //. validate pointer
      if ((TVisibleInsideObject(ptrNewVisibleObject^).ptrObj <> nilPtr) AND (flSpacePackIDIsChanged))
       then begin
        idTObj:=VisibleObjectNode.selectSingleNode('idTObj').nodeTypedValue;
        idObj:=VisibleObjectNode.selectSingleNode('idObj').nodeTypedValue;
        with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTObj,idObj)) do
        try
        TVisibleInsideObject(ptrNewVisibleObject^).ptrObj:=Ptr;
        finally
        Release;
        end;
        end;
      end;
    //.
    NotificationAddresses:=ItemNode.selectSingleNode('NotificationAddresses').nodeTypedValue;
    flDisabled:=ItemNode.selectSingleNode('flDisabled').nodeTypedValue;
    //.
    ItemUpdater:=TItemUpdater.Create(Self,I);
    Updater:=TComponentPresentUpdater_Create(idTCoComponent,idNotificationArea, ItemUpdater.DoOnUpdate,ItemUpdater.DoOnDestroy);
    //.
    if (NOT ProxySpace__Obj_GetMinMax(minX,minY,maxX,maxY,VisualizationPtr)) then Raise Exception.Create('TNotificationAreaNotifier.Load: ProxySpace__Obj_GetMinMax is failed'); //. =>
    SpaceWindowUpdater:=ProxySpace__TSpaceWindowUpdater_Create(minX,minY,maxX,maxY);
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

procedure TNotificationAreaNotifier.Save;
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
  VisibleObjectsNode: IXMLDOMElement;
  ptrVisibleObjItem: pointer;
  VisibleObjectNode: IXMLDOMElement;
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
  PropNode:=Doc.CreateElement('idNotificationArea');    PropNode.nodeTypedValue:=idNotificationArea; ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('VisualizationType');     PropNode.nodeTypedValue:=VisualizationType;  ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('VisualizationID');       PropNode.nodeTypedValue:=VisualizationID;    ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('VisualizationPtr');      PropNode.nodeTypedValue:=VisualizationPtr;   ItemNode.appendChild(PropNode);
  //.
  VisibleObjectsNode:=Doc.CreateElement('VisibleObjects');
  J:=0;
  ptrVisibleObjItem:=VisibleInsideObjects;
  while (ptrVisibleObjItem <> nil) do with TVisibleInsideObject(ptrVisibleObjItem^) do begin
    VisibleObjectNode:=Doc.CreateElement('Obj'+IntToStr(J));
    PropNode:=Doc.CreateElement('idTObj');      PropNode.nodeTypedValue:=ProxySpace__Obj_IDType(ptrObj); VisibleObjectNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('idObj');       PropNode.nodeTypedValue:=ProxySpace__Obj_ID(ptrObj);     VisibleObjectNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('ptrObj');      PropNode.nodeTypedValue:=ptrObj;                         VisibleObjectNode.appendChild(PropNode);
    VisibleObjectsNode.appendChild(VisibleObjectNode);
    //.
    Inc(J);
    ptrVisibleObjItem:=Next;
    end;
  ItemNode.appendChild(VisibleObjectsNode);
  //.
  PropNode:=Doc.CreateElement('NotificationAddresses'); PropNode.nodeTypedValue:=NotificationAddresses; ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('flDisabled');            PropNode.nodeTypedValue:=flDisabled;            ItemNode.appendChild(PropNode);
  //. add item
  ItemsNode.appendChild(ItemNode);
  except
    end;
  end;
//. save xml document
Doc.Save(ProxySpace_GetCurrentUserProfile+'\'+NotificationAreaNotifierItemsFile);
_ChangesCount:=0;
finally
Lock.Leave;
end;
end;

procedure TNotificationAreaNotifier.Update;
var
  I: integer;
begin
Lock.Enter;
try
for I:=0 to Length(Items)-1 do begin
  UpdateItem(I);
  //.
  if (Items[I].VisualizationPtr <> nilPtr)
   then begin //. validate item
    if (NOT Items[I].flDisabled) then DoOnVisualizationOperation(Items[I].VisualizationPtr,actChangeRecursively,false);
    end
   else RemoveItem(I);
  end;
//.
Inc(_ChangesCount);
finally
Lock.Leave;
end;
end;

procedure TNotificationAreaNotifier.AddItem(const pidNotificationArea: integer);
var
  I: integer;
  Idx: integer;
  minX,minY,maxX,maxY: Extended;
begin
Lock.Enter;
try
for I:=0 to Length(Items)-1 do if (Items[I].idNotificationArea = pidNotificationArea) then Raise Exception.Create('such item is already exists in the area notifier monitor'); //. =>
Idx:=Length(Items); SetLength(Items,Idx+1);
FillChar(Items[Idx], SizeOf(TNotifierItem), 0);
Items[Idx].idNotificationArea:=pidNotificationArea;
Items[Idx].flDisabled:=false;
UpdateItem(Idx);
if (Items[Idx].VisualizationPtr <> nilPtr)
 then begin
  //. add Notification Subscription window
  with Items[Idx] do begin
  if (NOT ProxySpace__Obj_GetMinMax(minX,minY,maxX,maxY,VisualizationPtr)) then Raise Exception.Create('TItemUpdater.DoOnUpdate: ProxySpace__Obj_GetMinMax is failed'); //. =>
  ProxySpace__NotificationSubscription_RemoveWindow('NotificationArea'+IntToStr(idNotificationArea));
  ProxySpace__NotificationSubscription_AddWindow(minX,minY,maxX,minY,maxX,maxY,minX,maxY,'NotificationArea'+IntToStr(idNotificationArea));
  end;
  //. validate item
  DoOnVisualizationOperation(Items[Idx].VisualizationPtr,actChangeRecursively,true);
  //. save after done
  //. not needed if (flSave) then Save();
  //.
  Inc(_ChangesCount);
  end
 else RemoveItem(Idx);
finally
Lock.Leave;
end;
end;

procedure TNotificationAreaNotifier.RemoveItem(const ItemIndex: integer);
var
  I: integer;
begin
Lock.Enter;
try
if (NOT ((0 <= ItemIndex) AND (ItemIndex < Length(Items)))) then Exit; //. ->
//. remove self to the Updates Notification subscription
ProxySpace__NotificationSubscription_RemoveWindow('NotificationArea'+IntToStr(Items[ItemIndex].idNotificationArea));
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

procedure TNotificationAreaNotifier.RenewItem(ItemIndex: integer);
var
  minX,minY,maxX,maxY: Extended;
begin
Lock.Enter;
try
if (NOT ((0 <= ItemIndex) AND (ItemIndex < Length(Items)))) then Exit; //. ->
//. remove Notification Subscription window
with Items[ItemIndex] do
if (VisualizationPtr <> nilPtr) then ProxySpace__NotificationSubscription_RemoveWindow('NotificationArea'+IntToStr(idNotificationArea));
//.
UpdateItem(ItemIndex);
//.
with Items[ItemIndex] do
if (VisualizationPtr <> nilPtr)
 then begin
  //. add Notification Subscription window
  if (NOT ProxySpace__Obj_GetMinMax(minX,minY,maxX,maxY,VisualizationPtr)) then Raise Exception.Create('TItemUpdater.DoOnUpdate: ProxySpace__Obj_GetMinMax is failed'); //. =>
  ProxySpace__NotificationSubscription_AddWindow(minX,minY,maxX,minY,maxX,maxY,minX,maxY,'NotificationArea'+IntToStr(idNotificationArea));
  //. save after done
  //. not needed Save();
  //.
  Inc(_ChangesCount);
  end
 else RemoveItem(ItemIndex);
finally
Lock.Leave;
end;
end;

function TNotificationAreaNotifier.IsItemExists(const pidNotificationArea: integer): boolean;
var
  I: integer;
begin
Result:=false;
Lock.Enter;
try
for I:=0 to Length(Items)-1 do
  if (Items[I].idNotificationArea = pidNotificationArea)
   then begin
    Result:=true;
    Exit; //. ->
    end;
finally
Lock.Leave;
end;
end;

procedure TNotificationAreaNotifier.ExchangeItems(const SrsIndex,DistIndex: integer);
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
    if (Items[I].ItemUpdater <> nil) then Items[I].ItemUpdater.ItemIndex:=I;
    Dec(I);
    end;
  end
 else begin
  while (I < DistIndex) do begin
    Items[I]:=Items[I+1];
    if (Items[I].ItemUpdater <> nil) then Items[I].ItemUpdater.ItemIndex:=I; 
    Inc(I);
    end;
  end;
Items[DistIndex]:=ExchangeItem;
if (Items[DistIndex].ItemUpdater <> nil) then Items[DistIndex].ItemUpdater.ItemIndex:=DistIndex;
//. save after done
//. not needed Save();
finally
Lock.Leave;
end;
end;

function TNotificationAreaNotifier.Empty: boolean;
begin
Lock.Enter;
try
Result:=(Length(Items) = 0);
finally
Lock.Leave;
end;
end;

procedure TNotificationAreaNotifier.DisableEnableItem(const ItemIndex: integer; const Disable: boolean);
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

procedure TNotificationAreaNotifier.DisableEnableAll(const Disable: boolean);
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

procedure TNotificationAreaNotifier.DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
if ((flServer) AND (Operation = opUpdate) AND (idTObj = idTCoComponent) AND (NOT IsItemExists(idObj)))
 then
  try
  with FunctionalityImport.TCoComponentFunctionality(TComponentFunctionality_Create(idTObj,idObj)) do
  try
  if (idCoType = idTCoNotificationArea) then Server_AddItem(idObj);
  finally
  Release;
  end;
  except
    On E: Exception do ProxySpace__EventLog_WriteMinorEvent('TNotificationAreaNotifier.DoOnComponentOperation','Cannot process a new object for area-notifier (idTObj = '+IntToStr(idTObj)+','+IntToStr(idObj)+')',E.Message);
    end;
end;

procedure TNotificationAreaNotifier.DoOnVisualizationOperation(const ptrObj: TPtr; const Act: TRevisionAct; const flRaiseEvent: boolean);

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
    On E: Exception do ProxySpace__EventLog_WriteMajorEvent('TNotificationAreaNotifier.DoOnVisualizationOperation','Cannot create notification event worker thread',E.Message);
    end;
  end;

var
  I,J: integer;
  _flVisibleInside: boolean;
  ptrptrVisibleInsideObject: pointer;
  flInList: boolean;
  ptrRemoveVisibleInsideObject: pointer;
  ptrNewVisibleInsideObject: pointer;
  minX,minY,maxX,maxY: Extended;
  OutsideObjPtr: TPtr;
begin
if (Act in [actChange,actChangeRecursively])
 then begin
  Lock.Enter;
  try
  for I:=0 to Length(Items)-1 do with Items[I] do if (NOT flDisabled) then
    if (VisualizationPtr <> ptrObj)
     then begin
      if (VisualizationPtr <> nilPtr)
       then begin
        try
        _flVisibleInside:=ProxySpace__Obj_ObjIsVisibleInside(ptrObj,VisualizationPtr);
        except
          _flVisibleInside:=false;
          end;
        flInList:=false;
        ptrptrVisibleInsideObject:=@VisibleInsideObjects;
        while (Pointer(ptrptrVisibleInsideObject^) <> nil) do begin
          if (TVisibleInsideObject(Pointer(ptrptrVisibleInsideObject^)^).ptrObj = ptrObj)
           then begin
            if (NOT _flVisibleInside)
             then begin //. remove obj from visible list
              ptrRemoveVisibleInsideObject:=Pointer(ptrptrVisibleInsideObject^);
              Pointer(ptrptrVisibleInsideObject^):=TVisibleInsideObject(ptrRemoveVisibleInsideObject^).Next;
              FreeMem(ptrRemoveVisibleInsideObject,SizeOf(TVisibleInsideObject));
              //.
              if (flRaiseEvent) then RaiseNotificationEvent(VisualizationPtr,ptrObj,false,NotificationAddresses);
              //.
              Inc(_ChangesCount);
              end;
            flInList:=true;
            Break //. >
            end;
          //.
          ptrptrVisibleInsideObject:=@TVisibleInsideObject(Pointer(ptrptrVisibleInsideObject^)^).Next;
          end;
        //. add new obj to the visible objects list
        if (_flVisibleInside AND NOT flInList)
         then begin
          GetMem(ptrNewVisibleInsideObject,SizeOf(TVisibleInsideObject));
          TVisibleInsideObject(ptrNewVisibleInsideObject^).ptrObj:=ptrObj;
          TVisibleInsideObject(ptrNewVisibleInsideObject^).Next:=VisibleInsideObjects;
          VisibleInsideObjects:=ptrNewVisibleInsideObject;
          //.
          if (flRaiseEvent) then RaiseNotificationEvent(VisualizationPtr,ptrObj,true,NotificationAddresses);
          //.
          Inc(_ChangesCount);
          end;
        end;
      end
     else begin
      //. update Notification Subscription window
      try
      ProxySpace__NotificationSubscription_RemoveWindow('NotificationArea'+IntToStr(idNotificationArea));
      if (VisualizationPtr <> nilPtr)
       then begin
        if (NOT ProxySpace__Obj_GetMinMax(minX,minY,maxX,maxY,VisualizationPtr)) then Raise Exception.Create('TNotificationAreaNotifier.DoOnVisualizationOperation: ProxySpace__Obj_GetMinMax is failed'); //. =>
        ProxySpace__NotificationSubscription_AddWindow(minX,minY,maxX,minY,maxX,maxY,minX,maxY,'NotificationArea'+IntToStr(idNotificationArea));
        end;
      except
        On E: Exception do ProxySpace__EventLog_WriteMinorEvent('TNotificationAreaNotifier.DoOnVisualizationOperation','Cannot update a notification subscription window for Notification-Area (ID = '+IntToStr(idNotificationArea)+', VisualizationPtr = '+IntToStr(VisualizationPtr)+')',E.Message);
        end;
      //.
      ptrptrVisibleInsideObject:=@VisibleInsideObjects;
      while (Pointer(ptrptrVisibleInsideObject^) <> nil) do begin
        try
        _flVisibleInside:=ProxySpace__Obj_ObjIsVisibleInside(TVisibleInsideObject(Pointer(ptrptrVisibleInsideObject^)^).ptrObj,VisualizationPtr);
        except
          _flVisibleInside:=false;
          end;
        if (NOT _flVisibleInside)
         then begin //. remove obj from visible list
          OutsideObjPtr:=TVisibleInsideObject(Pointer(ptrptrVisibleInsideObject^)^).ptrObj;
          ptrRemoveVisibleInsideObject:=Pointer(ptrptrVisibleInsideObject^);
          Pointer(ptrptrVisibleInsideObject^):=TVisibleInsideObject(ptrRemoveVisibleInsideObject^).Next;
          FreeMem(ptrRemoveVisibleInsideObject,SizeOf(TVisibleInsideObject));
          //.
          if (flRaiseEvent) then RaiseNotificationEvent(VisualizationPtr,OutsideObjPtr,false,NotificationAddresses);
          //.
          Inc(_ChangesCount);
          end
         else ptrptrVisibleInsideObject:=@TVisibleInsideObject(Pointer(ptrptrVisibleInsideObject^)^).Next;
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
        {//.not needed here
        //. remove self to the Updates Notification subscription
        ProxySpace__NotificationSubscription_RemoveWindow('NotificationArea'+IntToStr(idNotificationArea));
        //.
        ClearItem(I);}
        VisualizationPtr:=nilPtr;
        Inc(_ChangesCount);
        Exit; //. ->
        end
       else begin
        ptrptrVisibleInsideObject:=@VisibleInsideObjects;
        while (Pointer(ptrptrVisibleInsideObject^) <> nil) do begin
          if (TVisibleInsideObject(Pointer(ptrptrVisibleInsideObject^)^).ptrObj = ptrObj)
           then begin //. remove obj from visible list
            ptrRemoveVisibleInsideObject:=Pointer(ptrptrVisibleInsideObject^);
            Pointer(ptrptrVisibleInsideObject^):=TVisibleInsideObject(ptrRemoveVisibleInsideObject^).Next;
            FreeMem(ptrRemoveVisibleInsideObject,SizeOf(TVisibleInsideObject));
            //.
            if (flRaiseEvent) then RaiseNotificationEvent(VisualizationPtr,ptrObj,false,NotificationAddresses);
            //.
            Inc(_ChangesCount);
            end
           else ptrptrVisibleInsideObject:=@TVisibleInsideObject(Pointer(ptrptrVisibleInsideObject^)^).Next;
          end;
        end;
    finally
    Lock.Leave;
    end;
    end;
end;

function TNotificationAreaNotifier.ChangesCount: integer;
begin
Lock.Enter;
try
Result:=_ChangesCount;
finally
Lock.Leave;
end;
end;

procedure TNotificationAreaNotifier.Server_ValidateItems;
var
  CL: TList;
  I: integer;
  flAdded: boolean;
begin
with FunctionalityImport.TTCoComponentFunctionality(TTypeFunctionality_Create(idTCoComponent)) do
try
GetInstanceListByCoType1(idTCoNotificationArea, CL);
try
Lock.Enter;
try
flAdded:=false;
for I:=0 to CL.Count-1 do
  if (NOT IsItemExists(Integer(CL[I])))
   then
    try
    Server_AddItem(Integer(CL[I]));
    flAdded:=true;
    except
      On E: Exception do ProxySpace__EventLog_WriteMinorEvent('TNotificationAreaNotifier.Server_ValidateItems','Cannot process a new object for area-notifier (idTObj = '+IntToStr(idTCoComponent)+','+IntToStr(Integer(CL[I]))+')',E.Message);
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

procedure TNotificationAreaNotifier.Server_AddItem(const pidNotificationArea: integer);
var
  flToAdd: boolean;
begin
flToAdd:=false;
try
with TCoNotificationAreaFunctionality.Create(pidNotificationArea) do
try
if (Length(NotificationAddresses) > 3) then flToAdd:=true;
finally
Release;
end;
except
  end;
if (flToAdd) then AddItem(pidNotificationArea);
end;

procedure TNotificationAreaNotifier.Server_DoOnTypeSystemUpdate(const idObj: integer; const Operation: TComponentOperation);
begin
DoOnComponentOperation(idTCoComponent,idObj,Operation);
end;


{TfmNotificationAreaNotifier}
Constructor TfmNotificationAreaNotifier.Create;
begin
Inherited Create(nil);
LastChange:=-1;
SelectedItemIndex:=-1;
end;

procedure TfmNotificationAreaNotifier.UpdateItems;
var
  I,J: integer;
  flIn,flOut: boolean;
begin
with lvNotifierItems do begin
Items.BeginUpdate;
try
Items.Clear;
if (NotificationAreaNotifier = nil) then Exit; //. ->
with NotificationAreaNotifier do begin
Lock.Enter;
try
for I:=0 to Length(NotificationAreaNotifier.Items)-1 do with NotificationAreaNotifier.Items[I],lvNotifierItems.Items.Add do begin
  if (NOT flDisabled)
   then begin
    flIn:=false;
    flOut:=false;
    //.
    flIn:=(VisibleInsideObjects <> nil);
    //.
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
  with TCoNotificationAreaFunctionality.Create(idNotificationArea) do
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

procedure TfmNotificationAreaNotifier.lvNotifierItems_ExchangeItems(SrsIndex,DistIndex: integer);
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

procedure TfmNotificationAreaNotifier.UpdaterTimer(Sender: TObject);
var
  ChangeNum: integer;
begin
if (NotificationAreaNotifier = nil) then Exit; //. ->
if (NOT (Visible AND (WindowState <> wsMinimized))) then Exit; //. ->
ChangeNum:=NotificationAreaNotifier.ChangesCount;
if (ChangeNum <> LastChange)
 then begin
  UpdateItems();
  //.
  LastChange:=ChangeNum;
  end;
end;

procedure TfmNotificationAreaNotifier.lvNotifierItemsClick(Sender: TObject);
begin
if (lvNotifierItems.Selected <> nil) then SelectedItemIndex:=lvNotifierItems.Selected.Index;
end;

procedure TfmNotificationAreaNotifier.ShowItemPanel1Click(Sender: TObject);
var
  idNotificationArea: integer;
begin
if (NotificationAreaNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1)
 then with NotificationAreaNotifier do begin
  Lock.Enter;
  try
  if ((0 <= SelectedItemIndex) AND (SelectedItemIndex < Length(Items)))
   then idNotificationArea:=Items[SelectedItemIndex].idNotificationArea
   else idNotificationArea:=0;
  finally
  Lock.Leave;
  end;
  if (idNotificationArea <> 0)
   then with TCoNotificationAreaPanelProps.Create(idNotificationArea) do begin
    Position:=poScreenCenter;
    Show();
    end;
  end;
end;

procedure TfmNotificationAreaNotifier.ShowItemVisualizationpanel1Click(Sender: TObject);
var
  _VisualizationType,_VisualizationID: integer;
begin
if (NotificationAreaNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1)
 then with NotificationAreaNotifier do begin
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

procedure TfmNotificationAreaNotifier.Removeselecteditem1Click(Sender: TObject);
begin
if (NotificationAreaNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1) then NotificationAreaNotifier.RemoveItem(SelectedItemIndex);
UpdateItems;
end;

procedure TfmNotificationAreaNotifier.lvNotifierItemsDblClick(Sender: TObject);
begin
ShowItemPanel1Click(nil);
end;

procedure TfmNotificationAreaNotifier.lvNotifierItemsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
if (Sender = Source) then Accept:=true;
end;

procedure TfmNotificationAreaNotifier.lvNotifierItemsDragDrop(Sender,Source: TObject; X, Y: Integer);
var
  Item: TListItem;
begin
if (NotificationAreaNotifier = nil) then Exit; //. ->
if (Sender = Source)
 then with (Sender as TListView) do begin
  Item:=GetItemAt(X,Y);
  if (Item = nil) then Exit; //. ->
  NotificationAreaNotifier.ExchangeItems(Selected.Index,Item.Index);
  lvNotifierItems_ExchangeItems(Selected.Index,Item.Index);
  ItemFocused:=Item;
  Selected:=Item;
  end;
end;

procedure TfmNotificationAreaNotifier.Disableselecteditem1Click(Sender: TObject);
begin
if (NotificationAreaNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1) then NotificationAreaNotifier.DisableEnableItem(SelectedItemIndex,true);
end;

procedure TfmNotificationAreaNotifier.Enableselecteditem1Click(Sender: TObject);
begin
if (NotificationAreaNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1) then NotificationAreaNotifier.DisableEnableItem(SelectedItemIndex,false);
end;

procedure TfmNotificationAreaNotifier.DisableAll1Click(Sender: TObject);
begin
if (NotificationAreaNotifier = nil) then Exit; //. ->
NotificationAreaNotifier.DisableEnableAll(true);
end;

procedure TfmNotificationAreaNotifier.Enableall1Click(Sender: TObject);
begin
if (NotificationAreaNotifier = nil) then Exit; //. ->
NotificationAreaNotifier.DisableEnableAll(false);
end;

procedure TfmNotificationAreaNotifier.bbShowEventsProcessorClick(Sender: TObject);
begin
if (NotificationAreaEventsProcessor <> nil) then NotificationAreaEventsProcessor.Panel.Show();
end;

procedure TfmNotificationAreaNotifier.FormShow(Sender: TObject);
begin
Updater.Enabled:=true;
end;

procedure TfmNotificationAreaNotifier.FormHide(Sender: TObject);
begin
Updater.Enabled:=false;
end;

procedure NotificationAreaNotifier_Initialize();
var
  LastError: DWord;
begin
if (ProxySpace_ProxySpaceServerType = pssAreaNotification)
 then begin
  ServerProfile:=TAreaNotificationServerProfile(ProxySpace_ProxySpaceServerProfile()^);
  flServer:=ServerProfile.flNotificationAreaServer;
  end
 else flServer:=false;
//.
NotificationAreaNotifier:=TNotificationAreaNotifier.Create;
if (NotificationAreaEventsProcessor <> nil)
 then NotificationAreaNotifier.EventHandler:=NotificationAreaEventsProcessor.ProcessEvent;
NotificationAreaNotifierMonitor:=TfmNotificationAreaNotifier.Create();
end;

procedure NotificationAreaNotifier_Finalize();
begin
FreeAndNil(NotificationAreaNotifierMonitor);
FreeAndNil(NotificationAreaNotifier);
end;

procedure NotificationAreaNotifier_ShowPanel();
begin
if (NotificationAreaNotifierMonitor <> nil) then NotificationAreaNotifierMonitor.Show();
end;


Initialization

Finalization
NotificationAreaNotifierMonitor.Free;
NotificationAreaNotifier.Free;

end.
