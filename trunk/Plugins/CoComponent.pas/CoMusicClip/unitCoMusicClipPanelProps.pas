unit unitCoMusicClipPanelProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FunctionalityImport, unitCoMusicClipFunctionality, unitCoComponentRepresentations, StdCtrls, ExtCtrls, Buttons;

type
  TCoMusicClipPanelProps = class(TCoComponentPanelProps)
    edArtistName: TEdit;
    edCompositionName: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    sbLoadFromFile: TSpeedButton;
    OpenFileDialog: TOpenDialog;
    sbPlay: TSpeedButton;
    procedure edArtistNameKeyPress(Sender: TObject; var Key: Char);
    procedure edCompositionNameKeyPress(Sender: TObject; var Key: Char);
    procedure sbLoadFromFileClick(Sender: TObject);
    procedure sbPlayClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadFromFile;
  public
    { Public declarations }
    Constructor Create(const pidCoComponent: integer); override;
    procedure _Update; override;
  end;

implementation

{$R *.dfm}


Constructor TCoMusicClipPanelProps.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
Update;
end;

procedure TCoMusicClipPanelProps._Update;
begin
with TCoMusicClipFunctionality.Create(idCoComponent) do
try
edArtistName.Text:=ArtistName;
edCompositionName.Text:=CompositionName;
finally
Release;              
end;
end;


procedure TCoMusicClipPanelProps.LoadFromFile;
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
 then with TCoMusicClipFunctionality.Create(idCoComponent) do
  try
  /// ? Space.Log.OperationStarting('file saving ...');
  try
  LoadFromFile(OpenFileDialog.FileName);
  finally
  /// ? Space.Log.OperationDone;
  end;
  finally
  Release;
  end;
end;

procedure TCoMusicClipPanelProps.edArtistNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then with TCoMusicClipFunctionality.Create(idCoComponent) do
  try
  ArtistName:=edArtistName.Text;
  finally
  Release;
  end;
end;

procedure TCoMusicClipPanelProps.edCompositionNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then with TCoMusicClipFunctionality.Create(idCoComponent) do
  try
  CompositionName:=edCompositionName.Text;
  finally
  Release;
  end;
end;

procedure TCoMusicClipPanelProps.sbLoadFromFileClick(Sender: TObject);
begin
LoadFromFile;
end;


procedure TCoMusicClipPanelProps.sbPlayClick(Sender: TObject);
begin
with TCoMusicClipFunctionality.Create(idCoComponent) do
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
