unit unitProxySpaceControlPanel;

interface

uses
  unitEventLog,Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCGrids, StdCtrls, DBCtrls, ExtCtrls, Db, ADODB,
  RXCtrls, Gauges, RXShell, Animate, GIFCtrl, Buttons, ImgList,
  ComCtrls, Menus, GlobalSpaceDefines,
  {$IFNDEF EmbeddedServer}
  FunctionalitySOAPInterface,
  {$ELSE}
  SpaceInterfacesImport,
  {$ENDIF}
  unitReleaseUpdater;

const
  ReflectorsMaxAllowed = 10;
  WM_TRAYICONMAIN = WM_USER+1;
  WM_TRAYICONUPDATING = WM_USER+2;

type
  TProxySpaceStructureTester = class(TThread)
  private
    Space: TObject;
    flPackIsChanged: boolean;
    flLaysAreChanged: boolean;
    ReleaseUpdater: TReleaseUpdater;

    Constructor Create(const pSpace: TObject);
    Destructor Destroy; override;
    procedure Execute; override;
    procedure Check;
  end;

type
  TfmProxySpaceControlPanel = class(TForm)
    Bevel3: TBevel;
    Panel1: TPanel;
    RxTrayIcon: TRxTrayIcon;
    GroupBox1: TGroupBox;
    lvReflectors: TListView;
    RxLabel2: TRxLabel;
    Bevel1: TBevel;
    lvReflectors_ImageList: TImageList;
    RxLabel6: TRxLabel;
    lbSpaceMaxSize: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    lbGlobalSpaceHost: TRxLabel;
    RxLabel11: TRxLabel;
    lbSpaceID: TRxLabel;
    RxLabel13: TRxLabel;
    lbSpaceStatus: TRxLabel;
    RxLabel3: TRxLabel;
    Label1: TLabel;
    Label2: TLabel;
    cbCreateReflectorType: TComboBox;
    sbCreateReflector: TSpeedButton;
    sbDestroySelectedReflector: TSpeedButton;
    popupTray: TPopupMenu;
    Closeprogram1: TMenuItem;
    memoLog: TMemo;
    Bevel2: TBevel;
    sbProxySpaceConfiguration: TSpeedButton;
    sbUserProxySpaces: TSpeedButton;
    Minimize1: TMenuItem;
    Restore1: TMenuItem;
    PROPERTIES1: TMenuItem;
    N1: TMenuItem;
    PopupImageList: TImageList;
    sbStartSpaceCleaner: TSpeedButton;
    sbStartSpaceLifeServer: TSpeedButton;
    RxLabel1: TRxLabel;
    lbUserName: TRxLabel;
    sbGetUserPanelProps: TSpeedButton;
    UserPROPERTIES1: TMenuItem;
    N2: TMenuItem;
    ShowALL1: TMenuItem;
    HideALL1: TMenuItem;
    N3: TMenuItem;
    timerCheckForReflectorsEnabling: TTimer;
    Servers1: TMenuItem;
    Currentserver1: TMenuItem;
    Connecttolast1: TMenuItem;
    Servershistory1: TMenuItem;
    sbImportComponents: TSpeedButton;
    OpenDialog: TOpenDialog;
    sbPluginsManager: TSpeedButton;
    estconnection1: TMenuItem;
    Search1: TMenuItem;
    Updater: TTimer;
    sbCheckerForm: TSpeedButton;
    RxLabel4: TRxLabel;
    lbTrafficInOut: TRxLabel;
    RxLabel5: TRxLabel;
    N4: TMenuItem;
    showcomponent1: TMenuItem;
    RxLabel7: TRxLabel;
    lbObjectsContext: TRxLabel;
    Clearinactivecontext1: TMenuItem;
    spacecontextsize1: TMenuItem;
    Logoutnocontext1: TMenuItem;
    Logout1: TMenuItem;
    UpdatesHistory1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Offlinemode1: TMenuItem;
    LogoutSaveselectivecontext1: TMenuItem;
    Speciallogout1: TMenuItem;
    Updatessubscription1: TMenuItem;
    bbUpdate: TSpeedButton;
    sbLoadSpaceContext: TSpeedButton;
    Help1: TMenuItem;
    N9: TMenuItem;
    Usersalerts1: TMenuItem;
    RxLabel10: TRxLabel;
    lbSpacePackID: TRxLabel;
    Eventlog1: TMenuItem;
    DisableUPDATE1: TMenuItem;
    ClearALLcontext1: TMenuItem;
    Logoutsaveactivecontext2: TMenuItem;
    System1: TMenuItem;
    SystemToolsMenuItem: TMenuItem;
    Disproportionobjectslist1: TMenuItem;
    N10: TMenuItem;
    Checkforupdates1: TMenuItem;
    Check1: TMenuItem;
    Notify1: TMenuItem;
    UserTaskManager1: TMenuItem;
    Measurementobjects1: TMenuItem;
    Showstartpanel1: TMenuItem;
    N11: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure bbUpdateClick(Sender: TObject);
    procedure sbCreateReflectorClick(Sender: TObject);
    procedure sbDestroySelectedReflectorClick(Sender: TObject);
    procedure Closeprogram1Click(Sender: TObject);
    procedure lvReflectorsEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure sbUserProxySpacesClick(Sender: TObject);
    procedure sbProxySpaceConfigurationClick(Sender: TObject);
    procedure Minimize1Click(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
    procedure PROPERTIES1Click(Sender: TObject);
    procedure sbStartSpaceCleanerClick(Sender: TObject);
    procedure sbStartSpaceLifeServerClick(Sender: TObject);
    procedure sbGetUserPanelPropsClick(Sender: TObject);
    procedure UserPROPERTIES1Click(Sender: TObject);
    procedure ShowALL1Click(Sender: TObject);
    procedure HideALL1Click(Sender: TObject);
    procedure lvReflectorsClick(Sender: TObject);
    procedure timerCheckForReflectorsEnablingTimer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Currentserver1Click(Sender: TObject);
    procedure Connecttolast1Click(Sender: TObject);
    procedure Servershistory1Click(Sender: TObject);
    procedure sbImportComponentsClick(Sender: TObject);
    procedure sbPluginsManagerClick(Sender: TObject);
    procedure RxTrayIconClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure estconnection1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure UpdaterTimer(Sender: TObject);
    procedure sbCheckerFormClick(Sender: TObject);
    procedure showcomponent1Click(Sender: TObject);
    procedure Clearinactivecontext1Click(Sender: TObject);
    procedure spacecontextsize1Click(Sender: TObject);
    procedure Logoutnocontext1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure UpdatesHistory1Click(Sender: TObject);
    procedure Offlinemode1Click(Sender: TObject);
    procedure popupTrayPopup(Sender: TObject);
    procedure LogoutSaveselectivecontext1Click(Sender: TObject);
    procedure Updatessubscription1Click(Sender: TObject);
    procedure sbLoadSpaceContextClick(Sender: TObject);
    procedure Usersalerts1Click(Sender: TObject);
    procedure Eventlog1Click(Sender: TObject);
    procedure DisableUPDATE1Click(Sender: TObject);
    procedure ClearALLcontext1Click(Sender: TObject);
    procedure Logoutsaveactivecontext2Click(Sender: TObject);
    procedure Disproportionobjectslist1Click(Sender: TObject);
    procedure Check1Click(Sender: TObject);
    procedure Notify1Click(Sender: TObject);
    procedure UserTaskManager1Click(Sender: TObject);
    procedure Measurementobjects1Click(Sender: TObject);
    procedure Showstartpanel1Click(Sender: TObject);
  private
    { Private declarations }
    Space: TObject;
    ProxySpaceStructureTester: TProxySpaceStructureTester;
    flCheckForReflectorsEnabling: boolean;
    EventLog_NewErrorsCount: integer;
    fmTMeasurementObjectInstanceByNameContextSelector: TForm;

    procedure GetUserPanel;
    procedure EventLog_CheckNewErrors;
    procedure CheckForProgramUpdatesNow();
    procedure NotyfyOnProgramUpdates();
  public
    { Public declarations }
    fmActiveUserAlerts: TForm;

    Constructor Create(pSpace: TObject);
    Destructor Destroy; override;

    procedure lvReflectors_Update;
    procedure lvReflectors_CreateReflector(const ReflectorType: integer);
    procedure lvReflectors_DestroySelected;
    procedure lvReflectors_CheckForReflectorsEnabling;

    procedure memoLog_Update;
    procedure Update;
    procedure wmShowTrayIconMain(var Message: TMessage); message WM_TRAYICONMAIN;
    procedure wmShowTrayIconUpdating(var Message: TMessage); message WM_TRAYICONUPDATING;
  end;

implementation
Uses
  ShellAPI, unitLinearMemory, unitProxySpace, Functionality,
  TypesFunctionality,
  unitSpaceNotificationSubscription,
  unitProxySpaceCfg,
  unitUserProxySpaces,
  unitReflector,
  unitSpaceCleaner,
  unitMODELServersHistory,
  unitPluginsManager,
  unitServerConnectionTest,
  unitProxySpaceUpdatesMonitor,
  unitServerChecker,
  unitComponentSearch,
  unitComponentInputForm,
  unitSelectiveContextLogout,
  unitSpaceContextLoader,
  unitActiveUserAlertsMonitor,
  unitSpaceDisproportionObjectsPanel,
  unitTMeasurementObjectInstanceByNameContextSelector;


{$R *.DFM}


type
  NotifyIconData_50 = record // определенная в shellapi.h
    cbSize: DWORD;
    Wnd: HWND;
    uID: UINT;
    uFlags: UINT;
    uCallbackMessage: UINT;
    hIcon: HICON;
    szTip: array[0..MAXCHAR] of AnsiChar;
    dwState: DWORD;
    dwStateMask: DWORD;
    szInfo: array[0..MAXBYTE] of AnsiChar;
    uTimeout: UINT; // union with uVersion: UINT;
    szInfoTitle: array[0..63] of AnsiChar;
    dwInfoFlags: DWORD;
  end {record};

const
  NIF_INFO = $00000010;

  NIIF_NONE = $00000000;
  NIIF_INFO = $00000001;
  NIIF_WARNING = $00000002;
  NIIF_ERROR = $00000003;

type
  TBalloonTimeout = 1..30 {seconds};
  TBalloonIconType = (bitNone, // нет иконки
    bitInfo,    // информационная иконка (синяя)
    bitWarning, // иконка восклицания (ж?лтая)
    bitError);  // иконка ошибки (краснаа)

function DZBalloonTrayIcon(const Window: HWND; const IconID: Byte;
  const Timeout: TBalloonTimeout; const BalloonText, BalloonTitle:
  string; const BalloonIconType: TBalloonIconType): Boolean;
const
  aBalloonIconTypes: array[TBalloonIconType] of
    Byte = (NIIF_NONE, NIIF_INFO, NIIF_WARNING, NIIF_ERROR);
var
  NID_50: NotifyIconData_50;
begin
  FillChar(NID_50, SizeOf(NotifyIconData_50), 0);
  with NID_50 do begin
    cbSize := SizeOf(NotifyIconData_50);
    Wnd := Window;
    uID := IconID;
    uFlags := NIF_INFO;
    StrPCopy(szInfo, BalloonText);
    uTimeout := Timeout * 1000;
    StrPCopy(szInfoTitle, BalloonTitle);
    dwInfoFlags := aBalloonIconTypes[BalloonIconType];
  end; {with}
  Result := Shell_NotifyIcon(NIM_MODIFY, @NID_50);
end;


{TProxySpaceStructureTester}
Constructor TProxySpaceStructureTester.Create(const pSpace: TObject);
begin
Space:=pSpace;
flPackIsChanged:=false;
flLaysAreChanged:=false;
ReleaseUpdater:=TReleaseUpdater.Create();
Inherited Create(true);
Priority:=tpIdle;
Resume;
end;

Destructor TProxySpaceStructureTester.Destroy;
var
  EC: dword;
begin
GetExitCodeThread(Handle,EC);
TerminateThread(Handle,EC);
//.
ReleaseUpdater.Free;
end;

procedure TProxySpaceStructureTester.Execute;
const
  CheckInterval = 60*10; {60 sec}
  CheckNewReleaseCounter = 10*10; {10 sec}
var
  I: integer;
begin
I:=1;
repeat
  if ((I MOD CheckInterval) = 0)
   then
    try
    Check();
    except
      end;
  if (I = CheckNewReleaseCounter)
   then begin //. check for new release or update
    if (NOT ((TProxySpace(Space).ProxySpaceServerType <> pssClient) OR TProxySpace(Space).flOffline OR TProxySpace(Space).flAutomaticUpdateIsDisabled))
     then
      try
      ReleaseUpdater.Check();
      except
        end;
    end;
  Sleep(100);
  Inc(I);
until Terminated;
end;

procedure TProxySpaceStructureTester.Check;
var
  {$IFNDEF EmbeddedServer}
  _GlobalSpaceManager: ISpaceManager;
  {$ENDIF}
  _ID,_SpacePackID,_Size,_SpaceLaysID: integer;
begin
if (TProxySpace(Space).flOffline OR TProxySpace(Space).flAutomaticUpdateIsDisabled)
 then begin
  flPackIsChanged:=false;
  flLaysAreChanged:=false;
  Exit; //. ->
  end;
with TProxySpace(Space) do begin
{$IFNDEF EmbeddedServer}
_GlobalSpaceManager:=GetISpaceManager(SOAPServerURL);
GlobalSpaceManager.GetSpaceParams({out} _ID,_SpacePackID,_Size,_SpaceLaysID);
{$ELSE}
SpaceManager_GetSpaceParams({out} _ID,_SpacePackID,_Size,_SpaceLaysID);
{$ENDIF}
flPackIsChanged:=((SpacePackID <> -1) AND (SpacePackID <> _SpacePackID));
flLaysAreChanged:=(_SpaceLaysID <> LaysID());
end;
end;


{TfmProxySpaceControlPanel}
Constructor TfmProxySpaceControlPanel.Create(pSpace: TObject);
begin
Inherited Create(nil);
Space:=pSpace;
ProxySpaceStructureTester:=TProxySpaceStructureTester.Create(TProxySpace(Space));
fmActiveUserAlerts:=TfmActiveUserAlerts.Create(TProxySpace(Space));
//.
EventLog_NewErrorsCount:=0;
//.
SystemToolsMenuItem.Visible:=(TProxySpace(Space).UserID = 1{ROOT});
N10.Visible:=SystemToolsMenuItem.Visible;
//.
fmTMeasurementObjectInstanceByNameContextSelector:=nil;
//.
Update;
end;

Destructor TfmProxySpaceControlPanel.Destroy;
begin
fmTMeasurementObjectInstanceByNameContextSelector.Free();
if (RxTrayIcon <> nil) then RxTrayIcon.Active:=false;
fmActiveUserAlerts.Free();
ProxySpaceStructureTester.Free;
Inherited;
end;

procedure TfmProxySpaceControlPanel.lvReflectors_Update;
var
  I: integer;
  UserReflectors: TList;
  BA: TByteArray;
begin
with lvReflectors do begin
Items.Clear();
Items.BeginUpdate();
try
{$IFNDEF EmbeddedServer}
BA:=GetISpaceUserReflectors(TProxySpace(Space).SOAPServerURL).GetUserReflectors(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, TProxySpace(Space).UserID);
{$ELSE}
SpaceUserReflectors_GetUserReflectors(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, TProxySpace(Space).UserID,{out} BA);
{$ENDIF}
UserReflectors:=TList.Create();
try
ByteArray_PrepareList(BA, UserReflectors);
{$IFNDEF EmbeddedServer}
for I:=UserReflectors.Count-1 downto 0 do with GetISpaceUserReflector(TProxySpace(Space).SOAPServerURL),lvReflectors.Items.Add do begin
{$ELSE}
for I:=UserReflectors.Count-1 downto 0 do with lvReflectors.Items.Add do begin
{$ENDIF}
  Data:=Pointer(UserReflectors[I]);
  {$IFNDEF EmbeddedServer}
  Caption:=getName(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, Integer(UserReflectors[I]));
  {$ELSE}
  Caption:=SpaceUserReflector_getName(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, Integer(UserReflectors[I]));
  {$ENDIF}
  SubItems.Add(IntToStr(Integer(UserReflectors[I])));
  {$IFNDEF EmbeddedServer}
  case TUserReflectorType(ReflectorType(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, Integer(UserReflectors[I]))) of
  {$ELSE}
  case TUserReflectorType(SpaceUserReflector_ReflectorType(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, Integer(UserReflectors[I]))) of
  {$ENDIF}
  urt2DReflector: begin
    ImageIndex:=0;
    SubItems.Add('2D');
    end;
  urtGL3DReflector: begin
    ImageIndex:=1;
    SubItems.Add('3D');
    end;
  end;
  {$IFNDEF EmbeddedServer}
  Checked:=IsEnabled(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, Integer(UserReflectors[I]));
  {$ELSE}
  Checked:=SpaceUserReflector_IsEnabled(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, Integer(UserReflectors[I]));
  {$ENDIF}
  end;
finally
UserReflectors.Destroy();
end;
finally
Items.EndUpdate();
end;
end;
flCheckForReflectorsEnabling:=false;
end;

procedure TfmProxySpaceControlPanel.lvReflectors_CreateReflector(const ReflectorType: integer);
var
  idNewReflector: integer;
  NewReflector: TAbstractReflector;
begin
//. creating user reflector
{$IFNDEF EmbeddedServer}
with GetISpaceUserReflectors(TProxySpace(Space).SOAPServerURL) do idNewReflector:=CreateReflector(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword,TProxySpace(Space).UserID, ReflectorType);
{$ELSE}
idNewReflector:=SpaceUserReflectors_CreateReflector(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword,TProxySpace(Space).UserID, ReflectorType);
{$ENDIF}
//. create memory reflector object
NewReflector:=TAbstractReflector(TReflectorsList(TProxySpace(Space).ReflectorsList).CreateReflectorByID(idNewReflector));
NewReflector.Show;
//. add reflector to list
with lvReflectors.Items.Add do begin
Data:=Pointer(NewReflector.ID);
{$IFNDEF EmbeddedServer}
with GetISpaceUserReflector(TProxySpace(Space).SOAPServerURL) do begin
{$ELSE}
{$ENDIF}
{$IFNDEF EmbeddedServer}
Caption:=getName(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, NewReflector.ID);
{$ELSE}
Caption:=SpaceUserReflector_getName(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, NewReflector.ID);
{$ENDIF}
SubItems.Add(IntToStr(NewReflector.ID));
{$IFNDEF EmbeddedServer}
case TUserReflectorType(ReflectorType(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, NewReflector.ID)) of
{$ELSE}
case TUserReflectorType(SpaceUserReflector_ReflectorType(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, NewReflector.ID)) of
{$ENDIF}
urt2DReflector: begin
  ImageIndex:=0;
  SubItems.Add('2D');
  end;
urtGL3DReflector: begin
  ImageIndex:=1;
  SubItems.Add('3D');
  end;
end;
{$IFNDEF EmbeddedServer}
Checked:=IsEnabled(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, NewReflector.ID);
{$ELSE}
Checked:=SpaceUserReflector_IsEnabled(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, NewReflector.ID);
{$ENDIF}
{$IFNDEF EmbeddedServer}
end;
{$ENDIF}
end;
end;

procedure TfmProxySpaceControlPanel.lvReflectors_DestroySelected;
var
  idDestroyReflector: integer;
begin
if (lvReflectors.Selected = nil) then Exit; //. ->
idDestroyReflector:=Integer(lvReflectors.Selected.Data);
//. destroy memory reflector object
TReflectorsList(TProxySpace(Space).ReflectorsList).TReflector_Destroy(idDestroyReflector);
//. destroying user reflector
{$IFNDEF EmbeddedServer}
with GetISpaceUserReflectors(TProxySpace(Space).SOAPServerURL) do DestroyReflector(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, idDestroyReflector);
{$ELSE}
SpaceUserReflectors_DestroyReflector(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, idDestroyReflector);
{$ENDIF}
//. remove item from list
lvReflectors.Selected.Delete();
end;

procedure TfmProxySpaceControlPanel.lvReflectorsEdited(Sender: TObject; Item: TListItem; var S: String);

  procedure UpdateReflectorCaption(const id: integer; const NewName: string);
  var
    I: integer;
  begin
  with TReflectorsList(TProxySpace(Space).ReflectorsList) do
  for I:=0 to Count-1 do
    if TAbstractReflector(List[I]).ID = id
     then with TAbstractReflector(List[I]) do begin
      Caption:=NewName;
      Exit; //. ->
      end;
  end;

begin
{$IFNDEF EmbeddedServer}
with GetISpaceUserReflector(TProxySpace(Space).SOAPServerURL) do setName(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, Integer(Item.Data), S);
{$ELSE}
SpaceUserReflector_setName(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, Integer(Item.Data), S);
{$ENDIF}
UpdateReflectorCaption(Integer(Item.Data),S);
end;

procedure TfmProxySpaceControlPanel.lvReflectorsClick(Sender: TObject);
begin
flCheckForReflectorsEnabling:=true;
end;

procedure TfmProxySpaceControlPanel.lvReflectors_CheckForReflectorsEnabling;
var
  I,J: integer;
  NewReflector: TAbstractReflector;
begin
//. process about reflectors enabling
{$IFNDEF EmbeddedServer}
for I:=0 to lvReflectors.Items.Count-1 do with lvReflectors.Items[I],GetISpaceUserReflector(TProxySpace(Space).SOAPServerURL) do
{$ELSE}
for I:=0 to lvReflectors.Items.Count-1 do with lvReflectors.Items[I] do
{$ENDIF}
  {$IFNDEF EmbeddedServer}
  if (Checked <> IsEnabled(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, Integer(lvReflectors.Items[I].Data)))
  {$ELSE}
  if (Checked <> SpaceUserReflector_IsEnabled(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, Integer(lvReflectors.Items[I].Data)))
  {$ENDIF}
   then begin
    {$IFNDEF EmbeddedServer}
    SetEnabled(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, Integer(lvReflectors.Items[I].Data), Checked);
    {$ELSE}
    SpaceUserReflector_SetEnabled(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, Integer(lvReflectors.Items[I].Data), Checked);
    {$ENDIF}
    if (Checked)
     then begin //. create memory reflector object
      NewReflector:=TAbstractReflector(TReflectorsList(TProxySpace(Space).ReflectorsList).CreateReflectorByID(Integer(Data)));
      NewReflector.Show();
      end
     else
      TReflectorsList(TProxySpace(Space).ReflectorsList).TReflector_Destroy(Integer(Data));
    end;
flCheckForReflectorsEnabling:=false;
end;

procedure TfmProxySpaceControlPanel.timerCheckForReflectorsEnablingTimer(Sender: TObject);
begin
if flCheckForReflectorsEnabling then lvReflectors_CheckForReflectorsEnabling;
end;


procedure TfmProxySpaceControlPanel.memoLog_Update;
var
  I: integer;
begin
with memoLog do begin
Clear;
Lines.BeginUpdate;
try
for I:=0 to TProxySpace(Space).Log.cbLog.Items.Count do Lines.Add(ANSILowerCase(TProxySpace(Space).Log.cbLog.Items[I]));
finally
Lines.EndUpdate;
end;
end;
end;

procedure TfmProxySpaceControlPanel.Update;
var
  Message: TMessage;
begin
//. обновляем параметры ProxySpace
with TProxySpace(Space) do begin
lbGlobalSpaceHost.Caption:=SOAPServerURL;
lbSpaceID.Caption:=IntToStr(ID);
lbSpacePackID.Caption:=IntToStr(SpacePackID);
lbUserName.Caption:=TProxySpace(Space).UserName;
lbSpaceStatus.Caption:=ProxySpaceStatusStrings[Status];
if (LocalStorage is TRealMemory)
 then lbSpaceMaxSize.Caption:=IntToStr(TRealMemory(LocalStorage).Size)
 else lbSpaceMaxSize.Caption:='-VirtMem-';
lbObjectsContext.Caption:=IntToStr(ObjectsContextRegistry.ObjectsCount);
lbTrafficInOut.Caption:=IntToStr(Log.BytesReceived DIV 1024)+'/'+IntToStr(Log.BytesTransmitted DIV 1024);
end;
//. обновляем Log
memoLog_Update;
try
//. update caption
if (TProxySpace(Space).idUserProxySpace <> 0)
 then
  {$IFNDEF EmbeddedServer}
  Caption:='ProxySpace - '+GetISpaceUserProxySpace(TProxySpace(Space).SOAPServerURL).getName(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, TProxySpace(Space).idUserProxySpace)+' of user '+TProxySpace(Space).UserName
  {$ELSE}
  Caption:='ProxySpace - '+SpaceUserProxySpace_getName(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword, TProxySpace(Space).idUserProxySpace)+' of user '+TProxySpace(Space).UserName
  {$ENDIF}
 else
  Caption:='ProxySpace - default of user '+TProxySpace(Space).UserName;
RxTrayIcon.Hint:=Caption+#$0D#$0A+'Click to "UPDATE"';
//. обновляем список рефлекторов
if (NOT TProxySpace(Space).flOffline) then lvReflectors_Update;
//.
if TProxySpace(Space).UserName = 'ROOT'
 then begin
  sbStartSpaceLifeServer.Visible:=true;
  sbStartSpaceCleaner.Visible:=true;
  end
 else begin
  sbStartSpaceLifeServer.Visible:=false;
  sbStartSpaceCleaner.Visible:=false;
  end;
except
  //. catch any exceptions
  end;
wmShowTrayIconMain(Message);
end;


procedure TfmProxySpaceControlPanel.FormShow(Sender: TObject);
begin
Update;
timerCheckForReflectorsEnabling.Enabled:=true;
end;

procedure TfmProxySpaceControlPanel.FormHide(Sender: TObject);
begin
timerCheckForReflectorsEnabling.Enabled:=false;
end;

procedure TfmProxySpaceControlPanel.bbUpdateClick(Sender: TObject);
begin
Update;
end;

procedure TfmProxySpaceControlPanel.sbCreateReflectorClick(Sender: TObject);
var
  ReflectorType: TUserReflectorType;
begin
if lvReflectors.Items.Count >= ReflectorsMaxAllowed then Raise Exception.Create('too many reflectors'); //. =>
if (MessageDlg('Create new user reflector ?', mtConfirmation , [mbYes,mbNo], 0) = mrYes)
 then begin
  case cbCreateReflectorType.ItemIndex of
  0: ReflectorType:=urt2DReflector;
  1: ReflectorType:=urtGL3DReflector;
  else
    Raise Exception.Create('unknown reflector type'); //. =>
  end;
  lvReflectors_CreateReflector(Integer(ReflectorType));
  end;
end;

procedure TfmProxySpaceControlPanel.sbDestroySelectedReflectorClick(Sender: TObject);
begin
if MessageDlg('Are you really want destroy selected reflector ?', mtConfirmation , [mbYes,mbNo], 0) = mrYes
 then lvReflectors_DestroySelected;
end;

procedure TfmProxySpaceControlPanel.GetUserPanel;
begin
with TComponentFunctionality_Create(idTMODELUser,TProxySpace(Space).UserID) do
try
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end
end;

procedure TfmProxySpaceControlPanel.sbProxySpaceConfigurationClick(Sender: TObject);
begin
with TfmProxySpaceCfg.Create(TProxySpace(Space)) do
try
Edit;
finally
Destroy;
end;
end;

procedure TfmProxySpaceControlPanel.sbUserProxySpacesClick(Sender: TObject);
begin
with TfmUserProxySpaces.Create(TProxySpace(Space),TProxySpace(Space).UserID) do
try
Edit;
finally
Destroy;
end;
end;

procedure TfmProxySpaceControlPanel.Minimize1Click(Sender: TObject);

  procedure MinimizeReflectors;
  var
    I: integer;
  begin
  with TReflectorsList(TProxySpace(Space).ReflectorsList) do
  for I:=0 to Count-1 do TAbstractReflector(List[I]).WindowState:=wsMinimized;
  end;

begin
MinimizeReflectors;
end;

procedure TfmProxySpaceControlPanel.Restore1Click(Sender: TObject);

  procedure RestoreReflectors;
  var
    I: integer;
  begin
  with TReflectorsList(TProxySpace(Space).ReflectorsList) do
  for I:=0 to Count-1 do TAbstractReflector(List[I]).WindowState:=wsNormal;
  end;

begin
RestoreReflectors;
end;

procedure TfmProxySpaceControlPanel.PROPERTIES1Click(Sender: TObject);
begin
Show;
end;

procedure TfmProxySpaceControlPanel.sbStartSpaceCleanerClick(Sender: TObject);
begin
with TfmSpaceCleaner.Create(TypesSystem) do Show;
end;

procedure TfmProxySpaceControlPanel.sbStartSpaceLifeServerClick(Sender: TObject);
begin
{$IFDEF ExternalTypes}
InitializeSpaceLifeServer;
{$ENDIF}
end;

procedure TfmProxySpaceControlPanel.sbGetUserPanelPropsClick(Sender: TObject);
begin
GetUserPanel;
end;

procedure TfmProxySpaceControlPanel.UserPROPERTIES1Click(Sender: TObject);
begin
GetUserPanel;
end;

procedure TfmProxySpaceControlPanel.ShowALL1Click(Sender: TObject);

  procedure ShowReflectors;
  var
    I: integer;
  begin
  with TReflectorsList(TProxySpace(Space).ReflectorsList) do
  for I:=0 to Count-1 do TAbstractReflector(List[I]).Show;
  end;

begin
ShowReflectors;
end;

procedure TfmProxySpaceControlPanel.HideALL1Click(Sender: TObject);

  procedure HideReflectors;
  var
    I: integer;
  begin
  with TReflectorsList(TProxySpace(Space).ReflectorsList) do
  for I:=0 to Count-1 do TAbstractReflector(List[I]).Hide;
  end;

begin
HideReflectors;
end;

procedure TfmProxySpaceControlPanel.Showstartpanel1Click(Sender: TObject);
var
  StartPanel: TForm;
begin
StartPanel:=TProxySpace(Space).Plugins__GetStartPanel(false);
if (StartPanel <> nil) then StartPanel.Show();
end;

procedure TfmProxySpaceControlPanel.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

procedure TfmProxySpaceControlPanel.Currentserver1Click(Sender: TObject);

  function GetCurrentServerID(out ID: integer): boolean;
  begin
  Result:=false;
  with TTMODELServerFunctionality.Create do
  try
  Result:=GetInstanceByIPAddress('0.0.0.0', ID); //. get id currently connected server
  finally
  Release;
  end;
  end;

var
  ServerID: integer;
begin
if GetCurrentServerID(ServerID)
 then with TComponentFunctionality_Create(idTMODELServer,ServerID) do
  try
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Position:=poScreenCenter;
  Show;
  end;
  finally
  Release;
  end
 else
  Raise Exception.Create('could not get model-server'); //. =>
end;

procedure TfmProxySpaceControlPanel.Connecttolast1Click(Sender: TObject);
var
  ServerName: string;
  ServerIP: string;
  ServerSpaceID: integer;
  ServerInfo: string;
  UserName: shortstring;
  UserPassword: shortstring;

  Cmd,Prms: string;
begin
with TMODELServersHistory.Create do
try
if Remove(1, ServerName,ServerIP,ServerSpaceID,ServerInfo,UserName,UserPassword)
 then begin
  Cmd:=ExtractFileName(ParamStr(0));
  Prms:=ServerIP+' '+UserName+' '+UserPassword;
  //.
  try
  Space.Free;
  except
    end;
  //.
  ShellExecute(0,nil,PChar(Cmd),PChar(Prms),nil, SW_SHOW);
  //.
  TerminateProcess(GetCurrentProcess,0);
  end
 else
  Raise Exception.Create('there is no last server(s)'); //. =>
finally
Destroy;
end;
end;

procedure TfmProxySpaceControlPanel.Servershistory1Click(Sender: TObject);
begin
with TfmMODELServersHistory.Create(TProxySpace(Space)) do begin
if lvHistory.Items.Count > 1
 then begin
  lvHistory.Items[1].Focused:=true;
  lvHistory.Items[1].Selected:=true;
  end;
Show;
end;
end;

procedure TfmProxySpaceControlPanel.sbImportComponentsClick(Sender: TObject);
var
  CD: string;
  CL: TComponentsList;
  I: integer;
begin
CD:=GetCurrentDir;
try
if OpenDialog.Execute
 then begin
  TProxySpace(Space).Log.OperationStarting('Importing components ...');
  try
  TypesSystem.DoImportComponents(TProxySpace(Space).UserName,TProxySpace(Space).UserPassword,OpenDialog.FileName, CL);
  try
  for I:=0 to CL.Count-1 do with TItemComponentsList(CL[I]^) do with TComponentFunctionality_Create(idTComponent,idComponent) do
    try
    with TPanelProps_Create(false, 0,nil,nilObject) do Show;
    finally
    Release;
    end;
  finally
  CL.Destroy;
  end;
  finally
  TProxySpace(Space).Log.OperationDone;
  end;
  ShowMessage('Import done.');
  end;
finally
ChDir(CD);
end;
end;

procedure TfmProxySpaceControlPanel.sbPluginsManagerClick(Sender: TObject);
begin
with TfmPluginsManager.Create(TProxySpace(Space)) do
try
ShowModal;
finally
Destroy;
end;
end;

procedure TfmProxySpaceControlPanel.wmShowTrayIconMain(var Message: TMessage);
begin
if (NOT TProxySpace(ProxySpace).flOffline)
 then with RxTrayIcon do Icon:=Icons[0]
 else with RxTrayIcon do Icon:=Icons[2];
end;

procedure TfmProxySpaceControlPanel.wmShowTrayIconUpdating(var Message: TMessage);
begin
with RxTrayIcon do Icon:=Icons[1];
end;


procedure TfmProxySpaceControlPanel.RxTrayIconClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//. manual update
with TProxySpace(Space) do begin
if (TProxySpace(ProxySpace).flOffline)
 then
  if (NOT TProxySpace(ProxySpace).flStartedInOffline)
   then begin
    if (MessageDlg('Program in offline mode. Would you like to switch the program in online and update ?', mtInformation , [mbYes,mbNo], 0) <> mrYes) then Exit; //. ->
    TProxySpace(ProxySpace).flOffline:=false;
    end
   else Raise Exception.Create('You can not update because program was started in offline mode.'); //. =>
//.   
StayUpToDate(false);
UserIncomingMessages.CheckForNewMessages();
CheckForNewUserMessages;
end;
Windows.Beep(7000,100);
end;

procedure TfmProxySpaceControlPanel.estconnection1Click(Sender: TObject);
begin
with TfmServerConnectionTest.Create(TProxySpace(Space).SOAPServerURL) do Show;
end;

procedure TfmProxySpaceControlPanel.Search1Click(Sender: TObject);
begin
with TfmComponentSearch.Create(TProxySpace(Space)) do Show;
end;

procedure TfmProxySpaceControlPanel.UpdaterTimer(Sender: TObject);
const
  CheckInterval = 12;
var
  PackID: integer;
  NewReleaseLevel,NewReleaseURL,NewUpdateLevel,NewUpdateURL: string;
begin
if ((Updater.Tag DIV CheckInterval) = 0)
 then
  try
  with TProxySpace(Space) do begin
  if (UserName = 'Checker')
   then begin
    if (fmServerChecker = nil)
     then begin
      unitServerChecker.Initialize;
      fmServerChecker:=TfmServerChecker.Create;
      sbCheckerForm.Visible:=true;
      end;
    end
   else
    if (ProxySpaceStructureTester.flPackIsChanged OR ProxySpaceStructureTester.flLaysAreChanged)
     then begin
      MessageDlg('Attention. Remote server was stopped and started again. You must restart the client.', mtError , [mbOk], 0);
      //.
      try
      Space.Free();
      except
        end;
      //.
      TerminateProcess(GetCurrentProcess,0);
      end
     else
      if (ProxySpaceStructureTester.ReleaseUpdater.flChecked AND (NOT ProxySpaceStructureTester.ReleaseUpdater.flDisabled))
       then begin
        if (ProxySpaceStructureTester.ReleaseUpdater.ReleaseToInstallIsAvailable)
         then begin
          Updater.Enabled:=false;
          try
          if (ProxySpaceStructureTester.ReleaseUpdater.InstallReleaseDialog({out} NewReleaseLevel,NewReleaseURL))
           then begin
            //. finalize with ProxySpace
            try
            Space.Free;
            except
              end;
            //.
            TReleaseUpdater.StartReleaseInstaller(NewReleaseURL);
            //. terminate program immediately
            TerminateProcess(GetCurrentProcess,0);
            end
           else ProxySpaceStructureTester.ReleaseUpdater.flDisabled:=true;
          finally
          Updater.Enabled:=true;
          end;
          end
         else
          if (ProxySpaceStructureTester.ReleaseUpdater.UpdateToInstallIsAvailable)
           then begin
            Updater.Enabled:=false;
            try
            if (ProxySpaceStructureTester.ReleaseUpdater.InstallUpdateDialog({out} NewUpdateLevel,NewUpdateURL))
             then begin
              //. finalize with ProxySpace
              try
              Space.Free;
              except
                end;
              //.
              TReleaseUpdater.StartReleaseInstaller(NewUpdateURL);
              //. terminate program immediately
              TerminateProcess(GetCurrentProcess,0);
              end
             else ProxySpaceStructureTester.ReleaseUpdater.flDisabled:=true;
            finally
            Updater.Enabled:=true;
            end;
            end;
        end;
  end;
  except
    end;
//.
EventLog_CheckNewErrors();
//.
Updater.Tag:=Updater.Tag+1;
end;

procedure TfmProxySpaceControlPanel.EventLog_CheckNewErrors;
const
  SeeEventLogStr = 'See "Event Log" for more information.';
var
  EC: integer;
  dE: integer;
  ErrEvent: TEventLogItem;
  Str: string;
begin
if (EventLog = nil) then Exit; //. ->
EC:=EventLog.NewErrorsCount;
if (EC > EventLog_NewErrorsCount)
 then begin
  dE:=(EC-EventLog_NewErrorsCount);
  EventLog_NewErrorsCount:=EC;
  if (dE > 1)
   then DZBalloonTrayIcon(RxTrayIcon.Handle, 0, 10, SeeEventLogStr, 'Errors in program', bitError)
   else begin
    if (EventLog.GetLastErrorEvent(ErrEvent))
     then Str:=ErrEvent.Source+': '+ErrEvent.EventMessage+#$0D#$0A+SeeEventLogStr
     else Str:=SeeEventLogStr;
    DZBalloonTrayIcon(RxTrayIcon.Handle, 0, 10, Str, 'Error in program', bitError);
    end;
  end;
end;

procedure TfmProxySpaceControlPanel.sbCheckerFormClick(Sender: TObject);
begin
if fmServerChecker <> nil then fmServerChecker.Show;
end;

procedure TfmProxySpaceControlPanel.showcomponent1Click(Sender: TObject);
var
  idTComponent,idComponent: integer;
  CoComponentPanelProps: TForm;
begin
with TfmComponentInput.Create do
try
if InputID(idTComponent,idComponent)
 then with TComponentFunctionality_Create(idTComponent,idComponent) do
  try
  Check;
  CoComponentPanelProps:=nil;
  if idTObj <> idTCoComponent
   then CoComponentPanelProps:=TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject))
   else begin
    Space.Log.OperationStarting('loading ..........');
    try
    try
    CoComponentPanelProps:=Space.Plugins___CoComponent__TPanelProps_Create(TypesFunctionality.CoComponentFunctionality_idCoType(idObj),idObj);
    except
      FreeAndNil(CoComponentPanelProps);
      end;
    finally
    Space.Log.OperationDone;
    end;
    if CoComponentPanelProps = nil then CoComponentPanelProps:=TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject));
    end;
  if CoComponentPanelProps <> nil
   then with CoComponentPanelProps do begin
    Left:=Round((Screen.Width-Width)/2);
    Top:=Screen.Height-Height-20;
    Show;
    end
  finally
  Release;
  end;
