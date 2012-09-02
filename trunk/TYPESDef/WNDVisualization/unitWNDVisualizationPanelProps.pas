unit unitWNDVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, 
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines;

type
  TWNDVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    sbLoad: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure sbLoadClick(Sender: TObject);
  private
    { Private declarations }
    flUpdating: boolean;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure LoadFromFile;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation

{$R *.DFM}

Constructor TWNDVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
flUpdating:=false;
Update;
end;

destructor TWNDVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TWNDVisualizationPanelProps._Update;
begin
Inherited;
//.
flUpdating:=true;
try
with TWNDVisualizationFunctionality(ObjFunctionality) do begin
//. do nothing
end;
finally
flUpdating:=false;
end;
end;

procedure TWNDVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TWNDVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TWNDVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TWNDVisualizationPanelProps.LoadFromFile;
var
  CD: string;
  R: boolean;
begin
CD:=GetCurrentDir;
try
R:=OpenFileDialog.Execute;
finally
SetCurrentDir(CD);
end;
if R
 then with TWNDVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing  ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TWNDVisualizationPanelProps.sbLoadClick(Sender: TObject);
begin
LoadFromFile;
end;

procedure TWNDVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TWNDVisualizationPanelProps.Controls_ClearPropData;
begin
end;




end.
