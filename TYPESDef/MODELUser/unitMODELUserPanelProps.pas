unit unitMODELUserPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  ImgList, ComCtrls, Menus;

const
  OnlineUserMaxDelay = (60{seconds}/(3600*24));
type
  TMODELUserPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    edName: TEdit;
    Label3: TLabel;
    edPassword: TEdit;
    edPasswordConfirmation: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label4: TLabel;
    lvSecurityKeys: TListView;
    lvInstanceList_ImageList: TImageList;
    lvInstanceList_Popup: TPopupMenu;
    InsertnewKey1: TMenuItem;
    DeleteselectedKey1: TMenuItem;
    Clickifyousure1: TMenuItem;
    Label5: TLabel;
    sbSecurityFileForCloneChange: TSpeedButton;
    Label6: TLabel;
    edFullName: TEdit;
    lbSecurityFileForClone: TLabel;
    edContactInfo: TEdit;
    Label7: TLabel;
    sbMessageBoards: TSpeedButton;
    imgUserActiveState: TImage;
    UserStateUpdater: TTimer;
    imgUserInactiveState: TImage;
    lbUserStateInfo: TLabel;
    sbChatWithUser: TSpeedButton;
    Label8: TLabel;
    edMaxDATASize: TEdit;
    Label9: TLabel;
    edDATASize: TEdit;
    cbEnabled: TCheckBox;
    sbSecurityFileForClonePropsPanel: TSpeedButton;
    Label10: TLabel;
    edMaxSpaceSquare: TEdit;
    Label11: TLabel;
    edSpaceSquare: TEdit;
    Label12: TLabel;
    edMaxSpaceSquarePerObject: TEdit;
    GroupBox1: TGroupBox;
    edSecurityKeyCode: TEdit;
    Label14: TLabel;
    sbAddSecurityKey: TSpeedButton;
    sbRemoveSecurityKey: TSpeedButton;
    sbCreateSecurityKey: TSpeedButton;
    Label13: TLabel;
    Label15: TLabel;
    sbStartComponent: TSpeedButton;
    sbStartComponentPopup: TPopupMenu;
    copyfromclipboard1: TMenuItem;
    clear1: TMenuItem;
    Label17: TLabel;
    lbSecurityFileForPrivate: TLabel;
    sbSecurityFileForPrivatePropsPanel: TSpeedButton;
    sbSecurityFileForPrivateChange: TSpeedButton;
    sbServerFolder: TSpeedButton;
    lbUserTitle: TLabel;
    GroupBox2: TGroupBox;
    edDomains: TEdit;
    cbTaskEnabled: TCheckBox;
    Label16: TLabel;
    btnUserAccount: TBitBtn;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure InsertnewKey1Click(Sender: TObject);
    procedure Clickifyousure1Click(Sender: TObject);
    procedure edFullNameKeyPress(Sender: TObject; var Key: Char);
    procedure sbSecurityFileForCloneChangeClick(Sender: TObject);
    procedure edContactInfoKeyPress(Sender: TObject; var Key: Char);
    procedure sbMessageBoardsClick(Sender: TObject);
    procedure UserStateUpdaterTimer(Sender: TObject);
    procedure sbChatWithUserClick(Sender: TObject);
    procedure edMaxDATASizeKeyPress(Sender: TObject; var Key: Char);
    procedure cbEnabledClick(Sender: TObject);
    procedure sbSecurityFileForClonePropsPanelClick(Sender: TObject);
    procedure edMaxSpaceSquareKeyPress(Sender: TObject; var Key: Char);
    procedure edMaxSpaceSquarePerObjectKeyPress(Sender: TObject;
      var Key: Char);
    procedure sbAddSecurityKeyClick(Sender: TObject);
    procedure sbRemoveSecurityKeyClick(Sender: TObject);
    procedure sbCreateSecurityKeyClick(Sender: TObject);
    procedure sbStartComponentClick(Sender: TObject);
    procedure copyfromclipboard1Click(Sender: TObject);
    procedure clear1Click(Sender: TObject);
    procedure sbSecurityFileForPrivateChangeClick(Sender: TObject);
    procedure sbSecurityFileForPrivatePropsPanelClick(Sender: TObject);
    procedure sbServerFolderClick(Sender: TObject);
    procedure edDomainsKeyPress(Sender: TObject; var Key: Char);
    procedure cbTaskEnabledClick(Sender: TObject);
    procedure btnUserAccountClick(Sender: TObject);
  private
    { Private declarations }

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure AddSecurityKeyByCode(const Code: shortstring);
    procedure RemoveSecurityKeyByCode(const Code: shortstring);
    procedure CreateAndAddSecurityKey;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure UpdateUserStateInfo;
    procedure lvSecurityKeys_Update;
    procedure lvSecurityKeys_InsertNew;
    procedure lvSecurityKeys_DeleteSelected;
  end;

