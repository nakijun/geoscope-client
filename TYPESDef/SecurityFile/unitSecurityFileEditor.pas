unit unitSecurityFileEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DBClient,
  Dialogs, unitProxySpace, Functionality, TypesDefines, TypesFunctionality, unitSecurityFileFunctionality,
  ComCtrls, ImgList, Buttons, StdCtrls, ExtCtrls, RxGIF;

type
  TOperationUsers = class;
  TOperationKeys = class;

  TOperation = class
  private
    idOperation: integer;
    OperationName: shortstring;
    Users: TOperationUsers;
    Keys: TOperationKeys;

    Constructor Create(const pidOperation: integer);
    Destructor Destroy; override;
    procedure GetKeys(out oKeys: TList);
    procedure GetUsersHasSameKeys(const Keys: TList; out oUsers: TList);
    procedure RemoveKeys(const pKeys: TList);
  end;

  TOperationUser = class
  private
    idUser: integer;
    UserName: shortstring;
    FullUserName: shortstring;
    SecurityKeys: TList;

    Constructor Create(const pidUser: integer);
    Destructor Destroy; override;
    function IsKeyExist(const pidSecurityKey: integer): boolean;
    procedure AddKey(const pidSecurityKey: integer);
  end;

  TOperationUsers = class
  private
    Operation: TOperation;
    List: TList;

    Constructor Create(const pOperation: TOperation);
    Destructor Destroy; override;
    procedure Clear;
    procedure AddUserKey(const pidUser: integer; const pidSecurityKey: integer);
  end;

  TOperationKey = class
  private
    idKey: integer;
    KeyName: shortstring;
    Users: TList;

    Constructor Create(const pidKey: integer; var vUsers: TList);
    Destructor Destroy; override;
    function IsUserExist(const pidUser: integer): boolean;
    procedure AddUser(const pidUser: integer);
  end;

  TOperationKeys = class
  private
    Operation: TOperation;
    List: TList;

    Constructor Create(const pOperation: TOperation);
    Destructor Destroy; override;
    procedure Clear;
    procedure AddKey(const pidSecurityKey: integer; var vUsers: TList);
  end;

  TOperations = class
  private
    List: TList;

    Constructor Create;
    Destructor Destroy; override;
    procedure Clear;
    function IsOperationExist(const pidOperation: integer): boolean;

    function AddOperation(const idNewOperation: integer): TOperation;
    procedure RemoveOperation(const pOperation: TOperation);
    procedure AddOperationKey(const pidOperation: integer; const pidSecurityKey: integer);
  end;

  TUserName = record
    idUser: integer;
    Name: shortstring;
    FullName: shortstring;
  end;

  TUserNames = class
  private
    List: TList;

    Constructor Create;
    Destructor Destroy; override;
    procedure Clear;
    function GetUserName(const pidUser: integer; out oUserName: shortstring; out oUserFullName: shortstring): boolean;
    procedure AddUser(const pidUser: integer; const pUserName: shortstring; const pUserFullName: shortstring);
  end;

  TfmSecurityFileEditor = class(TForm)
    lvOperations: TListView;
    ImageList: TImageList;
    sbAddOperation: TSpeedButton;
    sbRemoveSelectedOperationUser: TSpeedButton;
    sbRemoveSelectedOperation: TSpeedButton;
    sbAddOperationUser: TSpeedButton;
    StaticText1: TStaticText;
    sbDoAndClose: TSpeedButton;
    tvOperationKeys: TTreeView;
    StaticText4: TStaticText;
    sbRemoveOperationKey: TSpeedButton;
    sbAddOperationKey: TSpeedButton;
    StaticText2: TStaticText;
    tvOperationUsers: TTreeView;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel4: TBevel;
    imgBackground: TImage;
    Label3: TLabel;
    StaticText3: TStaticText;
    tvResult: TTreeView;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Bevel5: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    tvOperationUsers_pnlAnyUser: TPanel;
    Image5: TImage;
    Label8: TLabel;
    edSecurityFileName: TEdit;
    procedure lvOperationsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure sbAddOperationClick(Sender: TObject);
    procedure sbRemoveSelectedOperationClick(Sender: TObject);
    procedure sbAddOperationUserClick(Sender: TObject);
    procedure sbRemoveSelectedOperationUserClick(Sender: TObject);
    procedure sbDoAndCloseClick(Sender: TObject);
    procedure tvOperationKeysClick(Sender: TObject);
    procedure sbRemoveOperationKeyClick(Sender: TObject);
    procedure tvOperationUsersClick(Sender: TObject);
    procedure sbAddOperationKeyClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure tvResultExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure tvResultClick(Sender: TObject);
  private
    { Private declarations }
    idSecurityFile: integer;
    UserNames: TUserNames;
    Operations: TOperations;
    SelectedOperation: TOperation;
    SelectedUser: TOperationUser;
    SelectedKey: TOperationKey;
    flChanged: boolean;
    flClone: boolean;
    CloneSecurityFileID: integer;

    procedure lvOperations_Update;
    procedure tvOperationUsers_UpdateBySelectedOperation;
    procedure tvOperationKeys_UpdateBySelectedOperation;
    procedure tvOperationKeys_InsertNewKey;
    procedure tvResult_Update;
    procedure AddOperation;
    procedure UpdateControls;
  public
    { Public declarations }
    Constructor Create(const pidSecurityFile: integer);
    Destructor Destroy; override;
    function CloneAndSet(out idCloneSecurityFile: integer): boolean;
    procedure Load;
    procedure Check;
    procedure SaveTo(const idSF: integer);
    procedure DoCloneAndSet;
    procedure SelectedOperation_AddUserKeys(const idUser: integer; const Keys: TList);
    function SelectedUser_Remove: boolean;
    function SelectedUser_RemoveKey(const idKey: integer): boolean;
    function SelectedKey_Remove: boolean;
  end;

