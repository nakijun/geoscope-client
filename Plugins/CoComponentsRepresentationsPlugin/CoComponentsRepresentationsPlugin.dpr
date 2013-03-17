library CoComponentsRepresentationsPlugin;
uses
  FastMM4,
  LanguagesDEPfix,
  Windows,
  SysUtils,
  Classes,
  GlobalSpaceDefines,
  Forms,
  Graphics,
  FunctionalityImport,
  CoFunctionality,
  unitBusinessModel,
  unitUserTaskManager,
  unitCoComponentRepresentations,
  unitCoMusicClipFunctionality,
  unitCoMusicClip1Functionality,
  unitCoPhotoFunctionality,
  unitCoMusicCollectionFunctionality,
  unitCoPhotoCollectionFunctionality,
  unitCoForumFunctionality,
  unitCoPluginFunctionality,
  unitCoWordDocFunctionality,
  unitCoExcelDocFunctionality,
  unitCoPlainTextDocFunctionality,
  unitCoPDFDocFunctionality,
  unitCoXMLDocFunctionality,
  unitCoSegmentedImageFunctionality,
  unitCoGeoCalibrationTrackFunctionality,
  unitCoGeoMonitorObjectFunctionality,
  unitCoGMONotificationAreaFunctionality,
  unitGeoObjectAreaNotifier,
  unitCoNotificationAreaFunctionality,
  unitNotificationAreaNotifier,
  unitNotificationAreaEventsProcessor,
  unitObjectDistanceNotifier,
  unitCoGeoMonitorObjectTreePanel,
  unitGMO1GeoLogAndroidBusinessModel,
  unitProgramStartPanel;

Type
  TPluginStatus = (psUnknown,psInitializing,psFinalizing,psEnabled,psDisabled);
var
  PluginStatus: TPluginStatus = psUnknown;


function PluginName: shortstring; stdcall;
begin
Result:='CoComponents-representations-plugin';
end;

function GetPluginStatus: TPluginStatus; stdcall;
begin
Result:=PluginStatus;
end;

procedure Initialize; stdcall;
begin
PluginStatus:=psInitializing;
try
/// ? CoTypesFunctionality.Initialize;
unitCoGeoMonitorObjectTreePanel.Initialize();
//. initialize area notifications subsystem
unitNotificationAreaEventsProcessor.NotificationAreaEventsProcessor_Initialize();
unitNotificationAreaNotifier.NotificationAreaNotifier_Initialize();
unitGeoObjectAreaNotifier.GeoObjectAreaNotifier_Initialize();
unitObjectDistanceNotifier.ObjectDistanceNotifier_Initialize();
//.
unitUserTaskManager.Initialize();
//.
finally
PluginStatus:=psEnabled;
end;
end;

procedure Finalize; stdcall;
begin
PluginStatus:=psFinalizing;
try
FreeProgramStartPanel();
//.
/// ? CoTypesFunctionality.Finalize;
unitObjectDistanceNotifier.ObjectDistanceNotifier_Finalize();
unitGeoObjectAreaNotifier.GeoObjectAreaNotifier_Finalize();
unitNotificationAreaNotifier.NotificationAreaNotifier_Finalize();
unitNotificationAreaEventsProcessor.NotificationAreaEventsProcessor_Finalize();
unitCoGeoMonitorObjectTreePanel.Finalize();
//.
unitCoComponentRepresentations.Finalize();
finally
PluginStatus:=psDisabled;
end;
end;

procedure Enable; stdcall;
begin
PluginStatus:=psEnabled;
end;

procedure Disable; stdcall;
begin
PluginStatus:=psDisabled;
end;

procedure DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation); stdcall;
begin
///- unitCoComponentRepresentations.DoOnComponentOperation(idTObj,idObj, Operation);
end;

