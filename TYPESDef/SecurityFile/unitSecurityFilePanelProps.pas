unit unitSecurityFilePanelProps;

interface

uses
  GlobalSpaceDefines, UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, DBClient, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  ComCtrls, ImgList, Menus;

const
  tvSecurityFile_OperationsIndex = 0;
  tvSecurityFile_OperationLevel = 1;
  tvSecurityFile_KeyLevel = 2;
type                                 
  TSecurityFilePanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Image1: TImage;
    edName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edInfo: TEdit;
    tvSecurityFile: TTreeView;
    Label3: TLabel;
    tvSecurityFile_ImageList: TImageList;
    tvSecurityFile_Popup: TPopupMenu;
    InsertOperation1: TMenuItem;
    InsertKey1: TMenuItem;
    DeleteSelected1: TMenuItem;
    Clickifyousure1: TMenuItem;
    Bevel1: TBevel;
    UpdateDatabase1: TMenuItem;
    AssotiatedUsers1: TMenuItem;
    sbCreateNew: TSpeedButton;
    sbEdit: TSpeedButton;
    sbShowAssotiatedComponents: TSpeedButton;
    Label4: TLabel;
    edID: TEdit;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure edInfoKeyPress(Sender: TObject; var Key: Char);
    procedure InsertOperation1Click(Sender: TObject);
    procedure InsertKey1Click(Sender: TObject);
    procedure Clickifyousure1Click(Sender: TObject);
    procedure UpdateDatabase1Click(Sender: TObject);
    procedure AssotiatedUsers1Click(Sender: TObject);
    procedure sbCreateNewClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbShowAssotiatedComponentsClick(Sender: TObject);
  private
    { Private declarations }
    tvSecurityFile_flChanged: boolean;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure SecurityOperation_ShowAssotiatedUsers(OperationItem: TTreeNode);
    procedure SecurityKey_ShowAssotiatedUsers(const idSecurityKey: integer);
    procedure CreateNewDescendant;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;

    procedure tvSecurityFile_Update;
    procedure tvSecurityFile_Save;
    procedure tvSecurityFile_InsertNewOperation;
    procedure tvSecurityFile_InsertNewKey;
    procedure tvSecurityFile_DeleteSelected;
  end;


implementation
Uses
  unitSecurityFileFunctionality,
  unitTSecurityComponentOperationInstanceSelector,
  unitTSecurityKeyInstanceSelector,
  unitTMODELUserInstanceSelector,
  unitSecurityFileEditor,
  unitSecurityFileAssotiatedSecurityComponents;

{$R *.DFM}

Constructor TSecurityFilePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TSecurityFilePanelProps.Destroy;
begin
Inherited;
end;

procedure TSecurityFilePanelProps._Update;
begin
Inherited;
with TSecurityFileFunctionality(ObjFunctionality) do begin
edName.Text:=Name;
edID.Text:=IntToStr(idObj);
edInfo.Text:=Info;
end;
tvSecurityFile_Update;
end;


procedure TSecurityFilePanelProps.tvSecurityFile_Update;
var
  SecurityFileDATA: TClientBlobStream;
  idOperation: integer;
  OperationItem: TTreeNode;
  KeysCount: integer;
  I: integer;
  idKey: integer;
  KeyItem: TTreeNode;
begin
tvSecurityFile.Items[tvSecurityFile_OperationsIndex].DeleteChildren;
tvSecurityFile.Items.BeginUpdate;
try
if TSecurityFileFunctionality(ObjFunctionality).GetDATA(SecurityFileDATA)
 then
  try
  with TSecurityFile.Create(SecurityFileDATA) do
  try
  while NOT EOF do begin
    ReadOperationID(idOperation);
    with TSecurityComponentOperationFunctionality(TComponentFunctionality_Create(idTSecurityComponentOperation,idOperation)) do
    try
    OperationItem:=tvSecurityFile.Items.AddChild(tvSecurityFile.Items[tvSecurityFile_OperationsIndex], Name+' ('+SQLInfo+'...)');
    OperationItem.Data:=Pointer(idOperation);
    OperationItem.ImageIndex:=0;
    OperationItem.SelectedIndex:=OperationItem.ImageIndex;
    ReadKeysCount(KeysCount);
    for I:=0 to KeysCount-1 do begin
      ReadKeyID(idKey);
      with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,idKey)) do
      try
      KeyItem:=tvSecurityFile.Items.AddChild(OperationItem, Name);
      KeyItem.Data:=Pointer(idKey);
      KeyItem.ImageIndex:=1;
      KeyItem.SelectedIndex:=KeyItem.ImageIndex;
      finally
      Release;
      end;
    end;
    finally
    Release;
    end;
    end;
  finally
  Destroy;
  end;
  finally
  SecurityFileDATA.Destroy;
  end;