implementation
Uses
  unitTSecurityComponentOperationInstanceSelector,
  unitUserKeysSelector,
  unitTSecurityKeyInstanceSelector;

{$R *.dfm}


{TOperation}
Constructor TOperation.Create(const pidOperation: integer);
begin
Inherited Create;
idOperation:=pidOperation;
with TSecurityComponentOperationFunctionality(TComponentFunctionality_Create(idTSecurityComponentOperation,idOperation)) do
try
OperationName:=Name;
finally
Release;
end;
Users:=TOperationUsers.Create(Self);
Keys:=TOperationKeys.Create(Self);
end;

Destructor TOperation.Destroy;
begin
Keys.Free;
Users.Free;
Inherited;
end;

procedure TOperation.GetKeys(out oKeys: TList);
var
  I,J: integer;
begin
oKeys:=TList.Create;
try
for I:=0 to Users.List.Count-1 do with TOperationUser(Users.List[I]) do
  for J:=0 to SecurityKeys.Count-1 do
    if oKeys.IndexOf(Pointer(Integer(SecurityKeys[J]))) = -1 then oKeys.Add(Pointer(Integer(SecurityKeys[J])));
for I:=0 to Keys.List.Count-1 do with TOperationKey(Keys.List[I]) do oKeys.Add(Pointer(idKey));
except
  FreeAndNil(oKeys);
  Raise; //. =>
  end;
end;

procedure TOperation.GetUsersHasSameKeys(const Keys: TList; out oUsers: TList);
var
  I,J: integer;
begin
oUsers:=TList.Create;
try
for I:=0 to Users.List.Count-1 do with TOperationUser(Users.List[I]) do
  for J:=0 to SecurityKeys.Count-1 do
    if Keys.IndexOf(Pointer(Integer(SecurityKeys[J]))) <> -1
     then begin
      oUsers.Add(Users.List[I]);
      Break; //. >
      end;
except
  FreeAndNil(oUsers);
  Raise; //. =>
  end;
end;

procedure TOperation.RemoveKeys(const pKeys: TList);
var
  I,J: integer;
  RemoveUser: TOperationUser;
  RemoveKey: TOperationKey;
begin
I:=0;
while I < Users.List.Count do with TOperationUser(Users.List[I]) do begin
  J:=0;
  while J < SecurityKeys.Count do
    if pKeys.IndexOf(Pointer(Integer(SecurityKeys[J]))) <> -1
     then SecurityKeys.Delete(J)
     else Inc(J);
  if SecurityKeys.Count = 0
   then begin
    RemoveUser:=Users.List[I];
    Users.List.Delete(I);
    RemoveUser.Destroy;
    end
   else Inc(I);
  end;
I:=0;
while I < Keys.List.Count do with TOperationKey(Keys.List[I]) do 
  if pKeys.IndexOf(Pointer(idKey)) <> -1
   then begin
    RemoveKey:=Keys.List[I];
    Keys.List.Delete(I);
    RemoveKey.Destroy;
    end
   else Inc(I);
end;


{TOperationUser}
Constructor TOperationUser.Create(const pidUser: integer);
begin
Inherited Create;
idUser:=pidUser;
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
Self.UserName:=Name;
Self.FullUserName:=FullName;
finally
Release;
end;
SecurityKeys:=TList.Create;
end;

Destructor TOperationUser.Destroy;
begin
SecurityKeys.Free;
Inherited;
end;

function TOperationUser.IsKeyExist(const pidSecurityKey: integer): boolean;
begin
Result:=(SecurityKeys.IndexOf(Pointer(pidSecurityKey)) <> -1);
end;

procedure TOperationUser.AddKey(const pidSecurityKey: integer);
begin
if IsKeyExist(pidSecurityKey) then Exit; //. ->
SecurityKeys.Add(Pointer(pidSecurityKey));
end;


{TOperationUsers}
Constructor TOperationUsers.Create(const pOperation: TOperation);
begin
Inherited Create;
Operation:=pOperation;
List:=TList.Create;
end;

Destructor TOperationUsers.Destroy;
begin
Clear;
List.Free;
Inherited;
end;

procedure TOperationUsers.Clear;
var
  I: integer;
begin
for I:=0 to List.Count-1 do TObject(List[I]).Free;
List.Clear;
end;

