unit unitCoGeoMonitorObjectTreePanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ImgList, Menus, ComCtrls,
  unitObjectModel,
  FunctionalityImport,
  unitCoGeoMonitorObjectFunctionality;

const
  CoGeoMonitorObjectTreeListFile = 'CoGeoMonitorObjectTree.xml';
  WM_UPDATESTATE = WM_USER+1;
  ID_LOADTREEFILE = WM_USER+2;
  ID_SAVETREEFILE = WM_USER+3;
type
  TCoGeoMonitorObjectTreeListItem = class
    ID: Int64;
    Kind: integer;
    Name: string;
    Info: string;
    Domain: string;
    //.
    StatusBar: TCoGeoMonitorObjectStatusBar;

    Destructor Destroy(); override;
  end;

  TCoGeoMonitorObjectTreeList = class
  private
    Items: TList;
    flChanged: boolean;
  public
    Constructor Create();
    Destructor Destroy(); override;
    procedure Clear();
    procedure Load(const FileName: string = '');
    procedure Save(const FileName: string = '');
    procedure AddNew(const Item: TCoGeoMonitorObjectTreeListItem);
    procedure Remove(var Item: TCoGeoMonitorObjectTreeListItem);
    procedure GetSortedList(out List: TStringList);
  end;

  TfmCoGeoMonitorObjectTreePanel = class(TForm)
    tvObjects: TTreeView;
    tvObjects_ItemPopup: TPopupMenu;
    tvObjects_ImageList: TImageList;
    N1: TMenuItem;
    Removeobject1: TMenuItem;
    Modifryobject1: TMenuItem;
    Loadtodaytrack1: TMenuItem;
    Loadyesterdaytrack1: TMenuItem;
    tvObjects_DomainPopup: TPopupMenu;
    Preparereport1: TMenuItem;
    procedure Removeobject1Click(Sender: TObject);
    procedure Modifryobject1Click(Sender: TObject);
    procedure tvObjectsClick(Sender: TObject);
    procedure tvObjectsDblClick(Sender: TObject);
    procedure Loadtodaytrack1Click(Sender: TObject);
    procedure Loadyesterdaytrack1Click(Sender: TObject);
    procedure Preparereport1Click(Sender: TObject);
  private
    { Private declarations }
    TreeList: TCoGeoMonitorObjectTreeList;
    LastAddedDomain: string;
    LastClickNode: TTreeNode;
    LastDblClickNode: TTreeNode;

    procedure AddItem(const Item: TCoGeoMonitorObjectTreeListItem);
    procedure RemoveItem(var Item: TCoGeoMonitorObjectTreeListItem);
    procedure DoOnModifyItem();
    procedure _UpdateState();
    procedure UpdateState();
    procedure wmSysCommand(var Message: TMessage); message WM_SYSCOMMAND;
    procedure wmUPDATESTATE(var Message: TMessage); message WM_UPDATESTATE;
  public
    { Public declarations }
    Constructor Create();
    Destructor Destroy(); override;
    procedure Update; reintroduce;
    procedure AddNewObject(const pID: integer; const pKind: integer; const pName: string; const pInfo: string; const pDomain: string); overload;
    procedure AddNewObject(const pID: integer); overload;
    procedure LoadItemTrackIntoCurrentReflector(const Item: TCoGeoMonitorObjectTreeListItem; const BeginDate,EndDate: TDateTime);
    procedure PrepareDomainTrackReport(var DomainItemList: TList; const BeginDate,EndDate: TDateTime; const ReportName: string);
  end;

var
  fmCoGeoMonitorObjectTreePanel: TfmCoGeoMonitorObjectTreePanel;

  procedure Initialize();
  procedure Finalize();
  function GetTreePanel(): TfmCoGeoMonitorObjectTreePanel;

implementation
uses
  MSXML,
  StrUtils,
  FileCtrl,
  TypesDefines,
  unitGEOGraphServerController,
  unitBusinessModel,
  unitCoGeoMonitorObjectTreeNewObjectPanel,
  unitTimeIntervalPicker;

{$R *.dfm}


{TCoGeoMonitorObjectTreeListItem}
Destructor TCoGeoMonitorObjectTreeListItem.Destroy();
begin
StatusBar.Free();
Inherited;
end; 


{TCoGeoMonitorObjectTreeList}
Constructor TCoGeoMonitorObjectTreeList.Create();
begin
Inherited Create();
Items:=TList.Create();
Load();
end;

