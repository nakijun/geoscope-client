unit unitSelectedObjects;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Menus,
  {$IFNDEF EmbeddedServer}
  FunctionalitySOAPInterface,
  {$ELSE}
  SpaceInterfacesImport,
  {$ENDIF}
  ComCtrls, RXCtrls, StdCtrls, Buttons, GlobalSpaceDefines, unitProxySpace, Functionality,
  {$IFDEF ExternalTypes}
  SpaceTypes,
  {$ENDIF}
  unitReflector, ExtCtrls;

const
  fnSelectedObjects = REFLECTORProfile+'\'+'SelectedObjects';
  SelectedObjects_Limit = 30;
type
  TSelectedObjectStruc = packed record
    idType: integer;
    idObj: integer;
    ObjectName: shortstring;
    ptrObj: TPtr;
  end;

type
  TpopupSelectedObjects = class(TPopupMenu)
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

  TfmSelectedObjects = class(TForm)
    ListObjects: TListView;
    sbRemove: TRxSpeedButton;
    Bevel1: TBevel;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ListObjectsDblClick(Sender: TObject);
    procedure sbRemoveClick(Sender: TObject);
    procedure ListObjectsEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure ListObjectsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListObjectsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
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
    procedure InsertNew(const pidType,pidObj: integer; const pObjectName: shortstring; const pPtrObj: TPtr);
    procedure RemoveObject(const ptrRemoveObj: TPtr);
    procedure RemoveSelected;
    procedure ExchangeItems(SrsIndex,DistIndex: integer);
    procedure Save;
    procedure DoExecutting;
  end;

implementation

{$R *.DFM}

{TpopupSelectedObjects}
Constructor TpopupSelectedObjects.Create(pReflector: TAbstractReflector);
begin
Reflector:=pReflector;
Inherited Create(Reflector);
OnPopup:=Popup;
AutoHotKeys:=maManual;
end;

Destructor TpopupSelectedObjects.Destroy;
begin
Clear;
Inherited;
end;

procedure TpopupSelectedObjects.Update;
var
  I: integer;
  ptrSrsItem: pointer;
  ptrNewItem: pointer;
  newMenuItem: TMenuItem;
begin
Clear;
with TfmSelectedObjects(Reflector.fmSelectedObjects).ListObjects do begin
for I:=0 to Items.Count-1 do begin
  GetMem(ptrNewItem,SizeOf(TSelectedObjectStruc));
  ptrSrsItem:=Items[I].Data;
  TSelectedObjectStruc(ptrNewItem^):=TSelectedObjectStruc(ptrSrsItem^);
  newMenuItem:=TMenuItem.Create(Self);
  with newMenuItem,TSelectedObjectStruc(ptrNewItem^) do begin
  Tag:=Integer(ptrNewItem);
  Caption:=ObjectName;
  OnClick:=ItemClick;
  end;
  Self.Items.Add(newMenuItem);
  end;
end;
end;

procedure TpopupSelectedObjects.Clear;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Pointer(Items[I].Tag);
  FreeMem(ptrRemoveItem,SizeOf(TSelectedObjectStruc));
  end;
Items.Clear;
end;

procedure TpopupSelectedObjects.Popup(Sender: TObject);
begin
Update;
end;

procedure TpopupSelectedObjects.ItemClick(Sender: TObject);
var
  Functionality: TComponentFunctionality;
begin
with (Sender as TMenuItem),TSelectedObjectStruc(Pointer(Tag)^),Reflector do begin
if Reflector is TReflector
 then with TReflector(Reflector) do begin
  Reflecting.RevisionReflect(ptrSelectedObj,actRefresh);
  //. переопределяем указатель на объект, поскольку пространство могло быть выгружено и реальный указатель изменился
  ptrObj:=Space.TObj_Ptr(idType,idObj);
  //.
  ptrSelectedObj:=ptrObj;
  Reflecting.RevisionReflect(ptrSelectedObj,actRefresh);
  end
 else
  /// + do for 3DReflector
end;
end;


{TfmSelectedObjects}
Constructor TfmSelectedObjects.Create(pReflector: TAbstractReflector);
begin
Inherited Create(nil);
Reflector:=pReflector;
Update;
end;

Destructor TfmSelectedObjects.Destroy;
begin
if flChanged then Save;
Clear;
Inherited;
end;

procedure TfmSelectedObjects.Clear;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with ListObjects do begin
Items.BeginUpdate;
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Items[I].Data;
  FreeMem(ptrRemoveItem,SizeOf(TSelectedObjectStruc));
  end;
Items.Clear;
Items.EndUpdate;
end
end;

procedure TfmSelectedObjects.Update;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  SelectedObjectStruc: TSelectedObjectStruc;
  ptrNewItem: pointer;
begin
with ListObjects do begin
Clear;
if (NOT Reflector.Space.flOffline)
 then 
  {$IFNDEF EmbeddedServer}
  if (GetISpaceUserReflector(Reflector.Space.SOAPServerURL).Get_SelectedObjects(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,{out} BA))
  {$ELSE}
  if (SpaceUserReflector_Get_SelectedObjects(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,{out} BA))
  {$ENDIF}
   then begin
    MemoryStream:=TMemoryStream.Create;
    try
    ByteArray_PrepareStream(BA,TStream(MemoryStream));
    Items.BeginUpdate;
    try
    while MemoryStream.Read(SelectedObjectStruc,SizeOf(TSelectedObjectStruc)) = SizeOf(TSelectedObjectStruc) do begin
      GetMem(ptrNewItem,SizeOf(TSelectedObjectStruc));
      TSelectedObjectStruc(ptrNewItem^):=SelectedObjectStruc;
      with Items.Add,TSelectedObjectStruc(ptrNewItem^) do begin
      Data:=ptrNewItem;
      Caption:=ObjectName;
      ptrObj:=nilPtr;
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

