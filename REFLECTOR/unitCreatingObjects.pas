unit unitCreatingObjects;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ComCtrls, RXCtrls, StdCtrls, Buttons, GlobalSpaceDefines, unitProxySpace, FunctionalitySOAPInterface, Functionality, 
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesFunctionality,
  {$ENDIF}
  unitReflector, ExtCtrls,
  RxMenus;

const
  fnCreatingObjects = REFLECTORProfile+'\'+'CreatingObjects';
  WM_REMOVEITEM = WM_USER+1;
  
type
  TCreatingObjectStoredStruc = packed record
    idType: integer;
    idObj: integer;
    ObjectName: shortstring;
  end;

  TCreatingObjectStruc = packed record
    idType: integer;
    idObj: integer;
    ObjectName: shortstring;
    IconBitmap: TBitmap;
  end;

  TCreatingObjectFile = class
  private
    Reflector: TAbstractReflector;
  public
    Constructor Create(pReflector: TAbstractReflector);
    procedure GetItemsList(var List: TList);
    procedure Save(Items: TListItems); overload;
    procedure Save(Items: TList); overload;
    procedure RemoveItem(const pidType,pidObj: integer);
  end;

  TpopupCreateObject = class(TPopupMenu)
  private
    Reflector: TAbstractReflector;
    ImageList: TImageList;
    
    procedure MeasureItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
  public
    Constructor Create(pReflector: TAbstractReflector);
    Destructor Destroy; override;
    procedure Update;
    procedure Clear;
    procedure Popup(Sender: TObject);
    procedure ItemClick(Sender: TObject);
  end;

  TfmCreatingObjects = class(TForm)
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
    Reflector: TAbstractReflector;
    flChanged: boolean;
    flSelected: boolean;
    Updater: TTypesSystemPresentUpdater;
    ImageList: TImageList;

    procedure wmRemoveItem(var Message: TMessage); message WM_REMOVEITEM;
  public
    { Public declarations }
    Constructor Create(pReflector: TAbstractReflector);
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

  function CreateObject(pReflector: TAbstractReflector; const idTPrototype,idPrototype: integer): TComponentFunctionality;

implementation
Uses
  unitCreateObjectInfo;

{$R *.DFM}

var
  PopupObjectsList_ReflectorID: integer = -1;
  PopupObjectsList: TList = nil;
  PopupObjectsList_flUpdateNeeded: boolean = true;


function CreateObject(pReflector: TAbstractReflector; const idTPrototype,idPrototype: integer): TComponentFunctionality;
var
  SC: TCursor;
  PrototypeFunctionality: TComponentFunctionality;
  ptrRoot: TPtr;
  Root: TSpaceObj;
  idTUseObj,idUseObj: integer;
  idClone: integer;
  CloneFunctionality: TComponentFunctionality;
  SecurityComponents: TComponentsList;
  idSecurityComponent: integer;
  ObjectUsed: boolean;
  VisComponents: TComponentsList;

  procedure ShowPropsPanel(F: TComponentFunctionality);
  begin
  with TAbstractSpaceObjPanelProps(F.TPanelProps_Create(false, 0,nil,nilObject)) do begin
  Left:=pReflector.Left+Round((pReflector.Width-Width)/2);
  Top:=pReflector.Top+pReflector.Height-Height-10;
  OnKeyDown:=pReflector.OnKeyDown;
  OnKeyUp:=pReflector.OnKeyUp;
  Show;
  end;
  end;

  function ShowCoComponentPanelProps(CoComponentFunctionality: TComponentFunctionality): boolean;
  var
    CoComponentPanelProps: TForm;
  begin
  Result:=false;
  try
  CoComponentPanelProps:=CoComponentFunctionality.Space.Plugins___CoComponent__TPanelProps_Create(CoComponentFunctionality_idCoType(CoComponentFunctionality.idObj),CoComponentFunctionality.idObj);
  if CoComponentPanelProps <> nil
   then with CoComponentPanelProps do begin
    Left:=Round((Screen.Width-Width)/2);
    Top:=Screen.Height-Height-20;
    OnKeyDown:=pReflector.OnKeyDown;
    OnKeyUp:=pReflector.OnKeyUp;
    Show;
    Result:=true;
    end
  except
    end;
  end;

begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
if pReflector.Space.Status in [pssRemoted,pssRemotedBrief] then pReflector.Space.Log.OperationStarting('object creating ...');
idUseObj:=0;
TypesSystem.Reflector:=pReflector;
try
PrototypeFunctionality:=TComponentFunctionality_Create(idTPrototype,idPrototype);
with PrototypeFunctionality do
try
Check;
with TypesSystem.Reflector do
if ptrSelectedObj <> nilPtr
 then begin
  {/// - for fast ptrRoot:=Space.Obj_RootPtr(ptrSelectedObj);
  Space.ReadObj(Root,SizeOf(Root), ptrRoot);
  with TComponentFunctionality_Create(Root.idTObj,Root.idObj) do
  try
  if NOT GetOwner(idTUseObj,idUseObj)
   then begin
    idTUseObj:=idTObj;
    idUseObj:=idObj;
    end
   else
    idUseObj:=0;
  finally
  Release;
  end;}
  ToClone(idClone) //. клонируем(создаем) объект
  end
 else begin
  ToClone(idClone) //. клонируем(создаем) объект
  end;
CloneFunctionality:=TypeFunctionality.TComponentFunctionality_Create(idClone);
//.
Result:=CloneFunctionality;
//.
with CloneFunctionality do
try
//.
flUserSecurityDisabled:=true;
try
if idUseObj <> 0 then ObjectUsed:=SetComponentsUsingObject(idTUseObj,idUseObj);
finally
flUSerSecurityDisabled:=false;
end;
if NOT FunctionalityIsInheritedFrom(CloneFunctionality,TBase2DVisualizationFunctionality)
 then begin
  QueryComponents(TBase2DVisualizationFunctionality, VisComponents);
  if VisComponents <> nil
   then
    try
    //. выделяем визуальный компонент объекта в рефлекторе
    with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(VisComponents[0]^).idTComponent,TItemComponentsList(VisComponents[0]^).idComponent){берем первый визуальный компонент}) do
    try
    Reflector.SelectObj(Ptr);
    finally
    Release;
    end;
    //. показываем панель его компонент посредине ширины рефлектора внизу
    if pReflector.Space.Status in [pssRemoted,pssRemotedBrief]
     then begin
      pReflector.Space.Log.OperationDone;
      pReflector.Space.Log.OperationStarting('loading ...');
      end;
    if CloneFunctionality.idTObj = idTCoComponent
     then begin
      if NOT ShowCoComponentPanelProps(CloneFunctionality) then ShowPropsPanel(CloneFunctionality);
      end
     else
      ShowPropsPanel(CloneFunctionality);
    finally
    VisComponents.Destroy;
    end
   else begin
    if pReflector.Space.Status in [pssRemoted,pssRemotedBrief]
     then begin
      pReflector.Space.Log.OperationDone;
      pReflector.Space.Log.OperationStarting('loading ...');
      end;
    if CloneFunctionality.idTObj = idTCoComponent
     then begin
      if NOT ShowCoComponentPanelProps(CloneFunctionality) then ShowPropsPanel(CloneFunctionality);
      end
     else
      ShowPropsPanel(CloneFunctionality);
    end;
  end
 else with TBase2DVisualizationFunctionality(CloneFunctionality) do begin //. выделяем клон-визуализацию в рефлекторе
  Reflector.SelectObj(Ptr);
  //. показываем панель его компонент
  if pReflector.Space.Status in [pssRemoted,pssRemotedBrief]
   then begin
    pReflector.Space.Log.OperationDone;
    pReflector.Space.Log.OperationStarting('loading ...');
    end;
  with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
  Left:=Reflector.Left+Round((Reflector.Width-Width)/2);
  Top:=Reflector.Top+Reflector.Height-Height;
  OnKeyDown:=pReflector.OnKeyDown;
  OnKeyUp:=pReflector.OnKeyUp;
  Show;
  end;
  end;
