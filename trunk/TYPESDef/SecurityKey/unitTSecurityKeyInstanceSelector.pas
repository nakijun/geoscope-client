unit unitTSecurityKeyInstanceSelector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  unitProxySpace, Functionality, TypesDefines, TypesFunctionality, ImgList, ComCtrls,
  ExtCtrls, StdCtrls, Buttons;

type
  TfmTSecurityKeyInstanceSelector = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lvInstanceList_ImageList: TImageList;
    lvInstanceList: TListView;
    edSecurityKeyContext: TEdit;
    sbCreateNewSecurityKey: TSpeedButton;
    sbCreateNewSecurityKeyAndInsertIntoOwnList: TSpeedButton;
    procedure lvInstanceListDblClick(Sender: TObject);
    procedure edSecurityKeyContextKeyPress(Sender: TObject; var Key: Char);
    procedure sbCreateNewSecurityKeyClick(Sender: TObject);
    procedure sbCreateNewSecurityKeyAndInsertIntoOwnListClick(
      Sender: TObject);
  private
    { Private declarations }
    flSelected: boolean;
  public
    { Public declarations }
    Constructor Create;
    procedure Update;
    function Select(out idInstance: integer): boolean;
  end;

implementation

{$R *.dfm}


Constructor TfmTSecurityKeyInstanceSelector.Create;
begin
Inherited Create(nil);
Update;
end;

procedure TfmTSecurityKeyInstanceSelector.Update;
var
  IL: TList;
  I: integer;
  idInstance: integer;
begin
lvInstanceList.Clear;
if edSecurityKeyContext.Text = '' then Exit; //. ->
lvInstanceList.Items.BeginUpdate;
try
with TTSecurityKeyFunctionality.Create do
try
GetInstanceListByContext(edSecurityKeyContext.Text, IL);
try
for I:=0 to IL.Count-1 do begin
  idInstance:=Integer(IL[I]);
  with lvInstanceList.Items.Add do begin
  Data:=Pointer(idInstance);
  with TSecurityKeyFunctionality(TComponentFunctionality_Create(idInstance)) do
  try
  Caption:=Name;
  ImageIndex:=0;
  SubItems.Add(Info);
  finally
  Release;
  end;
  end;
  end;
finally
IL.Destroy;
end;
finally
Release;
end;
finally
lvInstanceList.Items.EndUpdate;
end;
end;

function TfmTSecurityKeyInstanceSelector.Select(out idInstance: integer): boolean;
begin
Caption:='Select security key (mouse double click)';
flSelected:=false;
ShowModal;
Result:=false;
if flSelected
 then begin
  idInstance:=Integer(lvInstanceList.Selected.Data);
  Result:=true;
  end;
end;

procedure TfmTSecurityKeyInstanceSelector.lvInstanceListDblClick(Sender: TObject);
begin
if lvInstanceList.Selected <> nil
 then begin
  flSelected:=true;
  Close;
  end;
end;

procedure TfmTSecurityKeyInstanceSelector.edSecurityKeyContextKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D then Update;
end;

procedure TfmTSecurityKeyInstanceSelector.sbCreateNewSecurityKeyClick(Sender: TObject);
var
  idNewSecurityKey: integer;
  SF: boolean;
begin
if Application.MessageBox('create a new security-key ?','Question',MB_YESNO+MB_ICONQUESTION) <> mrYes then Exit; //. ->
//. creating
with TTSecurityKeyFunctionality.Create do
try
Sleep(3000);
idNewSecurityKey:=CreateInstance;
finally
Release;
end;
//.
ShowMessage('Attention !!! Now new security-key is created.'#$0D#$0A'Store "code" of the key. Any user operations on the new security-key is available though this code only.');
//. show props panel of the new security-key
with TComponentFunctionality_Create(idTSecurityKey,idNewSecurityKey) do
try
flUserSecurityDisabled:=true;
with TPanelProps_Create(false,0,nil,nilObject) do
try
Position:=poScreenCenter;
flFreeOnClose:=false;
ShowModal;
finally
Destroy;
end;
finally
Release;
end;
//. updating list
with lvInstanceList.Items.Add do begin
Data:=Pointer(idNewSecurityKey);
with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,idNewSecurityKey)) do
try
Caption:=Name;
ImageIndex:=0;
SubItems.Add(Info);
finally
Release;
end;
lvInstanceList.SetFocus;
Focused:=true;
Selected:=true;
end;
end;

procedure TfmTSecurityKeyInstanceSelector.sbCreateNewSecurityKeyAndInsertIntoOwnListClick(Sender: TObject);
var
  idNewSecurityKey: integer;
  SF: boolean;
begin
if Application.MessageBox('create and add a new security-key ?','Question',MB_YESNO+MB_ICONQUESTION) <> mrYes then Exit; //. ->
//. creating
with TTSecurityKeyFunctionality.Create do
try
Sleep(3000);
idNewSecurityKey:=CreateInstance;
finally
Release;
end;
//. insert into the keys list
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,TypesSystem.Space.UserID)) do
try
SF:=flUserSecurityDisabled;
try
flUserSecurityDisabled:=true;
SecurityKeys_Insert(idNewSecurityKey);
finally
flUserSecurityDisabled:=SF;
end;
finally
Release;
end;
//.
ShowMessage('Attention !!! Now new security-key is created.'#$0D#$0A'Store "code" of the key. Any user operations on the new security-key is available though this code only.');
//. show props panel of the new security-key
with TComponentFunctionality_Create(idTSecurityKey,idNewSecurityKey) do
try
flUserSecurityDisabled:=true;
with TPanelProps_Create(false,0,nil,nilObject) do
try
Position:=poScreenCenter;
flFreeOnClose:=false;
ShowModal;
finally
Destroy;
end;
finally
Release;
end;
//. updating list
with lvInstanceList.Items.Add do begin
Data:=Pointer(idNewSecurityKey);
with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,idNewSecurityKey)) do
try
Caption:=Name;
ImageIndex:=0;
SubItems.Add(Info);
finally
Release;
end;
lvInstanceList.SetFocus;
Focused:=true;
Selected:=true;
end;
end;

end.