procedure TOperationUsers.AddUserKey(const pidUser: integer; const pidSecurityKey: integer);
var
  I: integer;
  NewUser: TOperationUser;
begin
for I:=0 to List.Count-1 do with TOperationUser(List[I]) do
  if idUser = pidUser
   then begin
    AddKey(pidSecurityKey);
    Exit; //. ->
    end;
NewUser:=TOperationUser.Create(pidUser);
NewUser.AddKey(pidSecurityKey);
List.Add(NewUser);
end;


{TOperationKey}
Constructor TOperationKey.Create(const pidKey: integer; var vUsers: TList);
begin
Inherited Create;
idKey:=pidKey;
with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,idKey)) do
try
Self.KeyName:=Name;
finally
Release;
end;
Users:=vUsers;
end;

Destructor TOperationKey.Destroy;
begin
Users.Free;
Inherited;
end;

function TOperationKey.IsUserExist(const pidUser: integer): boolean;
begin
Result:=(Users.IndexOf(Pointer(pidUser)) <> -1);
end;

procedure TOperationKey.AddUser(const pidUser: integer);
begin
if IsUserExist(pidUser) then Exit; //. ->
Users.Add(Pointer(pidUser));
end;


{TOperationKeys}
Constructor TOperationKeys.Create(const pOperation: TOperation);
begin
Inherited Create;
Operation:=pOperation;
List:=TList.Create;
end;

Destructor TOperationKeys.Destroy;
begin
Clear;
List.Free;
Inherited;
end;

procedure TOperationKeys.Clear;
var
  I: integer;
begin
for I:=0 to List.Count-1 do TObject(List[I]).Free;
List.Clear;
end;

procedure TOperationKeys.AddKey(const pidSecurityKey: integer; var vUsers: TList);
var
  I: integer;
  NewUser: TOperationKey;
begin
for I:=0 to List.Count-1 do with TOperationKey(List[I]) do
  if idKey = pidSecurityKey
   then begin
    FreeAndNil(Users);
    Users:=vUsers;
    Exit; //. ->
    end;
NewUser:=TOperationKey.Create(pidSecurityKey,vUsers);
List.Add(NewUser);
end;


{TOperations}
Constructor TOperations.Create;
begin
Inherited Create;
List:=TList.Create;
end;

Destructor TOperations.Destroy;
begin
Clear;
List.Free;
Inherited;
end;

procedure TOperations.Clear;
var
  I: integer;
begin
for I:=0 to List.Count-1 do TObject(List[I]).Free;
List.Clear;
end;

function TOperations.IsOperationExist(const pidOperation: integer): boolean;
var
  I: integer;
begin
Result:=false;
for I:=0 to List.Count-1 do with TOperation(List[I]) do
  if idOperation = pidOperation
   then begin
    Result:=true;
    Exit; //. ->
    end;
end;

function TOperations.AddOperation(const idNewOperation: integer): TOperation;
var
  NewOperation: TOperation;
begin
if IsOperationExist(idNewOperation) then Raise Exception.Create('such operation already exist'); //. =>
//. creating
NewOperation:=TOperation.Create(idNewOperation);
List.Add(NewOperation);
Result:=NewOperation;
end;

procedure TOperations.RemoveOperation(const pOperation: TOperation);
begin
List.Remove(pOperation);
pOperation.Destroy;
end;

procedure TOperations.AddOperationKey(const pidOperation: integer; const pidSecurityKey: integer);
var
  I,J: integer;
  NewOperation: TOperation;
  AssotiatedUsers: TList;
  flAssotiatedUsersDestroy: boolean;
begin
if pidSecurityKey <> 0
 then with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,pidSecurityKey)) do
  try
  GetAssotiatedUsers(AssotiatedUsers);
  try
  flAssotiatedUsersDestroy:=true;
  for I:=0 to List.Count-1 do with TOperation(List[I]) do
    if idOperation = pidOperation
     then begin
      if AssotiatedUsers.Count = 1
       then Users.AddUserKey(Integer(AssotiatedUsers[0]), pidSecurityKey)
       else begin
        Keys.AddKey(pidSecurityKey, AssotiatedUsers);
        flAssotiatedUsersDestroy:=false;
        end;
      Exit; //. ->
      end;
  NewOperation:=TOperation.Create(pidOperation);
  with NewOperation do 
  if AssotiatedUsers.Count = 1
   then Users.AddUserKey(Integer(AssotiatedUsers[0]), pidSecurityKey)
   else begin
    Keys.AddKey(pidSecurityKey, AssotiatedUsers);
    flAssotiatedUsersDestroy:=false;
    end;
  List.Add(NewOperation);
  finally
  if flAssotiatedUsersDestroy then AssotiatedUsers.Destroy;
  end;
  finally
  Release;
  end
 else begin
  NewOperation:=TOperation.Create(pidOperation);
  List.Add(NewOperation);
  end;
end;


{TUserNames}
Constructor TUserNames.Create;
begin
Inherited Create;
List:=TList.Create;
end;

Destructor TUserNames.Destroy;
begin
Clear;
Inherited;
end;

