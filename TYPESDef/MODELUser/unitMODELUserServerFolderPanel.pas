unit unitMODELUserServerFolderPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfmMODELUserServerFolderPanel = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edPath: TEdit;
    Panel2: TPanel;
    btnShowServerURL: TBitBtn;
    lbFolder: TListBox;
    memoSelectedItemURL: TMemo;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbFolderClick(Sender: TObject);
    procedure lbFolderDblClick(Sender: TObject);
    procedure btnShowServerURLClick(Sender: TObject);
  private
    { Private declarations }
    idMODELUser: integer;
    lvFolder_CurrentPath: string;
    lvFolder_SubFoldersCount: integer;
    lvFolder_SelectedItemURL: string;

    function CalculateURL(const RelativePath: string): string;
  public
    { Public declarations }
    Constructor Create(const pidMODELUser: integer);
    procedure Update; reintroduce;
  end;


implementation
uses
  ShellAPI,
  GlobalSpaceDefines,
  unitProxySpace,
  Functionality,
  TypesDefines,
  TypesFunctionality;

{$R *.dfm}


Constructor TfmMODELUserServerFolderPanel.Create(const pidMODELUser: integer);
begin
Inherited Create(nil);
idMODELUser:=pidMODELUser;
lvFolder_CurrentPath:='';
lvFolder_SubFoldersCount:=0;
lvFolder_SelectedItemURL:='';
Update();
end;

procedure TfmMODELUserServerFolderPanel.Update;
var
  SubFoldersList,FilesList: WideString;
  I: integer;
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idMODELUser)) do
try
ServerFolder_GetSubFoldersList(lvFolder_CurrentPath,{out} SubFoldersList);
ServerFolder_GetFilesList(lvFolder_CurrentPath,{out} FilesList);
lbFolder.Items.BeginUpdate;
try
lbFolder.Items.Clear();
if (lvFolder_CurrentPath <> '')
 then lbFolder.Items.Text:='..'+#$0D#$0A+SubFoldersList
 else lbFolder.Items.Text:=SubFoldersList;
for I:=0 to lbFolder.Items.Count-1 do lbFolder.Items[I]:='['+ANSIUpperCase(lbFolder.Items[I])+']';
lvFolder_SubFoldersCount:=lbFolder.Items.Count;
lbFolder.Items.Text:=lbFolder.Items.Text+FilesList;
finally
lbFolder.Items.EndUpdate;
end;
lvFolder_SelectedItemURL:=CalculateURL(lvFolder_CurrentPath);
memoSelectedItemURL.Lines.Text:=lvFolder_SelectedItemURL;
finally
Release;
end;
end;

function TfmMODELUserServerFolderPanel.CalculateURL(const RelativePath: string): string;
var
  ServerAddress: string;
begin
ServerAddress:=ProxySpace.SOAPServerURL;
SetLength(ServerAddress,Pos(ANSIUpperCase('SpaceSOAPServer.dll'),ANSIUpperCase(ProxySpace.SOAPServerURL))-2);
Result:=ServerAddress+'/'+'Space'+'/'+'0'{URL protocol version}+'/'+'TypesSystem'+'/'+IntToStr(idTMODELUser)+'/'+'Co'+'/'+IntToStr(idMODELUser)+'/'+'Folder';
if (RelativePath <> '') then Result:=Result+RelativePath;
end;

procedure TfmMODELUserServerFolderPanel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

function PrepareItemName(const FN: string): string;
var
  I: integer;
begin
Result:='';
for I:=1 to Length(FN) do if (NOT (FN[I] in ['[',']'])) then Result:=Result+FN[I];
end;

procedure TfmMODELUserServerFolderPanel.lbFolderClick(Sender: TObject);
begin
if ((lbFolder.ItemIndex <> -1) AND (lbFolder.Items[lbFolder.ItemIndex] <> '[..]'))
 then begin
  lvFolder_SelectedItemURL:=CalculateURL(lvFolder_CurrentPath+'/'+PrepareItemName(lbFolder.Items[lbFolder.ItemIndex]));
  memoSelectedItemURL.Lines.Text:=lvFolder_SelectedItemURL;
  end;
end;

procedure TfmMODELUserServerFolderPanel.lbFolderDblClick(Sender: TObject);
var
  LP: string;
begin
if ((lbFolder.ItemIndex <> -1) AND (lbFolder.ItemIndex < lvFolder_SubFoldersCount))
 then begin
  LP:=lvFolder_CurrentPath;
  try 
  if (lbFolder.Items[lbFolder.ItemIndex] <> '[..]')
   then lvFolder_CurrentPath:=lvFolder_CurrentPath+'/'+PrepareItemName(lbFolder.Items[lbFolder.ItemIndex])
   else SetLength(lvFolder_CurrentPath,LastDelimiter('/',lvFolder_CurrentPath)-1);
  Update();
  except
    lvFolder_CurrentPath:=LP;
    Raise; //. =>
    end;
  edPath.Text:=lvFolder_CurrentPath;
  lvFolder_SelectedItemURL:=CalculateURL(lvFolder_CurrentPath);
  memoSelectedItemURL.Lines.Text:=lvFolder_SelectedItemURL;
  end;
end;

procedure TfmMODELUserServerFolderPanel.btnShowServerURLClick(Sender: TObject);
begin
ShellExecute(0,'open',PChar(lvFolder_SelectedItemURL),nil,nil, SW_SHOWNORMAL);
end;

end.
