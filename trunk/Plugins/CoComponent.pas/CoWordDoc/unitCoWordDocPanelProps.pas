unit unitCoWordDocPanelProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FunctionalityImport, unitCoWordDocFunctionality, unitCoComponentRepresentations, StdCtrls, ExtCtrls, Buttons;

type
  TCoWordDocPanelProps = class(TCoComponentPanelProps)
    edName: TEdit;
    Image: TImage;
    sbLoadFromFile: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    sbOpen: TSpeedButton;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure sbLoadFromFileClick(Sender: TObject);
    procedure sbOpenClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadFromFile;
    procedure WMDropFiles(var msg : TMessage); message WM_DROPFILES;
  public
    { Public declarations }
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    procedure _Update; override;
  end;

implementation
Uses
  ShellAPI;

{$R *.dfm}


Constructor TCoWordDocPanelProps.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
DragAcceptFiles(Handle, true);
Update;
end;

Destructor TCoWordDocPanelProps.Destroy;
begin
DragAcceptFiles(Handle, false);
Inherited;
end;

procedure TCoWordDocPanelProps._Update;
begin
with TCoWordDocFunctionality.Create(idCoComponent) do
try
edName.Text:=Name;
finally
Release;
end;
end;


procedure TCoWordDocPanelProps.LoadFromFile;
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
 then with TCoWordDocFunctionality.Create(idCoComponent) do
  try
  ProxySpace__Log_OperationStarting('file loading ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  ProxySpace__Log_OperationDone;
  end;
  finally
  Release;
  end;
end;

procedure TCoWordDocPanelProps.WMDropFiles(var Msg: TMessage);
var
  i,n: DWord;
  Size: DWord;
  FName: String;
  HDrop: DWord;
begin
HDrop:=Msg.WParam;
n:=DragQueryFile(HDrop,$FFFFFFFF,NIL,0);
for i:=0 to n-1 do begin
  Size:=DragQueryFile(HDrop,i,NIL,0);
  if Size < 255
   then begin
    SetLength(FName,Size);
    DragQueryFile(HDrop,i,@FName[1],Size + 1);
    //. loading data
    with TCoWordDocFunctionality.Create(idCoComponent) do
    try
    ProxySpace__Log_OperationStarting('file loading ...');
    try
    LoadFromFile(FName);
    finally
    ProxySpace__Log_OperationDone;
    end;
    finally
    Release;
    end;
    end;
  end;
Msg.Result:=0;
inherited;
end;

procedure TCoWordDocPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then with TCoWordDocFunctionality.Create(idCoComponent) do
  try
  Name:=edName.Text;
  finally
  Release;
  end;
end;

procedure TCoWordDocPanelProps.sbLoadFromFileClick(Sender: TObject);
begin
LoadFromFile;
end;


procedure TCoWordDocPanelProps.sbOpenClick(Sender: TObject);
begin
with TCoWordDocFunctionality.Create(idCoComponent) do
try
ProxySpace__Log_OperationStarting('document loading ...');
try
Open;
finally
ProxySpace__Log_OperationDone;
end;
finally
Release;
end;
end;

end.
