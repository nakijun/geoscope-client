unit unitNotificationAreaEventsProcessor;

interface

uses
  Windows, Messages, SysUtils, SyncObjs, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GlobalSpaceDefines, ExtCtrls, Buttons, ComCtrls,
  IdBaseComponent, IdCoder, IdCoder3to4, IdCoderMIME;

const
  NotificationAreaEventsProcessorConfigurationFileName = 'AreaNotificationServer.ini';

  WM_SHOWPANEL = WM_USER+1;
  WM_UPDATELOG = WM_USER+2;
  WM_UPDATESTATISTICS = WM_USER+3;
  
  LogMaxItems = 300;
  
type
  TfmNotificationAreaEventsProcessorPanel = class;

  TNotificationAreaEventsProcessor = class;

  TEventSendMethod = (esmUnknown,esmMBM,esmEMAIL,esmSMS);

  TMessageType = (
    mtDefault = 0,
    mtEN = 1,
    mtRU = 2
  );

  TEventSendEndpoint = record
    SendMethod: TEventSendMethod;
    MessageType: TMessageType;
    Address: shortstring;
  end;

  TSMSSendingType = (sstUnknown,sstText,sstPDU);

  TNotificationAreaEventsProcessorConfig = record
    MBM_flEnabled: boolean;
    MBM_idPositionerPrototype: integer;
    MBM_idCoReferencePrototype: integer;
    MBM_SenderMessageBoardID: integer;
    MBM_MessageComponentsLeft: integer;
    MBM_MessageComponentsTop: integer;
    EMAIL_flEnabled: boolean;
    EMAIL_ServerAddress: shortstring;
    EMAIL_ServerPort: integer;
    EMAIL_ConnectingTime: integer;
    EMAIL_UseAuthentication: boolean;
    EMAIL_SenderAddress: shortstring;
    EMAIL_SenderUserName: shortstring;
    EMAIL_SenderUserPassword: shortstring;
    SMS_flEnabled: boolean;
    SMS_SendingType: TSMSSendingType;
    SMS_CommPort: integer;
    SMS_PortSpeed: integer;
  end;

  TNotificationAreaEventsProcessorStat = record
    MBM_SentCount: integer;
    EMAIL_SentCount: integer;
    SMS_SentCount: integer;
  end;

  TSMSTransmitter = class
  private
    Processor: TNotificationAreaEventsProcessor;
    SendingType: TSMSSendingType;

    Constructor Create(const pProcessor: TNotificationAreaEventsProcessor); virtual;
    procedure SendMessage(const Address: shortstring; const Message: shortstring); virtual; abstract;
  end;

  TNotificationAreaEventsProcessor = class
  private
    EncoderMIME: TIdEncoderMIME;

    function SendMessageBoardMessageNotification(const idTVisualizationOwner,idVisualizationOwner: integer; const VisualizationPositionX,VisualizationPositionY: Extended; const pAddress: string; const pMessageType: TMessageType; const pSubject,pMessage: string): boolean;
    function SendMessageBoardMessageNotification1(const idTObjectVisualizationOwner,idObjectVisualizationOwner: integer; const ObjectVisualizationPositionX,ObjectVisualizationPositionY: Extended; const idTVisualizationOwner,idVisualizationOwner: integer; const VisualizationPositionX,VisualizationPositionY: Extended; const pAddress: string; const pMessageType: TMessageType; const pSubject,pMessage: string): boolean;
    function SendEmailNotification(const idTVisualizationOwner,idVisualizationOwner: integer; const VisualizationPositionX,VisualizationPositionY: Extended; const pAddress: string; const pMessageType: TMessageType; const Subject,Message: string): boolean;
    function SendEmailNotification1(const idTObjectVisualizationOwner,idObjectVisualizationOwner: integer; const ObjectVisualizationPositionX,ObjectVisualizationPositionY: Extended; const idTVisualizationOwner,idVisualizationOwner: integer; const VisualizationPositionX,VisualizationPositionY: Extended; const pAddress: string; const pMessageType: TMessageType; const Subject,Message: string): boolean;
    function SendSMSNotification(const idTVisualizationOwner,idVisualizationOwner: integer; const VisualizationPositionX,VisualizationPositionY: Extended; const pAddress: string; const pMessageType: TMessageType; const Subject,Message: string): boolean;
    function SendSMSNotification1(const idTObjectVisualizationOwner,idObjectVisualizationOwner: integer; const ObjectVisualizationPositionX,ObjectVisualizationPositionY: Extended; const idTVisualizationOwner,idVisualizationOwner: integer; const VisualizationPositionX,VisualizationPositionY: Extended; const pAddress: string; const pMessageType: TMessageType; const Subject,Message: string): boolean;
  public
    flOn: boolean;
    Lock: TCriticalSection;
    Config: TNotificationAreaEventsProcessorConfig;
    Stat: TNotificationAreaEventsProcessorStat;
    EventsInProcessingCount: integer;
    EMAIL__Transmitter_Lock: TCriticalSection;
    SMS__Transmitter_Lock: TCriticalSection;
    SMS_Transmitter: TSMSTransmitter;
    Panel: TfmNotificationAreaEventsProcessorPanel;

    Constructor Create();
    Destructor Destroy; override;
    procedure LoadConfiguration;
    procedure SaveConfiguration;
    procedure ProcessEvent(const AreaPtr: TPtr; const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const flIncomingEvent: boolean; const NotificationAddresses: string);
    procedure ProcessObjectDistanceNotificationEvent(const ObjectVisualizationPtr: TPtr; const ObjectVisualizationEventPositionX,ObjectVisualizationEventPositionY: Extended; const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const flIncomingEvent: boolean; const Distance: double; const NotificationAddresses: string);
    procedure ProcessStateEvent(const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const OnlineFlag: boolean; const OnlineFlag_SetTimeStamp: TDateTime; const NotificationAddresses: string);
    procedure ProcessUserAlertEvent(const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const AlertTimeStamp: TDateTime; const AlertSeverity: integer; const AlertDescription: string; const NotificationAddresses: string);
    function GetSMSTransmitter(): TSMSTransmitter;
  end;

  TSMSTextedTransmitter = class(TSMSTransmitter)
  private
    Handle: THandle;

    Constructor Create(const pProcessor: TNotificationAreaEventsProcessor); override;
    Destructor Destroy; override;
    procedure SendMessage(const Address: shortstring; const Message: shortstring); override;
    function ReadString(const StringSize: longword): shortstring;
    procedure WriteString(const Ln: shortstring);
    function ReadLn(SkipLnCount: integer): shortstring;
    procedure WriteLn(Ln: shortstring);
  end;

  TfmNotificationAreaEventsProcessorPanel = class(TForm)
    ListBox: TListBox;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    bbSaveConfiguration: TBitBtn;
    PageControl3: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Label1: TLabel;
    ConfigMBM_edidPositionerPrototype: TEdit;
    Label2: TLabel;
    ConfigMBM_edidCoReferencePrototype: TEdit;
    Label3: TLabel;
    ConfigMBM_edSenderMessageBoardID: TEdit;
    Label4: TLabel;
    ConfigMBM_edMessageComponentsLeft: TEdit;
    Label5: TLabel;
    ConfigMBM_edMessageComponentsTop: TEdit;
    Label6: TLabel;
    ConfigEMAIL_edServerAddress: TEdit;
    Label7: TLabel;
    ConfigEMAIL_edServerPort: TEdit;
    Label8: TLabel;
    ConfigEMAIL_edConnectingTime: TEdit;
    ConfigEMAIL_cbUseAuthentication: TCheckBox;
    Label9: TLabel;
    ConfigEMAIL_edSenderAddress: TEdit;
    Label10: TLabel;
    ConfigEMAIL_edSenderUserName: TEdit;
    Label11: TLabel;
    ConfigEMAIL_edSenderUserPassword: TEdit;
    Label12: TLabel;
    ConfigSMS_edCommPort: TEdit;
    Label13: TLabel;
    ConfigSMS_edPortSpeed: TEdit;
    ConfigMBM_cbEnabled: TCheckBox;
    ConfigEMAIL_cbEnabled: TCheckBox;
    ConfigSMS_cbEnabled: TCheckBox;
    Label14: TLabel;
    ConfigSMS_cbSendingMethod: TComboBox;
    Label15: TLabel;
    StatMBM_edSentCount: TEdit;
    Label16: TLabel;
    StatEMAIL_edSentCount: TEdit;
    Label17: TLabel;
    StatSMS_edSentCount: TEdit;
    btnAreaNotifier: TBitBtn;
    btnDistanceNotifier: TBitBtn;
    btnNotificationAreaNotifier: TBitBtn;
    cbShowLog: TCheckBox;
    procedure bbSaveConfigurationClick(Sender: TObject);
    procedure btnAreaNotifierClick(Sender: TObject);
    procedure btnDistanceNotifierClick(Sender: TObject);
    procedure btnNotificationAreaNotifierClick(Sender: TObject);
  private
    { Private declarations }
    EventsProcessor: TNotificationAreaEventsProcessor;
    LogLock: TCriticalSection;
    Log: TStringList;

    procedure wmShowPanel(var Message: TMessage); message WM_SHOWPANEL;
    procedure wmUpdateLog(var Message: TMessage); message WM_UPDATELOG;
    procedure wmUpdateStatistics(var Message: TMessage); message WM_UPDATESTATISTICS;
    procedure SaveProcessorConfiguration;
  public
    { Public declarations }

    Constructor Create(const pEventsProcessor: TNotificationAreaEventsProcessor);
    Destructor Destroy; override;
    procedure Update; reintroduce;
    procedure Log_AddEvent(const AreaName: string; const VisualizationName: string; const flIncomingEvent: boolean; const NotificationAddresses: string);
    procedure Log_AddMessage(const Message: string);
  end;

