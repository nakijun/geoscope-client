unit unitUserKeysSelector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ImgList, ComCtrls;

type
  TfmUserKeysSelector = class(TForm)
    lvUsers: TListView;
    lvUserKeys: TListView;
    ImageList: TImageList;
    Label2: TLabel;
    edUserName: TEdit;
    Label1: TLabel;
    sbAccept: TSpeedButton;
    sbClose: TSpeedButton;
    procedure edUserNameKeyPress(Sender: TObject; var Key: Char);
    procedure lvUsersSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure sbAcceptClick(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Editor: TObject;
    SelectedUserID: integer;
    
    procedure Find(const UserNameContext: string);
    procedure lvUsers_UpdateItem(const ixItem: integer);
    procedure lvUserKeys_Update(const idUser: integer);
    procedure Accept;
  public
    { Public declarations }
    Constructor Create(const pEditor: TObject);
  end;


implementation
Uses
  Functionality,TypesDefines,TypesFunctionality, unitSecurityFileEditor;

{$R *.dfm}

Constructor TfmUserKeysSelector.Create(const pEditor: TObject);
begin
Inherited Create(nil);
Editor:=pEditor;
SelectedUserID:=0;
end;

procedure TfmUserKeysSelector.Find(const UserNameContext: string);
var
  IL: TList;
  I: integer;
  idInstance: integer;
  SC: TCursor;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
with lvUsers do begin
Items.BeginUpdate;
try
Items.Clear;
with TTMODELUserFunctionality.Create do
try
GetInstanceListByContext(UserNameContext, IL);
try
for I:=0 to IL.Count-1 do begin
  idInstance:=Integer(IL[I]);
  with Items.Add do begin
  Data:=Pointer(idInstance);
  SubItems.Add(''); 
  lvUsers_UpdateItem(Index);
  end;
  end;
finally
IL.Destroy;
end;
finally
Release;
end;
finally
Items.EndUpdate;
end;
end;
finally
Screen.Cursor:=SC;
end;
SelectedUserID:=0;
lvUserKeys.Clear;
end;

procedure TfmUserKeysSelector.lvUsers_UpdateItem(const ixItem: integer);
begin
with lvUsers.Items[ixItem] do
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,Integer(Data))) do
try
Caption:=Name;
SubItems[0]:=FullName;
ImageIndex:=0;
finally
Release;
end;
end;

procedure TfmUserKeysSelector.lvUserKeys_Update(const idUser: integer);
var
  Keys: TList;
  I: integer;
  Users: TList;
begin
lvUserKeys.Clear;
lvUserKeys.Items.BeginUpdate;
try
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUSer,idUser)) do
try
GetSecurityKeysList(Keys);
try
for I:=0 to Keys.Count-1 do with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,Integer(Integer(Keys[I])))) do
  try
  GetAssotiatedUsers(Users);
  try
  if Users.Count = 1
   then with lvUserKeys.Items.Add do begin
    Data:=Pointer(idObj);
    Caption:=Name;
    ImageIndex:=1;
    SubItems.Add(Info);
    end;
  finally
  Users.Destroy;
  end;
  finally
  Release;
  end;
finally
Keys.Destroy;
end;
finally
Release;
end;
finally
lvUserKeys.Items.EndUpdate;
end;
if lvUserKeys.Items.Count > 0 then lvUserKeys.Items[0].Checked:=true;
end;

procedure TfmUserKeysSelector.Accept;
var
  I: integer;
  Keys: TList;
begin
if SelectedUserID = 0 then Raise Exception.Create('there is no user selected'); //. =>
Keys:=TList.Create;
try
for I:=0 to lvUserKeys.Items.Count-1 do if lvUserKeys.Items[I].Checked then Keys.Add(Pointer(Integer(lvUserKeys.Items[I].Data)));
if Keys.Count > 0
 then TfmSecurityFileEditor(Editor).SelectedOperation_AddUserKeys(SelectedUserID,Keys)
 else Raise Exception.Create('no security key(s) selected'); //. =>
finally
Keys.Destroy;
end;
end;

procedure TfmUserKeysSelector.edUserNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D then Find(edUserName.Text);
end;

procedure TfmUserKeysSelector.lvUsersSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  SC: TCursor;
begin
SelectedUserID:=Integer(Item.Data);
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
lvUserKeys_Update(SelectedUserID);
finally
Screen.Cursor:=SC
end;
end;


procedure TfmUserKeysSelector.sbAcceptClick(Sender: TObject);
begin
Accept;
end;

procedure TfmUserKeysSelector.sbCloseClick(Sender: TObject);
begin
Close;
end;

procedure TfmUserKeysSelector.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfmUserKeysSelector.FormCreate(Sender: TObject);
begin
Left:=Round(Screen.Width/2)-Width;
Top:=Round((Screen.Height-Height)/2);
end;

end.