except
  Release;
  Raise; //. =>
  end;
finally
Release;
end;
finally
if pReflector.Space.Status in [pssRemoted,pssRemotedBrief] then pReflector.Space.Log.OperationDone;
Screen.Cursor:=SC;
end;
end;



{TCreatingObjectFile}
Constructor TCreatingObjectFile.Create(pReflector: TAbstractReflector);
begin
Inherited Create;
Reflector:=pReflector;
end;

procedure TCreatingObjectFile.GetItemsList(var List: TList);
var
  F: File of TCreatingObjectStruc;
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  CreatingObjectStoredStruc: TCreatingObjectStoredStruc;
  ptrNewItem: pointer;
begin
List:=TList.Create;
with GetISpaceUserReflector(Reflector.Space.SOAPServerURL) do
if Get_CreatingComponents(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA)
 then begin
  MemoryStream:=TMemoryStream.Create;
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  while MemoryStream.Read(CreatingObjectStoredStruc,SizeOf(CreatingObjectStoredStruc)) = SizeOf(CreatingObjectStoredStruc) do begin
    //. check for object
    try
    with TComponentFunctionality_Create(CreatingObjectStoredStruc.idType,CreatingObjectStoredStruc.idObj) do
    try
    Check;
    finally
    Release;
    end;
    except
      Continue;
      end;
    //.
    GetMem(ptrNewItem,SizeOf(TCreatingObjectStruc));
    with TCreatingObjectStruc(ptrNewItem^) do begin
    idType:=CreatingObjectStoredStruc.idType;
    idObj:=CreatingObjectStoredStruc.idObj;
    ObjectName:=CreatingObjectStoredStruc.ObjectName;
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
  /// -
  {AssignFile(F,fnCreatingObjects);Reset(F);
  try
  while NOT EOF(F) do begin
    GetMem(ptrNewItem,SizeOf(TCreatingObjectStruc));
    Read(F,TCreatingObjectStruc(ptrNewItem^));
    List.Add(ptrNewItem);
    end;
  finally
  CloseFile(F);
  end;}
  end;
end;

procedure TCreatingObjectFile.Save(Items: TListItems);
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  I: integer;
  CreatingObjectStoredStruc: TCreatingObjectStoredStruc;
begin
//. write user defined config
MemoryStream:=TMemoryStream.Create;
try
for I:=0 to Items.Count-1 do with Items[I] do begin
  if Caption <> '' then TCreatingObjectStruc(Data^).ObjectName:=Caption;
  with CreatingObjectStoredStruc do begin
  idType:=TCreatingObjectStruc(Data^).idType;
  idObj:=TCreatingObjectStruc(Data^).idObj;
  ObjectName:=TCreatingObjectStruc(Data^).ObjectName;
  end;
  MemoryStream.Write(CreatingObjectStoredStruc,SizeOf(TCreatingObjectStoredStruc));
  end;
with GetISpaceUserReflector(Reflector.Space.SOAPServerURL) do begin
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
Set_CreatingComponents(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA);
end;
finally
MemoryStream.Destroy;
end;
end;

procedure TCreatingObjectFile.Save(Items: TList);
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  I: integer;
  CreatingObjectStoredStruc: TCreatingObjectStoredStruc;
begin
//. write user defined config
MemoryStream:=TMemoryStream.Create;
try
for I:=0 to Items.Count-1 do begin
  with CreatingObjectStoredStruc do begin
  idType:=TCreatingObjectStruc(Items[I]^).idType;
  idObj:=TCreatingObjectStruc(Items[I]^).idObj;
  ObjectName:=TCreatingObjectStruc(Items[I]^).ObjectName;
  end;
  MemoryStream.Write(CreatingObjectStoredStruc,SizeOf(TCreatingObjectStoredStruc));
  end;