Const
  EventSendMethods: array[TEventSendMethod] of string = ('Unknown','Internal-Mail','E-Mail','SMS');
  EventSendMethodPrefixes: array[TEventSendMethod] of string = ('UNK','MBMAIL','EMAIL','SMS');
  SMSSendingTypeStrings: array[TSMSSendingType] of string = ('Unknown','Text','PDU');


  procedure NotificationAreaEventsProcessor_Initialize();
  procedure NotificationAreaEventsProcessor_Finalize();
  procedure NotificationAreaEventsProcessor_ShowPanel();

var
  NotificationAreaEventsProcessor: TNotificationAreaEventsProcessor = nil;

implementation
uses
  FunctionalityImport,
  TypesDefines,
  idSMTP,
  idMessage,
  StrUtils,
  INIFiles,
  unitCoGeoMonitorObjectFunctionality,
  unitGeoObjectAreaNotifier,
  unitObjectDistanceNotifier,
  unitNotificationAreaNotifier;

{$R *.dfm}


{TSMSTransmitter}
Constructor TSMSTransmitter.Create(const pProcessor: TNotificationAreaEventsProcessor);
begin
Inherited Create;
Processor:=pProcessor;
SendingType:=sstUnknown;
end;


{TNotificationAreaEventsProcessor}
Constructor TNotificationAreaEventsProcessor.Create();
begin
Inherited Create;
Lock:=TCriticalSection.Create;
EncoderMIME:=TIdEncoderMIME.Create(nil);
LoadConfiguration();
Panel:=TfmNotificationAreaEventsProcessorPanel.Create(Self);
Stat.MBM_SentCount:=0;
Stat.EMAIL_SentCount:=0;
Stat.SMS_SentCount:=0;
EventsInProcessingCount:=0;
//.
EMAIL__Transmitter_Lock:=TCriticalSection.Create;
//.
SMS__Transmitter_Lock:=TCriticalSection.Create;
SMS_Transmitter:=nil;
//.
flOn:=true;
end;

Destructor TNotificationAreaEventsProcessor.Destroy;
var
  Cnt: integer;
begin
flOn:=false;
//. waiting for all events is processed
if (Lock <> nil)
 then begin
  repeat
    Lock.Enter;
    try
    Cnt:=EventsInProcessingCount;
    finally
    Lock.Leave;
    end;
    Sleep(100);
  until (Cnt = 0);
  end;
//.
SMS_Transmitter.Free;
SMS__Transmitter_Lock.Free;
//.
EMAIL__Transmitter_Lock.Free;
//.
Panel.Free;
EncoderMIME.Free();
Lock.Free;
Inherited;
end;

procedure TNotificationAreaEventsProcessor.LoadConfiguration;
var
  FN: string;
begin
FN:=ExtractFilePath(Application.ExeName)+NotificationAreaEventsProcessorConfigurationFileName;
Lock.Enter;
try
if (FileExists(FN))
 then
  try
  with TINIFile.Create(FN) do
  try
  with Config do begin
  MBM_flEnabled:=(ReadInteger('EventsProcessor','MBM_flEnabled',0) <> 0);
  MBM_idPositionerPrototype:=ReadInteger('EventsProcessor','MBM_idPositionerPrototype',0);
  MBM_idCoReferencePrototype:=ReadInteger('EventsProcessor','MBM_idCoReferencePrototype',0);
  MBM_SenderMessageBoardID:=ReadInteger('EventsProcessor','MBM_SenderMessageBoardID',0);
  MBM_MessageComponentsLeft:=ReadInteger('EventsProcessor','MBM_MessageComponentsLeft',0);
  MBM_MessageComponentsTop:=ReadInteger('EventsProcessor','MBM_MessageComponentsTop',0);
  EMAIL_flEnabled:=(ReadInteger('EventsProcessor','EMAIL_flEnabled',0) <> 0);
  EMAIL_ServerAddress:=ReadString('EventsProcessor','EMAIL_ServerAddress','');
  EMAIL_ServerPort:=ReadInteger('EventsProcessor','EMAIL_ServerPort',25);
  EMAIL_ConnectingTime:=ReadInteger('EventsProcessor','EMAIL_ConnectingTime',0);
  EMAIL_UseAuthentication:=(ReadInteger('EventsProcessor','EMAIL_UseAuthentication',1) <> 0);
  EMAIL_SenderAddress:=ReadString('EventsProcessor','EMAIL_SenderAddress','');
  EMAIL_SenderUserName:=ReadString('EventsProcessor','EMAIL_SenderUserName','');
  EMAIL_SenderUserPassword:=ReadString('EventsProcessor','EMAIL_SenderUserPassword','');
  SMS_flEnabled:=(ReadInteger('EventsProcessor','SMS_flEnabled',1) <> 0);
  SMS_SendingType:=TSMSSendingType(ReadInteger('EventsProcessor','SMS_SendingType',1));
  SMS_CommPort:=ReadInteger('EventsProcessor','SMS_CommPort',25);
  SMS_PortSpeed:=ReadInteger('EventsProcessor','SMS_PortSpeed',9600);
  end;
  finally
  Destroy();
  end;
  except
    On E: Exception do ProxySpace__EventLog_WriteMajorEvent('TNotificationAreaEventsProcessor.LoadConfiguration','could not read configuration','File: '+FN+'. Exception: '+E.Message);
    end;
finally
Lock.Leave;
end;
end;

procedure TNotificationAreaEventsProcessor.SaveConfiguration;
begin
end;

