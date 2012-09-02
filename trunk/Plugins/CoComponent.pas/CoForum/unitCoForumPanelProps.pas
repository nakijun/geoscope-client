unit unitCoForumPanelProps;

interface

uses
  Windows, Messages, SysUtils, Variants, ActiveX, Classes, Graphics, Controls, Forms, DBClient,
  Dialogs, unitCoComponentRepresentations, unitCoForumFunctionality, StdCtrls, ExtCtrls, Buttons,
  OleCtnrs;
                   
type
  TCoForumPanelProps = class(TCoComponentPanelProps)
    ScrollBox: TScrollBox;
    pnlTitle: TPanel;
    Image1: TImage;
    edName: TEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    sbEdit: TSpeedButton;
    sbAdd: TSpeedButton;
    sbDelete: TSpeedButton;
    sbSave: TSpeedButton;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure sbAddClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
  private
    { Private declarations }
    ContainersList: TList;
    procedure ContainersList_Clear;
  public
    { Public declarations }
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    procedure _Update; override;
    function AddNewContainer: TOLEContainer;
    procedure DeleteContainer(const C: TOLEContainer);
    procedure SaveContainers;
    procedure AlignContainers;
    procedure EditContainer(C: TOLEContainer);
  end;

implementation

{$R *.dfm}


Constructor TCoForumPanelProps.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
ContainersList:=TList.Create;
Update;
end;

Destructor TCoForumPanelProps.Destroy;
begin
ContainersList_Clear;
ContainersList.Free;
Inherited;
end;

procedure TCoForumPanelProps._Update;
var
  BlocksList: TList;
  I: integer;              
  Y: integer;
  NewContainer: TOLEContainer;
begin
pnlTitle.OnDblClick:=Self.OnDblClick;
//.
with TCoForumFunctionality.Create(idCoComponent) do
try
edName.Text:=Name;
try
GetBlocksList(BlocksList);
try
ContainersList_Clear;
Y:=0;
for I:=0 to BlocksList.Count-1 do begin
  NewContainer:=TOLEContainer.Create(nil);
  ContainersList.Add(NewContainer);
  with NewContainer do begin
  AutoActivate:=aaManual;
  SizeMode:=smAutoSize;
  BorderStyle:=bsNone;
  Parent:=ScrollBox;
  try
  LoadFromStream(TStream(BlocksList[I]));
  except
    end;
  Left:=0;
  Top:=Y;
  Show;
  Inc(Y,Height);
  end;
  end;
finally
for I:=0 to BlocksList.Count-1 do TObject(BlocksList[I]).Destroy;
BlocksList.Destroy;
end;
except
  end;
finally
Release;
end;
end;

procedure TCoForumPanelProps.ContainersList_Clear;
var
  I: integer;
begin
for I:=0 to ContainersList.Count-1 do TObject(ContainersList[I]).Destroy;
ContainersList.Clear;
end;

function TCoForumPanelProps.AddNewContainer: TOLEContainer;
var
  Y: integer;
  NewContainer: TOLEContainer;
begin
if ContainersList.Count > 0 then with TOLEContainer(ContainersList[ContainersList.Count-1]) do Y:=Top+Height else Y:=0;
NewContainer:=TOLEContainer.Create(nil);
ContainersList.Add(NewContainer);
with NewContainer do begin
AutoActivate:=aaManual;
SizeMode:=smAutoSize;
BorderStyle:=bsNone;
Parent:=ScrollBox;
Left:=0;
Top:=Y;
Show;
end;
Result:=NewContainer;
end;

procedure TCoForumPanelProps.DeleteContainer(const C: TOLEContainer);
begin
if ContainersList.IndexOf(C) <> -1
 then begin
  ContainersList.Remove(C);
  C.Destroy;
  AlignContainers;
  end;
end;

procedure TCoForumPanelProps.SaveContainers;
var
  BlocksList: TList;
  I: integer;
  DistStream: TMemoryStream;
begin
BlocksList:=TList.Create;
try
for I:=0 to ContainersList.Count-1 do with TOLEContainer(ContainersList[I]) do begin
  DistStream:=TMemoryStream.Create;
  try
  SaveToStream(DistStream);
  except
    end;
  BlocksList.Add(DistStream);
  end;
//. save
with TCoForumFunctionality.Create(idCoComponent) do
try
SetBlocksList(BlocksList);
finally
Release;
end;
finally
for I:=0 to BlocksList.Count-1 do TObject(BlocksList[I]).Destroy;
BlocksList.Destroy;
end;
end;

