unit unitEllipseVisualizationPanelProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  GlobalSpaceDefines, unitProxySpace, Functionality,
  TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  Menus;

type
  TEllipseVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    sbBorderWidthTo0: TSpeedButton;
    pnlBorderWidth: TPanel;
    lbBorderColor: TLabel;
    sbBorderColorChange: TSpeedButton;
    ColorDialog: TColorDialog;
    lbColor: TLabel;
    sbColor: TSpeedButton;
    Label4: TLabel;
    PopupMenu: TPopupMenu;
    procedure pnlBorderWidthMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlBorderWidthMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure pnlBorderWidthMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbBorderWidthTo0Click(Sender: TObject);
    procedure sbBorderColorChangeClick(Sender: TObject);
    procedure sbColorClick(Sender: TObject);
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
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
{$R *.DFM}

Constructor TEllipseVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Mouse_LastX:=-1;
Update;
end;

destructor TEllipseVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TEllipseVisualizationPanelProps._Update;
begin
Inherited;
lbColor.Color:=TEllipseVisualizationFunctionality(ObjFunctionality).Color;
pnlBorderWidth.Caption:=FormatFloat('0.00000',TEllipseVisualizationFunctionality(ObjFunctionality).BorderWidth);
lbBorderColor.Color:=TEllipseVisualizationFunctionality(ObjFunctionality).BorderColor;
end;

procedure TEllipseVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TEllipseVisualizationPanelProps.Controls_ClearPropData;
begin
pnlBorderWidth.Caption:='';
end;

procedure TEllipseVisualizationPanelProps.pnlBorderWidthMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
begin
if Button = mbRight
 then begin
  BW:=TEllipseVisualizationFunctionality(ObjFunctionality).BorderWidth;
  Mouse_LastX:=X;
  end;
end;

procedure TEllipseVisualizationPanelProps.pnlBorderWidthMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
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
  pnlBorderWidth.Caption:=FormatFloat('0.00000',BW);
  pnlBorderWidth.Hint:=FloatToStr(BW);
  (Sender as TControl).Cursor:=crHSplit;
  Mouse_LastX:=X;
  end;
end;

procedure TEllipseVisualizationPanelProps.pnlBorderWidthMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
begin
if Button = mbRight
 then begin
  Updater.Disable;
  try
  TEllipseVisualizationFunctionality(ObjFunctionality).BorderWidth:=BW;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  Mouse_LastX:=-1;
  (Sender as TControl).Cursor:=crDefault;
  end;
end;

procedure TEllipseVisualizationPanelProps.sbBorderWidthTo0Click(Sender: TObject);
begin
Updater.Disable;
try
TEllipseVisualizationFunctionality(ObjFunctionality).BorderWidth:=0;
except
  Updater.Enabled;
  Raise; //.=>
  end;
pnlBorderWidth.Caption:=FloatToStr(0);
end;

procedure TEllipseVisualizationPanelProps.sbBorderColorChangeClick(Sender: TObject);
begin
ColorDialog.Color:=TEllipseVisualizationFunctionality(ObjFunctionality).BorderColor;
if ColorDialog.Execute AND (ColorDialog.Color <> TEllipseVisualizationFunctionality(ObjFunctionality).BorderColor)
 then begin
  Updater.Disable;
  try
  TEllipseVisualizationFunctionality(ObjFunctionality).BorderColor:=ColorDialog.Color;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  lbBorderColor.Color:=ColorDialog.Color;
  end;
end;

procedure TEllipseVisualizationPanelProps.sbColorClick(Sender: TObject);
begin
ColorDialog.Color:=TEllipseVisualizationFunctionality(ObjFunctionality).Color;
if ColorDialog.Execute AND (ColorDialog.Color <> TEllipseVisualizationFunctionality(ObjFunctionality).Color)
 then begin
  Updater.Disable;
  try
  TEllipseVisualizationFunctionality(ObjFunctionality).Color:=ColorDialog.Color;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  lbColor.Color:=ColorDialog.Color;
  end;
end;

procedure TEllipseVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TBase2DVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TBase2DVisualizationFunctionality(ObjFunctionality).Ptr);
end;

end.
