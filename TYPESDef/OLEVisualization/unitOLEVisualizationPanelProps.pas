unit unitOLEVisualizationPanelProps;

interface

uses
  UnitProxySpace, Functionality, Windows, ActiveX, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TypesDefines,TypesFunctionality,unitReflector, 
  Db, DBClient, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation, Spin,
  ComCtrls, GlobalSpaceDefines, Menus, MyOleCtnrs;

type
  TOLEVisualizationPanelProps = class;

  TOLEContainerProcessing = class(TThread)
  private
    PanelProps: TOLEVisualizationPanelProps;
    Stream: TClientBlobStream;
    OutStream: TMemoryStream;

    Constructor Create(pPanelProps: TOLEVisualizationPanelProps);
    Destructor Destroy; override;
    procedure Execute; override;
    procedure UpdateContainer;
    procedure UpdateWindows;
  end;

  TOLEVisualizationPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    SpeedButtonShowAtReflectorCenter: TSpeedButton;
    FileDialog: TOpenDialog;
    Loadfromfile1: TMenuItem;
    Edit1: TMenuItem;
    Savetofile1: TMenuItem;
    Panel1: TPanel;
    bbInsertObject: TBitBtn;
    bbEdit: TBitBtn;
    PopupMenu: TPopupMenu;
    procedure SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
    procedure Loadfromfile1Click(Sender: TObject);
    procedure Savetofile1Click(Sender: TObject);
    procedure bbInsertObjectClick(Sender: TObject);
    procedure bbEditClick(Sender: TObject);
  private
    { Private declarations }
    OLEContainer: TOLEContainer;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure LoadFromFile;
    procedure SaveToFile;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
  end;

implementation

{$R *.DFM}


{TOLEContainerProcessing}
Constructor TOLEContainerProcessing.Create(pPanelProps: TOLEVisualizationPanelProps);
begin
PanelProps:=pPanelProps;
TOLEVisualizationFunctionality(PanelProps.ObjFunctionality).GetDATA(Stream);
Inherited Create(false);
end;

Destructor TOLEContainerProcessing.Destroy;
begin
Inherited;
Stream.Free;
end;

procedure TOLEContainerProcessing.Execute;
var
  Fm: TForm;
  I: integer;
begin
OleInitialize(nil);
try
Fm:=TForm.Create(nil);
with Fm do
try
Parent:=nil;
Hide;
with TOleContainer.Create(nil) do
try
Hide;
SizeMode:=smScale;
BorderStyle:=bsNone;
Parent:=Fm;
LoadFromStream(Stream);
//.
DoVerb(ovOpen);
//.
I:=0;
/// ? while State = osOpen do begin
while OLEIsRunning(OleObjectInterface) do begin
  Sleep(33);
  if (I MOD 2) = 0 then Application.ProcessMessages;
  if ((I MOD 30) = 0) AND Modified
   then begin
    OutStream:=TMemoryStream.Create;
    try
    SaveToStream(OutStream);
    Synchronize(UpdateContainer);
    finally
    OutStream.Destroy;
    end;
    Modified:=false;
    end;
  if ((I MOD 15) = 0) then Synchronize(UpdateWindows);
  Inc(I);
  end;
if Modified
 then begin
  OutStream:=TMemoryStream.Create;
  try
  SaveToStream(OutStream);
  Synchronize(UpdateContainer);
  finally
  OutStream.Destroy;
  end;
  Modified:=false;
  end;
//.
finally
Destroy;
end;
finally
Destroy;
end;
//.
finally
OleUninitialize;
end;
end;

procedure TOLEContainerProcessing.UpdateContainer;
begin
TOLEVisualizationFunctionality(PanelProps.ObjFunctionality).SetDATA(OutStream);
if TOLEVisualizationFunctionality(PanelProps.ObjFunctionality).Reflector <> nil then TOLEVisualizationFunctionality(PanelProps.ObjFunctionality).Reflector.Update;
end;