implementation
Uses
  unitTSecurityFileInstanceSelector,
  unitTSecurityKeyInstanceSelector,
  unitMODELUserMessageBoards,
  unitNewSecurityKeyPanelProps,
  unitSecurityKeyPanelProps,
  unitUserChat,
  unitMODELUserServerFolderPanel,
  unitMODELUserBillingAccountPanel;

{$R *.DFM}

Constructor TMODELUserPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TMODELUserPanelProps.Destroy;
begin
Inherited;
end;

procedure TMODELUserPanelProps._Update;
var
  idTStartObj: integer;
  idStartObj: integer;
begin
Inherited;
//.
cbEnabled.Checked:=NOT TMODELUserFunctionality(ObjFunctionality).Disabled;
cbTaskEnabled.Checked:=TMODELUserFunctionality(ObjFunctionality).TaskEnabled;
try
if TMODELUserFunctionality(ObjFunctionality).idObj = ObjFunctionality.Space.UserID
 then
  cbEnabled.Enabled:=false
 else begin
  cbEnabled.Enabled:=true;
  end;
except
  cbEnabled.Enabled:=false;
  end;
edName.Text:=TMODELUserFunctionality(ObjFunctionality).Name;
lbUserTitle.Caption:=edName.Text+' [ID: '+IntToStr(ObjFunctionality.idObj)+']';
edFullName.Text:=TMODELUserFunctionality(ObjFunctionality).FullName;
edContactInfo.Text:=TMODELUserFunctionality(ObjFunctionality).ContactInfo;
edPassword.Text:='          '; edPasswordConfirmation.Text:=edPassword.Text;
edMaxDATASize.Text:=IntToStr(TMODELUserFunctionality(ObjFunctionality).MaxDATASize);
edDATASize.Text:=IntToStr(TMODELUserFunctionality(ObjFunctionality).DATASize);
edMaxSpaceSquare.Text:=IntToStr(TMODELUserFunctionality(ObjFunctionality).MaxSpaceSquare);
edSpaceSquare.Text:=FormatFloat('000.0000',TMODELUserFunctionality(ObjFunctionality).SpaceSquare);
edMaxSpaceSquarePerObject.Text:=IntToStr(TMODELUserFunctionality(ObjFunctionality).MaxSpaceSquarePerObject);
if TMODELUserFunctionality(ObjFunctionality).idSecurityFileForClone <> 0
 then with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,TMODELUserFunctionality(ObjFunctionality).idSecurityFileForClone)) do
  try
  lbSecurityFileForClone.Caption:=Name;
  finally
  Release;
  end;
if TMODELUserFunctionality(ObjFunctionality).idSecurityFileForPrivate <> 0
 then
  try
  with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,TMODELUserFunctionality(ObjFunctionality).idSecurityFileForPrivate)) do
  try
  lbSecurityFileForPrivate.Caption:=Name;
  finally
  Release;
  end;
  except
    On E: Exception do lbSecurityFileForPrivate.Caption:=E.Message;
    end;
TMODELUserFunctionality(ObjFunctionality).GetStartObj(idTStartObj,idStartObj);
if idStartObj <> 0
 then with TComponentFunctionality_Create(idTStartObj,idStartObj) do
  try
  sbStartComponent.Caption:=Name;
  finally
  Release;
  end
 else
  sbStartComponent.Caption:='[empty]';
