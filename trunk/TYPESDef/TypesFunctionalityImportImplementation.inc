//. import types functionality routines implementations

{TTTileServerVisualizationFunctionality}
Constructor TTTileServerVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTTileServerVisualizationSOAPFunctionality:=nil;
end;

Destructor TTTileServerVisualizationFunctionalityRemoted.Destroy;
begin
FTTTileServerVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTTileServerVisualizationFunctionalityRemoted.TTTileServerVisualizationSOAPFunctionality: ITTTileServerVisualizationSOAPFunctionality;
begin
if FTTTileServerVisualizationSOAPFunctionality = nil
  then FTTTileServerVisualizationSOAPFunctionality:=GetITTTileServerVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTileServerVisualizationSOAPFunctionality;
end;


{TTileServerVisualizationFunctionality}
Constructor TTileServerVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTTileServerVisualizationSOAPFunctionality:=nil;
end;

Destructor TTileServerVisualizationFunctionalityRemoted.Destroy;
begin
FTTileServerVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTileServerVisualizationFunctionalityRemoted.TTileServerVisualizationSOAPFunctionality: ITTileServerVisualizationSOAPFunctionality;
begin
if FTTileServerVisualizationSOAPFunctionality = nil
  then FTTileServerVisualizationSOAPFunctionality:=GetITTileServerVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTileServerVisualizationSOAPFunctionality;
end;

function TTileServerVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TTileServerVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TTileServerVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TTileServerVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTileServerVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TTileServerVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTileServerVisualizationFunctionalityRemoted.GetParams(out oWidth: integer; out oHeight: integer);
begin
TTileServerVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oWidth,oHeight);
end;

procedure TTileServerVisualizationFunctionalityRemoted.GetParams1(out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer);
begin
TTileServerVisualizationSOAPFunctionality.GetParams1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oServerType,oServerURL,oServerData,oTileProviderID,oWidth,oHeight);
end;

procedure TTileServerVisualizationFunctionalityRemoted.SetServerType(const Value: integer);
begin
TTileServerVisualizationSOAPFunctionality.SetServerType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TTileServerVisualizationFunctionalityRemoted.SetServerURL(const Value: string);
begin
TTileServerVisualizationSOAPFunctionality.SetServerURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TTileServerVisualizationFunctionalityRemoted.SetServerData(const Data: TByteArray);
begin
TTileServerVisualizationSOAPFunctionality.SetServerData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Data);
end;

procedure TTileServerVisualizationFunctionalityRemoted.GenerateFromImage(DATAStream: TByteArray);
begin
TTileServerVisualizationSOAPFunctionality.GenerateFromImage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

procedure TTileServerVisualizationFunctionalityRemoted.GenerateFromTiles(const TilesFolder: string; const SizePowerOf2: integer);
begin
TTileServerVisualizationSOAPFunctionality.GenerateFromTiles(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TilesFolder,SizePowerOf2);
end;

procedure TTileServerVisualizationFunctionalityRemoted.RegenerateRegionFromLevel(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
TTileServerVisualizationSOAPFunctionality.RegenerateRegionFromLevel(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TTileServerVisualizationFunctionalityRemoted.RegenerateRegion(const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
TTileServerVisualizationSOAPFunctionality.RegenerateRegion(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TTileServerVisualizationFunctionalityRemoted.AddNewLevelAndRegenerate;
begin
TTileServerVisualizationSOAPFunctionality.AddNewLevelAndRegenerate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTileServerVisualizationFunctionalityRemoted.GetLevelsInfo(out Info: TByteArray);
begin
TTileServerVisualizationSOAPFunctionality.GetLevelsInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Info);
end;

procedure TTileServerVisualizationFunctionalityRemoted.Level_GetParams(const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double);
begin
TTileServerVisualizationSOAPFunctionality.Level_GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TTileServerVisualizationFunctionalityRemoted.Level_SetParams(const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double);
begin
TTileServerVisualizationSOAPFunctionality.Level_SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TTileServerVisualizationFunctionalityRemoted.Level_GetSegments(const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray);
begin
TTileServerVisualizationSOAPFunctionality.Level_GetSegments(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TileProviderID,idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
end;

procedure TTileServerVisualizationFunctionalityRemoted.Level_GetSegmentsByIDs(const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray);
begin
TTileServerVisualizationSOAPFunctionality.Level_GetSegmentsByIDs(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,SegmentsIDs,Segments);
end;

procedure TTileServerVisualizationFunctionalityRemoted.Level_GetSegmentsHashes(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray);
begin
TTileServerVisualizationSOAPFunctionality.Level_GetSegmentsHashes(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
end;

procedure TTileServerVisualizationFunctionalityRemoted.Level_SetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray);
begin
TTileServerVisualizationSOAPFunctionality.Level_SetSegments(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
end;

procedure TTileServerVisualizationFunctionalityRemoted.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TTileServerVisualizationSOAPFunctionality.GetCoordinates(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;


{TTMeasurementObjectFunctionality}
Constructor TTMeasurementObjectFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTMeasurementObjectSOAPFunctionality:=nil;
end;

Destructor TTMeasurementObjectFunctionalityRemoted.Destroy;
begin
FTTMeasurementObjectSOAPFunctionality:=nil;
Inherited;
end;

function TTMeasurementObjectFunctionalityRemoted.TTMeasurementObjectSOAPFunctionality: ITTMeasurementObjectSOAPFunctionality;
begin
if FTTMeasurementObjectSOAPFunctionality = nil
  then FTTMeasurementObjectSOAPFunctionality:=GetITTMeasurementObjectSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMeasurementObjectSOAPFunctionality;
end;

function TTMeasurementObjectFunctionalityRemoted.CreateNewInstance(const pName: string; const pDomains: string): integer;
begin
Result:=TTMeasurementObjectSOAPFunctionality.CreateNewInstance(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pName,pDomains);
end;

function TTMeasurementObjectFunctionalityRemoted.CreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
begin
Result:=TTMeasurementObjectSOAPFunctionality.CreateInstanceByGUID(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pGUID,pName,pDomains);
end;

function TTMeasurementObjectFunctionalityRemoted.CheckCreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
begin
Result:=TTMeasurementObjectSOAPFunctionality.CheckCreateInstanceByGUID(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pGUID,pName,pDomains);
end;

procedure TTMeasurementObjectFunctionalityRemoted.GetInstanceListByNameContext(const pName: string; out List: TByteArray);
begin
TTMeasurementObjectSOAPFunctionality.GetInstanceListByNameContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pName,List);
end;

procedure TTMeasurementObjectFunctionalityRemoted.GetInstanceDataByNameContext(const pName: string; const Version: integer; out oData: TByteArray);
begin
TTMeasurementObjectSOAPFunctionality.GetInstanceDataByNameContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pName,Version,oData);
end;

function TTMeasurementObjectFunctionalityRemoted.GetInstanceByGUID(const pGUID: string): integer;
begin
Result:=TTMeasurementObjectSOAPFunctionality.GetInstanceByGUID(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pGUID);
end;

function TTMeasurementObjectFunctionalityRemoted.GetInstanceByGSOMeasurement(const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer;
begin
Result:=TTMeasurementObjectSOAPFunctionality.GetInstanceByGSOMeasurement(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pidGeographServerObject,pMeasurementTimeID);
end;


{TMeasurementObjectFunctionality}
Constructor TMeasurementObjectFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTMeasurementObjectSOAPFunctionality:=nil;
end;

Destructor TMeasurementObjectFunctionalityRemoted.Destroy;
begin
FTMeasurementObjectSOAPFunctionality:=nil;
Inherited;
end;

function TMeasurementObjectFunctionalityRemoted.TMeasurementObjectSOAPFunctionality: ITMeasurementObjectSOAPFunctionality;
begin
if FTMeasurementObjectSOAPFunctionality = nil
  then FTMeasurementObjectSOAPFunctionality:=GetITMeasurementObjectSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMeasurementObjectSOAPFunctionality;
end;

function TMeasurementObjectFunctionalityRemoted.getName: string;
begin
Result:=TMeasurementObjectSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMeasurementObjectFunctionalityRemoted.setName(Value: string);
begin
TMeasurementObjectSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMeasurementObjectFunctionalityRemoted.getHint: string;
begin
Result:=TMeasurementObjectSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMeasurementObjectFunctionalityRemoted.getGUID: string;
begin
Result:=TMeasurementObjectSOAPFunctionality.getGUID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMeasurementObjectFunctionalityRemoted.getDomains: string;
begin
Result:=TMeasurementObjectSOAPFunctionality.getDomains(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMeasurementObjectFunctionalityRemoted.setDomains(Value: string);
begin
TMeasurementObjectSOAPFunctionality.setDomains(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TMeasurementObjectFunctionalityRemoted.GetParams(out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string);
begin
TMeasurementObjectSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oGUID,oidOwner,oName,oDomains);
end;

procedure TMeasurementObjectFunctionalityRemoted.GSOMeasurements_GetList(out List: TByteArray);
begin
TMeasurementObjectSOAPFunctionality.GSOMeasurements_GetList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
end;

procedure TMeasurementObjectFunctionalityRemoted.GSOMeasurements_GetData(const Version: integer; out oData: TByteArray);
begin
TMeasurementObjectSOAPFunctionality.GSOMeasurements_GetData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Version,oData);
end;

procedure TMeasurementObjectFunctionalityRemoted.GSOMeasurements_Item_GetParams(const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);
begin
TMeasurementObjectSOAPFunctionality.GSOMeasurements_Item_GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idMeasurement,oTimeID,oidGeographServerObject,oDataType);
end;

procedure TMeasurementObjectFunctionalityRemoted.GSOMeasurements_Item_GetParams1(const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);
begin
TMeasurementObjectSOAPFunctionality.GSOMeasurements_Item_GetParams1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TimeID,oidGeographServerObject,oDataType);
end;

procedure TMeasurementObjectFunctionalityRemoted.GSOMeasurements_Item_GetData(const idMeasurement: integer; out oData: TByteArray);
begin
TMeasurementObjectSOAPFunctionality.GSOMeasurements_Item_GetData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idMeasurement,oData);
end;

procedure TMeasurementObjectFunctionalityRemoted.GSOMeasurements_Item_GetData1(const TimeID: Double; out oData: TByteArray);
begin
TMeasurementObjectSOAPFunctionality.GSOMeasurements_Item_GetData1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TimeID,oData);
end;


{TTAreaNotificationServerFunctionality}
Constructor TTAreaNotificationServerFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTAreaNotificationServerSOAPFunctionality:=nil;
end;

Destructor TTAreaNotificationServerFunctionalityRemoted.Destroy;
begin
FTTAreaNotificationServerSOAPFunctionality:=nil;
Inherited;
end;

function TTAreaNotificationServerFunctionalityRemoted.TTAreaNotificationServerSOAPFunctionality: ITTAreaNotificationServerSOAPFunctionality;
begin
if FTTAreaNotificationServerSOAPFunctionality = nil
  then FTTAreaNotificationServerSOAPFunctionality:=GetITTAreaNotificationServerSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTAreaNotificationServerSOAPFunctionality;
end;


{TAreaNotificationServerFunctionality}
Constructor TAreaNotificationServerFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTAreaNotificationServerSOAPFunctionality:=nil;
end;

Destructor TAreaNotificationServerFunctionalityRemoted.Destroy;
begin
FTAreaNotificationServerSOAPFunctionality:=nil;
Inherited;
end;

function TAreaNotificationServerFunctionalityRemoted.TAreaNotificationServerSOAPFunctionality: ITAreaNotificationServerSOAPFunctionality;
begin
if FTAreaNotificationServerSOAPFunctionality = nil
  then FTAreaNotificationServerSOAPFunctionality:=GetITAreaNotificationServerSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTAreaNotificationServerSOAPFunctionality;
end;

function TAreaNotificationServerFunctionalityRemoted.getName: string;
begin
Result:=TAreaNotificationServerSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TAreaNotificationServerFunctionalityRemoted.setName(Value: string);
begin
TAreaNotificationServerSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TAreaNotificationServerFunctionalityRemoted.getHint: string;
begin
Result:=TAreaNotificationServerSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TAreaNotificationServerFunctionalityRemoted.getInfo: string;
begin
Result:=TAreaNotificationServerSOAPFunctionality.getInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TAreaNotificationServerFunctionalityRemoted.setInfo(Value: string);
begin
TAreaNotificationServerSOAPFunctionality.setInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTMODELServerVisualizationFunctionality}
Constructor TTMODELServerVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTMODELServerVisualizationSOAPFunctionality:=nil;
end;

Destructor TTMODELServerVisualizationFunctionalityRemoted.Destroy;
begin
FTTMODELServerVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTMODELServerVisualizationFunctionalityRemoted.TTMODELServerVisualizationSOAPFunctionality: ITTMODELServerVisualizationSOAPFunctionality;
begin
if FTTMODELServerVisualizationSOAPFunctionality = nil
  then FTTMODELServerVisualizationSOAPFunctionality:=GetITTMODELServerVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMODELServerVisualizationSOAPFunctionality;
end;


{TMODELServerVisualizationFunctionality}
Constructor TMODELServerVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTMODELServerVisualizationSOAPFunctionality:=nil;
end;

Destructor TMODELServerVisualizationFunctionalityRemoted.Destroy;
begin
FTMODELServerVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TMODELServerVisualizationFunctionalityRemoted.TMODELServerVisualizationSOAPFunctionality: ITMODELServerVisualizationSOAPFunctionality;
begin
if FTMODELServerVisualizationSOAPFunctionality = nil
  then FTMODELServerVisualizationSOAPFunctionality:=GetITMODELServerVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMODELServerVisualizationSOAPFunctionality;
end;

function TMODELServerVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TMODELServerVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TMODELServerVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TMODELServerVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMODELServerVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TMODELServerVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMODELServerVisualizationFunctionalityRemoted.getServerURL: string;
begin
Result:=TMODELServerVisualizationSOAPFunctionality.getServerURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELServerVisualizationFunctionalityRemoted.setServerURL(Value: string);
begin
TMODELServerVisualizationSOAPFunctionality.setServerURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTDoubleVarFunctionality}
Constructor TTDoubleVarFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTDoubleVarSOAPFunctionality:=nil;
end;

Destructor TTDoubleVarFunctionalityRemoted.Destroy;
begin
FTTDoubleVarSOAPFunctionality:=nil;
Inherited;
end;

function TTDoubleVarFunctionalityRemoted.TTDoubleVarSOAPFunctionality: ITTDoubleVarSOAPFunctionality;
begin
if FTTDoubleVarSOAPFunctionality = nil
  then FTTDoubleVarSOAPFunctionality:=GetITTDoubleVarSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTDoubleVarSOAPFunctionality;
end;


{TDoubleVarFunctionality}
Constructor TDoubleVarFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTDoubleVarSOAPFunctionality:=nil;
end;

Destructor TDoubleVarFunctionalityRemoted.Destroy;
begin
FTDoubleVarSOAPFunctionality:=nil;
Inherited;
end;

function TDoubleVarFunctionalityRemoted.TDoubleVarSOAPFunctionality: ITDoubleVarSOAPFunctionality;
begin
if FTDoubleVarSOAPFunctionality = nil
  then FTDoubleVarSOAPFunctionality:=GetITDoubleVarSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTDoubleVarSOAPFunctionality;
end;

function TDoubleVarFunctionalityRemoted.getName: string;
begin
Result:=TDoubleVarSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TDoubleVarFunctionalityRemoted.getHint: string;
begin
Result:=TDoubleVarSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TDoubleVarFunctionalityRemoted.getValue: Double;
begin
Result:=TDoubleVarSOAPFunctionality.getValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TDoubleVarFunctionalityRemoted.setValue(_Value: Double);
begin
TDoubleVarSOAPFunctionality.setValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   _Value);
end;

function TDoubleVarFunctionalityRemoted.getSetTimeStamp: TDateTime;
begin
Result:=TDoubleVarSOAPFunctionality.getSetTimeStamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTInt32VarFunctionality}
Constructor TTInt32VarFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTInt32VarSOAPFunctionality:=nil;
end;

Destructor TTInt32VarFunctionalityRemoted.Destroy;
begin
FTTInt32VarSOAPFunctionality:=nil;
Inherited;
end;

function TTInt32VarFunctionalityRemoted.TTInt32VarSOAPFunctionality: ITTInt32VarSOAPFunctionality;
begin
if FTTInt32VarSOAPFunctionality = nil
  then FTTInt32VarSOAPFunctionality:=GetITTInt32VarSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTInt32VarSOAPFunctionality;
end;


{TInt32VarFunctionality}
Constructor TInt32VarFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTInt32VarSOAPFunctionality:=nil;
end;

Destructor TInt32VarFunctionalityRemoted.Destroy;
begin
FTInt32VarSOAPFunctionality:=nil;
Inherited;
end;

function TInt32VarFunctionalityRemoted.TInt32VarSOAPFunctionality: ITInt32VarSOAPFunctionality;
begin
if FTInt32VarSOAPFunctionality = nil
  then FTInt32VarSOAPFunctionality:=GetITInt32VarSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTInt32VarSOAPFunctionality;
end;

function TInt32VarFunctionalityRemoted.getName: string;
begin
Result:=TInt32VarSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TInt32VarFunctionalityRemoted.getHint: string;
begin
Result:=TInt32VarSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TInt32VarFunctionalityRemoted.getValue: integer;
begin
Result:=TInt32VarSOAPFunctionality.getValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TInt32VarFunctionalityRemoted.setValue(_Value: integer);
begin
TInt32VarSOAPFunctionality.setValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   _Value);
end;

function TInt32VarFunctionalityRemoted.getSetTimeStamp: TDateTime;
begin
Result:=TInt32VarSOAPFunctionality.getSetTimeStamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTURLFunctionality}
Constructor TTURLFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTURLSOAPFunctionality:=nil;
end;

Destructor TTURLFunctionalityRemoted.Destroy;
begin
FTTURLSOAPFunctionality:=nil;
Inherited;
end;

function TTURLFunctionalityRemoted.TTURLSOAPFunctionality: ITTURLSOAPFunctionality;
begin
if FTTURLSOAPFunctionality = nil
  then FTTURLSOAPFunctionality:=GetITTURLSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTURLSOAPFunctionality;
end;


{TURLFunctionality}
Constructor TURLFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTURLSOAPFunctionality:=nil;
end;

Destructor TURLFunctionalityRemoted.Destroy;
begin
FTURLSOAPFunctionality:=nil;
Inherited;
end;

function TURLFunctionalityRemoted.TURLSOAPFunctionality: ITURLSOAPFunctionality;
begin
if FTURLSOAPFunctionality = nil
  then FTURLSOAPFunctionality:=GetITURLSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTURLSOAPFunctionality;
end;

function TURLFunctionalityRemoted.getName: string;
begin
Result:=TURLSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TURLFunctionalityRemoted.getHint: string;
begin
Result:=TURLSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TURLFunctionalityRemoted.getURL: string;
begin
Result:=TURLSOAPFunctionality.getURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TURLFunctionalityRemoted.setURL(Value: string);
begin
TURLSOAPFunctionality.setURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TURLFunctionalityRemoted.getURLName: string;
begin
Result:=TURLSOAPFunctionality.getURLName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TURLFunctionalityRemoted.setURLName(Value: string);
begin
TURLSOAPFunctionality.setURLName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TURLFunctionalityRemoted.getflPanelBrowser: boolean;
begin
Result:=TURLSOAPFunctionality.getflPanelBrowser(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TURLFunctionalityRemoted.setflPanelBrowser(Value: boolean);
begin
TURLSOAPFunctionality.setflPanelBrowser(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TURLFunctionalityRemoted.GetParams(out oURL: string; out oURLName: string; out oflPanelBrowser: boolean);
begin
TURLSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oURL,oURLName,oflPanelBrowser);
end;

procedure TURLFunctionalityRemoted.SetParams(const pURL: string; const pURLName: string; const pflPanelBrowser: boolean);
begin
TURLSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pURL,pURLName,pflPanelBrowser);
end;


{TTPatternVisualizationFunctionality}
Constructor TTPatternVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTPatternVisualizationSOAPFunctionality:=nil;
end;

Destructor TTPatternVisualizationFunctionalityRemoted.Destroy;
begin
FTTPatternVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTPatternVisualizationFunctionalityRemoted.TTPatternVisualizationSOAPFunctionality: ITTPatternVisualizationSOAPFunctionality;
begin
if FTTPatternVisualizationSOAPFunctionality = nil
  then FTTPatternVisualizationSOAPFunctionality:=GetITTPatternVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTPatternVisualizationSOAPFunctionality;
end;


{TPatternVisualizationFunctionality}
Constructor TPatternVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTPatternVisualizationSOAPFunctionality:=nil;
end;

Destructor TPatternVisualizationFunctionalityRemoted.Destroy;
begin
FTPatternVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TPatternVisualizationFunctionalityRemoted.TPatternVisualizationSOAPFunctionality: ITPatternVisualizationSOAPFunctionality;
begin
if FTPatternVisualizationSOAPFunctionality = nil
  then FTPatternVisualizationSOAPFunctionality:=GetITPatternVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTPatternVisualizationSOAPFunctionality;
end;

function TPatternVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TPatternVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TPatternVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TPatternVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TPatternVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TPatternVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TPatternVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TPatternVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TPatternVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
end;

procedure TPatternVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TPatternVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

function TPatternVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
Result:=TPatternVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TPatternVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
TPatternVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TPatternVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
TPatternVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTMapFormatObjectFunctionality}
Constructor TTMapFormatObjectFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTMapFormatObjectSOAPFunctionality:=nil;
end;

Destructor TTMapFormatObjectFunctionalityRemoted.Destroy;
begin
FTTMapFormatObjectSOAPFunctionality:=nil;
Inherited;
end;

function TTMapFormatObjectFunctionalityRemoted.TTMapFormatObjectSOAPFunctionality: ITTMapFormatObjectSOAPFunctionality;
begin
if FTTMapFormatObjectSOAPFunctionality = nil
  then FTTMapFormatObjectSOAPFunctionality:=GetITTMapFormatObjectSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMapFormatObjectSOAPFunctionality;
end;

function TTMapFormatObjectFunctionalityRemoted.GetDATAHash(DATAStream: TByteArray): integer;
begin
Result:=TTMapFormatObjectSOAPFunctionality.GetDATAHash(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   DATAStream);
end;


{TMapFormatObjectFunctionality}
Constructor TMapFormatObjectFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTMapFormatObjectSOAPFunctionality:=nil;
end;

Destructor TMapFormatObjectFunctionalityRemoted.Destroy;
begin
FTMapFormatObjectSOAPFunctionality:=nil;
Inherited;
end;

function TMapFormatObjectFunctionalityRemoted.TMapFormatObjectSOAPFunctionality: ITMapFormatObjectSOAPFunctionality;
begin
if FTMapFormatObjectSOAPFunctionality = nil
  then FTMapFormatObjectSOAPFunctionality:=GetITMapFormatObjectSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMapFormatObjectSOAPFunctionality;
end;

function TMapFormatObjectFunctionalityRemoted.GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
begin
Result:=TMapFormatObjectSOAPFunctionality.GetHintInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   InfoType,InfoFormat,HintInfo);
end;

function TMapFormatObjectFunctionalityRemoted.getidMap: integer;
begin
Result:=TMapFormatObjectSOAPFunctionality.getidMap(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatObjectFunctionalityRemoted.setidMap(Value: integer);
begin
TMapFormatObjectSOAPFunctionality.setidMap(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMapFormatObjectFunctionalityRemoted.getFormatID: integer;
begin
Result:=TMapFormatObjectSOAPFunctionality.getFormatID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatObjectFunctionalityRemoted.setFormatID(Value: integer);
begin
TMapFormatObjectSOAPFunctionality.setFormatID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMapFormatObjectFunctionalityRemoted.getKindID: integer;
begin
Result:=TMapFormatObjectSOAPFunctionality.getKindID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatObjectFunctionalityRemoted.setKindID(Value: integer);
begin
TMapFormatObjectSOAPFunctionality.setKindID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMapFormatObjectFunctionalityRemoted.getTypeID: integer;
begin
Result:=TMapFormatObjectSOAPFunctionality.getTypeID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatObjectFunctionalityRemoted.setTypeID(Value: integer);
begin
TMapFormatObjectSOAPFunctionality.setTypeID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMapFormatObjectFunctionalityRemoted.getName: string;
begin
Result:=TMapFormatObjectSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatObjectFunctionalityRemoted.setName(Value: string);
begin
TMapFormatObjectSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TMapFormatObjectFunctionalityRemoted.GetDATA(out DATAStream: TByteArray);
begin
TMapFormatObjectSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

procedure TMapFormatObjectFunctionalityRemoted.SetDATA(DATAStream: TByteArray);
begin
TMapFormatObjectSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

function TMapFormatObjectFunctionalityRemoted.getDATAHash: integer;
begin
Result:=TMapFormatObjectSOAPFunctionality.getDATAHash(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatObjectFunctionalityRemoted.setDATAHash(Value: integer);
begin
TMapFormatObjectSOAPFunctionality.setDATAHash(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TMapFormatObjectFunctionalityRemoted.GetParams(out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string);
begin
TMapFormatObjectSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oidMap,oFormatID,oKindID,oTypeID,oName);
end;

procedure TMapFormatObjectFunctionalityRemoted.SetParams(const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string);
begin
TMapFormatObjectSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pidMap,pFormatID,pKindID,pTypeID,pName);
end;

procedure TMapFormatObjectFunctionalityRemoted.SetObjectByDATA;
begin
TMapFormatObjectSOAPFunctionality.SetObjectByDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatObjectFunctionalityRemoted.UpdateDATAHash;
begin
TMapFormatObjectSOAPFunctionality.UpdateDATAHash(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatObjectFunctionalityRemoted.Compile;
begin
TMapFormatObjectSOAPFunctionality.Compile(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatObjectFunctionalityRemoted.Build(const flUsePrototype: boolean);
begin
TMapFormatObjectSOAPFunctionality.Build(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   flUsePrototype);
end;


{TTMapFormatMapFunctionality}
Constructor TTMapFormatMapFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTMapFormatMapSOAPFunctionality:=nil;
end;

Destructor TTMapFormatMapFunctionalityRemoted.Destroy;
begin
FTTMapFormatMapSOAPFunctionality:=nil;
Inherited;
end;

function TTMapFormatMapFunctionalityRemoted.TTMapFormatMapSOAPFunctionality: ITTMapFormatMapSOAPFunctionality;
begin
if FTTMapFormatMapSOAPFunctionality = nil
  then FTTMapFormatMapSOAPFunctionality:=GetITTMapFormatMapSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMapFormatMapSOAPFunctionality;
end;

procedure TTMapFormatMapFunctionalityRemoted.GetInstanceListByGeoSpace(const idGeoSpace: integer; out List: TByteArray);
begin
TTMapFormatMapSOAPFunctionality.GetInstanceListByGeoSpace(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   idGeoSpace,List);
end;


{TMapFormatMapFunctionality}
Constructor TMapFormatMapFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTMapFormatMapSOAPFunctionality:=nil;
end;

Destructor TMapFormatMapFunctionalityRemoted.Destroy;
begin
FTMapFormatMapSOAPFunctionality:=nil;
Inherited;
end;

function TMapFormatMapFunctionalityRemoted.TMapFormatMapSOAPFunctionality: ITMapFormatMapSOAPFunctionality;
begin
if FTMapFormatMapSOAPFunctionality = nil
  then FTMapFormatMapSOAPFunctionality:=GetITMapFormatMapSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMapFormatMapSOAPFunctionality;
end;

function TMapFormatMapFunctionalityRemoted.getGeoSpaceID: integer;
begin
Result:=TMapFormatMapSOAPFunctionality.getGeoSpaceID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatMapFunctionalityRemoted.setGeoSpaceID(Value: integer);
begin
TMapFormatMapSOAPFunctionality.setGeoSpaceID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMapFormatMapFunctionalityRemoted.getFormatID: integer;
begin
Result:=TMapFormatMapSOAPFunctionality.getFormatID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatMapFunctionalityRemoted.setFormatID(Value: integer);
begin
TMapFormatMapSOAPFunctionality.setFormatID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMapFormatMapFunctionalityRemoted.getName: string;
begin
Result:=TMapFormatMapSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatMapFunctionalityRemoted.setName(Value: string);
begin
TMapFormatMapSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TMapFormatMapFunctionalityRemoted.GetDATA(out DATAStream: TByteArray);
begin
TMapFormatMapSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

procedure TMapFormatMapFunctionalityRemoted.SetDATA(DATAStream: TByteArray);
begin
TMapFormatMapSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

procedure TMapFormatMapFunctionalityRemoted.GetObjectPrototypesDATA(out DATAStream: TByteArray);
begin
TMapFormatMapSOAPFunctionality.GetObjectPrototypesDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

procedure TMapFormatMapFunctionalityRemoted.SetObjectPrototypesDATA(DATAStream: TByteArray);
begin
TMapFormatMapSOAPFunctionality.SetObjectPrototypesDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

function TMapFormatMapFunctionalityRemoted.GetObjectPrototype(const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean;
begin
Result:=TMapFormatMapSOAPFunctionality.GetObjectPrototype(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   KindID,TypeID,PrototypeID,LayID);
end;

procedure TMapFormatMapFunctionalityRemoted.GetParams(out oGeoSpaceID: integer; out oFormatID: integer; out oName: string);
begin
TMapFormatMapSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oGeoSpaceID,oFormatID,oName);
end;

procedure TMapFormatMapFunctionalityRemoted.SetParams(const pGeoSpaceID: integer; const pFormatID: integer; const pName: string);
begin
TMapFormatMapSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pGeoSpaceID,pFormatID,pName);
end;

function TMapFormatMapFunctionalityRemoted.ObjectsCounter: integer;
begin
Result:=TMapFormatMapSOAPFunctionality.ObjectsCounter(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatMapFunctionalityRemoted.GetObjectsList(out List: TByteArray);
begin
TMapFormatMapSOAPFunctionality.GetObjectsList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
end;

procedure TMapFormatMapFunctionalityRemoted.GetObjectsList1(const KindID: integer; out List: TByteArray);
begin
TMapFormatMapSOAPFunctionality.GetObjectsList1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   KindID,List);
end;

procedure TMapFormatMapFunctionalityRemoted.GetObjectsList2(const KindID: integer; const TypeID: integer; out List: TByteArray);
begin
TMapFormatMapSOAPFunctionality.GetObjectsList2(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   KindID,TypeID,List);
end;

procedure TMapFormatMapFunctionalityRemoted.GetObjectsList3(const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray);
begin
TMapFormatMapSOAPFunctionality.GetObjectsList3(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   KindID,TypeID,NameContext,List);
end;

function TMapFormatMapFunctionalityRemoted.GetObject(const DATAHash: integer; out idMapFormatObject: integer): boolean;
begin
Result:=TMapFormatMapSOAPFunctionality.GetObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAHash,idMapFormatObject);
end;

function TMapFormatMapFunctionalityRemoted.GetObject1(const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean;
begin
Result:=TMapFormatMapSOAPFunctionality.GetObject1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   KindID,DATAHash,idMapFormatObject);
end;

procedure TMapFormatMapFunctionalityRemoted.ExportMap(const pFormatID: integer; out ZipData: TByteArray);
begin
TMapFormatMapSOAPFunctionality.ExportMap(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pFormatID,ZipData);
end;

procedure TMapFormatMapFunctionalityRemoted.RemoveObjects;
begin
TMapFormatMapSOAPFunctionality.RemoveObjects(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatMapFunctionalityRemoted.RemoveObjects1(const KindID: integer; const TypeID: integer);
begin
TMapFormatMapSOAPFunctionality.RemoveObjects1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   KindID,TypeID);
end;

procedure TMapFormatMapFunctionalityRemoted.UpdateObjectDATAHashes;
begin
TMapFormatMapSOAPFunctionality.UpdateObjectDATAHashes(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatMapFunctionalityRemoted.RecalculateMapArea;
begin
TMapFormatMapSOAPFunctionality.RecalculateMapArea(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMapFormatMapFunctionalityRemoted.RemoveIrrelevantObjectsInMapArea;
begin
TMapFormatMapSOAPFunctionality.RemoveIrrelevantObjectsInMapArea(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTSPLVisualizationFunctionality}
Constructor TTSPLVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTSPLVisualizationSOAPFunctionality:=nil;
end;

Destructor TTSPLVisualizationFunctionalityRemoted.Destroy;
begin
FTTSPLVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTSPLVisualizationFunctionalityRemoted.TTSPLVisualizationSOAPFunctionality: ITTSPLVisualizationSOAPFunctionality;
begin
if FTTSPLVisualizationSOAPFunctionality = nil
  then FTTSPLVisualizationSOAPFunctionality:=GetITTSPLVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTSPLVisualizationSOAPFunctionality;
end;


{TSPLVisualizationFunctionality}
Constructor TSPLVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTSPLVisualizationSOAPFunctionality:=nil;
end;

Destructor TSPLVisualizationFunctionalityRemoted.Destroy;
begin
FTSPLVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TSPLVisualizationFunctionalityRemoted.TSPLVisualizationSOAPFunctionality: ITSPLVisualizationSOAPFunctionality;
begin
if FTSPLVisualizationSOAPFunctionality = nil
  then FTSPLVisualizationSOAPFunctionality:=GetITSPLVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTSPLVisualizationSOAPFunctionality;
end;

function TSPLVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TSPLVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TSPLVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TSPLVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TSPLVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TSPLVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TSPLVisualizationFunctionalityRemoted.GetParams(out SPLType: integer; out SPLDATA: TByteArray);
begin
TSPLVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   SPLType,SPLDATA);
end;

procedure TSPLVisualizationFunctionalityRemoted.SetParams(const SPLType: integer; const SPLDATA: TByteArray);
begin
TSPLVisualizationSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   SPLType,SPLDATA);
end;


{TTBoolVarFunctionality}
Constructor TTBoolVarFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTBoolVarSOAPFunctionality:=nil;
end;

Destructor TTBoolVarFunctionalityRemoted.Destroy;
begin
FTTBoolVarSOAPFunctionality:=nil;
Inherited;
end;

function TTBoolVarFunctionalityRemoted.TTBoolVarSOAPFunctionality: ITTBoolVarSOAPFunctionality;
begin
if FTTBoolVarSOAPFunctionality = nil
  then FTTBoolVarSOAPFunctionality:=GetITTBoolVarSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTBoolVarSOAPFunctionality;
end;


{TBoolVarFunctionality}
Constructor TBoolVarFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTBoolVarSOAPFunctionality:=nil;
end;

Destructor TBoolVarFunctionalityRemoted.Destroy;
begin
FTBoolVarSOAPFunctionality:=nil;
Inherited;
end;

function TBoolVarFunctionalityRemoted.TBoolVarSOAPFunctionality: ITBoolVarSOAPFunctionality;
begin
if FTBoolVarSOAPFunctionality = nil
  then FTBoolVarSOAPFunctionality:=GetITBoolVarSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTBoolVarSOAPFunctionality;
end;

function TBoolVarFunctionalityRemoted.getName: string;
begin
Result:=TBoolVarSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TBoolVarFunctionalityRemoted.getHint: string;
begin
Result:=TBoolVarSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TBoolVarFunctionalityRemoted.getValue: boolean;
begin
Result:=TBoolVarSOAPFunctionality.getValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TBoolVarFunctionalityRemoted.setValue(_Value: boolean);
begin
TBoolVarSOAPFunctionality.setValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   _Value);
end;

function TBoolVarFunctionalityRemoted.getSetTimeStamp: TDateTime;
begin
Result:=TBoolVarSOAPFunctionality.getSetTimeStamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTGeoSpaceFunctionality}
Constructor TTGeoSpaceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTGeoSpaceSOAPFunctionality:=nil;
end;