function ParseNotificationAddresses(const NotificationAddresses: string; out EndpointList: TList): boolean;

  function SplitStrings(const S: string; out SL: TStringList): boolean;
  var
    SS: string;
    I: integer;
  begin
  SL:=TStringList.Create;
  try
  SS:='';
  for I:=1 to Length(S) do
    if (S[I] in [',',#$0D,#$0A])
     then begin
      if (SS <> '')
       then begin
        SL.Add(SS);
        SS:='';
        end;
      end
    else
     if (S[I] <> ' ') then SS:=SS+S[I];
  if (SS <> '')
   then begin
    SL.Add(SS);
    SS:='';
    end;
  if (SL.Count > 0)
   then Result:=true
   else begin
    FreeAndNil(SL);
    Result:=false;
    end;
  except
    FreeAndNil(SL);
    Raise; //. =>
    end;
  end;

  procedure ParseAddress(const A: string; out EventSendEndpoint: TEventSendEndpoint);
  var
    I: integer;
    SendMethodPrefix: string;
    MessageTypeStr: string;
    AddrStr: string;
    M: TEventSendMethod;
  begin
  I:=1;
  //. get SendMethodPrefix
  SendMethodPrefix:='';
  while (I <= Length(A)) do begin
    if ((A[I] = ':') OR (($30 <= Ord(A[I])) AND (Ord(A[I]) <= $39)))
     then Break //. >
     else SendMethodPrefix:=SendMethodPrefix+A[I];
    Inc(I);
    end;
  if (SendMethodPrefix = '') then Raise Exception.Create('ParseAddress: cannot get "Send Method Prefix": '+A); //. =>
  //. get MessageTypeStr
  MessageTypeStr:='';
  while (I <= Length(A)) do begin
    if (($30 <= Ord(A[I])) AND (Ord(A[I]) <= $39))
     then MessageTypeStr:=MessageTypeStr+A[I]
     else Break; //. >
    Inc(I);
    end;
  if (MessageTypeStr = '')
   then EventSendEndpoint.MessageType:=mtDefault
   else
    try
    EventSendEndpoint.MessageType:=TMessageType(StrToInt(MessageTypeStr));
    except
      Raise Exception.Create('ParseAddress: cannot parse Message Type string: '+MessageTypeStr); //. =>
      end;
  //. get Address string
  AddrStr:='';
  if (A[I] <> ':') then Raise Exception.Create('ParseAddress: cannot find "Address" string start: '+A); //. =>
  Inc(I);
  while (I <= Length(A)) do begin
    AddrStr:=AddrStr+A[I];
    Inc(I);
    end;
  if (AddrStr = '') then Raise Exception.Create('ParseAddress: cannot get "Address" string: '+A); //. =>
  //.
  EventSendEndpoint.SendMethod:=esmUnknown;
  for M:=Low(TEventSendMethod) to High(TEventSendMethod) do
    if (EventSendMethodPrefixes[M] = SendMethodPrefix)
     then begin
      EventSendEndpoint.SendMethod:=M;
      Break; //. >
      end;
  if (EventSendEndpoint.SendMethod = esmUnknown) then Raise Exception.Create('ParseAddress: unknown "Send Method Prefix": '+SendMethodPrefix); //. =>
  //.
  EventSendEndpoint.Address:=AddrStr;
  end;

var
  SL: TStringList;
  I: integer;
  EventSendEndpoint: TEventSendEndpoint;
  ptrNewItem: pointer;
begin
Result:=false;
EndpointList:=nil;
try
if (SplitStrings(NotificationAddresses,SL))
 then
  try
  EndpointList:=TList.Create;
  //.
  for I:=0 to SL.Count-1 do begin
    ParseAddress(SL[I], EventSendEndpoint);
    //.
    GetMem(ptrNewItem,SizeOf(TEventSendEndpoint));
    FillChar(ptrNewItem^,SizeOf(TEventSendEndpoint),0);
    TEventSendEndpoint(ptrNewItem^):=EventSendEndpoint;
    //.
    EndpointList.Add(ptrNewItem);
    end;
  //.
  Result:=true;
  finally
  SL.Destroy;
  end;
except
  FreeAndNil(EndpointList);
  Raise; //. =>
  end;
end;

function TNotificationAreaEventsProcessor.SendMessageBoardMessageNotification(const idTVisualizationOwner,idVisualizationOwner: integer; const VisualizationPositionX,VisualizationPositionY: Extended; const pAddress: string; const pMessageType: TMessageType; const pSubject,pMessage: string): boolean;
var
  SenderMessageBoardID: integer;
  idPositionerPrototype: integer;
  idCoReferencePrototype: integer;
  MessageComponentsLeft: integer;
  MessageComponentsTop: integer;
  //.
  idMessageBoard: integer;
  idNewMessage: integer;
  MBMF: TMessageBoardMessageFunctionality;
  SL: TStringList;
  idCoReference: integer;
  CID: integer;
  idPositioner: integer;
  RF: TCoReferenceFunctionality;
  PF: TPositionerFunctionality;
begin
Result:=false;
Lock.Enter;
try
SenderMessageBoardID:=Config.MBM_SenderMessageBoardID;
idPositionerPrototype:=Config.MBM_idPositionerPrototype;
idCoReferencePrototype:=Config.MBM_idCoReferencePrototype;
MessageComponentsLeft:=Config.MBM_MessageComponentsLeft;
MessageComponentsTop:=Config.MBM_MessageComponentsTop;
finally
Lock.Leave;
end;
//. sending ...
idMessageBoard:=StrToInt(pAddress);
with TMessageBoardFunctionality(TComponentFunctionality_Create(idTMessageBoardMessage,idMessageBoard)) do
try
idNewMessage:=CreateNewMessage;
try
MBMF:=TMessageBoardMessageFunctionality(TComponentFunctionality_Create(idTMessageBoardMessage,idNewMessage));
with MBMF do
try
//. set message sender
idSenderMessageBoard:=SenderMessageBoardID;
//. set message subject and body
Subject:=pSubject;
SL:=TStringList.Create;
try
SL.Text:=pMessage;
SetBody1(SL);
finally
SL.Destroy;
end;
//. set message visualization position reference
TComponentFunctionality(MBMF).CloneAndInsertComponent(idTPositioner,idPositionerPrototype,  idPositioner, CID);
PF:=TPositionerFunctionality(TComponentFunctionality_Create(idTPositioner,idPositioner));
try
case pMessageType of
mtRU: PF.PositionName:='показать место события';
else
  PF.PositionName:='show event position';
end;
PF.Save2DPosition(VisualizationPositionX,VisualizationPositionY,VisualizationPositionX,VisualizationPositionY,VisualizationPositionX,VisualizationPositionY,VisualizationPositionX,VisualizationPositionY);
TComponentFunctionality(PF).SetPanelPropsLeftTop(MessageComponentsLeft,MessageComponentsTop);
TComponentFunctionality(PF).SetPanelPropsWidthHeight(200,20);
finally
PF.Release;
end;
//. set message visualization reference
TComponentFunctionality(MBMF).CloneAndInsertComponent(idTCoReference,idCoReferencePrototype,  idCoReference, CID);
RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(idTCoReference,idCoReference));
try
case pMessageType of
mtRU: RF.Name:='показать объект';
else
  RF.Name:='show object';
end;
RF.SetReferencedObject(idTVisualizationOwner,idVisualizationOwner);
TComponentFunctionality(RF).SetPanelPropsLeftTop(MessageComponentsLeft,MessageComponentsTop+24);
TComponentFunctionality(RF).SetPanelPropsWidthHeight(200,20);
finally
RF.Release;
end;
finally
Release;
end;
//. send message
SendMessage(idNewMessage);
Result:=true;
//. update statistics
Lock.Enter;
try
Inc(Stat.MBM_SentCount);
finally
Lock.Leave;
end;
except
  with TTypeFunctionality_Create(idTMessageBoardMessage) do
  try
  DestroyInstance(idNewMessage);
  finally
  Release;
  end;
  //. re-raise exception
  Raise; //. =>
  end;
finally
Release;
end;
end;

function TNotificationAreaEventsProcessor.SendMessageBoardMessageNotification1(const idTObjectVisualizationOwner,idObjectVisualizationOwner: integer; const ObjectVisualizationPositionX,ObjectVisualizationPositionY: Extended; const idTVisualizationOwner,idVisualizationOwner: integer; const VisualizationPositionX,VisualizationPositionY: Extended; const pAddress: string; const pMessageType: TMessageType; const pSubject,pMessage: string): boolean;
var
  SenderMessageBoardID: integer;
  idPositionerPrototype: integer;
  idCoReferencePrototype: integer;
  MessageComponentsLeft: integer;
  MessageComponentsTop: integer;
  //.
  idMessageBoard: integer;
  idNewMessage: integer;
  MBMF: TMessageBoardMessageFunctionality;
  SL: TStringList;
  idCoReference: integer;
  CID: integer;
  idPositioner: integer;
  RF: TCoReferenceFunctionality;
  PF: TPositionerFunctionality;
begin
Result:=false;
Lock.Enter;
try
SenderMessageBoardID:=Config.MBM_SenderMessageBoardID;
idPositionerPrototype:=Config.MBM_idPositionerPrototype;
idCoReferencePrototype:=Config.MBM_idCoReferencePrototype;
MessageComponentsLeft:=Config.MBM_MessageComponentsLeft;
MessageComponentsTop:=Config.MBM_MessageComponentsTop;
finally
Lock.Leave;
end;
//. sending ...
idMessageBoard:=StrToInt(pAddress);
with TMessageBoardFunctionality(TComponentFunctionality_Create(idTMessageBoardMessage,idMessageBoard)) do
try
idNewMessage:=CreateNewMessage;
try
MBMF:=TMessageBoardMessageFunctionality(TComponentFunctionality_Create(idTMessageBoardMessage,idNewMessage));
with MBMF do
try
//. set message sender
idSenderMessageBoard:=SenderMessageBoardID;
//. set message subject and body
Subject:=pSubject;
SL:=TStringList.Create;
try
SL.Text:=pMessage;
SetBody1(SL);
finally
SL.Destroy;
end;
//. set message object visualization position reference
TComponentFunctionality(MBMF).CloneAndInsertComponent(idTPositioner,idPositionerPrototype,  idPositioner, CID);
PF:=TPositionerFunctionality(TComponentFunctionality_Create(idTPositioner,idPositioner));
try
case pMessageType of
mtRU: PF.PositionName:='показать позицию объекта';
else
  PF.PositionName:='show object position';
end;
PF.Save2DPosition(ObjectVisualizationPositionX,ObjectVisualizationPositionY,ObjectVisualizationPositionX,ObjectVisualizationPositionY,ObjectVisualizationPositionX,ObjectVisualizationPositionY,ObjectVisualizationPositionX,ObjectVisualizationPositionY);
TComponentFunctionality(PF).SetPanelPropsLeftTop(MessageComponentsLeft,MessageComponentsTop);
TComponentFunctionality(PF).SetPanelPropsWidthHeight(200,20);
finally
PF.Release;
end;
//. set message object visualization reference
TComponentFunctionality(MBMF).CloneAndInsertComponent(idTCoReference,idCoReferencePrototype,  idCoReference, CID);
RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(idTCoReference,idCoReference));
try
case pMessageType of
mtRU: RF.Name:='показать панель объекта';
else
  RF.Name:='show object panel';
end;
RF.SetReferencedObject(idTObjectVisualizationOwner,idObjectVisualizationOwner);
TComponentFunctionality(RF).SetPanelPropsLeftTop(MessageComponentsLeft,MessageComponentsTop+24);
TComponentFunctionality(RF).SetPanelPropsWidthHeight(200,20);
finally
RF.Release;
end;
//. set message visualization position reference
TComponentFunctionality(MBMF).CloneAndInsertComponent(idTPositioner,idPositionerPrototype,  idPositioner, CID);
PF:=TPositionerFunctionality(TComponentFunctionality_Create(idTPositioner,idPositioner));
try
case pMessageType of
mtRU: PF.PositionName:='показать координаты';
else
  PF.PositionName:='show geo object position';
end;
PF.Save2DPosition(VisualizationPositionX,VisualizationPositionY,VisualizationPositionX,VisualizationPositionY,VisualizationPositionX,VisualizationPositionY,VisualizationPositionX,VisualizationPositionY);
TComponentFunctionality(PF).SetPanelPropsLeftTop(MessageComponentsLeft,MessageComponentsTop+72);
TComponentFunctionality(PF).SetPanelPropsWidthHeight(200,20);
finally
PF.Release;
end;
//. set message visualization reference
TComponentFunctionality(MBMF).CloneAndInsertComponent(idTCoReference,idCoReferencePrototype,  idCoReference, CID);
RF:=TCoReferenceFunctionality(TComponentFunctionality_Create(idTCoReference,idCoReference));
try
case pMessageType of
mtRU: RF.Name:='панель гео-объекта';
else
  RF.Name:='show geo object panel';
end;
RF.SetReferencedObject(idTVisualizationOwner,idVisualizationOwner);
TComponentFunctionality(RF).SetPanelPropsLeftTop(MessageComponentsLeft,MessageComponentsTop+96);
TComponentFunctionality(RF).SetPanelPropsWidthHeight(200,20);
finally
RF.Release;
end;
finally
Release;
end;
//. send message
SendMessage(idNewMessage);
Result:=true;
//. update statistics
Lock.Enter;
try
Inc(Stat.MBM_SentCount);
finally
Lock.Leave;
end;
except
  with TTypeFunctionality_Create(idTMessageBoardMessage) do
  try
  DestroyInstance(idNewMessage);
  finally
  Release;
  end;
  //. re-raise exception
  Raise; //. =>
  end;
finally
Release;
end;
end;

function TNotificationAreaEventsProcessor.SendEmailNotification(const idTVisualizationOwner,idVisualizationOwner: integer; const VisualizationPositionX,VisualizationPositionY: Extended; const pAddress: string; const pMessageType: TMessageType; const Subject,Message: string): boolean;
const
  SendingTryCount = 5;

  function ConvertToWIN1251(const S: string): string;
  begin
  Result:='=?'+'Windows-1251'+'?B?'+EncoderMIME.Encode(S)+'?=';
  end;

var
  IdSMTP: TIdSMTP;
  Msg: TIdMessage;
  ConnectingTime: integer;
  SendingTry: integer;
