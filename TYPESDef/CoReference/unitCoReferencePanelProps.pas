unit unitCoReferencePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  Menus;

type
  TCoReferencePanelProps = class(TSpaceObjPanelProps)
    stName_Popup: TPopupMenu;
    savepositionofcurrentreflector1: TMenuItem;
    editpositionname1: TMenuItem;
    stName: TStaticText;
    edName: TEdit;
    procedure stNameClick(Sender: TObject);
    procedure edNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure savepositionofcurrentreflector1Click(Sender: TObject);
    procedure editpositionname1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure SetEditing;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
{$R *.DFM}


Constructor TCoReferencePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TCoReferencePanelProps.Destroy;
begin
Inherited;
end;

procedure TCoReferencePanelProps._Update;
begin
Inherited;
stName.Caption:=TCoReferenceFunctionality(ObjFunctionality).Name;
if stName.Caption = '' then stName.Caption:='<none>';
stName.Show;
edName.Hide;
end;

procedure TCoReferencePanelProps.SetEditing;
begin
stName.Hide;
with edName do begin
Left:=stName.Left;
Top:=stName.Top;
Width:=stName.Width;
Height:=stName.Height;
Text:=TCoReferenceFunctionality(ObjFunctionality).Name;
Show;
SetFocus;
end;
end;

procedure TCoReferencePanelProps.stNameClick(Sender: TObject);
begin
TCoReferenceFunctionality(ObjFunctionality).ShowReferencedObjectPanelProps;
end;

procedure TCoReferencePanelProps.edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: TCoReferenceFunctionality(ObjFunctionality).Name:=edName.Text;
end;
end;

procedure TCoReferencePanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #27 then Update;
end;

procedure TCoReferencePanelProps.savepositionofcurrentreflector1Click(Sender: TObject);
begin
if NOT TypesSystem.ClipBoard_flExist then Raise Exception.Create('clipboard is empty'); //. =>
TCoReferenceFunctionality(ObjFunctionality).SetReferencedObject(TypesSystem.Clipboard_Instance_idTObj,TypesSystem.Clipboard_Instance_idObj);
with TComponentFunctionality_Create(TypesSystem.Clipboard_Instance_idTObj,TypesSystem.Clipboard_Instance_idObj) do
try
TCoReferenceFunctionality(ObjFunctionality).Name:=Name;
finally
Release;
end;
end;

procedure TCoReferencePanelProps.editpositionname1Click(Sender: TObject);
begin
SetEditing;
end;

procedure TCoReferencePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TCoReferencePanelProps.Controls_ClearPropData;
begin
stName.Caption:='';
end;


end.
