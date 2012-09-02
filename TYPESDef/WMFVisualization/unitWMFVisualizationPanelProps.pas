unit unitWMFVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, 
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines, Menus;

type
  TWMFVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    PopupMenu: TPopupMenu;
    Loadfromfile1: TMenuItem;
    EnterasText1: TMenuItem;
    N1: TMenuItem;
    Setproportion1: TMenuItem;
    Savetofile1: TMenuItem;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure Loadfromfile1Click(Sender: TObject);
    procedure EnterasText1Click(Sender: TObject);
    procedure Setproportion1Click(Sender: TObject);
    procedure Savetofile1Click(Sender: TObject);
  private
    { Private declarations }
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure LoadFromFile;
    procedure SaveToFile();
    procedure EnterAsText;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
uses
  FileCtrl,
  unitRTFEditorWMFConverter;

{$R *.DFM}

Constructor TWMFVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TWMFVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TWMFVisualizationPanelProps._Update;
begin
Inherited;
//.
with TWMFVisualizationFunctionality(ObjFunctionality) do begin
//.
end;
end;

procedure TWMFVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TWMFVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TWMFVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TWMFVisualizationPanelProps.LoadFromFile;
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
 then with TWMFVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing  ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TWMFVisualizationPanelProps.SaveToFile();
var
  Path: string;
  DATAStream: TMemoryStream;
  DATAType: TComponentFileType;
begin
if (NOT SelectDirectory('Select directory ->','',Path)) then Exit; //. ->
with TWMFVisualizationFunctionality(ObjFunctionality) do begin
Path:=Path+'\'+'WMF'+IntToStr(idObj)+'.wmf';
GetDATA({out} DATAStream,{out} DATAType);
try
DATAStream.SaveToFile(Path);
finally
DATAStream.Destroy;
end;
end;
ShowMessage('WMF-visualization has been saved into file: '+Path);
end;

procedure TWMFVisualizationPanelProps.EnterAsText;
var
  WMF: TMemoryStream;
begin
with TfmRTFEditorWMFConverter.Create do
try
if (WorkAndSaveAsWMF(WMF))
 then
  try
  with TWMFVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing  ...');
  try
  SetDATA(WMF,cftWMF);
  SetProportion();
  finally
  Space.Log.OperationDone;
  end;
  end;
  finally
  WMF.Destroy;
  end;
finally
Destroy;
end;
end;

procedure TWMFVisualizationPanelProps.Loadfromfile1Click(Sender: TObject);
begin
LoadFromFile();
end;

procedure TWMFVisualizationPanelProps.Savetofile1Click(Sender: TObject);
begin
SaveToFile();
end;

procedure TWMFVisualizationPanelProps.EnterasText1Click(Sender: TObject);
begin
EnterAsText();
end;

procedure TWMFVisualizationPanelProps.Setproportion1Click(Sender: TObject);
begin
TWMFVisualizationFunctionality(ObjFunctionality).SetProportion();
end;

procedure TWMFVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TWMFVisualizationPanelProps.Controls_ClearPropData;
begin
end;


end.