//.
lvSecurityKeys_Update;
//.
edDomains.Text:=TMODELUserFunctionality(ObjFunctionality).Domains;
//.
UpdateUserStateInfo;
//.
if (TMODELUserFunctionality(ObjFunctionality).IsUserOnline(OnlineUserMaxDelay))
 then begin
  imgUserInactiveState.Hide;
  imgUserActiveState.Show;
  end
 else begin
  imgUserActiveState.Hide;
  imgUserInactiveState.Show;
  end;
end;

procedure TMODELUserPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TMODELUserPanelProps.Controls_ClearPropData;
begin
edName.Text:='';
edFullName.Text:='';
edPassword.Text:='';
edPasswordConfirmation.Text:='';
lbSecurityFileForClone.Caption:='';
end;

procedure TMODELUserPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TMODELUserFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TMODELUserPanelProps.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  if edPassword.Text <> edPasswordConfirmation.Text then Raise Exception.Create('password confirmation is differ for user password'); //. =>
  Updater.Disable;
  try
  TMODELUserFunctionality(ObjFunctionality).Password:=edPassword.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TMODELUserPanelProps.lvSecurityKeys_Update;
var
  Keys: TList;
  I: integer;
begin
lvSecurityKeys.Clear;
lvSecurityKeys.Items.BeginUpdate;
try
TMODELUserFunctionality(ObjFunctionality).GetSecurityKeysList(Keys);
try
for I:=0 to Keys.Count-1 do with lvSecurityKeys.Items.Add do begin
  Data:=Pointer(Integer(Keys[I]));
  with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,Integer(Keys[I]))) do
  try
  Caption:=Name;
  ImageIndex:=0;
  SubItems.Add(Info);
  finally
  Release;
  end;
  end;
finally
Keys.Destroy;
end;
finally
lvSecurityKeys.Items.EndUpdate;
end;
end;

procedure TMODELUserPanelProps.lvSecurityKeys_InsertNew;
var
  idNewKey: integer;
  R: boolean;
begin
with TfmTSecurityKeyInstanceSelector.Create do
try
R:=Select(idNewKey);
finally
Destroy;
end;

if NOT R then Exit; //. ->

Updater.Disable;
try
TMODELUserFunctionality(ObjFunctionality).SecurityKeys_Insert(idNewKey);
except
  Updater.Enabled;
  Raise; //.=>
  end;
with lvSecurityKeys.Items.Add do begin
Data:=Pointer(idNewKey);
with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,idNewKey)) do
try
Caption:=Name;
ImageIndex:=0;
SubItems.Add(Info);
finally
Release;
end;
Selected:=true;
end;
end;

procedure TMODELUserPanelProps.lvSecurityKeys_DeleteSelected;
begin
if lvSecurityKeys.Selected = nil then Exit; //. ->
Updater.Disable;
try
TMODELUserFunctionality(ObjFunctionality).SecurityKeys_Delete(Integer(lvSecurityKeys.Selected.Data));
except
  Updater.Enabled;
  Raise; //.=>
  end;
lvSecurityKeys.Selected.Delete;
end;

procedure TMODELUserPanelProps.InsertnewKey1Click(Sender: TObject);
begin
lvSecurityKeys_InsertNew;
end;

procedure TMODELUserPanelProps.Clickifyousure1Click(Sender: TObject);
begin
lvSecurityKeys_DeleteSelected;
end;

procedure TMODELUserPanelProps.edFullNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TMODELUserFunctionality(ObjFunctionality).FullName:=edFullName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TMODELUserPanelProps.edContactInfoKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TMODELUserFunctionality(ObjFunctionality).ContactInfo:=edContactInfo.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TMODELUserPanelProps.sbSecurityFileForCloneChangeClick(Sender: TObject);
var
  idNewFile: integer;
  R: boolean;
begin
with TfmTSecurityFileInstanceSelector.Create do
try
R:=Select(idNewFile);
finally
Destroy;
end;
if NOT R then Exit; //. ->
TMODELUserFunctionality(ObjFunctionality).idSecurityFileForClone:=idNewFile;
end;

procedure TMODELUserPanelProps.sbSecurityFileForPrivateChangeClick(Sender: TObject);
var
  idNewFile: integer;
  R: boolean;