procedure DoOnVisualizationOperation(const ptrObj: TPtr; const Act: TRevisionAct); stdcall;
begin
if (unitObjectDistanceNotifier.ObjectDistanceNotifier <> nil) then unitObjectDistanceNotifier.ObjectDistanceNotifier.DoOnVisualizationOperation(ptrObj,Act,true); 
if (unitNotificationAreaNotifier.NotificationAreaNotifier <> nil) then unitNotificationAreaNotifier.NotificationAreaNotifier.DoOnVisualizationOperation(ptrObj,Act,true);
if (unitGeoObjectAreaNotifier.GeoObjectAreaNotifier <> nil) then unitGeoObjectAreaNotifier.GeoObjectAreaNotifier.DoOnVisualizationOperation(ptrObj,Act,true);
end;

procedure Execute(const Code: integer; const InData: TByteArray; out OutData: TByteArray); stdcall;
const
  CODE_AREANOTIFICATIONSERVER_SHOWEVENTSPROCESSORPANEL = 1001;
begin
OutData:=nil;
case (Code) of
CODE_AREANOTIFICATIONSERVER_SHOWEVENTSPROCESSORPANEL: NotificationAreaEventsProcessor_ShowPanel();
else
  Raise Exception.Create('Plugin.Execute: unknown code: '+IntToStr(Code));
end;
end;


function CanSupportCoComponentType(const idCoType: integer): boolean; stdcall;
begin
Result:=CoComponentTypesSystem.CanSupportCoType(idCoType);
end;

function GetCreateCompletionObjectForCoComponentType(const pidCoType: integer): TCreateCompletionObject; stdcall;
begin
Result:=CoComponentTypesSystem.GetCreateCompletionObject(pidCoType);
end;

//. props panel create
function CoComponent__TPanelProps_Create(const idCoType,idCoComponent: integer): TForm; stdcall;
begin
Result:=nil;
try
with CoComponentTypesSystem.TCoComponentFunctionality_Create(idCoType,idCoComponent) do
try
Result:=TPropsPanel_Create;
finally
Release;
end;
except
  Result.Free;
  Result:=nil;
  end;
end;

procedure CoComponent_GetData(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; idCoType: Integer; DataType: Integer; out Data: GlobalSpaceDefines.TByteArray); stdcall;
begin
with CoComponentTypesSystem.TCoComponentFunctionality_Create(idCoType,idCoComponent) do
try
GetTypedData(pUserName,pUserPassword, DataType,{out} Data);
finally
Release();
end;
end;

procedure CoComponent_SetData(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; idCoType: Integer; DataType: Integer; const Data: GlobalSpaceDefines.TByteArray); stdcall;
begin
with CoComponentTypesSystem.TCoComponentFunctionality_Create(idCoType,idCoComponent) do
try
SetTypedData(pUserName,pUserPassword, DataType, Data);
finally
Release();
end;
end;

function CoComponent_GetHintInfo(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; idCoType: Integer; const InfoType: Integer; const InfoFormat: Integer; out Info: GlobalSpaceDefines.TByteArray): boolean; stdcall;
begin
with CoComponentTypesSystem.TCoComponentFunctionality_Create(idCoType,idCoComponent) do
try
Result:=GetHintInfo(pUserName,pUserPassword, InfoType,InfoFormat,{out} Info);
finally
Release();
end;
end;

function CoComponent_TIconBar_Create(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; idCoType: Integer; const pUpdateNotificationProc: TComponentIconBarUpdateNotificationProc): TAbstractComponentIconBar; stdcall;
begin
with CoComponentTypesSystem.TCoComponentFunctionality_Create(idCoType,idCoComponent) do
try
Result:=TIconBar_Create(pUpdateNotificationProc);
finally
Release();
end;
end;

function CoComponent_TStatusBar_Create(const pUserName: WideString; const pUserPassword: WideString; idCoComponent: Integer; idCoType: Integer; const pUpdateNotificationProc: TComponentStatusBarUpdateNotificationProc): TAbstractComponentStatusBar; stdcall;
begin
with CoComponentTypesSystem.TCoComponentFunctionality_Create(idCoType,idCoComponent) do
try
Result:=TStatusBar_Create(pUpdateNotificationProc);
finally
Release();
end;
end;

