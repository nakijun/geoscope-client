unit unitEventLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, SyncObjs, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ImgList, Menus;

const
  MaxEventLogSaveLength = 300;
  WM_UPDATEEVENTS = WM_USER+1;
type
  TEventSeverity = (esInfo,esMinor,esMajor,esCritical);

  TEventLogItem = record
    Next: pointer;
    TimeStamp: TDateTime;
    Severity: TEventSeverity;
    EventTypeID: integer;
    EventID: integer;
    Source: string;
    EventMessage: string;
    EventInfo: string;
  end;

  TEventLog = class;

  TEventLogMonitor = class(TThread)
  private
    EventLog: TEventLog;
    MonitorAddress: string;
    ServerName: string;
    ServerID: integer;
    QoS_SendInterval: integer;
    Lock: TCriticalSection;
    Items: pointer;

    Constructor Create(const pEventLog: TEventLog; const pMonitorAddress: string; const pServerName: string; const pQoS_SendInterval: integer);
    Destructor Destroy; override;
    procedure Execute; override;
    procedure ClearItems(var Items: pointer);
    procedure WriteEvent(const pSeverity: TEventSeverity; const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0);
  end;

  TfmEventLog = class;

  TEventLog = class
  private
    Lock: TCriticalSection;
    LogFileName: string;
    Items: pointer;
    ItemsCount: integer;
    _NewErrorsCount: integer; {new major+critical events}
    QoS_Value: double;
    Monitor: TEventLogMonitor;
    fmEventLog: TfmEventLog;

    procedure CheckItemsListSize;
  public
    Constructor Create(const pLogFileName: string);
    Destructor Destroy; override;
    procedure ClearItems(var Items: pointer);
    procedure Clear;
    procedure Load;
    procedure Save;
    procedure CopyItems(out ItemsCopy: pointer);
    function NewErrorsCount: integer;
    function GetLastErrorEvent(out ErrEvent: TEventLogItem): boolean;
    function GetControlPanel: TfmEventLog;
    //.
    procedure WriteInfoEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0);
    procedure WriteMinorEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0);
    procedure WriteMajorEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0);
    procedure WriteCriticalEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0);
    procedure WriteQoSValue(const Value: double);
    procedure DoOnException(Sender: TObject; E: Exception);
  end;

  TfmEventLog = class(TForm)
    Panel1: TPanel;
    lvEventLog: TListView;
    lvEventsLog_ImageList: TImageList;
    lvEventLog_PopupMenu: TPopupMenu;
    Clearallevents1: TMenuItem;
    Servermonitor1: TMenuItem;
    Setmonitor1: TMenuItem;
    Deletemonitor1: TMenuItem;
    procedure Clearallevents1Click(Sender: TObject);
    procedure Setmonitor1Click(Sender: TObject);
    procedure Deletemonitor1Click(Sender: TObject);
  private
    { Private declarations }
    EventLog: TEventLog;

    procedure Update; reintroduce;
    procedure wmUPDATEEVENTS(var Message: TMessage); message WM_UPDATEEVENTS;
  public
    { Public declarations }
    Constructor Create(const pEventLog: TEventLog);
  end;

const
  TEventSeverityStrings: array[TEventSeverity] of string = ('Information','Minor','Major','Critical');


var
  EventLog: TEventLog;

  procedure Initialize(const pLogFileName: string);
  procedure Finalize;

implementation
Uses
  ActiveX,
  unitRPC,
  MSXML,
  ServiceMonitor_TLB,
  unitEventLogMonitor,
  unitSpaceFunctionalServer,
  unitAreaNotificationServer;

{$R *.dfm}


{TEventLog}
Constructor TEventLog.Create(const pLogFileName: string);
begin
Inherited Create;
Lock:=TCriticalSection.Create;
LogFileName:=pLogFileName;
Items:=nil;
ItemsCount:=0;
_NewErrorsCount:=0;
QoS_Value:=1.0; //. 100% quality of service
Monitor:=nil;
try
Load();
except
  //. catch any exceptions on loading
  end;
fmEventLog:=nil;
end;

