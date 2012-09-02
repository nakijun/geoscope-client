unit unitCoPluginPanelProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FunctionalityImport, unitCoPluginFunctionality, unitCoComponentRepresentations, StdCtrls, ExtCtrls, Buttons;

type
  TCoPluginPanelProps = class(TCoComponentPanelProps)
    edName: TEdit;
    edInfo: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    sbLoadFromFile: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    sbLoad: TSpeedButton;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure edInfoKeyPress(Sender: TObject; var Key: Char);
    procedure sbLoadFromFileClick(Sender: TObject);
    procedure sbLoadClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadFromFile;
  public
    { Public declarations }
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    procedure _Update; override;
  end;

implementation

{$R *.dfm}


Constructor TCoPluginPanelProps.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
Update;
end;

Destructor TCoPluginPanelProps.Destroy;
begin
Inherited;
end;

procedure TCoPluginPanelProps._Update;
begin
with TCoPluginFunctionality.Create(idCoComponent) do
try
edName.Text:=Name;
edInfo.Text:=Info;
finally
Release;
end;
end;


procedure TCoPluginPanelProps.LoadFromFile;
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
 then with TCoPluginFunctionality.Create(idCoComponent) do
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

procedure TCoPluginPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then with TCoPluginFunctionality.Create(idCoComponent) do
  try
  Name:=edName.Text;
  finally
  Release;
  end;
end;

procedure TCoPluginPanelProps.edInfoKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then with TCoPluginFunctionality.Create(idCoComponent) do
  try
  Info:=edInfo.Text;
  finally
  Release;
  end;
end;

procedure TCoPluginPanelProps.sbLoadFromFileClick(Sender: TObject);
begin
LoadFromFile;
end;


procedure TCoPluginPanelProps.sbLoadClick(Sender: TObject);
begin
with TCoPluginFunctionality.Create(idCoComponent) do
try
ProxySpace__Log_OperationStarting('plugin loading ...');
try
Load;
finally
ProxySpace__Log_OperationDone;
end;
ShowMessage('Plugin <'+Name+'> loaded successfully.');
finally
Release;
end;
end;

end.
