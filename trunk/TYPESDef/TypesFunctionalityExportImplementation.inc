//. the export routines

{TTTileServerVisualizationFunctionality}
function TTTileServerVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTileServerVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTTileServerVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTileServerVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTileServerVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTileServerVisualizationFunctionality(Functionality).getName;
end;

function TTTileServerVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTileServerVisualizationFunctionality(Functionality).getImage;
end;

function TTTileServerVisualizationFunctionality___CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTTileServerVisualizationFunctionality(Functionality).CheckImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTTileServerVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTTileServerVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TTileServerVisualizationFunctionality}
procedure TTileServerVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TTileServerVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TTileServerVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TTileServerVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TTileServerVisualizationFunctionality___ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).ReflectOnCanvas(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TTileServerVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTileServerVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).DATASize;
end;

procedure TTileServerVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetParams(pWidth,pHeight);
end;

procedure TTileServerVisualizationFunctionality___SetProportion(Functionality: TFunctionality;   const Value: double); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetProportion(Value);
end;

procedure TTileServerVisualizationFunctionality___Clear(Functionality: TFunctionality); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Clear;
end;

function TTileServerVisualizationFunctionality___GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).GetSegmentsStorageType;
end;

procedure TTileServerVisualizationFunctionality___SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetSegmentsStorageType(Value);
end;

function TTileServerVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).ContainerFilled;
end;

procedure TTileServerVisualizationFunctionality___GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GetLevelsInfoLocally(Info);
end;

function TTileServerVisualizationFunctionality___TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).TLevelsPropsPanel_Create;
end;

procedure TTileServerVisualizationFunctionality___Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_ConvertPixPosToXY(idLevel,PixX,PixY,X,Y);
end;

procedure TTileServerVisualizationFunctionality___Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_ConvertXYToPixPos(idLevel,X,Y,PixX,PixY);
end;

function TTileServerVisualizationFunctionality___UserData_GetTileProviderID(Functionality: TFunctionality;   out oTileProviderID: integer): boolean; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).UserData_GetTileProviderID(oTileProviderID);
end;

procedure TTileServerVisualizationFunctionality___UserData_SetTileProviderID(Functionality: TFunctionality;   const pTileProviderID: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).UserData_SetTileProviderID(pTileProviderID);
end;

function TTileServerVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TTileServerVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).getName;
end;

function TTileServerVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).getHint;
end;

procedure TTileServerVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GetParams(oWidth,oHeight);
end;

procedure TTileServerVisualizationFunctionality___GetParams1(Functionality: TFunctionality;   out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GetParams(oServerType,oServerURL,oServerData,oTileProviderID,oWidth,oHeight);
end;

procedure TTileServerVisualizationFunctionality___SetServerType(Functionality: TFunctionality;   const Value: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetServerType(Value);
end;

procedure TTileServerVisualizationFunctionality___SetServerURL(Functionality: TFunctionality;   const Value: string); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetServerURL(Value);
end;

procedure TTileServerVisualizationFunctionality___SetServerData(Functionality: TFunctionality;   const Data: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetServerData(Data);
end;

procedure TTileServerVisualizationFunctionality___SetServerData1(Functionality: TFunctionality;   const pData: TMemoryStream); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetServerData(pData);
end;

procedure TTileServerVisualizationFunctionality___GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GenerateFromImage(DATAStream);
end;

procedure TTileServerVisualizationFunctionality___GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GenerateFromTiles(TilesFolder,SizePowerOf2);
end;

procedure TTileServerVisualizationFunctionality___RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).RegenerateRegionFromLevel(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TTileServerVisualizationFunctionality___RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).RegenerateRegion(XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TTileServerVisualizationFunctionality___AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).AddNewLevelAndRegenerate;
end;

procedure TTileServerVisualizationFunctionality___GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GetLevelsInfo(Info);
end;

procedure TTileServerVisualizationFunctionality___Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_GetParams(idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TTileServerVisualizationFunctionality___Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_SetParams(idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TTileServerVisualizationFunctionality___Level_GetSegments(Functionality: TFunctionality;   const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_GetSegments(TileProviderID,idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
end;

procedure TTileServerVisualizationFunctionality___Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_GetSegmentsByIDs(idLevel,SegmentsIDs,Segments);
end;

procedure TTileServerVisualizationFunctionality___Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_GetSegmentsHashes(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
end;

procedure TTileServerVisualizationFunctionality___Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_SetSegments(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
end;

procedure TTileServerVisualizationFunctionality___GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GetCoordinates(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;


{TTMeasurementObjectFunctionality}
function TTMeasurementObjectFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality)._CreateInstance;
end;

procedure TTMeasurementObjectFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMeasurementObjectFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMeasurementObjectFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMeasurementObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).getName;
end;

function TTMeasurementObjectFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).getImage;
end;

function TTMeasurementObjectFunctionality___CreateNewInstance(Functionality: TFunctionality;   const pName: string; const pDomains: string): integer; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).CreateNewInstance(pName,pDomains);
end;

function TTMeasurementObjectFunctionality___CreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).CreateInstanceByGUID(pGUID,pName,pDomains);
end;

function TTMeasurementObjectFunctionality___CheckCreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).CheckCreateInstanceByGUID(pGUID,pName,pDomains);
end;

procedure TTMeasurementObjectFunctionality___GetInstanceListByNameContext(Functionality: TFunctionality;   const pName: string; out List: TByteArray); stdcall;
begin
TTMeasurementObjectFunctionality(Functionality).GetInstanceListByNameContext(pName,List);
end;

procedure TTMeasurementObjectFunctionality___GetInstanceDataByNameContext(Functionality: TFunctionality;   const pName: string; const Version: integer; out oData: TByteArray); stdcall;
begin
TTMeasurementObjectFunctionality(Functionality).GetInstanceDataByNameContext(pName,Version,oData);
end;

function TTMeasurementObjectFunctionality___GetInstanceByGUID(Functionality: TFunctionality;   const pGUID: string): integer; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).GetInstanceByGUID(pGUID);
end;

function TTMeasurementObjectFunctionality___GetInstanceByGSOMeasurement(Functionality: TFunctionality;   const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).GetInstanceByGSOMeasurement(pidGeographServerObject,pMeasurementTimeID);
end;


{TMeasurementObjectFunctionality}
procedure TMeasurementObjectFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMeasurementObjectFunctionality(Functionality)._ToClone(idClone);
end;

function TMeasurementObjectFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMeasurementObjectFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMeasurementObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMeasurementObjectFunctionality(Functionality).getName;
end;

procedure TMeasurementObjectFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).setName(Value);
end;

function TMeasurementObjectFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMeasurementObjectFunctionality(Functionality).getHint;
end;

function TMeasurementObjectFunctionality___getGUID(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMeasurementObjectFunctionality(Functionality).getGUID;
end;

function TMeasurementObjectFunctionality___getDomains(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMeasurementObjectFunctionality(Functionality).getDomains;
end;

procedure TMeasurementObjectFunctionality___setDomains(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).setDomains(Value);
end;

procedure TMeasurementObjectFunctionality___GetParams(Functionality: TFunctionality;   out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GetParams(oGUID,oidOwner,oName,oDomains);
end;

procedure TMeasurementObjectFunctionality___GSOMeasurements_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GSOMeasurements_GetList(List);
end;

procedure TMeasurementObjectFunctionality___GSOMeasurements_GetData(Functionality: TFunctionality;   const Version: integer; out oData: TByteArray); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GSOMeasurements_GetData(Version,oData);
end;

procedure TMeasurementObjectFunctionality___GSOMeasurements_Item_GetParams(Functionality: TFunctionality;   const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GSOMeasurements_Item_GetParams(idMeasurement,oTimeID,oidGeographServerObject,oDataType);
end;

procedure TMeasurementObjectFunctionality___GSOMeasurements_Item_GetParams1(Functionality: TFunctionality;   const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GSOMeasurements_Item_GetParams(TimeID,oidGeographServerObject,oDataType);
end;

procedure TMeasurementObjectFunctionality___GSOMeasurements_Item_GetData(Functionality: TFunctionality;   const idMeasurement: integer; out oData: TByteArray); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GSOMeasurements_Item_GetData(idMeasurement,oData);
end;

procedure TMeasurementObjectFunctionality___GSOMeasurements_Item_GetData1(Functionality: TFunctionality;   const TimeID: Double; out oData: TByteArray); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GSOMeasurements_Item_GetData(TimeID,oData);
end;


{TTAreaNotificationServerFunctionality}
function TTAreaNotificationServerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTAreaNotificationServerFunctionality(Functionality)._CreateInstance;
end;

procedure TTAreaNotificationServerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTAreaNotificationServerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTAreaNotificationServerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTAreaNotificationServerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTAreaNotificationServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTAreaNotificationServerFunctionality(Functionality).getName;
end;

function TTAreaNotificationServerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTAreaNotificationServerFunctionality(Functionality).getImage;
end;


{TAreaNotificationServerFunctionality}
procedure TAreaNotificationServerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TAreaNotificationServerFunctionality(Functionality)._ToClone(idClone);
end;

function TAreaNotificationServerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TAreaNotificationServerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAreaNotificationServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAreaNotificationServerFunctionality(Functionality).getName;
end;

procedure TAreaNotificationServerFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TAreaNotificationServerFunctionality(Functionality).setName(Value);
end;

function TAreaNotificationServerFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAreaNotificationServerFunctionality(Functionality).getHint;
end;

function TAreaNotificationServerFunctionality___getInfo(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAreaNotificationServerFunctionality(Functionality).getInfo;
end;

procedure TAreaNotificationServerFunctionality___setInfo(Functionality: TFunctionality;   Value: string); stdcall;
begin
TAreaNotificationServerFunctionality(Functionality).setInfo(Value);
end;


{TTMODELServerVisualizationFunctionality}
function TTMODELServerVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMODELServerVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTMODELServerVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMODELServerVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMODELServerVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMODELServerVisualizationFunctionality(Functionality).getName;
end;

function TTMODELServerVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMODELServerVisualizationFunctionality(Functionality).getImage;
end;

function TTMODELServerVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTMODELServerVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TMODELServerVisualizationFunctionality}
procedure TMODELServerVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMODELServerVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TMODELServerVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TMODELServerVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TMODELServerVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TMODELServerVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMODELServerVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TMODELServerVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TMODELServerVisualizationFunctionality___ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).ReflectOnCanvas(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TMODELServerVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TMODELServerVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TMODELServerVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).getName;
end;

function TMODELServerVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).getHint;
end;

function TMODELServerVisualizationFunctionality___getServerURL(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).getServerURL;
end;

procedure TMODELServerVisualizationFunctionality___setServerURL(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELServerVisualizationFunctionality(Functionality).setServerURL(Value);
end;


{TTDoubleVarFunctionality}
function TTDoubleVarFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDoubleVarFunctionality(Functionality)._CreateInstance;
end;

procedure TTDoubleVarFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDoubleVarFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDoubleVarFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDoubleVarFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDoubleVarFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTDoubleVarFunctionality(Functionality).getName;
end;

function TTDoubleVarFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDoubleVarFunctionality(Functionality).getImage;
end;


{TDoubleVarFunctionality}
procedure TDoubleVarFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDoubleVarFunctionality(Functionality)._ToClone(idClone);
end;

function TDoubleVarFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDoubleVarFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDoubleVarFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDoubleVarFunctionality(Functionality).getName;
end;

function TDoubleVarFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDoubleVarFunctionality(Functionality).getHint;
end;

function TDoubleVarFunctionality___getValue(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TDoubleVarFunctionality(Functionality).getValue;
end;

procedure TDoubleVarFunctionality___setValue(Functionality: TFunctionality;   _Value: Double); stdcall;
begin
TDoubleVarFunctionality(Functionality).setValue(_Value);
end;

function TDoubleVarFunctionality___getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TDoubleVarFunctionality(Functionality).getSetTimeStamp;
end;


{TTInt32VarFunctionality}
function TTInt32VarFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTInt32VarFunctionality(Functionality)._CreateInstance;
end;

procedure TTInt32VarFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTInt32VarFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTInt32VarFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTInt32VarFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTInt32VarFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTInt32VarFunctionality(Functionality).getName;
end;

function TTInt32VarFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTInt32VarFunctionality(Functionality).getImage;
end;


{TInt32VarFunctionality}
procedure TInt32VarFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TInt32VarFunctionality(Functionality)._ToClone(idClone);
end;

function TInt32VarFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TInt32VarFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TInt32VarFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TInt32VarFunctionality(Functionality).getName;
end;

function TInt32VarFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TInt32VarFunctionality(Functionality).getHint;
end;

function TInt32VarFunctionality___getValue(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TInt32VarFunctionality(Functionality).getValue;
end;

procedure TInt32VarFunctionality___setValue(Functionality: TFunctionality;   _Value: integer); stdcall;
begin
TInt32VarFunctionality(Functionality).setValue(_Value);
end;

function TInt32VarFunctionality___getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TInt32VarFunctionality(Functionality).getSetTimeStamp;
end;


{TTURLFunctionality}
function TTURLFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTURLFunctionality(Functionality)._CreateInstance;
end;

procedure TTURLFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTURLFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTURLFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTURLFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTURLFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTURLFunctionality(Functionality).getName;
end;

function TTURLFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTURLFunctionality(Functionality).getImage;
end;


{TURLFunctionality}
procedure TURLFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall;
begin
TURLFunctionality(Functionality).UpdateDATA;
end;

procedure TURLFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TURLFunctionality(Functionality)._ToClone(idClone);
end;

function TURLFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TURLFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TURLFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TURLFunctionality(Functionality).getName;
end;

function TURLFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TURLFunctionality(Functionality).getHint;
end;

function TURLFunctionality___getURL(Functionality: TFunctionality): string; stdcall;
begin
Result:=TURLFunctionality(Functionality).getURL;
end;

procedure TURLFunctionality___setURL(Functionality: TFunctionality;   Value: string); stdcall;
begin
TURLFunctionality(Functionality).setURL(Value);
end;

function TURLFunctionality___getURLName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TURLFunctionality(Functionality).getURLName;
end;

procedure TURLFunctionality___setURLName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TURLFunctionality(Functionality).setURLName(Value);
end;

function TURLFunctionality___getflPanelBrowser(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TURLFunctionality(Functionality).getflPanelBrowser;
end;

procedure TURLFunctionality___setflPanelBrowser(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TURLFunctionality(Functionality).setflPanelBrowser(Value);
end;

procedure TURLFunctionality___GetParams(Functionality: TFunctionality;   out oURL: string; out oURLName: string; out oflPanelBrowser: boolean); stdcall;
begin
TURLFunctionality(Functionality).GetParams(oURL,oURLName,oflPanelBrowser);
end;

procedure TURLFunctionality___SetParams(Functionality: TFunctionality;   const pURL: string; const pURLName: string; const pflPanelBrowser: boolean); stdcall;
begin
TURLFunctionality(Functionality).SetParams(pURL,pURLName,pflPanelBrowser);
end;


{TTPatternVisualizationFunctionality}
function TTPatternVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTPatternVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTPatternVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTPatternVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTPatternVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTPatternVisualizationFunctionality(Functionality).getName;
end;

function TTPatternVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTPatternVisualizationFunctionality(Functionality).getImage;
end;

function TTPatternVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTPatternVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TPatternVisualizationFunctionality}
procedure TPatternVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TPatternVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TPatternVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TPatternVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TPatternVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TPatternVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPatternVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).DATASize;
end;

function TPatternVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TPatternVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).getName;
end;

function TPatternVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).getHint;
end;

procedure TPatternVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TPatternVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TPatternVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

function TPatternVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TPatternVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TPatternVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).DATAFile_Clear;
end;


{TTMapFormatObjectFunctionality}
function TTMapFormatObjectFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMapFormatObjectFunctionality(Functionality)._CreateInstance;
end;

procedure TTMapFormatObjectFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMapFormatObjectFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMapFormatObjectFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMapFormatObjectFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMapFormatObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMapFormatObjectFunctionality(Functionality).getName;
end;

function TTMapFormatObjectFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMapFormatObjectFunctionality(Functionality).getImage;
end;

procedure TTMapFormatObjectFunctionality___GetInstanceNames(Functionality: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); stdcall;
begin
TTMapFormatObjectFunctionality(Functionality).GetInstanceNames(IDs,IDs_Offset,IDs_Size,Names);
end;

function TTMapFormatObjectFunctionality___GetDATAHash(Functionality: TFunctionality;   DATAStream: TByteArray): integer; stdcall;
begin
Result:=TTMapFormatObjectFunctionality(Functionality).GetDATAHash(DATAStream);
end;

function TTMapFormatObjectFunctionality___GetDATAHash1(Functionality: TFunctionality;   DATAStream: TMemoryStream): integer; stdcall;
begin
Result:=TTMapFormatObjectFunctionality(Functionality).GetDATAHash(DATAStream);
end;


{TMapFormatObjectFunctionality}
procedure TMapFormatObjectFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMapFormatObjectFunctionality(Functionality)._ToClone(idClone);
end;

function TMapFormatObjectFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMapFormatObjectFunctionality___DATAPanel_Create(Functionality: TFunctionality): TForm; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).DATAPanel_Create;
end;

function TMapFormatObjectFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TMapFormatObjectFunctionality____GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality)._GetDataDocument(DataModel,DataType,flWithComponents,Document);
end;

function TMapFormatObjectFunctionality___GetHintInfo(Functionality: TFunctionality;   const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).GetHintInfo(InfoType,InfoFormat,HintInfo);
end;

function TMapFormatObjectFunctionality___getidMap(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).getidMap;
end;

procedure TMapFormatObjectFunctionality___setidMap(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).setidMap(Value);
end;

function TMapFormatObjectFunctionality___getFormatID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).getFormatID;
end;

procedure TMapFormatObjectFunctionality___setFormatID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).setFormatID(Value);
end;

function TMapFormatObjectFunctionality___getKindID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).getKindID;
end;

procedure TMapFormatObjectFunctionality___setKindID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).setKindID(Value);
end;

function TMapFormatObjectFunctionality___getTypeID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).getTypeID;
end;

procedure TMapFormatObjectFunctionality___setTypeID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).setTypeID(Value);
end;

function TMapFormatObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).getName;
end;

procedure TMapFormatObjectFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).setName(Value);
end;

procedure TMapFormatObjectFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TMapFormatObjectFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TMapFormatObjectFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TMapFormatObjectFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).SetDATA(DATAStream);
end;

function TMapFormatObjectFunctionality___getDATAHash(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).getDATAHash;
end;

procedure TMapFormatObjectFunctionality___setDATAHash(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).setDATAHash(Value);
end;

procedure TMapFormatObjectFunctionality___GetParams(Functionality: TFunctionality;   out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).GetParams(oidMap,oFormatID,oKindID,oTypeID,oName);
end;

procedure TMapFormatObjectFunctionality___SetParams(Functionality: TFunctionality;   const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).SetParams(pidMap,pFormatID,pKindID,pTypeID,pName);
end;

procedure TMapFormatObjectFunctionality___SetObjectByDATA(Functionality: TFunctionality); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).SetObjectByDATA;
end;

procedure TMapFormatObjectFunctionality___UpdateDATAHash(Functionality: TFunctionality); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).UpdateDATAHash;
end;

procedure TMapFormatObjectFunctionality___Compile(Functionality: TFunctionality); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).Compile;
end;

procedure TMapFormatObjectFunctionality___Build(Functionality: TFunctionality;   const flUsePrototype: boolean); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).Build(flUsePrototype);
end;


{TTMapFormatMapFunctionality}
function TTMapFormatMapFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMapFormatMapFunctionality(Functionality)._CreateInstance;
end;

procedure TTMapFormatMapFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMapFormatMapFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMapFormatMapFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMapFormatMapFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMapFormatMapFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMapFormatMapFunctionality(Functionality).getName;
end;

function TTMapFormatMapFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMapFormatMapFunctionality(Functionality).getImage;
end;

procedure TTMapFormatMapFunctionality___GetInstanceListByGeoSpace(Functionality: TFunctionality;   const idGeoSpace: integer; out List: TByteArray); stdcall;
begin
TTMapFormatMapFunctionality(Functionality).GetInstanceListByGeoSpace(idGeoSpace,List);
end;


{TMapFormatMapFunctionality}
procedure TMapFormatMapFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMapFormatMapFunctionality(Functionality)._ToClone(idClone);
end;

function TMapFormatMapFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMapFormatMapFunctionality___getGeoSpaceID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).getGeoSpaceID;
end;

procedure TMapFormatMapFunctionality___setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatMapFunctionality(Functionality).setGeoSpaceID(Value);
end;

function TMapFormatMapFunctionality___getFormatID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).getFormatID;
end;

procedure TMapFormatMapFunctionality___setFormatID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatMapFunctionality(Functionality).setFormatID(Value);
end;

function TMapFormatMapFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).getName;
end;

procedure TMapFormatMapFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMapFormatMapFunctionality(Functionality).setName(Value);
end;

procedure TMapFormatMapFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TMapFormatMapFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality___GetObjectPrototypesDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetObjectPrototypesDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality___GetObjectPrototypesDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetObjectPrototypesDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality___SetObjectPrototypesDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).SetObjectPrototypesDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality___SetObjectPrototypesDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TMapFormatMapFunctionality(Functionality).SetObjectPrototypesDATA(DATAStream);
end;

function TMapFormatMapFunctionality___GetObjectPrototype(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).GetObjectPrototype(KindID,TypeID,PrototypeID,LayID);
end;

procedure TMapFormatMapFunctionality___GetParams(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oFormatID: integer; out oName: string); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetParams(oGeoSpaceID,oFormatID,oName);
end;

procedure TMapFormatMapFunctionality___SetParams(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pFormatID: integer; const pName: string); stdcall;
begin
TMapFormatMapFunctionality(Functionality).SetParams(pGeoSpaceID,pFormatID,pName);
end;

function TMapFormatMapFunctionality___ObjectsCounter(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).ObjectsCounter;
end;

procedure TMapFormatMapFunctionality___GetObjectsList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetObjectsList(List);
end;

