unit unitCELLVisualizationPanelProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GlobalSpaceDefines, unitProxySpace, Functionality,
  TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  Menus, ComCtrls;

type
  TCELLVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    sbBorderWidthTo0: TSpeedButton;
    pnlLineWidth: TPanel;
    PopupMenu: TPopupMenu;
    edColumns: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edRows: TEdit;
    sbInsideFormatting: TSpeedButton;
    udTop: TUpDown;
    udLeft: TUpDown;                         
    udDown: TUpDown;
    udRight: TUpDown;
    sbDoOrientation: TSpeedButton;
    sbInsideObjects: TSpeedButton;
    sbDoQuad: TSpeedButton;
    procedure pnlLineWidthMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlLineWidthMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure pnlLineWidthMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbBorderWidthTo0Click(Sender: TObject);
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure edColumnsKeyPress(Sender: TObject; var Key: Char);
    procedure edRowsKeyPress(Sender: TObject; var Key: Char);
    procedure sbInsideFormattingClick(Sender: TObject);
    procedure udLeftClick(Sender: TObject; Button: TUDBtnType);
    procedure udTopClick(Sender: TObject; Button: TUDBtnType);
    procedure udRightClick(Sender: TObject; Button: TUDBtnType);
    procedure udDownClick(Sender: TObject; Button: TUDBtnType);
    procedure sbDoOrientationClick(Sender: TObject);
    procedure sbInsideObjectsClick(Sender: TObject);
    procedure sbDoQuadClick(Sender: TObject);
  private
    { Private declarations }
    Mouse_LastX: integer;
    BW: Extended;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
Uses
  unitInsideObjects,
  unitInsideFormatting;

{$R *.DFM}


Constructor TCELLVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Mouse_LastX:=-1;
Update;
end;

destructor TCELLVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TCELLVisualizationPanelProps._Update;
begin
Inherited;
edColumns.Text:=IntToStr(TCELLVisualizationFunctionality(ObjFunctionality).ColCount);
edRows.Text:=IntToStr(TCELLVisualizationFunctionality(ObjFunctionality).RowCount);
pnlLineWidth.Caption:=FormatFloat('0.00000',TCELLVisualizationFunctionality(ObjFunctionality).LineWidth);
end;

procedure TCELLVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TCELLVisualizationPanelProps.pnlLineWidthMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
begin
if Button = mbRight
 then begin
  BW:=TCELLVisualizationFunctionality(ObjFunctionality).LineWidth;
  Mouse_LastX:=X;
  end;
end;

procedure TCELLVisualizationPanelProps.pnlLineWidthMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  dX: integer;
  dW: Extended;
begin
if (Mouse_LastX > 0) AND ObjectIsInheritedFrom(TBase2DVisualizationFunctionality(ObjFunctionality).Reflector,TReflector)
 then begin //. относительное изменение толщины
  dX:=X-Mouse_LastX;
  dW:=dX/TReflector(TBase2DVisualizationFunctionality(ObjFunctionality).Reflector).ReflectionWindow.Scale;
  if BW+dW >= 0
   then BW:=BW+dW
   else BW:=0;
  pnlLineWidth.Caption:=FormatFloat('0.00000',BW);
  pnlLineWidth.Hint:=FloatToStr(BW);
  (Sender as TControl).Cursor:=crHSplit;
  Mouse_LastX:=X;
  end;
end;

procedure TCELLVisualizationPanelProps.pnlLineWidthMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
begin
if Button = mbRight
 then begin
  Updater.Disable;
  try
  TCELLVisualizationFunctionality(ObjFunctionality).LineWidth:=BW;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  Mouse_LastX:=-1;
  (Sender as TControl).Cursor:=crDefault;
  end;
end;

procedure TCELLVisualizationPanelProps.sbBorderWidthTo0Click(Sender: TObject);
begin
Updater.Disable;
try
TCELLVisualizationFunctionality(ObjFunctionality).LineWidth:=0;
except
  Updater.Enabled;
  Raise; //.=>
  end;
pnlLineWidth.Caption:=FloatToStr(0);
end;

procedure TCELLVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TBase2DVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TBase2DVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TCELLVisualizationPanelProps.edColumnsKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TCELLVisualizationFunctionality(ObjFunctionality).ColCount:=StrToInt(edColumns.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TCELLVisualizationPanelProps.edRowsKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TCELLVisualizationFunctionality(ObjFunctionality).RowCount:=StrToInt(edRows.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TCELLVisualizationPanelProps.Controls_ClearPropData;
begin
edColumns.Text:='';
edRows.Text:='';
end;


procedure TCELLVisualizationPanelProps.sbInsideFormattingClick(Sender: TObject);
begin
with TfmInsideFormatting.Create(TCELLVisualizationFunctionality(ObjFunctionality)) do Show;
end;

procedure TCELLVisualizationPanelProps.udLeftClick(Sender: TObject; Button: TUDBtnType);
begin
case Button of
btNext: TCELLVisualizationFunctionality(ObjFunctionality).Change(-1,0,0,0);
btPrev: TCELLVisualizationFunctionality(ObjFunctionality).Change(1,0,0,0);
end;
end;

procedure TCELLVisualizationPanelProps.udTopClick(Sender: TObject; Button: TUDBtnType);
begin
case Button of
btNext: TCELLVisualizationFunctionality(ObjFunctionality).Change(0,1,0,0);
btPrev: TCELLVisualizationFunctionality(ObjFunctionality).Change(0,-1,0,0);
end;
end;

procedure TCELLVisualizationPanelProps.udRightClick(Sender: TObject; Button: TUDBtnType);
begin
case Button of
btNext: TCELLVisualizationFunctionality(ObjFunctionality).Change(0,0,1,0);
btPrev: TCELLVisualizationFunctionality(ObjFunctionality).Change(0,0,-1,0);
end;
end;

procedure TCELLVisualizationPanelProps.udDownClick(Sender: TObject; Button: TUDBtnType);
begin
case Button of
btNext: TCELLVisualizationFunctionality(ObjFunctionality).Change(0,0,0,-1);
btPrev: TCELLVisualizationFunctionality(ObjFunctionality).Change(0,0,0,1);
end;
end;

procedure TCELLVisualizationPanelProps.sbDoOrientationClick(Sender: TObject);
begin
TCELLVisualizationFunctionality(ObjFunctionality).SetReflectorView;
end;

procedure TCELLVisualizationPanelProps.sbInsideObjectsClick(Sender: TObject);
begin
with TfmInsideObjects.Create(TCELLVisualizationFunctionality(ObjFunctionality)) do Show;
end;

procedure TCELLVisualizationPanelProps.sbDoQuadClick(Sender: TObject);
begin
TCELLVisualizationFunctionality(ObjFunctionality).DoQuad;
end;

end.

