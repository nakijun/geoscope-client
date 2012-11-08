unit unitObjectDistanceNotifier;

interface

uses
  Windows, Messages, SysUtils, SyncObjs, Variants, Classes, GlobalSpaceDefines, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ImgList, Menus, StdCtrls,
  FunctionalityImport,
  CoFunctionality,
  unitGeoObjectAreaNotifier, unitNotificationAreaNotifier, Buttons;

const
  ObjectDistanceNotifierItemsFile = 'ObjectDistanceNotifierItems.xml';
type
  TObjectDistanceEventHandler = procedure (const ObjectVisualizationPtr: TPtr; const ObjectVisualizationEventPositionX,ObjectVisualizationEventPositionY: Extended; const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const flIncomingEvent: boolean; const Distance: double; const NotificationAddresses: string) of object;

  TNotifyObjectDistance = record
    ObjectVisualizationType: integer;
    ObjectVisualizationID: integer;
    ObjectVisualizationPtr: TPtr;
    Distance: double;
    CurrentDistance: double;
  end;

  TObjectDistanceNotifier = class;

  TItemUpdater = class
  private
    ObjectDistanceNotifier: TObjectDistanceNotifier;
    ItemIndex: integer;

    Constructor Create(const pObjectDistanceNotifier: TObjectDistanceNotifier; const pItemIndex: integer);
    procedure DoOnUpdate();
    procedure DoOnDestroy();
  end;

  TNotifierItem = record
    idGeoObject: integer;
    VisualizationType: integer;
    VisualizationID: integer;
    VisualizationPtr: TPtr;
    ItemUpdater: TItemUpdater;
    Updater: TComponentPresentUpdater;
    ObjectMinDistanceItems: array of TNotifyObjectDistance;
    ObjectMaxDistanceItems: array of TNotifyObjectDistance;
    ObjectMinMaxDistanceItems: array of TNotifyObjectDistance;
    NotificationAddresses: string;
    flDisabled: boolean;
  end;

  TObjectDistanceNotifierProcessing = class(TThread)
  private
    ObjectDistanceNotifier: TObjectDistanceNotifier;

    Constructor Create(const pObjectDistanceNotifier: TObjectDistanceNotifier);
    Destructor Destroy; override;
    procedure Execute(); override;
  end;

  TObjectDistanceNotifier = class
  private
    Lock: TCriticalSection;
    Items: array of TNotifierItem;
    Server_TypeSystemUpdater: TTypeSystemPresentUpdater;
    Processing: TObjectDistanceNotifierProcessing;
    EventHandler: TObjectDistanceEventHandler;
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


  TfmObjectDistanceNotifier = class(TForm)
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
  ObjectDistanceNotifier: TObjectDistanceNotifier = nil;
  ObjectDistanceNotifierMonitor: TfmObjectDistanceNotifier = nil;

  procedure ObjectDistanceNotifier_Initialize();
  procedure ObjectDistanceNotifier_Finalize();
  procedure ObjectDistanceNotifier_ShowPanel();

implementation
Uses
  ActiveX,
  MSXML,
  TypesDefines,
  unitCoGeoMonitorObjectFunctionality,
  unitCoGeoMonitorObjectPanelProps,
  unitGEOGraphServerController,
  unitObjectModel,
  unitBusinessModel,
  unitNotificationAreaEventsProcessor;

{$R *.dfm}


{TItemUpdater}
Constructor TItemUpdater.Create(const pObjectDistanceNotifier: TObjectDistanceNotifier; const pItemIndex: integer);
begin
Inherited Create;
ObjectDistanceNotifier:=pObjectDistanceNotifier;
ItemIndex:=pItemIndex;
end;

procedure TItemUpdater.DoOnUpdate();
begin
ObjectDistanceNotifier.RenewItem(ItemIndex);
end;

procedure TItemUpdater.DoOnDestroy();
begin
ObjectDistanceNotifier.RemoveItem(ItemIndex);
end;


{TObjectDistanceNotifierProcessing}
Constructor TObjectDistanceNotifierProcessing.Create(const pObjectDistanceNotifier: TObjectDistanceNotifier);
begin
ObjectDistanceNotifier:=pObjectDistanceNotifier;
Inherited Create(false);
end;

Destructor TObjectDistanceNotifierProcessing.Destroy;
var
  EC: DWord;
begin
//. workaround of strange behavior of ExitThread function in Dll
GetExitCodeThread(Handle,EC);
TerminateThread(Handle,EC);
//.
Inherited;
end;

procedure TObjectDistanceNotifierProcessing.Execute();
var
  I,J: integer;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
while (NOT Terminated) do begin
  //. validate items if they are out of context
  with ObjectDistanceNotifier do begin
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
    Notifier: TObjectDistanceNotifier;
    ObjectVisualizationPtr: TPtr;
    ObjectVisualizationEventPositionX: Extended; 
    ObjectVisualizationEventPositionY: Extended;
    VisualizationPtr: TPtr;
    VisualizationEventPositionX: Extended;
    VisualizationEventPositionY: Extended;
    flIncomingEvent: boolean;
    Distance: double; NotificationAddresses: string;

    Constructor Create(const pNotifier: TObjectDistanceNotifier; const pObjectVisualizationPtr: TPtr; const pObjectVisualizationEventPositionX,pObjectVisualizationEventPositionY: Extended; const pVisualizationPtr: TPtr; const pVisualizationEventPositionX,pVisualizationEventPositionY: Extended; const pflIncomingEvent: boolean; const pDistance: double; const pNotificationAddresses: string);
    procedure Execute; override;
  end;