begin
with TfmTSecurityFileInstanceSelector.Create do
try
R:=Select(idNewFile);
finally
Destroy;
end;
if NOT R then Exit; //. ->
TMODELUserFunctionality(ObjFunctionality).idSecurityFileForPrivate:=idNewFile;
end;

procedure TMODELUserPanelProps.sbMessageBoardsClick(Sender: TObject);
begin
with TfmMODELUserMessageBoards.Create(ObjFunctionality.idObj) do
try
ShowModal;
finally
Destroy;
end;
end;

procedure TMODELUserPanelProps.UpdateUserStateInfo;
var
  ProxySpaceID: integer;
  ProxySpaceIP: widestring;
  ProxySpaceState: integer;
  Params: WideString;
begin
try
imgUserInactiveState.Hide;
imgUserActiveState.Hide;
{/// ? ObjFunctionality.Space.GlobalSpaceManager.QueryInterface(IID_ISpaceReportsProvider, SpaceReportsProvider);
if SpaceReportsProvider = nil
 then begin
  lbUserStateInfo.Caption:='cant get the user state info';
  imgUserActiveState.Hide;
  Exit; //. ->
  end;{
{/////ObjFunctionality.Space.GetSecurityParams(Params);
if SpaceReportsProvider.GetActiveUserInfo(ObjFunctionality.idObj, ProxySpaceID,ProxySpaceIP,ProxySpaceState, Params)
 then begin
  lbUserStateInfo.Caption:='user is Active (proxyspace ip - '+ProxySpaceIP+')';
  imgUserInactiveState.Hide;
  imgUserActiveState.Show;
  end
 else begin
  lbUserStateInfo.Caption:='user is inactive';
  imgUserActiveState.Hide;
  imgUserInactiveState.Show;
  end;}
except
  end;
end;

procedure TMODELUserPanelProps.UserStateUpdaterTimer(Sender: TObject);
begin
UpdateUserStateInfo;
end;

procedure TMODELUserPanelProps.sbChatWithUserClick(Sender: TObject);
begin
GetUserChatBox(ObjFunctionality.idObj);
end;


procedure TMODELUserPanelProps.edMaxDATASizeKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TMODELUserFunctionality(ObjFunctionality).MaxDATASize:=StrToInt(edMaxDATASize.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TMODELUserPanelProps.edMaxSpaceSquareKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TMODELUserFunctionality(ObjFunctionality).MaxSpaceSquare:=StrToInt(edMaxSpaceSquare.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TMODELUserPanelProps.edMaxSpaceSquarePerObjectKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TMODELUserFunctionality(ObjFunctionality).MaxSpaceSquarePerObject:=StrToInt(edMaxSpaceSquarePerObject.Text);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TMODELUserPanelProps.cbEnabledClick(Sender: TObject);
begin
if NOT flUpdating
 then begin
  Updater.Disable;
  try
  TMODELUserFunctionality(ObjFunctionality).Disabled:=NOT cbEnabled.Checked;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TMODELUserPanelProps.cbTaskEnabledClick(Sender: TObject);
begin
if (NOT flUpdating)
 then begin
  Updater.Disable();
  try
  TMODELUserFunctionality(ObjFunctionality).TaskEnabled:=cbTaskEnabled.Checked;
  except
    Updater.Enabled();
    Raise; //.=>
    end;
  end;
end;

procedure TMODELUserPanelProps.sbSecurityFileForClonePropsPanelClick(Sender: TObject);
begin
with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,TMODELUserFunctionality(ObjFunctionality).idSecurityFileForClone)) do
try
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poDefault;
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TMODELUserPanelProps.sbSecurityFileForPrivatePropsPanelClick(Sender: TObject);
begin
with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,TMODELUserFunctionality(ObjFunctionality).idSecurityFileForPrivate)) do
try
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poDefault;
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TMODELUserPanelProps.edDomainsKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then begin
  Updater.Disable();
  try
  TMODELUserFunctionality(ObjFunctionality).Domains:=edDomains.Text;
  except
    Updater.Enabled();
    Raise; //.=>
    end;
  end;
end;

procedure TMODELUserPanelProps.AddSecurityKeyByCode(const Code: shortstring);
begin
if Application.MessageBox('add security-key by code?','Question',MB_YESNO+MB_ICONQUESTION) <> mrYes then Exit; //. ->
TMODELUserFunctionality(ObjFunctionality).SecurityKeys_AddKeyByCode(Code);
end;

