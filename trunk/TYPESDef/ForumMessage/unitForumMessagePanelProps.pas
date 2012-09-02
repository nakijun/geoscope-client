unit unitForumMessagePanelProps;

interface

uses
  UnitProxySpace, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Functionality, TypesDefines,TypesFunctionality,unitReflector,
  Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, SpaceObjInterpretation,
  ComCtrls, unitForumPanelProps;

type
  TForumMessagePanelProps = class(TSpaceObjPanelProps)
    pnlHeader: TPanel;
    Label2: TLabel;
    sbRecipient: TSpeedButton;
    sbSender: TSpeedButton;
    sbEdit: TSpeedButton;
    Label3: TLabel;
    lbSentTime: TLabel;
    Label4: TLabel;
    lbLastModified: TLabel;
    reMessage: TRichEdit;
    sbSend: TSpeedButton;
    sbReply: TSpeedButton;
    sbCite: TSpeedButton;
    sbDelete: TSpeedButton;
    procedure sbSenderClick(Sender: TObject);
    procedure sbRecipientClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbSendClick(Sender: TObject);
    procedure sbReplyClick(Sender: TObject);
    procedure reMessageKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure sbCiteClick(Sender: TObject);
    procedure reMessageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbDeleteClick(Sender: TObject);
  private
    { Private declarations }
    flUpdateOccured: boolean;
    OldFormShow: TNotifyEvent;
    flDisableCanDestroy: boolean;
    
    procedure DisableControls;
    procedure Controls_ClearPropData; override;
    procedure Send;
    procedure ReplyForMessage;
    procedure CiteForMessage;
  public
    { Public declarations }
    flModified: boolean;
    ForumPanelProps: TForumPanelProps;

    Constructor Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr); override;
    destructor Destroy; override;
    procedure _Update; override;
    procedure NormalizeSize;
  end;

implementation
Uses
  RichEdit, unitRTFEditor;

{$R *.DFM}

Constructor TForumMessagePanelProps.Create(pObjFunctionality: TComponentFunctionality; pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr);
begin
Inherited Create(pObjFunctionality, pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
if flReadOnly then DisableControls;
ForumPanelProps:=nil;
flUpdateOccured:=false;
flDisableCanDestroy:=false;
Update;
end;

destructor TForumMessagePanelProps.Destroy;
begin
Inherited;
end;

procedure TForumMessagePanelProps._Update;
var
  DT: TDateTime;
begin
if NOT flUpdateOccured then Inherited;
//.
if TForumMessageFunctionality(ObjFunctionality)._Message = nil then TForumMessageFunctionality(ObjFunctionality).UpdateDATA;
//.
try
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,TForumMessageFunctionality(ObjFunctionality)._idUser)) do
try
sbSender.Caption:=Name;
finally
Release;
end;
except
  sbSender.Caption:='?';
  end;
//.
try
with TForumMessageFunctionality(TComponentFunctionality_Create(idTForumMessage,TForumMessageFunctionality(ObjFunctionality)._idForMessage)) do
try
try
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,idUser)) do
try
sbRecipient.Caption:=Name;
finally
Release;
end;
except
  sbRecipient.Caption:='?';
  end;
finally
Release;
end;
except
  sbSender.Caption:='?';
  end;
//.
with TForumMessageFunctionality(ObjFunctionality) do begin
DT:=_SentTime;
if DT <> 0
 then lbSentTime.Caption:=FormatDateTime('HH:NN DD/MM/YY',DT)
 else lbSentTime.Caption:='?';
end;
//.
with TForumMessageFunctionality(ObjFunctionality) do begin
DT:=_LastModified;
if DT <> 0
 then lbLastModified.Caption:=FormatDateTime('HH:NN DD/MM/YY',DT)
 else lbLastModified.Caption:='?';
