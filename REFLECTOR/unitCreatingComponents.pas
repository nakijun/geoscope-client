unit unitCreatingComponents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ComCtrls, RXCtrls, StdCtrls, Buttons, GlobalSpaceDefines, unitProxySpace,
  ExtCtrls, FunctionalitySOAPInterface, Functionality,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesFunctionality,
  {$ENDIF}
  unitReflector, SpaceObjInterpretation,
  RxMenus;

const
  fnCreatingComponents = REFLECTORProfile+'\'+'CreatingComponents';
  WM_REMOVEITEM = WM_USER+1;

type
  TCreatingComponentStoredStruc = packed record
    idType: integer;
    idObj: integer;
    ObjectName: shortstring;
  end;

  TCreatingComponentStruc = packed record
    idType: integer;
    idObj: integer;
    ObjectName: shortstring;
    IconBitmap: TBitmap;
  end;

  TCreatingComponentsFile = class
  private
    Space: TProxySpace;
  public
    Constructor Create(pSpace: TProxySpace);
    procedure GetItemsList(var List: TList);
    procedure Save(Items: TListItems); overload;
    procedure Save(Items: TList); overload;
    procedure RemoveItem(const pidType,pidObj: integer);
  end;

  TpopupComponentsPanel = class(TPopupMenu)
  private
    ComponentsPanel: TSpaceObjPanelProps;
    CreatingComponentsMenuItem: TMenuItem;
    ImageList: TImageList;
    ShowHideGridItemMenu: TMenuItem;

    procedure MeasureItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
  public
    Constructor Create(pComponentsPanel: TSpaceObjPanelProps);
    Destructor Destroy; override;
    procedure Update;
    procedure Clear;
    procedure Popup(Sender: TObject);
    procedure CreatingComponentsMenuClick(Sender: TObject);
    procedure CreatingComponentsRepositoryClick(Sender: TObject);
    property PopupPoint;
  end;

  TfmCreatingComponents = class(TForm)
    ListObjects: TListView;
    Bevel1: TBevel;
    Popup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ListObjectsDblClick(Sender: TObject);
    procedure ListObjectsEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure ListObjectsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListObjectsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    flChanged: boolean;
    flSelected: boolean;
    Updater: TTypesSystemPresentUpdater;
    ImageList: TImageList;

    procedure wmRemoveItem(var Message: TMessage); message WM_REMOVEITEM;
  public
    { Public declarations }
    Constructor Create(pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Clear;
    procedure Update; overload;
    procedure Update(const idTObj,idObj: integer; const Operation: TComponentOperation); overload;
    procedure AlphaSort;
    procedure InsertNewAndEdit(const pidType,pidObj: integer);
    procedure InsertNewFromClipboardAndEdit;
    procedure RemoveItem(Item: TListItem);
    procedure RemoveSelected;
    procedure ExchangeItems(SrsIndex,DistIndex: integer);
    procedure Save;
    function Select(var vidType,vidObj: integer): boolean;
  end;


implementation
uses
  unitSpaceNotificationSubscription;
  

{$R *.DFM}

var
  PopupComponentsList: TList = nil;
  PopupComponentsList_flUpdateNeeded: boolean = true;

procedure CreateComponent(Space: TProxySpace; pReflector: TAbstractReflector; const idTPrototype,idPrototype: integer; const idTOwner,idOwner: integer; OwnerComponentsPanel: TSpaceObjPanelProps);
var
  SC: TCursor;
  NewPanelLeft,NewPanelTop: integer;
  PrototypeFunctionality: TComponentFunctionality;
  OwnerFunctionality: TComponentFunctionality;
  CloneFunctionality: TComponentFunctionality;
  idTUseObj,idUseObj: integer;
  idClone: integer;
  //.
  idComponentsPanel: integer;
  idComponent: integer;
  W,H,L,T: integer;
  //.
  VisComponents: TComponentsList;

begin
NewPanelLeft:=OwnerComponentsPanel.MSPointer_X;
NewPanelTop:=OwnerComponentsPanel.MSPointer_Y;
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
if Space.Status in [pssRemoted,pssRemotedBrief] then Space.Log.OperationStarting('component creating ...');
TypesSystem.Reflector:=pReflector;
try
PrototypeFunctionality:=TComponentFunctionality_Create(idTPrototype,idPrototype);
with PrototypeFunctionality do
try
//. check for prototype exists
Check;
//. check for clone acceptable
if (TypesSystem.Reflector <> nil) AND NOT TypesSystem.Reflector.IsObjectCloneAcceptable(idTObj,idObj) then Raise Exception.Create('can not create object'); //. =>
//.
OwnerFunctionality:=TComponentFunctionality_Create(idTOwner,idOwner);
with OwnerFunctionality do
try
idTUseObj:=idTObj;
idUseObj:=idObj;
OwnerComponentsPanel.Updater.Disable; //. выключаем обновление панели компонент собственника, т.к. обновим ее потом явно
try
CloneAndInsertComponent(idTPrototype,idPrototype, idClone, idComponent);
except
  OwnerComponentsPanel.Updater.Enabled;
  Raise; //.=>
  end;
try
CloneFunctionality:=TComponentFunctionality_Create(idTPrototype,idClone);
with CloneFunctionality do
try
//. set clone components by use object
if idUseObj <> 0 then SetComponentsUsingObject(idTUseObj,idUseObj);
//. clone props-panel preparing
{/// - transferred into clone method idComponentsPanel:=PrototypeFunctionality.idCustomPanelProps;
if idComponentsPanel <> 0 then SetCustomPanelPropsByID(idComponentsPanel);
if PrototypeFunctionality.GetPanelPropsWidthHeight(W,H) then SetPanelPropsWidthHeight(W,H);}
SetPanelPropsLeftTop(NewPanelLeft,NewPanelTop);
OwnerComponentsPanel.PanelsProps.InsertPanel(idTObj,idClone, idComponent).SaveChanges;
//. select clone visualization in reflector
if pReflector <> nil
 then
  if NOT FunctionalityIsInheritedFrom(CloneFunctionality,TBase2DVisualizationFunctionality)
   then begin
    QueryComponents(TBase2DVisualizationFunctionality, VisComponents);
    if VisComponents <> nil
     then
      try
      with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(VisComponents[0]^).idTComponent,TItemComponentsList(VisComponents[0]^).idComponent){берем первый визуальный компонент}) do begin //. выделяем визуальный компонент объекта в рефлекторе
      try
      Reflector:=pReflector;
      Reflector.SelectObj(Ptr);
      finally
      Release;
      end;
      end;
      finally
      VisComponents.Destroy;
      end;
    end
   else with TBase2DVisualizationFunctionality(CloneFunctionality) do begin //. выделяем клон-визуализацию в рефлекторе
    Reflector:=pReflector;
    Reflector.SelectObj(Ptr);
    end;
