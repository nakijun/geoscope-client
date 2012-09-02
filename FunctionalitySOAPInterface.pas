unit FunctionalitySOAPInterface;

interface

uses
  ActiveX,
  RIO,
  InvokeRegistry,
  SOAPHTTPClient,
  Types,
  XSBuiltIns,
  Graphics,
  GlobalSpaceDefines;

Type
  ISpaceManager = interface(IInvokable)
  ['{388AB755-7B0A-C96A-9B4C-18904C8CAAE8}']
    function  SpaceID: Integer; stdcall;
    function  SpacePackID: Integer; stdcall;
    function  SpaceSize: Integer; stdcall;
    procedure GetSpaceParams(out SpaceID: Integer; out SpacePackID: Integer; out SpaceSize: Integer; out SpaceLaysID: integer); stdcall;
    function  ReadObjects(const pUserName,pUserPassword: WideString; const ObjPointers: TByteArray; const ObjPointersCount: Integer): TByteArray; stdcall;
    procedure ReadObjectsByIDs(const pUserName,pUserPassword: WideString; IDs: TByteArray; const IDsCount: Integer; out Objects: TByteArray); stdcall;
    function  ReadObjectsStructures(const pUserName,pUserPassword: WideString; const ObjPointers: TByteArray; const ObjPointersCount: Integer): TByteArray; stdcall;
  end;
  function GetISpaceManager(const ServerURL: WideString): ISpaceManager;
   
Type
  ISpaceRemoteManager = interface(IInvokable)
  ['{F9192998-67D9-1BE3-DBDD-B5B236CF96B7}']
    function  GetVisibleObjects(const X0: Double; const Y0: Double; const X1: Double; const Y1: Double; const X2: Double; const Y2: Double; const X3: Double; const Y3: Double; const Scale: Double; const MinVisibleSquare: Integer): TByteArray; stdcall;
    function  GetVisibleObjects1(const pUserName,pUserPassword: WideString; const X0: Double; const Y0: Double; const X1: Double; const Y1: Double; const X2: Double; const Y2: Double; const X3: Double; const Y3: Double; const Scale: Double; const MinVisibleSquare: Integer): TByteArray; stdcall;
    function  GetVisibleObjects2(const pUserName,pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: TByteArray; MinVisibleSquare: Double): TByteArray; stdcall;
    function  GetVisibleObjects3(const pUserName,pUserPassword: WideString; X0: Double; Y0: Double; X1: Double; Y1: Double; X2: Double; Y2: Double; X3: Double; Y3: Double; HidedLaysArray: TByteArray; MinVisibleSquare: Double; MinVisibleWidth: Double): TByteArray; stdcall;
    function  Obj_GetMinMax(const ptrSelf: Integer; out Xmin: Double; out Ymin: Double; out Xmax: Double; out Ymax: Double): Boolean; stdcall;
    function  Obj_GetMinMax1(const pUserName,pUserPassword: WideString; const ptrSelf: Integer; out Xmin: Double; out Ymin: Double; out Xmax: Double; out Ymax: Double): Boolean; stdcall;
    function  Obj_GetLevel(const ptrSelf: Integer; out Level: Integer): Boolean; stdcall;
    function  Obj_Owner(const ptrSelf: Integer): Integer; stdcall;
    function  Obj_Ptr(const idTObj: Integer; const IDObj: Integer): Integer; stdcall;
    procedure Obj_GetLayInfo(const ptrObj: Integer; out LayID: Integer; out LayNumber: Integer; out SubLayNumber: Integer); stdcall;
    procedure Obj_GetROOT(const idTObj: Integer; const IDObj: Integer; out idTROOT: Integer; out idROOT: Integer); stdcall;
    function  CountLevel: Integer; stdcall;
    function  Polygon_HasPointInside(const PolygonNodes: TByteArray; const PolygonLay: Integer; const PolygonSubLay: Integer; const ExceptObjPtr: Integer): Boolean; stdcall;
    function  Polygon_IsPrivateAreaVisible(const PolygonNodes: TByteArray; const PolygonLay: Integer; const PolygonSubLay: Integer; const ExceptObjPtr: Integer; out PrivateAreas: TByteArray): Boolean; stdcall;
  end;
  function GetISpaceRemoteManager(const ServerURL: WideString): ISpaceRemoteManager;

