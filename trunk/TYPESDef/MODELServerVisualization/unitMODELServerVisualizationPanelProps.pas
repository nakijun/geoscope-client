unit unitMODELServerVisualizationPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TMODELServerVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Label1: TLabel;
    edServerURL: TEdit;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure edServerURLKeyPress(Sender: TObject; var Key: Char);
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

Constructor TMODELServerVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if (flReadOnly) then DisableControls;
Update;
end;

destructor TMODELServerVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TMODELServerVisualizationPanelProps._Update;
begin
Inherited;
with TMODELServerVisualizationFunctionality(ObjFunctionality) do begin
edServerURL.Text:=ServerURL;
end;
end;

procedure TMODELServerVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TMODELServerVisualizationPanelProps.Controls_ClearPropData;
begin
edServerURL.Text:='';
end;

procedure TMODELServerVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if (TBaseVisualizationFunctionality(ObjFunctionality).Reflector <> nil) then TVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TBaseVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TMODELServerVisualizationPanelProps.edServerURLKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TMODELServerVisualizationFunctionality(ObjFunctionality).ServerURL:=edServerURL.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;


end.