Destructor TEventLog.Destroy;
begin
fmEventLog.Free;
if (Lock <> nil)
 then begin
  Lock.Enter;
  try
  Save();
  ClearItems(Items);
  finally
  Lock.Leave;
  end;
  end;
Monitor.Free;
Lock.Free;
Inherited;
end;

procedure TEventLog.ClearItems(var Items: pointer);
var
  ptrDestroyItem: pointer;
begin
while (Items <> nil) do begin
  ptrDestroyItem:=Items;
  Items:=TEventLogItem(ptrDestroyItem^).Next;
  with TEventLogItem(ptrDestroyItem^) do begin
  SetLength(Source,0);
  SetLength(EventMessage,0);
  SetLength(EventInfo,0);
  end;
  FreeMem(ptrDestroyItem,SizeOf(TEventLogItem));
  end;
end;

procedure TEventLog.Clear;
begin
Lock.Enter;
try
ClearItems(Items);
ItemsCount:=0;
_NewErrorsCount:=0;
finally
Lock.Leave;
end;
//. update events panel if exists
if (fmEventLog <> nil) then PostMessage(fmEventLog.Handle, WM_UPDATEEVENTS,0,0);
end;

procedure TEventLog.CheckItemsListSize;
var
  ptrItem: pointer;
  I: integer;
  ptrDestroyList: pointer;
begin
ptrDestroyList:=nil;
Lock.Enter;
try
if (ItemsCount > 2*MaxEventLogSaveLength)
 then begin
  ptrItem:=Items;
  for I:=0 to MaxEventLogSaveLength-1 do
    if (I = MaxEventLogSaveLength-1)
     then begin
      ptrDestroyList:=TEventLogItem(ptrItem^).Next;
      TEventLogItem(ptrItem^).Next:=nil;
      end
     else ptrItem:=TEventLogItem(ptrItem^).Next;
  ItemsCount:=MaxEventLogSaveLength;
  end;
finally
Lock.Leave;
end;
if (ptrDestroyList <> nil) then ClearItems(ptrDestroyList);
end;

procedure TEventLog.Load;
var
  Doc: IXMLDOMDocument;
  VersionNode: IXMLDOMNode;
  Version: integer;
  MonitorNode: IXMLDOMNode;
  ItemsNode: IXMLDOMNode;
  ptrptrLastItem: pointer;
  I: integer;
  ItemNode,PropNode: IXMLDOMNode;
  ptrNewItem: pointer;
  TS: double;
  MonitorAddress: string;
  ServerName: string;
  QoS_SendInterval: integer;
begin
Lock.Enter;
try
ClearItems(Items);
//.
MonitorNode:=nil;
if (FileExists(LogFileName))
 then begin
  Doc:=CoDomDocument.Create;
  Doc.Set_Async(false);
  Doc.Load(LogFileName);
  VersionNode:=Doc.documentElement.selectSingleNode('/ROOT/Version');
  if VersionNode <> nil
   then Version:=VersionNode.nodeTypedValue
   else Version:=0;
  if (Version <> 0) then Exit; //. ->
  ptrptrLastItem:=@Items;
  ItemsNode:=Doc.documentElement.selectSingleNode('/ROOT/Items');
  for I:=0 to ItemsNode.childNodes.length-1 do begin
    ItemNode:=ItemsNode.childNodes[I];
    //. create new track item and insert
    GetMem(ptrNewItem,SizeOf(TEventLogItem));
    FillChar(ptrNewItem^,SizeOf(TEventLogItem), 0);
    with TEventLogItem(ptrNewItem^) do begin
    Next:=nil;
    TS:=ItemNode.selectSingleNode('TimeStamp').nodeTypedValue;
    TimeStamp:=TDateTime(TS);
    Severity:=ItemNode.selectSingleNode('Severity').nodeTypedValue;
    EventTypeID:=ItemNode.selectSingleNode('EventTypeID').nodeTypedValue;
    EventID:=ItemNode.selectSingleNode('EventID').nodeTypedValue;
    Source:=ItemNode.selectSingleNode('Source').nodeTypedValue;
    EventMessage:=ItemNode.selectSingleNode('EventMessage').nodeTypedValue;
    EventInfo:=ItemNode.selectSingleNode('EventInfo').nodeTypedValue;
    end;
    Pointer(ptrptrLastItem^):=ptrNewItem;
    ptrptrLastItem:=@TEventLogItem(ptrNewItem^).Next;
    Inc(ItemsCount);
    end;
  MonitorNode:=Doc.documentElement.selectSingleNode('/ROOT/Monitor');
  end;
