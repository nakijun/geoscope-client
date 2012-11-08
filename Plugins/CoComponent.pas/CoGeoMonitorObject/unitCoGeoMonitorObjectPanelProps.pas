unit unitCoGeoMonitorObjectPanelProps;
interface
uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Buttons,
  jpeg,
  Menus,
  ComCtrls,
  ImgList,
  GlobalSpaceDefines,
  FunctionalityImport,
  unitCoGeoMonitorObjectFunctionality,
  unitCoComponentRepresentations,
  unitGEOGraphServerController,
  unitObjectModel,
  unitBusinessModel;

type
  TPanelPropsUpdating = class;

  TCoGeoMonitorObjectPanelProps = class;

  TPanelObjectModelsUpdating = class(TThread)
  private
    Panel: TCoGeoMonitorObjectPanelProps;
    idCoComponent: integer;
    //.
    StageCount: integer;
    Stage: integer;
    //.
    ServerObjectController: TGEOGraphServerObjectController;
    ObjectModel: TObjectModel;
    ObjectBusinessModel: TBusinessModel;
    //.
    ThreadException: Exception;

    Constructor Create(const pPanel: TCoGeoMonitorObjectPanelProps);
    Destructor Destroy(); override;
    procedure ForceDestroy(); //. for use on process termination
    procedure Execute(); override;
    procedure SetModelsAndCreateControlPanel();
    procedure SetNullModels();
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    procedure DoOnStage();
    procedure DoOnException();
    procedure DoTerminate; override;
    procedure Finalize();
    procedure Cancel();
  end;

  TCoGeoMonitorObjectPanelProps = class(TCoComponentPanelProps)
    pnlCommon: TPanel;
    bvlHeader: TBevel;
    Image: TImage;
    Label1: TLabel;
    sbOwner: TSpeedButton;
    sbDATA: TSpeedButton;
    edName: TEdit;
    gbUserAlert: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edUserAlertTimeStamp: TEdit;
    edUserAlertSeverity: TEdit;
    edUserAlertDescription: TEdit;
    gbStatus: TGroupBox;
    lbConnectionStatus: TLabel;
    lbLocationIsAvailable: TLabel;
    stConnectionStatus: TStaticText;
    stLocationIsAvailable: TStaticText;
    PopupMenu: TPopupMenu;
    RegisterserverObject1: TMenuItem;
    Deviceinitialconfigurationpanel1: TMenuItem;
    N1: TMenuItem;
    Addobjecttothelocalmonitor1: TMenuItem;
    Showobjectlocalmonitor1: TMenuItem;
    N3: TMenuItem;
    ShowGeoGraphcomponentpanel1: TMenuItem;
    N2: TMenuItem;
    Addmapmarker1: TMenuItem;
    Copyvisualizationcomponenttotheclipboard1: TMenuItem;
    Showhintvisualizationcomponent1: TMenuItem;
    N4: TMenuItem;
    Destroyobject1: TMenuItem;
    lvNotificationAreas_PopupMenu: TPopupMenu;
    Showgeoobjectpanel1: TMenuItem;
    Insertitemfromclipboard1: TMenuItem;
    InOutnotification1: TMenuItem;
    Outgoingnotification1: TMenuItem;
    Incomingnotification1: TMenuItem;
    Removeselecteditem1: TMenuItem;
    Clickifyouaresure1: TMenuItem;
    lvNotificationAreas_ImageList: TImageList;
    sbOwner_PopupMenu: TPopupMenu;
    setownerfromclipboard1: TMenuItem;
    lvObjectDistances_PopupMenu: TPopupMenu;
    Showobjectpanel1: TMenuItem;
    Insertitemfromclipboard2: TMenuItem;
    Removeselecteditem2: TMenuItem;
    Clickifyouaresure2: TMenuItem;
    pnlObjectBusinessModel: TPanel;
    Addobjecttotree1: TMenuItem;
    gbGeographServerObject: TGroupBox;
    sbShow: TSpeedButton;
    sbInfo: TSpeedButton;
    sbCoComponent: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    sbShowGeoGraphServerObject: TSpeedButton;
    sbGeoGraphServerObjectBusinessModel: TSpeedButton;
    sbShowGeoGraphServer: TSpeedButton;
    edGeoGraphServerName: TEdit;
    edGeoGraphServerObjectID: TEdit;
    gbNotificationAreas: TGroupBox;
    lvNotificationAreas: TListView;
    gbObjectDistances: TGroupBox;
    lvObjectDistances: TListView;
    Label2: TLabel;
    edNotificationAddresses: TEdit;
    sbEditNotificationAddresses: TSpeedButton;
    procedure Copyvisualizationcomponenttotheclipboard1Click(
      Sender: TObject);
    procedure sbInfoClick(Sender: TObject);
    procedure Addobjecttothelocalmonitor1Click(Sender: TObject);
    procedure edNameKeyPress(Sender: TObject; var Key: Char);
    procedure Showgeoobjectpanel1Click(Sender: TObject);
    procedure Outgoingnotification1Click(Sender: TObject);
    procedure Incomingnotification1Click(Sender: TObject);
    procedure lvNotificationAreasDblClick(Sender: TObject);
    procedure sbCoComponentClick(Sender: TObject);
    procedure Clickifyouaresure1Click(Sender: TObject);
    procedure lvNotificationAreasEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure setownerfromclipboard1Click(Sender: TObject);
    procedure sbOwnerClick(Sender: TObject);
    procedure Showhintvisualizationcomponent1Click(Sender: TObject);
    procedure sbDATAClick(Sender: TObject);
    procedure edNotificationAddressesKeyPress(Sender: TObject;
      var Key: Char);
    procedure Showobjectlocalmonitor1Click(Sender: TObject);
    procedure sbShowClick(Sender: TObject);
    procedure sbShowGeoGraphServerObjectClick(Sender: TObject);
    procedure sbShowGeoGraphServerClick(Sender: TObject);
    procedure Deviceinitialconfigurationpanel1Click(Sender: TObject);
    procedure sbGeoGraphServerObjectBusinessModelClick(Sender: TObject);
    procedure RegisterserverObject1Click(Sender: TObject);
    procedure sbEditNotificationAddressesClick(Sender: TObject);
    procedure InOutnotification1Click(Sender: TObject);
    procedure Showobjectpanel1Click(Sender: TObject);
    procedure Clickifyouaresure2Click(Sender: TObject);
    procedure Insertitemfromclipboard2Click(Sender: TObject);
    procedure lvObjectDistancesDblClick(Sender: TObject);
    procedure lvObjectDistancesEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure ShowGeoGraphcomponentpanel1Click(Sender: TObject);
    procedure Addmapmarker1Click(Sender: TObject);
    procedure Destroyobject1Click(Sender: TObject);
    procedure Addobjecttotree1Click(Sender: TObject);
  private
    { Private declarations }
    CoComponentName: string;
    UserAlertID: integer;
    UserAlert_Updater: TComponentPresentUpdater;
    OnLineFlagID: integer;
    OnlineFlag_Updater: TComponentPresentUpdater;
    LocationIsAvailableFlagID: integer;
    LocationIsAvailableFlag_Updater: TComponentPresentUpdater;
    UpdateDisableCount: integer;
    Updating: TPanelPropsUpdating;
    ObjectModelsUpdating: TPanelObjectModelsUpdating; 
    ServerObjectController: TGEOGraphServerObjectController;
    ObjectModel: TObjectModel;
    ObjectBusinessModel: TBusinessModel;

    procedure GetModels;
    function GetObjectModel: TObjectModel;
  public
    { Public declarations }
    class function RegisterServerObject(const pidCoComponent: integer): boolean;
    class procedure InitializeDevice(const pidCoComponent: integer);

    Constructor Create(const pidCoComponent: integer); override;
    Destructor Destroy; override;
    procedure _Update; override;
    procedure lvNotificationAreas_Clear;
    procedure lvObjectDistances_Clear;
    procedure DestroyComponent(); override;
    procedure ReloadControlPanel();
  end;


  TNotificationAreaItem = record
    Area: TItemComponentsList;
    AreaName: shortstring;
    AreaType: TNotificationAreaType;
    AreaVisibilityStr: shortstring;
    AreaVisibilityImageIndex: integer;
  end;

  TNotificationAreaList = array of TNotificationAreaItem;

  TObjectDistanceNotificationItem = record
    Notification: TItemComponentsList;
    NotificationName: shortstring;
    NotificationDistance: double;
    NotificationCurrentDistance: Extended;
    NotificationType: TObjectDistanceType;
    NotificationStateStr: shortstring;
    NotificationStateImageIndex: integer;
  end;

  TObjectDistanceNotificationList = array of TObjectDistanceNotificationItem;

  TPanelPropsUpdating = class(TThread)
  private
    PanelProps: TCoGeoMonitorObjectPanelProps;
    PanelPropsName: string;
    idCoComponent: integer;
    //. fields
    CoComponentName: string;
    OwnerName: string;
    GeoGraphServerName: string;
    GeoGraphServerObjectID: integer;
    CoComponentNotificationAddresses: string;
    NotificationAreaList: TNotificationAreaList;
    ObjectDistanceNotificationList: TObjectDistanceNotificationList;
    UserAlertID: integer;
    UserAlert_Active: boolean;
    UserAlert_TimeStamp: TDateTime;
    UserAlert_Severity: integer;
    UserAlert_Description: string;
    OnLineFlagID: integer;
    OnlineFlag: boolean;
    OnlineFlag_SetTimeStamp: TDateTime;
    LocationIsAvailableFlagID: integer;
    LocationIsAvailableFlag: boolean;
    LocationIsAvailableFlag_SetTimeStamp: TDateTime;
    //.
    StageCount: integer;
    CurrentStage: integer;
    Error: Exception;

    Constructor Create(const pPanelProps: TCoGeoMonitorObjectPanelProps);
    Destructor Destroy; override;
    procedure ForceDestroy(); //. for use on process termination
    procedure Execute; override;
    procedure Synchronize(Method: TThreadMethod); reintroduce;
    procedure DoOnStarted;
    procedure DoOnFinished;
    procedure ShowUpdatingStage;
    procedure ShowUpdatingSuccess;
    procedure ShowUpdatingError;
    procedure UpdateName;
    procedure UpdateOwnerName;
    procedure UpdateGeoGraphServerNameAndObjectID;
    procedure UpdateNotificationAddresses;
    procedure UpdateNotificationAreaList;
    procedure UpdateObjectDistanceNotificationList;
    procedure UpdateUserAlert;
    procedure RecreateUserAlertUpdater;
    procedure UpdateOnlineFlag;
    procedure RecreateOnlineFlagUpdater;
    procedure UpdateLocationIsAvailableFlag;
    procedure RecreateLocationIsAvailableFlagUpdater;
    procedure DoTerminate(); override;
    procedure Finalize();
    procedure Cancel();
  end;