Constructor TNotifyEventHandling.Create(const pNotifier: TObjectDistanceNotifier; const pObjectVisualizationPtr: TPtr; const pObjectVisualizationEventPositionX,pObjectVisualizationEventPositionY: Extended; const pVisualizationPtr: TPtr; const pVisualizationEventPositionX,pVisualizationEventPositionY: Extended; const pflIncomingEvent: boolean; const pDistance: double; const pNotificationAddresses: string);
begin
Notifier:=pNotifier;
Notifier.NotifyEventHandlerThreads.Add(Self);
ObjectVisualizationPtr:=pObjectVisualizationPtr;
ObjectVisualizationEventPositionX:=pObjectVisualizationEventPositionX;
ObjectVisualizationEventPositionY:=pObjectVisualizationEventPositionY;
VisualizationPtr:=pVisualizationPtr;
VisualizationEventPositionX:=pVisualizationEventPositionX;
VisualizationEventPositionY:=pVisualizationEventPositionY;
flIncomingEvent:=pflIncomingEvent;
Distance:=pDistance;
NotificationAddresses:=pNotificationAddresses;
FreeOnTerminate:=true;
Inherited Create(false);
end;

procedure TNotifyEventHandling.Execute;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
try
Notifier.EventHandler(ObjectVisualizationPtr,ObjectVisualizationEventPositionX,ObjectVisualizationEventPositionY, VisualizationPtr,VisualizationEventPositionX,VisualizationEventPositionY, flIncomingEvent, Distance, NotificationAddresses);
finally
Notifier.NotifyEventHandlerThreads.Remove(Self);
end;
finally
CoUnInitialize;
end;
end;


{TObjectDistanceNotifier}
Constructor TObjectDistanceNotifier.Create;
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
Processing:=TObjectDistanceNotifierProcessing.Create(Self);
end;

Destructor TObjectDistanceNotifier.Destroy;
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

procedure TObjectDistanceNotifier.Clear;
var
  I: integer;
begin
Lock.Enter;
try
for I:=0 to Length(Items)-1 do with Items[I] do begin
  FreeAndNil(Updater);
  FreeAndNil(ItemUpdater);
  SetLength(ObjectMinDistanceItems,0);
  SetLength(ObjectMaxDistanceItems,0);
  SetLength(ObjectMinMaxDistanceItems,0);
  SetLength(NotificationAddresses,0);
  end;
SetLength(Items,0);
finally
Lock.Leave;
end;
end;

procedure TObjectDistanceNotifier.ClearItem(const ItemIndex: integer);
begin
with Items[ItemIndex] do begin
//. clear fields
VisualizationPtr:=nilPtr;
FreeAndNil(Updater);
FreeAndNil(ItemUpdater);
SetLength(ObjectMinDistanceItems,0);
SetLength(ObjectMaxDistanceItems,0);
SetLength(ObjectMinMaxDistanceItems,0);
SetLength(NotificationAddresses,0);
end;
end;

procedure TObjectDistanceNotifier.UpdateItem(const ItemIndex: integer);
var
  CGMOF: TCoGeoMonitorObjectFunctionality;
  _ObjectMinDistanceItems,_ObjectMaxDistanceItems,_ObjectMinMaxDistanceItems: TObjectDistanceItems;
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
CGMOF.GetObjectDistanceItems({out} _ObjectMinDistanceItems,{out} _ObjectMaxDistanceItems,{out} _ObjectMinMaxDistanceItems);
SetLength(ObjectMinDistanceItems,Length(_ObjectMinDistanceItems));
SetLength(ObjectMaxDistanceItems,Length(_ObjectMaxDistanceItems));
SetLength(ObjectMinMaxDistanceItems,Length(_ObjectMinMaxDistanceItems));
for I:=0 to Length(_ObjectMinMaxDistanceItems)-1 do
  try
  with TBaseVisualizationFunctionality(TComponentFunctionality_Create(_ObjectMinMaxDistanceItems[I].idTVisualization,_ObjectMinMaxDistanceItems[I].idVisualization)) do
  try
  ObjectMinMaxDistanceItems[I].ObjectVisualizationPtr:=Ptr;
  ObjectMinMaxDistanceItems[I].ObjectVisualizationType:=_ObjectMinMaxDistanceItems[I].idTVisualization;
  ObjectMinMaxDistanceItems[I].ObjectVisualizationID:=_ObjectMinMaxDistanceItems[I].idVisualization;
  ObjectMinMaxDistanceItems[I].Distance:=_ObjectMinMaxDistanceItems[I].Distance;
  ObjectMinMaxDistanceItems[I].CurrentDistance:=-1.0;
  finally
  Release;
  end;
  except
    ObjectMinMaxDistanceItems[I].ObjectVisualizationPtr:=nilPtr;
    end;
for I:=0 to Length(_ObjectMinDistanceItems)-1 do
  try
  with TBaseVisualizationFunctionality(TComponentFunctionality_Create(_ObjectMinDistanceItems[I].idTVisualization,_ObjectMinDistanceItems[I].idVisualization)) do
  try
  ObjectMinDistanceItems[I].ObjectVisualizationPtr:=Ptr;
  ObjectMinDistanceItems[I].ObjectVisualizationType:=_ObjectMinDistanceItems[I].idTVisualization;
  ObjectMinDistanceItems[I].ObjectVisualizationID:=_ObjectMinDistanceItems[I].idVisualization;
  ObjectMinDistanceItems[I].Distance:=_ObjectMinDistanceItems[I].Distance;
  ObjectMinDistanceItems[I].CurrentDistance:=-1.0;
  finally
  Release;
  end;
  except
    ObjectMinDistanceItems[I].ObjectVisualizationPtr:=nilPtr;
    end;
