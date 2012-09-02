unit unitSpaceNotificationSubscription;

interface

uses
  Windows,
  Messages,
  SysUtils,
  SyncObjs,
  Variants,
  Classes,
  Sockets,
  IdException,
  IdSocks,
  IdStack,
  Graphics,
  Controls,                                                                        
  Forms,
  Dialogs,
  GlobalSpaceDefines,
  unitProxySpace,
  unitReflector,
  ComCtrls,
  ExtCtrls,
  Menus,
  StdCtrls,
  ImgList;

const
  SubscriptionFileName = 'NotificationSubScription.cfg';
//. -----------------------------------------------------------
//. do not change, transferred from unitSpaceNotificationServer
Const
  cmdDisconnect = -1;
  resOk = 0;
type
  TSubscriptionComponent = packed record
    idTComponent: smallint;
    idComponent: Int64;
  end;

  TSubscriptionWindow = packed record
    Xmin: double;
    Ymin: double;
    Xmax: double;
    Ymax: double;
  end;

  TComponentNotification = packed record
    idTComponent: smallint;
    idComponent: Int64;
    Operation: TComponentOperation;
  end;

  TComponentPartialUpdateNotification = packed record
    idTComponent: smallint;
    idComponent: Int64;
    Data: TByteArray;
  end;

  TVisualizationNotification = packed record
    ptrObj: TPtr;
    Act: TRevisionAct;
  end;

//. -----------------------------------------------------------

  TNameOfComponentSavedItem = string[99];

  TNameOfWindowSavedItem = string[99];

  TComponentSavedItem = packed record
    CID: TSubscriptionComponent;
    Name: TNameOfComponentSavedItem;
    Enabled: boolean;
  end;

  TSubscriptionWindowCoords = packed record
    X0: double;
    Y0: double;
    X1: double;
    Y1: double;
    X2: double;
    Y2: double;
    X3: double;
    Y3: double;
  end;

  TWindowSavedItem = packed record
    WND: TSubscriptionWindowCoords;
    Name: TNameOfWindowSavedItem;
    Enabled: boolean;
  end;


Type
  TSpaceNotificationSubscription_DoOnUpdatesReceived = procedure (const ComponentNotifications: pointer; const ComponentNotificationsCount: integer; const ComponentPartialUpdateNotifications: pointer; const ComponentPartialUpdateNotificationsCount: integer; const VisualizationNotifications: pointer; const VisualizationNotificationsCount: integer) of object;

  TSpaceNotificationSubscription = class(TThread)
  private
    Lock: TCriticalSection;
    Space: TProxySpace;
    flChanged: boolean;
    flAlwaysUseProxy: boolean;
    FOnUpdatesReceived: TSpaceNotificationSubscription_DoOnUpdatesReceived;
    ControlPanel: TForm;

    procedure GetSubscriptionComponents(out oComponents: pointer; out oComponentsSize: integer);
    procedure GetSubscriptionWindows(out oWindows: pointer; out oWindowsSize: integer);
  public
    ServerHost: string;
    ServerPort: string;
    ProxyServerHost: string;
    ProxyServerPort: integer;
    ProxyServerUserName: string;
    ProxyServerUserPassword: string;
    flActive: boolean;
    flReinitialize: boolean;
    flFinalize: boolean;
    Components: pointer;
    ComponentsSize: integer;
    Windows: pointer;
    WindowsSize: integer;
    StatusStr: string;

    Constructor Create(const pSpace: TProxySpace);
    Destructor Destroy; override;
    procedure Start();
    function IsValid: boolean;
    function IsComponentExist(const pidTComponent: integer; const pidComponent: integer): boolean;
    function IsWindowExist(const pWindow: TSubscriptionWindowCoords): boolean;
    function AddComponent(const pidTComponent: integer; const pidComponent: integer): boolean;
    procedure RemoveComponent(const pidTComponent: integer; const pidComponent: integer);
    function AddWindow(const pX0,pY0,pX1,pY1,pX2,pY2,pX3,pY3: double; const pName: TNameOfWindowSavedItem): boolean;
    procedure RemoveWindow(const pName: TNameOfWindowSavedItem);
    procedure Execute; override;
    procedure LoadFromStream(const Stream: TStream);
    procedure SaveToStream(const Stream: TStream);
    procedure Load;
    procedure Save;
    function GetControlPanel: TForm;
    property OnUpdatesReceived: TSpaceNotificationSubscription_DoOnUpdatesReceived write FOnUpdatesReceived;
  end;

Const
  WM_UPDATEITEMS = WM_USER+1;
