unit unitElected3DPlaces;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus, 
  {$IFNDEF EmbeddedServer}
  FunctionalitySOAPInterface, 
  {$ELSE}
  SpaceInterfacesImport,
  {$ENDIF}
  ComCtrls, RXCtrls, StdCtrls, Buttons, GlobalSpaceDefines, unitReflector, unit3DReflector, ExtCtrls;

const
  fnElectedPlaces = REFLECTORProfile+'\'+'ElectedPlaces';
type
  TElectedPlaceStruc = packed record
    Translate_X: Extended;
    Translate_Y: Extended;
    Translate_Z: Extended;
    Rotate_AngleX: Extended;
    Rotate_AngleY: Extended;
    Rotate_AngleZ: Extended;
    PlaceName: shortstring;
  end;

type
  TpopupElectedPlaces = class(TPopupMenu)
  private
    Reflector: TAbstractReflector;
  public
    Constructor Create(pReflector: TAbstractReflector);
    Destructor Destroy; override;
    procedure Update;
    procedure Clear;
    procedure Popup(Sender: TObject);
    procedure ItemClick(Sender: TObject);
  end;

  TfmElected3DPlaces = class(TForm)
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
    function Select(out ElectedPlaceStruc: TElectedPlaceStruc): boolean;
  end;

implementation

{$R *.DFM}

{TpopupElectedPlaces}
Constructor TpopupElectedPlaces.Create(pReflector: TAbstractReflector);
begin   
Reflector:=pReflector;
Inherited Create(Reflector);
OnPopup:=Popup;
AutoHotKeys:=maManual;
end;

Destructor TpopupElectedPlaces.Destroy;
begin
Clear;
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
{$IFNDEF EmbeddedServer}
if (GetISpaceUserReflector(Reflector.Space.SOAPServerURL).Get_ElectedPlaces(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,{out} BA))
{$ELSE}
if (SpaceUserReflector_Get_ElectedPlaces(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,{out} BA))
{$ENDIF}
 then begin
  MemoryStream:=TMemoryStream.Create();
  try
  ByteArray_PrepareStream(BA,TStream(MemoryStream));
  while (MemoryStream.Read(ElectedPlaceStruc,SizeOf(TElectedPlaceStruc)) = SizeOf(TElectedPlaceStruc)) do begin
    GetMem(ptrNewItem,SizeOf(TElectedPlaceStruc));
    TElectedPlaceStruc(ptrNewItem^):=ElectedPlaceStruc;
    newMenuItem:=TMenuItem.Create(Self);
    with newMenuItem,TElectedPlaceStruc(ptrNewItem^) do begin
    Tag:=Integer(ptrNewItem);
    Caption:=PlaceName;
    OnClick:=ItemClick;
    end;
    Items.Add(newMenuItem);
    end;
  finally
  MemoryStream.Destroy();
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
begin
Update;
/// - Reflector.tbElectedPlaces.Down:=false;
end;

procedure TpopupElectedPlaces.ItemClick(Sender: TObject);
begin
with (Sender as TMenuItem),TElectedPlaceStruc(Pointer(Tag)^) do
if Reflector is TGL3DReflector then TGL3DReflector(Reflector).Cameras.ActiveCamera.Setup(Translate_X,Translate_Y,Translate_Z,Rotate_AngleX,Rotate_AngleY,Rotate_AngleZ);
end;


{TfmElectedPlaces}
Constructor TfmElected3DPlaces.Create(pReflector: TAbstractReflector);
begin
Inherited Create(nil);
Reflector:=pReflector;
end;

Destructor TfmElected3DPlaces.Destroy;
begin
if flChanged then Save;
Clear;
Inherited;
end;

procedure TfmElected3DPlaces.Clear;
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

procedure TfmElected3DPlaces.Update;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  ElectedPlaceStruc: TElectedPlaceStruc;
  ptrNewItem: pointer;
begin
with ListPlaces do begin
Clear;
{$IFNDEF EmbeddedServer}
if (GetISpaceUserReflector(Reflector.Space.SOAPServerURL).Get_ElectedPlaces(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,{out} BA))
{$ELSE}
if (SpaceUserReflector_Get_ElectedPlaces(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,{out} BA))
{$ENDIF}
 then begin
  MemoryStream:=TMemoryStream.Create();
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
  MemoryStream.Destroy();
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

procedure TfmElected3DPlaces.InsertNewAndEdit;
var
  ptrNewItem: pointer;
begin
GetMem(ptrNewItem,SizeOf(TElectedPlaceStruc));
with TElectedPlaceStruc(ptrNewItem^) do begin
if Reflector is TGL3DReflector
 then with TGL3DReflector(Reflector).Cameras do begin
  Translate_X:=ActiveCamera.Translate_X;
  Translate_Y:=ActiveCamera.Translate_Y;
  Translate_Z:=ActiveCamera.Translate_Z;
  Rotate_AngleX:=ActiveCamera.Rotate_AngleX;
  Rotate_AngleY:=ActiveCamera.Rotate_AngleY;
  Rotate_AngleZ:=ActiveCamera.Rotate_AngleZ;
  end
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

procedure TfmElected3DPlaces.RemoveSelected;
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

procedure TfmElected3DPlaces.ExchangeItems(SrsIndex,DistIndex: integer);
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

procedure TfmElected3DPlaces.Save;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  I: integer;
begin
//. write user defined config
MemoryStream:=TMemoryStream.Create();
try
with ListPlaces do for I:=0 to Items.Count-1 do with Items[I] do begin
  if Caption <> '' then TElectedPlaceStruc(Data^).PlaceName:=Caption;
  MemoryStream.Write(TElectedPlaceStruc(Data^),SizeOf(TElectedPlaceStruc));
  end;
ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
{$IFNDEF EmbeddedServer}
GetISpaceUserReflector(Reflector.Space.SOAPServerURL).Set_ElectedPlaces(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA);
{$ELSE}
SpaceUserReflector_Set_ElectedPlaces(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA);
{$ENDIF}
finally
MemoryStream.Destroy();
end;
flChanged:=false;
end;

function TfmElected3DPlaces.Select(out ElectedPlaceStruc: TElectedPlaceStruc): boolean;
begin
flSelected:=false;
Update;
ShowModal;
Result:=false;
if flSelected AND NOT (ListPlaces.Selected = nil)
 then begin
  ElectedPlaceStruc:=TElectedPlaceStruc(ListPlaces.Selected.Data^);
  Result:=true;
  end;
end;

procedure TfmElected3DPlaces.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TfmElected3DPlaces.RxSpeedButton1Click(Sender: TObject);
begin
InsertNewAndEdit;
end;

procedure TfmElected3DPlaces.ListPlacesDblClick(Sender: TObject);
begin
flSelected:=true;
Close;
end;

procedure TfmElected3DPlaces.sbRemoveClick(Sender: TObject);
begin
RemoveSelected;
end;

procedure TfmElected3DPlaces.ListPlacesEdited(Sender: TObject;
  Item: TListItem; var S: String);
begin
if Item.Caption <> S then flChanged:=true;
end;

procedure TfmElected3DPlaces.ListPlacesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
if Sender = Source then Accept:=true;
end;

procedure TfmElected3DPlaces.ListPlacesDragDrop(Sender, Source: TObject; X,
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

procedure TfmElected3DPlaces.N1Click(Sender: TObject);
begin
InsertNewAndEdit;
end;

procedure TfmElected3DPlaces.N2Click(Sender: TObject);
begin
RemoveSelected;
end;

end.