end;
//.
if TForumMessageFunctionality(ObjFunctionality)._idUser = TForumMessageFunctionality(ObjFunctionality).FunctionalityUserID
 then begin
  sbEdit.Show;
  sbSend.Enabled:=false;
  sbSend.Show;
  sbReply.Hide;
  sbCite.Hide;
  sbDelete.Show;  
  end
 else begin
  sbEdit.Hide;
  sbSend.Hide;
  sbReply.Show;
  sbCite.Show;
  end;
//.
with TForumMessageFunctionality(ObjFunctionality) do reMessage.Lines.LoadFromStream(_Message);
//.
FreeAndNil(TForumMessageFunctionality(ObjFunctionality)._Message);
//.
OldFormShow:=OnShow;
OnShow:=FormShow;
//.
flModified:=false;
flUpdateOccured:=true;
end;

procedure TForumMessagePanelProps.Send;
var
  MS: TMemoryStream;
begin
MS:=TMemoryStream.Create;
try
reMessage.Lines.SaveToStream(MS);
TForumMessageFunctionality(ObjFunctionality).SetMessage(MS);
finally
MS.Destroy;
end;
lbLastModified.Caption:=FormatDateTime('HH:NN DD/MM/YY',Now);
//.
with TForumMessageFunctionality(ObjFunctionality) do
if SentTime = 0
 then begin
  Updater.Disable;
  try
  TForumMessageFunctionality(ObjFunctionality).Send;
  except
    Updater.Enabled;
    Raise; //. =>
    end;                           
  //.
  lbSentTime.Caption:=FormatDateTime('HH:NN DD/MM/YY',Now);
  //.
  if ForumPanelProps <> nil then ForumPanelProps.AddNewMessagePanel(ObjFunctionality.idObj);
  end;
//.
flModified:=false;
sbSend.Enabled:=false;
//.
if Parent = nil then Close;
end;

procedure TForumMessagePanelProps.ReplyForMessage;
var
  idNewMessage: integer;
begin
with TForumFunctionality(TComponentFunctionality_Create(idTForum,TForumMessageFunctionality(ObjFunctionality).idForum)) do begin
idNewMessage:=AddMessage(Space.UserID,TForumMessageFunctionality(ObjFunctionality).idObj);
with TForumMessageFunctionality(TComponentFunctionality_Create(idTForumMessage,idNewMessage)) do
try
with TForumMessagePanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
ForumPanelProps:=Self.ForumPanelProps;
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

procedure TForumMessagePanelProps.CiteForMessage;
var
  idNewMessage: integer;
  MS: TMemoryStream;
  I: integer;
begin
with TForumFunctionality(TComponentFunctionality_Create(idTForum,TForumMessageFunctionality(ObjFunctionality).idForum)) do begin
idNewMessage:=AddMessage(Space.UserID,TForumMessageFunctionality(ObjFunctionality).idObj);
with TForumMessageFunctionality(TComponentFunctionality_Create(idTForumMessage,idNewMessage)) do
try
with TForumMessagePanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
ForumPanelProps:=Self.ForumPanelProps;
//.
TForumMessageFunctionality(Self.ObjFunctionality).GetMessage(MS);
try
reMessage.Lines.LoadFromStream(MS);
reMessage.Lines.Insert(0,'');
try
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,TForumMessageFunctionality(Self.ObjFunctionality).idUser)) do
try
reMessage.Lines.Insert(0,Name+' wrote:');
finally
Release;
end;
except
  reMessage.Lines.Insert(0,'? wrote:');
  end;
with reMessage  do for I:=0 to Lines.Count-1 do Lines[I]:='  > '+Lines[I];
finally
MS.Destroy;
end;
//.
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

procedure TForumMessagePanelProps.NormalizeSize;
var
  Min,Max: integer;
begin
if Parent <> nil
 then begin
  reMessage.ScrollBars:=ssVertical;
  GetScrollRange(reMessage.Handle,SB_VERT,Min,Max);
  reMessage.ScrollBars:=ssNone;
  ClientHeight:=reMessage.Top+Max;
  reMessage.Height:=Max;
  end
 else begin
  Max:=200;
  reMessage.ScrollBars:=ssVertical;
  ClientHeight:=reMessage.Top+Max;
  reMessage.Height:=Max;
  end;
