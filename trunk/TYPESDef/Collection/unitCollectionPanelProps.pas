unit unitCollectionPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Functionality,
  ComCtrls, Menus;

Type
  TCollectionPanelProps = class(TSpaceObjPanelProps)
    Panel2: TPanel;
    List: TListView;
    mmName: TMemo;
    ListPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListEdited(Sender: TObject; Item: TListItem; var S: String);
    procedure mmNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure ListClear;
    procedure ListUpdate;
    procedure List_InsertItemFromClipboard;
    procedure List_RemoveSelectedItem;
    procedure List_ExchangeItems(SrsIndex,DistIndex: integer);
    procedure List__Item_ChangeAlias(Item: TListItem; const pAlias: string);
    procedure ListSave;
    procedure CaptionUpdate;
  end;

implementation
Uses
  TypesDefines,TypesFunctionality;

{$R *.DFM}

Constructor TCollectionPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
List.SmallImages:=Types_ImageList;
Update;
end;

destructor TCollectionPanelProps.Destroy;
begin
SaveChanges;
ListClear;
Inherited;
end;

procedure TCollectionPanelProps._Update;
var
  List: TList;
begin
Inherited;
CaptionUpdate;
ListUpdate;
end;

procedure TCollectionPanelProps.CaptionUpdate;
begin
///! здесь ошибка при Update после редактирования панели через Delphi  
mmName.Clear;
mmName.Lines.Add(TCollectionFunctionality(ObjFunctionality).Name);
end;

procedure TCollectionPanelProps.ListClear;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with List.Items do begin
BeginUpdate;
for I:=0 to Count-1 do begin
  ptrRemoveItem:=List.Items[I].Data;
  List.Items[I].Data:=nil;
  FreeMem(ptrRemoveItem,SizeOf(TItemCollectionStruc));
  end;
Clear;
EndUpdate;
end;
end;

procedure TCollectionPanelProps.ListUpdate;
var
  I: integer;
  Lst: TList;
  ptrItem: pointer;
  TypeFunctionality: TTypeFunctionality;
begin
TCollectionFunctionality(ObjFunctionality).GetListItems(Lst);
if Lst = nil then Exit;
ListClear;
with Lst do begin
Self.List.Items.BeginUpdate;
for I:=0 to Count-1 do begin
  ptrItem:=Items[I];
  with Self.List.Items.Add do begin
  Data:=ptrItem;
  with TItemCollectionStruc(ptrItem^) do begin
  Caption:=Alias;
  TypeFunctionality:=TTypeFunctionality_Create(idTItem);
  with TypeFunctionality do begin
  ImageIndex:=ImageList_Index;
  Release;
  end;
  end;
  end;
  end;
Self.List.Items.EndUpdate;
end;
end;

procedure TCollectionPanelProps.ListSave;
var
  Lst: TList;
  I: integer;
begin
Lst:=TList.Create;
with Lst do begin
for I:=0 to Self.List.Items.Count-1 do begin
  TItemCollectionStruc(Self.List.Items[I].Data^).ListOrder:=I;
  Lst.Add(Self.List.Items[I].Data);
  end;
TCollectionFunctionality(ObjFunctionality).SaveListItems(Lst);
Destroy;
end;
end;

procedure TCollectionPanelProps.List_InsertItemFromClipboard;
var
  ptrNewItem: pointer;
  ItemFunctionality: TComponentFunctionality;
  TypeFunctionality: TTypeFunctionality;
begin
if NOT TypesSystem.ClipBoard_flExist then Exit;
GetMem(ptrNewItem,SizeOf(TItemCollectionStruc));
with TItemCollectionStruc(ptrNewItem^) do begin
idTItem:=TypesSystem.Clipboard_Instance_idTObj;
idItem:=TypesSystem.Clipboard_Instance_idObj;
Alias:='';
ItemFunctionality:=TComponentFunctionality_Create(idTItem,idItem);
if ItemFunctionality <> nil
 then with ItemFunctionality do begin
  Alias:=Name;
  Release;
  end;
ListOrder:=List.Items.Count;
Updater.Disable;
try
id:=TCollectionFunctionality(ObjFunctionality).InsertItem(idTItem,idItem, Alias,ListOrder);
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;
with List.Items.Add do begin
Data:=ptrNewItem;
with TItemCollectionStruc(ptrNewItem^) do begin
Caption:=Alias;
TypeFunctionality:=TTypeFunctionality_Create(idTItem);
if TypeFunctionality <> nil
 then with TypeFunctionality do begin
  ImageIndex:=ImageList_Index;
  Release;
  end;
end;
Focused:=true;
Selected:=true;
MakeVisible(false);
end;
end;