finally
tvSecurityFile.Items.EndUpdate;
end;
tvSecurityFile.Items[tvSecurityFile_OperationsIndex].Expand(false);
tvSecurityFile_flChanged:=false;
end;

procedure TSecurityFilePanelProps.tvSecurityFile_Save;
var
  SecurityFile: TSecurityFile;
  I: integer;
  idOperation: integer;
  J: integer;
  idKey: integer;
begin
SecurityFile:=TSecurityFile.Create;
with SecurityFile do
try
//. security file object preparing
with tvSecurityFile.Items[tvSecurityFile_OperationsIndex] do
for I:=0 to Count-1 do with Item[I] do begin
  idOperation:=Integer(Data);
  WriteOperationID(idOperation);
  WriteKeysCount(Count);
  for J:=0 to Count-1 do begin
    idKey:=Integer(Item[J].Data);
    WriteKeyID(idKey);
    end;
  end;
//. storing
Updater.Disable;
try
TSecurityFileFunctionality(ObjFunctionality).SetDATA(SecurityFile);
except
  Updater.Enabled;
  Raise; //.=>
  end;
//.
finally
Destroy;
end;
tvSecurityFile_flChanged:=false;
end;

procedure TSecurityFilePanelProps.tvSecurityFile_InsertNewOperation;
var
  idNewOperation: integer;
  R: boolean;
  NewOperationItem: TTreeNode;
begin
//. operation selecting
with TfmTSecurityComponentOperationInstanceSelector.Create do
try
R:=Select(idNewOperation);
finally
Destroy;
end;

if NOT R then Exit; //. ->

//. creating
with TSecurityComponentOperationFunctionality(TComponentFunctionality_Create(idTSecurityComponentOperation,idNewOperation)) do
try
NewOperationItem:=tvSecurityFile.Items.AddChild(tvSecurityFile.Items[tvSecurityFile_OperationsIndex], Name+' ('+SQLInfo+'...)');
NewOperationItem.Data:=Pointer(idNewOperation);
NewOperationItem.ImageIndex:=0;
NewOperationItem.SelectedIndex:=NewOperationItem.ImageIndex;
finally
Release;
end;
tvSecurityFile.Selected:=NewOperationItem;
tvSecurityFile_flChanged:=true;
end;

procedure TSecurityFilePanelProps.tvSecurityFile_InsertNewKey;
var
  OperationItem: TTreeNode;
  R: boolean;
  idNewKey: integer;
  NewKeyItem: TTreeNode;
begin
if tvSecurityFile.Selected = nil then Raise Exception.Create('no selected item'); //. =>
if tvSecurityFile.Selected.Level <> tvSecurityFile_OperationLevel then Raise Exception.Create('no selected operation'); //. =>
OperationItem:=tvSecurityFile.Selected;

with TfmTSecurityKeyInstanceSelector.Create do
try
R:=Select(idNewKey);
finally
Destroy;
end;

if NOT R then Exit; //. ->

//. creating
with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,idNewKey)) do
try
NewKeyItem:=tvSecurityFile.Items.AddChild(OperationItem, Name);
NewKeyItem.Data:=Pointer(idNewKey);
NewKeyItem.ImageIndex:=1;
NewKeyItem.SelectedIndex:=NewKeyItem.ImageIndex;
finally
Release;
end;
tvSecurityFile.Selected:=NewKeyItem;
tvSecurityFile_flChanged:=true;
end;

procedure TSecurityFilePanelProps.tvSecurityFile_DeleteSelected;
begin
if tvSecurityFile.Selected = nil then Exit; //. ->
case tvSecurityFile.Selected.Level of
tvSecurityFile_OperationLevel,tvSecurityFile_KeyLevel: begin
  //. check user own key
  if (tvSecurityFile.Selected.Level = tvSecurityFile_KeyLevel) AND (Integer(tvSecurityFile.Selected.Parent.Data) = idChangeSecurityOperation) 
   then with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,ObjFunctionality.Space.UserID)) do
    try
    if SecurityKeys_IsKeyExist(Integer(tvSecurityFile.Selected.Data)) then Raise Exception.Create('you could not delete your own security key'); //. =>
    finally
    Release;
    end;
  //.
  tvSecurityFile.Selected.Delete;
  tvSecurityFile_flChanged:=true;
  end;
end;
end;

procedure TSecurityFilePanelProps.SecurityOperation_ShowAssotiatedUsers(OperationItem: TTreeNode);
var
  AssotiatedUsers,AllAssotiatedUsers: TList;
  I,J: integer;
  idSecurityKey: integer;
begin
with OperationItem do begin
AllAssotiatedUsers:=TList.Create;
try
for I:=0 to Count-1 do begin
  idSecurityKey:=Integer(Item[I].Data);
  with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,idSecurityKey)) do
  try
  GetAssotiatedUsers(AssotiatedUsers);
  try
  for J:=0 to AssotiatedUsers.Count-1 do AllAssotiatedUsers.Add(AssotiatedUsers[J]);
  finally
  AssotiatedUsers.Destroy;
  end;
  finally
  Release;
  end;
  end;
