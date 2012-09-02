 unit unitElectedPlaces;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  ComCtrls, RXCtrls, StdCtrls, Buttons, GlobalSpaceDefines,FunctionalitySOAPInterface, unitProxySpace, unitReflector, ExtCtrls;

const
  fnElectedPlaces = REFLECTORProfile+'\'+'ElectedPlaces';
type
  TElectedPlaceStruc = packed record
    ReflectionWindow: TReflectionWindowStruc;
    PlaceName: shortstring;
  end;

type
  TpopupElectedPlaces = class(TPopupMenu)
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

  TfmElectedPlaces = class(TForm)
    ListPlaces: TListView;
    Panel1: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    sbRemove: TRxSpeedButton;
    Popup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure ListPlacesDblClick(Sender: TObject);
    procedure sbRemoveClick(Sender: TObject);
    procedure ListPlacesEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure ListPlacesDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListPlacesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    Reflector: TAbstractReflector;
    flChanged: boolean;
    flSelected: boolean;
  public
    { Public declarations }
    Constructor Create(pReflector: TAbstractReflector);
    Destructor Destroy; override;
    procedure Clear;
    procedure Update;
    procedure InsertNewAndEdit;
    procedure RemoveSelected;
    procedure ExchangeItems(SrsIndex,DistIndex: integer);
    procedure Save;
    function Select(var vReflectionWindow: TReflectionWindowStruc): boolean;
  end;

implementation
Uses
  ImgList;

{$R *.DFM}

{TpopupElectedPlaces}
Constructor TpopupElectedPlaces.Create(pReflector: TAbstractReflector);
var
  BMP: TBitmap;
begin
Reflector:=pReflector;
Inherited Create(Reflector);
ImageList:=TImageList.Create(nil);
with ImageList do begin
Width:=32;
Height:=32;
BMP:=TBitmap.Create;
try
BMP.LoadFromFile(Reflector.Space.WorkLocale+'\'+PathLib+'\'+'BMP'+'\'+'Target.bmp');
Masked:=true;
BkColor:=clNone;
Add(BMP,BMP);
finally
BMP.Destroy;
end;
end;
OnPopup:=Popup;
AutoHotKeys:=maManual;
Images:=ImageList;
end;

Destructor TpopupElectedPlaces.Destroy;
begin
Clear;
ImageList.Free;
Inherited;
end;

procedure TpopupElectedPlaces.Update;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  ElectedPlaceStruc: TElectedPlaceStruc;
  ptrNewItem: pointer;
  newMenuItem: TMenuItem;
begin
Clear;
with GetISpaceUserReflector(Reflector.Space.SOAPServerURL) do
if Get_ElectedPlaces(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA)
 then begin
  MemoryStream:=TMemoryStream.Create;
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  while MemoryStream.Read(ElectedPlaceStruc,SizeOf(TElectedPlaceStruc)) = SizeOf(TElectedPlaceStruc) do begin
    GetMem(ptrNewItem,SizeOf(TElectedPlaceStruc));
    TElectedPlaceStruc(ptrNewItem^):=ElectedPlaceStruc;
    newMenuItem:=TMenuItem.Create(Self);
    with newMenuItem,TElectedPlaceStruc(ptrNewItem^) do begin
    Tag:=Integer(ptrNewItem);
    Caption:=PlaceName;
    ImageIndex:=0;
    OnClick:=ItemClick;
    end;
    Items.Add(newMenuItem);
    end;
  finally
  MemoryStream.Destroy;
  end;
  end;
end;

procedure TpopupElectedPlaces.Clear;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Pointer(Items[I].Tag);
  FreeMem(ptrRemoveItem,SizeOf(TElectedPlaceStruc));
  end;
Items.Clear;
end;

procedure TpopupElectedPlaces.Popup(Sender: TObject);
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
/// - Reflector.tbElectedPlaces.Down:=false;
end;

procedure TpopupElectedPlaces.ItemClick(Sender: TObject);
begin
with (Sender as TMenuItem),TElectedPlaceStruc(Pointer(Tag)^) do begin
if Reflector is TReflector
 then TReflector(Reflector).ShiftingSetReflection((ReflectionWindow.X0+ReflectionWindow.X2)/2,(ReflectionWindow.Y0+ReflectionWindow.Y2)/2);
end;
end;


{TfmElectedPlaces}
Constructor TfmElectedPlaces.Create(pReflector: TAbstractReflector);
begin
Inherited Create(nil);
Reflector:=pReflector;
end;

Destructor TfmElectedPlaces.Destroy;
begin
if flChanged then Save;
Clear;
Inherited;
end;

procedure TfmElectedPlaces.Clear;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with ListPlaces do begin
Items.BeginUpdate;
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Items[I].Data;
  FreeMem(ptrRemoveItem,SizeOf(TElectedPlaceStruc));
  end;
Items.Clear;
Items.EndUpdate;
end
end;

procedure TfmElectedPlaces.Update;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  ElectedPlaceStruc: TElectedPlaceStruc;
  ptrNewItem: pointer;
begin
with ListPlaces do begin
Clear;
with GetISpaceUserReflector(Reflector.Space.SOAPServerURL) do
if Get_ElectedPlaces(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA)
 then begin
  MemoryStream:=TMemoryStream.Create;
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  Items.BeginUpdate;
  try
  while MemoryStream.Read(ElectedPlaceStruc,SizeOf(TElectedPlaceStruc)) = SizeOf(TElectedPlaceStruc) do begin
    GetMem(ptrNewItem,SizeOf(TElectedPlaceStruc));
    TElectedPlaceStruc(ptrNewItem^):=ElectedPlaceStruc;
    with Items.Add,TElectedPlaceStruc(ptrNewItem^) do begin
    Data:=ptrNewItem;
    Caption:=PlaceName;
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
Self.Top:=Top+ClientOrigin.Y+Menu.Top+tbElectedPlaces.Top+tbElectedPlaces.Height;
Self.Left:=Left+ClientOrigin.X+Menu.Left+tbElectedPlaces.Left;
end;}