begin
Result:=false;
IdSMTP:=TIdSMTP.Create(nil);
try
Msg:=TIdMessage.Create(nil);
try
Msg.ContentType:='text/plain'; 
Msg.CharSet:='windows-1251';
//.
Lock.Enter();
try
Msg.Subject:=ConvertToWIN1251(Subject);
with Msg.Recipients.Add do begin
Address:=pAddress;
Name:=pAddress;
end;
Msg.From.Address:=Config.EMAIL_SenderAddress;
case pMessageType of
mtRU: begin
  Msg.From.Name:=ConvertToWIN1251('Служба оповещений GeoScope');
  Msg.Body.Text:=Message+#$0D#$0A+'Объект: '+IntToStr(idVisualizationOwner)+#$0D#$0A+'Координаты: ('+FormatFloat('0.000',VisualizationPositionX)+'; '+FormatFloat('0.000',VisualizationPositionY)+')';
  end;
else
  Msg.From.Name:='Area notification service mailer';
  Msg.Body.Text:=Message+#$0D#$0A+'ObjectID: '+IntToStr(idVisualizationOwner)+#$0D#$0A+'Location: ('+FormatFloat('0.000',VisualizationPositionX)+'; '+FormatFloat('0.000',VisualizationPositionY)+')';
end;
Msg.Date:=Now;
Msg.ReplyTo.EMailAddresses:='';
//.
IdSMTP.Host:=Config.EMAIL_ServerAddress;
IdSMTP.Port:=Config.EMAIL_ServerPort;
if (Config.EMAIL_UseAuthentication)
 then begin
  IdSMTP.AuthenticationType:=atLogin;
  IdSMTP.Username:=Config.EMAIL_SenderUserName;
  IdSMTP.Password:=Config.EMAIL_SenderUserPassword;
  end
 else IdSMTP.AuthenticationType:=atNone;
ConnectingTime:=Config.EMAIL_ConnectingTime;
finally
Lock.Leave();
end;
//. sending ...
SendingTry:=SendingTryCount;
while (true) do 
  try
  EMAIL__Transmitter_Lock.Enter();
  try
  IdSMTP.Connect(ConnectingTime);
  try
  if (IdSMTP.Connected)
   then begin
    IdSMTP.Send(Msg);
    Result:=true;
    //. update statistics
    Lock.Enter;
    try
    Inc(Stat.EMAIL_SentCount);
    finally
    Lock.Leave;
    end;
    end
   else Raise Exception.Create('cannot not connect smtp server - '+IdSMTP.Host); //. =>
  finally
  IdSMTP.Disconnect();
  end;
  finally
  EMAIL__Transmitter_Lock.Leave();
  end;
  Break; //. >
  except
    if (SendingTry > 0)
     then begin
      Dec(SendingTry);
      Sleep(1000);
      Continue; //. ^
      end
     else Raise; //. =>
    end;
finally
Msg.Destroy;
end;
finally
IdSMTP.Destroy;
end;
end;

function TNotificationAreaEventsProcessor.SendEmailNotification1(const idTObjectVisualizationOwner,idObjectVisualizationOwner: integer; const ObjectVisualizationPositionX,ObjectVisualizationPositionY: Extended; const idTVisualizationOwner,idVisualizationOwner: integer; const VisualizationPositionX,VisualizationPositionY: Extended; const pAddress: string; const pMessageType: TMessageType; const Subject,Message: string): boolean;
const
  SendingTryCount = 5;

  function ConvertToWIN1251(const S: string): string;
  begin
  Result:='=?'+'Windows-1251'+'?B?'+EncoderMIME.Encode(S)+'?=';
  end;

var
  IdSMTP: TIdSMTP;
  Msg: TIdMessage;
  ConnectingTime: integer;
  SendingTry: integer;
begin
Result:=false;
IdSMTP:=TIdSMTP.Create(nil);
try
Msg:=TIdMessage.Create(nil);
try
Msg.ContentType:='text/plain'; 
Msg.CharSet:='windows-1251';
//.
Lock.Enter();
try
Msg.Subject:=ConvertToWIN1251(Subject);
with Msg.Recipients.Add do begin
Address:=pAddress;
Name:=pAddress;
end;
Msg.From.Address:=Config.EMAIL_SenderAddress;
case pMessageType of
mtRU: begin
  Msg.From.Name:=ConvertToWIN1251('Служба оповещений GeoScope');
  Msg.Body.Text:=Message+#$0D#$0A+'Объект: '+IntToStr(idObjectVisualizationOwner)+#$0D#$0A+'Координаты: ('+FormatFloat('0.000',ObjectVisualizationPositionX)+'; '+FormatFloat('0.000',ObjectVisualizationPositionY)+')'+
                         #$0D#$0A+'ГеоОбъект: '+IntToStr(idVisualizationOwner)+#$0D#$0A+'Координаты: ('+FormatFloat('0.000',VisualizationPositionX)+'; '+FormatFloat('0.000',VisualizationPositionY)+')';
  end;
else
  Msg.From.Name:='Area notification service mailer';
  Msg.Body.Text:=Message+#$0D#$0A+'ObjectID: '+IntToStr(idObjectVisualizationOwner)+#$0D#$0A+'Location: ('+FormatFloat('0.000',ObjectVisualizationPositionX)+'; '+FormatFloat('0.000',ObjectVisualizationPositionY)+')'+
                         #$0D#$0A+'GeoObjectID: '+IntToStr(idVisualizationOwner)+#$0D#$0A+'Location: ('+FormatFloat('0.000',VisualizationPositionX)+'; '+FormatFloat('0.000',VisualizationPositionY)+')';
end;
Msg.Date:=Now;
Msg.ReplyTo.EMailAddresses:='';
//.
IdSMTP.Host:=Config.EMAIL_ServerAddress;
IdSMTP.Port:=Config.EMAIL_ServerPort;
if (Config.EMAIL_UseAuthentication)
 then begin
  IdSMTP.AuthenticationType:=atLogin;
  IdSMTP.Username:=Config.EMAIL_SenderUserName;
  IdSMTP.Password:=Config.EMAIL_SenderUserPassword;
  end
 else IdSMTP.AuthenticationType:=atNone;
ConnectingTime:=Config.EMAIL_ConnectingTime;
finally
Lock.Leave();
end;
//. sending ...
SendingTry:=SendingTryCount;
while (true) do 
  try
  EMAIL__Transmitter_Lock.Enter();
  try
  IdSMTP.Connect(ConnectingTime);
  try
  if (IdSMTP.Connected)
   then begin
    IdSMTP.Send(Msg);
    Result:=true;
    //. update statistics
    Lock.Enter;
    try
    Inc(Stat.EMAIL_SentCount);
    finally
    Lock.Leave;
    end;
    end
   else Raise Exception.Create('cannot not connect smtp server - '+IdSMTP.Host); //. =>
  finally
  IdSMTP.Disconnect();
  end;
  finally
  EMAIL__Transmitter_Lock.Leave();
  end;
  Break; //. >
  except
    if (SendingTry > 0)
     then begin
      Dec(SendingTry);
      Sleep(1000);
      Continue; //. ^
      end
     else Raise; //. =>
    end;
finally
Msg.Destroy;
end;
finally
IdSMTP.Destroy;
end;
end;

function TNotificationAreaEventsProcessor.SendSMSNotification(const idTVisualizationOwner,idVisualizationOwner: integer; const VisualizationPositionX,VisualizationPositionY: Extended; const pAddress: string; const pMessageType: TMessageType; const Subject,Message: string): boolean;
var
  ST: TSMSTransmitter;
begin
Result:=false;
SMS__Transmitter_Lock.Enter;
try
ST:=GetSMSTransmitter();
if (ST <> nil)
 then begin
  ST.SendMessage(pAddress,Message);
  Result:=true;
  //. update statistics
  Lock.Enter;
  try
  Inc(Stat.SMS_SentCount);
  finally
  Lock.Leave;
  end;
  end;
finally
SMS__Transmitter_Lock.Leave;
end;
end;

function TNotificationAreaEventsProcessor.SendSMSNotification1(const idTObjectVisualizationOwner,idObjectVisualizationOwner: integer; const ObjectVisualizationPositionX,ObjectVisualizationPositionY: Extended; const idTVisualizationOwner,idVisualizationOwner: integer; const VisualizationPositionX,VisualizationPositionY: Extended; const pAddress: string; const pMessageType: TMessageType; const Subject,Message: string): boolean;
var
  ST: TSMSTransmitter;
begin
Result:=false;
SMS__Transmitter_Lock.Enter;
try
ST:=GetSMSTransmitter();
if (ST <> nil)
 then begin
  ST.SendMessage(pAddress,Message);
  Result:=true;
  //. update statistics
  Lock.Enter;
  try
  Inc(Stat.SMS_SentCount);
  finally
  Lock.Leave;
  end;
  end;
finally
SMS__Transmitter_Lock.Leave;
end;
end;

procedure TNotificationAreaEventsProcessor.ProcessEvent(const AreaPtr: TPtr; const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const flIncomingEvent: boolean; const NotificationAddresses: string);
var
  EndpointList: TList;
  idTArea,idArea: integer;
  idTVisualization,idVisualization: integer;
  idTOwner,idOwner: integer;
  AreaName: string;
  VisualizationName: string;
  DirectionName: string;
  I: integer;
  Subject,Message: string;
  SubjectRU,MessageRU: string;
  flMessageIsSent: boolean;
  ptrDestroyItem: pointer;
begin
if (NOT flOn) then Exit; //. ->
//.
Lock.Enter;
try
Inc(EventsInProcessingCount);
finally
Lock.Leave;
end;
try
try
//. prepare subject and message
idTArea:=ProxySpace__Obj_IDType(AreaPtr);
idArea:=ProxySpace__Obj_ID(AreaPtr);
with TComponentFunctionality_Create(idTArea,idArea) do
try
if (GetOwner(idTOwner,idOwner))
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  AreaName:=Name;
  finally
  Release;
  end
 else AreaName:=Name;
