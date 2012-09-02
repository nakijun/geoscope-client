unit unitElectedObjects;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ComCtrls, RXCtrls, StdCtrls, Buttons, unitProxySpace, Functionality, GlobalSpaceDefines,
  FunctionalitySOAPInterface,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ELSE}
  TypesFunctionality,
  {$ENDIF}
  unitReflector, ExtCtrls;

const
  fnElectedObjects = REFLECTORProfile+'\'+'ElectedObjects';
type
  TElectedObjectStoredStruc = packed record
    idType: integer;
    idObj: integer;
    ObjectName: shortstring;
  end;

  TElectedObjectStruc = packed record
    idType: integer;
    idObj: integer;
    ObjectName: shortstring;
    IconBitmap: TBitmap;
  end;

type
  TpopupElectedObjects = class(TPopupMenu)
  private
    Reflector: TAbstractReflector;
    ImageList: TImageList;
  public
    Constructor Create(pReflector: TAbstractReflector);
    Destructor Destroy; override;
    procedure Update;
    procedure Clear;
    procedure Popup(Sender: TObject);
    procedure ItemClick(Sender: TObject);
  end;

  TfmElectedObjects = class(TForm)
    ListObjects: TListView;
    Bevel1: TBevel;
    Panel1: TPanel;
    sbRemove: TRxSpeedButton;
    Popup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ListObjectsDblClick(Sender: TObject);
    procedure sbRemoveClick(Sender: TObject);
    procedure ListObjectsEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure ListObjectsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListObjectsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    Reflector: TAbstractReflector;
    flChanged: boolean;
    flSelected: boolean;
    ImageList: TImageList;
  public
    { Public declarations }
    class procedure AddNewItem(const pReflector: TAbstractReflector; const pidType: integer; const pidObj: integer; const pObjectName: shortstring);
    Constructor Create(pReflector: TAbstractReflector);
    Destructor Destroy; override;
    procedure Clear;
    procedure Update;
    procedure InsertNewAndEdit(const pidType,pidObj: integer);
    procedure InsertNewFromClipboardAndEdit;
    procedure RemoveItem(Item: TListItem);
    procedure RemoveSelected;
    procedure ExchangeItems(SrsIndex,DistIndex: integer);
    procedure Save;
    function Select(var vidType,vidObj: integer): boolean;
  end;

implementation

{$R *.DFM}

{TpopupElectedObjects}
Constructor TpopupElectedObjects.Create(pReflector: TAbstractReflector);
begin
Reflector:=pReflector;
Inherited Create(Reflector);
ImageList:=TImageList.Create(nil);
with ImageList do begin
Width:=32;
Height:=32;
end;
OnPopup:=Popup;
AutoHotKeys:=maManual;
Images:=ImageList;
end;

Destructor TpopupElectedObjects.Destroy;
begin
Clear;
ImageList.Free;
Inherited;
end;

procedure TpopupElectedObjects.Update;
var
  BA: TByteArray;
  MemoryStream: TMemoryStream;
  ElectedObjectStoredStruc: TElectedObjectStruc;
  ptrNewItem: pointer;
  newMenuItem: TMenuItem;
  TempBMP: TBitmap;
  MS: TMemoryStream;
begin
Clear;
ImageList.Clear;
ImageList.AddImages(TypesImageList);
with GetISpaceUserReflector(Reflector.Space.SOAPServerURL) do
if Get_ElectedObjects(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA)
 then begin
  MemoryStream:=TMemoryStream.Create;
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  while MemoryStream.Read(ElectedObjectStoredStruc,SizeOf(TElectedObjectStoredStruc)) = SizeOf(TElectedObjectStoredStruc) do begin
    //. check for object
    try
    with TComponentFunctionality_Create(ElectedObjectStoredStruc.idType,ElectedObjectStoredStruc.idObj) do
    try
    Check;
    finally
    Release;
    end;
    except
      Continue;
      end;
    //.
    GetMem(ptrNewItem,SizeOf(TElectedObjectStruc));
    with TElectedObjectStruc(ptrNewItem^) do begin
    idType:=ElectedObjectStoredStruc.idType;
    idObj:=ElectedObjectStoredStruc.idObj;
    ObjectName:=ElectedObjectStoredStruc.ObjectName;
    with TComponentFunctionality_Create(idType,idObj) do
    try
    if NOT GetIconImage(IconBitmap) then IconBitmap:=nil;
    finally
    Release;
    end;
    end;
    //. adding a new item
    newMenuItem:=TMenuItem.Create(Self);
    with newMenuItem,TElectedObjectStruc(ptrNewItem^) do begin
    Tag:=Integer(ptrNewItem);
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
    OnClick:=ItemClick;
    end;
    Items.Add(newMenuItem);
    end;
  finally
  MemoryStream.Destroy;
  end;
  end;
