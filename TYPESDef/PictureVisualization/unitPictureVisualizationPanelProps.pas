unit unitPictureVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, 
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines, Menus;

type
  TPictureVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    PopupMenu: TPopupMenu;
    Loadfromfile1: TMenuItem;
    Setproportion1: TMenuItem;
    Label1: TLabel;
    edVisibleMinScale: TEdit;
    Label2: TLabel;
    edVisibleMaxScale: TEdit;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure Loadfromfile1Click(Sender: TObject);
    procedure Setproportion1Click(Sender: TObject);
    procedure edVisibleMinScaleKeyPress(Sender: TObject; var Key: Char);
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

Constructor TPictureVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TPictureVisualizationPanelProps.Destroy;
begin
Inherited;                     
end;

procedure TPictureVisualizationPanelProps._Update;
var
  VisibleMinScale,VisibleMaxScale: double;
begin
Inherited;
//.
with TPictureVisualizationFunctionality(ObjFunctionality) do begin
GetParams(VisibleMinScale,VisibleMaxScale);
//.
end;
if (VisibleMinScale > 0) then edVisibleMinScale.Text:=FormatFloat('0.000',VisibleMinScale) else edVisibleMinScale.Text:='none';
if (VisibleMaxScale > 0) then edVisibleMaxScale.Text:=FormatFloat('0.000',VisibleMaxScale) else edVisibleMaxScale.Text:='none';
end;

procedure TPictureVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TPictureVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TPictureVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TPictureVisualizationPanelProps.LoadFromFile;
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
 then with TPictureVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing  ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TPictureVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TPictureVisualizationPanelProps.Loadfromfile1Click(Sender: TObject);
begin
LoadFromFile;
end;

procedure TPictureVisualizationPanelProps.Setproportion1Click(Sender: TObject);
begin
TPictureVisualizationFunctionality(ObjFunctionality).SetProportion;
end;

procedure TPictureVisualizationPanelProps.edVisibleMinScaleKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  Updater.Disable;
  try
  TPictureVisualizationFunctionality(ObjFunctionality).SetParams(StrToFloat(edVisibleMinScale.Text),StrToFloat(edVisibleMaxScale.Text));
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TPictureVisualizationPanelProps.Controls_ClearPropData;
begin
end;


end.
