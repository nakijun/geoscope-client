{$H+}
unit SpaceInterfacesImport;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Types,
  GlobalSpaceDefines;

  {ISpaceManager}
  function  SpaceManager_SpaceID: Integer; stdcall;
  function  SpaceManager_SpacePackID: Integer; stdcall;
  function  SpaceManager_SpaceSize: Integer; stdcall;
  procedure SpaceManager_GetSpaceParams(out SpaceID: Integer; out SpacePackID: Integer; out SpaceSize: Integer; out SpaceLaysID: integer); stdcall;
  function  SpaceManager_ReadObj(const pUserName,pUserPassword: WideString; out Obj: TByteArray; const Size: Integer; const Pntr: Integer): WordBool; stdcall;
  function  SpaceManager_WriteObj(const pUserName,pUserPassword: WideString; const Obj: TByteArray; const Size: Integer; var Pntr: Integer; HExceptProxySpace: Integer): WordBool; stdcall;
  procedure SpaceManager_ReadObjects(const pUserName,pUserPassword: WideString; ObjPointers: TByteArray; const ObjPointersCount: Integer; out Objects: TByteArray); stdcall;
  procedure SpaceManager_ReadObjectsByIDs(const pUserName,pUserPassword: WideString; IDs: TByteArray; const IDsCount: Integer; out Objects: TByteArray); stdcall;
  procedure SpaceManager_ReadObjectsStructures(const pUserName,pUserPassword: WideString; ObjPointers: TByteArray; const ObjPointersCount: Integer; out Structures: TByteArray); stdcall;
  procedure SpaceManager_StartTransaction(const pUserName,pUserPassword: WideString); stdcall;
  procedure SpaceManager_CommitTransaction(const pUserName,pUserPassword: WideString); stdcall;
  procedure SpaceManager_RollbackTransaction(const pUserName,pUserPassword: WideString); stdcall;

  {ISpaceRemoteManager}
  procedure SpaceRemoteManager_ReadGroup(Group: TByteArray; out GroupDATA: TByteArray); stdcall;
  procedure SpaceRemoteManager_GetVisibleObjects(X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; Scale: Double; MinVisibleSquare: Integer; out DATA: TByteArray); stdcall;
  procedure SpaceRemoteManager_GetVisibleObjects1(const pUserName,pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; Scale: Double; MinVisibleSquare: Integer; out DATA: TByteArray); stdcall;
  procedure SpaceRemoteManager_GetVisibleObjects2(const pUserName,pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: TByteArray; MinVisibleSquare: Double; out DATA: TByteArray); stdcall;
  procedure SpaceRemoteManager_GetVisibleObjects3(const pUserName,pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: TByteArray; MinVisibleSquare: Double; MinVisibleWidth: Double; out DATA: TByteArray); stdcall;
  procedure SpaceRemoteManager_GetVisibleObjectsEx(X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; Scale: Double; MinVisibleSquare: Integer; out DATA: TByteArray); stdcall;
  function  SpaceRemoteManager_Obj_GetMinMax(out Xmin: Double; out Ymin: Double; out Xmax: Double; out Ymax: Double; ptrSelf: Integer): WordBool; stdcall;
  function  SpaceRemoteManager_Obj_GetMinMax1(const pUserName,pUserPassword: WideString; out Xmin: Double; out Ymin: Double; out Xmax: Double; out Ymax: Double; ptrSelf: Integer): WordBool; stdcall;
  function  SpaceRemoteManager_Obj_GetLevel(out Level: Integer; ptrSelf: Integer): WordBool; stdcall;
  function  SpaceRemoteManager_Obj_Owner(ptrSelf: Integer): Integer; stdcall;
  function  SpaceRemoteManager_Obj_RemoveReferences(const pUserName,pUserPassword: WideString; ptrSelf: Integer): WordBool; stdcall;
  function  SpaceRemoteManager_Obj_Ptr(idTObj: Integer; IDObj: Integer): Integer; stdcall;
  procedure SpaceRemoteManager_Obj_GetLayInfo(ptrObj: Integer; out LayID: Integer; out LayNumber: Integer; out SubLayNumber: Integer); stdcall;
  procedure SpaceRemoteManager_Obj_GetROOT(idTObj: Integer; IDObj: Integer; out idTROOT: Integer; out idROOT: Integer); stdcall;
  function  SpaceRemoteManager_CountLevel: Integer; stdcall;
  function  SpaceRemoteManager_Polygon_HasPointInside(PolygonNodes: TByteArray; PolygonLay: Integer; PolygonSubLay: Integer; ExceptObjPtr: Integer): WordBool; stdcall;
  function  SpaceRemoteManager_Polygon_IsPrivateAreaVisible(PolygonNodes: TByteArray; PolygonLay: Integer; PolygonSubLay: Integer; ExceptObjPtr: Integer; out PrivateAreas: TByteArray): WordBool; stdcall;

  {ISpaceReports}
  procedure SpaceReports_SpaceHistory_GetHistorySince(var TimeStamp: Double; out History: TByteArray); stdcall;
  procedure SpaceReports_ComponentsHistory_GetHistorySince(var TimeStamp: Double; out History: TByteArray); stdcall;
  procedure SpaceReports_VisualizationsHistory_GetHistorySince(var TimeStamp: Double; out History: TByteArray); stdcall;
  procedure SpaceReports_AllHistory_GetParams(out ItemLifeTime: Integer); stdcall; 
  procedure SpaceReports_AllHistory_GetParams1(out HistoryID: integer; out ItemLifeTime: Integer); stdcall; 
  procedure SpaceReports_AllHistory_GetParams2(out HistoryID: integer; out ItemLifeTime: Integer; out ComponentsMaxCount: Integer; out ReflectionsMaxCount: Integer; out VisualizationsMaxCount: Integer); stdcall; 
  procedure SpaceReports_AllHistory_GetHistorySince(var TimeStamp: Double; out SpaceHistory: TByteArray; out ComponentsHistory: TByteArray; out VisualizationsHistory: TByteArray); stdcall;
  procedure SpaceReports_AllHistory_GetHistorySince1(const pUserName,pUserPassword: WideString; var TimeStamp: Double; out SpaceHistory: TByteArray; out ComponentsHistory: TByteArray; out VisualizationsHistory: TByteArray); stdcall;
  procedure SpaceReports_SpaceHistory_GetHistorySinceUsingContext(var TimeStamp: Double; const Context: TByteArray;  out History: TByteArray); stdcall;
  procedure SpaceReports_ComponentsHistory_GetHistorySinceUsingContext(var TimeStamp: Double; const Context: TByteArray;  out History: TByteArray); stdcall;
  procedure SpaceReports_VisualizationsHistory_GetHistorySinceUsingContext(var TimeStamp: Double; const Context: TByteArray;  out History: TByteArray); stdcall;
  procedure SpaceReports_AllHistory_GetHistorySinceUsingContext(const pUserName,pUserPassword: WideString; Context: TByteArray; var TimeStamp: Double;  out SpaceHistory: TByteArray; out ComponentsHistory: TByteArray; out VisualizationsHistory: TByteArray); stdcall;
  procedure SpaceReports_AllHistory_GetHistorySinceUsingContext1(const pUserName,pUserPassword: WideString; Context: TByteArray; var TimeStamp: Double;  out SpaceHistory: TByteArray; out ComponentsHistory: TByteArray; out ComponentsUpdateHistory: TByteArray; out VisualizationsHistory: TByteArray); stdcall;
  procedure SpaceReports_ContextV0_GetParams(out ComponentsMaxCount: Integer; out ReflectionsMaxCount: Integer; out VisualizationsMaxCount: Integer); stdcall;

  {ISpaceUserProxySpaces}
  function  SpaceUserProxySpaces_CreateProxySpace(const pUserName,pUserPassword: WideString; const idUser: integer): integer; stdcall;
  procedure SpaceUserProxySpaces_DestroyProxySpace(const pUserName,pUserPassword: WideString; const idInstance: integer); stdcall;
  procedure SpaceUserProxySpaces_GetUserProxySpaces(const pUserName,pUserPassword: WideString; const idUser: integer; out ProxySpaces: TByteArray); stdcall;

  {ISpaceUserProxySpace}
  function  SpaceUserProxySpace_getName(const pUserName,pUserPassword: WideString; const idProxySpace: Integer): WideString; stdcall;
  procedure SpaceUserProxySpace_setName(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; Value: WideString); stdcall;
  function  SpaceUserProxySpace_Get_Config(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; out Config: TByteArray): boolean; stdcall;
  procedure SpaceUserProxySpace_Set_Config(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; Config: TByteArray); stdcall;
  function  SpaceUserProxySpace_Get_TypesSystemConfig(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; out TypesSystemConfig: TByteArray): boolean; stdcall;
  procedure SpaceUserProxySpace_Set_TypesSystemConfig(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; TypesSystemConfig: TByteArray); stdcall;
  function  SpaceUserProxySpace_Get_CreatingComponents(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; out CreatingComponents: TByteArray): boolean; stdcall;
  procedure SpaceUserProxySpace_Set_CreatingComponents(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; CreatingComponents: TByteArray); stdcall;
  function  SpaceUserProxySpace_Get_ComponentsPanelsHistory(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; out History: TByteArray): boolean; stdcall;
  procedure SpaceUserProxySpace_Set_ComponentsPanelsHistory(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; History: TByteArray); stdcall;
  procedure SpaceUserProxySpace_CheckUserProxySpace(const pUserName,pUserPassword: WideString; const idProxySpace: Integer); stdcall;

  {ISpaceUserReflectors}
  function  SpaceUserReflectors_CreateReflector(const pUserName,pUserPassword: WideString; const idUser: integer; const ReflectorType: Integer): integer; stdcall;
  procedure SpaceUserReflectors_DestroyReflector(const pUserName,pUserPassword: WideString; const idInstance: integer); stdcall;
  procedure SpaceUserReflectors_GetUserReflectors(const pUserName,pUserPassword: WideString; const idUser: integer; out Reflectors: TByteArray); stdcall;

  {ISpaceUserReflector}
  function  SpaceUserReflector_ReflectorType(const pUserName,pUserPassword: WideString; const idReflector: Integer): Integer; stdcall;
  function  SpaceUserReflector_getName(const pUserName,pUserPassword: WideString; const idReflector: Integer): WideString; stdcall;
  procedure SpaceUserReflector_setName(const pUserName,pUserPassword: WideString; const idReflector: Integer; Value: WideString); stdcall;
  function  SpaceUserReflector_Get_Config(const pUserName,pUserPassword: WideString; const idReflector: Integer; out Config: TByteArray): boolean; stdcall;
  procedure SpaceUserReflector_Set_Config(const pUserName,pUserPassword: WideString; const idReflector: Integer; Config: TByteArray); stdcall;
  function  SpaceUserReflector_Get_CreatingComponents(const pUserName,pUserPassword: WideString; const idReflector: Integer; out CreatingComponents: TByteArray): boolean; stdcall;
  procedure SpaceUserReflector_Set_CreatingComponents(const pUserName,pUserPassword: WideString; const idReflector: Integer; CreatingComponents: TByteArray); stdcall;
  function  SpaceUserReflector_Get_ElectedObjects(const pUserName,pUserPassword: WideString; const idReflector: Integer; out ElectedObjects: TByteArray): boolean; stdcall;
  procedure SpaceUserReflector_Set_ElectedObjects(const pUserName,pUserPassword: WideString; const idReflector: Integer; ElectedObjects: TByteArray); stdcall;
  function  SpaceUserReflector_Get_ElectedPlaces(const pUserName,pUserPassword: WideString; const idReflector: Integer; out ElectedPlaces: TByteArray): boolean; stdcall;
  procedure SpaceUserReflector_Set_ElectedPlaces(const pUserName,pUserPassword: WideString; const idReflector: Integer; ElectedPlaces: TByteArray); stdcall;
  function  SpaceUserReflector_Get_SelectedObjects(const pUserName,pUserPassword: WideString; const idReflector: Integer; out SelectedObjects: TByteArray): boolean; stdcall;
  procedure SpaceUserReflector_Set_SelectedObjects(const pUserName,pUserPassword: WideString; const idReflector: Integer; SelectedObjects: TByteArray); stdcall;
  function  SpaceUserReflector_Get_ReflectingCfg(const pUserName,pUserPassword: WideString; const idReflector: Integer; out ReflectingCfg: TByteArray): boolean; stdcall;
  procedure SpaceUserReflector_Set_ReflectingCfg(const pUserName,pUserPassword: WideString; const idReflector: Integer; ReflectingCfg: TByteArray); stdcall;
  function  SpaceUserReflector_Get_ReflectingHidedLays(const pUserName,pUserPassword: WideString; const idReflector: Integer; out ReflectingHidedLays: TByteArray): boolean; stdcall;
  procedure SpaceUserReflector_Set_ReflectingHidedLays(const pUserName,pUserPassword: WideString; const idReflector: Integer; ReflectingHidedLays: TByteArray); stdcall;
  function  SpaceUserReflector_IsEnabled(const pUserName,pUserPassword: WideString; const idReflector: Integer): boolean; stdcall;
  procedure SpaceUserReflector_SetEnabled(const pUserName,pUserPassword: WideString; const idReflector: Integer; const Enabled: boolean); stdcall;
  procedure SpaceUserReflector_CheckUserReflector(const pUserName,pUserPassword: WideString; const idReflector: Integer); stdcall;

  {ISpaceTypesSystemManager}
  procedure SpaceTypesSystemManager_GetTypesIDs(const pUserName,pUserPassword: WideString; out IDs: TByteArray); stdcall;
  //. export/import
  procedure SpaceTypesSystemManager_ExportComponents(const pUserName,pUserPassword: WideString; const ComponentsList: TByteArray; out DATAStream: TByteArray); stdcall;
  procedure SpaceTypesSystemManager_ImportComponents(const pUserName,pUserPassword: WideString; const DATAStream: TByteArray; out ComponentsList: TByteArray); stdcall;
  //. search
  procedure SpaceTypesSystemManager_TextSearch(const pUserName,pUserPassword: WideString; const Context: WideString; const flRootOwner: boolean; out ComponentsList: TByteArray); stdcall;
  procedure SpaceTypesSystemManager_ImageSearch(const pUserName,pUserPassword: WideString; const Context: TByteArray; const flRootOwner: boolean; out ComponentsList: TByteArray); stdcall;
  procedure SpaceTypesSystemManager_SoundSearch(const pUserName,pUserPassword: WideString; const Context: TByteArray; const flRootOwner: boolean; out ComponentsList: TByteArray); stdcall;

  //. server extensions

  {ISpaceProvider}
  {$IFDEF SOAPServer}
  procedure SpaceProvider_UpdateProviders(const pUserName,pUserPassword: WideString); stdcall;
  procedure SpaceProvider_GetSpaceWindowBitmap(const pUserName,pUserPassword: WideString; const X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const DynamicHintVisibility: Double; const Width,Height: integer; out BitmapData: TByteArray); stdcall;
  procedure SpaceProvider_GetSpaceWindowBitmap1(const pUserName,pUserPassword: WideString; const X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const DynamicHintVisibility: Double; const Width,Height: integer; const BitmapDataType: Integer; const flUpdateProxySpace: boolean; out BitmapData: TByteArray); stdcall;
  procedure SpaceProvider_GetSpaceWindowBitmap2(const pUserName,pUserPassword: WideString; const X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const VisualizationUserData: TByteArray; const Width,Height: integer; const BitmapDataType: Integer; const flUpdateProxySpace: boolean; out BitmapData: TByteArray); stdcall;
  {$ENDIF}
  procedure SpaceProvider_TileServer_GetData(const pUserName,pUserPassword: WideString; out Data: TByteArray); stdcall;
  procedure SpaceProvider_TileServer_GetServerData(const pUserName,pUserPassword: WideString; const idTileServerVisualization: Int64; out ServerData: TByteArray); stdcall;
  procedure SpaceProvider_TileServer_GetTiles(const pUserName,pUserPassword: WideString; const idTileServerVisualization: Int64; const ProviderID: DWord; const CompilationID: DWord; const Level: DWord; const XIndexMin,XIndexMax: DWord; const YIndexMin,YIndexMax: DWord; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;
  procedure SpaceProvider_TileServer_GetTiles1(const pUserName,pUserPassword: WideString; const idTileServerVisualization: Int64; const ProviderID: DWord; const CompilationID: DWord; const Level: DWord; const XIndexMin,XIndexMax: Int64; const YIndexMin,YIndexMax: Int64; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;


implementation
uses
  unitProxySpace;


const
  SpaceEmbeddedServerDLL = SpaceEmbeddedServerExecutive;

{ISpaceManager}
function  SpaceManager_SpaceID: Integer; stdcall; external SpaceEmbeddedServerDLL;
function  SpaceManager_SpacePackID: Integer; stdcall; external SpaceEmbeddedServerDLL;
function  SpaceManager_SpaceSize: Integer; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceManager_GetSpaceParams(out SpaceID: Integer; out SpacePackID: Integer; out SpaceSize: Integer; out SpaceLaysID: integer); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceManager_ReadObj(const pUserName,pUserPassword: WideString; out Obj: TByteArray; const Size: Integer; const Pntr: Integer): WordBool; stdcall; external SpaceEmbeddedServerDLL;
function  SpaceManager_WriteObj(const pUserName,pUserPassword: WideString; const Obj: TByteArray; const Size: Integer; var Pntr: Integer; HExceptProxySpace: Integer): WordBool; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceManager_ReadObjects(const pUserName,pUserPassword: WideString; ObjPointers: TByteArray; const ObjPointersCount: Integer; out Objects: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceManager_ReadObjectsByIDs(const pUserName,pUserPassword: WideString; IDs: TByteArray; const IDsCount: Integer; out Objects: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceManager_ReadObjectsStructures(const pUserName,pUserPassword: WideString; ObjPointers: TByteArray; const ObjPointersCount: Integer; out Structures: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceManager_StartTransaction(const pUserName,pUserPassword: WideString); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceManager_CommitTransaction(const pUserName,pUserPassword: WideString); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceManager_RollbackTransaction(const pUserName,pUserPassword: WideString); stdcall; external SpaceEmbeddedServerDLL;

{ISpaceRemoteManager}
procedure SpaceRemoteManager_ReadGroup(Group: TByteArray; out GroupDATA: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceRemoteManager_GetVisibleObjects(X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; Scale: Double; MinVisibleSquare: Integer; out DATA: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceRemoteManager_GetVisibleObjects1(const pUserName,pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; Scale: Double; MinVisibleSquare: Integer; out DATA: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceRemoteManager_GetVisibleObjects2(const pUserName,pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: TByteArray; MinVisibleSquare: Double; out DATA: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceRemoteManager_GetVisibleObjects3(const pUserName,pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: TByteArray; MinVisibleSquare: Double; MinVisibleWidth: Double; out DATA: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceRemoteManager_GetVisibleObjectsEx(X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; Scale: Double; MinVisibleSquare: Integer; out DATA: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceRemoteManager_Obj_GetMinMax(out Xmin: Double; out Ymin: Double; out Xmax: Double; out Ymax: Double; ptrSelf: Integer): WordBool; stdcall; external SpaceEmbeddedServerDLL;
function  SpaceRemoteManager_Obj_GetMinMax1(const pUserName,pUserPassword: WideString; out Xmin: Double; out Ymin: Double; out Xmax: Double; out Ymax: Double; ptrSelf: Integer): WordBool; stdcall; external SpaceEmbeddedServerDLL;
function  SpaceRemoteManager_Obj_GetLevel(out Level: Integer; ptrSelf: Integer): WordBool; stdcall; external SpaceEmbeddedServerDLL;
function  SpaceRemoteManager_Obj_Owner(ptrSelf: Integer): Integer; stdcall; external SpaceEmbeddedServerDLL;
function  SpaceRemoteManager_Obj_RemoveReferences(const pUserName,pUserPassword: WideString; ptrSelf: Integer): WordBool; stdcall; external SpaceEmbeddedServerDLL;
function  SpaceRemoteManager_Obj_Ptr(idTObj: Integer; IDObj: Integer): Integer; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceRemoteManager_Obj_GetLayInfo(ptrObj: Integer; out LayID: Integer; out LayNumber: Integer; out SubLayNumber: Integer); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceRemoteManager_Obj_GetROOT(idTObj: Integer; IDObj: Integer; out idTROOT: Integer; out idROOT: Integer); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceRemoteManager_CountLevel: Integer; stdcall; external SpaceEmbeddedServerDLL;
function  SpaceRemoteManager_Polygon_HasPointInside(PolygonNodes: TByteArray; PolygonLay: Integer; PolygonSubLay: Integer; ExceptObjPtr: Integer): WordBool; stdcall; external SpaceEmbeddedServerDLL;
function  SpaceRemoteManager_Polygon_IsPrivateAreaVisible(PolygonNodes: TByteArray; PolygonLay: Integer; PolygonSubLay: Integer; ExceptObjPtr: Integer; out PrivateAreas: TByteArray): WordBool; stdcall; external SpaceEmbeddedServerDLL;

{ISpaceReports}
procedure SpaceReports_SpaceHistory_GetHistorySince(var TimeStamp: Double; out History: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_ComponentsHistory_GetHistorySince(var TimeStamp: Double; out History: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_VisualizationsHistory_GetHistorySince(var TimeStamp: Double; out History: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_AllHistory_GetParams(out ItemLifeTime: Integer); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_AllHistory_GetParams1(out HistoryID: integer; out ItemLifeTime: Integer); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_AllHistory_GetParams2(out HistoryID: integer; out ItemLifeTime: Integer; out ComponentsMaxCount: Integer; out ReflectionsMaxCount: Integer; out VisualizationsMaxCount: Integer); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_AllHistory_GetHistorySince(var TimeStamp: Double; out SpaceHistory: TByteArray; out ComponentsHistory: TByteArray; out VisualizationsHistory: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_AllHistory_GetHistorySince1(const pUserName,pUserPassword: WideString; var TimeStamp: Double; out SpaceHistory: TByteArray; out ComponentsHistory: TByteArray; out VisualizationsHistory: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_SpaceHistory_GetHistorySinceUsingContext(var TimeStamp: Double; const Context: TByteArray;  out History: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_ComponentsHistory_GetHistorySinceUsingContext(var TimeStamp: Double; const Context: TByteArray;  out History: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_VisualizationsHistory_GetHistorySinceUsingContext(var TimeStamp: Double; const Context: TByteArray;  out History: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_AllHistory_GetHistorySinceUsingContext(const pUserName,pUserPassword: WideString; Context: TByteArray; var TimeStamp: Double;  out SpaceHistory: TByteArray; out ComponentsHistory: TByteArray; out VisualizationsHistory: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_AllHistory_GetHistorySinceUsingContext1(const pUserName,pUserPassword: WideString; Context: TByteArray; var TimeStamp: Double;  out SpaceHistory: TByteArray; out ComponentsHistory: TByteArray; out ComponentsUpdateHistory: TByteArray; out VisualizationsHistory: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceReports_ContextV0_GetParams(out ComponentsMaxCount: Integer; out ReflectionsMaxCount: Integer; out VisualizationsMaxCount: Integer); stdcall; external SpaceEmbeddedServerDLL;

{ISpaceUserProxySpaces}
function  SpaceUserProxySpaces_CreateProxySpace(const pUserName,pUserPassword: WideString; const idUser: integer): integer; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserProxySpaces_DestroyProxySpace(const pUserName,pUserPassword: WideString; const idInstance: integer); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserProxySpaces_GetUserProxySpaces(const pUserName,pUserPassword: WideString; const idUser: integer; out ProxySpaces: TByteArray); stdcall; external SpaceEmbeddedServerDLL;

{ISpaceUserProxySpace}
function  SpaceUserProxySpace_getName(const pUserName,pUserPassword: WideString; const idProxySpace: Integer): WideString; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserProxySpace_setName(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; Value: WideString); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserProxySpace_Get_Config(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; out Config: TByteArray): boolean; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserProxySpace_Set_Config(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; Config: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserProxySpace_Get_TypesSystemConfig(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; out TypesSystemConfig: TByteArray): boolean; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserProxySpace_Set_TypesSystemConfig(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; TypesSystemConfig: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserProxySpace_Get_CreatingComponents(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; out CreatingComponents: TByteArray): boolean; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserProxySpace_Set_CreatingComponents(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; CreatingComponents: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserProxySpace_Get_ComponentsPanelsHistory(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; out History: TByteArray): boolean; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserProxySpace_Set_ComponentsPanelsHistory(const pUserName,pUserPassword: WideString; const idProxySpace: Integer; History: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserProxySpace_CheckUserProxySpace(const pUserName,pUserPassword: WideString; const idProxySpace: Integer); stdcall; external SpaceEmbeddedServerDLL;

{ISpaceUserReflectors}
function  SpaceUserReflectors_CreateReflector(const pUserName,pUserPassword: WideString; const idUser: integer; const ReflectorType: Integer): integer; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserReflectors_DestroyReflector(const pUserName,pUserPassword: WideString; const idInstance: integer); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserReflectors_GetUserReflectors(const pUserName,pUserPassword: WideString; const idUser: integer; out Reflectors: TByteArray); stdcall; external SpaceEmbeddedServerDLL;

{ISpaceUserReflector}
function  SpaceUserReflector_ReflectorType(const pUserName,pUserPassword: WideString; const idReflector: Integer): Integer; stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserReflector_getName(const pUserName,pUserPassword: WideString; const idReflector: Integer): WideString; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserReflector_setName(const pUserName,pUserPassword: WideString; const idReflector: Integer; Value: WideString); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserReflector_Get_Config(const pUserName,pUserPassword: WideString; const idReflector: Integer; out Config: TByteArray): boolean; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserReflector_Set_Config(const pUserName,pUserPassword: WideString; const idReflector: Integer; Config: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserReflector_Get_CreatingComponents(const pUserName,pUserPassword: WideString; const idReflector: Integer; out CreatingComponents: TByteArray): boolean; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserReflector_Set_CreatingComponents(const pUserName,pUserPassword: WideString; const idReflector: Integer; CreatingComponents: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserReflector_Get_ElectedObjects(const pUserName,pUserPassword: WideString; const idReflector: Integer; out ElectedObjects: TByteArray): boolean; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserReflector_Set_ElectedObjects(const pUserName,pUserPassword: WideString; const idReflector: Integer; ElectedObjects: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserReflector_Get_ElectedPlaces(const pUserName,pUserPassword: WideString; const idReflector: Integer; out ElectedPlaces: TByteArray): boolean; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserReflector_Set_ElectedPlaces(const pUserName,pUserPassword: WideString; const idReflector: Integer; ElectedPlaces: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserReflector_Get_SelectedObjects(const pUserName,pUserPassword: WideString; const idReflector: Integer; out SelectedObjects: TByteArray): boolean; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserReflector_Set_SelectedObjects(const pUserName,pUserPassword: WideString; const idReflector: Integer; SelectedObjects: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserReflector_Get_ReflectingCfg(const pUserName,pUserPassword: WideString; const idReflector: Integer; out ReflectingCfg: TByteArray): boolean; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserReflector_Set_ReflectingCfg(const pUserName,pUserPassword: WideString; const idReflector: Integer; ReflectingCfg: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserReflector_Get_ReflectingHidedLays(const pUserName,pUserPassword: WideString; const idReflector: Integer; out ReflectingHidedLays: TByteArray): boolean; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserReflector_Set_ReflectingHidedLays(const pUserName,pUserPassword: WideString; const idReflector: Integer; ReflectingHidedLays: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
function  SpaceUserReflector_IsEnabled(const pUserName,pUserPassword: WideString; const idReflector: Integer): boolean; stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserReflector_SetEnabled(const pUserName,pUserPassword: WideString; const idReflector: Integer; const Enabled: boolean); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceUserReflector_CheckUserReflector(const pUserName,pUserPassword: WideString; const idReflector: Integer); stdcall; external SpaceEmbeddedServerDLL;

{ISpaceTypesSystemManager}
procedure SpaceTypesSystemManager_GetTypesIDs(const pUserName,pUserPassword: WideString; out IDs: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
//. export/import
procedure SpaceTypesSystemManager_ExportComponents(const pUserName,pUserPassword: WideString; const ComponentsList: TByteArray; out DATAStream: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceTypesSystemManager_ImportComponents(const pUserName,pUserPassword: WideString; const DATAStream: TByteArray; out ComponentsList: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
//. search
procedure SpaceTypesSystemManager_TextSearch(const pUserName,pUserPassword: WideString; const Context: WideString; const flRootOwner: boolean; out ComponentsList: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceTypesSystemManager_ImageSearch(const pUserName,pUserPassword: WideString; const Context: TByteArray; const flRootOwner: boolean; out ComponentsList: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceTypesSystemManager_SoundSearch(const pUserName,pUserPassword: WideString; const Context: TByteArray; const flRootOwner: boolean; out ComponentsList: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
    
//. server extensions

{ISpaceProvider}
{$IFDEF SOAPServer}
procedure SpaceProvider_UpdateProviders(const pUserName,pUserPassword: WideString); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceProvider_GetSpaceWindowBitmap(const pUserName,pUserPassword: WideString; const X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const DynamicHintVisibility: Double; const Width,Height: integer; out BitmapData: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceProvider_GetSpaceWindowBitmap1(const pUserName,pUserPassword: WideString; const X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const DynamicHintVisibility: Double; const Width,Height: integer; const BitmapDataType: Integer; const flUpdateProxySpace: boolean; out BitmapData: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceProvider_GetSpaceWindowBitmap2(const pUserName,pUserPassword: WideString; const X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const VisualizationUserData: TByteArray; const Width,Height: integer; const BitmapDataType: Integer; const flUpdateProxySpace: boolean; out BitmapData: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
{$ENDIF}
procedure SpaceProvider_TileServer_GetData(const pUserName,pUserPassword: WideString; out Data: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceProvider_TileServer_GetServerData(const pUserName,pUserPassword: WideString; const idTileServerVisualization: Int64; out ServerData: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceProvider_TileServer_GetTiles(const pUserName,pUserPassword: WideString; const idTileServerVisualization: Int64; const ProviderID: DWord; const CompilationID: DWord; const Level: DWord; const XIndexMin,XIndexMax: DWord; const YIndexMin,YIndexMax: DWord; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall; external SpaceEmbeddedServerDLL;
procedure SpaceProvider_TileServer_GetTiles1(const pUserName,pUserPassword: WideString; const idTileServerVisualization: Int64; const ProviderID: DWord; const CompilationID: DWord; const Level: DWord; const XIndexMin,XIndexMax: Int64; const YIndexMin,YIndexMax: Int64; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall; external SpaceEmbeddedServerDLL;


end.
