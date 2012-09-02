unit unitMODELServersHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, unitProxySpace,
  Dialogs, ComCtrls, ImgList, StdCtrls, Buttons;

const
  HistoryFileName = 'ServersHistory.cfg';
type
  TMODELServersHistoryItem = packed record
    Name: shortstring;
    URL: shortstring;
    SpaceID: integer;
    Info: shortstring;
    UserName: shortstring;
    UserPassword: shortstring;
    Time: TDateTime;
  end;

  TMODELServersHistory = class
  public
    FileName: string;
    MaxLength: integer;

    Constructor Create;
    Destructor Destroy; override;
    procedure Clear;
    procedure LoadTo(List: TListView); overload;
    procedure LoadTo(SL: TStringList); overload;
    function GetItem(const Index: integer; out ServerURL: WideString; out ServerSpaceID: integer; out UserName,UserPassword: WideString): boolean;
    function GetLast(out ServerURL: WideString; out ServerSpaceID: integer; out UserName,UserPassword: WideString): boolean;
    procedure Insert(const ServerName: string; const ServerURL: string; const ServerSpaceID: integer; const ServerInfo: string; const pUserName: shortstring; const pUserPassword: shortstring);
    function Remove(const Index: integer;  out ServerName: string; out ServerURL: string; out ServerSpaceID: integer; out ServerInfo: string; out oUserName: shortstring; out oUserPassword: shortstring): boolean;
  end;

  TfmMODELServersHistory = class(TForm)
    lvHistory: TListView;
    lvHistory_ImageList: TImageList;
    bbConnectToSelectedServer: TBitBtn;
    bbDeleteSelectedServer: TBitBtn;
    bbClearHistory: TBitBtn;
    procedure bbConnectToSelectedServerClick(Sender: TObject);
    procedure bbDeleteSelectedServerClick(Sender: TObject);
    procedure bbClearHistoryClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Space: TProxySpace;
  public
    { Public declarations }
    Constructor Create(const pSpace: TProxySpace);
    procedure Update;
  end;


var
  fmMODELServersHistory: TfmMODELServersHistory;
implementation
Uses
  ShellAPI;

{$R *.dfm}



{TMODELServersHistory}
Constructor TMODELServersHistory.Create;
begin
Inherited Create;
FileName:=HistoryFileName;
MaxLength:=1000000;
end;

Destructor TMODELServersHistory.Destroy;
begin
Inherited;
end;

procedure TMODELServersHistory.LoadTo(List: TListView);
var
  HF: File of TMODELServersHistoryItem;
  Item: TMODELServersHistoryItem;
begin
List.Clear;
if FileExists(FileName)
 then begin
  AssignFile(HF,FileName); Reset(HF);
  try
  List.Items.BeginUpdate;
  try
  with List do
  while NOT EOF(HF) do begin
    Read(HF,Item);
    with Items.Add do begin
    Caption:='soap'; /// ? Item.Name;
    ItemIndex:=0;
    SubItems.Add(Item.URL);
    SubItems.Add(Item.Info);
    SubItems.Add(Item.UserName);
    SubItems.Add(FormatDateTime('YY-MM-DD HH:NN',Item.Time));
    end;
    end;
  finally
  List.Items.EndUpdate;
  end;
  finally
  CloseFile(HF);
  end;
  end;
end;

procedure TMODELServersHistory.LoadTo(SL: TStringList);
var
  HF: File of TMODELServersHistoryItem;
  Item: TMODELServersHistoryItem;
begin
if FileExists(FileName)
 then begin
  AssignFile(HF,FileName); Reset(HF);
  try
  SL.Clear;
  while NOT EOF(HF) do begin
    Read(HF,Item);
    SL.Add(Item.Info+'  '+Item.URL+'/'+Item.UserName+' ['+FormatDateTime('YY-MM-DD HH:NN',Item.Time)+']');
    end;
  finally
  CloseFile(HF);
  end;
  end;
end;

function TMODELServersHistory.GetItem(const Index: integer; out ServerURL: WideString; out ServerSpaceID: integer; out UserName,UserPassword: WideString): boolean;
var
  HF: File of TMODELServersHistoryItem;
  I: integer;
  Item: TMODELServersHistoryItem;
begin
Result:=false;
if FileExists(FileName)
 then begin
  AssignFile(HF,FileName); Reset(HF);
  try
  I:=0;
  while (NOT EOF(HF)) do begin
    Read(HF,Item);
    ServerURL:=Item.URL;
    ServerSpaceID:=Item.SpaceID;
    UserName:=Item.UserName;
    UserPassword:=Item.UserPassword;
    if (I = Index)
     then begin
      Result:=true;
      Exit; //. ->
      end;
    //. next item
    Inc(I);
    end;
  finally
  CloseFile(HF);
  end;
  end;
end;

function TMODELServersHistory.GetLast(out ServerURL: WideString; out ServerSpaceID: integer; out UserName,UserPassword: WideString): boolean;
var
  HF: File of TMODELServersHistoryItem;
  Item: TMODELServersHistoryItem;
begin
Result:=false;
if FileExists(FileName)
 then begin
  AssignFile(HF,FileName); Reset(HF);
  try
  if NOT EOF(HF)
   then begin
    Read(HF,Item);
    ServerURL:=Item.URL;
    ServerSpaceID:=Item.SpaceID;
    UserName:=Item.UserName;
    UserPassword:=Item.UserPassword;
    Result:=true;
    Exit; //. ->
    end;
  finally
  CloseFile(HF);
  end;
  end;
end;

procedure TMODELServersHistory.Clear;
begin
DeleteFile(FileName);
end;