procedure TMapFormatMapFunctionality___GetObjectsList1(Functionality: TFunctionality;   const KindID: integer; out List: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetObjectsList(KindID,List);
end;

procedure TMapFormatMapFunctionality___GetObjectsList2(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out List: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetObjectsList(KindID,TypeID,List);
end;

procedure TMapFormatMapFunctionality___GetObjectsList3(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetObjectsList(KindID,TypeID,NameContext,List);
end;

function TMapFormatMapFunctionality___GetObject(Functionality: TFunctionality;   const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).GetObject(DATAHash,idMapFormatObject);
end;

function TMapFormatMapFunctionality___GetObject1(Functionality: TFunctionality;   const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).GetObject(KindID,DATAHash,idMapFormatObject);
end;

procedure TMapFormatMapFunctionality___ExportMap(Functionality: TFunctionality;   const pFormatID: integer; out ZipData: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).ExportMap(pFormatID,ZipData);
end;

procedure TMapFormatMapFunctionality___RemoveObjects(Functionality: TFunctionality); stdcall;
begin
TMapFormatMapFunctionality(Functionality).RemoveObjects;
end;

procedure TMapFormatMapFunctionality___RemoveObjects1(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer); stdcall;
begin
TMapFormatMapFunctionality(Functionality).RemoveObjects(KindID,TypeID);
end;

procedure TMapFormatMapFunctionality___UpdateObjectDATAHashes(Functionality: TFunctionality); stdcall;
begin
TMapFormatMapFunctionality(Functionality).UpdateObjectDATAHashes;
end;

procedure TMapFormatMapFunctionality___RecalculateMapArea(Functionality: TFunctionality); stdcall;
begin
TMapFormatMapFunctionality(Functionality).RecalculateMapArea;
end;

procedure TMapFormatMapFunctionality___RemoveIrrelevantObjectsInMapArea(Functionality: TFunctionality); stdcall;
begin
TMapFormatMapFunctionality(Functionality).RemoveIrrelevantObjectsInMapArea;
end;


{TTSPLVisualizationFunctionality}
function TTSPLVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSPLVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTSPLVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSPLVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSPLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTSPLVisualizationFunctionality(Functionality).getName;
end;

function TTSPLVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSPLVisualizationFunctionality(Functionality).getImage;
end;

function TTSPLVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTSPLVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TSPLVisualizationFunctionality}
procedure TSPLVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSPLVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TSPLVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TSPLVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TSPLVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSPLVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TSPLVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TSPLVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TSPLVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSPLVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSPLVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TSPLVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TSPLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSPLVisualizationFunctionality(Functionality).getName;
end;

function TSPLVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSPLVisualizationFunctionality(Functionality).getHint;
end;

procedure TSPLVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out SPLType: integer; out SPLDATA: TByteArray); stdcall;
begin
TSPLVisualizationFunctionality(Functionality).GetParams(SPLType,SPLDATA);
end;

procedure TSPLVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const SPLType: integer; const SPLDATA: TByteArray); stdcall;
begin
TSPLVisualizationFunctionality(Functionality).SetParams(SPLType,SPLDATA);
end;


{TTBoolVarFunctionality}
function TTBoolVarFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTBoolVarFunctionality(Functionality)._CreateInstance;
end;

procedure TTBoolVarFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTBoolVarFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTBoolVarFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTBoolVarFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTBoolVarFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTBoolVarFunctionality(Functionality).getName;
end;

function TTBoolVarFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTBoolVarFunctionality(Functionality).getImage;
end;


{TBoolVarFunctionality}
procedure TBoolVarFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TBoolVarFunctionality(Functionality)._ToClone(idClone);
end;

function TBoolVarFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TBoolVarFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBoolVarFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBoolVarFunctionality(Functionality).getName;
end;

function TBoolVarFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBoolVarFunctionality(Functionality).getHint;
end;

function TBoolVarFunctionality___getValue(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TBoolVarFunctionality(Functionality).getValue;
end;

procedure TBoolVarFunctionality___setValue(Functionality: TFunctionality;   _Value: boolean); stdcall;
begin
TBoolVarFunctionality(Functionality).setValue(_Value);
end;

function TBoolVarFunctionality___getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TBoolVarFunctionality(Functionality).getSetTimeStamp;
end;


{TTGeoSpaceFunctionality}
function TTGeoSpaceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeoSpaceFunctionality(Functionality)._CreateInstance;
end;

procedure TTGeoSpaceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGeoSpaceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGeoSpaceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGeoSpaceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGeoSpaceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTGeoSpaceFunctionality(Functionality).getName;
end;

function TTGeoSpaceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGeoSpaceFunctionality(Functionality).getImage;
end;


{TGeoSpaceFunctionality}
procedure TGeoSpaceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TGeoSpaceFunctionality(Functionality)._ToClone(idClone);
end;

function TGeoSpaceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGeoSpaceFunctionality___GetDatumIDLocally(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).GetDatumIDLocally;
end;

function TGeoSpaceFunctionality___ConvertGeoToXYLocally(Functionality: TFunctionality;   const Lat,Long: Extended; out Xr,Yr: Extended): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).ConvertGeoToXYLocally(Lat,Long,Xr,Yr);
end;

function TGeoSpaceFunctionality___ConvertXYToGeoLocally(Functionality: TFunctionality;   const X,Y: Extended; out Lat,Long: Extended): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).ConvertXYToGeoLocally(X,Y,Lat,Long);
end;

function TGeoSpaceFunctionality___GetDistanceBetweenTwoXYPointsLocally(Functionality: TFunctionality;   const X0,Y0,X1,Y1: Extended; out Distance: Extended): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).GetDistanceBetweenTwoXYPointsLocally(X0,Y0,X1,Y1,Distance);
end;

function TGeoSpaceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).getName;
end;

procedure TGeoSpaceFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoSpaceFunctionality(Functionality).setName(Value);
end;

function TGeoSpaceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).getHint;
end;

function TGeoSpaceFunctionality___getDatumID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).getDatumID;
end;

procedure TGeoSpaceFunctionality___setDatumID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeoSpaceFunctionality(Functionality).setDatumID(Value);
end;

function TGeoSpaceFunctionality___getProjectionID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).getProjectionID;
end;

procedure TGeoSpaceFunctionality___setProjectionID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeoSpaceFunctionality(Functionality).setProjectionID(Value);
end;

function TGeoSpaceFunctionality___ConvertXYToLatLong(Functionality: TFunctionality;   const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).ConvertXYToLatLong(X,Y,Latitude,Longitude);
end;

function TGeoSpaceFunctionality___ConvertXYToDatumLatLong(Functionality: TFunctionality;   const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).ConvertXYToDatumLatLong(X,Y,pDatumID,Latitude,Longitude);
end;

function TGeoSpaceFunctionality___ConvertLatLongToXY(Functionality: TFunctionality;   const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).ConvertLatLongToXY(Latitude,Longitude,X,Y);
end;

function TGeoSpaceFunctionality___ConvertDatumLatLongToXY(Functionality: TFunctionality;   const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).ConvertDatumLatLongToXY(pDatumID,Latitude,Longitude,X,Y);
end;

procedure TGeoSpaceFunctionality___GetGeoCrdSystemList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TGeoSpaceFunctionality(Functionality).GetGeoCrdSystemList(List);
end;

procedure TGeoSpaceFunctionality___GetGeoCrdSystemList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TGeoSpaceFunctionality(Functionality).GetGeoCrdSystemList(List);
end;

procedure TGeoSpaceFunctionality___GetMapFormatMapList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TGeoSpaceFunctionality(Functionality).GetMapFormatMapList(List);
end;

procedure TGeoSpaceFunctionality___GetMapFormatMapList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TGeoSpaceFunctionality(Functionality).GetMapFormatMapList(List);
end;

procedure TGeoSpaceFunctionality___GetMapFormatMapObjectsByNameContext(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray); stdcall;
begin
TGeoSpaceFunctionality(Functionality).GetMapFormatMapObjectsByNameContext(pFormatID,pKindID,pTypeID,NameContext,List);
end;

procedure TGeoSpaceFunctionality___GetMapFormatMapObjectsByNameContext1(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TList); stdcall;
begin
TGeoSpaceFunctionality(Functionality).GetMapFormatMapObjectsByNameContext(pFormatID,pKindID,pTypeID,NameContext,List);
end;


{TTUserAlertFunctionality}
function TTUserAlertFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTUserAlertFunctionality(Functionality)._CreateInstance;
end;

procedure TTUserAlertFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTUserAlertFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTUserAlertFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTUserAlertFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTUserAlertFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTUserAlertFunctionality(Functionality).getName;
end;

function TTUserAlertFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTUserAlertFunctionality(Functionality).getImage;
end;

procedure TTUserAlertFunctionality___GetActiveInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTUserAlertFunctionality(Functionality).GetActiveInstanceList(List);
end;

procedure TTUserAlertFunctionality___GetActiveInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTUserAlertFunctionality(Functionality).GetActiveInstanceList(List);
end;


{TUserAlertFunctionality}
procedure TUserAlertFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TUserAlertFunctionality(Functionality)._ToClone(idClone);
end;

function TUserAlertFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TUserAlertFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getName;
end;

function TUserAlertFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getHint;
end;

function TUserAlertFunctionality___getUserID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getUserID;
end;

procedure TUserAlertFunctionality___setUserID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TUserAlertFunctionality(Functionality).setUserID(Value);
end;

function TUserAlertFunctionality___getTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getTimeStamp;
end;

procedure TUserAlertFunctionality___setTimeStamp(Functionality: TFunctionality;   Value: TDateTime); stdcall;
begin
TUserAlertFunctionality(Functionality).setTimeStamp(Value);
end;

function TUserAlertFunctionality___getActive(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getActive;
end;

procedure TUserAlertFunctionality___setActive(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TUserAlertFunctionality(Functionality).setActive(Value);
end;

function TUserAlertFunctionality___getAlertID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getAlertID;
end;

procedure TUserAlertFunctionality___setAlertID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TUserAlertFunctionality(Functionality).setAlertID(Value);
end;

function TUserAlertFunctionality___getSeverity(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getSeverity;
end;

procedure TUserAlertFunctionality___setSeverity(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TUserAlertFunctionality(Functionality).setSeverity(Value);
end;

function TUserAlertFunctionality___getDescription(Functionality: TFunctionality): string; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getDescription;
end;

procedure TUserAlertFunctionality___setDescription(Functionality: TFunctionality;   Value: string); stdcall;
begin
TUserAlertFunctionality(Functionality).setDescription(Value);
end;

procedure TUserAlertFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TUserAlertFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TUserAlertFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TUserAlertFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TUserAlertFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TUserAlertFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TUserAlertFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TUserAlertFunctionality(Functionality).SetDATA(DATAStream);
end;


{TTGeoGraphServerObjectFunctionality}
function TTGeoGraphServerObjectFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeoGraphServerObjectFunctionality(Functionality)._CreateInstance;
end;

procedure TTGeoGraphServerObjectFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGeoGraphServerObjectFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGeoGraphServerObjectFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGeoGraphServerObjectFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGeoGraphServerObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTGeoGraphServerObjectFunctionality(Functionality).getName;
end;

function TTGeoGraphServerObjectFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGeoGraphServerObjectFunctionality(Functionality).getImage;
end;

function TTGeoGraphServerObjectFunctionality___GetInstanceByServerObject(Functionality: TFunctionality;   const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean; stdcall;
begin
Result:=TTGeoGraphServerObjectFunctionality(Functionality).GetInstanceByServerObject(pGeoGraphServerID,pObjectID,idInstance);
end;


{TGeoGraphServerObjectFunctionality}
procedure TGeoGraphServerObjectFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality)._ToClone(idClone);
end;

function TGeoGraphServerObjectFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TGeoGraphServerObjectFunctionality___AttachObject(Functionality: TFunctionality); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).AttachObject;
end;

procedure TGeoGraphServerObjectFunctionality___DetachObject(Functionality: TFunctionality); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).DetachObject;
end;

function TGeoGraphServerObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).getName;
end;

function TGeoGraphServerObjectFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).getHint;
end;

function TGeoGraphServerObjectFunctionality___getGeoGraphServerID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).getGeoGraphServerID;
end;

procedure TGeoGraphServerObjectFunctionality___setGeoGraphServerID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).setGeoGraphServerID(Value);
end;

function TGeoGraphServerObjectFunctionality___getObjectID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).getObjectID;
end;

procedure TGeoGraphServerObjectFunctionality___setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).setObjectID(Value);
end;

function TGeoGraphServerObjectFunctionality___getBusinessModelID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).getBusinessModelID;
end;

procedure TGeoGraphServerObjectFunctionality___setBusinessModelID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).setBusinessModelID(Value);
end;

function TGeoGraphServerObjectFunctionality___getDomains(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).getDomains;
end;

procedure TGeoGraphServerObjectFunctionality___setDomains(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).setDomains(Value);
end;

procedure TGeoGraphServerObjectFunctionality___GetParams(Functionality: TFunctionality;   out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).GetParams(oGeoGraphServerID,oObjectID,oObjectType,oBusinessModel);
end;

procedure TGeoGraphServerObjectFunctionality___ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).ExecuteOperation(InData,OutData);
end;

function TGeoGraphServerObjectFunctionality___GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).GetVisualizationComponent(idTVisualization,idVisualization);
end;

function TGeoGraphServerObjectFunctionality___GetNearestMapFormatObjects(Functionality: TFunctionality;   const MaxDistance: double; out List: TByteArray): boolean; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).GetNearestMapFormatObjects(MaxDistance,List);
end;

function TGeoGraphServerObjectFunctionality___GetNearestMapFormatObjectsNames(Functionality: TFunctionality;   const MaxDistance: double; out Names: WideString): boolean; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).GetNearestMapFormatObjectsNames(MaxDistance,Names);
end;

function TGeoGraphServerObjectFunctionality___Measurements_AddNew(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).Measurements_AddNew(pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pData);
end;

function TGeoGraphServerObjectFunctionality___Measurements_AddNew1(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).Measurements_AddNew(pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pDataSource,pData);
end;

procedure TGeoGraphServerObjectFunctionality___Measurements_Remove(Functionality: TFunctionality;   const pidMeasurement: integer); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).Measurements_Remove(pidMeasurement);
end;

procedure TGeoGraphServerObjectFunctionality___Measurements_Item_UpdateData(Functionality: TFunctionality;   const pTimeID: Double; const pData: TByteArray); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).Measurements_Item_UpdateData(pTimeID,pData);
end;


{TTGeoGraphServerFunctionality}
function TTGeoGraphServerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeoGraphServerFunctionality(Functionality)._CreateInstance;
end;

procedure TTGeoGraphServerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGeoGraphServerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGeoGraphServerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGeoGraphServerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGeoGraphServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTGeoGraphServerFunctionality(Functionality).getName;
end;

function TTGeoGraphServerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGeoGraphServerFunctionality(Functionality).getImage;
end;

procedure TTGeoGraphServerFunctionality___GetActiveInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTGeoGraphServerFunctionality(Functionality).GetActiveInstanceList(List);
end;

procedure TTGeoGraphServerFunctionality___GetActiveInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTGeoGraphServerFunctionality(Functionality).GetActiveInstanceList(List);
end;

function TTGeoGraphServerFunctionality___GetInstanceForRegistration(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeoGraphServerFunctionality(Functionality).GetInstanceForRegistration;
end;


{TGeoGraphServerFunctionality}
procedure TGeoGraphServerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality)._ToClone(idClone);
end;

function TGeoGraphServerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TGeoGraphServerFunctionality___SetData(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).SetData(DATAStream);
end;

function TGeoGraphServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).getName;
end;

procedure TGeoGraphServerFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).setName(Value);
end;

function TGeoGraphServerFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).getHint;
end;

function TGeoGraphServerFunctionality___getAddress(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).getAddress;
end;

procedure TGeoGraphServerFunctionality___setAddress(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).setAddress(Value);
end;

function TGeoGraphServerFunctionality___getInternalAddress(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).getInternalAddress;
end;

procedure TGeoGraphServerFunctionality___setInternalAddress(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).setInternalAddress(Value);
end;

function TGeoGraphServerFunctionality___getInfo(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).getInfo;
end;

procedure TGeoGraphServerFunctionality___setInfo(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).setInfo(Value);
end;

procedure TGeoGraphServerFunctionality___GetData(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).GetData(DATAStream);
end;

procedure TGeoGraphServerFunctionality___GetData1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).GetData(DATAStream);
end;

function TGeoGraphServerFunctionality___RegisterObject(Functionality: TFunctionality;   const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).RegisterObject(ObjectName,VisualizationType,VisualizationID,GeoCrdSystemID,HintID);
end;

function TGeoGraphServerFunctionality___RegisterObject1(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).RegisterObject(ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,GeoCrdSystemID,HintID);
end;

function TGeoGraphServerFunctionality___RegisterObject2(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).RegisterObject(ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality___UnRegisterObject(Functionality: TFunctionality;   const ObjectID: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).UnRegisterObject(ObjectID);
end;

function TGeoGraphServerFunctionality___ObjectCounter(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).ObjectCounter;
end;

procedure TGeoGraphServerFunctionality___ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).ExecuteOperation(InData,OutData);
end;

procedure TGeoGraphServerFunctionality___Object_GetProperties(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_GetProperties(ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
end;

procedure TGeoGraphServerFunctionality___Object_GetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_GetProperties(ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality___Object_SetProperties(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_SetProperties(ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
end;

procedure TGeoGraphServerFunctionality___Object_SetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_SetProperties(ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

function TGeoGraphServerFunctionality___Object_GetObjectType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).Object_GetObjectType(ObjectID);
end;

procedure TGeoGraphServerFunctionality___Object_SetObjectType(Functionality: TFunctionality;   const ObjectID: integer; const ObjectType: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_SetObjectType(ObjectID,ObjectType);
end;

function TGeoGraphServerFunctionality___Object_GetBusinessType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).Object_GetBusinessType(ObjectID);
end;

procedure TGeoGraphServerFunctionality___Object_SetBusinessType(Functionality: TFunctionality;   const ObjectID: integer; const BusinessType: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_SetBusinessType(ObjectID,BusinessType);
end;

function TGeoGraphServerFunctionality___Object_GetComponentID(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).Object_GetComponentID(ObjectID);
end;

procedure TGeoGraphServerFunctionality___Object_SetComponentID(Functionality: TFunctionality;   const ObjectID: integer; const ObjectComponentID: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_SetComponentID(ObjectID,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality___Object_ExecuteOperation(Functionality: TFunctionality;   const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_ExecuteOperation(ObjectID,InData,OutData);
end;

function TGeoGraphServerFunctionality___DataID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).DataID;
end;


{TTGeoCrdSystemFunctionality}
function TTGeoCrdSystemFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeoCrdSystemFunctionality(Functionality)._CreateInstance;
end;

procedure TTGeoCrdSystemFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGeoCrdSystemFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGeoCrdSystemFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGeoCrdSystemFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTGeoCrdSystemFunctionality(Functionality).getName;
end;

function TTGeoCrdSystemFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGeoCrdSystemFunctionality(Functionality).getImage;
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceByLatLongLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceByLatLongLocally(pGeoSpaceID,pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceByLatLongLocally1(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceByLatLongLocally(pLatitude,pLongitude,oGeoSpaceID,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceByXYLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceByXYLocally(pGeoSpaceID,pX,pY,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceByXYLocally1(Functionality: TFunctionality;   const pX,pY: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceByXYLocally(pX,pY,oGeoSpaceID,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceByLatLong(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceByLatLong(pGeoSpaceID,pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceByXY(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceByXY(pGeoSpaceID,pX,pY,idCrdSys);
end;


{TGeoCrdSystemFunctionality}
procedure TGeoCrdSystemFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality)._ToClone(idClone);
end;

function TGeoCrdSystemFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGeoCrdSystemFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TGeoCrdSystemFunctionality___GetDataLocally(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oName: string; out oDatum: string; out oProjection: string; out oProjectionData: TMemoryStream); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).GetDataLocally(oGeoSpaceID,oName,oDatum,oProjection,oProjectionData);
end;

procedure TGeoCrdSystemFunctionality___GetGeodesyPointsLocally(Functionality: TFunctionality;   out Points: TByteArray); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).GetGeodesyPointsLocally(Points);
end;

function TGeoCrdSystemFunctionality___getGeoSpaceID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoCrdSystemFunctionality(Functionality).getGeoSpaceID;
end;

procedure TGeoCrdSystemFunctionality___setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).setGeoSpaceID(Value);
end;

function TGeoCrdSystemFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoCrdSystemFunctionality(Functionality).getName;
end;

procedure TGeoCrdSystemFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).setName(Value);
end;

function TGeoCrdSystemFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoCrdSystemFunctionality(Functionality).getHint;
end;

function TGeoCrdSystemFunctionality___getDatum(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoCrdSystemFunctionality(Functionality).getDatum;
end;

procedure TGeoCrdSystemFunctionality___setDatum(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).setDatum(Value);
end;

function TGeoCrdSystemFunctionality___getProjection(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoCrdSystemFunctionality(Functionality).getProjection;
end;

procedure TGeoCrdSystemFunctionality___setProjection(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).setProjection(Value);
end;

procedure TGeoCrdSystemFunctionality___GetProjectionDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).GetProjectionDATA(DATAStream);
end;

procedure TGeoCrdSystemFunctionality___GetProjectionDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).GetProjectionDATA(DATAStream);
end;

procedure TGeoCrdSystemFunctionality___SetProjectionDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).SetProjectionDATA(DATAStream);
end;

procedure TGeoCrdSystemFunctionality___SetProjectionDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).SetProjectionDATA(DATAStream);
end;

procedure TGeoCrdSystemFunctionality___GetGeodesyPoints(Functionality: TFunctionality;   out Points: TByteArray); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).GetGeodesyPoints(Points);
end;


{TTFilterVisualizationFunctionality}
function TTFilterVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTFilterVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTFilterVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTFilterVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTFilterVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTFilterVisualizationFunctionality(Functionality).getName;
end;

function TTFilterVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTFilterVisualizationFunctionality(Functionality).getImage;
end;

function TTFilterVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTFilterVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TFilterVisualizationFunctionality}
procedure TFilterVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TFilterVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TFilterVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TFilterVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TFilterVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TFilterVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TFilterVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TFilterVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TFilterVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TFilterVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TFilterVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TFilterVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TFilterVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TFilterVisualizationFunctionality(Functionality).getName;
end;

function TFilterVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TFilterVisualizationFunctionality(Functionality).getHint;
end;

procedure TFilterVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out FilterType: integer; out FilterDATA: TByteArray); stdcall;
begin
TFilterVisualizationFunctionality(Functionality).GetParams(FilterType,FilterDATA);
end;

procedure TFilterVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const FilterType: integer; const FilterDATA: TByteArray); stdcall;
begin
TFilterVisualizationFunctionality(Functionality).SetParams(FilterType,FilterDATA);
end;


{TTHINTVisualizationFunctionality}
function TTHINTVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHINTVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTHINTVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHINTVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHINTVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHINTVisualizationFunctionality(Functionality).getName;
end;

function TTHINTVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHINTVisualizationFunctionality(Functionality).getImage;
end;

function TTHINTVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTHINTVisualizationFunctionality(Functionality).StdObjectVisualization;
end;

procedure TTHINTVisualizationFunctionality___GetInstanceParams(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall;
begin
TTHINTVisualizationFunctionality(Functionality).GetInstanceParams(IDs,MaxInstanceSize,Params);
end;

procedure TTHINTVisualizationFunctionality___GetInstanceParams1(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall;
begin
TTHINTVisualizationFunctionality(Functionality).GetInstanceParams1(IDs,MaxInstanceSize,Params);
end;

procedure TTHINTVisualizationFunctionality___GetInstanceOwnerDatasAndParams(Functionality: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray); stdcall;
begin
TTHINTVisualizationFunctionality(Functionality).GetInstanceOwnerDatasAndParams(IDs,DataFlags,MaxInstanceSize,Data,Params);
end;


{THINTVisualizationFunctionality}
procedure THINTVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure THINTVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
THINTVisualizationFunctionality(Functionality).DestroyData;
end;

procedure THINTVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure THINTVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
THINTVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function THINTVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function THINTVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THINTVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).DATASize;
end;

function THINTVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function THINTVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).getName;
end;

function THINTVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).getHint;
end;

procedure THINTVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure THINTVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure THINTVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
THINTVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality___GetPrivateDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetPrivateDATA(DATAStream);
end;

procedure THINTVisualizationFunctionality___GetPrivateDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetPrivateDATA(DATAStream,MaxSize);
end;

procedure THINTVisualizationFunctionality___GetPrivateDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetPrivateDATA(DATAStream);
end;

procedure THINTVisualizationFunctionality___GetPrivateDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetPrivateDATA(DATAStream,MaxSize);
end;

procedure THINTVisualizationFunctionality___SetPrivateDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
THINTVisualizationFunctionality(Functionality).SetPrivateDATA(DATAStream);
end;

procedure THINTVisualizationFunctionality___SetPrivateDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
THINTVisualizationFunctionality(Functionality).SetPrivateDATA(DATAStream);
end;

function THINTVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure THINTVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure THINTVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
THINTVisualizationFunctionality(Functionality).DATAFile_Clear;
end;


{TTDetailedPictureVisualizationFunctionality}
function TTDetailedPictureVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDetailedPictureVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTDetailedPictureVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDetailedPictureVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDetailedPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTDetailedPictureVisualizationFunctionality(Functionality).getName;
end;

function TTDetailedPictureVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDetailedPictureVisualizationFunctionality(Functionality).getImage;
end;

function TTDetailedPictureVisualizationFunctionality___CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTDetailedPictureVisualizationFunctionality(Functionality).CheckImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTDetailedPictureVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTDetailedPictureVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TDetailedPictureVisualizationFunctionality}
procedure TDetailedPictureVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TDetailedPictureVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TDetailedPictureVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TDetailedPictureVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TDetailedPictureVisualizationFunctionality___ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).ReflectOnCanvas(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TDetailedPictureVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDetailedPictureVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).DATASize;
end;

procedure TDetailedPictureVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).SetParams(pWidth,pHeight);
end;

procedure TDetailedPictureVisualizationFunctionality___SetProportion(Functionality: TFunctionality;   const Value: double); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).SetProportion(Value);
end;

procedure TDetailedPictureVisualizationFunctionality___Clear(Functionality: TFunctionality); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Clear;
end;

function TDetailedPictureVisualizationFunctionality___GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).GetSegmentsStorageType;
end;