if (MonitorNode <> nil)
 then begin
  ServerName:=MonitorNode.selectSingleNode('ServerName').nodeTypedValue;
  //. override name for functional server or area notification server
  if (unitSpaceFunctionalServer.flYes) then ServerName:=unitSpaceFunctionalServer.ServerInstanceName else
  if (unitAreaNotificationServer.flYes) then ServerName:=unitAreaNotificationServer.ServerInstanceName ;
  //.
  MonitorAddress:=MonitorNode.selectSingleNode('MonitorAddress').nodeTypedValue;
  QoS_SendInterval:=MonitorNode.selectSingleNode('QoS_SendInterval').nodeTypedValue;
  //.
  FreeAndNil(Monitor);
  Monitor:=TEventLogMonitor.Create(Self,MonitorAddress,ServerName,QoS_SendInterval);
  end
 else begin
  if (unitSpaceFunctionalServer.flYes)
   then begin
    ServerName:=unitSpaceFunctionalServer.ServerInstanceName;
    MonitorAddress:='127.0.0.1';
    QoS_SendInterval:=5000;
    //.
    FreeAndNil(Monitor);
    Monitor:=TEventLogMonitor.Create(Self,MonitorAddress,ServerName,QoS_SendInterval);
    end else
  if (unitAreaNotificationServer.flYes)
   then begin
    ServerName:=unitAreaNotificationServer.ServerInstanceName;
    MonitorAddress:='127.0.0.1';
    QoS_SendInterval:=5000;
    //.
    FreeAndNil(Monitor);
    Monitor:=TEventLogMonitor.Create(Self,MonitorAddress,ServerName,QoS_SendInterval);
    end ;
  end;
finally
Lock.Leave;
end;
end;

procedure TEventLog.Save;
var
  Doc: IXMLDOMDocument;
  PI: IXMLDOMProcessingInstruction;
  Root: IXMLDOMElement;
  VersionNode,MonitorNode: IXMLDOMElement;
  ItemsNode: IXMLDOMElement;
  ptrItem: pointer;
  I: integer;
  ItemNode: IXMLDOMElement;
  //.
  PropNode: IXMLDOMElement;
  TS: double;
begin
Lock.Enter;
try
Doc:=CoDomDocument.Create;
Doc.Set_Async(false);
PI:=Doc.createProcessingInstruction('xml', 'version=''1.0''');
Doc.insertBefore(PI, Doc.childNodes.Item[0]);
Root:=Doc.createElement('ROOT');
Root.setAttribute('xmlns:dt', 'urn:schemas-microsoft-com:datatypes');
Doc.documentElement:=Root;
VersionNode:=Doc.createElement('Version');
VersionNode.nodeTypedValue:=0;
Root.appendChild(VersionNode);
//. add monitor if exists
if (Monitor <> nil)
 then begin
  MonitorNode:=Doc.createElement('Monitor');
  PropNode:=Doc.CreateElement('ServerName');       PropNode.nodeTypedValue:=Monitor.ServerName;       MonitorNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('MonitorAddress');   PropNode.nodeTypedValue:=Monitor.MonitorAddress;   MonitorNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('QoS_SendInterval'); PropNode.nodeTypedValue:=Monitor.QoS_SendInterval; MonitorNode.appendChild(PropNode);
  Root.appendChild(MonitorNode);
  end;