Destructor TCoGeoMonitorObjectTreeList.Destroy();
begin
if (flChanged) then Save();
if (Items <> nil)
 then begin
  Clear();
  FreeAndNil(Items);
  end;
Inherited;
end;

procedure TCoGeoMonitorObjectTreeList.Clear();
var
  I: integer;
begin
for I:=0 to Items.Count-1 do TObject(Items[I]).Destroy();
Items.Clear();
end;

procedure TCoGeoMonitorObjectTreeList.Load(const FileName: string = '');

  procedure GetStatusBarDataStream(DATA: Variant; out DataStream: TMemoryStream);
  var
    DATASize: integer;
    DATAPtr: pointer;
  begin
  DataStream:=nil;
  try
  if (DATA <> null)
   then begin
    DATASize:=VarArrayHighBound(DATA,1)+1;
    DATAPtr:=VarArrayLock(DATA);
    try
    DataStream:=TMemoryStream.Create();
    with DataStream do begin
    Size:=DATASize;
    Write(DATAPtr^,DATASize);
    Position:=0;
    end;
    finally
    VarArrayUnLock(DATA);
    end;
    end;
  except
    FreeAndNil(DataStream);
    Raise; //. =>
    end;
  end;

var
  FN: string;
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  ItemsNode: IXMLDOMNode;
  I: integer;
  ItemNode: IXMLDOMNode;
  Item: TCoGeoMonitorObjectTreeListItem;
  StatusBarDataNode: IXMLDOMNode;
  StatusBarStream: TMemoryStream;
begin
flChanged:=false;
Clear();
if (FileName = '') then FN:=ProxySpace_GetCurrentUserProfile+'\'+CoGeoMonitorObjectTreeListFile else FN:=FileName;
if (FileExists(FN))
 then begin
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(FN);
  VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=1;
  if (Version <> 1) then Exit; //. ->
  ItemsNode:=Doc.documentElement.selectSingleNode('/ROOT/Items');
  for I:=0 to ItemsNode.childNodes.length-1 do begin
    ItemNode:=ItemsNode.childNodes[I];
    //.
    Item:=TCoGeoMonitorObjectTreeListItem.Create();
    try
    Item.ID:=ItemNode.selectSingleNode('ID').nodeTypedValue;
    Item.Kind:=ItemNode.selectSingleNode('Kind').nodeTypedValue;
    Item.Name:=ItemNode.selectSingleNode('Name').nodeTypedValue;
    Item.Info:=ItemNode.selectSingleNode('Info').nodeTypedValue;
    Item.Domain:=ItemNode.selectSingleNode('Domain').nodeTypedValue;
    with TCoGeoMonitorObjectFunctionality.Create(Item.ID) do
    try
    Item.StatusBar:=TCoGeoMonitorObjectStatusBar(TStatusBar_Create(nil));
    finally
    Release();
    end;
    StatusBarStream:=nil;
    try
    if (FileName = '')
     then begin
      StatusBarDataNode:=ItemNode.selectSingleNode('StatusBarData');
      if (StatusBarDataNode <> nil) then GetStatusBarDataStream(StatusBarDataNode.nodeTypedValue,{out} StatusBarStream);
      end;
    if ((StatusBarStream <> nil) AND ProxySpace__Context_flLoaded())
     then begin
      if (NOT Item.StatusBar.LoadFromStream(StatusBarStream))
       then begin
        Item.StatusBar.Update();
        flChanged:=true;
        end;
      end
     else begin
      Item.StatusBar.Update();
      flChanged:=true;
      end;
    finally
    StatusBarStream.Free();
    end;
    Items.Add(Item);
    except
      Item.Destroy();
      Raise ; //. =>
      end;
    end;
  end;
end;

procedure TCoGeoMonitorObjectTreeList.Save(const FileName: string = '');

  function GetStatusBarDataStreamVariant(const DataStream: TMemoryStream): Variant;
  var
    DATAPtr: pointer;
  begin
  if (DataStream <> nil)
   then begin
    DataStream.Position:=0;
    with DataStream do begin
    Result:=VarArrayCreate([0,Size-1],varByte);
    DATAPtr:=VarArrayLock(Result);
    try
    Read(DATAPtr^,Size);
    finally
    VarArrayUnLock(Result);
    end;
    end;
    end
   else Result:=Null;
  end;