implementation
Uses
  Math,
  ActiveX,
  ShellAPI,
  TypesDefines,
  CoFunctionality,
  unitCoGeoMonitorObjectDataPanel,
  unitObjectDistanceNotificationPanel,
  unitAddressesEditor,
  unitGeoObjectAreaNotifier,
  unitGeoGraphServerObjectRegistrationWizard,
  unitCoGeoMonitorObjectTreePanel;

{$R *.dfm}


Constructor TCoGeoMonitorObjectPanelProps.Create(const pidCoComponent: integer);
begin
Inherited Create(pidCoComponent);
ServerObjectController:=nil;
ObjectModel:=nil;
ObjectBusinessModel:=nil;
//.
CoComponentName:='';
UserAlertID:=0;
UserAlert_Updater:=nil;
OnLineFlagID:=0;
OnlineFlag_Updater:=nil;
LocationIsAvailableFlagID:=0;
LocationIsAvailableFlag_Updater:=nil;
//.
UpdateDisableCount:=0;
Updating:=nil;
Update();
end;

Destructor TCoGeoMonitorObjectPanelProps.Destroy;
var
  EC: dword;
begin
if (ObjectModelsUpdating <> nil)
 then begin
  ObjectModelsUpdating.Cancel();
  ObjectModelsUpdating.Panel:=nil;
  if (unitCoComponentRepresentations.flFinalizing) then ObjectModelsUpdating.ForceDestroy();
  ObjectModelsUpdating:=nil;
  end;
//.
if (Updating <> nil)
 then begin
  Updating.Cancel();
  Updating.PanelProps:=nil;
  if (unitCoComponentRepresentations.flFinalizing) then Updating.ForceDestroy();
  Updating:=nil;
  end;
//.
LocationIsAvailableFlag_Updater.Free();
OnlineFlag_Updater.Free();
UserAlert_Updater.Free();
//.
ObjectBusinessModel.Free();
ObjectModel.Free();
ServerObjectController.Free();
//.
lvNotificationAreas_Clear();
lvObjectDistances_Clear();
Inherited;
end;

procedure TCoGeoMonitorObjectPanelProps.GetModels;
var
  idGeoGraphServerObject: integer;
  _GeoGraphServerID: integer;
  _ObjectType: integer;
  _ObjectID: integer;
  _BusinessModel: integer;
begin
FreeAndNil(ObjectBusinessModel);
FreeAndNil(ObjectModel);
FreeAndNil(ServerObjectController);
//.
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
try
GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
finally
Release();
end;
if (NOT ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))) then Exit; //. ->
if ((_ObjectType = 0) OR (_BusinessModel = 0)) then Exit; //. ->
ServerObjectController:=TGEOGraphServerObjectController.Create(idGeoGraphServerObject,_ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
ObjectModel:=TObjectModel.GetModel(_ObjectType,ServerObjectController);
ObjectBusinessModel:=TBusinessModel.GetModel(ObjectModel,_BusinessModel);
finally
Release();
end;
end;

function TCoGeoMonitorObjectPanelProps.GetObjectModel: TObjectModel;
var
  idGeoGraphServerObject: integer;
  _GeoGraphServerID: integer;
  _ObjectID: integer;
  _ObjectType: integer;
  _BusinessModel: integer;
  ServerObjectController: TGEOGraphServerObjectController;
begin
Result:=nil;
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
try
GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
finally
Release();
end;
if (NOT ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))) then Exit; //. ->
if (_ObjectType = 0) then Exit; //. ->
ServerObjectController:=TGEOGraphServerObjectController.Create(idGeoGraphServerObject,_ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
Result:=TObjectModel.GetModel(_ObjectType,ServerObjectController,true);
finally
Release();
end;
end;

procedure TCoGeoMonitorObjectPanelProps.DestroyComponent();
begin
with TTCoGeoMonitorObjectFunctionality.Create() do
try
DestroyInstance(idCoComponent);
finally
Release();
end;
end;

procedure TCoGeoMonitorObjectPanelProps.ReloadControlPanel();
begin
if (ObjectModelsUpdating <> nil)
 then begin
  ObjectModelsUpdating.Cancel();
  ObjectModelsUpdating.Panel:=nil;
  ObjectModelsUpdating:=nil;
  end;
//.
ObjectModelsUpdating:=TPanelObjectModelsUpdating.Create(Self);
end;

procedure TCoGeoMonitorObjectPanelProps._Update;
begin
sbCoComponent.Caption:='component'+'('+IntToStr(idCoComponent)+')';
if (UpdateDisableCount > 0)
 then begin
  Dec(UpdateDisableCount);
  Exit; //. ->
  end;
//. start updating process
if (Updating <> nil)
 then begin
  Updating.Cancel();
  Updating.PanelProps:=nil;
  Updating:=nil;
  end;
Updating:=TPanelPropsUpdating.Create(Self);
//.
if (ObjectModel = nil) then ReloadControlPanel();
end;

procedure TCoGeoMonitorObjectPanelProps.lvNotificationAreas_Clear;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with lvNotificationAreas do begin
for I:=0 to Items.Count-1 do begin      
  ptrRemoveItem:=Items[I].Data;
  FreeMem(ptrRemoveItem,SizeOf(TItemComponentsList));
  end;
Items.Clear;
end;
end;

(*///- obsolete procedure TCoGeoMonitorObjectPanelProps.lvNotificationAreas_Update;
var
  VisualizationType,VisualizationID: integer;
  VisualizationPtr: TPtr;
  InReferences: TComponentsList;
  OutReferences: TComponentsList;
  InOutReferences: TComponentsList;
  idTArea,idArea: integer;
  AreaPtr: TPtr;
  I: integer;
  ptrNewItem: pointer;
begin
with lvNotificationAreas do begin
Items.BeginUpdate;
try
Clear;
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
GetVisualizationComponent(VisualizationType,VisualizationID);
with TBaseVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
try
VisualizationPtr:=Ptr;
finally
Release;
end;
GetInOutNotificationAreaReferences({out} InReferences,OutReferences,InOutReferences);
try
for I:=0 to InOutReferences.Count-1 do with Items.Add do begin
  GetMem(ptrNewItem,SizeOf(TItemComponentsList));
  TItemComponentsList(ptrNewItem^):=TItemComponentsList(InOutReferences[I]^);
  Data:=ptrNewItem;
  try
  with TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(ptrNewItem^).idTComponent,TItemComponentsList(ptrNewItem^).idComponent)) do
  try
  Caption:=Name;
  GetReferencedObject(idTArea,idArea);
  try
  with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTArea,idArea)) do
  try
  AreaPtr:=Ptr;
  finally
  Release;
  end;
  if (ProxySpace__Obj_ObjIsVisibleInside(VisualizationPtr,AreaPtr))
   then begin
    SubItems.Add('In');
    ImageIndex:=1;
    end
   else begin
    SubItems.Add('Out');
    ImageIndex:=0;
    end
  except
    SubItems.Add('error');
    ImageIndex:=-1;
    end;
  SubItems.Add('In/Out notification');
  finally
  Release;
  end;
  except
    Caption:='?';
    SubItems.Clear();
    ImageIndex:=-1;
    end;
  end;
for I:=0 to OutReferences.Count-1 do with Items.Add do begin
  GetMem(ptrNewItem,SizeOf(TItemComponentsList));
  TItemComponentsList(ptrNewItem^):=TItemComponentsList(OutReferences[I]^);
  Data:=ptrNewItem;
  try
  with TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(ptrNewItem^).idTComponent,TItemComponentsList(ptrNewItem^).idComponent)) do
  try
  Caption:=Name;
  GetReferencedObject(idTArea,idArea);
  try
  with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTArea,idArea)) do
  try
  AreaPtr:=Ptr;
  finally
  Release;
  end;
  if (NOT ProxySpace__Obj_ObjIsVisibleInside(VisualizationPtr,AreaPtr))
   then begin
    SubItems.Add('Out');
    ImageIndex:=0;
    end
   else begin
    SubItems.Add('');
    ImageIndex:=-1;
    end;
  except
    SubItems.Add('error');
    ImageIndex:=-1;
    end;
  SubItems.Add('Outgoing notification');
  finally
  Release;
  end;
  except
    Caption:='?';
    SubItems.Clear();
    ImageIndex:=-1;
    end;
  end;
for I:=0 to InReferences.Count-1 do with Items.Add do begin
  GetMem(ptrNewItem,SizeOf(TItemComponentsList));
  TItemComponentsList(ptrNewItem^):=TItemComponentsList(InReferences[I]^);
  Data:=ptrNewItem;
  try
  with TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(ptrNewItem^).idTComponent,TItemComponentsList(ptrNewItem^).idComponent)) do
  try
  Caption:=Name;
  GetReferencedObject(idTArea,idArea);
  try
  with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTArea,idArea)) do
  try
  AreaPtr:=Ptr;
  finally
  Release;
  end;
  if (ProxySpace__Obj_ObjIsVisibleInside(VisualizationPtr,AreaPtr))
   then begin
    SubItems.Add('In');
    ImageIndex:=1;
    end
   else begin
    SubItems.Add('');
    ImageIndex:=-1;
    end
  except
    SubItems.Add('error');
    ImageIndex:=-1;
    end;
  SubItems.Add('Incoming notification');
  finally
  Release;
  end;
  except
    Caption:='?';
    SubItems.Clear();
    ImageIndex:=-1;
    end;
  end;
finally
InReferences.Destroy;
OutReferences.Destroy;
InOutReferences.Destroy;
end;
finally
Release;
end;
finally
Items.EndUpdate;
end;
end;
end;*)

procedure TCoGeoMonitorObjectPanelProps.lvObjectDistances_Clear;
var
  I: integer;
  ptrRemoveItem: pointer;
begin
with lvObjectDistances do begin
for I:=0 to Items.Count-1 do begin      
  ptrRemoveItem:=Items[I].Data;
  FreeMem(ptrRemoveItem,SizeOf(TItemComponentsList));
  end;
Items.Clear;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.Addmapmarker1Click(Sender: TObject);
var
  VisualizationType: integer;
  VisualizationID: integer;
begin
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
GetVisualizationComponent(VisualizationType,VisualizationID);
ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItemDialog(VisualizationType,VisualizationID,edName.Text);
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.Addobjecttotree1Click(Sender: TObject);
var
  TreePanel: TfmCoGeoMonitorObjectTreePanel;
begin
TreePanel:=unitCoGeoMonitorObjectTreePanel.GetTreePanel();
TreePanel.AddNewObject(idCoComponent);
end;

procedure TCoGeoMonitorObjectPanelProps.Copyvisualizationcomponenttotheclipboard1Click(Sender: TObject);
var
  VisualizationType: integer;
  VisualizationID: integer;
begin
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
GetVisualizationComponent(VisualizationType,VisualizationID);
ProxySpace__TypesSystem_SetClipboardComponent(VisualizationType,VisualizationID);
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.sbShowClick(Sender: TObject);
var
  VisualizationType: integer;
  VisualizationID: integer;
