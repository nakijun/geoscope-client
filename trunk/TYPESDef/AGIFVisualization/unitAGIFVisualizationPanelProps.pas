unit unitAGIFVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, 
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines, Menus;

type
  TAGIFVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    PopupMenu: TPopupMenu;
    Loadfromfile1: TMenuItem;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure Loadfromfile1Click(Sender: TObject);
  private
    { Private declarations }
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

Constructor TAGIFVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TAGIFVisualizationPanelProps.Destroy;
begin
Inherited;                     
end;

procedure TAGIFVisualizationPanelProps._Update;
begin
Inherited;
//.
with TAGIFVisualizationFunctionality(ObjFunctionality) do begin
//.
end;
end;

procedure TAGIFVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TAGIFVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TAGIFVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TAGIFVisualizationPanelProps.LoadFromFile;
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
 then with TAGIFVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing  ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TAGIFVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TAGIFVisualizationPanelProps.Controls_ClearPropData;
begin
end;



procedure TAGIFVisualizationPanelProps.Loadfromfile1Click(Sender: TObject);
begin
LoadFromFile;
end;

end.