var
  FN: string;
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode: IXMLDOMElement;
  ItemsNode: IXMLDOMElement;
  I: integer;
  ItemNode: IXMLDOMElement;
  PropNode: IXMLDOMElement;
  StatusBarStream: TMemoryStream;
begin
if (FileName = '') then FN:=ProxySpace_GetCurrentUserProfile+'\'+CoGeoMonitorObjectTreeListFile else FN:=FileName;
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=1;
Root.appendChild(VersionNode);
ItemsNode:=Doc.createElement('Items');
Root.appendChild(ItemsNode);
for I:=0 to Items.Count-1 do with TCoGeoMonitorObjectTreeListItem(Items[I]) do begin
  try
  //. create item
  ItemNode:=Doc.CreateElement('I'+IntToStr(I));
  //.
  PropNode:=Doc.CreateElement('ID');                    PropNode.nodeTypedValue:=ID;                    ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Kind');                  PropNode.nodeTypedValue:=Kind;                  ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Name');                  PropNode.nodeTypedValue:=Name;                  ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Info');                  PropNode.nodeTypedValue:=Info;                  ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Domain');                PropNode.nodeTypedValue:=Domain;                ItemNode.appendChild(PropNode);
  if ((FileName = '') AND (StatusBar <> nil))
   then begin
    PropNode:=Doc.CreateElement('StatusBarData');
    PropNode.Set_dataType('bin.base64');
    StatusBarStream:=TMemoryStream.Create();
    try
    StatusBar.SaveToStream(StatusBarStream);
    PropNode.nodeTypedValue:=GetStatusBarDataStreamVariant(StatusBarStream);
    finally
    StatusBarStream.Destroy();
    end;
    ItemNode.appendChild(PropNode);
    end;
  //. add item
  ItemsNode.appendChild(ItemNode);
  except
    end;
  end;
//. save xml document
Doc.Save(FN);
flChanged:=false;
end;

procedure TCoGeoMonitorObjectTreeList.AddNew(const Item: TCoGeoMonitorObjectTreeListItem);
var
  I: integer;
  RemoveItem: TCoGeoMonitorObjectTreeListItem;
begin
for I:=0 to Items.Count-1 do
  if ((UpperCase(TCoGeoMonitorObjectTreeListItem(Items[I]).Name) = UpperCase(Item.Name)) AND (UpperCase(TCoGeoMonitorObjectTreeListItem(Items[I]).Domain) = UpperCase(Item.Domain)))
   then begin
    RemoveItem:=TCoGeoMonitorObjectTreeListItem(Items[I]);
    Items.Remove(RemoveItem);
    RemoveItem.Destroy();
    Break; //. >
    end;
with TCoGeoMonitorObjectFunctionality.Create(Item.ID) do
try
FreeAndNil(Item.StatusBar);
Item.StatusBar:=TCoGeoMonitorObjectStatusBar(TStatusBar_Create(nil));
finally
Release();
end;
Item.StatusBar.Update();
Items.Add(Item);
Save();
end;

procedure TCoGeoMonitorObjectTreeList.Remove(var Item: TCoGeoMonitorObjectTreeListItem);
begin
Items.Remove(Item);
Save();
FreeAndNil(Item);
end;

procedure TCoGeoMonitorObjectTreeList.GetSortedList(out List: TStringList);
var
  I: integer;
begin
List:=TStringList.Create();
try
List.Capacity:=Items.Capacity;
for I:=0 to Items.Count-1 do List.AddObject(UpperCase(TCoGeoMonitorObjectTreeListItem(Items[I]).Domain),Items[I]);
List.Sort();
except
  FreeAndNil(List);
  Raise ; //. =>
  end;
end;


{TfmCoGeoMonitorObjectTreePanel}
Constructor TfmCoGeoMonitorObjectTreePanel.Create();
var
  SysMenu: THandle;
  I: integer;
begin
Inherited Create(nil);
//.
SysMenu:=GetSystemMenu(Handle,False);
InsertMenu(SysMenu,0,MF_BYPOSITION,ID_LOADTREEFILE, 'Load tree from file');
InsertMenu(SysMenu,0,MF_BYPOSITION,ID_SAVETREEFILE, 'Save tree into file');
//.
TreeList:=TCoGeoMonitorObjectTreeList.Create();
//.
for I:=0 to TreeList.Items.Count-1 do TCoGeoMonitorObjectTreeListItem(TreeList.Items[I]).StatusBar.UpdateNotificationProc:=UpdateState;
//.
Update();
end;