//.
ItemsNode:=Doc.createElement('Items');
Root.appendChild(ItemsNode);
I:=0;
ptrItem:=Items;
while (ptrItem <> nil) do with TEventLogItem(ptrItem^) do begin
  //. create item
  ItemNode:=Doc.CreateElement('Item'+IntToStr(I));
  //.
  TS:=TimeStamp;
  PropNode:=Doc.CreateElement('TimeStamp');              PropNode.nodeTypedValue:=TS;                      ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Severity');               PropNode.nodeTypedValue:=Severity;                ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('EventTypeID');            PropNode.nodeTypedValue:=EventTypeID;             ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('EventID');                PropNode.nodeTypedValue:=EventID;                 ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('Source');                 PropNode.nodeTypedValue:=Source;                  ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('EventMessage');           PropNode.nodeTypedValue:=EventMessage;            ItemNode.appendChild(PropNode);
  PropNode:=Doc.CreateElement('EventInfo');              PropNode.nodeTypedValue:=EventInfo;               ItemNode.appendChild(PropNode);
  //. add item
  ItemsNode.appendChild(ItemNode);
  //. next item
  Inc(I);
  if (I > MaxEventLogSaveLength) then break; //. >
  ptrItem:=Next;
  end;
//. save xml document
Doc.Save(LogFileName);
finally
Lock.Leave;
end;
end;

procedure TEventLog.CopyItems(out ItemsCopy: pointer);
var
  ptrItem: pointer;
  ptrptrItem: pointer;
  ptrNewItem: pointer;
begin
Lock.Enter;
try
ItemsCopy:=nil;
ptrptrItem:=@ItemsCopy;
ptrItem:=Items;
while (ptrItem <> nil) do begin
  GetMem(ptrNewItem,SizeOf(TEventLogItem));
  FillChar(ptrNewItem^,SizeOf(TEventLogItem), 0);
  with TEventLogItem(ptrNewItem^) do begin
  Next:=nil;
  TimeStamp:=TEventLogItem(ptrItem^).TimeStamp;
  Severity:=TEventLogItem(ptrItem^).Severity;
  EventTypeID:=TEventLogItem(ptrItem^).EventTypeID;
  EventID:=TEventLogItem(ptrItem^).EventID;
  Source:=TEventLogItem(ptrItem^).Source;
  EventMessage:=TEventLogItem(ptrItem^).EventMessage;
  EventInfo:=TEventLogItem(ptrItem^).EventInfo;
  end;
  Pointer(ptrptrItem^):=ptrNewItem;
  ptrptrItem:=@TEventLogItem(ptrNewItem^).Next;
  //. next item
  ptrItem:=TEventLogItem(ptrItem^).Next;
  end;
finally
Lock.Leave;
end;
end;

function TEventLog.NewErrorsCount: integer;
begin
Lock.Enter;
try
Result:=_NewErrorsCount;
finally
Lock.Leave;
end;
end;

function TEventLog.GetLastErrorEvent(out ErrEvent: TEventLogItem): boolean;
var
  ptrItem: pointer;
begin
Result:=false;
Lock.Enter;
try
ptrItem:=Items;
while (ptrItem <> nil) do with TEventLogItem(ptrItem^) do begin
  if (Severity in [esMajor,esCritical])
   then begin
    ErrEvent.TimeStamp:=TimeStamp;
    ErrEvent.Severity:=Severity;
    ErrEvent.EventTypeID:=EventTypeID;
    ErrEvent.EventID:=EventID;
    ErrEvent.Source:=Source;
    ErrEvent.EventMessage:=EventMessage;
    ErrEvent.EventInfo:=EventInfo;
    Result:=true;
    Exit; //. ->
    end;
  ptrItem:=Next;
  end;
finally
Lock.Leave;
end;
end;

function TEventLog.GetControlPanel: TfmEventLog;
begin
if (fmEventLog = nil) then fmEventLog:=TfmEventLog.Create(Self);
Result:=fmEventLog;
end;

procedure TEventLog.WriteInfoEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0);
var
  ptrNewItem: pointer;
