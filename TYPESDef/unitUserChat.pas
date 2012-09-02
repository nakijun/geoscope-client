unit unitUserChat;

interface

uses
  Windows, ActiveX, Messages, SysUtils, Variants, Classes, SyncObjs, Graphics, Controls, Forms, MMSystem,
  DBClient, Dialogs, Buttons, StdCtrls, ComCtrls, ExtCtrls, GlobalSpaceDefines, unitProxySpace, Functionality, TypesFunctionality;

type
  TItemMessagesQueue = record
    ptrNext: pointer;
    UserID: integer;
    Message: WideString;
  end;

  TfmUserChatBox = class;

  TUserChatBoxes = class(TList)
  private
    Lock: TCriticalSection;
    Space: TProxySpace;
  public
    MessagesQueue: pointer;
    MessagesProcessor: TTimer;

    Constructor Create(pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Clear;
    procedure ClearMessagesQueue;
    procedure AddMessage(const pUserID: integer; const pMessage: WideString);
    procedure MessagesProcessor_ProcessMessages(Sender: TObject);
    function GetUserChatBox(const UserID: integer): TfmUserChatBox;
  end;

  TOverridedRichEdit = class(TRichEdit)
  protected
    procedure CreateParams(var Params : TCreateParams); override;
  end;

  TfmUserChatBox = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    lbUserName: TLabel;
    imgUserInactiveState: TImage;
    imgUserActiveState: TImage;
    Updater: TTimer;
    Bevel3: TBevel;
    Bevel4: TBevel;
    sbReply: TSpeedButton;
    Label2: TLabel;
    memoReply: TMemo;
    Bevel5: TBevel;
    cbAudionChatEnabled: TCheckBox;
    pnlAudioChat: TPanel;
    imgUserUnknownState: TImage;
    procedure sbReplyClick(Sender: TObject);
    procedure UpdaterTimer(Sender: TObject);
    procedure memoReplyKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Space: TProxySpace;
    UserID: integer;
    UserName: shortstring;
    UserStatusLastCheckTime: TDateTime;
    UserProxySpaceIP: string;
    UserChatAudioPacketArray: PSafeArray;
    UserChatAudioPacketArrayDataPtr: pointer;
    reHistory: TMemo;

    procedure UpdateUserStateInfo;
  public
    { Public declarations }
    Constructor Create(pSpace: TProxySpace; const pUserID: integer);
    Destructor Destroy; override;

    //. text
    procedure AddUserMessage(const Message: WideString);
    procedure Reply(const Message: WideString);
    //. Audio
    procedure DoOnAudioInFormatPrepared(const Format: TWaveFormatEx; const EncryptionInfo: WideString);
    procedure DoOnAudioInBufferFilled(BufferPtr: pointer; BufferSize: integer; const EncryptionInfo: WideString);
    procedure DoOnAudioInReadingStop(const EncryptionInfo: WideString);
    //.
  end;


  procedure AddUserMessage(const SenderID: integer; const Message: WideString); stdcall;
  function GetUserChatBox(const UserID: integer): TfmUserChatBox; stdcall;
  procedure Finalize;


  //. main chat dispatch routine
  procedure DoOnUserChatMessages(const MessagesList: TList);

var
  UserChatBoxes: TUserChatBoxes;

implementation
Uses
  TypesDefines, unitRPC, RichEdit, unitChatAudioInReading, unitChatAudioOutWriting;

{$R *.dfm}

//. main chat dispatch routine
procedure DoOnUserChatMessages(const MessagesList: TList);
var
  I: integer;
  MS: shortstring;
begin
if UserChatBoxes <> nil
 then
  for I:=MessagesList.Count-1 downto 0 do with TProxySpaceUserIncomingMessagesItem(MessagesList[I]^) do begin
    TProxySpaceUserIncomingMessages.ConvertMessageToShortString(Message, MS);
    UserChatBoxes.AddMessage(SenderID,MS);
    end;
end;


{TUserChatBoxes}
Constructor TUserChatBoxes.Create(pSpace: TProxySpace);
begin
Inherited Create;
Space:=pSpace;
MessagesQueue:=nil;
Lock:=TCriticalSection.Create;
MessagesProcessor:=TTimer.Create(nil);
with MessagesProcessor do begin
Interval:=100; //. check each 100 milliseconds
OnTimer:=MessagesProcessor_ProcessMessages;
Enabled:=true;
end;
end;

Destructor TUserChatBoxes.Destroy;
begin
MessagesProcessor.Free;
Lock.Free;
ClearMessagesQueue;
Clear;
Inherited;
end;

procedure TUserChatBoxes.Clear;
var
  DestroyChatBox: TfmUserChatBox;
  I: integer;
begin
for I:=0 to Count-1 do begin
  DestroyChatBox:=List[I];
  List[I]:=nil;
  DestroyChatBox.Destroy;
  end;
Inherited Clear;
end;

procedure TUserChatBoxes.ClearMessagesQueue;
var
  ptrDestroyItem: pointer;
begin
while MessagesQueue <> nil do begin
  ptrDestroyItem:=MessagesQueue;
  MessagesQueue:=TItemMessagesQueue(ptrDestroyItem^).ptrNext;
  TItemMessagesQueue(ptrDestroyItem^).Message:=''; //. deallocate memory of widestring
  FreeMem(ptrDestroyItem,SizeOf(TItemMessagesQueue));
  end;
end;

procedure TUserChatBoxes.AddMessage(const pUserID: integer; const pMessage: WideString);
var
  ptrNewItem: pointer;
begin
GetMem(ptrNewItem,SizeOf(TItemMessagesQueue));
Lock.Enter;
try
with TItemMessagesQueue(ptrNewItem^) do begin
ptrNext:=MessagesQueue;
UserID:=pUserID;
Pointer(Message):=nil;
Message:=pMessage;
end;
MessagesQueue:=ptrNewItem;
finally
Lock.Leave;
end;
end;

procedure TUserChatBoxes.MessagesProcessor_ProcessMessages(Sender: TObject);
var
  ptrItem: pointer;
  flMessageProcessed: boolean;
  I: integer;
  NewChatBox: TfmUserChatBox;
begin
while MessagesQueue <> nil do begin
  Lock.Enter;
  try
  ptrItem:=MessagesQueue;
  MessagesQueue:=TItemMessagesQueue(ptrItem^).ptrNext;
  finally
  Lock.Leave;
  end;
  //. process message
  flMessageProcessed:=false;
  for I:=0 to Count-1 do
    if TfmUserChatBox(List[I]).UserID = TItemMessagesQueue(ptrItem^).UserID
     then begin
      TfmUserChatBox(List[I]).AddUserMessage(TItemMessagesQueue(ptrItem^).Message);
      flMessageProcessed:=true;
      Break; //. >
      end;
  if NOT flMessageProcessed
   then begin
    NewChatBox:=TfmUserChatBox.Create(Space,TItemMessagesQueue(ptrItem^).UserID);
    with NewChatBox do begin
    Left:=Round((Screen.Width-Width)/2)+Random(50);
    Top:=Round((Screen.Height-Height)/2)+Random(50);
    AddUserMessage(TItemMessagesQueue(ptrItem^).Message);
    end;
    Add(NewChatBox);
    end;
  //.
  TItemMessagesQueue(ptrItem^).Message:=''; //. deallocate memory of widestring
  FreeMem(ptrItem,SizeOf(TItemMessagesQueue));
  end;
end;

function TUserChatBoxes.GetUserChatBox(const UserID: integer): TfmUserChatBox;
var
  flProcessed: boolean;
  I: integer;
begin
flProcessed:=false;
for I:=0 to Count-1 do
  if TfmUserChatBox(List[I]).UserID = UserID
   then begin
    Result:=List[I];
    flProcessed:=true;
    Break; //. >
    end;
if NOT flProcessed
 then begin
  Result:=TfmUserChatBox.Create(Space,UserID);
  with Result do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Round((Screen.Height-Height)/2);
  end;
  Add(Result);
  end;
end;



{TOverridedRichEdit}
procedure TOverridedRichEdit.CreateParams(var Params : TCreateParams);
begin
inherited CreateParams(Params);
if DCOMPlatform <> dpWinNT then Params.ExStyle := Params.ExStyle OR ES_EX_NOCALLOLEINIT;
end;



{TfmUserChatBox}
Constructor TfmUserChatBox.Create(pSpace: TProxySpace; const pUserID: integer);
begin
Inherited Create(nil);
Space:=pSpace;
UserID:=pUserID;
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,UserID)) do
try
Self.UserName:=getName;
if Self.UserName = '' then Self.UserName:='?';
lbUserName.Caption:=Self.UserName+'  /'+FullName+'/';
finally
Release;
end;
//.
if fmChatAudioInReading = nil then fmChatAudioInReading:=TfmChatAudioInReading.Create(Self);
with fmChatAudioInReading do begin
if flReading then Stop;
OnReadingStop:=DoOnAudioInReadingStop;
OnFormatPrepared:=DoOnAudioInFormatPrepared;
OnBufferFilled:=DoOnAudioInBufferFilled;
Parent:=pnlAudioChat;
Left:=1;
Top:=2;
Show;
end;
//.
if fmChatAudioOutWriting = nil then fmChatAudioOutWriting:=TfmChatAudioOutWriting.Create(Self);
with fmChatAudioOutWriting do begin
if flWriting then Stop;
Parent:=pnlAudioChat;
Left:=1;
Top:=fmChatAudioInReading.Top+fmChatAudioInReading.Height+1;
Show;
end;
//.
UserStatusLastCheckTime:=0;
//.
UpdateUserStateInfo;
end;