for I:=0 to Length(_ObjectMaxDistanceItems)-1 do 
  try
  with TBaseVisualizationFunctionality(TComponentFunctionality_Create(_ObjectMaxDistanceItems[I].idTVisualization,_ObjectMaxDistanceItems[I].idVisualization)) do
  try
  ObjectMaxDistanceItems[I].ObjectVisualizationPtr:=Ptr;
  ObjectMaxDistanceItems[I].ObjectVisualizationType:=_ObjectMaxDistanceItems[I].idTVisualization;
  ObjectMaxDistanceItems[I].ObjectVisualizationID:=_ObjectMaxDistanceItems[I].idVisualization;
  ObjectMaxDistanceItems[I].Distance:=_ObjectMaxDistanceItems[I].Distance;
  ObjectMaxDistanceItems[I].CurrentDistance:=-1.0;
  finally
  Release;
  end;
  except
    ObjectMaxDistanceItems[I].ObjectVisualizationPtr:=nilPtr;
    end;
NotificationAddresses:=CGMOF.NotificationAddresses;
//.
ItemUpdater:=TItemUpdater.Create(Self,ItemIndex);
//.
Updater:=TComponentPresentUpdater_Create(idTCoComponent,idGeoObject, ItemUpdater.DoOnUpdate,ItemUpdater.DoOnDestroy);
finally
CGMOF.Release;
end;
except
  //. invalidate item
  ClearItem(ItemIndex);
  end;
end;
end;

procedure TObjectDistanceNotifier.Load; 
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
  ObjectDistanceItemsNode,ObjectDistanceItemNode: IXMLDOMNode;
  CGMOF: TCoGeoMonitorObjectFunctionality;
