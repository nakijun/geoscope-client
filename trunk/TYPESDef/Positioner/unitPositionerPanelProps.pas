unit unitPositionerPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  Menus;

type
  TPositionerPanelProps = class(TSpaceObjPanelProps)
    stPositionName_Popup: TPopupMenu;
    savepositionofcurrentreflector1: TMenuItem;
    editpositionname1: TMenuItem;
    stPositionName: TStaticText;
    edPositionName: TEdit;
    procedure savepositionofcurrentreflector1Click(Sender: TObject);
    procedure stPositionNameClick(Sender: TObject);
    procedure editpositionname1Click(Sender: TObject);
    procedure edPositionNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPositionNameKeyPress(Sender: TObject; var Key: Char);
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


Constructor TPositionerPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TPositionerPanelProps.Destroy;
begin
Inherited;
end;

procedure TPositionerPanelProps._Update;
begin
Inherited;
stPositionName.Caption:=TPositionerFunctionality(ObjFunctionality).PositionName;
if stPositionName.Caption = '' then stPositionName.Caption:='<none>';
stPositionName.Show;
edPositionName.Hide;
end;

procedure TPositionerPanelProps.SetEditing;
begin
stPositionName.Hide;
with edPositionName do begin
Left:=stPositionName.Left;
Top:=stPositionName.Top;
Width:=stPositionName.Width;
Height:=stPositionName.Height;
Text:=TPositionerFunctionality(ObjFunctionality).PositionName;
Show;
SetFocus;
end;
end;

procedure TPositionerPanelProps.savepositionofcurrentreflector1Click(Sender: TObject);
begin
if ObjectIsInheritedFrom(TypesSystem.Reflector,TReflector) then TPositionerFunctionality(ObjFunctionality).Save2DPosition(TReflector(TypesSystem.Reflector));
end;

procedure TPositionerPanelProps.stPositionNameClick(Sender: TObject);
begin
TPositionerFunctionality(ObjFunctionality).SetPosition;
end;

procedure TPositionerPanelProps.editpositionname1Click(Sender: TObject);
begin
SetEditing;
end;

procedure TPositionerPanelProps.edPositionNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_RETURN: TPositionerFunctionality(ObjFunctionality).PositionName:=edPositionName.Text;
end;
end;

procedure TPositionerPanelProps.edPositionNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #27 then Update;
end;

procedure TPositionerPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TPositionerPanelProps.Controls_ClearPropData;
begin
stPositionName.Caption:='';
end;


end.