Destructor TfmUserChatBox.Destroy;
begin
Inherited;
end;

procedure TfmUserChatBox.AddUserMessage(const Message: WideString);
var
  S: WideString;
  TL: integer;
begin
with reHistory do begin
Self.Show;
Self.WindowState:=wsNormal;
SetFocus;
TL:=Length(Text);
S:=UserName+': '+Message;
Lines.Add(S);
SelStart:=TL;
SelLength:=Length(S);
{/// ? with SelAttributes do begin
Color:=clBlack;
Style:=[fsItalic];
end;}
SelStart:=Length(Text)-1; SelLength:=1;
end;
memoReply.SetFocus;
end;

procedure TfmUserChatBox.Reply(const Message: WideString);
var
  SC: TCursor;
  TL: integer;
  S: shortstring;
  SS: TMemoryStream;
  I: integer;
begin
S:=Message;
//. transmitting
memoReply.Color:=clSilver;
SC:=Screen.Cursor;
Screen.Cursor:=crHourGlass;
try
with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,UserID)) do
try
TProxySpaceUserIncomingMessages.ConvertShortStringToMessage(S, SS);
try
IncomingMessages_SendNew(SS,Space.UserID);
finally
SS.Destroy;
end;
finally
Release;
end;
finally
Screen.Cursor:=SC;
memoReply.Color:=clWhite;
end;
//.
with reHistory do begin
SetFocus;
Application.ProcessMessages;
TL:=Length(Text);
S:=Space.UserName+': '+Message;
Lines.Add(S);
SelStart:=TL;
SelLength:=Length(S);
{/// ? with SelAttributes do begin
Color:=clGray;
Style:=[];
end;}SelStart:=Length(Text)-1; SelLength:=1;
end;
Application.ProcessMessages;
memoReply.SetFocus;
end;