finally
Release;
end;
except
  TypeFunctionality.DestroyInstance(idClone);
  Raise; //. =>
  end;
finally
Release;
end;
finally
Release;
end;
finally
if Space.Status in [pssRemoted,pssRemotedBrief] then Space.Log.OperationDone;
Screen.Cursor:=SC;
end;
end;


{TCreatingComponentsFile}
Constructor TCreatingComponentsFile.Create(pSpace: TProxySpace);
begin
Inherited Create;
Space:=pSpace;
end;

procedure TCreatingComponentsFile.GetItemsList(var List: TList);
var
  F: File of TCreatingComponentStruc;
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  CreatingComponentStoredStruc: TCreatingComponentStoredStruc;
  ptrNewItem: pointer;
begin
List:=TList.Create;
with GetISpaceUserProxySpace(Space.SOAPServerURL) do
if Get_CreatingComponents(Space.UserName,Space.UserPassword,Space.idUserProxySpace,BA)
 then begin
  MemoryStream:=TMemoryStream.Create;
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  while MemoryStream.Read(CreatingComponentStoredStruc,SizeOf(CreatingComponentStoredStruc)) = SizeOf(CreatingComponentStoredStruc) do begin
    //. check for component
    try
    with TComponentFunctionality_Create(CreatingComponentStoredStruc.idType,CreatingComponentStoredStruc.idObj) do
    try
    Check;
    finally
    Release;
    end;
    except
      Continue;
      end;
    //.
    GetMem(ptrNewItem,SizeOf(TCreatingComponentStruc));
    with TCreatingComponentStruc(ptrNewItem^) do begin
    idType:=CreatingComponentStoredStruc.idType;
    idObj:=CreatingComponentStoredStruc.idObj;
    ObjectName:=CreatingComponentStoredStruc.ObjectName;
    try
    with TComponentFunctionality_Create(idType,idObj) do
    try
    if NOT GetIconImage(IconBitmap) then IconBitmap:=nil;
    finally
    Release;
    end;
    except
      IconBitmap:=nil;
      end;
    end;
    List.Add(ptrNewItem);
    end;
  finally
  MemoryStream.Destroy;
  end;
  end
 else begin
  AssignFile(F,fnCreatingComponents);Reset(F);
  try
  while NOT EOF(F) do begin
    GetMem(ptrNewItem,SizeOf(TCreatingComponentStruc));
    Read(F,TCreatingComponentStruc(ptrNewItem^));
    List.Add(ptrNewItem);
    end;
  finally
  CloseFile(F);
  end;
  end;
