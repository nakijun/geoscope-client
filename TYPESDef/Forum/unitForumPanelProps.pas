unit unitForumPanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation;

type
  TForumPanelProps = class;

  TUpdating = class(TThread)
  private
    PanelProps: TForumPanelProps;
    MessageFunctionality: TForumMessageFunctionality;
    flDone: boolean;
    evtUpdateNeeded: THandle;

    Constructor Create(const pPanelProps: TForumPanelProps);
    Destructor Destroy; override;
    procedure Execute; override;
    procedure ForceToUpdate;
    procedure DoOnStart;
    procedure DoOnFinish;
    procedure DoOnAddMessage;
    procedure ShowPanel;
  end;

  TForumPanelProps = class(TSpaceObjPanelProps)
    Panel3: TPanel;
    Label1: TLabel;
    edName: TEdit;
    sbAddAndShowNewMessage: TSpeedButton;
    imgUpdatingFinish: TImage;
    imgUpdatingStart: TImage;
    sbUpdate: TSpeedButton;
    edMessagesPerPage: TEdit;
    sbFirstPage: TSpeedButton;
    sbPredPage: TSpeedButton;
    sbNextPage: TSpeedButton;
    sbLastPage: TSpeedButton;
    lbPagesCounter: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    edMessagesCount: TEdit;
    edUpdateInterval: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edMessageLifeTime: TEdit;
    sbClearOldMessages: TSpeedButton;
    sbMessages: TScrollBox;
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure sbAddAndShowNewMessageClick(Sender: TObject);
    procedure sbUpdateClick(Sender: TObject);
    procedure sbFirstPageClick(Sender: TObject);
    procedure sbPredPageClick(Sender: TObject);
    procedure sbNextPageClick(Sender: TObject);
    procedure sbLastPageClick(Sender: TObject);
    procedure edMessagesPerPageKeyPress(Sender: TObject; var Key: Char);
    procedure edUpdateIntervalKeyPress(Sender: TObject; var Key: Char);
    procedure edMessageLifeTimeKeyPress(Sender: TObject; var Key: Char);
    procedure sbClearOldMessagesClick(Sender: TObject);
    procedure sbMessagesMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
    Updating: TUpdating;
    sbMessages_0Height: integer;
    LastY: integer;
    MessagesCount: integer;
    MessagesPerPage: integer;
    PagesCount: integer;
    PageIndex: integer;
    UpdateInterval: integer;
    flWriteEnabled: boolean;
    OldOnShow: TNotifyEvent;

    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure DoOnShow(Sender: TObject);
    procedure ChangePages(const pMessagesPerPage: integer);
  public
    { Public declarations }
    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure AddAndShowNewMessage;
    procedure AddNewMessagePanel(const idNewMessage: integer);
  end;

implementation
uses
  unitForumMessagePanelProps;


{$R *.DFM}

{TUpdating}
Constructor TUpdating.Create(const pPanelProps: TForumPanelProps);
begin
PanelProps:=pPanelProps;
flDone:=false;
evtUpdateNeeded:=CreateEvent(nil,false,false,nil);
Inherited Create(false);
end;

Destructor TUpdating.Destroy;
begin
Inherited;
CloseHandle(evtUpdateNeeded);
end;

procedure TUpdating.Execute;

  procedure UpdateMessages(var MessageList: TList);
  var
    NewMessageList: TList;
    I: integer;
    idMessage: integer;
  begin
  with PanelProps do
  with TForumFunctionality(TComponentFunctionality_Create(PanelProps.ObjFunctionality.idTObj,PanelProps.ObjFunctionality.idObj)) do
  try
  GetMessageList(NewMessageList);
  try
  for I:=0 to NewMessageList.Count-1 do begin
    idMessage:=Integer(NewMessageList[I]);
    if MessageList.IndexOf(Pointer(idMessage)) = -1
     then begin
      if (MessageList.Add(Pointer(idMessage)) DIV MessagesPerPage) = PageIndex
       then begin
        MessageFunctionality:=TForumMessageFunctionality(TComponentFunctionality_Create(idTForumMessage,idMessage));
        MessageFunctionality.UpdateDATA;
        Synchronize(ShowPanel);
        Synchronize(DoOnAddMessage);
        Windows.Beep(3000,100);
        end;
      end;
    end;
  finally
  NewMessageList.Destroy;
  end;
  finally
  Release;
  end;
  end;

var
  MessageList: TList;
  I,J: integer;
