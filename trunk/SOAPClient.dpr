program SOAPClient;
uses
  FastMM4,
  LanguagesDEPfix,
  unitZeroInit,
  ///??? unitProcessCompatibility,
  MemCheck,
  SysUtils,
  Classes,
  Controls,
  Graphics,
  Dialogs,
  ComObj,
  ComServ,
  ActiveX,
  Windows,
  Forms,
  MiniReg,
  unitSpaceFunctionalServer,
  unitSpaceFunctionalComServer,
  unitAreaNotificationServer,
  unitServerProxySpacePicture,
  GlobalSpaceDefines,
  unitProxySpace,
  unitEventLog,
  unitSpaceNotificationSubscription,
  Functionality,
  TypesFunctionality,
  unitReflector,
  unitUserHintsPanel,
  GeoTransformations,
  unitXYToGeoCrdConvertor,
  unitObjectModel,
  unitGeoObjectTrackDecoding,
  unitGeoObjectTracksPanel,
  unitGeoObjectTracksReportPanel,
  unitElectedObjects,
  SOAPClient_TLB in 'SOAPClient_TLB.pas';

const
  {/// SP1 LaunchPermissionsSize = 104;
  LaunchPermissions: array[0..LaunchPermissionsSize-1] of byte = (
    $01,$00,$04,$80,$30,$00,$00,$00,$4c,$00,$00,$00,$00,$00,$00,$00,$14,$00,
    $00,$00,$02,$00,$1c,$00,$01,$00,$00,$00,$00,$00,$14,$00,$01,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,
    $05,$12,$00,$00,$00,$01,$05,$00,$00,$00,$00,$00,$05,$15,$00,$00,$00,$a0,$5f,$84,$1f,$5e,$2e,$6b,$49,
    $ce,$12,$03,$03,$f4,$01,$00,$00,$01,$05,$00,$00,$00,$00,$00,$05,$15,$00,$00,$00,$a0,$5f,$84,$1f,$5e,
    $2e,$6b,$49,$ce,$12,$03,$03,$f4,$01,$00,$00
  );}
  //. SP2
  LaunchPermissionsSize = 124;
  LaunchPermissions: array[0..LaunchPermissionsSize-1] of byte = (
    $01,$00,$04,$80,$44,$00,$00,$00,$60,$00,$00,$00,$00,$00,$00,$00,$14,$00,
    $00,$00,$02,$00,$30,$00,$02,$00,$00,$00,$00,$00,$14,$00,$1f,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,
    $05,$12,$00,$00,$00,$00,$00,$14,$00,$0b,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,
    $01,$05,$00,$00,$00,$00,$00,$05,$15,$00,$00,$00,$a0,$5f,$84,$1f,$5e,$2e,$6b,$49,$ce,$12,$03,$03,$f4,
    $01,$00,$00,$01,$05,$00,$00,$00,$00,$00,$05,$15,$00,$00,$00,$a0,$5f,$84,$1f,$5e,$2e,$6b,$49,$ce,$12,
    $03,$03,$f4,$01,$00,$00
  );
  AccessPermissionsSize = 148;
  AccessPermissions: array[0..AccessPermissionsSize-1] of byte = (
    $01,$00,$14,$80,$5c,$00,$00,$00,$78,$00,$00,$00,$00,$00,$00,$00,$14,$00,
    $00,$00,$02,$00,$48,$00,$03,$00,$00,$00,$00,$00,$14,$00,$01,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,
    $05,$12,$00,$00,$00,$00,$00,$14,$00,$01,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00,
    $00,$00,$18,$00,$01,$00,$00,$00,$01,$02,$00,$00,$00,$00,$00,$05,$20,$00,$00,$00,$22,$02,$00,$00,$01,
    $05,$00,$00,$00,$00,$00,$05,$15,$00,$00,$00,$2f,$d5,$ec,$6d,$0f,$f8,$60,$1d,$16,$c0,$ea,$32,$eb,$03,
    $00,$00,$01,$05,$00,$00,$00,$00,$00,$05,$15,$00,$00,$00,$2f,$d5,$ec,$6d,$0f,$f8,$60,$1d,$16,$c0,$ea,
    $32,$eb,$03,$00,$00
  );


procedure SynchronizeMethodWithMainThread(const CallingThread: TThread; Method: TThreadMethod); stdcall;
begin
Classes.TThread.Synchronize(CallingThread,Method);
end;