Destructor TTGeoSpaceFunctionalityRemoted.Destroy;
begin
FTTGeoSpaceSOAPFunctionality:=nil;
Inherited;
end;

function TTGeoSpaceFunctionalityRemoted.TTGeoSpaceSOAPFunctionality: ITTGeoSpaceSOAPFunctionality;
begin
if FTTGeoSpaceSOAPFunctionality = nil
  then FTTGeoSpaceSOAPFunctionality:=GetITTGeoSpaceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTGeoSpaceSOAPFunctionality;
end;


{TGeoSpaceFunctionality}
Constructor TGeoSpaceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTGeoSpaceSOAPFunctionality:=nil;
end;

Destructor TGeoSpaceFunctionalityRemoted.Destroy;
begin
FTGeoSpaceSOAPFunctionality:=nil;
Inherited;
end;

function TGeoSpaceFunctionalityRemoted.TGeoSpaceSOAPFunctionality: ITGeoSpaceSOAPFunctionality;
begin
if FTGeoSpaceSOAPFunctionality = nil
  then FTGeoSpaceSOAPFunctionality:=GetITGeoSpaceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTGeoSpaceSOAPFunctionality;
end;

function TGeoSpaceFunctionalityRemoted.getName: string;
begin
Result:=TGeoSpaceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoSpaceFunctionalityRemoted.setName(Value: string);
begin
TGeoSpaceSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeoSpaceFunctionalityRemoted.getHint: string;
begin
Result:=TGeoSpaceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TGeoSpaceFunctionalityRemoted.getDatumID: integer;
begin
Result:=TGeoSpaceSOAPFunctionality.getDatumID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoSpaceFunctionalityRemoted.setDatumID(Value: integer);
begin
TGeoSpaceSOAPFunctionality.setDatumID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeoSpaceFunctionalityRemoted.getProjectionID: integer;
begin
Result:=TGeoSpaceSOAPFunctionality.getProjectionID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoSpaceFunctionalityRemoted.setProjectionID(Value: integer);
begin
TGeoSpaceSOAPFunctionality.setProjectionID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeoSpaceFunctionalityRemoted.ConvertXYToLatLong(const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean;
begin
Result:=TGeoSpaceSOAPFunctionality.ConvertXYToLatLong(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X,Y,Latitude,Longitude);
end;

function TGeoSpaceFunctionalityRemoted.ConvertXYToDatumLatLong(const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean;
begin
Result:=TGeoSpaceSOAPFunctionality.ConvertXYToDatumLatLong(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X,Y,pDatumID,Latitude,Longitude);
end;

function TGeoSpaceFunctionalityRemoted.ConvertLatLongToXY(const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
begin
Result:=TGeoSpaceSOAPFunctionality.ConvertLatLongToXY(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Latitude,Longitude,X,Y);
end;

function TGeoSpaceFunctionalityRemoted.ConvertDatumLatLongToXY(const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
begin
Result:=TGeoSpaceSOAPFunctionality.ConvertDatumLatLongToXY(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pDatumID,Latitude,Longitude,X,Y);
end;

procedure TGeoSpaceFunctionalityRemoted.GetGeoCrdSystemList(out List: TByteArray);
begin
TGeoSpaceSOAPFunctionality.GetGeoCrdSystemList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
end;

procedure TGeoSpaceFunctionalityRemoted.GetMapFormatMapList(out List: TByteArray);
begin
TGeoSpaceSOAPFunctionality.GetMapFormatMapList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
end;

procedure TGeoSpaceFunctionalityRemoted.GetMapFormatMapObjectsByNameContext(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray);
begin
TGeoSpaceSOAPFunctionality.GetMapFormatMapObjectsByNameContext(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pFormatID,pKindID,pTypeID,NameContext,List);
end;


{TTUserAlertFunctionality}
Constructor TTUserAlertFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTUserAlertSOAPFunctionality:=nil;
end;

Destructor TTUserAlertFunctionalityRemoted.Destroy;
begin
FTTUserAlertSOAPFunctionality:=nil;
Inherited;
end;

function TTUserAlertFunctionalityRemoted.TTUserAlertSOAPFunctionality: ITTUserAlertSOAPFunctionality;
begin
if FTTUserAlertSOAPFunctionality = nil
  then FTTUserAlertSOAPFunctionality:=GetITTUserAlertSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTUserAlertSOAPFunctionality;
end;

procedure TTUserAlertFunctionalityRemoted.GetActiveInstanceList(out List: TByteArray);
begin
TTUserAlertSOAPFunctionality.GetActiveInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
end;


{TUserAlertFunctionality}
Constructor TUserAlertFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTUserAlertSOAPFunctionality:=nil;
end;

Destructor TUserAlertFunctionalityRemoted.Destroy;
begin
FTUserAlertSOAPFunctionality:=nil;
Inherited;
end;

function TUserAlertFunctionalityRemoted.TUserAlertSOAPFunctionality: ITUserAlertSOAPFunctionality;
begin
if FTUserAlertSOAPFunctionality = nil
  then FTUserAlertSOAPFunctionality:=GetITUserAlertSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTUserAlertSOAPFunctionality;
end;

function TUserAlertFunctionalityRemoted.getName: string;
begin
Result:=TUserAlertSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TUserAlertFunctionalityRemoted.getHint: string;
begin
Result:=TUserAlertSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TUserAlertFunctionalityRemoted.getUserID: integer;
begin
Result:=TUserAlertSOAPFunctionality.getUserID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TUserAlertFunctionalityRemoted.setUserID(Value: integer);
begin
TUserAlertSOAPFunctionality.setUserID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TUserAlertFunctionalityRemoted.getTimeStamp: TDateTime;
begin
Result:=TUserAlertSOAPFunctionality.getTimeStamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TUserAlertFunctionalityRemoted.setTimeStamp(Value: TDateTime);
begin
TUserAlertSOAPFunctionality.setTimeStamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TUserAlertFunctionalityRemoted.getActive: boolean;
begin
Result:=TUserAlertSOAPFunctionality.getActive(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TUserAlertFunctionalityRemoted.setActive(Value: boolean);
begin
TUserAlertSOAPFunctionality.setActive(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TUserAlertFunctionalityRemoted.getAlertID: integer;
begin
Result:=TUserAlertSOAPFunctionality.getAlertID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TUserAlertFunctionalityRemoted.setAlertID(Value: integer);
begin
TUserAlertSOAPFunctionality.setAlertID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TUserAlertFunctionalityRemoted.getSeverity: integer;
begin
Result:=TUserAlertSOAPFunctionality.getSeverity(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TUserAlertFunctionalityRemoted.setSeverity(Value: integer);
begin
TUserAlertSOAPFunctionality.setSeverity(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TUserAlertFunctionalityRemoted.getDescription: string;
begin
Result:=TUserAlertSOAPFunctionality.getDescription(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TUserAlertFunctionalityRemoted.setDescription(Value: string);
begin
TUserAlertSOAPFunctionality.setDescription(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TUserAlertFunctionalityRemoted.GetDATA(out DATAStream: TByteArray);
begin
TUserAlertSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

procedure TUserAlertFunctionalityRemoted.SetDATA(DATAStream: TByteArray);
begin
TUserAlertSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;


{TTGeoGraphServerObjectFunctionality}
Constructor TTGeoGraphServerObjectFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTGeoGraphServerObjectSOAPFunctionality:=nil;
end;

Destructor TTGeoGraphServerObjectFunctionalityRemoted.Destroy;
begin
FTTGeoGraphServerObjectSOAPFunctionality:=nil;
Inherited;
end;

function TTGeoGraphServerObjectFunctionalityRemoted.TTGeoGraphServerObjectSOAPFunctionality: ITTGeoGraphServerObjectSOAPFunctionality;
begin
if FTTGeoGraphServerObjectSOAPFunctionality = nil
  then FTTGeoGraphServerObjectSOAPFunctionality:=GetITTGeoGraphServerObjectSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTGeoGraphServerObjectSOAPFunctionality;
end;

function TTGeoGraphServerObjectFunctionalityRemoted.GetInstanceByServerObject(const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean;
begin
Result:=TTGeoGraphServerObjectSOAPFunctionality.GetInstanceByServerObject(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pGeoGraphServerID,pObjectID,idInstance);
end;


{TGeoGraphServerObjectFunctionality}
Constructor TGeoGraphServerObjectFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTGeoGraphServerObjectSOAPFunctionality:=nil;
end;

Destructor TGeoGraphServerObjectFunctionalityRemoted.Destroy;
begin
FTGeoGraphServerObjectSOAPFunctionality:=nil;
Inherited;
end;

function TGeoGraphServerObjectFunctionalityRemoted.TGeoGraphServerObjectSOAPFunctionality: ITGeoGraphServerObjectSOAPFunctionality;
begin
if FTGeoGraphServerObjectSOAPFunctionality = nil
  then FTGeoGraphServerObjectSOAPFunctionality:=GetITGeoGraphServerObjectSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTGeoGraphServerObjectSOAPFunctionality;
end;

function TGeoGraphServerObjectFunctionalityRemoted.getName: string;
begin
Result:=TGeoGraphServerObjectSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TGeoGraphServerObjectFunctionalityRemoted.getHint: string;
begin
Result:=TGeoGraphServerObjectSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TGeoGraphServerObjectFunctionalityRemoted.getGeoGraphServerID: integer;
begin
Result:=TGeoGraphServerObjectSOAPFunctionality.getGeoGraphServerID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.setGeoGraphServerID(Value: integer);
begin
TGeoGraphServerObjectSOAPFunctionality.setGeoGraphServerID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeoGraphServerObjectFunctionalityRemoted.getObjectID: integer;
begin
Result:=TGeoGraphServerObjectSOAPFunctionality.getObjectID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.setObjectID(Value: integer);
begin
TGeoGraphServerObjectSOAPFunctionality.setObjectID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeoGraphServerObjectFunctionalityRemoted.getBusinessModelID: integer;
begin
Result:=TGeoGraphServerObjectSOAPFunctionality.getBusinessModelID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.setBusinessModelID(Value: integer);
begin
TGeoGraphServerObjectSOAPFunctionality.setBusinessModelID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeoGraphServerObjectFunctionalityRemoted.getDomains: string;
begin
Result:=TGeoGraphServerObjectSOAPFunctionality.getDomains(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.setDomains(Value: string);
begin
TGeoGraphServerObjectSOAPFunctionality.setDomains(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.GetParams(out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer);
begin
TGeoGraphServerObjectSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oGeoGraphServerID,oObjectID,oObjectType,oBusinessModel);
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
begin
TGeoGraphServerObjectSOAPFunctionality.ExecuteOperation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   InData,OutData);
end;

function TGeoGraphServerObjectFunctionalityRemoted.GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
begin
Result:=TGeoGraphServerObjectSOAPFunctionality.GetVisualizationComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTVisualization,idVisualization);
end;

function TGeoGraphServerObjectFunctionalityRemoted.GetNearestMapFormatObjects(const MaxDistance: double; out List: TByteArray): boolean;
begin
Result:=TGeoGraphServerObjectSOAPFunctionality.GetNearestMapFormatObjects(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MaxDistance,List);
end;

function TGeoGraphServerObjectFunctionalityRemoted.GetNearestMapFormatObjectsNames(const MaxDistance: double; out Names: WideString): boolean;
begin
Result:=TGeoGraphServerObjectSOAPFunctionality.GetNearestMapFormatObjectsNames(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MaxDistance,Names);
end;

function TGeoGraphServerObjectFunctionalityRemoted.Measurements_AddNew(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer;
begin
Result:=TGeoGraphServerObjectSOAPFunctionality.Measurements_AddNew(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pData);
end;

function TGeoGraphServerObjectFunctionalityRemoted.Measurements_AddNew1(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer;
begin
Result:=TGeoGraphServerObjectSOAPFunctionality.Measurements_AddNew1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pDataSource,pData);
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.Measurements_Remove(const pidMeasurement: integer);
begin
TGeoGraphServerObjectSOAPFunctionality.Measurements_Remove(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pidMeasurement);
end;

procedure TGeoGraphServerObjectFunctionalityRemoted.Measurements_Item_UpdateData(const pTimeID: Double; const pData: TByteArray);
begin
TGeoGraphServerObjectSOAPFunctionality.Measurements_Item_UpdateData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pTimeID,pData);
end;


{TTGeoGraphServerFunctionality}
Constructor TTGeoGraphServerFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTGeoGraphServerSOAPFunctionality:=nil;
end;

Destructor TTGeoGraphServerFunctionalityRemoted.Destroy;
begin
FTTGeoGraphServerSOAPFunctionality:=nil;
Inherited;
end;

function TTGeoGraphServerFunctionalityRemoted.TTGeoGraphServerSOAPFunctionality: ITTGeoGraphServerSOAPFunctionality;
begin
if FTTGeoGraphServerSOAPFunctionality = nil
  then FTTGeoGraphServerSOAPFunctionality:=GetITTGeoGraphServerSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTGeoGraphServerSOAPFunctionality;
end;

procedure TTGeoGraphServerFunctionalityRemoted.GetActiveInstanceList(out List: TByteArray);
begin
TTGeoGraphServerSOAPFunctionality.GetActiveInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
end;

function TTGeoGraphServerFunctionalityRemoted.GetInstanceForRegistration: integer;
begin
Result:=TTGeoGraphServerSOAPFunctionality.GetInstanceForRegistration(TypeFunctionality.UserName,TypeFunctionality.UserPassword);
end;


{TGeoGraphServerFunctionality}
Constructor TGeoGraphServerFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTGeoGraphServerSOAPFunctionality:=nil;
end;

Destructor TGeoGraphServerFunctionalityRemoted.Destroy;
begin
FTGeoGraphServerSOAPFunctionality:=nil;
Inherited;
end;

function TGeoGraphServerFunctionalityRemoted.TGeoGraphServerSOAPFunctionality: ITGeoGraphServerSOAPFunctionality;
begin
if FTGeoGraphServerSOAPFunctionality = nil
  then FTGeoGraphServerSOAPFunctionality:=GetITGeoGraphServerSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTGeoGraphServerSOAPFunctionality;
end;

function TGeoGraphServerFunctionalityRemoted.getName: string;
begin
Result:=TGeoGraphServerSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoGraphServerFunctionalityRemoted.setName(Value: string);
begin
TGeoGraphServerSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeoGraphServerFunctionalityRemoted.getHint: string;
begin
Result:=TGeoGraphServerSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TGeoGraphServerFunctionalityRemoted.getAddress: string;
begin
Result:=TGeoGraphServerSOAPFunctionality.getAddress(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoGraphServerFunctionalityRemoted.setAddress(Value: string);
begin
TGeoGraphServerSOAPFunctionality.setAddress(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeoGraphServerFunctionalityRemoted.getInternalAddress: string;
begin
Result:=TGeoGraphServerSOAPFunctionality.getInternalAddress(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoGraphServerFunctionalityRemoted.setInternalAddress(Value: string);
begin
TGeoGraphServerSOAPFunctionality.setInternalAddress(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeoGraphServerFunctionalityRemoted.getInfo: string;
begin
Result:=TGeoGraphServerSOAPFunctionality.getInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoGraphServerFunctionalityRemoted.setInfo(Value: string);
begin
TGeoGraphServerSOAPFunctionality.setInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TGeoGraphServerFunctionalityRemoted.GetData(out DATAStream: TByteArray);
begin
TGeoGraphServerSOAPFunctionality.GetData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

function TGeoGraphServerFunctionalityRemoted.RegisterObject(const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;
begin
Result:=TGeoGraphServerSOAPFunctionality.RegisterObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectName,VisualizationType,VisualizationID,GeoCrdSystemID,HintID);
end;

function TGeoGraphServerFunctionalityRemoted.RegisterObject1(const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;
begin
Result:=TGeoGraphServerSOAPFunctionality.RegisterObject1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,GeoCrdSystemID,HintID);
end;

function TGeoGraphServerFunctionalityRemoted.RegisterObject2(const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer;
begin
Result:=TGeoGraphServerSOAPFunctionality.RegisterObject2(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionalityRemoted.UnRegisterObject(const ObjectID: integer);
begin
TGeoGraphServerSOAPFunctionality.UnRegisterObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID);
end;

function TGeoGraphServerFunctionalityRemoted.ObjectCounter: integer;
begin
Result:=TGeoGraphServerSOAPFunctionality.ObjectCounter(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoGraphServerFunctionalityRemoted.ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
begin
TGeoGraphServerSOAPFunctionality.ExecuteOperation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   InData,OutData);
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_GetProperties(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer);
begin
TGeoGraphServerSOAPFunctionality.Object_GetProperties(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_GetProperties1(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer);
begin
TGeoGraphServerSOAPFunctionality.Object_GetProperties1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_SetProperties(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer);
begin
TGeoGraphServerSOAPFunctionality.Object_SetProperties(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_SetProperties1(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer);
begin
TGeoGraphServerSOAPFunctionality.Object_SetProperties1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

function TGeoGraphServerFunctionalityRemoted.Object_GetObjectType(const ObjectID: integer): integer;
begin
Result:=TGeoGraphServerSOAPFunctionality.Object_GetObjectType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID);
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_SetObjectType(const ObjectID: integer; const ObjectType: integer);
begin
TGeoGraphServerSOAPFunctionality.Object_SetObjectType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,ObjectType);
end;

function TGeoGraphServerFunctionalityRemoted.Object_GetBusinessType(const ObjectID: integer): integer;
begin
Result:=TGeoGraphServerSOAPFunctionality.Object_GetBusinessType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID);
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_SetBusinessType(const ObjectID: integer; const BusinessType: integer);
begin
TGeoGraphServerSOAPFunctionality.Object_SetBusinessType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,BusinessType);
end;

function TGeoGraphServerFunctionalityRemoted.Object_GetComponentID(const ObjectID: integer): integer;
begin
Result:=TGeoGraphServerSOAPFunctionality.Object_GetComponentID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID);
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_SetComponentID(const ObjectID: integer; const ObjectComponentID: integer);
begin
TGeoGraphServerSOAPFunctionality.Object_SetComponentID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionalityRemoted.Object_ExecuteOperation(const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray);
begin
TGeoGraphServerSOAPFunctionality.Object_ExecuteOperation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ObjectID,InData,OutData);
end;

function TGeoGraphServerFunctionalityRemoted.DataID: integer;
begin
Result:=TGeoGraphServerSOAPFunctionality.DataID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTGeoCrdSystemFunctionality}
Constructor TTGeoCrdSystemFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTGeoCrdSystemSOAPFunctionality:=nil;
end;

Destructor TTGeoCrdSystemFunctionalityRemoted.Destroy;
begin
FTTGeoCrdSystemSOAPFunctionality:=nil;
Inherited;
end;

function TTGeoCrdSystemFunctionalityRemoted.TTGeoCrdSystemSOAPFunctionality: ITTGeoCrdSystemSOAPFunctionality;
begin
if FTTGeoCrdSystemSOAPFunctionality = nil
  then FTTGeoCrdSystemSOAPFunctionality:=GetITTGeoCrdSystemSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTGeoCrdSystemSOAPFunctionality;
end;

procedure TTGeoCrdSystemFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
TTGeoCrdSystemSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
end;

procedure TTGeoCrdSystemFunctionalityRemoted.GetInstanceByLatLong(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
begin
TTGeoCrdSystemSOAPFunctionality.GetInstanceByLatLong(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pGeoSpaceID,pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionalityRemoted.GetInstanceByXY(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
begin
TTGeoCrdSystemSOAPFunctionality.GetInstanceByXY(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pGeoSpaceID,pX,pY,idCrdSys);
end;


{TGeoCrdSystemFunctionality}
Constructor TGeoCrdSystemFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTGeoCrdSystemSOAPFunctionality:=nil;
end;

Destructor TGeoCrdSystemFunctionalityRemoted.Destroy;
begin
FTGeoCrdSystemSOAPFunctionality:=nil;
Inherited;
end;

function TGeoCrdSystemFunctionalityRemoted.TGeoCrdSystemSOAPFunctionality: ITGeoCrdSystemSOAPFunctionality;
begin
if FTGeoCrdSystemSOAPFunctionality = nil
  then FTGeoCrdSystemSOAPFunctionality:=GetITGeoCrdSystemSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTGeoCrdSystemSOAPFunctionality;
end;

function TGeoCrdSystemFunctionalityRemoted.getGeoSpaceID: integer;
begin
Result:=TGeoCrdSystemSOAPFunctionality.getGeoSpaceID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoCrdSystemFunctionalityRemoted.setGeoSpaceID(Value: integer);
begin
TGeoCrdSystemSOAPFunctionality.setGeoSpaceID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeoCrdSystemFunctionalityRemoted.getName: string;
begin
Result:=TGeoCrdSystemSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoCrdSystemFunctionalityRemoted.setName(Value: string);
begin
TGeoCrdSystemSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeoCrdSystemFunctionalityRemoted.getHint: string;
begin
Result:=TGeoCrdSystemSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TGeoCrdSystemFunctionalityRemoted.getDatum: string;
begin
Result:=TGeoCrdSystemSOAPFunctionality.getDatum(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoCrdSystemFunctionalityRemoted.setDatum(Value: string);
begin
TGeoCrdSystemSOAPFunctionality.setDatum(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeoCrdSystemFunctionalityRemoted.getProjection: string;
begin
Result:=TGeoCrdSystemSOAPFunctionality.getProjection(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeoCrdSystemFunctionalityRemoted.setProjection(Value: string);
begin
TGeoCrdSystemSOAPFunctionality.setProjection(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TGeoCrdSystemFunctionalityRemoted.GetProjectionDATA(out DATAStream: TByteArray);
begin
TGeoCrdSystemSOAPFunctionality.GetProjectionDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

procedure TGeoCrdSystemFunctionalityRemoted.SetProjectionDATA(DATAStream: TByteArray);
begin
TGeoCrdSystemSOAPFunctionality.SetProjectionDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

procedure TGeoCrdSystemFunctionalityRemoted.GetGeodesyPoints(out Points: TByteArray);
begin
TGeoCrdSystemSOAPFunctionality.GetGeodesyPoints(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Points);
end;


{TTFilterVisualizationFunctionality}
Constructor TTFilterVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTFilterVisualizationSOAPFunctionality:=nil;
end;

Destructor TTFilterVisualizationFunctionalityRemoted.Destroy;
begin
FTTFilterVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTFilterVisualizationFunctionalityRemoted.TTFilterVisualizationSOAPFunctionality: ITTFilterVisualizationSOAPFunctionality;
begin
if FTTFilterVisualizationSOAPFunctionality = nil
  then FTTFilterVisualizationSOAPFunctionality:=GetITTFilterVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTFilterVisualizationSOAPFunctionality;
end;


{TFilterVisualizationFunctionality}
Constructor TFilterVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTFilterVisualizationSOAPFunctionality:=nil;
end;

Destructor TFilterVisualizationFunctionalityRemoted.Destroy;
begin
FTFilterVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TFilterVisualizationFunctionalityRemoted.TFilterVisualizationSOAPFunctionality: ITFilterVisualizationSOAPFunctionality;
begin
if FTFilterVisualizationSOAPFunctionality = nil
  then FTFilterVisualizationSOAPFunctionality:=GetITFilterVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTFilterVisualizationSOAPFunctionality;
end;

function TFilterVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TFilterVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TFilterVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TFilterVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TFilterVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TFilterVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TFilterVisualizationFunctionalityRemoted.GetParams(out FilterType: integer; out FilterDATA: TByteArray);
begin
TFilterVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   FilterType,FilterDATA);
end;

procedure TFilterVisualizationFunctionalityRemoted.SetParams(const FilterType: integer; const FilterDATA: TByteArray);
begin
TFilterVisualizationSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   FilterType,FilterDATA);
end;


{TTHINTVisualizationFunctionality}
Constructor TTHINTVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTHINTVisualizationSOAPFunctionality:=nil;
end;

Destructor TTHINTVisualizationFunctionalityRemoted.Destroy;
begin
FTTHINTVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTHINTVisualizationFunctionalityRemoted.TTHINTVisualizationSOAPFunctionality: ITTHINTVisualizationSOAPFunctionality;
begin
if FTTHINTVisualizationSOAPFunctionality = nil
  then FTTHINTVisualizationSOAPFunctionality:=GetITTHINTVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHINTVisualizationSOAPFunctionality;
end;

procedure TTHINTVisualizationFunctionalityRemoted.GetInstanceParams(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
begin
TTHINTVisualizationSOAPFunctionality.GetInstanceParams(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   IDs,MaxInstanceSize,Params);
end;

procedure TTHINTVisualizationFunctionalityRemoted.GetInstanceParams1(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
begin
TTHINTVisualizationSOAPFunctionality.GetInstanceParams1(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   IDs,MaxInstanceSize,Params);
end;

procedure TTHINTVisualizationFunctionalityRemoted.GetInstanceOwnerDatasAndParams(const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray);
begin
TTHINTVisualizationSOAPFunctionality.GetInstanceOwnerDatasAndParams(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   IDs,DataFlags,MaxInstanceSize,Data,Params);
end;


{THINTVisualizationFunctionality}
Constructor THINTVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTHINTVisualizationSOAPFunctionality:=nil;
end;

Destructor THINTVisualizationFunctionalityRemoted.Destroy;
begin
FTHINTVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function THINTVisualizationFunctionalityRemoted.THINTVisualizationSOAPFunctionality: ITHINTVisualizationSOAPFunctionality;
begin
if FTHINTVisualizationSOAPFunctionality = nil
  then FTHINTVisualizationSOAPFunctionality:=GetITHINTVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHINTVisualizationSOAPFunctionality;
end;

function THINTVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=THINTVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function THINTVisualizationFunctionalityRemoted.getName: string;
begin
Result:=THINTVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function THINTVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=THINTVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure THINTVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
THINTVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
THINTVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
end;

procedure THINTVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
THINTVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionalityRemoted.GetPrivateDATA(out DATAStream: TByteArray);
begin
THINTVisualizationSOAPFunctionality.GetPrivateDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

procedure THINTVisualizationFunctionalityRemoted.GetPrivateDATA1(out DATAStream: TByteArray; const MaxSize: integer);
begin
THINTVisualizationSOAPFunctionality.GetPrivateDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,MaxSize);
end;

procedure THINTVisualizationFunctionalityRemoted.SetPrivateDATA(DATAStream: TByteArray);
begin
THINTVisualizationSOAPFunctionality.SetPrivateDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

function THINTVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
Result:=THINTVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure THINTVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
THINTVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure THINTVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
THINTVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTDetailedPictureVisualizationFunctionality}
Constructor TTDetailedPictureVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTDetailedPictureVisualizationSOAPFunctionality:=nil;
end;

Destructor TTDetailedPictureVisualizationFunctionalityRemoted.Destroy;
begin
FTTDetailedPictureVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTDetailedPictureVisualizationFunctionalityRemoted.TTDetailedPictureVisualizationSOAPFunctionality: ITTDetailedPictureVisualizationSOAPFunctionality;
begin
if FTTDetailedPictureVisualizationSOAPFunctionality = nil
  then FTTDetailedPictureVisualizationSOAPFunctionality:=GetITTDetailedPictureVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTDetailedPictureVisualizationSOAPFunctionality;
end;


{TDetailedPictureVisualizationFunctionality}
Constructor TDetailedPictureVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTDetailedPictureVisualizationSOAPFunctionality:=nil;
end;

Destructor TDetailedPictureVisualizationFunctionalityRemoted.Destroy;
begin
FTDetailedPictureVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TDetailedPictureVisualizationFunctionalityRemoted.TDetailedPictureVisualizationSOAPFunctionality: ITDetailedPictureVisualizationSOAPFunctionality;
begin
if FTDetailedPictureVisualizationSOAPFunctionality = nil
  then FTDetailedPictureVisualizationSOAPFunctionality:=GetITDetailedPictureVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTDetailedPictureVisualizationSOAPFunctionality;
end;

function TDetailedPictureVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TDetailedPictureVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TDetailedPictureVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TDetailedPictureVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TDetailedPictureVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TDetailedPictureVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.GenerateFromImage(DATAStream: TByteArray);
begin
TDetailedPictureVisualizationSOAPFunctionality.GenerateFromImage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.GenerateFromTiles(const TilesFolder: string; const SizePowerOf2: integer);
begin
TDetailedPictureVisualizationSOAPFunctionality.GenerateFromTiles(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TilesFolder,SizePowerOf2);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.RegenerateRegionFromLevel(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
TDetailedPictureVisualizationSOAPFunctionality.RegenerateRegionFromLevel(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.RegenerateRegion(const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
TDetailedPictureVisualizationSOAPFunctionality.RegenerateRegion(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.AddNewLevelAndRegenerate;
begin
TDetailedPictureVisualizationSOAPFunctionality.AddNewLevelAndRegenerate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.GetLevelsInfo(out Info: TByteArray);
begin
TDetailedPictureVisualizationSOAPFunctionality.GetLevelsInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Info);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.Level_GetParams(const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double);
begin
TDetailedPictureVisualizationSOAPFunctionality.Level_GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.Level_SetParams(const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double);
begin
TDetailedPictureVisualizationSOAPFunctionality.Level_SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.Level_GetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray);
begin
TDetailedPictureVisualizationSOAPFunctionality.Level_GetSegments(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.Level_GetSegmentsByIDs(const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray);
begin
TDetailedPictureVisualizationSOAPFunctionality.Level_GetSegmentsByIDs(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,SegmentsIDs,Segments);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.Level_GetSegmentsHashes(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray);
begin
TDetailedPictureVisualizationSOAPFunctionality.Level_GetSegmentsHashes(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.Level_SetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray);
begin
TDetailedPictureVisualizationSOAPFunctionality.Level_SetSegments(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.GetParams(out oWidth: integer; out oHeight: integer);
begin
TDetailedPictureVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oWidth,oHeight);
end;

procedure TDetailedPictureVisualizationFunctionalityRemoted.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TDetailedPictureVisualizationSOAPFunctionality.GetCoordinates(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;


{TTCoVisualizationFunctionality}
Constructor TTCoVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCoVisualizationSOAPFunctionality:=nil;
end;

Destructor TTCoVisualizationFunctionalityRemoted.Destroy;
begin
FTTCoVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTCoVisualizationFunctionalityRemoted.TTCoVisualizationSOAPFunctionality: ITTCoVisualizationSOAPFunctionality;
begin
if FTTCoVisualizationSOAPFunctionality = nil
  then FTTCoVisualizationSOAPFunctionality:=GetITTCoVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCoVisualizationSOAPFunctionality;
end;


{TCoVisualizationFunctionality}
Constructor TCoVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCoVisualizationSOAPFunctionality:=nil;
end;

Destructor TCoVisualizationFunctionalityRemoted.Destroy;
begin
FTCoVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TCoVisualizationFunctionalityRemoted.TCoVisualizationSOAPFunctionality: ITCoVisualizationSOAPFunctionality;
begin
if FTCoVisualizationSOAPFunctionality = nil
  then FTCoVisualizationSOAPFunctionality:=GetITCoVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCoVisualizationSOAPFunctionality;
end;

procedure TCoVisualizationFunctionalityRemoted.ToClone(out idClone: integer);
begin
TCoVisualizationSOAPFunctionality.ToClone(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idClone);
end;

function TCoVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TCoVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TCoVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TCoVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCoVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TCoVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCoVisualizationFunctionalityRemoted.GetSpace(out DATAStream: TByteArray);
begin
TCoVisualizationSOAPFunctionality.GetSpace(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

procedure TCoVisualizationFunctionalityRemoted.GetSpace1(out DATAStream: TByteArray; const MaxSize: integer);
begin
TCoVisualizationSOAPFunctionality.GetSpace1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,MaxSize);
end;

procedure TCoVisualizationFunctionalityRemoted.SetSpace(DATAStream: TByteArray);
begin
TCoVisualizationSOAPFunctionality.SetSpace(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

function TCoVisualizationFunctionalityRemoted.GetOwnSpaceHINTVisualization(out idHINTVisualization: integer): boolean;
begin
Result:=TCoVisualizationSOAPFunctionality.GetOwnSpaceHINTVisualization(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idHINTVisualization);
end;

function TCoVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
Result:=TCoVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCoVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
TCoVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TCoVisualizationFunctionalityRemoted.Pack;
begin
TCoVisualizationSOAPFunctionality.Pack(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCoVisualizationFunctionalityRemoted.UnPack;
begin
TCoVisualizationSOAPFunctionality.UnPack(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCoVisualizationFunctionalityRemoted.IsPacked: boolean;
begin
Result:=TCoVisualizationSOAPFunctionality.IsPacked(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTForumMessageFunctionality}
Constructor TTForumMessageFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTForumMessageSOAPFunctionality:=nil;
end;

Destructor TTForumMessageFunctionalityRemoted.Destroy;
begin
FTTForumMessageSOAPFunctionality:=nil;
Inherited;
end;

function TTForumMessageFunctionalityRemoted.TTForumMessageSOAPFunctionality: ITTForumMessageSOAPFunctionality;
begin
if FTTForumMessageSOAPFunctionality = nil
  then FTTForumMessageSOAPFunctionality:=GetITTForumMessageSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTForumMessageSOAPFunctionality;
end;


{TForumMessageFunctionality}
Constructor TForumMessageFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTForumMessageSOAPFunctionality:=nil;
end;

Destructor TForumMessageFunctionalityRemoted.Destroy;
begin
FTForumMessageSOAPFunctionality:=nil;
Inherited;
end;

function TForumMessageFunctionalityRemoted.TForumMessageSOAPFunctionality: ITForumMessageSOAPFunctionality;
begin
if FTForumMessageSOAPFunctionality = nil
  then FTForumMessageSOAPFunctionality:=GetITForumMessageSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTForumMessageSOAPFunctionality;
end;

function TForumMessageFunctionalityRemoted.getName: string;
begin
Result:=TForumMessageSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TForumMessageFunctionalityRemoted.getHint: string;
begin
Result:=TForumMessageSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TForumMessageFunctionalityRemoted.getidForum: integer;
begin
Result:=TForumMessageSOAPFunctionality.getidForum(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TForumMessageFunctionalityRemoted.setidForum(Value: integer);
begin
TForumMessageSOAPFunctionality.setidForum(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TForumMessageFunctionalityRemoted.idUser: integer;
begin
Result:=TForumMessageSOAPFunctionality.idUser(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TForumMessageFunctionalityRemoted.Send;
begin
TForumMessageSOAPFunctionality.Send(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TForumMessageFunctionalityRemoted.SentTime: TDateTime;
begin
Result:=TForumMessageSOAPFunctionality.SentTime(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TForumMessageFunctionalityRemoted.getidForMessage: integer;
begin
Result:=TForumMessageSOAPFunctionality.getidForMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TForumMessageFunctionalityRemoted.setidForMessage(Value: integer);
begin
TForumMessageSOAPFunctionality.setidForMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TForumMessageFunctionalityRemoted.LastModified: TDateTime;
begin
Result:=TForumMessageSOAPFunctionality.LastModified(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TForumMessageFunctionalityRemoted.GetMessage(out Message: TByteArray);
begin
TForumMessageSOAPFunctionality.GetMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Message);
end;

procedure TForumMessageFunctionalityRemoted.SetMessage(const Message: TByteArray);
begin
TForumMessageSOAPFunctionality.SetMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Message);
end;

function TForumMessageFunctionalityRemoted.ReplyMessageCount: integer;
begin
Result:=TForumMessageSOAPFunctionality.ReplyMessageCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TForumMessageFunctionalityRemoted.GetReplyMessageList(out MessageList: TByteArray);
begin
TForumMessageSOAPFunctionality.GetReplyMessageList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MessageList);
end;


{TTForumFunctionality}
Constructor TTForumFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTForumSOAPFunctionality:=nil;
end;

Destructor TTForumFunctionalityRemoted.Destroy;
begin
FTTForumSOAPFunctionality:=nil;
Inherited;
end;

function TTForumFunctionalityRemoted.TTForumSOAPFunctionality: ITTForumSOAPFunctionality;
begin
if FTTForumSOAPFunctionality = nil
  then FTTForumSOAPFunctionality:=GetITTForumSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTForumSOAPFunctionality;
end;


{TForumFunctionality}
Constructor TForumFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTForumSOAPFunctionality:=nil;
end;

Destructor TForumFunctionalityRemoted.Destroy;
begin
FTForumSOAPFunctionality:=nil;
Inherited;
end;

function TForumFunctionalityRemoted.TForumSOAPFunctionality: ITForumSOAPFunctionality;
begin
if FTForumSOAPFunctionality = nil
  then FTForumSOAPFunctionality:=GetITForumSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTForumSOAPFunctionality;
end;

function TForumFunctionalityRemoted.getName: string;
begin
Result:=TForumSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TForumFunctionalityRemoted.setName(Value: string);
begin
TForumSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TForumFunctionalityRemoted.getMessageLifeTime: TDateTime;
begin
Result:=TForumSOAPFunctionality.getMessageLifeTime(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TForumFunctionalityRemoted.setMessageLifeTime(Value: TDateTime);
begin
TForumSOAPFunctionality.setMessageLifeTime(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TForumFunctionalityRemoted.getHint: string;
begin
Result:=TForumSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TForumFunctionalityRemoted.RootMessageCount: integer;
begin
Result:=TForumSOAPFunctionality.RootMessageCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TForumFunctionalityRemoted.GetRootMessageList(out MessageList: TByteArray);
begin
TForumSOAPFunctionality.GetRootMessageList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MessageList);
end;

function TForumFunctionalityRemoted.MessageCount: integer;
begin
Result:=TForumSOAPFunctionality.MessageCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TForumFunctionalityRemoted.GetMessageList(out MessageList: TByteArray);
begin
TForumSOAPFunctionality.GetMessageList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MessageList);
end;

function TForumFunctionalityRemoted.AddMessage(const pidUser: integer; const pidForMessage: integer): integer;
begin
Result:=TForumSOAPFunctionality.AddMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pidUser,pidForMessage);
end;

procedure TForumFunctionalityRemoted.DestroyMessage(const pidMessage: integer);
begin
TForumSOAPFunctionality.DestroyMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pidMessage);
end;


{TTCUSTOMVisualizationFunctionality}
Constructor TTCUSTOMVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCUSTOMVisualizationSOAPFunctionality:=nil;
end;

Destructor TTCUSTOMVisualizationFunctionalityRemoted.Destroy;
begin
FTTCUSTOMVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTCUSTOMVisualizationFunctionalityRemoted.TTCUSTOMVisualizationSOAPFunctionality: ITTCUSTOMVisualizationSOAPFunctionality;
begin
if FTTCUSTOMVisualizationSOAPFunctionality = nil
  then FTTCUSTOMVisualizationSOAPFunctionality:=GetITTCUSTOMVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCUSTOMVisualizationSOAPFunctionality;
end;


{TCUSTOMVisualizationFunctionality}
Constructor TCUSTOMVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCUSTOMVisualizationSOAPFunctionality:=nil;
end;

Destructor TCUSTOMVisualizationFunctionalityRemoted.Destroy;
begin
FTCUSTOMVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TCUSTOMVisualizationFunctionalityRemoted.TCUSTOMVisualizationSOAPFunctionality: ITCUSTOMVisualizationSOAPFunctionality;
begin
if FTCUSTOMVisualizationSOAPFunctionality = nil
  then FTCUSTOMVisualizationSOAPFunctionality:=GetITCUSTOMVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCUSTOMVisualizationSOAPFunctionality;
end;

function TCUSTOMVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TCUSTOMVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TCUSTOMVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TCUSTOMVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCUSTOMVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TCUSTOMVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCUSTOMVisualizationFunctionalityRemoted.getMODULEName: string;
begin
Result:=TCUSTOMVisualizationSOAPFunctionality.getMODULEName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCUSTOMVisualizationFunctionalityRemoted.setMODULEName(Value: string);
begin
TCUSTOMVisualizationSOAPFunctionality.setMODULEName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TCUSTOMVisualizationFunctionalityRemoted.getFunctionName: string;
begin
Result:=TCUSTOMVisualizationSOAPFunctionality.getFunctionName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCUSTOMVisualizationFunctionalityRemoted.setFunctionName(Value: string);
begin
TCUSTOMVisualizationSOAPFunctionality.setFunctionName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TCUSTOMVisualizationFunctionalityRemoted.getFunctionVersion: integer;
begin
Result:=TCUSTOMVisualizationSOAPFunctionality.getFunctionVersion(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCUSTOMVisualizationFunctionalityRemoted.setFunctionVersion(Value: integer);
begin
TCUSTOMVisualizationSOAPFunctionality.setFunctionVersion(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TCUSTOMVisualizationFunctionalityRemoted.GetParams(out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer);
begin
TCUSTOMVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oMODULEName,oFunctionName,oFunctionVersion);
end;


{TTOLEVisualizationFunctionality}
Constructor TTOLEVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTOLEVisualizationSOAPFunctionality:=nil;
end;

Destructor TTOLEVisualizationFunctionalityRemoted.Destroy;
begin
FTTOLEVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTOLEVisualizationFunctionalityRemoted.TTOLEVisualizationSOAPFunctionality: ITTOLEVisualizationSOAPFunctionality;
begin
if FTTOLEVisualizationSOAPFunctionality = nil
  then FTTOLEVisualizationSOAPFunctionality:=GetITTOLEVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOLEVisualizationSOAPFunctionality;
end;


{TOLEVisualizationFunctionality}
Constructor TOLEVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTOLEVisualizationSOAPFunctionality:=nil;
end;

Destructor TOLEVisualizationFunctionalityRemoted.Destroy;
begin
FTOLEVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TOLEVisualizationFunctionalityRemoted.TOLEVisualizationSOAPFunctionality: ITOLEVisualizationSOAPFunctionality;
begin
if FTOLEVisualizationSOAPFunctionality = nil
  then FTOLEVisualizationSOAPFunctionality:=GetITOLEVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOLEVisualizationSOAPFunctionality;
end;

function TOLEVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOLEVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TOLEVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TOLEVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOLEVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TOLEVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOLEVisualizationFunctionalityRemoted.GetDATA(out Value: TByteArray);
begin
TOLEVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TOLEVisualizationFunctionalityRemoted.GetDATA1(out Value: TByteArray; const MaxSize: integer);
begin
TOLEVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value,MaxSize);
end;

procedure TOLEVisualizationFunctionalityRemoted.SetDATA(Value: TByteArray);
begin
TOLEVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTHTMLVisualizationFunctionality}
Constructor TTHTMLVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTHTMLVisualizationSOAPFunctionality:=nil;
end;

Destructor TTHTMLVisualizationFunctionalityRemoted.Destroy;
begin
FTTHTMLVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTHTMLVisualizationFunctionalityRemoted.TTHTMLVisualizationSOAPFunctionality: ITTHTMLVisualizationSOAPFunctionality;
begin
if FTTHTMLVisualizationSOAPFunctionality = nil
  then FTTHTMLVisualizationSOAPFunctionality:=GetITTHTMLVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHTMLVisualizationSOAPFunctionality;
end;


{THTMLVisualizationFunctionality}
Constructor THTMLVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTHTMLVisualizationSOAPFunctionality:=nil;
end;

Destructor THTMLVisualizationFunctionalityRemoted.Destroy;
begin
FTHTMLVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function THTMLVisualizationFunctionalityRemoted.THTMLVisualizationSOAPFunctionality: ITHTMLVisualizationSOAPFunctionality;
begin
if FTHTMLVisualizationSOAPFunctionality = nil
  then FTHTMLVisualizationSOAPFunctionality:=GetITHTMLVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHTMLVisualizationSOAPFunctionality;
end;

function THTMLVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=THTMLVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function THTMLVisualizationFunctionalityRemoted.getName: string;
begin
Result:=THTMLVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function THTMLVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=THTMLVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function THTMLVisualizationFunctionalityRemoted.getWidth: integer;
begin
Result:=THTMLVisualizationSOAPFunctionality.getWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure THTMLVisualizationFunctionalityRemoted.setWidth(Value: integer);
begin
THTMLVisualizationSOAPFunctionality.setWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure THTMLVisualizationFunctionalityRemoted.GetDATA(out Value: TByteArray);
begin
THTMLVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure THTMLVisualizationFunctionalityRemoted.GetDATA1(out Value: TByteArray; const MaxSize: integer);
begin
THTMLVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value,MaxSize);
end;

procedure THTMLVisualizationFunctionalityRemoted.SetDATA(Value: TByteArray);
begin
THTMLVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTBZRVisualizationFunctionality}
Constructor TTBZRVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTBZRVisualizationSOAPFunctionality:=nil;
end;

Destructor TTBZRVisualizationFunctionalityRemoted.Destroy;
begin
FTTBZRVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTBZRVisualizationFunctionalityRemoted.TTBZRVisualizationSOAPFunctionality: ITTBZRVisualizationSOAPFunctionality;
begin
if FTTBZRVisualizationSOAPFunctionality = nil
  then FTTBZRVisualizationSOAPFunctionality:=GetITTBZRVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTBZRVisualizationSOAPFunctionality;
end;


{TBZRVisualizationFunctionality}
Constructor TBZRVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTBZRVisualizationSOAPFunctionality:=nil;
end;

Destructor TBZRVisualizationFunctionalityRemoted.Destroy;
begin
FTBZRVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TBZRVisualizationFunctionalityRemoted.TBZRVisualizationSOAPFunctionality: ITBZRVisualizationSOAPFunctionality;
begin
if FTBZRVisualizationSOAPFunctionality = nil
  then FTBZRVisualizationSOAPFunctionality:=GetITBZRVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTBZRVisualizationSOAPFunctionality;
end;

function TBZRVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TBZRVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TBZRVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TBZRVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TBZRVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TBZRVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTAGIFVisualizationFunctionality}
Constructor TTAGIFVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTAGIFVisualizationSOAPFunctionality:=nil;
end;

Destructor TTAGIFVisualizationFunctionalityRemoted.Destroy;
begin
FTTAGIFVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTAGIFVisualizationFunctionalityRemoted.TTAGIFVisualizationSOAPFunctionality: ITTAGIFVisualizationSOAPFunctionality;
begin
if FTTAGIFVisualizationSOAPFunctionality = nil
  then FTTAGIFVisualizationSOAPFunctionality:=GetITTAGIFVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTAGIFVisualizationSOAPFunctionality;
end;


{TAGIFVisualizationFunctionality}
Constructor TAGIFVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTAGIFVisualizationSOAPFunctionality:=nil;
end;

Destructor TAGIFVisualizationFunctionalityRemoted.Destroy;
begin
FTAGIFVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TAGIFVisualizationFunctionalityRemoted.TAGIFVisualizationSOAPFunctionality: ITAGIFVisualizationSOAPFunctionality;
begin
if FTAGIFVisualizationSOAPFunctionality = nil
  then FTAGIFVisualizationSOAPFunctionality:=GetITAGIFVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTAGIFVisualizationSOAPFunctionality;
end;

function TAGIFVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TAGIFVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TAGIFVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TAGIFVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TAGIFVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TAGIFVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TAGIFVisualizationFunctionalityRemoted.GetDATA(out Value: TByteArray);
begin
TAGIFVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TAGIFVisualizationFunctionalityRemoted.GetDATA1(out Value: TByteArray; const MaxSize: integer);
begin
TAGIFVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value,MaxSize);
end;

procedure TAGIFVisualizationFunctionalityRemoted.SetDATA(Value: TByteArray);
begin
TAGIFVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTOrientedVIDEOVisualizationFunctionality}
Constructor TTOrientedVIDEOVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTOrientedVIDEOVisualizationSOAPFunctionality:=nil;
end;

Destructor TTOrientedVIDEOVisualizationFunctionalityRemoted.Destroy;
begin
FTTOrientedVIDEOVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTOrientedVIDEOVisualizationFunctionalityRemoted.TTOrientedVIDEOVisualizationSOAPFunctionality: ITTOrientedVIDEOVisualizationSOAPFunctionality;
begin
if FTTOrientedVIDEOVisualizationSOAPFunctionality = nil
  then FTTOrientedVIDEOVisualizationSOAPFunctionality:=GetITTOrientedVIDEOVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOrientedVIDEOVisualizationSOAPFunctionality;
end;


{TOrientedVIDEOVisualizationFunctionality}
Constructor TOrientedVIDEOVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTOrientedVIDEOVisualizationSOAPFunctionality:=nil;
end;

Destructor TOrientedVIDEOVisualizationFunctionalityRemoted.Destroy;
begin
FTOrientedVIDEOVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TOrientedVIDEOVisualizationFunctionalityRemoted.TOrientedVIDEOVisualizationSOAPFunctionality: ITOrientedVIDEOVisualizationSOAPFunctionality;
begin
if FTOrientedVIDEOVisualizationSOAPFunctionality = nil
  then FTOrientedVIDEOVisualizationSOAPFunctionality:=GetITOrientedVIDEOVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOrientedVIDEOVisualizationSOAPFunctionality;
end;

function TOrientedVIDEOVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOrientedVIDEOVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TOrientedVIDEOVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TOrientedVIDEOVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOrientedVIDEOVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TOrientedVIDEOVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOrientedVIDEOVisualizationFunctionalityRemoted.getDataServer: string;
begin
Result:=TOrientedVIDEOVisualizationSOAPFunctionality.getDataServer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedVIDEOVisualizationFunctionalityRemoted.setDataServer(Value: string);
begin
TOrientedVIDEOVisualizationSOAPFunctionality.setDataServer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOrientedVIDEOVisualizationFunctionalityRemoted.getObjectID: integer;
begin
Result:=TOrientedVIDEOVisualizationSOAPFunctionality.getObjectID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedVIDEOVisualizationFunctionalityRemoted.setObjectID(Value: integer);
begin
TOrientedVIDEOVisualizationSOAPFunctionality.setObjectID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTVIDEOVisualizationFunctionality}
Constructor TTVIDEOVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTVIDEOVisualizationSOAPFunctionality:=nil;
end;

Destructor TTVIDEOVisualizationFunctionalityRemoted.Destroy;
begin
FTTVIDEOVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTVIDEOVisualizationFunctionalityRemoted.TTVIDEOVisualizationSOAPFunctionality: ITTVIDEOVisualizationSOAPFunctionality;
begin
if FTTVIDEOVisualizationSOAPFunctionality = nil
  then FTTVIDEOVisualizationSOAPFunctionality:=GetITTVIDEOVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTVIDEOVisualizationSOAPFunctionality;
end;


{TVIDEOVisualizationFunctionality}
Constructor TVIDEOVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTVIDEOVisualizationSOAPFunctionality:=nil;
end;

Destructor TVIDEOVisualizationFunctionalityRemoted.Destroy;
begin
FTVIDEOVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TVIDEOVisualizationFunctionalityRemoted.TVIDEOVisualizationSOAPFunctionality: ITVIDEOVisualizationSOAPFunctionality;
begin
if FTVIDEOVisualizationSOAPFunctionality = nil
  then FTVIDEOVisualizationSOAPFunctionality:=GetITVIDEOVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTVIDEOVisualizationSOAPFunctionality;
end;

function TVIDEOVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TVIDEOVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TVIDEOVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TVIDEOVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TVIDEOVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TVIDEOVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TVIDEOVisualizationFunctionalityRemoted.getDataServer: string;
begin
Result:=TVIDEOVisualizationSOAPFunctionality.getDataServer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TVIDEOVisualizationFunctionalityRemoted.setDataServer(Value: string);
begin
TVIDEOVisualizationSOAPFunctionality.setDataServer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TVIDEOVisualizationFunctionalityRemoted.getObjectID: integer;
begin
Result:=TVIDEOVisualizationSOAPFunctionality.getObjectID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TVIDEOVisualizationFunctionalityRemoted.setObjectID(Value: integer);
begin
TVIDEOVisualizationSOAPFunctionality.setObjectID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTOPPVisualizationFunctionality}
Constructor TTOPPVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTOPPVisualizationSOAPFunctionality:=nil;
end;

Destructor TTOPPVisualizationFunctionalityRemoted.Destroy;
begin
FTTOPPVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTOPPVisualizationFunctionalityRemoted.TTOPPVisualizationSOAPFunctionality: ITTOPPVisualizationSOAPFunctionality;
begin
if FTTOPPVisualizationSOAPFunctionality = nil
  then FTTOPPVisualizationSOAPFunctionality:=GetITTOPPVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOPPVisualizationSOAPFunctionality;
end;


{TOPPVisualizationFunctionality}
Constructor TOPPVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTOPPVisualizationSOAPFunctionality:=nil;
end;

Destructor TOPPVisualizationFunctionalityRemoted.Destroy;
begin
FTOPPVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TOPPVisualizationFunctionalityRemoted.TOPPVisualizationSOAPFunctionality: ITOPPVisualizationSOAPFunctionality;
begin
if FTOPPVisualizationSOAPFunctionality = nil
  then FTOPPVisualizationSOAPFunctionality:=GetITOPPVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOPPVisualizationSOAPFunctionality;
end;

function TOPPVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOPPVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TOPPVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TOPPVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOPPVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TOPPVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOPPVisualizationFunctionalityRemoted.getPropsPanel_idTObj: integer;
begin
Result:=TOPPVisualizationSOAPFunctionality.getPropsPanel_idTObj(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOPPVisualizationFunctionalityRemoted.setPropsPanel_idTObj(Value: integer);
begin
TOPPVisualizationSOAPFunctionality.setPropsPanel_idTObj(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOPPVisualizationFunctionalityRemoted.getPropsPanel_idObj: integer;
begin
Result:=TOPPVisualizationSOAPFunctionality.getPropsPanel_idObj(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOPPVisualizationFunctionalityRemoted.setPropsPanel_idObj(Value: integer);
begin
TOPPVisualizationSOAPFunctionality.setPropsPanel_idObj(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TOPPVisualizationFunctionalityRemoted.GetParams(out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer);
begin
TOPPVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oPropsPanel_idTObj,oPropsPanel_idObj);
end;


{TTMODELServerFunctionality}
Constructor TTMODELServerFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTMODELServerSOAPFunctionality:=nil;
end;

Destructor TTMODELServerFunctionalityRemoted.Destroy;
begin
FTTMODELServerSOAPFunctionality:=nil;
Inherited;
end;

function TTMODELServerFunctionalityRemoted.TTMODELServerSOAPFunctionality: ITTMODELServerSOAPFunctionality;
begin
if FTTMODELServerSOAPFunctionality = nil
  then FTTMODELServerSOAPFunctionality:=GetITTMODELServerSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMODELServerSOAPFunctionality;
end;

function TTMODELServerFunctionalityRemoted.GetInstanceByIPAddress(const IPAddress: string;  out id: integer): boolean;
begin
Result:=TTMODELServerSOAPFunctionality.GetInstanceByIPAddress(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   IPAddress,id);
end;


{TMODELServerFunctionality}
Constructor TMODELServerFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTMODELServerSOAPFunctionality:=nil;
end;

Destructor TMODELServerFunctionalityRemoted.Destroy;
begin
FTMODELServerSOAPFunctionality:=nil;
Inherited;
end;

function TMODELServerFunctionalityRemoted.TMODELServerSOAPFunctionality: ITMODELServerSOAPFunctionality;
begin
if FTMODELServerSOAPFunctionality = nil
  then FTMODELServerSOAPFunctionality:=GetITMODELServerSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMODELServerSOAPFunctionality;
end;

function TMODELServerFunctionalityRemoted.getName: string;
begin
Result:=TMODELServerSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELServerFunctionalityRemoted.setName(Value: string);
begin
TMODELServerSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELServerFunctionalityRemoted.getHint: string;
begin
Result:=TMODELServerSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMODELServerFunctionalityRemoted.getIPAddress: string;
begin
Result:=TMODELServerSOAPFunctionality.getIPAddress(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELServerFunctionalityRemoted.setIPAddress(Value: string);
begin
TMODELServerSOAPFunctionality.setIPAddress(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELServerFunctionalityRemoted.IsUserExist(const _UserName,_UserPassword: string): boolean;
begin
Result:=TMODELServerSOAPFunctionality.IsUserExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   _UserName,_UserPassword);
end;

function TMODELServerFunctionalityRemoted.GetUserID(const _UserName,_UserPassword: string): integer;
begin
Result:=TMODELServerSOAPFunctionality.GetUserID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   _UserName,_UserPassword);
end;

function TMODELServerFunctionalityRemoted.IsOnLine: boolean;
begin
Result:=TMODELServerSOAPFunctionality.IsOnLine(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMODELServerFunctionalityRemoted.Info: string;
begin
Result:=TMODELServerSOAPFunctionality.Info(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELServerFunctionalityRemoted.GetLicense(out License: WideString);
begin
TMODELServerSOAPFunctionality.GetLicense(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   License);
end;

procedure TMODELServerFunctionalityRemoted.CreateNewUserByDefaultPrototype(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer);
begin
TMODELServerSOAPFunctionality.CreateNewUserByDefaultPrototype(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,idNewUser);
end;

procedure TMODELServerFunctionalityRemoted.CreateNewUserByDefaultPrototype1(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString; const Signature: WideString;  out idNewUser: integer);
begin
TMODELServerSOAPFunctionality.CreateNewUserByDefaultPrototype1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,Signature,idNewUser);
end;


{TTCoReferenceFunctionality}
Constructor TTCoReferenceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCoReferenceSOAPFunctionality:=nil;
end;

Destructor TTCoReferenceFunctionalityRemoted.Destroy;
begin
FTTCoReferenceSOAPFunctionality:=nil;
Inherited;
end;

function TTCoReferenceFunctionalityRemoted.TTCoReferenceSOAPFunctionality: ITTCoReferenceSOAPFunctionality;
begin
if FTTCoReferenceSOAPFunctionality = nil
  then FTTCoReferenceSOAPFunctionality:=GetITTCoReferenceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCoReferenceSOAPFunctionality;
end;


{TCoReferenceFunctionality}
Constructor TCoReferenceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCoReferenceSOAPFunctionality:=nil;
end;

Destructor TCoReferenceFunctionalityRemoted.Destroy;
begin
FTCoReferenceSOAPFunctionality:=nil;
Inherited;
end;

function TCoReferenceFunctionalityRemoted.TCoReferenceSOAPFunctionality: ITCoReferenceSOAPFunctionality;
begin
if FTCoReferenceSOAPFunctionality = nil
  then FTCoReferenceSOAPFunctionality:=GetITCoReferenceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCoReferenceSOAPFunctionality;
end;

function TCoReferenceFunctionalityRemoted.getName: string;
begin
Result:=TCoReferenceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCoReferenceFunctionalityRemoted.setName(Value: string);
begin
TCoReferenceSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TCoReferenceFunctionalityRemoted.getHint: string;
begin
Result:=TCoReferenceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCoReferenceFunctionalityRemoted.GetReferencedObject(out idTReferencedObject,idReferencedObject: integer);
begin
TCoReferenceSOAPFunctionality.GetReferencedObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTReferencedObject,idReferencedObject);
end;

procedure TCoReferenceFunctionalityRemoted.SetReferencedObject(const idTReferencedObject,idReferencedObject: integer);
begin
TCoReferenceSOAPFunctionality.SetReferencedObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTReferencedObject,idReferencedObject);
end;


{TTPositionerFunctionality}
Constructor TTPositionerFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTPositionerSOAPFunctionality:=nil;
end;

Destructor TTPositionerFunctionalityRemoted.Destroy;
begin
FTTPositionerSOAPFunctionality:=nil;
Inherited;
end;

function TTPositionerFunctionalityRemoted.TTPositionerSOAPFunctionality: ITTPositionerSOAPFunctionality;
begin
if FTTPositionerSOAPFunctionality = nil
  then FTTPositionerSOAPFunctionality:=GetITTPositionerSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTPositionerSOAPFunctionality;
end;


{TPositionerFunctionality}
Constructor TPositionerFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTPositionerSOAPFunctionality:=nil;
end;

Destructor TPositionerFunctionalityRemoted.Destroy;
begin
FTPositionerSOAPFunctionality:=nil;
Inherited;
end;

function TPositionerFunctionalityRemoted.TPositionerSOAPFunctionality: ITPositionerSOAPFunctionality;
begin
if FTPositionerSOAPFunctionality = nil
  then FTPositionerSOAPFunctionality:=GetITPositionerSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTPositionerSOAPFunctionality;
end;

function TPositionerFunctionalityRemoted.getName: string;
begin
Result:=TPositionerSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TPositionerFunctionalityRemoted.getHint: string;
begin
Result:=TPositionerSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TPositionerFunctionalityRemoted.Get2DPosition(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TPositionerSOAPFunctionality.Get2DPosition(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TPositionerFunctionalityRemoted.Save2DPosition(const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TPositionerSOAPFunctionality.Save2DPosition(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

function TPositionerFunctionalityRemoted.getPositionName: string;
begin
Result:=TPositionerSOAPFunctionality.getPositionName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TPositionerFunctionalityRemoted.setPositionName(Value: string);
begin
TPositionerSOAPFunctionality.setPositionName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTOrientedWMFVisualizationFunctionality}
Constructor TTOrientedWMFVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTOrientedWMFVisualizationSOAPFunctionality:=nil;
end;

Destructor TTOrientedWMFVisualizationFunctionalityRemoted.Destroy;
begin
FTTOrientedWMFVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTOrientedWMFVisualizationFunctionalityRemoted.TTOrientedWMFVisualizationSOAPFunctionality: ITTOrientedWMFVisualizationSOAPFunctionality;
begin
if FTTOrientedWMFVisualizationSOAPFunctionality = nil
  then FTTOrientedWMFVisualizationSOAPFunctionality:=GetITTOrientedWMFVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOrientedWMFVisualizationSOAPFunctionality;
end;


{TOrientedWMFVisualizationFunctionality}
Constructor TOrientedWMFVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTOrientedWMFVisualizationSOAPFunctionality:=nil;
end;

Destructor TOrientedWMFVisualizationFunctionalityRemoted.Destroy;
begin
FTOrientedWMFVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TOrientedWMFVisualizationFunctionalityRemoted.TOrientedWMFVisualizationSOAPFunctionality: ITOrientedWMFVisualizationSOAPFunctionality;
begin
if FTOrientedWMFVisualizationSOAPFunctionality = nil
  then FTOrientedWMFVisualizationSOAPFunctionality:=GetITOrientedWMFVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOrientedWMFVisualizationSOAPFunctionality;
end;

function TOrientedWMFVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOrientedWMFVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TOrientedWMFVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TOrientedWMFVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOrientedWMFVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TOrientedWMFVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TOrientedWMFVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TOrientedWMFVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
TOrientedWMFVisualizationSOAPFunctionality.GetJPEGDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TOrientedWMFVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

function TOrientedWMFVisualizationFunctionalityRemoted.getWidth: Double;
begin
Result:=TOrientedWMFVisualizationSOAPFunctionality.getWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.setWidth(Value: Double);
begin
TOrientedWMFVisualizationSOAPFunctionality.setWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOrientedWMFVisualizationFunctionalityRemoted.getHeight: Double;
begin
Result:=TOrientedWMFVisualizationSOAPFunctionality.getHeight(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.setHeight(Value: Double);
begin
TOrientedWMFVisualizationSOAPFunctionality.setHeight(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOrientedWMFVisualizationFunctionalityRemoted.getOrientation: integer;
begin
Result:=TOrientedWMFVisualizationSOAPFunctionality.getOrientation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.setOrientation(Value: integer);
begin
TOrientedWMFVisualizationSOAPFunctionality.setOrientation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.ChangeScale(const ScaleFactor: Double);
begin
TOrientedWMFVisualizationSOAPFunctionality.ChangeScale(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ScaleFactor);
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.UpdateContainer;
begin
TOrientedWMFVisualizationSOAPFunctionality.UpdateContainer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOrientedWMFVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
Result:=TOrientedWMFVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
TOrientedWMFVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
TOrientedWMFVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOrientedWMFVisualizationFunctionalityRemoted.IsNewContainerAcceptable(const NewWidth,NewHeight,NewScale: Double): boolean;
begin
Result:=TOrientedWMFVisualizationSOAPFunctionality.IsNewContainerAcceptable(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewWidth,NewHeight,NewScale);
end;

procedure TOrientedWMFVisualizationFunctionalityRemoted.GetParams(out oWidth: Double; out oHeight: Double; out oOrientation: integer);
begin
TOrientedWMFVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oWidth,oHeight,oOrientation);
end;


{TTCELLVisualizationFunctionality}
Constructor TTCELLVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCELLVisualizationSOAPFunctionality:=nil;
end;

Destructor TTCELLVisualizationFunctionalityRemoted.Destroy;
begin
FTTCELLVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTCELLVisualizationFunctionalityRemoted.TTCELLVisualizationSOAPFunctionality: ITTCELLVisualizationSOAPFunctionality;
begin
if FTTCELLVisualizationSOAPFunctionality = nil
  then FTTCELLVisualizationSOAPFunctionality:=GetITTCELLVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCELLVisualizationSOAPFunctionality;
end;


{TCELLVisualizationFunctionality}
Constructor TCELLVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCELLVisualizationSOAPFunctionality:=nil;
end;

Destructor TCELLVisualizationFunctionalityRemoted.Destroy;
begin
FTCELLVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TCELLVisualizationFunctionalityRemoted.TCELLVisualizationSOAPFunctionality: ITCELLVisualizationSOAPFunctionality;
begin
if FTCELLVisualizationSOAPFunctionality = nil
  then FTCELLVisualizationSOAPFunctionality:=GetITCELLVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCELLVisualizationSOAPFunctionality;
end;

function TCELLVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TCELLVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TCELLVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TCELLVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCELLVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TCELLVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCELLVisualizationFunctionalityRemoted.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TCELLVisualizationSOAPFunctionality.GetCoordinates(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TCELLVisualizationFunctionalityRemoted.Change(const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer);
begin
TCELLVisualizationSOAPFunctionality.Change(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows);
end;

function TCELLVisualizationFunctionalityRemoted.GetFormatNodes(out NodesList: TByteArray; out SizeX,SizeY: integer): boolean;
begin
Result:=TCELLVisualizationSOAPFunctionality.GetFormatNodes(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NodesList,SizeX,SizeY);
end;

procedure TCELLVisualizationFunctionalityRemoted.DoQuad;
begin
TCELLVisualizationSOAPFunctionality.DoQuad(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCELLVisualizationFunctionalityRemoted.GetInsideObjectsList(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray);
begin
TCELLVisualizationSOAPFunctionality.GetInsideObjectsList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   FindTypeID,flBuiltInType,List);
end;

function TCELLVisualizationFunctionalityRemoted.getColCount: integer;
begin
Result:=TCELLVisualizationSOAPFunctionality.getColCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCELLVisualizationFunctionalityRemoted.setColCount(Value: integer);
begin
TCELLVisualizationSOAPFunctionality.setColCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TCELLVisualizationFunctionalityRemoted.getRowCount: integer;
begin
Result:=TCELLVisualizationSOAPFunctionality.getRowCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCELLVisualizationFunctionalityRemoted.setRowCount(Value: integer);
begin
TCELLVisualizationSOAPFunctionality.setRowCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TCELLVisualizationFunctionalityRemoted.getLineWidth: Double;
begin
Result:=TCELLVisualizationSOAPFunctionality.getLineWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCELLVisualizationFunctionalityRemoted.setLineWidth(Value: Double);
begin
TCELLVisualizationSOAPFunctionality.setLineWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TCELLVisualizationFunctionalityRemoted.getColSize: Double;
begin
Result:=TCELLVisualizationSOAPFunctionality.getColSize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCELLVisualizationFunctionalityRemoted.getRowSize: Double;
begin
Result:=TCELLVisualizationSOAPFunctionality.getRowSize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCELLVisualizationFunctionalityRemoted.GetParams(out oColCount: integer; out oRowCount: integer; out oLineWidth: Double);
begin
TCELLVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oColCount,oRowCount,oLineWidth);
end;


{TTEllipseVisualizationFunctionality}
Constructor TTEllipseVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTEllipseVisualizationSOAPFunctionality:=nil;
end;

Destructor TTEllipseVisualizationFunctionalityRemoted.Destroy;
begin
FTTEllipseVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTEllipseVisualizationFunctionalityRemoted.TTEllipseVisualizationSOAPFunctionality: ITTEllipseVisualizationSOAPFunctionality;
begin
if FTTEllipseVisualizationSOAPFunctionality = nil
  then FTTEllipseVisualizationSOAPFunctionality:=GetITTEllipseVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTEllipseVisualizationSOAPFunctionality;
end;


{TEllipseVisualizationFunctionality}
Constructor TEllipseVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTEllipseVisualizationSOAPFunctionality:=nil;
end;

Destructor TEllipseVisualizationFunctionalityRemoted.Destroy;
begin
FTEllipseVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TEllipseVisualizationFunctionalityRemoted.TEllipseVisualizationSOAPFunctionality: ITEllipseVisualizationSOAPFunctionality;
begin
if FTEllipseVisualizationSOAPFunctionality = nil
  then FTEllipseVisualizationSOAPFunctionality:=GetITEllipseVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTEllipseVisualizationSOAPFunctionality;
end;

function TEllipseVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TEllipseVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TEllipseVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TEllipseVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TEllipseVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TEllipseVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TEllipseVisualizationFunctionalityRemoted.getColor: TColor;
begin
Result:=TEllipseVisualizationSOAPFunctionality.getColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TEllipseVisualizationFunctionalityRemoted.setColor(Value: TColor);
begin
TEllipseVisualizationSOAPFunctionality.setColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TEllipseVisualizationFunctionalityRemoted.getBorderColor: TColor;
begin
Result:=TEllipseVisualizationSOAPFunctionality.getBorderColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TEllipseVisualizationFunctionalityRemoted.setBorderColor(Value: TColor);
begin
TEllipseVisualizationSOAPFunctionality.setBorderColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TEllipseVisualizationFunctionalityRemoted.getBorderWidth: Double;
begin
Result:=TEllipseVisualizationSOAPFunctionality.getBorderWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TEllipseVisualizationFunctionalityRemoted.setBorderWidth(Value: Double);
begin
TEllipseVisualizationSOAPFunctionality.setBorderWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTWMFVisualizationFunctionality}
Constructor TTWMFVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTWMFVisualizationSOAPFunctionality:=nil;
end;

Destructor TTWMFVisualizationFunctionalityRemoted.Destroy;
begin
FTTWMFVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTWMFVisualizationFunctionalityRemoted.TTWMFVisualizationSOAPFunctionality: ITTWMFVisualizationSOAPFunctionality;
begin
if FTTWMFVisualizationSOAPFunctionality = nil
  then FTTWMFVisualizationSOAPFunctionality:=GetITTWMFVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTWMFVisualizationSOAPFunctionality;
end;


{TWMFVisualizationFunctionality}
Constructor TWMFVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTWMFVisualizationSOAPFunctionality:=nil;
end;

Destructor TWMFVisualizationFunctionalityRemoted.Destroy;
begin
FTWMFVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TWMFVisualizationFunctionalityRemoted.TWMFVisualizationSOAPFunctionality: ITWMFVisualizationSOAPFunctionality;
begin
if FTWMFVisualizationSOAPFunctionality = nil
  then FTWMFVisualizationSOAPFunctionality:=GetITWMFVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTWMFVisualizationSOAPFunctionality;
end;

function TWMFVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TWMFVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TWMFVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TWMFVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TWMFVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TWMFVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TWMFVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TWMFVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TWMFVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
end;

procedure TWMFVisualizationFunctionalityRemoted.GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
TWMFVisualizationSOAPFunctionality.GetJPEGDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TWMFVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TWMFVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

function TWMFVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
Result:=TWMFVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TWMFVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
TWMFVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TWMFVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
TWMFVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TWMFVisualizationFunctionalityRemoted.SetProportion;
begin
TWMFVisualizationSOAPFunctionality.SetProportion(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTPictureVisualizationFunctionality}
Constructor TTPictureVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTPictureVisualizationSOAPFunctionality:=nil;
end;

Destructor TTPictureVisualizationFunctionalityRemoted.Destroy;
begin
FTTPictureVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTPictureVisualizationFunctionalityRemoted.TTPictureVisualizationSOAPFunctionality: ITTPictureVisualizationSOAPFunctionality;
begin
if FTTPictureVisualizationSOAPFunctionality = nil
  then FTTPictureVisualizationSOAPFunctionality:=GetITTPictureVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTPictureVisualizationSOAPFunctionality;
end;


{TPictureVisualizationFunctionality}
Constructor TPictureVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTPictureVisualizationSOAPFunctionality:=nil;
end;

Destructor TPictureVisualizationFunctionalityRemoted.Destroy;
begin
FTPictureVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TPictureVisualizationFunctionalityRemoted.TPictureVisualizationSOAPFunctionality: ITPictureVisualizationSOAPFunctionality;
begin
if FTPictureVisualizationSOAPFunctionality = nil
  then FTPictureVisualizationSOAPFunctionality:=GetITPictureVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTPictureVisualizationSOAPFunctionality;
end;

function TPictureVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TPictureVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TPictureVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TPictureVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TPictureVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TPictureVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TPictureVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TPictureVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TPictureVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
end;

procedure TPictureVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TPictureVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionalityRemoted.GetBMP(out BMP: TByteArray);
begin
TPictureVisualizationSOAPFunctionality.GetBMP(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   BMP);
end;

procedure TPictureVisualizationFunctionalityRemoted.SetProportion;
begin
TPictureVisualizationSOAPFunctionality.SetProportion(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TPictureVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
Result:=TPictureVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TPictureVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
TPictureVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TPictureVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
TPictureVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TPictureVisualizationFunctionalityRemoted.GetParams(out VisibleMinScale: double; out VisibleMaxScale: double);
begin
TPictureVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   VisibleMinScale,VisibleMaxScale);
end;

procedure TPictureVisualizationFunctionalityRemoted.SetParams(const VisibleMinScale: double; const VisibleMaxScale: double);
begin
TPictureVisualizationSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   VisibleMinScale,VisibleMaxScale);
end;


{TTRoundVisualizationFunctionality}
Constructor TTRoundVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTRoundVisualizationSOAPFunctionality:=nil;
end;

Destructor TTRoundVisualizationFunctionalityRemoted.Destroy;
begin
FTTRoundVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTRoundVisualizationFunctionalityRemoted.TTRoundVisualizationSOAPFunctionality: ITTRoundVisualizationSOAPFunctionality;
begin
if FTTRoundVisualizationSOAPFunctionality = nil
  then FTTRoundVisualizationSOAPFunctionality:=GetITTRoundVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTRoundVisualizationSOAPFunctionality;
end;


{TRoundVisualizationFunctionality}
Constructor TRoundVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTRoundVisualizationSOAPFunctionality:=nil;
end;

Destructor TRoundVisualizationFunctionalityRemoted.Destroy;
begin
FTRoundVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TRoundVisualizationFunctionalityRemoted.TRoundVisualizationSOAPFunctionality: ITRoundVisualizationSOAPFunctionality;
begin
if FTRoundVisualizationSOAPFunctionality = nil
  then FTRoundVisualizationSOAPFunctionality:=GetITRoundVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTRoundVisualizationSOAPFunctionality;
end;

function TRoundVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TRoundVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TRoundVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TRoundVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TRoundVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TRoundVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TRoundVisualizationFunctionalityRemoted.getColor: TColor;
begin
Result:=TRoundVisualizationSOAPFunctionality.getColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TRoundVisualizationFunctionalityRemoted.setColor(Value: TColor);
begin
TRoundVisualizationSOAPFunctionality.setColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TRoundVisualizationFunctionalityRemoted.getBorderColor: TColor;
begin
Result:=TRoundVisualizationSOAPFunctionality.getBorderColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TRoundVisualizationFunctionalityRemoted.setBorderColor(Value: TColor);
begin
TRoundVisualizationSOAPFunctionality.setBorderColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TRoundVisualizationFunctionalityRemoted.getBorderWidth: Double;
begin
Result:=TRoundVisualizationSOAPFunctionality.getBorderWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TRoundVisualizationFunctionalityRemoted.setBorderWidth(Value: Double);
begin
TRoundVisualizationSOAPFunctionality.setBorderWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTGeodesyPointFunctionality}
Constructor TTGeodesyPointFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTGeodesyPointSOAPFunctionality:=nil;
end;

Destructor TTGeodesyPointFunctionalityRemoted.Destroy;
begin
FTTGeodesyPointSOAPFunctionality:=nil;
Inherited;
end;

function TTGeodesyPointFunctionalityRemoted.TTGeodesyPointSOAPFunctionality: ITTGeodesyPointSOAPFunctionality;
begin
if FTTGeodesyPointSOAPFunctionality = nil
  then FTTGeodesyPointSOAPFunctionality:=GetITTGeodesyPointSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTGeodesyPointSOAPFunctionality;
end;

function TTGeodesyPointFunctionalityRemoted.ConvertSpaceCRDToGeoCRD(const X,Y: Double; out Latitude,Longitude: Double): boolean;
begin
Result:=TTGeodesyPointSOAPFunctionality.ConvertSpaceCRDToGeoCRD(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   X,Y,Latitude,Longitude);
end;

function TTGeodesyPointFunctionalityRemoted.ConvertGeoCRDToSpaceCRD(const Latitude,Longitude: Double; out X,Y: Double): boolean;
begin
Result:=TTGeodesyPointSOAPFunctionality.ConvertGeoCRDToSpaceCRD(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Latitude,Longitude,X,Y);
end;

procedure TTGeodesyPointFunctionalityRemoted.GetNearestCrdSys(const pLatitude,pLongitude: double; out idCrdSys: integer);
begin
TTGeodesyPointSOAPFunctionality.GetNearestCrdSys(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeodesyPointFunctionalityRemoted.GetInstanceListByCrdSys(const idCrdSys: integer; out List: TByteArray);
begin
TTGeodesyPointSOAPFunctionality.GetInstanceListByCrdSys(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   idCrdSys,List);
end;

function TTGeodesyPointFunctionalityRemoted.CrdSys_GetNearestGeoPoints(const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean;
begin
Result:=TTGeodesyPointSOAPFunctionality.CrdSys_GetNearestGeoPoints(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   idCrdSys,pLatitude,pLongitude,PointsCount,Points);
end;

function TTGeodesyPointFunctionalityRemoted.CrdSys_GetNearestXYPoints(const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean;
begin
Result:=TTGeodesyPointSOAPFunctionality.CrdSys_GetNearestXYPoints(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   idCrdSys,pX,pY,PointsCount,Points);
end;


{TGeodesyPointFunctionality}
Constructor TGeodesyPointFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTGeodesyPointSOAPFunctionality:=nil;
end;

Destructor TGeodesyPointFunctionalityRemoted.Destroy;
begin
FTGeodesyPointSOAPFunctionality:=nil;
Inherited;
end;

function TGeodesyPointFunctionalityRemoted.TGeodesyPointSOAPFunctionality: ITGeodesyPointSOAPFunctionality;
begin
if FTGeodesyPointSOAPFunctionality = nil
  then FTGeodesyPointSOAPFunctionality:=GetITGeodesyPointSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTGeodesyPointSOAPFunctionality;
end;

function TGeodesyPointFunctionalityRemoted.getName: string;
begin
Result:=TGeodesyPointSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TGeodesyPointFunctionalityRemoted.getHint: string;
begin
Result:=TGeodesyPointSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TGeodesyPointFunctionalityRemoted.getidCrdSys: integer;
begin
Result:=TGeodesyPointSOAPFunctionality.getidCrdSys(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeodesyPointFunctionalityRemoted.setidCrdSys(Value: integer);
begin
TGeodesyPointSOAPFunctionality.setidCrdSys(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeodesyPointFunctionalityRemoted.getX: Double;
begin
Result:=TGeodesyPointSOAPFunctionality.getX(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeodesyPointFunctionalityRemoted.setX(Value: Double);
begin
TGeodesyPointSOAPFunctionality.setX(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeodesyPointFunctionalityRemoted.getY: Double;
begin
Result:=TGeodesyPointSOAPFunctionality.getY(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeodesyPointFunctionalityRemoted.setY(Value: Double);
begin
TGeodesyPointSOAPFunctionality.setY(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeodesyPointFunctionalityRemoted.getLatitude: Double;
begin
Result:=TGeodesyPointSOAPFunctionality.getLatitude(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeodesyPointFunctionalityRemoted.setLatitude(Value: Double);
begin
TGeodesyPointSOAPFunctionality.setLatitude(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGeodesyPointFunctionalityRemoted.getLongitude: Double;
begin
Result:=TGeodesyPointSOAPFunctionality.getLongitude(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGeodesyPointFunctionalityRemoted.setLongitude(Value: Double);
begin
TGeodesyPointSOAPFunctionality.setLongitude(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TGeodesyPointFunctionalityRemoted.GetParams(out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double);
begin
TGeodesyPointSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oidCrdSys,oX,oY,oLatitude,oLongitude);
end;

procedure TGeodesyPointFunctionalityRemoted.SetParams(const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double);
begin
TGeodesyPointSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pidCrdSys,pX,pY,pLatitude,pLongitude);
end;

procedure TGeodesyPointFunctionalityRemoted.ValidateByVisualizationComponent;
begin
TGeodesyPointSOAPFunctionality.ValidateByVisualizationComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTPrivateAreaVisualizationFunctionality}
Constructor TTPrivateAreaVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTPrivateAreaVisualizationSOAPFunctionality:=nil;
end;

Destructor TTPrivateAreaVisualizationFunctionalityRemoted.Destroy;
begin
FTTPrivateAreaVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTPrivateAreaVisualizationFunctionalityRemoted.TTPrivateAreaVisualizationSOAPFunctionality: ITTPrivateAreaVisualizationSOAPFunctionality;
begin
if FTTPrivateAreaVisualizationSOAPFunctionality = nil
  then FTTPrivateAreaVisualizationSOAPFunctionality:=GetITTPrivateAreaVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTPrivateAreaVisualizationSOAPFunctionality;
end;

function TTPrivateAreaVisualizationFunctionalityRemoted.CanCreateAsDetail: boolean;
begin
Result:=TTPrivateAreaVisualizationSOAPFunctionality.CanCreateAsDetail(TypeFunctionality.UserName,TypeFunctionality.UserPassword);
end;


{TPrivateAreaVisualizationFunctionality}
Constructor TPrivateAreaVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTPrivateAreaVisualizationSOAPFunctionality:=nil;
end;

Destructor TPrivateAreaVisualizationFunctionalityRemoted.Destroy;
begin
FTPrivateAreaVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TPrivateAreaVisualizationFunctionalityRemoted.TPrivateAreaVisualizationSOAPFunctionality: ITPrivateAreaVisualizationSOAPFunctionality;
begin
if FTPrivateAreaVisualizationSOAPFunctionality = nil
  then FTPrivateAreaVisualizationSOAPFunctionality:=GetITPrivateAreaVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTPrivateAreaVisualizationSOAPFunctionality;
end;

function TPrivateAreaVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TPrivateAreaVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TPrivateAreaVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TPrivateAreaVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TPrivateAreaVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TPrivateAreaVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TPrivateAreaVisualizationFunctionalityRemoted.getAcquireObjectsInside: boolean;
begin
Result:=TPrivateAreaVisualizationSOAPFunctionality.getAcquireObjectsInside(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TPrivateAreaVisualizationFunctionalityRemoted.setAcquireObjectsInside(Value: boolean);
begin
TPrivateAreaVisualizationSOAPFunctionality.setAcquireObjectsInside(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTHyperTextFunctionality}
Constructor TTHyperTextFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTHyperTextSOAPFunctionality:=nil;
end;

Destructor TTHyperTextFunctionalityRemoted.Destroy;
begin
FTTHyperTextSOAPFunctionality:=nil;
Inherited;
end;

function TTHyperTextFunctionalityRemoted.TTHyperTextSOAPFunctionality: ITTHyperTextSOAPFunctionality;
begin
if FTTHyperTextSOAPFunctionality = nil
  then FTTHyperTextSOAPFunctionality:=GetITTHyperTextSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHyperTextSOAPFunctionality;
end;


{THyperTextFunctionality}
Constructor THyperTextFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTHyperTextSOAPFunctionality:=nil;
end;

Destructor THyperTextFunctionalityRemoted.Destroy;
begin
FTHyperTextSOAPFunctionality:=nil;
Inherited;
end;

function THyperTextFunctionalityRemoted.THyperTextSOAPFunctionality: ITHyperTextSOAPFunctionality;
begin
if FTHyperTextSOAPFunctionality = nil
  then FTHyperTextSOAPFunctionality:=GetITHyperTextSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHyperTextSOAPFunctionality;
end;

function THyperTextFunctionalityRemoted.getName: string;
begin
Result:=THyperTextSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function THyperTextFunctionalityRemoted.getHint: string;
begin
Result:=THyperTextSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure THyperTextFunctionalityRemoted.GetDATA(out Value: TByteArray);
begin
THyperTextSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure THyperTextFunctionalityRemoted.SetDATA(Value: TByteArray);
begin
THyperTextSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTComponentsFindServiceFunctionality}
Constructor TTComponentsFindServiceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTComponentsFindServiceSOAPFunctionality:=nil;
end;

Destructor TTComponentsFindServiceFunctionalityRemoted.Destroy;
begin
FTTComponentsFindServiceSOAPFunctionality:=nil;
Inherited;
end;

function TTComponentsFindServiceFunctionalityRemoted.TTComponentsFindServiceSOAPFunctionality: ITTComponentsFindServiceSOAPFunctionality;
begin
if FTTComponentsFindServiceSOAPFunctionality = nil
  then FTTComponentsFindServiceSOAPFunctionality:=GetITTComponentsFindServiceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTComponentsFindServiceSOAPFunctionality;
end;


{TComponentsFindServiceFunctionality}
Constructor TComponentsFindServiceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTComponentsFindServiceSOAPFunctionality:=nil;
end;

Destructor TComponentsFindServiceFunctionalityRemoted.Destroy;
begin
FTComponentsFindServiceSOAPFunctionality:=nil;
Inherited;
end;

function TComponentsFindServiceFunctionalityRemoted.TComponentsFindServiceSOAPFunctionality: ITComponentsFindServiceSOAPFunctionality;
begin
if FTComponentsFindServiceSOAPFunctionality = nil
  then FTComponentsFindServiceSOAPFunctionality:=GetITComponentsFindServiceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTComponentsFindServiceSOAPFunctionality;
end;

function TComponentsFindServiceFunctionalityRemoted.getName: string;
begin
Result:=TComponentsFindServiceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TComponentsFindServiceFunctionalityRemoted.getHint: string;
begin
Result:=TComponentsFindServiceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTUsersServiceFunctionality}
Constructor TTUsersServiceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTUsersServiceSOAPFunctionality:=nil;
end;

Destructor TTUsersServiceFunctionalityRemoted.Destroy;
begin
FTTUsersServiceSOAPFunctionality:=nil;
Inherited;
end;

function TTUsersServiceFunctionalityRemoted.TTUsersServiceSOAPFunctionality: ITTUsersServiceSOAPFunctionality;
begin
if FTTUsersServiceSOAPFunctionality = nil
  then FTTUsersServiceSOAPFunctionality:=GetITTUsersServiceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTUsersServiceSOAPFunctionality;
end;


{TUsersServiceFunctionality}
Constructor TUsersServiceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTUsersServiceSOAPFunctionality:=nil;
end;

Destructor TUsersServiceFunctionalityRemoted.Destroy;
begin
FTUsersServiceSOAPFunctionality:=nil;
Inherited;
end;

function TUsersServiceFunctionalityRemoted.TUsersServiceSOAPFunctionality: ITUsersServiceSOAPFunctionality;
begin
if FTUsersServiceSOAPFunctionality = nil
  then FTUsersServiceSOAPFunctionality:=GetITUsersServiceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTUsersServiceSOAPFunctionality;
end;

function TUsersServiceFunctionalityRemoted.getName: string;
begin
Result:=TUsersServiceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TUsersServiceFunctionalityRemoted.getHint: string;
begin
Result:=TUsersServiceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTTransportServiceFunctionality}
Constructor TTTransportServiceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTTransportServiceSOAPFunctionality:=nil;
end;

Destructor TTTransportServiceFunctionalityRemoted.Destroy;
begin
FTTTransportServiceSOAPFunctionality:=nil;
Inherited;
end;

function TTTransportServiceFunctionalityRemoted.TTTransportServiceSOAPFunctionality: ITTTransportServiceSOAPFunctionality;
begin
if FTTTransportServiceSOAPFunctionality = nil
  then FTTTransportServiceSOAPFunctionality:=GetITTTransportServiceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTransportServiceSOAPFunctionality;
end;


{TTransportServiceFunctionality}
Constructor TTransportServiceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTTransportServiceSOAPFunctionality:=nil;
end;

Destructor TTransportServiceFunctionalityRemoted.Destroy;
begin
FTTransportServiceSOAPFunctionality:=nil;
Inherited;
end;

function TTransportServiceFunctionalityRemoted.TTransportServiceSOAPFunctionality: ITTransportServiceSOAPFunctionality;
begin
if FTTransportServiceSOAPFunctionality = nil
  then FTTransportServiceSOAPFunctionality:=GetITTransportServiceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTransportServiceSOAPFunctionality;
end;

function TTransportServiceFunctionalityRemoted.getName: string;
begin
Result:=TTransportServiceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTransportServiceFunctionalityRemoted.getHint: string;
begin
Result:=TTransportServiceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTMarketServiceFunctionality}
Constructor TTMarketServiceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTMarketServiceSOAPFunctionality:=nil;
end;

Destructor TTMarketServiceFunctionalityRemoted.Destroy;
begin
FTTMarketServiceSOAPFunctionality:=nil;
Inherited;
end;

function TTMarketServiceFunctionalityRemoted.TTMarketServiceSOAPFunctionality: ITTMarketServiceSOAPFunctionality;
begin
if FTTMarketServiceSOAPFunctionality = nil
  then FTTMarketServiceSOAPFunctionality:=GetITTMarketServiceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMarketServiceSOAPFunctionality;
end;


{TMarketServiceFunctionality}
Constructor TMarketServiceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTMarketServiceSOAPFunctionality:=nil;
end;

Destructor TMarketServiceFunctionalityRemoted.Destroy;
begin
FTMarketServiceSOAPFunctionality:=nil;
Inherited;
end;

function TMarketServiceFunctionalityRemoted.TMarketServiceSOAPFunctionality: ITMarketServiceSOAPFunctionality;
begin
if FTMarketServiceSOAPFunctionality = nil
  then FTMarketServiceSOAPFunctionality:=GetITMarketServiceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMarketServiceSOAPFunctionality;
end;

function TMarketServiceFunctionalityRemoted.getName: string;
begin
Result:=TMarketServiceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMarketServiceFunctionalityRemoted.getHint: string;
begin
Result:=TMarketServiceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTTelecomServiceFunctionality}
Constructor TTTelecomServiceFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTTelecomServiceSOAPFunctionality:=nil;
end;

Destructor TTTelecomServiceFunctionalityRemoted.Destroy;
begin
FTTTelecomServiceSOAPFunctionality:=nil;
Inherited;
end;

function TTTelecomServiceFunctionalityRemoted.TTTelecomServiceSOAPFunctionality: ITTTelecomServiceSOAPFunctionality;
begin
if FTTTelecomServiceSOAPFunctionality = nil
  then FTTTelecomServiceSOAPFunctionality:=GetITTTelecomServiceSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTelecomServiceSOAPFunctionality;
end;


{TTelecomServiceFunctionality}
Constructor TTelecomServiceFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTTelecomServiceSOAPFunctionality:=nil;
end;

Destructor TTelecomServiceFunctionalityRemoted.Destroy;
begin
FTTelecomServiceSOAPFunctionality:=nil;
Inherited;
end;

function TTelecomServiceFunctionalityRemoted.TTelecomServiceSOAPFunctionality: ITTelecomServiceSOAPFunctionality;
begin
if FTTelecomServiceSOAPFunctionality = nil
  then FTTelecomServiceSOAPFunctionality:=GetITTelecomServiceSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTelecomServiceSOAPFunctionality;
end;

function TTelecomServiceFunctionalityRemoted.getName: string;
begin
Result:=TTelecomServiceSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTelecomServiceFunctionalityRemoted.getHint: string;
begin
Result:=TTelecomServiceSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTWNDVisualizationFunctionality}
Constructor TTWNDVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTWNDVisualizationSOAPFunctionality:=nil;
end;

Destructor TTWNDVisualizationFunctionalityRemoted.Destroy;
begin
FTTWNDVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTWNDVisualizationFunctionalityRemoted.TTWNDVisualizationSOAPFunctionality: ITTWNDVisualizationSOAPFunctionality;
begin
if FTTWNDVisualizationSOAPFunctionality = nil
  then FTTWNDVisualizationSOAPFunctionality:=GetITTWNDVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTWNDVisualizationSOAPFunctionality;
end;


{TWNDVisualizationFunctionality}
Constructor TWNDVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTWNDVisualizationSOAPFunctionality:=nil;
end;

Destructor TWNDVisualizationFunctionalityRemoted.Destroy;
begin
FTWNDVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TWNDVisualizationFunctionalityRemoted.TWNDVisualizationSOAPFunctionality: ITWNDVisualizationSOAPFunctionality;
begin
if FTWNDVisualizationSOAPFunctionality = nil
  then FTWNDVisualizationSOAPFunctionality:=GetITWNDVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTWNDVisualizationSOAPFunctionality;
end;

function TWNDVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TWNDVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TWNDVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TWNDVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TWNDVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TWNDVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TWNDVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TWNDVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TWNDVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
end;

procedure TWNDVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TWNDVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

function TWNDVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
Result:=TWNDVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TWNDVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
TWNDVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TWNDVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
TWNDVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTMRKVisualizationFunctionality}
Constructor TTMRKVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTMRKVisualizationSOAPFunctionality:=nil;
end;

Destructor TTMRKVisualizationFunctionalityRemoted.Destroy;
begin
FTTMRKVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTMRKVisualizationFunctionalityRemoted.TTMRKVisualizationSOAPFunctionality: ITTMRKVisualizationSOAPFunctionality;
begin
if FTTMRKVisualizationSOAPFunctionality = nil
  then FTTMRKVisualizationSOAPFunctionality:=GetITTMRKVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMRKVisualizationSOAPFunctionality;
end;


{TMRKVisualizationFunctionality}
Constructor TMRKVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTMRKVisualizationSOAPFunctionality:=nil;
end;

Destructor TMRKVisualizationFunctionalityRemoted.Destroy;
begin
FTMRKVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TMRKVisualizationFunctionalityRemoted.TMRKVisualizationSOAPFunctionality: ITMRKVisualizationSOAPFunctionality;
begin
if FTMRKVisualizationSOAPFunctionality = nil
  then FTMRKVisualizationSOAPFunctionality:=GetITMRKVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMRKVisualizationSOAPFunctionality;
end;

function TMRKVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TMRKVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TMRKVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TMRKVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMRKVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TMRKVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMRKVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TMRKVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TMRKVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
end;

procedure TMRKVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TMRKVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

function TMRKVisualizationFunctionalityRemoted.getBindingPointIndex: integer;
begin
Result:=TMRKVisualizationSOAPFunctionality.getBindingPointIndex(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMRKVisualizationFunctionalityRemoted.setBindingPointIndex(Value: integer);
begin
TMRKVisualizationSOAPFunctionality.setBindingPointIndex(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMRKVisualizationFunctionalityRemoted.getAlign1: integer;
begin
Result:=TMRKVisualizationSOAPFunctionality.getAlign1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMRKVisualizationFunctionalityRemoted.setAlign1(Value: integer);
begin
TMRKVisualizationSOAPFunctionality.setAlign1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMRKVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
Result:=TMRKVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMRKVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
TMRKVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TMRKVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
TMRKVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMRKVisualizationFunctionalityRemoted.GetParams(out oAlign: integer; out oBindingPointIndex: integer);
begin
TMRKVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oAlign,oBindingPointIndex);
end;


{TTOrientedPictureVisualizationFunctionality}
Constructor TTOrientedPictureVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTOrientedPictureVisualizationSOAPFunctionality:=nil;
end;

Destructor TTOrientedPictureVisualizationFunctionalityRemoted.Destroy;
begin
FTTOrientedPictureVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTOrientedPictureVisualizationFunctionalityRemoted.TTOrientedPictureVisualizationSOAPFunctionality: ITTOrientedPictureVisualizationSOAPFunctionality;
begin
if FTTOrientedPictureVisualizationSOAPFunctionality = nil
  then FTTOrientedPictureVisualizationSOAPFunctionality:=GetITTOrientedPictureVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOrientedPictureVisualizationSOAPFunctionality;
end;


{TOrientedPictureVisualizationFunctionality}
Constructor TOrientedPictureVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTOrientedPictureVisualizationSOAPFunctionality:=nil;
end;

Destructor TOrientedPictureVisualizationFunctionalityRemoted.Destroy;
begin
FTOrientedPictureVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TOrientedPictureVisualizationFunctionalityRemoted.TOrientedPictureVisualizationSOAPFunctionality: ITOrientedPictureVisualizationSOAPFunctionality;
begin
if FTOrientedPictureVisualizationSOAPFunctionality = nil
  then FTOrientedPictureVisualizationSOAPFunctionality:=GetITOrientedPictureVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOrientedPictureVisualizationSOAPFunctionality;
end;

function TOrientedPictureVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOrientedPictureVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TOrientedPictureVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TOrientedPictureVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOrientedPictureVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TOrientedPictureVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TOrientedPictureVisualizationSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TOrientedPictureVisualizationSOAPFunctionality.GetDATA1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType,MaxSize);
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TOrientedPictureVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

function TOrientedPictureVisualizationFunctionalityRemoted.getWidth: Double;
begin
Result:=TOrientedPictureVisualizationSOAPFunctionality.getWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.setWidth(Value: Double);
begin
TOrientedPictureVisualizationSOAPFunctionality.setWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOrientedPictureVisualizationFunctionalityRemoted.getHeight: Double;
begin
Result:=TOrientedPictureVisualizationSOAPFunctionality.getHeight(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.setHeight(Value: Double);
begin
TOrientedPictureVisualizationSOAPFunctionality.setHeight(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOrientedPictureVisualizationFunctionalityRemoted.getOrientation: integer;
begin
Result:=TOrientedPictureVisualizationSOAPFunctionality.getOrientation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.setOrientation(Value: integer);
begin
TOrientedPictureVisualizationSOAPFunctionality.setOrientation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.ChangeScale(const ScaleFactor: Double);
begin
TOrientedPictureVisualizationSOAPFunctionality.ChangeScale(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ScaleFactor);
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.UpdateContainer;
begin
TOrientedPictureVisualizationSOAPFunctionality.UpdateContainer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOrientedPictureVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
Result:=TOrientedPictureVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
TOrientedPictureVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
TOrientedPictureVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOrientedPictureVisualizationFunctionalityRemoted.IsNewContainerAcceptable(const NewWidth,NewHeight,NewScale: Double): boolean;
begin
Result:=TOrientedPictureVisualizationSOAPFunctionality.IsNewContainerAcceptable(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewWidth,NewHeight,NewScale);
end;

procedure TOrientedPictureVisualizationFunctionalityRemoted.GetParams(out oWidth: Double; out oHeight: Double; out oOrientation: integer);
begin
TOrientedPictureVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oWidth,oHeight,oOrientation);
end;


{TTOrientedTTFVisualizationFunctionality}
Constructor TTOrientedTTFVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTOrientedTTFVisualizationSOAPFunctionality:=nil;
end;

Destructor TTOrientedTTFVisualizationFunctionalityRemoted.Destroy;
begin
FTTOrientedTTFVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTOrientedTTFVisualizationFunctionalityRemoted.TTOrientedTTFVisualizationSOAPFunctionality: ITTOrientedTTFVisualizationSOAPFunctionality;
begin
if FTTOrientedTTFVisualizationSOAPFunctionality = nil
  then FTTOrientedTTFVisualizationSOAPFunctionality:=GetITTOrientedTTFVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOrientedTTFVisualizationSOAPFunctionality;
end;


{TOrientedTTFVisualizationFunctionality}
Constructor TOrientedTTFVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTOrientedTTFVisualizationSOAPFunctionality:=nil;
end;

Destructor TOrientedTTFVisualizationFunctionalityRemoted.Destroy;
begin
FTOrientedTTFVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TOrientedTTFVisualizationFunctionalityRemoted.TOrientedTTFVisualizationSOAPFunctionality: ITOrientedTTFVisualizationSOAPFunctionality;
begin
if FTOrientedTTFVisualizationSOAPFunctionality = nil
  then FTOrientedTTFVisualizationSOAPFunctionality:=GetITOrientedTTFVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOrientedTTFVisualizationSOAPFunctionality;
end;

function TOrientedTTFVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOrientedTTFVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TOrientedTTFVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TOrientedTTFVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getStr: string;
begin
Result:=TOrientedTTFVisualizationSOAPFunctionality.getStr(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setStr(const Value: string);
begin
TOrientedTTFVisualizationSOAPFunctionality.setStr(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getColor: TColor;
begin
Result:=TOrientedTTFVisualizationSOAPFunctionality.getColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setColor(Value: TColor);
begin
TOrientedTTFVisualizationSOAPFunctionality.setColor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getFont_Name: string;
begin
Result:=TOrientedTTFVisualizationSOAPFunctionality.getFont_Name(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setFont_Name(Value: string);
begin
TOrientedTTFVisualizationSOAPFunctionality.setFont_Name(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getFont_Width: Double;
begin
Result:=TOrientedTTFVisualizationSOAPFunctionality.getFont_Width(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setFont_Width(Value: Double);
begin
TOrientedTTFVisualizationSOAPFunctionality.setFont_Width(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getFont_Height: Double;
begin
Result:=TOrientedTTFVisualizationSOAPFunctionality.getFont_Height(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setFont_Height(Value: Double);
begin
TOrientedTTFVisualizationSOAPFunctionality.setFont_Height(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getCharInterval: Double;
begin
Result:=TOrientedTTFVisualizationSOAPFunctionality.getCharInterval(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setCharInterval(Value: Double);
begin
TOrientedTTFVisualizationSOAPFunctionality.setCharInterval(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOrientedTTFVisualizationFunctionalityRemoted.getOrientation: integer;
begin
Result:=TOrientedTTFVisualizationSOAPFunctionality.getOrientation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.setOrientation(Value: integer);
begin
TOrientedTTFVisualizationSOAPFunctionality.setOrientation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.UpdateContainer;
begin
TOrientedTTFVisualizationSOAPFunctionality.UpdateContainer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOrientedTTFVisualizationFunctionalityRemoted.IsNewContainerAcceptable(const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean;
begin
Result:=TOrientedTTFVisualizationSOAPFunctionality.IsNewContainerAcceptable(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewFontWidth,NewFontHeight,NewCharInterval,flNewStr,NewStr);
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer);
begin
TOrientedTTFVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oStr,oFont_Width,oFont_Height,oFont_Name,oCharInterval,oOrientation);
end;

procedure TOrientedTTFVisualizationFunctionalityRemoted.SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer);
begin
TOrientedTTFVisualizationSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pStr,pFont_Width,pFont_Height,pFont_Name,pCharInterval,pOrientation);
end;


{TTIconFunctionality}
Constructor TTIconFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTIconSOAPFunctionality:=nil;
end;

Destructor TTIconFunctionalityRemoted.Destroy;
begin
FTTIconSOAPFunctionality:=nil;
Inherited;
end;

function TTIconFunctionalityRemoted.TTIconSOAPFunctionality: ITTIconSOAPFunctionality;
begin
if FTTIconSOAPFunctionality = nil
  then FTTIconSOAPFunctionality:=GetITTIconSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTIconSOAPFunctionality;
end;


{TIconFunctionality}
Constructor TIconFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTIconSOAPFunctionality:=nil;
end;

Destructor TIconFunctionalityRemoted.Destroy;
begin
FTIconSOAPFunctionality:=nil;
Inherited;
end;

function TIconFunctionalityRemoted.TIconSOAPFunctionality: ITIconSOAPFunctionality;
begin
if FTIconSOAPFunctionality = nil
  then FTIconSOAPFunctionality:=GetITIconSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTIconSOAPFunctionality;
end;

function TIconFunctionalityRemoted.getName: string;
begin
Result:=TIconSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TIconFunctionalityRemoted.getHint: string;
begin
Result:=TIconSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TIconFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TIconSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TIconFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: Integer);
begin
TIconSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TIconFunctionalityRemoted.GetBitmapDATA(out BMPDATAStream: TByteArray);
begin
TIconSOAPFunctionality.GetBitmapDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   BMPDATAStream);
end;


{TTMessageBoardMessageFunctionality}
Constructor TTMessageBoardMessageFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTMessageBoardMessageSOAPFunctionality:=nil;
end;

Destructor TTMessageBoardMessageFunctionalityRemoted.Destroy;
begin
FTTMessageBoardMessageSOAPFunctionality:=nil;
Inherited;
end;

function TTMessageBoardMessageFunctionalityRemoted.TTMessageBoardMessageSOAPFunctionality: ITTMessageBoardMessageSOAPFunctionality;
begin
if FTTMessageBoardMessageSOAPFunctionality = nil
  then FTTMessageBoardMessageSOAPFunctionality:=GetITTMessageBoardMessageSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMessageBoardMessageSOAPFunctionality;
end;


{TMessageBoardMessageFunctionality}
Constructor TMessageBoardMessageFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTMessageBoardMessageSOAPFunctionality:=nil;
end;

Destructor TMessageBoardMessageFunctionalityRemoted.Destroy;
begin
FTMessageBoardMessageSOAPFunctionality:=nil;
Inherited;
end;

function TMessageBoardMessageFunctionalityRemoted.TMessageBoardMessageSOAPFunctionality: ITMessageBoardMessageSOAPFunctionality;
begin
if FTMessageBoardMessageSOAPFunctionality = nil
  then FTMessageBoardMessageSOAPFunctionality:=GetITMessageBoardMessageSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMessageBoardMessageSOAPFunctionality;
end;

function TMessageBoardMessageFunctionalityRemoted.getName: string;
begin
Result:=TMessageBoardMessageSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMessageBoardMessageFunctionalityRemoted.getHint: string;
begin
Result:=TMessageBoardMessageSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMessageBoardMessageFunctionalityRemoted.getIdMessageBoard: integer;
begin
Result:=TMessageBoardMessageSOAPFunctionality.getIdMessageBoard(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMessageBoardMessageFunctionalityRemoted.setIdMessageBoard(Value: integer);
begin
TMessageBoardMessageSOAPFunctionality.setIdMessageBoard(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMessageBoardMessageFunctionalityRemoted.getIdSenderMessageBoard: integer;
begin
Result:=TMessageBoardMessageSOAPFunctionality.getIdSenderMessageBoard(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMessageBoardMessageFunctionalityRemoted.setIdSenderMessageBoard(Value: integer);
begin
TMessageBoardMessageSOAPFunctionality.setIdSenderMessageBoard(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMessageBoardMessageFunctionalityRemoted.DateCreated: TDateTime;
begin
Result:=TMessageBoardMessageSOAPFunctionality.DateCreated(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMessageBoardMessageFunctionalityRemoted.getSubject: string;
begin
Result:=TMessageBoardMessageSOAPFunctionality.getSubject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMessageBoardMessageFunctionalityRemoted.setSubject(Value: string);
begin
TMessageBoardMessageSOAPFunctionality.setSubject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TMessageBoardMessageFunctionalityRemoted.GetBody(out Value: TByteArray);
begin
TMessageBoardMessageSOAPFunctionality.GetBody(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TMessageBoardMessageFunctionalityRemoted.SetBody(Value: TByteArray);
begin
TMessageBoardMessageSOAPFunctionality.SetBody(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMessageBoardMessageFunctionalityRemoted.getFlRead: boolean;
begin
Result:=TMessageBoardMessageSOAPFunctionality.getFlRead(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMessageBoardMessageFunctionalityRemoted.setFlRead(Value: boolean);
begin
TMessageBoardMessageSOAPFunctionality.setFlRead(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMessageBoardMessageFunctionalityRemoted.IsEmpty: boolean;
begin
Result:=TMessageBoardMessageSOAPFunctionality.IsEmpty(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMessageBoardMessageFunctionalityRemoted.IsCreatedByUser(const pidUser: integer): boolean;
begin
Result:=TMessageBoardMessageSOAPFunctionality.IsCreatedByUser(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pidUser);
end;


{TTMessageBoardFunctionality}
Constructor TTMessageBoardFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTMessageBoardSOAPFunctionality:=nil;
end;

Destructor TTMessageBoardFunctionalityRemoted.Destroy;
begin
FTTMessageBoardSOAPFunctionality:=nil;
Inherited;
end;

function TTMessageBoardFunctionalityRemoted.TTMessageBoardSOAPFunctionality: ITTMessageBoardSOAPFunctionality;
begin
if FTTMessageBoardSOAPFunctionality = nil
  then FTTMessageBoardSOAPFunctionality:=GetITTMessageBoardSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMessageBoardSOAPFunctionality;
end;


{TMessageBoardFunctionality}
Constructor TMessageBoardFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTMessageBoardSOAPFunctionality:=nil;
end;

Destructor TMessageBoardFunctionalityRemoted.Destroy;
begin
FTMessageBoardSOAPFunctionality:=nil;
Inherited;
end;

function TMessageBoardFunctionalityRemoted.TMessageBoardSOAPFunctionality: ITMessageBoardSOAPFunctionality;
begin
if FTMessageBoardSOAPFunctionality = nil
  then FTMessageBoardSOAPFunctionality:=GetITMessageBoardSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMessageBoardSOAPFunctionality;
end;

function TMessageBoardFunctionalityRemoted.getName: string;
begin
Result:=TMessageBoardSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMessageBoardFunctionalityRemoted.setName(Value: string);
begin
TMessageBoardSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMessageBoardFunctionalityRemoted.getHint: string;
begin
Result:=TMessageBoardSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMessageBoardFunctionalityRemoted.IsUnreadMessageExist: boolean;
begin
Result:=TMessageBoardSOAPFunctionality.IsUnreadMessageExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMessageBoardFunctionalityRemoted.GetMessagesList(out List: TByteArray);
begin
TMessageBoardSOAPFunctionality.GetMessagesList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
end;

function TMessageBoardFunctionalityRemoted.CreateNewMessage: integer;
begin
Result:=TMessageBoardSOAPFunctionality.CreateNewMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMessageBoardFunctionalityRemoted.SendMessage(const idMessage: integer);
begin
TMessageBoardSOAPFunctionality.SendMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idMessage);
end;

function TMessageBoardFunctionalityRemoted.getIdUser: integer;
begin
Result:=TMessageBoardSOAPFunctionality.getIdUser(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMessageBoardFunctionalityRemoted.setIdUser(Value: integer);
begin
TMessageBoardSOAPFunctionality.setIdUser(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTHREFFunctionality}
Constructor TTHREFFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTHREFSOAPFunctionality:=nil;
end;

Destructor TTHREFFunctionalityRemoted.Destroy;
begin
FTTHREFSOAPFunctionality:=nil;
Inherited;
end;

function TTHREFFunctionalityRemoted.TTHREFSOAPFunctionality: ITTHREFSOAPFunctionality;
begin
if FTTHREFSOAPFunctionality = nil
  then FTTHREFSOAPFunctionality:=GetITTHREFSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHREFSOAPFunctionality;
end;


{THREFFunctionality}
Constructor THREFFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTHREFSOAPFunctionality:=nil;
end;

Destructor THREFFunctionalityRemoted.Destroy;
begin
FTHREFSOAPFunctionality:=nil;
Inherited;
end;

function THREFFunctionalityRemoted.THREFSOAPFunctionality: ITHREFSOAPFunctionality;
begin
if FTHREFSOAPFunctionality = nil
  then FTHREFSOAPFunctionality:=GetITHREFSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHREFSOAPFunctionality;
end;

function THREFFunctionalityRemoted.getName: string;
begin
Result:=THREFSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function THREFFunctionalityRemoted.getHint: string;
begin
Result:=THREFSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function THREFFunctionalityRemoted.getURL: string;
begin
Result:=THREFSOAPFunctionality.getURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure THREFFunctionalityRemoted.setURL(Value: string);
begin
THREFSOAPFunctionality.setURL(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function THREFFunctionalityRemoted.getAutoStart: boolean;
begin
Result:=THREFSOAPFunctionality.getAutoStart(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure THREFFunctionalityRemoted.setAutoStart(Value: boolean);
begin
THREFSOAPFunctionality.setAutoStart(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTQDCVisualizationFunctionality}
Constructor TTQDCVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTQDCVisualizationSOAPFunctionality:=nil;
end;

Destructor TTQDCVisualizationFunctionalityRemoted.Destroy;
begin
FTTQDCVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTQDCVisualizationFunctionalityRemoted.TTQDCVisualizationSOAPFunctionality: ITTQDCVisualizationSOAPFunctionality;
begin
if FTTQDCVisualizationSOAPFunctionality = nil
  then FTTQDCVisualizationSOAPFunctionality:=GetITTQDCVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTQDCVisualizationSOAPFunctionality;
end;


{TQDCVisualizationFunctionality}
Constructor TQDCVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTQDCVisualizationSOAPFunctionality:=nil;
end;

Destructor TQDCVisualizationFunctionalityRemoted.Destroy;
begin
FTQDCVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TQDCVisualizationFunctionalityRemoted.TQDCVisualizationSOAPFunctionality: ITQDCVisualizationSOAPFunctionality;
begin
if FTQDCVisualizationSOAPFunctionality = nil
  then FTQDCVisualizationSOAPFunctionality:=GetITQDCVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTQDCVisualizationSOAPFunctionality;
end;

function TQDCVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TQDCVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TQDCVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TQDCVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TQDCVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TQDCVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TQDCVisualizationFunctionalityRemoted.SetDATA(DATAStream: TByteArray);
begin
TQDCVisualizationSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream);
end;

procedure TQDCVisualizationFunctionalityRemoted.LoadFromBitmap(Bitmap: TByteArray);
begin
TQDCVisualizationSOAPFunctionality.LoadFromBitmap(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Bitmap);
end;

function TQDCVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
Result:=TQDCVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TQDCVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
TQDCVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TQDCVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
TQDCVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTOffersServerFunctionality}
Constructor TTOffersServerFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTOffersServerSOAPFunctionality:=nil;
end;

Destructor TTOffersServerFunctionalityRemoted.Destroy;
begin
FTTOffersServerSOAPFunctionality:=nil;
Inherited;
end;

function TTOffersServerFunctionalityRemoted.TTOffersServerSOAPFunctionality: ITTOffersServerSOAPFunctionality;
begin
if FTTOffersServerSOAPFunctionality = nil
  then FTTOffersServerSOAPFunctionality:=GetITTOffersServerSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOffersServerSOAPFunctionality;
end;


{TOffersServerFunctionality}
Constructor TOffersServerFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTOffersServerSOAPFunctionality:=nil;
end;

Destructor TOffersServerFunctionalityRemoted.Destroy;
begin
FTOffersServerSOAPFunctionality:=nil;
Inherited;
end;

function TOffersServerFunctionalityRemoted.TOffersServerSOAPFunctionality: ITOffersServerSOAPFunctionality;
begin
if FTOffersServerSOAPFunctionality = nil
  then FTOffersServerSOAPFunctionality:=GetITOffersServerSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOffersServerSOAPFunctionality;
end;

function TOffersServerFunctionalityRemoted.getName: string;
begin
Result:=TOffersServerSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOffersServerFunctionalityRemoted.getHint: string;
begin
Result:=TOffersServerSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOffersServerFunctionalityRemoted.getMailROBOT_Inbox: string;
begin
Result:=TOffersServerSOAPFunctionality.getMailROBOT_Inbox(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOffersServerFunctionalityRemoted.setMailROBOT_Inbox(Value: string);
begin
TOffersServerSOAPFunctionality.setMailROBOT_Inbox(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOffersServerFunctionalityRemoted.getMailROBOT_User: string;
begin
Result:=TOffersServerSOAPFunctionality.getMailROBOT_User(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOffersServerFunctionalityRemoted.setMailROBOT_User(Value: string);
begin
TOffersServerSOAPFunctionality.setMailROBOT_User(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOffersServerFunctionalityRemoted.getMailROBOT_Password: string;
begin
Result:=TOffersServerSOAPFunctionality.getMailROBOT_Password(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOffersServerFunctionalityRemoted.setMailROBOT_Password(Value: string);
begin
TOffersServerSOAPFunctionality.setMailROBOT_Password(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTSecurityComponentOperationFunctionality}
Constructor TTSecurityComponentOperationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTSecurityComponentOperationSOAPFunctionality:=nil;
end;

Destructor TTSecurityComponentOperationFunctionalityRemoted.Destroy;
begin
FTTSecurityComponentOperationSOAPFunctionality:=nil;
Inherited;
end;

function TTSecurityComponentOperationFunctionalityRemoted.TTSecurityComponentOperationSOAPFunctionality: ITTSecurityComponentOperationSOAPFunctionality;
begin
if FTTSecurityComponentOperationSOAPFunctionality = nil
  then FTTSecurityComponentOperationSOAPFunctionality:=GetITTSecurityComponentOperationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTSecurityComponentOperationSOAPFunctionality;
end;

procedure TTSecurityComponentOperationFunctionalityRemoted.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
TTSecurityComponentOperationSOAPFunctionality.GetInstanceListByContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Context,List);
end;


{TSecurityComponentOperationFunctionality}
Constructor TSecurityComponentOperationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTSecurityComponentOperationSOAPFunctionality:=nil;
end;

Destructor TSecurityComponentOperationFunctionalityRemoted.Destroy;
begin
FTSecurityComponentOperationSOAPFunctionality:=nil;
Inherited;
end;

function TSecurityComponentOperationFunctionalityRemoted.TSecurityComponentOperationSOAPFunctionality: ITSecurityComponentOperationSOAPFunctionality;
begin
if FTSecurityComponentOperationSOAPFunctionality = nil
  then FTSecurityComponentOperationSOAPFunctionality:=GetITSecurityComponentOperationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTSecurityComponentOperationSOAPFunctionality;
end;

function TSecurityComponentOperationFunctionalityRemoted.getName: string;
begin
Result:=TSecurityComponentOperationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TSecurityComponentOperationFunctionalityRemoted.setName(Value: string);
begin
TSecurityComponentOperationSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TSecurityComponentOperationFunctionalityRemoted.getHint: string;
begin
Result:=TSecurityComponentOperationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TSecurityComponentOperationFunctionalityRemoted.getSQLInfo: string;
begin
Result:=TSecurityComponentOperationSOAPFunctionality.getSQLInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TSecurityComponentOperationFunctionalityRemoted.setSQLInfo(Value: string);
begin
TSecurityComponentOperationSOAPFunctionality.setSQLInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTSecurityKeyFunctionality}
Constructor TTSecurityKeyFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTSecurityKeySOAPFunctionality:=nil;
end;

Destructor TTSecurityKeyFunctionalityRemoted.Destroy;
begin
FTTSecurityKeySOAPFunctionality:=nil;
Inherited;
end;

function TTSecurityKeyFunctionalityRemoted.TTSecurityKeySOAPFunctionality: ITTSecurityKeySOAPFunctionality;
begin
if FTTSecurityKeySOAPFunctionality = nil
  then FTTSecurityKeySOAPFunctionality:=GetITTSecurityKeySOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTSecurityKeySOAPFunctionality;
end;

function TTSecurityKeyFunctionalityRemoted.GetInstanceByCode(const Code: string;  out idInstance: integer): boolean;
begin
Result:=TTSecurityKeySOAPFunctionality.GetInstanceByCode(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Code,idInstance);
end;

procedure TTSecurityKeyFunctionalityRemoted.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
TTSecurityKeySOAPFunctionality.GetInstanceListByContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Context,List);
end;


{TSecurityKeyFunctionality}
Constructor TSecurityKeyFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTSecurityKeySOAPFunctionality:=nil;
end;

Destructor TSecurityKeyFunctionalityRemoted.Destroy;
begin
FTSecurityKeySOAPFunctionality:=nil;
Inherited;
end;

function TSecurityKeyFunctionalityRemoted.TSecurityKeySOAPFunctionality: ITSecurityKeySOAPFunctionality;
begin
if FTSecurityKeySOAPFunctionality = nil
  then FTSecurityKeySOAPFunctionality:=GetITSecurityKeySOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTSecurityKeySOAPFunctionality;
end;

function TSecurityKeyFunctionalityRemoted.getName: string;
begin
Result:=TSecurityKeySOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TSecurityKeyFunctionalityRemoted.setName(Value: string);
begin
TSecurityKeySOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TSecurityKeyFunctionalityRemoted.getHint: string;
begin
Result:=TSecurityKeySOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TSecurityKeyFunctionalityRemoted.getInfo: string;
begin
Result:=TSecurityKeySOAPFunctionality.getInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TSecurityKeyFunctionalityRemoted.setInfo(Value: string);
begin
TSecurityKeySOAPFunctionality.setInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TSecurityKeyFunctionalityRemoted.GetAssotiatedUsers(out Users: TByteArray);
begin
TSecurityKeySOAPFunctionality.GetAssotiatedUsers(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Users);
end;

procedure TSecurityKeyFunctionalityRemoted.GenerateCode;
begin
TSecurityKeySOAPFunctionality.GenerateCode(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TSecurityKeyFunctionalityRemoted.Code: string;
begin
Result:=TSecurityKeySOAPFunctionality.Code(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTSecurityFileFunctionality}
Constructor TTSecurityFileFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTSecurityFileSOAPFunctionality:=nil;
end;

Destructor TTSecurityFileFunctionalityRemoted.Destroy;
begin
FTTSecurityFileSOAPFunctionality:=nil;
Inherited;
end;

function TTSecurityFileFunctionalityRemoted.TTSecurityFileSOAPFunctionality: ITTSecurityFileSOAPFunctionality;
begin
if FTTSecurityFileSOAPFunctionality = nil
  then FTTSecurityFileSOAPFunctionality:=GetITTSecurityFileSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTSecurityFileSOAPFunctionality;
end;

procedure TTSecurityFileFunctionalityRemoted.GetInstanceListByContext(const Context: WideString;out List: TByteArray);
begin
TTSecurityFileSOAPFunctionality.GetInstanceListByContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Context,List);
end;


{TSecurityFileFunctionality}
Constructor TSecurityFileFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTSecurityFileSOAPFunctionality:=nil;
end;

Destructor TSecurityFileFunctionalityRemoted.Destroy;
begin
FTSecurityFileSOAPFunctionality:=nil;
Inherited;
end;

function TSecurityFileFunctionalityRemoted.TSecurityFileSOAPFunctionality: ITSecurityFileSOAPFunctionality;
begin
if FTSecurityFileSOAPFunctionality = nil
  then FTSecurityFileSOAPFunctionality:=GetITSecurityFileSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTSecurityFileSOAPFunctionality;
end;

function TSecurityFileFunctionalityRemoted.getName: string;
begin
Result:=TSecurityFileSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TSecurityFileFunctionalityRemoted.setName(Value: string);
begin
TSecurityFileSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TSecurityFileFunctionalityRemoted.getHint: string;
begin
Result:=TSecurityFileSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TSecurityFileFunctionalityRemoted.getInfo: string;
begin
Result:=TSecurityFileSOAPFunctionality.getInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TSecurityFileFunctionalityRemoted.setInfo(Value: string);
begin
TSecurityFileSOAPFunctionality.setInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TSecurityFileFunctionalityRemoted.GetDATA(out Value: TByteArray): boolean;
begin
Result:=TSecurityFileSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TSecurityFileFunctionalityRemoted.SetDATA(Value: TByteArray);
begin
TSecurityFileSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TSecurityFileFunctionalityRemoted.AddOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
begin
Result:=TSecurityFileSOAPFunctionality.AddOperationSecurityKey(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   OperationID,SecurityKeyID);
end;

function TSecurityFileFunctionalityRemoted.RemoveOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
begin
Result:=TSecurityFileSOAPFunctionality.RemoveOperationSecurityKey(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   OperationID,SecurityKeyID);
end;

procedure TSecurityFileFunctionalityRemoted.GetAssotiatedSecurityComponents(out SecurityComponents: TByteArray);
begin
TSecurityFileSOAPFunctionality.GetAssotiatedSecurityComponents(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   SecurityComponents);
end;


{TTSecurityComponentFunctionality}
Constructor TTSecurityComponentFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTSecurityComponentSOAPFunctionality:=nil;
end;

Destructor TTSecurityComponentFunctionalityRemoted.Destroy;
begin
FTTSecurityComponentSOAPFunctionality:=nil;
Inherited;
end;

function TTSecurityComponentFunctionalityRemoted.TTSecurityComponentSOAPFunctionality: ITTSecurityComponentSOAPFunctionality;
begin
if FTTSecurityComponentSOAPFunctionality = nil
  then FTTSecurityComponentSOAPFunctionality:=GetITTSecurityComponentSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTSecurityComponentSOAPFunctionality;
end;

procedure TTSecurityComponentFunctionalityRemoted.DestroyInstance(const idObj: integer);
begin
TTSecurityComponentSOAPFunctionality.DestroyInstance(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   idObj);
end;


{TSecurityComponentFunctionality}
Constructor TSecurityComponentFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTSecurityComponentSOAPFunctionality:=nil;
end;

Destructor TSecurityComponentFunctionalityRemoted.Destroy;
begin
FTSecurityComponentSOAPFunctionality:=nil;
Inherited;
end;

function TSecurityComponentFunctionalityRemoted.TSecurityComponentSOAPFunctionality: ITSecurityComponentSOAPFunctionality;
begin
if FTSecurityComponentSOAPFunctionality = nil
  then FTSecurityComponentSOAPFunctionality:=GetITSecurityComponentSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTSecurityComponentSOAPFunctionality;
end;

procedure TSecurityComponentFunctionalityRemoted.ToClone(out idClone: integer);
begin
TSecurityComponentSOAPFunctionality.ToClone(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idClone);
end;

function TSecurityComponentFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TSecurityComponentSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function TSecurityComponentFunctionalityRemoted.getName: string;
begin
Result:=TSecurityComponentSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TSecurityComponentFunctionalityRemoted.getHint: string;
begin
Result:=TSecurityComponentSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TSecurityComponentFunctionalityRemoted.getIdSecurityFile: integer;
begin
Result:=TSecurityComponentSOAPFunctionality.getIdSecurityFile(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TSecurityComponentFunctionalityRemoted.setIdSecurityFile(Value: integer);
begin
TSecurityComponentSOAPFunctionality.setIdSecurityFile(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTMODELUserFunctionality}
Constructor TTMODELUserFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTMODELUserSOAPFunctionality:=nil;
end;

Destructor TTMODELUserFunctionalityRemoted.Destroy;
begin
FTTMODELUserSOAPFunctionality:=nil;
Inherited;
end;

function TTMODELUserFunctionalityRemoted.TTMODELUserSOAPFunctionality: ITTMODELUserSOAPFunctionality;
begin
if FTTMODELUserSOAPFunctionality = nil
  then FTTMODELUserSOAPFunctionality:=GetITTMODELUserSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMODELUserSOAPFunctionality;
end;

function TTMODELUserFunctionalityRemoted.IsUserExist(const UserName: string; out idUser: integer): boolean;
begin
Result:=TTMODELUserSOAPFunctionality.IsUserExist(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   UserName,idUser);
end;

procedure TTMODELUserFunctionalityRemoted.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
TTMODELUserSOAPFunctionality.GetInstanceListByContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Context,List);
end;

procedure TTMODELUserFunctionalityRemoted.GetOnlineUsersForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
begin
TTMODELUserSOAPFunctionality.GetOnlineUsersForDomains(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionalityRemoted.GetOnlineExpertsForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
begin
TTMODELUserSOAPFunctionality.GetOnlineExpertsForDomains(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pOnlineMaxDelay,pDomains,List);
end;


{TMODELUserFunctionality}
Constructor TMODELUserFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTMODELUserSOAPFunctionality:=nil;
end;

Destructor TMODELUserFunctionalityRemoted.Destroy;
begin
FTMODELUserSOAPFunctionality:=nil;
Inherited;
end;

function TMODELUserFunctionalityRemoted.TMODELUserSOAPFunctionality: ITMODELUserSOAPFunctionality;
begin
if FTMODELUserSOAPFunctionality = nil
  then FTMODELUserSOAPFunctionality:=GetITMODELUserSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMODELUserSOAPFunctionality;
end;

function TMODELUserFunctionalityRemoted.getHint: string;
begin
Result:=TMODELUserSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMODELUserFunctionalityRemoted.GetActiveStateInfo(out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean;
begin
Result:=TMODELUserSOAPFunctionality.GetActiveStateInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ProxySpaceID,ProxySpaceIP,ProxySpaceState);
end;

function TMODELUserFunctionalityRemoted.IsUserOnLine(const MaxDelay: Double): boolean;
begin
Result:=TMODELUserSOAPFunctionality.IsUserOnLine(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MaxDelay);
end;

procedure TMODELUserFunctionalityRemoted.Logout;
begin
TMODELUserSOAPFunctionality.Logout(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.GetSecurityKeysList(out SecurityKeys: TByteArray);
begin
TMODELUserSOAPFunctionality.GetSecurityKeysList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   SecurityKeys);
end;

function TMODELUserFunctionalityRemoted.SecurityKeys_IsKeyExist(const idSecurityKey: integer): boolean;
begin
Result:=TMODELUserSOAPFunctionality.SecurityKeys_IsKeyExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idSecurityKey);
end;

procedure TMODELUserFunctionalityRemoted.SecurityKeys_Insert(const idSecurityKey: integer);
begin
TMODELUserSOAPFunctionality.SecurityKeys_Insert(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idSecurityKey);
end;

procedure TMODELUserFunctionalityRemoted.SecurityKeys_Delete(const idSecurityKey: integer);
begin
TMODELUserSOAPFunctionality.SecurityKeys_Delete(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idSecurityKey);
end;

procedure TMODELUserFunctionalityRemoted.SecurityKeys_AddKeyByCode(const Code: WideString);
begin
TMODELUserSOAPFunctionality.SecurityKeys_AddKeyByCode(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Code);
end;

procedure TMODELUserFunctionalityRemoted.SecurityKeys_RemoveKeyByCode(const Code: WideString);
begin
TMODELUserSOAPFunctionality.SecurityKeys_RemoveKeyByCode(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Code);
end;

function TMODELUserFunctionalityRemoted.SecurityKeys_CreateAndAddNewKey(const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer;
begin
Result:=TMODELUserSOAPFunctionality.SecurityKeys_CreateAndAddNewKey(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pName,pInfo,KeyCode);
end;

procedure TMODELUserFunctionalityRemoted.GetMessageBoards(out List: TByteArray);
begin
TMODELUserSOAPFunctionality.GetMessageBoards(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
end;

function TMODELUserFunctionalityRemoted.HaveUnreadMessages: boolean;
begin
Result:=TMODELUserSOAPFunctionality.HaveUnreadMessages(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.GetMessages(const flUnreadOnly: boolean; out MessageList: TByteArray);
begin
TMODELUserSOAPFunctionality.GetMessages(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   flUnreadOnly,MessageList);
end;

procedure TMODELUserFunctionalityRemoted.IncomingMessages_SendNew(const Message: TByteArray; const SenderID: integer);
begin
TMODELUserSOAPFunctionality.IncomingMessages_SendNew(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Message,SenderID);
end;

function TMODELUserFunctionalityRemoted.IncomingMessages_GetUnread(out MessageList: TByteArray): boolean;
begin
Result:=TMODELUserSOAPFunctionality.IncomingMessages_GetUnread(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MessageList);
end;

procedure TMODELUserFunctionalityRemoted.IncomingMessages_GetMessagesSince(const TimeStamp: TDateTime; out MessageList: TByteArray);
begin
TMODELUserSOAPFunctionality.IncomingMessages_GetMessagesSince(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TimeStamp,MessageList);
end;

procedure TMODELUserFunctionalityRemoted.IncomingMessages_GetMessage(const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer);
begin
TMODELUserSOAPFunctionality.IncomingMessages_GetMessage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   MessageID,TimeStamp,Message,SenderID);
end;

procedure TMODELUserFunctionalityRemoted.IncomingMessages_DeleteTo(const TimeStamp: TDateTime);
begin
TMODELUserSOAPFunctionality.IncomingMessages_DeleteTo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   TimeStamp);
end;

function TMODELUserFunctionalityRemoted.getName: string;
begin
Result:=TMODELUserSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setName(Value: string);
begin
TMODELUserSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getFullName: string;
begin
Result:=TMODELUserSOAPFunctionality.getFullName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setFullName(Value: string);
begin
TMODELUserSOAPFunctionality.setFullName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getContactInfo: string;
begin
Result:=TMODELUserSOAPFunctionality.getContactInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setContactInfo(Value: string);
begin
TMODELUserSOAPFunctionality.setContactInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getPassword: string;
begin
Result:=TMODELUserSOAPFunctionality.getPassword(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setPassword(Value: string);
begin
TMODELUserSOAPFunctionality.setPassword(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getIdSecurityFileForClone: integer;
begin
Result:=TMODELUserSOAPFunctionality.getIdSecurityFileForClone(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setIdSecurityFileForClone(Value: integer);
begin
TMODELUserSOAPFunctionality.setIdSecurityFileForClone(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getidSecurityFileForPrivate: integer;
begin
Result:=TMODELUserSOAPFunctionality.getidSecurityFileForPrivate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setidSecurityFileForPrivate(Value: integer);
begin
TMODELUserSOAPFunctionality.setidSecurityFileForPrivate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getDATASize: integer;
begin
Result:=TMODELUserSOAPFunctionality.getDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setDATASize(Value: integer);
begin
TMODELUserSOAPFunctionality.setDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getMaxDATASize: integer;
begin
Result:=TMODELUserSOAPFunctionality.getMaxDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setMaxDATASize(Value: integer);
begin
TMODELUserSOAPFunctionality.setMaxDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getSpaceSquare: Double;
begin
Result:=TMODELUserSOAPFunctionality.getSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setSpaceSquare(Value: Double);
begin
TMODELUserSOAPFunctionality.setSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getMaxSpaceSquare: integer;
begin
Result:=TMODELUserSOAPFunctionality.getMaxSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setMaxSpaceSquare(Value: integer);
begin
TMODELUserSOAPFunctionality.setMaxSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getMaxSpaceSquarePerObject: integer;
begin
Result:=TMODELUserSOAPFunctionality.getMaxSpaceSquarePerObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setMaxSpaceSquarePerObject(Value: integer);
begin
TMODELUserSOAPFunctionality.setMaxSpaceSquarePerObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getDisabled: boolean;
begin
Result:=TMODELUserSOAPFunctionality.getDisabled(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setDisabled(Value: boolean);
begin
TMODELUserSOAPFunctionality.setDisabled(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TMODELUserFunctionalityRemoted.GetStartObj(out idTStartObj,idStartObj: integer);
begin
TMODELUserSOAPFunctionality.GetStartObj(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTStartObj,idStartObj);
end;

procedure TMODELUserFunctionalityRemoted.SetStartObj(const idTStartObj,idStartObj: integer);
begin
TMODELUserSOAPFunctionality.SetStartObj(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTStartObj,idStartObj);
end;

function TMODELUserFunctionalityRemoted.getDomains: string;
begin
Result:=TMODELUserSOAPFunctionality.getDomains(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setDomains(Value: string);
begin
TMODELUserSOAPFunctionality.setDomains(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getTaskEnabled: boolean;
begin
Result:=TMODELUserSOAPFunctionality.getTaskEnabled(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setTaskEnabled(Value: boolean);
begin
TMODELUserSOAPFunctionality.setTaskEnabled(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TMODELUserFunctionalityRemoted.getBillingType: integer;
begin
Result:=TMODELUserSOAPFunctionality.getBillingType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.setBillingType(Value: integer);
begin
TMODELUserSOAPFunctionality.setBillingType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TMODELUserFunctionalityRemoted.CheckDATASize(const pAddDATASize: integer);
begin
TMODELUserSOAPFunctionality.CheckDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pAddDATASize);
end;

procedure TMODELUserFunctionalityRemoted.AddDATASize(const pAddDATASize: integer);
begin
TMODELUserSOAPFunctionality.AddDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pAddDATASize);
end;

procedure TMODELUserFunctionalityRemoted.SubDATASize(const pSubDATASize: integer);
begin
TMODELUserSOAPFunctionality.SubDATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pSubDATASize);
end;

procedure TMODELUserFunctionalityRemoted.CheckSpaceSquare(const pAddSpaceSquare: Double);
begin
TMODELUserSOAPFunctionality.CheckSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pAddSpaceSquare);
end;

procedure TMODELUserFunctionalityRemoted.AddSpaceSquare(const pAddSpaceSquare: Double);
begin
TMODELUserSOAPFunctionality.AddSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pAddSpaceSquare);
end;

procedure TMODELUserFunctionalityRemoted.SubSpaceSquare(const pSubSpaceSquare: Double);
begin
TMODELUserSOAPFunctionality.SubSpaceSquare(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pSubSpaceSquare);
end;

procedure TMODELUserFunctionalityRemoted.CheckMaxSpaceSquarePerObject(const pObjectSpaceSquare: Double);
begin
TMODELUserSOAPFunctionality.CheckMaxSpaceSquarePerObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pObjectSpaceSquare);
end;

procedure TMODELUserFunctionalityRemoted.ServerFolder_GetSubFoldersList(const RelativePath: WideString; out List: WideString);
begin
TMODELUserSOAPFunctionality.ServerFolder_GetSubFoldersList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,List);
end;

procedure TMODELUserFunctionalityRemoted.ServerFolder_GetFilesList(const RelativePath: WideString; out List: WideString);
begin
TMODELUserSOAPFunctionality.ServerFolder_GetFilesList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,List);
end;

function TMODELUserFunctionalityRemoted.ServerFolder_AddFile(const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean;
begin
Result:=TMODELUserSOAPFunctionality.ServerFolder_AddFile(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,FileName,FileData);
end;

function TMODELUserFunctionalityRemoted.ServerFolder_RemoveFile(const RelativePath: WideString; const FileName: WideString): boolean;
begin
Result:=TMODELUserSOAPFunctionality.ServerFolder_RemoveFile(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,FileName);
end;

function TMODELUserFunctionalityRemoted.ServerFolder_ReadFile(const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean;
begin
Result:=TMODELUserSOAPFunctionality.ServerFolder_ReadFile(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,FileName,FileData);
end;

function TMODELUserFunctionalityRemoted.ServerFolder_AddSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;
begin
Result:=TMODELUserSOAPFunctionality.ServerFolder_AddSubFolder(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,SubFolderName);
end;

function TMODELUserFunctionalityRemoted.ServerFolder_AddSubFolder1(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean;
begin
Result:=TMODELUserSOAPFunctionality.ServerFolder_AddSubFolder1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,SubFolderName,SubFolderData);
end;

function TMODELUserFunctionalityRemoted.ServerFolder_RemoveSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;
begin
Result:=TMODELUserSOAPFunctionality.ServerFolder_RemoveSubFolder(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,SubFolderName);
end;

function TMODELUserFunctionalityRemoted.ServerFolder_ReadSubFolder(const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean;
begin
Result:=TMODELUserSOAPFunctionality.ServerFolder_ReadSubFolder(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Version,RelativePath,SubFolderName,Excludes,SubFolderData);
end;

function TMODELUserFunctionalityRemoted.ServerFolder_ExchangeSubFolder(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean;
begin
Result:=TMODELUserSOAPFunctionality.ServerFolder_ExchangeSubFolder(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   RelativePath,SubFolderName,SubFolderInData,Excludes,SubFolderOutData);
end;

function TMODELUserFunctionalityRemoted.Tasks_AddNew(const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer;
begin
Result:=TMODELUserSOAPFunctionality.Tasks_AddNew(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pPriority,pType,pService,pTaskData,pComment);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_RemoveItem(const idTask: integer);
begin
TMODELUserSOAPFunctionality.Tasks_RemoveItem(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Clear;
begin
TMODELUserSOAPFunctionality.Tasks_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_GetData(const Version: integer; const flOnlyActive: boolean; out oData: TByteArray);
begin
TMODELUserSOAPFunctionality.Tasks_GetData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Version,flOnlyActive,oData);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_GetTaskData(const idTask: integer; out oTaskData: TByteArray);
begin
TMODELUserSOAPFunctionality.Tasks_Item_GetTaskData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,oTaskData);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetPriority(const idTask: integer; const pPriority: integer);
begin
TMODELUserSOAPFunctionality.Tasks_Item_SetPriority(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pPriority);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_GetStatus(const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string);
begin
TMODELUserSOAPFunctionality.Tasks_Item_GetStatus(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,oStatus,oStatusReason,oStatusComment);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetStatus(const idTask: integer; const pStatus: integer; const pStatusComment: string);
begin
TMODELUserSOAPFunctionality.Tasks_Item_SetStatus(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pStatus,pStatusComment);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetStatus1(const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string);
begin
TMODELUserSOAPFunctionality.Tasks_Item_SetStatus1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pStatus,pStatusReason,pStatusComment);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_GetResultData(const idTask: integer; out oResultData: TByteArray);
begin
TMODELUserSOAPFunctionality.Tasks_Item_GetResultData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,oResultData);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetResult(const idTask: integer; const pResultCode: integer; const pResultComment: string);
begin
TMODELUserSOAPFunctionality.Tasks_Item_SetResult(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pResultCode,pResultComment);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetResult1(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string);
begin
TMODELUserSOAPFunctionality.Tasks_Item_SetResult1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultComment);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetResult2(const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);
begin
TMODELUserSOAPFunctionality.Tasks_Item_SetResult2(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pResultCode,pResultData,pResultComment);
end;

procedure TMODELUserFunctionalityRemoted.Tasks_Item_SetResult3(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);
begin
TMODELUserSOAPFunctionality.Tasks_Item_SetResult3(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultData,pResultComment);
end;

function TMODELUserFunctionalityRemoted.Billing_Account: double;
begin
Result:=TMODELUserSOAPFunctionality.Billing_Account(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMODELUserFunctionalityRemoted.Billing_Transactions_AddNew(const pReason: integer; const pDelta: double; const pComment: string): integer;
begin
Result:=TMODELUserSOAPFunctionality.Billing_Transactions_AddNew(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pReason,pDelta,pComment);
end;

procedure TMODELUserFunctionalityRemoted.Billing_Transactions_Remove(const idTransaction: integer);
begin
TMODELUserSOAPFunctionality.Billing_Transactions_Remove(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTransaction);
end;

procedure TMODELUserFunctionalityRemoted.Billing_Transactions_Clear;
begin
TMODELUserSOAPFunctionality.Billing_Transactions_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TMODELUserFunctionalityRemoted.Billing_Transactions_GetData(const Version: integer; out oData: TByteArray);
begin
TMODELUserSOAPFunctionality.Billing_Transactions_GetData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Version,oData);
end;

procedure TMODELUserFunctionalityRemoted.ClientProgram_GetReleases(const ProgramID: integer; const Localization: WideString; out Data: TByteArray);
begin
TMODELUserSOAPFunctionality.ClientProgram_GetReleases(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   ProgramID,Localization,Data);
end;


{TTTextureFunctionality}
Constructor TTTextureFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTTextureSOAPFunctionality:=nil;
end;

Destructor TTTextureFunctionalityRemoted.Destroy;
begin
FTTTextureSOAPFunctionality:=nil;
Inherited;
end;

function TTTextureFunctionalityRemoted.TTTextureSOAPFunctionality: ITTTextureSOAPFunctionality;
begin
if FTTTextureSOAPFunctionality = nil
  then FTTTextureSOAPFunctionality:=GetITTTextureSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTextureSOAPFunctionality;
end;

procedure TTTextureFunctionalityRemoted.GetInstanceListMatchingBy(const NameContext: string; out List: TByteArray);
begin
TTTextureSOAPFunctionality.GetInstanceListMatchingBy(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   NameContext,List);
end;


{TTextureFunctionality}
Constructor TTextureFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTTextureSOAPFunctionality:=nil;
end;

Destructor TTextureFunctionalityRemoted.Destroy;
begin
FTTextureSOAPFunctionality:=nil;
Inherited;
end;

function TTextureFunctionalityRemoted.TTextureSOAPFunctionality: ITTextureSOAPFunctionality;
begin
if FTTextureSOAPFunctionality = nil
  then FTTextureSOAPFunctionality:=GetITTextureSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTextureSOAPFunctionality;
end;

function TTextureFunctionalityRemoted.getName: string;
begin
Result:=TTextureSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTextureFunctionalityRemoted.getHint: string;
begin
Result:=TTextureSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTextureFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TTextureSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TTextureFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: Integer);
begin
TTextureSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TTextureFunctionalityRemoted.GetBitmapDATA(out BMPDATAStream: TByteArray);
begin
TTextureSOAPFunctionality.GetBitmapDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   BMPDATAStream);
end;

procedure TTextureFunctionalityRemoted.setName(Value: string);
begin
TTextureSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTBuffered3DVisualizationFunctionality}
Constructor TTBuffered3DVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTBuffered3DVisualizationSOAPFunctionality:=nil;
end;

Destructor TTBuffered3DVisualizationFunctionalityRemoted.Destroy;
begin
FTTBuffered3DVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTBuffered3DVisualizationFunctionalityRemoted.TTBuffered3DVisualizationSOAPFunctionality: ITTBuffered3DVisualizationSOAPFunctionality;
begin
if FTTBuffered3DVisualizationSOAPFunctionality = nil
  then FTTBuffered3DVisualizationSOAPFunctionality:=GetITTBuffered3DVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTBuffered3DVisualizationSOAPFunctionality;
end;


{TBuffered3DVisualizationFunctionality}
Constructor TBuffered3DVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTBuffered3DVisualizationSOAPFunctionality:=nil;
end;

Destructor TBuffered3DVisualizationFunctionalityRemoted.Destroy;
begin
FTBuffered3DVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TBuffered3DVisualizationFunctionalityRemoted.TBuffered3DVisualizationSOAPFunctionality: ITBuffered3DVisualizationSOAPFunctionality;
begin
if FTBuffered3DVisualizationSOAPFunctionality = nil
  then FTBuffered3DVisualizationSOAPFunctionality:=GetITBuffered3DVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTBuffered3DVisualizationSOAPFunctionality;
end;

function TBuffered3DVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TBuffered3DVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TBuffered3DVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TBuffered3DVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TBuffered3DVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TBuffered3DVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.LoadFromStream(DATAStream: TByteArray; const DATAType: integer);
begin
TBuffered3DVisualizationSOAPFunctionality.LoadFromStream(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.Get__Translate_XY(out vTranslate_X,vTranslate_Y: Double);
begin
TBuffered3DVisualizationSOAPFunctionality.Get__Translate_XY(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   vTranslate_X,vTranslate_Y);
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
begin
TBuffered3DVisualizationSOAPFunctionality.SetPropertiesLocal(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.UpdateXOYProjection;
begin
TBuffered3DVisualizationSOAPFunctionality.UpdateXOYProjection(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TBuffered3DVisualizationFunctionalityRemoted.getDATAFileID: integer;
begin
Result:=TBuffered3DVisualizationSOAPFunctionality.getDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.setDATAFileID(Value: integer);
begin
TBuffered3DVisualizationSOAPFunctionality.setDATAFileID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.DATAFile_Clear;
begin
TBuffered3DVisualizationSOAPFunctionality.DATAFile_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TBuffered3DVisualizationFunctionalityRemoted.GetParams(out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double);
begin
TBuffered3DVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oScale,oTranslate_X,oTranslate_Y,oTranslate_Z,oRotate_AngleX,oRotate_AngleY,oRotate_AngleZ);
end;


{TTDATAFileFunctionality}
Constructor TTDATAFileFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTDATAFileSOAPFunctionality:=nil;
end;

Destructor TTDATAFileFunctionalityRemoted.Destroy;
begin
FTTDATAFileSOAPFunctionality:=nil;
Inherited;
end;

function TTDATAFileFunctionalityRemoted.TTDATAFileSOAPFunctionality: ITTDATAFileSOAPFunctionality;
begin
if FTTDATAFileSOAPFunctionality = nil
  then FTTDATAFileSOAPFunctionality:=GetITTDATAFileSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTDATAFileSOAPFunctionality;
end;


{TDATAFileFunctionality}
Constructor TDATAFileFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTDATAFileSOAPFunctionality:=nil;
end;

Destructor TDATAFileFunctionalityRemoted.Destroy;
begin
FTDATAFileSOAPFunctionality:=nil;
Inherited;
end;

function TDATAFileFunctionalityRemoted.TDATAFileSOAPFunctionality: ITDATAFileSOAPFunctionality;
begin
if FTDATAFileSOAPFunctionality = nil
  then FTDATAFileSOAPFunctionality:=GetITDATAFileSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTDATAFileSOAPFunctionality;
end;

procedure TDATAFileFunctionalityRemoted.Check;
begin
TDATAFileSOAPFunctionality.Check(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TDATAFileFunctionalityRemoted.getName: string;
begin
Result:=TDATAFileSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TDATAFileFunctionalityRemoted.getHint: string;
begin
Result:=TDATAFileSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TDATAFileFunctionalityRemoted.IsNull: boolean;
begin
Result:=TDATAFileSOAPFunctionality.IsNull(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TDATAFileFunctionalityRemoted.Empty;
begin
TDATAFileSOAPFunctionality.Empty(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TDATAFileFunctionalityRemoted.GetDATA(out Value: TByteArray);
begin
TDATAFileSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TDATAFileFunctionalityRemoted.SetDATA(Value: TByteArray);
begin
TDATAFileSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TDATAFileFunctionalityRemoted.getDATAType: string;
begin
Result:=TDATAFileSOAPFunctionality.getDATAType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TDATAFileFunctionalityRemoted.setDATAType(Value: string);
begin
TDATAFileSOAPFunctionality.setDATAType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTCoComponentFunctionality}
Constructor TTCoComponentFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCoComponentSOAPFunctionality:=nil;
end;

Destructor TTCoComponentFunctionalityRemoted.Destroy;
begin
FTTCoComponentSOAPFunctionality:=nil;
Inherited;
end;

function TTCoComponentFunctionalityRemoted.TTCoComponentSOAPFunctionality: ITTCoComponentSOAPFunctionality;
begin
if FTTCoComponentSOAPFunctionality = nil
  then FTTCoComponentSOAPFunctionality:=GetITTCoComponentSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCoComponentSOAPFunctionality;
end;

procedure TTCoComponentFunctionalityRemoted.GetInstanceListByCoType(const idCoType: integer; out InstanceList: TByteArray);
begin
TTCoComponentSOAPFunctionality.GetInstanceListByCoType(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   idCoType,InstanceList);
end;


{TCoComponentFunctionality}
Constructor TCoComponentFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCoComponentSOAPFunctionality:=nil;
end;

Destructor TCoComponentFunctionalityRemoted.Destroy;
begin
FTCoComponentSOAPFunctionality:=nil;
Inherited;
end;

function TCoComponentFunctionalityRemoted.TCoComponentSOAPFunctionality: ITCoComponentSOAPFunctionality;
begin
if FTCoComponentSOAPFunctionality = nil
  then FTCoComponentSOAPFunctionality:=GetITCoComponentSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCoComponentSOAPFunctionality;
end;

function TCoComponentFunctionalityRemoted.getName: string;
begin
Result:=TCoComponentSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCoComponentFunctionalityRemoted.getHint: string;
begin
Result:=TCoComponentSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCoComponentFunctionalityRemoted.idCoType: integer;
begin
Result:=TCoComponentSOAPFunctionality.idCoType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCoComponentFunctionalityRemoted.GetIconImage(out oImage: TByteArray): boolean;
begin
Result:=TCoComponentSOAPFunctionality.GetIconImage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oImage);
end;

function TCoComponentFunctionalityRemoted.GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
begin
Result:=TCoComponentSOAPFunctionality.GetVisualizationComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTVisualization,idVisualization);
end;


{TTCoComponentTypeMarkerFunctionality}
Constructor TTCoComponentTypeMarkerFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCoComponentTypeMarkerSOAPFunctionality:=nil;
end;

Destructor TTCoComponentTypeMarkerFunctionalityRemoted.Destroy;
begin
FTTCoComponentTypeMarkerSOAPFunctionality:=nil;
Inherited;
end;

function TTCoComponentTypeMarkerFunctionalityRemoted.TTCoComponentTypeMarkerSOAPFunctionality: ITTCoComponentTypeMarkerSOAPFunctionality;
begin
if FTTCoComponentTypeMarkerSOAPFunctionality = nil
  then FTTCoComponentTypeMarkerSOAPFunctionality:=GetITTCoComponentTypeMarkerSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCoComponentTypeMarkerSOAPFunctionality;
end;


{TCoComponentTypeMarkerFunctionality}
Constructor TCoComponentTypeMarkerFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCoComponentTypeMarkerSOAPFunctionality:=nil;
end;

Destructor TCoComponentTypeMarkerFunctionalityRemoted.Destroy;
begin
FTCoComponentTypeMarkerSOAPFunctionality:=nil;
Inherited;
end;

function TCoComponentTypeMarkerFunctionalityRemoted.TCoComponentTypeMarkerSOAPFunctionality: ITCoComponentTypeMarkerSOAPFunctionality;
begin
if FTCoComponentTypeMarkerSOAPFunctionality = nil
  then FTCoComponentTypeMarkerSOAPFunctionality:=GetITCoComponentTypeMarkerSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCoComponentTypeMarkerSOAPFunctionality;
end;

function TCoComponentTypeMarkerFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TCoComponentTypeMarkerSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function TCoComponentTypeMarkerFunctionalityRemoted.getName: string;
begin
Result:=TCoComponentTypeMarkerSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCoComponentTypeMarkerFunctionalityRemoted.getHint: string;
begin
Result:=TCoComponentTypeMarkerSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCoComponentTypeMarkerFunctionalityRemoted.GetTypeIconImage(out oImage: TByteArray): boolean;
begin
Result:=TCoComponentTypeMarkerSOAPFunctionality.GetTypeIconImage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oImage);
end;

procedure TCoComponentTypeMarkerFunctionalityRemoted.setName(Value: string);
begin
TCoComponentTypeMarkerSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TCoComponentTypeMarkerFunctionalityRemoted.getIDCoComponentType: integer;
begin
Result:=TCoComponentTypeMarkerSOAPFunctionality.getIDCoComponentType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTCoComponentTypeFunctionality}
Constructor TTCoComponentTypeFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCoComponentTypeSOAPFunctionality:=nil;
end;

Destructor TTCoComponentTypeFunctionalityRemoted.Destroy;
begin
FTTCoComponentTypeSOAPFunctionality:=nil;
Inherited;
end;

function TTCoComponentTypeFunctionalityRemoted.TTCoComponentTypeSOAPFunctionality: ITTCoComponentTypeSOAPFunctionality;
begin
if FTTCoComponentTypeSOAPFunctionality = nil
  then FTTCoComponentTypeSOAPFunctionality:=GetITTCoComponentTypeSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCoComponentTypeSOAPFunctionality;
end;

procedure TTCoComponentTypeFunctionalityRemoted.GetInstanceListByFileType(const FileType: WideString; out List: TByteArray);
begin
TTCoComponentTypeSOAPFunctionality.GetInstanceListByFileType(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   FileType,List);
end;


{TCoComponentTypeFunctionality}
Constructor TCoComponentTypeFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCoComponentTypeSOAPFunctionality:=nil;
end;

Destructor TCoComponentTypeFunctionalityRemoted.Destroy;
begin
FTCoComponentTypeSOAPFunctionality:=nil;
Inherited;
end;

function TCoComponentTypeFunctionalityRemoted.TCoComponentTypeSOAPFunctionality: ITCoComponentTypeSOAPFunctionality;
begin
if FTCoComponentTypeSOAPFunctionality = nil
  then FTCoComponentTypeSOAPFunctionality:=GetITCoComponentTypeSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCoComponentTypeSOAPFunctionality;
end;

function TCoComponentTypeFunctionalityRemoted.getName: string;
begin
Result:=TCoComponentTypeSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCoComponentTypeFunctionalityRemoted.getHint: string;
begin
Result:=TCoComponentTypeSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCoComponentTypeFunctionalityRemoted.GetDescription(out Value: TByteArray);
begin
TCoComponentTypeSOAPFunctionality.GetDescription(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TCoComponentTypeFunctionalityRemoted.SetDescription(Value: TByteArray);
begin
TCoComponentTypeSOAPFunctionality.SetDescription(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TCoComponentTypeFunctionalityRemoted.GetMarkersList(out List: TByteArray);
begin
TCoComponentTypeSOAPFunctionality.GetMarkersList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
end;

function TCoComponentTypeFunctionalityRemoted.GetIconImage(out oImage: TByteArray): boolean;
begin
Result:=TCoComponentTypeSOAPFunctionality.GetIconImage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oImage);
end;

procedure TCoComponentTypeFunctionalityRemoted.setName(Value: string);
begin
TCoComponentTypeSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TCoComponentTypeFunctionalityRemoted.getUID: integer;
begin
Result:=TCoComponentTypeSOAPFunctionality.getUID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCoComponentTypeFunctionalityRemoted.getDateCreated: TDateTime;
begin
Result:=TCoComponentTypeSOAPFunctionality.getDateCreated(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCoComponentTypeFunctionalityRemoted.getFileType: shortstring;
begin
Result:=TCoComponentTypeSOAPFunctionality.getFileType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCoComponentTypeFunctionalityRemoted.setFileType(Value: shortstring);
begin
TCoComponentTypeSOAPFunctionality.setFileType(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TCoComponentTypeFunctionalityRemoted.getCoComponentPrototypeID: integer;
begin
Result:=TCoComponentTypeSOAPFunctionality.getCoComponentPrototypeID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCoComponentTypeFunctionalityRemoted.setCoComponentPrototypeID(Value: integer);
begin
TCoComponentTypeSOAPFunctionality.setCoComponentPrototypeID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTAddressFunctionality}
Constructor TTAddressFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTAddressSOAPFunctionality:=nil;
end;

Destructor TTAddressFunctionalityRemoted.Destroy;
begin
FTTAddressSOAPFunctionality:=nil;
Inherited;
end;

function TTAddressFunctionalityRemoted.TTAddressSOAPFunctionality: ITTAddressSOAPFunctionality;
begin
if FTTAddressSOAPFunctionality = nil
  then FTTAddressSOAPFunctionality:=GetITTAddressSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTAddressSOAPFunctionality;
end;

procedure TTAddressFunctionalityRemoted.Points_GetTypeNames(out List: TByteArray);
begin
TTAddressSOAPFunctionality.Points_GetTypeNames(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
end;

procedure TTAddressFunctionalityRemoted.Streets_GetTypeNames(out List: TByteArray);
begin
TTAddressSOAPFunctionality.Streets_GetTypeNames(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
end;


{TAddressFunctionality}
Constructor TAddressFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTAddressSOAPFunctionality:=nil;
end;

Destructor TAddressFunctionalityRemoted.Destroy;
begin
FTAddressSOAPFunctionality:=nil;
Inherited;
end;

function TAddressFunctionalityRemoted.TAddressSOAPFunctionality: ITAddressSOAPFunctionality;
begin
if FTAddressSOAPFunctionality = nil
  then FTAddressSOAPFunctionality:=GetITAddressSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTAddressSOAPFunctionality;
end;

function TAddressFunctionalityRemoted.getName: string;
begin
Result:=TAddressSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TAddressFunctionalityRemoted.getHint: string;
begin
Result:=TAddressSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TAddressFunctionalityRemoted.getIdPoint: integer;
begin
Result:=TAddressSOAPFunctionality.getIdPoint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TAddressFunctionalityRemoted.setIdPoint(Value: integer);
begin
TAddressSOAPFunctionality.setIdPoint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TAddressFunctionalityRemoted.getPoint: string;
begin
Result:=TAddressSOAPFunctionality.getPoint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TAddressFunctionalityRemoted.getIdStreet: integer;
begin
Result:=TAddressSOAPFunctionality.getIdStreet(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TAddressFunctionalityRemoted.setIdStreet(Value: integer);
begin
TAddressSOAPFunctionality.setIdStreet(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TAddressFunctionalityRemoted.getStreet: string;
begin
Result:=TAddressSOAPFunctionality.getStreet(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TAddressFunctionalityRemoted.getHouse: string;
begin
Result:=TAddressSOAPFunctionality.getHouse(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TAddressFunctionalityRemoted.setHouse(Value: string);
begin
TAddressSOAPFunctionality.setHouse(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TAddressFunctionalityRemoted.getCorps: integer;
begin
Result:=TAddressSOAPFunctionality.getCorps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TAddressFunctionalityRemoted.setCorps(Value: integer);
begin
TAddressSOAPFunctionality.setCorps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TAddressFunctionalityRemoted.getApartment: string;
begin
Result:=TAddressSOAPFunctionality.getApartment(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TAddressFunctionalityRemoted.setApartment(Value: string);
begin
TAddressSOAPFunctionality.setApartment(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TAddressFunctionalityRemoted.getEntrance: integer;
begin
Result:=TAddressSOAPFunctionality.getEntrance(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TAddressFunctionalityRemoted.setEntrance(Value: integer);
begin
TAddressSOAPFunctionality.setEntrance(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTTransportRouteFunctionality}
Constructor TTTransportRouteFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTTransportRouteSOAPFunctionality:=nil;
end;

Destructor TTTransportRouteFunctionalityRemoted.Destroy;
begin
FTTTransportRouteSOAPFunctionality:=nil;
Inherited;
end;

function TTTransportRouteFunctionalityRemoted.TTTransportRouteSOAPFunctionality: ITTTransportRouteSOAPFunctionality;
begin
if FTTTransportRouteSOAPFunctionality = nil
  then FTTTransportRouteSOAPFunctionality:=GetITTTransportRouteSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTransportRouteSOAPFunctionality;
end;

procedure TTTransportRouteFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
TTTransportRouteSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
end;


{TTransportRouteFunctionality}
Constructor TTransportRouteFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTTransportRouteSOAPFunctionality:=nil;
end;

Destructor TTransportRouteFunctionalityRemoted.Destroy;
begin
FTTransportRouteSOAPFunctionality:=nil;
Inherited;
end;

function TTransportRouteFunctionalityRemoted.TTransportRouteSOAPFunctionality: ITTransportRouteSOAPFunctionality;
begin
if FTTransportRouteSOAPFunctionality = nil
  then FTTransportRouteSOAPFunctionality:=GetITTransportRouteSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTransportRouteSOAPFunctionality;
end;

function TTransportRouteFunctionalityRemoted.getName: string;
begin
Result:=TTransportRouteSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTransportRouteFunctionalityRemoted.setName(Value: string);
begin
TTransportRouteSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTransportRouteFunctionalityRemoted.getHint: string;
begin
Result:=TTransportRouteSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTransportRouteFunctionalityRemoted.getidTTransport: integer;
begin
Result:=TTransportRouteSOAPFunctionality.getidTTransport(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTransportRouteFunctionalityRemoted.setidTTransport(Value: integer);
begin
TTransportRouteSOAPFunctionality.setidTTransport(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTransportRouteFunctionalityRemoted.getValid: boolean;
begin
Result:=TTransportRouteSOAPFunctionality.getValid(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTransportRouteFunctionalityRemoted.setValid(Value: boolean);
begin
TTransportRouteSOAPFunctionality.setValid(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTransportRouteFunctionalityRemoted.getRemarks: string;
begin
Result:=TTransportRouteSOAPFunctionality.getRemarks(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTransportRouteFunctionalityRemoted.setRemarks(Value: string);
begin
TTransportRouteSOAPFunctionality.setRemarks(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTransportRouteFunctionalityRemoted.IsNodesExist: boolean;
begin
Result:=TTransportRouteSOAPFunctionality.IsNodesExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTransportRouteFunctionalityRemoted.Nodes_GetList(out List: TByteArray);
begin
TTransportRouteSOAPFunctionality.Nodes_GetList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
end;

function TTransportRouteFunctionalityRemoted.Nodes_IsNodeExist(const idNode: integer): boolean;
begin
Result:=TTransportRouteSOAPFunctionality.Nodes_IsNodeExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idNode);
end;

procedure TTransportRouteFunctionalityRemoted.Nodes_ChangeNodeOrder(const idItem: integer; const Order: integer);
begin
TTransportRouteSOAPFunctionality.Nodes_ChangeNodeOrder(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idItem,Order);
end;

function TTransportRouteFunctionalityRemoted.Nodes__Node_DistanceBefore(const idItem: integer): integer;
begin
Result:=TTransportRouteSOAPFunctionality.Nodes__Node_DistanceBefore(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idItem);
end;

procedure TTransportRouteFunctionalityRemoted.Nodes__Node_SetDistanceBefore(const idItem: integer; const D: integer);
begin
TTransportRouteSOAPFunctionality.Nodes__Node_SetDistanceBefore(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idItem,D);
end;

function TTransportRouteFunctionalityRemoted.Nodes__Node_OrderPrice(const idItem: integer): string;
begin
Result:=TTransportRouteSOAPFunctionality.Nodes__Node_OrderPrice(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idItem);
end;

procedure TTransportRouteFunctionalityRemoted.Nodes__Node_SetOrderPrice(const idItem: integer; const Price: string);
begin
TTransportRouteSOAPFunctionality.Nodes__Node_SetOrderPrice(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idItem,Price);
end;

function TTransportRouteFunctionalityRemoted.Nodes_Insert(const idNode: integer): integer;
begin
Result:=TTransportRouteSOAPFunctionality.Nodes_Insert(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idNode);
end;

procedure TTransportRouteFunctionalityRemoted.Nodes_Remove(const idItem: integer);
begin
TTransportRouteSOAPFunctionality.Nodes_Remove(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idItem);
end;


{TTTransportNodeFunctionality}
Constructor TTTransportNodeFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTTransportNodeSOAPFunctionality:=nil;
end;

Destructor TTTransportNodeFunctionalityRemoted.Destroy;
begin
FTTTransportNodeSOAPFunctionality:=nil;
Inherited;
end;

function TTTransportNodeFunctionalityRemoted.TTTransportNodeSOAPFunctionality: ITTTransportNodeSOAPFunctionality;
begin
if FTTTransportNodeSOAPFunctionality = nil
  then FTTTransportNodeSOAPFunctionality:=GetITTTransportNodeSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTransportNodeSOAPFunctionality;
end;

procedure TTTransportNodeFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
TTTransportNodeSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
end;


{TTransportNodeFunctionality}
Constructor TTransportNodeFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTTransportNodeSOAPFunctionality:=nil;
end;

Destructor TTransportNodeFunctionalityRemoted.Destroy;
begin
FTTransportNodeSOAPFunctionality:=nil;
Inherited;
end;

function TTransportNodeFunctionalityRemoted.TTransportNodeSOAPFunctionality: ITTransportNodeSOAPFunctionality;
begin
if FTTransportNodeSOAPFunctionality = nil
  then FTTransportNodeSOAPFunctionality:=GetITTransportNodeSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTransportNodeSOAPFunctionality;
end;

function TTransportNodeFunctionalityRemoted.getName: string;
begin
Result:=TTransportNodeSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTransportNodeFunctionalityRemoted.setName(Value: string);
begin
TTransportNodeSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTransportNodeFunctionalityRemoted.getHint: string;
begin
Result:=TTransportNodeSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTransportNodeFunctionalityRemoted.IsRoutesExist: boolean;
begin
Result:=TTransportNodeSOAPFunctionality.IsRoutesExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTOfferGoodsFunctionality}
Constructor TTOfferGoodsFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTOfferGoodsSOAPFunctionality:=nil;
end;

Destructor TTOfferGoodsFunctionalityRemoted.Destroy;
begin
FTTOfferGoodsSOAPFunctionality:=nil;
Inherited;
end;

function TTOfferGoodsFunctionalityRemoted.TTOfferGoodsSOAPFunctionality: ITTOfferGoodsSOAPFunctionality;
begin
if FTTOfferGoodsSOAPFunctionality = nil
  then FTTOfferGoodsSOAPFunctionality:=GetITTOfferGoodsSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOfferGoodsSOAPFunctionality;
end;


{TOfferGoodsFunctionality}
Constructor TOfferGoodsFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTOfferGoodsSOAPFunctionality:=nil;
end;

Destructor TOfferGoodsFunctionalityRemoted.Destroy;
begin
FTOfferGoodsSOAPFunctionality:=nil;
Inherited;
end;

function TOfferGoodsFunctionalityRemoted.TOfferGoodsSOAPFunctionality: ITOfferGoodsSOAPFunctionality;
begin
if FTOfferGoodsSOAPFunctionality = nil
  then FTOfferGoodsSOAPFunctionality:=GetITOfferGoodsSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOfferGoodsSOAPFunctionality;
end;

function TOfferGoodsFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TOfferGoodsSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function TOfferGoodsFunctionalityRemoted.getName: string;
begin
Result:=TOfferGoodsSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOfferGoodsFunctionalityRemoted.getHint: string;
begin
Result:=TOfferGoodsSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOfferGoodsFunctionalityRemoted.idOffer: integer;
begin
Result:=TOfferGoodsSOAPFunctionality.idOffer(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOfferGoodsFunctionalityRemoted.getIdGoods: integer;
begin
Result:=TOfferGoodsSOAPFunctionality.getIdGoods(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOfferGoodsFunctionalityRemoted.setIdGoods(Value: integer);
begin
TOfferGoodsSOAPFunctionality.setIdGoods(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOfferGoodsFunctionalityRemoted.getAmount: Double;
begin
Result:=TOfferGoodsSOAPFunctionality.getAmount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOfferGoodsFunctionalityRemoted.setAmount(Value: Double);
begin
TOfferGoodsSOAPFunctionality.setAmount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOfferGoodsFunctionalityRemoted.getIdMeasureUnit: integer;
begin
Result:=TOfferGoodsSOAPFunctionality.getIdMeasureUnit(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOfferGoodsFunctionalityRemoted.setIdMeasureUnit(Value: integer);
begin
TOfferGoodsSOAPFunctionality.setIdMeasureUnit(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOfferGoodsFunctionalityRemoted.getMeasureUnit: string;
begin
Result:=TOfferGoodsSOAPFunctionality.getMeasureUnit(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOfferGoodsFunctionalityRemoted.getMinPrice: Currency;
begin
Result:=TOfferGoodsSOAPFunctionality.getMinPrice(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOfferGoodsFunctionalityRemoted.setMinPrice(Value: Currency);
begin
TOfferGoodsSOAPFunctionality.setMinPrice(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOfferGoodsFunctionalityRemoted.getMisc: string;
begin
Result:=TOfferGoodsSOAPFunctionality.getMisc(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOfferGoodsFunctionalityRemoted.setMisc(Value: string);
begin
TOfferGoodsSOAPFunctionality.setMisc(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTTLFStationTMTFunctionality}
Constructor TTTLFStationTMTFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTTLFStationTMTSOAPFunctionality:=nil;
end;

Destructor TTTLFStationTMTFunctionalityRemoted.Destroy;
begin
FTTTLFStationTMTSOAPFunctionality:=nil;
Inherited;
end;

function TTTLFStationTMTFunctionalityRemoted.TTTLFStationTMTSOAPFunctionality: ITTTLFStationTMTSOAPFunctionality;
begin
if FTTTLFStationTMTSOAPFunctionality = nil
  then FTTTLFStationTMTSOAPFunctionality:=GetITTTLFStationTMTSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTLFStationTMTSOAPFunctionality;
end;

procedure TTTLFStationTMTFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
TTTLFStationTMTSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
end;


{TTLFStationTMTFunctionality}
Constructor TTLFStationTMTFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTTLFStationTMTSOAPFunctionality:=nil;
end;

Destructor TTLFStationTMTFunctionalityRemoted.Destroy;
begin
FTTLFStationTMTSOAPFunctionality:=nil;
Inherited;
end;

function TTLFStationTMTFunctionalityRemoted.TTLFStationTMTSOAPFunctionality: ITTLFStationTMTSOAPFunctionality;
begin
if FTTLFStationTMTSOAPFunctionality = nil
  then FTTLFStationTMTSOAPFunctionality:=GetITTLFStationTMTSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTLFStationTMTSOAPFunctionality;
end;

function TTLFStationTMTFunctionalityRemoted.getName: string;
begin
Result:=TTLFStationTMTSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTLFStationTMTFunctionalityRemoted.getHint: string;
begin
Result:=TTLFStationTMTSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTLFStationTMTFunctionalityRemoted.getHostName: string;
begin
Result:=TTLFStationTMTSOAPFunctionality.getHostName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTLFStationTMTFunctionalityRemoted.setHostName(Value: string);
begin
TTLFStationTMTSOAPFunctionality.setHostName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTLFStationTMTFunctionalityRemoted.getTestChanel: string;
begin
Result:=TTLFStationTMTSOAPFunctionality.getTestChanel(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTLFStationTMTFunctionalityRemoted.setTestChanel(Value: string);
begin
TTLFStationTMTSOAPFunctionality.setTestChanel(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;


{TTNameFunctionality}
Constructor TTNameFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTNameSOAPFunctionality:=nil;
end;

Destructor TTNameFunctionalityRemoted.Destroy;
begin
FTTNameSOAPFunctionality:=nil;
Inherited;
end;

function TTNameFunctionalityRemoted.TTNameSOAPFunctionality: ITTNameSOAPFunctionality;
begin
if FTTNameSOAPFunctionality = nil
  then FTTNameSOAPFunctionality:=GetITTNameSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTNameSOAPFunctionality;
end;


{TNameFunctionality}
Constructor TNameFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTNameSOAPFunctionality:=nil;
end;

Destructor TNameFunctionalityRemoted.Destroy;
begin
FTNameSOAPFunctionality:=nil;
Inherited;
end;

function TNameFunctionalityRemoted.TNameSOAPFunctionality: ITNameSOAPFunctionality;
begin
if FTNameSOAPFunctionality = nil
  then FTNameSOAPFunctionality:=GetITNameSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTNameSOAPFunctionality;
end;

function TNameFunctionalityRemoted.getName: string;
begin
Result:=TNameSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TNameFunctionalityRemoted.getHint: string;
begin
Result:=TNameSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TNameFunctionalityRemoted.Value: string;
begin
Result:=TNameSOAPFunctionality.Value(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TNameFunctionalityRemoted.SetValue(const NewValue: string);
begin
TNameSOAPFunctionality.SetValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewValue);
end;


{TTVisualizationFunctionality}
Constructor TTVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTVisualizationSOAPFunctionality:=nil;
end;

Destructor TTVisualizationFunctionalityRemoted.Destroy;
begin
FTTVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTVisualizationFunctionalityRemoted.TTVisualizationSOAPFunctionality: ITTVisualizationSOAPFunctionality;
begin
if FTTVisualizationSOAPFunctionality = nil
  then FTTVisualizationSOAPFunctionality:=GetITTVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTVisualizationSOAPFunctionality;
end;


{TVisualizationFunctionality}
Constructor TVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTVisualizationSOAPFunctionality:=nil;
end;

Destructor TVisualizationFunctionalityRemoted.Destroy;
begin
FTVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TVisualizationFunctionalityRemoted.TVisualizationSOAPFunctionality: ITVisualizationSOAPFunctionality;
begin
if FTVisualizationSOAPFunctionality = nil
  then FTVisualizationSOAPFunctionality:=GetITVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTVisualizationSOAPFunctionality;
end;

function TVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTHREFVisualizationFunctionality}
Constructor TTHREFVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTHREFVisualizationSOAPFunctionality:=nil;
end;

Destructor TTHREFVisualizationFunctionalityRemoted.Destroy;
begin
FTTHREFVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTHREFVisualizationFunctionalityRemoted.TTHREFVisualizationSOAPFunctionality: ITTHREFVisualizationSOAPFunctionality;
begin
if FTTHREFVisualizationSOAPFunctionality = nil
  then FTTHREFVisualizationSOAPFunctionality:=GetITTHREFVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHREFVisualizationSOAPFunctionality;
end;


{THREFVisualizationFunctionality}
Constructor THREFVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTHREFVisualizationSOAPFunctionality:=nil;
end;

Destructor THREFVisualizationFunctionalityRemoted.Destroy;
begin
FTHREFVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function THREFVisualizationFunctionalityRemoted.THREFVisualizationSOAPFunctionality: ITHREFVisualizationSOAPFunctionality;
begin
if FTHREFVisualizationSOAPFunctionality = nil
  then FTHREFVisualizationSOAPFunctionality:=GetITHREFVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHREFVisualizationSOAPFunctionality;
end;

function THREFVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=THREFVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;


{TTTTFVisualizationFunctionality}
Constructor TTTTFVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTTTFVisualizationSOAPFunctionality:=nil;
end;

Destructor TTTTFVisualizationFunctionalityRemoted.Destroy;
begin
FTTTTFVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTTTFVisualizationFunctionalityRemoted.TTTTFVisualizationSOAPFunctionality: ITTTTFVisualizationSOAPFunctionality;
begin
if FTTTTFVisualizationSOAPFunctionality = nil
  then FTTTTFVisualizationSOAPFunctionality:=GetITTTTFVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTTFVisualizationSOAPFunctionality;
end;


{TTTFVisualizationFunctionality}
Constructor TTTFVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTTTFVisualizationSOAPFunctionality:=nil;
end;

Destructor TTTFVisualizationFunctionalityRemoted.Destroy;
begin
FTTTFVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTTFVisualizationFunctionalityRemoted.TTTFVisualizationSOAPFunctionality: ITTTFVisualizationSOAPFunctionality;
begin
if FTTTFVisualizationSOAPFunctionality = nil
  then FTTTFVisualizationSOAPFunctionality:=GetITTTFVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTTFVisualizationSOAPFunctionality;
end;

function TTTFVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TTTFVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TTTFVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TTTFVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTTFVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TTTFVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTTFVisualizationFunctionalityRemoted.getStr: string;
begin
Result:=TTTFVisualizationSOAPFunctionality.getStr(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTTFVisualizationFunctionalityRemoted.setStr(const Value: string);
begin
TTTFVisualizationSOAPFunctionality.setStr(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TTTFVisualizationFunctionalityRemoted.GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString);
begin
TTTFVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   oStr,oFont_Width,oFont_Height,oFont_Name);
end;

procedure TTTFVisualizationFunctionalityRemoted.SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString);
begin
TTTFVisualizationSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   pStr,pFont_Width,pFont_Height,pFont_Name);
end;


{TTObjectFunctionality}
Constructor TTObjectFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTObjectSOAPFunctionality:=nil;
end;

Destructor TTObjectFunctionalityRemoted.Destroy;
begin
FTTObjectSOAPFunctionality:=nil;
Inherited;
end;

function TTObjectFunctionalityRemoted.TTObjectSOAPFunctionality: ITTObjectSOAPFunctionality;
begin
if FTTObjectSOAPFunctionality = nil
  then FTTObjectSOAPFunctionality:=GetITTObjectSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTObjectSOAPFunctionality;
end;


{TObjectFunctionality}
Constructor TObjectFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTObjectSOAPFunctionality:=nil;
end;

Destructor TObjectFunctionalityRemoted.Destroy;
begin
FTObjectSOAPFunctionality:=nil;
Inherited;
end;

function TObjectFunctionalityRemoted.TObjectSOAPFunctionality: ITObjectSOAPFunctionality;
begin
if FTObjectSOAPFunctionality = nil
  then FTObjectSOAPFunctionality:=GetITObjectSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTObjectSOAPFunctionality;
end;

function TObjectFunctionalityRemoted.getName: string;
begin
Result:=TObjectSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TObjectFunctionalityRemoted.getHint: string;
begin
Result:=TObjectSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTLabelFunctionality}
Constructor TTLabelFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTLabelSOAPFunctionality:=nil;
end;

Destructor TTLabelFunctionalityRemoted.Destroy;
begin
FTTLabelSOAPFunctionality:=nil;
Inherited;
end;

function TTLabelFunctionalityRemoted.TTLabelSOAPFunctionality: ITTLabelSOAPFunctionality;
begin
if FTTLabelSOAPFunctionality = nil
  then FTTLabelSOAPFunctionality:=GetITTLabelSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTLabelSOAPFunctionality;
end;


{TLabelFunctionality}
Constructor TLabelFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTLabelSOAPFunctionality:=nil;
end;

Destructor TLabelFunctionalityRemoted.Destroy;
begin
FTLabelSOAPFunctionality:=nil;
Inherited;
end;

function TLabelFunctionalityRemoted.TLabelSOAPFunctionality: ITLabelSOAPFunctionality;
begin
if FTLabelSOAPFunctionality = nil
  then FTLabelSOAPFunctionality:=GetITLabelSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTLabelSOAPFunctionality;
end;

function TLabelFunctionalityRemoted.getName: string;
begin
Result:=TLabelSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TLabelFunctionalityRemoted.getHint: string;
begin
Result:=TLabelSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTStationFunctionality}
Constructor TTStationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTStationSOAPFunctionality:=nil;
end;

Destructor TTStationFunctionalityRemoted.Destroy;
begin
FTTStationSOAPFunctionality:=nil;
Inherited;
end;

function TTStationFunctionalityRemoted.TTStationSOAPFunctionality: ITTStationSOAPFunctionality;
begin
if FTTStationSOAPFunctionality = nil
  then FTTStationSOAPFunctionality:=GetITTStationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTStationSOAPFunctionality;
end;

procedure TTStationFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
TTStationSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
end;


{TStationFunctionality}
Constructor TStationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTStationSOAPFunctionality:=nil;
end;

Destructor TStationFunctionalityRemoted.Destroy;
begin
FTStationSOAPFunctionality:=nil;
Inherited;
end;

function TStationFunctionalityRemoted.TStationSOAPFunctionality: ITStationSOAPFunctionality;
begin
if FTStationSOAPFunctionality = nil
  then FTStationSOAPFunctionality:=GetITStationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTStationSOAPFunctionality;
end;

function TStationFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TStationSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function TStationFunctionalityRemoted.getName: string;
begin
Result:=TStationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TStationFunctionalityRemoted.getHint: string;
begin
Result:=TStationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TStationFunctionalityRemoted.GetNumbersBound(out BegNumber,EndNumber: integer);
begin
TStationSOAPFunctionality.GetNumbersBound(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   BegNumber,EndNumber);
end;


{TTMainLineFunctionality}
Constructor TTMainLineFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTMainLineSOAPFunctionality:=nil;
end;

Destructor TTMainLineFunctionalityRemoted.Destroy;
begin
FTTMainLineSOAPFunctionality:=nil;
Inherited;
end;

function TTMainLineFunctionalityRemoted.TTMainLineSOAPFunctionality: ITTMainLineSOAPFunctionality;
begin
if FTTMainLineSOAPFunctionality = nil
  then FTTMainLineSOAPFunctionality:=GetITTMainLineSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMainLineSOAPFunctionality;
end;


{TMainLineFunctionality}
Constructor TMainLineFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTMainLineSOAPFunctionality:=nil;
end;

Destructor TMainLineFunctionalityRemoted.Destroy;
begin
FTMainLineSOAPFunctionality:=nil;
Inherited;
end;

function TMainLineFunctionalityRemoted.TMainLineSOAPFunctionality: ITMainLineSOAPFunctionality;
begin
if FTMainLineSOAPFunctionality = nil
  then FTMainLineSOAPFunctionality:=GetITMainLineSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMainLineSOAPFunctionality;
end;

function TMainLineFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TMainLineSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function TMainLineFunctionalityRemoted.getName: string;
begin
Result:=TMainLineSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMainLineFunctionalityRemoted.getHint: string;
begin
Result:=TMainLineSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMainLineFunctionalityRemoted.GetSTNOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TMainLineSOAPFunctionality.GetSTNOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTOwner,idOwner);
end;


{TTDescriptionFunctionality}
Constructor TTDescriptionFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTDescriptionSOAPFunctionality:=nil;
end;

Destructor TTDescriptionFunctionalityRemoted.Destroy;
begin
FTTDescriptionSOAPFunctionality:=nil;
Inherited;
end;

function TTDescriptionFunctionalityRemoted.TTDescriptionSOAPFunctionality: ITTDescriptionSOAPFunctionality;
begin
if FTTDescriptionSOAPFunctionality = nil
  then FTTDescriptionSOAPFunctionality:=GetITTDescriptionSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTDescriptionSOAPFunctionality;
end;


{TDescriptionFunctionality}
Constructor TDescriptionFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTDescriptionSOAPFunctionality:=nil;
end;

Destructor TDescriptionFunctionalityRemoted.Destroy;
begin
FTDescriptionSOAPFunctionality:=nil;
Inherited;
end;

function TDescriptionFunctionalityRemoted.TDescriptionSOAPFunctionality: ITDescriptionSOAPFunctionality;
begin
if FTDescriptionSOAPFunctionality = nil
  then FTDescriptionSOAPFunctionality:=GetITDescriptionSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTDescriptionSOAPFunctionality;
end;

function TDescriptionFunctionalityRemoted.getName: string;
begin
Result:=TDescriptionSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TDescriptionFunctionalityRemoted.getHint: string;
begin
Result:=TDescriptionSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TDescriptionFunctionalityRemoted.GetValue(out vText: TByteArray);
begin
TDescriptionSOAPFunctionality.GetValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   vText);
end;

procedure TDescriptionFunctionalityRemoted.SetValue(NewValue: TByteArray);
begin
TDescriptionSOAPFunctionality.SetValue(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   NewValue);
end;


{TTImageFunctionality}
Constructor TTImageFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTImageSOAPFunctionality:=nil;
end;

Destructor TTImageFunctionalityRemoted.Destroy;
begin
FTTImageSOAPFunctionality:=nil;
Inherited;
end;

function TTImageFunctionalityRemoted.TTImageSOAPFunctionality: ITTImageSOAPFunctionality;
begin
if FTTImageSOAPFunctionality = nil
  then FTTImageSOAPFunctionality:=GetITTImageSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTImageSOAPFunctionality;
end;


{TImageFunctionality}
Constructor TImageFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTImageSOAPFunctionality:=nil;
end;

Destructor TImageFunctionalityRemoted.Destroy;
begin
FTImageSOAPFunctionality:=nil;
Inherited;
end;

function TImageFunctionalityRemoted.TImageSOAPFunctionality: ITImageSOAPFunctionality;
begin
if FTImageSOAPFunctionality = nil
  then FTImageSOAPFunctionality:=GetITImageSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTImageSOAPFunctionality;
end;

function TImageFunctionalityRemoted.getName: string;
begin
Result:=TImageSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TImageFunctionalityRemoted.getHint: string;
begin
Result:=TImageSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TImageFunctionalityRemoted.GetDATAType1: integer;
begin
Result:=TImageSOAPFunctionality.GetDATAType1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TImageFunctionalityRemoted.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TImageSOAPFunctionality.GetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TImageFunctionalityRemoted.SetDATA(DATAStream: TByteArray; const DATAType: Integer);
begin
TImageSOAPFunctionality.SetDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   DATAStream,DATAType);
end;

procedure TImageFunctionalityRemoted.GetBitmapDATA(out BMPDATAStream: TByteArray);
begin
TImageSOAPFunctionality.GetBitmapDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   BMPDATAStream);
end;


{TTWellFunctionality}
Constructor TTWellFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTWellSOAPFunctionality:=nil;
end;

Destructor TTWellFunctionalityRemoted.Destroy;
begin
FTTWellSOAPFunctionality:=nil;
Inherited;
end;

function TTWellFunctionalityRemoted.TTWellSOAPFunctionality: ITTWellSOAPFunctionality;
begin
if FTTWellSOAPFunctionality = nil
  then FTTWellSOAPFunctionality:=GetITTWellSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTWellSOAPFunctionality;
end;


{TWellFunctionality}
Constructor TWellFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTWellSOAPFunctionality:=nil;
end;

Destructor TWellFunctionalityRemoted.Destroy;
begin
FTWellSOAPFunctionality:=nil;
Inherited;
end;

function TWellFunctionalityRemoted.TWellSOAPFunctionality: ITWellSOAPFunctionality;
begin
if FTWellSOAPFunctionality = nil
  then FTWellSOAPFunctionality:=GetITWellSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTWellSOAPFunctionality;
end;

function TWellFunctionalityRemoted.getName: string;
begin
Result:=TWellSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TWellFunctionalityRemoted.getHint: string;
begin
Result:=TWellSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTTLFFunctionality}
Constructor TTTLFFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTTLFSOAPFunctionality:=nil;
end;

Destructor TTTLFFunctionalityRemoted.Destroy;
begin
FTTTLFSOAPFunctionality:=nil;
Inherited;
end;

function TTTLFFunctionalityRemoted.TTTLFSOAPFunctionality: ITTTLFSOAPFunctionality;
begin
if FTTTLFSOAPFunctionality = nil
  then FTTTLFSOAPFunctionality:=GetITTTLFSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTTLFSOAPFunctionality;
end;

procedure TTTLFFunctionalityRemoted.GetIDInstanceByNumber(out ID: integer; const Number: integer);
begin
TTTLFSOAPFunctionality.GetIDInstanceByNumber(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   ID,Number);
end;


{TTLFFunctionality}
Constructor TTLFFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTTLFSOAPFunctionality:=nil;
end;

Destructor TTLFFunctionalityRemoted.Destroy;
begin
FTTLFSOAPFunctionality:=nil;
Inherited;
end;

function TTLFFunctionalityRemoted.TTLFSOAPFunctionality: ITTLFSOAPFunctionality;
begin
if FTTLFSOAPFunctionality = nil
  then FTTLFSOAPFunctionality:=GetITTLFSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTTLFSOAPFunctionality;
end;

function TTLFFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TTLFSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function TTLFFunctionalityRemoted.getName: string;
begin
Result:=TTLFSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTLFFunctionalityRemoted.getHint: string;
begin
Result:=TTLFSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTLFFunctionalityRemoted.Number: integer;
begin
Result:=TTLFSOAPFunctionality.Number(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTLFFunctionalityRemoted.LocalELockExist: boolean;
begin
Result:=TTLFSOAPFunctionality.LocalELockExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTLFFunctionalityRemoted.GlobalELockExist: boolean;
begin
Result:=TTLFSOAPFunctionality.GlobalELockExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTLFFunctionalityRemoted.GetFinishDevice(out vidTObj,vidObj: integer): boolean;
begin
Result:=TTLFSOAPFunctionality.GetFinishDevice(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   vidTObj,vidObj);
end;

function TTLFFunctionalityRemoted.IsDamaged: boolean;
begin
Result:=TTLFSOAPFunctionality.IsDamaged(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTLFFunctionalityRemoted.idDamage: integer;
begin
Result:=TTLFSOAPFunctionality.idDamage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TTLFFunctionalityRemoted.getDamage_TimeNote: TDateTime;
begin
Result:=TTLFSOAPFunctionality.getDamage_TimeNote(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTLFFunctionalityRemoted.setDamage_TimeNote(Value: TDateTime);
begin
TTLFSOAPFunctionality.setDamage_TimeNote(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTLFFunctionalityRemoted.getDamage_Note: string;
begin
Result:=TTLFSOAPFunctionality.getDamage_Note(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTLFFunctionalityRemoted.setDamage_Note(Value: string);
begin
TTLFSOAPFunctionality.setDamage_Note(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTLFFunctionalityRemoted.getDamage_Measured: string;
begin
Result:=TTLFSOAPFunctionality.getDamage_Measured(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTLFFunctionalityRemoted.setDamage_Measured(Value: string);
begin
TTLFSOAPFunctionality.setDamage_Measured(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTLFFunctionalityRemoted.getDamage_Acceptor: string;
begin
Result:=TTLFSOAPFunctionality.getDamage_Acceptor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTLFFunctionalityRemoted.setDamage_Acceptor(Value: string);
begin
TTLFSOAPFunctionality.setDamage_Acceptor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTLFFunctionalityRemoted.getDamage_TimeBegRepair: TDateTime;
begin
Result:=TTLFSOAPFunctionality.getDamage_TimeBegRepair(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTLFFunctionalityRemoted.setDamage_TimeBegRepair(Value: TDateTime);
begin
TTLFSOAPFunctionality.setDamage_TimeBegRepair(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTLFFunctionalityRemoted.getDamage_TimeEndRepair: TDateTime;
begin
Result:=TTLFSOAPFunctionality.getDamage_TimeEndRepair(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTLFFunctionalityRemoted.setDamage_TimeEndRepair(Value: TDateTime);
begin
TTLFSOAPFunctionality.setDamage_TimeEndRepair(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTLFFunctionalityRemoted.getDamage_Damage: string;
begin
Result:=TTLFSOAPFunctionality.getDamage_Damage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTLFFunctionalityRemoted.setDamage_Damage(Value: string);
begin
TTLFSOAPFunctionality.setDamage_Damage(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTLFFunctionalityRemoted.getDamage_Executor: string;
begin
Result:=TTLFSOAPFunctionality.getDamage_Executor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTLFFunctionalityRemoted.setDamage_Executor(Value: string);
begin
TTLFSOAPFunctionality.setDamage_Executor(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TTLFFunctionalityRemoted.getDamage_Remarks: string;
begin
Result:=TTLFSOAPFunctionality.getDamage_Remarks(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TTLFFunctionalityRemoted.setDamage_Remarks(Value: string);
begin
TTLFSOAPFunctionality.setDamage_Remarks(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TTLFFunctionalityRemoted.WriteEvent(const Event: string; const EventTime: TDateTime);
begin
TTLFSOAPFunctionality.WriteEvent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Event,EventTime);
end;


{TTBoxFunctionality}
Constructor TTBoxFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTBoxSOAPFunctionality:=nil;
end;

Destructor TTBoxFunctionalityRemoted.Destroy;
begin
FTTBoxSOAPFunctionality:=nil;
Inherited;
end;

function TTBoxFunctionalityRemoted.TTBoxSOAPFunctionality: ITTBoxSOAPFunctionality;
begin
if FTTBoxSOAPFunctionality = nil
  then FTTBoxSOAPFunctionality:=GetITTBoxSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTBoxSOAPFunctionality;
end;


{TBoxFunctionality}
Constructor TBoxFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTBoxSOAPFunctionality:=nil;
end;

Destructor TBoxFunctionalityRemoted.Destroy;
begin
FTBoxSOAPFunctionality:=nil;
Inherited;
end;

function TBoxFunctionalityRemoted.TBoxSOAPFunctionality: ITBoxSOAPFunctionality;
begin
if FTBoxSOAPFunctionality = nil
  then FTBoxSOAPFunctionality:=GetITBoxSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTBoxSOAPFunctionality;
end;

function TBoxFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TBoxSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function TBoxFunctionalityRemoted.getName: string;
begin
Result:=TBoxSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TBoxFunctionalityRemoted.getHint: string;
begin
Result:=TBoxSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTCableBoxFunctionality}
Constructor TTCableBoxFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCableBoxSOAPFunctionality:=nil;
end;

Destructor TTCableBoxFunctionalityRemoted.Destroy;
begin
FTTCableBoxSOAPFunctionality:=nil;
Inherited;
end;

function TTCableBoxFunctionalityRemoted.TTCableBoxSOAPFunctionality: ITTCableBoxSOAPFunctionality;
begin
if FTTCableBoxSOAPFunctionality = nil
  then FTTCableBoxSOAPFunctionality:=GetITTCableBoxSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCableBoxSOAPFunctionality;
end;


{TCableBoxFunctionality}
Constructor TCableBoxFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCableBoxSOAPFunctionality:=nil;
end;

Destructor TCableBoxFunctionalityRemoted.Destroy;
begin
FTCableBoxSOAPFunctionality:=nil;
Inherited;
end;

function TCableBoxFunctionalityRemoted.TCableBoxSOAPFunctionality: ITCableBoxSOAPFunctionality;
begin
if FTCableBoxSOAPFunctionality = nil
  then FTCableBoxSOAPFunctionality:=GetITCableBoxSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCableBoxSOAPFunctionality;
end;

function TCableBoxFunctionalityRemoted.getName: string;
begin
Result:=TCableBoxSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCableBoxFunctionalityRemoted.getHint: string;
begin
Result:=TCableBoxSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTDistrLineFunctionality}
Constructor TTDistrLineFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTDistrLineSOAPFunctionality:=nil;
end;

Destructor TTDistrLineFunctionalityRemoted.Destroy;
begin
FTTDistrLineSOAPFunctionality:=nil;
Inherited;
end;

function TTDistrLineFunctionalityRemoted.TTDistrLineSOAPFunctionality: ITTDistrLineSOAPFunctionality;
begin
if FTTDistrLineSOAPFunctionality = nil
  then FTTDistrLineSOAPFunctionality:=GetITTDistrLineSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTDistrLineSOAPFunctionality;
end;


{TDistrLineFunctionality}
Constructor TDistrLineFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTDistrLineSOAPFunctionality:=nil;
end;

Destructor TDistrLineFunctionalityRemoted.Destroy;
begin
FTDistrLineSOAPFunctionality:=nil;
Inherited;
end;

function TDistrLineFunctionalityRemoted.TDistrLineSOAPFunctionality: ITDistrLineSOAPFunctionality;
begin
if FTDistrLineSOAPFunctionality = nil
  then FTDistrLineSOAPFunctionality:=GetITDistrLineSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTDistrLineSOAPFunctionality;
end;

function TDistrLineFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TDistrLineSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function TDistrLineFunctionalityRemoted.getName: string;
begin
Result:=TDistrLineSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TDistrLineFunctionalityRemoted.getHint: string;
begin
Result:=TDistrLineSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTClientFunctionality}
Constructor TTClientFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTClientSOAPFunctionality:=nil;
end;

Destructor TTClientFunctionalityRemoted.Destroy;
begin
FTTClientSOAPFunctionality:=nil;
Inherited;
end;

function TTClientFunctionalityRemoted.TTClientSOAPFunctionality: ITTClientSOAPFunctionality;
begin
if FTTClientSOAPFunctionality = nil
  then FTTClientSOAPFunctionality:=GetITTClientSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTClientSOAPFunctionality;
end;

procedure TTClientFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
TTClientSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   List);
end;


{TClientFunctionality}
Constructor TClientFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTClientSOAPFunctionality:=nil;
end;

Destructor TClientFunctionalityRemoted.Destroy;
begin
FTClientSOAPFunctionality:=nil;
Inherited;
end;

function TClientFunctionalityRemoted.TClientSOAPFunctionality: ITClientSOAPFunctionality;
begin
if FTClientSOAPFunctionality = nil
  then FTClientSOAPFunctionality:=GetITClientSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTClientSOAPFunctionality;
end;

function TClientFunctionalityRemoted.GetDebet(out Value: Double): boolean;
begin
Result:=TClientSOAPFunctionality.GetDebet(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TClientFunctionalityRemoted.getName: string;
begin
Result:=TClientSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TClientFunctionalityRemoted.getHint: string;
begin
Result:=TClientSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTHouseFunctionality}
Constructor TTHouseFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTHouseSOAPFunctionality:=nil;
end;

Destructor TTHouseFunctionalityRemoted.Destroy;
begin
FTTHouseSOAPFunctionality:=nil;
Inherited;
end;

function TTHouseFunctionalityRemoted.TTHouseSOAPFunctionality: ITTHouseSOAPFunctionality;
begin
if FTTHouseSOAPFunctionality = nil
  then FTTHouseSOAPFunctionality:=GetITTHouseSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHouseSOAPFunctionality;
end;


{THouseFunctionality}
Constructor THouseFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTHouseSOAPFunctionality:=nil;
end;

Destructor THouseFunctionalityRemoted.Destroy;
begin
FTHouseSOAPFunctionality:=nil;
Inherited;
end;

function THouseFunctionalityRemoted.THouseSOAPFunctionality: ITHouseSOAPFunctionality;
begin
if FTHouseSOAPFunctionality = nil
  then FTHouseSOAPFunctionality:=GetITHouseSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHouseSOAPFunctionality;
end;

function THouseFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=THouseSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function THouseFunctionalityRemoted.getName: string;
begin
Result:=THouseSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function THouseFunctionalityRemoted.getHint: string;
begin
Result:=THouseSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTCommNodeFunctionality}
Constructor TTCommNodeFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCommNodeSOAPFunctionality:=nil;
end;

Destructor TTCommNodeFunctionalityRemoted.Destroy;
begin
FTTCommNodeSOAPFunctionality:=nil;
Inherited;
end;

function TTCommNodeFunctionalityRemoted.TTCommNodeSOAPFunctionality: ITTCommNodeSOAPFunctionality;
begin
if FTTCommNodeSOAPFunctionality = nil
  then FTTCommNodeSOAPFunctionality:=GetITTCommNodeSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCommNodeSOAPFunctionality;
end;


{TCommNodeFunctionality}
Constructor TCommNodeFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCommNodeSOAPFunctionality:=nil;
end;

Destructor TCommNodeFunctionalityRemoted.Destroy;
begin
FTCommNodeSOAPFunctionality:=nil;
Inherited;
end;

function TCommNodeFunctionalityRemoted.TCommNodeSOAPFunctionality: ITCommNodeSOAPFunctionality;
begin
if FTCommNodeSOAPFunctionality = nil
  then FTCommNodeSOAPFunctionality:=GetITCommNodeSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCommNodeSOAPFunctionality;
end;

function TCommNodeFunctionalityRemoted.getName: string;
begin
Result:=TCommNodeSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCommNodeFunctionalityRemoted.getHint: string;
begin
Result:=TCommNodeSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTCrossFunctionality}
Constructor TTCrossFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCrossSOAPFunctionality:=nil;
end;

Destructor TTCrossFunctionalityRemoted.Destroy;
begin
FTTCrossSOAPFunctionality:=nil;
Inherited;
end;

function TTCrossFunctionalityRemoted.TTCrossSOAPFunctionality: ITTCrossSOAPFunctionality;
begin
if FTTCrossSOAPFunctionality = nil
  then FTTCrossSOAPFunctionality:=GetITTCrossSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCrossSOAPFunctionality;
end;


{TCrossFunctionality}
Constructor TCrossFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCrossSOAPFunctionality:=nil;
end;

Destructor TCrossFunctionalityRemoted.Destroy;
begin
FTCrossSOAPFunctionality:=nil;
Inherited;
end;

function TCrossFunctionalityRemoted.TCrossSOAPFunctionality: ITCrossSOAPFunctionality;
begin
if FTCrossSOAPFunctionality = nil
  then FTCrossSOAPFunctionality:=GetITCrossSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCrossSOAPFunctionality;
end;

function TCrossFunctionalityRemoted.getName: string;
begin
Result:=TCrossSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCrossFunctionalityRemoted.getHint: string;
begin
Result:=TCrossSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTCaseFunctionality}
Constructor TTCaseFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCaseSOAPFunctionality:=nil;
end;

Destructor TTCaseFunctionalityRemoted.Destroy;
begin
FTTCaseSOAPFunctionality:=nil;
Inherited;
end;

function TTCaseFunctionalityRemoted.TTCaseSOAPFunctionality: ITTCaseSOAPFunctionality;
begin
if FTTCaseSOAPFunctionality = nil
  then FTTCaseSOAPFunctionality:=GetITTCaseSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCaseSOAPFunctionality;
end;


{TCaseFunctionality}
Constructor TCaseFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCaseSOAPFunctionality:=nil;
end;

Destructor TCaseFunctionalityRemoted.Destroy;
begin
FTCaseSOAPFunctionality:=nil;
Inherited;
end;

function TCaseFunctionalityRemoted.TCaseSOAPFunctionality: ITCaseSOAPFunctionality;
begin
if FTCaseSOAPFunctionality = nil
  then FTCaseSOAPFunctionality:=GetITCaseSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCaseSOAPFunctionality;
end;

function TCaseFunctionalityRemoted.getName: string;
begin
Result:=TCaseSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCaseFunctionalityRemoted.getHint: string;
begin
Result:=TCaseSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTStreetFunctionality}
Constructor TTStreetFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTStreetSOAPFunctionality:=nil;
end;

Destructor TTStreetFunctionalityRemoted.Destroy;
begin
FTTStreetSOAPFunctionality:=nil;
Inherited;
end;

function TTStreetFunctionalityRemoted.TTStreetSOAPFunctionality: ITTStreetSOAPFunctionality;
begin
if FTTStreetSOAPFunctionality = nil
  then FTTStreetSOAPFunctionality:=GetITTStreetSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTStreetSOAPFunctionality;
end;


{TStreetFunctionality}
Constructor TStreetFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTStreetSOAPFunctionality:=nil;
end;

Destructor TStreetFunctionalityRemoted.Destroy;
begin
FTStreetSOAPFunctionality:=nil;
Inherited;
end;

function TStreetFunctionalityRemoted.TStreetSOAPFunctionality: ITStreetSOAPFunctionality;
begin
if FTStreetSOAPFunctionality = nil
  then FTStreetSOAPFunctionality:=GetITStreetSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTStreetSOAPFunctionality;
end;

function TStreetFunctionalityRemoted.getName: string;
begin
Result:=TStreetSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TStreetFunctionalityRemoted.getHint: string;
begin
Result:=TStreetSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTOtherObjFunctionality}
Constructor TTOtherObjFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTOtherObjSOAPFunctionality:=nil;
end;

Destructor TTOtherObjFunctionalityRemoted.Destroy;
begin
FTTOtherObjSOAPFunctionality:=nil;
Inherited;
end;

function TTOtherObjFunctionalityRemoted.TTOtherObjSOAPFunctionality: ITTOtherObjSOAPFunctionality;
begin
if FTTOtherObjSOAPFunctionality = nil
  then FTTOtherObjSOAPFunctionality:=GetITTOtherObjSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOtherObjSOAPFunctionality;
end;


{TOtherObjFunctionality}
Constructor TOtherObjFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTOtherObjSOAPFunctionality:=nil;
end;

Destructor TOtherObjFunctionalityRemoted.Destroy;
begin
FTOtherObjSOAPFunctionality:=nil;
Inherited;
end;

function TOtherObjFunctionalityRemoted.TOtherObjSOAPFunctionality: ITOtherObjSOAPFunctionality;
begin
if FTOtherObjSOAPFunctionality = nil
  then FTOtherObjSOAPFunctionality:=GetITOtherObjSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOtherObjSOAPFunctionality;
end;

function TOtherObjFunctionalityRemoted.getName: string;
begin
Result:=TOtherObjSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOtherObjFunctionalityRemoted.getHint: string;
begin
Result:=TOtherObjSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTSpanFunctionality}
Constructor TTSpanFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTSpanSOAPFunctionality:=nil;
end;

Destructor TTSpanFunctionalityRemoted.Destroy;
begin
FTTSpanSOAPFunctionality:=nil;
Inherited;
end;

function TTSpanFunctionalityRemoted.TTSpanSOAPFunctionality: ITTSpanSOAPFunctionality;
begin
if FTTSpanSOAPFunctionality = nil
  then FTTSpanSOAPFunctionality:=GetITTSpanSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTSpanSOAPFunctionality;
end;


{TSpanFunctionality}
Constructor TSpanFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTSpanSOAPFunctionality:=nil;
end;

Destructor TSpanFunctionalityRemoted.Destroy;
begin
FTSpanSOAPFunctionality:=nil;
Inherited;
end;

function TSpanFunctionalityRemoted.TSpanSOAPFunctionality: ITSpanSOAPFunctionality;
begin
if FTSpanSOAPFunctionality = nil
  then FTSpanSOAPFunctionality:=GetITSpanSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTSpanSOAPFunctionality;
end;

function TSpanFunctionalityRemoted.getName: string;
begin
Result:=TSpanSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TSpanFunctionalityRemoted.getHint: string;
begin
Result:=TSpanSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTChanelFunctionality}
Constructor TTChanelFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTChanelSOAPFunctionality:=nil;
end;

Destructor TTChanelFunctionalityRemoted.Destroy;
begin
FTTChanelSOAPFunctionality:=nil;
Inherited;
end;

function TTChanelFunctionalityRemoted.TTChanelSOAPFunctionality: ITTChanelSOAPFunctionality;
begin
if FTTChanelSOAPFunctionality = nil
  then FTTChanelSOAPFunctionality:=GetITTChanelSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTChanelSOAPFunctionality;
end;


{TChanelFunctionality}
Constructor TChanelFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTChanelSOAPFunctionality:=nil;
end;

Destructor TChanelFunctionalityRemoted.Destroy;
begin
FTChanelSOAPFunctionality:=nil;
Inherited;
end;

function TChanelFunctionalityRemoted.TChanelSOAPFunctionality: ITChanelSOAPFunctionality;
begin
if FTChanelSOAPFunctionality = nil
  then FTChanelSOAPFunctionality:=GetITChanelSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTChanelSOAPFunctionality;
end;

function TChanelFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TChanelSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function TChanelFunctionalityRemoted.getName: string;
begin
Result:=TChanelSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TChanelFunctionalityRemoted.getHint: string;
begin
Result:=TChanelSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTHandHoldFunctionality}
Constructor TTHandHoldFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTHandHoldSOAPFunctionality:=nil;
end;

Destructor TTHandHoldFunctionalityRemoted.Destroy;
begin
FTTHandHoldSOAPFunctionality:=nil;
Inherited;
end;

function TTHandHoldFunctionalityRemoted.TTHandHoldSOAPFunctionality: ITTHandHoldSOAPFunctionality;
begin
if FTTHandHoldSOAPFunctionality = nil
  then FTTHandHoldSOAPFunctionality:=GetITTHandHoldSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTHandHoldSOAPFunctionality;
end;


{THandHoldFunctionality}
Constructor THandHoldFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTHandHoldSOAPFunctionality:=nil;
end;

Destructor THandHoldFunctionalityRemoted.Destroy;
begin
FTHandHoldSOAPFunctionality:=nil;
Inherited;
end;

function THandHoldFunctionalityRemoted.THandHoldSOAPFunctionality: ITHandHoldSOAPFunctionality;
begin
if FTHandHoldSOAPFunctionality = nil
  then FTHandHoldSOAPFunctionality:=GetITHandHoldSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTHandHoldSOAPFunctionality;
end;

function THandHoldFunctionalityRemoted.getName: string;
begin
Result:=THandHoldSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function THandHoldFunctionalityRemoted.getHint: string;
begin
Result:=THandHoldSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTLineDistFunctionality}
Constructor TTLineDistFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTLineDistSOAPFunctionality:=nil;
end;

Destructor TTLineDistFunctionalityRemoted.Destroy;
begin
FTTLineDistSOAPFunctionality:=nil;
Inherited;
end;

function TTLineDistFunctionalityRemoted.TTLineDistSOAPFunctionality: ITTLineDistSOAPFunctionality;
begin
if FTTLineDistSOAPFunctionality = nil
  then FTTLineDistSOAPFunctionality:=GetITTLineDistSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTLineDistSOAPFunctionality;
end;


{TLineDistFunctionality}
Constructor TLineDistFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTLineDistSOAPFunctionality:=nil;
end;

Destructor TLineDistFunctionalityRemoted.Destroy;
begin
FTLineDistSOAPFunctionality:=nil;
Inherited;
end;

function TLineDistFunctionalityRemoted.TLineDistSOAPFunctionality: ITLineDistSOAPFunctionality;
begin
if FTLineDistSOAPFunctionality = nil
  then FTLineDistSOAPFunctionality:=GetITLineDistSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTLineDistSOAPFunctionality;
end;

function TLineDistFunctionalityRemoted.getName: string;
begin
Result:=TLineDistSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TLineDistFunctionalityRemoted.getHint: string;
begin
Result:=TLineDistSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTMuffFunctionality}
Constructor TTMuffFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTMuffSOAPFunctionality:=nil;
end;

Destructor TTMuffFunctionalityRemoted.Destroy;
begin
FTTMuffSOAPFunctionality:=nil;
Inherited;
end;

function TTMuffFunctionalityRemoted.TTMuffSOAPFunctionality: ITTMuffSOAPFunctionality;
begin
if FTTMuffSOAPFunctionality = nil
  then FTTMuffSOAPFunctionality:=GetITTMuffSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTMuffSOAPFunctionality;
end;


{TMuffFunctionality}
Constructor TMuffFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTMuffSOAPFunctionality:=nil;
end;

Destructor TMuffFunctionalityRemoted.Destroy;
begin
FTMuffSOAPFunctionality:=nil;
Inherited;
end;

function TMuffFunctionalityRemoted.TMuffSOAPFunctionality: ITMuffSOAPFunctionality;
begin
if FTMuffSOAPFunctionality = nil
  then FTMuffSOAPFunctionality:=GetITMuffSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTMuffSOAPFunctionality;
end;

function TMuffFunctionalityRemoted.getName: string;
begin
Result:=TMuffSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TMuffFunctionalityRemoted.getHint: string;
begin
Result:=TMuffSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTOfferFunctionality}
Constructor TTOfferFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTOfferSOAPFunctionality:=nil;
end;

Destructor TTOfferFunctionalityRemoted.Destroy;
begin
FTTOfferSOAPFunctionality:=nil;
Inherited;
end;

function TTOfferFunctionalityRemoted.TTOfferSOAPFunctionality: ITTOfferSOAPFunctionality;
begin
if FTTOfferSOAPFunctionality = nil
  then FTTOfferSOAPFunctionality:=GetITTOfferSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTOfferSOAPFunctionality;
end;

function TTOfferFunctionalityRemoted.GetOfferByHumanID(const HumanID: integer; out idOffer: integer): boolean;
begin
Result:=TTOfferSOAPFunctionality.GetOfferByHumanID(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   HumanID,idOffer);
end;


{TOfferFunctionality}
Constructor TOfferFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTOfferSOAPFunctionality:=nil;
end;

Destructor TOfferFunctionalityRemoted.Destroy;
begin
FTOfferSOAPFunctionality:=nil;
Inherited;
end;

function TOfferFunctionalityRemoted.TOfferSOAPFunctionality: ITOfferSOAPFunctionality;
begin
if FTOfferSOAPFunctionality = nil
  then FTOfferSOAPFunctionality:=GetITOfferSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTOfferSOAPFunctionality;
end;

function TOfferFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TOfferSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function TOfferFunctionalityRemoted.getName: string;
begin
Result:=TOfferSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOfferFunctionalityRemoted.setName(Value: string);
begin
TOfferSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOfferFunctionalityRemoted.getHint: string;
begin
Result:=TOfferSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOfferFunctionalityRemoted.getSchedule: string;
begin
Result:=TOfferSOAPFunctionality.getSchedule(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOfferFunctionalityRemoted.setSchedule(Value: string);
begin
TOfferSOAPFunctionality.setSchedule(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOfferFunctionalityRemoted.getPassword: string;
begin
Result:=TOfferSOAPFunctionality.getPassword(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOfferFunctionalityRemoted.setPassword(Value: string);
begin
TOfferSOAPFunctionality.setPassword(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOfferFunctionalityRemoted.getContactTLF: integer;
begin
Result:=TOfferSOAPFunctionality.getContactTLF(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOfferFunctionalityRemoted.setContactTLF(Value: integer);
begin
TOfferSOAPFunctionality.setContactTLF(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TOfferFunctionalityRemoted.getLastUpdated: TDateTime;
begin
Result:=TOfferSOAPFunctionality.getLastUpdated(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOfferFunctionalityRemoted.setLastUpdated(Value: TDateTime);
begin
TOfferSOAPFunctionality.setLastUpdated(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

procedure TOfferFunctionalityRemoted.LoadDATAFromStream(Stream: TByteArray);
begin
TOfferSOAPFunctionality.LoadDATAFromStream(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Stream);
end;

function TOfferFunctionalityRemoted.UserID: integer;
begin
Result:=TOfferSOAPFunctionality.UserID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOfferFunctionalityRemoted.UID: integer;
begin
Result:=TOfferSOAPFunctionality.UID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOfferFunctionalityRemoted.AddressStr: string;
begin
Result:=TOfferSOAPFunctionality.AddressStr(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TOfferFunctionalityRemoted.Goods_Insert: integer;
begin
Result:=TOfferSOAPFunctionality.Goods_Insert(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TOfferFunctionalityRemoted.Goods_GetList(out List: TByteArray);
begin
TOfferSOAPFunctionality.Goods_GetList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
end;

procedure TOfferFunctionalityRemoted.Goods_Remove(const idOfferGoods: integer);
begin
TOfferSOAPFunctionality.Goods_Remove(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idOfferGoods);
end;

procedure TOfferFunctionalityRemoted.Goods_Clear;
begin
TOfferSOAPFunctionality.Goods_Clear(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTDemandFunctionality}
Constructor TTDemandFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTDemandSOAPFunctionality:=nil;
end;

Destructor TTDemandFunctionalityRemoted.Destroy;
begin
FTTDemandSOAPFunctionality:=nil;
Inherited;
end;

function TTDemandFunctionalityRemoted.TTDemandSOAPFunctionality: ITTDemandSOAPFunctionality;
begin
if FTTDemandSOAPFunctionality = nil
  then FTTDemandSOAPFunctionality:=GetITTDemandSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTDemandSOAPFunctionality;
end;


{TDemandFunctionality}
Constructor TDemandFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTDemandSOAPFunctionality:=nil;
end;

Destructor TDemandFunctionalityRemoted.Destroy;
begin
FTDemandSOAPFunctionality:=nil;
Inherited;
end;

function TDemandFunctionalityRemoted.TDemandSOAPFunctionality: ITDemandSOAPFunctionality;
begin
if FTDemandSOAPFunctionality = nil
  then FTDemandSOAPFunctionality:=GetITDemandSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTDemandSOAPFunctionality;
end;

function TDemandFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TDemandSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function TDemandFunctionalityRemoted.getName: string;
begin
Result:=TDemandSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TDemandFunctionalityRemoted.getHint: string;
begin
Result:=TDemandSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTCommLineFunctionality}
Constructor TTCommLineFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCommLineSOAPFunctionality:=nil;
end;

Destructor TTCommLineFunctionalityRemoted.Destroy;
begin
FTTCommLineSOAPFunctionality:=nil;
Inherited;
end;

function TTCommLineFunctionalityRemoted.TTCommLineSOAPFunctionality: ITTCommLineSOAPFunctionality;
begin
if FTTCommLineSOAPFunctionality = nil
  then FTTCommLineSOAPFunctionality:=GetITTCommLineSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCommLineSOAPFunctionality;
end;


{TCommLineFunctionality}
Constructor TCommLineFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCommLineSOAPFunctionality:=nil;
end;

Destructor TCommLineFunctionalityRemoted.Destroy;
begin
FTCommLineSOAPFunctionality:=nil;
Inherited;
end;

function TCommLineFunctionalityRemoted.TCommLineSOAPFunctionality: ITCommLineSOAPFunctionality;
begin
if FTCommLineSOAPFunctionality = nil
  then FTCommLineSOAPFunctionality:=GetITCommLineSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCommLineSOAPFunctionality;
end;

function TCommLineFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TCommLineSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

function TCommLineFunctionalityRemoted.getName: string;
begin
Result:=TCommLineSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCommLineFunctionalityRemoted.getHint: string;
begin
Result:=TCommLineSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTGoodsFunctionality}
Constructor TTGoodsFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTGoodsSOAPFunctionality:=nil;
end;

Destructor TTGoodsFunctionalityRemoted.Destroy;
begin
FTTGoodsSOAPFunctionality:=nil;
Inherited;
end;

function TTGoodsFunctionalityRemoted.TTGoodsSOAPFunctionality: ITTGoodsSOAPFunctionality;
begin
if FTTGoodsSOAPFunctionality = nil
  then FTTGoodsSOAPFunctionality:=GetITTGoodsSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTGoodsSOAPFunctionality;
end;

procedure TTGoodsFunctionalityRemoted.GetInstanceListContainingContext(const Context: string; out List: TByteArray);
begin
TTGoodsSOAPFunctionality.GetInstanceListContainingContext(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   Context,List);
end;

function TTGoodsFunctionalityRemoted.IsInstanceExist(const pName: string; out idGoods: integer): boolean;
begin
Result:=TTGoodsSOAPFunctionality.IsInstanceExist(TypeFunctionality.UserName,TypeFunctionality.UserPassword,   pName,idGoods);
end;


{TGoodsFunctionality}
Constructor TGoodsFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTGoodsSOAPFunctionality:=nil;
end;

Destructor TGoodsFunctionalityRemoted.Destroy;
begin
FTGoodsSOAPFunctionality:=nil;
Inherited;
end;

function TGoodsFunctionalityRemoted.TGoodsSOAPFunctionality: ITGoodsSOAPFunctionality;
begin
if FTGoodsSOAPFunctionality = nil
  then FTGoodsSOAPFunctionality:=GetITGoodsSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTGoodsSOAPFunctionality;
end;

function TGoodsFunctionalityRemoted.getName: string;
begin
Result:=TGoodsSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TGoodsFunctionalityRemoted.setName(Value: string);
begin
TGoodsSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TGoodsFunctionalityRemoted.getHint: string;
begin
Result:=TGoodsSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TGoodsFunctionalityRemoted.StdAmount: integer;
begin
Result:=TGoodsSOAPFunctionality.StdAmount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TGoodsFunctionalityRemoted.StdMeasureUnit: string;
begin
Result:=TGoodsSOAPFunctionality.StdMeasureUnit(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;


{TTCollectionFunctionality}
Constructor TTCollectionFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTCollectionSOAPFunctionality:=nil;
end;

Destructor TTCollectionFunctionalityRemoted.Destroy;
begin
FTTCollectionSOAPFunctionality:=nil;
Inherited;
end;

function TTCollectionFunctionalityRemoted.TTCollectionSOAPFunctionality: ITTCollectionSOAPFunctionality;
begin
if FTTCollectionSOAPFunctionality = nil
  then FTTCollectionSOAPFunctionality:=GetITTCollectionSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTCollectionSOAPFunctionality;
end;


{TCollectionFunctionality}
Constructor TCollectionFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTCollectionSOAPFunctionality:=nil;
end;

Destructor TCollectionFunctionalityRemoted.Destroy;
begin
FTCollectionSOAPFunctionality:=nil;
Inherited;
end;

function TCollectionFunctionalityRemoted.TCollectionSOAPFunctionality: ITCollectionSOAPFunctionality;
begin
if FTCollectionSOAPFunctionality = nil
  then FTCollectionSOAPFunctionality:=GetITCollectionSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTCollectionSOAPFunctionality;
end;

function TCollectionFunctionalityRemoted.getName: string;
begin
Result:=TCollectionSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

procedure TCollectionFunctionalityRemoted.setName(const Value: string);
begin
TCollectionSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   Value);
end;

function TCollectionFunctionalityRemoted.getHint: string;
begin
Result:=TCollectionSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCollectionFunctionalityRemoted.InsertItem(const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer;
begin
Result:=TCollectionSOAPFunctionality.InsertItem(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTItem,idItem,Alias,ListOrder);
end;

procedure TCollectionFunctionalityRemoted.RemoveItem(const id: integer);
begin
TCollectionSOAPFunctionality.RemoveItem(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   id);
end;

procedure TCollectionFunctionalityRemoted.Item_ChangeAlias(const id: integer; const pAlias: string);
begin
TCollectionSOAPFunctionality.Item_ChangeAlias(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   id,pAlias);
end;

procedure TCollectionFunctionalityRemoted.Item_ChangeListOrder(const id: integer; const Order: integer);
begin
TCollectionSOAPFunctionality.Item_ChangeListOrder(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   id,Order);
end;

procedure TCollectionFunctionalityRemoted.RemoveItems;
begin
TCollectionSOAPFunctionality.RemoveItems(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj);
end;

function TCollectionFunctionalityRemoted.IsItemExist(const idTItem,idItem: integer): boolean;
begin
Result:=TCollectionSOAPFunctionality.IsItemExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   idTItem,idItem);
end;

procedure TCollectionFunctionalityRemoted.GetListItems(out List: TByteArray);
begin
TCollectionSOAPFunctionality.GetListItems(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
end;

procedure TCollectionFunctionalityRemoted.SaveListItems(const List: TByteArray);
begin
TCollectionSOAPFunctionality.SaveListItems(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idObj,   List);
end;