Destructor TfmCoGeoMonitorObjectTreePanel.Destroy();
begin
TreeList.Free();
Inherited;
end;

procedure TfmCoGeoMonitorObjectTreePanel.Update;
var
  SL: TStringList;
  LastDomain: string;
  SelectedNodeName: string;
  I: integer;
  _Domain: string;
  DP: integer;
  DS: string;
  DomainTreeNode,ItemTreeNode: TTreeNode;
  DomainItemsCount,DomainOnLineItemsCount: integer;
begin
TreeList.GetSortedList({out} SL);
try
LastDomain:='';
DomainTreeNode:=nil;
DomainItemsCount:=0;
DomainOnLineItemsCount:=0;
tvObjects.Items.BeginUpdate();
try
if (tvObjects.Selected <> nil) then SelectedNodeName:=tvObjects.Selected.Text else SelectedNodeName:='';
tvObjects.Items.Clear();
for I:=0 to SL.Count-1 do with TCoGeoMonitorObjectTreeListItem(SL.Objects[I]) do begin
  _Domain:=UpperCase(SL[I]);
  if (LastDomain <> _Domain)
   then begin
    if (DomainTreeNode <> nil)
     then begin
      if (DomainItemsCount = 0)
       then DomainTreeNode.ImageIndex:=3
       else
        if (DomainItemsCount = DomainOnlineItemsCount)
         then DomainTreeNode.ImageIndex:=0
         else
          if (DomainOnlineItemsCount = 0)
           then DomainTreeNode.ImageIndex:=2
           else DomainTreeNode.ImageIndex:=1;
      DomainTreeNode.SelectedIndex:=DomainTreeNode.ImageIndex;
      DomainTreeNode.StateIndex:=DomainTreeNode.ImageIndex;
      end;
    //.
    DP:=Pos(LastDomain,_Domain);
    if ((DP = 1) AND ((Length(_Domain)-(Length(LastDomain)+1)) > 0))
     then begin
      DP:=Length(LastDomain)+2;
      DS:=Copy(_Domain,DP,(Length(_Domain)-DP+1));
      DomainTreeNode:=tvObjects.Items.AddChild(DomainTreeNode,DS);
      end
     else begin
      DS:=_Domain;
      DomainTreeNode:=tvObjects.Items.AddChild(nil,DS);
      end;
    DomainItemsCount:=0;
    DomainOnLineItemsCount:=0;
    LastDomain:=_Domain;
    end;
  ItemTreeNode:=tvObjects.Items.AddChild(DomainTreeNode,Name);
  ItemTreeNode.Data:=SL.Objects[I];
  case TGeoMonitorObjectKind(Kind) of
  gmokPerson:           if (StatusBar.OnlineFlag) then ItemTreeNode.ImageIndex:=6 else ItemTreeNode.ImageIndex:=7;
  gmokAutomobile:       if (StatusBar.OnlineFlag) then ItemTreeNode.ImageIndex:=8 else ItemTreeNode.ImageIndex:=9;
  else
    if (StatusBar.OnlineFlag) then ItemTreeNode.ImageIndex:=4 else ItemTreeNode.ImageIndex:=5;
  end;
  ItemTreeNode.SelectedIndex:=ItemTreeNode.ImageIndex;
  ItemTreeNode.StateIndex:=ItemTreeNode.ImageIndex;
  if (ItemTreeNode.Text = SelectedNodeName)
   then begin
    ItemTreeNode.Selected:=true;
    ItemTreeNode.Focused:=ItemTreeNode.Selected;
    ItemTreeNode.Expand(false);
    end;
  Inc(DomainItemsCount);
  if (StatusBar.OnlineFlag) then Inc(DomainOnlineItemsCount);
  end;
if (DomainTreeNode <> nil)
 then begin //. same as above
  if (DomainItemsCount = 0)
   then DomainTreeNode.ImageIndex:=3
   else
    if (DomainItemsCount = DomainOnlineItemsCount)
     then DomainTreeNode.ImageIndex:=0
     else
      if (DomainOnlineItemsCount = 0)
       then DomainTreeNode.ImageIndex:=2
       else DomainTreeNode.ImageIndex:=1;
  DomainTreeNode.SelectedIndex:=DomainTreeNode.ImageIndex;
  DomainTreeNode.StateIndex:=DomainTreeNode.ImageIndex;
  end;