flChanged:=false;
end;

procedure TfmElectedPlaces.InsertNewAndEdit;
var
  ptrNewItem: pointer;
begin
GetMem(ptrNewItem,SizeOf(TElectedPlaceStruc));
with TElectedPlaceStruc(ptrNewItem^) do begin
if Reflector is TReflector
 then TReflector(Reflector).ReflectionWindow.GetWindow(true, ReflectionWindow)
 else ; /// + 
PlaceName:='new place';
end;
with ListPlaces.Items.Add do begin
Caption:=TElectedPlaceStruc(ptrNewItem^).PlaceName;
Data:=ptrNewItem;
flChanged:=true;
EditCaption;
end;
end;

procedure TfmElectedPlaces.RemoveSelected;
var
  ptrRemoveItem: pointer;
begin
with ListPlaces do begin
if Selected = nil then Exit;
ptrRemoveItem:=Selected.Data;
FreeMem(ptrRemoveItem,SizeOf(TElectedPlaceStruc));
Selected.Delete;
flChanged:=true;
end;
end;

procedure TfmElectedPlaces.ExchangeItems(SrsIndex,DistIndex: integer);
var
  P: pointer;
  S: string;
  I: integer;
begin
with ListPlaces do begin
if NOT (((0 <= SrsIndex) AND (SrsIndex < Items.Count))
        AND
        ((0 <= DistIndex) AND (DistIndex < Items.Count))
        AND
        (SrsIndex <> DistIndex)
       )
 then Exit;
Items.BeginUpdate;
S:=Items[SrsIndex].Caption;
P:=Items[SrsIndex].Data;
I:=SrsIndex;
if DistIndex < SrsIndex
 then begin
  while I > DistIndex do begin
    Items[I].Caption:=Items[I-1].Caption;
    Items[I].Data:=Items[I-1].Data;
    Dec(I);
    end;
  end
 else begin
  while I < DistIndex do begin
    Items[I].Caption:=Items[I+1].Caption;
    Items[I].Data:=Items[I+1].Data;
    Inc(I);
    end;
  end;
Items[DistIndex].Caption:=S;
Items[DistIndex].Data:=P;
Items.EndUpdate;
end;
flChanged:=true;
end;

procedure TfmElectedPlaces.Save;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  I: integer;
begin
//. write user defined config
MemoryStream:=TMemoryStream.Create;
try
with ListPlaces do for I:=0 to Items.Count-1 do with Items[I] do begin
  if Caption <> '' then TElectedPlaceStruc(Data^).PlaceName:=Caption;
  MemoryStream.Write(TElectedPlaceStruc(Data^),SizeOf(TElectedPlaceStruc));
  end;
with GetISpaceUserReflector(Reflector.Space.SOAPServerURL) do begin
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
Set_ElectedPlaces(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA);
end;
finally
MemoryStream.Destroy;
end;
flChanged:=false;
end;

function TfmElectedPlaces.Select(var vReflectionWindow: TReflectionWindowStruc): boolean;
begin
flSelected:=false;
Update;
ShowModal;
Result:=false;
if flSelected AND NOT (ListPlaces.Selected = nil)
 then begin
  vReflectionWindow:=TElectedPlaceStruc(ListPlaces.Selected.Data^).ReflectionWindow;
  Result:=true;
  end;
end;

procedure TfmElectedPlaces.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TfmElectedPlaces.RxSpeedButton1Click(Sender: TObject);
begin
InsertNewAndEdit;
end;

procedure TfmElectedPlaces.ListPlacesDblClick(Sender: TObject);
begin
flSelected:=true;
Close;
end;

procedure TfmElectedPlaces.sbRemoveClick(Sender: TObject);
begin
RemoveSelected;
end;

procedure TfmElectedPlaces.ListPlacesEdited(Sender: TObject;
  Item: TListItem; var S: String);
begin
if Item.Caption <> S then flChanged:=true;
end;

procedure TfmElectedPlaces.ListPlacesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
if Sender = Source then Accept:=true;
end;

procedure TfmElectedPlaces.ListPlacesDragDrop(Sender, Source: TObject; X,
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

procedure TfmElectedPlaces.N1Click(Sender: TObject);
begin
InsertNewAndEdit;
end;

procedure TfmElectedPlaces.N2Click(Sender: TObject);
begin
RemoveSelected;
end;

end.