procedure TDetailedPictureVisualizationFunctionality___SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).SetSegmentsStorageType(Value);
end;

function TDetailedPictureVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).ContainerFilled;
end;

procedure TDetailedPictureVisualizationFunctionality___GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).GetLevelsInfoLocally(Info);
end;

function TDetailedPictureVisualizationFunctionality___TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).TLevelsPropsPanel_Create;
end;

procedure TDetailedPictureVisualizationFunctionality___Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_ConvertPixPosToXY(idLevel,PixX,PixY,X,Y);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_ConvertXYToPixPos(idLevel,X,Y,PixX,PixY);
end;

function TDetailedPictureVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TDetailedPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).getName;
end;

function TDetailedPictureVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).getHint;
end;

procedure TDetailedPictureVisualizationFunctionality___GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).GenerateFromImage(DATAStream);
end;

procedure TDetailedPictureVisualizationFunctionality___GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).GenerateFromTiles(TilesFolder,SizePowerOf2);
end;

procedure TDetailedPictureVisualizationFunctionality___RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).RegenerateRegionFromLevel(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TDetailedPictureVisualizationFunctionality___RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).RegenerateRegion(XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TDetailedPictureVisualizationFunctionality___AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).AddNewLevelAndRegenerate;
end;

procedure TDetailedPictureVisualizationFunctionality___GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).GetLevelsInfo(Info);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_GetParams(idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_SetParams(idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_GetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_GetSegments(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_GetSegmentsByIDs(idLevel,SegmentsIDs,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_GetSegmentsHashes(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_SetSegments(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).GetParams(oWidth,oHeight);
end;

procedure TDetailedPictureVisualizationFunctionality___GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).GetCoordinates(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;


{TTCoVisualizationFunctionality}
function TTCoVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTCoVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCoVisualizationFunctionality(Functionality).getName;
end;

function TTCoVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoVisualizationFunctionality(Functionality).getImage;
end;

function TTCoVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTCoVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TCoVisualizationFunctionality}
procedure TCoVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TCoVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TCoVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TCoVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TCoVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TCoVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TCoVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TCoVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).DATASize;
end;

procedure TCoVisualizationFunctionality___UpdateContainer(Functionality: TFunctionality;   out oContainer: TExtendedContainerCoord); stdcall;
begin
TCoVisualizationFunctionality(Functionality).UpdateContainer(oContainer);
end;

procedure TCoVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TCoVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

function TCoVisualizationFunctionality___GetOwnSpaceHINTVisualizationLocally(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).GetOwnSpaceHINTVisualizationLocally(idHINTVisualization);
end;

procedure TCoVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoVisualizationFunctionality(Functionality).ToClone(idClone);
end;

function TCoVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TCoVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).getName;
end;

function TCoVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).getHint;
end;

procedure TCoVisualizationFunctionality___GetSpace(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TCoVisualizationFunctionality(Functionality).GetSpace(DATAStream);
end;

procedure TCoVisualizationFunctionality___GetSpace1(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall;
begin
TCoVisualizationFunctionality(Functionality).GetSpace(DATAStream,MaxSize);
end;

procedure TCoVisualizationFunctionality___GetSpace2(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TCoVisualizationFunctionality(Functionality).GetSpace(DATAStream);
end;

procedure TCoVisualizationFunctionality___GetSpace3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall;
begin
TCoVisualizationFunctionality(Functionality).GetSpace(DATAStream,MaxSize);
end;

procedure TCoVisualizationFunctionality___SetSpace(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TCoVisualizationFunctionality(Functionality).SetSpace(DATAStream);
end;

procedure TCoVisualizationFunctionality___SetSpace1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TCoVisualizationFunctionality(Functionality).SetSpace(DATAStream);
end;

function TCoVisualizationFunctionality___GetOwnSpaceHINTVisualization(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).GetOwnSpaceHINTVisualization(idHINTVisualization);
end;

function TCoVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TCoVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TCoVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TCoVisualizationFunctionality___Pack(Functionality: TFunctionality); stdcall;
begin
TCoVisualizationFunctionality(Functionality).Pack;
end;

procedure TCoVisualizationFunctionality___UnPack(Functionality: TFunctionality); stdcall;
begin
TCoVisualizationFunctionality(Functionality).UnPack;
end;

function TCoVisualizationFunctionality___IsPacked(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).IsPacked;
end;


{TTForumMessageFunctionality}
function TTForumMessageFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTForumMessageFunctionality(Functionality)._CreateInstance;
end;

procedure TTForumMessageFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTForumMessageFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTForumMessageFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTForumMessageFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTForumMessageFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTForumMessageFunctionality(Functionality).getName;
end;

function TTForumMessageFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTForumMessageFunctionality(Functionality).getImage;
end;


{TForumMessageFunctionality}
procedure TForumMessageFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall;
begin
TForumMessageFunctionality(Functionality).UpdateDATA;
end;

procedure TForumMessageFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TForumMessageFunctionality(Functionality)._ToClone(idClone);
end;

function TForumMessageFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TForumMessageFunctionality___FunctionalityUserID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).FunctionalityUserID;
end;

procedure TForumMessageFunctionality___setidUser(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TForumMessageFunctionality(Functionality).setidUser(Value);
end;

procedure TForumMessageFunctionality___Modified(Functionality: TFunctionality); stdcall;
begin
TForumMessageFunctionality(Functionality).Modified;
end;

function TForumMessageFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).getName;
end;

function TForumMessageFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).getHint;
end;

function TForumMessageFunctionality___getidForum(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).getidForum;
end;

procedure TForumMessageFunctionality___setidForum(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TForumMessageFunctionality(Functionality).setidForum(Value);
end;

function TForumMessageFunctionality___idUser(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).idUser;
end;

procedure TForumMessageFunctionality___Send(Functionality: TFunctionality); stdcall;
begin
TForumMessageFunctionality(Functionality).Send;
end;

function TForumMessageFunctionality___SentTime(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).SentTime;
end;

function TForumMessageFunctionality___getidForMessage(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).getidForMessage;
end;

procedure TForumMessageFunctionality___setidForMessage(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TForumMessageFunctionality(Functionality).setidForMessage(Value);
end;

function TForumMessageFunctionality___LastModified(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).LastModified;
end;

procedure TForumMessageFunctionality___GetMessage(Functionality: TFunctionality;   out Message: TByteArray); stdcall;
begin
TForumMessageFunctionality(Functionality).GetMessage(Message);
end;

procedure TForumMessageFunctionality___GetMessage1(Functionality: TFunctionality;   out Message: TMemoryStream); stdcall;
begin
TForumMessageFunctionality(Functionality).GetMessage(Message);
end;

procedure TForumMessageFunctionality___SetMessage(Functionality: TFunctionality;   const Message: TByteArray); stdcall;
begin
TForumMessageFunctionality(Functionality).SetMessage(Message);
end;

procedure TForumMessageFunctionality___SetMessage1(Functionality: TFunctionality;   const Message: TMemoryStream); stdcall;
begin
TForumMessageFunctionality(Functionality).SetMessage(Message);
end;

function TForumMessageFunctionality___ReplyMessageCount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).ReplyMessageCount;
end;

procedure TForumMessageFunctionality___GetReplyMessageList(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall;
begin
TForumMessageFunctionality(Functionality).GetReplyMessageList(MessageList);
end;

procedure TForumMessageFunctionality___GetReplyMessageList1(Functionality: TFunctionality;   out MessageList: TList); stdcall;
begin
TForumMessageFunctionality(Functionality).GetReplyMessageList(MessageList);
end;


{TTForumFunctionality}
function TTForumFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTForumFunctionality(Functionality)._CreateInstance;
end;

procedure TTForumFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTForumFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTForumFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTForumFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTForumFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTForumFunctionality(Functionality).getName;
end;

function TTForumFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTForumFunctionality(Functionality).getImage;
end;


{TForumFunctionality}
procedure TForumFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TForumFunctionality(Functionality)._ToClone(idClone);
end;

function TForumFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TForumFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TForumFunctionality___DeleteOldMessages(Functionality: TFunctionality;   const pMessageLifeTime: TDateTime); stdcall;
begin
TForumFunctionality(Functionality).DeleteOldMessages(pMessageLifeTime);
end;

function TForumFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TForumFunctionality(Functionality).getName;
end;

procedure TForumFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TForumFunctionality(Functionality).setName(Value);
end;

function TForumFunctionality___getMessageLifeTime(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TForumFunctionality(Functionality).getMessageLifeTime;
end;

procedure TForumFunctionality___setMessageLifeTime(Functionality: TFunctionality;   Value: TDateTime); stdcall;
begin
TForumFunctionality(Functionality).setMessageLifeTime(Value);
end;

function TForumFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TForumFunctionality(Functionality).getHint;
end;

function TForumFunctionality___RootMessageCount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumFunctionality(Functionality).RootMessageCount;
end;

procedure TForumFunctionality___GetRootMessageList(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall;
begin
TForumFunctionality(Functionality).GetRootMessageList(MessageList);
end;

procedure TForumFunctionality___GetRootMessageList1(Functionality: TFunctionality;   out MessageList: TList); stdcall;
begin
TForumFunctionality(Functionality).GetRootMessageList(MessageList);
end;

function TForumFunctionality___MessageCount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumFunctionality(Functionality).MessageCount;
end;

procedure TForumFunctionality___GetMessageList(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall;
begin
TForumFunctionality(Functionality).GetMessageList(MessageList);
end;

procedure TForumFunctionality___GetMessageList1(Functionality: TFunctionality;   out MessageList: TList); stdcall;
begin
TForumFunctionality(Functionality).GetMessageList(MessageList);
end;

function TForumFunctionality___AddMessage(Functionality: TFunctionality;   const pidUser: integer; const pidForMessage: integer): integer; stdcall;
begin
Result:=TForumFunctionality(Functionality).AddMessage(pidUser,pidForMessage);
end;

procedure TForumFunctionality___DestroyMessage(Functionality: TFunctionality;   const pidMessage: integer); stdcall;
begin
TForumFunctionality(Functionality).DestroyMessage(pidMessage);
end;


{TTCUSTOMVisualizationFunctionality}
function TTCUSTOMVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCUSTOMVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTCUSTOMVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCUSTOMVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCUSTOMVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCUSTOMVisualizationFunctionality(Functionality).getName;
end;

function TTCUSTOMVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCUSTOMVisualizationFunctionality(Functionality).getImage;
end;

function TTCUSTOMVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTCUSTOMVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TCUSTOMVisualizationFunctionality}
procedure TCUSTOMVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TCUSTOMVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TCUSTOMVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TCUSTOMVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TCUSTOMVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TCUSTOMVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TCUSTOMVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TCUSTOMVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).getName;
end;

function TCUSTOMVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).getHint;
end;

function TCUSTOMVisualizationFunctionality___getMODULEName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).getMODULEName;
end;

procedure TCUSTOMVisualizationFunctionality___setMODULEName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality).setMODULEName(Value);
end;

function TCUSTOMVisualizationFunctionality___getFunctionName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).getFunctionName;
end;

procedure TCUSTOMVisualizationFunctionality___setFunctionName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality).setFunctionName(Value);
end;

function TCUSTOMVisualizationFunctionality___getFunctionVersion(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).getFunctionVersion;
end;

procedure TCUSTOMVisualizationFunctionality___setFunctionVersion(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality).setFunctionVersion(Value);
end;

procedure TCUSTOMVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality).GetParams(oMODULEName,oFunctionName,oFunctionVersion);
end;


{TTOLEVisualizationFunctionality}
function TTOLEVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOLEVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOLEVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOLEVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOLEVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOLEVisualizationFunctionality(Functionality).getName;
end;

function TTOLEVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOLEVisualizationFunctionality(Functionality).getImage;
end;

function TTOLEVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOLEVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOLEVisualizationFunctionality}
procedure TOLEVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOLEVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TOLEVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOLEVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TOLEVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOLEVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TOLEVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TOLEVisualizationFunctionality___SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).SaveToFile(FileName);
end;

procedure TOLEVisualizationFunctionality___EditDATA(Functionality: TFunctionality); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).EditDATA;
end;

function TOLEVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TOLEVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOLEVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOLEVisualizationFunctionality(Functionality).DATASize;
end;

function TOLEVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOLEVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOLEVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOLEVisualizationFunctionality(Functionality).getName;
end;

function TOLEVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOLEVisualizationFunctionality(Functionality).getHint;
end;

procedure TOLEVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure TOLEVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).GetDATA(Value,MaxSize);
end;

procedure TOLEVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure TOLEVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).GetDATA(Value,MaxSize);
end;

procedure TOLEVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).SetDATA(Value);
end;

procedure TOLEVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).SetDATA(Value);
end;


{TTHTMLVisualizationFunctionality}
function TTHTMLVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHTMLVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTHTMLVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHTMLVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHTMLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHTMLVisualizationFunctionality(Functionality).getName;
end;

function TTHTMLVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHTMLVisualizationFunctionality(Functionality).getImage;
end;

function TTHTMLVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTHTMLVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{THTMLVisualizationFunctionality}
procedure THTMLVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THTMLVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure THTMLVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).DestroyData;
end;

procedure THTMLVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure THTMLVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure THTMLVisualizationFunctionality___SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).SaveToFile(FileName);
end;

procedure THTMLVisualizationFunctionality___EditDATA(Functionality: TFunctionality); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).EditDATA;
end;

function THTMLVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function THTMLVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THTMLVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).DATASize;
end;

function THTMLVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function THTMLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).getName;
end;

function THTMLVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).getHint;
end;

function THTMLVisualizationFunctionality___getWidth(Functionality: TFunctionality): integer; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).getWidth;
end;

procedure THTMLVisualizationFunctionality___setWidth(Functionality: TFunctionality;   Value: integer); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).setWidth(Value);
end;

procedure THTMLVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure THTMLVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).GetDATA(Value,MaxSize);
end;

procedure THTMLVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure THTMLVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).GetDATA(Value,MaxSize);
end;

procedure THTMLVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).SetDATA(Value);
end;

procedure THTMLVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).SetDATA(Value);
end;


{TTBZRVisualizationFunctionality}
function TTBZRVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTBZRVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTBZRVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTBZRVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTBZRVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTBZRVisualizationFunctionality(Functionality).getName;
end;

function TTBZRVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTBZRVisualizationFunctionality(Functionality).getImage;
end;

function TTBZRVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTBZRVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TBZRVisualizationFunctionality}
procedure TBZRVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TBZRVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TBZRVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TBZRVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TBZRVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TBZRVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TBZRVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TBZRVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TBZRVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TBZRVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBZRVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TBZRVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TBZRVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBZRVisualizationFunctionality(Functionality).getName;
end;

function TBZRVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBZRVisualizationFunctionality(Functionality).getHint;
end;


{TTAGIFVisualizationFunctionality}
function TTAGIFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTAGIFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTAGIFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality).getName;
end;

function TTAGIFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality).getImage;
end;

function TTAGIFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TAGIFVisualizationFunctionality}
procedure TAGIFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TAGIFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TAGIFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TAGIFVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TAGIFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TAGIFVisualizationFunctionality___TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).TVisualizationUpdating_Create(Reflecting);
end;

function TAGIFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAGIFVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TAGIFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TAGIFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).getName;
end;

function TAGIFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).getHint;
end;

procedure TAGIFVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure TAGIFVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).GetDATA(Value,MaxSize);
end;

procedure TAGIFVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure TAGIFVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).GetDATA(Value,MaxSize);
end;

procedure TAGIFVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).SetDATA(Value);
end;

procedure TAGIFVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).SetDATA(Value);
end;


{TTOrientedVIDEOVisualizationFunctionality}
function TTOrientedVIDEOVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOrientedVIDEOVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOrientedVIDEOVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality).getName;
end;

function TTOrientedVIDEOVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality).getImage;
end;

function TTOrientedVIDEOVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOrientedVIDEOVisualizationFunctionality}
procedure TOrientedVIDEOVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TOrientedVIDEOVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOrientedVIDEOVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TOrientedVIDEOVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedVIDEOVisualizationFunctionality___TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).TVisualizationUpdating_Create(Reflecting);
end;

function TOrientedVIDEOVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedVIDEOVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOrientedVIDEOVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).getName;
end;

function TOrientedVIDEOVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).getHint;
end;

function TOrientedVIDEOVisualizationFunctionality___getDataServer(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).getDataServer;
end;

procedure TOrientedVIDEOVisualizationFunctionality___setDataServer(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality).setDataServer(Value);
end;

function TOrientedVIDEOVisualizationFunctionality___getObjectID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).getObjectID;
end;

procedure TOrientedVIDEOVisualizationFunctionality___setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality).setObjectID(Value);
end;


{TTVIDEOVisualizationFunctionality}
function TTVIDEOVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTVIDEOVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTVIDEOVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality).getName;
end;

function TTVIDEOVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality).getImage;
end;

function TTVIDEOVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TVIDEOVisualizationFunctionality}
procedure TVIDEOVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TVIDEOVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TVIDEOVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TVIDEOVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TVIDEOVisualizationFunctionality___TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).TVisualizationUpdating_Create(Reflecting);
end;

function TVIDEOVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TVIDEOVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TVIDEOVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TVIDEOVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).getName;
end;

function TVIDEOVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).getHint;
end;

function TVIDEOVisualizationFunctionality___getDataServer(Functionality: TFunctionality): string; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).getDataServer;
end;

procedure TVIDEOVisualizationFunctionality___setDataServer(Functionality: TFunctionality;   Value: string); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality).setDataServer(Value);
end;

function TVIDEOVisualizationFunctionality___getObjectID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).getObjectID;
end;

procedure TVIDEOVisualizationFunctionality___setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality).setObjectID(Value);
end;


{TTOPPVisualizationFunctionality}
function TTOPPVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOPPVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOPPVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality).getName;
end;

function TTOPPVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality).getImage;
end;

function TTOPPVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOPPVisualizationFunctionality}
procedure TOPPVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TOPPVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOPPVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TOPPVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOPPVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOPPVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOPPVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).getName;
end;

function TOPPVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).getHint;
end;

function TOPPVisualizationFunctionality___getPropsPanel_idTObj(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).getPropsPanel_idTObj;
end;

procedure TOPPVisualizationFunctionality___setPropsPanel_idTObj(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).setPropsPanel_idTObj(Value);
end;

function TOPPVisualizationFunctionality___getPropsPanel_idObj(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).getPropsPanel_idObj;
end;

procedure TOPPVisualizationFunctionality___setPropsPanel_idObj(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).setPropsPanel_idObj(Value);
end;

procedure TOPPVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).GetParams(oPropsPanel_idTObj,oPropsPanel_idObj);
end;


{TTMODELServerFunctionality}
function TTMODELServerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality)._CreateInstance;
end;

procedure TTMODELServerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMODELServerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMODELServerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMODELServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality).getName;
end;

function TTMODELServerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality).getImage;
end;

function TTMODELServerFunctionality___GetInstanceByIPAddress(Functionality: TFunctionality;   const IPAddress: string;  out id: integer): boolean; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality).GetInstanceByIPAddress(IPAddress,id);
end;


