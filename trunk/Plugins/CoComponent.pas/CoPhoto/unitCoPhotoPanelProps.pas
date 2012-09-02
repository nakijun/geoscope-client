unit unitCoPhotoPanelProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FunctionalityImport, CoFunctionality, unitCoPhotoFunctionality, unitCoComponentRepresentations, StdCtrls, ExtCtrls, Buttons,
  jpeg;

type
  TCoPhotoPanelProps = class(TCoComponentPanelProps)
    OpenFileDialog: TOpenDialog;
    Panel1: TPanel;
    pnlTitle: TPanel;
    Image1: TImage;
    edName: TEdit;
    Label1: TLabel;
    sbLoadFromFile: TSpeedButton;
    ScrollBox1: TScrollBox;
    Image: TImage;
    stDataReseptor: TStaticText;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure sbLoadFromFileClick(Sender: TObject);
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


Constructor TCoPhotoPanelProps.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
pnlTitle.OnMouseDown:=OnMouseDown;
pnlTitle.OnDblClick:=OnDblClick;
DragAcceptFiles(Handle, true);
Update;
end;

Destructor TCoPhotoPanelProps.Destroy;
begin
DragAcceptFiles(Handle, false);
Inherited;
end;

procedure TCoPhotoPanelProps._Update;
const
  TempFolder = 'TempDATA';
var
  N: string;
  TempFile: string;
begin
with TCoPhotoFunctionality.Create(idCoComponent) do
try
N:=Name;
edName.Text:=N;
try
TempFile:=GetCurrentDir+'\'+TempFolder+'\'+N+'('+FormatDateTime('YYYYMMDDHHNNSSZZZ',Now)+')';
SaveToFile(TempFile);
Image.Picture.Graphic.LoadFromFile(TempFile);
except
  end;
finally
Release;
end;
end;


procedure TCoPhotoPanelProps.LoadFromFile;
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
 then with TCoPhotoFunctionality.Create(idCoComponent) do
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

procedure TCoPhotoPanelProps.WMDropFiles(var Msg: TMessage);
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
    with TCoPhotoFunctionality.Create(idCoComponent) do
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

procedure TCoPhotoPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then with TCoPhotoFunctionality.Create(idCoComponent) do
  try
  Name:=edName.Text;
  finally
  Release;
  end;
end;

procedure TCoPhotoPanelProps.sbLoadFromFileClick(Sender: TObject);
begin
LoadFromFile;
end;


end.