procedure CoGeoMonitorObjects_Constructor_Construct(const pUserID: integer; const pUserName: WideString; const pUserPassword: WideString; const pObjectBusinessModel: string; const pName: string; const pGeoSpaceID: integer; const pSecurityIndex: integer; out oComponentID: integer; out oGeographServerAddress: string; out oGeographServerObjectID: integer); stdcall;
var
  BusinessModelClass: TBusinessModelClass;
begin
if (pObjectBusinessModel = '101.2') then BusinessModelClass:=TGMO1GeoLogAndroidBusinessModel else Raise Exception.Create('unknown object-business-model of creating object'); //. =>
unitCoGeoMonitorObjectFunctionality.CoGeoMonitorObjects_Constructor_Construct(pUserID,pUserName,pUserPassword, BusinessModelClass,pName,pGeoSpaceID,pSecurityIndex, {out} oComponentID,{out} oGeographServerAddress,{out} oGeographServerObjectID);
end;

function CoGeoMonitorObjects_GetTreePanel(): TForm; stdcall;
begin
Result:=unitCoGeoMonitorObjectTreePanel.GetTreePanel();
end;

procedure CoGeoMonitorObject_GetTrackData(const pUserName: WideString; const pUserPassword: WideString; idCoGeoMonitorObject: Integer; const GeoSpaceID: integer; const BeginTime: double; const EndTime: double; DataType: Integer; out Data: GlobalSpaceDefines.TByteArray); stdcall;
begin
with TCoGeoMonitorObjectFunctionality.Create(idCoGeoMonitorObject) do
try
GetTrackData(pUserName,pUserPassword, GeoSpaceID, BeginTime,EndTime, DataType,{out} Data);
finally
Release();
end;
end;

function GetStartPanel(const flAutoStartCheck: boolean): TForm; stdcall;
begin
Result:=nil;
if (flAutoStartCheck AND NOT TfmProgramStartPanel.IsAutoStartEnabled()) then Exit; //. ->
Result:=unitProgramStartPanel.GetProgramStartPanel();
end;

//. custom visualization reflect
function CoForum_ReflectV0(const idTObj,idObj: integer;  pFigure: TObject; pAdditionalFigure: TObject; pReflectionWindow: TObject; pAttractionWindow: TObject; pCanvas: TCanvas): boolean; stdcall;
var
  idTOwner,idOwner: integer;
begin
Result:=false;
with TComponentFunctionality_Create(idTObj,idObj) do
try
if GetOwner(idTOwner,idOwner) AND (idTOwner = idTCoComponent)
 then Result:=CoComponentReflectList_ReflectV0(TCoForumFunctionality,idOwner, pFigure,pAdditionalFigure, pReflectionWindow, pAttractionWindow, pCanvas);
finally
Release;
end;
end;

procedure ShowUserTaskManager(); stdcall;
begin
if (fmUserTaskManager <> nil)
 then begin
  fmUserTaskManager.Show();
  fmUserTaskManager.BringToFront();
  end;
end;

procedure SetApplication(const H: THandle); stdcall;
begin
Application.Handle:=H;
end;




Exports
  PluginName,
  GetPluginStatus,
  Initialize,
  Finalize,
  Enable,
  Disable,
  SetApplication,
  DoOnComponentOperation,
  DoOnVisualizationOperation,
  Execute,
  //. co-component support
  CanSupportCoComponentType,
  GetCreateCompletionObjectForCoComponentType,
  //.
  CoComponent__TPanelProps_Create,
  CoComponent_GetData,
  CoComponent_SetData,
  CoComponent_GetHintInfo,
  CoComponent_TIconBar_Create,
  CoComponent_TStatusBar_Create,
  //.
  CoForum_ReflectV0,
  //.
  CoGeoMonitorObjects_Constructor_Construct,
  CoGeoMonitorObjects_GetTreePanel,
  CoGeoMonitorObject_GetTrackData,
  //.
  GetStartPanel,
  //.
  ShowUserTaskManager;


begin
DecimalSeparator:='.';
end.