begin
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
GetVisualizationComponent(VisualizationType,VisualizationID);
with TBaseVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
try
ProxySpace___TypesSystem__Reflector_ShowObjAtCenter(Ptr);
finally
Release;
end;
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.sbDATAClick(Sender: TObject);
begin
with TfmCoGeoMonitorObjectDataPanel.Create(idCoComponent) do Show();
end;

procedure TCoGeoMonitorObjectPanelProps.sbInfoClick(Sender: TObject);
var
  Msg: string;
  VisualizationType,VisualizationID: integer;
  HintID: integer;
begin
Msg:='';
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
GetVisualizationComponent(VisualizationType,VisualizationID);
Msg:=Msg+#$0D#$0A'Visualization type: '+IntToStr(VisualizationType);
Msg:=Msg+#$0D#$0A'Visualization ID: '+IntToStr(VisualizationID);
if (GetVisualizationHintComponent(HintID))
 then Msg:=Msg+#$0D#$0A'Hint ID: '+IntToStr(HintID)
 else Msg:=Msg+#$0D#$0A'Hint ID: <no hint>';
finally
Release;
end;
Application.MessageBox(PChar(Msg),'Object info');
end;

procedure TCoGeoMonitorObjectPanelProps.sbCoComponentClick(Sender: TObject);
begin
with TComponentFunctionality_Create(idTCoComponent,idCoComponent) do
try
with TPanelProps_Create(false, 0,nil,nilObject) do begin
Position:=poScreenCenter;
Show;
end;
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.Addobjecttothelocalmonitor1Click(Sender: TObject);
begin
if (GeoObjectAreaNotifier <> nil)
 then begin
  GeoObjectAreaNotifier.AddItem(idCoComponent);
  ShowMessage('Object has been added to the local monitor service');
  end;
end;

procedure TCoGeoMonitorObjectPanelProps.edNameKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
  try
  Name:=edName.Text;
  finally
  Release;
  end;
end;

procedure TCoGeoMonitorObjectPanelProps.Showgeoobjectpanel1Click(Sender: TObject);
var
  idTArea,idArea: integer;
  idTOwner,idOwner: integer;
  PP: TForm;
begin
if (lvNotificationAreas.Selected = nil) then Exit; //. ->
with TItemComponentsList(lvNotificationAreas.Selected.Data^) do
with TCoReferenceFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)) do
try
GetReferencedObject(idTArea,idArea);
with TComponentFunctionality_Create(idTArea,idArea) do
try
if (NOT GetOwner(idTOwner,idOwner))
 then begin
  idTOwner:=idTObj;
  idOwner:=GetObjID();
  end
finally
Release;
end;
finally
Release;
end;
PP:=nil;
if (idTOwner = idTCoComponent)
 then
  try
  with FunctionalityImport.TCoComponentFunctionality(TComponentFunctionality_Create(idTOwner,idOwner)) do
  try
  with CoComponentTypesSystem.TCoComponentFunctionality_Create(idCoType,idOwner) do
  try
  PP:=TPropsPanel_Create;
  finally
  Release;
  end;
  finally
  Release;
  end;
  except
    FreeAndNil(PP);
    end;
//.
if (PP <> nil)
 then with PP do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  Show();
  end
 else with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  PP:=TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject));
  with PP do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  Show();
  end;
  finally
  Release;
  end;
end;

procedure TCoGeoMonitorObjectPanelProps.Clickifyouaresure1Click(Sender: TObject);
var
  idTArea,idArea: integer;
begin
if (lvNotificationAreas.Selected = nil) then Exit; //. ->
with TItemComponentsList(lvNotificationAreas.Selected.Data^) do
with TCoReferenceFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)) do
try
GetReferencedObject(idTArea,idArea);
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
RemoveNotificationAreaComponent(idTArea,idArea,TNotificationAreaType(lvNotificationAreas.Selected.SubItems.Objects[1]));
finally
Release;
end;
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.InOutnotification1Click(Sender: TObject);
var
  VisualizationType,VisualizationID: integer;
  VF: TComponentFunctionality;
  idTOwner,idOwner: integer;
  _Name: string;
begin
if (NOT ProxySpace__TypesSystem_GetClipboardComponent(VisualizationType,VisualizationID)) then Exit; //. ->
VF:=TComponentFunctionality_Create(VisualizationType,VisualizationID);
try
if (NOT ObjectIsInheritedFrom(VF,TBaseVisualizationFunctionality)) then Raise Exception.Create('clipboard has a wrong component'); //. =>
if (VF.GetOwner(idTOwner,idOwner))
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  _Name:=Name;
  finally
  Release;
  end
 else _Name:='noname';
finally
VF.Release;
end;
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
AddNotificationAreaComponent(_Name,VisualizationType,VisualizationID,natInOut);
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.Outgoingnotification1Click(Sender: TObject);
var
  VisualizationType,VisualizationID: integer;
  VF: TComponentFunctionality;
  idTOwner,idOwner: integer;
  _Name: string;
begin
if (NOT ProxySpace__TypesSystem_GetClipboardComponent(VisualizationType,VisualizationID)) then Exit; //. ->
VF:=TComponentFunctionality_Create(VisualizationType,VisualizationID);
try
if (NOT ObjectIsInheritedFrom(VF,TBaseVisualizationFunctionality)) then Raise Exception.Create('clipboard has a wrong component'); //. =>
if (VF.GetOwner(idTOwner,idOwner))
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  _Name:=Name;
  finally
  Release;
  end
 else _Name:='noname';
finally
VF.Release;
end;
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
AddNotificationAreaComponent(_Name,VisualizationType,VisualizationID,natOut);
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.Incomingnotification1Click(Sender: TObject);
var
  VisualizationType,VisualizationID: integer;
  VF: TComponentFunctionality;
  idTOwner,idOwner: integer;
  _Name: string;
begin
if (NOT ProxySpace__TypesSystem_GetClipboardComponent(VisualizationType,VisualizationID)) then Exit; //. ->
VF:=TComponentFunctionality_Create(VisualizationType,VisualizationID);
try
if (NOT ObjectIsInheritedFrom(VF,TBaseVisualizationFunctionality)) then Raise Exception.Create('clipboard has a wrong component'); //. =>
if (VF.GetOwner(idTOwner,idOwner))
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  _Name:=Name;
  finally
  Release;
  end
 else _Name:='noname';
finally
VF.Release;
end;
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
AddNotificationAreaComponent(_Name,VisualizationType,VisualizationID,natIn);
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.lvNotificationAreasDblClick(Sender: TObject);
begin
Showgeoobjectpanel1Click(nil);
end;

procedure TCoGeoMonitorObjectPanelProps.lvNotificationAreasEdited(Sender: TObject; Item: TListItem; var S: String);
begin
if (Item.Caption <> S)
 then with TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(Item.Data^).idTComponent,TItemComponentsList(Item.Data^).idComponent)) do
  try
  Name:=S;
  finally
  Release;
  end;
end;

procedure TCoGeoMonitorObjectPanelProps.setownerfromclipboard1Click(Sender: TObject);
var
  idTOwner,idOwner: integer;
begin
if (NOT ProxySpace__TypesSystem_GetClipboardComponent(idTOwner,idOwner)) then Exit; //. ->
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
SetOwner(idTOwner,idOwner);
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.sbOwnerClick(Sender: TObject);
var
  idTOwner,idOwner: integer;
begin
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
if (GetOwner(idTOwner,idOwner))
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Position:=poScreenCenter;
  Show;
  end;
  finally
  Release;
  end
 else Raise Exception.Create('no owner'); //. =>
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.Showhintvisualizationcomponent1Click(Sender: TObject);
var
  HintID: integer;
begin
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
if (GetVisualizationHintComponent(HintID))
 then with TComponentFunctionality_Create(idTHintVisualization,HintID) do
  try
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Position:=poScreenCenter;
  Show;
  end;
  finally
  Release;
  end
 else Raise Exception.Create('no hint-visualization found'); //. =>
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.edNotificationAddressesKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #$0D)
 then with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
  try
  NotificationAddresses:=edNotificationAddresses.Text;
  finally
  Release;
  end;
end;

procedure TCoGeoMonitorObjectPanelProps.Showobjectlocalmonitor1Click(Sender: TObject);
begin
if (GeoObjectAreaNotifierMonitor <> nil) then GeoObjectAreaNotifierMonitor.Show();
end;

procedure TCoGeoMonitorObjectPanelProps.sbShowGeoGraphServerClick(Sender: TObject);
var
  idGeoGraphServerObject: integer;
  _GeoGraphServerID: integer;
begin
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
if (GetGeoGraphServerObject(idGeoGraphServerObject))
 then with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
  try
  _GeoGraphServerID:=GeoGraphServerID;
  if (_GeoGraphServerID <> 0)
   then with TComponentFunctionality_Create(idTGeoGraphServer,_GeoGraphServerID) do
    try
    with TPanelProps_Create(false, 0,nil,nilObject) do begin
    Position:=poScreenCenter;
    Show;
    end;
    finally
    Release;
    end;
  finally
  Release;
  end;
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.sbShowGeoGraphServerObjectClick(Sender: TObject);
var
  idGeoGraphServerObject: integer;
begin
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
if (GetGeoGraphServerObject(idGeoGraphServerObject))
 then with TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject) do
  try
  with TPanelProps_Create(false, 0,nil,nilObject) do begin
  Position:=poScreenCenter;
  Show;
  end;
  finally
  Release;
  end;
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.sbGeoGraphServerObjectBusinessModelClick(Sender: TObject);
var
  CP: TBusinessModelControlPanel;
  Data: TByteArray;
begin
GetModels();
if (ObjectBusinessModel = nil) then Raise Exception.Create('there is no object business model'); //. =>
CP:=ObjectBusinessModel.GetControlPanel();
CP.ObjectName:=CoComponentName;
CP.ObjectCoComponentID:=idCoComponent;
CP.Show();
end;

class function TCoGeoMonitorObjectPanelProps.RegisterServerObject(const pidCoComponent: integer): boolean;
var
  CoGeoMonitorObjectFunctionality: TCoGeoMonitorObjectFunctionality;
  idGeoGraphServerObject: integer;
  VisualizationType: integer;
  VisualizationID: integer;
  UserAlertID: integer;
  OnlineFlagID: integer;
  LocationIsAvailableFlagID: integer;
  ObjectID: integer;
  SC: TCursor;
begin
Result:=false;
CoGeoMonitorObjectFunctionality:=TCoGeoMonitorObjectFunctionality.Create(pidCoComponent);
with CoGeoMonitorObjectFunctionality do
try
if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
GetVisualizationComponent(VisualizationType,VisualizationID);
if (NOT GetUserAlertComponent(UserAlertID)) then UserAlertID:=0;
if (GetOnlineFlagComponent(OnlineFlagID))
 then begin
  if (NOT GetLocationIsAvailableFlagComponent(OnlineFlagID, LocationIsAvailableFlagID)) then LocationIsAvailableFlagID:=0;
  end
 else begin
  OnlineFlagID:=0;
  LocationIsAvailableFlagID:=0;
  end;