procedure TOLEContainerProcessing.UpdateWindows;
var
  I: integer;
  Msg: TMsg;
begin
PeekMessage(Msg, 0, 0, 0, PM_NOREMOVE);
for I:=0 to PanelProps.ObjFunctionality.Space.ReflectorsList.Count-1 do TForm(PanelProps.ObjFunctionality.Space.ReflectorsList[I]).Update;
for I:=0 to Screen.FormCount-1 do Screen.Forms[I].Update;
end;




{TOLEVisualizationPanelProps}
Constructor TOLEVisualizationPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
OLEContainer:=TOLEContainer.Create(Self);
with OLEContainer do begin
SizeMode:=smScale;
Enabled:=false;
Parent:=Self;
Left:=8;
Top:=56;
Width:=137;
Height:=81;
Show;
end;
NormalizeSize;
Update;
end;

destructor TOLEVisualizationPanelProps.Destroy;
begin
Inherited;
end;

procedure TOLEVisualizationPanelProps._Update;
var
  DATAStream: TClientBlobStream;
begin
Inherited;
//.
with TOLEVisualizationFunctionality(ObjFunctionality) do begin
GetDATA(DATAStream);
try
if DATAStream.Size <> 0 then OLEContainer.LoadFromStream(DATAStream);
finally
DATAStream.Destroy;
end;
end;
end;

procedure TOLEVisualizationPanelProps.SpeedButtonShowAtReflectorCenterClick(Sender: TObject);
begin
if TOLEVisualizationFunctionality(ObjFunctionality).Reflector <> nil then TOLEVisualizationFunctionality(ObjFunctionality).Reflector.ShowObjAtCenter(TVisualizationFunctionality(ObjFunctionality).Ptr);
end;

procedure TOLEVisualizationPanelProps.LoadFromFile;
var
  CD: string;
  R: boolean;
begin
CD:=GetCurrentDir;
try
R:=FileDialog.Execute;
finally
SetCurrentDir(CD);
end;
if R
 then with TOLEVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('importing  ...');
  try
  LoadFromFile(FileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TOLEVisualizationPanelProps.SaveToFile;
var
  CD: string;
  R: boolean;
begin
CD:=GetCurrentDir;
try
R:=FileDialog.Execute;
finally
SetCurrentDir(CD);
end;
if R
 then with TOLEVisualizationFunctionality(ObjFunctionality) do begin
  Space.Log.OperationStarting('Exporting  ...');
  try
  SaveToFile(FileDialog.FileName);
  finally
  Space.Log.OperationDone;
  end;
  end;
end;

procedure TOLEVisualizationPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TOLEVisualizationPanelProps.Controls_ClearPropData;
begin
end;

procedure TOLEVisualizationPanelProps.Loadfromfile1Click(Sender: TObject);
begin
LoadFromFile;
end;

procedure TOLEVisualizationPanelProps.Savetofile1Click(Sender: TObject);
begin
SaveToFile;
end;

procedure TOLEVisualizationPanelProps.bbInsertObjectClick(Sender: TObject);
var
  Stream: TMemoryStream;
begin
if OLEContainer.InsertObjectDialog
 then begin
  Stream:=TMemoryStream.Create;
  try
  OLEContainer.SaveToStream(Stream);
  TOLEVisualizationFunctionality(ObjFunctionality).SetDATA(Stream);
  finally
  Stream.Destroy;
  end;
  //. editing
  with TOLEContainerProcessing.Create(Self) do
  try
  WaitFor;
  finally
  Destroy;
  end;
  end;
end;

procedure TOLEVisualizationPanelProps.bbEditClick(Sender: TObject);
begin
bbInsertObject.Enabled:=false;
bbEdit.Enabled:=false;
try
with TOLEContainerProcessing.Create(Self) do
try
WaitFor;
finally
Destroy;
end;
finally
bbInsertObject.Enabled:=true;
bbEdit.Enabled:=true;
end;
end;

end.