with GetISpaceUserReflector(Reflector.Space.SOAPServerURL) do begin
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
Set_CreatingComponents(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA);
end;
finally
MemoryStream.Destroy;
end;
end;

procedure TCreatingObjectFile.RemoveItem(const pidType,pidObj: integer);
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
while I < ItemsList.Count do with TCreatingObjectStruc(ItemsList[I]^) do
  if (idType = pidType) AND (idObj = pidObj)
   then begin
    ptrRemoveItem:=ItemsList[I];
    ItemsList.Delete(I);
    if TCreatingObjectStruc(ptrRemoveItem^).IconBitmap <> nil then TCreatingObjectStruc(ptrRemoveItem^).IconBitmap.Free; 
    FreeMem(ptrRemoveItem,SizeOf(TCreatingObjectStruc));
    flSave:=true;
    end
   else
    Inc(I);
if flSave then Save(ItemsList);
finally
for I:=0 to ItemsList.Count-1 do begin
  ptrRemoveItem:=ItemsList[I];ItemsList[I]:=nil;
  if TCreatingObjectStruc(ptrRemoveItem^).IconBitmap <> nil then TCreatingObjectStruc(ptrRemoveItem^).IconBitmap.Free; 
  FreeMem(ptrRemoveItem,SizeOf(TCreatingObjectStruc));
  end;
ItemsList.Destroy;
end;
end;



{TpopupCreatingObjects}
Constructor TpopupCreateObject.Create(pReflector: TAbstractReflector);
begin
Inherited Create(nil);
Reflector:=pReflector;
ImageList:=TImageList.Create(nil);
with ImageList do begin
Width:=32;
Height:=32;
end;
OnPopup:=Popup;
AutoHotKeys:=maManual;
Images:=ImageList;
end;

Destructor TpopupCreateObject.Destroy;
begin
Clear;
ImageList.Free;
Inherited;
end;

procedure TpopupCreateObject.Update;
var
  ptrRemoveItem: pointer;
  ItemsList: TList;
  I: integer;
  newMenuItem: TMenuItem;
  MS: TMemoryStream;
  TempBMP: TBitmap;
begin
Clear;
ImageList.Clear;
ImageList.AddImages(TypesImageList);
if (PopupObjectsList_flUpdateNeeded OR (PopupObjectsList_ReflectorID <> Reflector.id))
 then begin
  //. destroy old list
  if PopupObjectsList <> nil
   then with PopupObjectsList do
    for I:=0 to Count-1 do begin
      ptrRemoveItem:=PopupObjectsList[I];
      if TCreatingObjectStruc(ptrRemoveItem^).IconBitmap <> nil then TCreatingObjectStruc(ptrRemoveItem^).IconBitmap.Free;
      FreeMem(ptrRemoveItem,SizeOf(TCreatingObjectStruc));
      end;
  FreeAndNil(PopupObjectsList);
  //.
  with TCreatingObjectFile.Create(Reflector) do
  try
  GetItemsList(PopupObjectsList);
  finally
  Destroy;
  end;
  PopupObjectsList_ReflectorID:=Reflector.id;
  end;
for I:=0 to PopupObjectsList.Count-1 do
  try
  newMenuItem:=TMenuItem.Create(Self);
  with newMenuItem,TCreatingObjectStruc(PopupObjectsList[I]^) do begin
  Tag:=Integer(PopupObjectsList[I]);
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
  OnClick:=ItemClick;
  end;
  Items.Add(newMenuItem);
  except
    end;
PopupObjectsList_flUpdateNeeded:=false;
end;

procedure TpopupCreateObject.Clear;
begin
Items.Clear;
end;

