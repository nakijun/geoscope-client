unit unitPrivateAreaVisualizationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, GlobalSpaceDefines;

type
  TPrivateAreaVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    Image1: TImage;
    cbAcquireObjectsInside: TCheckBox;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure SpeedButtonShowAtReflectorCenterMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbAcquireObjectsInsideClick(Sender: TObject);
  private
    { Private declarations }
    flUpdating: boolean;
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


Constructor TPrivateAreaVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly, pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
flUpdating:=false;
if flReadOnly then DisableControls;
Update;
end;

destructor TPrivateAreaVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TPrivateAreaVisualizationPanelProps._Update;
begin
Inherited;
flUpdating:=true;
try
cbAcquireObjectsInside.Checked:=TPrivateAreaVisualizationFunctionality(ObjFunctionality).AcquireObjectsInside;
finally
flUpdating:=false;
end;
end;

procedure TPrivateAreaVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;


procedure TPrivateAreaVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TBase2DVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TBase2DVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TBase2DVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TPrivateAreaVisualizationPanelProps.SpeedButtonShowAtReflectorCenterMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,Y: Integer);
begin
if Button = mbRight then Beep;
end;

procedure TPrivateAreaVisualizationPanelProps.cbAcquireObjectsInsideClick(Sender: TObject);
begin
if (flUpdating) then Exit; //. ->
//.
Updater.Disable;
try
TPrivateAreaVisualizationFunctionality(ObjFunctionality).AcquireObjectsInside:=cbAcquireObjectsInside.Checked;
except
  Updater.Enabled;
  Raise; //.=>
  end;
end;

procedure TPrivateAreaVisualizationPanelProps.Controls_ClearPropData;
begin
cbAcquireObjectsInside.Checked:=false;
end;


end.
