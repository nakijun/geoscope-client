unit unitCoComponentTypeMarkerPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines, TypesFunctionality,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Db, SpaceObjInterpretation, Menus;

type
  TCoComponentTypeMarkerPanelProps = class(TSpaceObjPanelProps)
    edName: TEdit;
    popupName: TPopupMenu;
    TypeNameItem: TMenuItem;
    TypeUIDItem: TMenuItem;
    TypeIconImage: TImage;
    ImagePopupMenu: TPopupMenu;
    Showtype1: TMenuItem;
    editname1: TMenuItem;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure TypeNameItemClick(Sender: TObject);
    procedure editname1Click(Sender: TObject);
    procedure TypeUIDItemClick(Sender: TObject);
    procedure Showtype1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;


implementation

{$R *.DFM}
Constructor TCoComponentTypeMarkerPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);

if flReadOnly then DisableControls;
Update;
end;

destructor TCoComponentTypeMarkerPanelProps.Destroy;
begin
Inherited;
end;

procedure TCoComponentTypeMarkerPanelProps._Update;
var
  idType: integer;
  TypeName: string;
  TypeUID: integer;
  Image: TBitmap;
begin
Inherited;
idType:=TCoComponentTypeMarkerFunctionality(ObjFunctionality).idCoComponentType;
with TCoComponentTypeFunctionality(TComponentFunctionality_Create(idTCoComponentType,idType)) do
try
TypeName:=Name;
TypeUID:=UID;
finally
Release;
end;
TypeNameItem.Caption:='Type: '+TypeName;
TypeUIDItem.Caption:='UID: '+IntToStr(TypeUID);
edName.Text:=ObjFunctionality.Name;
if TCoComponentTypeMarkerFunctionality(ObjFunctionality).GetTypeIconImage(Image)
 then
  try
  TypeIconImage.Picture.Bitmap.Assign(Image);
  finally
  Image.Destroy;
  end
 else with TypeIconImage.Picture.Bitmap,TypeIconImage.Picture.Bitmap.Canvas do begin
  Width:=32;
  Height:=32;
  Pen.Color:=clBlack;
  Brush.Color:=clWhite;
  Rectangle(0,0,Width,Height);
  end;
end;

procedure TCoComponentTypeMarkerPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TCoComponentTypeMarkerFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TCoComponentTypeMarkerPanelProps.TypeNameItemClick(Sender: TObject);
var
  idType: integer;
begin
idType:=TCoComponentTypeMarkerFunctionality(ObjFunctionality).idCoComponentType;
with TCoComponentTypeFunctionality(TComponentFunctionality_Create(idTCoComponentType,idType)) do begin
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poDefault;
Position:=poScreenCenter;
Show;
end;
Release;
end;
end;

procedure TCoComponentTypeMarkerPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TCoComponentTypeMarkerPanelProps.Controls_ClearPropData;
begin
edName.Text:='';
end;

procedure TCoComponentTypeMarkerPanelProps.editname1Click(Sender: TObject);
begin
edName.Enabled:=true;
edName.SetFocus;
end;

procedure TCoComponentTypeMarkerPanelProps.TypeUIDItemClick(
  Sender: TObject);
begin
edName.Enabled:=true;
edName.SetFocus;
end;

procedure TCoComponentTypeMarkerPanelProps.Showtype1Click(Sender: TObject);
var
  idType: integer;
begin
idType:=TCoComponentTypeMarkerFunctionality(ObjFunctionality).idCoComponentType;
with TCoComponentTypeFunctionality(TComponentFunctionality_Create(idTCoComponentType,idType)) do begin
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poDefault;
Position:=poScreenCenter;
Show;
end;
Release;
end;
end;


end.