Type
  ISpaceReports = interface(IInvokable)
  ['{3ABF5E5F-1E67-4829-A234-13D48E457E6E}']
    procedure SpaceHistory_GetHistorySince(var TimeStamp: Double; out History: TByteArray); stdcall;
    procedure ComponentsHistory_GetHistorySince(var TimeStamp: Double; out History: TByteArray); stdcall;
    procedure VisualizationsHistory_GetHistorySince(var TimeStamp: Double; out History: TByteArray); stdcall;
    procedure AllHistory_GetParams(out ItemLifeTime: Integer); stdcall;
    procedure AllHistory_GetParams1(out HistoryID: integer; out ItemLifeTime: Integer); stdcall;
    procedure AllHistory_GetParams2(out HistoryID: integer; out ItemLifeTime: Integer; out ComponentsMaxCount: Integer; out ReflectionsMaxCount: Integer; out VisualizationsMaxCount: Integer); stdcall;
    procedure AllHistory_GetHistorySince(var TimeStamp: Double; out SpaceHistory: TByteArray; out ComponentsHistory: TByteArray; out VisualizationsHistory: TByteArray); stdcall;
    procedure AllHistory_GetHistorySince1(const pUserName,pUserPassword: WideString; var TimeStamp: Double; out SpaceHistory: TByteArray; out ComponentsHistory: TByteArray; out VisualizationsHistory: TByteArray); stdcall;
    procedure SpaceHistory_GetHistorySinceUsingContext(var TimeStamp: Double; const Context: TByteArray;  out History: TByteArray); stdcall;
    procedure ComponentsHistory_GetHistorySinceUsingContext(var TimeStamp: Double; const Context: TByteArray;  out History: TByteArray); stdcall;
    procedure VisualizationsHistory_GetHistorySinceUsingContext(var TimeStamp: Double; const Context: TByteArray;  out History: TByteArray); stdcall;
    procedure AllHistory_GetHistorySinceUsingContext(const pUserName,pUserPassword: WideString; Context: TByteArray; var TimeStamp: Double;  out SpaceHistory: TByteArray; out ComponentsHistory: TByteArray; out VisualizationsHistory: TByteArray); stdcall;
    procedure AllHistory_GetHistorySinceUsingContext1(const pUserName,pUserPassword: WideString; Context: TByteArray; var TimeStamp: Double;  out SpaceHistory: TByteArray; out ComponentsHistory: TByteArray; out ComponentsUpdateHistory: TByteArray; out VisualizationsHistory: TByteArray); stdcall;
    procedure ContextV0_GetParams(out ComponentsMaxCount: Integer; out ReflectionsMaxCount: Integer; out VisualizationsMaxCount: Integer); stdcall;
  end;
  function GetISpaceReports(const ServerURL: WideString): ISpaceReports;

Type
  ISpaceUserProxySpaces = interface(IInvokable)
  ['{9080AED4-2B13-1890-1347-C439A0B1D3F2}']
    function  CreateProxySpace(const pUserName: WideString; const pUserPassword: WideString; const idUser: Integer): Integer; stdcall;
    procedure DestroyProxySpace(const pUserName: WideString; const pUserPassword: WideString; const idInstance: Integer); stdcall;
    function  GetUserProxySpaces(const pUserName: WideString; const pUserPassword: WideString; const idUser: Integer): TByteArray; stdcall;
  end;
  function GetISpaceUserProxySpaces(const ServerURL: WideString): ISpaceUserProxySpaces;