begin
Synchronize(DoOnStart);
with PanelProps do
with TForumFunctionality(TComponentFunctionality_Create(PanelProps.ObjFunctionality.idTObj,PanelProps.ObjFunctionality.idObj)) do
try
GetMessageList(MessageList);
try
LastY:=0;
for I:=0 to MessageList.Count-1 do begin
  if Terminated then Break; //. ->
  if (I DIV MessagesPerPage) = PageIndex
   then begin
    MessageFunctionality:=TForumMessageFunctionality(TComponentFunctionality_Create(idTForumMessage,Integer(MessageList[I])));
    MessageFunctionality.Check;
    MessageFunctionality.UpdateDATA;
    Synchronize(ShowPanel);
    end;
  end;
flDone:=true;
Synchronize(DoOnFinish);
//. updating
I:=1;
while NOT Terminated do begin
  for J:=0 to 9 do begin
    if Terminated then Exit; //. ->
    Sleep(100);
    end;
  if ((I MOD UpdateInterval) = 0) OR (WaitForSingleObject(evtUpdateNeeded,0) = WAIT_OBJECT_0) then UpdateMessages(MessageList);
  Inc(I);
  end;
finally
MessageList.Destroy;
end;
finally
Release;
end;
end;

procedure TUpdating.ForceToUpdate;
begin
SetEvent(evtUpdateNeeded);
end;

procedure TUpdating.DoOnStart;
begin
with PanelProps do begin
imgUpdatingStart.Show;
imgUpdatingFinish.Hide;
end;
end;

procedure TUpdating.DoOnFinish;
begin
with PanelProps do begin
imgUpdatingStart.Hide;
imgUpdatingFinish.Show;
sbMessages.VertScrollBar.Visible:=false;
sbMessages.VertScrollBar.Visible:=true;
ReFresh;
end;
end;

procedure TUpdating.DoOnAddMessage;
begin
with PanelProps do begin
Inc(MessagesCount);
edMessagesCount.Text:=IntToStr(MessagesCount);
end;
end;

procedure TUpdating.ShowPanel;
var
  MessagePanelProps: TForumMessagePanelProps;
begin
with MessageFunctionality do
try
Inc(Space.Log.OperationsCount);
try
MessagePanelProps:=TForumMessagePanelProps(TPanelProps_Create(false, 0,nil,nilObject));
finally
Dec(Space.Log.OperationsCount);
end;
finally
Release;
end;
with PanelProps,MessagePanelProps do begin
ForumPanelProps:=PanelProps;
PanelProps.sbMessages.InsertComponent(MessagePanelProps);
BorderStyle:=bsNone;
Parent:=PanelProps.sbMessages;
flFreeOnClose:=false;
Left:=0;
Top:=LastY-sbMessages.VertScrollBar.Position;
Width:=sbMessages.ClientWidth-sbMessages.VertScrollBar.Size;
if flWriteEnabled then sbDelete.Show;
Show;
NormalizeSize;
Inc(LastY,Height);
if LastY > sbMessages_0Height then sbMessages.VertScrollBar.Range:=LastY;
end;
end;


{TForumPanelProps}
Constructor TForumPanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
Updating:=nil;
Height:=Screen.DesktopHeight-64;
MessagesPerPage:=33;
PageIndex:=0;
UpdateInterval:=60;
//.
flWriteEnabled:=false;
try
Updater.Disable;
try
TForumFunctionality(ObjFunctionality).Name:=ObjFunctionality.Name; //. be passed if write oparation enabled for current user
except
  Updater.Enabled;
  Raise; //. =>
  end;
flWriteEnabled:=true;
sbClearOldMessages.Show;
except
  flWriteEnabled:=false;
  sbClearOldMessages.Hide;
  end;
//.
Update;
end;

destructor TForumPanelProps.Destroy;
begin
Updating.Free;
Inherited;
end;

procedure TForumPanelProps._Update;
var
  MLT: Integer;
begin
Inherited;
edName.Text:=TForumFunctionality(ObjFunctionality).Name;
MLT:=Round(TForumFunctionality(ObjFunctionality).MessageLifeTime);
if MLT >= 0
 then edMessageLifeTime.Text:=IntToStr(MLT)
 else edMessageLifeTime.Text:='--';