procedure ProxySpace__Plugins_Add(const PluginFileName: string); stdcall;
begin
ProxySpace.Plugins_Add(PluginFileName);
end;

procedure ProxySpace__Plugins_Remove(const PluginHandle: THandle); stdcall;
begin
ProxySpace.Plugins_Remove(PluginHandle);
end;

procedure ProxySpace__Log_OperationStarting(const strOperation: shortstring); stdcall;
begin
ProxySpace.Log.OperationStarting(strOperation);
end;

procedure ProxySpace__Log_OperationProgress(const Percent: integer); stdcall;
begin
ProxySpace.Log.OperationProgress(Percent);
end;

procedure ProxySpace__Log_OperationDone; stdcall;
begin
ProxySpace.Log.OperationDone;
end;

procedure ProxySpace__EventLog_WriteInfoEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0); stdcall;
begin
EventLog.WriteInfoEvent(pSource,pEventMessage,pEventInfo,pEventID,pEventTypeID);
end;

procedure ProxySpace__EventLog_WriteMinorEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0); stdcall;
begin
EventLog.WriteMinorEvent(pSource,pEventMessage,pEventInfo,pEventID,pEventTypeID);
end;

procedure ProxySpace__EventLog_WriteMajorEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0); stdcall;
begin
EventLog.WriteMajorEvent(pSource,pEventMessage,pEventInfo,pEventID,pEventTypeID);
end;

procedure ProxySpace__EventLog_WriteCriticalEvent(const pSource: string; const pEventMessage: string; const pEventInfo: string = ''; const pEventID: integer = 0; const pEventTypeID: integer = 0); stdcall;
begin
EventLog.WriteCriticalEvent(pSource,pEventMessage,pEventInfo,pEventID,pEventTypeID);
end;

procedure ProxySpace__EventLog_WriteQoSValue(const Value: double); stdcall;
begin
EventLog.WriteQoSValue(Value);
end;



//. proxy-space routines
function ProxySpace_SOAPServerURL: WideString; stdcall;
begin
Result:=ProxySpace.SOAPServerURL;
end;

function ProxySpace_SpacePackID: integer; stdcall;
begin
Result:=ProxySpace.SpacePackID;
end;

function ProxySpace_UserID: integer; stdcall;
begin
Result:=ProxySpace.UserID;
end;

function ProxySpace_UserName: WideString; stdcall;
begin
Result:=ProxySpace.UserName;
end;

function ProxySpace_UserPassword: WideString; stdcall;
begin
Result:=ProxySpace.UserPassword;
end;

function ProxySpace_ProxySpaceServerType: TProxySpaceServerType; stdcall;
begin
Result:=ProxySpace.ProxySpaceServerType;
end;

function ProxySpace_ProxySpaceServerProfile: pointer; stdcall;
begin
case ProxySpace.ProxySpaceServerType of
pssFunctional: Result:=@unitSpaceFunctionalServer.ServerProfile;
pssAreaNotification: Result:=@unitAreaNotificationServer.ServerProfile;
else
  Result:=nil;
end;
end;

function ProxySpace__Context_flLoaded(): boolean; stdcall;
begin
Result:=ProxySpace.Context_flLoaded;
end;

function ProxySpace_GetCurrentUserProfile: string; stdcall;
begin
with TProxySpaceUserProfile.Create(ProxySpace) do
try
Result:=ProfileFolder;
finally
Destroy;
end;
end;

procedure ProxySpace_StayUpToDate; stdcall;
begin
ProxySpace.StayUpToDate();
end;

function ProxySpace__Obj_Ptr(const idTObj,idObj: integer): integer; stdcall;
begin
Result:=ProxySpace.TObj_Ptr(idTObj,idObj);
end;

function ProxySpace__Obj_IDType(ptrObj: TPtr): integer; stdcall;
begin
Result:=ProxySpace.Obj_IDType(ptrObj);
end;

function ProxySpace__Obj_ID(ptrObj: TPtr): integer; stdcall;
begin
Result:=ProxySpace.Obj_ID(ptrObj);
end;

function ProxySpace__Obj_GetMinMax(var minX,minY,maxX,maxY: Extended; const ptrSelf: TPtr): boolean; stdcall;
begin
Result:=ProxySpace.Obj_GetMinMax(minX,minY,maxX,maxY, ptrSelf);
end;