procedure TUserNames.Clear;
var
  I: integer;
  ptrDestroyItem: pointer;
begin
for I:=0 to List.Count-1 do begin
  ptrDestroyItem:=List[I];
  FreeMem(ptrDestroyItem,SizeOf(TUserName));
  end;
List.Clear;
end;

function TUserNames.GetUserName(const pidUser: integer; out oUserName: shortstring; out oUserFullName: shortstring): boolean;
var
  I: integer;
begin
Result:=false;
for I:=0 to List.Count-1 do with TUserName(List[I]^) do
  if idUser = pidUser
   then begin
    oUserName:=Name;
    oUserFullName:=FullName;
    Result:=true;
    Exit; //. ->
    end;
end;

procedure TUserNames.AddUser(const pidUser: integer; const pUserName: shortstring; const pUserFullName: shortstring);
var
  ptrNewItem: pointer;
begin
GetMem(ptrNewItem,SizeOf(TUserName));
with TUserName(ptrNewItem^) do begin
idUser:=pidUser;
Name:=pUserName;
FullName:=pUserFullName;
end;
List.Add(ptrNewItem);
end;


{TfmSecurityFileEditor}
Constructor TfmSecurityFileEditor.Create(const pidSecurityFile: integer);
begin
Inherited Create(nil);
UserNames:=TUserNames.Create;
idSecurityFile:=pidSecurityFile;
Operations:=nil;
flChanged:=false;;
SelectedOperation:=nil;
SelectedUser:=nil;
SelectedKey:=nil;
with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,idSecurityFile)) do
try
edSecurityFileName.Text:=Name;
finally
Release;
end;
flClone:=false;
CloneSecurityFileID:=0;
Load;
UpdateControls;
end;

Destructor TfmSecurityFileEditor.Destroy;
begin
Operations.Free;
UserNames.Free;
Inherited;
end;

function TfmSecurityFileEditor.CloneAndSet(out idCloneSecurityFile: integer): boolean;
begin
flClone:=true;
sbDoAndClose.Caption:='done !';
Caption:='New security file wizard';
CloneSecurityFileID:=0;
edSecurityFileName.Text:=ProxySpace.UserName+': '+'?';
ShowModal;
if CloneSecurityFileID <> 0
 then begin
  idCloneSecurityFile:=CloneSecurityFileID;
  Result:=true;
  end
 else Result:=false;
end;

procedure TfmSecurityFileEditor.Load;
var
  SecurityFileDATA: TClientBlobStream;
  idOperation: integer;
  KeysCount: integer;
  I: integer;
  idKey: integer;
begin
FreeAndNil(Operations);
Operations:=TOperations.Create;
//.
with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,idSecurityFile)) do
try
if GetDATA(SecurityFileDATA)
 then
  try
  with TSecurityFile.Create(SecurityFileDATA) do
  try
  while NOT EOF do begin
    ReadOperationID(idOperation);
    with TSecurityComponentOperationFunctionality(TComponentFunctionality_Create(idTSecurityComponentOperation,idOperation)) do
    try
    ReadKeysCount(KeysCount);
    if KeysCount > 0
     then
      for I:=0 to KeysCount-1 do begin
        ReadKeyID(idKey);
        Operations.AddOperationKey(idOperation,idKey);
        end
     else
      Operations.AddOperationKey(idOperation,0);
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
Release;
end;
lvOperations_Update;
tvResult_Update;
flChanged:=false;
end;

procedure TfmSecurityFileEditor.Check;
var
  I: integer;
  J: integer;
  idKey: integer;
  _Keys: TList;
  ChangeSecurityOperationCount: integer;
  ReadOperationCount: integer;
begin
ChangeSecurityOperationCount:=0;
ReadOperationCount:=0;
for I:=0 to Operations.List.Count-1 do with TOperation(Operations.List[I]) do begin
  GetKeys(_Keys);
  try
  if (idOperation = idChangeSecurityOperation)
   then begin
    if (_Keys.Count > 1) then Raise Exception.Create('can not accept security: Change-Security-Operation has more than one security-key'); //. =>
    if (_Keys.Count = 0) then Raise Exception.Create('can not accept security: Change-Security-Operation has no security-key'); //. =>
    Inc(ChangeSecurityOperationCount);
    end;
  if (idOperation = idReadOperation)
   then begin
    Inc(ReadOperationCount);
    end;
  finally
  _Keys.Destroy;
  end;
  end;
//.
if ChangeSecurityOperationCount = 0 then Raise Exception.Create('can not accept security: Change-Security-Operation not found'); //. =>
if ChangeSecurityOperationCount > 1 then Raise Exception.Create('can not accept security: many Change-Security-Operation'); //. =>
//.
if ReadOperationCount = 0 then Raise Exception.Create('can not accept security: Read-Operation not found'); //. =>
end;

procedure TfmSecurityFileEditor.SaveTo(const idSF: integer);
var
  SecurityFile: TSecurityFile;
  I: integer;
  J: integer;
  idKey: integer;
  _Keys: TList;