finally
Destroy;
end;
end;

procedure TfmProxySpaceControlPanel.Clearinactivecontext1Click(Sender: TObject);
var
  ObjectsCleared,ObjectsRemains: integer;
begin
TProxySpace(ProxySpace).ClearInactiveSpaceContext(ObjectsCleared,ObjectsRemains);
if (ObjectsCleared > 0)
 then DZBalloonTrayIcon(RxTrayIcon.Handle, 0, 10, 'removed: '+IntToStr(ObjectsCleared)+' object(s)'#$0D#$0A'remains: '+IntToStr(ObjectsRemains)+' objects', 'Inactive context cleared', bitInfo)
 else DZBalloonTrayIcon(RxTrayIcon.Handle, 0, 10, ' ', 'no inactive context', bitWarning);
end;

procedure TfmProxySpaceControlPanel.ClearALLcontext1Click(Sender: TObject);
begin
if (MessageDlg('Do you want to clear all space context ?', mtConfirmation , [mbYes,mbNo], 0) <> mrYes) then Exit; //. ->
TProxySpace(ProxySpace).ClearSpaceContext();
end;

procedure TfmProxySpaceControlPanel.spacecontextsize1Click(Sender: TObject);
begin
with TProxySpace(ProxySpace) do
if (ContextItemsMaxCount <= 0)
 then DZBalloonTrayIcon(RxTrayIcon.Handle, 0, 10, 'summary: '+IntToStr(ObjectsContextRegistry.ObjectsCount)+' objects'#$0D#$0A'server maximum: '+IntToStr(StayUpToDate__ContextV0_VisualizationsMaxCount)+' objects', 'Space context size', bitInfo)
 else DZBalloonTrayIcon(RxTrayIcon.Handle, 0, 10, 'summary: '+IntToStr(ObjectsContextRegistry.ObjectsCount)+' objects'#$0D#$0A'maximum: '+IntToStr(ContextItemsMaxCount)+' objects'#$0D#$0A'server maximum: '+IntToStr(StayUpToDate__ContextV0_VisualizationsMaxCount)+' objects', 'Space context size', bitInfo);
end;

procedure TfmProxySpaceControlPanel.UpdatesHistory1Click(Sender: TObject);
begin
with TfmProxySpaceUpdatesMonitor(TProxySpace(ProxySpace).StayUpToDate_Monitor) do begin
Show;
BringToFront;
end;
end;

procedure TfmProxySpaceControlPanel.DisableUPDATE1Click(Sender: TObject);
begin
TProxySpace(ProxySpace).flAutomaticUpdateIsDisabled:=(NOT TProxySpace(ProxySpace).flAutomaticUpdateIsDisabled);
DisableUPDATE1.Checked:=(NOT TProxySpace(ProxySpace).flAutomaticUpdateIsDisabled)
end;

procedure TfmProxySpaceControlPanel.Offlinemode1Click(Sender: TObject);
var
  Message: TMessage;
begin
if (TProxySpace(ProxySpace).flOffline AND TProxySpace(ProxySpace).flStartedInOffline)
 then Raise Exception.Create('Can not switch to online mode because program was started in offline.'#$0D#$0A'Restart the program to get it online'); //. =>
TProxySpace(ProxySpace).flOffline:=NOT TProxySpace(ProxySpace).flOffline;
Offlinemode1.Checked:=TProxySpace(ProxySpace).flOffline;
wmShowTrayIconMain(Message);
end;

procedure TfmProxySpaceControlPanel.popupTrayPopup(Sender: TObject);
begin
Offlinemode1.Checked:=TProxySpace(ProxySpace).flOffline;
end;

procedure TfmProxySpaceControlPanel.Logout1Click(Sender: TObject);
begin
RxTrayIcon.Hide;
//.
try
Space.Free; //. уничтожаем пространство
except
  end;
TerminateProcess(GetCurrentProcess,0);
end;

procedure TfmProxySpaceControlPanel.Logoutsaveactivecontext2Click(Sender: TObject);
var
  ObjectsCleared,ObjectsRemains: integer;
begin
//.
with TProxySpace(ProxySpace) do begin
Log.OperationStarting('preparing the active context ...');
try
ClearInactiveSpaceContext(ObjectsCleared,ObjectsRemains);
finally
Log.OperationDone;
end;
end;
//.
RxTrayIcon.Hide;
//.
try
Space.Free; //. уничтожаем пространство
except
  end;
TerminateProcess(GetCurrentProcess,0);
end;

procedure TfmProxySpaceControlPanel.CloseProgram1Click(Sender: TObject);
begin
RxTrayIcon.Hide;
//.
try
Space.Free; //. уничтожаем пространство
except
  end;
TerminateProcess(GetCurrentProcess,0);
end;

procedure TfmProxySpaceControlPanel.Logoutnocontext1Click(Sender: TObject);
begin
if (MessageDlg('Do you want to logout with remove all cached data ?', mtConfirmation , [mbYes,mbNo], 0) <> mrYes) then Exit; //. ->
RxTrayIcon.Hide;
//.
TProxySpace(ProxySpace).flNoContextSaving:=true;
try
Space.Free; //. уничтожаем пространство
except
  end;
TerminateProcess(GetCurrentProcess,0);
end;

procedure TfmProxySpaceControlPanel.LogoutSaveselectivecontext1Click(Sender: TObject);
var
  flAccepted: boolean;
begin
with TfmSelectiveContextLogout.Create(TProxySpace(ProxySpace)) do
try
flAccepted:=Accepted();
finally
Destroy;
end;
if (flAccepted)
 then begin
  RxTrayIcon.Hide;
  //.
  try
  Space.Free; //. уничтожаем пространство
  except
    end;
  //.
  TerminateProcess(GetCurrentProcess,0);
  end;
end;

procedure TfmProxySpaceControlPanel.Updatessubscription1Click(Sender: TObject);
begin
TSpaceNotificationSubscription(TProxySpace(ProxySpace).NotificationSubscription).GetControlPanel().Show();
end;

procedure TfmProxySpaceControlPanel.sbLoadSpaceContextClick(Sender: TObject);
begin
with TfmSpaceContextLoader.Create(TProxySpace(ProxySpace)) do
try
ShowModal();
finally
Destroy;
end;
end;

procedure TfmProxySpaceControlPanel.Usersalerts1Click(Sender: TObject);
begin
fmActiveUserAlerts.Show();
end;

procedure TfmProxySpaceControlPanel.UserTaskManager1Click(Sender: TObject);
begin
TProxySpace(ProxySpace).Plugins__ShowUserTaskManager();
end;

procedure TfmProxySpaceControlPanel.Measurementobjects1Click(Sender: TObject);
begin
if (fmTMeasurementObjectInstanceByNameContextSelector = nil) then fmTMeasurementObjectInstanceByNameContextSelector:=TfmTMeasurementObjectInstanceByNameContextSelector.Create(TProxySpace(Space));
fmTMeasurementObjectInstanceByNameContextSelector.Show();
end;

procedure TfmProxySpaceControlPanel.Eventlog1Click(Sender: TObject);
begin
EventLog.GetControlPanel.Show();
EventLog.GetControlPanel.BringToFront();
end;

procedure TfmProxySpaceControlPanel.Disproportionobjectslist1Click(Sender: TObject);
begin
with TfmSpaceDisproportionObjectsPanel.Create() do Show();
end;

procedure TfmProxySpaceControlPanel.CheckForProgramUpdatesNow();
var
  _NewReleaseLevel,_NewReleaseURL,_NewUpdateLevel,_NewUpdateURL: string;
begin
//. disable automatic check
ProxySpaceStructureTester.ReleaseUpdater.flDisabled:=true;
//.
with TReleaseUpdater.Create() do
try
InstallReleaseSeverity:=0;
InstallUpdateSeverity:=0;
//.
Check();
//.
if (ReleaseToInstallIsAvailable())
 then begin
  if (InstallReleaseDialog({out} _NewReleaseLevel,_NewReleaseURL))
   then begin
    //. finalize with ProxySpace
    try
    Space.Free;
    except
      end;
    //.
    TReleaseUpdater.StartReleaseInstaller(_NewReleaseURL);
    //. terminate program immediately
    TerminateProcess(GetCurrentProcess,0);
    end;
  end
 else
  if (UpdateToInstallIsAvailable())
   then begin
    if (InstallUpdateDialog({out} _NewUpdateLevel,_NewUpdateURL))
     then begin
      //. finalize with ProxySpace
      try
      Space.Free;
      except
        end;
      //.
      TReleaseUpdater.StartReleaseInstaller(_NewUpdateURL);
      //. terminate program immediately
      TerminateProcess(GetCurrentProcess,0);
      end
    end
   else ShowMessage('there are no program updates found'); //. =>
finally
Destroy;
end;
end;

procedure TfmProxySpaceControlPanel.Check1Click(Sender: TObject);
begin
CheckForProgramUpdatesNow();
end;

procedure TfmProxySpaceControlPanel.NotyfyOnProgramUpdates();
begin
with TReleaseUpdater.Create() do
try
InstallReleaseSeverity:=0;
InstallUpdateSeverity:=0;
//.
SaveInstallSeverities();
finally
Destroy;
end;
end;

procedure TfmProxySpaceControlPanel.Notify1Click(Sender: TObject);
begin
NotyfyOnProgramUpdates();
ShowMessage('Program update notifications are enabled');
end;


end.