function ProxySpace__Obj_GetCenter(var Xc,Yc: Extended; const ptrSelf: TPtr): boolean; stdcall;
begin
Result:=ProxySpace.Obj_GetCenter(Xc,Yc, ptrSelf);
end;

function ProxySpace__Obj_ObjIsVisibleInside(const ptrAnObj: TPtr; const ptrSelf: TPtr): boolean; stdcall;
begin
Result:=ProxySpace.Obj_ObjIsVisibleInside(ptrAnObj, ptrSelf);
end;

function ProxySpace__Obj_GetFirstNode(const ptrObj: TPtr; out Node: TPoint): boolean; stdcall;
var
  Obj: TSpaceObj;
begin
Result:=false;
ProxySpace.ReadObj(Obj,SizeOf(Obj),ptrObj);
if (Obj.ptrFirstPoint = nilPtr) then Exit; //. ->
ProxySpace.ReadObj(Node,SizeOf(Node),Obj.ptrFirstPoint);
Result:=true;
end;

procedure ProxySpace__Obj_GetLaysOfVisibleObjectsInside(const ptrSelf: TPtr; out ptrLays: pointer); stdcall;
begin
ProxySpace.Obj_GetLaysOfVisibleObjectsInside(ptrSelf, ptrLays);
end;

function ProxySpace__Obj_GetRootPtr(ptrObj: TPtr): TPtr; stdcall;
begin
Result:=ProxySpace.Obj_GetRootPtr(ptrObj);
end;


//. proxy-space types-system routines

function ProxySpace__TypesSystem_GetClipboardComponent(out idTComponent,idComponent: integer): boolean; stdcall;
begin
Result:=false;
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (NOT ClipBoard_flExist) then Exit; //. ->
idTComponent:=Clipboard_Instance_idTObj;
idComponent:=Clipboard_Instance_idObj;
end;
Result:=true;
end;

procedure ProxySpace__TypesSystem_SetClipboardComponent(const idTComponent,idComponent: integer); stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
Clipboard_Instance_idTObj:=idTComponent;
Clipboard_Instance_idObj:=idComponent;
ClipBoard_flExist:=true;
end;
end;

function ProxySpace___TypesSystem__Reflector_ID: integer; stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil)
 then begin
  Result:=0;
  Exit; //. ->
  end;
Result:=Reflector.id;
end;
end;

procedure ProxySpace___TypesSystem__Reflector_ShowObjAtCenter(const ptrObj: TPtr); stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil) then Raise Exception.Create('ProxySpace___TypesSystem__Reflector_ShowObjAtCenter: Reflector is nil'); //. =>
if (NOT (Reflector is TReflector)) then Raise Exception.Create('ProxySpace___TypesSystem__Reflector_ShowObjAtCenter: Reflector is not a TReflector type'); //. =>
//.
TReflector(Reflector).ShowObjAtCenter(ptrObj);
end;
end;

function ProxySpace___TypesSystem__Reflector_GetObjectEditorSelectedHandle: integer; stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil) then Raise Exception.Create('ProxySpace___TypesSystem__Reflector_GetObjectEditorSelectedHandle: Reflector is nil'); //. =>
if (NOT (Reflector is TReflector)) then Raise Exception.Create('ProxySpace___TypesSystem__Reflector_GetObjectEditorSelectedHandle: Reflector is not a TReflector type'); //. =>
//.
with TReflector(Reflector) do begin
if (ObjectEditor = nil) then Raise Exception.Create('ProxySpace___TypesSystem__Reflector_GetObjectEditorSelectedHandle: Reflector.ObjectEditor is nil'); //. =>
Result:=ObjectEditor.GetSelectedHandleIndex();
end;
end;
end;

procedure ProxySpace___TypesSystem__Reflector_SetVisualizationForEditingInSputink(const idTVisualization,idVisualization: integer); stdcall;
var
  Xbind,Ybind: TCrd;
  ptrObj: TPtr;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil) then Raise Exception.Create('ProxySpace___TypesSystem__Reflector_SetVisualizationForEditingInSputink: Reflector is nil'); //. =>
