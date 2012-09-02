unit unitGeoSpacePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  ImgList, ComCtrls;

type
  TGeoSpacePanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Label1: TLabel;
    edName: TEdit;
    Label14: TLabel;
    edDatumID: TEdit;
    cbDatumID: TComboBox;
    Label2: TLabel;
    edProjectionID: TEdit;
    cbProjectionID: TComboBox;
    Label3: TLabel;
    edID: TEdit;
    Image1: TImage;
    lvCrdSystemList: TListView;
    lvCrdSystemList_ImageList: TImageList;
    Label4: TLabel;
    Label5: TLabel;
    lvMapFormatMapList: TListView;
    lvMapFormatMapList_ImageList: TImageList;
    btnMapFormatObjectSearch: TBitBtn;
    btnCreateNewMap: TBitBtn;
    btnBatchCreateBySelectedPrototype: TBitBtn;
    procedure edNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDatumIDChange(Sender: TObject);
    procedure cbProjectionIDChange(Sender: TObject);
    procedure lvCrdSystemListDblClick(Sender: TObject);
    procedure lvMapFormatMapListDblClick(Sender: TObject);
    procedure btnMapFormatObjectSearchClick(Sender: TObject);
    procedure btnCreateNewMapClick(Sender: TObject);
    procedure btnBatchCreateBySelectedPrototypeClick(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure lvCrdSystemList_Update;
    procedure lvMapFormatMapList_Update;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
uses
  GeoTransformations,
  unitGeoSpaceMapFormatObjectSearchPanel,
  unitGeoSpaceMapFormatMapBatchCreatePanel;
  
{$R *.DFM}


Constructor TGeoSpacePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
var
  I: integer;
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
//.
cbDatumID.Items.Clear();
for I:=0 to DatumsCount-1 do cbDatumID.Items.Add(Datums[I].DatumName);
cbDatumID.ItemIndex:=23; //. default: WGS-84
//.
if flReadOnly then DisableControls;
Update;
end;

destructor TGeoSpacePanelProps.Destroy;
begin
Inherited;
end;

procedure TGeoSpacePanelProps._Update;
var
  _DatumID,_ProjectionID: integer;
begin
Inherited;
with TGeoSpaceFunctionality(ObjFunctionality) do begin
edName.Text:=Name;
edID.Text:=IntToStr(idObj);
_DatumID:=DatumID;
edDatumID.Text:=IntToStr(_DatumID);
cbDatumID.ItemIndex:=_DatumID;
_ProjectionID:=ProjectionID;
edProjectionID.Text:=IntToStr(_ProjectionID);
cbProjectionID.ItemIndex:=_ProjectionID;
end;
lvCrdSystemList_Update();
lvMapFormatMapList_Update();
end;

procedure TGeoSpacePanelProps.lvCrdSystemList_Update;
var
  IL: TList;
  I: integer;
  idInstance: integer;
begin
lvCrdSystemList.Items.BeginUpdate;
try
lvCrdSystemList.Clear;
with TGeoSpaceFunctionality(ObjFunctionality) do begin
GetGeoCrdSystemList(IL);
try
for I:=0 to IL.Count-1 do begin
  idInstance:=Integer(IL[I]);
  with lvCrdSystemList.Items.Add do begin
  Data:=Pointer(idInstance);
  with TGeoCrdSystemFunctionality(TComponentFunctionality_Create(idTGeoCrdSystem,idInstance)) do
  try
  Caption:=Name;
  ImageIndex:=0;
  SubItems.Add(IntToStr(idObj));
  finally
  Release;
  end;
  end;
  end;
finally
IL.Destroy;
end;
end;
finally
lvCrdSystemList.Items.EndUpdate;
end;
end;

procedure TGeoSpacePanelProps.lvMapFormatMapList_Update;
var
  IL: TList;
  I: integer;
  idInstance: integer;
begin
lvMapFormatMapList.Items.BeginUpdate;
try
lvMapFormatMapList.Clear;
with TGeoSpaceFunctionality(ObjFunctionality) do begin
GetMapFormatMapList(IL);
try
for I:=0 to IL.Count-1 do begin
  idInstance:=Integer(IL[I]);
  with lvMapFormatMapList.Items.Add do begin
  Data:=Pointer(idInstance);
  with TMapFormatMapFunctionality(TComponentFunctionality_Create(idTMapFormatMap,idInstance)) do
  try
  Caption:=Name;
  ImageIndex:=0;
  SubItems.Add(IntToStr(idObj));
  finally
  Release;
  end;
  end;
  end;
finally
IL.Destroy;
end;
end;
finally
lvMapFormatMapList.Items.EndUpdate;
end;
end;

procedure TGeoSpacePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TGeoSpacePanelProps.Controls_ClearPropData;
begin
edName.Text:='';
edID.Text:='';
edDatumID.Text:='';
cbDatumID.ItemIndex:=-1;
edProjectionID.Text:='';
cbProjectionID.ItemIndex:=-1;
end;

procedure TGeoSpacePanelProps.edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: begin
  Updater.Disable;
  try
  TGeoSpaceFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;
end;

procedure TGeoSpacePanelProps.cbDatumIDChange(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
Updater.Disable;
try
TGeoSpaceFunctionality(ObjFunctionality).DatumID:=cbDatumID.ItemIndex;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TGeoSpacePanelProps.cbProjectionIDChange(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
Updater.Disable;
try
TGeoSpaceFunctionality(ObjFunctionality).ProjectionID:=cbProjectionID.ItemIndex;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TGeoSpacePanelProps.lvCrdSystemListDblClick(Sender: TObject);
begin
if (lvCrdSystemList.Selected <> nil)
 then with TComponentFunctionality_Create(idTGeoCrdSystem,Integer(lvCrdSystemList.Selected.Data)) do
  try
  with TPanelProps_Create(false,0,nil,nilObject) do begin
  Position:=poScreenCenter;
  Show;
  end;
  finally
  Release;
  end;
end;

procedure TGeoSpacePanelProps.lvMapFormatMapListDblClick(Sender: TObject);
begin
if (lvMapFormatMapList.Selected <> nil)
 then with TComponentFunctionality_Create(idTMapFormatMap,Integer(lvMapFormatMapList.Selected.Data)) do
  try
  with TPanelProps_Create(false,0,nil,nilObject) do begin
  Position:=poScreenCenter;
  Show;
  end;
  finally
  Release;
  end;
end;

procedure TGeoSpacePanelProps.btnMapFormatObjectSearchClick(Sender: TObject);
begin
with TfmGeoSpaceMapFormatObjectSearchPanel.Create(TGeoSpaceFunctionality(ObjFunctionality)) do Show();
end;

procedure TGeoSpacePanelProps.btnCreateNewMapClick(Sender: TObject);
var
  PrototypeFunctionality: TComponentFunctionality;
  idNewMap: integer;
begin
if (lvMapFormatMapList.Selected = nil) then Raise Exception.Create('no map prototype selected'); //.=>
if (MessageDlg('Do you want to create a new map using selected map as prototype ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes) then Exit; //. ->
PrototypeFunctionality:=TComponentFunctionality_Create(idTMapFormatMap,Integer(lvMapFormatMapList.Selected.Data));
try
PrototypeFunctionality.ToClone({out} idNewMap);
with PrototypeFunctionality.TypeFunctionality.TComponentFunctionality_Create(idNewMap) do
try
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show();
end;
finally
Release;
end;
finally
PrototypeFunctionality.Release;
end;
end;

procedure TGeoSpacePanelProps.btnBatchCreateBySelectedPrototypeClick(Sender: TObject);
var
  idPrototypeMap: integer;
begin
if (lvMapFormatMapList.Selected = nil) then Raise Exception.Create('no map prototype selected'); //.=>
idPrototypeMap:=Integer(lvMapFormatMapList.Selected.Data);
with TfmGeoSpaceMapFormatMapBatchCreatePanel.Create(ObjFunctionality.Space,ObjFunctionality.idObj,idPrototypeMap) do
try
ShowModal();
finally
Destroy;
end;
end;


end.