Type
  ISpaceUserProxySpace = interface(IInvokable)
  ['{DFA39BD7-36F7-BB28-CD81-A9AC3B9B168B}']
    function  getName(const pUserName: WideString; const pUserPassword: WideString; const idProxySpace: Integer): WideString; stdcall;
    procedure setName(const pUserName: WideString; const pUserPassword: WideString; const idProxySpace: Integer; const Value: WideString); stdcall;
    function  Get_Config(const pUserName: WideString; const pUserPassword: WideString; const idProxySpace: Integer; out Config: TByteArray): Boolean; stdcall;
    procedure Set_Config(const pUserName: WideString; const pUserPassword: WideString; const idProxySpace: Integer; const Config: TByteArray); stdcall;
    function  Get_TypesSystemConfig(const pUserName: WideString; const pUserPassword: WideString; const idProxySpace: Integer; out TypesSystemConfig: TByteArray): Boolean; stdcall;
    procedure Set_TypesSystemConfig(const pUserName: WideString; const pUserPassword: WideString; const idProxySpace: Integer; const TypesSystemConfig: TByteArray); stdcall;
    function  Get_CreatingComponents(const pUserName: WideString; const pUserPassword: WideString; const idProxySpace: Integer; out CreatingComponents: TByteArray): Boolean; stdcall;
    procedure Set_CreatingComponents(const pUserName: WideString; const pUserPassword: WideString; const idProxySpace: Integer; const CreatingComponents: TByteArray); stdcall;
    function  Get_ComponentsPanelsHistory(const pUserName: WideString; const pUserPassword: WideString; const idProxySpace: Integer; out History: TByteArray): Boolean; stdcall;
    procedure Set_ComponentsPanelsHistory(const pUserName: WideString; const pUserPassword: WideString; const idProxySpace: Integer; const History: TByteArray); stdcall;
  end;
  function GetISpaceUserProxySpace(const ServerURL: WideString): ISpaceUserProxySpace;

Type
  ISpaceUserReflectors = interface(IInvokable)
  ['{FB189517-D138-F041-8C8E-D27453060EAD}']
    function  CreateReflector(const pUserName: WideString; const pUserPassword: WideString; const idUser: Integer; const ReflectorType: Integer): Integer; stdcall;
    procedure DestroyReflector(const pUserName: WideString; const pUserPassword: WideString; const idInstance: Integer); stdcall;
    function  GetUserReflectors(const pUserName: WideString; const pUserPassword: WideString; const idUser: Integer): TByteArray; stdcall;
  end;
  function GetISpaceUserReflectors(const ServerURL: WideString): ISpaceUserReflectors;

Type
  ISpaceUserReflector = interface(IInvokable)
  ['{8AE6C17B-CF11-C09F-167B-C4219D08803B}']
    function  ReflectorType(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer): Integer; stdcall;
    function  getName(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer): WideString; stdcall;
    procedure setName(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; const Value: WideString); stdcall;
    function  Get_Config(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; out Config: TByteArray): Boolean; stdcall;
    procedure Set_Config(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; const Config: TByteArray); stdcall;
    function  Get_CreatingComponents(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; out CreatingComponents: TByteArray): Boolean; stdcall;
    procedure Set_CreatingComponents(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; const CreatingComponents: TByteArray); stdcall;
    function  Get_ElectedObjects(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; out ElectedObjects: TByteArray): Boolean; stdcall;
    procedure Set_ElectedObjects(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; const ElectedObjects: TByteArray); stdcall;
    function  Get_ElectedPlaces(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; out ElectedPlaces: TByteArray): Boolean; stdcall;
    procedure Set_ElectedPlaces(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; const ElectedPlaces: TByteArray); stdcall;
    function  Get_SelectedObjects(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; out SelectedObjects: TByteArray): Boolean; stdcall;
    procedure Set_SelectedObjects(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; const SelectedObjects: TByteArray); stdcall;
    function  Get_ReflectingCfg(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; out ReflectingCfg: TByteArray): Boolean; stdcall;
    procedure Set_ReflectingCfg(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; const ReflectingCfg: TByteArray); stdcall;
    function  Get_ReflectingHidedLays(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; out ReflectingHidedLays: TByteArray): Boolean; stdcall;
    procedure Set_ReflectingHidedLays(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; const ReflectingHidedLays: TByteArray); stdcall;
    function  IsEnabled(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer): Boolean; stdcall;
    procedure SetEnabled(const pUserName: WideString; const pUserPassword: WideString; const idReflector: Integer; const Enabled: Boolean); stdcall;
  end;
  function GetISpaceUserReflector(const ServerURL: WideString): ISpaceUserReflector;