if (NOT (Reflector is TReflector)) then Raise Exception.Create('ProxySpace___TypesSystem__Reflector_SetVisualizationForEditingInSputink: Reflector is not a TReflector type'); //. =>
//.
with TBaseVisualizationFunctionality(TComponentFunctionality_Create(idTVisualization,idVisualization)) do
try
ptrObj:=Ptr();
finally
Release;
end;
with TReflector(Reflector) do begin
FreeAndNil(EditingOrCreatingObject);
EditingOrCreatingObject:=TEditingOrCreatingObject.Create(TReflector(Reflector),false, 0,0,ptrObj);
ReflectionWindow.Lock.Enter;
try
ConvertScrExtendCrd2RealCrd(ReflectionWindow.Xmd,ReflectionWindow.Ymd, Xbind,Ybind);
finally
ReflectionWindow.Lock.Leave;
end;
EditingOrCreatingObject.DoAlign(); //. align editing visualization to fit the screen
EditingOrCreatingObject.SetPosition(Xbind,Ybind);
end;
end;
end;

procedure ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItem(const idTVisualization,idVisualization: integer; const pName: string); stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil) then Raise Exception.Create('ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItem: Reflector is nil'); //. =>
if (NOT (Reflector is TReflector)) then Raise Exception.Create('ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItem: Reflector is not a TReflector type'); //. =>
//.
TfmUserHintsPanel(TReflector(Reflector).DynamicHints.UserDynamicHints.fmUserHintsPanel).lvItems_Add(idTVisualization,idVisualization,pName,false);
end;
end;

procedure ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItemDialog(const idTVisualization,idVisualization: integer; const pName: string); stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil) then Raise Exception.Create('ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItemDialog: Reflector is nil'); //. =>
if (NOT (Reflector is TReflector)) then Raise Exception.Create('ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItemDialog: Reflector is not a TReflector type'); //. =>
//.
TfmUserHintsPanel(TReflector(Reflector).DynamicHints.UserDynamicHints.fmUserHintsPanel).lvItems_Add(idTVisualization,idVisualization,pName);
end; 
end;

procedure ProxySpace____TypesSystem___Reflector__ElectedObjects_AddNewItem(const pidType: integer; const pidObj: integer; const pObjectName: string); stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil) then Raise Exception.Create('ProxySpace____TypesSystem___Reflector__ElectedObjects_AddNewItem: Reflector is nil'); //. =>
if (NOT (Reflector is TReflector)) then Raise Exception.Create('ProxySpace____TypesSystem___Reflector__ElectedObjects_AddNewItem: Reflector is not a TReflector type'); //. =>
//.
TfmElectedObjects.AddNewItem(Reflector,pidType,pidObj,pObjectName);
end;
end;

procedure ProxySpace____TypesSystem___Reflector__GeoSpace_ShowPanel(); stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil) then Raise Exception.Create('ProxySpace____TypesSystem___Reflector__GeoSpace_ShowPanel: Reflector is nil'); //. =>
if (NOT (Reflector is TReflector)) then Raise Exception.Create('ProxySpace____TypesSystem___Reflector__GeoSpace_ShowPanel: Reflector is not a TReflector type'); //. =>
TReflector(Reflector).sbGeoCoordinates.Down:=true;
TReflector(Reflector).sbGeoCoordinates.Click();
end;
end;

procedure ProxySpace____TypesSystem___Reflector__GeoSpace_HidePanel(); stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil) then Raise Exception.Create('ProxySpace____TypesSystem___Reflector__GeoSpace_HidePanel: Reflector is nil'); //. =>
if (NOT (Reflector is TReflector)) then Raise Exception.Create('ProxySpace____TypesSystem___Reflector__GeoSpace_HidePanel: Reflector is not a TReflector type'); //. =>
TReflector(Reflector).sbGeoCoordinates.Down:=false;
TReflector(Reflector).sbGeoCoordinates.Click();
end;
end;

function ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_AddNewTrackFromGeoDataStream(const GeoDataStream: TMemoryStream; const GeoDataDatumID: integer; const pTrackName: string; const pTrackColor: TColor; const TrackCoComponentID: integer): pointer; stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil) then Raise Exception.Create('ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_AddNewTrackFromGeoDataStream: Reflector is nil'); //. =>
if (NOT (Reflector is TReflector)) then Raise Exception.Create('ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_AddNewTrackFromGeoDataStream: Reflector is not a TReflector type'); //. =>
Result:=TfmXYToGeoCrdConvertor(TReflector(Reflector).XYToGeoCrdConverter).GeoObjectTracks.AddNewTrackFromGeoDataStream(GeoDataStream,GeoDataDatumID,pTrackName,pTrackColor,TrackCoComponentID);
end;
end;