FreeAndNil(Updating);
sbMessages.DestroyComponents;
sbMessages_0Height:=Screen.Height+1;
sbMessages.VertScrollBar.Range:=sbMessages_0Height;
MessagesCount:=TForumFunctionality(ObjFunctionality).MessageCount;
PagesCount:=(MessagesCount DIV MessagesPerPage);
if (MessagesCount MOD MessagesPerPage) > 0 then Inc(PagesCount);
//.
edMessagesCount.Text:=IntToStr(MessagesCount);
edMessagesPerPage.Text:=IntToStr(MessagesPerPage);
lbPagesCounter.Caption:=IntToStr(PageIndex+1)+'/'+IntToStr(PagesCount);
edUpdateInterval.Text:=IntToStr(UpdateInterval);
if PageIndex = 0
 then begin
  sbFirstPage.Enabled:=false;
  sbPredPage.Enabled:=false;
  end
 else begin
  sbFirstPage.Enabled:=true;
  sbPredPage.Enabled:=true;
  end;
if PageIndex >= PagesCount-1
 then begin
  sbLastPage.Enabled:=false;
  sbNextPage.Enabled:=false;
  end
 else begin
  sbLastPage.Enabled:=true;
  sbNextPage.Enabled:=true;
  end;
//.
OldOnShow:=OnShow;
OnShow:=DoOnShow;
//.
Updating:=TUpdating.Create(Self);
end;

procedure TForumPanelProps.AddAndShowNewMessage;
var
  idNewMessage: integer;
begin
with TForumFunctionality(ObjFunctionality) do begin
idNewMessage:=AddMessage(Space.UserID,0);
with TForumMessageFunctionality(TComponentFunctionality_Create(idTForumMessage,idNewMessage)) do
try
with TForumMessagePanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
ForumPanelProps:=Self;
Left:=Round((Screen.Width-Width)/2);
Top:=Round((Screen.Height-Height)/2);
Show;
NormalizeSize;
end;
finally
Release;
end;
end;
end;

procedure TForumPanelProps.AddNewMessagePanel(const idNewMessage: integer);
begin
if Updating <> nil then Updating.ForceToUpdate;
end;

procedure TForumPanelProps.ChangePages(const pMessagesPerPage: integer);
begin
MessagesPerPage:=pMessagesPerPage;
Update;
end;

procedure TForumPanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TForumPanelProps.Controls_ClearPropData;
begin
edName.Text:='';
end;

procedure TForumPanelProps.DoOnShow(Sender: TObject);
begin
if Assigned(OldOnShow) then OldOnShow(Sender);
sbMessages.SetFocus;
end;

procedure TForumPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  Updater.Disable;
  try
  TForumFunctionality(ObjFunctionality).Name:=edName.Text;
  except
    Updater.Enabled;
    Raise; //. =>
    end;
  end;
end;

procedure TForumPanelProps.sbAddAndShowNewMessageClick(Sender: TObject);
begin
AddAndShowNewMessage;
end;

procedure TForumPanelProps.sbUpdateClick(Sender: TObject);
begin
Update;
end;

procedure TForumPanelProps.sbFirstPageClick(Sender: TObject);
begin
PageIndex:=0;
Update;
end;

procedure TForumPanelProps.sbPredPageClick(Sender: TObject);
begin
Dec(PageIndex);
Update;
end;

procedure TForumPanelProps.sbNextPageClick(Sender: TObject);
begin
Inc(PageIndex);
Update;
end;

procedure TForumPanelProps.sbLastPageClick(Sender: TObject);
begin
PageIndex:=PagesCount-1;
Update;
end;

procedure TForumPanelProps.edMessagesPerPageKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D then ChangePages(StrToInt(edMessagesPerPage.Text));
end;

procedure TForumPanelProps.edUpdateIntervalKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then begin
  UpdateInterval:=StrToInt(edUpdateInterval.Text);
  Update;
  end
end;

procedure TForumPanelProps.edMessageLifeTimeKeyPress(Sender: TObject; var Key: Char);
var
  MLT: TDateTime;
begin
if Key = #$0D
 then begin
  MLT:=StrToInt(edMessageLifeTime.Text);
  Updater.Disable;
  try
  TForumFunctionality(ObjFunctionality).MessageLifeTime:=MLT;
  except
    Updater.Enabled;
    Raise; //. =>
    end;
  end
end;

procedure TForumPanelProps.sbClearOldMessagesClick(Sender: TObject);
begin
if (MessageDlg('Clear old messages ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes) then TForumFunctionality(ObjFunctionality).MessageLifeTime:=TForumFunctionality(ObjFunctionality).MessageLifeTime;
end;

procedure TForumPanelProps.sbMessagesMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  NP: integer;
begin
with sbMessages do 
if VertScrollBar.Visible
 then with VertScrollBar do begin
  NP:=Position-WheelDelta;
  if (NP < 0)
   then NP:=0
   else if NP > Range then NP:=Range;
  if NP <> Position then Position:=NP;
  end;
end;

end.
