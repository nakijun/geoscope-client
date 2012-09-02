unit unitDetailedPictureVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, 
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines, Menus;

type
  TDetailedPictureVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    PopupMenu: TPopupMenu;
    Loadfromfile1: TMenuItem;
    Generatefromtiles1: TMenuItem;
    Wrapper1: TMenuItem;
    LEVELs1: TMenuItem;
    AddNewLevelAndRegenerate1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Regeneratelevels1: TMenuItem;
    Calibration1: TMenuItem;
    N4: TMenuItem;
    Loadtolocalcontext1: TMenuItem;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure Loadfromfile1Click(Sender: TObject);
    procedure Generatefromtiles1Click(Sender: TObject);
    procedure Wrapper1Click(Sender: TObject);
    procedure LEVELs1Click(Sender: TObject);
    procedure AddNewLevelAndRegenerate1Click(Sender: TObject);
    procedure Regeneratelevels1Click(Sender: TObject);
    procedure Calibration1Click(Sender: TObject);
    procedure Loadtolocalcontext1Click(Sender: TObject);
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
Uses
  unitDetailedPictureLevels,
  unitDetailedPictureGenerator,
  unitDetailedPictureWrapper,
  unitDetailedPictureCalibrator,
  unitDetailedPictureLocalContextLoader;


{$R *.DFM}


Constructor TDetailedPictureVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TDetailedPictureVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TDetailedPictureVisualizationPanelProps._Update;
begin
Inherited;
//.
with TDetailedPictureVisualizationFunctionality(ObjFunctionality) do begin
end;
end;

procedure TDetailedPictureVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TDetailedPictureVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TDetailedPictureVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TDetailedPictureVisualizationPanelProps.LoadFromFile;
var
  CD: string;
  R: boolean;
  MS: TMemoryStream;
  BA: TByteArray;
begin
CD:=GetCurrentDir;
try
R:=OpenFileDialog.Execute;
finally
SetCurrentDir(CD);
end;
if R
 then with TDetailedPictureVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('generating image  ...');
  try
  MS:=TMemoryStream.Create;
  try
  MS.LoadFromFile(OpenFileDialog.FileName);
  ByteArray_PrepareFromStream(BA,MS);
  GenerateFromImage(BA);
  finally
  MS.Destroy;
  end;
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TDetailedPictureVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TDetailedPictureVisualizationPanelProps.Loadfromfile1Click(Sender: TObject);
begin
LoadFromFile;
end;

procedure TDetailedPictureVisualizationPanelProps.Generatefromtiles1Click(Sender: TObject);
begin
with TfmDetailedPictureGenerator.Create(TDetailedPictureVisualizationFunctionality(ObjFunctionality)) do
try
ShowModal;
finally
Destroy;
end;
end;

procedure TDetailedPictureVisualizationPanelProps.AddNewLevelAndRegenerate1Click(Sender: TObject);
begin
TDetailedPictureVisualizationFunctionality(ObjFunctionality).AddNewLevelAndRegenerate;
end;

procedure TDetailedPictureVisualizationPanelProps.Regeneratelevels1Click(Sender: TObject);
begin
TDetailedPictureVisualizationFunctionality(ObjFunctionality).RegenerateRegion(-1,-1, -1,-1);
end;

procedure TDetailedPictureVisualizationPanelProps.Wrapper1Click(Sender: TObject);
begin
with TfmDetailedPictureWrapper.Create(ObjFunctionality.idObj) do Show;
end;

procedure TDetailedPictureVisualizationPanelProps.LEVELs1Click(Sender: TObject);
begin
with TfmDetailedPictureLevels.Create(ObjFunctionality.idObj) do
try
ShowModal;
finally
Destroy;
end;
end;

procedure TDetailedPictureVisualizationPanelProps.Calibration1Click(Sender: TObject);
begin
with TfmDetailedPictureCalibrator.Create(ObjFunctionality.Space,ObjFunctionality.idObj) do Show();
end;

procedure TDetailedPictureVisualizationPanelProps.Controls_ClearPropData;
begin
end;

procedure TDetailedPictureVisualizationPanelProps.Loadtolocalcontext1Click(Sender: TObject);
begin
with TfmDetailedPictureLocalContextLoader.Create(ObjFunctionality.Space,ObjFunctionality.idObj) do
try
ShowModal();
finally
Destroy;
end;
end;


end.