finally
Release;
end;
idTVisualization:=ProxySpace__Obj_IDType(VisualizationPtr);
idVisualization:=ProxySpace__Obj_ID(VisualizationPtr);
with TComponentFunctionality_Create(idTVisualization,idVisualization) do
try
if (GetOwner(idTOwner,idOwner))
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  VisualizationName:=Name;
  finally
  Release;
  end
 else VisualizationName:=Name;
finally
Release;
end;
//.
if (flIncomingEvent) then DirectionName:='inside' else DirectionName:='outside';
Subject:='"'+VisualizationName+'" is '+DirectionName+' of "'+AreaName+'" area';
Message:=FormatDateTime('YY/MM/DD HH:NN:SS|',Now)+' '+Subject;
//.
if (flIncomingEvent) then DirectionName:='внутри' else DirectionName:='снаружи';
SubjectRU:='"'+VisualizationName+'" '+DirectionName+' области "'+AreaName+'"';
MessageRU:=FormatDateTime('YY/MM/DD HH:NN:SS|',Now)+' '+SubjectRU;
except
  On E: Exception do begin
    Panel.Log_AddMessage('! EXCEPTION: Cannot prepare notification message. AreaPtr: '+IntToStr(AreaPtr)+', VisualizationPtr: '+IntToStr(VisualizationPtr)+'. Error: '+E.Message);
    Exit; //. ->
    end;
  end;
//. log notification
///? if (Panel.cbShowLog.Checked) then Panel.Log_AddEvent(AreaName,VisualizationName,flIncomingEvent,NotificationAddresses);
if (Panel.cbShowLog.Checked) then Panel.Log_AddMessage(Subject);
//.
try
if (ParseNotificationAddresses(NotificationAddresses, EndpointList))
 then
  try
  for I:=0 to EndpointList.Count-1 do with TEventSendEndpoint(EndpointList[I]^) do
    try
    case MessageType of
    mtRU: begin
      Subject:=SubjectRU;
      Message:=MessageRU;
      end;
    end;
    //.
    flMessageIsSent:=false;
    case SendMethod of
    esmMBM:   if (Config.MBM_flEnabled) then flMessageIsSent:=SendMessageBoardMessageNotification(idTOwner,idOwner,VisualizationEventPositionX,VisualizationEventPositionY, Address, MessageType,Subject,Message);
    esmEMAIL: if (Config.EMAIL_flEnabled) then flMessageIsSent:=SendEMailNotification(idTOwner,idOwner,VisualizationEventPositionX,VisualizationEventPositionY, Address, MessageType,Subject,Message);
    esmSMS:   if (Config.SMS_flEnabled) then flMessageIsSent:=SendSMSNotification(idTOwner,idOwner,VisualizationEventPositionX,VisualizationEventPositionY, Address, MessageType,Subject,Message);
    else
      Raise Exception.Create('sending protocol is not implemented yet'); //. =>
    end;
    //. log message to the ProxySpace EventLog
    if (flMessageIsSent)
     then begin
      ProxySpace__EventLog_WriteInfoEvent('TNotificationAreaEventsProcessor.ProcessEvent','Notification message has been sent to the '+EventSendMethods[SendMethod]+' Address: '+Address,'Message: '+Subject);
      //.
      PostMessage(Panel.Handle, WM_UPDATESTATISTICS, 0,0);
      end;
    except
      On E: Exception do ProxySpace__EventLog_WriteMinorEvent('TNotificationAreaEventsProcessor.ProcessEvent','Cannot send notification to the '+EventSendMethods[SendMethod]+' Address: '+Address,E.Message);
      end;
  finally
  for I:=0 to EndpointList.Count-1 do begin
    ptrDestroyItem:=EndpointList[I];
    GetMem(ptrDestroyItem,SizeOf(TEventSendEndpoint));
    end;
  EndpointList.Destroy;
  end;
except
  On E: Exception do begin
    ProxySpace__EventLog_WriteMinorEvent('TNotificationAreaEventsProcessor.ProcessEvent','Cannot send message to the notification addresses','AreaPtr: ('+IntToStr(idTArea)+';'+IntToStr(idArea)+'), VisualizationPtr: ('+IntToStr(idTVisualization)+';'+IntToStr(idVisualization)+'). NotifyList: '+NotificationAddresses+'. Exception: '+E.Message);
    Exit; //. ->
    end;
  end;
finally
Lock.Enter;
try
Dec(EventsInProcessingCount);
finally
Lock.Leave;
end;
end;
end;

procedure TNotificationAreaEventsProcessor.ProcessObjectDistanceNotificationEvent(const ObjectVisualizationPtr: TPtr; const ObjectVisualizationEventPositionX,ObjectVisualizationEventPositionY: Extended; const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const flIncomingEvent: boolean; const Distance: double; const NotificationAddresses: string);
var
  EndpointList: TList;
  idTObjectVisualization,idObjectVisualization: integer;
  idTObjectVisualizationOwner,idObjectVisualizationOwner: integer;
  idTVisualization,idVisualization: integer;
  idTVisualizationOwner,idVisualizationOwner: integer;
  ObjectVisualizationName: string;
  VisualizationName: string;
  DirectionName: string;
  I: integer;
  Subject,Message: string;
  SubjectRU,MessageRU: string;
  flMessageIsSent: boolean;
  ptrDestroyItem: pointer;
begin
if (NOT flOn) then Exit; //. ->
//.
Lock.Enter;
try
Inc(EventsInProcessingCount);
finally
Lock.Leave;
end;
try
try
//. prepare subject and message
idTObjectVisualization:=ProxySpace__Obj_IDType(ObjectVisualizationPtr);
idObjectVisualization:=ProxySpace__Obj_ID(ObjectVisualizationPtr);
with TComponentFunctionality_Create(idTObjectVisualization,idObjectVisualization) do
try
if (GetOwner(idTObjectVisualizationOwner,idObjectVisualizationOwner))
 then with TComponentFunctionality_Create(idTObjectVisualizationOwner,idObjectVisualizationOwner) do
  try
  ObjectVisualizationName:=Name;
  finally
  Release;
  end
 else ObjectVisualizationName:=Name;
finally
Release;
end;
idTVisualization:=ProxySpace__Obj_IDType(VisualizationPtr);
idVisualization:=ProxySpace__Obj_ID(VisualizationPtr);
with TComponentFunctionality_Create(idTVisualization,idVisualization) do
try
if (GetOwner(idTVisualizationOwner,idVisualizationOwner))
 then with TComponentFunctionality_Create(idTVisualizationOwner,idVisualizationOwner) do
  try
  VisualizationName:=Name;
  finally
  Release;
  end
 else VisualizationName:=Name;
finally
Release;
end;
//.
if (flIncomingEvent) then DirectionName:='less' else DirectionName:='more';
if (Distance >= 0)
 then Subject:='distance from "'+VisualizationName+'" to "'+ObjectVisualizationName+'" is '+DirectionName+' than '+FormatFloat('0',Distance)+' meters'
 else Subject:='distance from "'+VisualizationName+'" to "'+ObjectVisualizationName+'" is '+DirectionName+' than ? meters';
Message:=FormatDateTime('YY/MM/DD HH:NN:SS|',Now)+' '+Subject;
//.
if (flIncomingEvent) then DirectionName:='меньше' else DirectionName:='больше';
if (Distance >= 0)
 then SubjectRU:='расстояние от "'+VisualizationName+'" до "'+ObjectVisualizationName+'"'+DirectionName+' чем '+FormatFloat('0',Distance)+' метр(ов)'
 else SubjectRU:='расстояние от "'+VisualizationName+'" до "'+ObjectVisualizationName+'"'+DirectionName+' чем ? метров';
MessageRU:=FormatDateTime('YY/MM/DD HH:NN:SS|',Now)+' '+SubjectRU;
except
  On E: Exception do begin
    Panel.Log_AddMessage('! EXCEPTION: Cannot prepare notification message. ObjectVisualizationPtr: '+IntToStr(ObjectVisualizationPtr)+', VisualizationPtr: '+IntToStr(VisualizationPtr)+'. Error: '+E.Message);
    Exit; //. ->
    end;
  end;
//. log notification
///? if (Panel.cbShowLog.Checked) then Panel.Log_AddEvent(ObjectVisualizationName,VisualizationName,flIncomingEvent,NotificationAddresses);
if (Panel.cbShowLog.Checked) then Panel.Log_AddMessage(Subject);
//.
try
if (ParseNotificationAddresses(NotificationAddresses, EndpointList))
 then
  try
  for I:=0 to EndpointList.Count-1 do with TEventSendEndpoint(EndpointList[I]^) do
    try
    case MessageType of
    mtRU: begin
      Subject:=SubjectRU;
      Message:=MessageRU;
      end;
    end;
    //.
    flMessageIsSent:=false;
    case SendMethod of
    esmMBM:   if (Config.MBM_flEnabled) then flMessageIsSent:=SendMessageBoardMessageNotification1(idTObjectVisualizationOwner,idObjectVisualizationOwner,ObjectVisualizationEventPositionX,ObjectVisualizationEventPositionY, idTVisualizationOwner,idVisualizationOwner,VisualizationEventPositionX,VisualizationEventPositionY, Address, MessageType,Subject,Message);
    esmEMAIL: if (Config.EMAIL_flEnabled) then flMessageIsSent:=SendEMailNotification1(idTObjectVisualizationOwner,idObjectVisualizationOwner,ObjectVisualizationEventPositionX,ObjectVisualizationEventPositionY, idTVisualizationOwner,idVisualizationOwner,VisualizationEventPositionX,VisualizationEventPositionY, Address, MessageType,Subject,Message);
    esmSMS:   if (Config.SMS_flEnabled) then flMessageIsSent:=SendSMSNotification1(idTObjectVisualizationOwner,idObjectVisualizationOwner,ObjectVisualizationEventPositionX,ObjectVisualizationEventPositionY, idTVisualizationOwner,idVisualizationOwner,VisualizationEventPositionX,VisualizationEventPositionY, Address, MessageType,Subject,Message);
    else
      Raise Exception.Create('sending protocol is not implemented yet'); //. =>
    end;
    //. log message to the ProxySpace EventLog
    if (flMessageIsSent)
     then begin
      ProxySpace__EventLog_WriteInfoEvent('TNotificationAreaEventsProcessor.ProcessObjectDistanceNotificationEvent','Notification message has been sent to the '+EventSendMethods[SendMethod]+' Address: '+Address,'Message: '+Subject);
      //.
      PostMessage(Panel.Handle, WM_UPDATESTATISTICS, 0,0);
      end;
    except
      On E: Exception do ProxySpace__EventLog_WriteMinorEvent('TNotificationAreaEventsProcessor.ProcessObjectDistanceNotificationEvent','Cannot send notification to the '+EventSendMethods[SendMethod]+' Address: '+Address,E.Message);
      end;
  finally
  for I:=0 to EndpointList.Count-1 do begin
    ptrDestroyItem:=EndpointList[I];
    GetMem(ptrDestroyItem,SizeOf(TEventSendEndpoint));
    end;
  EndpointList.Destroy;
  end;
