//. import types functionality routines implementations

{$IFDEF EmbeddedServer}
{$I ServerTypesFunctionalityImportImplementation.inc}
{$ENDIF}

{TTTileServerVisualizationFunctionality}
Constructor TTTileServerVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTTileServerVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTTileServerVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTTileServerVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTTileServerVisualizationFunctionalityRemoted.TTTileServerVisualizationSOAPFunctionality: ITTTileServerVisualizationSOAPFunctionality;
begin
if (FTTTileServerVisualizationSOAPFunctionality = nil)
  then FTTTileServerVisualizationSOAPFunctionality:=GetITTTileServerVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTileServerVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTTileServerVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TTileServerVisualizationFunctionality}
Constructor TTileServerVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTTileServerVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTileServerVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTileServerVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTileServerVisualizationFunctionalityRemoted.TTileServerVisualizationSOAPFunctionality: ITTileServerVisualizationSOAPFunctionality;
begin
if (FTTileServerVisualizationSOAPFunctionality = nil)
  then FTTileServerVisualizationSOAPFunctionality:=GetITTileServerVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTileServerVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTileServerVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTileServerVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTileServerVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TTileServerVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TTileServerVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTileServerVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTileServerVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TTileServerVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTileServerVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTileServerVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.GetParams(out oWidth: integer; out oHeight: integer);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oWidth,oHeight);
{$ELSE}
TTileServerVisualizationFunctionality_GetParams(ServerFunctionality(),   oWidth,oHeight);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.GetParams1(out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.GetParams1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oServerType,oServerURL,oServerData,oTileProviderID,oWidth,oHeight);
{$ELSE}
TTileServerVisualizationFunctionality_GetParams1(ServerFunctionality(),   oServerType,oServerURL,oServerData,oTileProviderID,oWidth,oHeight);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.SetServerType(const Value: integer);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.SetServerType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTileServerVisualizationFunctionality_SetServerType(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.SetServerURL(const Value: string);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.SetServerURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTileServerVisualizationFunctionality_SetServerURL(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.SetServerData(const Data: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.SetServerData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Data);
{$ELSE}
TTileServerVisualizationFunctionality_SetServerData(ServerFunctionality(),   Data);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.GenerateFromImage(DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.GenerateFromImage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TTileServerVisualizationFunctionality_GenerateFromImage(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.GenerateFromTiles(const TilesFolder: string; const SizePowerOf2: integer);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.GenerateFromTiles(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TilesFolder,SizePowerOf2);
{$ELSE}
TTileServerVisualizationFunctionality_GenerateFromTiles(ServerFunctionality(),   TilesFolder,SizePowerOf2);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.RegenerateRegionFromLevel(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.RegenerateRegionFromLevel(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
{$ELSE}
TTileServerVisualizationFunctionality_RegenerateRegionFromLevel(ServerFunctionality(),   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.RegenerateRegion(const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.RegenerateRegion(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   XIndexMin,XIndexMax,YIndexMin,YIndexMax);
{$ELSE}
TTileServerVisualizationFunctionality_RegenerateRegion(ServerFunctionality(),   XIndexMin,XIndexMax,YIndexMin,YIndexMax);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.AddNewLevelAndRegenerate;
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.AddNewLevelAndRegenerate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TTileServerVisualizationFunctionality_AddNewLevelAndRegenerate(ServerFunctionality());
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.GetLevelsInfo(out Info: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.GetLevelsInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Info);
{$ELSE}
TTileServerVisualizationFunctionality_GetLevelsInfo(ServerFunctionality(),   Info);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.Level_GetParams(const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.Level_GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
{$ELSE}
TTileServerVisualizationFunctionality_Level_GetParams(ServerFunctionality(),   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.Level_SetParams(const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.Level_SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
{$ELSE}
TTileServerVisualizationFunctionality_Level_SetParams(ServerFunctionality(),   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.Level_GetSegments(const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.Level_GetSegments(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TileProviderID,idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
{$ELSE}
TTileServerVisualizationFunctionality_Level_GetSegments(ServerFunctionality(),   TileProviderID,idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.Level_GetSegmentsByIDs(const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.Level_GetSegmentsByIDs(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,SegmentsIDs,Segments);
{$ELSE}
TTileServerVisualizationFunctionality_Level_GetSegmentsByIDs(ServerFunctionality(),   idLevel,SegmentsIDs,Segments);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.Level_GetSegmentsHashes(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.Level_GetSegmentsHashes(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
{$ELSE}
TTileServerVisualizationFunctionality_Level_GetSegmentsHashes(ServerFunctionality(),   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.Level_SetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.Level_SetSegments(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
{$ELSE}
TTileServerVisualizationFunctionality_Level_SetSegments(ServerFunctionality(),   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
{$ENDIF}
end;

procedure TTileServerVisualizationFunctionalityRemoted.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
{$IFNDEF EmbeddedServer}
TTileServerVisualizationSOAPFunctionality.GetCoordinates(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
{$ELSE}
TTileServerVisualizationFunctionality_GetCoordinates(ServerFunctionality(),   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
{$ENDIF}
end;


{TTMeasurementObjectFunctionality}
Constructor TTMeasurementObjectFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTMeasurementObjectSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTMeasurementObjectFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTMeasurementObjectSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTMeasurementObjectFunctionalityRemoted.TTMeasurementObjectSOAPFunctionality: ITTMeasurementObjectSOAPFunctionality;
begin
if (FTTMeasurementObjectSOAPFunctionality = nil)
  then FTTMeasurementObjectSOAPFunctionality:=GetITTMeasurementObjectSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMeasurementObjectSOAPFunctionality;
end;
{$ELSE}
function TTMeasurementObjectFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTMeasurementObjectFunctionalityRemoted.CreateNewInstance(const pName: string; const pDomains: string): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTMeasurementObjectSOAPFunctionality.CreateNewInstance(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pName,pDomains);
{$ELSE}
Result:=TTMeasurementObjectFunctionality_CreateNewInstance(ServerFunctionality(),   pName,pDomains);
{$ENDIF}
end;

function TTMeasurementObjectFunctionalityRemoted.CreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTMeasurementObjectSOAPFunctionality.CreateInstanceByGUID(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pGUID,pName,pDomains);
{$ELSE}
Result:=TTMeasurementObjectFunctionality_CreateInstanceByGUID(ServerFunctionality(),   pGUID,pName,pDomains);
{$ENDIF}
end;

function TTMeasurementObjectFunctionalityRemoted.CheckCreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTMeasurementObjectSOAPFunctionality.CheckCreateInstanceByGUID(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pGUID,pName,pDomains);
{$ELSE}
Result:=TTMeasurementObjectFunctionality_CheckCreateInstanceByGUID(ServerFunctionality(),   pGUID,pName,pDomains);
{$ENDIF}
end;

procedure TTMeasurementObjectFunctionalityRemoted.GetInstanceListByNameContext(const pName: string; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTMeasurementObjectSOAPFunctionality.GetInstanceListByNameContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pName,List);
{$ELSE}
TTMeasurementObjectFunctionality_GetInstanceListByNameContext(ServerFunctionality(),   pName,List);
{$ENDIF}
end;

procedure TTMeasurementObjectFunctionalityRemoted.GetInstanceDataByNameContext(const pName: string; const Version: integer; out oData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTMeasurementObjectSOAPFunctionality.GetInstanceDataByNameContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pName,Version,oData);
{$ELSE}
TTMeasurementObjectFunctionality_GetInstanceDataByNameContext(ServerFunctionality(),   pName,Version,oData);
{$ENDIF}
end;

function TTMeasurementObjectFunctionalityRemoted.GetInstanceByGUID(const pGUID: string): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTMeasurementObjectSOAPFunctionality.GetInstanceByGUID(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pGUID);
{$ELSE}
Result:=TTMeasurementObjectFunctionality_GetInstanceByGUID(ServerFunctionality(),   pGUID);
{$ENDIF}
end;

function TTMeasurementObjectFunctionalityRemoted.GetInstanceByGSOMeasurement(const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTMeasurementObjectSOAPFunctionality.GetInstanceByGSOMeasurement(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pidGeographServerObject,pMeasurementTimeID);
{$ELSE}
Result:=TTMeasurementObjectFunctionality_GetInstanceByGSOMeasurement(ServerFunctionality(),   pidGeographServerObject,pMeasurementTimeID);
{$ENDIF}
end;


{TMeasurementObjectFunctionality}
Constructor TMeasurementObjectFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTMeasurementObjectSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TMeasurementObjectFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTMeasurementObjectSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TMeasurementObjectFunctionalityRemoted.TMeasurementObjectSOAPFunctionality: ITMeasurementObjectSOAPFunctionality;
begin
if (FTMeasurementObjectSOAPFunctionality = nil)
  then FTMeasurementObjectSOAPFunctionality:=GetITMeasurementObjectSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMeasurementObjectSOAPFunctionality;
end;
{$ELSE}
function TMeasurementObjectFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TMeasurementObjectFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMeasurementObjectSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMeasurementObjectFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TMeasurementObjectFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMeasurementObjectSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMeasurementObjectFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMeasurementObjectFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMeasurementObjectSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMeasurementObjectFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TMeasurementObjectFunctionalityRemoted.getGUID: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMeasurementObjectSOAPFunctionality.getGUID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMeasurementObjectFunctionality_getGUID(ServerFunctionality());
{$ENDIF}
end;

function TMeasurementObjectFunctionalityRemoted.getDomains: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMeasurementObjectSOAPFunctionality.getDomains(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMeasurementObjectFunctionality_getDomains(ServerFunctionality());
{$ENDIF}
end;

procedure TMeasurementObjectFunctionalityRemoted.setDomains(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMeasurementObjectSOAPFunctionality.setDomains(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMeasurementObjectFunctionality_setDomains(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TMeasurementObjectFunctionalityRemoted.GetParams(out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string);
begin
{$IFNDEF EmbeddedServer}
TMeasurementObjectSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oGUID,oidOwner,oName,oDomains);
{$ELSE}
TMeasurementObjectFunctionality_GetParams(ServerFunctionality(),   oGUID,oidOwner,oName,oDomains);
{$ENDIF}
end;

procedure TMeasurementObjectFunctionalityRemoted.GSOMeasurements_GetList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMeasurementObjectSOAPFunctionality.GSOMeasurements_GetList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
{$ELSE}
TMeasurementObjectFunctionality_GSOMeasurements_GetList(ServerFunctionality(),   List);
{$ENDIF}
end;

procedure TMeasurementObjectFunctionalityRemoted.GSOMeasurements_GetData(const Version: integer; out oData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMeasurementObjectSOAPFunctionality.GSOMeasurements_GetData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Version,oData);
{$ELSE}
TMeasurementObjectFunctionality_GSOMeasurements_GetData(ServerFunctionality(),   Version,oData);
{$ENDIF}
end;

procedure TMeasurementObjectFunctionalityRemoted.GSOMeasurements_Item_GetParams(const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);
begin
{$IFNDEF EmbeddedServer}
TMeasurementObjectSOAPFunctionality.GSOMeasurements_Item_GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idMeasurement,oTimeID,oidGeographServerObject,oDataType);
{$ELSE}
TMeasurementObjectFunctionality_GSOMeasurements_Item_GetParams(ServerFunctionality(),   idMeasurement,oTimeID,oidGeographServerObject,oDataType);
{$ENDIF}
end;

procedure TMeasurementObjectFunctionalityRemoted.GSOMeasurements_Item_GetParams1(const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);
begin
{$IFNDEF EmbeddedServer}
TMeasurementObjectSOAPFunctionality.GSOMeasurements_Item_GetParams1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TimeID,oidGeographServerObject,oDataType);
{$ELSE}
TMeasurementObjectFunctionality_GSOMeasurements_Item_GetParams1(ServerFunctionality(),   TimeID,oidGeographServerObject,oDataType);
{$ENDIF}
end;

procedure TMeasurementObjectFunctionalityRemoted.GSOMeasurements_Item_GetData(const idMeasurement: integer; out oData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMeasurementObjectSOAPFunctionality.GSOMeasurements_Item_GetData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idMeasurement,oData);
{$ELSE}
TMeasurementObjectFunctionality_GSOMeasurements_Item_GetData(ServerFunctionality(),   idMeasurement,oData);
{$ENDIF}
end;

procedure TMeasurementObjectFunctionalityRemoted.GSOMeasurements_Item_GetData1(const TimeID: Double; out oData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMeasurementObjectSOAPFunctionality.GSOMeasurements_Item_GetData1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TimeID,oData);
{$ELSE}
TMeasurementObjectFunctionality_GSOMeasurements_Item_GetData1(ServerFunctionality(),   TimeID,oData);
{$ENDIF}
end;


{TTAreaNotificationServerFunctionality}
Constructor TTAreaNotificationServerFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTAreaNotificationServerSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTAreaNotificationServerFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTAreaNotificationServerSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTAreaNotificationServerFunctionalityRemoted.TTAreaNotificationServerSOAPFunctionality: ITTAreaNotificationServerSOAPFunctionality;
begin
if (FTTAreaNotificationServerSOAPFunctionality = nil)
  then FTTAreaNotificationServerSOAPFunctionality:=GetITTAreaNotificationServerSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTAreaNotificationServerSOAPFunctionality;
end;
{$ELSE}
function TTAreaNotificationServerFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TAreaNotificationServerFunctionality}
Constructor TAreaNotificationServerFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTAreaNotificationServerSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TAreaNotificationServerFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTAreaNotificationServerSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TAreaNotificationServerFunctionalityRemoted.TAreaNotificationServerSOAPFunctionality: ITAreaNotificationServerSOAPFunctionality;
begin
if (FTAreaNotificationServerSOAPFunctionality = nil)
  then FTAreaNotificationServerSOAPFunctionality:=GetITAreaNotificationServerSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTAreaNotificationServerSOAPFunctionality;
end;
{$ELSE}
function TAreaNotificationServerFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TAreaNotificationServerFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TAreaNotificationServerSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAreaNotificationServerFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TAreaNotificationServerFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TAreaNotificationServerSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TAreaNotificationServerFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TAreaNotificationServerFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TAreaNotificationServerSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAreaNotificationServerFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TAreaNotificationServerFunctionalityRemoted.getInfo: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TAreaNotificationServerSOAPFunctionality.getInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAreaNotificationServerFunctionality_getInfo(ServerFunctionality());
{$ENDIF}
end;

procedure TAreaNotificationServerFunctionalityRemoted.setInfo(Value: string);
begin
{$IFNDEF EmbeddedServer}
TAreaNotificationServerSOAPFunctionality.setInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TAreaNotificationServerFunctionality_setInfo(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTMODELServerVisualizationFunctionality}
Constructor TTMODELServerVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTMODELServerVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTMODELServerVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTMODELServerVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTMODELServerVisualizationFunctionalityRemoted.TTMODELServerVisualizationSOAPFunctionality: ITTMODELServerVisualizationSOAPFunctionality;
begin
if (FTTMODELServerVisualizationSOAPFunctionality = nil)
  then FTTMODELServerVisualizationSOAPFunctionality:=GetITTMODELServerVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMODELServerVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTMODELServerVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TMODELServerVisualizationFunctionality}
Constructor TMODELServerVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTMODELServerVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TMODELServerVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTMODELServerVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TMODELServerVisualizationFunctionalityRemoted.TMODELServerVisualizationSOAPFunctionality: ITMODELServerVisualizationSOAPFunctionality;
begin
if (FTMODELServerVisualizationSOAPFunctionality = nil)
  then FTMODELServerVisualizationSOAPFunctionality:=GetITMODELServerVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMODELServerVisualizationSOAPFunctionality;
end;
{$ELSE}
function TMODELServerVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TMODELServerVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELServerVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TMODELServerVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TMODELServerVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELServerVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELServerVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TMODELServerVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELServerVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELServerVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TMODELServerVisualizationFunctionalityRemoted.getServerURL: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELServerVisualizationSOAPFunctionality.getServerURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELServerVisualizationFunctionality_getServerURL(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELServerVisualizationFunctionalityRemoted.setServerURL(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMODELServerVisualizationSOAPFunctionality.setServerURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELServerVisualizationFunctionality_setServerURL(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTDoubleVarFunctionality}
Constructor TTDoubleVarFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTDoubleVarSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTDoubleVarFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTDoubleVarSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTDoubleVarFunctionalityRemoted.TTDoubleVarSOAPFunctionality: ITTDoubleVarSOAPFunctionality;
begin
if (FTTDoubleVarSOAPFunctionality = nil)
  then FTTDoubleVarSOAPFunctionality:=GetITTDoubleVarSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTDoubleVarSOAPFunctionality;
end;
{$ELSE}
function TTDoubleVarFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TDoubleVarFunctionality}
Constructor TDoubleVarFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTDoubleVarSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TDoubleVarFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTDoubleVarSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TDoubleVarFunctionalityRemoted.TDoubleVarSOAPFunctionality: ITDoubleVarSOAPFunctionality;
begin
if (FTDoubleVarSOAPFunctionality = nil)
  then FTDoubleVarSOAPFunctionality:=GetITDoubleVarSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTDoubleVarSOAPFunctionality;
end;
{$ELSE}
function TDoubleVarFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TDoubleVarFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDoubleVarSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDoubleVarFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TDoubleVarFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDoubleVarSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDoubleVarFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TDoubleVarFunctionalityRemoted.getValue: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TDoubleVarSOAPFunctionality.getValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDoubleVarFunctionality_getValue(ServerFunctionality());
{$ENDIF}
end;

procedure TDoubleVarFunctionalityRemoted.setValue(_Value: Double);
begin
{$IFNDEF EmbeddedServer}
TDoubleVarSOAPFunctionality.setValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   _Value);
{$ELSE}
TDoubleVarFunctionality_setValue(ServerFunctionality(),   _Value);
{$ENDIF}
end;

function TDoubleVarFunctionalityRemoted.getSetTimeStamp: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TDoubleVarSOAPFunctionality.getSetTimeStamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDoubleVarFunctionality_getSetTimeStamp(ServerFunctionality());
{$ENDIF}
end;


{TTInt32VarFunctionality}
Constructor TTInt32VarFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTInt32VarSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTInt32VarFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTInt32VarSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTInt32VarFunctionalityRemoted.TTInt32VarSOAPFunctionality: ITTInt32VarSOAPFunctionality;
begin
if (FTTInt32VarSOAPFunctionality = nil)
  then FTTInt32VarSOAPFunctionality:=GetITTInt32VarSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTInt32VarSOAPFunctionality;
end;
{$ELSE}
function TTInt32VarFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TInt32VarFunctionality}
Constructor TInt32VarFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTInt32VarSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TInt32VarFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTInt32VarSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TInt32VarFunctionalityRemoted.TInt32VarSOAPFunctionality: ITInt32VarSOAPFunctionality;
begin
if (FTInt32VarSOAPFunctionality = nil)
  then FTInt32VarSOAPFunctionality:=GetITInt32VarSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTInt32VarSOAPFunctionality;
end;
{$ELSE}
function TInt32VarFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TInt32VarFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TInt32VarSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TInt32VarFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TInt32VarFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TInt32VarSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TInt32VarFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TInt32VarFunctionalityRemoted.getValue: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TInt32VarSOAPFunctionality.getValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TInt32VarFunctionality_getValue(ServerFunctionality());
{$ENDIF}
end;

procedure TInt32VarFunctionalityRemoted.setValue(_Value: integer);
begin
{$IFNDEF EmbeddedServer}
TInt32VarSOAPFunctionality.setValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   _Value);
{$ELSE}
TInt32VarFunctionality_setValue(ServerFunctionality(),   _Value);
{$ENDIF}
end;

function TInt32VarFunctionalityRemoted.getSetTimeStamp: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TInt32VarSOAPFunctionality.getSetTimeStamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TInt32VarFunctionality_getSetTimeStamp(ServerFunctionality());
{$ENDIF}
end;


{TTURLFunctionality}
Constructor TTURLFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTURLSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTURLFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTURLSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTURLFunctionalityRemoted.TTURLSOAPFunctionality: ITTURLSOAPFunctionality;
begin
if (FTTURLSOAPFunctionality = nil)
  then FTTURLSOAPFunctionality:=GetITTURLSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTURLSOAPFunctionality;
end;
{$ELSE}
function TTURLFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TURLFunctionality}
Constructor TURLFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTURLSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TURLFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTURLSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TURLFunctionalityRemoted.TURLSOAPFunctionality: ITURLSOAPFunctionality;
begin
if (FTURLSOAPFunctionality = nil)
  then FTURLSOAPFunctionality:=GetITURLSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTURLSOAPFunctionality;
end;
{$ELSE}
function TURLFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TURLFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TURLSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TURLFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TURLFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TURLSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TURLFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TURLFunctionalityRemoted.getURL: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TURLSOAPFunctionality.getURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TURLFunctionality_getURL(ServerFunctionality());
{$ENDIF}
end;

procedure TURLFunctionalityRemoted.setURL(Value: string);
begin
{$IFNDEF EmbeddedServer}
TURLSOAPFunctionality.setURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TURLFunctionality_setURL(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TURLFunctionalityRemoted.getURLName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TURLSOAPFunctionality.getURLName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TURLFunctionality_getURLName(ServerFunctionality());
{$ENDIF}
end;

procedure TURLFunctionalityRemoted.setURLName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TURLSOAPFunctionality.setURLName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TURLFunctionality_setURLName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TURLFunctionalityRemoted.getflPanelBrowser: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TURLSOAPFunctionality.getflPanelBrowser(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TURLFunctionality_getflPanelBrowser(ServerFunctionality());
{$ENDIF}
end;

procedure TURLFunctionalityRemoted.setflPanelBrowser(Value: boolean);
begin
{$IFNDEF EmbeddedServer}
TURLSOAPFunctionality.setflPanelBrowser(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TURLFunctionality_setflPanelBrowser(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TURLFunctionalityRemoted.GetParams(out oURL: string; out oURLName: string; out oflPanelBrowser: boolean);
begin
{$IFNDEF EmbeddedServer}
TURLSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oURL,oURLName,oflPanelBrowser);
{$ELSE}
TURLFunctionality_GetParams(ServerFunctionality(),   oURL,oURLName,oflPanelBrowser);
{$ENDIF}
end;

procedure TURLFunctionalityRemoted.SetParams(const pURL: string; const pURLName: string; const pflPanelBrowser: boolean);
begin
{$IFNDEF EmbeddedServer}
TURLSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pURL,pURLName,pflPanelBrowser);
{$ELSE}
TURLFunctionality_SetParams(ServerFunctionality(),   pURL,pURLName,pflPanelBrowser);
{$ENDIF}
end;


{TTPatternVisualizationFunctionality}
Constructor TTPatternVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTPatternVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTPatternVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTPatternVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTPatternVisualizationFunctionalityRemoted.TTPatternVisualizationSOAPFunctionality: ITTPatternVisualizationSOAPFunctionality;
begin
if (FTTPatternVisualizationSOAPFunctionality = nil)
  then FTTPatternVisualizationSOAPFunctionality:=GetITTPatternVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTPatternVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTPatternVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TPatternVisualizationFunctionality}
Constructor TPatternVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTPatternVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TPatternVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTPatternVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TPatternVisualizationFunctionalityRemoted.TPatternVisualizationSOAPFunctionality: ITPatternVisualizationSOAPFunctionality;
begin
if (FTPatternVisualizationSOAPFunctionality = nil)
  then FTPatternVisualizationSOAPFunctionality:=GetITPatternVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTPatternVisualizationSOAPFunctionality;
end;
{$ELSE}
function TPatternVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TPatternVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TPatternVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TPatternVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TPatternVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TPatternVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TPatternVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TPatternVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TPatternVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TPatternVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TPatternVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TPatternVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TPatternVisualizationFunctionality_GetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TPatternVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
TPatternVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
{$ELSE}
TPatternVisualizationFunctionality_GetDATA1(ServerFunctionality(),   DATAStream,DATAType,MaxSize);
{$ENDIF}
end;

procedure TPatternVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
{$IFNDEF EmbeddedServer}
TPatternVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TPatternVisualizationFunctionality_SetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

function TPatternVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TPatternVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TPatternVisualizationFunctionality_getDATAFileID(ServerFunctionality());
{$ENDIF}
end;

procedure TPatternVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TPatternVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TPatternVisualizationFunctionality_setDATAFileID(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TPatternVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
{$IFNDEF EmbeddedServer}
TPatternVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TPatternVisualizationFunctionality_DATAFile_Clear(ServerFunctionality());
{$ENDIF}
end;


{TTMapFormatObjectFunctionality}
Constructor TTMapFormatObjectFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTMapFormatObjectSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTMapFormatObjectFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTMapFormatObjectSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTMapFormatObjectFunctionalityRemoted.TTMapFormatObjectSOAPFunctionality: ITTMapFormatObjectSOAPFunctionality;
begin
if (FTTMapFormatObjectSOAPFunctionality = nil)
  then FTTMapFormatObjectSOAPFunctionality:=GetITTMapFormatObjectSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMapFormatObjectSOAPFunctionality;
end;
{$ELSE}
function TTMapFormatObjectFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTMapFormatObjectFunctionalityRemoted.GetDATAHash(DATAStream: TByteArray): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTMapFormatObjectSOAPFunctionality.GetDATAHash(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   DATAStream);
{$ELSE}
Result:=TTMapFormatObjectFunctionality_GetDATAHash(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;


{TMapFormatObjectFunctionality}
Constructor TMapFormatObjectFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTMapFormatObjectSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TMapFormatObjectFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTMapFormatObjectSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TMapFormatObjectFunctionalityRemoted.TMapFormatObjectSOAPFunctionality: ITMapFormatObjectSOAPFunctionality;
begin
if (FTMapFormatObjectSOAPFunctionality = nil)
  then FTMapFormatObjectSOAPFunctionality:=GetITMapFormatObjectSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMapFormatObjectSOAPFunctionality;
end;
{$ELSE}
function TMapFormatObjectFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TMapFormatObjectFunctionalityRemoted.GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatObjectSOAPFunctionality.GetHintInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   InfoType,InfoFormat,HintInfo);
{$ELSE}
Result:=TMapFormatObjectFunctionality_GetHintInfo(ServerFunctionality(),   InfoType,InfoFormat,HintInfo);
{$ENDIF}
end;

function TMapFormatObjectFunctionalityRemoted.getidMap: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatObjectSOAPFunctionality.getidMap(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMapFormatObjectFunctionality_getidMap(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.setidMap(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.setidMap(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMapFormatObjectFunctionality_setidMap(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMapFormatObjectFunctionalityRemoted.getFormatID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatObjectSOAPFunctionality.getFormatID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMapFormatObjectFunctionality_getFormatID(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.setFormatID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.setFormatID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMapFormatObjectFunctionality_setFormatID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMapFormatObjectFunctionalityRemoted.getKindID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatObjectSOAPFunctionality.getKindID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMapFormatObjectFunctionality_getKindID(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.setKindID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.setKindID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMapFormatObjectFunctionality_setKindID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMapFormatObjectFunctionalityRemoted.getTypeID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatObjectSOAPFunctionality.getTypeID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMapFormatObjectFunctionality_getTypeID(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.setTypeID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.setTypeID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMapFormatObjectFunctionality_setTypeID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMapFormatObjectFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatObjectSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMapFormatObjectFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMapFormatObjectFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.GetDATA(out DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TMapFormatObjectFunctionality_GetDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.SetDATA(DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TMapFormatObjectFunctionality_SetDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

function TMapFormatObjectFunctionalityRemoted.getDATAHash: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatObjectSOAPFunctionality.getDATAHash(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMapFormatObjectFunctionality_getDATAHash(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.setDATAHash(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.setDATAHash(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMapFormatObjectFunctionality_setDATAHash(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.GetParams(out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string);
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oidMap,oFormatID,oKindID,oTypeID,oName);
{$ELSE}
TMapFormatObjectFunctionality_GetParams(ServerFunctionality(),   oidMap,oFormatID,oKindID,oTypeID,oName);
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.SetParams(const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string);
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pidMap,pFormatID,pKindID,pTypeID,pName);
{$ELSE}
TMapFormatObjectFunctionality_SetParams(ServerFunctionality(),   pidMap,pFormatID,pKindID,pTypeID,pName);
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.SetObjectByDATA;
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.SetObjectByDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TMapFormatObjectFunctionality_SetObjectByDATA(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.UpdateDATAHash;
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.UpdateDATAHash(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TMapFormatObjectFunctionality_UpdateDATAHash(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.Compile;
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.Compile(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TMapFormatObjectFunctionality_Compile(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatObjectFunctionalityRemoted.Build(const flUsePrototype: boolean);
begin
{$IFNDEF EmbeddedServer}
TMapFormatObjectSOAPFunctionality.Build(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   flUsePrototype);
{$ELSE}
TMapFormatObjectFunctionality_Build(ServerFunctionality(),   flUsePrototype);
{$ENDIF}
end;


{TTMapFormatMapFunctionality}
Constructor TTMapFormatMapFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTMapFormatMapSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTMapFormatMapFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTMapFormatMapSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTMapFormatMapFunctionalityRemoted.TTMapFormatMapSOAPFunctionality: ITTMapFormatMapSOAPFunctionality;
begin
if (FTTMapFormatMapSOAPFunctionality = nil)
  then FTTMapFormatMapSOAPFunctionality:=GetITTMapFormatMapSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMapFormatMapSOAPFunctionality;
end;
{$ELSE}
function TTMapFormatMapFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTMapFormatMapFunctionalityRemoted.GetInstanceListByGeoSpace(const idGeoSpace: integer; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTMapFormatMapSOAPFunctionality.GetInstanceListByGeoSpace(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   idGeoSpace,List);
{$ELSE}
TTMapFormatMapFunctionality_GetInstanceListByGeoSpace(ServerFunctionality(),   idGeoSpace,List);
{$ENDIF}
end;


{TMapFormatMapFunctionality}
Constructor TMapFormatMapFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTMapFormatMapSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TMapFormatMapFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTMapFormatMapSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TMapFormatMapFunctionalityRemoted.TMapFormatMapSOAPFunctionality: ITMapFormatMapSOAPFunctionality;
begin
if (FTMapFormatMapSOAPFunctionality = nil)
  then FTMapFormatMapSOAPFunctionality:=GetITMapFormatMapSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMapFormatMapSOAPFunctionality;
end;
{$ELSE}
function TMapFormatMapFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TMapFormatMapFunctionalityRemoted.getGeoSpaceID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatMapSOAPFunctionality.getGeoSpaceID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMapFormatMapFunctionality_getGeoSpaceID(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.setGeoSpaceID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.setGeoSpaceID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMapFormatMapFunctionality_setGeoSpaceID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMapFormatMapFunctionalityRemoted.getFormatID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatMapSOAPFunctionality.getFormatID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMapFormatMapFunctionality_getFormatID(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.setFormatID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.setFormatID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMapFormatMapFunctionality_setFormatID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMapFormatMapFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatMapSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMapFormatMapFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMapFormatMapFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.GetDATA(out DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TMapFormatMapFunctionality_GetDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.SetDATA(DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TMapFormatMapFunctionality_SetDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.GetObjectPrototypesDATA(out DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.GetObjectPrototypesDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TMapFormatMapFunctionality_GetObjectPrototypesDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.SetObjectPrototypesDATA(DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.SetObjectPrototypesDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TMapFormatMapFunctionality_SetObjectPrototypesDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

function TMapFormatMapFunctionalityRemoted.GetObjectPrototype(const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatMapSOAPFunctionality.GetObjectPrototype(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   KindID,TypeID,PrototypeID,LayID);
{$ELSE}
Result:=TMapFormatMapFunctionality_GetObjectPrototype(ServerFunctionality(),   KindID,TypeID,PrototypeID,LayID);
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.GetParams(out oGeoSpaceID: integer; out oFormatID: integer; out oName: string);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oGeoSpaceID,oFormatID,oName);
{$ELSE}
TMapFormatMapFunctionality_GetParams(ServerFunctionality(),   oGeoSpaceID,oFormatID,oName);
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.SetParams(const pGeoSpaceID: integer; const pFormatID: integer; const pName: string);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pGeoSpaceID,pFormatID,pName);
{$ELSE}
TMapFormatMapFunctionality_SetParams(ServerFunctionality(),   pGeoSpaceID,pFormatID,pName);
{$ENDIF}
end;

function TMapFormatMapFunctionalityRemoted.ObjectsCounter: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatMapSOAPFunctionality.ObjectsCounter(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMapFormatMapFunctionality_ObjectsCounter(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.GetObjectsList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.GetObjectsList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
{$ELSE}
TMapFormatMapFunctionality_GetObjectsList(ServerFunctionality(),   List);
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.GetObjectsList1(const KindID: integer; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.GetObjectsList1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   KindID,List);
{$ELSE}
TMapFormatMapFunctionality_GetObjectsList1(ServerFunctionality(),   KindID,List);
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.GetObjectsList2(const KindID: integer; const TypeID: integer; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.GetObjectsList2(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   KindID,TypeID,List);
{$ELSE}
TMapFormatMapFunctionality_GetObjectsList2(ServerFunctionality(),   KindID,TypeID,List);
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.GetObjectsList3(const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.GetObjectsList3(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   KindID,TypeID,NameContext,List);
{$ELSE}
TMapFormatMapFunctionality_GetObjectsList3(ServerFunctionality(),   KindID,TypeID,NameContext,List);
{$ENDIF}
end;

function TMapFormatMapFunctionalityRemoted.GetObject(const DATAHash: integer; out idMapFormatObject: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatMapSOAPFunctionality.GetObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAHash,idMapFormatObject);
{$ELSE}
Result:=TMapFormatMapFunctionality_GetObject(ServerFunctionality(),   DATAHash,idMapFormatObject);
{$ENDIF}
end;

function TMapFormatMapFunctionalityRemoted.GetObject1(const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMapFormatMapSOAPFunctionality.GetObject1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   KindID,DATAHash,idMapFormatObject);
{$ELSE}
Result:=TMapFormatMapFunctionality_GetObject1(ServerFunctionality(),   KindID,DATAHash,idMapFormatObject);
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.ExportMap(const pFormatID: integer; out ZipData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.ExportMap(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pFormatID,ZipData);
{$ELSE}
TMapFormatMapFunctionality_ExportMap(ServerFunctionality(),   pFormatID,ZipData);
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.RemoveObjects;
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.RemoveObjects(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TMapFormatMapFunctionality_RemoveObjects(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.RemoveObjects1(const KindID: integer; const TypeID: integer);
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.RemoveObjects1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   KindID,TypeID);
{$ELSE}
TMapFormatMapFunctionality_RemoveObjects1(ServerFunctionality(),   KindID,TypeID);
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.UpdateObjectDATAHashes;
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.UpdateObjectDATAHashes(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TMapFormatMapFunctionality_UpdateObjectDATAHashes(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.RecalculateMapArea;
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.RecalculateMapArea(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TMapFormatMapFunctionality_RecalculateMapArea(ServerFunctionality());
{$ENDIF}
end;

procedure TMapFormatMapFunctionalityRemoted.RemoveIrrelevantObjectsInMapArea;
begin
{$IFNDEF EmbeddedServer}
TMapFormatMapSOAPFunctionality.RemoveIrrelevantObjectsInMapArea(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TMapFormatMapFunctionality_RemoveIrrelevantObjectsInMapArea(ServerFunctionality());
{$ENDIF}
end;


{TTSPLVisualizationFunctionality}
Constructor TTSPLVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTSPLVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTSPLVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTSPLVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTSPLVisualizationFunctionalityRemoted.TTSPLVisualizationSOAPFunctionality: ITTSPLVisualizationSOAPFunctionality;
begin
if (FTTSPLVisualizationSOAPFunctionality = nil)
  then FTTSPLVisualizationSOAPFunctionality:=GetITTSPLVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTSPLVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTSPLVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TSPLVisualizationFunctionality}
Constructor TSPLVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTSPLVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TSPLVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTSPLVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TSPLVisualizationFunctionalityRemoted.TSPLVisualizationSOAPFunctionality: ITSPLVisualizationSOAPFunctionality;
begin
if (FTSPLVisualizationSOAPFunctionality = nil)
  then FTSPLVisualizationSOAPFunctionality:=GetITSPLVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTSPLVisualizationSOAPFunctionality;
end;
{$ELSE}
function TSPLVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TSPLVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TSPLVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TSPLVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TSPLVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSPLVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSPLVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TSPLVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSPLVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSPLVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TSPLVisualizationFunctionalityRemoted.GetParams(out SPLType: integer; out SPLDATA: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TSPLVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   SPLType,SPLDATA);
{$ELSE}
TSPLVisualizationFunctionality_GetParams(ServerFunctionality(),   SPLType,SPLDATA);
{$ENDIF}
end;

procedure TSPLVisualizationFunctionalityRemoted.SetParams(const SPLType: integer; const SPLDATA: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TSPLVisualizationSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   SPLType,SPLDATA);
{$ELSE}
TSPLVisualizationFunctionality_SetParams(ServerFunctionality(),   SPLType,SPLDATA);
{$ENDIF}
end;


{TTBoolVarFunctionality}
Constructor TTBoolVarFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTBoolVarSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTBoolVarFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTBoolVarSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTBoolVarFunctionalityRemoted.TTBoolVarSOAPFunctionality: ITTBoolVarSOAPFunctionality;
begin
if (FTTBoolVarSOAPFunctionality = nil)
  then FTTBoolVarSOAPFunctionality:=GetITTBoolVarSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTBoolVarSOAPFunctionality;
end;
{$ELSE}
function TTBoolVarFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TBoolVarFunctionality}
Constructor TBoolVarFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTBoolVarSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TBoolVarFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTBoolVarSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TBoolVarFunctionalityRemoted.TBoolVarSOAPFunctionality: ITBoolVarSOAPFunctionality;
begin
if (FTBoolVarSOAPFunctionality = nil)
  then FTBoolVarSOAPFunctionality:=GetITBoolVarSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTBoolVarSOAPFunctionality;
end;
{$ELSE}
function TBoolVarFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TBoolVarFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TBoolVarSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TBoolVarFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TBoolVarFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TBoolVarSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TBoolVarFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TBoolVarFunctionalityRemoted.getValue: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TBoolVarSOAPFunctionality.getValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TBoolVarFunctionality_getValue(ServerFunctionality());
{$ENDIF}
end;

procedure TBoolVarFunctionalityRemoted.setValue(_Value: boolean);
begin
{$IFNDEF EmbeddedServer}
TBoolVarSOAPFunctionality.setValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   _Value);
{$ELSE}
TBoolVarFunctionality_setValue(ServerFunctionality(),   _Value);
{$ENDIF}
end;

function TBoolVarFunctionalityRemoted.getSetTimeStamp: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TBoolVarSOAPFunctionality.getSetTimeStamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TBoolVarFunctionality_getSetTimeStamp(ServerFunctionality());
{$ENDIF}
end;


{TTGeoSpaceFunctionality}
Constructor TTGeoSpaceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTGeoSpaceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTGeoSpaceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTGeoSpaceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTGeoSpaceFunctionalityRemoted.TTGeoSpaceSOAPFunctionality: ITTGeoSpaceSOAPFunctionality;
begin
if (FTTGeoSpaceSOAPFunctionality = nil)
  then FTTGeoSpaceSOAPFunctionality:=GetITTGeoSpaceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTGeoSpaceSOAPFunctionality;
end;
{$ELSE}
function TTGeoSpaceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TGeoSpaceFunctionality}
Constructor TGeoSpaceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTGeoSpaceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TGeoSpaceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTGeoSpaceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TGeoSpaceFunctionalityRemoted.TGeoSpaceSOAPFunctionality: ITGeoSpaceSOAPFunctionality;
begin
if (FTGeoSpaceSOAPFunctionality = nil)
  then FTGeoSpaceSOAPFunctionality:=GetITGeoSpaceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTGeoSpaceSOAPFunctionality;
end;
{$ELSE}
function TGeoSpaceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TGeoSpaceFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoSpaceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoSpaceFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoSpaceFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TGeoSpaceSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoSpaceFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeoSpaceFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoSpaceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoSpaceFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TGeoSpaceFunctionalityRemoted.getDatumID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoSpaceSOAPFunctionality.getDatumID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoSpaceFunctionality_getDatumID(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoSpaceFunctionalityRemoted.setDatumID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoSpaceSOAPFunctionality.setDatumID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoSpaceFunctionality_setDatumID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeoSpaceFunctionalityRemoted.getProjectionID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoSpaceSOAPFunctionality.getProjectionID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoSpaceFunctionality_getProjectionID(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoSpaceFunctionalityRemoted.setProjectionID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoSpaceSOAPFunctionality.setProjectionID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoSpaceFunctionality_setProjectionID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeoSpaceFunctionalityRemoted.ConvertXYToLatLong(const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoSpaceSOAPFunctionality.ConvertXYToLatLong(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X,Y,Latitude,Longitude);
{$ELSE}
Result:=TGeoSpaceFunctionality_ConvertXYToLatLong(ServerFunctionality(),   X,Y,Latitude,Longitude);
{$ENDIF}
end;

function TGeoSpaceFunctionalityRemoted.ConvertXYToDatumLatLong(const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoSpaceSOAPFunctionality.ConvertXYToDatumLatLong(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X,Y,pDatumID,Latitude,Longitude);
{$ELSE}
Result:=TGeoSpaceFunctionality_ConvertXYToDatumLatLong(ServerFunctionality(),   X,Y,pDatumID,Latitude,Longitude);
{$ENDIF}
end;

function TGeoSpaceFunctionalityRemoted.ConvertLatLongToXY(const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoSpaceSOAPFunctionality.ConvertLatLongToXY(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Latitude,Longitude,X,Y);
{$ELSE}
Result:=TGeoSpaceFunctionality_ConvertLatLongToXY(ServerFunctionality(),   Latitude,Longitude,X,Y);
{$ENDIF}
end;

function TGeoSpaceFunctionalityRemoted.ConvertDatumLatLongToXY(const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoSpaceSOAPFunctionality.ConvertDatumLatLongToXY(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pDatumID,Latitude,Longitude,X,Y);
{$ELSE}
Result:=TGeoSpaceFunctionality_ConvertDatumLatLongToXY(ServerFunctionality(),   pDatumID,Latitude,Longitude,X,Y);
{$ENDIF}
end;

procedure TGeoSpaceFunctionalityRemoted.GetGeoCrdSystemList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TGeoSpaceSOAPFunctionality.GetGeoCrdSystemList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
{$ELSE}
TGeoSpaceFunctionality_GetGeoCrdSystemList(ServerFunctionality(),   List);
{$ENDIF}
end;

procedure TGeoSpaceFunctionalityRemoted.GetMapFormatMapList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TGeoSpaceSOAPFunctionality.GetMapFormatMapList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
{$ELSE}
TGeoSpaceFunctionality_GetMapFormatMapList(ServerFunctionality(),   List);
{$ENDIF}
end;

procedure TGeoSpaceFunctionalityRemoted.GetMapFormatMapObjectsByNameContext(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TGeoSpaceSOAPFunctionality.GetMapFormatMapObjectsByNameContext(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pFormatID,pKindID,pTypeID,NameContext,List);
{$ELSE}
TGeoSpaceFunctionality_GetMapFormatMapObjectsByNameContext(ServerFunctionality(),   pFormatID,pKindID,pTypeID,NameContext,List);
{$ENDIF}
end;


{TTUserAlertFunctionality}
Constructor TTUserAlertFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTUserAlertSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTUserAlertFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTUserAlertSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTUserAlertFunctionalityRemoted.TTUserAlertSOAPFunctionality: ITTUserAlertSOAPFunctionality;
begin
if (FTTUserAlertSOAPFunctionality = nil)
  then FTTUserAlertSOAPFunctionality:=GetITTUserAlertSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTUserAlertSOAPFunctionality;
end;
{$ELSE}
function TTUserAlertFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTUserAlertFunctionalityRemoted.GetActiveInstanceList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTUserAlertSOAPFunctionality.GetActiveInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
{$ELSE}
TTUserAlertFunctionality_GetActiveInstanceList(ServerFunctionality(),   List);
{$ENDIF}
end;


{TUserAlertFunctionality}
Constructor TUserAlertFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTUserAlertSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TUserAlertFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTUserAlertSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TUserAlertFunctionalityRemoted.TUserAlertSOAPFunctionality: ITUserAlertSOAPFunctionality;
begin
if (FTUserAlertSOAPFunctionality = nil)
  then FTUserAlertSOAPFunctionality:=GetITUserAlertSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTUserAlertSOAPFunctionality;
end;
{$ELSE}
function TUserAlertFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TUserAlertFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TUserAlertSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TUserAlertFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TUserAlertFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TUserAlertSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TUserAlertFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TUserAlertFunctionalityRemoted.getUserID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TUserAlertSOAPFunctionality.getUserID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TUserAlertFunctionality_getUserID(ServerFunctionality());
{$ENDIF}
end;

procedure TUserAlertFunctionalityRemoted.setUserID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TUserAlertSOAPFunctionality.setUserID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TUserAlertFunctionality_setUserID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TUserAlertFunctionalityRemoted.getTimeStamp: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TUserAlertSOAPFunctionality.getTimeStamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TUserAlertFunctionality_getTimeStamp(ServerFunctionality());
{$ENDIF}
end;

procedure TUserAlertFunctionalityRemoted.setTimeStamp(Value: TDateTime);
begin
{$IFNDEF EmbeddedServer}
TUserAlertSOAPFunctionality.setTimeStamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TUserAlertFunctionality_setTimeStamp(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TUserAlertFunctionalityRemoted.getActive: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TUserAlertSOAPFunctionality.getActive(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TUserAlertFunctionality_getActive(ServerFunctionality());
{$ENDIF}
end;

procedure TUserAlertFunctionalityRemoted.setActive(Value: boolean);
begin
{$IFNDEF EmbeddedServer}
TUserAlertSOAPFunctionality.setActive(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TUserAlertFunctionality_setActive(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TUserAlertFunctionalityRemoted.getAlertID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TUserAlertSOAPFunctionality.getAlertID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TUserAlertFunctionality_getAlertID(ServerFunctionality());
{$ENDIF}
end;

procedure TUserAlertFunctionalityRemoted.setAlertID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TUserAlertSOAPFunctionality.setAlertID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TUserAlertFunctionality_setAlertID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TUserAlertFunctionalityRemoted.getSeverity: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TUserAlertSOAPFunctionality.getSeverity(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TUserAlertFunctionality_getSeverity(ServerFunctionality());
{$ENDIF}
end;

procedure TUserAlertFunctionalityRemoted.setSeverity(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TUserAlertSOAPFunctionality.setSeverity(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TUserAlertFunctionality_setSeverity(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TUserAlertFunctionalityRemoted.getDescription: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TUserAlertSOAPFunctionality.getDescription(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TUserAlertFunctionality_getDescription(ServerFunctionality());
{$ENDIF}
end;

procedure TUserAlertFunctionalityRemoted.setDescription(Value: string);
begin
{$IFNDEF EmbeddedServer}
TUserAlertSOAPFunctionality.setDescription(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TUserAlertFunctionality_setDescription(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TUserAlertFunctionalityRemoted.GetDATA(out DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TUserAlertSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TUserAlertFunctionality_GetDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

procedure TUserAlertFunctionalityRemoted.SetDATA(DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TUserAlertSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TUserAlertFunctionality_SetDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;


{TTGeoGraphServerObjectFunctionality}
Constructor TTGeoGraphServerObjectFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTGeoGraphServerObjectSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTGeoGraphServerObjectFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTGeoGraphServerObjectSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTGeoGraphServerObjectFunctionalityRemoted.TTGeoGraphServerObjectSOAPFunctionality: ITTGeoGraphServerObjectSOAPFunctionality;
begin
if (FTTGeoGraphServerObjectSOAPFunctionality = nil)
  then FTTGeoGraphServerObjectSOAPFunctionality:=GetITTGeoGraphServerObjectSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTGeoGraphServerObjectSOAPFunctionality;
end;
{$ELSE}
function TTGeoGraphServerObjectFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTGeoGraphServerObjectFunctionalityRemoted.GetInstanceByServerObject(const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTGeoGraphServerObjectSOAPFunctionality.GetInstanceByServerObject(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pGeoGraphServerID,pObjectID,idInstance);
{$ELSE}
Result:=TTGeoGraphServerObjectFunctionality_GetInstanceByServerObject(ServerFunctionality(),   pGeoGraphServerID,pObjectID,idInstance);
{$ENDIF}
end;


{TGeoGraphServerObjectFunctionality}
Constructor TGeoGraphServerObjectFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTGeoGraphServerObjectSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TGeoGraphServerObjectFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTGeoGraphServerObjectSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TGeoGraphServerObjectFunctionalityRemoted.TGeoGraphServerObjectSOAPFunctionality: ITGeoGraphServerObjectSOAPFunctionality;
begin
if (FTGeoGraphServerObjectSOAPFunctionality = nil)
  then FTGeoGraphServerObjectSOAPFunctionality:=GetITGeoGraphServerObjectSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTGeoGraphServerObjectSOAPFunctionality;
end;
{$ELSE}
function TGeoGraphServerObjectFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TGeoGraphServerObjectFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerObjectSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerObjectFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TGeoGraphServerObjectFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerObjectSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerObjectFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TGeoGraphServerObjectFunctionalityRemoted.getGeoGraphServerID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerObjectSOAPFunctionality.getGeoGraphServerID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerObjectFunctionality_getGeoGraphServerID(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.setGeoGraphServerID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerObjectSOAPFunctionality.setGeoGraphServerID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoGraphServerObjectFunctionality_setGeoGraphServerID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeoGraphServerObjectFunctionalityRemoted.getObjectID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerObjectSOAPFunctionality.getObjectID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerObjectFunctionality_getObjectID(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.setObjectID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerObjectSOAPFunctionality.setObjectID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoGraphServerObjectFunctionality_setObjectID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeoGraphServerObjectFunctionalityRemoted.getBusinessModelID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerObjectSOAPFunctionality.getBusinessModelID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerObjectFunctionality_getBusinessModelID(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.setBusinessModelID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerObjectSOAPFunctionality.setBusinessModelID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoGraphServerObjectFunctionality_setBusinessModelID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeoGraphServerObjectFunctionalityRemoted.getDomains: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerObjectSOAPFunctionality.getDomains(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerObjectFunctionality_getDomains(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.setDomains(Value: string);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerObjectSOAPFunctionality.setDomains(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoGraphServerObjectFunctionality_setDomains(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.GetParams(out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerObjectSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oGeoGraphServerID,oObjectID,oObjectType,oBusinessModel);
{$ELSE}
TGeoGraphServerObjectFunctionality_GetParams(ServerFunctionality(),   oGeoGraphServerID,oObjectID,oObjectType,oBusinessModel);
{$ENDIF}
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerObjectSOAPFunctionality.ExecuteOperation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   InData,OutData);
{$ELSE}
TGeoGraphServerObjectFunctionality_ExecuteOperation(ServerFunctionality(),   InData,OutData);
{$ENDIF}
end;

function TGeoGraphServerObjectFunctionalityRemoted.GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerObjectSOAPFunctionality.GetVisualizationComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTVisualization,idVisualization);
{$ELSE}
Result:=TGeoGraphServerObjectFunctionality_GetVisualizationComponent(ServerFunctionality(),   idTVisualization,idVisualization);
{$ENDIF}
end;

function TGeoGraphServerObjectFunctionalityRemoted.GetNearestMapFormatObjects(const MaxDistance: double; out List: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerObjectSOAPFunctionality.GetNearestMapFormatObjects(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MaxDistance,List);
{$ELSE}
Result:=TGeoGraphServerObjectFunctionality_GetNearestMapFormatObjects(ServerFunctionality(),   MaxDistance,List);
{$ENDIF}
end;

function TGeoGraphServerObjectFunctionalityRemoted.GetNearestMapFormatObjectsNames(const MaxDistance: double; out Names: WideString): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerObjectSOAPFunctionality.GetNearestMapFormatObjectsNames(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MaxDistance,Names);
{$ELSE}
Result:=TGeoGraphServerObjectFunctionality_GetNearestMapFormatObjectsNames(ServerFunctionality(),   MaxDistance,Names);
{$ENDIF}
end;

function TGeoGraphServerObjectFunctionalityRemoted.Measurements_AddNew(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerObjectSOAPFunctionality.Measurements_AddNew(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pData);
{$ELSE}
Result:=TGeoGraphServerObjectFunctionality_Measurements_AddNew(ServerFunctionality(),   pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pData);
{$ENDIF}
end;

function TGeoGraphServerObjectFunctionalityRemoted.Measurements_AddNew1(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerObjectSOAPFunctionality.Measurements_AddNew1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pDataSource,pData);
{$ELSE}
Result:=TGeoGraphServerObjectFunctionality_Measurements_AddNew1(ServerFunctionality(),   pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pDataSource,pData);
{$ENDIF}
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.Measurements_Remove(const pidMeasurement: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerObjectSOAPFunctionality.Measurements_Remove(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pidMeasurement);
{$ELSE}
TGeoGraphServerObjectFunctionality_Measurements_Remove(ServerFunctionality(),   pidMeasurement);
{$ENDIF}
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.Measurements_Item_UpdateData(const pTimeID: Double; const pData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerObjectSOAPFunctionality.Measurements_Item_UpdateData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pTimeID,pData);
{$ELSE}
TGeoGraphServerObjectFunctionality_Measurements_Item_UpdateData(ServerFunctionality(),   pTimeID,pData);
{$ENDIF}
end;


{TTGeoGraphServerFunctionality}
Constructor TTGeoGraphServerFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTGeoGraphServerSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTGeoGraphServerFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTGeoGraphServerSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTGeoGraphServerFunctionalityRemoted.TTGeoGraphServerSOAPFunctionality: ITTGeoGraphServerSOAPFunctionality;
begin
if (FTTGeoGraphServerSOAPFunctionality = nil)
  then FTTGeoGraphServerSOAPFunctionality:=GetITTGeoGraphServerSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTGeoGraphServerSOAPFunctionality;
end;
{$ELSE}
function TTGeoGraphServerFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTGeoGraphServerFunctionalityRemoted.GetActiveInstanceList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTGeoGraphServerSOAPFunctionality.GetActiveInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
{$ELSE}
TTGeoGraphServerFunctionality_GetActiveInstanceList(ServerFunctionality(),   List);
{$ENDIF}
end;

function TTGeoGraphServerFunctionalityRemoted.GetInstanceForRegistration: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTGeoGraphServerSOAPFunctionality.GetInstanceForRegistration(TypeFunctionality.UserName,TypeFunctionality.UserPassword);
{$ELSE}
Result:=TTGeoGraphServerFunctionality_GetInstanceForRegistration(ServerFunctionality());
{$ENDIF}
end;


{TGeoGraphServerFunctionality}
Constructor TGeoGraphServerFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTGeoGraphServerSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TGeoGraphServerFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTGeoGraphServerSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TGeoGraphServerFunctionalityRemoted.TGeoGraphServerSOAPFunctionality: ITGeoGraphServerSOAPFunctionality;
begin
if (FTGeoGraphServerSOAPFunctionality = nil)
  then FTGeoGraphServerSOAPFunctionality:=GetITGeoGraphServerSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTGeoGraphServerSOAPFunctionality;
end;
{$ELSE}
function TGeoGraphServerFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TGeoGraphServerFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoGraphServerFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeoGraphServerFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TGeoGraphServerFunctionalityRemoted.getAddress: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.getAddress(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerFunctionality_getAddress(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.setAddress(Value: string);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.setAddress(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoGraphServerFunctionality_setAddress(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeoGraphServerFunctionalityRemoted.getInternalAddress: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.getInternalAddress(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerFunctionality_getInternalAddress(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.setInternalAddress(Value: string);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.setInternalAddress(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoGraphServerFunctionality_setInternalAddress(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeoGraphServerFunctionalityRemoted.getInfo: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.getInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerFunctionality_getInfo(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.setInfo(Value: string);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.setInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoGraphServerFunctionality_setInfo(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.GetData(out DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.GetData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TGeoGraphServerFunctionality_GetData(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

function TGeoGraphServerFunctionalityRemoted.RegisterObject(const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.RegisterObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectName,VisualizationType,VisualizationID,GeoCrdSystemID,HintID);
{$ELSE}
Result:=TGeoGraphServerFunctionality_RegisterObject(ServerFunctionality(),   ObjectName,VisualizationType,VisualizationID,GeoCrdSystemID,HintID);
{$ENDIF}
end;

function TGeoGraphServerFunctionalityRemoted.RegisterObject1(const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.RegisterObject1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,GeoCrdSystemID,HintID);
{$ELSE}
Result:=TGeoGraphServerFunctionality_RegisterObject1(ServerFunctionality(),   ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,GeoCrdSystemID,HintID);
{$ENDIF}
end;

function TGeoGraphServerFunctionalityRemoted.RegisterObject2(const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.RegisterObject2(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectName,ObjectType,BusinessType,ObjectComponentID);
{$ELSE}
Result:=TGeoGraphServerFunctionality_RegisterObject2(ServerFunctionality(),   ObjectName,ObjectType,BusinessType,ObjectComponentID);
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.UnRegisterObject(const ObjectID: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.UnRegisterObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID);
{$ELSE}
TGeoGraphServerFunctionality_UnRegisterObject(ServerFunctionality(),   ObjectID);
{$ENDIF}
end;

function TGeoGraphServerFunctionalityRemoted.ObjectCounter: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.ObjectCounter(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerFunctionality_ObjectCounter(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.ExecuteOperation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   InData,OutData);
{$ELSE}
TGeoGraphServerFunctionality_ExecuteOperation(ServerFunctionality(),   InData,OutData);
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_GetProperties(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.Object_GetProperties(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
{$ELSE}
TGeoGraphServerFunctionality_Object_GetProperties(ServerFunctionality(),   ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_GetProperties1(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.Object_GetProperties1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
{$ELSE}
TGeoGraphServerFunctionality_Object_GetProperties1(ServerFunctionality(),   ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_SetProperties(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.Object_SetProperties(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
{$ELSE}
TGeoGraphServerFunctionality_Object_SetProperties(ServerFunctionality(),   ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_SetProperties1(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.Object_SetProperties1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
{$ELSE}
TGeoGraphServerFunctionality_Object_SetProperties1(ServerFunctionality(),   ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
{$ENDIF}
end;

function TGeoGraphServerFunctionalityRemoted.Object_GetObjectType(const ObjectID: integer): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.Object_GetObjectType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID);
{$ELSE}
Result:=TGeoGraphServerFunctionality_Object_GetObjectType(ServerFunctionality(),   ObjectID);
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_SetObjectType(const ObjectID: integer; const ObjectType: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.Object_SetObjectType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,ObjectType);
{$ELSE}
TGeoGraphServerFunctionality_Object_SetObjectType(ServerFunctionality(),   ObjectID,ObjectType);
{$ENDIF}
end;

function TGeoGraphServerFunctionalityRemoted.Object_GetBusinessType(const ObjectID: integer): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.Object_GetBusinessType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID);
{$ELSE}
Result:=TGeoGraphServerFunctionality_Object_GetBusinessType(ServerFunctionality(),   ObjectID);
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_SetBusinessType(const ObjectID: integer; const BusinessType: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.Object_SetBusinessType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,BusinessType);
{$ELSE}
TGeoGraphServerFunctionality_Object_SetBusinessType(ServerFunctionality(),   ObjectID,BusinessType);
{$ENDIF}
end;

function TGeoGraphServerFunctionalityRemoted.Object_GetComponentID(const ObjectID: integer): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.Object_GetComponentID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID);
{$ELSE}
Result:=TGeoGraphServerFunctionality_Object_GetComponentID(ServerFunctionality(),   ObjectID);
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_SetComponentID(const ObjectID: integer; const ObjectComponentID: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.Object_SetComponentID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,ObjectComponentID);
{$ELSE}
TGeoGraphServerFunctionality_Object_SetComponentID(ServerFunctionality(),   ObjectID,ObjectComponentID);
{$ENDIF}
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_ExecuteOperation(const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TGeoGraphServerSOAPFunctionality.Object_ExecuteOperation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,InData,OutData);
{$ELSE}
TGeoGraphServerFunctionality_Object_ExecuteOperation(ServerFunctionality(),   ObjectID,InData,OutData);
{$ENDIF}
end;

function TGeoGraphServerFunctionalityRemoted.DataID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoGraphServerSOAPFunctionality.DataID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoGraphServerFunctionality_DataID(ServerFunctionality());
{$ENDIF}
end;


{TTGeoCrdSystemFunctionality}
Constructor TTGeoCrdSystemFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTGeoCrdSystemSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTGeoCrdSystemFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTGeoCrdSystemSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTGeoCrdSystemFunctionalityRemoted.TTGeoCrdSystemSOAPFunctionality: ITTGeoCrdSystemSOAPFunctionality;
begin
if (FTTGeoCrdSystemSOAPFunctionality = nil)
  then FTTGeoCrdSystemSOAPFunctionality:=GetITTGeoCrdSystemSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTGeoCrdSystemSOAPFunctionality;
end;
{$ELSE}
function TTGeoCrdSystemFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTGeoCrdSystemFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTGeoCrdSystemSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
{$ELSE}
TTGeoCrdSystemFunctionality_GetInstanceList(ServerFunctionality(),   List);
{$ENDIF}
end;

procedure TTGeoCrdSystemFunctionalityRemoted.GetInstanceByLatLong(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
begin
{$IFNDEF EmbeddedServer}
TTGeoCrdSystemSOAPFunctionality.GetInstanceByLatLong(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pGeoSpaceID,pLatitude,pLongitude,idCrdSys);
{$ELSE}
TTGeoCrdSystemFunctionality_GetInstanceByLatLong(ServerFunctionality(),   pGeoSpaceID,pLatitude,pLongitude,idCrdSys);
{$ENDIF}
end;

procedure TTGeoCrdSystemFunctionalityRemoted.GetInstanceByXY(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
begin
{$IFNDEF EmbeddedServer}
TTGeoCrdSystemSOAPFunctionality.GetInstanceByXY(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pGeoSpaceID,pX,pY,idCrdSys);
{$ELSE}
TTGeoCrdSystemFunctionality_GetInstanceByXY(ServerFunctionality(),   pGeoSpaceID,pX,pY,idCrdSys);
{$ENDIF}
end;


{TGeoCrdSystemFunctionality}
Constructor TGeoCrdSystemFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTGeoCrdSystemSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TGeoCrdSystemFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTGeoCrdSystemSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TGeoCrdSystemFunctionalityRemoted.TGeoCrdSystemSOAPFunctionality: ITGeoCrdSystemSOAPFunctionality;
begin
if (FTGeoCrdSystemSOAPFunctionality = nil)
  then FTGeoCrdSystemSOAPFunctionality:=GetITGeoCrdSystemSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTGeoCrdSystemSOAPFunctionality;
end;
{$ELSE}
function TGeoCrdSystemFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TGeoCrdSystemFunctionalityRemoted.getGeoSpaceID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoCrdSystemSOAPFunctionality.getGeoSpaceID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoCrdSystemFunctionality_getGeoSpaceID(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoCrdSystemFunctionalityRemoted.setGeoSpaceID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TGeoCrdSystemSOAPFunctionality.setGeoSpaceID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoCrdSystemFunctionality_setGeoSpaceID(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeoCrdSystemFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoCrdSystemSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoCrdSystemFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoCrdSystemFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TGeoCrdSystemSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoCrdSystemFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeoCrdSystemFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoCrdSystemSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoCrdSystemFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TGeoCrdSystemFunctionalityRemoted.getDatum: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoCrdSystemSOAPFunctionality.getDatum(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoCrdSystemFunctionality_getDatum(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoCrdSystemFunctionalityRemoted.setDatum(Value: string);
begin
{$IFNDEF EmbeddedServer}
TGeoCrdSystemSOAPFunctionality.setDatum(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoCrdSystemFunctionality_setDatum(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeoCrdSystemFunctionalityRemoted.getProjection: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeoCrdSystemSOAPFunctionality.getProjection(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeoCrdSystemFunctionality_getProjection(ServerFunctionality());
{$ENDIF}
end;

procedure TGeoCrdSystemFunctionalityRemoted.setProjection(Value: string);
begin
{$IFNDEF EmbeddedServer}
TGeoCrdSystemSOAPFunctionality.setProjection(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeoCrdSystemFunctionality_setProjection(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TGeoCrdSystemFunctionalityRemoted.GetProjectionDATA(out DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TGeoCrdSystemSOAPFunctionality.GetProjectionDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TGeoCrdSystemFunctionality_GetProjectionDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

procedure TGeoCrdSystemFunctionalityRemoted.SetProjectionDATA(DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TGeoCrdSystemSOAPFunctionality.SetProjectionDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TGeoCrdSystemFunctionality_SetProjectionDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

procedure TGeoCrdSystemFunctionalityRemoted.GetGeodesyPoints(out Points: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TGeoCrdSystemSOAPFunctionality.GetGeodesyPoints(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Points);
{$ELSE}
TGeoCrdSystemFunctionality_GetGeodesyPoints(ServerFunctionality(),   Points);
{$ENDIF}
end;


{TTFilterVisualizationFunctionality}
Constructor TTFilterVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTFilterVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTFilterVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTFilterVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTFilterVisualizationFunctionalityRemoted.TTFilterVisualizationSOAPFunctionality: ITTFilterVisualizationSOAPFunctionality;
begin
if (FTTFilterVisualizationSOAPFunctionality = nil)
  then FTTFilterVisualizationSOAPFunctionality:=GetITTFilterVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTFilterVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTFilterVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TFilterVisualizationFunctionality}
Constructor TFilterVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTFilterVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TFilterVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTFilterVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TFilterVisualizationFunctionalityRemoted.TFilterVisualizationSOAPFunctionality: ITFilterVisualizationSOAPFunctionality;
begin
if (FTFilterVisualizationSOAPFunctionality = nil)
  then FTFilterVisualizationSOAPFunctionality:=GetITFilterVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTFilterVisualizationSOAPFunctionality;
end;
{$ELSE}
function TFilterVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TFilterVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TFilterVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TFilterVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TFilterVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TFilterVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TFilterVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TFilterVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TFilterVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TFilterVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TFilterVisualizationFunctionalityRemoted.GetParams(out FilterType: integer; out FilterDATA: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TFilterVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   FilterType,FilterDATA);
{$ELSE}
TFilterVisualizationFunctionality_GetParams(ServerFunctionality(),   FilterType,FilterDATA);
{$ENDIF}
end;

procedure TFilterVisualizationFunctionalityRemoted.SetParams(const FilterType: integer; const FilterDATA: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TFilterVisualizationSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   FilterType,FilterDATA);
{$ELSE}
TFilterVisualizationFunctionality_SetParams(ServerFunctionality(),   FilterType,FilterDATA);
{$ENDIF}
end;


{TTHINTVisualizationFunctionality}
Constructor TTHINTVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTHINTVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTHINTVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTHINTVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTHINTVisualizationFunctionalityRemoted.TTHINTVisualizationSOAPFunctionality: ITTHINTVisualizationSOAPFunctionality;
begin
if (FTTHINTVisualizationSOAPFunctionality = nil)
  then FTTHINTVisualizationSOAPFunctionality:=GetITTHINTVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHINTVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTHINTVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTHINTVisualizationFunctionalityRemoted.GetInstanceParams(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTHINTVisualizationSOAPFunctionality.GetInstanceParams(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   IDs,MaxInstanceSize,Params);
{$ELSE}
TTHINTVisualizationFunctionality_GetInstanceParams(ServerFunctionality(),   IDs,MaxInstanceSize,Params);
{$ENDIF}
end;

procedure TTHINTVisualizationFunctionalityRemoted.GetInstanceParams1(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTHINTVisualizationSOAPFunctionality.GetInstanceParams1(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   IDs,MaxInstanceSize,Params);
{$ELSE}
TTHINTVisualizationFunctionality_GetInstanceParams1(ServerFunctionality(),   IDs,MaxInstanceSize,Params);
{$ENDIF}
end;

procedure TTHINTVisualizationFunctionalityRemoted.GetInstanceOwnerDatasAndParams(const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTHINTVisualizationSOAPFunctionality.GetInstanceOwnerDatasAndParams(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   IDs,DataFlags,MaxInstanceSize,Data,Params);
{$ELSE}
TTHINTVisualizationFunctionality_GetInstanceOwnerDatasAndParams(ServerFunctionality(),   IDs,DataFlags,MaxInstanceSize,Data,Params);
{$ENDIF}
end;


{THINTVisualizationFunctionality}
Constructor THINTVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTHINTVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor THINTVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTHINTVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function THINTVisualizationFunctionalityRemoted.THINTVisualizationSOAPFunctionality: ITHINTVisualizationSOAPFunctionality;
begin
if (FTHINTVisualizationSOAPFunctionality = nil)
  then FTHINTVisualizationSOAPFunctionality:=GetITHINTVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHINTVisualizationSOAPFunctionality;
end;
{$ELSE}
function THINTVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function THINTVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=THINTVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=THINTVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function THINTVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THINTVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THINTVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function THINTVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THINTVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THINTVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure THINTVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
THINTVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
THINTVisualizationFunctionality_GetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure THINTVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
THINTVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
{$ELSE}
THINTVisualizationFunctionality_GetDATA1(ServerFunctionality(),   DATAStream,DATAType,MaxSize);
{$ENDIF}
end;

procedure THINTVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
{$IFNDEF EmbeddedServer}
THINTVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
THINTVisualizationFunctionality_SetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure THINTVisualizationFunctionalityRemoted.GetPrivateDATA(out DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
THINTVisualizationSOAPFunctionality.GetPrivateDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
THINTVisualizationFunctionality_GetPrivateDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

procedure THINTVisualizationFunctionalityRemoted.GetPrivateDATA1(out DATAStream: TByteArray; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
THINTVisualizationSOAPFunctionality.GetPrivateDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,MaxSize);
{$ELSE}
THINTVisualizationFunctionality_GetPrivateDATA1(ServerFunctionality(),   DATAStream,MaxSize);
{$ENDIF}
end;

procedure THINTVisualizationFunctionalityRemoted.SetPrivateDATA(DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
THINTVisualizationSOAPFunctionality.SetPrivateDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
THINTVisualizationFunctionality_SetPrivateDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

function THINTVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=THINTVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THINTVisualizationFunctionality_getDATAFileID(ServerFunctionality());
{$ENDIF}
end;

procedure THINTVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
THINTVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
THINTVisualizationFunctionality_setDATAFileID(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure THINTVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
{$IFNDEF EmbeddedServer}
THINTVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
THINTVisualizationFunctionality_DATAFile_Clear(ServerFunctionality());
{$ENDIF}
end;


{TTDetailedPictureVisualizationFunctionality}
Constructor TTDetailedPictureVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTDetailedPictureVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTDetailedPictureVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTDetailedPictureVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTDetailedPictureVisualizationFunctionalityRemoted.TTDetailedPictureVisualizationSOAPFunctionality: ITTDetailedPictureVisualizationSOAPFunctionality;
begin
if (FTTDetailedPictureVisualizationSOAPFunctionality = nil)
  then FTTDetailedPictureVisualizationSOAPFunctionality:=GetITTDetailedPictureVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTDetailedPictureVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTDetailedPictureVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TDetailedPictureVisualizationFunctionality}
Constructor TDetailedPictureVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTDetailedPictureVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TDetailedPictureVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTDetailedPictureVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TDetailedPictureVisualizationFunctionalityRemoted.TDetailedPictureVisualizationSOAPFunctionality: ITDetailedPictureVisualizationSOAPFunctionality;
begin
if (FTDetailedPictureVisualizationSOAPFunctionality = nil)
  then FTDetailedPictureVisualizationSOAPFunctionality:=GetITDetailedPictureVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTDetailedPictureVisualizationSOAPFunctionality;
end;
{$ELSE}
function TDetailedPictureVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TDetailedPictureVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TDetailedPictureVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TDetailedPictureVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TDetailedPictureVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDetailedPictureVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDetailedPictureVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TDetailedPictureVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDetailedPictureVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDetailedPictureVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.GenerateFromImage(DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.GenerateFromImage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TDetailedPictureVisualizationFunctionality_GenerateFromImage(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.GenerateFromTiles(const TilesFolder: string; const SizePowerOf2: integer);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.GenerateFromTiles(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TilesFolder,SizePowerOf2);
{$ELSE}
TDetailedPictureVisualizationFunctionality_GenerateFromTiles(ServerFunctionality(),   TilesFolder,SizePowerOf2);
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.RegenerateRegionFromLevel(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.RegenerateRegionFromLevel(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
{$ELSE}
TDetailedPictureVisualizationFunctionality_RegenerateRegionFromLevel(ServerFunctionality(),   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.RegenerateRegion(const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.RegenerateRegion(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   XIndexMin,XIndexMax,YIndexMin,YIndexMax);
{$ELSE}
TDetailedPictureVisualizationFunctionality_RegenerateRegion(ServerFunctionality(),   XIndexMin,XIndexMax,YIndexMin,YIndexMax);
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.AddNewLevelAndRegenerate;
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.AddNewLevelAndRegenerate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TDetailedPictureVisualizationFunctionality_AddNewLevelAndRegenerate(ServerFunctionality());
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.GetLevelsInfo(out Info: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.GetLevelsInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Info);
{$ELSE}
TDetailedPictureVisualizationFunctionality_GetLevelsInfo(ServerFunctionality(),   Info);
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.Level_GetParams(const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.Level_GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
{$ELSE}
TDetailedPictureVisualizationFunctionality_Level_GetParams(ServerFunctionality(),   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.Level_SetParams(const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.Level_SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
{$ELSE}
TDetailedPictureVisualizationFunctionality_Level_SetParams(ServerFunctionality(),   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.Level_GetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.Level_GetSegments(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
{$ELSE}
TDetailedPictureVisualizationFunctionality_Level_GetSegments(ServerFunctionality(),   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.Level_GetSegmentsByIDs(const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.Level_GetSegmentsByIDs(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,SegmentsIDs,Segments);
{$ELSE}
TDetailedPictureVisualizationFunctionality_Level_GetSegmentsByIDs(ServerFunctionality(),   idLevel,SegmentsIDs,Segments);
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.Level_GetSegmentsHashes(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.Level_GetSegmentsHashes(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
{$ELSE}
TDetailedPictureVisualizationFunctionality_Level_GetSegmentsHashes(ServerFunctionality(),   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.Level_SetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.Level_SetSegments(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
{$ELSE}
TDetailedPictureVisualizationFunctionality_Level_SetSegments(ServerFunctionality(),   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.GetParams(out oWidth: integer; out oHeight: integer);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oWidth,oHeight);
{$ELSE}
TDetailedPictureVisualizationFunctionality_GetParams(ServerFunctionality(),   oWidth,oHeight);
{$ENDIF}
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
{$IFNDEF EmbeddedServer}
TDetailedPictureVisualizationSOAPFunctionality.GetCoordinates(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
{$ELSE}
TDetailedPictureVisualizationFunctionality_GetCoordinates(ServerFunctionality(),   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
{$ENDIF}
end;


{TTCoVisualizationFunctionality}
Constructor TTCoVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCoVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCoVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCoVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCoVisualizationFunctionalityRemoted.TTCoVisualizationSOAPFunctionality: ITTCoVisualizationSOAPFunctionality;
begin
if (FTTCoVisualizationSOAPFunctionality = nil)
  then FTTCoVisualizationSOAPFunctionality:=GetITTCoVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCoVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTCoVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TCoVisualizationFunctionality}
Constructor TCoVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCoVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCoVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCoVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCoVisualizationFunctionalityRemoted.TCoVisualizationSOAPFunctionality: ITCoVisualizationSOAPFunctionality;
begin
if (FTCoVisualizationSOAPFunctionality = nil)
  then FTCoVisualizationSOAPFunctionality:=GetITCoVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCoVisualizationSOAPFunctionality;
end;
{$ELSE}
function TCoVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TCoVisualizationFunctionalityRemoted.ToClone(out idClone: integer);
begin
{$IFNDEF EmbeddedServer}
TCoVisualizationSOAPFunctionality.ToClone(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idClone);
{$ELSE}
TCoVisualizationFunctionality_ToClone(ServerFunctionality(),   idClone);
{$ENDIF}
end;

function TCoVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TCoVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TCoVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TCoVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TCoVisualizationFunctionalityRemoted.GetSpace(out DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TCoVisualizationSOAPFunctionality.GetSpace(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TCoVisualizationFunctionality_GetSpace(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

procedure TCoVisualizationFunctionalityRemoted.GetSpace1(out DATAStream: TByteArray; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
TCoVisualizationSOAPFunctionality.GetSpace1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,MaxSize);
{$ELSE}
TCoVisualizationFunctionality_GetSpace1(ServerFunctionality(),   DATAStream,MaxSize);
{$ENDIF}
end;

procedure TCoVisualizationFunctionalityRemoted.SetSpace(DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TCoVisualizationSOAPFunctionality.SetSpace(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TCoVisualizationFunctionality_SetSpace(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

function TCoVisualizationFunctionalityRemoted.GetOwnSpaceHINTVisualization(out idHINTVisualization: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoVisualizationSOAPFunctionality.GetOwnSpaceHINTVisualization(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idHINTVisualization);
{$ELSE}
Result:=TCoVisualizationFunctionality_GetOwnSpaceHINTVisualization(ServerFunctionality(),   idHINTVisualization);
{$ENDIF}
end;

function TCoVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoVisualizationFunctionality_getDATAFileID(ServerFunctionality());
{$ENDIF}
end;

procedure TCoVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TCoVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCoVisualizationFunctionality_setDATAFileID(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TCoVisualizationFunctionalityRemoted.Pack;
begin
{$IFNDEF EmbeddedServer}
TCoVisualizationSOAPFunctionality.Pack(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TCoVisualizationFunctionality_Pack(ServerFunctionality());
{$ENDIF}
end;

procedure TCoVisualizationFunctionalityRemoted.UnPack;
begin
{$IFNDEF EmbeddedServer}
TCoVisualizationSOAPFunctionality.UnPack(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TCoVisualizationFunctionality_UnPack(ServerFunctionality());
{$ENDIF}
end;

function TCoVisualizationFunctionalityRemoted.IsPacked: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoVisualizationSOAPFunctionality.IsPacked(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoVisualizationFunctionality_IsPacked(ServerFunctionality());
{$ENDIF}
end;


{TTForumMessageFunctionality}
Constructor TTForumMessageFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTForumMessageSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTForumMessageFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTForumMessageSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTForumMessageFunctionalityRemoted.TTForumMessageSOAPFunctionality: ITTForumMessageSOAPFunctionality;
begin
if (FTTForumMessageSOAPFunctionality = nil)
  then FTTForumMessageSOAPFunctionality:=GetITTForumMessageSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTForumMessageSOAPFunctionality;
end;
{$ELSE}
function TTForumMessageFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TForumMessageFunctionality}
Constructor TForumMessageFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTForumMessageSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TForumMessageFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTForumMessageSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TForumMessageFunctionalityRemoted.TForumMessageSOAPFunctionality: ITForumMessageSOAPFunctionality;
begin
if (FTForumMessageSOAPFunctionality = nil)
  then FTForumMessageSOAPFunctionality:=GetITForumMessageSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTForumMessageSOAPFunctionality;
end;
{$ELSE}
function TForumMessageFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TForumMessageFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumMessageSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumMessageFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TForumMessageFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumMessageSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumMessageFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TForumMessageFunctionalityRemoted.getidForum: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumMessageSOAPFunctionality.getidForum(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumMessageFunctionality_getidForum(ServerFunctionality());
{$ENDIF}
end;

procedure TForumMessageFunctionalityRemoted.setidForum(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TForumMessageSOAPFunctionality.setidForum(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TForumMessageFunctionality_setidForum(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TForumMessageFunctionalityRemoted.idUser: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumMessageSOAPFunctionality.idUser(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumMessageFunctionality_idUser(ServerFunctionality());
{$ENDIF}
end;

procedure TForumMessageFunctionalityRemoted.Send;
begin
{$IFNDEF EmbeddedServer}
TForumMessageSOAPFunctionality.Send(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TForumMessageFunctionality_Send(ServerFunctionality());
{$ENDIF}
end;

function TForumMessageFunctionalityRemoted.SentTime: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumMessageSOAPFunctionality.SentTime(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumMessageFunctionality_SentTime(ServerFunctionality());
{$ENDIF}
end;

function TForumMessageFunctionalityRemoted.getidForMessage: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumMessageSOAPFunctionality.getidForMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumMessageFunctionality_getidForMessage(ServerFunctionality());
{$ENDIF}
end;

procedure TForumMessageFunctionalityRemoted.setidForMessage(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TForumMessageSOAPFunctionality.setidForMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TForumMessageFunctionality_setidForMessage(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TForumMessageFunctionalityRemoted.LastModified: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumMessageSOAPFunctionality.LastModified(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumMessageFunctionality_LastModified(ServerFunctionality());
{$ENDIF}
end;

procedure TForumMessageFunctionalityRemoted.GetMessage(out Message: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TForumMessageSOAPFunctionality.GetMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Message);
{$ELSE}
TForumMessageFunctionality_GetMessage(ServerFunctionality(),   Message);
{$ENDIF}
end;

procedure TForumMessageFunctionalityRemoted.SetMessage(const Message: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TForumMessageSOAPFunctionality.SetMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Message);
{$ELSE}
TForumMessageFunctionality_SetMessage(ServerFunctionality(),   Message);
{$ENDIF}
end;

function TForumMessageFunctionalityRemoted.ReplyMessageCount: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumMessageSOAPFunctionality.ReplyMessageCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumMessageFunctionality_ReplyMessageCount(ServerFunctionality());
{$ENDIF}
end;

procedure TForumMessageFunctionalityRemoted.GetReplyMessageList(out MessageList: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TForumMessageSOAPFunctionality.GetReplyMessageList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MessageList);
{$ELSE}
TForumMessageFunctionality_GetReplyMessageList(ServerFunctionality(),   MessageList);
{$ENDIF}
end;


{TTForumFunctionality}
Constructor TTForumFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTForumSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTForumFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTForumSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTForumFunctionalityRemoted.TTForumSOAPFunctionality: ITTForumSOAPFunctionality;
begin
if (FTTForumSOAPFunctionality = nil)
  then FTTForumSOAPFunctionality:=GetITTForumSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTForumSOAPFunctionality;
end;
{$ELSE}
function TTForumFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TForumFunctionality}
Constructor TForumFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTForumSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TForumFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTForumSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TForumFunctionalityRemoted.TForumSOAPFunctionality: ITForumSOAPFunctionality;
begin
if (FTForumSOAPFunctionality = nil)
  then FTForumSOAPFunctionality:=GetITForumSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTForumSOAPFunctionality;
end;
{$ELSE}
function TForumFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TForumFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TForumFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TForumSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TForumFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TForumFunctionalityRemoted.getMessageLifeTime: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumSOAPFunctionality.getMessageLifeTime(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumFunctionality_getMessageLifeTime(ServerFunctionality());
{$ENDIF}
end;

procedure TForumFunctionalityRemoted.setMessageLifeTime(Value: TDateTime);
begin
{$IFNDEF EmbeddedServer}
TForumSOAPFunctionality.setMessageLifeTime(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TForumFunctionality_setMessageLifeTime(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TForumFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TForumFunctionalityRemoted.RootMessageCount: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumSOAPFunctionality.RootMessageCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumFunctionality_RootMessageCount(ServerFunctionality());
{$ENDIF}
end;

procedure TForumFunctionalityRemoted.GetRootMessageList(out MessageList: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TForumSOAPFunctionality.GetRootMessageList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MessageList);
{$ELSE}
TForumFunctionality_GetRootMessageList(ServerFunctionality(),   MessageList);
{$ENDIF}
end;

function TForumFunctionalityRemoted.MessageCount: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumSOAPFunctionality.MessageCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TForumFunctionality_MessageCount(ServerFunctionality());
{$ENDIF}
end;

procedure TForumFunctionalityRemoted.GetMessageList(out MessageList: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TForumSOAPFunctionality.GetMessageList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MessageList);
{$ELSE}
TForumFunctionality_GetMessageList(ServerFunctionality(),   MessageList);
{$ENDIF}
end;

function TForumFunctionalityRemoted.AddMessage(const pidUser: integer; const pidForMessage: integer): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TForumSOAPFunctionality.AddMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pidUser,pidForMessage);
{$ELSE}
Result:=TForumFunctionality_AddMessage(ServerFunctionality(),   pidUser,pidForMessage);
{$ENDIF}
end;

procedure TForumFunctionalityRemoted.DestroyMessage(const pidMessage: integer);
begin
{$IFNDEF EmbeddedServer}
TForumSOAPFunctionality.DestroyMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pidMessage);
{$ELSE}
TForumFunctionality_DestroyMessage(ServerFunctionality(),   pidMessage);
{$ENDIF}
end;


{TTCUSTOMVisualizationFunctionality}
Constructor TTCUSTOMVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCUSTOMVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCUSTOMVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCUSTOMVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCUSTOMVisualizationFunctionalityRemoted.TTCUSTOMVisualizationSOAPFunctionality: ITTCUSTOMVisualizationSOAPFunctionality;
begin
if (FTTCUSTOMVisualizationSOAPFunctionality = nil)
  then FTTCUSTOMVisualizationSOAPFunctionality:=GetITTCUSTOMVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCUSTOMVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTCUSTOMVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TCUSTOMVisualizationFunctionality}
Constructor TCUSTOMVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCUSTOMVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCUSTOMVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCUSTOMVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCUSTOMVisualizationFunctionalityRemoted.TCUSTOMVisualizationSOAPFunctionality: ITCUSTOMVisualizationSOAPFunctionality;
begin
if (FTCUSTOMVisualizationSOAPFunctionality = nil)
  then FTCUSTOMVisualizationSOAPFunctionality:=GetITCUSTOMVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCUSTOMVisualizationSOAPFunctionality;
end;
{$ELSE}
function TCUSTOMVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TCUSTOMVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCUSTOMVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TCUSTOMVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TCUSTOMVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCUSTOMVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCUSTOMVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TCUSTOMVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCUSTOMVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCUSTOMVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TCUSTOMVisualizationFunctionalityRemoted.getMODULEName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCUSTOMVisualizationSOAPFunctionality.getMODULEName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCUSTOMVisualizationFunctionality_getMODULEName(ServerFunctionality());
{$ENDIF}
end;

procedure TCUSTOMVisualizationFunctionalityRemoted.setMODULEName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TCUSTOMVisualizationSOAPFunctionality.setMODULEName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCUSTOMVisualizationFunctionality_setMODULEName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TCUSTOMVisualizationFunctionalityRemoted.getFunctionName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCUSTOMVisualizationSOAPFunctionality.getFunctionName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCUSTOMVisualizationFunctionality_getFunctionName(ServerFunctionality());
{$ENDIF}
end;

procedure TCUSTOMVisualizationFunctionalityRemoted.setFunctionName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TCUSTOMVisualizationSOAPFunctionality.setFunctionName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCUSTOMVisualizationFunctionality_setFunctionName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TCUSTOMVisualizationFunctionalityRemoted.getFunctionVersion: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TCUSTOMVisualizationSOAPFunctionality.getFunctionVersion(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCUSTOMVisualizationFunctionality_getFunctionVersion(ServerFunctionality());
{$ENDIF}
end;

procedure TCUSTOMVisualizationFunctionalityRemoted.setFunctionVersion(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TCUSTOMVisualizationSOAPFunctionality.setFunctionVersion(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCUSTOMVisualizationFunctionality_setFunctionVersion(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TCUSTOMVisualizationFunctionalityRemoted.GetParams(out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer);
begin
{$IFNDEF EmbeddedServer}
TCUSTOMVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oMODULEName,oFunctionName,oFunctionVersion);
{$ELSE}
TCUSTOMVisualizationFunctionality_GetParams(ServerFunctionality(),   oMODULEName,oFunctionName,oFunctionVersion);
{$ENDIF}
end;


{TTOLEVisualizationFunctionality}
Constructor TTOLEVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTOLEVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTOLEVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTOLEVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTOLEVisualizationFunctionalityRemoted.TTOLEVisualizationSOAPFunctionality: ITTOLEVisualizationSOAPFunctionality;
begin
if (FTTOLEVisualizationSOAPFunctionality = nil)
  then FTTOLEVisualizationSOAPFunctionality:=GetITTOLEVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOLEVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTOLEVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TOLEVisualizationFunctionality}
Constructor TOLEVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTOLEVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TOLEVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTOLEVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TOLEVisualizationFunctionalityRemoted.TOLEVisualizationSOAPFunctionality: ITOLEVisualizationSOAPFunctionality;
begin
if (FTOLEVisualizationSOAPFunctionality = nil)
  then FTOLEVisualizationSOAPFunctionality:=GetITOLEVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOLEVisualizationSOAPFunctionality;
end;
{$ELSE}
function TOLEVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TOLEVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TOLEVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TOLEVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TOLEVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOLEVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOLEVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TOLEVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOLEVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOLEVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TOLEVisualizationFunctionalityRemoted.GetDATA(out Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TOLEVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOLEVisualizationFunctionality_GetDATA(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TOLEVisualizationFunctionalityRemoted.GetDATA1(out Value: TByteArray; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
TOLEVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value,MaxSize);
{$ELSE}
TOLEVisualizationFunctionality_GetDATA1(ServerFunctionality(),   Value,MaxSize);
{$ENDIF}
end;

procedure TOLEVisualizationFunctionalityRemoted.SetDATA(Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TOLEVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOLEVisualizationFunctionality_SetDATA(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTHTMLVisualizationFunctionality}
Constructor TTHTMLVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTHTMLVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTHTMLVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTHTMLVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTHTMLVisualizationFunctionalityRemoted.TTHTMLVisualizationSOAPFunctionality: ITTHTMLVisualizationSOAPFunctionality;
begin
if (FTTHTMLVisualizationSOAPFunctionality = nil)
  then FTTHTMLVisualizationSOAPFunctionality:=GetITTHTMLVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHTMLVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTHTMLVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{THTMLVisualizationFunctionality}
Constructor THTMLVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTHTMLVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor THTMLVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTHTMLVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function THTMLVisualizationFunctionalityRemoted.THTMLVisualizationSOAPFunctionality: ITHTMLVisualizationSOAPFunctionality;
begin
if (FTHTMLVisualizationSOAPFunctionality = nil)
  then FTHTMLVisualizationSOAPFunctionality:=GetITHTMLVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHTMLVisualizationSOAPFunctionality;
end;
{$ELSE}
function THTMLVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function THTMLVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=THTMLVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=THTMLVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function THTMLVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THTMLVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THTMLVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function THTMLVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THTMLVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THTMLVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function THTMLVisualizationFunctionalityRemoted.getWidth: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=THTMLVisualizationSOAPFunctionality.getWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THTMLVisualizationFunctionality_getWidth(ServerFunctionality());
{$ENDIF}
end;

procedure THTMLVisualizationFunctionalityRemoted.setWidth(Value: integer);
begin
{$IFNDEF EmbeddedServer}
THTMLVisualizationSOAPFunctionality.setWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
THTMLVisualizationFunctionality_setWidth(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure THTMLVisualizationFunctionalityRemoted.GetDATA(out Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
THTMLVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
THTMLVisualizationFunctionality_GetDATA(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure THTMLVisualizationFunctionalityRemoted.GetDATA1(out Value: TByteArray; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
THTMLVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value,MaxSize);
{$ELSE}
THTMLVisualizationFunctionality_GetDATA1(ServerFunctionality(),   Value,MaxSize);
{$ENDIF}
end;

procedure THTMLVisualizationFunctionalityRemoted.SetDATA(Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
THTMLVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
THTMLVisualizationFunctionality_SetDATA(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTBZRVisualizationFunctionality}
Constructor TTBZRVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTBZRVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTBZRVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTBZRVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTBZRVisualizationFunctionalityRemoted.TTBZRVisualizationSOAPFunctionality: ITTBZRVisualizationSOAPFunctionality;
begin
if (FTTBZRVisualizationSOAPFunctionality = nil)
  then FTTBZRVisualizationSOAPFunctionality:=GetITTBZRVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTBZRVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTBZRVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TBZRVisualizationFunctionality}
Constructor TBZRVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTBZRVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TBZRVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTBZRVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TBZRVisualizationFunctionalityRemoted.TBZRVisualizationSOAPFunctionality: ITBZRVisualizationSOAPFunctionality;
begin
if (FTBZRVisualizationSOAPFunctionality = nil)
  then FTBZRVisualizationSOAPFunctionality:=GetITBZRVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTBZRVisualizationSOAPFunctionality;
end;
{$ELSE}
function TBZRVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TBZRVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TBZRVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TBZRVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TBZRVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TBZRVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TBZRVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TBZRVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TBZRVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TBZRVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTAGIFVisualizationFunctionality}
Constructor TTAGIFVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTAGIFVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTAGIFVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTAGIFVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTAGIFVisualizationFunctionalityRemoted.TTAGIFVisualizationSOAPFunctionality: ITTAGIFVisualizationSOAPFunctionality;
begin
if (FTTAGIFVisualizationSOAPFunctionality = nil)
  then FTTAGIFVisualizationSOAPFunctionality:=GetITTAGIFVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTAGIFVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTAGIFVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TAGIFVisualizationFunctionality}
Constructor TAGIFVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTAGIFVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TAGIFVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTAGIFVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TAGIFVisualizationFunctionalityRemoted.TAGIFVisualizationSOAPFunctionality: ITAGIFVisualizationSOAPFunctionality;
begin
if (FTAGIFVisualizationSOAPFunctionality = nil)
  then FTAGIFVisualizationSOAPFunctionality:=GetITAGIFVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTAGIFVisualizationSOAPFunctionality;
end;
{$ELSE}
function TAGIFVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TAGIFVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TAGIFVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TAGIFVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TAGIFVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TAGIFVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAGIFVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TAGIFVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TAGIFVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAGIFVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TAGIFVisualizationFunctionalityRemoted.GetDATA(out Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TAGIFVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TAGIFVisualizationFunctionality_GetDATA(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TAGIFVisualizationFunctionalityRemoted.GetDATA1(out Value: TByteArray; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
TAGIFVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value,MaxSize);
{$ELSE}
TAGIFVisualizationFunctionality_GetDATA1(ServerFunctionality(),   Value,MaxSize);
{$ENDIF}
end;

procedure TAGIFVisualizationFunctionalityRemoted.SetDATA(Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TAGIFVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TAGIFVisualizationFunctionality_SetDATA(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTOrientedVIDEOVisualizationFunctionality}
Constructor TTOrientedVIDEOVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTOrientedVIDEOVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTOrientedVIDEOVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTOrientedVIDEOVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTOrientedVIDEOVisualizationFunctionalityRemoted.TTOrientedVIDEOVisualizationSOAPFunctionality: ITTOrientedVIDEOVisualizationSOAPFunctionality;
begin
if (FTTOrientedVIDEOVisualizationSOAPFunctionality = nil)
  then FTTOrientedVIDEOVisualizationSOAPFunctionality:=GetITTOrientedVIDEOVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOrientedVIDEOVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTOrientedVIDEOVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TOrientedVIDEOVisualizationFunctionality}
Constructor TOrientedVIDEOVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTOrientedVIDEOVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TOrientedVIDEOVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTOrientedVIDEOVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TOrientedVIDEOVisualizationFunctionalityRemoted.TOrientedVIDEOVisualizationSOAPFunctionality: ITOrientedVIDEOVisualizationSOAPFunctionality;
begin
if (FTOrientedVIDEOVisualizationSOAPFunctionality = nil)
  then FTOrientedVIDEOVisualizationSOAPFunctionality:=GetITOrientedVIDEOVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOrientedVIDEOVisualizationSOAPFunctionality;
end;
{$ELSE}
function TOrientedVIDEOVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TOrientedVIDEOVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedVIDEOVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TOrientedVIDEOVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TOrientedVIDEOVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedVIDEOVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedVIDEOVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TOrientedVIDEOVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedVIDEOVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedVIDEOVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TOrientedVIDEOVisualizationFunctionalityRemoted.getDataServer: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedVIDEOVisualizationSOAPFunctionality.getDataServer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedVIDEOVisualizationFunctionality_getDataServer(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedVIDEOVisualizationFunctionalityRemoted.setDataServer(Value: string);
begin
{$IFNDEF EmbeddedServer}
TOrientedVIDEOVisualizationSOAPFunctionality.setDataServer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedVIDEOVisualizationFunctionality_setDataServer(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOrientedVIDEOVisualizationFunctionalityRemoted.getObjectID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedVIDEOVisualizationSOAPFunctionality.getObjectID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedVIDEOVisualizationFunctionality_getObjectID(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedVIDEOVisualizationFunctionalityRemoted.setObjectID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedVIDEOVisualizationSOAPFunctionality.setObjectID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedVIDEOVisualizationFunctionality_setObjectID(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTVIDEOVisualizationFunctionality}
Constructor TTVIDEOVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTVIDEOVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTVIDEOVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTVIDEOVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTVIDEOVisualizationFunctionalityRemoted.TTVIDEOVisualizationSOAPFunctionality: ITTVIDEOVisualizationSOAPFunctionality;
begin
if (FTTVIDEOVisualizationSOAPFunctionality = nil)
  then FTTVIDEOVisualizationSOAPFunctionality:=GetITTVIDEOVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTVIDEOVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTVIDEOVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TVIDEOVisualizationFunctionality}
Constructor TVIDEOVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTVIDEOVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TVIDEOVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTVIDEOVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TVIDEOVisualizationFunctionalityRemoted.TVIDEOVisualizationSOAPFunctionality: ITVIDEOVisualizationSOAPFunctionality;
begin
if (FTVIDEOVisualizationSOAPFunctionality = nil)
  then FTVIDEOVisualizationSOAPFunctionality:=GetITVIDEOVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTVIDEOVisualizationSOAPFunctionality;
end;
{$ELSE}
function TVIDEOVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TVIDEOVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TVIDEOVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TVIDEOVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TVIDEOVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TVIDEOVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TVIDEOVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TVIDEOVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TVIDEOVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TVIDEOVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TVIDEOVisualizationFunctionalityRemoted.getDataServer: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TVIDEOVisualizationSOAPFunctionality.getDataServer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TVIDEOVisualizationFunctionality_getDataServer(ServerFunctionality());
{$ENDIF}
end;

procedure TVIDEOVisualizationFunctionalityRemoted.setDataServer(Value: string);
begin
{$IFNDEF EmbeddedServer}
TVIDEOVisualizationSOAPFunctionality.setDataServer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TVIDEOVisualizationFunctionality_setDataServer(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TVIDEOVisualizationFunctionalityRemoted.getObjectID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TVIDEOVisualizationSOAPFunctionality.getObjectID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TVIDEOVisualizationFunctionality_getObjectID(ServerFunctionality());
{$ENDIF}
end;

procedure TVIDEOVisualizationFunctionalityRemoted.setObjectID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TVIDEOVisualizationSOAPFunctionality.setObjectID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TVIDEOVisualizationFunctionality_setObjectID(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTOPPVisualizationFunctionality}
Constructor TTOPPVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTOPPVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTOPPVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTOPPVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTOPPVisualizationFunctionalityRemoted.TTOPPVisualizationSOAPFunctionality: ITTOPPVisualizationSOAPFunctionality;
begin
if (FTTOPPVisualizationSOAPFunctionality = nil)
  then FTTOPPVisualizationSOAPFunctionality:=GetITTOPPVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOPPVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTOPPVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TOPPVisualizationFunctionality}
Constructor TOPPVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTOPPVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TOPPVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTOPPVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TOPPVisualizationFunctionalityRemoted.TOPPVisualizationSOAPFunctionality: ITOPPVisualizationSOAPFunctionality;
begin
if (FTOPPVisualizationSOAPFunctionality = nil)
  then FTOPPVisualizationSOAPFunctionality:=GetITOPPVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOPPVisualizationSOAPFunctionality;
end;
{$ELSE}
function TOPPVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TOPPVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TOPPVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TOPPVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TOPPVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOPPVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOPPVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TOPPVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOPPVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOPPVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TOPPVisualizationFunctionalityRemoted.getPropsPanel_idTObj: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOPPVisualizationSOAPFunctionality.getPropsPanel_idTObj(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOPPVisualizationFunctionality_getPropsPanel_idTObj(ServerFunctionality());
{$ENDIF}
end;

procedure TOPPVisualizationFunctionalityRemoted.setPropsPanel_idTObj(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TOPPVisualizationSOAPFunctionality.setPropsPanel_idTObj(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOPPVisualizationFunctionality_setPropsPanel_idTObj(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOPPVisualizationFunctionalityRemoted.getPropsPanel_idObj: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOPPVisualizationSOAPFunctionality.getPropsPanel_idObj(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOPPVisualizationFunctionality_getPropsPanel_idObj(ServerFunctionality());
{$ENDIF}
end;

procedure TOPPVisualizationFunctionalityRemoted.setPropsPanel_idObj(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TOPPVisualizationSOAPFunctionality.setPropsPanel_idObj(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOPPVisualizationFunctionality_setPropsPanel_idObj(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TOPPVisualizationFunctionalityRemoted.GetParams(out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer);
begin
{$IFNDEF EmbeddedServer}
TOPPVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oPropsPanel_idTObj,oPropsPanel_idObj);
{$ELSE}
TOPPVisualizationFunctionality_GetParams(ServerFunctionality(),   oPropsPanel_idTObj,oPropsPanel_idObj);
{$ENDIF}
end;


{TTMODELServerFunctionality}
Constructor TTMODELServerFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTMODELServerSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTMODELServerFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTMODELServerSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTMODELServerFunctionalityRemoted.TTMODELServerSOAPFunctionality: ITTMODELServerSOAPFunctionality;
begin
if (FTTMODELServerSOAPFunctionality = nil)
  then FTTMODELServerSOAPFunctionality:=GetITTMODELServerSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMODELServerSOAPFunctionality;
end;
{$ELSE}
function TTMODELServerFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTMODELServerFunctionalityRemoted.GetInstanceByIPAddress(const IPAddress: string;  out id: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTMODELServerSOAPFunctionality.GetInstanceByIPAddress(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   IPAddress,id);
{$ELSE}
Result:=TTMODELServerFunctionality_GetInstanceByIPAddress(ServerFunctionality(),   IPAddress,id);
{$ENDIF}
end;


{TMODELServerFunctionality}
Constructor TMODELServerFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTMODELServerSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TMODELServerFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTMODELServerSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TMODELServerFunctionalityRemoted.TMODELServerSOAPFunctionality: ITMODELServerSOAPFunctionality;
begin
if (FTMODELServerSOAPFunctionality = nil)
  then FTMODELServerSOAPFunctionality:=GetITMODELServerSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMODELServerSOAPFunctionality;
end;
{$ELSE}
function TMODELServerFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TMODELServerFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELServerSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELServerFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELServerFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMODELServerSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELServerFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELServerFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELServerSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELServerFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TMODELServerFunctionalityRemoted.getIPAddress: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELServerSOAPFunctionality.getIPAddress(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELServerFunctionality_getIPAddress(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELServerFunctionalityRemoted.setIPAddress(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMODELServerSOAPFunctionality.setIPAddress(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELServerFunctionality_setIPAddress(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELServerFunctionalityRemoted.IsUserExist(const _UserName,_UserPassword: string): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELServerSOAPFunctionality.IsUserExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   _UserName,_UserPassword);
{$ELSE}
Result:=TMODELServerFunctionality_IsUserExist(ServerFunctionality(),   _UserName,_UserPassword);
{$ENDIF}
end;

function TMODELServerFunctionalityRemoted.GetUserID(const _UserName,_UserPassword: string): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELServerSOAPFunctionality.GetUserID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   _UserName,_UserPassword);
{$ELSE}
Result:=TMODELServerFunctionality_GetUserID(ServerFunctionality(),   _UserName,_UserPassword);
{$ENDIF}
end;

function TMODELServerFunctionalityRemoted.IsOnLine: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELServerSOAPFunctionality.IsOnLine(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELServerFunctionality_IsOnLine(ServerFunctionality());
{$ENDIF}
end;

function TMODELServerFunctionalityRemoted.Info: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELServerSOAPFunctionality.Info(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELServerFunctionality_Info(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELServerFunctionalityRemoted.GetLicense(out License: WideString);
begin
{$IFNDEF EmbeddedServer}
TMODELServerSOAPFunctionality.GetLicense(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   License);
{$ELSE}
TMODELServerFunctionality_GetLicense(ServerFunctionality(),   License);
{$ENDIF}
end;

procedure TMODELServerFunctionalityRemoted.CreateNewUserByDefaultPrototype(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELServerSOAPFunctionality.CreateNewUserByDefaultPrototype(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,idNewUser);
{$ELSE}
TMODELServerFunctionality_CreateNewUserByDefaultPrototype(ServerFunctionality(),   NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,idNewUser);
{$ENDIF}
end;

procedure TMODELServerFunctionalityRemoted.CreateNewUserByDefaultPrototype1(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString; const Signature: WideString;  out idNewUser: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELServerSOAPFunctionality.CreateNewUserByDefaultPrototype1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,Signature,idNewUser);
{$ELSE}
TMODELServerFunctionality_CreateNewUserByDefaultPrototype1(ServerFunctionality(),   NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,Signature,idNewUser);
{$ENDIF}
end;


{TTCoReferenceFunctionality}
Constructor TTCoReferenceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCoReferenceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCoReferenceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCoReferenceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCoReferenceFunctionalityRemoted.TTCoReferenceSOAPFunctionality: ITTCoReferenceSOAPFunctionality;
begin
if (FTTCoReferenceSOAPFunctionality = nil)
  then FTTCoReferenceSOAPFunctionality:=GetITTCoReferenceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCoReferenceSOAPFunctionality;
end;
{$ELSE}
function TTCoReferenceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TCoReferenceFunctionality}
Constructor TCoReferenceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCoReferenceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCoReferenceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCoReferenceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCoReferenceFunctionalityRemoted.TCoReferenceSOAPFunctionality: ITCoReferenceSOAPFunctionality;
begin
if (FTCoReferenceSOAPFunctionality = nil)
  then FTCoReferenceSOAPFunctionality:=GetITCoReferenceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCoReferenceSOAPFunctionality;
end;
{$ELSE}
function TCoReferenceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TCoReferenceFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoReferenceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoReferenceFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TCoReferenceFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TCoReferenceSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCoReferenceFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TCoReferenceFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoReferenceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoReferenceFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TCoReferenceFunctionalityRemoted.GetReferencedObject(out idTReferencedObject,idReferencedObject: integer);
begin
{$IFNDEF EmbeddedServer}
TCoReferenceSOAPFunctionality.GetReferencedObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTReferencedObject,idReferencedObject);
{$ELSE}
TCoReferenceFunctionality_GetReferencedObject(ServerFunctionality(),   idTReferencedObject,idReferencedObject);
{$ENDIF}
end;

procedure TCoReferenceFunctionalityRemoted.SetReferencedObject(const idTReferencedObject,idReferencedObject: integer);
begin
{$IFNDEF EmbeddedServer}
TCoReferenceSOAPFunctionality.SetReferencedObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTReferencedObject,idReferencedObject);
{$ELSE}
TCoReferenceFunctionality_SetReferencedObject(ServerFunctionality(),   idTReferencedObject,idReferencedObject);
{$ENDIF}
end;


{TTPositionerFunctionality}
Constructor TTPositionerFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTPositionerSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTPositionerFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTPositionerSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTPositionerFunctionalityRemoted.TTPositionerSOAPFunctionality: ITTPositionerSOAPFunctionality;
begin
if (FTTPositionerSOAPFunctionality = nil)
  then FTTPositionerSOAPFunctionality:=GetITTPositionerSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTPositionerSOAPFunctionality;
end;
{$ELSE}
function TTPositionerFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TPositionerFunctionality}
Constructor TPositionerFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTPositionerSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TPositionerFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTPositionerSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TPositionerFunctionalityRemoted.TPositionerSOAPFunctionality: ITPositionerSOAPFunctionality;
begin
if (FTPositionerSOAPFunctionality = nil)
  then FTPositionerSOAPFunctionality:=GetITPositionerSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTPositionerSOAPFunctionality;
end;
{$ELSE}
function TPositionerFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TPositionerFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TPositionerSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TPositionerFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TPositionerFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TPositionerSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TPositionerFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TPositionerFunctionalityRemoted.Get2DPosition(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
{$IFNDEF EmbeddedServer}
TPositionerSOAPFunctionality.Get2DPosition(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
{$ELSE}
TPositionerFunctionality_Get2DPosition(ServerFunctionality(),   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
{$ENDIF}
end;

procedure TPositionerFunctionalityRemoted.Save2DPosition(const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
{$IFNDEF EmbeddedServer}
TPositionerSOAPFunctionality.Save2DPosition(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
{$ELSE}
TPositionerFunctionality_Save2DPosition(ServerFunctionality(),   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
{$ENDIF}
end;

function TPositionerFunctionalityRemoted.getPositionName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TPositionerSOAPFunctionality.getPositionName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TPositionerFunctionality_getPositionName(ServerFunctionality());
{$ENDIF}
end;

procedure TPositionerFunctionalityRemoted.setPositionName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TPositionerSOAPFunctionality.setPositionName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TPositionerFunctionality_setPositionName(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTOrientedWMFVisualizationFunctionality}
Constructor TTOrientedWMFVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTOrientedWMFVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTOrientedWMFVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTOrientedWMFVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTOrientedWMFVisualizationFunctionalityRemoted.TTOrientedWMFVisualizationSOAPFunctionality: ITTOrientedWMFVisualizationSOAPFunctionality;
begin
if (FTTOrientedWMFVisualizationSOAPFunctionality = nil)
  then FTTOrientedWMFVisualizationSOAPFunctionality:=GetITTOrientedWMFVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOrientedWMFVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTOrientedWMFVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TOrientedWMFVisualizationFunctionality}
Constructor TOrientedWMFVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTOrientedWMFVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TOrientedWMFVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTOrientedWMFVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TOrientedWMFVisualizationFunctionalityRemoted.TOrientedWMFVisualizationSOAPFunctionality: ITOrientedWMFVisualizationSOAPFunctionality;
begin
if (FTOrientedWMFVisualizationSOAPFunctionality = nil)
  then FTOrientedWMFVisualizationSOAPFunctionality:=GetITOrientedWMFVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOrientedWMFVisualizationSOAPFunctionality;
end;
{$ELSE}
function TOrientedWMFVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TOrientedWMFVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedWMFVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TOrientedWMFVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TOrientedWMFVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedWMFVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedWMFVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TOrientedWMFVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedWMFVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedWMFVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedWMFVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TOrientedWMFVisualizationFunctionality_GetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedWMFVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
{$ELSE}
TOrientedWMFVisualizationFunctionality_GetDATA1(ServerFunctionality(),   DATAStream,DATAType,MaxSize);
{$ENDIF}
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedWMFVisualizationSOAPFunctionality.GetJPEGDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,pWidth,pHeight,pQuality,MaxSize);
{$ELSE}
TOrientedWMFVisualizationFunctionality_GetJPEGDATA(ServerFunctionality(),   DATAStream,pWidth,pHeight,pQuality,MaxSize);
{$ENDIF}
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedWMFVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TOrientedWMFVisualizationFunctionality_SetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

function TOrientedWMFVisualizationFunctionalityRemoted.getWidth: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedWMFVisualizationSOAPFunctionality.getWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedWMFVisualizationFunctionality_getWidth(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.setWidth(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TOrientedWMFVisualizationSOAPFunctionality.setWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedWMFVisualizationFunctionality_setWidth(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOrientedWMFVisualizationFunctionalityRemoted.getHeight: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedWMFVisualizationSOAPFunctionality.getHeight(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedWMFVisualizationFunctionality_getHeight(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.setHeight(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TOrientedWMFVisualizationSOAPFunctionality.setHeight(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedWMFVisualizationFunctionality_setHeight(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOrientedWMFVisualizationFunctionalityRemoted.getOrientation: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedWMFVisualizationSOAPFunctionality.getOrientation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedWMFVisualizationFunctionality_getOrientation(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.setOrientation(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedWMFVisualizationSOAPFunctionality.setOrientation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedWMFVisualizationFunctionality_setOrientation(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.ChangeScale(const ScaleFactor: Double);
begin
{$IFNDEF EmbeddedServer}
TOrientedWMFVisualizationSOAPFunctionality.ChangeScale(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ScaleFactor);
{$ELSE}
TOrientedWMFVisualizationFunctionality_ChangeScale(ServerFunctionality(),   ScaleFactor);
{$ENDIF}
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.UpdateContainer;
begin
{$IFNDEF EmbeddedServer}
TOrientedWMFVisualizationSOAPFunctionality.UpdateContainer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TOrientedWMFVisualizationFunctionality_UpdateContainer(ServerFunctionality());
{$ENDIF}
end;

function TOrientedWMFVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedWMFVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedWMFVisualizationFunctionality_getDATAFileID(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedWMFVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedWMFVisualizationFunctionality_setDATAFileID(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
{$IFNDEF EmbeddedServer}
TOrientedWMFVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TOrientedWMFVisualizationFunctionality_DATAFile_Clear(ServerFunctionality());
{$ENDIF}
end;

function TOrientedWMFVisualizationFunctionalityRemoted.IsNewContainerAcceptable(const NewWidth,NewHeight,NewScale: Double): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedWMFVisualizationSOAPFunctionality.IsNewContainerAcceptable(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewWidth,NewHeight,NewScale);
{$ELSE}
Result:=TOrientedWMFVisualizationFunctionality_IsNewContainerAcceptable(ServerFunctionality(),   NewWidth,NewHeight,NewScale);
{$ENDIF}
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.GetParams(out oWidth: Double; out oHeight: Double; out oOrientation: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedWMFVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oWidth,oHeight,oOrientation);
{$ELSE}
TOrientedWMFVisualizationFunctionality_GetParams(ServerFunctionality(),   oWidth,oHeight,oOrientation);
{$ENDIF}
end;


{TTCELLVisualizationFunctionality}
Constructor TTCELLVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCELLVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCELLVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCELLVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCELLVisualizationFunctionalityRemoted.TTCELLVisualizationSOAPFunctionality: ITTCELLVisualizationSOAPFunctionality;
begin
if (FTTCELLVisualizationSOAPFunctionality = nil)
  then FTTCELLVisualizationSOAPFunctionality:=GetITTCELLVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCELLVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTCELLVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TCELLVisualizationFunctionality}
Constructor TCELLVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCELLVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCELLVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCELLVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCELLVisualizationFunctionalityRemoted.TCELLVisualizationSOAPFunctionality: ITCELLVisualizationSOAPFunctionality;
begin
if (FTCELLVisualizationSOAPFunctionality = nil)
  then FTCELLVisualizationSOAPFunctionality:=GetITCELLVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCELLVisualizationSOAPFunctionality;
end;
{$ELSE}
function TCELLVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TCELLVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCELLVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TCELLVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TCELLVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCELLVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCELLVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TCELLVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCELLVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCELLVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TCELLVisualizationFunctionalityRemoted.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
{$IFNDEF EmbeddedServer}
TCELLVisualizationSOAPFunctionality.GetCoordinates(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
{$ELSE}
TCELLVisualizationFunctionality_GetCoordinates(ServerFunctionality(),   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
{$ENDIF}
end;

procedure TCELLVisualizationFunctionalityRemoted.Change(const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer);
begin
{$IFNDEF EmbeddedServer}
TCELLVisualizationSOAPFunctionality.Change(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows);
{$ELSE}
TCELLVisualizationFunctionality_Change(ServerFunctionality(),   Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows);
{$ENDIF}
end;

function TCELLVisualizationFunctionalityRemoted.GetFormatNodes(out NodesList: TByteArray; out SizeX,SizeY: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCELLVisualizationSOAPFunctionality.GetFormatNodes(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NodesList,SizeX,SizeY);
{$ELSE}
Result:=TCELLVisualizationFunctionality_GetFormatNodes(ServerFunctionality(),   NodesList,SizeX,SizeY);
{$ENDIF}
end;

procedure TCELLVisualizationFunctionalityRemoted.DoQuad;
begin
{$IFNDEF EmbeddedServer}
TCELLVisualizationSOAPFunctionality.DoQuad(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TCELLVisualizationFunctionality_DoQuad(ServerFunctionality());
{$ENDIF}
end;

procedure TCELLVisualizationFunctionalityRemoted.GetInsideObjectsList(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TCELLVisualizationSOAPFunctionality.GetInsideObjectsList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   FindTypeID,flBuiltInType,List);
{$ELSE}
TCELLVisualizationFunctionality_GetInsideObjectsList(ServerFunctionality(),   FindTypeID,flBuiltInType,List);
{$ENDIF}
end;

function TCELLVisualizationFunctionalityRemoted.getColCount: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TCELLVisualizationSOAPFunctionality.getColCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCELLVisualizationFunctionality_getColCount(ServerFunctionality());
{$ENDIF}
end;

procedure TCELLVisualizationFunctionalityRemoted.setColCount(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TCELLVisualizationSOAPFunctionality.setColCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCELLVisualizationFunctionality_setColCount(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TCELLVisualizationFunctionalityRemoted.getRowCount: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TCELLVisualizationSOAPFunctionality.getRowCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCELLVisualizationFunctionality_getRowCount(ServerFunctionality());
{$ENDIF}
end;

procedure TCELLVisualizationFunctionalityRemoted.setRowCount(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TCELLVisualizationSOAPFunctionality.setRowCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCELLVisualizationFunctionality_setRowCount(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TCELLVisualizationFunctionalityRemoted.getLineWidth: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TCELLVisualizationSOAPFunctionality.getLineWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCELLVisualizationFunctionality_getLineWidth(ServerFunctionality());
{$ENDIF}
end;

procedure TCELLVisualizationFunctionalityRemoted.setLineWidth(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TCELLVisualizationSOAPFunctionality.setLineWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCELLVisualizationFunctionality_setLineWidth(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TCELLVisualizationFunctionalityRemoted.getColSize: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TCELLVisualizationSOAPFunctionality.getColSize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCELLVisualizationFunctionality_getColSize(ServerFunctionality());
{$ENDIF}
end;

function TCELLVisualizationFunctionalityRemoted.getRowSize: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TCELLVisualizationSOAPFunctionality.getRowSize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCELLVisualizationFunctionality_getRowSize(ServerFunctionality());
{$ENDIF}
end;

procedure TCELLVisualizationFunctionalityRemoted.GetParams(out oColCount: integer; out oRowCount: integer; out oLineWidth: Double);
begin
{$IFNDEF EmbeddedServer}
TCELLVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oColCount,oRowCount,oLineWidth);
{$ELSE}
TCELLVisualizationFunctionality_GetParams(ServerFunctionality(),   oColCount,oRowCount,oLineWidth);
{$ENDIF}
end;


{TTEllipseVisualizationFunctionality}
Constructor TTEllipseVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTEllipseVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTEllipseVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTEllipseVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTEllipseVisualizationFunctionalityRemoted.TTEllipseVisualizationSOAPFunctionality: ITTEllipseVisualizationSOAPFunctionality;
begin
if (FTTEllipseVisualizationSOAPFunctionality = nil)
  then FTTEllipseVisualizationSOAPFunctionality:=GetITTEllipseVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTEllipseVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTEllipseVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TEllipseVisualizationFunctionality}
Constructor TEllipseVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTEllipseVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TEllipseVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTEllipseVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TEllipseVisualizationFunctionalityRemoted.TEllipseVisualizationSOAPFunctionality: ITEllipseVisualizationSOAPFunctionality;
begin
if (FTEllipseVisualizationSOAPFunctionality = nil)
  then FTEllipseVisualizationSOAPFunctionality:=GetITEllipseVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTEllipseVisualizationSOAPFunctionality;
end;
{$ELSE}
function TEllipseVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TEllipseVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TEllipseVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TEllipseVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TEllipseVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TEllipseVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TEllipseVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TEllipseVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TEllipseVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TEllipseVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TEllipseVisualizationFunctionalityRemoted.getColor: TColor;
begin
{$IFNDEF EmbeddedServer}
Result:=TEllipseVisualizationSOAPFunctionality.getColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TEllipseVisualizationFunctionality_getColor(ServerFunctionality());
{$ENDIF}
end;

procedure TEllipseVisualizationFunctionalityRemoted.setColor(Value: TColor);
begin
{$IFNDEF EmbeddedServer}
TEllipseVisualizationSOAPFunctionality.setColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TEllipseVisualizationFunctionality_setColor(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TEllipseVisualizationFunctionalityRemoted.getBorderColor: TColor;
begin
{$IFNDEF EmbeddedServer}
Result:=TEllipseVisualizationSOAPFunctionality.getBorderColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TEllipseVisualizationFunctionality_getBorderColor(ServerFunctionality());
{$ENDIF}
end;

procedure TEllipseVisualizationFunctionalityRemoted.setBorderColor(Value: TColor);
begin
{$IFNDEF EmbeddedServer}
TEllipseVisualizationSOAPFunctionality.setBorderColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TEllipseVisualizationFunctionality_setBorderColor(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TEllipseVisualizationFunctionalityRemoted.getBorderWidth: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TEllipseVisualizationSOAPFunctionality.getBorderWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TEllipseVisualizationFunctionality_getBorderWidth(ServerFunctionality());
{$ENDIF}
end;

procedure TEllipseVisualizationFunctionalityRemoted.setBorderWidth(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TEllipseVisualizationSOAPFunctionality.setBorderWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TEllipseVisualizationFunctionality_setBorderWidth(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTWMFVisualizationFunctionality}
Constructor TTWMFVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTWMFVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTWMFVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTWMFVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTWMFVisualizationFunctionalityRemoted.TTWMFVisualizationSOAPFunctionality: ITTWMFVisualizationSOAPFunctionality;
begin
if (FTTWMFVisualizationSOAPFunctionality = nil)
  then FTTWMFVisualizationSOAPFunctionality:=GetITTWMFVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTWMFVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTWMFVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TWMFVisualizationFunctionality}
Constructor TWMFVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTWMFVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TWMFVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTWMFVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TWMFVisualizationFunctionalityRemoted.TWMFVisualizationSOAPFunctionality: ITWMFVisualizationSOAPFunctionality;
begin
if (FTWMFVisualizationSOAPFunctionality = nil)
  then FTWMFVisualizationSOAPFunctionality:=GetITWMFVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTWMFVisualizationSOAPFunctionality;
end;
{$ELSE}
function TWMFVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TWMFVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TWMFVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TWMFVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TWMFVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TWMFVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TWMFVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TWMFVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TWMFVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TWMFVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TWMFVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TWMFVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TWMFVisualizationFunctionality_GetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TWMFVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
TWMFVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
{$ELSE}
TWMFVisualizationFunctionality_GetDATA1(ServerFunctionality(),   DATAStream,DATAType,MaxSize);
{$ENDIF}
end;

procedure TWMFVisualizationFunctionalityRemoted.GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
TWMFVisualizationSOAPFunctionality.GetJPEGDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,pWidth,pHeight,pQuality,MaxSize);
{$ELSE}
TWMFVisualizationFunctionality_GetJPEGDATA(ServerFunctionality(),   DATAStream,pWidth,pHeight,pQuality,MaxSize);
{$ENDIF}
end;

procedure TWMFVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
{$IFNDEF EmbeddedServer}
TWMFVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TWMFVisualizationFunctionality_SetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

function TWMFVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TWMFVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TWMFVisualizationFunctionality_getDATAFileID(ServerFunctionality());
{$ENDIF}
end;

procedure TWMFVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TWMFVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TWMFVisualizationFunctionality_setDATAFileID(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TWMFVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
{$IFNDEF EmbeddedServer}
TWMFVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TWMFVisualizationFunctionality_DATAFile_Clear(ServerFunctionality());
{$ENDIF}
end;

procedure TWMFVisualizationFunctionalityRemoted.SetProportion;
begin
{$IFNDEF EmbeddedServer}
TWMFVisualizationSOAPFunctionality.SetProportion(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TWMFVisualizationFunctionality_SetProportion(ServerFunctionality());
{$ENDIF}
end;


{TTPictureVisualizationFunctionality}
Constructor TTPictureVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTPictureVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTPictureVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTPictureVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTPictureVisualizationFunctionalityRemoted.TTPictureVisualizationSOAPFunctionality: ITTPictureVisualizationSOAPFunctionality;
begin
if (FTTPictureVisualizationSOAPFunctionality = nil)
  then FTTPictureVisualizationSOAPFunctionality:=GetITTPictureVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTPictureVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTPictureVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TPictureVisualizationFunctionality}
Constructor TPictureVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTPictureVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TPictureVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTPictureVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TPictureVisualizationFunctionalityRemoted.TPictureVisualizationSOAPFunctionality: ITPictureVisualizationSOAPFunctionality;
begin
if (FTPictureVisualizationSOAPFunctionality = nil)
  then FTPictureVisualizationSOAPFunctionality:=GetITPictureVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTPictureVisualizationSOAPFunctionality;
end;
{$ELSE}
function TPictureVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TPictureVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TPictureVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TPictureVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TPictureVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TPictureVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TPictureVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TPictureVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TPictureVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TPictureVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TPictureVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TPictureVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TPictureVisualizationFunctionality_GetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TPictureVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
TPictureVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
{$ELSE}
TPictureVisualizationFunctionality_GetDATA1(ServerFunctionality(),   DATAStream,DATAType,MaxSize);
{$ENDIF}
end;

procedure TPictureVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
{$IFNDEF EmbeddedServer}
TPictureVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TPictureVisualizationFunctionality_SetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TPictureVisualizationFunctionalityRemoted.GetBMP(out BMP: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TPictureVisualizationSOAPFunctionality.GetBMP(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   BMP);
{$ELSE}
TPictureVisualizationFunctionality_GetBMP(ServerFunctionality(),   BMP);
{$ENDIF}
end;

procedure TPictureVisualizationFunctionalityRemoted.SetProportion;
begin
{$IFNDEF EmbeddedServer}
TPictureVisualizationSOAPFunctionality.SetProportion(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TPictureVisualizationFunctionality_SetProportion(ServerFunctionality());
{$ENDIF}
end;

function TPictureVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TPictureVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TPictureVisualizationFunctionality_getDATAFileID(ServerFunctionality());
{$ENDIF}
end;

procedure TPictureVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TPictureVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TPictureVisualizationFunctionality_setDATAFileID(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TPictureVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
{$IFNDEF EmbeddedServer}
TPictureVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TPictureVisualizationFunctionality_DATAFile_Clear(ServerFunctionality());
{$ENDIF}
end;

procedure TPictureVisualizationFunctionalityRemoted.GetParams(out VisibleMinScale: double; out VisibleMaxScale: double);
begin
{$IFNDEF EmbeddedServer}
TPictureVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   VisibleMinScale,VisibleMaxScale);
{$ELSE}
TPictureVisualizationFunctionality_GetParams(ServerFunctionality(),   VisibleMinScale,VisibleMaxScale);
{$ENDIF}
end;

procedure TPictureVisualizationFunctionalityRemoted.SetParams(const VisibleMinScale: double; const VisibleMaxScale: double);
begin
{$IFNDEF EmbeddedServer}
TPictureVisualizationSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   VisibleMinScale,VisibleMaxScale);
{$ELSE}
TPictureVisualizationFunctionality_SetParams(ServerFunctionality(),   VisibleMinScale,VisibleMaxScale);
{$ENDIF}
end;


{TTRoundVisualizationFunctionality}
Constructor TTRoundVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTRoundVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTRoundVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTRoundVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTRoundVisualizationFunctionalityRemoted.TTRoundVisualizationSOAPFunctionality: ITTRoundVisualizationSOAPFunctionality;
begin
if (FTTRoundVisualizationSOAPFunctionality = nil)
  then FTTRoundVisualizationSOAPFunctionality:=GetITTRoundVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTRoundVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTRoundVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TRoundVisualizationFunctionality}
Constructor TRoundVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTRoundVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TRoundVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTRoundVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TRoundVisualizationFunctionalityRemoted.TRoundVisualizationSOAPFunctionality: ITRoundVisualizationSOAPFunctionality;
begin
if (FTRoundVisualizationSOAPFunctionality = nil)
  then FTRoundVisualizationSOAPFunctionality:=GetITRoundVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTRoundVisualizationSOAPFunctionality;
end;
{$ELSE}
function TRoundVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TRoundVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TRoundVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TRoundVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TRoundVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TRoundVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TRoundVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TRoundVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TRoundVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TRoundVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TRoundVisualizationFunctionalityRemoted.getColor: TColor;
begin
{$IFNDEF EmbeddedServer}
Result:=TRoundVisualizationSOAPFunctionality.getColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TRoundVisualizationFunctionality_getColor(ServerFunctionality());
{$ENDIF}
end;

procedure TRoundVisualizationFunctionalityRemoted.setColor(Value: TColor);
begin
{$IFNDEF EmbeddedServer}
TRoundVisualizationSOAPFunctionality.setColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TRoundVisualizationFunctionality_setColor(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TRoundVisualizationFunctionalityRemoted.getBorderColor: TColor;
begin
{$IFNDEF EmbeddedServer}
Result:=TRoundVisualizationSOAPFunctionality.getBorderColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TRoundVisualizationFunctionality_getBorderColor(ServerFunctionality());
{$ENDIF}
end;

procedure TRoundVisualizationFunctionalityRemoted.setBorderColor(Value: TColor);
begin
{$IFNDEF EmbeddedServer}
TRoundVisualizationSOAPFunctionality.setBorderColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TRoundVisualizationFunctionality_setBorderColor(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TRoundVisualizationFunctionalityRemoted.getBorderWidth: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TRoundVisualizationSOAPFunctionality.getBorderWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TRoundVisualizationFunctionality_getBorderWidth(ServerFunctionality());
{$ENDIF}
end;

procedure TRoundVisualizationFunctionalityRemoted.setBorderWidth(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TRoundVisualizationSOAPFunctionality.setBorderWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TRoundVisualizationFunctionality_setBorderWidth(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTGeodesyPointFunctionality}
Constructor TTGeodesyPointFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTGeodesyPointSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTGeodesyPointFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTGeodesyPointSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTGeodesyPointFunctionalityRemoted.TTGeodesyPointSOAPFunctionality: ITTGeodesyPointSOAPFunctionality;
begin
if (FTTGeodesyPointSOAPFunctionality = nil)
  then FTTGeodesyPointSOAPFunctionality:=GetITTGeodesyPointSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTGeodesyPointSOAPFunctionality;
end;
{$ELSE}
function TTGeodesyPointFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTGeodesyPointFunctionalityRemoted.ConvertSpaceCRDToGeoCRD(const X,Y: Double; out Latitude,Longitude: Double): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTGeodesyPointSOAPFunctionality.ConvertSpaceCRDToGeoCRD(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   X,Y,Latitude,Longitude);
{$ELSE}
Result:=TTGeodesyPointFunctionality_ConvertSpaceCRDToGeoCRD(ServerFunctionality(),   X,Y,Latitude,Longitude);
{$ENDIF}
end;

function TTGeodesyPointFunctionalityRemoted.ConvertGeoCRDToSpaceCRD(const Latitude,Longitude: Double; out X,Y: Double): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTGeodesyPointSOAPFunctionality.ConvertGeoCRDToSpaceCRD(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Latitude,Longitude,X,Y);
{$ELSE}
Result:=TTGeodesyPointFunctionality_ConvertGeoCRDToSpaceCRD(ServerFunctionality(),   Latitude,Longitude,X,Y);
{$ENDIF}
end;

procedure TTGeodesyPointFunctionalityRemoted.GetNearestCrdSys(const pLatitude,pLongitude: double; out idCrdSys: integer);
begin
{$IFNDEF EmbeddedServer}
TTGeodesyPointSOAPFunctionality.GetNearestCrdSys(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pLatitude,pLongitude,idCrdSys);
{$ELSE}
TTGeodesyPointFunctionality_GetNearestCrdSys(ServerFunctionality(),   pLatitude,pLongitude,idCrdSys);
{$ENDIF}
end;

procedure TTGeodesyPointFunctionalityRemoted.GetInstanceListByCrdSys(const idCrdSys: integer; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTGeodesyPointSOAPFunctionality.GetInstanceListByCrdSys(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   idCrdSys,List);
{$ELSE}
TTGeodesyPointFunctionality_GetInstanceListByCrdSys(ServerFunctionality(),   idCrdSys,List);
{$ENDIF}
end;

function TTGeodesyPointFunctionalityRemoted.CrdSys_GetNearestGeoPoints(const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTGeodesyPointSOAPFunctionality.CrdSys_GetNearestGeoPoints(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   idCrdSys,pLatitude,pLongitude,PointsCount,Points);
{$ELSE}
Result:=TTGeodesyPointFunctionality_CrdSys_GetNearestGeoPoints(ServerFunctionality(),   idCrdSys,pLatitude,pLongitude,PointsCount,Points);
{$ENDIF}
end;

function TTGeodesyPointFunctionalityRemoted.CrdSys_GetNearestXYPoints(const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTGeodesyPointSOAPFunctionality.CrdSys_GetNearestXYPoints(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   idCrdSys,pX,pY,PointsCount,Points);
{$ELSE}
Result:=TTGeodesyPointFunctionality_CrdSys_GetNearestXYPoints(ServerFunctionality(),   idCrdSys,pX,pY,PointsCount,Points);
{$ENDIF}
end;


{TGeodesyPointFunctionality}
Constructor TGeodesyPointFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTGeodesyPointSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TGeodesyPointFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTGeodesyPointSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TGeodesyPointFunctionalityRemoted.TGeodesyPointSOAPFunctionality: ITGeodesyPointSOAPFunctionality;
begin
if (FTGeodesyPointSOAPFunctionality = nil)
  then FTGeodesyPointSOAPFunctionality:=GetITGeodesyPointSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTGeodesyPointSOAPFunctionality;
end;
{$ELSE}
function TGeodesyPointFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TGeodesyPointFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeodesyPointSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeodesyPointFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TGeodesyPointFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeodesyPointSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeodesyPointFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TGeodesyPointFunctionalityRemoted.getidCrdSys: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeodesyPointSOAPFunctionality.getidCrdSys(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeodesyPointFunctionality_getidCrdSys(ServerFunctionality());
{$ENDIF}
end;

procedure TGeodesyPointFunctionalityRemoted.setidCrdSys(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TGeodesyPointSOAPFunctionality.setidCrdSys(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeodesyPointFunctionality_setidCrdSys(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeodesyPointFunctionalityRemoted.getX: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeodesyPointSOAPFunctionality.getX(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeodesyPointFunctionality_getX(ServerFunctionality());
{$ENDIF}
end;

procedure TGeodesyPointFunctionalityRemoted.setX(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TGeodesyPointSOAPFunctionality.setX(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeodesyPointFunctionality_setX(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeodesyPointFunctionalityRemoted.getY: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeodesyPointSOAPFunctionality.getY(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeodesyPointFunctionality_getY(ServerFunctionality());
{$ENDIF}
end;

procedure TGeodesyPointFunctionalityRemoted.setY(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TGeodesyPointSOAPFunctionality.setY(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeodesyPointFunctionality_setY(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeodesyPointFunctionalityRemoted.getLatitude: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeodesyPointSOAPFunctionality.getLatitude(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeodesyPointFunctionality_getLatitude(ServerFunctionality());
{$ENDIF}
end;

procedure TGeodesyPointFunctionalityRemoted.setLatitude(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TGeodesyPointSOAPFunctionality.setLatitude(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeodesyPointFunctionality_setLatitude(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGeodesyPointFunctionalityRemoted.getLongitude: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TGeodesyPointSOAPFunctionality.getLongitude(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGeodesyPointFunctionality_getLongitude(ServerFunctionality());
{$ENDIF}
end;

procedure TGeodesyPointFunctionalityRemoted.setLongitude(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TGeodesyPointSOAPFunctionality.setLongitude(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGeodesyPointFunctionality_setLongitude(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TGeodesyPointFunctionalityRemoted.GetParams(out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double);
begin
{$IFNDEF EmbeddedServer}
TGeodesyPointSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oidCrdSys,oX,oY,oLatitude,oLongitude);
{$ELSE}
TGeodesyPointFunctionality_GetParams(ServerFunctionality(),   oidCrdSys,oX,oY,oLatitude,oLongitude);
{$ENDIF}
end;

procedure TGeodesyPointFunctionalityRemoted.SetParams(const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double);
begin
{$IFNDEF EmbeddedServer}
TGeodesyPointSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pidCrdSys,pX,pY,pLatitude,pLongitude);
{$ELSE}
TGeodesyPointFunctionality_SetParams(ServerFunctionality(),   pidCrdSys,pX,pY,pLatitude,pLongitude);
{$ENDIF}
end;

procedure TGeodesyPointFunctionalityRemoted.ValidateByVisualizationComponent;
begin
{$IFNDEF EmbeddedServer}
TGeodesyPointSOAPFunctionality.ValidateByVisualizationComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TGeodesyPointFunctionality_ValidateByVisualizationComponent(ServerFunctionality());
{$ENDIF}
end;


{TTPrivateAreaVisualizationFunctionality}
Constructor TTPrivateAreaVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTPrivateAreaVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTPrivateAreaVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTPrivateAreaVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTPrivateAreaVisualizationFunctionalityRemoted.TTPrivateAreaVisualizationSOAPFunctionality: ITTPrivateAreaVisualizationSOAPFunctionality;
begin
if (FTTPrivateAreaVisualizationSOAPFunctionality = nil)
  then FTTPrivateAreaVisualizationSOAPFunctionality:=GetITTPrivateAreaVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTPrivateAreaVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTPrivateAreaVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTPrivateAreaVisualizationFunctionalityRemoted.CanCreateAsDetail: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTPrivateAreaVisualizationSOAPFunctionality.CanCreateAsDetail(TypeFunctionality.UserName,TypeFunctionality.UserPassword);
{$ELSE}
Result:=TTPrivateAreaVisualizationFunctionality_CanCreateAsDetail(ServerFunctionality());
{$ENDIF}
end;


{TPrivateAreaVisualizationFunctionality}
Constructor TPrivateAreaVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTPrivateAreaVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TPrivateAreaVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTPrivateAreaVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TPrivateAreaVisualizationFunctionalityRemoted.TPrivateAreaVisualizationSOAPFunctionality: ITPrivateAreaVisualizationSOAPFunctionality;
begin
if (FTPrivateAreaVisualizationSOAPFunctionality = nil)
  then FTPrivateAreaVisualizationSOAPFunctionality:=GetITPrivateAreaVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTPrivateAreaVisualizationSOAPFunctionality;
end;
{$ELSE}
function TPrivateAreaVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TPrivateAreaVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TPrivateAreaVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TPrivateAreaVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TPrivateAreaVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TPrivateAreaVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TPrivateAreaVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TPrivateAreaVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TPrivateAreaVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TPrivateAreaVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TPrivateAreaVisualizationFunctionalityRemoted.getAcquireObjectsInside: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TPrivateAreaVisualizationSOAPFunctionality.getAcquireObjectsInside(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TPrivateAreaVisualizationFunctionality_getAcquireObjectsInside(ServerFunctionality());
{$ENDIF}
end;

procedure TPrivateAreaVisualizationFunctionalityRemoted.setAcquireObjectsInside(Value: boolean);
begin
{$IFNDEF EmbeddedServer}
TPrivateAreaVisualizationSOAPFunctionality.setAcquireObjectsInside(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TPrivateAreaVisualizationFunctionality_setAcquireObjectsInside(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTHyperTextFunctionality}
Constructor TTHyperTextFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTHyperTextSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTHyperTextFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTHyperTextSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTHyperTextFunctionalityRemoted.TTHyperTextSOAPFunctionality: ITTHyperTextSOAPFunctionality;
begin
if (FTTHyperTextSOAPFunctionality = nil)
  then FTTHyperTextSOAPFunctionality:=GetITTHyperTextSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHyperTextSOAPFunctionality;
end;
{$ELSE}
function TTHyperTextFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{THyperTextFunctionality}
Constructor THyperTextFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTHyperTextSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor THyperTextFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTHyperTextSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function THyperTextFunctionalityRemoted.THyperTextSOAPFunctionality: ITHyperTextSOAPFunctionality;
begin
if (FTHyperTextSOAPFunctionality = nil)
  then FTHyperTextSOAPFunctionality:=GetITHyperTextSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHyperTextSOAPFunctionality;
end;
{$ELSE}
function THyperTextFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function THyperTextFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THyperTextSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THyperTextFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function THyperTextFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THyperTextSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THyperTextFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure THyperTextFunctionalityRemoted.GetDATA(out Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
THyperTextSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
THyperTextFunctionality_GetDATA(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure THyperTextFunctionalityRemoted.SetDATA(Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
THyperTextSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
THyperTextFunctionality_SetDATA(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTComponentsFindServiceFunctionality}
Constructor TTComponentsFindServiceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTComponentsFindServiceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTComponentsFindServiceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTComponentsFindServiceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTComponentsFindServiceFunctionalityRemoted.TTComponentsFindServiceSOAPFunctionality: ITTComponentsFindServiceSOAPFunctionality;
begin
if (FTTComponentsFindServiceSOAPFunctionality = nil)
  then FTTComponentsFindServiceSOAPFunctionality:=GetITTComponentsFindServiceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTComponentsFindServiceSOAPFunctionality;
end;
{$ELSE}
function TTComponentsFindServiceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TComponentsFindServiceFunctionality}
Constructor TComponentsFindServiceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTComponentsFindServiceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TComponentsFindServiceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTComponentsFindServiceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TComponentsFindServiceFunctionalityRemoted.TComponentsFindServiceSOAPFunctionality: ITComponentsFindServiceSOAPFunctionality;
begin
if (FTComponentsFindServiceSOAPFunctionality = nil)
  then FTComponentsFindServiceSOAPFunctionality:=GetITComponentsFindServiceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTComponentsFindServiceSOAPFunctionality;
end;
{$ELSE}
function TComponentsFindServiceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TComponentsFindServiceFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentsFindServiceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentsFindServiceFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TComponentsFindServiceFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentsFindServiceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentsFindServiceFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTUsersServiceFunctionality}
Constructor TTUsersServiceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTUsersServiceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTUsersServiceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTUsersServiceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTUsersServiceFunctionalityRemoted.TTUsersServiceSOAPFunctionality: ITTUsersServiceSOAPFunctionality;
begin
if (FTTUsersServiceSOAPFunctionality = nil)
  then FTTUsersServiceSOAPFunctionality:=GetITTUsersServiceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTUsersServiceSOAPFunctionality;
end;
{$ELSE}
function TTUsersServiceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TUsersServiceFunctionality}
Constructor TUsersServiceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTUsersServiceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TUsersServiceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTUsersServiceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TUsersServiceFunctionalityRemoted.TUsersServiceSOAPFunctionality: ITUsersServiceSOAPFunctionality;
begin
if (FTUsersServiceSOAPFunctionality = nil)
  then FTUsersServiceSOAPFunctionality:=GetITUsersServiceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTUsersServiceSOAPFunctionality;
end;
{$ELSE}
function TUsersServiceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TUsersServiceFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TUsersServiceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TUsersServiceFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TUsersServiceFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TUsersServiceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TUsersServiceFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTTransportServiceFunctionality}
Constructor TTTransportServiceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTTransportServiceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTTransportServiceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTTransportServiceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTTransportServiceFunctionalityRemoted.TTTransportServiceSOAPFunctionality: ITTTransportServiceSOAPFunctionality;
begin
if (FTTTransportServiceSOAPFunctionality = nil)
  then FTTTransportServiceSOAPFunctionality:=GetITTTransportServiceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTransportServiceSOAPFunctionality;
end;
{$ELSE}
function TTTransportServiceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TTransportServiceFunctionality}
Constructor TTransportServiceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTTransportServiceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTransportServiceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTransportServiceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTransportServiceFunctionalityRemoted.TTransportServiceSOAPFunctionality: ITTransportServiceSOAPFunctionality;
begin
if (FTTransportServiceSOAPFunctionality = nil)
  then FTTransportServiceSOAPFunctionality:=GetITTransportServiceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTransportServiceSOAPFunctionality;
end;
{$ELSE}
function TTransportServiceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTransportServiceFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportServiceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTransportServiceFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TTransportServiceFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportServiceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTransportServiceFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTMarketServiceFunctionality}
Constructor TTMarketServiceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTMarketServiceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTMarketServiceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTMarketServiceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTMarketServiceFunctionalityRemoted.TTMarketServiceSOAPFunctionality: ITTMarketServiceSOAPFunctionality;
begin
if (FTTMarketServiceSOAPFunctionality = nil)
  then FTTMarketServiceSOAPFunctionality:=GetITTMarketServiceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMarketServiceSOAPFunctionality;
end;
{$ELSE}
function TTMarketServiceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TMarketServiceFunctionality}
Constructor TMarketServiceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTMarketServiceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TMarketServiceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTMarketServiceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TMarketServiceFunctionalityRemoted.TMarketServiceSOAPFunctionality: ITMarketServiceSOAPFunctionality;
begin
if (FTMarketServiceSOAPFunctionality = nil)
  then FTMarketServiceSOAPFunctionality:=GetITMarketServiceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMarketServiceSOAPFunctionality;
end;
{$ELSE}
function TMarketServiceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TMarketServiceFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMarketServiceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMarketServiceFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TMarketServiceFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMarketServiceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMarketServiceFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTTelecomServiceFunctionality}
Constructor TTTelecomServiceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTTelecomServiceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTTelecomServiceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTTelecomServiceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTTelecomServiceFunctionalityRemoted.TTTelecomServiceSOAPFunctionality: ITTTelecomServiceSOAPFunctionality;
begin
if (FTTTelecomServiceSOAPFunctionality = nil)
  then FTTTelecomServiceSOAPFunctionality:=GetITTTelecomServiceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTelecomServiceSOAPFunctionality;
end;
{$ELSE}
function TTTelecomServiceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TTelecomServiceFunctionality}
Constructor TTelecomServiceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTTelecomServiceSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTelecomServiceFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTelecomServiceSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTelecomServiceFunctionalityRemoted.TTelecomServiceSOAPFunctionality: ITTelecomServiceSOAPFunctionality;
begin
if (FTTelecomServiceSOAPFunctionality = nil)
  then FTTelecomServiceSOAPFunctionality:=GetITTelecomServiceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTelecomServiceSOAPFunctionality;
end;
{$ELSE}
function TTelecomServiceFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTelecomServiceFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTelecomServiceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTelecomServiceFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TTelecomServiceFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTelecomServiceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTelecomServiceFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTWNDVisualizationFunctionality}
Constructor TTWNDVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTWNDVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTWNDVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTWNDVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTWNDVisualizationFunctionalityRemoted.TTWNDVisualizationSOAPFunctionality: ITTWNDVisualizationSOAPFunctionality;
begin
if (FTTWNDVisualizationSOAPFunctionality = nil)
  then FTTWNDVisualizationSOAPFunctionality:=GetITTWNDVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTWNDVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTWNDVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TWNDVisualizationFunctionality}
Constructor TWNDVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTWNDVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TWNDVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTWNDVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TWNDVisualizationFunctionalityRemoted.TWNDVisualizationSOAPFunctionality: ITWNDVisualizationSOAPFunctionality;
begin
if (FTWNDVisualizationSOAPFunctionality = nil)
  then FTWNDVisualizationSOAPFunctionality:=GetITWNDVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTWNDVisualizationSOAPFunctionality;
end;
{$ELSE}
function TWNDVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TWNDVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TWNDVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TWNDVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TWNDVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TWNDVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TWNDVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TWNDVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TWNDVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TWNDVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TWNDVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TWNDVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TWNDVisualizationFunctionality_GetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TWNDVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
TWNDVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
{$ELSE}
TWNDVisualizationFunctionality_GetDATA1(ServerFunctionality(),   DATAStream,DATAType,MaxSize);
{$ENDIF}
end;

procedure TWNDVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
{$IFNDEF EmbeddedServer}
TWNDVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TWNDVisualizationFunctionality_SetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

function TWNDVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TWNDVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TWNDVisualizationFunctionality_getDATAFileID(ServerFunctionality());
{$ENDIF}
end;

procedure TWNDVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TWNDVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TWNDVisualizationFunctionality_setDATAFileID(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TWNDVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
{$IFNDEF EmbeddedServer}
TWNDVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TWNDVisualizationFunctionality_DATAFile_Clear(ServerFunctionality());
{$ENDIF}
end;


{TTMRKVisualizationFunctionality}
Constructor TTMRKVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTMRKVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTMRKVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTMRKVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTMRKVisualizationFunctionalityRemoted.TTMRKVisualizationSOAPFunctionality: ITTMRKVisualizationSOAPFunctionality;
begin
if (FTTMRKVisualizationSOAPFunctionality = nil)
  then FTTMRKVisualizationSOAPFunctionality:=GetITTMRKVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMRKVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTMRKVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TMRKVisualizationFunctionality}
Constructor TMRKVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTMRKVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TMRKVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTMRKVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TMRKVisualizationFunctionalityRemoted.TMRKVisualizationSOAPFunctionality: ITMRKVisualizationSOAPFunctionality;
begin
if (FTMRKVisualizationSOAPFunctionality = nil)
  then FTMRKVisualizationSOAPFunctionality:=GetITMRKVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMRKVisualizationSOAPFunctionality;
end;
{$ELSE}
function TMRKVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TMRKVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMRKVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TMRKVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TMRKVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMRKVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMRKVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TMRKVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMRKVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMRKVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TMRKVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TMRKVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TMRKVisualizationFunctionality_GetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TMRKVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
TMRKVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
{$ELSE}
TMRKVisualizationFunctionality_GetDATA1(ServerFunctionality(),   DATAStream,DATAType,MaxSize);
{$ENDIF}
end;

procedure TMRKVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
{$IFNDEF EmbeddedServer}
TMRKVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TMRKVisualizationFunctionality_SetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

function TMRKVisualizationFunctionalityRemoted.getBindingPointIndex: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMRKVisualizationSOAPFunctionality.getBindingPointIndex(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMRKVisualizationFunctionality_getBindingPointIndex(ServerFunctionality());
{$ENDIF}
end;

procedure TMRKVisualizationFunctionalityRemoted.setBindingPointIndex(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMRKVisualizationSOAPFunctionality.setBindingPointIndex(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMRKVisualizationFunctionality_setBindingPointIndex(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMRKVisualizationFunctionalityRemoted.getAlign1: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMRKVisualizationSOAPFunctionality.getAlign1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMRKVisualizationFunctionality_getAlign1(ServerFunctionality());
{$ENDIF}
end;

procedure TMRKVisualizationFunctionalityRemoted.setAlign1(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMRKVisualizationSOAPFunctionality.setAlign1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMRKVisualizationFunctionality_setAlign1(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMRKVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMRKVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMRKVisualizationFunctionality_getDATAFileID(ServerFunctionality());
{$ENDIF}
end;

procedure TMRKVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMRKVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMRKVisualizationFunctionality_setDATAFileID(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TMRKVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
{$IFNDEF EmbeddedServer}
TMRKVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TMRKVisualizationFunctionality_DATAFile_Clear(ServerFunctionality());
{$ENDIF}
end;

procedure TMRKVisualizationFunctionalityRemoted.GetParams(out oAlign: integer; out oBindingPointIndex: integer);
begin
{$IFNDEF EmbeddedServer}
TMRKVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oAlign,oBindingPointIndex);
{$ELSE}
TMRKVisualizationFunctionality_GetParams(ServerFunctionality(),   oAlign,oBindingPointIndex);
{$ENDIF}
end;


{TTOrientedPictureVisualizationFunctionality}
Constructor TTOrientedPictureVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTOrientedPictureVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTOrientedPictureVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTOrientedPictureVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTOrientedPictureVisualizationFunctionalityRemoted.TTOrientedPictureVisualizationSOAPFunctionality: ITTOrientedPictureVisualizationSOAPFunctionality;
begin
if (FTTOrientedPictureVisualizationSOAPFunctionality = nil)
  then FTTOrientedPictureVisualizationSOAPFunctionality:=GetITTOrientedPictureVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOrientedPictureVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTOrientedPictureVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TOrientedPictureVisualizationFunctionality}
Constructor TOrientedPictureVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTOrientedPictureVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TOrientedPictureVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTOrientedPictureVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TOrientedPictureVisualizationFunctionalityRemoted.TOrientedPictureVisualizationSOAPFunctionality: ITOrientedPictureVisualizationSOAPFunctionality;
begin
if (FTOrientedPictureVisualizationSOAPFunctionality = nil)
  then FTOrientedPictureVisualizationSOAPFunctionality:=GetITOrientedPictureVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOrientedPictureVisualizationSOAPFunctionality;
end;
{$ELSE}
function TOrientedPictureVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TOrientedPictureVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedPictureVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TOrientedPictureVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TOrientedPictureVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedPictureVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedPictureVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TOrientedPictureVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedPictureVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedPictureVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedPictureVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TOrientedPictureVisualizationFunctionality_GetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedPictureVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
{$ELSE}
TOrientedPictureVisualizationFunctionality_GetDATA1(ServerFunctionality(),   DATAStream,DATAType,MaxSize);
{$ENDIF}
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedPictureVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TOrientedPictureVisualizationFunctionality_SetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

function TOrientedPictureVisualizationFunctionalityRemoted.getWidth: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedPictureVisualizationSOAPFunctionality.getWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedPictureVisualizationFunctionality_getWidth(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.setWidth(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TOrientedPictureVisualizationSOAPFunctionality.setWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedPictureVisualizationFunctionality_setWidth(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOrientedPictureVisualizationFunctionalityRemoted.getHeight: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedPictureVisualizationSOAPFunctionality.getHeight(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedPictureVisualizationFunctionality_getHeight(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.setHeight(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TOrientedPictureVisualizationSOAPFunctionality.setHeight(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedPictureVisualizationFunctionality_setHeight(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOrientedPictureVisualizationFunctionalityRemoted.getOrientation: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedPictureVisualizationSOAPFunctionality.getOrientation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedPictureVisualizationFunctionality_getOrientation(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.setOrientation(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedPictureVisualizationSOAPFunctionality.setOrientation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedPictureVisualizationFunctionality_setOrientation(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.ChangeScale(const ScaleFactor: Double);
begin
{$IFNDEF EmbeddedServer}
TOrientedPictureVisualizationSOAPFunctionality.ChangeScale(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ScaleFactor);
{$ELSE}
TOrientedPictureVisualizationFunctionality_ChangeScale(ServerFunctionality(),   ScaleFactor);
{$ENDIF}
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.UpdateContainer;
begin
{$IFNDEF EmbeddedServer}
TOrientedPictureVisualizationSOAPFunctionality.UpdateContainer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TOrientedPictureVisualizationFunctionality_UpdateContainer(ServerFunctionality());
{$ENDIF}
end;

function TOrientedPictureVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedPictureVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedPictureVisualizationFunctionality_getDATAFileID(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedPictureVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedPictureVisualizationFunctionality_setDATAFileID(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
{$IFNDEF EmbeddedServer}
TOrientedPictureVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TOrientedPictureVisualizationFunctionality_DATAFile_Clear(ServerFunctionality());
{$ENDIF}
end;

function TOrientedPictureVisualizationFunctionalityRemoted.IsNewContainerAcceptable(const NewWidth,NewHeight,NewScale: Double): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedPictureVisualizationSOAPFunctionality.IsNewContainerAcceptable(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewWidth,NewHeight,NewScale);
{$ELSE}
Result:=TOrientedPictureVisualizationFunctionality_IsNewContainerAcceptable(ServerFunctionality(),   NewWidth,NewHeight,NewScale);
{$ENDIF}
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.GetParams(out oWidth: Double; out oHeight: Double; out oOrientation: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedPictureVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oWidth,oHeight,oOrientation);
{$ELSE}
TOrientedPictureVisualizationFunctionality_GetParams(ServerFunctionality(),   oWidth,oHeight,oOrientation);
{$ENDIF}
end;


{TTOrientedTTFVisualizationFunctionality}
Constructor TTOrientedTTFVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTOrientedTTFVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTOrientedTTFVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTOrientedTTFVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTOrientedTTFVisualizationFunctionalityRemoted.TTOrientedTTFVisualizationSOAPFunctionality: ITTOrientedTTFVisualizationSOAPFunctionality;
begin
if (FTTOrientedTTFVisualizationSOAPFunctionality = nil)
  then FTTOrientedTTFVisualizationSOAPFunctionality:=GetITTOrientedTTFVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOrientedTTFVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTOrientedTTFVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TOrientedTTFVisualizationFunctionality}
Constructor TOrientedTTFVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTOrientedTTFVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TOrientedTTFVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTOrientedTTFVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TOrientedTTFVisualizationFunctionalityRemoted.TOrientedTTFVisualizationSOAPFunctionality: ITOrientedTTFVisualizationSOAPFunctionality;
begin
if (FTOrientedTTFVisualizationSOAPFunctionality = nil)
  then FTOrientedTTFVisualizationSOAPFunctionality:=GetITOrientedTTFVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOrientedTTFVisualizationSOAPFunctionality;
end;
{$ELSE}
function TOrientedTTFVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TOrientedTTFVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedTTFVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TOrientedTTFVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedTTFVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedTTFVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedTTFVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedTTFVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getStr: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedTTFVisualizationSOAPFunctionality.getStr(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedTTFVisualizationFunctionality_getStr(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setStr(const Value: string);
begin
{$IFNDEF EmbeddedServer}
TOrientedTTFVisualizationSOAPFunctionality.setStr(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedTTFVisualizationFunctionality_setStr(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getColor: TColor;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedTTFVisualizationSOAPFunctionality.getColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedTTFVisualizationFunctionality_getColor(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setColor(Value: TColor);
begin
{$IFNDEF EmbeddedServer}
TOrientedTTFVisualizationSOAPFunctionality.setColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedTTFVisualizationFunctionality_setColor(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getFont_Name: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedTTFVisualizationSOAPFunctionality.getFont_Name(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedTTFVisualizationFunctionality_getFont_Name(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setFont_Name(Value: string);
begin
{$IFNDEF EmbeddedServer}
TOrientedTTFVisualizationSOAPFunctionality.setFont_Name(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedTTFVisualizationFunctionality_setFont_Name(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getFont_Width: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedTTFVisualizationSOAPFunctionality.getFont_Width(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedTTFVisualizationFunctionality_getFont_Width(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setFont_Width(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TOrientedTTFVisualizationSOAPFunctionality.setFont_Width(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedTTFVisualizationFunctionality_setFont_Width(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getFont_Height: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedTTFVisualizationSOAPFunctionality.getFont_Height(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedTTFVisualizationFunctionality_getFont_Height(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setFont_Height(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TOrientedTTFVisualizationSOAPFunctionality.setFont_Height(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedTTFVisualizationFunctionality_setFont_Height(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getCharInterval: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedTTFVisualizationSOAPFunctionality.getCharInterval(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedTTFVisualizationFunctionality_getCharInterval(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setCharInterval(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TOrientedTTFVisualizationSOAPFunctionality.setCharInterval(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedTTFVisualizationFunctionality_setCharInterval(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getOrientation: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedTTFVisualizationSOAPFunctionality.getOrientation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOrientedTTFVisualizationFunctionality_getOrientation(ServerFunctionality());
{$ENDIF}
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setOrientation(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedTTFVisualizationSOAPFunctionality.setOrientation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOrientedTTFVisualizationFunctionality_setOrientation(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.UpdateContainer;
begin
{$IFNDEF EmbeddedServer}
TOrientedTTFVisualizationSOAPFunctionality.UpdateContainer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TOrientedTTFVisualizationFunctionality_UpdateContainer(ServerFunctionality());
{$ENDIF}
end;

function TOrientedTTFVisualizationFunctionalityRemoted.IsNewContainerAcceptable(const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TOrientedTTFVisualizationSOAPFunctionality.IsNewContainerAcceptable(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewFontWidth,NewFontHeight,NewCharInterval,flNewStr,NewStr);
{$ELSE}
Result:=TOrientedTTFVisualizationFunctionality_IsNewContainerAcceptable(ServerFunctionality(),   NewFontWidth,NewFontHeight,NewCharInterval,flNewStr,NewStr);
{$ENDIF}
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedTTFVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oStr,oFont_Width,oFont_Height,oFont_Name,oCharInterval,oOrientation);
{$ELSE}
TOrientedTTFVisualizationFunctionality_GetParams(ServerFunctionality(),   oStr,oFont_Width,oFont_Height,oFont_Name,oCharInterval,oOrientation);
{$ENDIF}
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer);
begin
{$IFNDEF EmbeddedServer}
TOrientedTTFVisualizationSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pStr,pFont_Width,pFont_Height,pFont_Name,pCharInterval,pOrientation);
{$ELSE}
TOrientedTTFVisualizationFunctionality_SetParams(ServerFunctionality(),   pStr,pFont_Width,pFont_Height,pFont_Name,pCharInterval,pOrientation);
{$ENDIF}
end;


{TTIconFunctionality}
Constructor TTIconFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTIconSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTIconFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTIconSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTIconFunctionalityRemoted.TTIconSOAPFunctionality: ITTIconSOAPFunctionality;
begin
if (FTTIconSOAPFunctionality = nil)
  then FTTIconSOAPFunctionality:=GetITTIconSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTIconSOAPFunctionality;
end;
{$ELSE}
function TTIconFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TIconFunctionality}
Constructor TIconFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTIconSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TIconFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTIconSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TIconFunctionalityRemoted.TIconSOAPFunctionality: ITIconSOAPFunctionality;
begin
if (FTIconSOAPFunctionality = nil)
  then FTIconSOAPFunctionality:=GetITIconSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTIconSOAPFunctionality;
end;
{$ELSE}
function TIconFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TIconFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TIconSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TIconFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TIconFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TIconSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TIconFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TIconFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TIconSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TIconFunctionality_GetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TIconFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TIconSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TIconFunctionality_SetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TIconFunctionalityRemoted.GetBitmapDATA(out BMPDATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TIconSOAPFunctionality.GetBitmapDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   BMPDATAStream);
{$ELSE}
TIconFunctionality_GetBitmapDATA(ServerFunctionality(),   BMPDATAStream);
{$ENDIF}
end;


{TTMessageBoardMessageFunctionality}
Constructor TTMessageBoardMessageFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTMessageBoardMessageSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTMessageBoardMessageFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTMessageBoardMessageSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTMessageBoardMessageFunctionalityRemoted.TTMessageBoardMessageSOAPFunctionality: ITTMessageBoardMessageSOAPFunctionality;
begin
if (FTTMessageBoardMessageSOAPFunctionality = nil)
  then FTTMessageBoardMessageSOAPFunctionality:=GetITTMessageBoardMessageSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMessageBoardMessageSOAPFunctionality;
end;
{$ELSE}
function TTMessageBoardMessageFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TMessageBoardMessageFunctionality}
Constructor TMessageBoardMessageFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTMessageBoardMessageSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TMessageBoardMessageFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTMessageBoardMessageSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TMessageBoardMessageFunctionalityRemoted.TMessageBoardMessageSOAPFunctionality: ITMessageBoardMessageSOAPFunctionality;
begin
if (FTMessageBoardMessageSOAPFunctionality = nil)
  then FTMessageBoardMessageSOAPFunctionality:=GetITMessageBoardMessageSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMessageBoardMessageSOAPFunctionality;
end;
{$ELSE}
function TMessageBoardMessageFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TMessageBoardMessageFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardMessageSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardMessageFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TMessageBoardMessageFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardMessageSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardMessageFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TMessageBoardMessageFunctionalityRemoted.getIdMessageBoard: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardMessageSOAPFunctionality.getIdMessageBoard(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardMessageFunctionality_getIdMessageBoard(ServerFunctionality());
{$ENDIF}
end;

procedure TMessageBoardMessageFunctionalityRemoted.setIdMessageBoard(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMessageBoardMessageSOAPFunctionality.setIdMessageBoard(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMessageBoardMessageFunctionality_setIdMessageBoard(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMessageBoardMessageFunctionalityRemoted.getIdSenderMessageBoard: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardMessageSOAPFunctionality.getIdSenderMessageBoard(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardMessageFunctionality_getIdSenderMessageBoard(ServerFunctionality());
{$ENDIF}
end;

procedure TMessageBoardMessageFunctionalityRemoted.setIdSenderMessageBoard(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMessageBoardMessageSOAPFunctionality.setIdSenderMessageBoard(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMessageBoardMessageFunctionality_setIdSenderMessageBoard(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMessageBoardMessageFunctionalityRemoted.DateCreated: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardMessageSOAPFunctionality.DateCreated(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardMessageFunctionality_DateCreated(ServerFunctionality());
{$ENDIF}
end;

function TMessageBoardMessageFunctionalityRemoted.getSubject: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardMessageSOAPFunctionality.getSubject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardMessageFunctionality_getSubject(ServerFunctionality());
{$ENDIF}
end;

procedure TMessageBoardMessageFunctionalityRemoted.setSubject(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMessageBoardMessageSOAPFunctionality.setSubject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMessageBoardMessageFunctionality_setSubject(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TMessageBoardMessageFunctionalityRemoted.GetBody(out Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMessageBoardMessageSOAPFunctionality.GetBody(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMessageBoardMessageFunctionality_GetBody(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TMessageBoardMessageFunctionalityRemoted.SetBody(Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMessageBoardMessageSOAPFunctionality.SetBody(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMessageBoardMessageFunctionality_SetBody(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMessageBoardMessageFunctionalityRemoted.getFlRead: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardMessageSOAPFunctionality.getFlRead(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardMessageFunctionality_getFlRead(ServerFunctionality());
{$ENDIF}
end;

procedure TMessageBoardMessageFunctionalityRemoted.setFlRead(Value: boolean);
begin
{$IFNDEF EmbeddedServer}
TMessageBoardMessageSOAPFunctionality.setFlRead(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMessageBoardMessageFunctionality_setFlRead(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMessageBoardMessageFunctionalityRemoted.IsEmpty: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardMessageSOAPFunctionality.IsEmpty(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardMessageFunctionality_IsEmpty(ServerFunctionality());
{$ENDIF}
end;

function TMessageBoardMessageFunctionalityRemoted.IsCreatedByUser(const pidUser: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardMessageSOAPFunctionality.IsCreatedByUser(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pidUser);
{$ELSE}
Result:=TMessageBoardMessageFunctionality_IsCreatedByUser(ServerFunctionality(),   pidUser);
{$ENDIF}
end;


{TTMessageBoardFunctionality}
Constructor TTMessageBoardFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTMessageBoardSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTMessageBoardFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTMessageBoardSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTMessageBoardFunctionalityRemoted.TTMessageBoardSOAPFunctionality: ITTMessageBoardSOAPFunctionality;
begin
if (FTTMessageBoardSOAPFunctionality = nil)
  then FTTMessageBoardSOAPFunctionality:=GetITTMessageBoardSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMessageBoardSOAPFunctionality;
end;
{$ELSE}
function TTMessageBoardFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TMessageBoardFunctionality}
Constructor TMessageBoardFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTMessageBoardSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TMessageBoardFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTMessageBoardSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TMessageBoardFunctionalityRemoted.TMessageBoardSOAPFunctionality: ITMessageBoardSOAPFunctionality;
begin
if (FTMessageBoardSOAPFunctionality = nil)
  then FTMessageBoardSOAPFunctionality:=GetITMessageBoardSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMessageBoardSOAPFunctionality;
end;
{$ELSE}
function TMessageBoardFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TMessageBoardFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TMessageBoardFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMessageBoardSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMessageBoardFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMessageBoardFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TMessageBoardFunctionalityRemoted.IsUnreadMessageExist: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardSOAPFunctionality.IsUnreadMessageExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardFunctionality_IsUnreadMessageExist(ServerFunctionality());
{$ENDIF}
end;

procedure TMessageBoardFunctionalityRemoted.GetMessagesList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMessageBoardSOAPFunctionality.GetMessagesList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
{$ELSE}
TMessageBoardFunctionality_GetMessagesList(ServerFunctionality(),   List);
{$ENDIF}
end;

function TMessageBoardFunctionalityRemoted.CreateNewMessage: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardSOAPFunctionality.CreateNewMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardFunctionality_CreateNewMessage(ServerFunctionality());
{$ENDIF}
end;

procedure TMessageBoardFunctionalityRemoted.SendMessage(const idMessage: integer);
begin
{$IFNDEF EmbeddedServer}
TMessageBoardSOAPFunctionality.SendMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idMessage);
{$ELSE}
TMessageBoardFunctionality_SendMessage(ServerFunctionality(),   idMessage);
{$ENDIF}
end;

function TMessageBoardFunctionalityRemoted.getIdUser: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMessageBoardSOAPFunctionality.getIdUser(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMessageBoardFunctionality_getIdUser(ServerFunctionality());
{$ENDIF}
end;

procedure TMessageBoardFunctionalityRemoted.setIdUser(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMessageBoardSOAPFunctionality.setIdUser(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMessageBoardFunctionality_setIdUser(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTHREFFunctionality}
Constructor TTHREFFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTHREFSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTHREFFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTHREFSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTHREFFunctionalityRemoted.TTHREFSOAPFunctionality: ITTHREFSOAPFunctionality;
begin
if (FTTHREFSOAPFunctionality = nil)
  then FTTHREFSOAPFunctionality:=GetITTHREFSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHREFSOAPFunctionality;
end;
{$ELSE}
function TTHREFFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{THREFFunctionality}
Constructor THREFFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTHREFSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor THREFFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTHREFSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function THREFFunctionalityRemoted.THREFSOAPFunctionality: ITHREFSOAPFunctionality;
begin
if (FTHREFSOAPFunctionality = nil)
  then FTHREFSOAPFunctionality:=GetITHREFSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHREFSOAPFunctionality;
end;
{$ELSE}
function THREFFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function THREFFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THREFSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THREFFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function THREFFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THREFSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THREFFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function THREFFunctionalityRemoted.getURL: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THREFSOAPFunctionality.getURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THREFFunctionality_getURL(ServerFunctionality());
{$ENDIF}
end;

procedure THREFFunctionalityRemoted.setURL(Value: string);
begin
{$IFNDEF EmbeddedServer}
THREFSOAPFunctionality.setURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
THREFFunctionality_setURL(ServerFunctionality(),   Value);
{$ENDIF}
end;

function THREFFunctionalityRemoted.getAutoStart: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=THREFSOAPFunctionality.getAutoStart(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THREFFunctionality_getAutoStart(ServerFunctionality());
{$ENDIF}
end;

procedure THREFFunctionalityRemoted.setAutoStart(Value: boolean);
begin
{$IFNDEF EmbeddedServer}
THREFSOAPFunctionality.setAutoStart(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
THREFFunctionality_setAutoStart(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTQDCVisualizationFunctionality}
Constructor TTQDCVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTQDCVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTQDCVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTQDCVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTQDCVisualizationFunctionalityRemoted.TTQDCVisualizationSOAPFunctionality: ITTQDCVisualizationSOAPFunctionality;
begin
if (FTTQDCVisualizationSOAPFunctionality = nil)
  then FTTQDCVisualizationSOAPFunctionality:=GetITTQDCVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTQDCVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTQDCVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TQDCVisualizationFunctionality}
Constructor TQDCVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTQDCVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TQDCVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTQDCVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TQDCVisualizationFunctionalityRemoted.TQDCVisualizationSOAPFunctionality: ITQDCVisualizationSOAPFunctionality;
begin
if (FTQDCVisualizationSOAPFunctionality = nil)
  then FTQDCVisualizationSOAPFunctionality:=GetITQDCVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTQDCVisualizationSOAPFunctionality;
end;
{$ELSE}
function TQDCVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TQDCVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TQDCVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TQDCVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TQDCVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TQDCVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TQDCVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TQDCVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TQDCVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TQDCVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TQDCVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TQDCVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
{$ELSE}
TQDCVisualizationFunctionality_SetDATA(ServerFunctionality(),   DATAStream);
{$ENDIF}
end;

procedure TQDCVisualizationFunctionalityRemoted.LoadFromBitmap(Bitmap: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TQDCVisualizationSOAPFunctionality.LoadFromBitmap(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Bitmap);
{$ELSE}
TQDCVisualizationFunctionality_LoadFromBitmap(ServerFunctionality(),   Bitmap);
{$ENDIF}
end;

function TQDCVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TQDCVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TQDCVisualizationFunctionality_getDATAFileID(ServerFunctionality());
{$ENDIF}
end;

procedure TQDCVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TQDCVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TQDCVisualizationFunctionality_setDATAFileID(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TQDCVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
{$IFNDEF EmbeddedServer}
TQDCVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TQDCVisualizationFunctionality_DATAFile_Clear(ServerFunctionality());
{$ENDIF}
end;


{TTOffersServerFunctionality}
Constructor TTOffersServerFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTOffersServerSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTOffersServerFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTOffersServerSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTOffersServerFunctionalityRemoted.TTOffersServerSOAPFunctionality: ITTOffersServerSOAPFunctionality;
begin
if (FTTOffersServerSOAPFunctionality = nil)
  then FTTOffersServerSOAPFunctionality:=GetITTOffersServerSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOffersServerSOAPFunctionality;
end;
{$ELSE}
function TTOffersServerFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TOffersServerFunctionality}
Constructor TOffersServerFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTOffersServerSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TOffersServerFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTOffersServerSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TOffersServerFunctionalityRemoted.TOffersServerSOAPFunctionality: ITOffersServerSOAPFunctionality;
begin
if (FTOffersServerSOAPFunctionality = nil)
  then FTOffersServerSOAPFunctionality:=GetITOffersServerSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOffersServerSOAPFunctionality;
end;
{$ELSE}
function TOffersServerFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TOffersServerFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOffersServerSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOffersServerFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TOffersServerFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOffersServerSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOffersServerFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TOffersServerFunctionalityRemoted.getMailROBOT_Inbox: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOffersServerSOAPFunctionality.getMailROBOT_Inbox(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOffersServerFunctionality_getMailROBOT_Inbox(ServerFunctionality());
{$ENDIF}
end;

procedure TOffersServerFunctionalityRemoted.setMailROBOT_Inbox(Value: string);
begin
{$IFNDEF EmbeddedServer}
TOffersServerSOAPFunctionality.setMailROBOT_Inbox(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOffersServerFunctionality_setMailROBOT_Inbox(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOffersServerFunctionalityRemoted.getMailROBOT_User: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOffersServerSOAPFunctionality.getMailROBOT_User(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOffersServerFunctionality_getMailROBOT_User(ServerFunctionality());
{$ENDIF}
end;

procedure TOffersServerFunctionalityRemoted.setMailROBOT_User(Value: string);
begin
{$IFNDEF EmbeddedServer}
TOffersServerSOAPFunctionality.setMailROBOT_User(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOffersServerFunctionality_setMailROBOT_User(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOffersServerFunctionalityRemoted.getMailROBOT_Password: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOffersServerSOAPFunctionality.getMailROBOT_Password(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOffersServerFunctionality_getMailROBOT_Password(ServerFunctionality());
{$ENDIF}
end;

procedure TOffersServerFunctionalityRemoted.setMailROBOT_Password(Value: string);
begin
{$IFNDEF EmbeddedServer}
TOffersServerSOAPFunctionality.setMailROBOT_Password(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOffersServerFunctionality_setMailROBOT_Password(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTSecurityComponentOperationFunctionality}
Constructor TTSecurityComponentOperationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTSecurityComponentOperationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTSecurityComponentOperationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTSecurityComponentOperationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTSecurityComponentOperationFunctionalityRemoted.TTSecurityComponentOperationSOAPFunctionality: ITTSecurityComponentOperationSOAPFunctionality;
begin
if (FTTSecurityComponentOperationSOAPFunctionality = nil)
  then FTTSecurityComponentOperationSOAPFunctionality:=GetITTSecurityComponentOperationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTSecurityComponentOperationSOAPFunctionality;
end;
{$ELSE}
function TTSecurityComponentOperationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTSecurityComponentOperationFunctionalityRemoted.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTSecurityComponentOperationSOAPFunctionality.GetInstanceListByContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Context,List);
{$ELSE}
TTSecurityComponentOperationFunctionality_GetInstanceListByContext(ServerFunctionality(),   Context,List);
{$ENDIF}
end;


{TSecurityComponentOperationFunctionality}
Constructor TSecurityComponentOperationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTSecurityComponentOperationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TSecurityComponentOperationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTSecurityComponentOperationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TSecurityComponentOperationFunctionalityRemoted.TSecurityComponentOperationSOAPFunctionality: ITSecurityComponentOperationSOAPFunctionality;
begin
if (FTSecurityComponentOperationSOAPFunctionality = nil)
  then FTSecurityComponentOperationSOAPFunctionality:=GetITSecurityComponentOperationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTSecurityComponentOperationSOAPFunctionality;
end;
{$ELSE}
function TSecurityComponentOperationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TSecurityComponentOperationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityComponentOperationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityComponentOperationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TSecurityComponentOperationFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TSecurityComponentOperationSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TSecurityComponentOperationFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TSecurityComponentOperationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityComponentOperationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityComponentOperationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TSecurityComponentOperationFunctionalityRemoted.getSQLInfo: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityComponentOperationSOAPFunctionality.getSQLInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityComponentOperationFunctionality_getSQLInfo(ServerFunctionality());
{$ENDIF}
end;

procedure TSecurityComponentOperationFunctionalityRemoted.setSQLInfo(Value: string);
begin
{$IFNDEF EmbeddedServer}
TSecurityComponentOperationSOAPFunctionality.setSQLInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TSecurityComponentOperationFunctionality_setSQLInfo(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTSecurityKeyFunctionality}
Constructor TTSecurityKeyFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTSecurityKeySOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTSecurityKeyFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTSecurityKeySOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTSecurityKeyFunctionalityRemoted.TTSecurityKeySOAPFunctionality: ITTSecurityKeySOAPFunctionality;
begin
if (FTTSecurityKeySOAPFunctionality = nil)
  then FTTSecurityKeySOAPFunctionality:=GetITTSecurityKeySOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTSecurityKeySOAPFunctionality;
end;
{$ELSE}
function TTSecurityKeyFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTSecurityKeyFunctionalityRemoted.GetInstanceByCode(const Code: string;  out idInstance: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTSecurityKeySOAPFunctionality.GetInstanceByCode(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Code,idInstance);
{$ELSE}
Result:=TTSecurityKeyFunctionality_GetInstanceByCode(ServerFunctionality(),   Code,idInstance);
{$ENDIF}
end;

procedure TTSecurityKeyFunctionalityRemoted.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTSecurityKeySOAPFunctionality.GetInstanceListByContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Context,List);
{$ELSE}
TTSecurityKeyFunctionality_GetInstanceListByContext(ServerFunctionality(),   Context,List);
{$ENDIF}
end;


{TSecurityKeyFunctionality}
Constructor TSecurityKeyFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTSecurityKeySOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TSecurityKeyFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTSecurityKeySOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TSecurityKeyFunctionalityRemoted.TSecurityKeySOAPFunctionality: ITSecurityKeySOAPFunctionality;
begin
if (FTSecurityKeySOAPFunctionality = nil)
  then FTSecurityKeySOAPFunctionality:=GetITSecurityKeySOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTSecurityKeySOAPFunctionality;
end;
{$ELSE}
function TSecurityKeyFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TSecurityKeyFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityKeySOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityKeyFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TSecurityKeyFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TSecurityKeySOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TSecurityKeyFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TSecurityKeyFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityKeySOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityKeyFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TSecurityKeyFunctionalityRemoted.getInfo: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityKeySOAPFunctionality.getInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityKeyFunctionality_getInfo(ServerFunctionality());
{$ENDIF}
end;

procedure TSecurityKeyFunctionalityRemoted.setInfo(Value: string);
begin
{$IFNDEF EmbeddedServer}
TSecurityKeySOAPFunctionality.setInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TSecurityKeyFunctionality_setInfo(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TSecurityKeyFunctionalityRemoted.GetAssotiatedUsers(out Users: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TSecurityKeySOAPFunctionality.GetAssotiatedUsers(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Users);
{$ELSE}
TSecurityKeyFunctionality_GetAssotiatedUsers(ServerFunctionality(),   Users);
{$ENDIF}
end;

procedure TSecurityKeyFunctionalityRemoted.GenerateCode;
begin
{$IFNDEF EmbeddedServer}
TSecurityKeySOAPFunctionality.GenerateCode(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TSecurityKeyFunctionality_GenerateCode(ServerFunctionality());
{$ENDIF}
end;

function TSecurityKeyFunctionalityRemoted.Code: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityKeySOAPFunctionality.Code(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityKeyFunctionality_Code(ServerFunctionality());
{$ENDIF}
end;


{TTSecurityFileFunctionality}
Constructor TTSecurityFileFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTSecurityFileSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTSecurityFileFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTSecurityFileSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTSecurityFileFunctionalityRemoted.TTSecurityFileSOAPFunctionality: ITTSecurityFileSOAPFunctionality;
begin
if (FTTSecurityFileSOAPFunctionality = nil)
  then FTTSecurityFileSOAPFunctionality:=GetITTSecurityFileSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTSecurityFileSOAPFunctionality;
end;
{$ELSE}
function TTSecurityFileFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTSecurityFileFunctionalityRemoted.GetInstanceListByContext(const Context: WideString;out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTSecurityFileSOAPFunctionality.GetInstanceListByContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Context,List);
{$ELSE}
TTSecurityFileFunctionality_GetInstanceListByContext(ServerFunctionality(),   Context,List);
{$ENDIF}
end;


{TSecurityFileFunctionality}
Constructor TSecurityFileFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTSecurityFileSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TSecurityFileFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTSecurityFileSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TSecurityFileFunctionalityRemoted.TSecurityFileSOAPFunctionality: ITSecurityFileSOAPFunctionality;
begin
if (FTSecurityFileSOAPFunctionality = nil)
  then FTSecurityFileSOAPFunctionality:=GetITSecurityFileSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTSecurityFileSOAPFunctionality;
end;
{$ELSE}
function TSecurityFileFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TSecurityFileFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityFileSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityFileFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TSecurityFileFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TSecurityFileSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TSecurityFileFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TSecurityFileFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityFileSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityFileFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TSecurityFileFunctionalityRemoted.getInfo: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityFileSOAPFunctionality.getInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityFileFunctionality_getInfo(ServerFunctionality());
{$ENDIF}
end;

procedure TSecurityFileFunctionalityRemoted.setInfo(Value: string);
begin
{$IFNDEF EmbeddedServer}
TSecurityFileSOAPFunctionality.setInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TSecurityFileFunctionality_setInfo(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TSecurityFileFunctionalityRemoted.GetDATA(out Value: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityFileSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
Result:=TSecurityFileFunctionality_GetDATA(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TSecurityFileFunctionalityRemoted.SetDATA(Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TSecurityFileSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TSecurityFileFunctionality_SetDATA(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TSecurityFileFunctionalityRemoted.AddOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityFileSOAPFunctionality.AddOperationSecurityKey(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   OperationID,SecurityKeyID);
{$ELSE}
Result:=TSecurityFileFunctionality_AddOperationSecurityKey(ServerFunctionality(),   OperationID,SecurityKeyID);
{$ENDIF}
end;

function TSecurityFileFunctionalityRemoted.RemoveOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityFileSOAPFunctionality.RemoveOperationSecurityKey(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   OperationID,SecurityKeyID);
{$ELSE}
Result:=TSecurityFileFunctionality_RemoveOperationSecurityKey(ServerFunctionality(),   OperationID,SecurityKeyID);
{$ENDIF}
end;

procedure TSecurityFileFunctionalityRemoted.GetAssotiatedSecurityComponents(out SecurityComponents: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TSecurityFileSOAPFunctionality.GetAssotiatedSecurityComponents(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   SecurityComponents);
{$ELSE}
TSecurityFileFunctionality_GetAssotiatedSecurityComponents(ServerFunctionality(),   SecurityComponents);
{$ENDIF}
end;


{TTSecurityComponentFunctionality}
Constructor TTSecurityComponentFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTSecurityComponentSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTSecurityComponentFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTSecurityComponentSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTSecurityComponentFunctionalityRemoted.TTSecurityComponentSOAPFunctionality: ITTSecurityComponentSOAPFunctionality;
begin
if (FTTSecurityComponentSOAPFunctionality = nil)
  then FTTSecurityComponentSOAPFunctionality:=GetITTSecurityComponentSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTSecurityComponentSOAPFunctionality;
end;
{$ELSE}
function TTSecurityComponentFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTSecurityComponentFunctionalityRemoted.DestroyInstance(const idObj: integer);
begin
{$IFNDEF EmbeddedServer}
TTSecurityComponentSOAPFunctionality.DestroyInstance(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   idObj);
{$ELSE}
TTSecurityComponentFunctionality_DestroyInstance(ServerFunctionality(),   idObj);
{$ENDIF}
end;


{TSecurityComponentFunctionality}
Constructor TSecurityComponentFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTSecurityComponentSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TSecurityComponentFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTSecurityComponentSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TSecurityComponentFunctionalityRemoted.TSecurityComponentSOAPFunctionality: ITSecurityComponentSOAPFunctionality;
begin
if (FTSecurityComponentSOAPFunctionality = nil)
  then FTSecurityComponentSOAPFunctionality:=GetITSecurityComponentSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTSecurityComponentSOAPFunctionality;
end;
{$ELSE}
function TSecurityComponentFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TSecurityComponentFunctionalityRemoted.ToClone(out idClone: integer);
begin
{$IFNDEF EmbeddedServer}
TSecurityComponentSOAPFunctionality.ToClone(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idClone);
{$ELSE}
TSecurityComponentFunctionality_ToClone(ServerFunctionality(),   idClone);
{$ENDIF}
end;

function TSecurityComponentFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityComponentSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TSecurityComponentFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function TSecurityComponentFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityComponentSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityComponentFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TSecurityComponentFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityComponentSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityComponentFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TSecurityComponentFunctionalityRemoted.getIdSecurityFile: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TSecurityComponentSOAPFunctionality.getIdSecurityFile(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSecurityComponentFunctionality_getIdSecurityFile(ServerFunctionality());
{$ENDIF}
end;

procedure TSecurityComponentFunctionalityRemoted.setIdSecurityFile(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TSecurityComponentSOAPFunctionality.setIdSecurityFile(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TSecurityComponentFunctionality_setIdSecurityFile(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTMODELUserFunctionality}
Constructor TTMODELUserFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTMODELUserSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTMODELUserFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTMODELUserSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTMODELUserFunctionalityRemoted.TTMODELUserSOAPFunctionality: ITTMODELUserSOAPFunctionality;
begin
if (FTTMODELUserSOAPFunctionality = nil)
  then FTTMODELUserSOAPFunctionality:=GetITTMODELUserSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMODELUserSOAPFunctionality;
end;
{$ELSE}
function TTMODELUserFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTMODELUserFunctionalityRemoted.IsUserExist(const UserName: string; out idUser: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTMODELUserSOAPFunctionality.IsUserExist(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   UserName,idUser);
{$ELSE}
Result:=TTMODELUserFunctionality_IsUserExist(ServerFunctionality(),   UserName,idUser);
{$ENDIF}
end;

procedure TTMODELUserFunctionalityRemoted.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTMODELUserSOAPFunctionality.GetInstanceListByContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Context,List);
{$ELSE}
TTMODELUserFunctionality_GetInstanceListByContext(ServerFunctionality(),   Context,List);
{$ENDIF}
end;

procedure TTMODELUserFunctionalityRemoted.GetOnlineUsersForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTMODELUserSOAPFunctionality.GetOnlineUsersForDomains(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pOnlineMaxDelay,pDomains,List);
{$ELSE}
TTMODELUserFunctionality_GetOnlineUsersForDomains(ServerFunctionality(),   pOnlineMaxDelay,pDomains,List);
{$ENDIF}
end;

procedure TTMODELUserFunctionalityRemoted.GetOnlineExpertsForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTMODELUserSOAPFunctionality.GetOnlineExpertsForDomains(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pOnlineMaxDelay,pDomains,List);
{$ELSE}
TTMODELUserFunctionality_GetOnlineExpertsForDomains(ServerFunctionality(),   pOnlineMaxDelay,pDomains,List);
{$ENDIF}
end;


{TMODELUserFunctionality}
Constructor TMODELUserFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTMODELUserSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TMODELUserFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTMODELUserSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TMODELUserFunctionalityRemoted.TMODELUserSOAPFunctionality: ITMODELUserSOAPFunctionality;
begin
if (FTMODELUserSOAPFunctionality = nil)
  then FTMODELUserSOAPFunctionality:=GetITMODELUserSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMODELUserSOAPFunctionality;
end;
{$ELSE}
function TMODELUserFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TMODELUserFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.GetActiveStateInfo(out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.GetActiveStateInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ProxySpaceID,ProxySpaceIP,ProxySpaceState);
{$ELSE}
Result:=TMODELUserFunctionality_GetActiveStateInfo(ServerFunctionality(),   ProxySpaceID,ProxySpaceIP,ProxySpaceState);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.IsUserOnLine(const MaxDelay: Double): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.IsUserOnLine(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MaxDelay);
{$ELSE}
Result:=TMODELUserFunctionality_IsUserOnLine(ServerFunctionality(),   MaxDelay);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Logout;
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Logout(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TMODELUserFunctionality_Logout(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.GetSecurityKeysList(out SecurityKeys: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.GetSecurityKeysList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   SecurityKeys);
{$ELSE}
TMODELUserFunctionality_GetSecurityKeysList(ServerFunctionality(),   SecurityKeys);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.SecurityKeys_IsKeyExist(const idSecurityKey: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.SecurityKeys_IsKeyExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idSecurityKey);
{$ELSE}
Result:=TMODELUserFunctionality_SecurityKeys_IsKeyExist(ServerFunctionality(),   idSecurityKey);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.SecurityKeys_Insert(const idSecurityKey: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.SecurityKeys_Insert(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idSecurityKey);
{$ELSE}
TMODELUserFunctionality_SecurityKeys_Insert(ServerFunctionality(),   idSecurityKey);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.SecurityKeys_Delete(const idSecurityKey: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.SecurityKeys_Delete(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idSecurityKey);
{$ELSE}
TMODELUserFunctionality_SecurityKeys_Delete(ServerFunctionality(),   idSecurityKey);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.SecurityKeys_AddKeyByCode(const Code: WideString);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.SecurityKeys_AddKeyByCode(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Code);
{$ELSE}
TMODELUserFunctionality_SecurityKeys_AddKeyByCode(ServerFunctionality(),   Code);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.SecurityKeys_RemoveKeyByCode(const Code: WideString);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.SecurityKeys_RemoveKeyByCode(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Code);
{$ELSE}
TMODELUserFunctionality_SecurityKeys_RemoveKeyByCode(ServerFunctionality(),   Code);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.SecurityKeys_CreateAndAddNewKey(const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.SecurityKeys_CreateAndAddNewKey(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pName,pInfo,KeyCode);
{$ELSE}
Result:=TMODELUserFunctionality_SecurityKeys_CreateAndAddNewKey(ServerFunctionality(),   pName,pInfo,KeyCode);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.GetMessageBoards(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.GetMessageBoards(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
{$ELSE}
TMODELUserFunctionality_GetMessageBoards(ServerFunctionality(),   List);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.HaveUnreadMessages: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.HaveUnreadMessages(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_HaveUnreadMessages(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.GetMessages(const flUnreadOnly: boolean; out MessageList: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.GetMessages(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   flUnreadOnly,MessageList);
{$ELSE}
TMODELUserFunctionality_GetMessages(ServerFunctionality(),   flUnreadOnly,MessageList);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.IncomingMessages_SendNew(const Message: TByteArray; const SenderID: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.IncomingMessages_SendNew(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Message,SenderID);
{$ELSE}
TMODELUserFunctionality_IncomingMessages_SendNew(ServerFunctionality(),   Message,SenderID);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.IncomingMessages_GetUnread(out MessageList: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.IncomingMessages_GetUnread(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MessageList);
{$ELSE}
Result:=TMODELUserFunctionality_IncomingMessages_GetUnread(ServerFunctionality(),   MessageList);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.IncomingMessages_GetMessagesSince(const TimeStamp: TDateTime; out MessageList: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.IncomingMessages_GetMessagesSince(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TimeStamp,MessageList);
{$ELSE}
TMODELUserFunctionality_IncomingMessages_GetMessagesSince(ServerFunctionality(),   TimeStamp,MessageList);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.IncomingMessages_GetMessage(const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.IncomingMessages_GetMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MessageID,TimeStamp,Message,SenderID);
{$ELSE}
TMODELUserFunctionality_IncomingMessages_GetMessage(ServerFunctionality(),   MessageID,TimeStamp,Message,SenderID);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.IncomingMessages_DeleteTo(const TimeStamp: TDateTime);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.IncomingMessages_DeleteTo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TimeStamp);
{$ELSE}
TMODELUserFunctionality_IncomingMessages_DeleteTo(ServerFunctionality(),   TimeStamp);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getFullName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getFullName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getFullName(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setFullName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setFullName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setFullName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getContactInfo: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getContactInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getContactInfo(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setContactInfo(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setContactInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setContactInfo(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getPassword: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getPassword(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getPassword(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setPassword(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setPassword(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setPassword(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getIdSecurityFileForClone: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getIdSecurityFileForClone(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getIdSecurityFileForClone(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setIdSecurityFileForClone(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setIdSecurityFileForClone(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setIdSecurityFileForClone(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getidSecurityFileForPrivate: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getidSecurityFileForPrivate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getidSecurityFileForPrivate(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setidSecurityFileForPrivate(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setidSecurityFileForPrivate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setidSecurityFileForPrivate(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getDATASize: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getDATASize(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setDATASize(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setDATASize(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getMaxDATASize: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getMaxDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getMaxDATASize(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setMaxDATASize(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setMaxDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setMaxDATASize(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getSpaceSquare: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getSpaceSquare(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setSpaceSquare(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setSpaceSquare(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getMaxSpaceSquare: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getMaxSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getMaxSpaceSquare(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setMaxSpaceSquare(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setMaxSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setMaxSpaceSquare(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getMaxSpaceSquarePerObject: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getMaxSpaceSquarePerObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getMaxSpaceSquarePerObject(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setMaxSpaceSquarePerObject(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setMaxSpaceSquarePerObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setMaxSpaceSquarePerObject(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getDisabled: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getDisabled(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getDisabled(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setDisabled(Value: boolean);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setDisabled(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setDisabled(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.GetStartObj(out idTStartObj,idStartObj: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.GetStartObj(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTStartObj,idStartObj);
{$ELSE}
TMODELUserFunctionality_GetStartObj(ServerFunctionality(),   idTStartObj,idStartObj);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.SetStartObj(const idTStartObj,idStartObj: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.SetStartObj(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTStartObj,idStartObj);
{$ELSE}
TMODELUserFunctionality_SetStartObj(ServerFunctionality(),   idTStartObj,idStartObj);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getDomains: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getDomains(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getDomains(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setDomains(Value: string);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setDomains(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setDomains(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getTaskEnabled: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getTaskEnabled(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getTaskEnabled(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setTaskEnabled(Value: boolean);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setTaskEnabled(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setTaskEnabled(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.getBillingType: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.getBillingType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_getBillingType(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.setBillingType(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.setBillingType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TMODELUserFunctionality_setBillingType(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.CheckDATASize(const pAddDATASize: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.CheckDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pAddDATASize);
{$ELSE}
TMODELUserFunctionality_CheckDATASize(ServerFunctionality(),   pAddDATASize);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.AddDATASize(const pAddDATASize: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.AddDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pAddDATASize);
{$ELSE}
TMODELUserFunctionality_AddDATASize(ServerFunctionality(),   pAddDATASize);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.SubDATASize(const pSubDATASize: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.SubDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pSubDATASize);
{$ELSE}
TMODELUserFunctionality_SubDATASize(ServerFunctionality(),   pSubDATASize);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.CheckSpaceSquare(const pAddSpaceSquare: Double);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.CheckSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pAddSpaceSquare);
{$ELSE}
TMODELUserFunctionality_CheckSpaceSquare(ServerFunctionality(),   pAddSpaceSquare);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.AddSpaceSquare(const pAddSpaceSquare: Double);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.AddSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pAddSpaceSquare);
{$ELSE}
TMODELUserFunctionality_AddSpaceSquare(ServerFunctionality(),   pAddSpaceSquare);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.SubSpaceSquare(const pSubSpaceSquare: Double);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.SubSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pSubSpaceSquare);
{$ELSE}
TMODELUserFunctionality_SubSpaceSquare(ServerFunctionality(),   pSubSpaceSquare);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.CheckMaxSpaceSquarePerObject(const pObjectSpaceSquare: Double);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.CheckMaxSpaceSquarePerObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pObjectSpaceSquare);
{$ELSE}
TMODELUserFunctionality_CheckMaxSpaceSquarePerObject(ServerFunctionality(),   pObjectSpaceSquare);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.ServerFolder_GetSubFoldersList(const RelativePath: WideString; out List: WideString);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.ServerFolder_GetSubFoldersList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,List);
{$ELSE}
TMODELUserFunctionality_ServerFolder_GetSubFoldersList(ServerFunctionality(),   RelativePath,List);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.ServerFolder_GetFilesList(const RelativePath: WideString; out List: WideString);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.ServerFolder_GetFilesList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,List);
{$ELSE}
TMODELUserFunctionality_ServerFolder_GetFilesList(ServerFunctionality(),   RelativePath,List);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.ServerFolder_AddFile(const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.ServerFolder_AddFile(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,FileName,FileData);
{$ELSE}
Result:=TMODELUserFunctionality_ServerFolder_AddFile(ServerFunctionality(),   RelativePath,FileName,FileData);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.ServerFolder_RemoveFile(const RelativePath: WideString; const FileName: WideString): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.ServerFolder_RemoveFile(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,FileName);
{$ELSE}
Result:=TMODELUserFunctionality_ServerFolder_RemoveFile(ServerFunctionality(),   RelativePath,FileName);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.ServerFolder_ReadFile(const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.ServerFolder_ReadFile(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,FileName,FileData);
{$ELSE}
Result:=TMODELUserFunctionality_ServerFolder_ReadFile(ServerFunctionality(),   RelativePath,FileName,FileData);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.ServerFolder_AddSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.ServerFolder_AddSubFolder(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,SubFolderName);
{$ELSE}
Result:=TMODELUserFunctionality_ServerFolder_AddSubFolder(ServerFunctionality(),   RelativePath,SubFolderName);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.ServerFolder_AddSubFolder1(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.ServerFolder_AddSubFolder1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,SubFolderName,SubFolderData);
{$ELSE}
Result:=TMODELUserFunctionality_ServerFolder_AddSubFolder1(ServerFunctionality(),   RelativePath,SubFolderName,SubFolderData);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.ServerFolder_RemoveSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.ServerFolder_RemoveSubFolder(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,SubFolderName);
{$ELSE}
Result:=TMODELUserFunctionality_ServerFolder_RemoveSubFolder(ServerFunctionality(),   RelativePath,SubFolderName);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.ServerFolder_ReadSubFolder(const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.ServerFolder_ReadSubFolder(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Version,RelativePath,SubFolderName,Excludes,SubFolderData);
{$ELSE}
Result:=TMODELUserFunctionality_ServerFolder_ReadSubFolder(ServerFunctionality(),   Version,RelativePath,SubFolderName,Excludes,SubFolderData);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.ServerFolder_ExchangeSubFolder(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.ServerFolder_ExchangeSubFolder(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,SubFolderName,SubFolderInData,Excludes,SubFolderOutData);
{$ELSE}
Result:=TMODELUserFunctionality_ServerFolder_ExchangeSubFolder(ServerFunctionality(),   RelativePath,SubFolderName,SubFolderInData,Excludes,SubFolderOutData);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.Tasks_AddNew(const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.Tasks_AddNew(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pPriority,pType,pService,pTaskData,pComment);
{$ELSE}
Result:=TMODELUserFunctionality_Tasks_AddNew(ServerFunctionality(),   pPriority,pType,pService,pTaskData,pComment);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_RemoveItem(const idTask: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_RemoveItem(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask);
{$ELSE}
TMODELUserFunctionality_Tasks_RemoveItem(ServerFunctionality(),   idTask);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Clear;
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TMODELUserFunctionality_Tasks_Clear(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_GetData(const Version: integer; const flOnlyActive: boolean; out oData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_GetData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Version,flOnlyActive,oData);
{$ELSE}
TMODELUserFunctionality_Tasks_GetData(ServerFunctionality(),   Version,flOnlyActive,oData);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_GetTaskData(const idTask: integer; out oTaskData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_Item_GetTaskData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,oTaskData);
{$ELSE}
TMODELUserFunctionality_Tasks_Item_GetTaskData(ServerFunctionality(),   idTask,oTaskData);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetPriority(const idTask: integer; const pPriority: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_Item_SetPriority(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pPriority);
{$ELSE}
TMODELUserFunctionality_Tasks_Item_SetPriority(ServerFunctionality(),   idTask,pPriority);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_GetStatus(const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_Item_GetStatus(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,oStatus,oStatusReason,oStatusComment);
{$ELSE}
TMODELUserFunctionality_Tasks_Item_GetStatus(ServerFunctionality(),   idTask,oStatus,oStatusReason,oStatusComment);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetStatus(const idTask: integer; const pStatus: integer; const pStatusComment: string);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_Item_SetStatus(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pStatus,pStatusComment);
{$ELSE}
TMODELUserFunctionality_Tasks_Item_SetStatus(ServerFunctionality(),   idTask,pStatus,pStatusComment);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetStatus1(const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_Item_SetStatus1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pStatus,pStatusReason,pStatusComment);
{$ELSE}
TMODELUserFunctionality_Tasks_Item_SetStatus1(ServerFunctionality(),   idTask,pStatus,pStatusReason,pStatusComment);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_GetResultData(const idTask: integer; out oResultData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_Item_GetResultData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,oResultData);
{$ELSE}
TMODELUserFunctionality_Tasks_Item_GetResultData(ServerFunctionality(),   idTask,oResultData);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetResult(const idTask: integer; const pResultCode: integer; const pResultComment: string);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_Item_SetResult(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pResultCode,pResultComment);
{$ELSE}
TMODELUserFunctionality_Tasks_Item_SetResult(ServerFunctionality(),   idTask,pResultCode,pResultComment);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetResult1(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_Item_SetResult1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultComment);
{$ELSE}
TMODELUserFunctionality_Tasks_Item_SetResult1(ServerFunctionality(),   idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultComment);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetResult2(const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_Item_SetResult2(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pResultCode,pResultData,pResultComment);
{$ELSE}
TMODELUserFunctionality_Tasks_Item_SetResult2(ServerFunctionality(),   idTask,pResultCode,pResultData,pResultComment);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetResult3(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Tasks_Item_SetResult3(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultData,pResultComment);
{$ELSE}
TMODELUserFunctionality_Tasks_Item_SetResult3(ServerFunctionality(),   idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultData,pResultComment);
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.Billing_Account: double;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.Billing_Account(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMODELUserFunctionality_Billing_Account(ServerFunctionality());
{$ENDIF}
end;

function TMODELUserFunctionalityRemoted.Billing_Transactions_AddNew(const pReason: integer; const pDelta: double; const pComment: string): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TMODELUserSOAPFunctionality.Billing_Transactions_AddNew(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pReason,pDelta,pComment);
{$ELSE}
Result:=TMODELUserFunctionality_Billing_Transactions_AddNew(ServerFunctionality(),   pReason,pDelta,pComment);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Billing_Transactions_Remove(const idTransaction: integer);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Billing_Transactions_Remove(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTransaction);
{$ELSE}
TMODELUserFunctionality_Billing_Transactions_Remove(ServerFunctionality(),   idTransaction);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Billing_Transactions_Clear;
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Billing_Transactions_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TMODELUserFunctionality_Billing_Transactions_Clear(ServerFunctionality());
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.Billing_Transactions_GetData(const Version: integer; out oData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.Billing_Transactions_GetData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Version,oData);
{$ELSE}
TMODELUserFunctionality_Billing_Transactions_GetData(ServerFunctionality(),   Version,oData);
{$ENDIF}
end;

procedure TMODELUserFunctionalityRemoted.ClientProgram_GetReleases(const ProgramID: integer; const Localization: WideString; out Data: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TMODELUserSOAPFunctionality.ClientProgram_GetReleases(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ProgramID,Localization,Data);
{$ELSE}
TMODELUserFunctionality_ClientProgram_GetReleases(ServerFunctionality(),   ProgramID,Localization,Data);
{$ENDIF}
end;


{TTTextureFunctionality}
Constructor TTTextureFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTTextureSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTTextureFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTTextureSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTTextureFunctionalityRemoted.TTTextureSOAPFunctionality: ITTTextureSOAPFunctionality;
begin
if (FTTTextureSOAPFunctionality = nil)
  then FTTTextureSOAPFunctionality:=GetITTTextureSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTextureSOAPFunctionality;
end;
{$ELSE}
function TTTextureFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTTextureFunctionalityRemoted.GetInstanceListMatchingBy(const NameContext: string; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTTextureSOAPFunctionality.GetInstanceListMatchingBy(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   NameContext,List);
{$ELSE}
TTTextureFunctionality_GetInstanceListMatchingBy(ServerFunctionality(),   NameContext,List);
{$ENDIF}
end;


{TTextureFunctionality}
Constructor TTextureFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTTextureSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTextureFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTextureSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTextureFunctionalityRemoted.TTextureSOAPFunctionality: ITTextureSOAPFunctionality;
begin
if (FTTextureSOAPFunctionality = nil)
  then FTTextureSOAPFunctionality:=GetITTextureSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTextureSOAPFunctionality;
end;
{$ELSE}
function TTextureFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTextureFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTextureSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTextureFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TTextureFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTextureSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTextureFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TTextureFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TTextureSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TTextureFunctionality_GetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TTextureFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TTextureSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TTextureFunctionality_SetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TTextureFunctionalityRemoted.GetBitmapDATA(out BMPDATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTextureSOAPFunctionality.GetBitmapDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   BMPDATAStream);
{$ELSE}
TTextureFunctionality_GetBitmapDATA(ServerFunctionality(),   BMPDATAStream);
{$ENDIF}
end;

procedure TTextureFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TTextureSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTextureFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTBuffered3DVisualizationFunctionality}
Constructor TTBuffered3DVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTBuffered3DVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTBuffered3DVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTBuffered3DVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTBuffered3DVisualizationFunctionalityRemoted.TTBuffered3DVisualizationSOAPFunctionality: ITTBuffered3DVisualizationSOAPFunctionality;
begin
if (FTTBuffered3DVisualizationSOAPFunctionality = nil)
  then FTTBuffered3DVisualizationSOAPFunctionality:=GetITTBuffered3DVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTBuffered3DVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTBuffered3DVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TBuffered3DVisualizationFunctionality}
Constructor TBuffered3DVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTBuffered3DVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TBuffered3DVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTBuffered3DVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TBuffered3DVisualizationFunctionalityRemoted.TBuffered3DVisualizationSOAPFunctionality: ITBuffered3DVisualizationSOAPFunctionality;
begin
if (FTBuffered3DVisualizationSOAPFunctionality = nil)
  then FTBuffered3DVisualizationSOAPFunctionality:=GetITBuffered3DVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTBuffered3DVisualizationSOAPFunctionality;
end;
{$ELSE}
function TBuffered3DVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TBuffered3DVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TBuffered3DVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TBuffered3DVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TBuffered3DVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TBuffered3DVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TBuffered3DVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TBuffered3DVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TBuffered3DVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TBuffered3DVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.LoadFromStream(DATAStream: TByteArray; const DATAType: integer);
begin
{$IFNDEF EmbeddedServer}
TBuffered3DVisualizationSOAPFunctionality.LoadFromStream(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TBuffered3DVisualizationFunctionality_LoadFromStream(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.Get__Translate_XY(out vTranslate_X,vTranslate_Y: Double);
begin
{$IFNDEF EmbeddedServer}
TBuffered3DVisualizationSOAPFunctionality.Get__Translate_XY(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   vTranslate_X,vTranslate_Y);
{$ELSE}
TBuffered3DVisualizationFunctionality_Get__Translate_XY(ServerFunctionality(),   vTranslate_X,vTranslate_Y);
{$ENDIF}
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
begin
{$IFNDEF EmbeddedServer}
TBuffered3DVisualizationSOAPFunctionality.SetPropertiesLocal(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
{$ELSE}
TBuffered3DVisualizationFunctionality_SetPropertiesLocal(ServerFunctionality(),   pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
{$ENDIF}
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.UpdateXOYProjection;
begin
{$IFNDEF EmbeddedServer}
TBuffered3DVisualizationSOAPFunctionality.UpdateXOYProjection(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TBuffered3DVisualizationFunctionality_UpdateXOYProjection(ServerFunctionality());
{$ENDIF}
end;

function TBuffered3DVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TBuffered3DVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TBuffered3DVisualizationFunctionality_getDATAFileID(ServerFunctionality());
{$ENDIF}
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TBuffered3DVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TBuffered3DVisualizationFunctionality_setDATAFileID(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
{$IFNDEF EmbeddedServer}
TBuffered3DVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TBuffered3DVisualizationFunctionality_DATAFile_Clear(ServerFunctionality());
{$ENDIF}
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.GetParams(out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double);
begin
{$IFNDEF EmbeddedServer}
TBuffered3DVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oScale,oTranslate_X,oTranslate_Y,oTranslate_Z,oRotate_AngleX,oRotate_AngleY,oRotate_AngleZ);
{$ELSE}
TBuffered3DVisualizationFunctionality_GetParams(ServerFunctionality(),   oScale,oTranslate_X,oTranslate_Y,oTranslate_Z,oRotate_AngleX,oRotate_AngleY,oRotate_AngleZ);
{$ENDIF}
end;


{TTDATAFileFunctionality}
Constructor TTDATAFileFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTDATAFileSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTDATAFileFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTDATAFileSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTDATAFileFunctionalityRemoted.TTDATAFileSOAPFunctionality: ITTDATAFileSOAPFunctionality;
begin
if (FTTDATAFileSOAPFunctionality = nil)
  then FTTDATAFileSOAPFunctionality:=GetITTDATAFileSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTDATAFileSOAPFunctionality;
end;
{$ELSE}
function TTDATAFileFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TDATAFileFunctionality}
Constructor TDATAFileFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTDATAFileSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TDATAFileFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTDATAFileSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TDATAFileFunctionalityRemoted.TDATAFileSOAPFunctionality: ITDATAFileSOAPFunctionality;
begin
if (FTDATAFileSOAPFunctionality = nil)
  then FTDATAFileSOAPFunctionality:=GetITDATAFileSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTDATAFileSOAPFunctionality;
end;
{$ELSE}
function TDATAFileFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TDATAFileFunctionalityRemoted.Check;
begin
{$IFNDEF EmbeddedServer}
TDATAFileSOAPFunctionality.Check(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TDATAFileFunctionality_Check(ServerFunctionality());
{$ENDIF}
end;

function TDATAFileFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDATAFileSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDATAFileFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TDATAFileFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDATAFileSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDATAFileFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TDATAFileFunctionalityRemoted.IsNull: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TDATAFileSOAPFunctionality.IsNull(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDATAFileFunctionality_IsNull(ServerFunctionality());
{$ENDIF}
end;

procedure TDATAFileFunctionalityRemoted.Empty;
begin
{$IFNDEF EmbeddedServer}
TDATAFileSOAPFunctionality.Empty(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TDATAFileFunctionality_Empty(ServerFunctionality());
{$ENDIF}
end;

procedure TDATAFileFunctionalityRemoted.GetDATA(out Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TDATAFileSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TDATAFileFunctionality_GetDATA(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TDATAFileFunctionalityRemoted.SetDATA(Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TDATAFileSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TDATAFileFunctionality_SetDATA(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TDATAFileFunctionalityRemoted.getDATAType: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDATAFileSOAPFunctionality.getDATAType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDATAFileFunctionality_getDATAType(ServerFunctionality());
{$ENDIF}
end;

procedure TDATAFileFunctionalityRemoted.setDATAType(Value: string);
begin
{$IFNDEF EmbeddedServer}
TDATAFileSOAPFunctionality.setDATAType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TDATAFileFunctionality_setDATAType(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTCoComponentFunctionality}
Constructor TTCoComponentFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCoComponentSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCoComponentFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCoComponentSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCoComponentFunctionalityRemoted.TTCoComponentSOAPFunctionality: ITTCoComponentSOAPFunctionality;
begin
if (FTTCoComponentSOAPFunctionality = nil)
  then FTTCoComponentSOAPFunctionality:=GetITTCoComponentSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCoComponentSOAPFunctionality;
end;
{$ELSE}
function TTCoComponentFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTCoComponentFunctionalityRemoted.GetInstanceListByCoType(const idCoType: integer; out InstanceList: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTCoComponentSOAPFunctionality.GetInstanceListByCoType(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   idCoType,InstanceList);
{$ELSE}
TTCoComponentFunctionality_GetInstanceListByCoType(ServerFunctionality(),   idCoType,InstanceList);
{$ENDIF}
end;


{TCoComponentFunctionality}
Constructor TCoComponentFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCoComponentSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCoComponentFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCoComponentSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCoComponentFunctionalityRemoted.TCoComponentSOAPFunctionality: ITCoComponentSOAPFunctionality;
begin
if (FTCoComponentSOAPFunctionality = nil)
  then FTCoComponentSOAPFunctionality:=GetITCoComponentSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCoComponentSOAPFunctionality;
end;
{$ELSE}
function TCoComponentFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TCoComponentFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoComponentFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TCoComponentFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoComponentFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TCoComponentFunctionalityRemoted.idCoType: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentSOAPFunctionality.idCoType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoComponentFunctionality_idCoType(ServerFunctionality());
{$ENDIF}
end;

function TCoComponentFunctionalityRemoted.GetIconImage(out oImage: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentSOAPFunctionality.GetIconImage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oImage);
{$ELSE}
Result:=TCoComponentFunctionality_GetIconImage(ServerFunctionality(),   oImage);
{$ENDIF}
end;

function TCoComponentFunctionalityRemoted.GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentSOAPFunctionality.GetVisualizationComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTVisualization,idVisualization);
{$ELSE}
Result:=TCoComponentFunctionality_GetVisualizationComponent(ServerFunctionality(),   idTVisualization,idVisualization);
{$ENDIF}
end;


{TTCoComponentTypeMarkerFunctionality}
Constructor TTCoComponentTypeMarkerFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCoComponentTypeMarkerSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCoComponentTypeMarkerFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCoComponentTypeMarkerSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCoComponentTypeMarkerFunctionalityRemoted.TTCoComponentTypeMarkerSOAPFunctionality: ITTCoComponentTypeMarkerSOAPFunctionality;
begin
if (FTTCoComponentTypeMarkerSOAPFunctionality = nil)
  then FTTCoComponentTypeMarkerSOAPFunctionality:=GetITTCoComponentTypeMarkerSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCoComponentTypeMarkerSOAPFunctionality;
end;
{$ELSE}
function TTCoComponentTypeMarkerFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TCoComponentTypeMarkerFunctionality}
Constructor TCoComponentTypeMarkerFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCoComponentTypeMarkerSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCoComponentTypeMarkerFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCoComponentTypeMarkerSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCoComponentTypeMarkerFunctionalityRemoted.TCoComponentTypeMarkerSOAPFunctionality: ITCoComponentTypeMarkerSOAPFunctionality;
begin
if (FTCoComponentTypeMarkerSOAPFunctionality = nil)
  then FTCoComponentTypeMarkerSOAPFunctionality:=GetITCoComponentTypeMarkerSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCoComponentTypeMarkerSOAPFunctionality;
end;
{$ELSE}
function TCoComponentTypeMarkerFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TCoComponentTypeMarkerFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentTypeMarkerSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TCoComponentTypeMarkerFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function TCoComponentTypeMarkerFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentTypeMarkerSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoComponentTypeMarkerFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TCoComponentTypeMarkerFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentTypeMarkerSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoComponentTypeMarkerFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TCoComponentTypeMarkerFunctionalityRemoted.GetTypeIconImage(out oImage: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentTypeMarkerSOAPFunctionality.GetTypeIconImage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oImage);
{$ELSE}
Result:=TCoComponentTypeMarkerFunctionality_GetTypeIconImage(ServerFunctionality(),   oImage);
{$ENDIF}
end;

procedure TCoComponentTypeMarkerFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TCoComponentTypeMarkerSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCoComponentTypeMarkerFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TCoComponentTypeMarkerFunctionalityRemoted.getIDCoComponentType: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentTypeMarkerSOAPFunctionality.getIDCoComponentType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoComponentTypeMarkerFunctionality_getIDCoComponentType(ServerFunctionality());
{$ENDIF}
end;


{TTCoComponentTypeFunctionality}
Constructor TTCoComponentTypeFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCoComponentTypeSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCoComponentTypeFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCoComponentTypeSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCoComponentTypeFunctionalityRemoted.TTCoComponentTypeSOAPFunctionality: ITTCoComponentTypeSOAPFunctionality;
begin
if (FTTCoComponentTypeSOAPFunctionality = nil)
  then FTTCoComponentTypeSOAPFunctionality:=GetITTCoComponentTypeSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCoComponentTypeSOAPFunctionality;
end;
{$ELSE}
function TTCoComponentTypeFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTCoComponentTypeFunctionalityRemoted.GetInstanceListByFileType(const FileType: WideString; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTCoComponentTypeSOAPFunctionality.GetInstanceListByFileType(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   FileType,List);
{$ELSE}
TTCoComponentTypeFunctionality_GetInstanceListByFileType(ServerFunctionality(),   FileType,List);
{$ENDIF}
end;


{TCoComponentTypeFunctionality}
Constructor TCoComponentTypeFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCoComponentTypeSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCoComponentTypeFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCoComponentTypeSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCoComponentTypeFunctionalityRemoted.TCoComponentTypeSOAPFunctionality: ITCoComponentTypeSOAPFunctionality;
begin
if (FTCoComponentTypeSOAPFunctionality = nil)
  then FTCoComponentTypeSOAPFunctionality:=GetITCoComponentTypeSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCoComponentTypeSOAPFunctionality;
end;
{$ELSE}
function TCoComponentTypeFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TCoComponentTypeFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentTypeSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoComponentTypeFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TCoComponentTypeFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentTypeSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoComponentTypeFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TCoComponentTypeFunctionalityRemoted.GetDescription(out Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TCoComponentTypeSOAPFunctionality.GetDescription(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCoComponentTypeFunctionality_GetDescription(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TCoComponentTypeFunctionalityRemoted.SetDescription(Value: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TCoComponentTypeSOAPFunctionality.SetDescription(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCoComponentTypeFunctionality_SetDescription(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TCoComponentTypeFunctionalityRemoted.GetMarkersList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TCoComponentTypeSOAPFunctionality.GetMarkersList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
{$ELSE}
TCoComponentTypeFunctionality_GetMarkersList(ServerFunctionality(),   List);
{$ENDIF}
end;

function TCoComponentTypeFunctionalityRemoted.GetIconImage(out oImage: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentTypeSOAPFunctionality.GetIconImage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oImage);
{$ELSE}
Result:=TCoComponentTypeFunctionality_GetIconImage(ServerFunctionality(),   oImage);
{$ENDIF}
end;

procedure TCoComponentTypeFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TCoComponentTypeSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCoComponentTypeFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TCoComponentTypeFunctionalityRemoted.getUID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentTypeSOAPFunctionality.getUID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoComponentTypeFunctionality_getUID(ServerFunctionality());
{$ENDIF}
end;

function TCoComponentTypeFunctionalityRemoted.getDateCreated: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentTypeSOAPFunctionality.getDateCreated(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoComponentTypeFunctionality_getDateCreated(ServerFunctionality());
{$ENDIF}
end;

function TCoComponentTypeFunctionalityRemoted.getFileType: shortstring;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentTypeSOAPFunctionality.getFileType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoComponentTypeFunctionality_getFileType(ServerFunctionality());
{$ENDIF}
end;

procedure TCoComponentTypeFunctionalityRemoted.setFileType(Value: shortstring);
begin
{$IFNDEF EmbeddedServer}
TCoComponentTypeSOAPFunctionality.setFileType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCoComponentTypeFunctionality_setFileType(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TCoComponentTypeFunctionalityRemoted.getCoComponentPrototypeID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TCoComponentTypeSOAPFunctionality.getCoComponentPrototypeID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCoComponentTypeFunctionality_getCoComponentPrototypeID(ServerFunctionality());
{$ENDIF}
end;

procedure TCoComponentTypeFunctionalityRemoted.setCoComponentPrototypeID(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TCoComponentTypeSOAPFunctionality.setCoComponentPrototypeID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCoComponentTypeFunctionality_setCoComponentPrototypeID(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTAddressFunctionality}
Constructor TTAddressFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTAddressSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTAddressFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTAddressSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTAddressFunctionalityRemoted.TTAddressSOAPFunctionality: ITTAddressSOAPFunctionality;
begin
if (FTTAddressSOAPFunctionality = nil)
  then FTTAddressSOAPFunctionality:=GetITTAddressSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTAddressSOAPFunctionality;
end;
{$ELSE}
function TTAddressFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTAddressFunctionalityRemoted.Points_GetTypeNames(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTAddressSOAPFunctionality.Points_GetTypeNames(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
{$ELSE}
TTAddressFunctionality_Points_GetTypeNames(ServerFunctionality(),   List);
{$ENDIF}
end;

procedure TTAddressFunctionalityRemoted.Streets_GetTypeNames(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTAddressSOAPFunctionality.Streets_GetTypeNames(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
{$ELSE}
TTAddressFunctionality_Streets_GetTypeNames(ServerFunctionality(),   List);
{$ENDIF}
end;


{TAddressFunctionality}
Constructor TAddressFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTAddressSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TAddressFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTAddressSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TAddressFunctionalityRemoted.TAddressSOAPFunctionality: ITAddressSOAPFunctionality;
begin
if (FTAddressSOAPFunctionality = nil)
  then FTAddressSOAPFunctionality:=GetITAddressSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTAddressSOAPFunctionality;
end;
{$ELSE}
function TAddressFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TAddressFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TAddressSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAddressFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TAddressFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TAddressSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAddressFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TAddressFunctionalityRemoted.getIdPoint: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TAddressSOAPFunctionality.getIdPoint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAddressFunctionality_getIdPoint(ServerFunctionality());
{$ENDIF}
end;

procedure TAddressFunctionalityRemoted.setIdPoint(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TAddressSOAPFunctionality.setIdPoint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TAddressFunctionality_setIdPoint(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TAddressFunctionalityRemoted.getPoint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TAddressSOAPFunctionality.getPoint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAddressFunctionality_getPoint(ServerFunctionality());
{$ENDIF}
end;

function TAddressFunctionalityRemoted.getIdStreet: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TAddressSOAPFunctionality.getIdStreet(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAddressFunctionality_getIdStreet(ServerFunctionality());
{$ENDIF}
end;

procedure TAddressFunctionalityRemoted.setIdStreet(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TAddressSOAPFunctionality.setIdStreet(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TAddressFunctionality_setIdStreet(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TAddressFunctionalityRemoted.getStreet: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TAddressSOAPFunctionality.getStreet(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAddressFunctionality_getStreet(ServerFunctionality());
{$ENDIF}
end;

function TAddressFunctionalityRemoted.getHouse: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TAddressSOAPFunctionality.getHouse(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAddressFunctionality_getHouse(ServerFunctionality());
{$ENDIF}
end;

procedure TAddressFunctionalityRemoted.setHouse(Value: string);
begin
{$IFNDEF EmbeddedServer}
TAddressSOAPFunctionality.setHouse(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TAddressFunctionality_setHouse(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TAddressFunctionalityRemoted.getCorps: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TAddressSOAPFunctionality.getCorps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAddressFunctionality_getCorps(ServerFunctionality());
{$ENDIF}
end;

procedure TAddressFunctionalityRemoted.setCorps(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TAddressSOAPFunctionality.setCorps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TAddressFunctionality_setCorps(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TAddressFunctionalityRemoted.getApartment: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TAddressSOAPFunctionality.getApartment(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAddressFunctionality_getApartment(ServerFunctionality());
{$ENDIF}
end;

procedure TAddressFunctionalityRemoted.setApartment(Value: string);
begin
{$IFNDEF EmbeddedServer}
TAddressSOAPFunctionality.setApartment(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TAddressFunctionality_setApartment(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TAddressFunctionalityRemoted.getEntrance: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TAddressSOAPFunctionality.getEntrance(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TAddressFunctionality_getEntrance(ServerFunctionality());
{$ENDIF}
end;

procedure TAddressFunctionalityRemoted.setEntrance(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TAddressSOAPFunctionality.setEntrance(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TAddressFunctionality_setEntrance(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTTransportRouteFunctionality}
Constructor TTTransportRouteFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTTransportRouteSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTTransportRouteFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTTransportRouteSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTTransportRouteFunctionalityRemoted.TTTransportRouteSOAPFunctionality: ITTTransportRouteSOAPFunctionality;
begin
if (FTTTransportRouteSOAPFunctionality = nil)
  then FTTTransportRouteSOAPFunctionality:=GetITTTransportRouteSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTransportRouteSOAPFunctionality;
end;
{$ELSE}
function TTTransportRouteFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTTransportRouteFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTTransportRouteSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
{$ELSE}
TTTransportRouteFunctionality_GetInstanceList(ServerFunctionality(),   List);
{$ENDIF}
end;


{TTransportRouteFunctionality}
Constructor TTransportRouteFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTTransportRouteSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTransportRouteFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTransportRouteSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTransportRouteFunctionalityRemoted.TTransportRouteSOAPFunctionality: ITTransportRouteSOAPFunctionality;
begin
if (FTTransportRouteSOAPFunctionality = nil)
  then FTTransportRouteSOAPFunctionality:=GetITTransportRouteSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTransportRouteSOAPFunctionality;
end;
{$ELSE}
function TTransportRouteFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTransportRouteFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportRouteSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTransportRouteFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TTransportRouteFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TTransportRouteSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTransportRouteFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTransportRouteFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportRouteSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTransportRouteFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TTransportRouteFunctionalityRemoted.getidTTransport: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportRouteSOAPFunctionality.getidTTransport(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTransportRouteFunctionality_getidTTransport(ServerFunctionality());
{$ENDIF}
end;

procedure TTransportRouteFunctionalityRemoted.setidTTransport(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TTransportRouteSOAPFunctionality.setidTTransport(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTransportRouteFunctionality_setidTTransport(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTransportRouteFunctionalityRemoted.getValid: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportRouteSOAPFunctionality.getValid(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTransportRouteFunctionality_getValid(ServerFunctionality());
{$ENDIF}
end;

procedure TTransportRouteFunctionalityRemoted.setValid(Value: boolean);
begin
{$IFNDEF EmbeddedServer}
TTransportRouteSOAPFunctionality.setValid(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTransportRouteFunctionality_setValid(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTransportRouteFunctionalityRemoted.getRemarks: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportRouteSOAPFunctionality.getRemarks(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTransportRouteFunctionality_getRemarks(ServerFunctionality());
{$ENDIF}
end;

procedure TTransportRouteFunctionalityRemoted.setRemarks(Value: string);
begin
{$IFNDEF EmbeddedServer}
TTransportRouteSOAPFunctionality.setRemarks(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTransportRouteFunctionality_setRemarks(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTransportRouteFunctionalityRemoted.IsNodesExist: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportRouteSOAPFunctionality.IsNodesExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTransportRouteFunctionality_IsNodesExist(ServerFunctionality());
{$ENDIF}
end;

procedure TTransportRouteFunctionalityRemoted.Nodes_GetList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTransportRouteSOAPFunctionality.Nodes_GetList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
{$ELSE}
TTransportRouteFunctionality_Nodes_GetList(ServerFunctionality(),   List);
{$ENDIF}
end;

function TTransportRouteFunctionalityRemoted.Nodes_IsNodeExist(const idNode: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportRouteSOAPFunctionality.Nodes_IsNodeExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idNode);
{$ELSE}
Result:=TTransportRouteFunctionality_Nodes_IsNodeExist(ServerFunctionality(),   idNode);
{$ENDIF}
end;

procedure TTransportRouteFunctionalityRemoted.Nodes_ChangeNodeOrder(const idItem: integer; const Order: integer);
begin
{$IFNDEF EmbeddedServer}
TTransportRouteSOAPFunctionality.Nodes_ChangeNodeOrder(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idItem,Order);
{$ELSE}
TTransportRouteFunctionality_Nodes_ChangeNodeOrder(ServerFunctionality(),   idItem,Order);
{$ENDIF}
end;

function TTransportRouteFunctionalityRemoted.Nodes__Node_DistanceBefore(const idItem: integer): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportRouteSOAPFunctionality.Nodes__Node_DistanceBefore(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idItem);
{$ELSE}
Result:=TTransportRouteFunctionality_Nodes__Node_DistanceBefore(ServerFunctionality(),   idItem);
{$ENDIF}
end;

procedure TTransportRouteFunctionalityRemoted.Nodes__Node_SetDistanceBefore(const idItem: integer; const D: integer);
begin
{$IFNDEF EmbeddedServer}
TTransportRouteSOAPFunctionality.Nodes__Node_SetDistanceBefore(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idItem,D);
{$ELSE}
TTransportRouteFunctionality_Nodes__Node_SetDistanceBefore(ServerFunctionality(),   idItem,D);
{$ENDIF}
end;

function TTransportRouteFunctionalityRemoted.Nodes__Node_OrderPrice(const idItem: integer): string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportRouteSOAPFunctionality.Nodes__Node_OrderPrice(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idItem);
{$ELSE}
Result:=TTransportRouteFunctionality_Nodes__Node_OrderPrice(ServerFunctionality(),   idItem);
{$ENDIF}
end;

procedure TTransportRouteFunctionalityRemoted.Nodes__Node_SetOrderPrice(const idItem: integer; const Price: string);
begin
{$IFNDEF EmbeddedServer}
TTransportRouteSOAPFunctionality.Nodes__Node_SetOrderPrice(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idItem,Price);
{$ELSE}
TTransportRouteFunctionality_Nodes__Node_SetOrderPrice(ServerFunctionality(),   idItem,Price);
{$ENDIF}
end;

function TTransportRouteFunctionalityRemoted.Nodes_Insert(const idNode: integer): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportRouteSOAPFunctionality.Nodes_Insert(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idNode);
{$ELSE}
Result:=TTransportRouteFunctionality_Nodes_Insert(ServerFunctionality(),   idNode);
{$ENDIF}
end;

procedure TTransportRouteFunctionalityRemoted.Nodes_Remove(const idItem: integer);
begin
{$IFNDEF EmbeddedServer}
TTransportRouteSOAPFunctionality.Nodes_Remove(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idItem);
{$ELSE}
TTransportRouteFunctionality_Nodes_Remove(ServerFunctionality(),   idItem);
{$ENDIF}
end;


{TTTransportNodeFunctionality}
Constructor TTTransportNodeFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTTransportNodeSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTTransportNodeFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTTransportNodeSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTTransportNodeFunctionalityRemoted.TTTransportNodeSOAPFunctionality: ITTTransportNodeSOAPFunctionality;
begin
if (FTTTransportNodeSOAPFunctionality = nil)
  then FTTTransportNodeSOAPFunctionality:=GetITTTransportNodeSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTransportNodeSOAPFunctionality;
end;
{$ELSE}
function TTTransportNodeFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTTransportNodeFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTTransportNodeSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
{$ELSE}
TTTransportNodeFunctionality_GetInstanceList(ServerFunctionality(),   List);
{$ENDIF}
end;


{TTransportNodeFunctionality}
Constructor TTransportNodeFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTTransportNodeSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTransportNodeFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTransportNodeSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTransportNodeFunctionalityRemoted.TTransportNodeSOAPFunctionality: ITTransportNodeSOAPFunctionality;
begin
if (FTTransportNodeSOAPFunctionality = nil)
  then FTTransportNodeSOAPFunctionality:=GetITTransportNodeSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTransportNodeSOAPFunctionality;
end;
{$ELSE}
function TTransportNodeFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTransportNodeFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportNodeSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTransportNodeFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TTransportNodeFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TTransportNodeSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTransportNodeFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTransportNodeFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportNodeSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTransportNodeFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TTransportNodeFunctionalityRemoted.IsRoutesExist: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTransportNodeSOAPFunctionality.IsRoutesExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTransportNodeFunctionality_IsRoutesExist(ServerFunctionality());
{$ENDIF}
end;


{TTOfferGoodsFunctionality}
Constructor TTOfferGoodsFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTOfferGoodsSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTOfferGoodsFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTOfferGoodsSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTOfferGoodsFunctionalityRemoted.TTOfferGoodsSOAPFunctionality: ITTOfferGoodsSOAPFunctionality;
begin
if (FTTOfferGoodsSOAPFunctionality = nil)
  then FTTOfferGoodsSOAPFunctionality:=GetITTOfferGoodsSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOfferGoodsSOAPFunctionality;
end;
{$ELSE}
function TTOfferGoodsFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TOfferGoodsFunctionality}
Constructor TOfferGoodsFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTOfferGoodsSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TOfferGoodsFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTOfferGoodsSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TOfferGoodsFunctionalityRemoted.TOfferGoodsSOAPFunctionality: ITOfferGoodsSOAPFunctionality;
begin
if (FTOfferGoodsSOAPFunctionality = nil)
  then FTOfferGoodsSOAPFunctionality:=GetITOfferGoodsSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOfferGoodsSOAPFunctionality;
end;
{$ELSE}
function TOfferGoodsFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TOfferGoodsFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferGoodsSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TOfferGoodsFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function TOfferGoodsFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferGoodsSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferGoodsFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TOfferGoodsFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferGoodsSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferGoodsFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TOfferGoodsFunctionalityRemoted.idOffer: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferGoodsSOAPFunctionality.idOffer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferGoodsFunctionality_idOffer(ServerFunctionality());
{$ENDIF}
end;

function TOfferGoodsFunctionalityRemoted.getIdGoods: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferGoodsSOAPFunctionality.getIdGoods(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferGoodsFunctionality_getIdGoods(ServerFunctionality());
{$ENDIF}
end;

procedure TOfferGoodsFunctionalityRemoted.setIdGoods(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TOfferGoodsSOAPFunctionality.setIdGoods(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOfferGoodsFunctionality_setIdGoods(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOfferGoodsFunctionalityRemoted.getAmount: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferGoodsSOAPFunctionality.getAmount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferGoodsFunctionality_getAmount(ServerFunctionality());
{$ENDIF}
end;

procedure TOfferGoodsFunctionalityRemoted.setAmount(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TOfferGoodsSOAPFunctionality.setAmount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOfferGoodsFunctionality_setAmount(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOfferGoodsFunctionalityRemoted.getIdMeasureUnit: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferGoodsSOAPFunctionality.getIdMeasureUnit(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferGoodsFunctionality_getIdMeasureUnit(ServerFunctionality());
{$ENDIF}
end;

procedure TOfferGoodsFunctionalityRemoted.setIdMeasureUnit(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TOfferGoodsSOAPFunctionality.setIdMeasureUnit(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOfferGoodsFunctionality_setIdMeasureUnit(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOfferGoodsFunctionalityRemoted.getMeasureUnit: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferGoodsSOAPFunctionality.getMeasureUnit(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferGoodsFunctionality_getMeasureUnit(ServerFunctionality());
{$ENDIF}
end;

function TOfferGoodsFunctionalityRemoted.getMinPrice: Currency;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferGoodsSOAPFunctionality.getMinPrice(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferGoodsFunctionality_getMinPrice(ServerFunctionality());
{$ENDIF}
end;

procedure TOfferGoodsFunctionalityRemoted.setMinPrice(Value: Currency);
begin
{$IFNDEF EmbeddedServer}
TOfferGoodsSOAPFunctionality.setMinPrice(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOfferGoodsFunctionality_setMinPrice(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOfferGoodsFunctionalityRemoted.getMisc: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferGoodsSOAPFunctionality.getMisc(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferGoodsFunctionality_getMisc(ServerFunctionality());
{$ENDIF}
end;

procedure TOfferGoodsFunctionalityRemoted.setMisc(Value: string);
begin
{$IFNDEF EmbeddedServer}
TOfferGoodsSOAPFunctionality.setMisc(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOfferGoodsFunctionality_setMisc(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTTLFStationTMTFunctionality}
Constructor TTTLFStationTMTFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTTLFStationTMTSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTTLFStationTMTFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTTLFStationTMTSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTTLFStationTMTFunctionalityRemoted.TTTLFStationTMTSOAPFunctionality: ITTTLFStationTMTSOAPFunctionality;
begin
if (FTTTLFStationTMTSOAPFunctionality = nil)
  then FTTTLFStationTMTSOAPFunctionality:=GetITTTLFStationTMTSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTLFStationTMTSOAPFunctionality;
end;
{$ELSE}
function TTTLFStationTMTFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTTLFStationTMTFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTTLFStationTMTSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
{$ELSE}
TTTLFStationTMTFunctionality_GetInstanceList(ServerFunctionality(),   List);
{$ENDIF}
end;


{TTLFStationTMTFunctionality}
Constructor TTLFStationTMTFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTTLFStationTMTSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTLFStationTMTFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTLFStationTMTSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTLFStationTMTFunctionalityRemoted.TTLFStationTMTSOAPFunctionality: ITTLFStationTMTSOAPFunctionality;
begin
if (FTTLFStationTMTSOAPFunctionality = nil)
  then FTTLFStationTMTSOAPFunctionality:=GetITTLFStationTMTSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTLFStationTMTSOAPFunctionality;
end;
{$ELSE}
function TTLFStationTMTFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTLFStationTMTFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFStationTMTSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFStationTMTFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TTLFStationTMTFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFStationTMTSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFStationTMTFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TTLFStationTMTFunctionalityRemoted.getHostName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFStationTMTSOAPFunctionality.getHostName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFStationTMTFunctionality_getHostName(ServerFunctionality());
{$ENDIF}
end;

procedure TTLFStationTMTFunctionalityRemoted.setHostName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TTLFStationTMTSOAPFunctionality.setHostName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTLFStationTMTFunctionality_setHostName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTLFStationTMTFunctionalityRemoted.getTestChanel: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFStationTMTSOAPFunctionality.getTestChanel(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFStationTMTFunctionality_getTestChanel(ServerFunctionality());
{$ENDIF}
end;

procedure TTLFStationTMTFunctionalityRemoted.setTestChanel(Value: string);
begin
{$IFNDEF EmbeddedServer}
TTLFStationTMTSOAPFunctionality.setTestChanel(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTLFStationTMTFunctionality_setTestChanel(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTNameFunctionality}
Constructor TTNameFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTNameSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTNameFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTNameSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTNameFunctionalityRemoted.TTNameSOAPFunctionality: ITTNameSOAPFunctionality;
begin
if (FTTNameSOAPFunctionality = nil)
  then FTTNameSOAPFunctionality:=GetITTNameSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTNameSOAPFunctionality;
end;
{$ELSE}
function TTNameFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TNameFunctionality}
Constructor TNameFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTNameSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TNameFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTNameSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TNameFunctionalityRemoted.TNameSOAPFunctionality: ITNameSOAPFunctionality;
begin
if (FTNameSOAPFunctionality = nil)
  then FTNameSOAPFunctionality:=GetITNameSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTNameSOAPFunctionality;
end;
{$ELSE}
function TNameFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TNameFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TNameSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TNameFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TNameFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TNameSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TNameFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TNameFunctionalityRemoted.Value: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TNameSOAPFunctionality.Value(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TNameFunctionality_Value(ServerFunctionality());
{$ENDIF}
end;

procedure TNameFunctionalityRemoted.SetValue(const NewValue: string);
begin
{$IFNDEF EmbeddedServer}
TNameSOAPFunctionality.SetValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewValue);
{$ELSE}
TNameFunctionality_SetValue(ServerFunctionality(),   NewValue);
{$ENDIF}
end;


{TTVisualizationFunctionality}
Constructor TTVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTVisualizationFunctionalityRemoted.TTVisualizationSOAPFunctionality: ITTVisualizationSOAPFunctionality;
begin
if (FTTVisualizationSOAPFunctionality = nil)
  then FTTVisualizationSOAPFunctionality:=GetITTVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TVisualizationFunctionality}
Constructor TVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TVisualizationFunctionalityRemoted.TVisualizationSOAPFunctionality: ITVisualizationSOAPFunctionality;
begin
if (FTVisualizationSOAPFunctionality = nil)
  then FTVisualizationSOAPFunctionality:=GetITVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTVisualizationSOAPFunctionality;
end;
{$ELSE}
function TVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTHREFVisualizationFunctionality}
Constructor TTHREFVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTHREFVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTHREFVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTHREFVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTHREFVisualizationFunctionalityRemoted.TTHREFVisualizationSOAPFunctionality: ITTHREFVisualizationSOAPFunctionality;
begin
if (FTTHREFVisualizationSOAPFunctionality = nil)
  then FTTHREFVisualizationSOAPFunctionality:=GetITTHREFVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHREFVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTHREFVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{THREFVisualizationFunctionality}
Constructor THREFVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTHREFVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor THREFVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTHREFVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function THREFVisualizationFunctionalityRemoted.THREFVisualizationSOAPFunctionality: ITHREFVisualizationSOAPFunctionality;
begin
if (FTHREFVisualizationSOAPFunctionality = nil)
  then FTHREFVisualizationSOAPFunctionality:=GetITHREFVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHREFVisualizationSOAPFunctionality;
end;
{$ELSE}
function THREFVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function THREFVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=THREFVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=THREFVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function THREFVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THREFVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THREFVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function THREFVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THREFVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THREFVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTTTFVisualizationFunctionality}
Constructor TTTTFVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTTTFVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTTTFVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTTTFVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTTTFVisualizationFunctionalityRemoted.TTTTFVisualizationSOAPFunctionality: ITTTTFVisualizationSOAPFunctionality;
begin
if (FTTTTFVisualizationSOAPFunctionality = nil)
  then FTTTTFVisualizationSOAPFunctionality:=GetITTTTFVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTTFVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTTTFVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TTTFVisualizationFunctionality}
Constructor TTTFVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTTTFVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTTFVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTTFVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTTFVisualizationFunctionalityRemoted.TTTFVisualizationSOAPFunctionality: ITTTFVisualizationSOAPFunctionality;
begin
if (FTTTFVisualizationSOAPFunctionality = nil)
  then FTTTFVisualizationSOAPFunctionality:=GetITTTFVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTTFVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTTFVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTTFVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTTFVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TTTFVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TTTFVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTTFVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTTFVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TTTFVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTTFVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTTFVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TTTFVisualizationFunctionalityRemoted.getStr: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTTFVisualizationSOAPFunctionality.getStr(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTTFVisualizationFunctionality_getStr(ServerFunctionality());
{$ENDIF}
end;

procedure TTTFVisualizationFunctionalityRemoted.setStr(const Value: string);
begin
{$IFNDEF EmbeddedServer}
TTTFVisualizationSOAPFunctionality.setStr(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTTFVisualizationFunctionality_setStr(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TTTFVisualizationFunctionalityRemoted.GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString);
begin
{$IFNDEF EmbeddedServer}
TTTFVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oStr,oFont_Width,oFont_Height,oFont_Name);
{$ELSE}
TTTFVisualizationFunctionality_GetParams(ServerFunctionality(),   oStr,oFont_Width,oFont_Height,oFont_Name);
{$ENDIF}
end;

procedure TTTFVisualizationFunctionalityRemoted.SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString);
begin
{$IFNDEF EmbeddedServer}
TTTFVisualizationSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pStr,pFont_Width,pFont_Height,pFont_Name);
{$ELSE}
TTTFVisualizationFunctionality_SetParams(ServerFunctionality(),   pStr,pFont_Width,pFont_Height,pFont_Name);
{$ENDIF}
end;


{TTObjectFunctionality}
Constructor TTObjectFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTObjectSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTObjectFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTObjectSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTObjectFunctionalityRemoted.TTObjectSOAPFunctionality: ITTObjectSOAPFunctionality;
begin
if (FTTObjectSOAPFunctionality = nil)
  then FTTObjectSOAPFunctionality:=GetITTObjectSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTObjectSOAPFunctionality;
end;
{$ELSE}
function TTObjectFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TObjectFunctionality}
Constructor TObjectFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTObjectSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TObjectFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTObjectSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TObjectFunctionalityRemoted.TObjectSOAPFunctionality: ITObjectSOAPFunctionality;
begin
if (FTObjectSOAPFunctionality = nil)
  then FTObjectSOAPFunctionality:=GetITObjectSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTObjectSOAPFunctionality;
end;
{$ELSE}
function TObjectFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TObjectFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TObjectSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TObjectFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TObjectFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TObjectSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TObjectFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTLabelFunctionality}
Constructor TTLabelFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTLabelSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTLabelFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTLabelSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTLabelFunctionalityRemoted.TTLabelSOAPFunctionality: ITTLabelSOAPFunctionality;
begin
if (FTTLabelSOAPFunctionality = nil)
  then FTTLabelSOAPFunctionality:=GetITTLabelSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTLabelSOAPFunctionality;
end;
{$ELSE}
function TTLabelFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TLabelFunctionality}
Constructor TLabelFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTLabelSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TLabelFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTLabelSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TLabelFunctionalityRemoted.TLabelSOAPFunctionality: ITLabelSOAPFunctionality;
begin
if (FTLabelSOAPFunctionality = nil)
  then FTLabelSOAPFunctionality:=GetITLabelSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTLabelSOAPFunctionality;
end;
{$ELSE}
function TLabelFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TLabelFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TLabelSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TLabelFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TLabelFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TLabelSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TLabelFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTStationFunctionality}
Constructor TTStationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTStationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTStationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTStationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTStationFunctionalityRemoted.TTStationSOAPFunctionality: ITTStationSOAPFunctionality;
begin
if (FTTStationSOAPFunctionality = nil)
  then FTTStationSOAPFunctionality:=GetITTStationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTStationSOAPFunctionality;
end;
{$ELSE}
function TTStationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTStationFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTStationSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
{$ELSE}
TTStationFunctionality_GetInstanceList(ServerFunctionality(),   List);
{$ENDIF}
end;


{TStationFunctionality}
Constructor TStationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTStationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TStationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTStationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TStationFunctionalityRemoted.TStationSOAPFunctionality: ITStationSOAPFunctionality;
begin
if (FTStationSOAPFunctionality = nil)
  then FTStationSOAPFunctionality:=GetITStationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTStationSOAPFunctionality;
end;
{$ELSE}
function TStationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TStationFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TStationSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TStationFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function TStationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TStationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TStationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TStationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TStationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TStationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TStationFunctionalityRemoted.GetNumbersBound(out BegNumber,EndNumber: integer);
begin
{$IFNDEF EmbeddedServer}
TStationSOAPFunctionality.GetNumbersBound(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   BegNumber,EndNumber);
{$ELSE}
TStationFunctionality_GetNumbersBound(ServerFunctionality(),   BegNumber,EndNumber);
{$ENDIF}
end;


{TTMainLineFunctionality}
Constructor TTMainLineFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTMainLineSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTMainLineFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTMainLineSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTMainLineFunctionalityRemoted.TTMainLineSOAPFunctionality: ITTMainLineSOAPFunctionality;
begin
if (FTTMainLineSOAPFunctionality = nil)
  then FTTMainLineSOAPFunctionality:=GetITTMainLineSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMainLineSOAPFunctionality;
end;
{$ELSE}
function TTMainLineFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TMainLineFunctionality}
Constructor TMainLineFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTMainLineSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TMainLineFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTMainLineSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TMainLineFunctionalityRemoted.TMainLineSOAPFunctionality: ITMainLineSOAPFunctionality;
begin
if (FTMainLineSOAPFunctionality = nil)
  then FTMainLineSOAPFunctionality:=GetITMainLineSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMainLineSOAPFunctionality;
end;
{$ELSE}
function TMainLineFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TMainLineFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMainLineSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TMainLineFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function TMainLineFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMainLineSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMainLineFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TMainLineFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMainLineSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMainLineFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TMainLineFunctionalityRemoted.GetSTNOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TMainLineSOAPFunctionality.GetSTNOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TMainLineFunctionality_GetSTNOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;


{TTDescriptionFunctionality}
Constructor TTDescriptionFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTDescriptionSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTDescriptionFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTDescriptionSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTDescriptionFunctionalityRemoted.TTDescriptionSOAPFunctionality: ITTDescriptionSOAPFunctionality;
begin
if (FTTDescriptionSOAPFunctionality = nil)
  then FTTDescriptionSOAPFunctionality:=GetITTDescriptionSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTDescriptionSOAPFunctionality;
end;
{$ELSE}
function TTDescriptionFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TDescriptionFunctionality}
Constructor TDescriptionFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTDescriptionSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TDescriptionFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTDescriptionSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TDescriptionFunctionalityRemoted.TDescriptionSOAPFunctionality: ITDescriptionSOAPFunctionality;
begin
if (FTDescriptionSOAPFunctionality = nil)
  then FTDescriptionSOAPFunctionality:=GetITDescriptionSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTDescriptionSOAPFunctionality;
end;
{$ELSE}
function TDescriptionFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TDescriptionFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDescriptionSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDescriptionFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TDescriptionFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDescriptionSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDescriptionFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

procedure TDescriptionFunctionalityRemoted.GetValue(out vText: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TDescriptionSOAPFunctionality.GetValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   vText);
{$ELSE}
TDescriptionFunctionality_GetValue(ServerFunctionality(),   vText);
{$ENDIF}
end;

procedure TDescriptionFunctionalityRemoted.SetValue(NewValue: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TDescriptionSOAPFunctionality.SetValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewValue);
{$ELSE}
TDescriptionFunctionality_SetValue(ServerFunctionality(),   NewValue);
{$ENDIF}
end;


{TTImageFunctionality}
Constructor TTImageFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTImageSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTImageFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTImageSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTImageFunctionalityRemoted.TTImageSOAPFunctionality: ITTImageSOAPFunctionality;
begin
if (FTTImageSOAPFunctionality = nil)
  then FTTImageSOAPFunctionality:=GetITTImageSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTImageSOAPFunctionality;
end;
{$ELSE}
function TTImageFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TImageFunctionality}
Constructor TImageFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTImageSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TImageFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTImageSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TImageFunctionalityRemoted.TImageSOAPFunctionality: ITImageSOAPFunctionality;
begin
if (FTImageSOAPFunctionality = nil)
  then FTImageSOAPFunctionality:=GetITImageSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTImageSOAPFunctionality;
end;
{$ELSE}
function TImageFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TImageFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TImageSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TImageFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TImageFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TImageSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TImageFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TImageFunctionalityRemoted.GetDATAType1: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TImageSOAPFunctionality.GetDATAType1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TImageFunctionality_GetDATAType1(ServerFunctionality());
{$ENDIF}
end;

procedure TImageFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TImageSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TImageFunctionality_GetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TImageFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: Integer);
begin
{$IFNDEF EmbeddedServer}
TImageSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
{$ELSE}
TImageFunctionality_SetDATA(ServerFunctionality(),   DATAStream,DATAType);
{$ENDIF}
end;

procedure TImageFunctionalityRemoted.GetBitmapDATA(out BMPDATAStream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TImageSOAPFunctionality.GetBitmapDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   BMPDATAStream);
{$ELSE}
TImageFunctionality_GetBitmapDATA(ServerFunctionality(),   BMPDATAStream);
{$ENDIF}
end;


{TTWellFunctionality}
Constructor TTWellFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTWellSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTWellFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTWellSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTWellFunctionalityRemoted.TTWellSOAPFunctionality: ITTWellSOAPFunctionality;
begin
if (FTTWellSOAPFunctionality = nil)
  then FTTWellSOAPFunctionality:=GetITTWellSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTWellSOAPFunctionality;
end;
{$ELSE}
function TTWellFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TWellFunctionality}
Constructor TWellFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTWellSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TWellFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTWellSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TWellFunctionalityRemoted.TWellSOAPFunctionality: ITWellSOAPFunctionality;
begin
if (FTWellSOAPFunctionality = nil)
  then FTWellSOAPFunctionality:=GetITWellSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTWellSOAPFunctionality;
end;
{$ELSE}
function TWellFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TWellFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TWellSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TWellFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TWellFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TWellSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TWellFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTTLFFunctionality}
Constructor TTTLFFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTTLFSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTTLFFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTTLFSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTTLFFunctionalityRemoted.TTTLFSOAPFunctionality: ITTTLFSOAPFunctionality;
begin
if (FTTTLFSOAPFunctionality = nil)
  then FTTTLFSOAPFunctionality:=GetITTTLFSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTLFSOAPFunctionality;
end;
{$ELSE}
function TTTLFFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTTLFFunctionalityRemoted.GetIDInstanceByNumber(out ID: integer; const Number: integer);
begin
{$IFNDEF EmbeddedServer}
TTTLFSOAPFunctionality.GetIDInstanceByNumber(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   ID,Number);
{$ELSE}
TTTLFFunctionality_GetIDInstanceByNumber(ServerFunctionality(),   ID,Number);
{$ENDIF}
end;


{TTLFFunctionality}
Constructor TTLFFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTTLFSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTLFFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTLFSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTLFFunctionalityRemoted.TTLFSOAPFunctionality: ITTLFSOAPFunctionality;
begin
if (FTTLFSOAPFunctionality = nil)
  then FTTLFSOAPFunctionality:=GetITTLFSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTLFSOAPFunctionality;
end;
{$ELSE}
function TTLFFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTLFFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TTLFFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function TTLFFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TTLFFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TTLFFunctionalityRemoted.Number: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.Number(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_Number(ServerFunctionality());
{$ENDIF}
end;

function TTLFFunctionalityRemoted.LocalELockExist: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.LocalELockExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_LocalELockExist(ServerFunctionality());
{$ENDIF}
end;

function TTLFFunctionalityRemoted.GlobalELockExist: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.GlobalELockExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_GlobalELockExist(ServerFunctionality());
{$ENDIF}
end;

function TTLFFunctionalityRemoted.GetFinishDevice(out vidTObj,vidObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.GetFinishDevice(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   vidTObj,vidObj);
{$ELSE}
Result:=TTLFFunctionality_GetFinishDevice(ServerFunctionality(),   vidTObj,vidObj);
{$ENDIF}
end;

function TTLFFunctionalityRemoted.IsDamaged: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.IsDamaged(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_IsDamaged(ServerFunctionality());
{$ENDIF}
end;

function TTLFFunctionalityRemoted.idDamage: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.idDamage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_idDamage(ServerFunctionality());
{$ENDIF}
end;

function TTLFFunctionalityRemoted.getDamage_TimeNote: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.getDamage_TimeNote(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_getDamage_TimeNote(ServerFunctionality());
{$ENDIF}
end;

procedure TTLFFunctionalityRemoted.setDamage_TimeNote(Value: TDateTime);
begin
{$IFNDEF EmbeddedServer}
TTLFSOAPFunctionality.setDamage_TimeNote(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTLFFunctionality_setDamage_TimeNote(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTLFFunctionalityRemoted.getDamage_Note: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.getDamage_Note(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_getDamage_Note(ServerFunctionality());
{$ENDIF}
end;

procedure TTLFFunctionalityRemoted.setDamage_Note(Value: string);
begin
{$IFNDEF EmbeddedServer}
TTLFSOAPFunctionality.setDamage_Note(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTLFFunctionality_setDamage_Note(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTLFFunctionalityRemoted.getDamage_Measured: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.getDamage_Measured(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_getDamage_Measured(ServerFunctionality());
{$ENDIF}
end;

procedure TTLFFunctionalityRemoted.setDamage_Measured(Value: string);
begin
{$IFNDEF EmbeddedServer}
TTLFSOAPFunctionality.setDamage_Measured(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTLFFunctionality_setDamage_Measured(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTLFFunctionalityRemoted.getDamage_Acceptor: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.getDamage_Acceptor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_getDamage_Acceptor(ServerFunctionality());
{$ENDIF}
end;

procedure TTLFFunctionalityRemoted.setDamage_Acceptor(Value: string);
begin
{$IFNDEF EmbeddedServer}
TTLFSOAPFunctionality.setDamage_Acceptor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTLFFunctionality_setDamage_Acceptor(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTLFFunctionalityRemoted.getDamage_TimeBegRepair: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.getDamage_TimeBegRepair(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_getDamage_TimeBegRepair(ServerFunctionality());
{$ENDIF}
end;

procedure TTLFFunctionalityRemoted.setDamage_TimeBegRepair(Value: TDateTime);
begin
{$IFNDEF EmbeddedServer}
TTLFSOAPFunctionality.setDamage_TimeBegRepair(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTLFFunctionality_setDamage_TimeBegRepair(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTLFFunctionalityRemoted.getDamage_TimeEndRepair: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.getDamage_TimeEndRepair(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_getDamage_TimeEndRepair(ServerFunctionality());
{$ENDIF}
end;

procedure TTLFFunctionalityRemoted.setDamage_TimeEndRepair(Value: TDateTime);
begin
{$IFNDEF EmbeddedServer}
TTLFSOAPFunctionality.setDamage_TimeEndRepair(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTLFFunctionality_setDamage_TimeEndRepair(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTLFFunctionalityRemoted.getDamage_Damage: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.getDamage_Damage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_getDamage_Damage(ServerFunctionality());
{$ENDIF}
end;

procedure TTLFFunctionalityRemoted.setDamage_Damage(Value: string);
begin
{$IFNDEF EmbeddedServer}
TTLFSOAPFunctionality.setDamage_Damage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTLFFunctionality_setDamage_Damage(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTLFFunctionalityRemoted.getDamage_Executor: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.getDamage_Executor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_getDamage_Executor(ServerFunctionality());
{$ENDIF}
end;

procedure TTLFFunctionalityRemoted.setDamage_Executor(Value: string);
begin
{$IFNDEF EmbeddedServer}
TTLFSOAPFunctionality.setDamage_Executor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTLFFunctionality_setDamage_Executor(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TTLFFunctionalityRemoted.getDamage_Remarks: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTLFSOAPFunctionality.getDamage_Remarks(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TTLFFunctionality_getDamage_Remarks(ServerFunctionality());
{$ENDIF}
end;

procedure TTLFFunctionalityRemoted.setDamage_Remarks(Value: string);
begin
{$IFNDEF EmbeddedServer}
TTLFSOAPFunctionality.setDamage_Remarks(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TTLFFunctionality_setDamage_Remarks(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TTLFFunctionalityRemoted.WriteEvent(const Event: string; const EventTime: TDateTime);
begin
{$IFNDEF EmbeddedServer}
TTLFSOAPFunctionality.WriteEvent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Event,EventTime);
{$ELSE}
TTLFFunctionality_WriteEvent(ServerFunctionality(),   Event,EventTime);
{$ENDIF}
end;


{TTBoxFunctionality}
Constructor TTBoxFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTBoxSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTBoxFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTBoxSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTBoxFunctionalityRemoted.TTBoxSOAPFunctionality: ITTBoxSOAPFunctionality;
begin
if (FTTBoxSOAPFunctionality = nil)
  then FTTBoxSOAPFunctionality:=GetITTBoxSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTBoxSOAPFunctionality;
end;
{$ELSE}
function TTBoxFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TBoxFunctionality}
Constructor TBoxFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTBoxSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TBoxFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTBoxSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TBoxFunctionalityRemoted.TBoxSOAPFunctionality: ITBoxSOAPFunctionality;
begin
if (FTBoxSOAPFunctionality = nil)
  then FTBoxSOAPFunctionality:=GetITBoxSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTBoxSOAPFunctionality;
end;
{$ELSE}
function TBoxFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TBoxFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TBoxSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TBoxFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function TBoxFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TBoxSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TBoxFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TBoxFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TBoxSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TBoxFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTCableBoxFunctionality}
Constructor TTCableBoxFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCableBoxSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCableBoxFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCableBoxSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCableBoxFunctionalityRemoted.TTCableBoxSOAPFunctionality: ITTCableBoxSOAPFunctionality;
begin
if (FTTCableBoxSOAPFunctionality = nil)
  then FTTCableBoxSOAPFunctionality:=GetITTCableBoxSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCableBoxSOAPFunctionality;
end;
{$ELSE}
function TTCableBoxFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TCableBoxFunctionality}
Constructor TCableBoxFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCableBoxSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCableBoxFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCableBoxSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCableBoxFunctionalityRemoted.TCableBoxSOAPFunctionality: ITCableBoxSOAPFunctionality;
begin
if (FTCableBoxSOAPFunctionality = nil)
  then FTCableBoxSOAPFunctionality:=GetITCableBoxSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCableBoxSOAPFunctionality;
end;
{$ELSE}
function TCableBoxFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TCableBoxFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCableBoxSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCableBoxFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TCableBoxFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCableBoxSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCableBoxFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTDistrLineFunctionality}
Constructor TTDistrLineFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTDistrLineSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTDistrLineFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTDistrLineSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTDistrLineFunctionalityRemoted.TTDistrLineSOAPFunctionality: ITTDistrLineSOAPFunctionality;
begin
if (FTTDistrLineSOAPFunctionality = nil)
  then FTTDistrLineSOAPFunctionality:=GetITTDistrLineSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTDistrLineSOAPFunctionality;
end;
{$ELSE}
function TTDistrLineFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TDistrLineFunctionality}
Constructor TDistrLineFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTDistrLineSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TDistrLineFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTDistrLineSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TDistrLineFunctionalityRemoted.TDistrLineSOAPFunctionality: ITDistrLineSOAPFunctionality;
begin
if (FTDistrLineSOAPFunctionality = nil)
  then FTDistrLineSOAPFunctionality:=GetITDistrLineSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTDistrLineSOAPFunctionality;
end;
{$ELSE}
function TDistrLineFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TDistrLineFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TDistrLineSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TDistrLineFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function TDistrLineFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDistrLineSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDistrLineFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TDistrLineFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDistrLineSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDistrLineFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTClientFunctionality}
Constructor TTClientFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTClientSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTClientFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTClientSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTClientFunctionalityRemoted.TTClientSOAPFunctionality: ITTClientSOAPFunctionality;
begin
if (FTTClientSOAPFunctionality = nil)
  then FTTClientSOAPFunctionality:=GetITTClientSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTClientSOAPFunctionality;
end;
{$ELSE}
function TTClientFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTClientFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTClientSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
{$ELSE}
TTClientFunctionality_GetInstanceList(ServerFunctionality(),   List);
{$ENDIF}
end;


{TClientFunctionality}
Constructor TClientFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTClientSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TClientFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTClientSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TClientFunctionalityRemoted.TClientSOAPFunctionality: ITClientSOAPFunctionality;
begin
if (FTClientSOAPFunctionality = nil)
  then FTClientSOAPFunctionality:=GetITClientSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTClientSOAPFunctionality;
end;
{$ELSE}
function TClientFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TClientFunctionalityRemoted.GetDebet(out Value: Double): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TClientSOAPFunctionality.GetDebet(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
Result:=TClientFunctionality_GetDebet(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TClientFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TClientSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TClientFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TClientFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TClientSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TClientFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTHouseFunctionality}
Constructor TTHouseFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTHouseSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTHouseFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTHouseSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTHouseFunctionalityRemoted.TTHouseSOAPFunctionality: ITTHouseSOAPFunctionality;
begin
if (FTTHouseSOAPFunctionality = nil)
  then FTTHouseSOAPFunctionality:=GetITTHouseSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHouseSOAPFunctionality;
end;
{$ELSE}
function TTHouseFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{THouseFunctionality}
Constructor THouseFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTHouseSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor THouseFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTHouseSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function THouseFunctionalityRemoted.THouseSOAPFunctionality: ITHouseSOAPFunctionality;
begin
if (FTHouseSOAPFunctionality = nil)
  then FTHouseSOAPFunctionality:=GetITHouseSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHouseSOAPFunctionality;
end;
{$ELSE}
function THouseFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function THouseFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=THouseSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=THouseFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function THouseFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THouseSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THouseFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function THouseFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THouseSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THouseFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTCommNodeFunctionality}
Constructor TTCommNodeFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCommNodeSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCommNodeFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCommNodeSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCommNodeFunctionalityRemoted.TTCommNodeSOAPFunctionality: ITTCommNodeSOAPFunctionality;
begin
if (FTTCommNodeSOAPFunctionality = nil)
  then FTTCommNodeSOAPFunctionality:=GetITTCommNodeSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCommNodeSOAPFunctionality;
end;
{$ELSE}
function TTCommNodeFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TCommNodeFunctionality}
Constructor TCommNodeFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCommNodeSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCommNodeFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCommNodeSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCommNodeFunctionalityRemoted.TCommNodeSOAPFunctionality: ITCommNodeSOAPFunctionality;
begin
if (FTCommNodeSOAPFunctionality = nil)
  then FTCommNodeSOAPFunctionality:=GetITCommNodeSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCommNodeSOAPFunctionality;
end;
{$ELSE}
function TCommNodeFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TCommNodeFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCommNodeSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCommNodeFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TCommNodeFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCommNodeSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCommNodeFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTCrossFunctionality}
Constructor TTCrossFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCrossSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCrossFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCrossSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCrossFunctionalityRemoted.TTCrossSOAPFunctionality: ITTCrossSOAPFunctionality;
begin
if (FTTCrossSOAPFunctionality = nil)
  then FTTCrossSOAPFunctionality:=GetITTCrossSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCrossSOAPFunctionality;
end;
{$ELSE}
function TTCrossFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TCrossFunctionality}
Constructor TCrossFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCrossSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCrossFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCrossSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCrossFunctionalityRemoted.TCrossSOAPFunctionality: ITCrossSOAPFunctionality;
begin
if (FTCrossSOAPFunctionality = nil)
  then FTCrossSOAPFunctionality:=GetITCrossSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCrossSOAPFunctionality;
end;
{$ELSE}
function TCrossFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TCrossFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCrossSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCrossFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TCrossFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCrossSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCrossFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTCaseFunctionality}
Constructor TTCaseFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCaseSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCaseFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCaseSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCaseFunctionalityRemoted.TTCaseSOAPFunctionality: ITTCaseSOAPFunctionality;
begin
if (FTTCaseSOAPFunctionality = nil)
  then FTTCaseSOAPFunctionality:=GetITTCaseSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCaseSOAPFunctionality;
end;
{$ELSE}
function TTCaseFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TCaseFunctionality}
Constructor TCaseFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCaseSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCaseFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCaseSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCaseFunctionalityRemoted.TCaseSOAPFunctionality: ITCaseSOAPFunctionality;
begin
if (FTCaseSOAPFunctionality = nil)
  then FTCaseSOAPFunctionality:=GetITCaseSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCaseSOAPFunctionality;
end;
{$ELSE}
function TCaseFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TCaseFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCaseSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCaseFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TCaseFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCaseSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCaseFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTStreetFunctionality}
Constructor TTStreetFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTStreetSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTStreetFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTStreetSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTStreetFunctionalityRemoted.TTStreetSOAPFunctionality: ITTStreetSOAPFunctionality;
begin
if (FTTStreetSOAPFunctionality = nil)
  then FTTStreetSOAPFunctionality:=GetITTStreetSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTStreetSOAPFunctionality;
end;
{$ELSE}
function TTStreetFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TStreetFunctionality}
Constructor TStreetFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTStreetSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TStreetFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTStreetSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TStreetFunctionalityRemoted.TStreetSOAPFunctionality: ITStreetSOAPFunctionality;
begin
if (FTStreetSOAPFunctionality = nil)
  then FTStreetSOAPFunctionality:=GetITStreetSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTStreetSOAPFunctionality;
end;
{$ELSE}
function TStreetFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TStreetFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TStreetSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TStreetFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TStreetFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TStreetSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TStreetFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTOtherObjFunctionality}
Constructor TTOtherObjFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTOtherObjSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTOtherObjFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTOtherObjSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTOtherObjFunctionalityRemoted.TTOtherObjSOAPFunctionality: ITTOtherObjSOAPFunctionality;
begin
if (FTTOtherObjSOAPFunctionality = nil)
  then FTTOtherObjSOAPFunctionality:=GetITTOtherObjSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOtherObjSOAPFunctionality;
end;
{$ELSE}
function TTOtherObjFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TOtherObjFunctionality}
Constructor TOtherObjFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTOtherObjSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TOtherObjFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTOtherObjSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TOtherObjFunctionalityRemoted.TOtherObjSOAPFunctionality: ITOtherObjSOAPFunctionality;
begin
if (FTOtherObjSOAPFunctionality = nil)
  then FTOtherObjSOAPFunctionality:=GetITOtherObjSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOtherObjSOAPFunctionality;
end;
{$ELSE}
function TOtherObjFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TOtherObjFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOtherObjSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOtherObjFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TOtherObjFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOtherObjSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOtherObjFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTSpanFunctionality}
Constructor TTSpanFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTSpanSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTSpanFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTSpanSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTSpanFunctionalityRemoted.TTSpanSOAPFunctionality: ITTSpanSOAPFunctionality;
begin
if (FTTSpanSOAPFunctionality = nil)
  then FTTSpanSOAPFunctionality:=GetITTSpanSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTSpanSOAPFunctionality;
end;
{$ELSE}
function TTSpanFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TSpanFunctionality}
Constructor TSpanFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTSpanSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TSpanFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTSpanSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TSpanFunctionalityRemoted.TSpanSOAPFunctionality: ITSpanSOAPFunctionality;
begin
if (FTSpanSOAPFunctionality = nil)
  then FTSpanSOAPFunctionality:=GetITSpanSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTSpanSOAPFunctionality;
end;
{$ELSE}
function TSpanFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TSpanFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSpanSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSpanFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TSpanFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TSpanSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TSpanFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTChanelFunctionality}
Constructor TTChanelFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTChanelSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTChanelFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTChanelSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTChanelFunctionalityRemoted.TTChanelSOAPFunctionality: ITTChanelSOAPFunctionality;
begin
if (FTTChanelSOAPFunctionality = nil)
  then FTTChanelSOAPFunctionality:=GetITTChanelSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTChanelSOAPFunctionality;
end;
{$ELSE}
function TTChanelFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TChanelFunctionality}
Constructor TChanelFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTChanelSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TChanelFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTChanelSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TChanelFunctionalityRemoted.TChanelSOAPFunctionality: ITChanelSOAPFunctionality;
begin
if (FTChanelSOAPFunctionality = nil)
  then FTChanelSOAPFunctionality:=GetITChanelSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTChanelSOAPFunctionality;
end;
{$ELSE}
function TChanelFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TChanelFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TChanelSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TChanelFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function TChanelFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TChanelSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TChanelFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TChanelFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TChanelSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TChanelFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTHandHoldFunctionality}
Constructor TTHandHoldFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTHandHoldSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTHandHoldFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTHandHoldSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTHandHoldFunctionalityRemoted.TTHandHoldSOAPFunctionality: ITTHandHoldSOAPFunctionality;
begin
if (FTTHandHoldSOAPFunctionality = nil)
  then FTTHandHoldSOAPFunctionality:=GetITTHandHoldSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHandHoldSOAPFunctionality;
end;
{$ELSE}
function TTHandHoldFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{THandHoldFunctionality}
Constructor THandHoldFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTHandHoldSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor THandHoldFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTHandHoldSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function THandHoldFunctionalityRemoted.THandHoldSOAPFunctionality: ITHandHoldSOAPFunctionality;
begin
if (FTHandHoldSOAPFunctionality = nil)
  then FTHandHoldSOAPFunctionality:=GetITHandHoldSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHandHoldSOAPFunctionality;
end;
{$ELSE}
function THandHoldFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function THandHoldFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THandHoldSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THandHoldFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function THandHoldFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=THandHoldSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=THandHoldFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTLineDistFunctionality}
Constructor TTLineDistFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTLineDistSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTLineDistFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTLineDistSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTLineDistFunctionalityRemoted.TTLineDistSOAPFunctionality: ITTLineDistSOAPFunctionality;
begin
if (FTTLineDistSOAPFunctionality = nil)
  then FTTLineDistSOAPFunctionality:=GetITTLineDistSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTLineDistSOAPFunctionality;
end;
{$ELSE}
function TTLineDistFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TLineDistFunctionality}
Constructor TLineDistFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTLineDistSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TLineDistFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTLineDistSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TLineDistFunctionalityRemoted.TLineDistSOAPFunctionality: ITLineDistSOAPFunctionality;
begin
if (FTLineDistSOAPFunctionality = nil)
  then FTLineDistSOAPFunctionality:=GetITLineDistSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTLineDistSOAPFunctionality;
end;
{$ELSE}
function TLineDistFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TLineDistFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TLineDistSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TLineDistFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TLineDistFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TLineDistSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TLineDistFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTMuffFunctionality}
Constructor TTMuffFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTMuffSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTMuffFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTMuffSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTMuffFunctionalityRemoted.TTMuffSOAPFunctionality: ITTMuffSOAPFunctionality;
begin
if (FTTMuffSOAPFunctionality = nil)
  then FTTMuffSOAPFunctionality:=GetITTMuffSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMuffSOAPFunctionality;
end;
{$ELSE}
function TTMuffFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TMuffFunctionality}
Constructor TMuffFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTMuffSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TMuffFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTMuffSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TMuffFunctionalityRemoted.TMuffSOAPFunctionality: ITMuffSOAPFunctionality;
begin
if (FTMuffSOAPFunctionality = nil)
  then FTMuffSOAPFunctionality:=GetITMuffSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMuffSOAPFunctionality;
end;
{$ELSE}
function TMuffFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TMuffFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMuffSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMuffFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TMuffFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TMuffSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TMuffFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTOfferFunctionality}
Constructor TTOfferFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTOfferSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTOfferFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTOfferSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTOfferFunctionalityRemoted.TTOfferSOAPFunctionality: ITTOfferSOAPFunctionality;
begin
if (FTTOfferSOAPFunctionality = nil)
  then FTTOfferSOAPFunctionality:=GetITTOfferSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOfferSOAPFunctionality;
end;
{$ELSE}
function TTOfferFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTOfferFunctionalityRemoted.GetOfferByHumanID(const HumanID: integer; out idOffer: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTOfferSOAPFunctionality.GetOfferByHumanID(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   HumanID,idOffer);
{$ELSE}
Result:=TTOfferFunctionality_GetOfferByHumanID(ServerFunctionality(),   HumanID,idOffer);
{$ENDIF}
end;


{TOfferFunctionality}
Constructor TOfferFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTOfferSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TOfferFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTOfferSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TOfferFunctionalityRemoted.TOfferSOAPFunctionality: ITOfferSOAPFunctionality;
begin
if (FTOfferSOAPFunctionality = nil)
  then FTOfferSOAPFunctionality:=GetITOfferSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOfferSOAPFunctionality;
end;
{$ELSE}
function TOfferFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TOfferFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TOfferFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function TOfferFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TOfferFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TOfferSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOfferFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOfferFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TOfferFunctionalityRemoted.getSchedule: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferSOAPFunctionality.getSchedule(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferFunctionality_getSchedule(ServerFunctionality());
{$ENDIF}
end;

procedure TOfferFunctionalityRemoted.setSchedule(Value: string);
begin
{$IFNDEF EmbeddedServer}
TOfferSOAPFunctionality.setSchedule(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOfferFunctionality_setSchedule(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOfferFunctionalityRemoted.getPassword: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferSOAPFunctionality.getPassword(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferFunctionality_getPassword(ServerFunctionality());
{$ENDIF}
end;

procedure TOfferFunctionalityRemoted.setPassword(Value: string);
begin
{$IFNDEF EmbeddedServer}
TOfferSOAPFunctionality.setPassword(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOfferFunctionality_setPassword(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOfferFunctionalityRemoted.getContactTLF: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferSOAPFunctionality.getContactTLF(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferFunctionality_getContactTLF(ServerFunctionality());
{$ENDIF}
end;

procedure TOfferFunctionalityRemoted.setContactTLF(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TOfferSOAPFunctionality.setContactTLF(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOfferFunctionality_setContactTLF(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TOfferFunctionalityRemoted.getLastUpdated: TDateTime;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferSOAPFunctionality.getLastUpdated(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferFunctionality_getLastUpdated(ServerFunctionality());
{$ENDIF}
end;

procedure TOfferFunctionalityRemoted.setLastUpdated(Value: TDateTime);
begin
{$IFNDEF EmbeddedServer}
TOfferSOAPFunctionality.setLastUpdated(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TOfferFunctionality_setLastUpdated(ServerFunctionality(),   Value);
{$ENDIF}
end;

procedure TOfferFunctionalityRemoted.LoadDATAFromStream(Stream: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TOfferSOAPFunctionality.LoadDATAFromStream(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Stream);
{$ELSE}
TOfferFunctionality_LoadDATAFromStream(ServerFunctionality(),   Stream);
{$ENDIF}
end;

function TOfferFunctionalityRemoted.UserID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferSOAPFunctionality.UserID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferFunctionality_UserID(ServerFunctionality());
{$ENDIF}
end;

function TOfferFunctionalityRemoted.UID: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferSOAPFunctionality.UID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferFunctionality_UID(ServerFunctionality());
{$ENDIF}
end;

function TOfferFunctionalityRemoted.AddressStr: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferSOAPFunctionality.AddressStr(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferFunctionality_AddressStr(ServerFunctionality());
{$ENDIF}
end;

function TOfferFunctionalityRemoted.Goods_Insert: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TOfferSOAPFunctionality.Goods_Insert(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TOfferFunctionality_Goods_Insert(ServerFunctionality());
{$ENDIF}
end;

procedure TOfferFunctionalityRemoted.Goods_GetList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TOfferSOAPFunctionality.Goods_GetList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
{$ELSE}
TOfferFunctionality_Goods_GetList(ServerFunctionality(),   List);
{$ENDIF}
end;

procedure TOfferFunctionalityRemoted.Goods_Remove(const idOfferGoods: integer);
begin
{$IFNDEF EmbeddedServer}
TOfferSOAPFunctionality.Goods_Remove(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idOfferGoods);
{$ELSE}
TOfferFunctionality_Goods_Remove(ServerFunctionality(),   idOfferGoods);
{$ENDIF}
end;

procedure TOfferFunctionalityRemoted.Goods_Clear;
begin
{$IFNDEF EmbeddedServer}
TOfferSOAPFunctionality.Goods_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TOfferFunctionality_Goods_Clear(ServerFunctionality());
{$ENDIF}
end;


{TTDemandFunctionality}
Constructor TTDemandFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTDemandSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTDemandFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTDemandSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTDemandFunctionalityRemoted.TTDemandSOAPFunctionality: ITTDemandSOAPFunctionality;
begin
if (FTTDemandSOAPFunctionality = nil)
  then FTTDemandSOAPFunctionality:=GetITTDemandSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTDemandSOAPFunctionality;
end;
{$ELSE}
function TTDemandFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TDemandFunctionality}
Constructor TDemandFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTDemandSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TDemandFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTDemandSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TDemandFunctionalityRemoted.TDemandSOAPFunctionality: ITDemandSOAPFunctionality;
begin
if (FTDemandSOAPFunctionality = nil)
  then FTDemandSOAPFunctionality:=GetITDemandSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTDemandSOAPFunctionality;
end;
{$ELSE}
function TDemandFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TDemandFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TDemandSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TDemandFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function TDemandFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDemandSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDemandFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TDemandFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TDemandSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TDemandFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTCommLineFunctionality}
Constructor TTCommLineFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCommLineSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCommLineFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCommLineSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCommLineFunctionalityRemoted.TTCommLineSOAPFunctionality: ITTCommLineSOAPFunctionality;
begin
if (FTTCommLineSOAPFunctionality = nil)
  then FTTCommLineSOAPFunctionality:=GetITTCommLineSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCommLineSOAPFunctionality;
end;
{$ELSE}
function TTCommLineFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TCommLineFunctionality}
Constructor TCommLineFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCommLineSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCommLineFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCommLineSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCommLineFunctionalityRemoted.TCommLineSOAPFunctionality: ITCommLineSOAPFunctionality;
begin
if (FTCommLineSOAPFunctionality = nil)
  then FTCommLineSOAPFunctionality:=GetITCommLineSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCommLineSOAPFunctionality;
end;
{$ELSE}
function TCommLineFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TCommLineFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCommLineSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TCommLineFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

function TCommLineFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCommLineSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCommLineFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TCommLineFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCommLineSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCommLineFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTGoodsFunctionality}
Constructor TTGoodsFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTGoodsSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTGoodsFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTGoodsSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTGoodsFunctionalityRemoted.TTGoodsSOAPFunctionality: ITTGoodsSOAPFunctionality;
begin
if (FTTGoodsSOAPFunctionality = nil)
  then FTTGoodsSOAPFunctionality:=GetITTGoodsSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTGoodsSOAPFunctionality;
end;
{$ELSE}
function TTGoodsFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTGoodsFunctionalityRemoted.GetInstanceListContainingContext(const Context: string; out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTGoodsSOAPFunctionality.GetInstanceListContainingContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Context,List);
{$ELSE}
TTGoodsFunctionality_GetInstanceListContainingContext(ServerFunctionality(),   Context,List);
{$ENDIF}
end;

function TTGoodsFunctionalityRemoted.IsInstanceExist(const pName: string; out idGoods: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTGoodsSOAPFunctionality.IsInstanceExist(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pName,idGoods);
{$ELSE}
Result:=TTGoodsFunctionality_IsInstanceExist(ServerFunctionality(),   pName,idGoods);
{$ENDIF}
end;


{TGoodsFunctionality}
Constructor TGoodsFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTGoodsSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TGoodsFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTGoodsSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TGoodsFunctionalityRemoted.TGoodsSOAPFunctionality: ITGoodsSOAPFunctionality;
begin
if (FTGoodsSOAPFunctionality = nil)
  then FTGoodsSOAPFunctionality:=GetITGoodsSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTGoodsSOAPFunctionality;
end;
{$ELSE}
function TGoodsFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TGoodsFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGoodsSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGoodsFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TGoodsFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TGoodsSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TGoodsFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TGoodsFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGoodsSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGoodsFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TGoodsFunctionalityRemoted.StdAmount: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TGoodsSOAPFunctionality.StdAmount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGoodsFunctionality_StdAmount(ServerFunctionality());
{$ENDIF}
end;

function TGoodsFunctionalityRemoted.StdMeasureUnit: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TGoodsSOAPFunctionality.StdMeasureUnit(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TGoodsFunctionality_StdMeasureUnit(ServerFunctionality());
{$ENDIF}
end;


{TTCollectionFunctionality}
Constructor TTCollectionFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTCollectionSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTCollectionFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTCollectionSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTCollectionFunctionalityRemoted.TTCollectionSOAPFunctionality: ITTCollectionSOAPFunctionality;
begin
if (FTTCollectionSOAPFunctionality = nil)
  then FTTCollectionSOAPFunctionality:=GetITTCollectionSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCollectionSOAPFunctionality;
end;
{$ELSE}
function TTCollectionFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TCollectionFunctionality}
Constructor TCollectionFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTCollectionSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TCollectionFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTCollectionSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TCollectionFunctionalityRemoted.TCollectionSOAPFunctionality: ITCollectionSOAPFunctionality;
begin
if (FTCollectionSOAPFunctionality = nil)
  then FTCollectionSOAPFunctionality:=GetITCollectionSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCollectionSOAPFunctionality;
end;
{$ELSE}
function TCollectionFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TCollectionFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCollectionSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCollectionFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TCollectionFunctionalityRemoted.setName(const Value: string);
begin
{$IFNDEF EmbeddedServer}
TCollectionSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
{$ELSE}
TCollectionFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TCollectionFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TCollectionSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
Result:=TCollectionFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TCollectionFunctionalityRemoted.InsertItem(const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TCollectionSOAPFunctionality.InsertItem(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTItem,idItem,Alias,ListOrder);
{$ELSE}
Result:=TCollectionFunctionality_InsertItem(ServerFunctionality(),   idTItem,idItem,Alias,ListOrder);
{$ENDIF}
end;

procedure TCollectionFunctionalityRemoted.RemoveItem(const id: integer);
begin
{$IFNDEF EmbeddedServer}
TCollectionSOAPFunctionality.RemoveItem(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   id);
{$ELSE}
TCollectionFunctionality_RemoveItem(ServerFunctionality(),   id);
{$ENDIF}
end;

procedure TCollectionFunctionalityRemoted.Item_ChangeAlias(const id: integer; const pAlias: string);
begin
{$IFNDEF EmbeddedServer}
TCollectionSOAPFunctionality.Item_ChangeAlias(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   id,pAlias);
{$ELSE}
TCollectionFunctionality_Item_ChangeAlias(ServerFunctionality(),   id,pAlias);
{$ENDIF}
end;

procedure TCollectionFunctionalityRemoted.Item_ChangeListOrder(const id: integer; const Order: integer);
begin
{$IFNDEF EmbeddedServer}
TCollectionSOAPFunctionality.Item_ChangeListOrder(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   id,Order);
{$ELSE}
TCollectionFunctionality_Item_ChangeListOrder(ServerFunctionality(),   id,Order);
{$ENDIF}
end;

procedure TCollectionFunctionalityRemoted.RemoveItems;
begin
{$IFNDEF EmbeddedServer}
TCollectionSOAPFunctionality.RemoveItems(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
{$ELSE}
TCollectionFunctionality_RemoveItems(ServerFunctionality());
{$ENDIF}
end;

function TCollectionFunctionalityRemoted.IsItemExist(const idTItem,idItem: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TCollectionSOAPFunctionality.IsItemExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTItem,idItem);
{$ELSE}
Result:=TCollectionFunctionality_IsItemExist(ServerFunctionality(),   idTItem,idItem);
{$ENDIF}
end;

procedure TCollectionFunctionalityRemoted.GetListItems(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TCollectionSOAPFunctionality.GetListItems(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
{$ELSE}
TCollectionFunctionality_GetListItems(ServerFunctionality(),   List);
{$ENDIF}
end;

procedure TCollectionFunctionalityRemoted.SaveListItems(const List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TCollectionSOAPFunctionality.SaveListItems(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
{$ELSE}
TCollectionFunctionality_SaveListItems(ServerFunctionality(),   List);
{$ENDIF}
end;