procedure TMODELUserPanelProps.RemoveSecurityKeyByCode(const Code: shortstring);
begin
if Application.MessageBox('remove security-key by code?','Question',MB_YESNO+MB_ICONQUESTION) <> mrYes then Exit; //. ->
TMODELUserFunctionality(ObjFunctionality).SecurityKeys_RemoveKeyByCode(Code);
end;

procedure TMODELUserPanelProps.CreateAndAddSecurityKey;
var
  idNewSecurityKey: integer;
  KeyName: shortstring;
  KeyInfo: shortstring;
  KeyCode: WideString;
begin
if Application.MessageBox('create and add a new security-key ?','Question',MB_YESNO+MB_ICONQUESTION) <> mrYes then Exit; //. ->
with TNewSecurityKeyPanelProps.Create do
try
if NOT Accept(KeyName,KeyInfo) then Exit; //. ->
finally
Destroy;
end;
idNewSecurityKey:=TMODELUserFunctionality(ObjFunctionality).SecurityKeys_CreateAndAddNewKey(KeyName,KeyInfo, KeyCode);
//.
ShowMessage('Attention !!! Now new security-key is created.'#$0D#$0A'Store "code" of the key. Any user operations on the new security-key is available though this code only.');
//. show props panel of the new security-key
with TComponentFunctionality_Create(idTSecurityKey,idNewSecurityKey) do
try
with TSecurityKeyPanelProps(TPanelProps_Create(false,0,nil,nilObject)) do
try
edCode.Text:=KeyCode;
Position:=poScreenCenter;
flFreeOnClose:=false;
ShowModal;
finally
Destroy;
end;
finally
Release;
end;
//.
lvSecurityKeys_Update;
end;

procedure TMODELUserPanelProps.sbAddSecurityKeyClick(Sender: TObject);
begin
AddSecurityKeyByCode(edSecurityKeyCode.Text);
end;

procedure TMODELUserPanelProps.sbRemoveSecurityKeyClick(Sender: TObject);
begin
RemoveSecurityKeyByCode(edSecurityKeyCode.Text);
end;

procedure TMODELUserPanelProps.sbCreateSecurityKeyClick(Sender: TObject);
begin
CreateAndAddSecurityKey;
end;

procedure TMODELUserPanelProps.sbStartComponentClick(Sender: TObject);
var
  idTStartObj: integer;
  idStartObj: integer;
begin
TMODELUserFunctionality(ObjFunctionality).GetStartObj(idTStartObj,idStartObj);
if idStartObj = 0 then Raise Exception.Create('start component is empty'); //. =>
with TComponentFunctionality_Create(idTStartObj,idStartObj) do
try
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TMODELUserPanelProps.copyfromclipboard1Click(Sender: TObject);
begin
if NOT TypesSystem.ClipBoard_flExist then Raise Exception.Create('clipboard is empty'); //. =>
TMODELUserFunctionality(ObjFunctionality).SetStartObj(TypesSystem.ClipBoard_Instance_idTObj,TypesSystem.ClipBoard_Instance_idObj);
end;

procedure TMODELUserPanelProps.clear1Click(Sender: TObject);
begin
if Application.MessageBox('Do you want to empty start component','Confirmation',MB_YESNO) <> idYes then Exit; //. ->
TMODELUserFunctionality(ObjFunctionality).SetStartObj(0,0);
end;

procedure TMODELUserPanelProps.sbServerFolderClick(Sender: TObject);
begin
with TfmMODELUserServerFolderPanel.Create(ObjFunctionality.idObj) do Show();
end;

procedure TMODELUserPanelProps.btnUserAccountClick(Sender: TObject);
var
  SC: TCursor;
begin
with TfmMODELUserBillingAccountPanel.Create(ObjFunctionality.Space.SOAPServerURL,ObjFunctionality.Space.UserName,ObjFunctionality.Space.UserPassword,ObjFunctionality.idObj) do
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Update();
finally
Screen.Cursor:=SC;
end;
ShowModal();
finally
Destroy();
end;
end;

end.