begin
SecurityFile:=TSecurityFile.Create;
with SecurityFile do
try
//. security file object preparing
for I:=0 to Operations.List.Count-1 do with TOperation(Operations.List[I]) do begin
  GetKeys(_Keys);
  try
  WriteOperationID(idOperation);
  WriteKeysCount(_Keys.Count);
  for J:=0 to _Keys.Count-1 do begin
    idKey:=Integer(_Keys[J]);
    WriteKeyID(idKey);
    end;
  finally
  _Keys.Destroy;
  end;
  end;
with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,idSF)) do
try
SetDATA(SecurityFile);
finally
Release;
end;
finally
Destroy;
end;
flChanged:=false;
end;

procedure TfmSecurityFileEditor.DoCloneAndSet;
begin
Check;
with TSecurityFileFunctionality(TComponentFunctionality_Create(idTSecurityFile,idSecurityFile)) do
try
ToClone(CloneSecurityFileID);
try
//. set name
with TSecurityFileFunctionality(TypeFunctionality.TComponentFunctionality_Create(CloneSecurityFileID)) do
try
Name:=edSecurityFileName.Text;
finally
Release;
end;
//. set body
SaveTo(CloneSecurityFileID);
except
  TypeFunctionality.DestroyInstance(CloneSecurityFileID);
  CloneSecurityFileID:=0;
  Raise; //. =>
  end;
finally
Release;
end;
end;

procedure TfmSecurityFileEditor.AddOperation;
var
  fm: TfmTSecurityComponentOperationInstanceSelector;
  SC: TCursor;
  idNewOperation: integer;
  R: boolean;
  NewOperation: TOperation;
begin
//. operation selecting
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
fm:=TfmTSecurityComponentOperationInstanceSelector.Create;
finally
Screen.Cursor:=SC;
end;
with fm do 
try
R:=Select(idNewOperation);
finally
Destroy;
end;
if NOT R then Exit; //. ->
//. creating
NewOperation:=Operations.AddOperation(idNewOperation);
with lvOperations.Items.Add do begin
Caption:=NewOperation.OperationName;
Data:=NewOperation;
ImageIndex:=0;
Focused:=true;
Selected:=true;
end;
flChanged:=true;
tvResult_Update;
end;

procedure TfmSecurityFileEditor.SelectedOperation_AddUserKeys(const idUser: integer; const Keys: TList);
var
  I: integer;
begin
if SelectedOperation = nil then Raise Exception.Create('there is no operation selected'); //. =>
for I:=0 to Keys.Count-1 do Operations.AddOperationKey(SelectedOperation.idOperation,Integer(Keys[I]));
flChanged:=true;
tvOperationUsers_UpdateBySelectedOperation;
tvOperationKeys_UpdateBySelectedOperation;
tvResult_Update;
end;

function TfmSecurityFileEditor.SelectedUser_Remove: boolean;
var
  UserKeys: TList;
  Users: TList;
  UserIndex: integer;
  Mes: string;
  I: integer;
begin
Result:=false;
if SelectedUser = nil then Raise Exception.Create('there is no user selected'); //. =>
SelectedOperation.RemoveKeys(SelectedUser.SecurityKeys);
Result:=true;
flChanged:=true;
tvOperationUsers_UpdateBySelectedOperation;
tvResult_Update;
end;

function TfmSecurityFileEditor.SelectedUser_RemoveKey(const idKey: integer): boolean;
var
  UserKeys: TList;
  Users: TList;
  UserIndex: integer;
  Mes: string;
  I: integer;
begin
Result:=false;
if SelectedUser = nil then Raise Exception.Create('there is no user selected'); //. =>
UserKeys:=TList.Create;
try
UserKeys.Add(Pointer(idKey));
SelectedOperation.GetUsersHasSameKeys(UserKeys,Users);
try
UserIndex:=Users.IndexOf(SelectedUser);
if UserIndex = -1 then Exit; //. ->
Users.Delete(UserIndex);
if (Users.Count > 0)
 then begin
  Mes:='Attention ! The users shown below has the security key same as the selected user'#$0D#$0A;
  for I:=0 to Users.Count-1 do Mes:=Mes+'  "'+TOperationUser(Users[I]).UserName+'"'+#$0D#$0A;
  Mes:=Mes+'Do you want to delete this key anyway ?';
  if Application.MessageBox(PChar(Mes),'Deleting key notify',MB_ICONEXCLAMATION+MB_YESNO) <> idYES then Exit; //. ->
  end;
SelectedOperation.RemoveKeys(UserKeys);
Result:=true;
finally
Users.Destroy;
end;
finally
UserKeys.Destroy;
end;
flChanged:=true;
tvOperationUsers_UpdateBySelectedOperation;
tvResult_Update;
end;

function TfmSecurityFileEditor.SelectedKey_Remove: boolean;
var
  _Keys: TList;
begin
Result:=false;
if SelectedKey = nil then Raise Exception.Create('there is no key selected'); //. =>
_Keys:=TList.Create;
try
_Keys.Add(Pointer(SelectedKey.idKey));
SelectedOperation.RemoveKeys(_Keys);
Result:=true;
finally
_Keys.Destroy;
end;
flChanged:=true;
tvOperationKeys_UpdateBySelectedOperation;
tvResult_Update;
end;