except
  On E: Exception do begin
    ProxySpace__EventLog_WriteMinorEvent('TNotificationAreaEventsProcessor.ProcessObjectDistanceNotificationEvent','Cannot send message to the notification addresses','ObjectVisualizationPtr: ('+IntToStr(idTObjectVisualization)+';'+IntToStr(idObjectVisualization)+'), VisualizationPtr: ('+IntToStr(idTVisualization)+';'+IntToStr(idVisualization)+'). NotifyList: '+NotificationAddresses+'. Exception: '+E.Message);
    Exit; //. ->
    end;
  end;
finally
Lock.Enter;
try
Dec(EventsInProcessingCount);
finally
Lock.Leave;
end;
end;
end;

procedure TNotificationAreaEventsProcessor.ProcessStateEvent(const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const OnlineFlag: boolean; const OnlineFlag_SetTimeStamp: TDateTime; const NotificationAddresses: string);
var
  EndpointList: TList;
  idTVisualization,idVisualization: integer;
  idTOwner,idOwner: integer;
  VisualizationName: string;
  StateString: string;
  StateSetTimeStampString: string;
  I: integer;
  Subject,Message: string;
  SubjectRU,MessageRU: string;
  flMessageIsSent: boolean;
  ptrDestroyItem: pointer;
begin
if (NOT flOn) then Exit; //. ->
//.
Lock.Enter;
try
Inc(EventsInProcessingCount);
finally
Lock.Leave;
end;
try
try
//. prepare subject and message
idTVisualization:=ProxySpace__Obj_IDType(VisualizationPtr);
idVisualization:=ProxySpace__Obj_ID(VisualizationPtr);
with TComponentFunctionality_Create(idTVisualization,idVisualization) do
try
if (GetOwner(idTOwner,idOwner))
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  VisualizationName:=Name;
  finally
  Release;
  end
 else VisualizationName:=Name;
finally
Release;
end;
//.
if (OnlineFlag) then StateString:='Online' else StateString:='Offline';
StateSetTimeStampString:=FormatDateTime('DD/MM/YY HH:NN:SS',OnlineFlag_SetTimeStamp);
Subject:='"'+VisualizationName+'" is '+StateString+' (time: '+StateSetTimeStampString+')';
Message:=FormatDateTime('YY/MM/DD HH:NN:SS|',Now)+' '+Subject;
//.
if (OnlineFlag) then StateString:='"НА СВЯЗИ"' else StateString:='"выключен"';
StateSetTimeStampString:=FormatDateTime('DD/MM/YY HH:NN:SS',OnlineFlag_SetTimeStamp);
SubjectRU:='объект "'+VisualizationName+'" перешел в состояние '+StateString+' (время: '+StateSetTimeStampString+')';
MessageRU:=FormatDateTime('YY/MM/DD HH:NN:SS|',Now)+' '+SubjectRU;
except
  On E: Exception do begin
    Panel.Log_AddMessage('! EXCEPTION: Cannot prepare notification message. VisualizationPtr: '+IntToStr(VisualizationPtr)+'. Error: '+E.Message);
    Exit; //. ->
    end;
  end;
//. log notification
///? if (Panel.cbShowLog.Checked) then Panel.Log_AddEvent(AreaName,VisualizationName,flIncomingEvent,NotificationAddresses);
if (Panel.cbShowLog.Checked) then Panel.Log_AddMessage(Subject);
//.
try
if (ParseNotificationAddresses(NotificationAddresses, EndpointList))
 then
  try
  for I:=0 to EndpointList.Count-1 do with TEventSendEndpoint(EndpointList[I]^) do
    try
    case MessageType of
    mtRU: begin
      Subject:=SubjectRU;
      Message:=MessageRU;
      end;
    end;
    //.
    flMessageIsSent:=false;
    case SendMethod of
    esmMBM:   if (Config.MBM_flEnabled) then flMessageIsSent:=SendMessageBoardMessageNotification(idTOwner,idOwner,VisualizationEventPositionX,VisualizationEventPositionY, Address, MessageType,Subject,Message);
    esmEMAIL: if (Config.EMAIL_flEnabled) then flMessageIsSent:=SendEMailNotification(idTOwner,idOwner,VisualizationEventPositionX,VisualizationEventPositionY, Address, MessageType,Subject,Message);
    esmSMS:   if (Config.SMS_flEnabled) then flMessageIsSent:=SendSMSNotification(idTOwner,idOwner,VisualizationEventPositionX,VisualizationEventPositionY, Address, MessageType,Subject,Message);
    else
      Raise Exception.Create('sending protocol is not implemented yet'); //. =>
    end;
    //. log message to the ProxySpace EventLog
    if (flMessageIsSent)
     then begin
      ProxySpace__EventLog_WriteInfoEvent('TNotificationAreaEventsProcessor.ProcessStateEvent','Notification message has been sent to the '+EventSendMethods[SendMethod]+' Address: '+Address,'Message: '+Subject);
      //.
      PostMessage(Panel.Handle, WM_UPDATESTATISTICS, 0,0);
      end;
    except
      On E: Exception do ProxySpace__EventLog_WriteMinorEvent('TNotificationAreaEventsProcessor.ProcessStateEvent','Cannot send notification to the '+EventSendMethods[SendMethod]+' Address: '+Address,E.Message);
      end;
  finally
  for I:=0 to EndpointList.Count-1 do begin
    ptrDestroyItem:=EndpointList[I];
    GetMem(ptrDestroyItem,SizeOf(TEventSendEndpoint));
    end;
  EndpointList.Destroy;
  end;
except
  On E: Exception do begin
    ProxySpace__EventLog_WriteMinorEvent('TNotificationAreaEventsProcessor.ProcessStateEvent','Cannot send message to the notification addresses',' VisualizationPtr: ('+IntToStr(idTVisualization)+';'+IntToStr(idVisualization)+'). NotifyList: '+NotificationAddresses+'. Exception: '+E.Message);
    Exit; //. ->
    end;
  end;
finally
Lock.Enter;
try
Dec(EventsInProcessingCount);
finally
Lock.Leave;
end;
end;
end;

procedure TNotificationAreaEventsProcessor.ProcessUserAlertEvent(const VisualizationPtr: TPtr; const VisualizationEventPositionX,VisualizationEventPositionY: Extended; const AlertTimeStamp: TDateTime; const AlertSeverity: integer; const AlertDescription: string; const NotificationAddresses: string);
var
  EndpointList: TList;
  idTVisualization,idVisualization: integer;
  idTOwner,idOwner: integer;
  VisualizationName: string;
  AlertSeverityString: string;
  AlertTimeStampString: string;
  I: integer;
  Subject,Message: string;
  SubjectRU,MessageRU: string;
  flMessageIsSent: boolean;
  ptrDestroyItem: pointer;
begin
if (NOT flOn) then Exit; //. ->
//.
Lock.Enter;
try
Inc(EventsInProcessingCount);
finally
Lock.Leave;
end;
try
try
//. prepare subject and message
idTVisualization:=ProxySpace__Obj_IDType(VisualizationPtr);
idVisualization:=ProxySpace__Obj_ID(VisualizationPtr);
with TComponentFunctionality_Create(idTVisualization,idVisualization) do
try
if (GetOwner(idTOwner,idOwner))
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  VisualizationName:=Name;
  finally
  Release;
  end
 else VisualizationName:=Name;
finally
Release;
end;
//.
case TUserAlertSeverity(AlertSeverity) of
uasNone:        AlertSeverityString:='none';
uasMinor:       AlertSeverityString:='Minor';
uasMajor:       AlertSeverityString:='Major';
uasCritical:    AlertSeverityString:='Critical';
else
  AlertSeverityString:=IntToStr(AlertSeverity);
end;
AlertTimeStampString:=FormatDateTime('DD/MM/YY HH:NN:SS',AlertTimeStamp);
Subject:='"'+VisualizationName+'" raises a '+AlertSeverityString+' ALERT (time: '+AlertTimeStampString+', description: "'+AlertDescription+'")';
Message:=FormatDateTime('YY/MM/DD HH:NN:SS|',Now)+' '+Subject;
//.
case TUserAlertSeverity(AlertSeverity) of
uasNone:        AlertSeverityString:='нет';
uasMinor:       AlertSeverityString:='Слабая';
uasMajor:       AlertSeverityString:='Сильная';
uasCritical:    AlertSeverityString:='КРИТИЧЕСКАЯ';
else
  AlertSeverityString:=IntToStr(AlertSeverity);