procedure ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_InsertTrack(const ptrTrack: pointer); stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil) then Raise Exception.Create('ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_InsertTrack: Reflector is nil'); //. =>
if (NOT (Reflector is TReflector)) then Raise Exception.Create('ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_InsertTrack: Reflector is not a TReflector type'); //. =>
TfmXYToGeoCrdConvertor(TReflector(Reflector).XYToGeoCrdConverter).GeoObjectTracks.InsertTrack(ptrTrack);
end;
end;

procedure ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_RemoveTrack(const ptrRemoveTrack: pointer); stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil) then Raise Exception.Create('ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_RemoveTrack: Reflector is nil'); //. =>
if (NOT (Reflector is TReflector)) then Raise Exception.Create('ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_RemoveTrack: Reflector is not a TReflector type'); //. =>
TfmXYToGeoCrdConvertor(TReflector(Reflector).XYToGeoCrdConverter).GeoObjectTracks.RemoveTrack(ptrRemoveTrack);
end;
end;

function ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_GetTrackPanel(const ptrTrack: pointer; const PositionTime: TDateTime): TForm; stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil) then Raise Exception.Create('ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_InsertTrack: Reflector is nil'); //. =>
if (NOT (Reflector is TReflector)) then Raise Exception.Create('ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_InsertTrack: Reflector is not a TReflector type'); //. =>
Result:=TfmXYToGeoCrdConvertor(TReflector(Reflector).XYToGeoCrdConverter).GeoObjectTracks.GetTrackPanel(ptrTrack,PositionTime);
end;
end;

function ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_CreatePanel(const pCoComponentID: integer; const Parent: TWinControl): TForm; stdcall;
begin
with TTypesSystem(ProxySpace.TypesSystem) do begin
if (Reflector = nil)
 then begin
  Result:=nil;
  Exit; //. ->
  end;
if (NOT (Reflector is TReflector))
 then begin
  Result:=nil;
  Exit; //. ->
  end;
Result:=TfmXYToGeoCrdConvertor(TReflector(Reflector).XYToGeoCrdConverter).GeoObjectTracks.CreateControlPanel(pCoComponentID);
TfmGeoObjectTracksPanel(Result).pnlControl.Hide();
Result.ParentWindow:=Parent.Handle;
end;
end;

procedure ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_FreePanel(var Panel: TForm); stdcall;
begin
FreeAndNil(Panel);
end;

procedure ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_UpdatePanel(const Panel: TForm); stdcall;
begin
TfmGeoObjectTracksPanel(Panel).Update();
end;

function ProxySpace__NotificationSubscription_AddComponent(const pidTComponent: integer; const pidComponent: integer): boolean; stdcall;
begin
Result:=TSpaceNotificationSubscription(ProxySpace.NotificationSubscription).AddComponent(pidTComponent,pidComponent);
end;

procedure ProxySpace__NotificationSubscription_RemoveComponent(const pidTComponent: integer; const pidComponent: integer); stdcall;
begin
TSpaceNotificationSubscription(ProxySpace.NotificationSubscription).RemoveComponent(pidTComponent,pidComponent);
end;

function ProxySpace__NotificationSubscription_AddWindow(const pX0,pY0,pX1,pY1,pX2,pY2,pX3,pY3: double; const pName: shortstring): boolean; stdcall;
begin
Result:=TSpaceNotificationSubscription(ProxySpace.NotificationSubscription).AddWindow(pX0,pY0,pX1,pY1,pX2,pY2,pX3,pY3,pName);
end;

procedure ProxySpace__NotificationSubscription_RemoveWindow(const pName: shortstring); stdcall;
begin
TSpaceNotificationSubscription(ProxySpace.NotificationSubscription).RemoveWindow(pName);
end;

function ProxySpace__TSpaceWindowUpdater_Create(const pXmin,pYmin,pXmax,pYmax: double): TObject; stdcall;
begin
Result:=ProxySpace.SpaceWindowUpdaters__TSpaceWindowUpdater_Create(pXmin,pYmin,pXmax,pYmax);
end;


function GeoSpace_Converter_ConvertLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): boolean; stdcall;
begin
Result:=GeoSpaceConverter_ConvertLatLongToXY(pUserName,pUserPassword, GeoSpaceID, Latitude,Longitude,{out} X,Y);
end;