procedure TfmSecurityFileEditor.lvOperations_Update;
var
  I: integer;
begin
SelectedOperation:=nil;
SelectedUser:=nil;
SelectedKey:=nil;
with lvOperations do begin
Items.BeginUpdate;
try
Items.Clear;
for I:=0 to Operations.List.Count-1 do with TOperation(Operations.List[I]),Items.Add do begin
  Caption:=OperationName;
  Data:=Operations.List[I];
  ImageIndex:=0;
  end;
finally
Items.EndUpdate;
end;
end;
UpdateControls;
end;

procedure TfmSecurityFileEditor.tvOperationUsers_UpdateBySelectedOperation;
var
  I,J: integer;
  UserItem,KeyItem: TTreeNode;
begin
SelectedUser:=nil;
with tvOperationUsers do begin
Items.BeginUpdate;
try
Items.Clear;
with SelectedOperation do
for I:=0 to Users.List.Count-1 do with TOperationUser(Users.List[I]) do begin
  UserItem:=tvOperationUsers.Items.AddChild(nil, UserName+' ('+FullUserName+')');
  UserItem.Data:=Users.List[I];
  UserItem.ImageIndex:=1;
  UserItem.SelectedIndex:=UserItem.ImageIndex;
  for J:=0 to SecurityKeys.Count-1 do with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,Integer(SecurityKeys[J]))) do
    try
    KeyItem:=tvOperationUsers.Items.AddChild(UserItem, Name);
    KeyItem.Data:=Pointer(idObj);
    KeyItem.ImageIndex:=2;
    KeyItem.SelectedIndex:=KeyItem.ImageIndex;
    finally
    Release;
    end;
  end;
finally
Items.EndUpdate;
end;
if (SelectedOperation.Users.List.Count > 0) OR (SelectedOperation.Keys.List.Count > 0)
 then tvOperationUsers_pnlAnyUser.SendToBack
 else tvOperationUsers_pnlAnyUser.BringToFront;
end;
UpdateControls;
end;

procedure TfmSecurityFileEditor.tvOperationKeys_UpdateBySelectedOperation;
var
  I,J: integer;
  KeyItem,UserItem: TTreeNode;
  UN,UFN: shortstring;
begin
SelectedKey:=nil;
with tvOperationKeys do begin
Items.BeginUpdate;
try
Items.Clear;
with SelectedOperation do
for I:=0 to Keys.List.Count-1 do with TOperationKey(Keys.List[I]) do begin
  KeyItem:=tvOperationKeys.Items.AddChild(nil, KeyName);
  KeyItem.Data:=Keys.List[I];
  KeyItem.ImageIndex:=4;
  KeyItem.SelectedIndex:=KeyItem.ImageIndex;
  for J:=0 to Users.Count-1 do begin
    if NOT UserNames.GetUserName(Integer(Users[J]), UN,UFN)
     then with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,Integer(Users[J]))) do
      try
      UN:=Name;
      UserNames.AddUser(idObj, UN,FullName);
      finally
      Release;
      end;
    UserItem:=tvOperationKeys.Items.AddChild(KeyItem, UN);
    UserItem.Data:=Pointer(Integer(Users[J]));
    UserItem.ImageIndex:=3;
    UserItem.SelectedIndex:=UserItem.ImageIndex;
    end;
  end;
tvOperationKeys.FullExpand;
finally
Items.EndUpdate;
end;
end;
UpdateControls;
end;

procedure TfmSecurityFileEditor.tvOperationKeys_InsertNewKey;
var
  R: boolean;
  idNewKey: integer;
  Users: TList;
begin
if SelectedOperation = nil then Raise Exception.Create('there is no operation selected'); //. =>
//.
with TfmTSecurityKeyInstanceSelector.Create do
try
R:=Select(idNewKey);
finally
Destroy;
end;
//.
if NOT R then Exit; //. ->
//.
with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,idNewKey)) do
try
GetAssotiatedUsers(Users);
try
if Users.Count <= 1 then Raise Exception.Create('can not add security key: key is not shared'); //. =>
finally
Users.Destroy;
end;
finally
Release;
end;
//.
Operations.AddOperationKey(SelectedOperation.idOperation,idNewKey);
//.
flChanged:=true;
tvOperationKeys_UpdateBySelectedOperation;
tvResult_Update;
end;

procedure TfmSecurityFileEditor.lvOperationsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  SC: TCursor;

  procedure SelectResultOperation(const pidOperation: integer);
  var
    I: integer;
  begin
  with tvResult do
  for I:=0 to Items.Count-1 do if Items[I].Level = 0 then  with TOperation(Items[I].Data) do
    if idOperation = pidOperation
     then begin
      Items[I].Selected:=true;
      Items[I].MakeVisible;
      Exit; //. ->
      end;
  end;