procedure TpopupCreateObject.Popup(Sender: TObject);
const
  MenuOffset = 2;
var
  ScreenHeight: integer;
  I,H: integer;
  SC: TCursor;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
Update;
ScreenHeight:=Screen.Height;
H:=MenuOffset;
for I:=0 to Items.Count-1 do begin
  if (H+(Images.Height+2{Items[I].Height})) > ScreenHeight
   then begin
    H:=MenuOffset;
    Items[I].Break:=mbBarBreak;
    end
   else
    H:=H+(Images.Height+2{Items[I].Height});
  end;
finally
Screen.Cursor:=SC;
end;
end;

procedure TpopupCreateObject.ItemClick(Sender: TObject);
var
  EO: Exception;
  R: boolean;
  ObjFunctionality: TComponentFunctionality;
  VCL: TComponentsList;
  RX,RY: TCrd;
begin
with (Sender as TMenuItem),TCreatingObjectStruc(Pointer((Sender as TMenuItem).Tag)^) do
try
if NOT (Reflector is TReflector) then Raise Exception.Create('Reflector is not a TReflector type'); //. =>
with TReflector(Reflector) do begin
EditingOrCreatingObject.Free;
EditingOrCreatingObject:=nil;
end;
ObjFunctionality:=TComponentFunctionality_Create(idType,idObj);
with ObjFunctionality do
try
if ObjectIsInheritedFrom(ObjFunctionality,TBase2DVisualizationFunctionality)
 then with TBase2DVisualizationFunctionality(ObjFunctionality) do begin
  TReflector(Reflector).EditingOrCreatingObject:=TEditingOrCreatingObject.Create(TReflector(Reflector),true, TCreatingObjectStruc(Pointer((Sender as TMenuItem).Tag)^).idType,TCreatingObjectStruc(Pointer((Sender as TMenuItem).Tag)^).idObj,Ptr);
  TReflector(Reflector).EditingOrCreatingObject.CreateCompletionObject:=GetCreateCompletionObject(TReflector(Reflector).EditingOrCreatingObject.idTPrototype,TReflector(Reflector).EditingOrCreatingObject.idPrototype);
  //. setup new object for editing
  with TReflector(Reflector) do begin
  ReflectionWindow.Lock.Enter;
  try
  ConvertScrExtendCrd2RealCrd(ReflectionWindow.Xmd,ReflectionWindow.Ymd, RX,RY);
  finally
  ReflectionWindow.Lock.Leave;
  end;
  //.
  EditingOrCreatingObject.SetPosition(RX,RY);
  end;
  end
 else begin
  QueryComponents(TBase2DVisualizationFunctionality, VCL);
  if VCL <> nil
   then
    try
    if VCL.Count > 0
     then with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(TItemComponentsList(VCL[0]^).idTComponent,TItemComponentsList(VCL[0]^).idComponent)) do
      try
      TReflector(Reflector).EditingOrCreatingObject:=TEditingOrCreatingObject.Create(TReflector(Reflector),true, TCreatingObjectStruc(Pointer((Sender as TMenuItem).Tag)^).idType,TCreatingObjectStruc(Pointer((Sender as TMenuItem).Tag)^).idObj,Ptr);
      TReflector(Reflector).EditingOrCreatingObject.CreateCompletionObject:=GetCreateCompletionObject(TReflector(Reflector).EditingOrCreatingObject.idTPrototype,TReflector(Reflector).EditingOrCreatingObject.idPrototype);
      //. setup new object for editing
      with TReflector(Reflector) do begin
      ReflectionWindow.Lock.Enter;
      try
      ConvertScrExtendCrd2RealCrd(ReflectionWindow.Xmd,ReflectionWindow.Ymd, RX,RY);
      finally
      ReflectionWindow.Lock.Leave;
      end;
      //.
      EditingOrCreatingObject.SetPosition(RX,RY);
      end;
      //.
      finally
      Release;
      end
     else
    finally
    VCL.Destroy;
    end;
  end
