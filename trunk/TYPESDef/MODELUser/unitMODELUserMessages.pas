unit unitMODELUserMessages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls,
  GlobalSpaceDefines, unitProxySpace, Functionality, TypesFunctionality, TypesDefines,
  Buttons, ImgList;

const
  WM_DOONMESSAGEOPERATION = WM_USER+1;
type
  TfmMODELUserMessages = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Image2: TImage;
    Image1: TImage;
    lbAnnotation: TLabel;
    lvMessages: TListView;
    sbClose: TSpeedButton;
    cbShowAllMessages: TCheckBox;
    lvMessages_ImageList: TImageList;
    procedure sbCloseClick(Sender: TObject);
    procedure cbShowAllMessagesClick(Sender: TObject);
    procedure lvMessagesDblClick(Sender: TObject);
  private
    { Private declarations }
    idUser: integer;
    flUnreadOnly: boolean;
    MessageTypeSystemPresentUpdater: TTypeSystemPresentUpdater;

    procedure UpdateItem(Item: TListItem);
    procedure DoOnMessageOperation(const idMessage: integer; const Operation: TComponentOperation);
    procedure _DoOnMessageOperation(const idMessage: integer; const Operation: TComponentOperation);
    procedure wmDoOnMessageOperation(var Message: TMessage); message WM_DOONMESSAGEOPERATION;
  public
    { Public declarations }
    Constructor Create(const pidUser: integer; const pflUnreadOnly: boolean);
    Destructor Destroy; override;
    procedure Update;
  end;

implementation

{$R *.dfm}


Constructor TfmMODELUserMessages.Create(const pidUser: integer; const pflUnreadOnly: boolean);
begin
Inherited Create(nil);
idUser:=pidUser;
flUnreadOnly:=pflUnreadOnly;
Update;
MessageTypeSystemPresentUpdater:=TTypeSystemPresentUpdater.Create(SystemTMessageBoardMessage, _DoOnMessageOperation);
end;

Destructor TfmMODELUserMessages.Destroy;
begin
MessageTypeSystemPresentUpdater.Free;
Inherited;
end;

procedure TfmMODELUserMessages.Update;
var
  Messages: TList;
  I: integer;
  NewItem: TListItem;
  flAcceptMessage: boolean;

begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
GetMessages(flUnreadOnly,Messages);
finally
Release;
end;
try
with lvMessages.Items do begin
Clear;
BeginUpdate;
try
for I:=0 to Messages.Count-1 do begin
  NewItem:=Add;
  NewItem.Data:=Messages[I];
  try
  UpdateItem(NewItem);
  except
    Delete(Count-1);
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

procedure TfmMODELUserMessages.UpdateItem(Item: TListItem);
var
  DC: TDateTime;
begin
with Item,TMessageBoardMessageFunctionality(TComponentFunctionality_Create(idTMessageBoardMessage,Integer(Item.Data))) do
try
Caption:=Subject;
DC:=DateCreated;
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

procedure TfmMODELUserMessages._DoOnMessageOperation(const idMessage: integer; const Operation: TComponentOperation);
begin
PostMessage(Handle, WM_DOONMESSAGEOPERATION,WPARAM(idMessage),LPARAM(Operation));
end;

procedure TfmMODELUserMessages.wmDoOnMessageOperation(var Message: TMessage);
begin
DoOnMessageOperation(Integer(Message.WParam), TComponentOperation(Message.LParam));
end;

procedure TfmMODELUserMessages.DoOnMessageOperation(const idMessage: integer; const Operation: TComponentOperation);

  procedure DoProcessing;
  var
    NewItem: TListItem;
    I: integer;

    procedure Insert(const idMessage: integer);
    var
      flExit: boolean;
      _idMessageBoard: integer;
    begin
    with TMessageBoardMessageFunctionality(TComponentFunctionality_Create(idTMessageBoardMessage,idMessage)) do
    try
    _idMessageBoard:=idMessageBoard;
    if _idMessageBoard <> 0
     then with TMessageBoardFunctionality(TComponentFunctionality_Create(idTMessageBoard,_idMessageBoard)) do
      try
      flExit:=(idUser <> TypesSystem.Space.UserID);
      finally
      Release;
      end
     else
      flExit:=true;
    finally
    Release;
    end;
    if flExit then Exit; //. ->
    NewItem:=lvMessages.Items.Add;
    NewItem.Data:=Pointer(idMessage);
    UpdateItem(NewItem);
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
        UpdateItem(Items[I]);
        Exit; //. ->
        end;
    Insert(idMessage);
    end;
  end;
  end;

begin
try
DoProcessing;
except
  end;
end;



procedure TfmMODELUserMessages.sbCloseClick(Sender: TObject);
begin
Close;
end;

procedure TfmMODELUserMessages.cbShowAllMessagesClick(Sender: TObject);
begin
flUnReadOnly:=NOT cbShowAllMessages.Checked;
Update;
end;

procedure TfmMODELUserMessages.lvMessagesDblClick(Sender: TObject);
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

end.