end;
AlertTimeStampString:=FormatDateTime('DD/MM/YY HH:NN:SS',AlertTimeStamp);
if (AlertSeverity > 0)
 then SubjectRU:='! ТРЕВОГА ('+AlertSeverityString+') для объекта "'+VisualizationName+', (время: '+AlertTimeStampString+', описание: "'+AlertDescription+'")'
 else SubjectRU:='СНЯТА ТРЕВОГА для объекта "'+VisualizationName+', (время: '+AlertTimeStampString+', описание: "'+AlertDescription+'")';
MessageRU:=FormatDateTime('YY/MM/DD HH:NN:SS|',Now)+' '+SubjectRU;
except
  On E: Exception do begin
    Panel.Log_AddMessage('! EXCEPTION: Cannot prepare notification message. VisualizationPtr: '+IntToStr(VisualizationPtr)+'. Error: '+E.Message);
    Exit; //. ->
    end;
  end;
//. log notification
///? if (Panel.cbShowLog.Checked) then Panel.Log_AddEvent(AreaName,VisualizationName,flIncomingEvent,NotificationAddresses);
if (Panel.cbShowLog.Checked) then Panel.Log_AddMessage(Subject);
//.
try
if (ParseNotificationAddresses(NotificationAddresses, EndpointList))
 then
  try
  for I:=0 to EndpointList.Count-1 do with TEventSendEndpoint(EndpointList[I]^) do
    try
    case MessageType of
    mtRU: begin
      Subject:=SubjectRU;
      Message:=MessageRU;
      end;
    end;
    //.
    flMessageIsSent:=false;
    case SendMethod of
    esmMBM:   if (Config.MBM_flEnabled) then flMessageIsSent:=SendMessageBoardMessageNotification(idTOwner,idOwner,VisualizationEventPositionX,VisualizationEventPositionY, Address, MessageType,Subject,Message);
    esmEMAIL: if (Config.EMAIL_flEnabled) then flMessageIsSent:=SendEMailNotification(idTOwner,idOwner,VisualizationEventPositionX,VisualizationEventPositionY, Address, MessageType,Subject,Message);
    esmSMS:   if (Config.SMS_flEnabled) then flMessageIsSent:=SendSMSNotification(idTOwner,idOwner,VisualizationEventPositionX,VisualizationEventPositionY, Address, MessageType,Subject,Message);
    else
      Raise Exception.Create('sending protocol is not implemented yet'); //. =>
    end;
    //. log message to the ProxySpace EventLog
    if (flMessageIsSent)
     then begin
      ProxySpace__EventLog_WriteInfoEvent('TNotificationAreaEventsProcessor.ProcessUserAlertEvent','Notification message has been sent to the '+EventSendMethods[SendMethod]+' Address: '+Address,'Message: '+Subject);
      //.
      PostMessage(Panel.Handle, WM_UPDATESTATISTICS, 0,0);
      end;
    except
      On E: Exception do ProxySpace__EventLog_WriteMinorEvent('TNotificationAreaEventsProcessor.ProcessUserAlertEvent','Cannot send notification to the '+EventSendMethods[SendMethod]+' Address: '+Address,E.Message);
      end;
  finally
  for I:=0 to EndpointList.Count-1 do begin
    ptrDestroyItem:=EndpointList[I];
    GetMem(ptrDestroyItem,SizeOf(TEventSendEndpoint));
    end;
  EndpointList.Destroy;
  end;
except
  On E: Exception do begin
    ProxySpace__EventLog_WriteMinorEvent('TNotificationAreaEventsProcessor.ProcessUserAlertEvent','Cannot send message to the notification addresses',' VisualizationPtr: ('+IntToStr(idTVisualization)+';'+IntToStr(idVisualization)+'). NotifyList: '+NotificationAddresses+'. Exception: '+E.Message);
    Exit; //. ->
    end;
  end;
finally
Lock.Enter;
try
Dec(EventsInProcessingCount);
finally
Lock.Leave;
end;
end;
end;

function TNotificationAreaEventsProcessor.GetSMSTransmitter(): TSMSTransmitter;
var
  ST: TSMSSendingType;
begin
Lock.Enter;
try
ST:=Config.SMS_SendingType;
finally
Lock.Leave;
end;
SMS__Transmitter_Lock.Enter;
try
if (SMS_Transmitter <> nil)
 then begin
  if (SMS_Transmitter.SendingType = ST)
   then begin
    Result:=SMS_Transmitter;
    Exit; //. ->
    end
   else FreeAndNil(SMS_Transmitter);
  end;
//.
try
case ST of
sstText: begin
  SMS_Transmitter:=TSMSTextedTransmitter.Create(Self);
  ProxySpace__EventLog_WriteInfoEvent('TNotificationAreaEventsProcessor.GetSMSTransmitter','SMS-transmitter has been created successfully, type: '+SMSSendingTypeStrings[ST]);
  end;
else
  Raise Exception.Create('SMS-transmitter is not implemented for sending type: '+SMSSendingTypeStrings[ST]); //. =>
end;
except
  On E: Exception do begin
    ProxySpace__EventLog_WriteMajorEvent('TNotificationAreaEventsProcessor.GetSMSTransmitter','Cannot get SMS-transmitter of the type: '+SMSSendingTypeStrings[ST],E.Message);
    FreeAndNil(SMS_Transmitter);
    end;
  end;
finally
SMS__Transmitter_Lock.Leave;
end;
Result:=SMS_Transmitter;
end;


{TSMSTextedTransmitter}
Constructor TSMSTextedTransmitter.Create(const pProcessor: TNotificationAreaEventsProcessor);
var
  PortNumber: integer;
  PortSpeed: integer;
  PortName: string;
  DCB: TDCB;
  Timeouts: TCommTimeouts;
begin
Inherited Create(pProcessor);
SendingType:=sstText;
//.
Processor.Lock.Enter;
try
PortNumber:=Processor.Config.SMS_CommPort;
PortSpeed:=Processor.Config.SMS_PortSpeed;
finally
Processor.Lock.Leave;
end;
//.
Handle:=INVALID_HANDLE_VALUE;
PortName:='\\.\COM'+IntToStr(PortNumber);
Handle:=CreateFile(PChar(PortName),GENERIC_READ+GENERIC_WRITE,0,nil,OPEN_EXISTING,0,0);
if (Handle = INVALID_HANDLE_VALUE) then Raise Exception.Create('cannot open comm port '+PortName+': '+SysErrorMessage(GetLastError)); //. =>
if (NOT GetCommState(Handle, DCB)) then Raise Exception.Create('could not get comm state'); //. =>
DCB.BaudRate:=PortSpeed;
if (NOT SetCommState(Handle, DCB)) then Raise Exception.Create('could not set comm state'); //. =>
Timeouts.ReadIntervalTimeout:=0;
Timeouts.ReadTotalTimeoutMultiplier:=0;
Timeouts.ReadTotalTimeoutConstant:=10000;
Timeouts.WriteTotalTimeoutMultiplier:=0;
Timeouts.WriteTotalTimeoutConstant:=0;
if (NOT SetCommTimeouts(Handle,Timeouts)) then Raise Exception.Create('could not set comm timeouts'); //. =>
end;

Destructor TSMSTextedTransmitter.Destroy;
begin
if (Handle <> INVALID_HANDLE_VALUE) then CloseHandle(Handle);
Inherited;
end;

function TSMSTextedTransmitter.ReadString(const StringSize: longword): shortstring;
var
  C: Char;
  NumberOfActualReadBytes: longword;
begin
if ((NOT ReadFile(Handle,Pointer(@Result[1])^,StringSize,NumberOfActualReadBytes,nil)) OR (NumberOfActualReadBytes <> StringSize)) then Raise Exception.Create('could not read port: '+SysErrorMessage(GetLastError)); //. =>
end;

procedure TSMSTextedTransmitter.WriteString(const Ln: shortstring);
var
  NumberOfActualWrittenBytes: longword;
begin
if ((NOT WriteFile(Handle, Pointer(@Ln[1])^, Length(Ln), NumberOfActualWrittenBytes, nil)) OR (NumberOfActualWrittenBytes <> Length(Ln))) then Raise Exception.Create('could not write port: '+SysErrorMessage(GetLastError)); //. =>
end;