end;

procedure TCreatingComponentsFile.Save(Items: TListItems);
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  I: integer;
  CreatingComponentStoredStruc: TCreatingComponentStoredStruc;
begin
//. write user defined config
MemoryStream:=TMemoryStream.Create;
try
for I:=0 to Items.Count-1 do with Items[I] do begin
  if Caption <> '' then TCreatingComponentStruc(Data^).ObjectName:=Caption;
  with CreatingComponentStoredStruc do begin
  idType:=TCreatingComponentStruc(Data^).idType;
  idObj:=TCreatingComponentStruc(Data^).idObj;
  ObjectName:=TCreatingComponentStruc(Data^).ObjectName;
  end;
  MemoryStream.Write(CreatingComponentStoredStruc,SizeOf(TCreatingComponentStoredStruc));
  end;
with GetISpaceUserProxySpace(Space.SOAPServerURL) do begin
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
Set_CreatingComponents(Space.UserName,Space.UserPassword,Space.idUserProxySpace,BA);
end;
finally
MemoryStream.Destroy;
end;
end;

procedure TCreatingComponentsFile.Save(Items: TList);
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  I: integer;
  CreatingComponentStoredStruc: TCreatingComponentStoredStruc;
begin
//. write user defined config
MemoryStream:=TMemoryStream.Create;
try
for I:=0 to Items.Count-1 do begin
  with CreatingComponentStoredStruc do begin
  idType:=TCreatingComponentStruc(Items[I]^).idType;
  idObj:=TCreatingComponentStruc(Items[I]^).idObj;
  ObjectName:=TCreatingComponentStruc(Items[I]^).ObjectName;
  end;
  MemoryStream.Write(CreatingComponentStoredStruc,SizeOf(TCreatingComponentStoredStruc));
  end;
with GetISpaceUserProxySpace(Space.SOAPServerURL) do begin
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
Set_CreatingComponents(Space.UserName,Space.UserPassword,Space.idUserProxySpace,BA);
end;
finally
MemoryStream.Destroy;
end;
end;

procedure TCreatingComponentsFile.RemoveItem(const pidType,pidObj: integer);
var
  ItemsList: TList;
  I: integer;
  ptrRemoveItem: pointer;
  flSave: boolean;
begin
GetItemsList(ItemsList);
try
flSave:=false;
I:=0;
while I < ItemsList.Count do with TCreatingComponentStruc(ItemsList[I]^) do
  if (idType = pidType) AND (idObj = pidObj)
   then begin
    ptrRemoveItem:=ItemsList[I];
    ItemsList.Delete(I);
    if TCreatingComponentStruc(ptrRemoveItem^).IconBitmap <> nil then TCreatingComponentStruc(ptrRemoveItem^).IconBitmap.Free;
    FreeMem(ptrRemoveItem,SizeOf(TCreatingComponentStruc));
    flSave:=true;
    end
   else
    Inc(I);
if flSave then Save(ItemsList);
finally
for I:=0 to ItemsList.Count-1 do begin
  ptrRemoveItem:=ItemsList[I];ItemsList[I]:=nil;
  if TCreatingComponentStruc(ptrRemoveItem^).IconBitmap <> nil then TCreatingComponentStruc(ptrRemoveItem^).IconBitmap.Free;
  FreeMem(ptrRemoveItem,SizeOf(TCreatingComponentStruc));
  end;
ItemsList.Destroy;
end;
end;