end;

procedure TForumMessagePanelProps.DisableControls;
var
  I: integer;
begin
for I:=0 to ComponentCount-1 do
  if (Components[I] is TEdit) OR (Components[I] is TDBEdit) OR (Components[I] is TComboBox)
   then TControl(Components[I]).Enabled:=false;
end;

procedure TForumMessagePanelProps.Controls_ClearPropData;
begin
sbSender.Caption:='';
sbRecipient.Caption:='';
lbSentTime.Caption:='';
lbLastModified.Caption:='';
reMessage.Clear;
end;

procedure TForumMessagePanelProps.sbSenderClick(Sender: TObject);
begin
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,TForumMessageFunctionality(ObjFunctionality).idUser)) do
try
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
Left:=Round((Screen.Width-Width)/2);
Top:=Round((Screen.Height-Height)/2);
Show;
end;
finally
Release;
end;
end;

procedure TForumMessagePanelProps.sbRecipientClick(Sender: TObject);
begin
with TForumMessageFunctionality(TComponentFunctionality_Create(idTForumMessage,TForumMessageFunctionality(ObjFunctionality).idForMessage)) do
try
Check;
with TForumMessagePanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
ForumPanelProps:=Self.ForumPanelProps;
Left:=Round((Screen.Width-Width)/2);
Show;
NormalizeSize;
Top:=Round((Screen.Height-Height)/2);
end;
finally
Release;
end;
end;

procedure TForumMessagePanelProps.sbEditClick(Sender: TObject);
begin
with TfmEditor.Create(Self) do
try
ShowModal;
finally
Destroy;
end;                                  
end;

procedure TForumMessagePanelProps.sbSendClick(Sender: TObject);
begin
Send;
end;

procedure TForumMessagePanelProps.sbReplyClick(Sender: TObject);
begin
ReplyForMessage;
end;

procedure TForumMessagePanelProps.reMessageKeyPress(Sender: TObject; var Key: Char);
begin
if NOT flModified
 then begin
  flModified:=true;
  sbSend.Enabled:=true;
  end;
end;

procedure TForumMessagePanelProps.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if flDisableCanDestroy then Exit; //. ->
with TForumMessageFunctionality(ObjFunctionality) do begin
try
Check;
except
  CanClose:=true;
  Exit;
  end;
if SentTime = 0
 then begin
  Application.MessageBox('This message is unsent. You must send or destroy it.','Attention');
  CanClose:=false;
  end;
end;
end;

procedure TForumMessagePanelProps.FormShow(Sender: TObject);
begin
if Assigned(OldFormShow) then OldFormShow(Sender);
if Parent = nil
 then begin
  try
  with TForumFunctionality(TComponentFunctionality_Create(idTForum,TForumMessageFunctionality(ObjFunctionality)._idForum)) do
  try
  Self.Caption:='Forum: '+Name;
  finally
  Release;
  end;
  except
    Self.Caption:='Forum: '+'?';
    end;
  sbDelete.Show;  
  reMessage.ReadOnly:=false;
  reMessage.Color:=clWhite;
  end;
end;

procedure TForumMessagePanelProps.sbCiteClick(Sender: TObject);
begin
CiteForMessage;
end;

procedure TForumMessagePanelProps.reMessageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
MSPointer_X:=reMessage.Left+X;
MSPointer_Y:=reMessage.Top+Y;
end;

procedure TForumMessagePanelProps.sbDeleteClick(Sender: TObject);
begin
//. I variant
Updater.Disable;
try
try
ObjFunctionality.TypeFunctionality.DestroyInstance(ObjFunctionality.idObj);
except
  //. II variant
  TForumFunctionality(ForumPanelProps.ObjFunctionality).DestroyMessage(ObjFunctionality.idObj);
  end;
except
  Updater.Enabled;
  Raise; //. =>
  end;
flDisableCanDestroy:=true;
Close;
end;

end.