begin
if SelectedOperation = TOperation(Item.Data) then Exit; //. ->
SelectedOperation:=TOperation(Item.Data);
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
tvOperationUsers_UpdateBySelectedOperation;
tvOperationKeys_UpdateBySelectedOperation;
SelectResultOperation(TOperation(Item.Data).idOperation);
finally
Screen.Cursor:=SC;
end;
UpdateControls;
end;

procedure TfmSecurityFileEditor.sbAddOperationClick(Sender: TObject);
begin
AddOperation;
end;

procedure TfmSecurityFileEditor.sbRemoveSelectedOperationClick(Sender: TObject);
begin
if lvOperations.Selected = nil then Exit; //. ->
if Application.MessageBox('Delete selected operation ?','Notify',MB_ICONEXCLAMATION+MB_YESNO) <> idYES then Exit; //. ->
with lvOperations.Selected do begin
Selected:=false;
Focused:=false;
Operations.RemoveOperation(TOperation(Data));
flChanged:=true;
Delete;
end;
tvOperationUsers.Items.Clear;
tvOperationKeys.Items.Clear;
tvResult_Update;
UpdateControls;
end;

procedure TfmSecurityFileEditor.sbAddOperationUserClick(Sender: TObject);
begin
with TfmUserKeysSelector.Create(Self) do Show;
end;

procedure TfmSecurityFileEditor.sbRemoveSelectedOperationUserClick(Sender: TObject);
begin
if SelectedUser = nil then Exit; //. ->
if Application.MessageBox('Delete selected user ?','Notify',MB_ICONEXCLAMATION+MB_YESNO) <> idYES then Exit; //. ->
with tvOperationUsers.Selected do begin
Selected:=false;
Focused:=false;
if NOT SelectedUser_Remove then Exit; //. ->
end;
UpdateControls;
end;

procedure TfmSecurityFileEditor.sbDoAndCloseClick(Sender: TObject);
var
  SC: TCursor;
begin
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
if NOT flClone
 then begin
  Check;
  SaveTo(idSecurityFile);
  end
 else DoCloneAndSet;
finally
Screen.Cursor:=SC;
end;
Close;
end;

procedure TfmSecurityFileEditor.tvOperationKeysClick(Sender: TObject);
begin
if (tvOperationKeys.Selected <> nil) AND (tvOperationKeys.Selected.Level = 0)
 then SelectedKey:=tvOperationKeys.Selected.Data
 else SelectedKey:=nil;
UpdateControls;
end;

procedure TfmSecurityFileEditor.sbRemoveOperationKeyClick(Sender: TObject);
begin
if NOT ((tvOperationKeys.Selected <> nil) AND (tvOperationKeys.Selected.Level = 0)) then Exit; //. ->
if Application.MessageBox('Delete selected key ?','Notify',MB_ICONEXCLAMATION+MB_YESNO) <> idYES then Exit; //. ->
with tvOperationKeys.Selected do begin
Selected:=false;
Focused:=false;
if NOT SelectedKey_Remove then Exit; //. ->
end;
UpdateControls;
end;

procedure TfmSecurityFileEditor.tvOperationUsersClick(Sender: TObject);
begin
if (tvOperationUsers.Selected <> nil) AND (tvOperationUsers.Selected.Level = 0)
 then SelectedUser:=TOperationUser(tvOperationUsers.Selected.Data)
 else SelectedUser:=nil;
UpdateControls;
end;

procedure TfmSecurityFileEditor.sbAddOperationKeyClick(Sender: TObject);
begin
tvOperationKeys_InsertNewKey;
end;


procedure TfmSecurityFileEditor.FormPaint(Sender: TObject);
var
  I,J: integer;
begin
{/// ? for I:=0 to (Width DIV imgBackground.Width) do
  for J:=0 to (Height DIV imgBackground.Height) do begin
    Canvas.Draw(I*imgBackground.Width,J*imgBackground.Height,imgBackground.Picture.Graphic);
    end;}
end;

procedure TfmSecurityFileEditor.UpdateControls;
begin
if lvOperations.Selected <> nil
 then begin
  sbRemoveSelectedOperation.Enabled:=true;
  sbAddOperationUser.Enabled:=true;
  if (tvOperationUsers.Selected <> nil) AND (tvOperationUsers.Selected.Level = 0)
   then sbRemoveSelectedOperationUser.Enabled:=true
   else sbRemoveSelectedOperationUser.Enabled:=false;
  sbAddOperationKey.Enabled:=true;
  if (tvOperationKeys.Selected <> nil) AND (tvOperationKeys.Selected.Level = 0)
   then sbRemoveOperationKey.Enabled:=true
   else sbRemoveOperationKey.Enabled:=false;
  end
 else begin
  sbRemoveSelectedOperation.Enabled:=false;
  sbAddOperationUser.Enabled:=false;
  sbRemoveSelectedOperationUser.Enabled:=false;
  sbAddOperationKey.Enabled:=false;
  sbRemoveOperationKey.Enabled:=false;
  end;
if flChanged
 then sbDoAndClose.Enabled:=true
 else sbDoAndClose.Enabled:=false;
end;