with TfmGeoGraphServerObjectRegistrationWizard.Create(idGeoGraphServerObject,Name,VisualizationType,VisualizationID,UserAlertID,OnlineFlagID,LocationIsAvailableFlagID) do
try
if (AllStepsArePassed())
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  ObjectID:=ConstructObject();
  Result:=true;
  finally
  Screen.Cursor:=SC;
  end;
  //. set new object name
  CoGeoMonitorObjectFunctionality.Name:='Object#'+IntToStr(idGeoGraphServer)+'.'+IntToStr(ObjectID);
  //. else notify update operation
  ///- not needed because of up statement TComponentFunctionality(CoGeoMonitorObjectFunctionality.CoComponentFunctionality).NotifyOnComponentUpdate();
  //.
  {///? if (MessageDlg('Object has been registered successfully on GeoGraphServer, (OID: '+IntToStr(ObjectID)+')'#$0D#$0A'Do you want to initialize object device ?', mtInformation, [mbYes,mbNo], 0) = mrYes)
   then InitializeDevice(pidCoComponent);}
  MessageDlg('Object has been registered successfully on GeoGraphServer, (OID: '+IntToStr(ObjectID)+')', mtInformation, [mbOk], 0);
  InitializeDevice(pidCoComponent);
  end;
finally
Destroy;
end;
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.RegisterserverObject1Click(Sender: TObject);
begin
if (RegisterServerObject(idCoComponent)) then ReloadControlPanel();
end;

class procedure TCoGeoMonitorObjectPanelProps.InitializeDevice(const pidCoComponent: integer);
var
  idGeoGraphServerObject: integer;
  _GeoGraphServerID: integer;
  _ObjectID: integer;
  _ObjectType: integer;
  _BusinessModel: integer;
  ServerObjectController: TGEOGraphServerObjectController;
  ObjectModel: TObjectModel;
  ObjectBusinessModel: TBusinessModel;
  DeviceInitializerPanel: TBusinessModelDeviceInitializerPanel;
begin
with TCoGeoMonitorObjectFunctionality.Create(pidCoComponent) do
try
if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
try
GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
finally
Release;
end;
if (NOT ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))) then Raise Exception.Create('object is not registered on GeographServer'); //. =>
if (_ObjectType = 0) then Raise Exception.Create('object type is unknown'); //. =>
if (_BusinessModel = 0) then Raise Exception.Create('object business type is unknown'); //. =>
ServerObjectController:=TGEOGraphServerObjectController.Create(idGeoGraphServerObject,_ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
ObjectModel:=TObjectModel.GetModel(_ObjectType,ServerObjectController,true);
ObjectBusinessModel:=TBusinessModel.GetModel(ObjectModel,_BusinessModel);
DeviceInitializerPanel:=ObjectBusinessModel.CreateDeviceInitializerPanel();
if (DeviceInitializerPanel = nil) then Raise Exception.Create('Device Initializer panel does not exist'); //. =>
with DeviceInitializerPanel do
try
ShowModal();
finally
Destroy;
end;
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.Deviceinitialconfigurationpanel1Click(Sender: TObject);
begin
InitializeDevice(idCoComponent);
end;

procedure TCoGeoMonitorObjectPanelProps.sbEditNotificationAddressesClick(Sender: TObject);
var
  SC: TCursor;
  Addresses: string;
begin
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
SC:=Screen.Cursor;
try
Screen.Cursor:=crHourGlass;
Addresses:=NotificationAddresses;
finally
Screen.Cursor:=SC;
end;
//.
with TfmAddressesEditor.Create() do
try
if (Edit(Addresses))
 then begin
  SC:=Screen.Cursor;
  try
  Screen.Cursor:=crHourGlass;
  NotificationAddresses:=Addresses;
  finally
  Screen.Cursor:=SC;
  end;
  end;
finally
Destroy;
end;
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.Showobjectpanel1Click(Sender: TObject);
var
  idTObjectVisualization,idObjectVisualization: integer;
  idTOwner,idOwner: integer;
  PP: TForm;
begin
if (lvObjectDistances.Selected = nil) then Exit; //. ->
with TItemComponentsList(lvObjectDistances.Selected.Data^) do
with TCoReferenceFunctionality(TComponentFunctionality_Create(idTComponent,idComponent)) do
try
GetReferencedObject(idTObjectVisualization,idObjectVisualization);
with TComponentFunctionality_Create(idTObjectVisualization,idObjectVisualization) do
try
if (NOT GetOwner(idTOwner,idOwner))
 then begin
  idTOwner:=idTObj;
  idOwner:=GetObjID();
  end
finally
Release;
end;
finally
Release;
end;
PP:=nil;
if (idTOwner = idTCoComponent)
 then
  try
  with FunctionalityImport.TCoComponentFunctionality(TComponentFunctionality_Create(idTOwner,idOwner)) do
  try
  with CoComponentTypesSystem.TCoComponentFunctionality_Create(idCoType,idOwner) do
  try
  PP:=TPropsPanel_Create;
  finally
  Release;
  end;
  finally
  Release;
  end;
  except
    FreeAndNil(PP);
    end;
//.
if (PP <> nil)
 then with PP do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  Show();
  end
 else with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  PP:=TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject));
  with PP do begin
  Left:=Round((Screen.Width-Width)/2);
  Top:=Screen.Height-Height-20;
  Show();
  end;
  finally
  Release;
  end;
end;

procedure TCoGeoMonitorObjectPanelProps.Clickifyouaresure2Click(Sender: TObject);
var
  idTObjectVisualization,idObjectVisualization: integer;
begin
if (lvObjectDistances.Selected = nil) then Exit; //. ->
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
RemoveObjectDistanceComponent(TItemComponentsList(lvObjectDistances.Selected.Data^).idComponent);
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.Insertitemfromclipboard2Click(Sender: TObject);
var
  ObjectVisualizationType,ObjectVisualizationID: integer;
  VF: TComponentFunctionality;
  idTOwner,idOwner: integer;
  _Name: string;
  VisualizationType,VisualizationID: integer;
  BA: TByteArray;
  BAPtr: pointer;
  NodesCount: integer;
  X0,Y0,X1,Y1: double;
  D: Extended;
  Scale: double;
  ObjectDistanceType: TObjectDistanceType;
  Distance: double;
begin
if (NOT ProxySpace__TypesSystem_GetClipboardComponent(ObjectVisualizationType,ObjectVisualizationID)) then Exit; //. ->
VF:=TComponentFunctionality_Create(ObjectVisualizationType,ObjectVisualizationID);
try
if (NOT ObjectIsInheritedFrom(VF,TBaseVisualizationFunctionality)) then Raise Exception.Create('clipboard has a wrong component'); //. =>
if (VF.GetOwner(idTOwner,idOwner))
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  _Name:=Name;
  finally
  Release;
  end
 else _Name:='noname';
finally
VF.Release;
end;
//. get nodes and calculate scale
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
GetVisualizationComponent(VisualizationType,VisualizationID);
with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
try
GetNodes(BA);
BAPtr:=Pointer(@BA[0]);
NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
if (NodesCount < 2) then Raise Exception.Create('Visualization nodes number are less than 2'); //. =>
X0:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X0));
Y0:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y0));
X1:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X1));
Y1:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y1));
finally
Release;
end;
finally
Release;
end;
//.
GetModels();
if (ObjectModel <> nil)
 then begin
  ObjectModel.ObjectSchema.RootComponent.LoadAll();
  with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,ObjectModel.ObjectGeoSpaceID())) do
  try
  if (GetDistanceBetweenTwoXYPointsLocally(X0,Y0,X1,Y1,{out} D))
   then Scale:=(Sqrt(sqr(X1-X0)+sqr(Y1-Y0))/D)
   else Scale:=-1.0;
  finally
  Release;
  end;
  end
 else Raise Exception.Create('there is no object model'); //. =>
//.
ObjectDistanceType:=odtMinMax;
Distance:=100.0; //. 100 meters default
//.
with TfmObjectDistanceNotificationPanel.Create() do
try
if (NOT Dialog({ref} ObjectDistanceType,{ref} Distance)) then Exit; //. ->
finally
Destroy;
end;
Distance:=Distance*Scale;
//.
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
AddObjectDistanceComponent(_Name,ObjectVisualizationType,ObjectVisualizationID,ObjectDistanceType,Distance);
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.lvObjectDistancesDblClick(Sender: TObject);
begin
Showobjectpanel1Click(nil);
end;

procedure TCoGeoMonitorObjectPanelProps.lvObjectDistancesEdited(Sender: TObject; Item: TListItem; var S: String);
begin
if (Item.Caption <> S)
 then with TCoReferenceFunctionality(TComponentFunctionality_Create(TItemComponentsList(Item.Data^).idTComponent,TItemComponentsList(Item.Data^).idComponent)) do
  try
  Name:=S;
  finally
  Release;
  end;
end;

procedure TCoGeoMonitorObjectPanelProps.ShowGeoGraphcomponentpanel1Click(Sender: TObject);
var
  idGeoGraphServerObject: integer;
begin
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
GetGeoGraphServerComponent({out} idGeoGraphServerObject);
finally
Release;
end;
//.
with TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject) do
try
with TAbstractSpaceObjPanelProps(TPanelProps_Create(false, 0,nil,nilObject)) do begin
Left:=Round((Screen.Width-Width)/2);
Top:=Screen.Height-Height-20;
Show();
end;
finally
Release;
end;
end;

