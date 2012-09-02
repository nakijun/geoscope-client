unit unitMessageBoardMessagePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TMessageBoardMessagePanelProps = class(TSpaceObjPanelProps)
    Bevel: TBevel;
    Label1: TLabel;
    Image1: TImage;
    lbSenderName: TLabel;
    sbReplyToSender: TSpeedButton;
    Label2: TLabel;
    edSubject: TEdit;
    memoBody: TMemo;
    Label3: TLabel;
    edDateCreated: TEdit;
    sbMessageRead: TSpeedButton;
    sbSaveAndClose: TSpeedButton;
    sbChangeSenderMessageBoard: TSpeedButton;
    Image2: TImage;
    sbMessageBoard: TSpeedButton;
    sbDelete: TSpeedButton;
    Panel1: TPanel;
    procedure memoBodyKeyPress(Sender: TObject; var Key: Char);
    procedure edSubjectKeyPress(Sender: TObject; var Key: Char);
    procedure sbMessageReadClick(Sender: TObject);
    procedure sbSaveAndCloseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbChangeSenderMessageBoardClick(Sender: TObject);
    procedure sbReplyToSenderClick(Sender: TObject);
    procedure sbMessageBoardClick(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
  private
    { Private declarations }
    flBodyChanged: boolean;

    procedure ChangeSenderMessageBoard;
    procedure ReplyToSender;
    function IsMessageUnSent: boolean;
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure SaveChanges; override;
    procedure SaveBody;
    procedure SendMessage;
  end;

implementation
Uses
  unitMODELUserMessageBoards;

{$R *.DFM}


function MessageBox(const Text: string): Integer;
begin
with Dialogs.CreateMessageDialog(Text,mtWarning,[mbYes,mbNo]) do
try
FormStyle:=fsStayOnTop;
Result:=ShowModal;
finally
Destroy;
end;
end;


{TMessageBoardMessagePanelProps}
Constructor TMessageBoardMessagePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Update;
end;

destructor TMessageBoardMessagePanelProps.Destroy;
begin
Inherited;
end;

procedure TMessageBoardMessagePanelProps._Update;
var
  DateCreated: TDateTime;
  SL: TStringList;
begin
Inherited;
//. get sender name
try
with TMessageBoardFunctionality(TComponentFunctionality_Create(idTMessageBoard,TMessageBoardMessageFunctionality(ObjFunctionality).idSenderMessageBoard)) do
try
Check;
lbSenderName.Hint:=Name;
sbChangeSenderMessageBoard.Hint:='';
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
Check;
lbSenderName.Caption:=Name;
finally
Release;
end;
finally
Release;
end;
except
  lbSenderName.Caption:='?';
  lbSenderName.Hint:='';
  sbChangeSenderMessageBoard.Hint:='';
  end;
//.
try
with TMessageBoardFunctionality(TComponentFunctionality_Create(idTMessageBoard,TMessageBoardMessageFunctionality(ObjFunctionality).getIdMessageBoard)) do
try
Check;
if ObjFunctionality.Space.UserID = idUser
 then begin
  sbReplyToSender.Show;
  sbChangeSenderMessageBoard.Hide;
  sbMessageRead.Show;
  sbSaveAndClose.Hide;
 end
 else begin
  sbReplyToSender.Hide;
  sbChangeSenderMessageBoard.Show;
  sbMessageRead.Hide;
  sbSaveAndClose.Show;
  end;
finally
Release;
end;
except
  sbReplyToSender.Hide;
  end;
//. get date created
try DateCreated:=TMessageBoardMessageFunctionality(ObjFunctionality).DateCreated; except DateCreated:=-1; end;
if DateCreated <> -1
 then edDateCreated.Text:=FormatDateTime('DD.MM.YY HH.MM.SS',DateCreated)
 else edDateCreated.Text:='?';
//. get subject
edSubject.Text:=TMessageBoardMessageFunctionality(ObjFunctionality).Subject;
//. get body
SL:=TStringList.Create;
try
TMessageBoardMessageFunctionality(ObjFunctionality).GetBody(SL);
memoBody.Lines.Assign(SL);
finally
SL.Destroy;
end;
flBodyChanged:=false;
end;

procedure TMessageBoardMessagePanelProps.SaveChanges;
begin
if flBodyChanged then SaveBody;
Inherited;
end;

procedure TMessageBoardMessagePanelProps.SaveBody;
var
  SL: TStringList;
begin
Updater.Disable;
try
SL:=TStringList.Create;
try
SL.Assign(memoBody.Lines);
TMessageBoardMessageFunctionality(ObjFunctionality).SetBody(SL);
finally
SL.Destroy;
end;
except
  Updater.Enabled;
  Raise; //.=>
  end;
flBodyChanged:=false;
end;

procedure TMessageBoardMessagePanelProps.SendMessage;
begin
with TMessageBoardFunctionality(TComponentFunctionality_Create(idTMessageBoard,TMessageBoardMessageFunctionality(ObjFunctionality).IdMessageBoard)) do
try
Updater.Disable;
try
SendMessage(ObjFunctionality.idObj);
except
  Updater.Enabled;
  Raise; //.=>
  end;
finally
Release;
end;
Close;
end;

procedure TMessageBoardMessagePanelProps.ChangeSenderMessageBoard;
var
  idMessageBoard: integer;
  Selected: boolean;
begin
with TfmMODELUserMessageBoards.Create(ObjFunctionality.Space.UserID) do
try
Selected:=Select(idMessageBoard);
finally
Destroy;
end;
if NOT Selected then Exit; //. ->
SaveChanges;
TMessageBoardMessageFunctionality(ObjFunctionality).idSenderMessageBoard:=idMessageBoard;
end;

procedure TMessageBoardMessagePanelProps.ReplyToSender;
var
  SC: TCursor;
  SenderBoardID: integer;
  idNewMessage: integer;
begin
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
if ObjFunctionality.Space.Status in [pssRemoted,pssRemotedBrief] then ObjFunctionality.Space.Log.OperationStarting('Message creating ...');
try
SenderBoardID:=TMessageBoardMessageFunctionality(ObjFunctionality).idSenderMessageBoard;
if SenderBoardID = 0 then Raise Exception.Create('sender is unknown'); //. =>
with TMessageBoardFunctionality(TComponentFunctionality_Create(idTMessageBoard,SenderBoardID)) do
try
idNewMessage:=CreateNewMessage;
finally
Release;
end;
try
with TMessageBoardMessageFunctionality(TComponentFunctionality_Create(idTMessageBoardMessage,idNewMessage)) do
try
idMessageBoard:=TMessageBoardMessageFunctionality(ObjFunctionality).idSenderMessageBoard;
idSenderMessageBoard:=TMessageBoardMessageFunctionality(ObjFunctionality).idMessageBoard;
Subject:='Re: '+TMessageBoardMessageFunctionality(ObjFunctionality).Subject;
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

function TMessageBoardMessagePanelProps.IsMessageUnSent: boolean;
begin
Result:=false;
with TMessageBoardMessageFunctionality(ObjFunctionality) do
with TMessageBoardFunctionality(TComponentFunctionality_Create(idTMessageBoard,idMessageBoard)) do
try
if idUser <> ObjFunctionality.Space.UserID
 then
  try
  CheckUserOperation(idReadOperation);
  Result:=true;
  except
    end;
finally
Release;
end;
end;

procedure TMessageBoardMessagePanelProps.sbChangeSenderMessageBoardClick(Sender: TObject);
begin
ChangeSenderMessageBoard;
end;

procedure TMessageBoardMessagePanelProps.sbReplyToSenderClick(Sender: TObject);
begin
ReplyToSender;
end;

procedure TMessageBoardMessagePanelProps.edSubjectKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TMessageBoardMessageFunctionality(ObjFunctionality).Subject:=edSubject.Text;
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  memoBody.SetFocus;
  end;
end;

procedure TMessageBoardMessagePanelProps.memoBodyKeyPress(Sender: TObject; var Key: Char);
begin
flBodyChanged:=true;
end;

procedure TMessageBoardMessagePanelProps.sbMessageReadClick(Sender: TObject);
begin
Updater.Disable;
try
TMessageBoardMessageFunctionality(ObjFunctionality).flRead:=true;
except
  Updater.Enabled;
  Raise; //.=>
  end;
Close;
end;

procedure TMessageBoardMessagePanelProps.sbSaveAndCloseClick(Sender: TObject);
begin
if (TMessageBoardMessageFunctionality(ObjFunctionality).idSenderMessageBoard = 0) AND
   (MessageBox('Sender is unknown for this message. Send it as is ?') <> mrYes)
 then Exit; //. ->
SaveChanges;
SendMessage;
end;

procedure TMessageBoardMessagePanelProps.sbMessageBoardClick(Sender: TObject);
begin
with TComponentFunctionality_Create(idTMessageBoard,TMessageBoardMessageFunctionality(ObjFunctionality).idMessageBoard) do
try
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TMessageBoardMessagePanelProps.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  flMessageUnSent: boolean;
begin
try
TMessageBoardMessageFunctionality(ObjFunctionality).Check;
SaveChanges;
if TMessageBoardMessageFunctionality(ObjFunctionality).IsEmpty AND (MessageBox('Message is empty. Delete him ?') = mrYes)
 then with TTMessageBoardMessageFunctionality.Create do
  try
  Updater.Disable;
  try
  DestroyInstance(ObjFunctionality.idObj);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  finally
  Release;
  end;
flMessageUnSent:=IsMessageUnSent;
except
  flMessageUnSent:=false;
  end;
if flMessageUnSent then Raise Exception.Create('the message is not sent (send or delete this message)'); //. =>
CanClose:=true;
end;

procedure TMessageBoardMessagePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TMessageBoardMessagePanelProps.Controls_ClearPropData;
begin
lbSenderName.Caption:='';
edDateCreated.Text:='';
edSubject.Text:='';
memoBody.Clear;
end;

procedure TMessageBoardMessagePanelProps.sbDeleteClick(Sender: TObject);
begin
if MessageBox('delete this message ?') = mrYes
 then with TTMessageBoardMessageFunctionality.Create do
  try
  Updater.Disable;
  try
  DestroyInstance(ObjFunctionality.idObj);
  except
    Updater.Enabled;
    Raise; //.=>
    end;
  Self.Close;
  finally
  Release;
  end;
end;

end.