{TpopupCreatingComponentss}
Constructor TpopupComponentsPanel.Create(pComponentsPanel: TSpaceObjPanelProps);
var
  ItemMenu,SubItemMenu: TMenuItem;
  UNS: string;
begin
Inherited Create(nil);
ImageList:=TImageList.Create(nil);
with ImageList do begin
Width:=32;
Height:=32;
end;
Images:=ImageList;
ComponentsPanel:=pComponentsPanel;
AutoHotKeys:=maManual;
//. назначаем обработчики
with ComponentsPanel do begin
CreatingComponentsMenuItem:=TMenuItem.Create(nil);
with CreatingComponentsMenuItem do begin
Caption:='CREATE Component';
OnMeasureItem:=MeasureItem;
end;
Items.Add(CreatingComponentsMenuItem);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='< COMPONENTS >';
OnMeasureItem:=MeasureItem;
OnClick:=CreatingComponentsRepositoryClick;
end;
Items.Add(ItemMenu);
Items.Add(NewLine);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Copy';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_CopyClick;
end;
Items.Add(ItemMenu);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Cut';
OnMeasureItem:=MeasureItem;
/// ? OnClick:=;
end;
Items.Add(ItemMenu);
Items.Add(NewLine);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Paste';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_PasteClick;
end;
Items.Add(ItemMenu);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Paste by reference';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_PasteByReferenceClick;
Enabled:=false;
end;
Items.Add(ItemMenu);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Export component';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_ExportComponentClick;
end;
Items.Add(ItemMenu);
Items.Add(NewLine);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Owner properties panel';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_ShowOwnerPropsPanel;
end;
Items.Add(ItemMenu);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Components Tree';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_ShowComponentsTreePanel;
end;
Items.Add(ItemMenu);
Items.Add(NewLine);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='CLONE';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_ToCloneClick;
end;
Items.Add(ItemMenu);
Items.Add(NewLine);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Actuality';
OnMeasureItem:=MeasureItem;
  //.
  SubItemMenu:=TMenuItem.Create(nil);
  with SubItemMenu do begin
  Caption:='Actuality interval';
  OnMeasureItem:=MeasureItem;
  OnClick:=PopupMenuItem_ActualityIntervalClick;
  end;
  ItemMenu.Add(SubItemMenu);
  ItemMenu.Add(NewLine);
  //.
  SubItemMenu:=TMenuItem.Create(nil);
  with SubItemMenu do begin
  Caption:='Actualize';
  OnMeasureItem:=MeasureItem;
  OnClick:=PopupMenuItem_ActualizeClick;
  end;
  ItemMenu.Add(SubItemMenu);
  //.
  SubItemMenu:=TMenuItem.Create(nil);
  with SubItemMenu do begin
  Caption:='Actualize to date..';
  OnMeasureItem:=MeasureItem;
  OnClick:=PopupMenuItem_ActualizeToDateClick;
  end;
  ItemMenu.Add(SubItemMenu);
  ItemMenu.Add(NewLine);
  //.
  SubItemMenu:=TMenuItem.Create(nil);
  with SubItemMenu do begin
  Caption:='Deactualize';
  OnMeasureItem:=MeasureItem;
  OnClick:=PopupMenuItem_DeactualizeClick;
  end;
  ItemMenu.Add(SubItemMenu);