procedure TCoGeoMonitorObjectPanelProps.Destroyobject1Click(Sender: TObject);
begin
if (MessageDlg('Do you want to destroy this object ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes)
 then DestroyComponent();
end;


{TPanelPropsUpdating}
Constructor TPanelPropsUpdating.Create(const pPanelProps: TCoGeoMonitorObjectPanelProps);
begin
PanelProps:=pPanelProps;
PanelPropsName:='Geo monitor object';
idCoComponent:=PanelProps.idCoComponent;
//.
UserAlertID:=0;
OnlineFlagID:=0;
LocationIsAvailableFlagID:=0;
StageCount:=9;
CurrentStage:=-1;
//.
Error:=nil;
//.
FreeOnTerminate:=true;
Inherited Create(false);
end;

Destructor TPanelPropsUpdating.Destroy;
begin
Cancel();
Inherited;
end;

procedure TPanelPropsUpdating.ForceDestroy();
begin
TerminateThread(Handle,0);
Destroy();
end;

procedure TPanelPropsUpdating.Execute;

  function GetObjectModel: TObjectModel;
  var
    idGeoGraphServerObject: integer;
    _GeoGraphServerID: integer;
    _ObjectID: integer;
    _ObjectType: integer;
    _BusinessModel: integer;
    ServerObjectController: TGEOGraphServerObjectController;
  begin
  Result:=nil;
  with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
  try
  if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
  with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
  try
  GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
  finally
  Release;
  end;
  if (NOT ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))) then Exit; //. ->
  if (_ObjectType = 0) then Exit; //. ->
  ServerObjectController:=TGEOGraphServerObjectController.Create(idGeoGraphServerObject,_ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
  Result:=TObjectModel.GetModel(_ObjectType,ServerObjectController,true);
  finally
  Release;
  end;
  end;

  procedure GetNotificationAreaList(out AreasList: TNotificationAreaList);
  var
    VisualizationType,VisualizationID: integer;
    VisualizationPtr: TPtr;
    InReferences: TComponentsList;
    OutReferences: TComponentsList;
    InOutReferences: TComponentsList;
    AreasListCount: integer;
    idTArea,idArea: integer;
    AreaPtr: TPtr;
    I: integer;
  begin
  SetLength(AreasList,0);
  try
  with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
  try
  GetVisualizationComponent(VisualizationType,VisualizationID);
  with TBaseVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
  try
  VisualizationPtr:=Ptr;
  finally
  Release;
  end;
  GetInOutNotificationAreaReferences({out} InReferences,OutReferences,InOutReferences);
  try
  AreasListCount:=InOutReferences.Count+OutReferences.Count+InReferences.Count;
  SetLength(AreasList,AreasListCount);
  AreasListCount:=0;
  for I:=0 to InOutReferences.Count-1 do begin
    AreasList[AreasListCount].Area:=TItemComponentsList(InOutReferences[I]^);
    try
    with TCoReferenceFunctionality(TComponentFunctionality_Create(AreasList[AreasListCount].Area.idTComponent,AreasList[AreasListCount].Area.idComponent)) do
    try
    AreasList[AreasListCount].AreaName:=Name;
    GetReferencedObject(idTArea,idArea);
    try
    with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTArea,idArea)) do
    try
    AreaPtr:=Ptr;
    finally
    Release;
    end;
    if (ProxySpace__Obj_ObjIsVisibleInside(VisualizationPtr,AreaPtr))
     then begin
      AreasList[AreasListCount].AreaVisibilityStr:='In';
      AreasList[AreasListCount].AreaVisibilityImageIndex:=1;
      end
     else begin
      AreasList[AreasListCount].AreaVisibilityStr:='Out';
      AreasList[AreasListCount].AreaVisibilityImageIndex:=0;
      end
    except
      AreasList[AreasListCount].AreaVisibilityStr:='error';
      AreasList[AreasListCount].AreaVisibilityImageIndex:=-1;
      end;
    AreasList[AreasListCount].AreaType:=natInOut;
    finally
    Release;
    end;
    except
      AreasList[AreasListCount].AreaName:='?';
      AreasList[AreasListCount].AreaVisibilityStr:='';
      AreasList[AreasListCount].AreaVisibilityImageIndex:=-1;
      AreasList[AreasListCount].AreaType:=natUnknown;
      end;
    Inc(AreasListCount);
    end;
  for I:=0 to OutReferences.Count-1 do begin
    AreasList[AreasListCount].Area:=TItemComponentsList(OutReferences[I]^);
    try
    with TCoReferenceFunctionality(TComponentFunctionality_Create(AreasList[AreasListCount].Area.idTComponent,AreasList[AreasListCount].Area.idComponent)) do
    try
    AreasList[AreasListCount].AreaName:=Name;
    GetReferencedObject(idTArea,idArea);
    try
    with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTArea,idArea)) do
    try
    AreaPtr:=Ptr;
    finally
    Release;
    end;
    if (NOT ProxySpace__Obj_ObjIsVisibleInside(VisualizationPtr,AreaPtr))
     then begin
      AreasList[AreasListCount].AreaVisibilityStr:='Out';
      AreasList[AreasListCount].AreaVisibilityImageIndex:=0;
      end
     else begin
      AreasList[AreasListCount].AreaVisibilityStr:='';
      AreasList[AreasListCount].AreaVisibilityImageIndex:=-1;
      end;
    except
      AreasList[AreasListCount].AreaVisibilityStr:='error';
      AreasList[AreasListCount].AreaVisibilityImageIndex:=-1;
      end;
    AreasList[AreasListCount].AreaType:=natOut;
    finally
    Release;
    end;
    except
      AreasList[AreasListCount].AreaName:='?';
      AreasList[AreasListCount].AreaVisibilityStr:='';
      AreasList[AreasListCount].AreaVisibilityImageIndex:=-1;
      AreasList[AreasListCount].AreaType:=natUnknown;
      end;
    Inc(AreasListCount);
    end;
  for I:=0 to InReferences.Count-1 do begin
    AreasList[AreasListCount].Area:=TItemComponentsList(InReferences[I]^);
    try
    with TCoReferenceFunctionality(TComponentFunctionality_Create(AreasList[AreasListCount].Area.idTComponent,AreasList[AreasListCount].Area.idComponent)) do
    try
    AreasList[AreasListCount].AreaName:=Name;
    GetReferencedObject(idTArea,idArea);
    try
    with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTArea,idArea)) do
    try
    AreaPtr:=Ptr;
    finally
    Release;
    end;
    if (ProxySpace__Obj_ObjIsVisibleInside(VisualizationPtr,AreaPtr))
     then begin
      AreasList[AreasListCount].AreaVisibilityStr:='In';
      AreasList[AreasListCount].AreaVisibilityImageIndex:=1;
      end
     else begin
      AreasList[AreasListCount].AreaVisibilityStr:='';
      AreasList[AreasListCount].AreaVisibilityImageIndex:=-1;
      end
    except
      AreasList[AreasListCount].AreaVisibilityStr:='error';
      AreasList[AreasListCount].AreaVisibilityImageIndex:=-1;
      end;
    AreasList[AreasListCount].AreaType:=natIn;
    finally
    Release;
    end;
    except
      AreasList[AreasListCount].AreaName:='?';
      AreasList[AreasListCount].AreaVisibilityStr:='';
      AreasList[AreasListCount].AreaVisibilityImageIndex:=-1;
      AreasList[AreasListCount].AreaType:=natUnknown;
      end;
    Inc(AreasListCount);
    end;
  finally
  InReferences.Destroy;
  OutReferences.Destroy;
  InOutReferences.Destroy;
  end;
  finally
  Release;
  end;
  except
    SetLength(AreasList,0);
    Raise; //. =>
    end;
  end;

  procedure GetObjectDistanceNotificationList(out NotificationsList: TObjectDistanceNotificationList);
  var
    VisualizationType,VisualizationID: integer;
    Visualization_Xc,Visualization_Yc: Extended;
    BA: TByteArray;
    BAPtr: pointer;
    NodesCount: integer;
    X0,Y0,X1,Y1: double;
    D: Extended;
    Scale: double;
    ObjectMinDistanceReferences: TComponentsList;
    ObjectMaxDistanceReferences: TComponentsList;
    ObjectMinMaxDistanceReferences: TComponentsList;
    NotificationsListCount: integer;
    ObjectVisualizationType,ObjectVisualizationID: integer;
    ObjectVisualizationDistance: double;
    ObjectVisualization_Xc,ObjectVisualization_Yc: Extended;
    I: integer;
    ObjectModel: TObjectModel;
  begin
  SetLength(NotificationsList,0);
  try
  ObjectModel:=GetObjectModel();
  try
  with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
  try
  GetVisualizationComponent(VisualizationType,VisualizationID);
  with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(VisualizationType,VisualizationID)) do
  try
  GetNodes(BA);
  BAPtr:=Pointer(@BA[0]);
  NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
  if (NodesCount < 2) then Raise Exception.Create('Visualization nodes number are less than 2'); //. =>
  X0:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X0));
  Y0:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y0));
  X1:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X1));
  Y1:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y1));
  Visualization_Xc:=X0;
  Visualization_Yc:=Y0;
  finally
  Release;
  end;
  if (ObjectModel <> nil)
   then begin
    ObjectModel.ObjectSchema.RootComponent.LoadAll();
    with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,ObjectModel.ObjectGeoSpaceID())) do
    try
    if (GetDistanceBetweenTwoXYPointsLocally(X0,Y0,X1,Y1,{out} D))
     then Scale:=(D/Sqrt(sqr(X1-X0)+sqr(Y1-Y0)))
     else Scale:=-1.0;
    finally
    Release;
    end;
    end
   else Exit; //. ->
  //.
  GetObjectDistanceReferences({out} ObjectMinDistanceReferences,{out} ObjectMaxDistanceReferences,{out} ObjectMinMaxDistanceReferences);
  try
  NotificationsListCount:=ObjectMinDistanceReferences.Count+ObjectMaxDistanceReferences.Count+ObjectMinMaxDistanceReferences.Count;
  SetLength(NotificationsList,NotificationsListCount);
  NotificationsListCount:=0;
  //.
  for I:=0 to ObjectMinMaxDistanceReferences.Count-1 do begin
    NotificationsList[NotificationsListCount].Notification:=TItemComponentsList(ObjectMinMaxDistanceReferences[I]^);
    try
    if (NOT GetObjectDistanceReferenceDoubleVarDistance(NotificationsList[NotificationsListCount].Notification.idComponent,{out} NotificationsList[NotificationsListCount].NotificationDistance))
     then Exception.Create('GetObjectDistanceNotificationList: there is no distance threshold component'); //. =>
    NotificationsList[NotificationsListCount].NotificationDistance:=NotificationsList[NotificationsListCount].NotificationDistance*Scale;
    //.
    with TCoReferenceFunctionality(TComponentFunctionality_Create(NotificationsList[NotificationsListCount].Notification.idTComponent,NotificationsList[NotificationsListCount].Notification.idComponent)) do
    try
    NotificationsList[NotificationsListCount].NotificationName:=Name;
    GetReferencedObject({out} ObjectVisualizationType,ObjectVisualizationID);
    try
    with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(ObjectVisualizationType,ObjectVisualizationID)) do
    try
    GetNodes(BA);
    BAPtr:=Pointer(@BA[0]);
    NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
    if (NodesCount < 2) then Raise Exception.Create('Visualization nodes number are less than 2'); //. =>
    X0:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X0));
    Y0:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y0));
    ObjectVisualization_Xc:=X0;
    ObjectVisualization_Yc:=Y0;
    finally
    Release;
    end;
    //.
    with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,ObjectModel.ObjectGeoSpaceID())) do
    try
    if (NOT GetDistanceBetweenTwoXYPointsLocally(Visualization_Xc,Visualization_Yc,ObjectVisualization_Xc,ObjectVisualization_Yc,{out} NotificationsList[NotificationsListCount].NotificationCurrentDistance))
     then Raise Exception.Create('could not get current distance between objects'); //. =>
    finally
    Release;
    end;
    //.
    if (NotificationsList[NotificationsListCount].NotificationCurrentDistance <= NotificationsList[NotificationsListCount].NotificationDistance)
     then begin
      NotificationsList[NotificationsListCount].NotificationStateStr:='In';
      NotificationsList[NotificationsListCount].NotificationStateImageIndex:=1;
      end
     else begin
      NotificationsList[NotificationsListCount].NotificationStateStr:='Out';
      NotificationsList[NotificationsListCount].NotificationStateImageIndex:=0;
      end
    except
      NotificationsList[NotificationsListCount].NotificationStateStr:='error';
      NotificationsList[NotificationsListCount].NotificationStateImageIndex:=-1;
      end;
    NotificationsList[NotificationsListCount].NotificationType:=odtMinMax;
    finally
    Release;
    end;
    except
      NotificationsList[NotificationsListCount].NotificationName:='?';
      NotificationsList[NotificationsListCount].NotificationStateStr:='';
      NotificationsList[NotificationsListCount].NotificationStateImageIndex:=-1;
      NotificationsList[NotificationsListCount].NotificationType:=odtUnknown;
      end;
    Inc(NotificationsListCount);
    end;
  for I:=0 to ObjectMinDistanceReferences.Count-1 do begin
    NotificationsList[NotificationsListCount].Notification:=TItemComponentsList(ObjectMinDistanceReferences[I]^);
    try
    if (NOT GetObjectDistanceReferenceDoubleVarDistance(NotificationsList[NotificationsListCount].Notification.idComponent,{out} NotificationsList[NotificationsListCount].NotificationDistance))
     then Exception.Create('GetObjectDistanceNotificationList: there is no distance threshold component'); //. =>
    NotificationsList[NotificationsListCount].NotificationDistance:=NotificationsList[NotificationsListCount].NotificationDistance*Scale;
    //.
    with TCoReferenceFunctionality(TComponentFunctionality_Create(NotificationsList[NotificationsListCount].Notification.idTComponent,NotificationsList[NotificationsListCount].Notification.idComponent)) do
    try
    NotificationsList[NotificationsListCount].NotificationName:=Name;
    GetReferencedObject({out} ObjectVisualizationType,ObjectVisualizationID);
    try
    with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(ObjectVisualizationType,ObjectVisualizationID)) do
    try
    GetNodes(BA);
    BAPtr:=Pointer(@BA[0]);
    NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
    if (NodesCount < 2) then Raise Exception.Create('Visualization nodes number are less than 2'); //. =>
    X0:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X0));
    Y0:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y0));
    ObjectVisualization_Xc:=X0;
    ObjectVisualization_Yc:=Y0;
    finally
    Release;
    end;
    //.
    with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,ObjectModel.ObjectGeoSpaceID())) do
    try
    if (NOT GetDistanceBetweenTwoXYPointsLocally(Visualization_Xc,Visualization_Yc,ObjectVisualization_Xc,ObjectVisualization_Yc,{out} NotificationsList[NotificationsListCount].NotificationCurrentDistance))
     then Raise Exception.Create('could not get current distance between objects'); //. =>
    finally
    Release;
    end;
    //.
    if (NotificationsList[NotificationsListCount].NotificationCurrentDistance <= NotificationsList[NotificationsListCount].NotificationDistance)
     then begin
      NotificationsList[NotificationsListCount].NotificationStateStr:='In';
      NotificationsList[NotificationsListCount].NotificationStateImageIndex:=1;
      end
     else begin
      NotificationsList[NotificationsListCount].NotificationStateStr:='';
      NotificationsList[NotificationsListCount].NotificationStateImageIndex:=-1;
      end
    except
      NotificationsList[NotificationsListCount].NotificationStateStr:='error';
      NotificationsList[NotificationsListCount].NotificationStateImageIndex:=-1;
      end;
    NotificationsList[NotificationsListCount].NotificationType:=odtMin;
    finally
    Release;
    end;
    except
      NotificationsList[NotificationsListCount].NotificationName:='?';
      NotificationsList[NotificationsListCount].NotificationStateStr:='';
      NotificationsList[NotificationsListCount].NotificationStateImageIndex:=-1;
      NotificationsList[NotificationsListCount].NotificationType:=odtUnknown;
      end;
    Inc(NotificationsListCount);
    end;
  for I:=0 to ObjectMaxDistanceReferences.Count-1 do begin
    NotificationsList[NotificationsListCount].Notification:=TItemComponentsList(ObjectMaxDistanceReferences[I]^);
    try
    if (NOT GetObjectDistanceReferenceDoubleVarDistance(NotificationsList[NotificationsListCount].Notification.idComponent,{out} NotificationsList[NotificationsListCount].NotificationDistance))
     then Exception.Create('GetObjectDistanceNotificationList: there is no distance threshold component'); //. =>
    NotificationsList[NotificationsListCount].NotificationDistance:=NotificationsList[NotificationsListCount].NotificationDistance*Scale;
    //.
    with TCoReferenceFunctionality(TComponentFunctionality_Create(NotificationsList[NotificationsListCount].Notification.idTComponent,NotificationsList[NotificationsListCount].Notification.idComponent)) do
    try
    NotificationsList[NotificationsListCount].NotificationName:=Name;
    GetReferencedObject({out} ObjectVisualizationType,ObjectVisualizationID);
    try
    with TBase2DVisualizationFunctionality(TComponentFunctionality_Create(ObjectVisualizationType,ObjectVisualizationID)) do
    try
    GetNodes(BA);
    BAPtr:=Pointer(@BA[0]);
    NodesCount:=Integer(BAPtr^); Inc(Integer(BAPtr),SizeOf(NodesCount));
    if (NodesCount < 2) then Raise Exception.Create('Visualization nodes number are less than 2'); //. =>
    X0:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(X0));
    Y0:=Double(BAPtr^); Inc(Integer(BAPtr),SizeOf(Y0));
    ObjectVisualization_Xc:=X0;
    ObjectVisualization_Yc:=Y0;
    finally
    Release;
    end;
    //.
    with TGeoSpaceFunctionality(TComponentFunctionality_Create(idTGeoSpace,ObjectModel.ObjectGeoSpaceID())) do
    try
    if (NOT GetDistanceBetweenTwoXYPointsLocally(Visualization_Xc,Visualization_Yc,ObjectVisualization_Xc,ObjectVisualization_Yc,{out} NotificationsList[NotificationsListCount].NotificationCurrentDistance))
     then Raise Exception.Create('could not get current distance between objects'); //. =>
    finally
    Release;
    end;
    //.
    if (NotificationsList[NotificationsListCount].NotificationCurrentDistance <= NotificationsList[NotificationsListCount].NotificationDistance)
     then begin
      NotificationsList[NotificationsListCount].NotificationStateStr:='';
      NotificationsList[NotificationsListCount].NotificationStateImageIndex:=-1;
      end
     else begin
      NotificationsList[NotificationsListCount].NotificationStateStr:='out';
      NotificationsList[NotificationsListCount].NotificationStateImageIndex:=0;
      end
    except
      NotificationsList[NotificationsListCount].NotificationStateStr:='error';
      NotificationsList[NotificationsListCount].NotificationStateImageIndex:=-1;
      end;
    NotificationsList[NotificationsListCount].NotificationType:=odtMax;
    finally
    Release;
    end;
    except
      NotificationsList[NotificationsListCount].NotificationName:='?';
      NotificationsList[NotificationsListCount].NotificationStateStr:='';
      NotificationsList[NotificationsListCount].NotificationStateImageIndex:=-1;
      NotificationsList[NotificationsListCount].NotificationType:=odtUnknown;
      end;
    Inc(NotificationsListCount);
    end;
  finally
  ObjectMinDistanceReferences.Destroy;
  ObjectMaxDistanceReferences.Destroy;
  ObjectMinMaxDistanceReferences.Destroy;
  end;
  finally
  Release;
  end;
  finally
  ObjectModel.Free;
  end;
  except
    SetLength(NotificationsList,0);
    Raise; //. =>
    end;
  end;