procedure TMODELServersHistory.Insert(const ServerName: string; const ServerURL: string; const ServerSpaceID: integer; const ServerInfo: string; const pUserName: shortstring; const pUserPassword: shortstring);
var
  HistoryFile: string;
  TempFileName: string;
  _File,NewFile: File of TMODELServersHistoryItem;
  WriteItem,Item: TMODELServersHistoryItem;
  I: integer;
begin
HistoryFile:=FileName;
if FileExists(HistoryFile)
 then begin
  AssignFile(_File,HistoryFile);
  Reset(_File);
  TempFileName:=HistoryFile+'.temp';
  AssignFile(NewFile,TempFileName);
  ReWrite(NewFile);
  try
  with WriteItem do begin
  Name:=ServerName;
  URL:=ServerURL;
  SpaceID:=ServerSpaceID;
  Info:=ServerInfo;
  UserName:=pUserName;
  UserPassword:=pUserPassword;
  Time:=Now;
  end;
  Write(NewFile,WriteItem);
  I:=0;
  while NOT EOF(_File) do begin
    Read(_File,Item);
    if NOT ((Item.URL = WriteItem.URL) AND (Item.SpaceID = WriteItem.SpaceID) AND (Item.UserName = WriteItem.UserName) AND (Item.UserPassword = WriteItem.UserPassword))
     then Write(NewFile,Item)
     else WriteItem.URL:='';
    Inc(I);
    if I >= MaxLength then Break; //. >
    end;
  finally
  CloseFile(NewFile);
  CloseFile(_File);
  end;
  DeleteFile(HistoryFile);
  RenameFile(TempFileName,HistoryFile);
  end
 else begin
  AssignFile(NewFile,HistoryFile);
  ReWrite(NewFile);
  try
  with Item do begin
  Name:=ServerName;
  URL:=ServerURL;
  SpaceID:=ServerSpaceID;
  Info:=ServerInfo;
  UserName:=pUserName;
  UserPassword:=pUserPassword;
  Time:=Now;
  end;
  Write(NewFile,Item);
  finally
  CloseFile(NewFile);
  end;
  end;
end;

function TMODELServersHistory.Remove(const Index: integer;  out ServerName: string; out ServerURL: string; out ServerSpaceID: integer; out ServerInfo: string; out oUserName: shortstring; out oUserPassword: shortstring): boolean;
var
  HistoryFile: string;
  TempFileName: string;
  _File,NewFile: File of TMODELServersHistoryItem;
  Item: TMODELServersHistoryItem;
  I: integer;
begin
Result:=false;
HistoryFile:=FileName;
if FileExists(HistoryFile)
 then begin
  AssignFile(_File,HistoryFile);
  Reset(_File);
  TempFileName:=HistoryFile+'.temp';
  AssignFile(NewFile,TempFileName);
  ReWrite(NewFile);
  try
  I:=0;
  while NOT EOF(_File) do begin
    Read(_File,Item);
    if I = Index
     then with Item do begin
      ServerName:=Name;
      ServerURL:=URL;
      ServerSpaceID:=SpaceID;
      ServerInfo:=Info;
      oUserName:=UserName;
      oUserPassword:=UserPassword;
      Result:=true;
      end
     else
      Write(NewFile,Item);
    Inc(I);
    end;
  finally
  CloseFile(NewFile);
  CloseFile(_File);
  end;
  DeleteFile(HistoryFile);
  RenameFile(TempFileName,HistoryFile);
  end;
end;



{TfmMODELSerevrsHistory}
Constructor TfmMODELServersHistory.Create(const pSpace: TProxySpace);
begin
Inherited Create(nil);
Space:=pSpace;
Update;
end;

procedure TfmMODELServersHistory.Update;
begin
with TMODELServersHistory.Create do
try
LoadTo(lvHistory);
finally
Destroy;
end;
end;


procedure TfmMODELServersHistory.bbConnectToSelectedServerClick(Sender: TObject);
var
  ServerName: string;
  ServerURL: string;
  ServerSpaceID: integer;
  ServerInfo: string;
  UserName: shortstring;
  UserPassword: shortstring;

  Cmd,Prms: string;
begin
if lvHistory.Selected = nil then Exit; //. ->
with TMODELServersHistory.Create do
try
Remove(lvHistory.Selected.Index,ServerName,ServerURL,ServerSpaceID,ServerInfo,UserName,UserPassword);
Insert(ServerName,ServerURL,ServerSpaceID,ServerInfo,UserName,UserPassword);
LoadTo(lvHistory);
finally
Destroy;
end;
//.
Cmd:=ExtractFileName(ParamStr(0));
Prms:=ServerURL+' '+UserName+' '+UserPassword;
//.
try Space.Free; except end;
//.
ShellExecute(0,nil,PChar(Cmd),PChar(Prms),nil, SW_SHOW);
//.
TerminateProcess(GetCurrentProcess,0);
end;

procedure TfmMODELServersHistory.bbDeleteSelectedServerClick(Sender: TObject);
var
  ServerName: string;
  ServerURL: string;
  ServerSpaceID: integer;
  ServerInfo: string;
  UserName: shortstring;
  UserPassword: shortstring;
begin
if lvHistory.Selected = nil then Exit; //. ->
with TMODELServersHistory.Create do
try
Remove(lvHistory.Selected.Index,ServerName,ServerURL,ServerSpaceID,ServerInfo,UserName,UserPassword);
LoadTo(lvHistory);
finally
Destroy;
end;
end;

procedure TfmMODELServersHistory.bbClearHistoryClick(Sender: TObject);
begin
if MessageDlg('Clear history ?', mtConfirmation , [mbYes,mbNo], 0) = mrYes
 then with TMODELServersHistory.Create do
  try
  Clear;
  LoadTo(lvHistory);
  finally
  Destroy;
  end;
end;


procedure TfmMODELServersHistory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

end.
