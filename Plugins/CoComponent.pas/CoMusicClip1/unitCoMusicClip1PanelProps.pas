unit unitCoMusicClip1PanelProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FunctionalityImport, unitCoMusicClip1Functionality, unitCoComponentRepresentations, StdCtrls, ExtCtrls, Buttons;

type
  TCoMusicClip1PanelProps = class(TCoComponentPanelProps)
    edArtistName: TEdit;
    edCompositionName: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    sbLoadFromFile: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    sbPlay: TSpeedButton;
    stDataReseptor: TStaticText;
    procedure edArtistNameKeyPress(Sender: TObject; var Key: Char);
    procedure edCompositionNameKeyPress(Sender: TObject; var Key: Char);
    procedure sbLoadFromFileClick(Sender: TObject);
    procedure sbPlayClick(Sender: TObject);
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


Constructor TCoMusicClip1PanelProps.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
DragAcceptFiles(Handle, true);
Update;
end;

Destructor TCoMusicClip1PanelProps.Destroy;
begin
DragAcceptFiles(Handle, false);
Inherited;
end;

procedure TCoMusicClip1PanelProps._Update;
begin
with TCoMusicClip1Functionality.Create(idCoComponent) do
try
edArtistName.Text:=ArtistName;
edCompositionName.Text:=CompositionName;
finally
Release;
end;
end;


procedure TCoMusicClip1PanelProps.LoadFromFile;
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
 then with TCoMusicClip1Functionality.Create(idCoComponent) do
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

procedure TCoMusicClip1PanelProps.WMDropFiles(var Msg: TMessage);
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
    with TCoMusicClip1Functionality.Create(idCoComponent) do
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

procedure TCoMusicClip1PanelProps.edArtistNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then with TCoMusicClip1Functionality.Create(idCoComponent) do
  try
  ArtistName:=edArtistName.Text;
  finally
  Release;
  end;
end;

procedure TCoMusicClip1PanelProps.edCompositionNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then with TCoMusicClip1Functionality.Create(idCoComponent) do
  try
  CompositionName:=edCompositionName.Text;
  finally
  Release;
  end;
end;

procedure TCoMusicClip1PanelProps.sbLoadFromFileClick(Sender: TObject);
begin
LoadFromFile;
end;


procedure TCoMusicClip1PanelProps.sbPlayClick(Sender: TObject);
begin
with TCoMusicClip1Functionality.Create(idCoComponent) do
try
ProxySpace__Log_OperationStarting('clip loading ...');
try
Play;
finally
ProxySpace__Log_OperationDone;
end;
finally
Release;
end;
end;

end.