end;
Items.Add(ItemMenu);
Items.Add(NewLine);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='DESTROY Component';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_DestroyClick;
end;
Items.Add(ItemMenu);
Items.Add(NewLine);
Items.Add(NewLine);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Copy [FORM]';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_CopyPanelClick;
end;
Items.Add(ItemMenu);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Paste [FORM]';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_PastePanelClick;
end;
Items.Add(ItemMenu);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Edit [FORM] by DELPHI';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_EditPanelClick;
end;
Items.Add(ItemMenu);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Save [FORM] into database';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_SavePanelClick;
end;
Items.Add(ItemMenu);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='default [FORM]';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_AsDefaultPanelClick;
end;
Items.Add(ItemMenu);
Items.Add(NewLine);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Resize [FORM]';
if OwnerPanelsProps <> nil then Enabled:=false;
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_Resize;
end;
Items.Add(ItemMenu);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Show [FORM] control elements';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_ShowPanelControlElements;
end;
Items.Add(ItemMenu);
ShowHideGridItemMenu:=TMenuItem.Create(nil);
with ShowHideGridItemMenu do begin
Caption:='';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_ShowHidePanelGrid;
end;
Items.Add(ShowHideGridItemMenu);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Update [FORM]';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_UpdatePanel;
end;
Items.Add(ItemMenu);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Save changes of [FORM]';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_SaveChanges;
end;
Items.Add(ItemMenu);
Items.Add(NewLine);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Tag ('+IntToStr(ObjFunctionality.Tag)+')';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_TagClick;
end;
Items.Add(ItemMenu);
Items.Add(NewLine);
if (TSpaceNotificationSubscription(ObjFunctionality.Space.NotificationSubscription).IsComponentExist(ObjFunctionality.idTObj,ObjFunctionality.idObj))
 then UNS:='ON'
 else UNS:='OFF';
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Update notifications subscription is '+UNS;
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_UpdateNotificationSubscriptionClick;
end;
Items.Add(ItemMenu);
Items.Add(NewLine);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Reality user rating';
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_RealityRatingClick;
end;
Items.Add(ItemMenu);
Items.Add(NewLine);
ItemMenu:=TMenuItem.Create(nil);
with ItemMenu do begin
Caption:='Close [FORM]';
if OwnerPanelsProps <> nil then Enabled:=false;
OnMeasureItem:=MeasureItem;
OnClick:=PopupMenuItem_CloseClick;
end;
Items.Add(ItemMenu);
PopupMenu:=Self;
end;
OnPopup:=Popup;
end;

Destructor TpopupComponentsPanel.Destroy;
begin
Clear;
ImageList.Free;
Inherited;
end;

procedure TpopupComponentsPanel.Update;
var
  I: integer;
  ptrRemoveItem: pointer;
  newMenuItem: TMenuItem;
  MS: TMemoryStream;
  TempBMP: TBitmap;
begin
Clear;
with CreatingComponentsMenuItem do begin
ImageList.Clear;
ImageList.AddImages(TypesImageList);
if PopupComponentsList_flUpdateNeeded
 then begin
  //. destroy old list
  if PopupComponentsList <> nil
   then with PopupComponentsList do
    for I:=0 to Count-1 do begin
      ptrRemoveItem:=PopupComponentsList[I];
      if TCreatingComponentStruc(ptrRemoveItem^).IconBitmap <> nil then TCreatingComponentStruc(ptrRemoveItem^).IconBitmap.Free;
      FreeMem(ptrRemoveItem,SizeOf(TCreatingComponentStruc));
      end;
  FreeAndNil(PopupComponentsList);
  //. 
  with TCreatingComponentsFile.Create(ComponentsPanel.ObjFunctionality.Space) do
  try
  GetItemsList(PopupComponentsList);
  finally
  Destroy;
  end;
  end;
for I:=0 to PopupComponentsList.Count-1 do
  try
  newMenuItem:=TMenuItem.Create(Self);
  with newMenuItem,TCreatingComponentStruc(PopupComponentsList[I]^) do begin
  Tag:=Integer(PopupComponentsList[I]);
  with TComponentFunctionality_Create(idType,idObj) do
  try
  if IconBitmap = nil
   then
    ImageIndex:=TypeFunctionality.ImageList_Index
   else begin
    TempBMP:=TBitmap.Create;
    try
    MS:=TMemoryStream.Create;
    try
    IconBitmap.SaveToStream(MS); MS.Position:=0;
    TempBMP.LoadFromStream(MS);
    finally
    MS.Destroy;
    end;
    ImageIndex:=ImageList.Add(TempBMP,nil);
    finally
    TempBMP.Destroy;
    end;
    end
  finally
  Release;
  end;
  Caption:=ObjectName;
  OnMeasureItem:=MeasureItem;
  OnClick:=CreatingComponentsMenuClick;
  end;
  Add(newMenuItem);
  except
    end;
end;
PopupComponentsList_flUpdateNeeded:=false;
//.
if ComponentsPanel.flUseGrid
 then ShowHideGridItemMenu.Caption:='Hide [FORM] grid'
 else ShowHideGridItemMenu.Caption:='Show [FORM] grid';
end;