end;

procedure TpopupElectedObjects.Clear;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Pointer(Items[I].Tag);
  TElectedObjectStruc(ptrRemoveItem^).IconBitmap.Free;
  FreeMem(ptrRemoveItem,SizeOf(TElectedObjectStruc));
  end;
Items.Clear;
end;

procedure TpopupElectedObjects.Popup(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
Update;
finally
Screen.Cursor:=SC;
end;
/// - Reflector.tbElectedObjects.Down:=false;
end;

procedure TpopupElectedObjects.ItemClick(Sender: TObject);

  procedure ShowPropsPanel(F: TComponentFunctionality);
  begin
  with TAbstractSpaceObjPanelProps(F.TPanelProps_Create(false, 0,nil,nilObject)) do begin
  Left:=Reflector.Left+Round((Reflector.Width-Width)/2);
  Top:=Reflector.Top+Reflector.Height-Height-10;
  OnKeyDown:=Reflector.OnKeyDown;
  OnKeyUp:=Reflector.OnKeyUp;
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
    OnKeyDown:=Reflector.OnKeyDown;
    OnKeyUp:=Reflector.OnKeyUp;
    Show;
    Result:=true;
    end
  except
    end;
  end;

var
  CF: TComponentFunctionality;
  EO: Exception;
begin
with (Sender as TMenuItem),TElectedObjectStruc(Pointer(Tag)^) do begin
CF:=TComponentFunctionality_Create(idType,idObj);
with CF do
try
try
Check;
except
  On E: Exception do begin
    if E.ClassName = EComponentNotExist.ClassName
     then E.Message:='No such component.';
    EO:=Exception.Create(E.Message);
    Raise EO; //. =>
    end;
  end;
if (CF.idTObj = idTCoComponent)
 then begin
  if NOT ShowCoComponentPanelProps(CF) then ShowPropsPanel(CF);
  end
 else
  ShowPropsPanel(CF);
finally
Release;
end;
end;
end;


{TfmElectedObjects}
class procedure TfmElectedObjects.AddNewItem(const pReflector: TAbstractReflector; const pidType: integer; const pidObj: integer; const pObjectName: shortstring);
var
  BA: TByteArray;
  MemoryStream: TMemoryStream;
  NewItem: TElectedObjectStoredStruc;
begin
with GetISpaceUserReflector(pReflector.Space.SOAPServerURL) do
if (Get_ElectedObjects(pReflector.Space.UserName,pReflector.Space.UserPassword,pReflector.id,BA))
 then begin
  MemoryStream:=TMemoryStream.Create();
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  MemoryStream.Position:=MemoryStream.Size;
  //.
  with NewItem do begin
  idType:=pidType;
  idObj:=pidObj;
  ObjectName:=pObjectName;
  end;
  MemoryStream.Write(NewItem,SizeOf(NewItem));
  //.
  ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
  Set_ElectedObjects(pReflector.Space.UserName,pReflector.Space.UserPassword,pReflector.id,BA);
  finally
  MemoryStream.Destroy();
  end;
  end;
end;

Constructor TfmElectedObjects.Create(pReflector: TAbstractReflector);
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
end;

Destructor TfmElectedObjects.Destroy;
begin
if flChanged then Save;
Clear;
ImageList.Free;
Inherited;
end;

procedure TfmElectedObjects.Clear;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with ListObjects do begin
Items.BeginUpdate;
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Items[I].Data;
  if TElectedObjectStruc(ptrRemoveItem^).IconBitmap <> nil then TElectedObjectStruc(ptrRemoveItem^).IconBitmap.Free;
  FreeMem(ptrRemoveItem,SizeOf(TElectedObjectStruc));
  end;
Items.Clear;
Items.EndUpdate;
end
end;

procedure TfmElectedObjects.Update;
var
  BA: TByteArray;
  MemoryStream: TMemoryStream;
  ElectedObjectStoredStruc: TElectedObjectStruc;
  ptrNewItem: pointer;
  MS: TMemoryStream;
  TempBMP: TBitmap;
begin
if flChanged then Save;
with ListObjects do begin
Clear;
ImageList.Clear;
ImageList.AddImages(TypesImageList);
with GetISpaceUserReflector(Reflector.Space.SOAPServerURL) do
if Get_ElectedObjects(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA)
 then begin
  MemoryStream:=TMemoryStream.Create;
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  Items.BeginUpdate;
  try
  while MemoryStream.Read(ElectedObjectStoredStruc,SizeOf(TElectedObjectStoredStruc)) = SizeOf(TElectedObjectStoredStruc) do begin
    //. check for object
    try
    with TComponentFunctionality_Create(ElectedObjectStoredStruc.idType,ElectedObjectStoredStruc.idObj) do
    try
    Check;
    finally
    Release;
    end;
    except
      Continue;
      end;
    //.
    GetMem(ptrNewItem,SizeOf(TElectedObjectStruc));
    with TElectedObjectStruc(ptrNewItem^) do begin
    idType:=ElectedObjectStoredStruc.idType;
    idObj:=ElectedObjectStoredStruc.idObj;
    ObjectName:=ElectedObjectStoredStruc.ObjectName;
    with TComponentFunctionality_Create(idType,idObj) do
    try
    if NOT GetIconImage(IconBitmap) then IconBitmap:=nil;
    finally
    Release;
    end;
    end;
    //. adding a item
    try
    with Items.Add,TElectedObjectStruc(ptrNewItem^) do begin
    Data:=ptrNewItem;
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
    end;
    except
      end;
    end;
  finally
  Items.EndUpdate;
  end;
  finally
  MemoryStream.Destroy;
  end;
end;
end;
//. выравниваем форму
{with Reflector do begin
Self.Top:=Top+ClientOrigin.Y+Menu.Top+tbElectedObjects.Top+tbElectedObjects.Height;
Self.Left:=Left+ClientOrigin.X+Menu.Left+tbElectedObjects.Left;
end;}
flChanged:=false;
end;

procedure TfmElectedObjects.InsertNewAndEdit(const pidType,pidObj: integer);
var
  ptrNewItem: pointer;
  Functionality: TComponentFunctionality;
  TypeFunctionality__ImageList_Index: integer;
  TempBMP: TBitmap;
  MS: TMemoryStream;
begin
Update;
GetMem(ptrNewItem,SizeOf(TElectedObjectStruc));
with TElectedObjectstruc(ptrNewItem^) do begin
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
Caption:=TElectedObjectStruc(ptrNewItem^).ObjectName;
Data:=ptrNewItem;
if TElectedObjectStruc(ptrNewItem^).IconBitmap = nil
 then
  ImageIndex:=TypeFunctionality__ImageList_Index
 else begin
  TempBMP:=TBitmap.Create;
  try
  MS:=TMemoryStream.Create;
  try
  TElectedObjectStruc(ptrNewItem^).IconBitmap.SaveToStream(MS); MS.Position:=0;
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
end;

procedure TfmElectedObjects.InsertNewFromClipboardAndEdit;
begin
with TypesSystem do begin
if NOT ClipBoard_flExist then Exit; //. ->
InsertNewAndEdit(Clipboard_Instance_idTObj,Clipboard_Instance_idObj);
end;
end;

procedure TfmElectedObjects.RemoveItem(Item: TListItem);
var
  ptrRemoveItem: pointer;
begin
if Item = nil then Exit; //. ->
ptrRemoveItem:=Item.Data;
Item.Delete;
if TElectedObjectStruc(ptrRemoveItem^).IconBitmap <> nil then TElectedObjectStruc(ptrRemoveItem^).IconBitmap.Free;
FreeMem(ptrRemoveItem,SizeOf(TElectedObjectStruc));
flChanged:=true;
end;

procedure TfmElectedObjects.RemoveSelected;
begin
if ListObjects.Selected <> nil then RemoveItem(ListObjects.Selected);
end;

procedure TfmElectedObjects.ExchangeItems(SrsIndex,DistIndex: integer);
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
end;

procedure TfmElectedObjects.Save;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  I: integer;
  ElectedObjectStoredStruc: TElectedObjectStoredStruc;
begin
//. write user defined config
MemoryStream:=TMemoryStream.Create;
try
with ListObjects do for I:=0 to Items.Count-1 do with Items[I] do begin
  if Caption <> '' then TElectedObjectStruc(Data^).ObjectName:=Caption;
  with ElectedObjectStoredStruc do begin
  idType:=TElectedObjectStruc(Data^).idType;
  idObj:=TElectedObjectStruc(Data^).idObj;
  ObjectName:=TElectedObjectStruc(Data^).ObjectName;
  end;
  MemoryStream.Write(ElectedObjectStoredStruc,SizeOf(ElectedObjectStoredStruc));
  end;
with GetISpaceUserReflector(Reflector.Space.SOAPServerURL) do begin
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
Set_ElectedObjects(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA);
end;
finally
MemoryStream.Destroy;
end;
flChanged:=false;
end;

function TfmElectedObjects.Select(var vidType,vidObj: integer): boolean;
begin
flSelected:=false;
Update;
ShowModal;
Result:=false;
if flSelected AND NOT (ListObjects.Selected = nil)
 then with TElectedObjectStruc(ListObjects.Selected.Data^) do begin
  vidType:=idType;
  vidObj:=idObj;
  Result:=true;
  end;
end;

procedure TfmElectedObjects.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TfmElectedObjects.ListObjectsDblClick(Sender: TObject);

  procedure ShowPropsPanel(F: TComponentFunctionality);
  begin
  with TAbstractSpaceObjPanelProps(F.TPanelProps_Create(false, 0,nil,nilObject)) do begin
  Left:=Reflector.Left+Round((Reflector.Width-Width)/2);
  Top:=Reflector.Top+Reflector.Height-Height-10;
  OnKeyDown:=Reflector.OnKeyDown;
  OnKeyUp:=Reflector.OnKeyUp;
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
    OnKeyDown:=Reflector.OnKeyDown;
    OnKeyUp:=Reflector.OnKeyUp;
    Show;
    Result:=true;
    end
  except
    end;
  end;

var
  CF: TComponentFunctionality;
  EO: Exception;
begin
if ListObjects.Selected = nil then Exit; //. ->
with TElectedObjectStruc(ListObjects.Selected.Data^) do
CF:=TComponentFunctionality_Create(idType,idObj);
with CF do begin
try
try
Check;
if (CF.idTObj = idTCoComponent)
 then begin
  if NOT ShowCoComponentPanelProps(CF) then ShowPropsPanel(CF);
  end
 else
  ShowPropsPanel(CF);
finally
Release;
end
except
  On E: Exception do begin
    if E is EComponentNotExist
     then begin
      RemoveItem(ListObjects.Selected);
      E.Message:='No such component.'#$0D#$0A'removed from the list.';
      end;
    EO:=Exception.Create(E.Message);
    Raise EO;
    end;
  end;
end;
end;

procedure TfmElectedObjects.sbRemoveClick(Sender: TObject);
begin
RemoveSelected;
end;

procedure TfmElectedObjects.ListObjectsEdited(Sender: TObject;
  Item: TListItem; var S: String);
begin
if Item.Caption <> S then flChanged:=true;
end;

procedure TfmElectedObjects.ListObjectsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
if Sender = Source then Accept:=true;
end;

procedure TfmElectedObjects.ListObjectsDragDrop(Sender, Source: TObject; X,
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

procedure TfmElectedObjects.N1Click(Sender: TObject);
begin
InsertNewFromClipboardAndEdit;
end;

procedure TfmElectedObjects.N2Click(Sender: TObject);
begin
RemoveSelected;
end;

procedure TfmElectedObjects.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