begin
if (Self = nil) then Exit; //. ->
Lock.Enter;
try
GetMem(ptrNewItem,SizeOf(TEventLogItem));
FillChar(ptrNewItem^,SizeOf(TEventLogItem), 0);
with TEventLogItem(ptrNewItem^) do begin
Next:=Items;
TimeStamp:=Now;
Severity:=esInfo;
EventTypeID:=pEventTypeID;
EventID:=pEventID;
Source:=pSource;
EventMessage:=pEventMessage;
EventInfo:=pEventInfo;
end;
Items:=ptrNewItem;
Inc(ItemsCount);
finally
Lock.Leave;
end;
//. add event to the monitor if it exists
if (Monitor <> nil) then Monitor.WriteEvent(esInfo,pSource,pEventMessage,pEventInfo);
//.
CheckItemsListSize();
//. update events panel if exists
if (fmEventLog <> nil) then PostMessage(fmEventLog.Handle, WM_UPDATEEVENTS,0,0);
end;

procedure TEventLog.WriteMinorEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0);
var
  ptrNewItem: pointer;
begin
if (Self = nil) then Exit; //. ->
Lock.Enter;
try
GetMem(ptrNewItem,SizeOf(TEventLogItem));
FillChar(ptrNewItem^,SizeOf(TEventLogItem), 0);
with TEventLogItem(ptrNewItem^) do begin
Next:=Items;
TimeStamp:=Now;
Severity:=esMinor;
EventTypeID:=pEventTypeID;
EventID:=pEventID;
Source:=pSource;
EventMessage:=pEventMessage;
EventInfo:=pEventInfo;
end;
Items:=ptrNewItem;
Inc(ItemsCount);
finally
Lock.Leave;
end;
//. add event to the monitor if it exists
if (Monitor <> nil) then Monitor.WriteEvent(esMinor,pSource,pEventMessage,pEventInfo);
//.
CheckItemsListSize();
//. update events panel if exists
if (fmEventLog <> nil) then PostMessage(fmEventLog.Handle, WM_UPDATEEVENTS,0,0);
end;

procedure TEventLog.WriteMajorEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0);
var
  ptrNewItem: pointer;
begin
if (Self = nil) then Exit; //. ->
Lock.Enter;
try
GetMem(ptrNewItem,SizeOf(TEventLogItem));
FillChar(ptrNewItem^,SizeOf(TEventLogItem), 0);
with TEventLogItem(ptrNewItem^) do begin
Next:=Items;
TimeStamp:=Now;
Severity:=esMajor;
EventTypeID:=pEventTypeID;
EventID:=pEventID;
Source:=pSource;
EventMessage:=pEventMessage;
EventInfo:=pEventInfo;
end;
Items:=ptrNewItem;
//.
Inc(ItemsCount);
Inc(_NewErrorsCount);
finally
Lock.Leave;
end;
//. add event to the monitor if it exists
if (Monitor <> nil) then Monitor.WriteEvent(esMajor,pSource,pEventMessage,pEventInfo);
//.
CheckItemsListSize();
//. update events panel if exists
if (fmEventLog <> nil) then PostMessage(fmEventLog.Handle, WM_UPDATEEVENTS,0,0);
end;

procedure TEventLog.WriteCriticalEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0);
var
  ptrNewItem: pointer;
begin
if (Self = nil) then Exit; //. ->
Lock.Enter;
try
GetMem(ptrNewItem,SizeOf(TEventLogItem));
FillChar(ptrNewItem^,SizeOf(TEventLogItem), 0);
with TEventLogItem(ptrNewItem^) do begin
Next:=Items;
TimeStamp:=Now;
Severity:=esCritical;
EventTypeID:=pEventTypeID;
EventID:=pEventID;
Source:=pSource;
EventMessage:=pEventMessage;
EventInfo:=pEventInfo;
end;
Items:=ptrNewItem;
//.
Inc(ItemsCount);
Inc(_NewErrorsCount);
finally
Lock.Leave;
end;
//. add event to the monitor if it exists
if (Monitor <> nil) then Monitor.WriteEvent(esCritical,pSource,pEventMessage,pEventInfo);
//.
CheckItemsListSize();
//. update events panel if exists
if (fmEventLog <> nil) then PostMessage(fmEventLog.Handle, WM_UPDATEEVENTS,0,0);
end;