procedure TpopupComponentsPanel.Clear;
begin
with CreatingComponentsMenuItem do begin
Clear;
end;
end;

procedure TpopupComponentsPanel.Popup(Sender: TObject);
const
  MenuOffset = 2;
var
  ScreenHeight: integer;
  I,H: integer;
begin
Update;
ScreenHeight:=Screen.Height;
H:=MenuOffset;
for I:=0 to CreatingComponentsMenuItem.Count-1 do begin
  if (H+(Images.Height+2{Items[I].Height})) > ScreenHeight
   then begin
    H:=MenuOffset;
    CreatingComponentsMenuItem.Items[I].Break:=mbBarBreak;
    end
   else
    H:=H+(Images.Height+2{Items[I].Height});
  end;
end;

procedure TpopupComponentsPanel.CreatingComponentsMenuClick(Sender: TObject);
var
  idTComponent,idComponent: integer;
  EO: Exception;
  _Reflector: TAbstractReflector;
begin
with (Sender as TMenuItem),TCreatingComponentStruc(Pointer(Tag)^) do begin
idTComponent:=idType;
idComponent:=idObj;
end;
try
with ComponentsPanel.ObjFunctionality do begin
if ComponentsPanel.ObjFunctionality is TBase2DVisualizationFunctionality
 then _Reflector:=TBase2DVisualizationFunctionality(ComponentsPanel.ObjFunctionality).Reflector
 else _Reflector:=nil;
CreateComponent(Space,_Reflector, idTComponent,idComponent{компонент который мы хотим создать}, idTObj,idObj{его собственник}, ComponentsPanel{панель компонент собственника, в которую будет вставлена панель создаваемого компонента});
end
except
  On E: Exception do begin
    if E is EComponentNotExist
     then with TCreatingComponentsFile.Create(ComponentsPanel.ObjFunctionality.Space) do begin
      RemoveItem(idTComponent,idComponent);
      E.Message:='can not create: component is no longer exist.'#$0D#$0A'removed from the list.';
      Destroy;
      end;
    EO:=Exception.Create(E.Message);
    Raise EO;
    end;
  end;
end;

procedure TpopupComponentsPanel.CreatingComponentsRepositoryClick(Sender: TObject);
begin
with TfmCreatingComponents.Create(ComponentsPanel.ObjFunctionality.Space) do Show;
end;

procedure TpopupComponentsPanel.MeasureItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
begin
if (Sender as TMenuItem).Parent = CreatingComponentsMenuItem
 then begin
  ACanvas.Font.Size:=16;
  Height:=Images.Height+2;
  end
 else begin
  ACanvas.Font.Size:=12;
  Height:=16;
  end;
end;



