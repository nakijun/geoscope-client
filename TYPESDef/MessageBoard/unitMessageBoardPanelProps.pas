unit unitMessageBoardPanelProps;

interface

uses
  GlobalSpaceDefines, unitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  ImgList, ComCtrls;

const
  WM_DOONMESSAGEOPERATION = WM_USER+1;
type
  TMessageBoardPanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Label1: TLabel;
    sbCreateMessage: TSpeedButton;
    lvMessages: TListView;
    lvMessages_ImageList: TImageList;
    imgUnreadMessage: TImage;
    lbUnreadMessage: TLabel;
    Image1: TImage;
    Label2: TLabel;
    edName: TEdit;
    Bevel1: TBevel;
    edUserName: TEdit;
    procedure lvMessagesDblClick(Sender: TObject);
    procedure sbCreateMessageClick(Sender: TObject);
    procedure lvMessagesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    MessageTypeSystemPresentUpdater: TTypeSystemPresentUpdater;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure lvMessages_Update;
    procedure lvMessages_UpdateItem(Item: TListItem);
    procedure lvMessages_DoOnMessageOperation(const idMessage: integer; const Operation: TComponentOperation);
    procedure _lvMessages_DoOnMessageOperation(const idMessage: integer; const Operation: TComponentOperation);
    procedure wmDoOnMessageOperation(var Message: TMessage); message WM_DOONMESSAGEOPERATION;
    procedure lvMessages_DeleteSelected;
    procedure UnreadMessageIndicator_Update;
    procedure CreateNewMessage;
  end;

implementation
{$R *.DFM}

Constructor TMessageBoardPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
MessageTypeSystemPresentUpdater:=TTypeSystemPresentUpdater.Create(SystemTMessageBoardMessage, _lvMessages_DoOnMessageOperation);
end;

destructor TMessageBoardPanelProps.Destroy;
begin
MessageTypeSystemPresentUpdater.Free;
Inherited;
end;

procedure TMessageBoardPanelProps._Update;
begin
Inherited;
//. get name
edName.Text:=TMessageBoardFunctionality(ObjFunctionality).Name;
//. get UserName
try
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,TMessageBoardFunctionality(ObjFunctionality).idUser)) do
try
Check;
edUserName.Text:=Name;
edUserName.Hint:=FullName;
finally
Release;
end;
except
  edUserName.Text:='?';
  edUserName.Hint:='';
  end;
//.
if ObjFunctionality.Space.UserID = TMessageBoardFunctionality(ObjFunctionality).idUser
 then sbCreateMessage.Hide
 else sbCreateMessage.Show;
//.
UnreadMessageIndicator_Update;
//.
lvMessages_Update;
end;

procedure TMessageBoardPanelProps.lvMessages_Update;
var
  Messages: TList;
  I: integer;
  NewItem: TListItem;
  flAcceptMessage: boolean;
begin
TMessageBoardFunctionality(ObjFunctionality).GetMessagesList(Messages);
try
if ObjFunctionality.Space.UserID = TMessageBoardFunctionality(ObjFunctionality).idUser
 then with lvMessages.Items do begin
  Clear;
  BeginUpdate;
  try
  for I:=0 to Messages.Count-1 do begin
    NewItem:=Add;
    NewItem.Data:=Messages[I];
    try
    lvMessages_UpdateItem(NewItem);
    except
      Delete(Count-1);
      end;
    end;
  finally
  EndUpdate;
  end;
  end
 else with lvMessages.Items do begin
  Clear;
  BeginUpdate;
  try
  for I:=0 to Messages.Count-1 do begin
    try
    with TMessageBoardMessageFunctionality(TComponentFunctionality_Create(idTMessageBoardMessage,Integer(Messages[I]))) do
    try
    flAcceptMessage:=IsCreatedByUser(ObjFunctionality.Space.UserID) AND NOT flRead;
    finally
    Release;
    end;
    except
      flAcceptMessage:=false;
      end;
    if flAcceptMessage
     then begin
      NewItem:=Add;
      NewItem.Data:=Messages[I];
      try
      lvMessages_UpdateItem(NewItem);
      except
        Delete(Count-1);
        end;
      end;
    end;
  finally
  EndUpdate;
  end;
  end;
finally
Messages.Destroy;
end;
end;

procedure TMessageBoardPanelProps.lvMessages_UpdateItem(Item: TListItem);
var
  DC: TDateTime;
begin
with Item,TMessageBoardMessageFunctionality(TComponentFunctionality_Create(idTMessageBoardMessage,Integer(Item.Data))) do
try
Caption:=Subject;
SubItems.Clear;
try DC:=DateCreated; except DC:=-1; end;
if DC <> -1
 then SubItems.Add(FormatDateTime('DD.MM.YY HH:NN:SS',DC))
 else SubItems.Add('?');
//. get sender name
try
with TMessageBoardFunctionality(TComponentFunctionality_Create(idTMessageBoard,idSenderMessageBoard)) do
try
Check;
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
Check;
SubItems.Add(Name);
finally
Release;
end;
finally
Release;
end;
except
  SubItems.Add('?');
  end;
//.
if flRead
 then ImageIndex:=1
 else ImageIndex:=0;
//.
finally
Release;
end;
end;

procedure TMessageBoardPanelProps._lvMessages_DoOnMessageOperation(const idMessage: integer; const Operation: TComponentOperation);
begin
PostMessage(Handle, WM_DOONMESSAGEOPERATION,WPARAM(idMessage),LPARAM(Operation));
end;