finally
Release;
end
except
  On E: Exception do begin
    if E.ClassName = EComponentNotExist.ClassName
     then with TCreatingObjectFile.Create(Reflector) do begin
      RemoveItem(idType,idObj);
      E.Message:='no such component.'#$0D#$0A'removed from the list.';
      Destroy;
      end;
    EO:=Exception.Create(E.Message);
    Raise EO;
    end;
  end;
end;

procedure TpopupCreateObject.MeasureItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
begin
ACanvas.Font.Size:=16;
Height:=Images.Height+2;
end;



{TfmCreatingObjects}
Constructor TfmCreatingObjects.Create(pReflector: TAbstractReflector);
begin
Inherited Create(nil);
Reflector:=pReflector;
ImageList:=TImageList.Create(nil);
with ImageList do begin
Width:=32;
Height:=32;
end;
ListObjects.SmallImages:=ImageList;
Update;
Updater:=TypesSystem.TPresentUpdater_Create(Update);
end;

Destructor TfmCreatingObjects.Destroy;
begin
Updater.Free;
if flChanged then Save;
Clear;
ImageList.Free;
Inherited;
end;

procedure TfmCreatingObjects.Clear;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with ListObjects do begin
Items.BeginUpdate;
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Items[I].Data;
  if TCreatingObjectStruc(ptrRemoveItem^).IconBitmap <> nil then TCreatingObjectStruc(ptrRemoveItem^).IconBitmap.Free;
  FreeMem(ptrRemoveItem,SizeOf(TCreatingObjectStruc));
  end;
Items.Clear;
Items.EndUpdate;
end
end;

procedure TfmCreatingObjects.Update;
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
with TCreatingObjectFile.Create(Reflector) do begin
GetItemsList(ItemsList);
Destroy;
end;
try
for I:=0 to ItemsList.Count-1 do with Items.Add,TCreatingObjectStruc(ItemsList[I]^) do
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