{TfmCreatingComponentss}
Constructor TfmCreatingComponents.Create(pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
ImageList:=TImageList.Create(nil);
with ImageList do begin
Width:=32;
Height:=32;
end;
ListObjects.SmallImages:=ImageList;
Update;
Updater:=TypesSystem.TPresentUpdater_Create(Update);
end;

Destructor TfmCreatingComponents.Destroy;
begin
Updater.Free;
if flChanged then Save;
Clear;
ImageList.Free;
Inherited;
end;

procedure TfmCreatingComponents.Clear;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with ListObjects do begin
Items.BeginUpdate;
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Items[I].Data;
  if TCreatingComponentStruc(ptrRemoveItem^).IconBitmap <> nil then TCreatingComponentStruc(ptrRemoveItem^).IconBitmap.Free;
  FreeMem(ptrRemoveItem,SizeOf(TCreatingComponentStruc));
  end;
Items.Clear;
Items.EndUpdate;
end
end;

procedure TfmCreatingComponents.Update;
var
  ItemsList: TList;
  I: integer;
  MS: TMemoryStream;
  TempBMP: TBitmap;
begin
if flChanged then Save;
Clear;
ImageList.Clear;
ImageList.AddImages(TypesImageList);
with ListObjects do begin
Items.BeginUpdate;
try
with TCreatingComponentsFile.Create(Space) do
try
GetItemsList(ItemsList);
finally
Destroy;
end;
try
for I:=0 to ItemsList.Count-1 do with Items.Add,TCreatingComponentStruc(ItemsList[I]^) do
  try
  Data:=ItemsList[I];
  Caption:=ObjectName;
  with TTypeFunctionality_Create(idType) do
  try
  if IconBitmap = nil
   then
    ImageIndex:=ImageList_Index
   else begin
    TempBMP:=TBitmap.Create;
    try
    MS:=TMemoryStream.Create;
    try
    IconBitmap.SaveToStream(MS); MS.Position:=0;
    TempBMP.LoadFromStream(MS);
    finally
    MS.Destroy;
    end;
    ImageIndex:=ImageList.Add(TempBMP,nil);
    finally
    TempBMP.Destroy;
    end;
    end;
  finally
  Release;
  end;
  except
    end;
finally
ItemsList.Destroy;
end;
finally
Items.EndUpdate;
end;
end;
flChanged:=false;
end;

procedure TfmCreatingComponents.Update(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
case Operation of
opDestroy: PostMessage(Handle, WM_REMOVEITEM,WPARAM(idTObj),LPARAM(idObj));
end;
end;

procedure TfmCreatingComponents.wmRemoveItem(var Message: TMessage); 
var
  I: integer;
begin
with ListObjects do begin
I:=0;
while (I < Items.Count) do
  if (TCreatingComponentStruc(Items[I].Data^).idType = Integer(Message.WParam)) AND (TCreatingComponentStruc(Items[I].Data^).idObj = Integer(Message.LParam))
   then RemoveItem(Items[I])
   else Inc(I);
end;
end;

procedure TfmCreatingComponents.AlphaSort;
begin
ListObjects.AlphaSort;
flChanged:=true;
PopupComponentsList_flUpdateNeeded:=true;
end;

procedure TfmCreatingComponents.InsertNewAndEdit(const pidType,pidObj: integer);
var
  ptrNewItem: pointer;
  Functionality: TComponentFunctionality;
  TypeFunctionality__ImageList_Index: integer;
  MS: TMemoryStream;
  TempBMP: TBitmap;
begin
//. check for component
with TComponentFunctionality_Create(pidType,pidObj) do
try
Check;
finally
Release;
end;
//.
Update;
GetMem(ptrNewItem,SizeOf(TCreatingComponentStruc));
with TCreatingComponentStruc(ptrNewItem^) do begin
idType:=pidType;
idObj:=pidObj;
Functionality:=TComponentFunctionality_Create(idType,idObj);
with Functionality do
try
ObjectName:=Name;
if ObjectName = '' then TypeFunctionality.Name;
if NOT GetIconImage(IconBitmap) then IconBitmap:=nil;
TypeFunctionality__ImageList_Index:=TypeFunctionality.ImageList_Index;
finally
Release;
end;
end;
with ListObjects.Items.Add do begin
Caption:=TCreatingComponentStruc(ptrNewItem^).ObjectName;
Data:=ptrNewItem;
if TCreatingComponentStruc(ptrNewItem^).IconBitmap = nil
 then
  ImageIndex:=TypeFunctionality__ImageList_Index
 else begin
  TempBMP:=TBitmap.Create;
  try
  MS:=TMemoryStream.Create;
  try
  TCreatingComponentStruc(ptrNewItem^).IconBitmap.SaveToStream(MS); MS.Position:=0;
  TempBMP.LoadFromStream(MS);
  finally
  MS.Destroy;
  end;
  ImageIndex:=ImageList.Add(TempBMP,nil);
  finally
  TempBMP.Destroy;
  end;
  end;
flChanged:=true;
EditCaption;
end;
PopupComponentsList_flUpdateNeeded:=true;
end;

procedure TfmCreatingComponents.InsertNewFromClipboardAndEdit;
begin
with TypesSystem do begin
if NOT ClipBoard_flExist then Exit; //. ->
InsertNewAndEdit(Clipboard_Instance_idTObj,Clipboard_Instance_idObj);
end;
end;

procedure TfmCreatingComponents.RemoveItem(Item: TListItem);
var
  ptrRemoveItem: pointer;
begin
if Item = nil then Exit; //. ->
ptrRemoveItem:=Item.Data;
Item.Delete;
if TCreatingComponentStruc(ptrRemoveItem^).IconBitmap <> nil then TCreatingComponentStruc(ptrRemoveItem^).IconBitmap.Free;
FreeMem(ptrRemoveItem,SizeOf(TCreatingComponentStruc));
flChanged:=true;
PopupComponentsList_flUpdateNeeded:=true;
end;

procedure TfmCreatingComponents.RemoveSelected;
begin
if (ListObjects.Selected <> nil) then RemoveItem(ListObjects.Selected);
end;

procedure TfmCreatingComponents.ExchangeItems(SrsIndex,DistIndex: integer);
var
  P: pointer;
  S: string;
  II: integer;
  I: integer;
begin
with ListObjects do begin
if NOT (((0 <= SrsIndex) AND (SrsIndex < Items.Count))
        AND
        ((0 <= DistIndex) AND (DistIndex < Items.Count))
        AND
        (SrsIndex <> DistIndex)
       )
 then Exit;
Items.BeginUpdate;
P:=Items[SrsIndex].Data;
S:=Items[SrsIndex].Caption;
II:=Items[SrsIndex].ImageIndex;
I:=SrsIndex;
if DistIndex < SrsIndex
 then begin
  while I > DistIndex do begin
    Items[I].Data:=Items[I-1].Data;
    Items[I].Caption:=Items[I-1].Caption;
    Items[I].ImageIndex:=Items[I-1].ImageIndex;
    Dec(I);
    end;
  end
 else begin
  while I < DistIndex do begin
    Items[I].Data:=Items[I+1].Data;
    Items[I].Caption:=Items[I+1].Caption;
    Items[I].ImageIndex:=Items[I+1].ImageIndex;
    Inc(I);
    end;
  end;
Items[DistIndex].Data:=P;
Items[DistIndex].Caption:=S;
Items[DistIndex].ImageIndex:=II;
Items.EndUpdate;
end;
flChanged:=true;
PopupComponentsList_flUpdateNeeded:=true;
end;

procedure TfmCreatingComponents.Save;
begin
with TCreatingComponentsFile.Create(Space) do begin
Save(ListObjects.Items);
Destroy;
end;
flChanged:=false;
end;

function TfmCreatingComponents.Select(var vidType,vidObj: integer): boolean;
begin
flSelected:=false;
Update;
ShowModal;
Result:=false;
if flSelected AND NOT (ListObjects.Selected = nil)
 then with TCreatingComponentStruc(ListObjects.Selected.Data^) do begin
  vidType:=idType;
  vidObj:=idObj;
  Result:=true;
  end;
end;

procedure TfmCreatingComponents.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TfmCreatingComponents.ListObjectsDblClick(Sender: TObject);
var
  EO: Exception;
begin
if ListObjects.Selected = nil then Exit; //. ->
with TCreatingComponentStruc(ListObjects.Selected.Data^) do
with TComponentFunctionality_Create(idType,idObj) do begin
try
try
Check;
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end
except
  On E: Exception do begin
    if E is EComponentNotExist
     then begin
      RemoveItem(ListObjects.Selected);
      E.Message:='can not create: component is no longer exist.'#$0D#$0A'removed from list.';
      end;
    EO:=Exception.Create(E.Message);
    Raise EO;
    end;
  end;
end;
end;

procedure TfmCreatingComponents.ListObjectsEdited(Sender: TObject;
  Item: TListItem; var S: String);
begin
if Item.Caption <> S
 then begin
  flChanged:=true;
  PopupComponentsList_flUpdateNeeded:=true;
  end;
end;

procedure TfmCreatingComponents.ListObjectsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
if Sender = Source then Accept:=true;
end;

procedure TfmCreatingComponents.ListObjectsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  Item: TListItem;
begin
if Sender = Source
 then with (Sender as TListView) do begin
  Item:=GetItemAt(X,Y);
  if Item = nil then Exit;
  ExchangeItems(Selected.Index,Item.Index);
  ItemFocused:=Item;
  Selected:=Item;
  end;
end;

procedure TfmCreatingComponents.N1Click(Sender: TObject);
begin
InsertNewFromClipboardAndEdit;
end;

procedure TfmCreatingComponents.N2Click(Sender: TObject);
begin
if MessageDlg('Are you realy want destroy this object ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes then RemoveSelected;
end;

procedure TfmCreatingComponents.N3Click(Sender: TObject);
begin
if MessageDlg('Do alfa sort now ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes then AlphaSort;
end;

procedure TfmCreatingComponents.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;


Initialization

Finalization
PopupComponentsList.Free;

end.