var
  idTOwner,idOwner: integer;
  idGeoGraphServerObject: integer;
  _GeoGraphServerID: integer;
  _ObjectID: integer;
  CF: TComponentFunctionality;
begin
//. initilize fields to defaults
CoComponentName:='?';
OwnerName:='?';
GeoGraphServerName:='?';
GeoGraphServerObjectID:=0;
CoComponentNotificationAddresses:='';
SetLength(NotificationAreaList,0);
SetLength(ObjectDistanceNotificationList,0);
try
Synchronize(DoOnStarted);
try
try
//. CoComponentName
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
CoComponentName:=Name;
if (Terminated) then Exit; //. ->
//.
Synchronize(UpdateName);
if (Terminated) then Exit; //. ->
//. OwnerName
if (GetOwner(idTOwner,idOwner))
 then with TComponentFunctionality_Create(idTOwner,idOwner) do
  try
  OwnerName:=Name;
  finally
  Release;
  end
 else OwnerName:='no owner';
if (Terminated) then Exit; //. ->
//.
Synchronize(UpdateOwnerName);
if (Terminated) then Exit; //. ->
//. OnlineFlag
if (NOT GetOnlineFlagComponent(OnlineFlagID)) then OnlineFlagID:=0;
//. LocationIsAvailableFlag
if ((OnlineFlagID <> 0) AND (NOT GetLocationIsAvailableFlagComponent(OnlineFlagID,LocationIsAvailableFlagID))) then LocationIsAvailableFlagID:=0;
if (Terminated) then Exit; //. ->
//.
Synchronize(RecreateOnlineFlagUpdater);
if (Terminated) then Exit; //. ->
//.
if (OnlineFlagID <> 0)
 then with TBoolVarFunctionality(TComponentFunctionality_Create(idTBoolVar,OnlineFlagID)) do
  try
  OnlineFlag:=Value;
  OnlineFlag_SetTimeStamp:=SetTimeStamp{///- +TimeZoneDelta};
  finally
  Release;
  end;
if (Terminated) then Exit; //. ->
//.
Synchronize(UpdateOnlineFlag);
if (Terminated) then Exit; //. ->
//.
Synchronize(RecreateLocationIsAvailableFlagUpdater);
if (Terminated) then Exit; //. ->
//.
if (LocationIsAvailableFlagID <> 0)
 then with TBoolVarFunctionality(TComponentFunctionality_Create(idTBoolVar,LocationIsAvailableFlagID)) do
  try
  LocationIsAvailableFlag:=Value;
  LocationIsAvailableFlag_SetTimeStamp:=SetTimeStamp{///- +TimeZoneDelta};
  finally
  Release;
  end;
if (Terminated) then Exit; //. ->
//.
Synchronize(UpdateLocationIsAvailableFlag);
if (Terminated) then Exit; //. ->
//.
Synchronize(RecreateUserAlertUpdater);
if (Terminated) then Exit; //. ->
//. UserAlert
if (NOT GetUserAlertComponent(UserAlertID)) then UserAlertID:=0;
if (Terminated) then Exit; //. ->
//.
if (UserAlertID <> 0)
 then with TUserAlertFunctionality(TComponentFunctionality_Create(idTUserAlert,UserAlertID)) do
  try
  UserAlert_Active:=Active;
  UserAlert_TimeStamp:=TimeStamp{///- +TimeZoneDelta};
  UserAlert_Severity:=Severity;
  UserAlert_Description:=Description;
  finally
  Release;
  end;
if (Terminated) then Exit; //. ->
//.
Synchronize(UpdateUserAlert);
if (Terminated) then Exit; //. ->
//. GeoGraphServerObject
if (GetGeoGraphServerObject(idGeoGraphServerObject))
 then begin
  with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
  try
  _GeoGraphServerID:=GeoGraphServerID;
  _ObjectID:=ObjectID;
  if ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))
   then begin
    CF:=TComponentFunctionality_Create(idTGeoGraphServer,_GeoGraphServerID);
    try
    GeoGraphServerName:=CF.Name+' ('+IntToStr(CF.GetObjID())+')';
    finally
    CF.Release;
    end;
    GeoGraphServerObjectID:=_ObjectID;
    end
   else begin
    GeoGraphServerName:='';
    GeoGraphServerObjectID:=0;
    end;
  finally
  Release;
  end;
  end
 else begin
  GeoGraphServerName:='';
  GeoGraphServerObjectID:=0;
  end;
if (Terminated) then Exit; //. ->
//.
Synchronize(UpdateGeoGraphServerNameAndObjectID);
if (Terminated) then Exit; //. ->
//. NotificationAddresses
CoComponentNotificationAddresses:=NotificationAddresses;
if (Terminated) then Exit; //. ->
//.
Synchronize(UpdateNotificationAddresses);
if (Terminated) then Exit; //. ->
//. NotificationAreaList
GetNotificationAreaList({out} NotificationAreaList);
if (Terminated) then Exit; //. ->
//.
Synchronize(UpdateNotificationAreaList);
if (Terminated) then Exit; //. ->
//. ObjectDistanceNotificationList
GetObjectDistanceNotificationList({out} ObjectDistanceNotificationList);
if (Terminated) then Exit; //. ->
//.
Synchronize(UpdateObjectDistanceNotificationList);
if (Terminated) then Exit; //. ->
//. done
Synchronize(ShowUpdatingSuccess);
finally
Release;
end;
except
  On E: Exception do begin
    Error:=E;
    Synchronize(ShowUpdatingError);
    Raise; //. =>
    end;
  end;
finally
Synchronize(DoOnFinished);
end;                                               
finally
//. finalize fields
CoComponentName:='';
OwnerName:='';
GeoGraphServerName:='';
GeoGraphServerObjectID:=0;
CoComponentNotificationAddresses:='';
SetLength(NotificationAreaList,0);
SetLength(ObjectDistanceNotificationList,0);
end;
end;

procedure TPanelPropsUpdating.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;

procedure TPanelPropsUpdating.DoOnStarted;
begin
if (Terminated) then Exit; //. ->
PanelProps.Image.Enabled:=false;
PanelProps.edName.Enabled:=false;
PanelProps.sbOwner.Enabled:=false;
PanelProps.sbGeoGraphServerObjectBusinessModel.Enabled:=false;
PanelProps.edGeoGraphServerName.Enabled:=false;
PanelProps.edGeoGraphServerObjectID.Enabled:=false;
PanelProps.edNotificationAddresses.Enabled:=false;
PanelProps.lvNotificationAreas.Enabled:=false;
PanelProps.lvObjectDistances.Enabled:=false;
ShowUpdatingStage();
end;

procedure TPanelPropsUpdating.DoOnFinished;
begin
end;

procedure TPanelPropsUpdating.ShowUpdatingStage;

  function GetProgressStr(): string;
  const
    StrLen = 10;
  var
    I,C: integer;
  begin
  SetLength(Result,StrLen);
  for I:=1 to StrLen do Result[I]:='.';
  C:=Round(StrLen*CurrentStage/StageCount);
  if (C > StrLen) then C:=StrLen;
  for I:=1 to C do Result[I]:=':';
  end;

var
  Percentage: integer;
begin
if (Terminated) then Exit; //. ->
Inc(CurrentStage);
Percentage:=Round(100.0*CurrentStage/StageCount);
PanelProps.Caption:=PanelPropsName+' (Updating '+GetProgressStr()+' '+IntToStr(Percentage)+'%)';
end;

procedure TPanelPropsUpdating.ShowUpdatingSuccess;
begin
if (Terminated) then Exit; //. ->
PanelProps.Caption:=PanelPropsName;
end;

procedure TPanelPropsUpdating.ShowUpdatingError;
begin
if (Terminated) then Exit; //. ->
PanelProps.Caption:=PanelPropsName+' (Updating error: '+Error.Message+')';
end;

procedure TPanelPropsUpdating.UpdateName;
begin
if (Terminated) then Exit; //. ->
PanelProps.CoComponentName:=CoComponentName;
PanelProps.edName.Text:=CoComponentName;
PanelProps.edName.Enabled:=true;
PanelProps.Image.Enabled:=true;
PanelProps.sbGeoGraphServerObjectBusinessModel.Enabled:=true;
ShowUpdatingStage();
end;

procedure TPanelPropsUpdating.UpdateOwnerName;
begin
if (Terminated) then Exit; //. ->
PanelProps.sbOwner.Caption:=OwnerName;
PanelProps.sbOwner.Enabled:=true;
ShowUpdatingStage();
end;

procedure TPanelPropsUpdating.UpdateGeoGraphServerNameAndObjectID;
begin
if (Terminated) then Exit; //. ->
PanelProps.edGeoGraphServerName.Text:=GeoGraphServerName;
PanelProps.edGeoGraphServerName.Enabled:=true;
if (GeoGraphServerName <> '')
 then PanelProps.sbShowGeoGraphServer.Enabled:=true
 else PanelProps.sbShowGeoGraphServer.Enabled:=false;
PanelProps.edGeoGraphServerObjectID.Text:=IntToStr(GeoGraphServerObjectID);
PanelProps.edGeoGraphServerObjectID.Enabled:=true;
if (GeoGraphServerObjectID <> 0)
 then PanelProps.sbShowGeoGraphServerObject.Enabled:=true
 else PanelProps.sbShowGeoGraphServerObject.Enabled:=false;
ShowUpdatingStage();
end;

procedure TPanelPropsUpdating.UpdateNotificationAddresses;
begin
if (Terminated) then Exit; //. ->
PanelProps.edNotificationAddresses.Text:=CoComponentNotificationAddresses;
PanelProps.edNotificationAddresses.Enabled:=true;
ShowUpdatingStage();
end;

procedure TPanelPropsUpdating.UpdateNotificationAreaList;
var
  I: integer;
  ptrNewItem: pointer;
begin
if (Terminated) then Exit; //. ->
with PanelProps.lvNotificationAreas do begin
Items.BeginUpdate;
try
Clear;
for I:=0 to Length(NotificationAreaList)-1 do with Items.Add do begin
  GetMem(ptrNewItem,SizeOf(TItemComponentsList));
  TItemComponentsList(ptrNewItem^):=NotificationAreaList[I].Area;
  Data:=ptrNewItem;
  Caption:=NotificationAreaList[I].AreaName;
  ImageIndex:=NotificationAreaList[I].AreaVisibilityImageIndex;
  SubItems.Add(NotificationAreaList[I].AreaVisibilityStr);
  case NotificationAreaList[I].AreaType of
  natUnknown: SubItems.AddObject('?',TObject(NotificationAreaList[I].AreaType));
  natIn: SubItems.AddObject('Incoming notification',TObject(NotificationAreaList[I].AreaType));
  natOut: SubItems.AddObject('Outgoing notification',TObject(NotificationAreaList[I].AreaType));
  natInOut: SubItems.AddObject('In/Out notification',TObject(NotificationAreaList[I].AreaType));
  end;
  end;
finally
Items.EndUpdate;
end;
end;
PanelProps.lvNotificationAreas.Enabled:=true;
ShowUpdatingStage();
end;

procedure TPanelPropsUpdating.UpdateObjectDistanceNotificationList;
var
  I: integer;
  ptrNewItem: pointer;
begin
if (Terminated) then Exit; //. ->
with PanelProps.lvObjectDistances do begin
Items.BeginUpdate;
try
Clear;
for I:=0 to Length(ObjectDistanceNotificationList)-1 do with Items.Add do begin
  GetMem(ptrNewItem,SizeOf(TItemComponentsList));
  TItemComponentsList(ptrNewItem^):=ObjectDistanceNotificationList[I].Notification;
  Data:=ptrNewItem;
  Caption:=ObjectDistanceNotificationList[I].NotificationName;
  ImageIndex:=ObjectDistanceNotificationList[I].NotificationStateImageIndex;
  SubItems.Add(ObjectDistanceNotificationList[I].NotificationStateStr);
  case ObjectDistanceNotificationList[I].NotificationType of
  odtUnknown: SubItems.AddObject('?',TObject(ObjectDistanceNotificationList[I].NotificationType));
  odtMin: SubItems.AddObject(' < '+FormatFloat('0',ObjectDistanceNotificationList[I].NotificationDistance),TObject(ObjectDistanceNotificationList[I].NotificationType));
  odtMax: SubItems.AddObject(' > '+FormatFloat('0',ObjectDistanceNotificationList[I].NotificationDistance),TObject(ObjectDistanceNotificationList[I].NotificationType));
  odtMinMax: SubItems.AddObject(' <> '+FormatFloat('0',ObjectDistanceNotificationList[I].NotificationDistance),TObject(ObjectDistanceNotificationList[I].NotificationType));
  end;
  if (ObjectDistanceNotificationList[I].NotificationCurrentDistance >= 0)
   then SubItems.Add(FormatFloat('0',ObjectDistanceNotificationList[I].NotificationCurrentDistance))
   else SubItems.Add('?');
  end;
finally
Items.EndUpdate;
end;
end;
PanelProps.lvObjectDistances.Enabled:=true;
ShowUpdatingStage();
end;

procedure TPanelPropsUpdating.UpdateUserAlert;
begin
if (Terminated) then Exit; //. ->
if ((UserAlertID <> 0) AND (UserAlert_Active))
 then begin
  PanelProps.edUserAlertTimeStamp.Text:=FormatDateTime('DD/MM/YY HH:NN:SS',UserAlert_TimeStamp);
  PanelProps.edUserAlertSeverity.Color:=UserAlertSeverityColors[TUserAlertSeverity(UserAlert_Severity)];
  PanelProps.edUserAlertSeverity.Text:=UserAlertSeverityNames[TUserAlertSeverity(UserAlert_Severity)];
  PanelProps.edUserAlertDescription.Text:=UserAlert_Description;
  if ((PanelProps.edUserAlertDescription.Text = '') AND (TUserAlertSeverity(UserAlert_Severity) <> uasNone))
   then PanelProps.edUserAlertDescription.Text:=PanelProps.edUserAlertSeverity.Text+' alert';
  PanelProps.gbUserAlert.Enabled:=true;
  end
 else begin
  PanelProps.edUserAlertTimeStamp.Text:='-';
  PanelProps.edUserAlertSeverity.Color:=clBtnFace;
  PanelProps.edUserAlertSeverity.Text:='-';
  PanelProps.edUserAlertDescription.Text:='-';
  PanelProps.gbUserAlert.Enabled:=false;
  end;
ShowUpdatingStage();
end;

procedure TPanelPropsUpdating.RecreateUserAlertUpdater;
begin
if (Terminated) then Exit; //. ->
//. create present updater
if (UserAlertID <> PanelProps.UserAlertID)
 then begin
  PanelProps.UserAlertID:=UserAlertID;
  FreeAndNil(PanelProps.UserAlert_Updater);
  if (PanelProps.UserAlertID <> 0)
   then PanelProps.UserAlert_Updater:=TComponentPresentUpdater_Create(idTUserAlert,PanelProps.UserAlertID,PanelProps.Update,nil);
  end;
end;

procedure TPanelPropsUpdating.UpdateOnlineFlag;
begin
if (Terminated) then Exit; //. ->
if (OnlineFlagID <> 0)
 then begin
  if (OnlineFlag)
   then begin
    PanelProps.stConnectionStatus.Color:=clGreen;
    PanelProps.lbConnectionStatus.Caption:='Online ('+FormatDateTime('DD/MM/YY HH:NN:SS',OnlineFlag_SetTimeStamp)+')';
    end
   else begin
    PanelProps.stConnectionStatus.Color:=clRed;
    PanelProps.lbConnectionStatus.Caption:='Offline ('+FormatDateTime('DD/MM/YY HH:NN:SS',OnlineFlag_SetTimeStamp)+')';
    end;
  end
 else begin
  PanelProps.stConnectionStatus.Color:=clBtnFace;
  PanelProps.lbConnectionStatus.Caption:='status is unavailable';
  end;
ShowUpdatingStage();
end;

procedure TPanelPropsUpdating.RecreateOnlineFlagUpdater;
begin
if (Terminated) then Exit; //. ->
//. create present updater
if (OnlineFlagID <> PanelProps.OnlineFlagID)
 then begin
  PanelProps.OnlineFlagID:=OnlineFlagID;
  FreeAndNil(PanelProps.OnlineFlag_Updater);
  if (PanelProps.OnlineFlagID <> 0)
   then PanelProps.OnlineFlag_Updater:=TComponentPresentUpdater_Create(idTBoolVar,PanelProps.OnlineFlagID,PanelProps.Update,nil);
  end;
end;

procedure TPanelPropsUpdating.UpdateLocationIsAvailableFlag;
begin
if (Terminated) then Exit; //. ->
if (LocationIsAvailableFlagID <> 0)
 then begin
  if (OnlineFlag)
   then begin
    if (LocationIsAvailableFlag)
     then begin
      PanelProps.stLocationIsAvailable.Color:=clGreen;
      PanelProps.lbLocationIsAvailable.Caption:='Location ('+FormatDateTime('DD/MM/YY HH:NN:SS',LocationIsAvailableFlag_SetTimeStamp)+')';
      end
     else begin
      PanelProps.stLocationIsAvailable.Color:=clRed;
      PanelProps.lbLocationIsAvailable.Caption:='No location ('+FormatDateTime('DD/MM/YY HH:NN:SS',LocationIsAvailableFlag_SetTimeStamp)+')';
      end;
    PanelProps.stLocationIsAvailable.Show();
    PanelProps.lbLocationIsAvailable.Show();
    end
   else begin
    PanelProps.stLocationIsAvailable.Hide;
    PanelProps.lbLocationIsAvailable.Hide;
    end;
  end
 else begin
  PanelProps.stLocationIsAvailable.Hide;
  PanelProps.lbLocationIsAvailable.Hide;
  end;
ShowUpdatingStage();
end;

procedure TPanelPropsUpdating.RecreateLocationIsAvailableFlagUpdater;
begin
if (Terminated) then Exit; //. ->
//. create present updater
if (LocationIsAvailableFlagID <> PanelProps.LocationIsAvailableFlagID)
 then begin
  PanelProps.LocationIsAvailableFlagID:=LocationIsAvailableFlagID;
  FreeAndNil(PanelProps.LocationIsAvailableFlag_Updater);
  if (PanelProps.LocationIsAvailableFlagID <> 0)
   then PanelProps.LocationIsAvailableFlag_Updater:=TComponentPresentUpdater_Create(idTBoolVar,PanelProps.LocationIsAvailableFlagID,PanelProps.Update,nil);
  end;
end;

procedure TPanelPropsUpdating.DoTerminate();
begin
Synchronize(Finalize);
end;

procedure TPanelPropsUpdating.Finalize();
begin
if (PanelProps = nil) then Exit; //. ->
//.
if (PanelProps.Updating = Self) then PanelProps.Updating:=nil;
end;

procedure TPanelPropsUpdating.Cancel();
begin
Terminate();
end;


{TfmGeoObjectTrackDecodingPanelUpdating}
Constructor TPanelObjectModelsUpdating.Create(const pPanel: TCoGeoMonitorObjectPanelProps);
begin
Panel:=pPanel;
idCoComponent:=Panel.idCoComponent;
//.
StageCount:=3;
//.
Inherited Create(false);
end;

Destructor TPanelObjectModelsUpdating.Destroy();
begin
Cancel();
Inherited;
end;

procedure TPanelObjectModelsUpdating.ForceDestroy();
begin
TerminateThread(Handle,0);
Destroy();
end;

procedure TPanelObjectModelsUpdating.Execute();
var
  idGeoGraphServerObject: integer;
  _GeoGraphServerID: integer;
  _ObjectType: integer;
  _ObjectID: integer;
  _BusinessModel: integer;
begin
try
CoInitializeEx(nil,COINIT_MULTITHREADED);
try
Stage:=0; Synchronize(DoOnStage);
if (Terminated) then Exit; //. ->
with TCoGeoMonitorObjectFunctionality.Create(idCoComponent) do
try
if (NOT GetGeoGraphServerObject(idGeoGraphServerObject)) then Raise Exception.Create('could not get GeoGraphServerObject-component'); //. =>
Stage:=1; Synchronize(DoOnStage);
if (Terminated) then Exit; //. ->
with TGeoGraphServerObjectFunctionality(TComponentFunctionality_Create(idTGeoGraphServerObject,idGeoGraphServerObject)) do
try
GetParams(_GeoGraphServerID,_ObjectID,_ObjectType,_BusinessModel);
finally
Release;
end;
Stage:=2; Synchronize(DoOnStage);
if (Terminated) then Exit; //. ->
if ((NOT ((_GeoGraphServerID <> 0) AND (_ObjectID <> 0))) OR ((_ObjectType = 0) OR (_BusinessModel = 0)))
 then begin
  Synchronize(SetNullModels);
  Exit; //. ->
  end;
ServerObjectController:=TGEOGraphServerObjectController.Create(idGeoGraphServerObject,_ObjectID,ProxySpace_UserID,ProxySpace_UserName,ProxySpace_UserPassword,'',0,false);
ObjectModel:=TObjectModel.GetModel(_ObjectType,ServerObjectController);
ObjectBusinessModel:=TBusinessModel.GetModel(ObjectModel,_BusinessModel);
Stage:=3; Synchronize(DoOnStage);
if (Terminated)
 then begin
  FreeAndNil(ObjectBusinessModel);
  FreeAndNil(ObjectModel);
  FreeAndNil(ServerObjectController);
  //.
  Exit; //. ->
  end;
//.
Synchronize(SetModelsAndCreateControlPanel);
finally
Release;
end;
finally
CoUnInitialize();
end;
except
  on E: Exception do begin
    FreeAndNil(ObjectBusinessModel);
    FreeAndNil(ObjectModel);
    FreeAndNil(ServerObjectController);
    //.
    ThreadException:=Exception.Create(E.Message);
    Synchronize(DoOnException);
    end;
  end;
end;

procedure TPanelObjectModelsUpdating.SetModelsAndCreateControlPanel();
var
  CP: TBusinessModelControlPanel;
begin
if (Terminated) then Exit; //. ->
//.
FreeAndNil(Panel.ObjectBusinessModel);
FreeAndNil(Panel.ObjectModel);
FreeAndNil(Panel.ServerObjectController);
Panel.ServerObjectController:=ServerObjectController;
Panel.ObjectModel:=ObjectModel;
Panel.ObjectBusinessModel:=ObjectBusinessModel;
//.
if (Panel.ObjectBusinessModel = nil) then Raise Exception.Create('there is no object business model'); //. =>
CP:=Panel.ObjectBusinessModel.GetControlPanel();
CP.ObjectName:=Panel.CoComponentName;
CP.ObjectCoComponentID:=Panel.idCoComponent;
CP.BorderStyle:=bsNone;
CP.Position:=poDesigned;
Panel.pnlObjectBusinessModel.Caption:='';
CP.Left:=((Panel.pnlObjectBusinessModel.Width-CP.Width) DIV 2);
CP.Top:=((Panel.pnlObjectBusinessModel.Height-CP.Height) DIV 2);
CP.Parent:=Panel.pnlObjectBusinessModel;
CP.Show();
end;

procedure TPanelObjectModelsUpdating.SetNullModels();
begin
if (Terminated) then Exit; //. ->
//.
Panel.ServerObjectController:=nil;
Panel.ObjectModel:=nil;
Panel.ObjectBusinessModel:=nil;
//.
Panel.pnlObjectBusinessModel.Caption:='no panel';
end;

procedure TPanelObjectModelsUpdating.Synchronize(Method: TThreadMethod);
begin
SynchronizeMethodWithMainThread(Self,Method);
end;

procedure TPanelObjectModelsUpdating.DoOnStage();
begin
if (Terminated) then Exit; //. ->
//.
Panel.pnlObjectBusinessModel.Caption:='Loading... '+IntToStr(Trunc(100*Stage/StageCount))+' %';
end;

procedure TPanelObjectModelsUpdating.DoOnException();
begin
if (Terminated) then Exit; //. ->
//.
Application.MessageBox(PChar('error while updating object models, '+ThreadException.Message),'error',MB_ICONEXCLAMATION+MB_OK);
end;

procedure TPanelObjectModelsUpdating.DoTerminate();
begin
Synchronize(Finalize);
end;

procedure TPanelObjectModelsUpdating.Finalize();
begin
if (Panel = nil) then Exit; //. ->
//.
if (Panel.ObjectModelsUpdating = Self) then Panel.ObjectModelsUpdating:=nil;
end;

procedure TPanelObjectModelsUpdating.Cancel();
begin
Terminate();
end;


end.