//. output
if AllAssotiatedUsers.Count > 0
 then
  if AllAssotiatedUsers.Count > 1
   then with TfmTMODELUserInstanceSelector.Create do
    try
    for I:=0 to AllAssotiatedUsers.Count-1 do AddUser(Integer(AllAssotiatedUsers[I]));
    Show;
    except
      Destroy;
      Raise; //. =>
      end
    else with TComponentFunctionality_Create(idTMODELUSer,Integer(AllAssotiatedUsers[0])) do
    try
    with TPanelProps_Create(false, 0,nil,nilObject) do begin
    Position:=poDefault;
    Position:=poScreenCenter;
    Show;
    end;
    finally
    Release;
    end
  else
   ShowMessage('all users assotiated');
finally
AllAssotiatedUsers.Destroy;
end
end;
end;

procedure TSecurityFilePanelProps.SecurityKey_ShowAssotiatedUsers(const idSecurityKey: integer);
var
  AssotiatedUsers: TList;
  I: integer;
begin
with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,idSecurityKey)) do
try
GetAssotiatedUsers(AssotiatedUsers);
try
if AssotiatedUsers.Count > 0
 then
  if AssotiatedUsers.Count > 1
   then with TfmTMODELUserInstanceSelector.Create do
    try
    for I:=0 to AssotiatedUsers.Count-1 do AddUser(Integer(AssotiatedUsers[I]));
    Show;
    except
      Destroy;
      Raise; //. =>
      end
    else with TComponentFunctionality_Create(idTMODELUSer,Integer(AssotiatedUsers[0])) do
    try
    with TPanelProps_Create(false, 0,nil,nilObject) do begin
    Position:=poDefault;
    Position:=poScreenCenter;
    Show;
    end;
    finally
    Release;
    end
  else
   ShowMessage('all users assotiated');
finally
AssotiatedUsers.Destroy;
end;
finally
Release;
end;
end;

procedure TSecurityFilePanelProps.CreateNewDescendant;
var
  VCL: TComponentsList;
  RX,RY: TCrd;
  EO: Exception;
begin
with TypesSystem do begin
if Reflector = nil then Raise Exception.Create('Reflector is nil'); //. =>
if NOT ObjectIsInheritedFrom(Reflector,TReflector) then Raise Exception.Create('Reflector is not a TReflector type'); //. =>
PostMessage(Reflector.Handle, WM_BEGINCREATEOBJECT, ObjFunctionality.idTObj,ObjFunctionality.idObj);
end;
end;

procedure TSecurityFilePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TSecurityFilePanelProps.Controls_ClearPropData;
begin
end;

procedure TSecurityFilePanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TSecurityFileFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TSecurityFilePanelProps.edInfoKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TSecurityFileFunctionality(ObjFunctionality).Info:=edInfo.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TSecurityFilePanelProps.InsertOperation1Click(Sender: TObject);
begin
tvSecurityFile_InsertNewOperation;
end;

procedure TSecurityFilePanelProps.InsertKey1Click(Sender: TObject);
begin
tvSecurityFile_InsertNewKey;
end;

procedure TSecurityFilePanelProps.Clickifyousure1Click(Sender: TObject);
begin
tvSecurityFile_DeleteSelected;
end;

procedure TSecurityFilePanelProps.UpdateDatabase1Click(Sender: TObject);
begin
tvSecurityFile_Save;
ShowMessage('Database updated.');
end;

procedure TSecurityFilePanelProps.AssotiatedUsers1Click(Sender: TObject);
begin
if tvSecurityFile.Selected = nil then Exit; //. ->
case tvSecurityFile.Selected.Level of
tvSecurityFile_OperationLevel: SecurityOperation_ShowAssotiatedUsers(tvSecurityFile.Selected);
tvSecurityFile_KeyLevel: SecurityKey_ShowAssotiatedUsers(Integer(tvSecurityFile.Selected.Data));
end;
end;

procedure TSecurityFilePanelProps.sbCreateNewClick(Sender: TObject);
begin
if MessageDlg('Are you really want to create new security file based on current ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes
 then begin
  CreateNewDescendant;
  Close;
  end;
end;

procedure TSecurityFilePanelProps.sbEditClick(Sender: TObject);
var
  fm: TfmSecurityFileEditor;
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
fm:=TfmSecurityFileEditor.Create(ObjFunctionality.idObj);
finally
Screen.Cursor:=SC;
end;
with fm do 
try
ShowModal;
finally
Destroy;
end;
end;

procedure TSecurityFilePanelProps.sbShowAssotiatedComponentsClick(
  Sender: TObject);
begin
with TfmSecurityFileAssotiatedSecurityComponents.Create(ObjFunctionality.Space,ObjFunctionality.idObj) do Show;
end;

end.