finally
tvObjects.Items.EndUpdate();
end;
finally
SL.Destroy();
end;
end;

procedure TfmCoGeoMonitorObjectTreePanel._UpdateState;
var
  I,J: integer;
  DomainItemsCount,DomainOnLineItemsCount: integer;
begin
for I:=0 to tvObjects.Items.Count-1 do
  if (tvObjects.Items[I].Data <> nil)
   then with TCoGeoMonitorObjectTreeListItem(tvObjects.Items[I].Data) do begin
    case TGeoMonitorObjectKind(Kind) of
    gmokPerson:           if (StatusBar.OnlineFlag) then tvObjects.Items[I].ImageIndex:=6 else tvObjects.Items[I].ImageIndex:=7;
    gmokAutomobile:       if (StatusBar.OnlineFlag) then tvObjects.Items[I].ImageIndex:=8 else tvObjects.Items[I].ImageIndex:=9;
    else
      if (StatusBar.OnlineFlag) then tvObjects.Items[I].ImageIndex:=4 else tvObjects.Items[I].ImageIndex:=5;
    end;
    tvObjects.Items[I].SelectedIndex:=tvObjects.Items[I].ImageIndex;
    tvObjects.Items[I].StateIndex:=tvObjects.Items[I].ImageIndex;
    end;
for I:=0 to tvObjects.Items.Count-1 do
  if (tvObjects.Items[I].Data = nil)
   then begin
    DomainItemsCount:=0;
    DomainOnLineItemsCount:=0;
    for J:=0 to tvObjects.Items[I].Count-1 do
      if (tvObjects.Items[I].Item[J].Data <> nil)
       then with TCoGeoMonitorObjectTreeListItem(tvObjects.Items[I].Item[J].Data) do begin
        Inc(DomainItemsCount);
        if (StatusBar.OnlineFlag) then Inc(DomainOnlineItemsCount);
        end;
    if (DomainItemsCount = 0)
     then tvObjects.Items[I].ImageIndex:=3
     else
      if (DomainItemsCount = DomainOnlineItemsCount)
       then tvObjects.Items[I].ImageIndex:=0
       else
        if (DomainOnlineItemsCount = 0)
         then tvObjects.Items[I].ImageIndex:=2
         else tvObjects.Items[I].ImageIndex:=1;
    tvObjects.Items[I].SelectedIndex:=tvObjects.Items[I].ImageIndex;
    tvObjects.Items[I].StateIndex:=tvObjects.Items[I].ImageIndex;
    end;
end;

procedure TfmCoGeoMonitorObjectTreePanel.UpdateState();
begin
TreeList.flChanged:=true;
PostMessage(Handle, WM_UPDATESTATE, 0,0);
end;

procedure TfmCoGeoMonitorObjectTreePanel.wmUPDATESTATE(var Message: TMessage);
begin
_UpdateState();
end;

procedure TfmCoGeoMonitorObjectTreePanel.wmSysCommand(var Message: TMessage);
var
  Path,FN: string;
begin
case Message.wParam of
ID_LOADTREEFILE: begin
  if NOT SelectDirectory('Select directory ->','',Path) then Exit; //. ->
  FN:=Path+'\'+CoGeoMonitorObjectTreeListFile;
  TreeList.Load(FN);
  TreeList.Save();
  Update();
  end;
ID_SAVETREEFILE: begin
  if NOT SelectDirectory('Select directory ->','',Path) then Exit; //. ->
  FN:=Path+'\'+CoGeoMonitorObjectTreeListFile;
  TreeList.Save(FN);
  end;
end;
inherited;
end;

procedure TfmCoGeoMonitorObjectTreePanel.AddItem(const Item: TCoGeoMonitorObjectTreeListItem);
begin
TreeList.AddNew(Item);
Item.StatusBar.UpdateNotificationProc:=UpdateState;
Update();
end;

procedure TfmCoGeoMonitorObjectTreePanel.RemoveItem(var Item: TCoGeoMonitorObjectTreeListItem);
begin
TreeList.Remove(Item);
Update();
end;

procedure TfmCoGeoMonitorObjectTreePanel.DoOnModifyItem();
begin
TreeList.Save();
Update();
end;

procedure TfmCoGeoMonitorObjectTreePanel.AddNewObject(const pID: integer; const pKind: integer; const pName: string; const pInfo: string; const pDomain: string);
var
  NewItem: TCoGeoMonitorObjectTreeListItem;