procedure TfmSecurityFileEditor.tvResult_Update;
var
  I,J,K: integer;
  OperationItem,UserItem,KeyItem: TTreeNode;
  UN,UFN: shortstring;
begin
with tvResult do begin
Items.BeginUpdate;
try
Items.Clear;
with Operations do
for I:=0 to List.Count-1 do with TOperation(List[I]) do begin
  OperationItem:=tvResult.Items.AddChild(nil, OperationName);
  OperationItem.Data:=List[I];
  OperationItem.ImageIndex:=0;
  OperationItem.SelectedIndex:=OperationItem.ImageIndex;
  for J:=0 to Users.List.Count-1 do with TOperationUser(Users.List[J]) do begin
    UserItem:=tvResult.Items.AddChild(OperationItem, UserName);
    UserItem.Data:=Users.List[J];
    UserItem.ImageIndex:=1;
    UserItem.SelectedIndex:=UserItem.ImageIndex;
    for K:=0 to SecurityKeys.Count-1 do begin
      KeyItem:=tvResult.Items.AddChild(UserItem, '?');
      KeyItem.Data:=Pointer(SecurityKeys[K]);
      KeyItem.ImageIndex:=2;
      KeyItem.SelectedIndex:=KeyItem.ImageIndex;
      end;
    end;
  for J:=0 to Keys.List.Count-1 do with TOperationKey(Keys.List[J]) do
    for K:=0 to Users.Count-1 do begin
      if NOT UserNames.GetUserName(Integer(Users[K]), UN,UFN)
       then with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,Integer(Users[K]))) do
        try
        UN:=Name;
        UserNames.AddUser(idObj, UN,FullName);
        finally
        Release;
        end;
      UserItem:=tvResult.Items.AddChild(OperationItem, UN);
      UserItem.Data:=Pointer(Integer(Users[K]));
      UserItem.ImageIndex:=3;
      UserItem.SelectedIndex:=UserItem.ImageIndex;
        KeyItem:=tvResult.Items.AddChild(UserItem, KeyName);
        KeyItem.Data:=Keys.List[J];
        KeyItem.ImageIndex:=4;
        KeyItem.SelectedIndex:=KeyItem.ImageIndex;
      end;
  if (Users.List.Count = 0) AND (Keys.List.Count = 0)
   then begin
    UserItem:=tvResult.Items.AddChild(OperationItem, '<ANY USER>');
    UserItem.Data:=nil;
    UserItem.ImageIndex:=1;
    UserItem.SelectedIndex:=UserItem.ImageIndex;
    end;
  OperationItem.Expand(false);
  end;
finally
Items.EndUpdate;
end;
end;
end;


procedure TfmSecurityFileEditor.tvResultExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
if (Node.Level = 1)
 then
  if Node.Item[0].ImageIndex = 2
   then with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,Integer(Node.Item[0].Data))) do
    try
    Node.Item[0].Text:=Name;
    finally
    Release;
    end
   else with TSecurityKeyFunctionality(TComponentFunctionality_Create(idTSecurityKey,TOperationKey(Node.Item[0].Data).idKey)) do
    try
    Node.Item[0].Text:=Name;
    finally
    Release;
    end;
end;

procedure TfmSecurityFileEditor.tvResultClick(Sender: TObject);

  procedure SelectOperation(const pidOperation: integer);
  var
    I: integer;
  begin
  with lvOperations do
  for I:=0 to Items.Count-1 do with TOperation(Items[I].Data) do
    if idOperation = pidOperation
     then begin
      Items[I].Selected:=true;
      Items[I].MakeVisible(false);
      Exit; //. ->
      end;
  end;

  procedure SelectOperationUser(const pOperationUser: TOperationUser);
  var
    I: integer;
  begin
  with tvOperationUsers do
  for I:=0 to Items.Count-1 do
    if (Items[I].Level = 0) AND (Items[I].Data = pOperationUser)
     then begin
      Items[I].Selected:=true;
      Items[I].MakeVisible;
      Exit; //. ->
      end;
  end;

  procedure SelectOperationKey(const pOperationKey: TOperationKey);
  var
    I: integer;
  begin
  with tvOperationKeys do
  for I:=0 to Items.Count-1 do
    if (Items[I].Level = 0) AND (Items[I].Data = pOperationKey)
     then begin
      Items[I].Selected:=true;
      Items[I].MakeVisible;
      Exit; //. ->
      end;
  end;

var
  LastSelected: TTreeNode;
begin
if (tvResult.Selected <> nil)
 then
  if (tvResult.Selected.Level = 0)
   then SelectOperation(TOperation(tvResult.Selected.Data).idOperation)
   else
    if (tvResult.Selected.Level = 1) AND (tvResult.Selected.Data <> nil)
     then begin
      LastSelected:=tvResult.Selected;
      SelectOperation(TOperation(tvResult.Selected.Parent.Data).idOperation);
      tvResult.Selected:=LastSelected;
      if tvResult.Selected.ImageIndex = 1
       then SelectOperationUser(tvResult.Selected.Data)
       else SelectOperationKey(tvResult.Selected.Item[0].Data)
      end;
end;

end.