procedure TEventLog.WriteQoSValue(const Value: double);
begin
if (Self = nil) then Exit; //. ->
Lock.Enter;
try
QoS_Value:=Value;
finally
Lock.Leave;
end;
end;

procedure TEventLog.DoOnException(Sender: TObject; E: Exception);
begin
if (Self = nil) then Exit; //. ->
WriteMajorEvent(Sender.ClassName,E.ClassName+': '+E.Message);
end;


{TEventLogMonitor}
Constructor TEventLogMonitor.Create(const pEventLog: TEventLog; const pMonitorAddress: string; const pServerName: string; const pQoS_SendInterval: integer);
begin
EventLog:=pEventLog;
MonitorAddress:=pMonitorAddress;
ServerName:=pServerName;
ServerID:=-1;
QoS_SendInterval:=pQoS_SendInterval;
Lock:=TCriticalSection.Create;
Items:=nil;
Inherited Create(false);
end;

Destructor TEventLogMonitor.Destroy;
begin
Inherited;
if (Lock <> nil)
 then begin
  Lock.Enter;
  try
  ClearItems(Items);
  finally
  Lock.Leave;
  end;
  Lock.Destroy;
  end;
end;

procedure TEventLogMonitor.Execute;

  function Wait(const Ms: integer): boolean;
  var
    I,Cnt: integer;
  begin
  Result:=false;
  Cnt:=(Ms DIV 100);
  for I:=0 to Cnt-1 do begin
    if (Terminated) then Exit; //. ->
    Sleep(100);
    end;
  Result:=true;
  end;

var
  ServiceMonitor: IcoServiceMonitor;
  ptrItem: pointer;
  flItemsAreProcessed: boolean;
  QV: double;
  QoS_LastSendTime: TDateTime;
begin
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
ServiceMonitor:=nil;
try
ServerID:=-1;
try
QoS_LastSendTime:=Now;
while (NOT Terminated) do begin
  //. validate connection to the monitor
  if (ServiceMonitor = nil)
   then
    try
    ServiceMonitor:=CocoServiceMonitor.CreateRemote(MonitorAddress);
    //. takeoff security
    TakeoffInterfaceSecurity(ServiceMonitor);
    //.
    ServerID:=ServiceMonitor.RegisterServer(ServerName,QoS_SendInterval);
    if (ServerID = -1) then Exit; //. ->
    except
      ServiceMonitor:=nil;
      end;
  //.
  Lock.Enter;
  try
  //. process events
  flItemsAreProcessed:=true;
  ptrItem:=Items;
  while (ptrItem <> nil) do with TEventLogItem(ptrItem^) do begin
    if (ServiceMonitor <> nil)
     then
      try
      ServiceMonitor.WriteEvent(ServerID,Integer(Severity),Source,EventMessage,EventInfo,EventTypeID,EventID);
      except
        ServiceMonitor:=nil;
        flItemsAreProcessed:=false;
        end;
    //. next item
    ptrItem:=Next;
    end;
  if (flItemsAreProcessed) then ClearItems(Items);
  //. send QoS value
  if (((Now-QoS_LastSendTime)*24*3600*1000 > QoS_SendInterval) AND (ServiceMonitor <> nil))
   then begin
    EventLog.Lock.Enter;
    try
    QV:=EventLog.QoS_Value;
    finally
    EventLog.Lock.Leave;
    end;
    try
    ServiceMonitor.SendQoS(ServerID,QV);
    QoS_LastSendTime:=Now;
    except
      ServiceMonitor:=nil;;
      end;
    end;
  finally
  Lock.Leave;
  end;
  //.
  Sleep(100);
  end;
finally
if ((ServerID <> -1) AND (ServiceMonitor <> nil))
 then begin
  ServiceMonitor.UnRegisterServer(ServerID);
  ServerID:=-1;
  end;
end;
finally
ServiceMonitor:=nil;
end;
finally
CoUnInitialize();
end;
end;

procedure TEventLogMonitor.ClearItems(var Items: pointer);
var
  ptrDestroyItem: pointer;