procedure TfmUserChatBox.DoOnAudioInFormatPrepared(const Format: TWaveFormatEx; const EncryptionInfo: WideString);
var
  VarBound: TVarArrayBound;
  PA: PSafeArray;
  DataPtr: pointer;
  IUnk: IUnknown;
begin
FillChar(VarBound, SizeOf(VarBound), 0);
VarBound.ElementCount:=SizeOf(Format);
PA:=SafeArrayCreate(varByte, 1, VarBound);
SafeArrayAccessData(PA, DataPtr);
try
TWaveFormatEx(DataPtr^):=Format;
finally
SafeArrayUnAccessData(PA);
end;
//. prepare packet array
FillChar(VarBound, SizeOf(VarBound), 0);
VarBound.ElementCount:=SignalBufferMaxSize;
UserChatAudioPacketArray:=SafeArrayCreate(varByte, 1, VarBound);
SafeArrayAccessData(UserChatAudioPacketArray, UserChatAudioPacketArrayDataPtr);
//.
try
/// ? UserProxySpaceManager.TransmitData(Integer(tdtChatAudioHeader),PA,SizeOf(Format), EncryptionInfo);
finally
SafeArrayDestroy(PA);
end;
end;

procedure TfmUserChatBox.DoOnAudioInBufferFilled(BufferPtr: pointer; BufferSize: integer; const EncryptionInfo: WideString);
begin
/// ? if UserProxySpaceManager = nil then Exit; //. ->
asm
   PUSH ESI
   PUSH EDI
   PUSH ECX
   MOV ESI,BufferPtr
   MOV EAX,Self
   MOV EDI,[EAX].UserChatAudioPacketArrayDataPtr
   MOV ECX,BufferSize
   CLD
   REP MOVSB
   POP ECX
   POP EDI
   POP ESI