procedure TCoForumPanelProps.AlignContainers;
var
  I: integer;
  Y: integer;
begin
ScrollBox.VertScrollBar.Position:=0;
ScrollBox.HorzScrollBar.Position:=0;
Y:=0;
for I:=0 to ContainersList.Count-1 do with TOLEContainer(ContainersList[I]) do begin
  Left:=0;
  Top:=Y;
  Inc(Y,Height);
  end;
end;

Type
  TUpdateProc = procedure of object;
  
  TOLEContainerProcessing = class(TThread)
  private
    OLEContainer: TOLEContainer;
    MyOLEContainer: TOLEContainer;
    Stream: TMemoryStream;
    OutStream: TMemoryStream;
    UpdateProc: TUpdateProc;

    Constructor Create(pOLEContainer: TOLEContainer);
    Destructor Destroy; override;
    procedure Execute; override;
    procedure LoadContainer;
    procedure UpdateContainer;
    procedure UpdateWindows;
  end;


{TOLEContainerProcessing}
Constructor TOLEContainerProcessing.Create(pOLEContainer: TOLEContainer);
begin
OLEContainer:=pOLEContainer;
Stream:=TMemoryStream.Create;
UpdateProc:=nil;
Inherited Create(false);
end;

Destructor TOLEContainerProcessing.Destroy;
begin
Stream.Free;
Inherited;
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
MyOLEContainer:=TOleContainer.Create(nil);
with MyOLEContainer do
try
Hide;
SizeMode:=smScale;
BorderStyle:=bsNone;
Parent:=Fm;
Synchronize(LoadContainer);
MyOLEContainer.LoadFromStream(Stream);
//.
DoVerb(ovOpen);
//.
I:=0;
while OLEIsRunning(OleObjectInterface) do begin
  Sleep(33);
  if (I MOD 2) = 0 then Application.ProcessMessages;
  if ((I MOD 30) = 0) AND Modified
   then begin
    OutStream:=TMemoryStream.Create;
    try
    SaveToStream(OutStream); OutStream.Position:=0;
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
  SaveToStream(OutStream); OutStream.Position:=0;
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

procedure TOLEContainerProcessing.LoadContainer;
begin
OLEContainer.SaveToStream(Stream); Stream.Position:=0;
end;

procedure TOLEContainerProcessing.UpdateContainer;
begin
OLEContainer.LoadFromStream(OutStream);
if Assigned(UpdateProc) then UpdateProc;
end;

procedure TOLEContainerProcessing.UpdateWindows;
var
  I: integer;
  Msg: TMsg;
begin
PeekMessage(Msg, 0, 0, 0, PM_NOREMOVE);
//.
for I:=0 to Screen.FormCount-1 do Screen.Forms[I].Update;
end;

procedure TCoForumPanelProps.EditContainer(C: TOLEContainer);
var
  FS: TFormStyle;
begin
if (C.State = osEmpty) AND NOT C.InsertObjectDialog then Exit; //. ->
FS:=FormStyle;
FormStyle:=fsNormal;
try
with TOLEContainerProcessing.Create(C) do
try
UpdateProc:=AlignContainers;
WaitFor;
finally
Destroy;
end;
finally
FormStyle:=FS;
end;
AlignContainers;
end;

procedure TCoForumPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then with TCoForumFunctionality.Create(idCoComponent) do
  try
  Name:=edName.Text;
  finally
  Release;
  end;
end;

procedure TCoForumPanelProps.sbAddClick(Sender: TObject);
begin
EditContainer(AddNewContainer);
end;

procedure TCoForumPanelProps.sbSaveClick(Sender: TObject);
begin
SaveContainers;
ShowMessage('Updated.');
end;

procedure TCoForumPanelProps.sbEditClick(Sender: TObject);
var
  OC: TOLEContainer;
begin
if NOT (Self.ActiveControl is TOLEContainer) then Raise Exception.Create('container not selected'); //. =>
OC:=TOLEContainer(Self.ActiveControl);
EditContainer(OC);
end;

procedure TCoForumPanelProps.sbDeleteClick(Sender: TObject);
var
  OC: TOLEContainer;
begin
if NOT (Self.ActiveControl is TOLEContainer) then Raise Exception.Create('container not selected'); //. =>
OC:=TOLEContainer(Self.ActiveControl);
DeleteContainer(OC);
end;

end.