procedure TCollectionPanelProps.List_RemoveSelectedItem;
var
  RemoveItem: TListItem;
  ptrRemoveItem: pointer;
begin
if List.Selected = nil then Exit;
RemoveItem:=List.Selected;
ptrRemoveItem:=RemoveItem.Data;
Updater.Disable;
try
with TItemCollectionStruc(ptrRemoveItem^) do TCollectionFunctionality(ObjFunctionality).RemoveItem(id);
except
  Updater.Enabled;
  Raise; //.=>
  end;
FreeMem(ptrRemoveItem,SizeOf(TItemCollectionStruc));
RemoveItem.Delete;
end;

procedure TCollectionPanelProps.List_ExchangeItems(SrsIndex,DistIndex: integer);
var
  P: pointer;
  S: string;
  I,Index: integer;
begin
with List do begin
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
Index:=Items[SrsIndex].ImageIndex;
I:=SrsIndex;
if DistIndex < SrsIndex
 then begin
  while I > DistIndex do begin
    Items[I].Data:=Items[I-1].Data;
    with TItemCollectionStruc(Items[I].Data^) do begin
    ListOrder:=I;
    Updater.Disable;
    try
    TCollectionFunctionality(ObjFunctionality).Item_ChangeListOrder(id, ListOrder);
    except
      Updater.Enabled;
      Raise; //.=>
      end;
    end;
    Items[I].Caption:=Items[I-1].Caption;
    Items[I].ImageIndex:=Items[I-1].ImageIndex;
    Dec(I);
    end;
  end
 else begin
  while I < DistIndex do begin
    Items[I].Data:=Items[I+1].Data;
    with TItemCollectionStruc(Items[I].Data^) do begin
    ListOrder:=I;
    Updater.Disable;
    try
    TCollectionFunctionality(ObjFunctionality).Item_ChangeListOrder(id, ListOrder);
    except
      Updater.Enabled;
      Raise; //.=>
      end;
    end;
    Items[I].Caption:=Items[I+1].Caption;
    Items[I].ImageIndex:=Items[I+1].ImageIndex;
    Inc(I);
    end;
  end;
Items[DistIndex].Data:=P;
with TItemCollectionStruc(Items[DistIndex].Data^) do begin
ListOrder:=DistIndex;
Updater.Disable;
try
TCollectionFunctionality(ObjFunctionality).Item_ChangeListOrder(id, ListOrder);
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;
Items[DistIndex].Caption:=S;
Items[DistIndex].ImageIndex:=Index;
Items.EndUpdate;
end;
end;

procedure TCollectionPanelProps.List__Item_ChangeAlias(Item: TListItem; const pAlias: string);
begin
Updater.Disable;
try
with TItemCollectionStruc(Item.Data^) do TCollectionFunctionality(ObjFunctionality).Item_ChangeAlias(id, pAlias);
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TCollectionPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TCollectionPanelProps.N1Click(Sender: TObject);
begin
List_InsertItemFromClipboard;
end;

procedure TCollectionPanelProps.N2Click(Sender: TObject);
begin
List_RemoveSelectedItem;
end;

procedure TCollectionPanelProps.ListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
if Sender = Source then Accept:=true;
end;

procedure TCollectionPanelProps.ListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  Item: TListItem;
begin
if Sender = Source
 then with (Sender as TListView) do begin
  Item:=GetItemAt(X,Y);
  if Item = nil then Exit;
  List_ExchangeItems(Selected.Index,Item.Index);
  ItemFocused:=Item;
  Selected:=Item;
  end;
end;

procedure TCollectionPanelProps.ListEdited(Sender: TObject;
  Item: TListItem; var S: String);
begin
if Item.Caption <> S then List__Item_ChangeAlias(Item, S);
end;

procedure TCollectionPanelProps.ListDblClick(Sender: TObject);
var
  idTItem,idItem: integer;
  Functionality: TComponentFunctionality;
begin
with (Sender as TListView) do begin
if Selected = nil then Exit;
with TItemCollectionStruc(Selected.Data^) do begin
Functionality:=TComponentFunctionality_Create(idTItem,idItem);
with Functionality do begin
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poDefault;
Position:=poScreenCenter;
Show;
end;
Release;
end;
end;
end;
end;


procedure TCollectionPanelProps.mmNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  I: integer;
  S: string;
begin
if Key = $0D
 then with (Sender as TMemo) do begin
  S:=Lines[0];
  Updater.Disable;
  try
  TCollectionFunctionality(ObjFunctionality).setName(S);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  Lines.Clear;
  Lines.Add(S);
  Key:=0;
  end;
end;

procedure TCollectionPanelProps.Controls_ClearPropData;
begin
mmName.Lines.Clear;
ListClear;
end;

end.
