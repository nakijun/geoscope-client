unit unitCoComponentTypePanelProps;

interface

uses
  GlobalSpaceDefines, UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Functionality,
  ComCtrls, RXCtrls;

const
  WM_DOONMARKEROPERATION = WM_USER+1;
type
  TCoComponentTypePanelProps = class(TSpaceObjPanelProps)
    memoDescription: TMemo;
    edName: TEdit;
    RxLabel1: TRxLabel;
    lvInstances: TListView;
    stUID: TStaticText;
    stDateCreated: TStaticText;
    RxLabel2: TRxLabel;
    Bevel: TBevel;
    bbCreateComponent: TBitBtn;
    Label1: TLabel;
    edFileType: TEdit;
    Label2: TLabel;
    edCoComponentPrototypeID: TEdit;
    bbUpdateInstanceList: TBitBtn;
    procedure memoDescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure bbCreateComponentClick(Sender: TObject);
    procedure lvInstancesDblClick(Sender: TObject);
    procedure edFileTypeKeyPress(Sender: TObject; var Key: Char);
    procedure edCoComponentPrototypeIDKeyPress(Sender: TObject;
      var Key: Char);
    procedure bbUpdateInstanceListClick(Sender: TObject);
  private
    { Private declarations }
    flDescriptionChanged: boolean;
    MarkerTypeSystemPresentUpdater: TTypeSystemPresentUpdater;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure SaveChanges; override;
    procedure SaveDescription;
    procedure lvInstances_Update;
    procedure lvInstances_UpdateItem(Item: TListItem);
    procedure lvInstances_DoOnMarkerOperation(const idMarker: integer; const Operation: TComponentOperation);
    procedure _lvInstances_DoOnMarkerOperation(const idMarker: integer; const Operation: TComponentOperation);
    procedure wmDoOnMarkerOperation(var Message: TMessage); message WM_DOONMARKEROPERATION;
    procedure CreateComponent;
  end;

implementation
Uses
  TypesDefines,TypesFunctionality;

{$R *.DFM}

Constructor TCoComponentTypePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
flDescriptionChanged:=false;
lvInstances.SmallImages:=Types_ImageList;
Update;
MarkerTypeSystemPresentUpdater:=TTypeSystemPresentUpdater.Create(SystemTCoComponentTypeMarker, _lvInstances_DoOnMarkerOperation);
end;

destructor TCoComponentTypePanelProps.Destroy;
begin
MarkerTypeSystemPresentUpdater.Free;
Inherited;
end;

procedure TCoComponentTypePanelProps._Update;
var
  DC: TDateTime;
  SL: TStringList;
begin
Inherited;
with TCoComponentTypeFunctionality(ObjFunctionality) do begin
SL:=TStringList.Create;
try
GetDescription(SL);
memoDescription.Lines.Assign(SL);
finally
SL.Destroy;
end;
flDescriptionChanged:=false;
edName.Text:=Name;
stUID.Caption:='id = '+IntToStr(UID);
DC:=DateCreated;
if DC <> -1
 then with stDateCreated do begin
  Caption:='date created - '+FormatDateTime('DD.MM.YYYY',DateCreated);
  Show;
  end
 else
  stDateCreated.Hide;
edFileType.Text:=FileType;
edCoComponentPrototypeID.Text:=IntToStr(CoComponentPrototypeID);
end;
end;

procedure TCoComponentTypePanelProps.SaveChanges;
begin
if flDescriptionChanged then SaveDescription;
Inherited;
end;

procedure TCoComponentTypePanelProps.SaveDescription;
var
  SL: TStringList;
begin
Updater.Disable;
try
SL:=TStringList.Create;
try
SL.Assign(memoDescription.Lines);
TCoComponentTypeFunctionality(ObjFunctionality).SetDescription(SL);
finally
SL.Destroy;
end;
except
  Updater.Enabled;
  Raise; //.=>
  end;
flDescriptionChanged:=false;
end;

procedure TCoComponentTypePanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TCoComponentTypeFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TCoComponentTypePanelProps.memoDescriptionKeyPress(Sender: TObject; var Key: Char);
begin
flDescriptionChanged:=true;
end;

procedure TCoComponentTypePanelProps.lvInstances_Update;
var
  Markers: TList;
  I: integer;
  NewItem: TListItem;
begin
TCoComponentTypeFunctionality(ObjFunctionality).GetMarkersList(Markers);
try
with lvInstances.Items do begin
Clear;
BeginUpdate;
try
for I:=0 to Markers.Count-1 do begin
  NewItem:=Add;
  NewItem.Data:=Markers[I];
  lvInstances_UpdateItem(NewItem);
  end;
finally
EndUpdate;
end;
end;
finally
Markers.Destroy;
end;
end;