begin
Lock.Enter;
try
Clear();
if (FileExists(ProxySpace_GetCurrentUserProfile+'\'+ObjectDistanceNotifierItemsFile))
 then begin
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(ProxySpace_GetCurrentUserProfile+'\'+ObjectDistanceNotifierItemsFile);
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
    //.
    if ((VisualizationPtr <> nilPtr) AND (flSpacePackIDIsChanged))
     then with TBaseVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
      try
      VisualizationPtr:=Ptr;
      finally
      Release;
      end;
    //.
    ObjectDistanceItemsNode:=ItemNode.selectSingleNode('ObjectMinDistanceItems');
    if (ObjectDistanceItemsNode <> nil)
     then begin
      SetLength(ObjectMinDistanceItems,ObjectDistanceItemsNode.childNodes.length);
      for J:=0 to ObjectDistanceItemsNode.childNodes.length-1 do with ObjectMinDistanceItems[J] do begin
        ObjectDistanceItemNode:=ObjectDistanceItemsNode.childNodes[J];
        //.
        ObjectVisualizationType:=ObjectDistanceItemNode.selectSingleNode('OVT').nodeTypedValue;
        ObjectVisualizationID:=ObjectDistanceItemNode.selectSingleNode('OVID').nodeTypedValue;
        ObjectVisualizationPtr:=ObjectDistanceItemNode.selectSingleNode('OVPtr').nodeTypedValue;
        //.
        if ((ObjectVisualizationPtr <> nilPtr) AND (flSpacePackIDIsChanged))
         then with TBaseVisualizationFunctionality(TComponentFunctionality_Create(ObjectVisualizationType,ObjectVisualizationID)) do
          try
          ObjectVisualizationPtr:=Ptr;
          finally
          Release;
          end;
        //.
        Distance:=ObjectDistanceItemNode.selectSingleNode('Distance').nodeTypedValue;
        CurrentDistance:=ObjectDistanceItemNode.selectSingleNode('CurDistance').nodeTypedValue;
        end;
      end;
    //.
    ObjectDistanceItemsNode:=ItemNode.selectSingleNode('ObjectMaxDistanceItems');
    if (ObjectDistanceItemsNode <> nil)
     then begin
      SetLength(ObjectMaxDistanceItems,ObjectDistanceItemsNode.childNodes.length);
      for J:=0 to ObjectDistanceItemsNode.childNodes.length-1 do with ObjectMaxDistanceItems[J] do begin
        ObjectDistanceItemNode:=ObjectDistanceItemsNode.childNodes[J];
        //.
        ObjectVisualizationType:=ObjectDistanceItemNode.selectSingleNode('OVT').nodeTypedValue;
        ObjectVisualizationID:=ObjectDistanceItemNode.selectSingleNode('OVID').nodeTypedValue;
        ObjectVisualizationPtr:=ObjectDistanceItemNode.selectSingleNode('OVPtr').nodeTypedValue;
        //.
        if ((ObjectVisualizationPtr <> nilPtr) AND (flSpacePackIDIsChanged))
         then with TBaseVisualizationFunctionality(TComponentFunctionality_Create(ObjectVisualizationType,ObjectVisualizationID)) do
          try
          ObjectVisualizationPtr:=Ptr;
          finally
          Release;
          end;
        //.
        Distance:=ObjectDistanceItemNode.selectSingleNode('Distance').nodeTypedValue;
        CurrentDistance:=ObjectDistanceItemNode.selectSingleNode('CurDistance').nodeTypedValue;
        end;
      end;
    //.
    ObjectDistanceItemsNode:=ItemNode.selectSingleNode('ObjectMinMaxDistanceItems');
    if (ObjectDistanceItemsNode <> nil)
     then begin
      SetLength(ObjectMinMaxDistanceItems,ObjectDistanceItemsNode.childNodes.length);
      for J:=0 to ObjectDistanceItemsNode.childNodes.length-1 do with ObjectMinMaxDistanceItems[J] do begin
        ObjectDistanceItemNode:=ObjectDistanceItemsNode.childNodes[J];
        //.
        ObjectVisualizationType:=ObjectDistanceItemNode.selectSingleNode('OVT').nodeTypedValue;
        ObjectVisualizationID:=ObjectDistanceItemNode.selectSingleNode('OVID').nodeTypedValue;
        ObjectVisualizationPtr:=ObjectDistanceItemNode.selectSingleNode('OVPtr').nodeTypedValue;
        //.
        if ((ObjectVisualizationPtr <> nilPtr) AND (flSpacePackIDIsChanged))
         then with TBaseVisualizationFunctionality(TComponentFunctionality_Create(ObjectVisualizationType,ObjectVisualizationID)) do
          try
          ObjectVisualizationPtr:=Ptr;
          finally
          Release;
          end;
        //.
        Distance:=ObjectDistanceItemNode.selectSingleNode('Distance').nodeTypedValue;
        CurrentDistance:=ObjectDistanceItemNode.selectSingleNode('CurDistance').nodeTypedValue;
        end;
      end;
    //.
    NotificationAddresses:=ItemNode.selectSingleNode('NotificationAddresses').nodeTypedValue;
    flDisabled:=ItemNode.selectSingleNode('flDisabled').nodeTypedValue;
    //.
    ItemUpdater:=TItemUpdater.Create(Self,I);
    //.
    Updater:=TComponentPresentUpdater_Create(idTCoComponent,idGeoObject, ItemUpdater.DoOnUpdate,ItemUpdater.DoOnDestroy);
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

procedure TObjectDistanceNotifier.Save;
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
  ObjectDistanceItemsNode,ObjectDistanceItemNode: IXMLDOMElement;
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
  //.
  ObjectDistanceItemsNode:=Doc.CreateElement('ObjectMinDistanceItems');
  for J:=0 to Length(ObjectMinDistanceItems)-1 do with ObjectMinDistanceItems[J] do begin
    ObjectDistanceItemNode:=Doc.CreateElement('I'+IntToStr(J));
    PropNode:=Doc.CreateElement('OVT');         PropNode.nodeTypedValue:=ObjectVisualizationType; ObjectDistanceItemNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('OVID');        PropNode.nodeTypedValue:=ObjectVisualizationID;   ObjectDistanceItemNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('OVPtr');       PropNode.nodeTypedValue:=ObjectVisualizationPtr;  ObjectDistanceItemNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('Distance');    PropNode.nodeTypedValue:=Distance;                ObjectDistanceItemNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('CurDistance'); PropNode.nodeTypedValue:=CurrentDistance;         ObjectDistanceItemNode.appendChild(PropNode);
    ObjectDistanceItemsNode.appendChild(ObjectDistanceItemNode);
    end;
  ItemNode.appendChild(ObjectDistanceItemsNode);
  //.
  ObjectDistanceItemsNode:=Doc.CreateElement('ObjectMaxDistanceItems');
  for J:=0 to Length(ObjectMaxDistanceItems)-1 do with ObjectMaxDistanceItems[J] do begin
    ObjectDistanceItemNode:=Doc.CreateElement('I'+IntToStr(J));
    PropNode:=Doc.CreateElement('OVT');         PropNode.nodeTypedValue:=ObjectVisualizationType; ObjectDistanceItemNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('OVID');        PropNode.nodeTypedValue:=ObjectVisualizationID;   ObjectDistanceItemNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('OVPtr');       PropNode.nodeTypedValue:=ObjectVisualizationPtr;  ObjectDistanceItemNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('Distance');    PropNode.nodeTypedValue:=Distance;                ObjectDistanceItemNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('CurDistance'); PropNode.nodeTypedValue:=CurrentDistance;         ObjectDistanceItemNode.appendChild(PropNode);
    ObjectDistanceItemsNode.appendChild(ObjectDistanceItemNode);
    end;
  ItemNode.appendChild(ObjectDistanceItemsNode);
  //.
  ObjectDistanceItemsNode:=Doc.CreateElement('ObjectMinMaxDistanceItems');
  for J:=0 to Length(ObjectMinMaxDistanceItems)-1 do with ObjectMinMaxDistanceItems[J] do begin
    ObjectDistanceItemNode:=Doc.CreateElement('I'+IntToStr(J));
    PropNode:=Doc.CreateElement('OVT');         PropNode.nodeTypedValue:=ObjectVisualizationType; ObjectDistanceItemNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('OVID');        PropNode.nodeTypedValue:=ObjectVisualizationID;   ObjectDistanceItemNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('OVPtr');       PropNode.nodeTypedValue:=ObjectVisualizationPtr;  ObjectDistanceItemNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('Distance');    PropNode.nodeTypedValue:=Distance;                ObjectDistanceItemNode.appendChild(PropNode);
    PropNode:=Doc.CreateElement('CurDistance'); PropNode.nodeTypedValue:=CurrentDistance;         ObjectDistanceItemNode.appendChild(PropNode);
    ObjectDistanceItemsNode.appendChild(ObjectDistanceItemNode);
    end;
  ItemNode.appendChild(ObjectDistanceItemsNode);
  //.
  PropNode:=Doc.CreateElement('NotificationAddresses'); PropNode.nodeTypedValue:=NotificationAddresses; ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('flDisabled');            PropNode.nodeTypedValue:=flDisabled;            ItemNode.appendChild(PropNode);
  //. add item
  ItemsNode.appendChild(ItemNode);
  except
    end;
  end;
//. save xml document
Doc.Save(ProxySpace_GetCurrentUserProfile+'\'+ObjectDistanceNotifierItemsFile);
_ChangesCount:=0;
finally
Lock.Leave;
end;
end;

procedure TObjectDistanceNotifier.Update;
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

procedure TObjectDistanceNotifier.AddItem(const pidGeoObject: integer);
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

procedure TObjectDistanceNotifier.RemoveItem(const ItemIndex: integer);
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

procedure TObjectDistanceNotifier.RenewItem(ItemIndex: integer);
begin
Lock.Enter;
try
if (NOT ((0 <= ItemIndex) AND (ItemIndex < Length(Items)))) then Exit; //. ->
//.
ObjectDistanceNotifier.UpdateItem(ItemIndex);
//. save after done
//. not needed Save();
//.
Inc(_ChangesCount);
finally
Lock.Leave;
end;
end;

function TObjectDistanceNotifier.IsItemExists(const pidGeoObject: integer): boolean;
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

procedure TObjectDistanceNotifier.ExchangeItems(const SrsIndex,DistIndex: integer);
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

function TObjectDistanceNotifier.Empty: boolean;
begin
Lock.Enter;
try
Result:=(Length(Items) = 0);
finally
Lock.Leave;
end;
end;

procedure TObjectDistanceNotifier.DisableEnableItem(const ItemIndex: integer; const Disable: boolean);
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

procedure TObjectDistanceNotifier.DisableEnableAll(const Disable: boolean);
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

procedure TObjectDistanceNotifier.DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
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
    On E: Exception do ProxySpace__EventLog_WriteMinorEvent('TGeoObjectDistanceNotifier.DoOnComponentOperation','Cannot process a new object for distance-notifier (idTObj = '+IntToStr(idTObj)+','+IntToStr(idObj)+')',E.Message);
    end;
end;

procedure TObjectDistanceNotifier.DoOnVisualizationOperation(const ptrObj: TPtr; const Act: TRevisionAct; const flRaiseEvent: boolean);

  function CalculateDistance(const VisualizationPtr,ObjectVisualizationPtr: TPtr; out Distance: double): boolean;
  var
    N0,N1: TPoint;
  begin
  Result:=false;
  if (NOT ProxySpace__Obj_GetFirstNode(VisualizationPtr,{out} N0)) then Exit; //. ->
  if (NOT ProxySpace__Obj_GetFirstNode(ObjectVisualizationPtr,{out} N1)) then Exit; //. ->
  Distance:=Sqrt(sqr(N1.X-N0.X)+sqr(N1.Y-N0.Y));
  Result:=true;
  end;

  function CalculateGeoDistance(const idGeoObject: integer; const VisualizationPtr,ObjectVisualizationPtr: TPtr; out Distance: Extended): boolean;

    function GetObjectModel(const idGeoObject: integer): TObjectModel;
    var
      idGeoGraphServerObject: integer;
      _GeoGraphServerID: integer;
      _ObjectID: integer;
      _ObjectType: integer;
      _BusinessModel: integer;
      ServerObjectController: TGEOGraphServerObjectController;
    begin
    Result:=nil;
    with TCoGeoMonitorObjectFunctionality.Create(idGeoObject) do
    try
    if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
    with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
    try
    GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
    finally
    Release;
    end;
    if (NOT ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))) then Exit; //. ->
    if (_ObjectType = 0) then Exit; //. ->
    ServerObjectController:=TGEOGraphServerObjectController.Create(idGeoGraphServerObject,_ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
    Result:=TObjectModel.GetModel(_ObjectType,ServerObjectController,true);
    finally
    Release;
    end;
    end;

  var
    N0,N1: TPoint;
    ObjectModel: TObjectModel;
  begin
  Result:=false;
  if (NOT ProxySpace__Obj_GetFirstNode(VisualizationPtr,{out} N0)) then Exit; //. ->
  if (NOT ProxySpace__Obj_GetFirstNode(ObjectVisualizationPtr,{out} N1)) then Exit; //. ->
  ObjectModel:=GetObjectModel(idGeoObject);
  try
  if (ObjectModel <> nil)
   then begin
    ObjectModel.ObjectSchema.RootComponent.LoadAll();
    with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,ObjectModel.ObjectGeoSpaceID())) do
    try
    if (NOT GetDistanceBetweenTwoXYPointsLocally(N0.X,N0.Y,N1.X,N1.Y,{out} Distance)) then Exit; //. ->
    finally
    Release;
    end;
    end
   else Exit; //. ->
  finally
  ObjectModel.Free;
  end;
  Result:=true;
  end;

  procedure RaiseNotificationEvent(const ObjectVisualizationPtr: TPtr; const VisualizationPtr: TPtr; const flIncomingEvent: boolean; const Distance: double; const NotificationAddresses: string);
  var
    ObjectVisualizationEventPositionX,ObjectVisualizationEventPositionY: Extended;
    VisualizationEventPositionX,VisualizationEventPositionY: Extended;
  begin
  //. get visualizations Position
  try
  if (NOT ProxySpace__Obj_GetCenter(ObjectVisualizationEventPositionX,ObjectVisualizationEventPositionY, ObjectVisualizationPtr)) then Raise Exception.Create('could not get object visualization position, Ptr = '+IntToStr(ObjectVisualizationPtr)); //. =>
  if (NOT ProxySpace__Obj_GetCenter(VisualizationEventPositionX,VisualizationEventPositionY, VisualizationPtr)) then Raise Exception.Create('could not get visualization position, Ptr = '+IntToStr(VisualizationPtr)); //. =>
  except
    Exit; //. ->
    end;
  //. create worker thread
  try
  if (Assigned(EventHandler)) then TNotifyEventHandling.Create(Self, ObjectVisualizationPtr,ObjectVisualizationEventPositionX,ObjectVisualizationEventPositionY, VisualizationPtr,VisualizationEventPositionX,VisualizationEventPositionY, flIncomingEvent, Distance, NotificationAddresses); //. start event handling thread
  except
    On E: Exception do ProxySpace__EventLog_WriteMajorEvent('TObjectDistanceNotifier.DoOnVisualizationOperation','Cannot create notification event worker thread',E.Message);
    end;
  end;

var
  I,J: integer;
  D: double;
  GD: Extended;
begin
if (Act in [actChange,actChangeRecursively])
 then begin
  Lock.Enter;
  try
  for I:=0 to Length(Items)-1 do with Items[I] do if (NOT flDisabled) then
    if (VisualizationPtr = ptrObj)
     then begin
      for J:=0 to Length(ObjectMinDistanceItems)-1 do with ObjectMinDistanceItems[J] do
        if (ObjectVisualizationPtr <> nilPtr)
         then
          try
          if (CalculateDistance(VisualizationPtr,ObjectVisualizationPtr,{out} D))
           then begin
            if (((D <= Distance) AND (CurrentDistance > Distance)) AND flRaiseEvent)
             then begin
              if (NOT CalculateGeoDistance(idGeoObject,ObjectVisualizationPtr,VisualizationPtr,{out} GD)) then GD:=-1.0;
              RaiseNotificationEvent(ObjectVisualizationPtr,VisualizationPtr,true,GD,NotificationAddresses);
              end;
            CurrentDistance:=D;
            Inc(_ChangesCount);
            end;
          except
            end;
      for J:=0 to Length(ObjectMaxDistanceItems)-1 do with ObjectMaxDistanceItems[J] do
        if (ObjectVisualizationPtr <> nilPtr)
         then
          try
          if (CalculateDistance(VisualizationPtr,ObjectVisualizationPtr,{out} D))
           then begin
            if (((D >= Distance) AND (CurrentDistance < Distance)) AND flRaiseEvent)
             then begin
              if (NOT CalculateGeoDistance(idGeoObject,ObjectVisualizationPtr,VisualizationPtr,{out} GD)) then GD:=-1.0;
              RaiseNotificationEvent(ObjectVisualizationPtr,VisualizationPtr,false,GD,NotificationAddresses);
              end;
            CurrentDistance:=D;
            Inc(_ChangesCount);
            end;
          except
            end;
      for J:=0 to Length(ObjectMinMaxDistanceItems)-1 do with ObjectMinMaxDistanceItems[J] do
        if (ObjectVisualizationPtr <> nilPtr)
         then
          try
          if (CalculateDistance(VisualizationPtr,ObjectVisualizationPtr,{out} D))
           then begin
            if ((D <= Distance) AND (CurrentDistance > Distance))
             then begin
              if (flRaiseEvent)
               then begin
                if (NOT CalculateGeoDistance(idGeoObject,ObjectVisualizationPtr,VisualizationPtr,{out} GD)) then GD:=-1.0;
                RaiseNotificationEvent(ObjectVisualizationPtr,VisualizationPtr,true,GD,NotificationAddresses);
                end;
              end
             else
              if ((D >= Distance) AND (CurrentDistance < Distance))
               then begin
                if (flRaiseEvent)
                 then begin
                  if (NOT CalculateGeoDistance(idGeoObject,ObjectVisualizationPtr,VisualizationPtr,{out} GD)) then GD:=-1.0;
                  RaiseNotificationEvent(ObjectVisualizationPtr,VisualizationPtr,false,GD,NotificationAddresses);
                  end;
                end;
            CurrentDistance:=D;
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
        for J:=0 to Length(ObjectMinDistanceItems)-1 do with ObjectMinDistanceItems[J] do
          if (ObjectVisualizationPtr = ptrObj)
           then
            try
            if (CalculateDistance(VisualizationPtr,ObjectVisualizationPtr,{out} D))
             then begin
              if (((D <= Distance) AND (CurrentDistance > Distance)) AND flRaiseEvent)
               then begin
                if (NOT CalculateGeoDistance(idGeoObject,ObjectVisualizationPtr,VisualizationPtr,{out} GD)) then GD:=-1.0;
                RaiseNotificationEvent(ObjectVisualizationPtr,VisualizationPtr,true,GD,NotificationAddresses);
                end;
              CurrentDistance:=D;
              Inc(_ChangesCount);
              end;
            except
              end;
        for J:=0 to Length(ObjectMaxDistanceItems)-1 do with ObjectMaxDistanceItems[J] do
          if (ObjectVisualizationPtr = ptrObj)
           then
            try
            if (CalculateDistance(VisualizationPtr,ObjectVisualizationPtr,{out} D))
             then begin
              if (((D >= Distance) AND (CurrentDistance < Distance)) AND flRaiseEvent)
               then begin
                if (NOT CalculateGeoDistance(idGeoObject,ObjectVisualizationPtr,VisualizationPtr,{out} GD)) then GD:=-1.0;
                RaiseNotificationEvent(ObjectVisualizationPtr,VisualizationPtr,false,GD,NotificationAddresses);
                end;
              CurrentDistance:=D;
              Inc(_ChangesCount);
              end;
            except
              end;
        for J:=0 to Length(ObjectMinMaxDistanceItems)-1 do with ObjectMinMaxDistanceItems[J] do
          if (ObjectVisualizationPtr = ptrObj)
           then
            try
            if (CalculateDistance(VisualizationPtr,ObjectVisualizationPtr,{out} D))
             then begin
              if ((D >= Distance) AND (CurrentDistance < Distance))
               then begin
                if (flRaiseEvent)
                 then begin
                  if (NOT CalculateGeoDistance(idGeoObject,ObjectVisualizationPtr,VisualizationPtr,{out} GD)) then GD:=-1.0;
                  RaiseNotificationEvent(ObjectVisualizationPtr,VisualizationPtr,false,GD,NotificationAddresses);
                  end;
                end
               else
                if ((D <= Distance) AND (CurrentDistance > Distance)) 
                 then begin
                  if (flRaiseEvent)
                   then begin
                    if (NOT CalculateGeoDistance(idGeoObject,ObjectVisualizationPtr,VisualizationPtr,{out} GD)) then GD:=-1.0;
                    RaiseNotificationEvent(ObjectVisualizationPtr,VisualizationPtr,true,GD,NotificationAddresses);
                    end;
                  end;
              CurrentDistance:=D;
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
        for J:=0 to Length(ObjectMinDistanceItems)-1 do with ObjectMinDistanceItems[J] do
          if (ObjectVisualizationPtr = ptrObj)
           then begin
            ObjectVisualizationPtr:=nilPtr;
            Inc(_ChangesCount);
            Exit; //. ->
            end;
        for J:=0 to Length(ObjectMaxDistanceItems)-1 do with ObjectMaxDistanceItems[J] do
          if (ObjectVisualizationPtr = ptrObj)
           then begin
            ObjectVisualizationPtr:=nilPtr;
            Inc(_ChangesCount);
            Exit; //. ->
            end;
        for J:=0 to Length(ObjectMinMaxDistanceItems)-1 do with ObjectMinMaxDistanceItems[J] do
          if (ObjectVisualizationPtr = ptrObj)
           then begin
            ObjectVisualizationPtr:=nilPtr;
            Inc(_ChangesCount);
            Exit; //. ->
            end;
        end;
    finally
    Lock.Leave;
    end;
    end;
end;

function TObjectDistanceNotifier.ChangesCount: integer;
begin
Lock.Enter;
try
Result:=_ChangesCount;
finally
Lock.Leave;
end;
end;

procedure TObjectDistanceNotifier.Server_ValidateItems;
var
  CL: TList;
  I: integer;
  flAdded: boolean;
  flAddItem: boolean;
  idGeoGraphServer: integer;
begin
with FunctionalityImport.TTCoComponentFunctionality(TTypeFunctionality_Create(idTCoComponent)) do
try
GetInstanceListByCoType1(idTCoGeoMonitorObject, CL);
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
      On E: Exception do ProxySpace__EventLog_WriteMinorEvent('TObjectDistanceNotifier.Server_ValidateItems','Cannot process a new object for area-notifier (idTObj = '+IntToStr(idTCoComponent)+','+IntToStr(Integer(CL[I]))+')',E.Message);
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

procedure TObjectDistanceNotifier.Server_AddItem(const pidGeoObject: integer);
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

procedure TObjectDistanceNotifier.Server_DoOnTypeSystemUpdate(const idObj: integer; const Operation: TComponentOperation);
begin
DoOnComponentOperation(idTCoComponent,idObj,Operation);
end;


{TfmObjectDistanceNotifier}
Constructor TfmObjectDistanceNotifier.Create;
begin
Inherited Create(nil);
LastChange:=-1;
SelectedItemIndex:=-1;
end;

procedure TfmObjectDistanceNotifier.UpdateItems;
var
  I,J: integer;
  flIn,flOut: boolean;
begin
with lvNotifierItems do begin
Items.BeginUpdate;
try
Items.Clear;
if (ObjectDistanceNotifier = nil) then Exit; //. ->
with ObjectDistanceNotifier do begin
Lock.Enter;
try
for I:=0 to Length(ObjectDistanceNotifier.Items)-1 do with ObjectDistanceNotifier.Items[I],lvNotifierItems.Items.Add do begin
  if (NOT flDisabled)
   then begin
    flIn:=false;
    flOut:=false;
    for J:=0 to Length(ObjectMinDistanceItems)-1 do with ObjectMinDistanceItems[J] do flIn:=(flIn OR (CurrentDistance <= Distance));
    for J:=0 to Length(ObjectMaxDistanceItems)-1 do with ObjectMaxDistanceItems[J] do flOut:=(flOut OR (CurrentDistance >= Distance));
    for J:=0 to Length(ObjectMinMaxDistanceItems)-1 do with ObjectMinMaxDistanceItems[J] do begin
      flIn:=(flIn OR (CurrentDistance <= Distance));
      flOut:=(flOut OR (CurrentDistance >= Distance));
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

procedure TfmObjectDistanceNotifier.lvNotifierItems_ExchangeItems(SrsIndex,DistIndex: integer);
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

procedure TfmObjectDistanceNotifier.UpdaterTimer(Sender: TObject);
var
  ChangeNum: integer;
begin
if (ObjectDistanceNotifier = nil) then Exit; //. ->
if (NOT (Visible AND (WindowState <> wsMinimized))) then Exit; //. ->
ChangeNum:=ObjectDistanceNotifier.ChangesCount;
if (ChangeNum <> LastChange)
 then begin
  UpdateItems();
  //.
  LastChange:=ChangeNum;
  end;
end;

procedure TfmObjectDistanceNotifier.lvNotifierItemsClick(Sender: TObject);
begin
if (lvNotifierItems.Selected <> nil) then SelectedItemIndex:=lvNotifierItems.Selected.Index;
end;

procedure TfmObjectDistanceNotifier.Showgeoobjectpanel1Click(Sender: TObject);
var
  idGeoObject: integer;
begin
if (ObjectDistanceNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1)
 then with ObjectDistanceNotifier do begin
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

procedure TfmObjectDistanceNotifier.Showgeoobjectvisualizationpanel1Click(Sender: TObject);
var
  _VisualizationType,_VisualizationID: integer;
begin
if (ObjectDistanceNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1)
 then with ObjectDistanceNotifier do begin
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

procedure TfmObjectDistanceNotifier.Removeselecteditem1Click(Sender: TObject);
begin
if (ObjectDistanceNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1) then ObjectDistanceNotifier.RemoveItem(SelectedItemIndex);
UpdateItems;
end;

procedure TfmObjectDistanceNotifier.lvNotifierItemsDblClick(Sender: TObject);
begin
Showgeoobjectpanel1Click(nil);
end;

procedure TfmObjectDistanceNotifier.lvNotifierItemsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
if (Sender = Source) then Accept:=true;
end;

procedure TfmObjectDistanceNotifier.lvNotifierItemsDragDrop(Sender,Source: TObject; X, Y: Integer);
var
  Item: TListItem;
begin
if (ObjectDistanceNotifier = nil) then Exit; //. ->
if (Sender = Source)
 then with (Sender as TListView) do begin
  Item:=GetItemAt(X,Y);
  if (Item = nil) then Exit; //. ->
  ObjectDistanceNotifier.ExchangeItems(Selected.Index,Item.Index);
  lvNotifierItems_ExchangeItems(Selected.Index,Item.Index);
  ItemFocused:=Item;
  Selected:=Item;
  end;
end;

procedure TfmObjectDistanceNotifier.Disableselecteditem1Click(Sender: TObject);
begin
if (ObjectDistanceNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1) then ObjectDistanceNotifier.DisableEnableItem(SelectedItemIndex,true);
end;

procedure TfmObjectDistanceNotifier.Enableselecteditem1Click(Sender: TObject);
begin
if (ObjectDistanceNotifier = nil) then Exit; //. ->
if (SelectedItemIndex <> -1) then ObjectDistanceNotifier.DisableEnableItem(SelectedItemIndex,false);
end;

procedure TfmObjectDistanceNotifier.DisableAll1Click(Sender: TObject);
begin
if (ObjectDistanceNotifier = nil) then Exit; //. ->
ObjectDistanceNotifier.DisableEnableAll(true);
end;

procedure TfmObjectDistanceNotifier.Enableall1Click(Sender: TObject);
begin
if (ObjectDistanceNotifier = nil) then Exit; //. ->
ObjectDistanceNotifier.DisableEnableAll(false);
end;

procedure TfmObjectDistanceNotifier.bbShowEventsProcessorClick(Sender: TObject);
begin
if (NotificationAreaEventsProcessor <> nil) then NotificationAreaEventsProcessor.Panel.Show();
end;

procedure TfmObjectDistanceNotifier.FormShow(Sender: TObject);
begin
Updater.Enabled:=true;
end;

procedure TfmObjectDistanceNotifier.FormHide(Sender: TObject);
begin
Updater.Enabled:=false;
end;

procedure ObjectDistanceNotifier_Initialize();
begin
flServer:=(ProxySpace_ProxySpaceServerType = pssAreaNotification);
if (flServer) then ServerProfile:=TAreaNotificationServerProfile(ProxySpace_ProxySpaceServerProfile()^);
//.
ObjectDistanceNotifier:=TObjectDistanceNotifier.Create;
if (NotificationAreaEventsProcessor <> nil)
 then begin
  ObjectDistanceNotifier.EventHandler:=NotificationAreaEventsProcessor.ProcessObjectDistanceNotificationEvent;
  end;
ObjectDistanceNotifierMonitor:=TfmObjectDistanceNotifier.Create();
end;

procedure ObjectDistanceNotifier_Finalize();
begin
FreeAndNil(ObjectDistanceNotifierMonitor);
FreeAndNil(ObjectDistanceNotifier);
end;

procedure ObjectDistanceNotifier_ShowPanel();
begin
if (ObjectDistanceNotifierMonitor <> nil) then ObjectDistanceNotifierMonitor.Show();
end;


Initialization

Finalization
ObjectDistanceNotifierMonitor.Free;
ObjectDistanceNotifier.Free;

end.