begin
NewItem:=TCoGeoMonitorObjectTreeListItem.Create();
try
NewItem.ID:=pID;
NewItem.Kind:=pKind;
NewItem.Name:=pName;
NewItem.Info:=pInfo;
NewItem.Domain:=pDomain;
AddItem(NewItem);
except
  NewItem.Destroy();
  Raise; //. =>
  end;
end;

procedure TfmCoGeoMonitorObjectTreePanel.AddNewObject(const pID: integer);
var
  SC: TCursor;
  GMOF: TCoGeoMonitorObjectFunctionality;
  ObjectName: string;
  NewItem: TCoGeoMonitorObjectTreeListItem;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
GMOF:=TCoGeoMonitorObjectFunctionality.Create(pID);
try
ObjectName:=GMOF.Name;
finally
GMOF.Release();
end;
finally
Screen.Cursor:=SC;
end;
with TfmCoGeoMonitorObjectTreeNewObjectPanel.Create() do
try
cbKind.ItemIndex:=0;
edName.Text:=ObjectName;
edDomain.Text:=LastAddedDomain;
if (NOT Dialog()) then Exit; //. ->
NewItem:=TCoGeoMonitorObjectTreeListItem.Create();
try
NewItem.ID:=pID;
if (cbKind.ItemIndex >= 0) then NewItem.Kind:=cbKind.ItemIndex;
NewItem.Name:=edName.Text;
NewItem.Info:=memoInfo.Text;
NewItem.Domain:=edDomain.Text;
AddItem(NewItem);
except
  NewItem.Destroy();
  Raise; //. =>
  end;
LastAddedDomain:=edDomain.Text;
finally
Destroy();
end;
end;

procedure TfmCoGeoMonitorObjectTreePanel.LoadItemTrackIntoCurrentReflector(const Item: TCoGeoMonitorObjectTreeListItem; const BeginDate,EndDate: TDateTime);
var
  ObjectName: string;
  idGeoGraphServerObject: integer;
  _GeoGraphServerID: integer;
  _ObjectType: integer;
  _ObjectID: integer;
  _BusinessModel: integer;
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TObjectModel;
  ObjectBusinessModel: TBusinessModel;
  ptrNewTrack: pointer;