procedure TCoComponentTypePanelProps.lvInstances_UpdateItem(Item: TListItem);
begin
with Item,TCoComponentTypeMarkerFunctionality(TComponentFunctionality_Create(idTCoComponentTypeMarker,Integer(Item.Data))) do
try
ImageIndex:=TypeFunctionality.ImageList_Index;
Caption:=Name;
finally
Release;
end;
end;

procedure TCoComponentTypePanelProps._lvInstances_DoOnMarkerOperation(const idMarker: integer; const Operation: TComponentOperation);
begin
PostMessage(Handle, WM_DOONMARKEROPERATION,WPARAM(idMarker),LPARAM(Operation));
end;

procedure TCoComponentTypePanelProps.wmDoOnMarkerOperation(var Message: TMessage);
begin
lvInstances_DoOnMarkerOperation(Integer(Message.WParam), TComponentOperation(Message.LParam));
end;

procedure TCoComponentTypePanelProps.lvInstances_DoOnMarkerOperation(const idMarker: integer; const Operation: TComponentOperation);
var
  NewItem: TListItem;
  I: integer;

  procedure TryInsert(const idMarker: integer);
  var
    R: boolean;
  begin
  with TCoComponentTypeMarkerFunctionality(TComponentFunctionality_Create(idTCoComponentTypeMarker,idMarker)) do begin
  R:=(idCoComponentType = TCoComponentTypeFunctionality(ObjFunctionality).idObj);
  Release;
  end;
  if NOT R then Exit; //. маркер не того типа ->
  NewItem:=lvInstances.Items.Add;
  NewItem.Data:=Pointer(idMarker);
  lvInstances_UpdateItem(NewItem);
  end;

begin
case Operation of
opCreate: TryInsert(idMarker);
opDestroy: with lvInstances do
  for I:=0 to Items.Count-1 do
    if Integer(Items[I].Data) = idMarker
     then begin
      Items[I].Delete;
      Exit; //. ->
      end;
opUpdate: with lvInstances do begin
  for I:=0 to Items.Count-1 do
    if Integer(Items[I].Data) = idMarker
     then begin
      lvInstances_UpdateItem(Items[I]);
      Exit; //. ->
      end;
  TryInsert(idMarker);
  end;
end;
end;

procedure TCoComponentTypePanelProps.lvInstancesDblClick(Sender: TObject);
var
  idTObject,idObject: integer;
begin
with lvInstances do
if Selected <> nil
 then begin
  with TComponentFunctionality_Create(idTCoComponentTypeMarker,Integer(Selected.Data)) do
  try
  if NOT GetOwner(idTObject,idObject)
   then begin
    idTObject:=idTObj;
    idObject:=idObj;
    end;
  finally
  Release;
  end;
  with TComponentFunctionality_Create(idTObject,idObject) do
  try
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Position:=poDefault;
  Position:=poScreenCenter;
  Show;
  end;
  finally
  Release;
  end;
  end;
end;

procedure TCoComponentTypePanelProps.CreateComponent;
var
  idCoComponent: integer;
  idCoComponentTypeMarker: integer;
  idComponent: integer;
begin
Raise Exception.Create('not supported'); //. =>
{with TTCoComponentFunctionality.Create do begin
idCoComponent:=CreateInstance;
with TTCoComponentTypeMarkerFunctionality.Create do begin
idCoComponentTypeMarker:=CreateInstanceUsingObject(ObjFunctionality.idTObj,ObjFunctionality.idObj);
Release;
end;
with TComponentFunctionality_Create(idCoComponent) do begin
InsertComponent(idTCoComponentTypeMarker,idCoComponentTypeMarker, idComponent);
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poDefault;
Position:=poScreenCenter;
Show;
end;
Release;
end;
Release;
end;}
end;

procedure TCoComponentTypePanelProps.bbCreateComponentClick(Sender: TObject);
begin
CreateComponent;
end;

procedure TCoComponentTypePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TCoComponentTypePanelProps.Controls_ClearPropData;
begin
edName.Text:='';
stUID.Caption:='';
stDateCreated.Caption:='';
edFileType.Text:='';
edCoComponentPrototypeID.Text:='';
memoDescription.Text:='';
lvInstances.Items.Clear;
end;

procedure TCoComponentTypePanelProps.edFileTypeKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TCoComponentTypeFunctionality(ObjFunctionality).FileType:=edFileType.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TCoComponentTypePanelProps.edCoComponentPrototypeIDKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TCoComponentTypeFunctionality(ObjFunctionality).CoComponentPrototypeID:=StrToInt(edCoComponentPrototypeID.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TCoComponentTypePanelProps.bbUpdateInstanceListClick(Sender: TObject);
begin
lvInstances_Update;
end;


end.