end;
/// ? UserProxySpaceManager.TransmitData(Integer(tdtChatAudioPacket),UserChatAudioPacketArray,BufferSize, EncryptionInfo);
end;

procedure TfmUserChatBox.DoOnAudioInReadingStop(const EncryptionInfo: WideString);
begin
/// ? UserProxySpaceManager.TransmitData(Integer(tdtChatAudioStopPacket),nil,0, EncryptionInfo);
/// ? UserProxySpaceManager:=nil;
//.
SafeArrayUnAccessData(UserChatAudioPacketArrayDataPtr);
SafeArrayDestroy(UserChatAudioPacketArray);
end;

procedure TfmUserChatBox.UpdateUserStateInfo;
const
  WaitTimeOfUserResponse = 25/(24*3600);
  IntervalOfGetUserStatus = 20/(24*3600);
var
  M: TMemoryStream;
  PartnerStatus: TProxySpaceUserStatus;
  MessageList: TList;
  I: integer;
  MS: shortstring;
begin
if UserStatusLastCheckTime > 0
 then begin //. try to get user status from incoming messages
  if (Now-UserStatusLastCheckTime) > WaitTimeOfUserResponse
   then begin
    if Space.UserIncomingMessages.GetUserStatus(Self.UserID, WaitTimeOfUserResponse, PartnerStatus)
     then begin
      case PartnerStatus of
      susOnLine: begin
        imgUserInActiveState.Hide;
        imgUserActiveState.Show;
        end;
      else
        imgUserActiveState.Hide;
        imgUserInActiveState.Show;
      end;
      UserStatusLastCheckTime:=0;
      end
     else begin
      imgUserActiveState.Hide;
      imgUserInActiveState.Show;
      end;
    UserStatusLastCheckTime:=-UserStatusLastCheckTime;   
    end;
  end
 else 
  if UserStatusLastCheckTime = 0
   then with TMODELUserFunctionality(TComponentFunctionality_Create(idTMODELUser,Self.UserID)) do
    try
    Space.UserIncomingMessages.ConvertShortStringToMessage('#GETUSERSTATUS', M);
    try
    IncomingMessages_SendNew(M,Space.UserID);
    finally
    M.Destroy;
    end;
    finally
    Release;
    UserStatusLastCheckTime:=Now;
    end
   else
    if (Now-Abs(UserStatusLastCheckTime)) > IntervalOfGetUserStatus
     then UserStatusLastCheckTime:=0; //. start get user status again
end;

procedure TfmUserChatBox.FormCreate(Sender: TObject);
begin
reHistory:=TMemo.Create(Self);
with reHistory do begin
Parent:=Self;
Left:=56;
Top:=56;
Width:=417;
Height:=177;
Font.Name:='Tahoma';
Font.Size:=10;
Color:=clWindow;
ScrollBars:=ssBoth;
ReadOnly:=true;
end;
end;

procedure TfmUserChatBox.sbReplyClick(Sender: TObject);
begin
Reply(memoReply.Text);
with memoReply do begin
Text:='';
SelStart:=0; SelLength:=0;
end;
end;

procedure TfmUserChatBox.memoReplyKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #$0D
 then with memoReply do begin
  Reply(Text);
  Text:='';
  SelStart:=0; SelLength:=0;
  Key:=#0;
  end;
end;

procedure TfmUserChatBox.UpdaterTimer(Sender: TObject);
begin
if Visible then UpdateUserStateInfo;
end;

procedure TfmUserChatBox.FormActivate(Sender: TObject);
begin
memoReply.SetFocus;
end;




//.
procedure AddUserMessage(const SenderID: integer; const Message: WideString);
begin
if UserChatBoxes <> nil then UserChatBoxes.AddMessage(SenderID, Message);
end;

//.
function GetUserChatBox(const UserID: integer): TfmUserChatBox;
begin
if UserChatBoxes = nil then Exit; //. ->
Result:=UserChatBoxes.GetUserChatBox(UserID);
with Result do begin
WindowState:=wsNormal;
Show;
end;
end;

//.
procedure Finalize;
begin
fmChatAudioOutWriting.Free;
fmChatAudioOutWriting:=nil;
fmChatAudioInReading.Free;
fmChatAudioInReading:=nil;
UserChatBoxes.Free;
UserChatBoxes:=nil;
end;


Initialization
UserChatBoxes:=nil;


Finalization
Finalize;

end.