procedure TfmSelectedObjects.InsertNew(const pidType,pidObj: integer; const pObjectName: shortstring; const pPtrObj: TPtr);
var
  ptrNewItem: pointer;
  I: integer;
begin
GetMem(ptrNewItem,SizeOf(TSelectedObjectStruc));
with TSelectedObjectstruc(ptrNewItem^) do begin
idType:=pidType;
idObj:=pidObj;
ObjectName:=pObjectName;
ptrObj:=pPtrObj;
end;
with ListObjects do begin //. удаление такого-же объекта, если он есть
for I:=0 to Items.Count-1 do with TSelectedObjectStruc(Items[I].Data^) do
  if ptrObj = pPtrObj
   then begin
    Items.Delete(I);
    Break;
    end;
end;
with ListObjects.Items.Insert(0) do begin
Caption:=TSelectedObjectStruc(ptrNewItem^).ObjectName;
Data:=ptrNewItem;
end;
Save;
end;

procedure TfmSelectedObjects.RemoveObject(const ptrRemoveObj: TPtr);
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with ListObjects do begin
for I:=0 to Items.Count-1 do
  if TSelectedObjectStruc(Items[I].Data^).ptrObj = ptrRemoveObj
   then begin
    ptrRemoveItem:=Items[I].Data;
    FreeMem(ptrRemoveItem,SizeOf(TSelectedObjectStruc));
    Items.Delete(I);
    Save;
    Exit;
    end;
end;
end;

procedure TfmSelectedObjects.RemoveSelected;
var
  ptrRemoveItem: pointer;
begin
with ListObjects do begin
if Selected = nil then Exit;
ptrRemoveItem:=Selected.Data;
FreeMem(ptrRemoveItem,SizeOf(TSelectedObjectStruc));
Selected.Delete;
flChanged:=true;
end;
end;

procedure TfmSelectedObjects.ExchangeItems(SrsIndex,DistIndex: integer);
var
  P: pointer;
  S: string;
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

procedure TfmSelectedObjects.Save;
var
  MemoryStream: TMemoryStream;
  BA: TByteArray;
  cntObjectsDone: integer;
  I: integer;
begin
//. write user defined config
MemoryStream:=TMemoryStream.Create;
try
cntObjectsDone:=0;
with ListObjects do for I:=0 to Items.Count-1 do with TSelectedObjectStruc(Items[I].Data^) do begin
  if cntObjectsDone >= SelectedObjects_Limit then Break;
  if ((idType <> 0) AND (idObj <> 0))
   then begin
    if Items[I].Caption <> '' then ObjectName:=Items[I].Caption;
    MemoryStream.Write(TSelectedObjectStruc(Items[I].Data^),SizeOf(TSelectedObjectStruc));
    inc(cntObjectsDone);
    end;
  end;
if (NOT Reflector.Space.flOffline)
 then begin
  ByteArray_PrepareFromStream(BA,TStream(MemoryStream));
  {$IFNDEF EmbeddedServer}
  GetISpaceUserReflector(Reflector.Space.SOAPServerURL).Set_SelectedObjects(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA);
  {$ELSE}
  SpaceUserReflector_Set_SelectedObjects(Reflector.Space.UserName,Reflector.Space.UserPassword,Reflector.id,BA);
  {$ENDIF}
  end;
finally
MemoryStream.Destroy;
end;
flChanged:=false;
end;

procedure TfmSelectedObjects.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TfmSelectedObjects.ListObjectsDblClick(Sender: TObject);
begin
if (ListObjects.Selected <> nil)
 then with TSelectedObjectStruc(ListObjects.Selected.Data^),Reflector do begin
  if Reflector is TReflector
   then with TReflector(Reflector) do begin
    Reflecting.RevisionReflect(ptrSelectedObj,actRefresh);
    //. переопределяем указатель на объект, поскольку пространство могло быть выгружено и реальный указатель изменился
    ptrObj:=Space.TObj_Ptr(idType,idObj);
    //.
    ptrSelectedObj:=ptrObj;
    Reflecting.RevisionReflect(ptrSelectedObj,actRefresh);
    end
   else
    /// + do for 3DReflector
  end;
Close;
end;

procedure TfmSelectedObjects.sbRemoveClick(Sender: TObject);
begin
RemoveSelected;
end;

procedure TfmSelectedObjects.ListObjectsEdited(Sender: TObject;
  Item: TListItem; var S: String);
begin
if Item.Caption <> S then flChanged:=true;
end;

procedure TfmSelectedObjects.ListObjectsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
if Sender = Source then Accept:=true;
end;

procedure TfmSelectedObjects.ListObjectsDragDrop(Sender, Source: TObject; X,
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

procedure TfmSelectedObjects.DoExecutting;
begin
ShowModal;
if flChanged
 then Save;
end;

end.