procedure TMessageBoardPanelProps.wmDoOnMessageOperation(var Message: TMessage);
begin
lvMessages_DoOnMessageOperation(Integer(Message.WParam), TComponentOperation(Message.LParam));
end;

procedure TMessageBoardPanelProps.lvMessages_DoOnMessageOperation(const idMessage: integer; const Operation: TComponentOperation);

  procedure DoProcessing;
  var
    NewItem: TListItem;
    I: integer;

    procedure Insert(const idMessage: integer);
    var
      flExit: boolean;
    begin
    if ObjFunctionality.Space.UserID <> TMessageBoardFunctionality(ObjFunctionality).idUser
    then begin
     with TMessageBoardMessageFunctionality(TComponentFunctionality_Create(idTMessageBoardMessage,idMessage)) do
     try
     flExit:=NOT IsCreatedByUser(ObjFunctionality.Space.UserID);
     finally
     Release;
     end;
     if flExit then Exit; //. ->
     end;
    NewItem:=lvMessages.Items.Add;
    NewItem.Data:=Pointer(idMessage);
    lvMessages_UpdateItem(NewItem);
    end;

  begin
  case Operation of
  opCreate: Insert(idMessage);
  opDestroy: with lvMessages do
    for I:=0 to Items.Count-1 do
      if Integer(Items[I].Data) = idMessage
       then begin
        Items[I].Delete;
        Exit; //. ->
        end;
  opUpdate: with lvMessages do begin
    for I:=0 to Items.Count-1 do
      if Integer(Items[I].Data) = idMessage
       then begin
        lvMessages_UpdateItem(Items[I]);
        Exit; //. ->
        end;
    Insert(idMessage);
    end;
  end;
  end;

var
  Accepted: boolean;
begin
if Operation <> opDestroy
 then begin
  with TMessageBoardMessageFunctionality(TComponentFunctionality_Create(idTMessageBoardMessage,idMessage)) do
  try
  Accepted:=(idMessageBoard = ObjFunctionality.idObj);
  finally
  Release;
  end;
  if NOT Accepted then Exit; //. ->
  end;
DoProcessing;
UnreadMessageIndicator_Update;
end;

procedure TMessageBoardPanelProps.lvMessages_DeleteSelected;
var
  I: integer;
  IDs: TList;
begin
IDs:=TList.Create;
try
for I:=0 to lvMessages.Items.Count-1 do if (lvMessages.Items[I].Selected) then IDs.Add(lvMessages.Items[I].Data);
for I:=0 to IDs.Count-1 do with TTMessageBoardMessageFunctionality.Create do
  try
  DestroyInstance(Integer(IDs[I]));
  finally
  Release;
  end
finally
IDs.Destroy
end;
end;

procedure TMessageBoardPanelProps.lvMessagesDblClick(Sender: TObject);
begin
with lvMessages do
if Selected <> nil
 then with TComponentFunctionality_Create(idTMessageBoardMessage,Integer(Selected.Data)) do
  try
  flUserSecurityDisabled:=true;
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Position:=poScreenCenter;
  Show;
  end;
  finally
  Release;
  end;
end;

procedure TMessageBoardPanelProps.lvMessagesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
case Key of
VK_DELETE: if Application.MessageBox('delete selected messages ?','Question',MB_YESNO+MB_ICONQUESTION) = mrYes
 then lvMessages_DeleteSelected;
end;
end;

procedure TMessageBoardPanelProps.UnreadMessageIndicator_Update;
begin
if ObjFunctionality.Space.UserID <> TMessageBoardFunctionality(ObjFunctionality).idUser
 then begin
  imgUnreadMessage.Hide;
  lbUnreadMessage.Hide;
  Exit; //. ->
  end;
if TMessageBoardFunctionality(ObjFunctionality).IsUnreadMessageExist
 then begin
  imgUnreadMessage.Show;
  lbUnreadMessage.Show;
  end
 else begin
  imgUnreadMessage.Hide;
  lbUnreadMessage.Hide;
  end;
end;

procedure TMessageBoardPanelProps.CreateNewMessage;
var
  SC: TCursor;
  idNewMessage: integer;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
if ObjFunctionality.Space.Status in [pssRemoted,pssRemotedBrief] then ObjFunctionality.Space.Log.OperationStarting('Message creating ...');
try
with TMessageBoardFunctionality(ObjFunctionality) do idNewMessage:=CreateNewMessage;
try
with TMessageBoardMessageFunctionality(TComponentFunctionality_Create(idTMessageBoardMessage,idNewMessage)) do
try
with TPanelProps_Create(false,0,nil,nilObject) do begin
Caption:='New message';
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
except
  with TTMessageBoardMessageFunctionality.Create do
  try
  DestroyInstance(idNewMessage);
  finally
  Release;
  end;
  //. re-raise exception
  Raise; //. =>
  end;
finally
if ObjFunctionality.Space.Status in [pssRemoted,pssRemotedBrief] then ObjFunctionality.Space.Log.OperationDone;
Screen.Cursor:=SC;
end;
end;

procedure TMessageBoardPanelProps.sbCreateMessageClick(Sender: TObject);
begin
CreateNewMessage;
end;

procedure TMessageBoardPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TMessageBoardFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  end;
end;

procedure TMessageBoardPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TMessageBoardPanelProps.Controls_ClearPropData;
begin
edName.Text:='';
edUserName.Text:='';
lvMessages.Clear;
end;

end.
