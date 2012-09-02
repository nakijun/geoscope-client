unit unitCoMusicCollectionPanelProps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FunctionalityImport, CoFunctionality, unitCoComponentRepresentations, unitCoMusicCollectionFunctionality,
  unitCoMusicClipFunctionality, StdCtrls, ExtCtrls, Buttons,
  ComCtrls, ImgList, ShellAPI;

type
  TCoMusicCollectionPanelProps = class(TCoComponentPanelProps)
    pnlTitle: TPanel;
    Image1: TImage;
    edName: TEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    lvClips: TListView;
    ImageList: TImageList;
    sbPlaySelected: TSpeedButton;
    lvResult_bbMarkAll: TBitBtn;
    lvResult_bbClearAll: TBitBtn;
    bbPlayInWinAmp: TBitBtn;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure sbPlaySelectedClick(Sender: TObject);
    procedure lvResult_bbMarkAllClick(Sender: TObject);
    procedure lvResult_bbClearAllClick(Sender: TObject);
    procedure bbPlayInWinAmpClick(Sender: TObject);
  private
    { Private declarations }
    procedure lvClips_PlayMarkedInWinAmp;
  public
    { Public declarations }
    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    procedure _Update; override;
    procedure lvClips_Update;
    procedure lvClips_MarkAll;
    procedure lvClips_ClearAll;
  end;

implementation

{$R *.dfm}


Constructor TCoMusicCollectionPanelProps.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
Update;
end;

Destructor TCoMusicCollectionPanelProps.Destroy;
begin
Inherited;
end;

procedure TCoMusicCollectionPanelProps._Update;
begin
pnlTitle.OnDblClick:=OnDblClick;
//.
with TCoMusicCollectionFunctionality.Create(idCoComponent) do
try         
edName.Text:=Name;
finally
Release;
end;
lvClips_Update;
end;

procedure TCoMusicCollectionPanelProps.lvClips_Update;
var
  CL: TList;
  I: integer;
begin
lvClips.Clear;
ProxySpace__Log_OperationStarting('collection loading ...');
try
lvClips.Items.BeginUpdate;
try
with TCoMusicCollectionFunctionality.Create(idCoComponent) do
try
GetClipsList(CL);
try
for I:=0 to CL.Count-1 do with TCoMusicClipAbstractFunctionality(CoComponentTypesSystem.TCoComponentFunctionality_Create(Integer(CL[I]))) do
  try
  with lvClips.Items.Add do begin
  Data:=Pointer(Integer(CL[I]));
  Caption:=ArtistName;
  SubItems.Add(CompositionName);
  ImageIndex:=0;
  end;
  finally
  Release;
  end;
finally
CL.Destroy;
end;
finally
Release;
end;
finally
lvClips.Items.EndUpdate;
end;
finally
ProxySpace__Log_OperationDone;
end;
end;

procedure TCoMusicCollectionPanelProps.lvClips_MarkAll;
var
  I: integer;
begin
with lvClips do
for I:=0 to Items.Count-1 do Items[I].Checked:=true;
end;

procedure TCoMusicCollectionPanelProps.lvClips_ClearAll;
var
  I: integer;
begin
with lvClips do
for I:=0 to Items.Count-1 do Items[I].Checked:=false;
end;

procedure TCoMusicCollectionPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then with TCoMusicCollectionFunctionality.Create(idCoComponent) do
  try
  Name:=edName.Text;
  finally
  Release;
  end;
end;

procedure TCoMusicCollectionPanelProps.lvClips_PlayMarkedInWinAmp;

  function GetEnvVar(const VarName: string): string;
  var
    I: integer;
  begin
  Result:='';
  try
  I:=GetEnvironmentVariable(PChar(VarName), nil, 0);
  if I > 0
   then begin
    SetLength(Result, I);
    GetEnvironmentVariable(Pchar(VarName), PChar(Result), I);
    SetLength(Result, Length(Result)-1);
    end;
  except
    Result:='';
    end;
  end;

const
  TempFolder = 'TempDATA';
  WM_WA_IPC = WM_USER;
  IPC_PLAYFILE = 100;
  IPC_DELETE = 101;
  WINAMP_BUTTON2         = 40045;
  WINAMP_BUTTON3         = 40046;
  WINAMP_BUTTON4         = 40047;
  WinAmpClassName = 'Winamp v1.x';
var
  H: THandle;
  cds: TCOPYDATASTRUCT;
  I: integer;
  FileName: string;
begin
ProxySpace__Log_OperationStarting('clip loading ...');
try
H:=FindWindow(WinAmpClassName,0);
if (H = 0)
 then
  if (ShellExecute(0,0,PChar(String(GetEnvVar('ProgramFiles')+'\WinAmp\WinAmp.exe')),PChar('/CLASS="Winamp v1.x"'),0,SW_MINIMIZE) > 32)
   then SLEEP(1000)
   else Raise Exception.Create('could not start WinAmp'); //. =>
H:=FindWindow(WinAmpClassName,0);
if H = 0 then Raise Exception.Create('could not find WinAmp'); //. =>
//. do playlist
SendMessage(H, WM_COMMAND, WINAMP_BUTTON4,0); //. stop current
SendMessage(H ,WM_WA_IPC, 0,IPC_DELETE);
with lvClips do
for I:=0 to Items.Count-1 do if Items[I].Checked then with TCoMusicClipAbstractFunctionality(CoComponentTypesSystem.TCoComponentFunctionality_Create(Integer(Items[I].Data))) do
  try
  FileName:=GetCurrentDir+'\'+TempFolder+'\'+ArtistName+' - '+CompositionName;
  try
  SaveToFile(FileName);
  cds.dwData:=IPC_PLAYFILE;
  cds.lpData:=PChar(FileName);
  cds.cbData:=strlen(cds.lpData)+1;
  SendMessage(H ,WM_COPYDATA, WPARAM (0),LPARAM (@cds));
  except
    end;
  finally
  Release;
  end;
//. play
SendMessage(H, WM_COMMAND, WINAMP_BUTTON2,0);
finally
ProxySpace__Log_OperationDone;
end;
end;

procedure TCoMusicCollectionPanelProps.sbPlaySelectedClick(Sender: TObject);
begin
if lvClips.Selected = nil then Exit; //. ->
with TCoMusicClipAbstractFunctionality(CoComponentTypesSystem.TCoComponentFunctionality_Create(Integer(lvClips.Selected.Data))) do
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

procedure TCoMusicCollectionPanelProps.lvResult_bbMarkAllClick(Sender: TObject);
begin
lvClips_MarkAll;
end;

procedure TCoMusicCollectionPanelProps.lvResult_bbClearAllClick(Sender: TObject);
begin
lvClips_ClearAll;
end;

procedure TCoMusicCollectionPanelProps.bbPlayInWinAmpClick(Sender: TObject);
begin
lvClips_PlayMarkedInWinAmp;
end;

end.