Type
  TfmSpaceNotificationSubscription = class(TForm)
    Panel1: TPanel;
    lvComponents: TListView;
    lvCompoennts_Popup: TPopupMenu;
    Addcomponentfromclipboard1: TMenuItem;
    Removeselected1: TMenuItem;
    StatusUpdater: TTimer;
    cbStatus: TCheckBox;
    lbParams: TLabel;
    Clear1: TMenuItem;
    DisableAll1: TMenuItem;
    EnableAll1: TMenuItem;
    N1: TMenuItem;
    Validatechanges1: TMenuItem;
    Splitter1: TSplitter;
    lvWindows: TListView;
    lvWindows_Popup: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    lvWindows_ImageList: TImageList;
    procedure Addcomponentfromclipboard1Click(Sender: TObject);
    procedure Removeselected1Click(Sender: TObject);
    procedure StatusUpdaterTimer(Sender: TObject);
    procedure cbStatusClick(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure lvComponentsDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DisableAll1Click(Sender: TObject);
    procedure EnableAll1Click(Sender: TObject);
    procedure Validatechanges1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure lvWindowsDblClick(Sender: TObject);
  private
    { Private declarations }
    NotificationSubscription: TSpaceNotificationSubscription;
    ImageList: TImageList;
    flChanged: boolean;
    flStatusUpdating: boolean;

    procedure Clear;
    procedure CheckAndValidateChanges;
    procedure Save;
    procedure ClearComponents;
    procedure ClearWindows;
    procedure wmUpdateItems(var Message: TMessage); message WM_UPDATEITEMS;
  public
    { Public declarations }
    Constructor Create(const pNotificationSubscription: TSpaceNotificationSubscription);
    Destructor Destroy; override;
    procedure Update; reintroduce;
    procedure InsertNewComponent(const pidTComponent,pidComponent: integer);
    procedure lvComponents_RemoveComponent(ComponentItem: TListItem);
    procedure lvComponents_RemoveAll;
    procedure lvComponents_EnableAll;
    procedure lvComponents_DisableAll;
    procedure InsertNewWindow(const pWindow: TSubscriptionWindowCoords);
    procedure lvWindows_RemoveWindow(WindowItem: TListItem);
    procedure lvWindows_RemoveAll;
    procedure lvWindows_EnableAll;
    procedure lvWindows_DisableAll;
  end;

implementation
Uses
  unitEventLog,
  INIFiles,
  WinInet,
  Cipher,
  Hash,
  Functionality,
  TypesFunctionality;

{$R *.dfm}

function ConvertWindowCoordToMinMax(const pCoord: TSubscriptionWindowCoords): TSubscriptionWindow;
begin
with pCoord,Result do begin
Xmin:=X0;Ymin:=Y0;Xmax:=X0;Ymax:=Y0;
if X1 < Xmin
 then Xmin:=X1
 else
  if X1 > Xmax
   then Xmax:=X1;
if Y1 < Ymin
 then Ymin:=Y1
 else
  if Y1 > Ymax
   then Ymax:=Y1;
if X2 < Xmin
 then Xmin:=X2
 else
  if X2 > Xmax
   then Xmax:=X2;
if Y2 < Ymin
 then Ymin:=Y2
 else
  if Y2 > Ymax
   then Ymax:=Y2;
if X3 < Xmin
 then Xmin:=X3
 else
  if X3 > Xmax
   then Xmax:=X3;
if Y3 < Ymin
 then Ymin:=Y3
 else
  if Y3 > Ymax
   then Ymax:=Y3;
end;
end;

function GetProxyInfo: string;
var
  ProxyInfo: PInternetProxyInfo;
  Len: DWord;
begin
  Result:= '';
  Len:= 4096;
  GetMem(ProxyInfo, Len);
  try
    if InternetQueryOption(nil, INTERNET_OPTION_PROXY, Pointer(ProxyInfo), Len) then
      if ProxyInfo^.dwAccessType = INTERNET_OPEN_TYPE_PROXY then
      begin
        Result:= ProxyInfo^.lpszProxy
      end;
  finally
    FreeMem(ProxyInfo);
  end;
end;

procedure GetProxyServer(protocol: string; var ProxyServer: string; var ProxyPort: Integer);
var
  i: Integer;
  proxyinfo: string;
begin
  ProxyServer:= '';
  ProxyPort:= 0;

  proxyinfo:= GetProxyInfo;
  if proxyinfo = '' then
    Exit; // no proxy

  if Pos('=', proxyinfo) > 0 then // not one proxy for all protocols
  begin
    protocol:= protocol + '=';
    i:= Pos(protocol, proxyinfo);
    if i > 0 then
    begin
      Delete(proxyinfo, 1, i + Length(protocol) - 1);
      i:= Pos(';', proxyinfo);
      if i > 0 then proxyinfo:= Copy(proxyinfo, 1, i - 1);
      i:= Pos(' ', proxyinfo);
      if i > 0 then proxyinfo:= Copy(proxyinfo, 1, i - 1);
    end else
      Exit; // no proxy for our protocol
  end;
  i:= Pos(':', proxyinfo);
  if i > 0 then
  begin
    ProxyPort:= StrToIntDef(Copy(proxyinfo, i + 1, Length(proxyinfo) - i), 0);
    ProxyServer:= Copy(proxyinfo, 1, i - 1)
  end;
end;



{TSpaceNotificationSubscription}
Constructor TSpaceNotificationSubscription.Create(const pSpace: TProxySpace);
var
  PSH: string;
  PSP: integer;
begin
Lock:=TCriticalSection.Create;
Space:=pSpace;
flChanged:=false;
//. load settings
with TProxySpaceUserProfile.Create(Space) do
try
SetProfileFile('UserProxySpace.cfg');
with TINIFile.Create(ProfileFile) do
try
ServerHost:=ReadString('SpaceNotificationServer','HostAddress','');
ServerPort:=ReadString('SpaceNotificationServer','Port','');
PSH:=ReadString('SpaceNotificationServer','Proxy_Host','');
PSP:=ReadInteger('SpaceNotificationServer','Proxy_Port',0);
ProxyServerUserName:=ReadString('SpaceNotificationServer','Proxy_UserName','Anonymous');
ProxyServerUserPassword:=ReadString('SpaceNotificationServer','Proxy_UserPassword','');
flAlwaysUseProxy:=(ReadInteger('SpaceNotificationServer','Proxy_AlwaysUseProxy',0) = 1);
finally
Destroy;
end;
finally
Destroy;
end;
GetProxyServer('socks',ProxyServerHost,ProxyServerPort);
if ((PSH <> '') AND (PSP <> 0))
 then begin
  ProxyServerHost:=PSH;
  ProxyServerPort:=PSP;
  end;
//.
FOnUpdatesReceived:=nil;
flActive:=false;
flReinitialize:=true;
flFinalize:=false;
Components:=nil;
StatusStr:='unknown';
//.
ControlPanel:=nil;
//.
Load();
//.
Inherited Create(true);
Priority:=tpHigher;
end;

Destructor TSpaceNotificationSubscription.Destroy;
var
  EC: dword;
begin
if (Space.State <> psstDestroying)
 then Inherited
 else begin
  GetExitCodeThread(Handle,EC);
  TerminateThread(Handle,EC);
  end;
//.
if (flChanged)
 then Save();
//.
Lock.Enter;
try
if (Components <> nil) then FreeMem(Components,ComponentsSize);
if (Windows <> nil) then FreeMem(Windows,WindowsSize);
finally
Lock.Leave;
end;
//.
ControlPanel.Free;
//.
Lock.Free;
end;

procedure TSpaceNotificationSubscription.Start();
begin
Resume();
end;

procedure TSpaceNotificationSubscription.GetSubscriptionComponents(out oComponents: pointer; out oComponentsSize: integer);
var
  CC: integer;
  I: integer;
  DI: integer;
begin
oComponents:=nil;
oComponentsSize:=0;
Lock.Enter;
try
if (Components <> nil)
 then begin
  CC:=0; for I:=0 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do if (TComponentSavedItem(Pointer(Integer(Components)+I*SizeOf(TComponentSavedItem))^).Enabled) then Inc(CC);
  //.
  oComponentsSize:=SizeOf(TSubscriptionComponent)*CC;
  Getmem(oComponents,oComponentsSize);
  //.
  DI:=0;
  for I:=0 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do if (TComponentSavedItem(Pointer(Integer(Components)+I*SizeOf(TComponentSavedItem))^).Enabled) then begin
    TSubscriptionComponent(Pointer(Integer(oComponents)+DI*SizeOf(TSubscriptionComponent))^):=TComponentSavedItem(Pointer(Integer(Components)+I*SizeOf(TComponentSavedItem))^).CID;
    Inc(DI);
    end;
  end;
finally
Lock.Leave;
end;
end;

procedure TSpaceNotificationSubscription.GetSubscriptionWindows(out oWindows: pointer; out oWindowsSize: integer);
var
  WC: integer;
  I: integer;
  DI: integer;
begin
oWindows:=nil;
oWindowsSize:=0;
Lock.Enter;
try
if (Windows <> nil)
 then begin
  WC:=0; for I:=0 to (WindowsSize DIV SizeOf(TWindowSavedItem))-1 do if (TWindowSavedItem(Pointer(Integer(Windows)+I*SizeOf(TWindowSavedItem))^).Enabled) then Inc(WC);
  //.
  oWindowsSize:=SizeOf(TSubscriptionWindow)*WC;
  Getmem(oWindows,oWindowsSize);
  //.
  DI:=0;
  for I:=0 to (WindowsSize DIV SizeOf(TWindowSavedItem))-1 do if (TWindowSavedItem(Pointer(Integer(Windows)+I*SizeOf(TWindowSavedItem))^).Enabled) then begin
    TSubscriptionWindow(Pointer(Integer(oWindows)+DI*SizeOf(TSubscriptionWindow))^):=ConvertWindowCoordToMinMax(TWindowSavedItem(Pointer(Integer(Windows)+I*SizeOf(TWindowSavedItem))^).WND);
    Inc(DI);
    end;
  end;
finally
Lock.Leave;
end;
end;

function TSpaceNotificationSubscription.IsValid: boolean;
var
  I: integer;
begin
Lock.Enter;
try
Result:=((NOT Space.flOffline) AND (ServerHost <> '') AND (ServerPort <> '') AND ((Components <> nil) OR (Windows <> nil)));
if (NOT Result) then Exit; //. ->
for I:=0 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do with TComponentSavedItem(Pointer(Integer(Components)+I*SizeOf(TComponentSavedItem))^) do
  if (Enabled)
   then begin
    Result:=true;
    Exit; //. ->
    end;
for I:=0 to (WindowsSize DIV SizeOf(TWindowSavedItem))-1 do with TWindowSavedItem(Pointer(Integer(Windows)+I*SizeOf(TWindowSavedItem))^) do
  if (Enabled)
   then begin
    Result:=true;
    Exit; //. ->
    end;
Result:=false;
finally
Lock.Leave;
end;
end;

function TSpaceNotificationSubscription.IsWindowExist(const pWindow: TSubscriptionWindowCoords): boolean;
var
  ptrItem: pointer;
  I: integer;
begin
Result:=false;
Lock.Enter;
try
if (Windows <> nil)
 then begin
  ptrItem:=Windows;
  for I:=0 to (WindowsSize DIV SizeOf(TWindowSavedItem))-1 do with TWindowSavedItem(ptrItem^).WND do begin
    if (TWindowSavedItem(ptrItem^).Enabled AND ((X0 = pWindow.X0) AND (Y0 = pWindow.Y0) AND (X1 = pWindow.X1) AND (Y1 = pWindow.Y1) AND (X2 = pWindow.X2) AND (Y2 = pWindow.Y2) AND (X3 = pWindow.X3) AND (Y3 = pWindow.Y3)))
     then begin
      Result:=true;
      Exit; //. ->
      end;
    //. next Window
    Inc(Integer(ptrItem),SizeOf(TWindowSavedItem));
    end;
  end;
finally
Lock.Leave;
end;
end;

function TSpaceNotificationSubscription.IsComponentExist(const pidTComponent: integer; const pidComponent: integer): boolean;
var
  ptrItem: pointer;
  I: integer;
begin
Result:=false;
Lock.Enter;
try
if (Components <> nil)
 then begin
  ptrItem:=Components;
  for I:=0 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do with TComponentSavedItem(ptrItem^).CID do begin
    if (TComponentSavedItem(ptrItem^).Enabled AND ((idTComponent = pidTComponent) AND (idComponent = pidComponent)))
     then begin
      Result:=true;
      Exit; //. ->
      end;
    //. next component
    Inc(Integer(ptrItem),SizeOf(TComponentSavedItem));
    end;
  end;
finally
Lock.Leave;
end;
end;

function TSpaceNotificationSubscription.AddComponent(const pidTComponent: integer; const pidComponent: integer): boolean;
var
  idTOwner,idOwner: integer;
  _Name: TNameOfComponentSavedItem;
  I: integer;
  flFound: boolean;
  ptrItem: pointer;
  OldComponentsSize: integer;
  ptrNewItem: pointer;
begin
Result:=false;
//. get component name
with TComponentFunctionality_Create(pidTComponent,pidComponent) do
try
if (GetOwner(idTOwner,idOwner))
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  _Name:=Name;
  finally
  Release;
  end
 else _Name:=Name;
finally
Release;
end;
//.
Lock.Enter;
try
flFound:=false;
if (Components <> nil)
 then begin
  ptrItem:=Components;
  for I:=0 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do with TComponentSavedItem(ptrItem^).CID do begin
    if ((idTComponent = pidTComponent) AND (idComponent = pidComponent))
     then begin
      TComponentSavedItem(ptrItem^).Enabled:=true;
      flFound:=true;
      Break; //. >
      end;
    //. next component
    Inc(Integer(ptrItem),SizeOf(TComponentSavedItem));
    end;
  end;
if (NOT flFound)
 then begin
  OldComponentsSize:=ComponentsSize;
  Inc(ComponentsSize,SizeOf(TComponentSavedItem));
  ReAllocMem(Components,ComponentsSize);
  ptrNewItem:=Pointer(Integer(Components)+OldComponentsSize);
  with TComponentSavedItem(ptrNewItem^) do begin
  CID.idTComponent:=pidTComponent;
  CID.idComponent:=pidComponent;
  Name:=_Name;
  if (Name = '') then Name:='('+IntToStr(CID.idTComponent)+';'+IntToStr(CID.idComponent)+')';
  Enabled:=true;
  end;
  end;
flChanged:=true;
finally
Lock.Leave;
end;
//.
//. not needed Save();
//.
flReinitialize:=true;
//. update Control panel if exists
if (ControlPanel <> nil) then PostMessage(ControlPanel.Handle, WM_UPDATEITEMS, 0,0);
end;

procedure TSpaceNotificationSubscription.RemoveComponent(const pidTComponent: integer; const pidComponent: integer);
var
  ptrItem: pointer;
  I,J: integer;
begin
Lock.Enter;
try
if (Components <> nil)
 then begin
  ptrItem:=Components;
  for I:=0 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do with TComponentSavedItem(ptrItem^).CID do begin
    if ((idTComponent = pidTComponent) AND (idComponent = pidComponent))
     then begin
      for J:=I+1 to (ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do TComponentSavedItem(Pointer(Integer(Components)+(J-1)*SizeOf(TComponentSavedItem))^):=TComponentSavedItem(Pointer(Integer(Components)+J*SizeOf(TComponentSavedItem))^);
      Dec(ComponentsSize,SizeOf(TComponentSavedItem));
      ReAllocMem(Components,ComponentsSize);
      Break; //. >
      end;
    //. next component
    Inc(Integer(ptrItem),SizeOf(TComponentSavedItem));
    end;
  end;
flChanged:=true;
finally
Lock.Leave;
end;
//.
//. not needed Save();
//.
flReinitialize:=true;
//. update Control panel if exists
if (ControlPanel <> nil) then PostMessage(ControlPanel.Handle, WM_UPDATEITEMS, 0,0);
end;

function TSpaceNotificationSubscription.AddWindow(const pX0,pY0,pX1,pY1,pX2,pY2,pX3,pY3: double; const pName: TNameOfWindowSavedItem): boolean;
var
  idTOwner,idOwner: integer;
  I: integer;
  flFound: boolean;
  ptrItem: pointer;
  OldWindowsSize: integer;
  ptrNewItem: pointer;
begin
Result:=false;
Lock.Enter;
try
flFound:=false;
if (Windows <> nil)
 then begin
  ptrItem:=Windows;
  for I:=0 to (WindowsSize DIV SizeOf(TWindowSavedItem))-1 do with TWindowSavedItem(ptrItem^).WND do begin
    if (
         (X0 = pX0) AND (Y0 = pY0) AND
         (X1 = pX1) AND (Y1 = pY1) AND
         (X2 = pX2) AND (Y2 = pY2) AND
         (X3 = pX3) AND (Y3 = pY3) 
       )
     then begin
      TWindowSavedItem(ptrItem^).Enabled:=true;
      flFound:=true;
      Break; //. >
      end;
    //. next window
    Inc(Integer(ptrItem),SizeOf(TWindowSavedItem));
    end;
  end;
if (NOT flFound)
 then begin
  OldWindowsSize:=WindowsSize;
  Inc(WindowsSize,SizeOf(TWindowSavedItem));
  ReAllocMem(Windows,WindowsSize);
  ptrNewItem:=Pointer(Integer(Windows)+OldWindowsSize);
  with TWindowSavedItem(ptrNewItem^) do begin
  WND.X0:=pX0; WND.Y0:=pY0;
  WND.X1:=pX1; WND.Y1:=pY1;
  WND.X2:=pX2; WND.Y2:=pY2;
  WND.X3:=pX3; WND.Y3:=pY3;
  Name:=pName;
  Enabled:=true;
  end;
  end;
flChanged:=true;
finally
Lock.Leave;
end;
//.
//. not needed Save();
//. update Control panel if exists
if (ControlPanel <> nil) then PostMessage(ControlPanel.Handle, WM_UPDATEITEMS, 0,0);
end;

procedure TSpaceNotificationSubscription.RemoveWindow(const pName: TNameOfWindowSavedItem);
var
  ptrItem: pointer;
  I,J: integer;
begin
Lock.Enter;
try
if (Windows <> nil)
 then begin
  ptrItem:=Windows;
  for I:=0 to (WindowsSize DIV SizeOf(TWindowSavedItem))-1 do with TWindowSavedItem(ptrItem^) do begin
    if (Name = pName)
     then begin
      for J:=I+1 to (WindowsSize DIV SizeOf(TWindowSavedItem))-1 do TWindowSavedItem(Pointer(Integer(Windows)+(J-1)*SizeOf(TWindowSavedItem))^):=TWindowSavedItem(Pointer(Integer(Windows)+J*SizeOf(TWindowSavedItem))^);
      Dec(WindowsSize,SizeOf(TWindowSavedItem));
      ReAllocMem(Windows,WindowsSize);
      Break; //. >
      end;
    //. next window
    Inc(Integer(ptrItem),SizeOf(TWindowSavedItem));
    end;
  end;
flChanged:=true;
finally
Lock.Leave;
end;
//.
//. not needed Save();
//. update Control panel if exists
if (ControlPanel <> nil) then PostMessage(ControlPanel.Handle, WM_UPDATEITEMS, 0,0);
end;

procedure TSpaceNotificationSubscription.Execute;
var
  ServerSocket: TTcpClient;

  procedure Deactivate;
  var
    Command: integer;
    ActualSize: integer;
  begin
  if (ServerSocket.Connected)
   then begin
    try
    Command:=cmdDisconnect;
    ActualSize:=ServerSocket.SendBuf(Command,SizeOf(Command));
    if (ActualSize <> SizeOf(Command)) then Raise Exception.Create('could not send command'); //. =>
    except
      end;
    //.
    EventLog.WriteInfoEvent('SpaceNotificationSubscription','Disconnected from the Notification Server.','Server address: '+ServerSocket.RemoteHost+', Port: '+ServerSocket.RemotePort+'.');
    end;
  ServerSocket.Close();
  //.
  Lock.Enter;
  try
  StatusStr:='Offline';
  finally
  Lock.Leave;
  end;
  flActive:=false;
  end;

  procedure Activate;
  const
    { Socks messages }
    RSSocksRequestFailed = 'Request rejected or failed.';
    RSSocksRequestServerFailed = 'Request rejected because SOCKS server cannot connect.';
    RSSocksRequestIdentFailed = 'Request rejected because the client program and identd report different user-ids.';
    RSSocksUnknownError = 'Unknown socks error.';
    RSSocksServerRespondError = 'Socks server did not respond.';
    RSSocksAuthMethodError = 'Invalid socks authentication method.';
    RSSocksAuthError = 'Authentication error to socks server.';
    RSSocksServerGeneralError = 'General SOCKS server failure.';
    RSSocksServerPermissionError = 'Connection not allowed by ruleset.';
    RSSocksServerNetUnreachableError = 'Network unreachable.';
    RSSocksServerHostUnreachableError = 'Host unreachable.';
    RSSocksServerConnectionRefusedError = 'Connection refused.';
    RSSocksServerTTLExpiredError = 'TTL expired.';
    RSSocksServerCommandError = 'Command not supported.';
    RSSocksServerAddressError = 'Address type not supported.';

    function MakeSOCKSv4Connection(): boolean;
    var
      AHost: string;
      APort: integer;
      UserName,Password: string;
      i: Integer;
      LRequest: TIdSocksRequest;
      LResponse: TIdSocksResponse;
    begin
      Result:=false;
      try
      if ((ProxyServerHost = '') OR (ProxyServerPort = 0)) then Exit; //. ->
      ServerSocket.RemoteHost:=ProxyServerHost;
      ServerSocket.RemotePort:=IntToStr(ProxyServerPort);
      ServerSocket.Active:=false;
      ServerSocket.Active:=true;
      AHost:=ServerHost;
      APort:=StrToInt(ServerPort);
      //.
      if (GStack = nil) then GStack:=TIdStack.CreateStack();
      LRequest.Version := 4;
      LRequest.OpCode  := 1;
      LRequest.Port := GStack.WSHToNs(APort);
      LRequest.IpAddr := GStack.StringToTInAddr(GStack.ResolveHost(AHost));
      LRequest.UserName := Username;
      i := Length(LRequest.UserName); // calc the len of username
      LRequest.UserName[i + 1] := #0;
      i := 8 + i + 1; // calc the len of request
      LResponse.OpCode:=93;
      ServerSocket.SendBuf(LRequest, i);
      ServerSocket.ReceiveBuf(LResponse, Sizeof(LResponse));
      case LResponse.OpCode of
        90: ;// request granted, do nothing
        91: Raise Exception.Create(RSSocksRequestFailed); //. =>
        92: Raise Exception.Create(RSSocksRequestServerFailed); //. =>
        93: Raise Exception.Create(RSSocksRequestIdentFailed); //. =>
        else Raise Exception.Create(RSSocksUnknownError); //. =>
      end;
      Result:=true;
      except
        end;
    end;

    function MakeSOCKSv5Connection(const flUserAuthentication: boolean): boolean;
    var
      AHost: string;
      APort: Integer;
      Authentication: TSocksAuthentication;
      UserName,Password: string;

      len, pos, sz: Integer;
      tempBuffer: array [0..255] of Byte;
      ReqestedAuthMethod,
      ServerAuthMethod: Byte;
      tempPort: Word;
    begin
      Result:=false;
      try
      if ((ProxyServerHost = '') OR (ProxyServerPort = 0)) then Exit; //. ->
      ServerSocket.RemoteHost:=ProxyServerHost;
      ServerSocket.RemotePort:=IntToStr(ProxyServerPort);
      ServerSocket.Active:=false;
      ServerSocket.Active:=true;
      AHost:=ServerHost;
      APort:=StrToInt(ServerPort);
      if (flUserAuthentication)
       then begin
        Authentication:=saUsernamePassword;
        UserName:=ProxyServerUserName;
        Password:=ProxyServerUserPassword;
        end
       else Authentication:=saNoAuthentication;
      //.
      if (GStack = nil) then GStack:=TIdStack.CreateStack();
      // defined in rfc 1928
      if Authentication = saNoAuthentication then begin
        tempBuffer[2] := $0   // No authentication
      end else begin
        tempBuffer[2] := $2;  // Username password authentication
      end;
      //.
      ReqestedAuthMethod := tempBuffer[2];
      tempBuffer[0] := $5;     // socks version
      tempBuffer[1] := $1;     // number of possible authentication methods
      //.
      len := 2 + tempBuffer[1];
      ServerSocket.SendBuf(tempBuffer, len);
      try
        sz:=ServerSocket.ReceiveBuf(tempBuffer, 2); // Socks server sends the selected authentication method
        if (sz <> 2) then Raise Exception.Create('');
      except
        On E: Exception do begin
          raise EIdSocksServerRespondError.Create(RSSocksServerRespondError);
        end;
      end;
      //.
      ServerAuthMethod := tempBuffer[1];
      if (ServerAuthMethod <> ReqestedAuthMethod) or (ServerAuthMethod = $FF) then begin
        raise EIdSocksAuthMethodError.Create(RSSocksAuthMethodError);
      end;
      // Authentication process
      if Authentication = saUsernamePassword then begin
        tempBuffer[0] := 1; // version of subnegotiation
        tempBuffer[1] := Length(Username);
        pos := 2;
        if Length(Username) > 0 then begin
          Move(Username[1], tempBuffer[pos], Length(Username));
        end;
        pos := pos + Length(Username);
        tempBuffer[pos] := Length(Password);
        pos := pos + 1;
        if Length(Password) > 0 then begin
          Move(Password[1], tempBuffer[pos], Length(Password));
        end;
        pos := pos + Length(Password);

        ServerSocket.SendBuf(tempBuffer, pos); // send the username and password
        try
          sz:=ServerSocket.ReceiveBuf(tempBuffer, 2);    // Socks server sends the authentication status
          if (sz <> 2) then Raise Exception.Create('');
        except
          On E: Exception do begin
            raise EIdSocksServerRespondError.Create(RSSocksServerRespondError);
          end;
        end;
        if tempBuffer[1] <> $0 then begin
          raise EIdSocksAuthError.Create(RSSocksAuthError);
        end;
      end;
      // Connection process
      tempBuffer[0] := $5;   // socks version
      tempBuffer[1] := $1;   // connect method
      tempBuffer[2] := $0;   // reserved
      // for now we stick with domain name, must ask Chad how to detect
      // address type
      tempBuffer[3] := $3;   // address type: IP V4 address: X'01'    {Do not Localize}
                             //               DOMAINNAME:    X'03'    {Do not Localize}
                             //               IP V6 address: X'04'    {Do not Localize}
      // host name
      tempBuffer[4] := Length(AHost);
      pos := 5;
      if Length(AHost) > 0 then begin
        Move(AHost[1], tempBuffer[pos], Length(AHost));
      end;
      pos := pos + Length(AHost);
      // port
      tempPort := GStack.WSHToNs(APort);
      Move(tempPort, tempBuffer[pos], SizeOf(tempPort));
      pos := pos + 2;
      ServerSocket.SendBuf(tempBuffer, pos); // send the connection packet
      try
        sz:=ServerSocket.ReceiveBuf(tempBuffer, 5);    // Socks server replies on connect, this is the first part
        if (sz <> 5) then Raise Exception.Create('');
      except
        raise EIdSocksServerRespondError.Create(RSSocksServerRespondError);
      end;
      //.
      case tempBuffer[1] of
        0: ;// success, do nothing
        1: raise EIdSocksServerGeneralError.Create(RSSocksServerGeneralError);
        2: raise EIdSocksServerPermissionError.Create(RSSocksServerPermissionError);
        3: raise EIdSocksServerNetUnreachableError.Create(RSSocksServerNetUnreachableError);
        4: raise EIdSocksServerHostUnreachableError.Create(RSSocksServerHostUnreachableError);
        5: raise EIdSocksServerConnectionRefusedError.Create(RSSocksServerConnectionRefusedError);
        6: raise EIdSocksServerTTLExpiredError.Create(RSSocksServerTTLExpiredError);
        7: raise EIdSocksServerCommandError.Create(RSSocksServerCommandError);
        8: raise EIdSocksServerAddressError.Create(RSSocksServerAddressError);
        else
           raise EIdSocksUnknownError.Create(RSSocksUnknownError);
      end;
      // type of destination address is domain name
      case tempBuffer[3] of
        // IP V4
        1: len := 4 + 2; // 4 is for address and 2 is for port length
        // FQDN
        3: len := tempBuffer[4] + 2; // 2 is for port length
        // IP V6
        4: len := 16 + 2; // 16 is for address and 2 is for port length
      end;
      //.
      try
        // Socks server replies on connect, this is the second part
        sz:=ServerSocket.ReceiveBuf(tempBuffer[5], len-1);
        if (sz <> (len-1)) then Raise Exception.Create('');
      except
        raise EIdSocksServerRespondError.Create(RSSocksServerRespondError);
      end;
      Result:=true;
      except
        end;
    end;

    procedure EncodeStream(const Key: string; const Stream: TMemoryStream);
    begin
    with TCipher_RC5.Create do
    try
    Mode:=cmCTS;
    InitKey(Key, nil);
    EncodeBuffer(Stream.Memory^,Stream.Memory^,Stream.Size);
    finally
    Destroy;
    end;
    end;

  var
    ConnectionMethod: string;
    Size,ActualSize: integer;
    PasswordStream: TMemoryStream;
    Subscription: pointer;
    SubscriptionSize: integer;
    SubscriptionResult: integer; 
  begin
  Deactivate();
  //.
  try
  try
  if ((ServerSocket.RemoteHost = '') OR (ServerSocket.RemotePort = '')) then Raise Exception.Create('notification server is not specified'); //. =>
  //.
  if (NOT flAlwaysUseProxy AND ServerSocket.Connect())
   then ConnectionMethod:='direct connection'
   else
    if (MakeSOCKSv4Connection())
     then ConnectionMethod:='Proxy ('+ProxyServerHost+':'+IntToStr(ProxyServerPort)+', SOCKS v4)'
     else
      if (MakeSOCKSv5Connection(false))
       then ConnectionMethod:='Proxy ('+ProxyServerHost+':'+IntToStr(ProxyServerPort)+', SOCKS v5: authentication - off)'
       else
        if (MakeSOCKSv5Connection(true))
         then ConnectionMethod:='Proxy ('+ProxyServerHost+':'+IntToStr(ProxyServerPort)+', SOCKS v5: authentication - on, user - '+ProxyServerUserName+')'
         else Raise Exception.Create('could not connect to the space-notification-server'); //. =>
  //. send usename and userpassword encrypted
  Size:=Length(Space.UserName)*SizeOf(WideChar);
  ActualSize:=ServerSocket.SendBuf(Size,SizeOf(Size));
  if (ActualSize <> SizeOf(Size)) then Raise Exception.Create('could not send subscription username length'); //. =>
  ActualSize:=ServerSocket.SendBuf(Space.UserName[1],Size);
  if (ActualSize <> Size) then Raise Exception.Create('could not send subscription username'); //. =>
  //.
  PasswordStream:=TMemoryStream.Create;
  try
  Size:=Length(Space.UserPassword)*SizeOf(WideChar);
  PasswordStream.Write(Space.UserPassword[1],Size);
  EncodeStream(Space.UserPasswordHash, PasswordStream);
  Size:=PasswordStream.Size;
  ActualSize:=ServerSocket.SendBuf(Size,SizeOf(Size));
  if (ActualSize <> SizeOf(Size)) then Raise Exception.Create('could not send subscription userpassword size'); //. =>
  if (Size > 0)
   then begin
    ActualSize:=ServerSocket.SendBuf(PasswordStream.Memory^,Size);
    if (ActualSize <> Size) then Raise Exception.Create('could not send subscription userpassword'); //. =>
    end;
  finally
  PasswordStream.Destroy;
  end;
  //. send subscription components
  GetSubscriptionComponents(Subscription,SubscriptionSize);
  try
  ActualSize:=ServerSocket.SendBuf(SubscriptionSize,SizeOf(SubscriptionSize));
  if (ActualSize <> SizeOf(SubscriptionSize)) then Raise Exception.Create('could not send subscription components size'); //. =>
  if (SubscriptionSize > 0)
   then begin
    ActualSize:=ServerSocket.SendBuf(Subscription^,SubscriptionSize);
    if (ActualSize <> SubscriptionSize) then Raise Exception.Create('could not send subscription components'); //. =>
    end;
  finally
  if (Subscription <> nil) then FreeMem(Subscription,SubscriptionSize);
  end;
  //. send subscription windows
  GetSubscriptionWindows(Subscription,SubscriptionSize);
  try
  ActualSize:=ServerSocket.SendBuf(SubscriptionSize,SizeOf(SubscriptionSize));
  if (ActualSize <> SizeOf(SubscriptionSize)) then Raise Exception.Create('could not send subscription windows size'); //. =>
  if (SubscriptionSize > 0)
   then begin
    ActualSize:=ServerSocket.SendBuf(Subscription^,SubscriptionSize);
    if (ActualSize <> SubscriptionSize) then Raise Exception.Create('could not send subscription windows'); //. =>
    end;
  finally
  if (Subscription <> nil) then FreeMem(Subscription,SubscriptionSize);
  end;
  except
    Raise Exception.Create('subscription failed'); //. =>
    end;
  //.
  ActualSize:=ServerSocket.ReceiveBuf(SubscriptionResult,SizeOf(SubscriptionResult));
  if (ActualSize <> SizeOf(SubscriptionResult)) then Raise Exception.Create('subscription rejected by the server'); //. =>
  if (SubscriptionResult <> resOK) then Raise Exception.Create('subscription is not registered'); //. =>
  //.
  Lock.Enter;
  try
  StatusStr:='Online'+'  [ '+ConnectionMethod+' ]';
  finally
  Lock.Leave;
  end;
  //.
  flActive:=true;
  //. update ProxySpace for accumulated changes
  Space.StayUpToDate(false);
  //.
  EventLog.WriteInfoEvent('SpaceNotificationSubscription','Connected to the Notification Server.','Server address: '+ServerSocket.RemoteHost+', Port: '+ServerSocket.RemotePort+', connection method: '+ConnectionMethod);
  except
    On E: Exception do begin
        EventLog.WriteMajorEvent('SpaceNotificationSubscription','Unable to connect to the Notification Server.',E.Message);
        Lock.Enter;
        try
        StatusStr:='Error: '+E.Message;
        finally
        Lock.Leave;
        end;
      end;
    end;
  end;

  procedure WaitForServerUpAndRunning();
  const
    WaitTime = 20; {seconds}
  var
    I,J: integer;
  begin
  for I:=0 to WaitTime-1 do
    for J:=0 to 4 do begin
      Sleep(200);
      if (Terminated) then Exit; //. ->
      end;
  end;

var
  ActualSize,SumActualSize: integer;
  ComponentNotificationsCount: integer;
  ComponentNotifications: pointer;
  ComponentNotificationsSize: integer;
  ComponentPartialUpdateNotificationsSize: integer;
  ComponentPartialUpdateNotificationsCount: integer;
  ComponentPartialUpdateNotifications: pointer;
  VisualizationNotificationsCount: integer;
  VisualizationNotifications: pointer;
  VisualizationNotificationsSize: integer;
  Command: integer;
  I: integer;
begin
ServerSocket:=TTcpClient.Create(nil);
try
with ServerSocket do begin
RemoteHost:=ServerHost;
RemotePort:=ServerPort;
end;
while (NOT Terminated) do begin
  //. Initializing/Finalizing
  if (flFinalize)
   then begin
    Deactivate();
    flFinalize:=false;
    end;
  if (IsValid)
   then begin
    if (flReinitialize)
     then begin
      Activate();
      if (flActive) then flReinitialize:=false;
      end;
    end;
  //. read updates
  if (flActive)
   then begin
    try
    if (ServerSocket.WaitForData(100))
     then
      try
      ActualSize:=ServerSocket.ReceiveBuf(ComponentNotificationsCount,SizeOf(ComponentNotificationsCount));
      if (ActualSize <> SizeOf(ComponentNotificationsCount)) then Raise Exception.Create('error of reading socket'); //. =>
      if (ComponentNotificationsCount > 0)
       then begin
        ComponentNotificationsSize:=ComponentNotificationsCount*SizeOf(TComponentNotification);
        GetMem(ComponentNotifications,ComponentNotificationsSize);
        end
       else ComponentNotifications:=nil;
      try
      if (ComponentNotificationsCount > 0)
       then begin
        SumActualSize:=0;
        repeat
          ActualSize:=ServerSocket.ReceiveBuf(Pointer(Integer(ComponentNotifications)+SumActualSize)^,(ComponentNotificationsSize-SumActualSize));
          if (ActualSize <= 0) then Raise Exception.Create('error of reading socket'); //. =>
          Inc(SumActualSize,ActualSize);
        until (SumActualSize = ComponentNotificationsSize);
        end;
      ActualSize:=ServerSocket.ReceiveBuf(ComponentPartialUpdateNotificationsSize,SizeOf(ComponentPartialUpdateNotificationsSize));
      if (ActualSize <> SizeOf(ComponentPartialUpdateNotificationsSize)) then Raise Exception.Create('error of reading socket'); //. =>
      if (ComponentPartialUpdateNotificationsSize > 0)
       then begin
        ActualSize:=ServerSocket.ReceiveBuf(ComponentPartialUpdateNotificationsCount,SizeOf(ComponentPartialUpdateNotificationsCount));
        if (ActualSize <> SizeOf(ComponentPartialUpdateNotificationsCount)) then Raise Exception.Create('error of reading socket'); //. =>
        Dec(ComponentPartialUpdateNotificationsSize,SizeOf(ComponentPartialUpdateNotificationsCount));
        GetMem(ComponentPartialUpdateNotifications,ComponentPartialUpdateNotificationsSize);
        end
       else begin
        ComponentPartialUpdateNotificationsCount:=0;
        ComponentPartialUpdateNotifications:=nil;
        end;
      try
      if (ComponentPartialUpdateNotificationsSize > 0)
       then begin
        SumActualSize:=0;
        repeat
          ActualSize:=ServerSocket.ReceiveBuf(Pointer(Integer(ComponentPartialUpdateNotifications)+SumActualSize)^,(ComponentPartialUpdateNotificationsSize-SumActualSize));
          if (ActualSize <= 0) then Raise Exception.Create('error of reading socket'); //. =>
          Inc(SumActualSize,ActualSize);
        until (SumActualSize = ComponentPartialUpdateNotificationsSize);
        end;
      ActualSize:=ServerSocket.ReceiveBuf(VisualizationNotificationsCount,SizeOf(VisualizationNotificationsCount));
      if (ActualSize <> SizeOf(VisualizationNotificationsCount)) then Raise Exception.Create('error of reading socket'); //. =>
      if (VisualizationNotificationsCount > 0)
       then begin
        VisualizationNotificationsSize:=VisualizationNotificationsCount*SizeOf(TVisualizationNotification);
        GetMem(VisualizationNotifications,VisualizationNotificationsSize);
        end
       else VisualizationNotifications:=nil;
      try
      if (VisualizationNotificationsCount > 0)
       then begin
        SumActualSize:=0;
        repeat
          ActualSize:=ServerSocket.ReceiveBuf(Pointer(Integer(VisualizationNotifications)+SumActualSize)^,(VisualizationNotificationsSize-SumActualSize));
          if (ActualSize <= 0) then Raise Exception.Create('error of reading socket'); //. =>
          Inc(SumActualSize,ActualSize);
        until (SumActualSize = VisualizationNotificationsSize);
        end;
      //. processing a data received ...
      if ((ComponentNotificationsCount > 0) OR (ComponentPartialUpdateNotificationsCount > 0) OR (VisualizationNotificationsCount > 0))
       then begin
        //. process "Destroy" notifications for the component list
        for I:=0 to ComponentNotificationsCount-1 do with TComponentNotification(Pointer(Integer(ComponentNotifications)+I*SizeOf(TComponentNotification))^) do
          if (TComponentOperation(Operation) = opDestroy)
           then RemoveComponent(Integer(idTComponent),idComponent);
        //. fire the update is received event
        if (Assigned(FOnUpdatesReceived) AND (NOT Space.flAutomaticUpdateIsDisabled)) then FOnUpdatesReceived(ComponentNotifications,ComponentNotificationsCount,ComponentPartialUpdateNotifications,ComponentPartialUpdateNotificationsCount,VisualizationNotifications,VisualizationNotificationsCount);
        end
       else begin
        if ((ComponentNotificationsCount = 0) AND  (ComponentPartialUpdateNotificationsSize = 0))
         then begin
          //. just a server test of existing connection
          end
         else begin //. process "ComponentNotificationsCount" as command from the server
          Command:=ComponentNotificationsCount;
          case (Command) of
          cmdDisconnect: begin //. disconnect command from the server
            flFinalize:=true;
            flReinitialize:=true;
            end;
          end;
          end;
        end;
      finally
      if (VisualizationNotifications <> nil) then FreeMem(VisualizationNotifications,VisualizationNotificationsSize);
      end;
      finally
      if (ComponentPartialUpdateNotifications <> nil) then FreeMem(ComponentPartialUpdateNotifications,ComponentPartialUpdateNotificationsSize);
      end;
      finally
      if (ComponentNotifications <> nil) then FreeMem(ComponentNotifications,ComponentNotificationsSize);
      end;
      except
        on E: Exception do begin
          EventLog.WriteMajorEvent('SpaceNotificationSubscription','Subscription error.',E.Message);
          flActive:=false;
          flReinitialize:=true; //. try to reinitialize
          //.
          Sleep(333);
          end;
        end
     else Sleep(100);
    except
      On E: Exception do begin
        Lock.Enter;
        try
        StatusStr:='Error: '+E.Message;
        finally
        Lock.Leave;
        end;
        flReInitialize:=true; //. try to reinitialize
        //.
        Sleep(333);
        end;
      end;
    end
   else
    if (IsValid and flReinitialize)
     then WaitForServerUpAndRunning()
     else Sleep(333);
  end;
finally
Deactivate();
ServerSocket.Destroy;
end;
end;

procedure TSpaceNotificationSubscription.LoadFromStream(const Stream: TStream);
var
  CC,WC: integer;
begin
Lock.Enter;
try
if (Components <> nil)
 then begin
  FreeMem(Components,ComponentsSize);
  Components:=nil;
  end;
if (Windows <> nil)
 then begin
  FreeMem(Windows,WindowsSize);
  Windows:=nil;
  end;
if (Stream.Size > 0)
 then begin
  Stream.Position:=0;
  Stream.Read(CC,SizeOf(CC));
  if (CC > 0)
   then begin
    ComponentsSize:=CC*SizeOf(TComponentSavedItem);
    GetMem(Components,ComponentsSize);
    Stream.Read(Components^,ComponentsSize);
    end;
  if (Stream.Position < Stream.Size)
   then begin
    Stream.Read(WC,SizeOf(WC));
    if (WC > 0)
     then begin
      WindowsSize:=WC*SizeOf(TWindowSavedItem);
      GetMem(Windows,WindowsSize);
      Stream.Read(Windows^,WindowsSize);
      end;
    end;
  end;
flChanged:=false;
finally
Lock.Leave;
end;
end;

procedure TSpaceNotificationSubscription.SaveToStream(const Stream: TStream);
var
  CC,WC: integer;
begin
Lock.Enter;
try
Stream.Size:=0;
if (Components <> nil)
 then begin
  CC:=(ComponentsSize DIV SizeOf(TComponentSavedItem));
  Stream.Write(CC,SizeOf(CC));
  Stream.Write(Components^,ComponentsSize);
  end
 else begin
  CC:=0;
  Stream.Write(CC,SizeOf(CC));
  end;
if (Windows <> nil)
 then begin
  WC:=(WindowsSize DIV SizeOf(TWindowSavedItem));
  Stream.Write(WC,SizeOf(WC));
  Stream.Write(Windows^,WindowsSize);
  end
 else begin
  WC:=0;
  Stream.Write(WC,SizeOf(WC));
  end;
flChanged:=false;
finally
Lock.Leave;
end;
end;

procedure TSpaceNotificationSubscription.Load;
var
  MS: TMemoryStream;
begin
with TProxySpaceUserProfile.Create(Space) do
try
SetProfileFile(SubscriptionFileName);
MS:=TMemoryStream.Create;
try
if (FileExists(ProfileFile)) then MS.LoadFromFile(ProfileFile);
LoadFromStream(MS);
finally
MS.Destroy;
end;
finally
Destroy;
end;
end;

procedure TSpaceNotificationSubscription.Save;
var
  MS: TMemoryStream;
begin
with TProxySpaceUserProfile.Create(Space) do
try
SetProfileFile(SubscriptionFileName);
MS:=TMemoryStream.Create;
try
SaveToStream(MS);
MS.Position:=0;
MS.SaveToFile(ProfileFile);
finally
MS.Destroy;
end;
finally
Destroy;
end;
flReinitialize:=true;
end;

function TSpaceNotificationSubscription.GetControlPanel: TForm;
begin
if (ControlPanel = nil) then ControlPanel:=TfmSpaceNotificationSubscription.Create(Self);
Result:=ControlPanel;
end;


{TfmSpaceNotificationSubscription}
Constructor TfmSpaceNotificationSubscription.Create(const pNotificationSubscription: TSpaceNotificationSubscription);
begin
Inherited Create(nil);
NotificationSubscription:=pNotificationSubscription;
//.
ImageList:=TImageList.Create(Self);
with ImageList do begin
Width:=32;
Height:=32;
end;
lvComponents.SmallImages:=ImageList;
lvComponents.LargeImages:=ImageList;
//.
flChanged:=false;
flStatusUpdating:=false;
//.
Update();
end;

Destructor TfmSpaceNotificationSubscription.Destroy;
begin
if (flChanged) then Save();
Clear();
Inherited;
end;

procedure TfmSpaceNotificationSubscription.Clear;
begin
ClearComponents;
ClearWindows;
end;

procedure TfmSpaceNotificationSubscription.ClearComponents;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with lvComponents do begin
Items.BeginUpdate;
try
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Items[I].Data;
  FreeMem(ptrRemoveItem,SizeOf(TComponentSavedItem));
  end;
Items.Clear;
finally
Items.EndUpdate;
end;
end;
end;

procedure TfmSpaceNotificationSubscription.ClearWindows;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with lvWindows do begin
Items.BeginUpdate;
try
for I:=0 to Items.Count-1 do begin
  ptrRemoveItem:=Items[I].Data;
  FreeMem(ptrRemoveItem,SizeOf(TWindowSavedItem));
  end;
Items.Clear;
finally
Items.EndUpdate;
end;
end
end;

procedure TfmSpaceNotificationSubscription.Save;
var
  I: integer;
  ptrItem: pointer;
begin
with lvComponents do begin
NotificationSubscription.Lock.Enter;
try
if (NotificationSubscription.Components <> nil)
 then begin
  FreeMem(NotificationSubscription.Components,NotificationSubscription.ComponentsSize);
  NotificationSubscription.ComponentsSize:=0;
  NotificationSubscription.Components:=nil;
  end;
if (Items.Count > 0)
 then begin
  NotificationSubscription.ComponentsSize:=Items.Count*SizeOf(TComponentSavedItem);
  GetMem(NotificationSubscription.Components,NotificationSubscription.ComponentsSize);
  for I:=0 to Items.Count-1 do begin
    ptrItem:=Items[I].Data;
    TComponentSavedItem(Pointer(Integer(NotificationSubscription.Components)+I*SizeOf(TComponentSavedItem))^):=TComponentSavedItem(ptrItem^);
    end;
  end;
NotificationSubscription.Save();
finally
NotificationSubscription.Lock.Leave;
end;
end;
with lvWindows do begin
NotificationSubscription.Lock.Enter;
try
if (NotificationSubscription.Windows <> nil)
 then begin
  FreeMem(NotificationSubscription.Windows,NotificationSubscription.WindowsSize);
  NotificationSubscription.WindowsSize:=0;
  NotificationSubscription.Windows:=nil;
  end;
if (Items.Count > 0)
 then begin
  NotificationSubscription.WindowsSize:=Items.Count*SizeOf(TWindowSavedItem);
  GetMem(NotificationSubscription.Windows,NotificationSubscription.WindowsSize);
  for I:=0 to Items.Count-1 do begin
    ptrItem:=Items[I].Data;
    TWindowSavedItem(Pointer(Integer(NotificationSubscription.Windows)+I*SizeOf(TWindowSavedItem))^):=TWindowSavedItem(ptrItem^);
    end;
  end;
NotificationSubscription.Save();
finally
NotificationSubscription.Lock.Leave;
end;
end;
flChanged:=false;
end;

procedure TfmSpaceNotificationSubscription.wmUpdateItems(var Message: TMessage);
begin
Update();
end;

procedure TfmSpaceNotificationSubscription.Update;
var
  I: integer;
  ptrItem: pointer;
begin
if flChanged then Save;
Clear();
ImageList.Clear;
ImageList.AddImages(TypesImageList);
with lvComponents do begin
Items.BeginUpdate;
try
NotificationSubscription.Lock.Enter;
try
for I:=0 to (NotificationSubscription.ComponentsSize DIV SizeOf(TComponentSavedItem))-1 do with Items.Add do
  try
  GetMem(ptrItem,SizeOf(TComponentSavedItem));
  TComponentSavedItem(ptrItem^):=TComponentSavedItem(Pointer(Integer(NotificationSubscription.Components)+I*SizeOf(TComponentSavedItem))^);
  Data:=ptrItem;
  Caption:=TComponentSavedItem(ptrItem^).Name;
  with TComponentFunctionality_Create(TComponentSavedItem(ptrItem^).CID.idTComponent,TComponentSavedItem(ptrItem^).CID.idComponent) do
  try
  ImageIndex:=TypeFunctionality.ImageList_Index;
  finally
  Release;
  end;
  Checked:=TComponentSavedItem(ptrItem^).Enabled;
  except
    On E: Exception do Caption:='error: '+E.Message;
    end;
finally
NotificationSubscription.Lock.Leave;
end;
finally
Items.EndUpdate;
end;
end;
with lvWindows do begin
Items.BeginUpdate;
try
NotificationSubscription.Lock.Enter;
try
for I:=0 to (NotificationSubscription.WindowsSize DIV SizeOf(TWindowSavedItem))-1 do with Items.Add do
  try
  GetMem(ptrItem,SizeOf(TWindowSavedItem));
  TWindowSavedItem(ptrItem^):=TWindowSavedItem(Pointer(Integer(NotificationSubscription.Windows)+I*SizeOf(TWindowSavedItem))^);
  Data:=ptrItem;
  Caption:=TWindowSavedItem(ptrItem^).Name;
  ImageIndex:=0;
  Checked:=TWindowSavedItem(ptrItem^).Enabled;
  except
    On E: Exception do Caption:='error: '+E.Message;
    end;
finally
NotificationSubscription.Lock.Leave;
end;
finally
Items.EndUpdate;
end;
end;
flChanged:=false;
//. update status
StatusUpdaterTimer(nil);
end;

procedure TfmSpaceNotificationSubscription.CheckAndValidateChanges;
var
  I: integer;
begin
if (flChanged) then Exit; //. ->
for I:=0 to lvComponents.Items.Count-1 do with lvComponents.Items[I] do begin
  if (Checked <> TComponentSavedItem(Data^).Enabled)
   then begin
    TComponentSavedItem(Data^).Enabled:=Checked;
    flChanged:=true;
    end;
  if (Caption <> TComponentSavedItem(Data^).Name)
   then begin
    TComponentSavedItem(Data^).Name:=Caption;
    flChanged:=true;
    end;
  end;
for I:=0 to lvWindows.Items.Count-1 do with lvWindows.Items[I] do begin
  if (Checked <> TWindowSavedItem(Data^).Enabled)
   then begin
    TWindowSavedItem(Data^).Enabled:=Checked;
    flChanged:=true;
    end;
  if (Caption <> TWindowSavedItem(Data^).Name)
   then begin
    TWindowSavedItem(Data^).Name:=Caption;
    flChanged:=true;
    end;
  end;
end;

procedure TfmSpaceNotificationSubscription.InsertNewComponent(const pidTComponent,pidComponent: integer);
var
  ptrNewItem: pointer;
  Functionality: TComponentFunctionality;
begin
if (NotificationSubscription.IsComponentExist(pidTComponent,pidComponent)) then Raise Exception.Create('component is already exist in the subscription-list'); //. =>
//. check for object
with TComponentFunctionality_Create(pidTComponent,pidComponent) do
try
Check;
finally
Release;
end;
//.
GetMem(ptrNewItem,SizeOf(TComponentSavedItem));
with TComponentSavedItem(ptrNewItem^) do begin
CID.idTComponent:=pidTComponent;
CID.idComponent:=pidComponent;
Functionality:=TComponentFunctionality_Create(CID.idTComponent,CID.idComponent);
with Functionality do
try
TComponentSavedItem(ptrNewItem^).Name:=Functionality.Name;
Enabled:=true;
with lvComponents.Items.Add do begin
Caption:=TComponentSavedItem(ptrNewItem^).Name;
Data:=ptrNewItem;
ImageIndex:=TypeFunctionality.ImageList_Index;
Checked:=TComponentSavedItem(ptrNewItem^).Enabled;
flChanged:=true;
EditCaption();
end;
finally
Release;
end;
end;
//.
Save();
//.
if (NotificationSubscription.IsValid) then NotificationSubscription.flReInitialize:=true;
end;

procedure TfmSpaceNotificationSubscription.lvComponents_RemoveComponent(ComponentItem: TListItem);
var
  ptrRemoveItem: pointer;
begin
if (ComponentItem = nil) then Exit; //. ->
ptrRemoveItem:=ComponentItem.Data;
ComponentItem.Delete;
FreeMem(ptrRemoveItem,SizeOf(TComponentSavedItem));
flChanged:=true;
//.
Save();
//.
if (((lvComponents.Items.Count = 0) AND (lvWindows.Items.Count = 0)) AND NotificationSubscription.IsValid AND NotificationSubscription.flActive) then NotificationSubscription.flFinalize:=true;
end;

procedure TfmSpaceNotificationSubscription.lvComponents_RemoveAll;
begin
ClearComponents();
flChanged:=true;
//.
Save();
//.
if (((lvComponents.Items.Count = 0) AND (lvWindows.Items.Count = 0)) AND NotificationSubscription.IsValid AND NotificationSubscription.flActive) then NotificationSubscription.flFinalize:=true;
end;

procedure TfmSpaceNotificationSubscription.lvComponents_EnableAll;
var
  I: integer;
begin
for I:=0 to lvComponents.Items.Count-1 do lvComponents.Items[I].Checked:=true;
//.
CheckAndValidateChanges;
//.
if (flChanged)
 then begin
  Save();
  //.
  if (NotificationSubscription.IsValid) then NotificationSubscription.flReInitialize:=true;
  end;
end;

procedure TfmSpaceNotificationSubscription.lvComponents_DisableAll;
var
  I: integer;
begin
for I:=0 to lvComponents.Items.Count-1 do lvComponents.Items[I].Checked:=false;
//.
CheckAndValidateChanges;
//.
if (flChanged)
 then begin
  Save();
  //.
  if (NotificationSubscription.IsValid AND NotificationSubscription.flActive) then NotificationSubscription.flFinalize:=true;
  end;
end;

procedure TfmSpaceNotificationSubscription.InsertNewWindow(const pWindow: TSubscriptionWindowCoords);
var
  ptrNewItem: pointer;
begin
if (NotificationSubscription.IsWindowExist(pWindow)) then Raise Exception.Create('window is already exist in the subscription-list'); //. =>
//.
GetMem(ptrNewItem,SizeOf(TWindowSavedItem));
with TWindowSavedItem(ptrNewItem^) do begin
WND:=pWindow;
TWindowSavedItem(ptrNewItem^).Name:='New subscription window';
Enabled:=true;
with lvWindows.Items.Add do begin
Caption:=TWindowSavedItem(ptrNewItem^).Name;
Data:=ptrNewItem;
ImageIndex:=0;
Checked:=TWindowSavedItem(ptrNewItem^).Enabled;
flChanged:=true;
EditCaption();
end;
end;
//.
Save();
//.
if (NotificationSubscription.IsValid) then NotificationSubscription.flReInitialize:=true;
end;

procedure TfmSpaceNotificationSubscription.lvWindows_RemoveWindow(WindowItem: TListItem);
var
  ptrRemoveItem: pointer;
begin
if (WindowItem = nil) then Exit; //. ->
ptrRemoveItem:=WindowItem.Data;
WindowItem.Delete;
FreeMem(ptrRemoveItem,SizeOf(TWindowSavedItem));
flChanged:=true;
//.
Save();
//.
if (((lvComponents.Items.Count = 0) AND (lvWindows.Items.Count = 0)) AND NotificationSubscription.IsValid AND NotificationSubscription.flActive) then NotificationSubscription.flFinalize:=true;
end;

procedure TfmSpaceNotificationSubscription.lvWindows_RemoveAll;
begin
ClearWindows();
flChanged:=true;
//.
Save();
//.
if (((lvWindows.Items.Count = 0) AND (lvWindows.Items.Count = 0)) AND NotificationSubscription.IsValid AND NotificationSubscription.flActive) then NotificationSubscription.flFinalize:=true;
end;

procedure TfmSpaceNotificationSubscription.lvWindows_EnableAll;
var
  I: integer;
begin
for I:=0 to lvWindows.Items.Count-1 do lvWindows.Items[I].Checked:=true;
//.
CheckAndValidateChanges;
//.
if (flChanged)
 then begin
  Save();
  //.
  if (NotificationSubscription.IsValid) then NotificationSubscription.flReInitialize:=true;
  end;
end;

procedure TfmSpaceNotificationSubscription.lvWindows_DisableAll;
var
  I: integer;
begin
for I:=0 to lvWindows.Items.Count-1 do lvWindows.Items[I].Checked:=false;
//.
CheckAndValidateChanges;
//.
if (flChanged)
 then begin
  Save();
  //.
  if (NotificationSubscription.IsValid AND NotificationSubscription.flActive) then NotificationSubscription.flFinalize:=true;
  end;
end;

procedure TfmSpaceNotificationSubscription.Addcomponentfromclipboard1Click(Sender: TObject);
begin
with TTypesSystem(NotificationSubscription.Space.TypesSystem) do begin
if NOT ClipBoard_flExist then Exit; //. ->
InsertNewComponent(Clipboard_Instance_idTObj,Clipboard_Instance_idObj);
end;
end;

procedure TfmSpaceNotificationSubscription.Removeselected1Click(Sender: TObject);
begin
if ((lvComponents.Selected <> nil) AND (MessageDlg('remove selected item ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes))
 then lvComponents_RemoveComponent(lvComponents.Selected);
end;

procedure TfmSpaceNotificationSubscription.DisableAll1Click(Sender: TObject);
begin
if (MessageDlg('disable all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvComponents_DisableAll;
end;

procedure TfmSpaceNotificationSubscription.EnableAll1Click(Sender: TObject);
begin
if (MessageDlg('enable all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvComponents_EnableAll;
end;

procedure TfmSpaceNotificationSubscription.Clear1Click(Sender: TObject);
begin
if (MessageDlg('remove all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvComponents_RemoveAll();
end;

procedure TfmSpaceNotificationSubscription.StatusUpdaterTimer(Sender: TObject);
begin
flStatusUpdating:=true;
try
//.
lbParams.Caption:='Server: ';
if (NotificationSubscription.ServerHost <> '') then lbParams.Caption:=lbParams.Caption+NotificationSubscription.ServerHost else lbParams.Caption:=lbParams.Caption+'?';
lbParams.Caption:=lbParams.Caption+',  Port: ';
if (NotificationSubscription.ServerPort <> '') then lbParams.Caption:=lbParams.Caption+NotificationSubscription.ServerPort else lbParams.Caption:=lbParams.Caption+'?';
//.
if (NotificationSubscription.IsValid)
 then begin
  cbStatus.Checked:=NotificationSubscription.flActive;
  //.
  NotificationSubscription.Lock.Enter;
  try
  cbStatus.Caption:=NotificationSubscription.StatusStr;
  finally
  NotificationSubscription.Lock.Leave;
  end;
  cbStatus.Enabled:=true;
  end
 else begin
  cbStatus.Checked:=false;
  cbStatus.Caption:='no subscription';
  end;
finally
flStatusUpdating:=false;
end;
end;

procedure TfmSpaceNotificationSubscription.cbStatusClick(Sender: TObject);
begin
if (flStatusUpdating) then Exit; //. ->
//.
CheckAndValidateChanges;
if (flChanged) then Save();
//.
if (NotificationSubscription.IsValid)
 then
  if (NotificationSubscription.flActive)
   then NotificationSubscription.flFinalize:=true
   else begin
    if (NotificationSubscription.Space.flOffline) then Raise Exception.Create('cannot activate the subscription in offline mode'); //. =>
    NotificationSubscription.flReinitialize:=true;
    end;
end;


procedure TfmSpaceNotificationSubscription.lvComponentsDblClick(Sender: TObject);
begin
if (lvComponents.Selected = nil) then Exit; //. ->
with TComponentSavedItem(lvComponents.Selected.Data^).CID do
with TComponentFunctionality_Create(idTComponent,idComponent) do
try
Check();
with TPanelProps_Create(false,0,nil,nilObject) do begin
Position:=poScreenCenter;
Show();
end;
finally
Release;
end;
end;

procedure TfmSpaceNotificationSubscription.FormClose(Sender: TObject; var Action: TCloseAction);
begin
CheckAndValidateChanges();
if (flChanged)
 then begin
  Save();
  if (NotificationSubscription.IsValid) then NotificationSubscription.flReInitialize:=true else NotificationSubscription.flFinalize:=true;
  end;
end;


procedure TfmSpaceNotificationSubscription.Validatechanges1Click(Sender: TObject);
begin
CheckAndValidateChanges();
if (flChanged)
 then begin
  Save();
  NotificationSubscription.flFinalize:=true;
  if (NotificationSubscription.IsValid) then NotificationSubscription.flReInitialize:=true;
  end;
end;

procedure TfmSpaceNotificationSubscription.MenuItem1Click(Sender: TObject);
var
  W: TReflectionWindowStruc;
  Window: TSubscriptionWindowCoords;
begin
if (TypesSystem.Reflector = nil) then Raise Exception.Create('there is no default reflector'); //. =>
if (NOT (TypesSystem.Reflector is TReflector)) then Raise Exception.Create('default reflector is not a 2d reflector'); //. =>
TReflector(TypesSystem.Reflector).ReflectionWindow.GetWindow(true, W);
//.
Window.X0:=W.X0; Window.Y0:=W.Y0;
Window.X1:=W.X1; Window.Y1:=W.Y1;
Window.X2:=W.X2; Window.Y2:=W.Y2;
Window.X3:=W.X3; Window.Y3:=W.Y3;
//.
InsertNewWindow(Window);
end;

procedure TfmSpaceNotificationSubscription.MenuItem2Click(Sender: TObject);
begin
if ((lvWindows.Selected <> nil) AND (MessageDlg('remove selected item ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes))
 then lvWindows_RemoveWindow(lvWindows.Selected);
end;

procedure TfmSpaceNotificationSubscription.MenuItem3Click(Sender: TObject);
begin
if (MessageDlg('disable all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvWindows_DisableAll;
end;

procedure TfmSpaceNotificationSubscription.MenuItem4Click(Sender: TObject);
begin
if (MessageDlg('enable all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvWindows_EnableAll;
end;

procedure TfmSpaceNotificationSubscription.MenuItem5Click(Sender: TObject);
begin
if (MessageDlg('remove all items ?', mtConfirmation, [mbNo,mbYes], 0) = mrYes)
 then lvWindows_RemoveAll();
end;

procedure TfmSpaceNotificationSubscription.MenuItem7Click(Sender: TObject);
begin
CheckAndValidateChanges();
if (flChanged)
 then begin
  Save();
  NotificationSubscription.flFinalize:=true;
  if (NotificationSubscription.IsValid) then NotificationSubscription.flReInitialize:=true;
  end;
end;

procedure TfmSpaceNotificationSubscription.lvWindowsDblClick(Sender: TObject);
var
  W: TReflectionWindowStrucEx;
begin
if (lvWindows.Selected = nil) then Exit; //. ->
if (TypesSystem.Reflector = nil) then Raise Exception.Create('there is no default reflector to show subscription window'); //. =>
if (NOT (TypesSystem.Reflector is TReflector)) then Raise Exception.Create('default reflector is not a 2d reflector'); //. =>
//.
with TWindowSavedItem(lvWindows.Selected.Data^).WND do begin
W.X0:=X0; W.Y0:=Y0;
W.X1:=X1; W.Y1:=Y1;
W.X2:=X2; W.Y2:=Y2;
W.X3:=X3; W.Y3:=Y3;
end;
//.
TReflector(TypesSystem.Reflector).SetReflectionByWindow(W);
end;

end.