procedure TfmCreatingObjects.Update(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
case Operation of
opDestroy: PostMessage(Handle, WM_REMOVEITEM,WPARAM(idTObj),LPARAM(idObj));
end;
end;

procedure TfmCreatingObjects.wmRemoveItem(var Message: TMessage); 
var
  I: integer;
begin
with ListObjects do begin
I:=0;
while (I < Items.Count) do
  if (TCreatingObjectStruc(Items[I].Data^).idType = Integer(Message.WParam)) AND (TCreatingObjectStruc(Items[I].Data^).idObj = Integer(Message.LParam))
   then RemoveItem(Items[I])
   else Inc(I);
end;
end;

procedure TfmCreatingObjects.AlphaSort;
begin
ListObjects.AlphaSort;
flChanged:=true;
PopupObjectsList_flUpdateNeeded:=true;
end;

procedure TfmCreatingObjects.InsertNewAndEdit(const pidType,pidObj: integer);
var
  ptrNewItem: pointer;
  Functionality: TComponentFunctionality;
  TypeFunctionality__ImageList_Index: integer;
  MS: TMemoryStream;
  TempBMP: TBitmap;
begin
//. check for object
with TComponentFunctionality_Create(pidType,pidObj) do
try
Check;
finally
Release;
end;
//.
Update;
GetMem(ptrNewItem,SizeOf(TCreatingObjectStruc));
with TCreatingObjectstruc(ptrNewItem^) do begin
idType:=pidType;
idObj:=pidObj;
Functionality:=TComponentFunctionality_Create(idType,idObj);
with Functionality do
try
ObjectName:=Name;
if ObjectName = '' then ObjectName:=TypeFunctionality.Name;
if NOT GetIconImage(IconBitmap) then IconBitmap:=nil;
TypeFunctionality__ImageList_Index:=TypeFunctionality.ImageList_Index;
finally
Release;
end;
end;
with ListObjects.Items.Add do begin
Caption:=TCreatingObjectStruc(ptrNewItem^).ObjectName;
Data:=ptrNewItem;
if TCreatingObjectStruc(ptrNewItem^).IconBitmap = nil
 then
  ImageIndex:=TypeFunctionality__ImageList_Index
 else begin
  TempBMP:=TBitmap.Create;
  try
  MS:=TMemoryStream.Create;
  try
  TCreatingObjectStruc(ptrNewItem^).IconBitmap.SaveToStream(MS); MS.Position:=0;
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
PopupObjectsList_flUpdateNeeded:=true;
end;

procedure TfmCreatingObjects.InsertNewFromClipboardAndEdit;
begin
with TypesSystem do begin
if NOT ClipBoard_flExist then Exit; //. ->
InsertNewAndEdit(Clipboard_Instance_idTObj,Clipboard_Instance_idObj);
end;
end;

procedure TfmCreatingObjects.RemoveItem(Item: TListItem);
var
  ptrRemoveItem: pointer;
begin
if Item = nil then Exit; //. ->
ptrRemoveItem:=Item.Data;
Item.Delete;
if TCreatingObjectStruc(ptrRemoveItem^).IconBitmap <> nil then TCreatingObjectStruc(ptrRemoveItem^).IconBitmap.Free;
FreeMem(ptrRemoveItem,SizeOf(TCreatingObjectStruc));
flChanged:=true;
PopupObjectsList_flUpdateNeeded:=true;
end;

procedure TfmCreatingObjects.RemoveSelected;
begin
if ListObjects.Selected <> nil then RemoveItem(ListObjects.Selected);
end;

procedure TfmCreatingObjects.ExchangeItems(SrsIndex,DistIndex: integer);
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
PopupObjectsList_flUpdateNeeded:=true;
end;

procedure TfmCreatingObjects.Save;
begin
with TCreatingObjectFile.Create(Reflector) do begin
Save(ListObjects.Items);
Destroy;
end;
flChanged:=false;
end;

function TfmCreatingObjects.Select(var vidType,vidObj: integer): boolean;
begin
flSelected:=false;
Update;
ShowModal;
Result:=false;
if flSelected AND NOT (ListObjects.Selected = nil)
 then with TCreatingObjectStruc(ListObjects.Selected.Data^) do begin
  vidType:=idType;
  vidObj:=idObj;
  Result:=true;
  end;
end;

procedure TfmCreatingObjects.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TfmCreatingObjects.ListObjectsDblClick(Sender: TObject);
var
  EO: Exception;
begin
if ListObjects.Selected = nil then Exit; //. ->
with TCreatingObjectStruc(ListObjects.Selected.Data^) do
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
      E.Message:='no such component.'#$0D#$0A'removed from the list.';
      end;
    EO:=Exception.Create(E.Message);
    Raise EO;
    end;
  end;
end;
end;

procedure TfmCreatingObjects.ListObjectsEdited(Sender: TObject;
  Item: TListItem; var S: String);
begin
if Item.Caption <> S
 then begin
  flChanged:=true;
  PopupObjectsList_flUpdateNeeded:=true;
  end;
end;

procedure TfmCreatingObjects.ListObjectsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
if Sender = Source then Accept:=true;
end;

procedure TfmCreatingObjects.ListObjectsDragDrop(Sender, Source: TObject; X,
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

procedure TfmCreatingObjects.N1Click(Sender: TObject);
begin
InsertNewFromClipboardAndEdit;
end;

procedure TfmCreatingObjects.N2Click(Sender: TObject);
begin
if MessageDlg('remove selected item ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes then RemoveSelected;
end;

procedure TfmCreatingObjects.N3Click(Sender: TObject);
begin
if MessageDlg('do alpha-sort the list ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes then AlphaSort;
end;

procedure TfmCreatingObjects.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;


Initialization

Finalization
PopupObjectsList.Free;

end.