function GeoSpace_Converter_ConvertDatumLatLongToXY(const pUserName: WideString; const pUserPassword: WideString; GeoSpaceID: Integer; DatumID: integer; Latitude: Double; Longitude: Double; out X: Double; out Y: Double): boolean; stdcall;
begin
Result:=GeoSpaceConverter_ConvertDatumLatLongToXY(pUserName,pUserPassword, GeoSpaceID, DatumID, Latitude,Longitude,{out} X,Y);
end;


procedure GeoCoder_LatLongToNearestObjects(const GeoCoderID: integer; const DatumID: integer; const Lat,Long: Extended; out ObjectsNames: string); stdcall;
begin
with TGeoCrdConverter.Create(DatumID) do
try
GeoCoder_LatLongToNearestObjects(GeoCoderID, Lat,Long,{out} ObjectsNames);
finally
Destroy();
end;
end;

procedure GeoCoder_NearestObjectLatLong(const GeoCoderID: integer; const ObjectName: string; out Locations: TMemoryStream); stdcall;
begin
Locations:=nil;
end;


procedure GeoObjectTrack_Decode(const ptrTrack: pointer); stdcall;
begin
with TGeoObjectTrack(ptrTrack^) do begin
FreeAndNil(StopsAndMovementsAnalysis);
StopsAndMovementsAnalysis:=TTrackStopsAndMovementsAnalysis.Create();
TTrackStopsAndMovementsAnalysis(StopsAndMovementsAnalysis).Process(ptrTrack);
end;
end;


function GeoObjectTracks_GetReportPanel(var TrackDecriptors: TGeoObjectTrackDecriptors; const ReportName: string): TForm; stdcall;
begin
Result:=TfmGeoObjectTracksReportPanel.Create(TrackDecriptors,ReportName);
end;


Exports
    //. system routines
    SynchronizeMethodWithMainThread,
    //. ProxySpace EventLog
    ProxySpace__Log_OperationProgress,
    ProxySpace__Log_OperationDone,
    ProxySpace__EventLog_WriteInfoEvent,
    ProxySpace__EventLog_WriteMinorEvent,
    ProxySpace__EventLog_WriteMajorEvent,
    ProxySpace__EventLog_WriteCriticalEvent,
    ProxySpace__EventLog_WriteQoSValue,
    ProxySpace__Log_OperationStarting,
    //.
    ProxySpace_SOAPServerURL,
    ProxySpace_UserID,
    ProxySpace_UserName,
    ProxySpace_UserPassword,
    ProxySpace_ProxySpaceServerType,
    ProxySpace_ProxySpaceServerProfile,
    ProxySpace__Context_flLoaded,
    ProxySpace_GetCurrentUserProfile,
    ProxySpace_StayUpToDate,
    //.
    ProxySpace_SpacePackID,
    ProxySpace__Obj_Ptr,
    ProxySpace__Obj_IDType,
    ProxySpace__Obj_ID,
    ProxySpace__Obj_GetMinMax,
    ProxySpace__Obj_GetCenter,
    ProxySpace__Obj_GetFirstNode,
    ProxySpace__Obj_ObjIsVisibleInside,
    ProxySpace__Obj_GetLaysOfVisibleObjectsInside,
    ProxySpace__Obj_GetRootPtr,
    //. ProxySpace TypesSystem
    ProxySpace__TypesSystem_GetClipboardComponent,
    ProxySpace__TypesSystem_SetClipboardComponent,
    ProxySpace___TypesSystem__Reflector_ID,
    ProxySpace___TypesSystem__Reflector_ShowObjAtCenter,
    ProxySpace___TypesSystem__Reflector_GetObjectEditorSelectedHandle,
    ProxySpace___TypesSystem__Reflector_SetVisualizationForEditingInSputink,
    ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItem,
    ProxySpace____TypesSystem___Reflector__UserDynamicHints_AddNewItemDialog,
    ProxySpace____TypesSystem___Reflector__ElectedObjects_AddNewItem,
    ProxySpace____TypesSystem___Reflector__GeoSpace_ShowPanel,
    ProxySpace____TypesSystem___Reflector__GeoSpace_HidePanel,
    ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_AddNewTrackFromGeoDataStream,
    ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_InsertTrack,
    ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_RemoveTrack,
    ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_GetTrackPanel,
    ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_CreatePanel,
    ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_FreePanel,
    ProxySpace_____TypesSystem____Reflector___GeoSpace__Tracks_UpdatePanel,
    //. ProxySpace update notification subscription
    ProxySpace__NotificationSubscription_AddComponent,
    ProxySpace__NotificationSubscription_RemoveComponent,
    ProxySpace__NotificationSubscription_AddWindow,
    ProxySpace__NotificationSubscription_RemoveWindow,
    //. plugin export
    ProxySpace__Plugins_Add,
    ProxySpace__Plugins_Remove,
    {$I FunctionalityExport.inc}
    {$I TypesFunctionalityExport.inc}
    //. Functionality creators
    TTypeFunctionality_Create,
    TComponentFunctionality_Create,
    //.
    GeoSpace_Converter_ConvertLatLongToXY,
    GeoSpace_Converter_ConvertDatumLatLongToXY,
    //.
    GeoCoder_LatLongToNearestObjects,
    GeoCoder_NearestObjectLatLong,
    //.
    GeoObjectTrack_Decode,
    //.
    GeoObjectTracks_GetReportPanel,
    //. Updaters creators
    TTypeSystemPresentUpdater_Create,
    TComponentPresentUpdater_Create,
    ProxySpace__TSpaceWindowUpdater_Create;