{TMODELServerFunctionality}
procedure TMODELServerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMODELServerFunctionality(Functionality)._ToClone(idClone);
end;

function TMODELServerFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TMODELServerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMODELServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).getName;
end;

procedure TMODELServerFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELServerFunctionality(Functionality).setName(Value);
end;

function TMODELServerFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).getHint;
end;

function TMODELServerFunctionality___getIPAddress(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).getIPAddress;
end;

procedure TMODELServerFunctionality___setIPAddress(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELServerFunctionality(Functionality).setIPAddress(Value);
end;

function TMODELServerFunctionality___IsUserExist(Functionality: TFunctionality;   const _UserName,_UserPassword: string): boolean; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).IsUserExist(_UserName,_UserPassword);
end;

function TMODELServerFunctionality___GetUserID(Functionality: TFunctionality;   const _UserName,_UserPassword: string): integer; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).GetUserID(_UserName,_UserPassword);
end;

function TMODELServerFunctionality___IsOnLine(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).IsOnLine;
end;

function TMODELServerFunctionality___Info(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).Info;
end;

procedure TMODELServerFunctionality___GetLicense(Functionality: TFunctionality;   out License: WideString); stdcall;
begin
TMODELServerFunctionality(Functionality).GetLicense(License);
end;

procedure TMODELServerFunctionality___CreateNewUserByDefaultPrototype(Functionality: TFunctionality;   const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer); stdcall;
begin
TMODELServerFunctionality(Functionality).CreateNewUserByDefaultPrototype(NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,idNewUser);
end;

procedure TMODELServerFunctionality___CreateNewUserByDefaultPrototype1(Functionality: TFunctionality;   const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString; const Signature: WideString;  out idNewUser: integer); stdcall;
begin
TMODELServerFunctionality(Functionality).CreateNewUserByDefaultPrototype1(NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,Signature,idNewUser);
end;


{TTCoReferenceFunctionality}
function TTCoReferenceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoReferenceFunctionality(Functionality)._CreateInstance;
end;

procedure TTCoReferenceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCoReferenceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCoReferenceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoReferenceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoReferenceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCoReferenceFunctionality(Functionality).getName;
end;

function TTCoReferenceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoReferenceFunctionality(Functionality).getImage;
end;


{TCoReferenceFunctionality}
procedure TCoReferenceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoReferenceFunctionality(Functionality)._ToClone(idClone);
end;

function TCoReferenceFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TCoReferenceFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TCoReferenceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoReferenceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TCoReferenceFunctionality___ShowReferencedObjectPanelProps(Functionality: TFunctionality); stdcall;
begin
TCoReferenceFunctionality(Functionality).ShowReferencedObjectPanelProps;
end;

function TCoReferenceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoReferenceFunctionality(Functionality).getName;
end;

procedure TCoReferenceFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TCoReferenceFunctionality(Functionality).setName(Value);
end;

function TCoReferenceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoReferenceFunctionality(Functionality).getHint;
end;

procedure TCoReferenceFunctionality___GetReferencedObject(Functionality: TFunctionality;   out idTReferencedObject,idReferencedObject: integer); stdcall;
begin
TCoReferenceFunctionality(Functionality).GetReferencedObject(idTReferencedObject,idReferencedObject);
end;

procedure TCoReferenceFunctionality___SetReferencedObject(Functionality: TFunctionality;   const idTReferencedObject,idReferencedObject: integer); stdcall;
begin
TCoReferenceFunctionality(Functionality).SetReferencedObject(idTReferencedObject,idReferencedObject);
end;


{TTPositionerFunctionality}
function TTPositionerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTPositionerFunctionality(Functionality)._CreateInstance;
end;

procedure TTPositionerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTPositionerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTPositionerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTPositionerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTPositionerFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTPositionerFunctionality(Functionality).getName;
end;

function TTPositionerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTPositionerFunctionality(Functionality).getImage;
end;


{TPositionerFunctionality}
procedure TPositionerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPositionerFunctionality(Functionality)._ToClone(idClone);
end;

function TPositionerFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TPositionerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TPositionerFunctionality___SetPosition(Functionality: TFunctionality); stdcall;
begin
TPositionerFunctionality(Functionality).SetPosition;
end;

function TPositionerFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).getName;
end;

function TPositionerFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).getHint;
end;

procedure TPositionerFunctionality___Get2DPosition(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
begin
TPositionerFunctionality(Functionality).Get2DPosition(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TPositionerFunctionality___Save2DPosition(Functionality: TFunctionality;   const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
begin
TPositionerFunctionality(Functionality).Save2DPosition(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TPositionerFunctionality___Save2DPosition1(Functionality: TFunctionality;   Reflector: TReflector); stdcall;
begin
TPositionerFunctionality(Functionality).Save2DPosition(Reflector);
end;

function TPositionerFunctionality___getPositionName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).getPositionName;
end;

procedure TPositionerFunctionality___setPositionName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TPositionerFunctionality(Functionality).setPositionName(Value);
end;


{TTOrientedWMFVisualizationFunctionality}
function TTOrientedWMFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOrientedWMFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOrientedWMFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).getName;
end;

function TTOrientedWMFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).getImage;
end;

function TTOrientedWMFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOrientedWMFVisualizationFunctionality}
procedure TOrientedWMFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TOrientedWMFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOrientedWMFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TOrientedWMFVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

procedure TOrientedWMFVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TOrientedWMFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedWMFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedWMFVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).DATASize;
end;

function TOrientedWMFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOrientedWMFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getName;
end;

function TOrientedWMFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getHint;
end;

procedure TOrientedWMFVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality___GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetJPEGDATA(DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality___GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetJPEGDATA(DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

function TOrientedWMFVisualizationFunctionality___getWidth(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getWidth;
end;

procedure TOrientedWMFVisualizationFunctionality___setWidth(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).setWidth(Value);
end;

function TOrientedWMFVisualizationFunctionality___getHeight(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getHeight;
end;

procedure TOrientedWMFVisualizationFunctionality___setHeight(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).setHeight(Value);
end;

function TOrientedWMFVisualizationFunctionality___getOrientation(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getOrientation;
end;

procedure TOrientedWMFVisualizationFunctionality___setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).setOrientation(Value);
end;

procedure TOrientedWMFVisualizationFunctionality___ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).ChangeScale(ScaleFactor);
end;

procedure TOrientedWMFVisualizationFunctionality___UpdateContainer(Functionality: TFunctionality); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).UpdateContainer;
end;

function TOrientedWMFVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TOrientedWMFVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TOrientedWMFVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

function TOrientedWMFVisualizationFunctionality___IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).IsNewContainerAcceptable(NewWidth,NewHeight,NewScale);
end;

procedure TOrientedWMFVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetParams(oWidth,oHeight,oOrientation);
end;


{TTCELLVisualizationFunctionality}
function TTCELLVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTCELLVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCELLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality).getName;
end;

function TTCELLVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality).getImage;
end;

function TTCELLVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TCELLVisualizationFunctionality}
procedure TCELLVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TCELLVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TCELLVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TCELLVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TCELLVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TCELLVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TCELLVisualizationFunctionality___SetReflectorView(Functionality: TFunctionality); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).SetReflectorView;
end;

function TCELLVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TCELLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getName;
end;

function TCELLVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getHint;
end;

procedure TCELLVisualizationFunctionality___GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).GetCoordinates(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TCELLVisualizationFunctionality___Change(Functionality: TFunctionality;   const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).Change(Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows);
end;

function TCELLVisualizationFunctionality___GetFormatNodes(Functionality: TFunctionality;   out NodesList: TByteArray; out SizeX,SizeY: integer): boolean; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).GetFormatNodes(NodesList,SizeX,SizeY);
end;

function TCELLVisualizationFunctionality___GetFormatNodes1(Functionality: TFunctionality;   out NodesList: TList; out SizeX,SizeY: integer): boolean; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).GetFormatNodes(NodesList,SizeX,SizeY);
end;

procedure TCELLVisualizationFunctionality___DoQuad(Functionality: TFunctionality); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).DoQuad;
end;

procedure TCELLVisualizationFunctionality___GetInsideObjectsList(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).GetInsideObjectsList(FindTypeID,flBuiltInType,List);
end;

procedure TCELLVisualizationFunctionality___GetInsideObjectsList1(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TComponentsList); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).GetInsideObjectsList(FindTypeID,flBuiltInType,List);
end;

function TCELLVisualizationFunctionality___getColCount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getColCount;
end;

procedure TCELLVisualizationFunctionality___setColCount(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).setColCount(Value);
end;

function TCELLVisualizationFunctionality___getRowCount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getRowCount;
end;

procedure TCELLVisualizationFunctionality___setRowCount(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).setRowCount(Value);
end;

function TCELLVisualizationFunctionality___getLineWidth(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getLineWidth;
end;

procedure TCELLVisualizationFunctionality___setLineWidth(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).setLineWidth(Value);
end;

function TCELLVisualizationFunctionality___getColSize(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getColSize;
end;

function TCELLVisualizationFunctionality___getRowSize(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getRowSize;
end;

procedure TCELLVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oColCount: integer; out oRowCount: integer; out oLineWidth: Double); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).GetParams(oColCount,oRowCount,oLineWidth);
end;


{TTEllipseVisualizationFunctionality}
function TTEllipseVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTEllipseVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTEllipseVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality).getName;
end;

function TTEllipseVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality).getImage;
end;

function TTEllipseVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TEllipseVisualizationFunctionality}
procedure TEllipseVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TEllipseVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TEllipseVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TEllipseVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TEllipseVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TEllipseVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TEllipseVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TEllipseVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getName;
end;

function TEllipseVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getHint;
end;

function TEllipseVisualizationFunctionality___getColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getColor;
end;

procedure TEllipseVisualizationFunctionality___setColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).setColor(Value);
end;

function TEllipseVisualizationFunctionality___getBorderColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getBorderColor;
end;

procedure TEllipseVisualizationFunctionality___setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).setBorderColor(Value);
end;

function TEllipseVisualizationFunctionality___getBorderWidth(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getBorderWidth;
end;

procedure TEllipseVisualizationFunctionality___setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).setBorderWidth(Value);
end;


{TTWMFVisualizationFunctionality}
function TTWMFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTWMFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTWMFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).getName;
end;

function TTWMFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).getImage;
end;

function TTWMFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TWMFVisualizationFunctionality}
procedure TWMFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TWMFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TWMFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TWMFVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TWMFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TWMFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWMFVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).DATASize;
end;

function TWMFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TWMFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).getName;
end;

function TWMFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).getHint;
end;

procedure TWMFVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TWMFVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TWMFVisualizationFunctionality___GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetJPEGDATA(DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TWMFVisualizationFunctionality___GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetJPEGDATA(DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TWMFVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

function TWMFVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TWMFVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TWMFVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

procedure TWMFVisualizationFunctionality___SetProportion(Functionality: TFunctionality); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).SetProportion;
end;


{TTPictureVisualizationFunctionality}
function TTPictureVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTPictureVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).getName;
end;

function TTPictureVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).getImage;
end;

function TTPictureVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TPictureVisualizationFunctionality}
procedure TPictureVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TPictureVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TPictureVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TPictureVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TPictureVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TPictureVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPictureVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).DATASize;
end;

function TPictureVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TPictureVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).getName;
end;

function TPictureVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).getHint;
end;

procedure TPictureVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TPictureVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TPictureVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality___GetBMP(Functionality: TFunctionality;   out BMP: TByteArray); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetBMP(BMP);
end;

procedure TPictureVisualizationFunctionality___GetBMP1(Functionality: TFunctionality;   out BMP: TBitmap); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetBMP(BMP);
end;

procedure TPictureVisualizationFunctionality___SetProportion(Functionality: TFunctionality); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).SetProportion;
end;

function TPictureVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TPictureVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TPictureVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

procedure TPictureVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetParams(VisibleMinScale,VisibleMaxScale);
end;

procedure TPictureVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).SetParams(VisibleMinScale,VisibleMaxScale);
end;


{TTRoundVisualizationFunctionality}
function TTRoundVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTRoundVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTRoundVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality).getName;
end;

function TTRoundVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality).getImage;
end;

function TTRoundVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TRoundVisualizationFunctionality}
procedure TRoundVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TRoundVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TRoundVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TRoundVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TRoundVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TRoundVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TRoundVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TRoundVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TRoundVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getName;
end;

function TRoundVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getHint;
end;

function TRoundVisualizationFunctionality___getColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getColor;
end;

procedure TRoundVisualizationFunctionality___setColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).setColor(Value);
end;

function TRoundVisualizationFunctionality___getBorderColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getBorderColor;
end;

procedure TRoundVisualizationFunctionality___setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).setBorderColor(Value);
end;

function TRoundVisualizationFunctionality___getBorderWidth(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getBorderWidth;
end;

procedure TRoundVisualizationFunctionality___setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).setBorderWidth(Value);
end;


{TTGeodesyPointFunctionality}
function TTGeodesyPointFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality)._CreateInstance;
end;

procedure TTGeodesyPointFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGeodesyPointFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGeodesyPointFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGeodesyPointFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).getName;
end;

function TTGeodesyPointFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).getImage;
end;

function TTGeodesyPointFunctionality___ConvertSpaceCRDToGeoCRD(Functionality: TFunctionality;   const X,Y: Double; out Latitude,Longitude: Double): boolean; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).ConvertSpaceCRDToGeoCRD(X,Y,Latitude,Longitude);
end;

function TTGeodesyPointFunctionality___ConvertGeoCRDToSpaceCRD(Functionality: TFunctionality;   const Latitude,Longitude: Double; out X,Y: Double): boolean; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).ConvertGeoCRDToSpaceCRD(Latitude,Longitude,X,Y);
end;

procedure TTGeodesyPointFunctionality___GetNearestCrdSys(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;
begin
TTGeodesyPointFunctionality(Functionality).GetNearestCrdSys(pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeodesyPointFunctionality___GetInstanceListByCrdSys(Functionality: TFunctionality;   const idCrdSys: integer; out List: TByteArray); stdcall;
begin
TTGeodesyPointFunctionality(Functionality).GetInstanceListByCrdSys(idCrdSys,List);
end;

function TTGeodesyPointFunctionality___CrdSys_GetNearestGeoPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).CrdSys_GetNearestGeoPoints(idCrdSys,pLatitude,pLongitude,PointsCount,Points);
end;

function TTGeodesyPointFunctionality___CrdSys_GetNearestXYPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).CrdSys_GetNearestXYPoints(idCrdSys,pX,pY,PointsCount,Points);
end;


{TGeodesyPointFunctionality}
procedure TGeodesyPointFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TGeodesyPointFunctionality(Functionality)._ToClone(idClone);
end;

function TGeodesyPointFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TGeodesyPointFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGeodesyPointFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getName;
end;

function TGeodesyPointFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getHint;
end;

function TGeodesyPointFunctionality___getidCrdSys(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getidCrdSys;
end;

procedure TGeodesyPointFunctionality___setidCrdSys(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeodesyPointFunctionality(Functionality).setidCrdSys(Value);
end;

function TGeodesyPointFunctionality___getX(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getX;
end;

procedure TGeodesyPointFunctionality___setX(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TGeodesyPointFunctionality(Functionality).setX(Value);
end;

function TGeodesyPointFunctionality___getY(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getY;
end;

procedure TGeodesyPointFunctionality___setY(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TGeodesyPointFunctionality(Functionality).setY(Value);
end;

function TGeodesyPointFunctionality___getLatitude(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getLatitude;
end;

procedure TGeodesyPointFunctionality___setLatitude(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TGeodesyPointFunctionality(Functionality).setLatitude(Value);
end;

function TGeodesyPointFunctionality___getLongitude(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getLongitude;
end;

procedure TGeodesyPointFunctionality___setLongitude(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TGeodesyPointFunctionality(Functionality).setLongitude(Value);
end;

procedure TGeodesyPointFunctionality___GetParams(Functionality: TFunctionality;   out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double); stdcall;
begin
TGeodesyPointFunctionality(Functionality).GetParams(oidCrdSys,oX,oY,oLatitude,oLongitude);
end;

procedure TGeodesyPointFunctionality___SetParams(Functionality: TFunctionality;   const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double); stdcall;
begin
TGeodesyPointFunctionality(Functionality).SetParams(pidCrdSys,pX,pY,pLatitude,pLongitude);
end;

procedure TGeodesyPointFunctionality___ValidateByVisualizationComponent(Functionality: TFunctionality); stdcall;
begin
TGeodesyPointFunctionality(Functionality).ValidateByVisualizationComponent;
end;


{TTPrivateAreaVisualizationFunctionality}
function TTPrivateAreaVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTPrivateAreaVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTPrivateAreaVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).getName;
end;

function TTPrivateAreaVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).getImage;
end;

function TTPrivateAreaVisualizationFunctionality___CanCreateAsDetail(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).CanCreateAsDetail;
end;

function TTPrivateAreaVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TPrivateAreaVisualizationFunctionality}
procedure TPrivateAreaVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPrivateAreaVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TPrivateAreaVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TPrivateAreaVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TPrivateAreaVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPrivateAreaVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TPrivateAreaVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TPrivateAreaVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPrivateAreaVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TPrivateAreaVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).getName;
end;

function TPrivateAreaVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).getHint;
end;

function TPrivateAreaVisualizationFunctionality___getAcquireObjectsInside(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).getAcquireObjectsInside;
end;

procedure TPrivateAreaVisualizationFunctionality___setAcquireObjectsInside(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TPrivateAreaVisualizationFunctionality(Functionality).setAcquireObjectsInside(Value);
end;


{TTHyperTextFunctionality}
function TTHyperTextFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHyperTextFunctionality(Functionality)._CreateInstance;
end;

procedure TTHyperTextFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTHyperTextFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTHyperTextFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHyperTextFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHyperTextFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHyperTextFunctionality(Functionality).getName;
end;

function TTHyperTextFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHyperTextFunctionality(Functionality).getImage;
end;


{THyperTextFunctionality}
procedure THyperTextFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall;
begin
THyperTextFunctionality(Functionality).UpdateDATA;
end;

procedure THyperTextFunctionality___ClearDATA(Functionality: TFunctionality); stdcall;
begin
THyperTextFunctionality(Functionality).ClearDATA;
end;

procedure THyperTextFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THyperTextFunctionality(Functionality)._ToClone(idClone);
end;

function THyperTextFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THyperTextFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure THyperTextFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
THyperTextFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure THyperTextFunctionality___SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
THyperTextFunctionality(Functionality).SaveToFile(FileName);
end;

function THyperTextFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=THyperTextFunctionality(Functionality).getName;
end;

function THyperTextFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=THyperTextFunctionality(Functionality).getHint;
end;

procedure THyperTextFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
THyperTextFunctionality(Functionality).GetDATA(Value);
end;

procedure THyperTextFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;
begin
THyperTextFunctionality(Functionality).GetDATA(Value);
end;

procedure THyperTextFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
THyperTextFunctionality(Functionality).SetDATA(Value);
end;

procedure THyperTextFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
THyperTextFunctionality(Functionality).SetDATA(Value);
end;


{TTComponentsFindServiceFunctionality}
function TTComponentsFindServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTComponentsFindServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTComponentsFindServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTComponentsFindServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTComponentsFindServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTComponentsFindServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTComponentsFindServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTComponentsFindServiceFunctionality(Functionality).getName;
end;

function TTComponentsFindServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTComponentsFindServiceFunctionality(Functionality).getImage;
end;


{TComponentsFindServiceFunctionality}
procedure TComponentsFindServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TComponentsFindServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TComponentsFindServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TComponentsFindServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TComponentsFindServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TComponentsFindServiceFunctionality(Functionality).getName;
end;

function TComponentsFindServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TComponentsFindServiceFunctionality(Functionality).getHint;
end;


{TTUsersServiceFunctionality}
function TTUsersServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTUsersServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTUsersServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTUsersServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTUsersServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTUsersServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTUsersServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTUsersServiceFunctionality(Functionality).getName;
end;

function TTUsersServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTUsersServiceFunctionality(Functionality).getImage;
end;


{TUsersServiceFunctionality}
procedure TUsersServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TUsersServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TUsersServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TUsersServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TUsersServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TUsersServiceFunctionality(Functionality).getName;
end;

function TUsersServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TUsersServiceFunctionality(Functionality).getHint;
end;


{TTTransportServiceFunctionality}
function TTTransportServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTransportServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTTransportServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTransportServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTransportServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTransportServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTransportServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTransportServiceFunctionality(Functionality).getName;
end;

function TTTransportServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTransportServiceFunctionality(Functionality).getImage;
end;


{TTransportServiceFunctionality}
procedure TTransportServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTransportServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TTransportServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTransportServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportServiceFunctionality(Functionality).getName;
end;

function TTransportServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportServiceFunctionality(Functionality).getHint;
end;


{TTMarketServiceFunctionality}
function TTMarketServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMarketServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTMarketServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMarketServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMarketServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMarketServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMarketServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMarketServiceFunctionality(Functionality).getName;
end;

function TTMarketServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMarketServiceFunctionality(Functionality).getImage;
end;


{TMarketServiceFunctionality}
procedure TMarketServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMarketServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TMarketServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMarketServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMarketServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMarketServiceFunctionality(Functionality).getName;
end;

function TMarketServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMarketServiceFunctionality(Functionality).getHint;
end;


{TTTelecomServiceFunctionality}
function TTTelecomServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTelecomServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTTelecomServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTelecomServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTelecomServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTelecomServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTelecomServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTelecomServiceFunctionality(Functionality).getName;
end;

function TTTelecomServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTelecomServiceFunctionality(Functionality).getImage;
end;


{TTelecomServiceFunctionality}
procedure TTelecomServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTelecomServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TTelecomServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTelecomServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTelecomServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTelecomServiceFunctionality(Functionality).getName;
end;

function TTelecomServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTelecomServiceFunctionality(Functionality).getHint;
end;


{TTWNDVisualizationFunctionality}
function TTWNDVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTWNDVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTWNDVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).getName;
end;

function TTWNDVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).getImage;
end;

function TTWNDVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TWNDVisualizationFunctionality}
procedure TWNDVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TWNDVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TWNDVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TWNDVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TWNDVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TWNDVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWNDVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).DATASize;
end;

function TWNDVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TWNDVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TWNDVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).getName;
end;

function TWNDVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).getHint;
end;

procedure TWNDVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TWNDVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TWNDVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

function TWNDVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TWNDVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TWNDVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).DATAFile_Clear;
end;


{TTMRKVisualizationFunctionality}
function TTMRKVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTMRKVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMRKVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).getName;
end;

function TTMRKVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).getImage;
end;

function TTMRKVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TMRKVisualizationFunctionality}
procedure TMRKVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TMRKVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TMRKVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TMRKVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TMRKVisualizationFunctionality___DoOnComponentUpdate(Functionality: TFunctionality); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).DoOnComponentUpdate;
end;

function TMRKVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TMRKVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMRKVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).DATASize;
end;

function TMRKVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TMRKVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getName;
end;

function TMRKVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getHint;
end;

procedure TMRKVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TMRKVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TMRKVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

function TMRKVisualizationFunctionality___getBindingPointIndex(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getBindingPointIndex;
end;

procedure TMRKVisualizationFunctionality___setBindingPointIndex(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).setBindingPointIndex(Value);
end;

function TMRKVisualizationFunctionality___getAlign(Functionality: TFunctionality): TMRKVisualizationAlign; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getAlign;
end;

function TMRKVisualizationFunctionality___getAlign1(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getAlign1;
end;

procedure TMRKVisualizationFunctionality___setAlign(Functionality: TFunctionality;   Value: TMRKVisualizationAlign); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).setAlign(Value);
end;

procedure TMRKVisualizationFunctionality___setAlign1(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).setAlign1(Value);
end;

function TMRKVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TMRKVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TMRKVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

procedure TMRKVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oAlign: integer; out oBindingPointIndex: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).GetParams(oAlign,oBindingPointIndex);
end;


{TTOrientedPictureVisualizationFunctionality}
function TTOrientedPictureVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOrientedPictureVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOrientedPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).getName;
end;

function TTOrientedPictureVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).getImage;
end;

function TTOrientedPictureVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOrientedPictureVisualizationFunctionality}
procedure TOrientedPictureVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TOrientedPictureVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOrientedPictureVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TOrientedPictureVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TOrientedPictureVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TOrientedPictureVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedPictureVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedPictureVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).DATASize;
end;

function TOrientedPictureVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOrientedPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getName;
end;

function TOrientedPictureVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getHint;
end;

procedure TOrientedPictureVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TOrientedPictureVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TOrientedPictureVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

function TOrientedPictureVisualizationFunctionality___getWidth(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getWidth;
end;

procedure TOrientedPictureVisualizationFunctionality___setWidth(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).setWidth(Value);
end;

function TOrientedPictureVisualizationFunctionality___getHeight(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getHeight;
end;

procedure TOrientedPictureVisualizationFunctionality___setHeight(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).setHeight(Value);
end;

function TOrientedPictureVisualizationFunctionality___getOrientation(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getOrientation;
end;

procedure TOrientedPictureVisualizationFunctionality___setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).setOrientation(Value);
end;

procedure TOrientedPictureVisualizationFunctionality___ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).ChangeScale(ScaleFactor);
end;

procedure TOrientedPictureVisualizationFunctionality___UpdateContainer(Functionality: TFunctionality); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).UpdateContainer;
end;

function TOrientedPictureVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TOrientedPictureVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TOrientedPictureVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

function TOrientedPictureVisualizationFunctionality___IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).IsNewContainerAcceptable(NewWidth,NewHeight,NewScale);
end;

procedure TOrientedPictureVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).GetParams(oWidth,oHeight,oOrientation);
end;


{TTOrientedTTFVisualizationFunctionality}
function TTOrientedTTFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOrientedTTFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOrientedTTFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality).getName;
end;

function TTOrientedTTFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality).getImage;
end;

function TTOrientedTTFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOrientedTTFVisualizationFunctionality}
procedure TOrientedTTFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TOrientedTTFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOrientedTTFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TOrientedTTFVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TOrientedTTFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedTTFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedTTFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOrientedTTFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getName;
end;

function TOrientedTTFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getHint;
end;

function TOrientedTTFVisualizationFunctionality___getStr(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getStr;
end;

procedure TOrientedTTFVisualizationFunctionality___setStr(Functionality: TFunctionality;   const Value: string); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setStr(Value);
end;

function TOrientedTTFVisualizationFunctionality___getColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getColor;
end;

procedure TOrientedTTFVisualizationFunctionality___setColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setColor(Value);
end;

function TOrientedTTFVisualizationFunctionality___getFont_Name(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getFont_Name;
end;

procedure TOrientedTTFVisualizationFunctionality___setFont_Name(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setFont_Name(Value);
end;

function TOrientedTTFVisualizationFunctionality___getFont_Width(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getFont_Width;
end;

procedure TOrientedTTFVisualizationFunctionality___setFont_Width(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setFont_Width(Value);
end;

function TOrientedTTFVisualizationFunctionality___getFont_Height(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getFont_Height;
end;

procedure TOrientedTTFVisualizationFunctionality___setFont_Height(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setFont_Height(Value);
end;

function TOrientedTTFVisualizationFunctionality___getCharInterval(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getCharInterval;
end;

procedure TOrientedTTFVisualizationFunctionality___setCharInterval(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setCharInterval(Value);
end;

function TOrientedTTFVisualizationFunctionality___getOrientation(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getOrientation;
end;

procedure TOrientedTTFVisualizationFunctionality___setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setOrientation(Value);
end;

procedure TOrientedTTFVisualizationFunctionality___UpdateContainer(Functionality: TFunctionality); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).UpdateContainer;
end;

function TOrientedTTFVisualizationFunctionality___IsNewContainerAcceptable(Functionality: TFunctionality;   const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).IsNewContainerAcceptable(NewFontWidth,NewFontHeight,NewCharInterval,flNewStr,NewStr);
end;

procedure TOrientedTTFVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).GetParams(oStr,oFont_Width,oFont_Height,oFont_Name,oCharInterval,oOrientation);
end;

procedure TOrientedTTFVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).SetParams(pStr,pFont_Width,pFont_Height,pFont_Name,pCharInterval,pOrientation);
end;


{TTIconFunctionality}
function TTIconFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTIconFunctionality(Functionality)._CreateInstance;
end;

procedure TTIconFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTIconFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTIconFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTIconFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTIconFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTIconFunctionality(Functionality).getName;
end;

function TTIconFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTIconFunctionality(Functionality).getImage;
end;


{TIconFunctionality}
procedure TIconFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TIconFunctionality(Functionality)._ToClone(idClone);
end;

procedure TIconFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TIconFunctionality(Functionality).LoadFromFile(FileName);
end;

function TIconFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TIconFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TIconFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TIconFunctionality(Functionality).getName;
end;

function TIconFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TIconFunctionality(Functionality).getHint;
end;

procedure TIconFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TIconFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TIconFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall;
begin
TIconFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TIconFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall;
begin
TIconFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TIconFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall;
begin
TIconFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TIconFunctionality___GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall;
begin
TIconFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;

procedure TIconFunctionality___GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;
begin
TIconFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;


{TTMessageBoardMessageFunctionality}
function TTMessageBoardMessageFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMessageBoardMessageFunctionality(Functionality)._CreateInstance;
end;

procedure TTMessageBoardMessageFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMessageBoardMessageFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMessageBoardMessageFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMessageBoardMessageFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMessageBoardMessageFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMessageBoardMessageFunctionality(Functionality).getName;
end;

function TTMessageBoardMessageFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMessageBoardMessageFunctionality(Functionality).getImage;
end;


{TMessageBoardMessageFunctionality}
procedure TMessageBoardMessageFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality)._ToClone(idClone);
end;

function TMessageBoardMessageFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMessageBoardMessageFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getName;
end;

function TMessageBoardMessageFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getHint;
end;

function TMessageBoardMessageFunctionality___getIdMessageBoard(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getIdMessageBoard;
end;

procedure TMessageBoardMessageFunctionality___setIdMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).setIdMessageBoard(Value);
end;

function TMessageBoardMessageFunctionality___getIdSenderMessageBoard(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getIdSenderMessageBoard;
end;

procedure TMessageBoardMessageFunctionality___setIdSenderMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).setIdSenderMessageBoard(Value);
end;

function TMessageBoardMessageFunctionality___DateCreated(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).DateCreated;
end;

function TMessageBoardMessageFunctionality___getSubject(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getSubject;
end;

procedure TMessageBoardMessageFunctionality___setSubject(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).setSubject(Value);
end;

procedure TMessageBoardMessageFunctionality___GetBody(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).GetBody(Value);
end;

procedure TMessageBoardMessageFunctionality___GetBody1(Functionality: TFunctionality;   Value: TStringList); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).GetBody(Value);
end;

procedure TMessageBoardMessageFunctionality___SetBody(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).SetBody(Value);
end;

procedure TMessageBoardMessageFunctionality___SetBody1(Functionality: TFunctionality;   Value: TStringList); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).SetBody(Value);
end;

function TMessageBoardMessageFunctionality___getFlRead(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getFlRead;
end;

procedure TMessageBoardMessageFunctionality___setFlRead(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).setFlRead(Value);
end;

function TMessageBoardMessageFunctionality___IsEmpty(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).IsEmpty;
end;

function TMessageBoardMessageFunctionality___IsCreatedByUser(Functionality: TFunctionality;   const pidUser: integer): boolean; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).IsCreatedByUser(pidUser);
end;


{TTMessageBoardFunctionality}
function TTMessageBoardFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMessageBoardFunctionality(Functionality)._CreateInstance;
end;

procedure TTMessageBoardFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMessageBoardFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMessageBoardFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMessageBoardFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMessageBoardFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMessageBoardFunctionality(Functionality).getName;
end;

function TTMessageBoardFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMessageBoardFunctionality(Functionality).getImage;
end;


{TMessageBoardFunctionality}
procedure TMessageBoardFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMessageBoardFunctionality(Functionality)._ToClone(idClone);
end;

function TMessageBoardFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TMessageBoardFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMessageBoardFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).getName;
end;

procedure TMessageBoardFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMessageBoardFunctionality(Functionality).setName(Value);
end;

function TMessageBoardFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).getHint;
end;

function TMessageBoardFunctionality___IsUnreadMessageExist(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).IsUnreadMessageExist;
end;

procedure TMessageBoardFunctionality___GetMessagesList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TMessageBoardFunctionality(Functionality).GetMessagesList(List);
end;

procedure TMessageBoardFunctionality___GetMessagesList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TMessageBoardFunctionality(Functionality).GetMessagesList(List);
end;

function TMessageBoardFunctionality___CreateNewMessage(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).CreateNewMessage;
end;

procedure TMessageBoardFunctionality___SendMessage(Functionality: TFunctionality;   const idMessage: integer); stdcall;
begin
TMessageBoardFunctionality(Functionality).SendMessage(idMessage);
end;

function TMessageBoardFunctionality___getIdUser(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).getIdUser;
end;

procedure TMessageBoardFunctionality___setIdUser(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMessageBoardFunctionality(Functionality).setIdUser(Value);
end;


{TTHREFFunctionality}
function TTHREFFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHREFFunctionality(Functionality)._CreateInstance;
end;

procedure TTHREFFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTHREFFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTHREFFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHREFFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHREFFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHREFFunctionality(Functionality).getName;
end;

function TTHREFFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHREFFunctionality(Functionality).getImage;
end;


{THREFFunctionality}
procedure THREFFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THREFFunctionality(Functionality)._ToClone(idClone);
end;

function THREFFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THREFFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THREFFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=THREFFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

procedure THREFFunctionality___Activate(Functionality: TFunctionality); stdcall;
begin
THREFFunctionality(Functionality).Activate;
end;

function THREFFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=THREFFunctionality(Functionality).getName;
end;

function THREFFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=THREFFunctionality(Functionality).getHint;
end;

function THREFFunctionality___getURL(Functionality: TFunctionality): string; stdcall;
begin
Result:=THREFFunctionality(Functionality).getURL;
end;

procedure THREFFunctionality___setURL(Functionality: TFunctionality;   Value: string); stdcall;
begin
THREFFunctionality(Functionality).setURL(Value);
end;

function THREFFunctionality___getAutoStart(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=THREFFunctionality(Functionality).getAutoStart;
end;

procedure THREFFunctionality___setAutoStart(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
THREFFunctionality(Functionality).setAutoStart(Value);
end;


{TTQDCVisualizationFunctionality}
function TTQDCVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTQDCVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTQDCVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).getName;
end;

function TTQDCVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).getImage;
end;

function TTQDCVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TQDCVisualizationFunctionality}
procedure TQDCVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TQDCVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TQDCVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TQDCVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TQDCVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAPtr: pointer): boolean; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).GetDATA(DATAPtr);
end;

function TQDCVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TQDCVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TQDCVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).DATASize;
end;

function TQDCVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TQDCVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).getName;
end;

function TQDCVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).getHint;
end;

procedure TQDCVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TQDCVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TQDCVisualizationFunctionality___LoadFromBitmap(Functionality: TFunctionality;   Bitmap: TByteArray); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).LoadFromBitmap(Bitmap);
end;

procedure TQDCVisualizationFunctionality___LoadFromBitmap1(Functionality: TFunctionality;   Bitmap: TBitmap); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).LoadFromBitmap(Bitmap);
end;

function TQDCVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TQDCVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TQDCVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).DATAFile_Clear;
end;


{TTOffersServerFunctionality}
function TTOffersServerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOffersServerFunctionality(Functionality)._CreateInstance;
end;

procedure TTOffersServerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTOffersServerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTOffersServerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOffersServerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOffersServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOffersServerFunctionality(Functionality).getName;
end;

function TTOffersServerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOffersServerFunctionality(Functionality).getImage;
end;


{TOffersServerFunctionality}
procedure TOffersServerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOffersServerFunctionality(Functionality)._ToClone(idClone);
end;

function TOffersServerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOffersServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getName;
end;

function TOffersServerFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getHint;
end;

function TOffersServerFunctionality___getMailROBOT_Inbox(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getMailROBOT_Inbox;
end;

procedure TOffersServerFunctionality___setMailROBOT_Inbox(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOffersServerFunctionality(Functionality).setMailROBOT_Inbox(Value);
end;

function TOffersServerFunctionality___getMailROBOT_User(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getMailROBOT_User;
end;

procedure TOffersServerFunctionality___setMailROBOT_User(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOffersServerFunctionality(Functionality).setMailROBOT_User(Value);
end;

function TOffersServerFunctionality___getMailROBOT_Password(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getMailROBOT_Password;
end;

procedure TOffersServerFunctionality___setMailROBOT_Password(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOffersServerFunctionality(Functionality).setMailROBOT_Password(Value);
end;


{TTSecurityComponentOperationFunctionality}
function TTSecurityComponentOperationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSecurityComponentOperationFunctionality(Functionality)._CreateInstance;
end;

procedure TTSecurityComponentOperationFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityComponentOperationFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSecurityComponentOperationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSecurityComponentOperationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSecurityComponentOperationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTSecurityComponentOperationFunctionality(Functionality).getName;
end;

function TTSecurityComponentOperationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSecurityComponentOperationFunctionality(Functionality).getImage;
end;

procedure TTSecurityComponentOperationFunctionality___GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall;
begin
TTSecurityComponentOperationFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;

procedure TTSecurityComponentOperationFunctionality___GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;
begin
TTSecurityComponentOperationFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;


{TSecurityComponentOperationFunctionality}
procedure TSecurityComponentOperationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSecurityComponentOperationFunctionality(Functionality)._ToClone(idClone);
end;

function TSecurityComponentOperationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityComponentOperationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).getName;
end;

procedure TSecurityComponentOperationFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TSecurityComponentOperationFunctionality(Functionality).setName(Value);
end;

function TSecurityComponentOperationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).getHint;
end;

function TSecurityComponentOperationFunctionality___getSQLInfo(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).getSQLInfo;
end;

procedure TSecurityComponentOperationFunctionality___setSQLInfo(Functionality: TFunctionality;   Value: string); stdcall;
begin
TSecurityComponentOperationFunctionality(Functionality).setSQLInfo(Value);
end;


{TTSecurityKeyFunctionality}
function TTSecurityKeyFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality)._CreateInstance;
end;

procedure TTSecurityKeyFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityKeyFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSecurityKeyFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSecurityKeyFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality).getName;
end;

function TTSecurityKeyFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality).getImage;
end;

function TTSecurityKeyFunctionality___GetInstanceByCode(Functionality: TFunctionality;   const Code: string;  out idInstance: integer): boolean; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality).GetInstanceByCode(Code,idInstance);
end;

procedure TTSecurityKeyFunctionality___GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall;
begin
TTSecurityKeyFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;

procedure TTSecurityKeyFunctionality___GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;
begin
TTSecurityKeyFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;


{TSecurityKeyFunctionality}
procedure TSecurityKeyFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSecurityKeyFunctionality(Functionality)._ToClone(idClone);
end;

function TSecurityKeyFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityKeyFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).getName;
end;

procedure TSecurityKeyFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TSecurityKeyFunctionality(Functionality).setName(Value);
end;

function TSecurityKeyFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).getHint;
end;

function TSecurityKeyFunctionality___getInfo(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).getInfo;
end;

procedure TSecurityKeyFunctionality___setInfo(Functionality: TFunctionality;   Value: string); stdcall;
begin
TSecurityKeyFunctionality(Functionality).setInfo(Value);
end;

procedure TSecurityKeyFunctionality___GetAssotiatedUsers(Functionality: TFunctionality;   out Users: TByteArray); stdcall;
begin
TSecurityKeyFunctionality(Functionality).GetAssotiatedUsers(Users);
end;

procedure TSecurityKeyFunctionality___GetAssotiatedUsers1(Functionality: TFunctionality;   out Users: TList); stdcall;
begin
TSecurityKeyFunctionality(Functionality).GetAssotiatedUsers(Users);
end;

procedure TSecurityKeyFunctionality___GenerateCode(Functionality: TFunctionality); stdcall;
begin
TSecurityKeyFunctionality(Functionality).GenerateCode;
end;

function TSecurityKeyFunctionality___Code(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).Code;
end;


{TTSecurityFileFunctionality}
function TTSecurityFileFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSecurityFileFunctionality(Functionality)._CreateInstance;
end;

procedure TTSecurityFileFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityFileFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSecurityFileFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSecurityFileFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSecurityFileFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTSecurityFileFunctionality(Functionality).getName;
end;

function TTSecurityFileFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSecurityFileFunctionality(Functionality).getImage;
end;

procedure TTSecurityFileFunctionality___GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString;out List: TByteArray); stdcall;
begin
TTSecurityFileFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;

procedure TTSecurityFileFunctionality___GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;
begin
TTSecurityFileFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;


{TSecurityFileFunctionality}
procedure TSecurityFileFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSecurityFileFunctionality(Functionality)._ToClone(idClone);
end;

function TSecurityFileFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityFileFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).getName;
end;

procedure TSecurityFileFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TSecurityFileFunctionality(Functionality).setName(Value);
end;

function TSecurityFileFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).getHint;
end;

function TSecurityFileFunctionality___getInfo(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).getInfo;
end;

procedure TSecurityFileFunctionality___setInfo(Functionality: TFunctionality;   Value: string); stdcall;
begin
TSecurityFileFunctionality(Functionality).setInfo(Value);
end;

function TSecurityFileFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray): boolean; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).GetDATA(Value);
end;

function TSecurityFileFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream): boolean; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).GetDATA(Value);
end;

procedure TSecurityFileFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
TSecurityFileFunctionality(Functionality).SetDATA(Value);
end;

procedure TSecurityFileFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
TSecurityFileFunctionality(Functionality).SetDATA(Value);
end;

function TSecurityFileFunctionality___AddOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).AddOperationSecurityKey(OperationID,SecurityKeyID);
end;

function TSecurityFileFunctionality___RemoveOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).RemoveOperationSecurityKey(OperationID,SecurityKeyID);
end;

procedure TSecurityFileFunctionality___GetAssotiatedSecurityComponents(Functionality: TFunctionality;   out SecurityComponents: TByteArray); stdcall;
begin
TSecurityFileFunctionality(Functionality).GetAssotiatedSecurityComponents(SecurityComponents);
end;

procedure TSecurityFileFunctionality___GetAssotiatedSecurityComponents1(Functionality: TFunctionality;   out SecurityComponents: TList); stdcall;
begin
TSecurityFileFunctionality(Functionality).GetAssotiatedSecurityComponents(SecurityComponents);
end;


{TTSecurityComponentFunctionality}
function TTSecurityComponentFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality)._CreateInstance;
end;

procedure TTSecurityComponentFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityComponentFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSecurityComponentFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSecurityComponentFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality).getName;
end;

function TTSecurityComponentFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality).getImage;
end;

procedure TTSecurityComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityComponentFunctionality(Functionality).DestroyInstance(idObj);
end;


{TSecurityComponentFunctionality}
procedure TSecurityComponentFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSecurityComponentFunctionality(Functionality)._ToClone(idClone);
end;

function TSecurityComponentFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TSecurityComponentFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSecurityComponentFunctionality(Functionality).ToClone(idClone);
end;

function TSecurityComponentFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TSecurityComponentFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).getName;
end;

function TSecurityComponentFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).getHint;
end;

function TSecurityComponentFunctionality___getIdSecurityFile(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).getIdSecurityFile;
end;

procedure TSecurityComponentFunctionality___setIdSecurityFile(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TSecurityComponentFunctionality(Functionality).setIdSecurityFile(Value);
end;


{TTMODELUserFunctionality}
function TTMODELUserFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality)._CreateInstance;
end;

procedure TTMODELUserFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMODELUserFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMODELUserFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMODELUserFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality).getName;
end;

function TTMODELUserFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality).getImage;
end;

function TTMODELUserFunctionality___IsUserExist(Functionality: TFunctionality;   const UserName: string; out idUser: integer): boolean; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality).IsUserExist(UserName,idUser);
end;

procedure TTMODELUserFunctionality___GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall;
begin
TTMODELUserFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;

procedure TTMODELUserFunctionality___GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;
begin
TTMODELUserFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;