begin                                           
while (Items <> nil) do begin
  ptrDestroyItem:=Items;
  Items:=TEventLogItem(ptrDestroyItem^).Next;
  with TEventLogItem(ptrDestroyItem^) do begin
  SetLength(Source,0);
  SetLength(EventMessage,0);
  SetLength(EventInfo,0);
  end;
  FreeMem(ptrDestroyItem,SizeOf(TEventLogItem));
  end;
end;

procedure TEventLogMonitor.WriteEvent(const pSeverity: TEventSeverity; const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0);
var
  ptrNewItem: pointer;
begin
Lock.Enter;
try
GetMem(ptrNewItem,SizeOf(TEventLogItem));
FillChar(ptrNewItem^,SizeOf(TEventLogItem), 0);
with TEventLogItem(ptrNewItem^) do begin
Next:=Items;
TimeStamp:=Now;
Severity:=pSeverity;
EventTypeID:=pEventTypeID;
EventID:=pEventID;
Source:=pSource;
EventMessage:=pEventMessage;
EventInfo:=pEventInfo;
end;
Items:=ptrNewItem;
finally
Lock.Leave;
end;
end;

  
{TfmEventLog}
Constructor TfmEventLog.Create(const pEventLog: TEventLog);
begin
Inherited Create(nil);
EventLog:=pEventLog;
Update();
end;

procedure TfmEventLog.Update;
var
  LogItems: pointer;
  ptrItem: pointer;
begin
EventLog.CopyItems(LogItems);
try
with lvEventLog do begin
Items.BeginUpdate;
try
Items.Clear;
ptrItem:=LogItems;
while (ptrItem <> nil) do with TEventLogItem(ptrItem^),Items.Add do begin
  case Severity of
  esInfo: ImageIndex:=0;
  esMinor: ImageIndex:=1;
  esMajor: ImageIndex:=2;
  esCritical: ImageIndex:=3;
  else
    ImageIndex:=-1;
  end;
  Caption:=FormatDateTime('YY/MM/DD HH:NN:SS',TimeStamp);
  SubItems.Add(TEventSeverityStrings[Severity]);
  SubItems.Add(Source);
  SubItems.Add(EventMessage);
  SubItems.Add(EventInfo);
  //.
  ptrItem:=Next;
  end;
finally
Items.EndUpdate;
end;
end;
finally
EventLog.ClearItems(LogItems);
end;
end;

procedure TfmEventLog.wmUPDATEEVENTS(var Message: TMessage);
begin
Update();
end;

procedure TfmEventLog.Clearallevents1Click(Sender: TObject);
begin
EventLog.Clear();
end;


procedure Initialize(const pLogFileName: string);
begin
FreeAndNil(EventLog);
EventLog:=TEventLog.Create(pLogFileName);
end;

procedure Finalize;
begin
FreeAndNil(EventLog);
end;

procedure TfmEventLog.Setmonitor1Click(Sender: TObject);
var
  MonitorAddress: string;
  ServerName: string;
  QoS_SendInterval: integer;
  R: boolean;
begin
with TfmEventLogMonitor.Create() do
try
if (EventLog.Monitor <> nil)
 then begin
  MonitorAddress:=EventLog.Monitor.MonitorAddress;
  ServerName:=EventLog.Monitor.ServerName;
  QoS_SendInterval:=EventLog.Monitor.QoS_SendInterval;
  end
 else begin
  MonitorAddress:='';
  ServerName:='';
  QoS_SendInterval:=5000;
  end;
if (Edit(MonitorAddress,ServerName,QoS_SendInterval))
 then begin
  FreeAndNil(EventLog.Monitor);
  EventLog.Monitor:=TEventLogMonitor.Create(EventLog,MonitorAddress,ServerName,QoS_SendInterval);
  end;
finally
Destroy;
end;
end;

procedure TfmEventLog.Deletemonitor1Click(Sender: TObject);
begin
FreeAndNil(EventLog.Monitor);
ShowMessage('Server-monitor has been removed');
end;


Initialization
EventLog:=nil;

Finalization
FreeAndNil(EventLog);

end.