Type
  ISpaceTypesSystemManager = interface(IInvokable)
  ['{33B3822F-FAE9-43D3-91F7-F5A65E80B13C}']
    procedure GetTypesIDs(const pUserName,pUserPassword: WideString; out IDs: TByteArray); stdcall;
    //. export/import
    procedure ExportComponents(const pUserName,pUserPassword: WideString; const ComponentsList: TByteArray; out DATAStream: TByteArray); stdcall;
    procedure ImportComponents(const pUserName,pUserPassword: WideString; const DATAStream: TByteArray; out ComponentsList: TByteArray); stdcall;
    //. search
    procedure TextSearch(const pUserName,pUserPassword: WideString; const Context: WideString; const flRootOwner: boolean; out ComponentsList: TByteArray); stdcall;
    procedure ImageSearch(const pUserName,pUserPassword: WideString; const Context: TByteArray; const flRootOwner: boolean; out ComponentsList: TByteArray); stdcall;
    procedure SoundSearch(const pUserName,pUserPassword: WideString; const Context: TByteArray; const flRootOwner: boolean; out ComponentsList: TByteArray); stdcall;
  end;
  function GetISpaceTypesSystemManager(const ServerURL: WideString): ISpaceTypesSystemManager;

Type
  ISpaceProvider = Interface(IInvokable)
    ['{B902FA8E-17EE-480F-B53F-C1D576D28E3D}']
    procedure GetSpaceWindowBitmap(const pUserName,pUserPassword: WideString; const X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const DynamicHintVisibility: Double; const Width,Height: integer; out BitmapData: TByteArray); stdcall;
    procedure GetSpaceWindowBitmap1(const pUserName,pUserPassword: WideString; const X0,Y0,X1,Y1,X2,Y2,X3,Y3: Double; const HidedLaysArray: TByteArray; const VisibleFactor: integer; const DynamicHintVisibility: Double; const Width,Height: integer; const BitmapDataType: Integer; out BitmapData: TByteArray); stdcall;
    procedure TileServer_GetServerData(const pUserName,pUserPassword: WideString; const idTileServerVisualization: Int64; out ServerData: TByteArray); stdcall;
    procedure TileServer_GetTiles(const pUserName,pUserPassword: WideString; const idTileServerVisualization: Int64; const ProviderID: DWord; const CompilationID: DWord; const Level: DWord; const XIndexMin,XIndexMax: DWord; const YIndexMin,YIndexMax: DWord; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;
    procedure TileServer_GetTiles1(const pUserName,pUserPassword: WideString; const idTileServerVisualization: Int64; const ProviderID: DWord; const CompilationID: DWord; const Level: DWord; const XIndexMin,XIndexMax: Int64; const YIndexMin,YIndexMax: Int64; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;
  end;
  function GetISpaceProvider(const ServerURL: WideString): ISpaceProvider;


{$I FSIFunctionalityInterfaces.inc}
{$I FSITypesFunctionalityInterfaces.inc}


implementation
Uses
  unitProxySpace;


function GetISpaceManager(const ServerURL: WideString): ISpaceManager;
var
  RIO: THTTPRIO;
  Addr: WideString;
begin
Result:=nil;
Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'SpaceManager';
RIO:=THTTPRIO.Create(nil);
RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
try
Result:=(RIO as ISpaceManager);
RIO.URL:=Addr;
finally
if (Result = nil) then RIO.Free;
end;
end;

function GetISpaceRemoteManager(const ServerURL: WideString): ISpaceRemoteManager;
var
  RIO: THTTPRIO;
  Addr: WideString;
begin
Result:=nil;
Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'SpaceRemoteManager';
RIO:=THTTPRIO.Create(nil);
RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
try
Result:=(RIO as ISpaceRemoteManager);
RIO.URL:=Addr;
finally
if (Result = nil) then RIO.Free;
end;
end;

function GetISpaceReports(const ServerURL: WideString): ISpaceReports;
var
  RIO: THTTPRIO;
  Addr: WideString;
begin
Result:=nil;
Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'SpaceReports';
RIO:=THTTPRIO.Create(nil);
RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
try
Result:=(RIO as ISpaceReports);
RIO.URL:=Addr;
finally
if (Result = nil) then RIO.Free;
end;
end;

function GetISpaceUserProxySpaces(const ServerURL: WideString): ISpaceUserProxySpaces;
var
  RIO: THTTPRIO;
  Addr: WideString;
begin
Result:=nil;
Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'SpaceUserProxySpaces';
RIO:=THTTPRIO.Create(nil);
RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
try
Result:=(RIO as ISpaceUserProxySpaces);
RIO.URL:=Addr;
finally
if (Result = nil) then RIO.Free;
end;
end;

function GetISpaceUserProxySpace(const ServerURL: WideString): ISpaceUserProxySpace;
var
  RIO: THTTPRIO;
  Addr: WideString;
begin
Result:=nil;
Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'SpaceUserProxySpace';
RIO:=THTTPRIO.Create(nil);
RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
try
Result:=(RIO as ISpaceUserProxySpace);
RIO.URL:=Addr;
finally
if (Result = nil) then RIO.Free;
end;
end;

function GetISpaceUserReflectors(const ServerURL: WideString): ISpaceUserReflectors;
var
  RIO: THTTPRIO;
  Addr: WideString;
begin
Result:=nil;
Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'SpaceUserReflectors';
RIO:=THTTPRIO.Create(nil);
RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
try
Result:=(RIO as ISpaceUserReflectors);
RIO.URL:=Addr;
finally
if (Result = nil) then RIO.Free;
end;
end;

function GetISpaceUserReflector(const ServerURL: WideString): ISpaceUserReflector;
var
  RIO: THTTPRIO;
  Addr: WideString;
begin
Result:=nil;
Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'SpaceUserReflector';
RIO:=THTTPRIO.Create(nil);
RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
try
Result:=(RIO as ISpaceUserReflector);
RIO.URL:=Addr;
finally
if (Result = nil) then RIO.Free;
end;
end;

function GetISpaceTypesSystemManager(const ServerURL: WideString): ISpaceTypesSystemManager;
var
  RIO: THTTPRIO;
  Addr: WideString;
begin
Result:=nil;
Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'SpaceTypesSystemManager';
RIO:=THTTPRIO.Create(nil);
RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
try
Result:=(RIO as ISpaceTypesSystemManager);
RIO.URL:=Addr;
finally
if (Result = nil) then RIO.Free;
end;
end;

function GetISpaceProvider(const ServerURL: WideString): ISpaceProvider;
var
  RIO: THTTPRIO;
  Addr: WideString;
begin
Result:=nil;
Addr:=ServerURL+'/'+'SOAP'+'/'+'I'+'SpaceProvider';
RIO:=THTTPRIO.Create(nil);
RIO.HTTPWebNode.OnReceivingData:=ProxySpace.Log.DoOnDataReceiving;
RIO.HTTPWebNode.OnPostingData:=ProxySpace.Log.DoOnDataTransmitting;
try
Result:=(RIO as ISpaceProvider);
RIO.URL:=Addr;
finally
if (Result = nil) then RIO.Free;
end;
end;


{$I FSIFunctionalityInterfacesImplementation.inc}
{$I FSITypesFunctionalityInterfacesImplementation.inc}

const
  Encoding = 'utf-8';

procedure FSIFunctionalityInterfacesRegister_Initialize();
begin
{$I FSIFunctionalityInterfacesRegister.inc}
end;

procedure FSITypesFunctionalityInterfacesRegister_Initialize();
begin
{$I FSITypesFunctionalityInterfacesRegister.inc}
end;

initialization
CoInitializeEx(nil, COINIT_MULTITHREADED); //. testing
//.
RemClassRegistry.RegisterXSInfo(TypeInfo(TByteArray), 'urn:GlobalSpaceDefines', 'TByteArray');
//.
InvRegistry.RegisterInterface(TypeInfo(ISpaceManager), 'urn:FunctionalitySOAPInterface-ISpaceManager', Encoding);
InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISpaceManager), 'urn:FunctionalitySOAPInterface-ISpaceManager#%operationName%');
//.
InvRegistry.RegisterInterface(TypeInfo(ISpaceRemoteManager), 'urn:FunctionalitySOAPInterface-ISpaceRemoteManager', Encoding);
InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISpaceRemoteManager), 'urn:FunctionalitySOAPInterface-ISpaceRemoteManager#%operationName%');
//.
InvRegistry.RegisterInterface(TypeInfo(ISpaceReports), 'urn:FunctionalitySOAPInterface-ISpaceReports', Encoding);
InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISpaceReports), 'urn:FunctionalitySOAPInterface-ISpaceReports#%operationName%');
//.
InvRegistry.RegisterInterface(TypeInfo(ISpaceUserProxySpaces), 'urn:FunctionalitySOAPInterface-ISpaceUserProxySpaces', Encoding);
InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISpaceUserProxySpaces), 'urn:FunctionalitySOAPInterface-ISpaceUserProxySpaces#%operationName%');
//.
InvRegistry.RegisterInterface(TypeInfo(ISpaceUserProxySpace), 'urn:FunctionalitySOAPInterface-ISpaceUserProxySpace', Encoding);
InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISpaceUserProxySpace), 'urn:FunctionalitySOAPInterface-ISpaceUserProxySpace#%operationName%');
//.
InvRegistry.RegisterInterface(TypeInfo(ISpaceUserReflectors), 'urn:FunctionalitySOAPInterface-ISpaceUserReflectors', Encoding);
InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISpaceUserReflectors), 'urn:FunctionalitySOAPInterface-ISpaceUserReflectors#%operationName%');
//.
InvRegistry.RegisterInterface(TypeInfo(ISpaceUserReflector), 'urn:FunctionalitySOAPInterface-ISpaceUserReflector', Encoding);
InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISpaceUserReflector), 'urn:FunctionalitySOAPInterface-ISpaceUserReflector#%operationName%');
//.
InvRegistry.RegisterInterface(TypeInfo(ISpaceTypesSystemManager), 'urn:FunctionalitySOAPInterface-ISpaceTypesSystemManager', Encoding);
InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISpaceTypesSystemManager), 'urn:FunctionalitySOAPInterface-ISpaceTypesSystemManager#%operationName%');
//.
InvRegistry.RegisterInterface(TypeInfo(ISpaceProvider), 'urn:FunctionalitySOAPInterface-ISpaceProvider', Encoding);
InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISpaceProvider), 'urn:FunctionalitySOAPInterface-ISpaceProvider#%operationName%');
//.
FSIFunctionalityInterfacesRegister_Initialize();
//.
FSITypesFunctionalityInterfacesRegister_Initialize();


finalization

end.