{$R *.TLB}

{$R *.res}

var
  UserProxySpaceIndex: integer;
begin
CoInitFlags:=COINIT_MULTITHREADED;
Application.Initialize();
//.
if ANSIUPPERCASE(ParamStr(1)) = '/SETCALLPERMISSIONS'
 then begin
  /// ? EnableGuestAccount;
  RegDelValue(HKEY_CLASSES_ROOT,'AppID\'+GUIDToString(CLASS_coSpaceFunctionalServer)+'\RunAs');
  if NOT RegSetDWord(HKEY_CLASSES_ROOT,'AppID\'+GUIDToString(CLASS_coSpaceFunctionalServer)+'\AuthenticationLevel',1{none auth level}) then Raise Exception.Create('error create registry value'); //. =>
  if NOT RegSetMultiString(HKEY_CLASSES_ROOT,'AppID\'+GUIDToString(CLASS_coSpaceFunctionalServer)+'\Endpoints','ncacn_ip_tcp,0,') then Raise Exception.Create('could not open registry'); //. =>
  if NOT RegSetBinary(HKEY_CLASSES_ROOT,'AppID\'+GUIDToString(CLASS_coSpaceFunctionalServer)+'\LaunchPermission',LaunchPermissions) then Raise Exception.Create('could not open registry'); //. =>
  if NOT RegSetBinary(HKEY_CLASSES_ROOT,'AppID\'+GUIDToString(CLASS_coSpaceFunctionalServer)+'\AccessPermission',AccessPermissions) then Raise Exception.Create('could not open registry'); //. =>
  Halt; //. ->
  end;
Application.Title := 'GeoScope';
//.
if (NOT (unitSpaceFunctionalServer.flYes OR unitAreaNotificationServer.flYes))
 then begin
  UserProxySpaceIndex:=-1; if ParamStr(4) <> '' then try UserProxySpaceIndex:=StrToInt(ParamStr(4)) except end;
  try
  ProxySpace_Initialize(ParamStr(1),ParamStr(2),ParamStr(3),UserProxySpaceIndex);
  except
    On E: EAbort do begin
      TerminateProcess(GetCurrentProcess,1);
      end;
    On E: Exception do begin
      Application.ShowException(E);
      TerminateProcess(GetCurrentProcess,1);
      end;
    end;
  end;
try
//.
{$IFDEF MemCheck}
MemCheckLogFileName:=ExtractFilePath(GetModuleName(HInstance))+PathLog+'\'+'MemoryLeaks'+FormatDateTime('YYMMDD_HHNN',Now);
MemChk;
{$ENDIF}
//. create process main window 
Application.CreateForm(TServerProxySpacePicture, ServerProxySpacePicture);
ServerProxySpacePicture.Width:=0;
ServerProxySpacePicture.Height:=0;
Application.ShowMainForm:=true;
//.
Application.Run();
Application.Terminate();
finally
ProxySpace_Finalize();
end;
//. terminate process without unit-finalizations
TerminateProcess(GetCurrentProcess,0);
end.