function TSMSTextedTransmitter.ReadLn(SkipLnCount: integer): shortstring;

  function GetLn: shortstring;
  var
    C: Char;
    NumberOfActualReadBytes: longword;
    R: shortstring;
  begin
  R:='';
  repeat
    if ((NOT ReadFile(Handle,C,1,NumberOfActualReadBytes,nil)) OR (NumberOfActualReadBytes <> 1)) then Raise Exception.Create('could not read port: '+SysErrorMessage(GetLastError)); //. =>
    if ((C <> #$0D) AND (C <> #$0A)) then R:=R+C;
  until (C = #$0A);
  Result:=R;
  end;

begin
while (SkipLnCount > 0) do begin
  GetLn();
  Dec(SkipLnCount);
  end;
Result:=GetLn();
end;

procedure TSMSTextedTransmitter.WriteLn(Ln: shortstring);
var
  NumberOfActualWrittenBytes: longword;
begin
Ln:=Ln+#$0D#$0A;
if ((NOT WriteFile(Handle, Pointer(@Ln[1])^, Length(Ln), NumberOfActualWrittenBytes, nil)) OR (NumberOfActualWrittenBytes <> Length(Ln))) then Raise Exception.Create('could not write port: '+SysErrorMessage(GetLastError)); //. =>
end;

procedure TSMSTextedTransmitter.SendMessage(const Address: shortstring; const Message: shortstring);

  procedure CheckOK(const Response: shortstring);
  begin
  if (Response = 'OK') then Exit; //. ->
  Raise Exception.Create('response error'); //. =>
  end;

  procedure CheckReadSymbol(const Response: shortstring);
  begin
  if (Response = '> ') then Exit; //. ->
  Raise Exception.Create('response error'); //. =>
  end;

var
  Response: shortstring;
  idSMS: integer;
begin
WriteLn('AT');
Response:=ReadLn(2);
CheckOK(Response);
//.
WriteLn('AT+CMGF=1');
Response:=ReadLn(2);
CheckOK(Response);
//.
WriteLn('AT+CMGW="'+Address+'"');
ReadLn(1); //. skip empty string
Response:=ReadString(2);
CheckReadSymbol(Response);
//. write message
WriteLn(Message);
WriteString(Char(26));
//. get composed SMS id
Response:=ReadLn(3);
Response:=MidStr(Response,7,Length(Response)-6);
try
idSMS:=StrToInt(Response);
except
  Raise Exception.Create('error of composing SMS'); //. =>
  end;
try
//.
Response:=ReadLn(1);
CheckOK(Response);
//.
WriteLn('AT+CMSS='+IntToStr(idSMS));
//. get sent SMS id
Response:=ReadLn(2);
Response:=MidStr(Response,7,Length(Response)-6);
idSMS:=StrToInt(Response);
//.
ReadLn(1);
finally
//. delete composed message
WriteLn('AT+CMGD='+IntToStr(idSMS)+',3');
//.
Response:=ReadLn(2);
CheckOK(Response);
end;
end;




{TfmNotificationAreaEventsProcessorPanel}
Constructor TfmNotificationAreaEventsProcessorPanel.Create(const pEventsProcessor: TNotificationAreaEventsProcessor);
begin
Inherited Create(nil);
EventsProcessor:=pEventsProcessor;
LogLock:=TCriticalSection.Create;
Log:=TStringList.Create;
Update();
end;

Destructor TfmNotificationAreaEventsProcessorPanel.Destroy;
begin
Log.Free;
LogLock.Free;
Inherited;
end;

procedure TfmNotificationAreaEventsProcessorPanel.Update;
begin
with EventsProcessor do begin
Lock.Enter;
try
with Config do begin
ConfigMBM_cbEnabled.Checked:=MBM_flEnabled;
ConfigMBM_edidPositionerPrototype.Text:=IntToStr(MBM_idPositionerPrototype);
ConfigMBM_edidCoReferencePrototype.Text:=IntToStr(MBM_idCoReferencePrototype);
ConfigMBM_edSenderMessageBoardID.Text:=IntToStr(MBM_SenderMessageBoardID);
ConfigMBM_edMessageComponentsLeft.Text:=IntToStr(MBM_MessageComponentsLeft);
ConfigMBM_edMessageComponentsTop.Text:=IntToStr(MBM_MessageComponentsTop);
ConfigEMAIL_cbEnabled.Checked:=EMAIL_flEnabled;
ConfigEMAIL_edServerAddress.Text:=EMAIL_ServerAddress;
ConfigEMAIL_edServerPort.Text:=IntToStr(EMAIL_ServerPort);
ConfigEMAIL_edConnectingTime.Text:=IntToStr(EMAIL_ConnectingTime);
ConfigEMAIL_cbUseAuthentication.Checked:=EMAIL_UseAuthentication;
ConfigEMAIL_edSenderAddress.Text:=EMAIL_SenderAddress;
ConfigEMAIL_edSenderUserName.Text:=EMAIL_SenderUserName;
ConfigEMAIL_edSenderUserPassword.Text:=EMAIL_SenderUserPassword;
ConfigSMS_cbEnabled.Checked:=SMS_flEnabled;
ConfigSMS_edCommPort.Text:=IntToStr(SMS_CommPort);
ConfigSMS_edPortSpeed.Text:=IntToStr(SMS_PortSpeed);
ConfigSMS_cbSendingMethod.Items.Clear;
ConfigSMS_cbSendingMethod.Items.Add(SMSSendingTypeStrings[sstText]);
ConfigSMS_cbSendingMethod.Items.Add(SMSSendingTypeStrings[sstPDU]);
case SMS_SendingType of
sstText: ConfigSMS_cbSendingMethod.ItemIndex:=0;
sstPDU: ConfigSMS_cbSendingMethod.ItemIndex:=1;
else
  ConfigSMS_cbSendingMethod.ItemIndex:=-1;
end;
end;
finally
Lock.Leave;
end;
end;
end;

procedure TfmNotificationAreaEventsProcessorPanel.Log_AddEvent(const AreaName: string; const VisualizationName: string; const flIncomingEvent: boolean; const NotificationAddresses: string);
var
  I: integer;
begin
LogLock.Enter;
try
while (Log.Count > LogMaxItems) do Log.Delete(0);
if (flIncomingEvent)
 then I:=Log.Add(FormatDateTime('YY/MM/DD HH:NN:SS',Now)+' Object: "'+VisualizationName+'" is inside of Area: "'+AreaName+'", NotifyList: '+NotificationAddresses)
 else I:=Log.Add(FormatDateTime('YY/MM/DD HH:NN:SS',Now)+' Object: "'+VisualizationName+'" is outside of Area: "'+AreaName+'", NotifyList: '+NotificationAddresses);
finally
LogLock.Leave;
end;
//.
PostMessage(Handle, WM_UPDATELOG, 0,0);
end;

procedure TfmNotificationAreaEventsProcessorPanel.Log_AddMessage(const Message: string);
begin
LogLock.Enter;
try
while (Log.Count > LogMaxItems) do Log.Delete(0);
Log.Add(FormatDateTime('YY/MM/DD HH:NN:SS',Now)+': '+Message);
finally
LogLock.Leave;
end;
//.
PostMessage(Handle, WM_UPDATELOG, 0,0);
end;

procedure TfmNotificationAreaEventsProcessorPanel.wmShowPanel(var Message: TMessage);
begin
Show();
end;

procedure TfmNotificationAreaEventsProcessorPanel.wmUpdateLog(var Message: TMessage);
begin
LogLock.Enter;
try
ListBox.Items.Assign(Log);
ListBox.ItemIndex:=ListBox.Items.Count-1;
finally
LogLock.Leave;
end;
end;

procedure TfmNotificationAreaEventsProcessorPanel.wmUpdateStatistics(var Message: TMessage);
begin
with EventsProcessor do begin
Lock.Enter;
try
StatMBM_edSentCount.Text:=IntToStr(Stat.MBM_SentCount);
StatEMAIL_edSentCount.Text:=IntToStr(Stat.EMAIL_SentCount);
StatSMS_edSentCount.Text:=IntToStr(Stat.SMS_SentCount);
finally
Lock.Leave;
end;
end;
end;

procedure TfmNotificationAreaEventsProcessorPanel.SaveProcessorConfiguration;
begin
with EventsProcessor do begin
Lock.Enter;
try
with Config do begin
MBM_flEnabled:=ConfigMBM_cbEnabled.Checked;
MBM_idPositionerPrototype:=StrToInt(ConfigMBM_edidPositionerPrototype.Text);
MBM_idCoReferencePrototype:=StrToInt(ConfigMBM_edidCoReferencePrototype.Text);
MBM_SenderMessageBoardID:=StrToInt(ConfigMBM_edSenderMessageBoardID.Text);
MBM_MessageComponentsLeft:=StrToInt(ConfigMBM_edMessageComponentsLeft.Text);
MBM_MessageComponentsTop:=StrToInt(ConfigMBM_edMessageComponentsTop.Text);
EMAIL_flEnabled:=ConfigEMAIL_cbEnabled.Checked;
EMAIL_ServerAddress:=ConfigEMAIL_edServerAddress.Text;
EMAIL_ServerPort:=StrToInt(ConfigEMAIL_edServerPort.Text);
EMAIL_ConnectingTime:=StrToInt(ConfigEMAIL_edConnectingTime.Text);
EMAIL_UseAuthentication:=ConfigEMAIL_cbUseAuthentication.Checked;
EMAIL_SenderAddress:=ConfigEMAIL_edSenderAddress.Text;
EMAIL_SenderUserName:=ConfigEMAIL_edSenderUserName.Text;
EMAIL_SenderUserPassword:=ConfigEMAIL_edSenderUserPassword.Text;
SMS_flEnabled:=ConfigSMS_cbEnabled.Checked;
SMS_CommPort:=StrToInt(ConfigSMS_edCommPort.Text);
SMS_PortSpeed:=StrToInt(ConfigSMS_edPortSpeed.Text);
case (ConfigSMS_cbSendingMethod.ItemIndex) of
0: SMS_SendingType:=sstText;
1: SMS_SendingType:=sstPDU;
else
  SMS_SendingType:=sstUnknown;
end;
end;
//.
SaveConfiguration;
finally
Lock.Leave;
end;
end;
ShowMessage('Configuration has been saved successfully.');
end;

procedure TfmNotificationAreaEventsProcessorPanel.bbSaveConfigurationClick(Sender: TObject);
begin
SaveProcessorConfiguration;
end;

procedure TfmNotificationAreaEventsProcessorPanel.btnAreaNotifierClick(Sender: TObject);
begin
GeoObjectAreaNotifier_ShowPanel();
end;

procedure TfmNotificationAreaEventsProcessorPanel.btnDistanceNotifierClick(Sender: TObject);
begin
ObjectDistanceNotifier_ShowPanel();
end;

procedure TfmNotificationAreaEventsProcessorPanel.btnNotificationAreaNotifierClick(Sender: TObject);
begin
NotificationAreaNotifier_ShowPanel();
end;


procedure NotificationAreaEventsProcessor_Initialize();
begin
NotificationAreaEventsProcessor:=TNotificationAreaEventsProcessor.Create();
end;

procedure NotificationAreaEventsProcessor_Finalize();
begin
FreeAndNil(NotificationAreaEventsProcessor);
end;

procedure NotificationAreaEventsProcessor_ShowPanel();
begin
if (NotificationAreaEventsProcessor <> nil) then PostMessage(NotificationAreaEventsProcessor.Panel.Handle, WM_SHOWPANEL, 0,0);
end;


Initialization

Finalization
FreeAndNil(NotificationAreaEventsProcessor);

end.