begin
ProxySpace__Log_OperationStarting('loading track from the server ...');
try
with TCoGeoMonitorObjectFunctionality.Create(Item.ID) do
try
ObjectName:=Item.Name;
if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
try
GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
finally
Release();
end;
if (NOT ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))) then Exit; //. ->
if ((_ObjectType = 0) OR (_BusinessModel = 0)) then Exit; //. ->
ServerObjectController:=TGEOGraphServerObjectController.Create(idGeoGraphServerObject,_ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
ObjectModel:=TObjectModel.GetModel(_ObjectType,ServerObjectController,true);
if (ObjectModel = nil) then Raise Exception.Create('there is no object model'); //. =>
try
ObjectBusinessModel:=TBusinessModel.GetModel(ObjectModel,_BusinessModel);
if (ObjectBusinessModel = nil) then Raise Exception.Create('there is no business model'); //. =>
try
ptrNewTrack:=ObjectBusinessModel.LoadTrack(BeginDate,EndDate, ObjectName, clRed,idCoComponent,false,true);
ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_InsertTrack(ptrNewTrack);
ProxySpace____TypesSystem___Reflector__GeoSpace_ShowPanel();
finally
ObjectBusinessModel.Destroy();
end;
finally
ObjectModel.Destroy();
end;
finally
Release();
end;
finally
ProxySpace__Log_OperationDone();
end;
ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_GetTrackPanel(ptrNewTrack,BeginDate-TimeZoneDelta).Show();
end;

procedure TfmCoGeoMonitorObjectTreePanel.PrepareDomainTrackReport(var DomainItemList: TList; const BeginDate,EndDate: TDateTime; const ReportName: string);
var
  DomainItems: TGeoObjectTrackDecriptors;
  I: integer;
  //.
  ObjectName: string;
  idGeoGraphServerObject: integer;
  _GeoGraphServerID: integer;
  _ObjectType: integer;
  _ObjectID: integer;
  _BusinessModel: integer;
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TObjectModel;
  ObjectBusinessModel: TBusinessModel;
begin
try
ProxySpace__Log_OperationStarting('loading tracks for date interval from the server ...');
try
SetLength(DomainItems,DomainItemList.Count);
for I:=0 to DomainItemList.Count-1 do with TCoGeoMonitorObjectTreeListItem(DomainItemList[I]) do begin
  DomainItems[I].ObjectName:=Name;
  DomainItems[I].ObjectDomain:=Domain;
  DomainItems[I].ptrTrack:=nil;
  //. loading track
  with TCoGeoMonitorObjectFunctionality.Create(ID) do
  try
  ObjectName:=TCoGeoMonitorObjectTreeListItem(DomainItemList[I]).Name;
  if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
  with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
  try
  GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
  finally
  Release();
  end;
  if (NOT ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))) then Raise Exception.Create('invalid object: '+ObjectName); // =>
  if ((_ObjectType = 0) OR (_BusinessModel = 0)) then Raise Exception.Create('invalid object: '+ObjectName+', there are no models defined'); // =>
  ServerObjectController:=TGEOGraphServerObjectController.Create(idGeoGraphServerObject,_ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
  ObjectModel:=TObjectModel.GetModel(_ObjectType,ServerObjectController,true);
  if (ObjectModel = nil) then Raise Exception.Create('invalid object: '+ObjectName+', '+'there is no object model'); //. =>
  try
  ObjectBusinessModel:=TBusinessModel.GetModel(ObjectModel,_BusinessModel);
  if (ObjectBusinessModel = nil) then Raise Exception.Create('invalid object: '+ObjectName+', '+'there is no business model'); //. =>
  try
  DomainItems[I].ptrTrack:=ObjectBusinessModel.LoadTrack(BeginDate,EndDate, ObjectName, clRed,idCoComponent,false,true);
  finally
  ObjectBusinessModel.Destroy();
  end;
  finally
  ObjectModel.Destroy();
  end;
  finally
  Release();
  end;
  //. decode track
  GeoObjectTrack_Decode(DomainItems[I].ptrTrack);
  //. clear track nodes (to decrease memory usage)
  TObjectModel.Log_Track_ClearNodes(DomainItems[I].ptrTrack);
  end;
finally
ProxySpace__Log_OperationDone();
end;
GeoObjectTracks_GetReportPanel({var} DomainItems, ReportName).Show();
finally
if (Length(DomainItems) > 0)
 then begin
  for I:=0 to Length(DomainItems)-1 do if (DomainItems[I].ptrTrack <> nil) then TObjectModel.Log_DestroyTrack(DomainItems[I].ptrTrack);
  SetLength(DomainItems,0);
  end;
end;
end;

procedure TfmCoGeoMonitorObjectTreePanel.tvObjectsClick(Sender: TObject);
var
  SC: TCursor;
  VisualizationType: integer;
  VisualizationID: integer;
begin
if ((tvObjects.Selected = nil) OR (tvObjects.Selected.Data = nil))
 then begin
  tvObjects.PopupMenu:=tvObjects_DomainPopup;
  Exit; //. ->
  end
 else tvObjects.PopupMenu:=tvObjects_ItemPopup;
///- if (LastClickNode = tvObjects.Selected) then Exit; //. ->
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
with TCoGeoMonitorObjectFunctionality.Create(TCoGeoMonitorObjectTreeListItem(tvObjects.Selected.Data).ID) do
try
GetVisualizationComponent(VisualizationType,VisualizationID);
with TBaseVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
try
ProxySpace___TypesSystem__Reflector_ShowObjAtCenter(Ptr);
finally
Release;
end;
finally
Release();
end;
finally
Screen.Cursor:=SC;
end;
finally
LastClickNode:=tvObjects.Selected;
end;
end;

procedure TfmCoGeoMonitorObjectTreePanel.tvObjectsDblClick(Sender: TObject);
var
  SC: TCursor;
begin
if ((tvObjects.Selected = nil) OR (tvObjects.Selected.Data = nil))
 then begin
  tvObjects.PopupMenu:=tvObjects_DomainPopup;
  Exit; //. ->
  end
 else tvObjects.PopupMenu:=tvObjects_ItemPopup;
///- if (LastDblClickNode = tvObjects.Selected) then Exit; //. ->
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
with TCoGeoMonitorObjectFunctionality.Create(TCoGeoMonitorObjectTreeListItem(tvObjects.Selected.Data).ID) do
try
TPropsPanel_Create().Show();
finally
Release();
end;
finally
Screen.Cursor:=SC;
end;
finally
LastDblClickNode:=tvObjects.Selected;
end;
end;

procedure TfmCoGeoMonitorObjectTreePanel.Preparereport1Click(Sender: TObject);
var
  BeginTime,EndTime: TDateTime;
  DomainNode: TTreeNode;
  IL: TList;
  I: integer;
  ObjectTracks: TGeoObjectTrackDecriptors;
  ReportName: string;
begin
if ((tvObjects.Selected = nil) OR (tvObjects.Selected.Data <> nil)) then Exit; //. ->
//.
with TfmTimeIntervalPicker.Create() do
try
if (NOT Select({out} BeginTime,EndTime)) then Exit; //. ->
finally
Release();
end;
//.
DomainNode:=tvObjects.Selected;
IL:=TList.Create();
try
for I:=0 to DomainNode.Count-1 do if (DomainNode.Item[I].Data <> nil) then IL.Add(DomainNode.Item[I].Data);
if (IL.Count = 0) then Exit; //. ->
ReportName:='Tracê report for domain: '+DomainNode.Text+', date interval: '+FormatDateTime('DD/MM/YYYY',BeginTime)+'-'+FormatDateTime('DD/MM/YYYY',EndTime);
PrepareDomainTrackReport(IL, BeginTime,EndTime, ReportName);
finally
IL.Destroy();
end;
//.
end;

procedure TfmCoGeoMonitorObjectTreePanel.Loadtodaytrack1Click(Sender: TObject);
begin
if ((tvObjects.Selected = nil) OR (tvObjects.Selected.Data = nil)) then Exit; //. ->
LoadItemTrackIntoCurrentReflector(TCoGeoMonitorObjectTreeListItem(tvObjects.Selected.Data), Now,Now);
end;

procedure TfmCoGeoMonitorObjectTreePanel.Loadyesterdaytrack1Click(Sender: TObject);
begin
if ((tvObjects.Selected = nil) OR (tvObjects.Selected.Data = nil)) then Exit; //. ->
LoadItemTrackIntoCurrentReflector(TCoGeoMonitorObjectTreeListItem(tvObjects.Selected.Data), Now-1.0,Now-1.0);
end;

procedure TfmCoGeoMonitorObjectTreePanel.Modifryobject1Click(Sender: TObject);
var
  _ModifyItem: TCoGeoMonitorObjectTreeListItem;
begin
if ((tvObjects.Selected = nil) OR (tvObjects.Selected.Data = nil)) then Exit; //. ->
_ModifyItem:=TCoGeoMonitorObjectTreeListItem(tvObjects.Selected.Data);
with TfmCoGeoMonitorObjectTreeNewObjectPanel.Create() do
try
cbKind.ItemIndex:=_ModifyItem.Kind;
edName.Text:=_ModifyItem.Name;
memoInfo.Text:=_ModifyItem.Info;
edDomain.Text:=_ModifyItem.Domain;
if (NOT Dialog()) then Exit; //. ->
if (cbKind.ItemIndex >= 0) then _ModifyItem.Kind:=cbKind.ItemIndex;
_ModifyItem.Name:=edName.Text;
_ModifyItem.Info:=memoInfo.Text;
_ModifyItem.Domain:=edDomain.Text;
DoOnModifyItem();
finally
Destroy();
end;
end;

procedure TfmCoGeoMonitorObjectTreePanel.Removeobject1Click(Sender: TObject);
var
  _RemoveItem: TCoGeoMonitorObjectTreeListItem;
begin
if ((tvObjects.Selected = nil) OR (tvObjects.Selected.Data = nil)) then Exit; //. ->
if (MessageDlg('Remove selected object ?', mtConfirmation , [mbYes,mbNo], 0) <> mrYes) then Exit; //. ->
_RemoveItem:=TCoGeoMonitorObjectTreeListItem(tvObjects.Selected.Data);
RemoveItem(_RemoveItem);
end;


procedure Initialize();
begin
Finalize();
fmCoGeoMonitorObjectTreePanel:=TfmCoGeoMonitorObjectTreePanel.Create();
end;

procedure Finalize();
begin
FreeAndNil(fmCoGeoMonitorObjectTreePanel);
end;

function GetTreePanel(): TfmCoGeoMonitorObjectTreePanel;
begin
if (fmCoGeoMonitorObjectTreePanel = nil) then Initialize();
Result:=fmCoGeoMonitorObjectTreePanel;
end;


Initialization
fmCoGeoMonitorObjectTreePanel:=nil;

Finalization
Finalize();

end.