procedure TTMODELUserFunctionality___GetOnlineUsersForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall;
begin
TTMODELUserFunctionality(Functionality).GetOnlineUsersForDomains(pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality___GetOnlineUsersForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall;
begin
TTMODELUserFunctionality(Functionality).GetOnlineUsersForDomains(pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality___GetOnlineExpertsForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall;
begin
TTMODELUserFunctionality(Functionality).GetOnlineExpertsForDomains(pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality___GetOnlineExpertsForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall;
begin
TTMODELUserFunctionality(Functionality).GetOnlineExpertsForDomains(pOnlineMaxDelay,pDomains,List);
end;


{TMODELUserFunctionality}
procedure TMODELUserFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMODELUserFunctionality(Functionality)._ToClone(idClone);
end;

function TMODELUserFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMODELUserFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getHint;
end;

function TMODELUserFunctionality___GetActiveStateInfo(Functionality: TFunctionality;   out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).GetActiveStateInfo(ProxySpaceID,ProxySpaceIP,ProxySpaceState);
end;

function TMODELUserFunctionality___IsUserOnLine(Functionality: TFunctionality;   const MaxDelay: Double): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).IsUserOnLine(MaxDelay);
end;

procedure TMODELUserFunctionality___Logout(Functionality: TFunctionality); stdcall;
begin
TMODELUserFunctionality(Functionality).Logout;
end;

procedure TMODELUserFunctionality___GetSecurityKeysList(Functionality: TFunctionality;   out SecurityKeys: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).GetSecurityKeysList(SecurityKeys);
end;

procedure TMODELUserFunctionality___GetSecurityKeysList1(Functionality: TFunctionality;   out SecurityKeys: TList); stdcall;
begin
TMODELUserFunctionality(Functionality).GetSecurityKeysList(SecurityKeys);
end;

function TMODELUserFunctionality___SecurityKeys_IsKeyExist(Functionality: TFunctionality;   const idSecurityKey: integer): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).SecurityKeys_IsKeyExist(idSecurityKey);
end;

procedure TMODELUserFunctionality___SecurityKeys_Insert(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).SecurityKeys_Insert(idSecurityKey);
end;

procedure TMODELUserFunctionality___SecurityKeys_Delete(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).SecurityKeys_Delete(idSecurityKey);
end;

procedure TMODELUserFunctionality___SecurityKeys_AddKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall;
begin
TMODELUserFunctionality(Functionality).SecurityKeys_AddKeyByCode(Code);
end;

procedure TMODELUserFunctionality___SecurityKeys_RemoveKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall;
begin
TMODELUserFunctionality(Functionality).SecurityKeys_RemoveKeyByCode(Code);
end;

function TMODELUserFunctionality___SecurityKeys_CreateAndAddNewKey(Functionality: TFunctionality;   const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).SecurityKeys_CreateAndAddNewKey(pName,pInfo,KeyCode);
end;

procedure TMODELUserFunctionality___GetMessageBoards(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).GetMessageBoards(List);
end;

procedure TMODELUserFunctionality___GetMessageBoards1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TMODELUserFunctionality(Functionality).GetMessageBoards(List);
end;

function TMODELUserFunctionality___HaveUnreadMessages(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).HaveUnreadMessages;
end;

procedure TMODELUserFunctionality___GetMessages(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).GetMessages(flUnreadOnly,MessageList);
end;

procedure TMODELUserFunctionality___GetMessages1(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TList); stdcall;
begin
TMODELUserFunctionality(Functionality).GetMessages(flUnreadOnly,MessageList);
end;

procedure TMODELUserFunctionality___IncomingMessages_SendNew(Functionality: TFunctionality;   const Message: TByteArray; const SenderID: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_SendNew(Message,SenderID);
end;

procedure TMODELUserFunctionality___IncomingMessages_SendNew1(Functionality: TFunctionality;   const Message: TMemoryStream; const SenderID: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_SendNew(Message,SenderID);
end;

function TMODELUserFunctionality___IncomingMessages_GetUnread(Functionality: TFunctionality;   out MessageList: TByteArray): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).IncomingMessages_GetUnread(MessageList);
end;

function TMODELUserFunctionality___IncomingMessages_GetUnread1(Functionality: TFunctionality;   out MessageList: TList): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).IncomingMessages_GetUnread(MessageList);
end;

procedure TMODELUserFunctionality___IncomingMessages_GetMessagesSince(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_GetMessagesSince(TimeStamp,MessageList);
end;

procedure TMODELUserFunctionality___IncomingMessages_GetMessagesSince1(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TList); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_GetMessagesSince(TimeStamp,MessageList);
end;

procedure TMODELUserFunctionality___IncomingMessages_GetMessage(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_GetMessage(MessageID,TimeStamp,Message,SenderID);
end;

procedure TMODELUserFunctionality___IncomingMessages_GetMessage1(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: TDateTime; out Message: TClientBlobStream; out SenderID: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_GetMessage(MessageID,TimeStamp,Message,SenderID);
end;

procedure TMODELUserFunctionality___IncomingMessages_DeleteTo(Functionality: TFunctionality;   const TimeStamp: TDateTime); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_DeleteTo(TimeStamp);
end;

function TMODELUserFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getName;
end;

procedure TMODELUserFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELUserFunctionality(Functionality).setName(Value);
end;

function TMODELUserFunctionality___getFullName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getFullName;
end;

procedure TMODELUserFunctionality___setFullName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELUserFunctionality(Functionality).setFullName(Value);
end;

function TMODELUserFunctionality___getContactInfo(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getContactInfo;
end;

procedure TMODELUserFunctionality___setContactInfo(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELUserFunctionality(Functionality).setContactInfo(Value);
end;

function TMODELUserFunctionality___getPassword(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getPassword;
end;

procedure TMODELUserFunctionality___setPassword(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELUserFunctionality(Functionality).setPassword(Value);
end;

function TMODELUserFunctionality___getIdSecurityFileForClone(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getIdSecurityFileForClone;
end;

procedure TMODELUserFunctionality___setIdSecurityFileForClone(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setIdSecurityFileForClone(Value);
end;

function TMODELUserFunctionality___getidSecurityFileForPrivate(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getidSecurityFileForPrivate;
end;

procedure TMODELUserFunctionality___setidSecurityFileForPrivate(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setidSecurityFileForPrivate(Value);
end;

function TMODELUserFunctionality___getDATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getDATASize;
end;

procedure TMODELUserFunctionality___setDATASize(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setDATASize(Value);
end;

function TMODELUserFunctionality___getMaxDATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getMaxDATASize;
end;

procedure TMODELUserFunctionality___setMaxDATASize(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setMaxDATASize(Value);
end;

function TMODELUserFunctionality___getSpaceSquare(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getSpaceSquare;
end;

procedure TMODELUserFunctionality___setSpaceSquare(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TMODELUserFunctionality(Functionality).setSpaceSquare(Value);
end;

function TMODELUserFunctionality___getMaxSpaceSquare(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getMaxSpaceSquare;
end;

procedure TMODELUserFunctionality___setMaxSpaceSquare(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setMaxSpaceSquare(Value);
end;

function TMODELUserFunctionality___getMaxSpaceSquarePerObject(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getMaxSpaceSquarePerObject;
end;

procedure TMODELUserFunctionality___setMaxSpaceSquarePerObject(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setMaxSpaceSquarePerObject(Value);
end;

function TMODELUserFunctionality___getDisabled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getDisabled;
end;

procedure TMODELUserFunctionality___setDisabled(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TMODELUserFunctionality(Functionality).setDisabled(Value);
end;

procedure TMODELUserFunctionality___GetStartObj(Functionality: TFunctionality;   out idTStartObj,idStartObj: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).GetStartObj(idTStartObj,idStartObj);
end;

procedure TMODELUserFunctionality___SetStartObj(Functionality: TFunctionality;   const idTStartObj,idStartObj: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).SetStartObj(idTStartObj,idStartObj);
end;

function TMODELUserFunctionality___getDomains(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getDomains;
end;

procedure TMODELUserFunctionality___setDomains(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELUserFunctionality(Functionality).setDomains(Value);
end;

function TMODELUserFunctionality___getTaskEnabled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getTaskEnabled;
end;

procedure TMODELUserFunctionality___setTaskEnabled(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TMODELUserFunctionality(Functionality).setTaskEnabled(Value);
end;

function TMODELUserFunctionality___getBillingType(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getBillingType;
end;

procedure TMODELUserFunctionality___setBillingType(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setBillingType(Value);
end;

procedure TMODELUserFunctionality___CheckDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).CheckDATASize(pAddDATASize);
end;

procedure TMODELUserFunctionality___AddDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).AddDATASize(pAddDATASize);
end;

procedure TMODELUserFunctionality___SubDATASize(Functionality: TFunctionality;   const pSubDATASize: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).SubDATASize(pSubDATASize);
end;

procedure TMODELUserFunctionality___CheckSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall;
begin
TMODELUserFunctionality(Functionality).CheckSpaceSquare(pAddSpaceSquare);
end;

procedure TMODELUserFunctionality___AddSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall;
begin
TMODELUserFunctionality(Functionality).AddSpaceSquare(pAddSpaceSquare);
end;

procedure TMODELUserFunctionality___SubSpaceSquare(Functionality: TFunctionality;   const pSubSpaceSquare: Double); stdcall;
begin
TMODELUserFunctionality(Functionality).SubSpaceSquare(pSubSpaceSquare);
end;

procedure TMODELUserFunctionality___CheckMaxSpaceSquarePerObject(Functionality: TFunctionality;   const pObjectSpaceSquare: Double); stdcall;
begin
TMODELUserFunctionality(Functionality).CheckMaxSpaceSquarePerObject(pObjectSpaceSquare);
end;

procedure TMODELUserFunctionality___ServerFolder_GetSubFoldersList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall;
begin
TMODELUserFunctionality(Functionality).ServerFolder_GetSubFoldersList(RelativePath,List);
end;

procedure TMODELUserFunctionality___ServerFolder_GetFilesList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall;
begin
TMODELUserFunctionality(Functionality).ServerFolder_GetFilesList(RelativePath,List);
end;

function TMODELUserFunctionality___ServerFolder_AddFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_AddFile(RelativePath,FileName,FileData);
end;

function TMODELUserFunctionality___ServerFolder_RemoveFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_RemoveFile(RelativePath,FileName);
end;

function TMODELUserFunctionality___ServerFolder_ReadFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_ReadFile(RelativePath,FileName,FileData);
end;

function TMODELUserFunctionality___ServerFolder_AddSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_AddSubFolder(RelativePath,SubFolderName);
end;

function TMODELUserFunctionality___ServerFolder_AddSubFolder1(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_AddSubFolder(RelativePath,SubFolderName,SubFolderData);
end;

function TMODELUserFunctionality___ServerFolder_RemoveSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_RemoveSubFolder(RelativePath,SubFolderName);
end;

function TMODELUserFunctionality___ServerFolder_ReadSubFolder(Functionality: TFunctionality;   const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_ReadSubFolder(Version,RelativePath,SubFolderName,Excludes,SubFolderData);
end;

function TMODELUserFunctionality___ServerFolder_ExchangeSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_ExchangeSubFolder(RelativePath,SubFolderName,SubFolderInData,Excludes,SubFolderOutData);
end;

function TMODELUserFunctionality___Tasks_AddNew(Functionality: TFunctionality;   const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).Tasks_AddNew(pPriority,pType,pService,pTaskData,pComment);
end;

procedure TMODELUserFunctionality___Tasks_RemoveItem(Functionality: TFunctionality;   const idTask: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_RemoveItem(idTask);
end;

procedure TMODELUserFunctionality___Tasks_Clear(Functionality: TFunctionality); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Clear;
end;

procedure TMODELUserFunctionality___Tasks_GetData(Functionality: TFunctionality;   const Version: integer; const flOnlyActive: boolean; out oData: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_GetData(Version,flOnlyActive,oData);
end;

procedure TMODELUserFunctionality___Tasks_Item_GetTaskData(Functionality: TFunctionality;   const idTask: integer; out oTaskData: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_GetTaskData(idTask,oTaskData);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetPriority(Functionality: TFunctionality;   const idTask: integer; const pPriority: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetPriority(idTask,pPriority);
end;

procedure TMODELUserFunctionality___Tasks_Item_GetStatus(Functionality: TFunctionality;   const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_GetStatus(idTask,oStatus,oStatusReason,oStatusComment);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetStatus(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetStatus(idTask,pStatus,pStatusComment);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetStatus1(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetStatus(idTask,pStatus,pStatusReason,pStatusComment);
end;

procedure TMODELUserFunctionality___Tasks_Item_GetResultData(Functionality: TFunctionality;   const idTask: integer; out oResultData: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_GetResultData(idTask,oResultData);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetResult(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetResult(idTask,pResultCode,pResultComment);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetResult1(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetResult(idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultComment);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetResult2(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetResult(idTask,pResultCode,pResultData,pResultComment);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetResult3(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetResult(idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultData,pResultComment);
end;

function TMODELUserFunctionality___Billing_Account(Functionality: TFunctionality): double; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).Billing_Account;
end;

function TMODELUserFunctionality___Billing_Transactions_AddNew(Functionality: TFunctionality;   const pReason: integer; const pDelta: double; const pComment: string): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).Billing_Transactions_AddNew(pReason,pDelta,pComment);
end;

procedure TMODELUserFunctionality___Billing_Transactions_Remove(Functionality: TFunctionality;   const idTransaction: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).Billing_Transactions_Remove(idTransaction);
end;

procedure TMODELUserFunctionality___Billing_Transactions_Clear(Functionality: TFunctionality); stdcall;
begin
TMODELUserFunctionality(Functionality).Billing_Transactions_Clear;
end;

procedure TMODELUserFunctionality___Billing_Transactions_GetData(Functionality: TFunctionality;   const Version: integer; out oData: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).Billing_Transactions_GetData(Version,oData);
end;

procedure TMODELUserFunctionality___ClientProgram_GetReleases(Functionality: TFunctionality;   const ProgramID: integer; const Localization: WideString; out Data: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).ClientProgram_GetReleases(ProgramID,Localization,Data);
end;


{TTTextureFunctionality}
function TTTextureFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTextureFunctionality(Functionality)._CreateInstance;
end;

procedure TTTextureFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTextureFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTextureFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTextureFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTextureFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTextureFunctionality(Functionality).getName;
end;

function TTTextureFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTextureFunctionality(Functionality).getImage;
end;

procedure TTTextureFunctionality___GetInstanceListMatchingBy(Functionality: TFunctionality;   const NameContext: string; out List: TByteArray); stdcall;
begin
TTTextureFunctionality(Functionality).GetInstanceListMatchingBy(NameContext,List);
end;

procedure TTTextureFunctionality___GetInstanceListMatchingBy1(Functionality: TFunctionality;   const NameContext: string; out List: TList); stdcall;
begin
TTTextureFunctionality(Functionality).GetInstanceListMatchingBy(NameContext,List);
end;


{TTextureFunctionality}
procedure TTextureFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTextureFunctionality(Functionality)._ToClone(idClone);
end;

procedure TTextureFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TTextureFunctionality(Functionality).LoadFromFile(FileName);
end;

function TTextureFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTextureFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTextureFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTextureFunctionality(Functionality).getName;
end;

function TTextureFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTextureFunctionality(Functionality).getHint;
end;

procedure TTextureFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TTextureFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TTextureFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType); stdcall;
begin
TTextureFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TTextureFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall;
begin
TTextureFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TTextureFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TTextureDATAType); stdcall;
begin
TTextureFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TTextureFunctionality___GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall;
begin
TTextureFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;

procedure TTextureFunctionality___GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;
begin
TTextureFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;

procedure TTextureFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTextureFunctionality(Functionality).setName(Value);
end;


{TTBuffered3DVisualizationFunctionality}
function TTBuffered3DVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTBuffered3DVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTBuffered3DVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).getName;
end;

function TTBuffered3DVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).getImage;
end;

function TTBuffered3DVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TBuffered3DVisualizationFunctionality}
procedure TBuffered3DVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TBuffered3DVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TBuffered3DVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TBuffered3DVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TBuffered3DVisualizationFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).UpdateDATA;
end;

procedure TBuffered3DVisualizationFunctionality___GetData(Functionality: TFunctionality;   out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Double; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Double); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).GetData(vMeshes,vptrTransforMatrix,vScale,vTranslate_X,vTranslate_Y,vTranslate_Z,vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ);
end;

function TBuffered3DVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

procedure TBuffered3DVisualizationFunctionality___ReflectInScene(Functionality: TFunctionality;   Scene: TScene); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).ReflectInScene(Scene);
end;

function TBuffered3DVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBuffered3DVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).DATASize;
end;

function TBuffered3DVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TBuffered3DVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).getName;
end;

function TBuffered3DVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).getHint;
end;

procedure TBuffered3DVisualizationFunctionality___LoadFromStream(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).LoadFromStream(DATAStream,DATAType);
end;

procedure TBuffered3DVisualizationFunctionality___LoadFromStream1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).LoadFromStream(DATAStream,DATAType);
end;

procedure TBuffered3DVisualizationFunctionality___Get__Translate_XY(Functionality: TFunctionality;   out vTranslate_X,vTranslate_Y: Double); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).Get__Translate_XY(vTranslate_X,vTranslate_Y);
end;

procedure TBuffered3DVisualizationFunctionality___SetPropertiesLocal(Functionality: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).SetPropertiesLocal(pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
end;

function TBuffered3DVisualizationFunctionality___GetMinMax(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix; out Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Double): boolean; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).GetMinMax(TransforMatrix,Xmin,Ymin,Zmin,Xmax,Ymax,Zmax);
end;

procedure TBuffered3DVisualizationFunctionality___UpdateXOYProjection(Functionality: TFunctionality); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).UpdateXOYProjection;
end;

function TBuffered3DVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TBuffered3DVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TBuffered3DVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

function TBuffered3DVisualizationFunctionality___GetMeshesNodesApproximator(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix): TNodesApproximator; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).GetMeshesNodesApproximator(TransforMatrix);
end;

procedure TBuffered3DVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).GetParams(oScale,oTranslate_X,oTranslate_Y,oTranslate_Z,oRotate_AngleX,oRotate_AngleY,oRotate_AngleZ);
end;


{TTDATAFileFunctionality}
function TTDATAFileFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDATAFileFunctionality(Functionality)._CreateInstance;
end;

procedure TTDATAFileFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDATAFileFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDATAFileFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDATAFileFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDATAFileFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTDATAFileFunctionality(Functionality).getName;
end;

function TTDATAFileFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDATAFileFunctionality(Functionality).getImage;
end;


{TDATAFileFunctionality}
procedure TDATAFileFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDATAFileFunctionality(Functionality)._ToClone(idClone);
end;

procedure TDATAFileFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TDATAFileFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TDATAFileFunctionality___SaveToFile(Functionality: TFunctionality;   var FileName: string); stdcall;
begin
TDATAFileFunctionality(Functionality).SaveToFile(FileName);
end;

procedure TDATAFileFunctionality___Activate(Functionality: TFunctionality); stdcall;
begin
TDATAFileFunctionality(Functionality).Activate;
end;

function TDATAFileFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TDATAFileFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDATAFileFunctionality____GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality)._GetDataDocument(DataModel,DataType,flWithComponents,Document);
end;

procedure TDATAFileFunctionality___Check(Functionality: TFunctionality); stdcall;
begin
TDATAFileFunctionality(Functionality).Check;
end;

function TDATAFileFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).getName;
end;

function TDATAFileFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).getHint;
end;

function TDATAFileFunctionality___IsNull(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).IsNull;
end;

procedure TDATAFileFunctionality___Empty(Functionality: TFunctionality); stdcall;
begin
TDATAFileFunctionality(Functionality).Empty;
end;

procedure TDATAFileFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
TDATAFileFunctionality(Functionality).GetDATA(Value);
end;

procedure TDATAFileFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;
begin
TDATAFileFunctionality(Functionality).GetDATA(Value);
end;

procedure TDATAFileFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
TDATAFileFunctionality(Functionality).SetDATA(Value);
end;

procedure TDATAFileFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
TDATAFileFunctionality(Functionality).SetDATA(Value);
end;

function TDATAFileFunctionality___getDATAType(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).getDATAType;
end;

procedure TDATAFileFunctionality___setDATAType(Functionality: TFunctionality;   Value: string); stdcall;
begin
TDATAFileFunctionality(Functionality).setDATAType(Value);
end;


{TTCoComponentFunctionality}
function TTCoComponentFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoComponentFunctionality(Functionality)._CreateInstance;
end;

procedure TTCoComponentFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCoComponentFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCoComponentFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoComponentFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoComponentFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCoComponentFunctionality(Functionality).getName;
end;

function TTCoComponentFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoComponentFunctionality(Functionality).getImage;
end;

procedure TTCoComponentFunctionality___GetInstanceListByCoType(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TByteArray); stdcall;
begin
TTCoComponentFunctionality(Functionality).GetInstanceListByCoType(idCoType,InstanceList);
end;

procedure TTCoComponentFunctionality___GetInstanceListByCoType1(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TList); stdcall;
begin
TTCoComponentFunctionality(Functionality).GetInstanceListByCoType(idCoType,InstanceList);
end;


{TCoComponentFunctionality}
procedure TCoComponentFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoComponentFunctionality(Functionality)._ToClone(idClone);
end;

function TCoComponentFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TCoComponentFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).getName;
end;

function TCoComponentFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).getHint;
end;

function TCoComponentFunctionality___idCoType(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).idCoType;
end;

function TCoComponentFunctionality___GetIconImage(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).GetIconImage(oImage);
end;

function TCoComponentFunctionality___GetIconImage1(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).GetIconImage(Image);
end;

function TCoComponentFunctionality___GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).GetVisualizationComponent(idTVisualization,idVisualization);
end;


{TTCoComponentTypeMarkerFunctionality}
function TTCoComponentTypeMarkerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoComponentTypeMarkerFunctionality(Functionality)._CreateInstance;
end;

procedure TTCoComponentTypeMarkerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCoComponentTypeMarkerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCoComponentTypeMarkerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoComponentTypeMarkerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoComponentTypeMarkerFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCoComponentTypeMarkerFunctionality(Functionality).getName;
end;

function TTCoComponentTypeMarkerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoComponentTypeMarkerFunctionality(Functionality).getImage;
end;


{TCoComponentTypeMarkerFunctionality}
procedure TCoComponentTypeMarkerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoComponentTypeMarkerFunctionality(Functionality)._ToClone(idClone);
end;

function TCoComponentTypeMarkerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentTypeMarkerFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TCoComponentTypeMarkerFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).getName;
end;

function TCoComponentTypeMarkerFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).getHint;
end;

function TCoComponentTypeMarkerFunctionality___GetTypeIconImage(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).GetTypeIconImage(oImage);
end;

function TCoComponentTypeMarkerFunctionality___GetTypeIconImage1(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).GetTypeIconImage(Image);
end;

procedure TCoComponentTypeMarkerFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TCoComponentTypeMarkerFunctionality(Functionality).setName(Value);
end;

function TCoComponentTypeMarkerFunctionality___getIDCoComponentType(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).getIDCoComponentType;
end;


{TTCoComponentTypeFunctionality}
function TTCoComponentTypeFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoComponentTypeFunctionality(Functionality)._CreateInstance;
end;

procedure TTCoComponentTypeFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCoComponentTypeFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCoComponentTypeFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoComponentTypeFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoComponentTypeFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCoComponentTypeFunctionality(Functionality).getName;
end;

function TTCoComponentTypeFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoComponentTypeFunctionality(Functionality).getImage;
end;

procedure TTCoComponentTypeFunctionality___GetInstanceListByFileType(Functionality: TFunctionality;   const FileType: WideString; out List: TByteArray); stdcall;
begin
TTCoComponentTypeFunctionality(Functionality).GetInstanceListByFileType(FileType,List);
end;

procedure TTCoComponentTypeFunctionality___GetInstanceListByFileType1(Functionality: TFunctionality;   const FileType: shortstring; out List: TList); stdcall;
begin
TTCoComponentTypeFunctionality(Functionality).GetInstanceListByFileType(FileType,List);
end;


{TCoComponentTypeFunctionality}
procedure TCoComponentTypeFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoComponentTypeFunctionality(Functionality)._ToClone(idClone);
end;

function TCoComponentTypeFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentTypeFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getName;
end;

function TCoComponentTypeFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getHint;
end;

procedure TCoComponentTypeFunctionality___GetDescription(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).GetDescription(Value);
end;

procedure TCoComponentTypeFunctionality___GetDescription1(Functionality: TFunctionality;   Value: TStringList); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).GetDescription(Value);
end;

procedure TCoComponentTypeFunctionality___SetDescription(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).SetDescription(Value);
end;

procedure TCoComponentTypeFunctionality___SetDescription1(Functionality: TFunctionality;   Value: TStringList); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).SetDescription(Value);
end;

procedure TCoComponentTypeFunctionality___GetMarkersList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).GetMarkersList(List);
end;

procedure TCoComponentTypeFunctionality___GetMarkersList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).GetMarkersList(List);
end;

function TCoComponentTypeFunctionality___GetIconImage(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).GetIconImage(oImage);
end;

function TCoComponentTypeFunctionality___GetIconImage1(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).GetIconImage(Image);
end;

procedure TCoComponentTypeFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).setName(Value);
end;

function TCoComponentTypeFunctionality___getUID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getUID;
end;

function TCoComponentTypeFunctionality___getDateCreated(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getDateCreated;
end;

function TCoComponentTypeFunctionality___getFileType(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getFileType;
end;

procedure TCoComponentTypeFunctionality___setFileType(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).setFileType(Value);
end;

function TCoComponentTypeFunctionality___getCoComponentPrototypeID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getCoComponentPrototypeID;
end;

procedure TCoComponentTypeFunctionality___setCoComponentPrototypeID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).setCoComponentPrototypeID(Value);
end;


{TTAddressFunctionality}
function TTAddressFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTAddressFunctionality(Functionality)._CreateInstance;
end;

procedure TTAddressFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTAddressFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTAddressFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTAddressFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTAddressFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTAddressFunctionality(Functionality).getName;
end;

function TTAddressFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTAddressFunctionality(Functionality).getImage;
end;

procedure TTAddressFunctionality___Points_GetTypeNames(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTAddressFunctionality(Functionality).Points_GetTypeNames(List);
end;

procedure TTAddressFunctionality___Points_GetTypeNames1(Functionality: TFunctionality;   out List: TStringList); stdcall;
begin
TTAddressFunctionality(Functionality).Points_GetTypeNames(List);
end;

procedure TTAddressFunctionality___Streets_GetTypeNames(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTAddressFunctionality(Functionality).Streets_GetTypeNames(List);
end;

procedure TTAddressFunctionality___Streets_GetTypeNames1(Functionality: TFunctionality;   out List: TStringList); stdcall;
begin
TTAddressFunctionality(Functionality).Streets_GetTypeNames(List);
end;


{TAddressFunctionality}
procedure TAddressFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TAddressFunctionality(Functionality)._ToClone(idClone);
end;

function TAddressFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TAddressFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAddressFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getName;
end;

function TAddressFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getHint;
end;

function TAddressFunctionality___getIdPoint(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getIdPoint;
end;

procedure TAddressFunctionality___setIdPoint(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TAddressFunctionality(Functionality).setIdPoint(Value);
end;

function TAddressFunctionality___getPoint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getPoint;
end;

function TAddressFunctionality___getIdStreet(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getIdStreet;
end;

procedure TAddressFunctionality___setIdStreet(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TAddressFunctionality(Functionality).setIdStreet(Value);
end;

function TAddressFunctionality___getStreet(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getStreet;
end;

function TAddressFunctionality___getHouse(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getHouse;
end;

procedure TAddressFunctionality___setHouse(Functionality: TFunctionality;   Value: string); stdcall;
begin
TAddressFunctionality(Functionality).setHouse(Value);
end;

function TAddressFunctionality___getCorps(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getCorps;
end;

procedure TAddressFunctionality___setCorps(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TAddressFunctionality(Functionality).setCorps(Value);
end;

function TAddressFunctionality___getApartment(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getApartment;
end;

procedure TAddressFunctionality___setApartment(Functionality: TFunctionality;   Value: string); stdcall;
begin
TAddressFunctionality(Functionality).setApartment(Value);
end;

function TAddressFunctionality___getEntrance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getEntrance;
end;

procedure TAddressFunctionality___setEntrance(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TAddressFunctionality(Functionality).setEntrance(Value);
end;


{TTTransportRouteFunctionality}
function TTTransportRouteFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTransportRouteFunctionality(Functionality)._CreateInstance;
end;

procedure TTTransportRouteFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTransportRouteFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTransportRouteFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTransportRouteFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTransportRouteFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTransportRouteFunctionality(Functionality).getName;
end;

function TTTransportRouteFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTransportRouteFunctionality(Functionality).getImage;
end;

procedure TTTransportRouteFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTTransportRouteFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTTransportRouteFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTTransportRouteFunctionality(Functionality).GetInstanceList(List);
end;


{TTransportRouteFunctionality}
procedure TTransportRouteFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality)._ToClone(idClone);
end;

function TTransportRouteFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportRouteFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getName;
end;

procedure TTransportRouteFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTransportRouteFunctionality(Functionality).setName(Value);
end;

function TTransportRouteFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getHint;
end;

function TTransportRouteFunctionality___getidTTransport(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getidTTransport;
end;

procedure TTransportRouteFunctionality___setidTTransport(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality).setidTTransport(Value);
end;

function TTransportRouteFunctionality___getValid(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getValid;
end;

procedure TTransportRouteFunctionality___setValid(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TTransportRouteFunctionality(Functionality).setValid(Value);
end;

function TTransportRouteFunctionality___getRemarks(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getRemarks;
end;

procedure TTransportRouteFunctionality___setRemarks(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTransportRouteFunctionality(Functionality).setRemarks(Value);
end;

function TTransportRouteFunctionality___IsNodesExist(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).IsNodesExist;
end;

procedure TTransportRouteFunctionality___Nodes_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes_GetList(List);
end;

procedure TTransportRouteFunctionality___Nodes_GetList1(Functionality: TFunctionality;   out List: TRouteNodesList); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes_GetList(List);
end;

function TTransportRouteFunctionality___Nodes_IsNodeExist(Functionality: TFunctionality;   const idNode: integer): boolean; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).Nodes_IsNodeExist(idNode);
end;

procedure TTransportRouteFunctionality___Nodes_ChangeNodeOrder(Functionality: TFunctionality;   const idItem: integer; const Order: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes_ChangeNodeOrder(idItem,Order);
end;

function TTransportRouteFunctionality___Nodes__Node_DistanceBefore(Functionality: TFunctionality;   const idItem: integer): integer; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).Nodes__Node_DistanceBefore(idItem);
end;

procedure TTransportRouteFunctionality___Nodes__Node_SetDistanceBefore(Functionality: TFunctionality;   const idItem: integer; const D: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes__Node_SetDistanceBefore(idItem,D);
end;

function TTransportRouteFunctionality___Nodes__Node_OrderPrice(Functionality: TFunctionality;   const idItem: integer): string; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).Nodes__Node_OrderPrice(idItem);
end;

procedure TTransportRouteFunctionality___Nodes__Node_SetOrderPrice(Functionality: TFunctionality;   const idItem: integer; const Price: string); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes__Node_SetOrderPrice(idItem,Price);
end;

function TTransportRouteFunctionality___Nodes_Insert(Functionality: TFunctionality;   const idNode: integer): integer; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).Nodes_Insert(idNode);
end;

procedure TTransportRouteFunctionality___Nodes_Remove(Functionality: TFunctionality;   const idItem: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes_Remove(idItem);
end;


{TTTransportNodeFunctionality}
function TTTransportNodeFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTransportNodeFunctionality(Functionality)._CreateInstance;
end;

procedure TTTransportNodeFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTransportNodeFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTransportNodeFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTransportNodeFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTransportNodeFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTransportNodeFunctionality(Functionality).getName;
end;

function TTTransportNodeFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTransportNodeFunctionality(Functionality).getImage;
end;

procedure TTTransportNodeFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTTransportNodeFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTTransportNodeFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTTransportNodeFunctionality(Functionality).GetInstanceList(List);
end;


{TTransportNodeFunctionality}
procedure TTransportNodeFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTransportNodeFunctionality(Functionality)._ToClone(idClone);
end;

function TTransportNodeFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportNodeFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).getName;
end;

procedure TTransportNodeFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTransportNodeFunctionality(Functionality).setName(Value);
end;

function TTransportNodeFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).getHint;
end;

function TTransportNodeFunctionality___IsRoutesExist(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).IsRoutesExist;
end;


{TTOfferGoodsFunctionality}
function TTOfferGoodsFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOfferGoodsFunctionality(Functionality)._CreateInstance;
end;

procedure TTOfferGoodsFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTOfferGoodsFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTOfferGoodsFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOfferGoodsFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOfferGoodsFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOfferGoodsFunctionality(Functionality).getName;
end;

function TTOfferGoodsFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOfferGoodsFunctionality(Functionality).getImage;
end;


{TOfferGoodsFunctionality}
procedure TOfferGoodsFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOfferGoodsFunctionality(Functionality)._ToClone(idClone);
end;

function TOfferGoodsFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOfferGoodsFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TOfferGoodsFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getName;
end;

function TOfferGoodsFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getHint;
end;

function TOfferGoodsFunctionality___idOffer(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).idOffer;
end;

function TOfferGoodsFunctionality___getIdGoods(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getIdGoods;
end;

procedure TOfferGoodsFunctionality___setIdGoods(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setIdGoods(Value);
end;

function TOfferGoodsFunctionality___getAmount(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getAmount;
end;

procedure TOfferGoodsFunctionality___setAmount(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setAmount(Value);
end;

function TOfferGoodsFunctionality___getIdMeasureUnit(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getIdMeasureUnit;
end;

procedure TOfferGoodsFunctionality___setIdMeasureUnit(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setIdMeasureUnit(Value);
end;

function TOfferGoodsFunctionality___getMeasureUnit(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getMeasureUnit;
end;

function TOfferGoodsFunctionality___getMinPrice(Functionality: TFunctionality): Currency; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getMinPrice;
end;

procedure TOfferGoodsFunctionality___setMinPrice(Functionality: TFunctionality;   Value: Currency); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setMinPrice(Value);
end;

function TOfferGoodsFunctionality___getMisc(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getMisc;
end;

procedure TOfferGoodsFunctionality___setMisc(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setMisc(Value);
end;


{TTTLFStationTMTFunctionality}
function TTTLFStationTMTFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTLFStationTMTFunctionality(Functionality)._CreateInstance;
end;

procedure TTTLFStationTMTFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTLFStationTMTFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTLFStationTMTFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTLFStationTMTFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTLFStationTMTFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTLFStationTMTFunctionality(Functionality).getName;
end;

function TTTLFStationTMTFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTLFStationTMTFunctionality(Functionality).getImage;
end;

procedure TTTLFStationTMTFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTTLFStationTMTFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTTLFStationTMTFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTTLFStationTMTFunctionality(Functionality).GetInstanceList(List);
end;


{TTLFStationTMTFunctionality}
procedure TTLFStationTMTFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTLFStationTMTFunctionality(Functionality)._ToClone(idClone);
end;

function TTLFStationTMTFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTLFStationTMTFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).getName;
end;

function TTLFStationTMTFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).getHint;
end;

function TTLFStationTMTFunctionality___getHostName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).getHostName;
end;

procedure TTLFStationTMTFunctionality___setHostName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTLFStationTMTFunctionality(Functionality).setHostName(Value);
end;

function TTLFStationTMTFunctionality___getTestChanel(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).getTestChanel;
end;

procedure TTLFStationTMTFunctionality___setTestChanel(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTLFStationTMTFunctionality(Functionality).setTestChanel(Value);
end;


{TTNameFunctionality}
function TTNameFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTNameFunctionality(Functionality)._CreateInstance;
end;

procedure TTNameFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTNameFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTNameFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTNameFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTNameFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTNameFunctionality(Functionality).getName;
end;

function TTNameFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTNameFunctionality(Functionality).getImage;
end;


{TNameFunctionality}
procedure TNameFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TNameFunctionality(Functionality)._ToClone(idClone);
end;

function TNameFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TNameFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TNameFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TNameFunctionality(Functionality).getName;
end;

function TNameFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TNameFunctionality(Functionality).getHint;
end;

function TNameFunctionality___Value(Functionality: TFunctionality): string; stdcall;
begin
Result:=TNameFunctionality(Functionality).Value;
end;

procedure TNameFunctionality___SetValue(Functionality: TFunctionality;   const NewValue: string); stdcall;
begin
TNameFunctionality(Functionality).SetValue(NewValue);
end;


{TTVisualizationFunctionality}
function TTVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality).getName;
end;

function TTVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality).getImage;
end;

function TTVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TVisualizationFunctionality}
procedure TVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).getName;
end;

function TVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).getHint;
end;


{TTHREFVisualizationFunctionality}
function TTHREFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHREFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHREFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHREFVisualizationFunctionality(Functionality).getName;
end;

function TTHREFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHREFVisualizationFunctionality(Functionality).getImage;
end;


{THREFVisualizationFunctionality}
function THREFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=THREFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function THREFVisualizationFunctionality___DoOnOver(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=THREFVisualizationFunctionality(Functionality).DoOnOver;
end;

function THREFVisualizationFunctionality___DoOnClick(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=THREFVisualizationFunctionality(Functionality).DoOnClick;
end;

function THREFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=THREFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function THREFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=THREFVisualizationFunctionality(Functionality).getName;
end;

function THREFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=THREFVisualizationFunctionality(Functionality).getHint;
end;


{TTTTFVisualizationFunctionality}
function TTTTFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTTTFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTTFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality).getName;
end;

function TTTTFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality).getImage;
end;

function TTTTFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TTTFVisualizationFunctionality}
procedure TTTFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTTFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TTTFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TTTFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TTTFVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TTTFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TTTFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTTFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TTTFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).getName;
end;

function TTTFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).getHint;
end;

function TTTFVisualizationFunctionality___getStr(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).getStr;
end;

procedure TTTFVisualizationFunctionality___setStr(Functionality: TFunctionality;   const Value: string); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).setStr(Value);
end;

procedure TTTFVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).GetParams(oStr,oFont_Width,oFont_Height,oFont_Name);
end;

procedure TTTFVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).SetParams(pStr,pFont_Width,pFont_Height,pFont_Name);
end;


{TTObjectFunctionality}
function TTObjectFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTObjectFunctionality(Functionality)._CreateInstance;
end;

procedure TTObjectFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTObjectFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTObjectFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTObjectFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTObjectFunctionality(Functionality).getName;
end;

function TTObjectFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTObjectFunctionality(Functionality).getImage;
end;


{TObjectFunctionality}
procedure TObjectFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TObjectFunctionality(Functionality)._ToClone(idClone);
end;

function TObjectFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TObjectFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TObjectFunctionality(Functionality).getName;
end;

function TObjectFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TObjectFunctionality(Functionality).getHint;
end;


{TTLabelFunctionality}
function TTLabelFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTLabelFunctionality(Functionality)._CreateInstance;
end;

procedure TTLabelFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTLabelFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTLabelFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTLabelFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTLabelFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLabelFunctionality(Functionality).getName;
end;

function TTLabelFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTLabelFunctionality(Functionality).getImage;
end;


{TLabelFunctionality}
procedure TLabelFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TLabelFunctionality(Functionality)._ToClone(idClone);
end;

function TLabelFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TLabelFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLabelFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TLabelFunctionality(Functionality).getName;
end;

function TLabelFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TLabelFunctionality(Functionality).getHint;
end;


{TTStationFunctionality}
function TTStationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTStationFunctionality(Functionality)._CreateInstance;
end;

procedure TTStationFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTStationFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTStationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTStationFunctionality(Functionality).getName;
end;

function TTStationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTStationFunctionality(Functionality).getImage;
end;

function TTStationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTStationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

procedure TTStationFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTStationFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTStationFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTStationFunctionality(Functionality).GetInstanceList(List);
end;


{TStationFunctionality}
procedure TStationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TStationFunctionality(Functionality)._ToClone(idClone);
end;

function TStationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TStationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TStationFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TStationFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TStationFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TStationFunctionality(Functionality).getName;
end;

function TStationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TStationFunctionality(Functionality).getHint;
end;

procedure TStationFunctionality___GetNumbersBound(Functionality: TFunctionality;   out BegNumber,EndNumber: integer); stdcall;
begin
TStationFunctionality(Functionality).GetNumbersBound(BegNumber,EndNumber);
end;


{TTMainLineFunctionality}
function TTMainLineFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMainLineFunctionality(Functionality)._CreateInstance;
end;

procedure TTMainLineFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMainLineFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMainLineFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMainLineFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMainLineFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMainLineFunctionality(Functionality).getName;
end;

function TTMainLineFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMainLineFunctionality(Functionality).getImage;
end;


{TMainLineFunctionality}
procedure TMainLineFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMainLineFunctionality(Functionality)._ToClone(idClone);
end;

function TMainLineFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMainLineFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TMainLineFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).getName;
end;

function TMainLineFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).getHint;
end;

function TMainLineFunctionality___GetSTNOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).GetSTNOwner(idTOwner,idOwner);
end;


{TTDescriptionFunctionality}
function TTDescriptionFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDescriptionFunctionality(Functionality)._CreateInstance;
end;

procedure TTDescriptionFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDescriptionFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDescriptionFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDescriptionFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDescriptionFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTDescriptionFunctionality(Functionality).getName;
end;

function TTDescriptionFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDescriptionFunctionality(Functionality).getImage;
end;


{TDescriptionFunctionality}
procedure TDescriptionFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall;
begin
TDescriptionFunctionality(Functionality).UpdateDATA;
end;

procedure TDescriptionFunctionality___ClearDATA(Functionality: TFunctionality); stdcall;
begin
TDescriptionFunctionality(Functionality).ClearDATA;
end;

procedure TDescriptionFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDescriptionFunctionality(Functionality)._ToClone(idClone);
end;

function TDescriptionFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDescriptionFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDescriptionFunctionality____GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;
begin
Result:=TDescriptionFunctionality(Functionality)._GetDataDocument(DataModel,DataType,flWithComponents,Document);
end;

function TDescriptionFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDescriptionFunctionality(Functionality).getName;
end;

function TDescriptionFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDescriptionFunctionality(Functionality).getHint;
end;

procedure TDescriptionFunctionality___GetValue(Functionality: TFunctionality;   out vText: TByteArray); stdcall;
begin
TDescriptionFunctionality(Functionality).GetValue(vText);
end;

procedure TDescriptionFunctionality___GetValue1(Functionality: TFunctionality;   vText: TStringList); stdcall;
begin
TDescriptionFunctionality(Functionality).GetValue(vText);
end;

procedure TDescriptionFunctionality___SetValue(Functionality: TFunctionality;   NewValue: TByteArray); stdcall;
begin
TDescriptionFunctionality(Functionality).SetValue(NewValue);
end;

procedure TDescriptionFunctionality___SetValue1(Functionality: TFunctionality;   NewValue: TStringList); stdcall;
begin
TDescriptionFunctionality(Functionality).SetValue(NewValue);
end;


{TTImageFunctionality}
function TTImageFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTImageFunctionality(Functionality)._CreateInstance;
end;

procedure TTImageFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTImageFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTImageFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTImageFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTImageFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTImageFunctionality(Functionality).getName;
end;

function TTImageFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTImageFunctionality(Functionality).getImage;
end;


{TImageFunctionality}
procedure TImageFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall;
begin
TImageFunctionality(Functionality).UpdateDATA;
end;

procedure TImageFunctionality___ClearDATA(Functionality: TFunctionality); stdcall;
begin
TImageFunctionality(Functionality).ClearDATA;
end;

procedure TImageFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TImageFunctionality(Functionality)._ToClone(idClone);
end;

procedure TImageFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TImageFunctionality(Functionality).LoadFromFile(FileName);
end;

function TImageFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TImageFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TImageFunctionality____GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;
begin
Result:=TImageFunctionality(Functionality)._GetDataDocument(DataModel,DataType,flWithComponents,Document);
end;

function TImageFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TImageFunctionality(Functionality).getName;
end;

function TImageFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TImageFunctionality(Functionality).getHint;
end;

function TImageFunctionality___GetDATAType(Functionality: TFunctionality): TImageDATAType; stdcall;
begin
Result:=TImageFunctionality(Functionality).GetDATAType;
end;

function TImageFunctionality___GetDATAType1(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TImageFunctionality(Functionality).GetDATAType1;
end;

procedure TImageFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TImageFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TImageFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall;
begin
TImageFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TImageFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall;
begin
TImageFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TImageFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall;
begin
TImageFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TImageFunctionality___GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall;
begin
TImageFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;

procedure TImageFunctionality___GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;
begin
TImageFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;


{TTWellFunctionality}
function TTWellFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTWellFunctionality(Functionality)._CreateInstance;
end;

procedure TTWellFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTWellFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTWellFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTWellFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTWellFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTWellFunctionality(Functionality).getName;
end;

function TTWellFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTWellFunctionality(Functionality).getImage;
end;


{TWellFunctionality}
procedure TWellFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TWellFunctionality(Functionality)._ToClone(idClone);
end;

function TWellFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TWellFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWellFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TWellFunctionality(Functionality).getName;
end;

function TWellFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TWellFunctionality(Functionality).getHint;
end;


{TTTLFFunctionality}
function TTTLFFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTLFFunctionality(Functionality)._CreateInstance;
end;

procedure TTTLFFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTLFFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTLFFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTLFFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTLFFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTLFFunctionality(Functionality).getName;
end;

function TTTLFFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTLFFunctionality(Functionality).getImage;
end;

procedure TTTLFFunctionality___GetIDInstanceByNumber(Functionality: TFunctionality;   out ID: integer; const Number: integer); stdcall;
begin
TTTLFFunctionality(Functionality).GetIDInstanceByNumber(ID,Number);
end;


{TTLFFunctionality}
procedure TTLFFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTLFFunctionality(Functionality)._ToClone(idClone);
end;

function TTLFFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTLFFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTLFFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TTLFFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TTLFFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFFunctionality(Functionality).getName;
end;

function TTLFFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFFunctionality(Functionality).getHint;
end;

function TTLFFunctionality___Number(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTLFFunctionality(Functionality).Number;
end;

function TTLFFunctionality___Kind(Functionality: TFunctionality): TAbonentKind; stdcall;
begin
Result:=TTLFFunctionality(Functionality).Kind;
end;

function TTLFFunctionality___LocalELockExist(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTLFFunctionality(Functionality).LocalELockExist;
end;

function TTLFFunctionality___GlobalELockExist(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTLFFunctionality(Functionality).GlobalELockExist;
end;

function TTLFFunctionality___GetFinishDevice(Functionality: TFunctionality;   out vidTObj,vidObj: integer): boolean; stdcall;
begin
Result:=TTLFFunctionality(Functionality).GetFinishDevice(vidTObj,vidObj);
end;

function TTLFFunctionality___IsDamaged(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTLFFunctionality(Functionality).IsDamaged;
end;

function TTLFFunctionality___idDamage(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTLFFunctionality(Functionality).idDamage;
end;

function TTLFFunctionality___getDamage_TimeNote(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TTLFFunctionality(Functionality).getDamage_TimeNote;
end;

procedure TTLFFunctionality___setDamage_TimeNote(Functionality: TFunctionality;   Value: TDateTime); stdcall;
begin
TTLFFunctionality(Functionality).setDamage_TimeNote(Value);
end;

function TTLFFunctionality___getDamage_Note(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFFunctionality(Functionality).getDamage_Note;
end;

procedure TTLFFunctionality___setDamage_Note(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTLFFunctionality(Functionality).setDamage_Note(Value);
end;

function TTLFFunctionality___getDamage_Measured(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFFunctionality(Functionality).getDamage_Measured;
end;

procedure TTLFFunctionality___setDamage_Measured(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTLFFunctionality(Functionality).setDamage_Measured(Value);
end;

function TTLFFunctionality___getDamage_Acceptor(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFFunctionality(Functionality).getDamage_Acceptor;
end;

procedure TTLFFunctionality___setDamage_Acceptor(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTLFFunctionality(Functionality).setDamage_Acceptor(Value);
end;

function TTLFFunctionality___getDamage_TimeBegRepair(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TTLFFunctionality(Functionality).getDamage_TimeBegRepair;
end;

procedure TTLFFunctionality___setDamage_TimeBegRepair(Functionality: TFunctionality;   Value: TDateTime); stdcall;
begin
TTLFFunctionality(Functionality).setDamage_TimeBegRepair(Value);
end;

function TTLFFunctionality___getDamage_TimeEndRepair(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TTLFFunctionality(Functionality).getDamage_TimeEndRepair;
end;

procedure TTLFFunctionality___setDamage_TimeEndRepair(Functionality: TFunctionality;   Value: TDateTime); stdcall;
begin
TTLFFunctionality(Functionality).setDamage_TimeEndRepair(Value);
end;

function TTLFFunctionality___getDamage_Damage(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFFunctionality(Functionality).getDamage_Damage;
end;

procedure TTLFFunctionality___setDamage_Damage(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTLFFunctionality(Functionality).setDamage_Damage(Value);
end;

function TTLFFunctionality___getDamage_Executor(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFFunctionality(Functionality).getDamage_Executor;
end;

procedure TTLFFunctionality___setDamage_Executor(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTLFFunctionality(Functionality).setDamage_Executor(Value);
end;

function TTLFFunctionality___getDamage_Remarks(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFFunctionality(Functionality).getDamage_Remarks;
end;

procedure TTLFFunctionality___setDamage_Remarks(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTLFFunctionality(Functionality).setDamage_Remarks(Value);
end;

procedure TTLFFunctionality___WriteEvent(Functionality: TFunctionality;   const Event: string; const EventTime: TDateTime); stdcall;
begin
TTLFFunctionality(Functionality).WriteEvent(Event,EventTime);
end;


{TTBoxFunctionality}
function TTBoxFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTBoxFunctionality(Functionality)._CreateInstance;
end;

procedure TTBoxFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTBoxFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTBoxFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTBoxFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTBoxFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTBoxFunctionality(Functionality).getName;
end;

function TTBoxFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTBoxFunctionality(Functionality).getImage;
end;


{TBoxFunctionality}
procedure TBoxFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TBoxFunctionality(Functionality)._ToClone(idClone);
end;

function TBoxFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TBoxFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBoxFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TBoxFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TBoxFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBoxFunctionality(Functionality).getName;
end;

function TBoxFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBoxFunctionality(Functionality).getHint;
end;


{TTCableBoxFunctionality}
function TTCableBoxFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCableBoxFunctionality(Functionality)._CreateInstance;
end;

procedure TTCableBoxFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCableBoxFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCableBoxFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCableBoxFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCableBoxFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCableBoxFunctionality(Functionality).getName;
end;

function TTCableBoxFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCableBoxFunctionality(Functionality).getImage;
end;


{TCableBoxFunctionality}
procedure TCableBoxFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCableBoxFunctionality(Functionality)._ToClone(idClone);
end;

function TCableBoxFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCableBoxFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCableBoxFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCableBoxFunctionality(Functionality).getName;
end;

function TCableBoxFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCableBoxFunctionality(Functionality).getHint;
end;


{TTDistrLineFunctionality}
function TTDistrLineFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDistrLineFunctionality(Functionality)._CreateInstance;
end;

procedure TTDistrLineFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDistrLineFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDistrLineFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDistrLineFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDistrLineFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTDistrLineFunctionality(Functionality).getName;
end;

function TTDistrLineFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDistrLineFunctionality(Functionality).getImage;
end;


{TDistrLineFunctionality}
procedure TDistrLineFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDistrLineFunctionality(Functionality)._ToClone(idClone);
end;

function TDistrLineFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDistrLineFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TDistrLineFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).getName;
end;

function TDistrLineFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).getHint;
end;


{TTClientFunctionality}
function TTClientFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTClientFunctionality(Functionality)._CreateInstance;
end;

procedure TTClientFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTClientFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTClientFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTClientFunctionality(Functionality).getName;
end;

function TTClientFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTClientFunctionality(Functionality).getImage;
end;

function TTClientFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTClientFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

procedure TTClientFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTClientFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTClientFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTClientFunctionality(Functionality).GetInstanceList(List);
end;


{TClientFunctionality}
procedure TClientFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TClientFunctionality(Functionality)._ToClone(idClone);
end;

function TClientFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TClientFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TClientFunctionality___GetDebet(Functionality: TFunctionality;   out Value: Double): boolean; stdcall;
begin
Result:=TClientFunctionality(Functionality).GetDebet(Value);
end;

function TClientFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TClientFunctionality(Functionality).getName;
end;

function TClientFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TClientFunctionality(Functionality).getHint;
end;


{TTHouseFunctionality}
function TTHouseFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHouseFunctionality(Functionality)._CreateInstance;
end;

procedure TTHouseFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTHouseFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTHouseFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHouseFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHouseFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHouseFunctionality(Functionality).getName;
end;

function TTHouseFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHouseFunctionality(Functionality).getImage;
end;


{THouseFunctionality}
procedure THouseFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THouseFunctionality(Functionality)._ToClone(idClone);
end;

function THouseFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THouseFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THouseFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=THouseFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function THouseFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=THouseFunctionality(Functionality).getName;
end;

function THouseFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=THouseFunctionality(Functionality).getHint;
end;


{TTCommNodeFunctionality}
function TTCommNodeFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCommNodeFunctionality(Functionality)._CreateInstance;
end;

procedure TTCommNodeFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCommNodeFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCommNodeFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCommNodeFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCommNodeFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCommNodeFunctionality(Functionality).getName;
end;

function TTCommNodeFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCommNodeFunctionality(Functionality).getImage;
end;


{TCommNodeFunctionality}
procedure TCommNodeFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCommNodeFunctionality(Functionality)._ToClone(idClone);
end;

function TCommNodeFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCommNodeFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCommNodeFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCommNodeFunctionality(Functionality).getName;
end;

function TCommNodeFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCommNodeFunctionality(Functionality).getHint;
end;


{TTCrossFunctionality}
function TTCrossFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCrossFunctionality(Functionality)._CreateInstance;
end;

procedure TTCrossFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCrossFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCrossFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCrossFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCrossFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCrossFunctionality(Functionality).getName;
end;

function TTCrossFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCrossFunctionality(Functionality).getImage;
end;


{TCrossFunctionality}
procedure TCrossFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCrossFunctionality(Functionality)._ToClone(idClone);
end;

function TCrossFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCrossFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCrossFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCrossFunctionality(Functionality).getName;
end;

function TCrossFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCrossFunctionality(Functionality).getHint;
end;


{TTCaseFunctionality}
function TTCaseFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCaseFunctionality(Functionality)._CreateInstance;
end;

procedure TTCaseFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCaseFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCaseFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCaseFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCaseFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCaseFunctionality(Functionality).getName;
end;

function TTCaseFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCaseFunctionality(Functionality).getImage;
end;


{TCaseFunctionality}
procedure TCaseFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCaseFunctionality(Functionality)._ToClone(idClone);
end;

function TCaseFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCaseFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCaseFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCaseFunctionality(Functionality).getName;
end;

function TCaseFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCaseFunctionality(Functionality).getHint;
end;


{TTStreetFunctionality}
function TTStreetFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTStreetFunctionality(Functionality)._CreateInstance;
end;

procedure TTStreetFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTStreetFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTStreetFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTStreetFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTStreetFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTStreetFunctionality(Functionality).getName;
end;

function TTStreetFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTStreetFunctionality(Functionality).getImage;
end;


{TStreetFunctionality}
procedure TStreetFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TStreetFunctionality(Functionality)._ToClone(idClone);
end;

function TStreetFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TStreetFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TStreetFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TStreetFunctionality(Functionality).getName;
end;

function TStreetFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TStreetFunctionality(Functionality).getHint;
end;


{TTOtherObjFunctionality}
function TTOtherObjFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOtherObjFunctionality(Functionality)._CreateInstance;
end;

procedure TTOtherObjFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTOtherObjFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTOtherObjFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOtherObjFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOtherObjFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOtherObjFunctionality(Functionality).getName;
end;

function TTOtherObjFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOtherObjFunctionality(Functionality).getImage;
end;


{TOtherObjFunctionality}
procedure TOtherObjFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOtherObjFunctionality(Functionality)._ToClone(idClone);
end;

function TOtherObjFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOtherObjFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOtherObjFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOtherObjFunctionality(Functionality).getName;
end;

function TOtherObjFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOtherObjFunctionality(Functionality).getHint;
end;


{TTSpanFunctionality}
function TTSpanFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSpanFunctionality(Functionality)._CreateInstance;
end;

procedure TTSpanFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSpanFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSpanFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSpanFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSpanFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTSpanFunctionality(Functionality).getName;
end;

function TTSpanFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSpanFunctionality(Functionality).getImage;
end;


{TSpanFunctionality}
procedure TSpanFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSpanFunctionality(Functionality)._ToClone(idClone);
end;

function TSpanFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSpanFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSpanFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSpanFunctionality(Functionality).getName;
end;

function TSpanFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSpanFunctionality(Functionality).getHint;
end;


{TTChanelFunctionality}
function TTChanelFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTChanelFunctionality(Functionality)._CreateInstance;
end;

procedure TTChanelFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTChanelFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTChanelFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTChanelFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTChanelFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTChanelFunctionality(Functionality).getName;
end;

function TTChanelFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTChanelFunctionality(Functionality).getImage;
end;


{TChanelFunctionality}
procedure TChanelFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TChanelFunctionality(Functionality)._ToClone(idClone);
end;

function TChanelFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TChanelFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TChanelFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TChanelFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TChanelFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TChanelFunctionality(Functionality).getName;
end;

function TChanelFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TChanelFunctionality(Functionality).getHint;
end;


{TTHandHoldFunctionality}
function TTHandHoldFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHandHoldFunctionality(Functionality)._CreateInstance;
end;

procedure TTHandHoldFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTHandHoldFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTHandHoldFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHandHoldFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHandHoldFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHandHoldFunctionality(Functionality).getName;
end;

function TTHandHoldFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHandHoldFunctionality(Functionality).getImage;
end;


{THandHoldFunctionality}
procedure THandHoldFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THandHoldFunctionality(Functionality)._ToClone(idClone);
end;

function THandHoldFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THandHoldFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THandHoldFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=THandHoldFunctionality(Functionality).getName;
end;

function THandHoldFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=THandHoldFunctionality(Functionality).getHint;
end;


{TTLineDistFunctionality}
function TTLineDistFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTLineDistFunctionality(Functionality)._CreateInstance;
end;

procedure TTLineDistFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTLineDistFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTLineDistFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTLineDistFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTLineDistFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLineDistFunctionality(Functionality).getName;
end;

function TTLineDistFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTLineDistFunctionality(Functionality).getImage;
end;


{TLineDistFunctionality}
procedure TLineDistFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TLineDistFunctionality(Functionality)._ToClone(idClone);
end;

function TLineDistFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TLineDistFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLineDistFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TLineDistFunctionality(Functionality).getName;
end;

function TLineDistFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TLineDistFunctionality(Functionality).getHint;
end;


{TTMuffFunctionality}
function TTMuffFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMuffFunctionality(Functionality)._CreateInstance;
end;

procedure TTMuffFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMuffFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMuffFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMuffFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMuffFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMuffFunctionality(Functionality).getName;
end;

function TTMuffFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMuffFunctionality(Functionality).getImage;
end;


{TMuffFunctionality}
procedure TMuffFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMuffFunctionality(Functionality)._ToClone(idClone);
end;

function TMuffFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMuffFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMuffFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMuffFunctionality(Functionality).getName;
end;

function TMuffFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMuffFunctionality(Functionality).getHint;
end;


{TTOfferFunctionality}
function TTOfferFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOfferFunctionality(Functionality)._CreateInstance;
end;

procedure TTOfferFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTOfferFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTOfferFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOfferFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOfferFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOfferFunctionality(Functionality).getName;
end;

function TTOfferFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOfferFunctionality(Functionality).getImage;
end;

function TTOfferFunctionality___GetOfferByHumanID(Functionality: TFunctionality;   const HumanID: integer; out idOffer: integer): boolean; stdcall;
begin
Result:=TTOfferFunctionality(Functionality).GetOfferByHumanID(HumanID,idOffer);
end;


{TOfferFunctionality}
procedure TOfferFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOfferFunctionality(Functionality)._ToClone(idClone);
end;

function TOfferFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOfferFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOfferFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TOfferFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TOfferFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getName;
end;

procedure TOfferFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOfferFunctionality(Functionality).setName(Value);
end;

function TOfferFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getHint;
end;

function TOfferFunctionality___getSchedule(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getSchedule;
end;

procedure TOfferFunctionality___setSchedule(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOfferFunctionality(Functionality).setSchedule(Value);
end;

function TOfferFunctionality___getPassword(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getPassword;
end;

procedure TOfferFunctionality___setPassword(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOfferFunctionality(Functionality).setPassword(Value);
end;

function TOfferFunctionality___getContactTLF(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getContactTLF;
end;

procedure TOfferFunctionality___setContactTLF(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOfferFunctionality(Functionality).setContactTLF(Value);
end;

function TOfferFunctionality___getLastUpdated(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getLastUpdated;
end;

procedure TOfferFunctionality___setLastUpdated(Functionality: TFunctionality;   Value: TDateTime); stdcall;
begin
TOfferFunctionality(Functionality).setLastUpdated(Value);
end;

procedure TOfferFunctionality___LoadDATAFromStream(Functionality: TFunctionality;   Stream: TByteArray); stdcall;
begin
TOfferFunctionality(Functionality).LoadDATAFromStream(Stream);
end;

procedure TOfferFunctionality___LoadDATAFromStream1(Functionality: TFunctionality;   Stream: TStream); stdcall;
begin
TOfferFunctionality(Functionality).LoadDATAFromStream(Stream);
end;

function TOfferFunctionality___UserID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferFunctionality(Functionality).UserID;
end;

function TOfferFunctionality___UID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferFunctionality(Functionality).UID;
end;

function TOfferFunctionality___AddressStr(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferFunctionality(Functionality).AddressStr;
end;

function TOfferFunctionality___Goods_Insert(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferFunctionality(Functionality).Goods_Insert;
end;

procedure TOfferFunctionality___Goods_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TOfferFunctionality(Functionality).Goods_GetList(List);
end;

procedure TOfferFunctionality___Goods_GetList1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TOfferFunctionality(Functionality).Goods_GetList(List);
end;

procedure TOfferFunctionality___Goods_Remove(Functionality: TFunctionality;   const idOfferGoods: integer); stdcall;
begin
TOfferFunctionality(Functionality).Goods_Remove(idOfferGoods);
end;

procedure TOfferFunctionality___Goods_Clear(Functionality: TFunctionality); stdcall;
begin
TOfferFunctionality(Functionality).Goods_Clear;
end;


{TTDemandFunctionality}
function TTDemandFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDemandFunctionality(Functionality)._CreateInstance;
end;

procedure TTDemandFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDemandFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDemandFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDemandFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDemandFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTDemandFunctionality(Functionality).getName;
end;

function TTDemandFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDemandFunctionality(Functionality).getImage;
end;


{TDemandFunctionality}
procedure TDemandFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDemandFunctionality(Functionality)._ToClone(idClone);
end;

function TDemandFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDemandFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDemandFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TDemandFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TDemandFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDemandFunctionality(Functionality).getName;
end;

function TDemandFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDemandFunctionality(Functionality).getHint;
end;


{TTCommLineFunctionality}
function TTCommLineFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCommLineFunctionality(Functionality)._CreateInstance;
end;

procedure TTCommLineFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCommLineFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCommLineFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCommLineFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCommLineFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCommLineFunctionality(Functionality).getName;
end;

function TTCommLineFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCommLineFunctionality(Functionality).getImage;
end;


{TCommLineFunctionality}
procedure TCommLineFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCommLineFunctionality(Functionality)._ToClone(idClone);
end;

function TCommLineFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCommLineFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TCommLineFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).getName;
end;

function TCommLineFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).getHint;
end;


{TTGoodsFunctionality}
function TTGoodsFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality)._CreateInstance;
end;

procedure TTGoodsFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGoodsFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGoodsFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGoodsFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality).getName;
end;

function TTGoodsFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality).getImage;
end;

procedure TTGoodsFunctionality___GetInstanceListContainingContext(Functionality: TFunctionality;   const Context: string; out List: TByteArray); stdcall;
begin
TTGoodsFunctionality(Functionality).GetInstanceListContainingContext(Context,List);
end;

procedure TTGoodsFunctionality___GetInstanceListContainingContext1(Functionality: TFunctionality;   const Context: string; out List: TStringList); stdcall;
begin
TTGoodsFunctionality(Functionality).GetInstanceListContainingContext(Context,List);
end;

function TTGoodsFunctionality___IsInstanceExist(Functionality: TFunctionality;   const pName: string; out idGoods: integer): boolean; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality).IsInstanceExist(pName,idGoods);
end;


{TGoodsFunctionality}
procedure TGoodsFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TGoodsFunctionality(Functionality)._ToClone(idClone);
end;

function TGoodsFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGoodsFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).getName;
end;

procedure TGoodsFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGoodsFunctionality(Functionality).setName(Value);
end;

function TGoodsFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).getHint;
end;

function TGoodsFunctionality___StdAmount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).StdAmount;
end;

function TGoodsFunctionality___StdMeasureUnit(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).StdMeasureUnit;
end;


{TTCollectionFunctionality}
function TTCollectionFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCollectionFunctionality(Functionality)._CreateInstance;
end;

procedure TTCollectionFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCollectionFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCollectionFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCollectionFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCollectionFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCollectionFunctionality(Functionality).getName;
end;

function TTCollectionFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCollectionFunctionality(Functionality).getImage;
end;


{TCollectionFunctionality}
procedure TCollectionFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCollectionFunctionality(Functionality)._ToClone(idClone);
end;

function TCollectionFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCollectionFunctionality___getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).getName;
end;

procedure TCollectionFunctionality___setName(Functionality: TFunctionality;   const Value: string); stdcall;
begin
TCollectionFunctionality(Functionality).setName(Value);
end;

function TCollectionFunctionality___getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).getHint;
end;

function TCollectionFunctionality___InsertItem(Functionality: TFunctionality;   const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).InsertItem(idTItem,idItem,Alias,ListOrder);
end;

procedure TCollectionFunctionality___RemoveItem(Functionality: TFunctionality;   const id: integer); stdcall;
begin
TCollectionFunctionality(Functionality).RemoveItem(id);
end;

procedure TCollectionFunctionality___Item_ChangeAlias(Functionality: TFunctionality;   const id: integer; const pAlias: string); stdcall;
begin
TCollectionFunctionality(Functionality).Item_ChangeAlias(id,pAlias);
end;

procedure TCollectionFunctionality___Item_ChangeListOrder(Functionality: TFunctionality;   const id: integer; const Order: integer); stdcall;
begin
TCollectionFunctionality(Functionality).Item_ChangeListOrder(id,Order);
end;

procedure TCollectionFunctionality___RemoveItems(Functionality: TFunctionality); stdcall;
begin
TCollectionFunctionality(Functionality).RemoveItems;
end;

function TCollectionFunctionality___IsItemExist(Functionality: TFunctionality;   const idTItem,idItem: integer): boolean; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).IsItemExist(idTItem,idItem);
end;

procedure TCollectionFunctionality___GetListItems(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TCollectionFunctionality(Functionality).GetListItems(List);
end;

procedure TCollectionFunctionality___GetListItems1(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TCollectionFunctionality(Functionality).GetListItems(List);
end;

procedure TCollectionFunctionality___SaveListItems(Functionality: TFunctionality;   const List: TByteArray); stdcall;
begin
TCollectionFunctionality(Functionality).SaveListItems(List);
end;

procedure TCollectionFunctionality___SaveListItems1(Functionality: TFunctionality;   List: TList); stdcall;
begin
TCollectionFunctionality(Functionality).SaveListItems(List);
end;


