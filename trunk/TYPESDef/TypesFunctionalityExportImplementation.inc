//. the export routines

{TTTileServerVisualizationFunctionality}
function TTTileServerVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTileServerVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTTileServerVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTileServerVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTileServerVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTileServerVisualizationFunctionality(Functionality).getName;
end;

function TTTileServerVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTileServerVisualizationFunctionality(Functionality).getImage;
end;

function TTTileServerVisualizationFunctionality__CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTTileServerVisualizationFunctionality(Functionality).CheckImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTTileServerVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTTileServerVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TTileServerVisualizationFunctionality}
procedure TTileServerVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TTileServerVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TTileServerVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TTileServerVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TTileServerVisualizationFunctionality__ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).ReflectOnCanvas(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TTileServerVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTileServerVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).DATASize;
end;

procedure TTileServerVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetParams(pWidth,pHeight);
end;

procedure TTileServerVisualizationFunctionality__SetProportion(Functionality: TFunctionality;   const Value: double); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetProportion(Value);
end;

procedure TTileServerVisualizationFunctionality__Clear(Functionality: TFunctionality); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Clear;
end;

function TTileServerVisualizationFunctionality__GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).GetSegmentsStorageType;
end;

procedure TTileServerVisualizationFunctionality__SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetSegmentsStorageType(Value);
end;

function TTileServerVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).ContainerFilled;
end;

procedure TTileServerVisualizationFunctionality__GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GetLevelsInfoLocally(Info);
end;

function TTileServerVisualizationFunctionality__TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).TLevelsPropsPanel_Create;
end;

procedure TTileServerVisualizationFunctionality__Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_ConvertPixPosToXY(idLevel,PixX,PixY,X,Y);
end;

procedure TTileServerVisualizationFunctionality__Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_ConvertXYToPixPos(idLevel,X,Y,PixX,PixY);
end;

function TTileServerVisualizationFunctionality__UserData_GetTileProviderID(Functionality: TFunctionality;   out oTileProviderID: integer): boolean; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).UserData_GetTileProviderID(oTileProviderID);
end;

procedure TTileServerVisualizationFunctionality__UserData_SetTileProviderID(Functionality: TFunctionality;   const pTileProviderID: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).UserData_SetTileProviderID(pTileProviderID);
end;

function TTileServerVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TTileServerVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).getName;
end;

function TTileServerVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTileServerVisualizationFunctionality(Functionality).getHint;
end;

procedure TTileServerVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GetParams(oWidth,oHeight);
end;

procedure TTileServerVisualizationFunctionality__GetParams1(Functionality: TFunctionality;   out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GetParams(oServerType,oServerURL,oServerData,oTileProviderID,oWidth,oHeight);
end;

procedure TTileServerVisualizationFunctionality__SetServerType(Functionality: TFunctionality;   const Value: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetServerType(Value);
end;

procedure TTileServerVisualizationFunctionality__SetServerURL(Functionality: TFunctionality;   const Value: string); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetServerURL(Value);
end;

procedure TTileServerVisualizationFunctionality__SetServerData(Functionality: TFunctionality;   const pData: TMemoryStream); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetServerData(pData);
end;

procedure TTileServerVisualizationFunctionality__SetServerData1(Functionality: TFunctionality;   const Data: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).SetServerData(Data);
end;

procedure TTileServerVisualizationFunctionality__GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GenerateFromImage(DATAStream);
end;

procedure TTileServerVisualizationFunctionality__GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GenerateFromTiles(TilesFolder,SizePowerOf2);
end;

procedure TTileServerVisualizationFunctionality__RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).RegenerateRegionFromLevel(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TTileServerVisualizationFunctionality__RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).RegenerateRegion(XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TTileServerVisualizationFunctionality__AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).AddNewLevelAndRegenerate;
end;

procedure TTileServerVisualizationFunctionality__GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GetLevelsInfo(Info);
end;

procedure TTileServerVisualizationFunctionality__Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_GetParams(idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TTileServerVisualizationFunctionality__Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_SetParams(idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TTileServerVisualizationFunctionality__Level_GetSegments(Functionality: TFunctionality;   const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_GetSegments(TileProviderID,idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
end;

procedure TTileServerVisualizationFunctionality__Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_GetSegmentsByIDs(idLevel,SegmentsIDs,Segments);
end;

procedure TTileServerVisualizationFunctionality__Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_GetSegmentsHashes(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
end;

procedure TTileServerVisualizationFunctionality__Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).Level_SetSegments(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
end;

procedure TTileServerVisualizationFunctionality__GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
begin
TTileServerVisualizationFunctionality(Functionality).GetCoordinates(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;


{TTMeasurementObjectFunctionality}
function TTMeasurementObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality)._CreateInstance;
end;

procedure TTMeasurementObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMeasurementObjectFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMeasurementObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMeasurementObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).getName;
end;

function TTMeasurementObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).getImage;
end;

function TTMeasurementObjectFunctionality__CreateNewInstance(Functionality: TFunctionality;   const pName: string; const pDomains: string): integer; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).CreateNewInstance(pName,pDomains);
end;

function TTMeasurementObjectFunctionality__CreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).CreateInstanceByGUID(pGUID,pName,pDomains);
end;

function TTMeasurementObjectFunctionality__CheckCreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).CheckCreateInstanceByGUID(pGUID,pName,pDomains);
end;

procedure TTMeasurementObjectFunctionality__GetInstanceListByNameContext(Functionality: TFunctionality;   const pName: string; out List: TByteArray); stdcall;
begin
TTMeasurementObjectFunctionality(Functionality).GetInstanceListByNameContext(pName,List);
end;

procedure TTMeasurementObjectFunctionality__GetInstanceDataByNameContext(Functionality: TFunctionality;   const pName: string; const Version: integer; out oData: TByteArray); stdcall;
begin
TTMeasurementObjectFunctionality(Functionality).GetInstanceDataByNameContext(pName,Version,oData);
end;

function TTMeasurementObjectFunctionality__GetInstanceByGUID(Functionality: TFunctionality;   const pGUID: string): integer; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).GetInstanceByGUID(pGUID);
end;

function TTMeasurementObjectFunctionality__GetInstanceByGSOMeasurement(Functionality: TFunctionality;   const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer; stdcall;
begin
Result:=TTMeasurementObjectFunctionality(Functionality).GetInstanceByGSOMeasurement(pidGeographServerObject,pMeasurementTimeID);
end;


{TMeasurementObjectFunctionality}
procedure TMeasurementObjectFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMeasurementObjectFunctionality(Functionality)._ToClone(idClone);
end;

function TMeasurementObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMeasurementObjectFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMeasurementObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMeasurementObjectFunctionality(Functionality).getName;
end;

procedure TMeasurementObjectFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).setName(Value);
end;

function TMeasurementObjectFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMeasurementObjectFunctionality(Functionality).getHint;
end;

function TMeasurementObjectFunctionality__getGUID(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMeasurementObjectFunctionality(Functionality).getGUID;
end;

function TMeasurementObjectFunctionality__getDomains(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMeasurementObjectFunctionality(Functionality).getDomains;
end;

procedure TMeasurementObjectFunctionality__setDomains(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).setDomains(Value);
end;

procedure TMeasurementObjectFunctionality__GetParams(Functionality: TFunctionality;   out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GetParams(oGUID,oidOwner,oName,oDomains);
end;

procedure TMeasurementObjectFunctionality__GSOMeasurements_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GSOMeasurements_GetList(List);
end;

procedure TMeasurementObjectFunctionality__GSOMeasurements_GetData(Functionality: TFunctionality;   const Version: integer; out oData: TByteArray); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GSOMeasurements_GetData(Version,oData);
end;

procedure TMeasurementObjectFunctionality__GSOMeasurements_Item_GetParams(Functionality: TFunctionality;   const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GSOMeasurements_Item_GetParams(idMeasurement,oTimeID,oidGeographServerObject,oDataType);
end;

procedure TMeasurementObjectFunctionality__GSOMeasurements_Item_GetParams1(Functionality: TFunctionality;   const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GSOMeasurements_Item_GetParams(TimeID,oidGeographServerObject,oDataType);
end;

procedure TMeasurementObjectFunctionality__GSOMeasurements_Item_GetData(Functionality: TFunctionality;   const idMeasurement: integer; out oData: TByteArray); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GSOMeasurements_Item_GetData(idMeasurement,oData);
end;

procedure TMeasurementObjectFunctionality__GSOMeasurements_Item_GetData1(Functionality: TFunctionality;   const TimeID: Double; out oData: TByteArray); stdcall;
begin
TMeasurementObjectFunctionality(Functionality).GSOMeasurements_Item_GetData(TimeID,oData);
end;


{TTAreaNotificationServerFunctionality}
function TTAreaNotificationServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTAreaNotificationServerFunctionality(Functionality)._CreateInstance;
end;

procedure TTAreaNotificationServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTAreaNotificationServerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTAreaNotificationServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTAreaNotificationServerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTAreaNotificationServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTAreaNotificationServerFunctionality(Functionality).getName;
end;

function TTAreaNotificationServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTAreaNotificationServerFunctionality(Functionality).getImage;
end;


{TAreaNotificationServerFunctionality}
procedure TAreaNotificationServerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TAreaNotificationServerFunctionality(Functionality)._ToClone(idClone);
end;

function TAreaNotificationServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TAreaNotificationServerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAreaNotificationServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAreaNotificationServerFunctionality(Functionality).getName;
end;

procedure TAreaNotificationServerFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TAreaNotificationServerFunctionality(Functionality).setName(Value);
end;

function TAreaNotificationServerFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAreaNotificationServerFunctionality(Functionality).getHint;
end;

function TAreaNotificationServerFunctionality__getInfo(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAreaNotificationServerFunctionality(Functionality).getInfo;
end;

procedure TAreaNotificationServerFunctionality__setInfo(Functionality: TFunctionality;   Value: string); stdcall;
begin
TAreaNotificationServerFunctionality(Functionality).setInfo(Value);
end;


{TTMODELServerVisualizationFunctionality}
function TTMODELServerVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMODELServerVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTMODELServerVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMODELServerVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMODELServerVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMODELServerVisualizationFunctionality(Functionality).getName;
end;

function TTMODELServerVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMODELServerVisualizationFunctionality(Functionality).getImage;
end;

function TTMODELServerVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTMODELServerVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TMODELServerVisualizationFunctionality}
procedure TMODELServerVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMODELServerVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TMODELServerVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TMODELServerVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TMODELServerVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TMODELServerVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMODELServerVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TMODELServerVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TMODELServerVisualizationFunctionality__ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).ReflectOnCanvas(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TMODELServerVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TMODELServerVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TMODELServerVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).getName;
end;

function TMODELServerVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).getHint;
end;

function TMODELServerVisualizationFunctionality__getServerURL(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerVisualizationFunctionality(Functionality).getServerURL;
end;

procedure TMODELServerVisualizationFunctionality__setServerURL(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELServerVisualizationFunctionality(Functionality).setServerURL(Value);
end;


{TTDoubleVarFunctionality}
function TTDoubleVarFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDoubleVarFunctionality(Functionality)._CreateInstance;
end;

procedure TTDoubleVarFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDoubleVarFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDoubleVarFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDoubleVarFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDoubleVarFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTDoubleVarFunctionality(Functionality).getName;
end;

function TTDoubleVarFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDoubleVarFunctionality(Functionality).getImage;
end;


{TDoubleVarFunctionality}
procedure TDoubleVarFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDoubleVarFunctionality(Functionality)._ToClone(idClone);
end;

function TDoubleVarFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDoubleVarFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDoubleVarFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDoubleVarFunctionality(Functionality).getName;
end;

function TDoubleVarFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDoubleVarFunctionality(Functionality).getHint;
end;

function TDoubleVarFunctionality__getValue(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TDoubleVarFunctionality(Functionality).getValue;
end;

procedure TDoubleVarFunctionality__setValue(Functionality: TFunctionality;   _Value: Double); stdcall;
begin
TDoubleVarFunctionality(Functionality).setValue(_Value);
end;

function TDoubleVarFunctionality__getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TDoubleVarFunctionality(Functionality).getSetTimeStamp;
end;


{TTInt32VarFunctionality}
function TTInt32VarFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTInt32VarFunctionality(Functionality)._CreateInstance;
end;

procedure TTInt32VarFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTInt32VarFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTInt32VarFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTInt32VarFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTInt32VarFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTInt32VarFunctionality(Functionality).getName;
end;

function TTInt32VarFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTInt32VarFunctionality(Functionality).getImage;
end;


{TInt32VarFunctionality}
procedure TInt32VarFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TInt32VarFunctionality(Functionality)._ToClone(idClone);
end;

function TInt32VarFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TInt32VarFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TInt32VarFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TInt32VarFunctionality(Functionality).getName;
end;

function TInt32VarFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TInt32VarFunctionality(Functionality).getHint;
end;

function TInt32VarFunctionality__getValue(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TInt32VarFunctionality(Functionality).getValue;
end;

procedure TInt32VarFunctionality__setValue(Functionality: TFunctionality;   _Value: integer); stdcall;
begin
TInt32VarFunctionality(Functionality).setValue(_Value);
end;

function TInt32VarFunctionality__getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TInt32VarFunctionality(Functionality).getSetTimeStamp;
end;


{TTURLFunctionality}
function TTURLFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTURLFunctionality(Functionality)._CreateInstance;
end;

procedure TTURLFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTURLFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTURLFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTURLFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTURLFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTURLFunctionality(Functionality).getName;
end;

function TTURLFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTURLFunctionality(Functionality).getImage;
end;


{TURLFunctionality}
procedure TURLFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall;
begin
TURLFunctionality(Functionality).UpdateDATA;
end;

procedure TURLFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TURLFunctionality(Functionality)._ToClone(idClone);
end;

function TURLFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TURLFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TURLFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TURLFunctionality(Functionality).getName;
end;

function TURLFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TURLFunctionality(Functionality).getHint;
end;

function TURLFunctionality__getURL(Functionality: TFunctionality): string; stdcall;
begin
Result:=TURLFunctionality(Functionality).getURL;
end;

procedure TURLFunctionality__setURL(Functionality: TFunctionality;   Value: string); stdcall;
begin
TURLFunctionality(Functionality).setURL(Value);
end;

function TURLFunctionality__getURLName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TURLFunctionality(Functionality).getURLName;
end;

procedure TURLFunctionality__setURLName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TURLFunctionality(Functionality).setURLName(Value);
end;

function TURLFunctionality__getflPanelBrowser(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TURLFunctionality(Functionality).getflPanelBrowser;
end;

procedure TURLFunctionality__setflPanelBrowser(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TURLFunctionality(Functionality).setflPanelBrowser(Value);
end;

procedure TURLFunctionality__GetParams(Functionality: TFunctionality;   out oURL: string; out oURLName: string; out oflPanelBrowser: boolean); stdcall;
begin
TURLFunctionality(Functionality).GetParams(oURL,oURLName,oflPanelBrowser);
end;

procedure TURLFunctionality__SetParams(Functionality: TFunctionality;   const pURL: string; const pURLName: string; const pflPanelBrowser: boolean); stdcall;
begin
TURLFunctionality(Functionality).SetParams(pURL,pURLName,pflPanelBrowser);
end;


{TTPatternVisualizationFunctionality}
function TTPatternVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTPatternVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTPatternVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTPatternVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTPatternVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTPatternVisualizationFunctionality(Functionality).getName;
end;

function TTPatternVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTPatternVisualizationFunctionality(Functionality).getImage;
end;

function TTPatternVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTPatternVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TPatternVisualizationFunctionality}
procedure TPatternVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TPatternVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TPatternVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TPatternVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TPatternVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TPatternVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPatternVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).DATASize;
end;

function TPatternVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TPatternVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).getName;
end;

function TPatternVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).getHint;
end;

procedure TPatternVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TPatternVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TPatternVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

function TPatternVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TPatternVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TPatternVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TPatternVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TPatternVisualizationFunctionality(Functionality).DATAFile_Clear;
end;


{TTMapFormatObjectFunctionality}
function TTMapFormatObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMapFormatObjectFunctionality(Functionality)._CreateInstance;
end;

procedure TTMapFormatObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMapFormatObjectFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMapFormatObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMapFormatObjectFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMapFormatObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMapFormatObjectFunctionality(Functionality).getName;
end;

function TTMapFormatObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMapFormatObjectFunctionality(Functionality).getImage;
end;

procedure TTMapFormatObjectFunctionality__GetInstanceNames(Functionality: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); stdcall;
begin
TTMapFormatObjectFunctionality(Functionality).GetInstanceNames(IDs,IDs_Offset,IDs_Size,Names);
end;

function TTMapFormatObjectFunctionality__GetDATAHash(Functionality: TFunctionality;   DATAStream: TMemoryStream): integer; stdcall;
begin
Result:=TTMapFormatObjectFunctionality(Functionality).GetDATAHash(DATAStream);
end;

function TTMapFormatObjectFunctionality__GetDATAHash1(Functionality: TFunctionality;   DATAStream: TByteArray): integer; stdcall;
begin
Result:=TTMapFormatObjectFunctionality(Functionality).GetDATAHash(DATAStream);
end;


{TMapFormatObjectFunctionality}
procedure TMapFormatObjectFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMapFormatObjectFunctionality(Functionality)._ToClone(idClone);
end;

function TMapFormatObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMapFormatObjectFunctionality__DATAPanel_Create(Functionality: TFunctionality): TForm; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).DATAPanel_Create;
end;

function TMapFormatObjectFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TMapFormatObjectFunctionality___GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality)._GetDataDocument(DataModel,DataType,flWithComponents,Document);
end;

function TMapFormatObjectFunctionality__GetHintInfo(Functionality: TFunctionality;   const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).GetHintInfo(InfoType,InfoFormat,HintInfo);
end;

function TMapFormatObjectFunctionality__getidMap(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).getidMap;
end;

procedure TMapFormatObjectFunctionality__setidMap(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).setidMap(Value);
end;

function TMapFormatObjectFunctionality__getFormatID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).getFormatID;
end;

procedure TMapFormatObjectFunctionality__setFormatID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).setFormatID(Value);
end;

function TMapFormatObjectFunctionality__getKindID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).getKindID;
end;

procedure TMapFormatObjectFunctionality__setKindID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).setKindID(Value);
end;

function TMapFormatObjectFunctionality__getTypeID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).getTypeID;
end;

procedure TMapFormatObjectFunctionality__setTypeID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).setTypeID(Value);
end;

function TMapFormatObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).getName;
end;

procedure TMapFormatObjectFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).setName(Value);
end;

procedure TMapFormatObjectFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TMapFormatObjectFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TMapFormatObjectFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TMapFormatObjectFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).SetDATA(DATAStream);
end;

function TMapFormatObjectFunctionality__getDATAHash(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatObjectFunctionality(Functionality).getDATAHash;
end;

procedure TMapFormatObjectFunctionality__setDATAHash(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).setDATAHash(Value);
end;

procedure TMapFormatObjectFunctionality__GetParams(Functionality: TFunctionality;   out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).GetParams(oidMap,oFormatID,oKindID,oTypeID,oName);
end;

procedure TMapFormatObjectFunctionality__SetParams(Functionality: TFunctionality;   const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).SetParams(pidMap,pFormatID,pKindID,pTypeID,pName);
end;

procedure TMapFormatObjectFunctionality__SetObjectByDATA(Functionality: TFunctionality); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).SetObjectByDATA;
end;

procedure TMapFormatObjectFunctionality__UpdateDATAHash(Functionality: TFunctionality); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).UpdateDATAHash;
end;

procedure TMapFormatObjectFunctionality__Compile(Functionality: TFunctionality); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).Compile;
end;

procedure TMapFormatObjectFunctionality__Build(Functionality: TFunctionality;   const flUsePrototype: boolean); stdcall;
begin
TMapFormatObjectFunctionality(Functionality).Build(flUsePrototype);
end;


{TTMapFormatMapFunctionality}
function TTMapFormatMapFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMapFormatMapFunctionality(Functionality)._CreateInstance;
end;

procedure TTMapFormatMapFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMapFormatMapFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMapFormatMapFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMapFormatMapFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMapFormatMapFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMapFormatMapFunctionality(Functionality).getName;
end;

function TTMapFormatMapFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMapFormatMapFunctionality(Functionality).getImage;
end;

procedure TTMapFormatMapFunctionality__GetInstanceListByGeoSpace(Functionality: TFunctionality;   const idGeoSpace: integer; out List: TByteArray); stdcall;
begin
TTMapFormatMapFunctionality(Functionality).GetInstanceListByGeoSpace(idGeoSpace,List);
end;


{TMapFormatMapFunctionality}
procedure TMapFormatMapFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMapFormatMapFunctionality(Functionality)._ToClone(idClone);
end;

function TMapFormatMapFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMapFormatMapFunctionality__getGeoSpaceID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).getGeoSpaceID;
end;

procedure TMapFormatMapFunctionality__setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatMapFunctionality(Functionality).setGeoSpaceID(Value);
end;

function TMapFormatMapFunctionality__getFormatID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).getFormatID;
end;

procedure TMapFormatMapFunctionality__setFormatID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMapFormatMapFunctionality(Functionality).setFormatID(Value);
end;

function TMapFormatMapFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).getName;
end;

procedure TMapFormatMapFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMapFormatMapFunctionality(Functionality).setName(Value);
end;

procedure TMapFormatMapFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TMapFormatMapFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality__GetObjectPrototypesDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetObjectPrototypesDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality__GetObjectPrototypesDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetObjectPrototypesDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality__SetObjectPrototypesDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TMapFormatMapFunctionality(Functionality).SetObjectPrototypesDATA(DATAStream);
end;

procedure TMapFormatMapFunctionality__SetObjectPrototypesDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).SetObjectPrototypesDATA(DATAStream);
end;

function TMapFormatMapFunctionality__GetObjectPrototype(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).GetObjectPrototype(KindID,TypeID,PrototypeID,LayID);
end;

procedure TMapFormatMapFunctionality__GetParams(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oFormatID: integer; out oName: string); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetParams(oGeoSpaceID,oFormatID,oName);
end;

procedure TMapFormatMapFunctionality__SetParams(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pFormatID: integer; const pName: string); stdcall;
begin
TMapFormatMapFunctionality(Functionality).SetParams(pGeoSpaceID,pFormatID,pName);
end;

function TMapFormatMapFunctionality__ObjectsCounter(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).ObjectsCounter;
end;

procedure TMapFormatMapFunctionality__GetObjectsList(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetObjectsList(List);
end;

procedure TMapFormatMapFunctionality__GetObjectsList1(Functionality: TFunctionality;   const KindID: integer; out List: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetObjectsList(KindID,List);
end;

procedure TMapFormatMapFunctionality__GetObjectsList2(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out List: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetObjectsList(KindID,TypeID,List);
end;

procedure TMapFormatMapFunctionality__GetObjectsList3(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).GetObjectsList(KindID,TypeID,NameContext,List);
end;

function TMapFormatMapFunctionality__GetObject(Functionality: TFunctionality;   const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).GetObject(DATAHash,idMapFormatObject);
end;

function TMapFormatMapFunctionality__GetObject1(Functionality: TFunctionality;   const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall;
begin
Result:=TMapFormatMapFunctionality(Functionality).GetObject(KindID,DATAHash,idMapFormatObject);
end;

procedure TMapFormatMapFunctionality__ExportMap(Functionality: TFunctionality;   const pFormatID: integer; out ZipData: TByteArray); stdcall;
begin
TMapFormatMapFunctionality(Functionality).ExportMap(pFormatID,ZipData);
end;

procedure TMapFormatMapFunctionality__RemoveObjects(Functionality: TFunctionality); stdcall;
begin
TMapFormatMapFunctionality(Functionality).RemoveObjects;
end;

procedure TMapFormatMapFunctionality__RemoveObjects1(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer); stdcall;
begin
TMapFormatMapFunctionality(Functionality).RemoveObjects(KindID,TypeID);
end;

procedure TMapFormatMapFunctionality__UpdateObjectDATAHashes(Functionality: TFunctionality); stdcall;
begin
TMapFormatMapFunctionality(Functionality).UpdateObjectDATAHashes;
end;

procedure TMapFormatMapFunctionality__RecalculateMapArea(Functionality: TFunctionality); stdcall;
begin
TMapFormatMapFunctionality(Functionality).RecalculateMapArea;
end;

procedure TMapFormatMapFunctionality__RemoveIrrelevantObjectsInMapArea(Functionality: TFunctionality); stdcall;
begin
TMapFormatMapFunctionality(Functionality).RemoveIrrelevantObjectsInMapArea;
end;


{TTSPLVisualizationFunctionality}
function TTSPLVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSPLVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTSPLVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSPLVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSPLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTSPLVisualizationFunctionality(Functionality).getName;
end;

function TTSPLVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSPLVisualizationFunctionality(Functionality).getImage;
end;

function TTSPLVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTSPLVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TSPLVisualizationFunctionality}
procedure TSPLVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSPLVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TSPLVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TSPLVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TSPLVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSPLVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TSPLVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TSPLVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TSPLVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSPLVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSPLVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TSPLVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TSPLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSPLVisualizationFunctionality(Functionality).getName;
end;

function TSPLVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSPLVisualizationFunctionality(Functionality).getHint;
end;

procedure TSPLVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out SPLType: integer; out SPLDATA: TByteArray); stdcall;
begin
TSPLVisualizationFunctionality(Functionality).GetParams(SPLType,SPLDATA);
end;

procedure TSPLVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const SPLType: integer; const SPLDATA: TByteArray); stdcall;
begin
TSPLVisualizationFunctionality(Functionality).SetParams(SPLType,SPLDATA);
end;


{TTBoolVarFunctionality}
function TTBoolVarFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTBoolVarFunctionality(Functionality)._CreateInstance;
end;

procedure TTBoolVarFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTBoolVarFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTBoolVarFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTBoolVarFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTBoolVarFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTBoolVarFunctionality(Functionality).getName;
end;

function TTBoolVarFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTBoolVarFunctionality(Functionality).getImage;
end;


{TBoolVarFunctionality}
procedure TBoolVarFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TBoolVarFunctionality(Functionality)._ToClone(idClone);
end;

function TBoolVarFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TBoolVarFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBoolVarFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBoolVarFunctionality(Functionality).getName;
end;

function TBoolVarFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBoolVarFunctionality(Functionality).getHint;
end;

function TBoolVarFunctionality__getValue(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TBoolVarFunctionality(Functionality).getValue;
end;

procedure TBoolVarFunctionality__setValue(Functionality: TFunctionality;   _Value: boolean); stdcall;
begin
TBoolVarFunctionality(Functionality).setValue(_Value);
end;

function TBoolVarFunctionality__getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TBoolVarFunctionality(Functionality).getSetTimeStamp;
end;


{TTGeoSpaceFunctionality}
function TTGeoSpaceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeoSpaceFunctionality(Functionality)._CreateInstance;
end;

procedure TTGeoSpaceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGeoSpaceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGeoSpaceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGeoSpaceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGeoSpaceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTGeoSpaceFunctionality(Functionality).getName;
end;

function TTGeoSpaceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGeoSpaceFunctionality(Functionality).getImage;
end;


{TGeoSpaceFunctionality}
procedure TGeoSpaceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TGeoSpaceFunctionality(Functionality)._ToClone(idClone);
end;

function TGeoSpaceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGeoSpaceFunctionality__GetDatumIDLocally(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).GetDatumIDLocally;
end;

function TGeoSpaceFunctionality__ConvertGeoToXYLocally(Functionality: TFunctionality;   const Lat,Long: Extended; out Xr,Yr: Extended): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).ConvertGeoToXYLocally(Lat,Long,Xr,Yr);
end;

function TGeoSpaceFunctionality__ConvertXYToGeoLocally(Functionality: TFunctionality;   const X,Y: Extended; out Lat,Long: Extended): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).ConvertXYToGeoLocally(X,Y,Lat,Long);
end;

function TGeoSpaceFunctionality__GetDistanceBetweenTwoXYPointsLocally(Functionality: TFunctionality;   const X0,Y0,X1,Y1: Extended; out Distance: Extended): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).GetDistanceBetweenTwoXYPointsLocally(X0,Y0,X1,Y1,Distance);
end;

function TGeoSpaceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).getName;
end;

procedure TGeoSpaceFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoSpaceFunctionality(Functionality).setName(Value);
end;

function TGeoSpaceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).getHint;
end;

function TGeoSpaceFunctionality__getDatumID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).getDatumID;
end;

procedure TGeoSpaceFunctionality__setDatumID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeoSpaceFunctionality(Functionality).setDatumID(Value);
end;

function TGeoSpaceFunctionality__getProjectionID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).getProjectionID;
end;

procedure TGeoSpaceFunctionality__setProjectionID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeoSpaceFunctionality(Functionality).setProjectionID(Value);
end;

function TGeoSpaceFunctionality__ConvertXYToLatLong(Functionality: TFunctionality;   const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).ConvertXYToLatLong(X,Y,Latitude,Longitude);
end;

function TGeoSpaceFunctionality__ConvertXYToDatumLatLong(Functionality: TFunctionality;   const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).ConvertXYToDatumLatLong(X,Y,pDatumID,Latitude,Longitude);
end;

function TGeoSpaceFunctionality__ConvertLatLongToXY(Functionality: TFunctionality;   const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).ConvertLatLongToXY(Latitude,Longitude,X,Y);
end;

function TGeoSpaceFunctionality__ConvertDatumLatLongToXY(Functionality: TFunctionality;   const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall;
begin
Result:=TGeoSpaceFunctionality(Functionality).ConvertDatumLatLongToXY(pDatumID,Latitude,Longitude,X,Y);
end;

procedure TGeoSpaceFunctionality__GetGeoCrdSystemList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TGeoSpaceFunctionality(Functionality).GetGeoCrdSystemList(List);
end;

procedure TGeoSpaceFunctionality__GetGeoCrdSystemList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TGeoSpaceFunctionality(Functionality).GetGeoCrdSystemList(List);
end;

procedure TGeoSpaceFunctionality__GetMapFormatMapList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TGeoSpaceFunctionality(Functionality).GetMapFormatMapList(List);
end;

procedure TGeoSpaceFunctionality__GetMapFormatMapList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TGeoSpaceFunctionality(Functionality).GetMapFormatMapList(List);
end;

procedure TGeoSpaceFunctionality__GetMapFormatMapObjectsByNameContext(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TList); stdcall;
begin
TGeoSpaceFunctionality(Functionality).GetMapFormatMapObjectsByNameContext(pFormatID,pKindID,pTypeID,NameContext,List);
end;

procedure TGeoSpaceFunctionality__GetMapFormatMapObjectsByNameContext1(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray); stdcall;
begin
TGeoSpaceFunctionality(Functionality).GetMapFormatMapObjectsByNameContext(pFormatID,pKindID,pTypeID,NameContext,List);
end;


{TTUserAlertFunctionality}
function TTUserAlertFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTUserAlertFunctionality(Functionality)._CreateInstance;
end;

procedure TTUserAlertFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTUserAlertFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTUserAlertFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTUserAlertFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTUserAlertFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTUserAlertFunctionality(Functionality).getName;
end;

function TTUserAlertFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTUserAlertFunctionality(Functionality).getImage;
end;

procedure TTUserAlertFunctionality__GetActiveInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTUserAlertFunctionality(Functionality).GetActiveInstanceList(List);
end;

procedure TTUserAlertFunctionality__GetActiveInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTUserAlertFunctionality(Functionality).GetActiveInstanceList(List);
end;


{TUserAlertFunctionality}
procedure TUserAlertFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TUserAlertFunctionality(Functionality)._ToClone(idClone);
end;

function TUserAlertFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TUserAlertFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getName;
end;

function TUserAlertFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getHint;
end;

function TUserAlertFunctionality__getUserID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getUserID;
end;

procedure TUserAlertFunctionality__setUserID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TUserAlertFunctionality(Functionality).setUserID(Value);
end;

function TUserAlertFunctionality__getTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getTimeStamp;
end;

procedure TUserAlertFunctionality__setTimeStamp(Functionality: TFunctionality;   Value: TDateTime); stdcall;
begin
TUserAlertFunctionality(Functionality).setTimeStamp(Value);
end;

function TUserAlertFunctionality__getActive(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getActive;
end;

procedure TUserAlertFunctionality__setActive(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TUserAlertFunctionality(Functionality).setActive(Value);
end;

function TUserAlertFunctionality__getAlertID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getAlertID;
end;

procedure TUserAlertFunctionality__setAlertID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TUserAlertFunctionality(Functionality).setAlertID(Value);
end;

function TUserAlertFunctionality__getSeverity(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getSeverity;
end;

procedure TUserAlertFunctionality__setSeverity(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TUserAlertFunctionality(Functionality).setSeverity(Value);
end;

function TUserAlertFunctionality__getDescription(Functionality: TFunctionality): string; stdcall;
begin
Result:=TUserAlertFunctionality(Functionality).getDescription;
end;

procedure TUserAlertFunctionality__setDescription(Functionality: TFunctionality;   Value: string); stdcall;
begin
TUserAlertFunctionality(Functionality).setDescription(Value);
end;

procedure TUserAlertFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TUserAlertFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TUserAlertFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TUserAlertFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TUserAlertFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TUserAlertFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TUserAlertFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TUserAlertFunctionality(Functionality).SetDATA(DATAStream);
end;


{TTGeoGraphServerObjectFunctionality}
function TTGeoGraphServerObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeoGraphServerObjectFunctionality(Functionality)._CreateInstance;
end;

procedure TTGeoGraphServerObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGeoGraphServerObjectFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGeoGraphServerObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGeoGraphServerObjectFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGeoGraphServerObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTGeoGraphServerObjectFunctionality(Functionality).getName;
end;

function TTGeoGraphServerObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGeoGraphServerObjectFunctionality(Functionality).getImage;
end;

function TTGeoGraphServerObjectFunctionality__GetInstanceByServerObject(Functionality: TFunctionality;   const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean; stdcall;
begin
Result:=TTGeoGraphServerObjectFunctionality(Functionality).GetInstanceByServerObject(pGeoGraphServerID,pObjectID,idInstance);
end;


{TGeoGraphServerObjectFunctionality}
procedure TGeoGraphServerObjectFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality)._ToClone(idClone);
end;

function TGeoGraphServerObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TGeoGraphServerObjectFunctionality__AttachObject(Functionality: TFunctionality); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).AttachObject;
end;

procedure TGeoGraphServerObjectFunctionality__DetachObject(Functionality: TFunctionality); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).DetachObject;
end;

function TGeoGraphServerObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).getName;
end;

function TGeoGraphServerObjectFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).getHint;
end;

function TGeoGraphServerObjectFunctionality__getGeoGraphServerID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).getGeoGraphServerID;
end;

procedure TGeoGraphServerObjectFunctionality__setGeoGraphServerID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).setGeoGraphServerID(Value);
end;

function TGeoGraphServerObjectFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).getObjectID;
end;

procedure TGeoGraphServerObjectFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).setObjectID(Value);
end;

function TGeoGraphServerObjectFunctionality__getBusinessModelID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).getBusinessModelID;
end;

procedure TGeoGraphServerObjectFunctionality__setBusinessModelID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).setBusinessModelID(Value);
end;

function TGeoGraphServerObjectFunctionality__getDomains(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).getDomains;
end;

procedure TGeoGraphServerObjectFunctionality__setDomains(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).setDomains(Value);
end;

procedure TGeoGraphServerObjectFunctionality__GetParams(Functionality: TFunctionality;   out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).GetParams(oGeoGraphServerID,oObjectID,oObjectType,oBusinessModel);
end;

procedure TGeoGraphServerObjectFunctionality__ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).ExecuteOperation(InData,OutData);
end;

function TGeoGraphServerObjectFunctionality__GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).GetVisualizationComponent(idTVisualization,idVisualization);
end;

function TGeoGraphServerObjectFunctionality__GetNearestMapFormatObjects(Functionality: TFunctionality;   const MaxDistance: double; out List: TByteArray): boolean; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).GetNearestMapFormatObjects(MaxDistance,List);
end;

function TGeoGraphServerObjectFunctionality__GetNearestMapFormatObjectsNames(Functionality: TFunctionality;   const MaxDistance: double; out Names: WideString): boolean; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).GetNearestMapFormatObjectsNames(MaxDistance,Names);
end;

function TGeoGraphServerObjectFunctionality__Measurements_AddNew(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).Measurements_AddNew(pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pData);
end;

function TGeoGraphServerObjectFunctionality__Measurements_AddNew1(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer; stdcall;
begin
Result:=TGeoGraphServerObjectFunctionality(Functionality).Measurements_AddNew(pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pDataSource,pData);
end;

procedure TGeoGraphServerObjectFunctionality__Measurements_Remove(Functionality: TFunctionality;   const pidMeasurement: integer); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).Measurements_Remove(pidMeasurement);
end;

procedure TGeoGraphServerObjectFunctionality__Measurements_Item_UpdateData(Functionality: TFunctionality;   const pTimeID: Double; const pData: TByteArray); stdcall;
begin
TGeoGraphServerObjectFunctionality(Functionality).Measurements_Item_UpdateData(pTimeID,pData);
end;


{TTGeoGraphServerFunctionality}
function TTGeoGraphServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeoGraphServerFunctionality(Functionality)._CreateInstance;
end;

procedure TTGeoGraphServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGeoGraphServerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGeoGraphServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGeoGraphServerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGeoGraphServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTGeoGraphServerFunctionality(Functionality).getName;
end;

function TTGeoGraphServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGeoGraphServerFunctionality(Functionality).getImage;
end;

procedure TTGeoGraphServerFunctionality__GetActiveInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTGeoGraphServerFunctionality(Functionality).GetActiveInstanceList(List);
end;

procedure TTGeoGraphServerFunctionality__GetActiveInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTGeoGraphServerFunctionality(Functionality).GetActiveInstanceList(List);
end;

function TTGeoGraphServerFunctionality__GetInstanceForRegistration(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeoGraphServerFunctionality(Functionality).GetInstanceForRegistration;
end;


{TGeoGraphServerFunctionality}
procedure TGeoGraphServerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality)._ToClone(idClone);
end;

function TGeoGraphServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TGeoGraphServerFunctionality__SetData(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).SetData(DATAStream);
end;

function TGeoGraphServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).getName;
end;

procedure TGeoGraphServerFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).setName(Value);
end;

function TGeoGraphServerFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).getHint;
end;

function TGeoGraphServerFunctionality__getAddress(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).getAddress;
end;

procedure TGeoGraphServerFunctionality__setAddress(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).setAddress(Value);
end;

function TGeoGraphServerFunctionality__getInternalAddress(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).getInternalAddress;
end;

procedure TGeoGraphServerFunctionality__setInternalAddress(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).setInternalAddress(Value);
end;

function TGeoGraphServerFunctionality__getInfo(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).getInfo;
end;

procedure TGeoGraphServerFunctionality__setInfo(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).setInfo(Value);
end;

procedure TGeoGraphServerFunctionality__GetData(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).GetData(DATAStream);
end;

procedure TGeoGraphServerFunctionality__GetData1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).GetData(DATAStream);
end;

function TGeoGraphServerFunctionality__RegisterObject(Functionality: TFunctionality;   const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).RegisterObject(ObjectName,VisualizationType,VisualizationID,GeoCrdSystemID,HintID);
end;

function TGeoGraphServerFunctionality__RegisterObject1(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).RegisterObject(ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,GeoCrdSystemID,HintID);
end;

function TGeoGraphServerFunctionality__RegisterObject2(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).RegisterObject(ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality__UnRegisterObject(Functionality: TFunctionality;   const ObjectID: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).UnRegisterObject(ObjectID);
end;

function TGeoGraphServerFunctionality__ObjectCounter(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).ObjectCounter;
end;

procedure TGeoGraphServerFunctionality__ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).ExecuteOperation(InData,OutData);
end;

procedure TGeoGraphServerFunctionality__Object_GetProperties(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_GetProperties(ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
end;

procedure TGeoGraphServerFunctionality__Object_GetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_GetProperties(ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality__Object_SetProperties(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_SetProperties(ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
end;

procedure TGeoGraphServerFunctionality__Object_SetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_SetProperties(ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

function TGeoGraphServerFunctionality__Object_GetObjectType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).Object_GetObjectType(ObjectID);
end;

procedure TGeoGraphServerFunctionality__Object_SetObjectType(Functionality: TFunctionality;   const ObjectID: integer; const ObjectType: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_SetObjectType(ObjectID,ObjectType);
end;

function TGeoGraphServerFunctionality__Object_GetBusinessType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).Object_GetBusinessType(ObjectID);
end;

procedure TGeoGraphServerFunctionality__Object_SetBusinessType(Functionality: TFunctionality;   const ObjectID: integer; const BusinessType: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_SetBusinessType(ObjectID,BusinessType);
end;

function TGeoGraphServerFunctionality__Object_GetComponentID(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).Object_GetComponentID(ObjectID);
end;

procedure TGeoGraphServerFunctionality__Object_SetComponentID(Functionality: TFunctionality;   const ObjectID: integer; const ObjectComponentID: integer); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_SetComponentID(ObjectID,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality__Object_ExecuteOperation(Functionality: TFunctionality;   const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray); stdcall;
begin
TGeoGraphServerFunctionality(Functionality).Object_ExecuteOperation(ObjectID,InData,OutData);
end;

function TGeoGraphServerFunctionality__DataID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoGraphServerFunctionality(Functionality).DataID;
end;


{TTGeoCrdSystemFunctionality}
function TTGeoCrdSystemFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeoCrdSystemFunctionality(Functionality)._CreateInstance;
end;

procedure TTGeoCrdSystemFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGeoCrdSystemFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGeoCrdSystemFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGeoCrdSystemFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTGeoCrdSystemFunctionality(Functionality).getName;
end;

function TTGeoCrdSystemFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGeoCrdSystemFunctionality(Functionality).getImage;
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceByLatLongLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceByLatLongLocally(pGeoSpaceID,pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceByLatLongLocally1(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceByLatLongLocally(pLatitude,pLongitude,oGeoSpaceID,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceByXYLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceByXYLocally(pGeoSpaceID,pX,pY,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceByXYLocally1(Functionality: TFunctionality;   const pX,pY: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceByXYLocally(pX,pY,oGeoSpaceID,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceByLatLong(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceByLatLong(pGeoSpaceID,pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceByXY(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall;
begin
TTGeoCrdSystemFunctionality(Functionality).GetInstanceByXY(pGeoSpaceID,pX,pY,idCrdSys);
end;


{TGeoCrdSystemFunctionality}
procedure TGeoCrdSystemFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality)._ToClone(idClone);
end;

function TGeoCrdSystemFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGeoCrdSystemFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TGeoCrdSystemFunctionality__GetDataLocally(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oName: string; out oDatum: string; out oProjection: string; out oProjectionData: TMemoryStream); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).GetDataLocally(oGeoSpaceID,oName,oDatum,oProjection,oProjectionData);
end;

procedure TGeoCrdSystemFunctionality__GetGeodesyPointsLocally(Functionality: TFunctionality;   out Points: TByteArray); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).GetGeodesyPointsLocally(Points);
end;

function TGeoCrdSystemFunctionality__getGeoSpaceID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeoCrdSystemFunctionality(Functionality).getGeoSpaceID;
end;

procedure TGeoCrdSystemFunctionality__setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).setGeoSpaceID(Value);
end;

function TGeoCrdSystemFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoCrdSystemFunctionality(Functionality).getName;
end;

procedure TGeoCrdSystemFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).setName(Value);
end;

function TGeoCrdSystemFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoCrdSystemFunctionality(Functionality).getHint;
end;

function TGeoCrdSystemFunctionality__getDatum(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoCrdSystemFunctionality(Functionality).getDatum;
end;

procedure TGeoCrdSystemFunctionality__setDatum(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).setDatum(Value);
end;

function TGeoCrdSystemFunctionality__getProjection(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeoCrdSystemFunctionality(Functionality).getProjection;
end;

procedure TGeoCrdSystemFunctionality__setProjection(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).setProjection(Value);
end;

procedure TGeoCrdSystemFunctionality__GetProjectionDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).GetProjectionDATA(DATAStream);
end;

procedure TGeoCrdSystemFunctionality__GetProjectionDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).GetProjectionDATA(DATAStream);
end;

procedure TGeoCrdSystemFunctionality__SetProjectionDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).SetProjectionDATA(DATAStream);
end;

procedure TGeoCrdSystemFunctionality__SetProjectionDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).SetProjectionDATA(DATAStream);
end;

procedure TGeoCrdSystemFunctionality__GetGeodesyPoints(Functionality: TFunctionality;   out Points: TByteArray); stdcall;
begin
TGeoCrdSystemFunctionality(Functionality).GetGeodesyPoints(Points);
end;


{TTFilterVisualizationFunctionality}
function TTFilterVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTFilterVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTFilterVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTFilterVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTFilterVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTFilterVisualizationFunctionality(Functionality).getName;
end;

function TTFilterVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTFilterVisualizationFunctionality(Functionality).getImage;
end;

function TTFilterVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTFilterVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TFilterVisualizationFunctionality}
procedure TFilterVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TFilterVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TFilterVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TFilterVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TFilterVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TFilterVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TFilterVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TFilterVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TFilterVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TFilterVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TFilterVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TFilterVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TFilterVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TFilterVisualizationFunctionality(Functionality).getName;
end;

function TFilterVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TFilterVisualizationFunctionality(Functionality).getHint;
end;

procedure TFilterVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out FilterType: integer; out FilterDATA: TByteArray); stdcall;
begin
TFilterVisualizationFunctionality(Functionality).GetParams(FilterType,FilterDATA);
end;

procedure TFilterVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const FilterType: integer; const FilterDATA: TByteArray); stdcall;
begin
TFilterVisualizationFunctionality(Functionality).SetParams(FilterType,FilterDATA);
end;


{TTHINTVisualizationFunctionality}
function TTHINTVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHINTVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTHINTVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHINTVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHINTVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHINTVisualizationFunctionality(Functionality).getName;
end;

function TTHINTVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHINTVisualizationFunctionality(Functionality).getImage;
end;

function TTHINTVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTHINTVisualizationFunctionality(Functionality).StdObjectVisualization;
end;

procedure TTHINTVisualizationFunctionality__GetInstanceParams(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall;
begin
TTHINTVisualizationFunctionality(Functionality).GetInstanceParams(IDs,MaxInstanceSize,Params);
end;

procedure TTHINTVisualizationFunctionality__GetInstanceParams1(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall;
begin
TTHINTVisualizationFunctionality(Functionality).GetInstanceParams1(IDs,MaxInstanceSize,Params);
end;

procedure TTHINTVisualizationFunctionality__GetInstanceOwnerDatasAndParams(Functionality: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray); stdcall;
begin
TTHINTVisualizationFunctionality(Functionality).GetInstanceOwnerDatasAndParams(IDs,DataFlags,MaxInstanceSize,Data,Params);
end;


{THINTVisualizationFunctionality}
procedure THINTVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure THINTVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
THINTVisualizationFunctionality(Functionality).DestroyData;
end;

procedure THINTVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure THINTVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
THINTVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function THINTVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function THINTVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THINTVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).DATASize;
end;

function THINTVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function THINTVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).getName;
end;

function THINTVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).getHint;
end;

procedure THINTVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure THINTVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure THINTVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
THINTVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality__GetPrivateDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetPrivateDATA(DATAStream);
end;

procedure THINTVisualizationFunctionality__GetPrivateDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetPrivateDATA(DATAStream,MaxSize);
end;

procedure THINTVisualizationFunctionality__GetPrivateDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetPrivateDATA(DATAStream);
end;

procedure THINTVisualizationFunctionality__GetPrivateDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).GetPrivateDATA(DATAStream,MaxSize);
end;

procedure THINTVisualizationFunctionality__SetPrivateDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
THINTVisualizationFunctionality(Functionality).SetPrivateDATA(DATAStream);
end;

procedure THINTVisualizationFunctionality__SetPrivateDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
THINTVisualizationFunctionality(Functionality).SetPrivateDATA(DATAStream);
end;

function THINTVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=THINTVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure THINTVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
THINTVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure THINTVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
THINTVisualizationFunctionality(Functionality).DATAFile_Clear;
end;


{TTDetailedPictureVisualizationFunctionality}
function TTDetailedPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDetailedPictureVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTDetailedPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDetailedPictureVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDetailedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTDetailedPictureVisualizationFunctionality(Functionality).getName;
end;

function TTDetailedPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDetailedPictureVisualizationFunctionality(Functionality).getImage;
end;

function TTDetailedPictureVisualizationFunctionality__CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTDetailedPictureVisualizationFunctionality(Functionality).CheckImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTDetailedPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTDetailedPictureVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TDetailedPictureVisualizationFunctionality}
procedure TDetailedPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TDetailedPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TDetailedPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TDetailedPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TDetailedPictureVisualizationFunctionality__ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).ReflectOnCanvas(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TDetailedPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDetailedPictureVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).DATASize;
end;

procedure TDetailedPictureVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).SetParams(pWidth,pHeight);
end;

procedure TDetailedPictureVisualizationFunctionality__SetProportion(Functionality: TFunctionality;   const Value: double); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).SetProportion(Value);
end;

procedure TDetailedPictureVisualizationFunctionality__Clear(Functionality: TFunctionality); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Clear;
end;

function TDetailedPictureVisualizationFunctionality__GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).GetSegmentsStorageType;
end;

procedure TDetailedPictureVisualizationFunctionality__SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).SetSegmentsStorageType(Value);
end;

function TDetailedPictureVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).ContainerFilled;
end;

procedure TDetailedPictureVisualizationFunctionality__GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).GetLevelsInfoLocally(Info);
end;

function TDetailedPictureVisualizationFunctionality__TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).TLevelsPropsPanel_Create;
end;

procedure TDetailedPictureVisualizationFunctionality__Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_ConvertPixPosToXY(idLevel,PixX,PixY,X,Y);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_ConvertXYToPixPos(idLevel,X,Y,PixX,PixY);
end;

function TDetailedPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TDetailedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).getName;
end;

function TDetailedPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDetailedPictureVisualizationFunctionality(Functionality).getHint;
end;

procedure TDetailedPictureVisualizationFunctionality__GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).GenerateFromImage(DATAStream);
end;

procedure TDetailedPictureVisualizationFunctionality__GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).GenerateFromTiles(TilesFolder,SizePowerOf2);
end;

procedure TDetailedPictureVisualizationFunctionality__RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).RegenerateRegionFromLevel(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TDetailedPictureVisualizationFunctionality__RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).RegenerateRegion(XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TDetailedPictureVisualizationFunctionality__AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).AddNewLevelAndRegenerate;
end;

procedure TDetailedPictureVisualizationFunctionality__GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).GetLevelsInfo(Info);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_GetParams(idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_SetParams(idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_GetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_GetSegments(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_GetSegmentsByIDs(idLevel,SegmentsIDs,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_GetSegmentsHashes(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).Level_SetSegments(idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).GetParams(oWidth,oHeight);
end;

procedure TDetailedPictureVisualizationFunctionality__GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
begin
TDetailedPictureVisualizationFunctionality(Functionality).GetCoordinates(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;


{TTCoVisualizationFunctionality}
function TTCoVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTCoVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCoVisualizationFunctionality(Functionality).getName;
end;

function TTCoVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoVisualizationFunctionality(Functionality).getImage;
end;

function TTCoVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTCoVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TCoVisualizationFunctionality}
procedure TCoVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TCoVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TCoVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TCoVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TCoVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TCoVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TCoVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TCoVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).DATASize;
end;

procedure TCoVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality;   out oContainer: TExtendedContainerCoord); stdcall;
begin
TCoVisualizationFunctionality(Functionality).UpdateContainer(oContainer);
end;

procedure TCoVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TCoVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

function TCoVisualizationFunctionality__GetOwnSpaceHINTVisualizationLocally(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).GetOwnSpaceHINTVisualizationLocally(idHINTVisualization);
end;

procedure TCoVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoVisualizationFunctionality(Functionality).ToClone(idClone);
end;

function TCoVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TCoVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).getName;
end;

function TCoVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).getHint;
end;

procedure TCoVisualizationFunctionality__GetSpace(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;
begin
TCoVisualizationFunctionality(Functionality).GetSpace(DATAStream);
end;

procedure TCoVisualizationFunctionality__GetSpace1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall;
begin
TCoVisualizationFunctionality(Functionality).GetSpace(DATAStream,MaxSize);
end;

procedure TCoVisualizationFunctionality__GetSpace2(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;
begin
TCoVisualizationFunctionality(Functionality).GetSpace(DATAStream);
end;

procedure TCoVisualizationFunctionality__GetSpace3(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall;
begin
TCoVisualizationFunctionality(Functionality).GetSpace(DATAStream,MaxSize);
end;

procedure TCoVisualizationFunctionality__SetSpace(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TCoVisualizationFunctionality(Functionality).SetSpace(DATAStream);
end;

procedure TCoVisualizationFunctionality__SetSpace1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TCoVisualizationFunctionality(Functionality).SetSpace(DATAStream);
end;

function TCoVisualizationFunctionality__GetOwnSpaceHINTVisualization(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).GetOwnSpaceHINTVisualization(idHINTVisualization);
end;

function TCoVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TCoVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TCoVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TCoVisualizationFunctionality__Pack(Functionality: TFunctionality); stdcall;
begin
TCoVisualizationFunctionality(Functionality).Pack;
end;

procedure TCoVisualizationFunctionality__UnPack(Functionality: TFunctionality); stdcall;
begin
TCoVisualizationFunctionality(Functionality).UnPack;
end;

function TCoVisualizationFunctionality__IsPacked(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TCoVisualizationFunctionality(Functionality).IsPacked;
end;


{TTForumMessageFunctionality}
function TTForumMessageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTForumMessageFunctionality(Functionality)._CreateInstance;
end;

procedure TTForumMessageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTForumMessageFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTForumMessageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTForumMessageFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTForumMessageFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTForumMessageFunctionality(Functionality).getName;
end;

function TTForumMessageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTForumMessageFunctionality(Functionality).getImage;
end;


{TForumMessageFunctionality}
procedure TForumMessageFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall;
begin
TForumMessageFunctionality(Functionality).UpdateDATA;
end;

procedure TForumMessageFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TForumMessageFunctionality(Functionality)._ToClone(idClone);
end;

function TForumMessageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TForumMessageFunctionality__FunctionalityUserID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).FunctionalityUserID;
end;

procedure TForumMessageFunctionality__setidUser(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TForumMessageFunctionality(Functionality).setidUser(Value);
end;

procedure TForumMessageFunctionality__Modified(Functionality: TFunctionality); stdcall;
begin
TForumMessageFunctionality(Functionality).Modified;
end;

function TForumMessageFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).getName;
end;

function TForumMessageFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).getHint;
end;

function TForumMessageFunctionality__getidForum(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).getidForum;
end;

procedure TForumMessageFunctionality__setidForum(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TForumMessageFunctionality(Functionality).setidForum(Value);
end;

function TForumMessageFunctionality__idUser(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).idUser;
end;

procedure TForumMessageFunctionality__Send(Functionality: TFunctionality); stdcall;
begin
TForumMessageFunctionality(Functionality).Send;
end;

function TForumMessageFunctionality__SentTime(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).SentTime;
end;

function TForumMessageFunctionality__getidForMessage(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).getidForMessage;
end;

procedure TForumMessageFunctionality__setidForMessage(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TForumMessageFunctionality(Functionality).setidForMessage(Value);
end;

function TForumMessageFunctionality__LastModified(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).LastModified;
end;

procedure TForumMessageFunctionality__GetMessage(Functionality: TFunctionality;   out Message: TMemoryStream); stdcall;
begin
TForumMessageFunctionality(Functionality).GetMessage(Message);
end;

procedure TForumMessageFunctionality__GetMessage1(Functionality: TFunctionality;   out Message: TByteArray); stdcall;
begin
TForumMessageFunctionality(Functionality).GetMessage(Message);
end;

procedure TForumMessageFunctionality__SetMessage(Functionality: TFunctionality;   const Message: TMemoryStream); stdcall;
begin
TForumMessageFunctionality(Functionality).SetMessage(Message);
end;

procedure TForumMessageFunctionality__SetMessage1(Functionality: TFunctionality;   const Message: TByteArray); stdcall;
begin
TForumMessageFunctionality(Functionality).SetMessage(Message);
end;

function TForumMessageFunctionality__ReplyMessageCount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumMessageFunctionality(Functionality).ReplyMessageCount;
end;

procedure TForumMessageFunctionality__GetReplyMessageList(Functionality: TFunctionality;   out MessageList: TList); stdcall;
begin
TForumMessageFunctionality(Functionality).GetReplyMessageList(MessageList);
end;

procedure TForumMessageFunctionality__GetReplyMessageList1(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall;
begin
TForumMessageFunctionality(Functionality).GetReplyMessageList(MessageList);
end;


{TTForumFunctionality}
function TTForumFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTForumFunctionality(Functionality)._CreateInstance;
end;

procedure TTForumFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTForumFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTForumFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTForumFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTForumFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTForumFunctionality(Functionality).getName;
end;

function TTForumFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTForumFunctionality(Functionality).getImage;
end;


{TForumFunctionality}
procedure TForumFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TForumFunctionality(Functionality)._ToClone(idClone);
end;

function TForumFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TForumFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TForumFunctionality__DeleteOldMessages(Functionality: TFunctionality;   const pMessageLifeTime: TDateTime); stdcall;
begin
TForumFunctionality(Functionality).DeleteOldMessages(pMessageLifeTime);
end;

function TForumFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TForumFunctionality(Functionality).getName;
end;

procedure TForumFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TForumFunctionality(Functionality).setName(Value);
end;

function TForumFunctionality__getMessageLifeTime(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TForumFunctionality(Functionality).getMessageLifeTime;
end;

procedure TForumFunctionality__setMessageLifeTime(Functionality: TFunctionality;   Value: TDateTime); stdcall;
begin
TForumFunctionality(Functionality).setMessageLifeTime(Value);
end;

function TForumFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TForumFunctionality(Functionality).getHint;
end;

function TForumFunctionality__RootMessageCount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumFunctionality(Functionality).RootMessageCount;
end;

procedure TForumFunctionality__GetRootMessageList(Functionality: TFunctionality;   out MessageList: TList); stdcall;
begin
TForumFunctionality(Functionality).GetRootMessageList(MessageList);
end;

procedure TForumFunctionality__GetRootMessageList1(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall;
begin
TForumFunctionality(Functionality).GetRootMessageList(MessageList);
end;

function TForumFunctionality__MessageCount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TForumFunctionality(Functionality).MessageCount;
end;

procedure TForumFunctionality__GetMessageList(Functionality: TFunctionality;   out MessageList: TList); stdcall;
begin
TForumFunctionality(Functionality).GetMessageList(MessageList);
end;

procedure TForumFunctionality__GetMessageList1(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall;
begin
TForumFunctionality(Functionality).GetMessageList(MessageList);
end;

function TForumFunctionality__AddMessage(Functionality: TFunctionality;   const pidUser: integer; const pidForMessage: integer): integer; stdcall;
begin
Result:=TForumFunctionality(Functionality).AddMessage(pidUser,pidForMessage);
end;

procedure TForumFunctionality__DestroyMessage(Functionality: TFunctionality;   const pidMessage: integer); stdcall;
begin
TForumFunctionality(Functionality).DestroyMessage(pidMessage);
end;


{TTCUSTOMVisualizationFunctionality}
function TTCUSTOMVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCUSTOMVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTCUSTOMVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCUSTOMVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCUSTOMVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCUSTOMVisualizationFunctionality(Functionality).getName;
end;

function TTCUSTOMVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCUSTOMVisualizationFunctionality(Functionality).getImage;
end;

function TTCUSTOMVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTCUSTOMVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TCUSTOMVisualizationFunctionality}
procedure TCUSTOMVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TCUSTOMVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TCUSTOMVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TCUSTOMVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TCUSTOMVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TCUSTOMVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TCUSTOMVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TCUSTOMVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).getName;
end;

function TCUSTOMVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).getHint;
end;

function TCUSTOMVisualizationFunctionality__getMODULEName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).getMODULEName;
end;

procedure TCUSTOMVisualizationFunctionality__setMODULEName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality).setMODULEName(Value);
end;

function TCUSTOMVisualizationFunctionality__getFunctionName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).getFunctionName;
end;

procedure TCUSTOMVisualizationFunctionality__setFunctionName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality).setFunctionName(Value);
end;

function TCUSTOMVisualizationFunctionality__getFunctionVersion(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCUSTOMVisualizationFunctionality(Functionality).getFunctionVersion;
end;

procedure TCUSTOMVisualizationFunctionality__setFunctionVersion(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality).setFunctionVersion(Value);
end;

procedure TCUSTOMVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer); stdcall;
begin
TCUSTOMVisualizationFunctionality(Functionality).GetParams(oMODULEName,oFunctionName,oFunctionVersion);
end;


{TTOLEVisualizationFunctionality}
function TTOLEVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOLEVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOLEVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOLEVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOLEVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOLEVisualizationFunctionality(Functionality).getName;
end;

function TTOLEVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOLEVisualizationFunctionality(Functionality).getImage;
end;

function TTOLEVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOLEVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOLEVisualizationFunctionality}
procedure TOLEVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOLEVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TOLEVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOLEVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TOLEVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOLEVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TOLEVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TOLEVisualizationFunctionality__SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).SaveToFile(FileName);
end;

procedure TOLEVisualizationFunctionality__EditDATA(Functionality: TFunctionality); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).EditDATA;
end;

function TOLEVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TOLEVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOLEVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOLEVisualizationFunctionality(Functionality).DATASize;
end;

function TOLEVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOLEVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOLEVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOLEVisualizationFunctionality(Functionality).getName;
end;

function TOLEVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOLEVisualizationFunctionality(Functionality).getHint;
end;

procedure TOLEVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure TOLEVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).GetDATA(Value,MaxSize);
end;

procedure TOLEVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure TOLEVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).GetDATA(Value,MaxSize);
end;

procedure TOLEVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).SetDATA(Value);
end;

procedure TOLEVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
TOLEVisualizationFunctionality(Functionality).SetDATA(Value);
end;


{TTHTMLVisualizationFunctionality}
function TTHTMLVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHTMLVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTHTMLVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHTMLVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHTMLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHTMLVisualizationFunctionality(Functionality).getName;
end;

function TTHTMLVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHTMLVisualizationFunctionality(Functionality).getImage;
end;

function TTHTMLVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTHTMLVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{THTMLVisualizationFunctionality}
procedure THTMLVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THTMLVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure THTMLVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).DestroyData;
end;

procedure THTMLVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure THTMLVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure THTMLVisualizationFunctionality__SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).SaveToFile(FileName);
end;

procedure THTMLVisualizationFunctionality__EditDATA(Functionality: TFunctionality); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).EditDATA;
end;

function THTMLVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function THTMLVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THTMLVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).DATASize;
end;

function THTMLVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function THTMLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).getName;
end;

function THTMLVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).getHint;
end;

function THTMLVisualizationFunctionality__getWidth(Functionality: TFunctionality): integer; stdcall;
begin
Result:=THTMLVisualizationFunctionality(Functionality).getWidth;
end;

procedure THTMLVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: integer); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).setWidth(Value);
end;

procedure THTMLVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure THTMLVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).GetDATA(Value,MaxSize);
end;

procedure THTMLVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure THTMLVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).GetDATA(Value,MaxSize);
end;

procedure THTMLVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).SetDATA(Value);
end;

procedure THTMLVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
THTMLVisualizationFunctionality(Functionality).SetDATA(Value);
end;


{TTBZRVisualizationFunctionality}
function TTBZRVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTBZRVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTBZRVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTBZRVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTBZRVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTBZRVisualizationFunctionality(Functionality).getName;
end;

function TTBZRVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTBZRVisualizationFunctionality(Functionality).getImage;
end;

function TTBZRVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTBZRVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TBZRVisualizationFunctionality}
procedure TBZRVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TBZRVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TBZRVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TBZRVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TBZRVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TBZRVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TBZRVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TBZRVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TBZRVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TBZRVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBZRVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TBZRVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TBZRVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBZRVisualizationFunctionality(Functionality).getName;
end;

function TBZRVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBZRVisualizationFunctionality(Functionality).getHint;
end;


{TTAGIFVisualizationFunctionality}
function TTAGIFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTAGIFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTAGIFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality).getName;
end;

function TTAGIFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality).getImage;
end;

function TTAGIFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TAGIFVisualizationFunctionality}
procedure TAGIFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TAGIFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TAGIFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TAGIFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TAGIFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TAGIFVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).TVisualizationUpdating_Create(Reflecting);
end;

function TAGIFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAGIFVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TAGIFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TAGIFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).getName;
end;

function TAGIFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).getHint;
end;

procedure TAGIFVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure TAGIFVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).GetDATA(Value,MaxSize);
end;

procedure TAGIFVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure TAGIFVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).GetDATA(Value,MaxSize);
end;

procedure TAGIFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).SetDATA(Value);
end;

procedure TAGIFVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).SetDATA(Value);
end;


{TTOrientedVIDEOVisualizationFunctionality}
function TTOrientedVIDEOVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOrientedVIDEOVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOrientedVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality).getName;
end;

function TTOrientedVIDEOVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality).getImage;
end;

function TTOrientedVIDEOVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOrientedVIDEOVisualizationFunctionality}
procedure TOrientedVIDEOVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TOrientedVIDEOVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOrientedVIDEOVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TOrientedVIDEOVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedVIDEOVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).TVisualizationUpdating_Create(Reflecting);
end;

function TOrientedVIDEOVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedVIDEOVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOrientedVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).getName;
end;

function TOrientedVIDEOVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).getHint;
end;

function TOrientedVIDEOVisualizationFunctionality__getDataServer(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).getDataServer;
end;

procedure TOrientedVIDEOVisualizationFunctionality__setDataServer(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality).setDataServer(Value);
end;

function TOrientedVIDEOVisualizationFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).getObjectID;
end;

procedure TOrientedVIDEOVisualizationFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality).setObjectID(Value);
end;


{TTVIDEOVisualizationFunctionality}
function TTVIDEOVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTVIDEOVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality).getName;
end;

function TTVIDEOVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality).getImage;
end;

function TTVIDEOVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TVIDEOVisualizationFunctionality}
procedure TVIDEOVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TVIDEOVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TVIDEOVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TVIDEOVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TVIDEOVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).TVisualizationUpdating_Create(Reflecting);
end;

function TVIDEOVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TVIDEOVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TVIDEOVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).getName;
end;

function TVIDEOVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).getHint;
end;

function TVIDEOVisualizationFunctionality__getDataServer(Functionality: TFunctionality): string; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).getDataServer;
end;

procedure TVIDEOVisualizationFunctionality__setDataServer(Functionality: TFunctionality;   Value: string); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality).setDataServer(Value);
end;

function TVIDEOVisualizationFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).getObjectID;
end;

procedure TVIDEOVisualizationFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality).setObjectID(Value);
end;


{TTOPPVisualizationFunctionality}
function TTOPPVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOPPVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOPPVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality).getName;
end;

function TTOPPVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality).getImage;
end;

function TTOPPVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOPPVisualizationFunctionality}
procedure TOPPVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TOPPVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOPPVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TOPPVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOPPVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOPPVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOPPVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).getName;
end;

function TOPPVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).getHint;
end;

function TOPPVisualizationFunctionality__getPropsPanel_idTObj(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).getPropsPanel_idTObj;
end;

procedure TOPPVisualizationFunctionality__setPropsPanel_idTObj(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).setPropsPanel_idTObj(Value);
end;

function TOPPVisualizationFunctionality__getPropsPanel_idObj(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).getPropsPanel_idObj;
end;

procedure TOPPVisualizationFunctionality__setPropsPanel_idObj(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).setPropsPanel_idObj(Value);
end;

procedure TOPPVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).GetParams(oPropsPanel_idTObj,oPropsPanel_idObj);
end;


{TTMODELServerFunctionality}
function TTMODELServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality)._CreateInstance;
end;

procedure TTMODELServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMODELServerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMODELServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMODELServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality).getName;
end;

function TTMODELServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality).getImage;
end;

function TTMODELServerFunctionality__GetInstanceByIPAddress(Functionality: TFunctionality;   const IPAddress: string;  out id: integer): boolean; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality).GetInstanceByIPAddress(IPAddress,id);
end;


{TMODELServerFunctionality}
procedure TMODELServerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMODELServerFunctionality(Functionality)._ToClone(idClone);
end;

function TMODELServerFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TMODELServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMODELServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).getName;
end;

procedure TMODELServerFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELServerFunctionality(Functionality).setName(Value);
end;

function TMODELServerFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).getHint;
end;

function TMODELServerFunctionality__getIPAddress(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).getIPAddress;
end;

procedure TMODELServerFunctionality__setIPAddress(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELServerFunctionality(Functionality).setIPAddress(Value);
end;

function TMODELServerFunctionality__IsUserExist(Functionality: TFunctionality;   const _UserName,_UserPassword: string): boolean; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).IsUserExist(_UserName,_UserPassword);
end;

function TMODELServerFunctionality__GetUserID(Functionality: TFunctionality;   const _UserName,_UserPassword: string): integer; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).GetUserID(_UserName,_UserPassword);
end;

function TMODELServerFunctionality__IsOnLine(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).IsOnLine;
end;

function TMODELServerFunctionality__Info(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).Info;
end;

procedure TMODELServerFunctionality__GetLicense(Functionality: TFunctionality;   out License: WideString); stdcall;
begin
TMODELServerFunctionality(Functionality).GetLicense(License);
end;

procedure TMODELServerFunctionality__CreateNewUserByDefaultPrototype(Functionality: TFunctionality;   const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer); stdcall;
begin
TMODELServerFunctionality(Functionality).CreateNewUserByDefaultPrototype(NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,idNewUser);
end;


{TTCoReferenceFunctionality}
function TTCoReferenceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoReferenceFunctionality(Functionality)._CreateInstance;
end;

procedure TTCoReferenceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCoReferenceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCoReferenceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoReferenceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoReferenceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCoReferenceFunctionality(Functionality).getName;
end;

function TTCoReferenceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoReferenceFunctionality(Functionality).getImage;
end;


{TCoReferenceFunctionality}
procedure TCoReferenceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoReferenceFunctionality(Functionality)._ToClone(idClone);
end;

function TCoReferenceFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TCoReferenceFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TCoReferenceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoReferenceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TCoReferenceFunctionality__ShowReferencedObjectPanelProps(Functionality: TFunctionality); stdcall;
begin
TCoReferenceFunctionality(Functionality).ShowReferencedObjectPanelProps;
end;

function TCoReferenceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoReferenceFunctionality(Functionality).getName;
end;

procedure TCoReferenceFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TCoReferenceFunctionality(Functionality).setName(Value);
end;

function TCoReferenceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoReferenceFunctionality(Functionality).getHint;
end;

procedure TCoReferenceFunctionality__GetReferencedObject(Functionality: TFunctionality;   out idTReferencedObject,idReferencedObject: integer); stdcall;
begin
TCoReferenceFunctionality(Functionality).GetReferencedObject(idTReferencedObject,idReferencedObject);
end;

procedure TCoReferenceFunctionality__SetReferencedObject(Functionality: TFunctionality;   const idTReferencedObject,idReferencedObject: integer); stdcall;
begin
TCoReferenceFunctionality(Functionality).SetReferencedObject(idTReferencedObject,idReferencedObject);
end;


{TTPositionerFunctionality}
function TTPositionerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTPositionerFunctionality(Functionality)._CreateInstance;
end;

procedure TTPositionerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTPositionerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTPositionerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTPositionerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTPositionerFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTPositionerFunctionality(Functionality).getName;
end;

function TTPositionerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTPositionerFunctionality(Functionality).getImage;
end;


{TPositionerFunctionality}
procedure TPositionerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPositionerFunctionality(Functionality)._ToClone(idClone);
end;

function TPositionerFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TPositionerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TPositionerFunctionality__SetPosition(Functionality: TFunctionality); stdcall;
begin
TPositionerFunctionality(Functionality).SetPosition;
end;

function TPositionerFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).getName;
end;

function TPositionerFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).getHint;
end;

procedure TPositionerFunctionality__Get2DPosition(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
begin
TPositionerFunctionality(Functionality).Get2DPosition(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TPositionerFunctionality__Save2DPosition(Functionality: TFunctionality;   Reflector: TReflector); stdcall;
begin
TPositionerFunctionality(Functionality).Save2DPosition(Reflector);
end;

procedure TPositionerFunctionality__Save2DPosition1(Functionality: TFunctionality;   const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
begin
TPositionerFunctionality(Functionality).Save2DPosition(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

function TPositionerFunctionality__getPositionName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).getPositionName;
end;

procedure TPositionerFunctionality__setPositionName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TPositionerFunctionality(Functionality).setPositionName(Value);
end;


{TTOrientedWMFVisualizationFunctionality}
function TTOrientedWMFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOrientedWMFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOrientedWMFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).getName;
end;

function TTOrientedWMFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).getImage;
end;

function TTOrientedWMFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOrientedWMFVisualizationFunctionality}
procedure TOrientedWMFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TOrientedWMFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOrientedWMFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TOrientedWMFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

procedure TOrientedWMFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TOrientedWMFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedWMFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedWMFVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).DATASize;
end;

function TOrientedWMFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOrientedWMFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getName;
end;

function TOrientedWMFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getHint;
end;

procedure TOrientedWMFVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality__GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetJPEGDATA(DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality__GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetJPEGDATA(DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

function TOrientedWMFVisualizationFunctionality__getWidth(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getWidth;
end;

procedure TOrientedWMFVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).setWidth(Value);
end;

function TOrientedWMFVisualizationFunctionality__getHeight(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getHeight;
end;

procedure TOrientedWMFVisualizationFunctionality__setHeight(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).setHeight(Value);
end;

function TOrientedWMFVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getOrientation;
end;

procedure TOrientedWMFVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).setOrientation(Value);
end;

procedure TOrientedWMFVisualizationFunctionality__ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).ChangeScale(ScaleFactor);
end;

procedure TOrientedWMFVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).UpdateContainer;
end;

function TOrientedWMFVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TOrientedWMFVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TOrientedWMFVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

function TOrientedWMFVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).IsNewContainerAcceptable(NewWidth,NewHeight,NewScale);
end;

procedure TOrientedWMFVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetParams(oWidth,oHeight,oOrientation);
end;


{TTCELLVisualizationFunctionality}
function TTCELLVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTCELLVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCELLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality).getName;
end;

function TTCELLVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality).getImage;
end;

function TTCELLVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TCELLVisualizationFunctionality}
procedure TCELLVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TCELLVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TCELLVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TCELLVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TCELLVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TCELLVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TCELLVisualizationFunctionality__SetReflectorView(Functionality: TFunctionality); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).SetReflectorView;
end;

function TCELLVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TCELLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getName;
end;

function TCELLVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getHint;
end;

procedure TCELLVisualizationFunctionality__GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).GetCoordinates(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TCELLVisualizationFunctionality__Change(Functionality: TFunctionality;   const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).Change(Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows);
end;

function TCELLVisualizationFunctionality__GetFormatNodes(Functionality: TFunctionality;   out NodesList: TList; out SizeX,SizeY: integer): boolean; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).GetFormatNodes(NodesList,SizeX,SizeY);
end;

function TCELLVisualizationFunctionality__GetFormatNodes1(Functionality: TFunctionality;   out NodesList: TByteArray; out SizeX,SizeY: integer): boolean; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).GetFormatNodes(NodesList,SizeX,SizeY);
end;

procedure TCELLVisualizationFunctionality__DoQuad(Functionality: TFunctionality); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).DoQuad;
end;

procedure TCELLVisualizationFunctionality__GetInsideObjectsList(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TComponentsList); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).GetInsideObjectsList(FindTypeID,flBuiltInType,List);
end;

procedure TCELLVisualizationFunctionality__GetInsideObjectsList1(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).GetInsideObjectsList(FindTypeID,flBuiltInType,List);
end;

function TCELLVisualizationFunctionality__getColCount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getColCount;
end;

procedure TCELLVisualizationFunctionality__setColCount(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).setColCount(Value);
end;

function TCELLVisualizationFunctionality__getRowCount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getRowCount;
end;

procedure TCELLVisualizationFunctionality__setRowCount(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).setRowCount(Value);
end;

function TCELLVisualizationFunctionality__getLineWidth(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getLineWidth;
end;

procedure TCELLVisualizationFunctionality__setLineWidth(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).setLineWidth(Value);
end;

function TCELLVisualizationFunctionality__getColSize(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getColSize;
end;

function TCELLVisualizationFunctionality__getRowSize(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getRowSize;
end;

procedure TCELLVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oColCount: integer; out oRowCount: integer; out oLineWidth: Double); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).GetParams(oColCount,oRowCount,oLineWidth);
end;


{TTEllipseVisualizationFunctionality}
function TTEllipseVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTEllipseVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTEllipseVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality).getName;
end;

function TTEllipseVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality).getImage;
end;

function TTEllipseVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TEllipseVisualizationFunctionality}
procedure TEllipseVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TEllipseVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TEllipseVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TEllipseVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TEllipseVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TEllipseVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TEllipseVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TEllipseVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getName;
end;

function TEllipseVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getHint;
end;

function TEllipseVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getColor;
end;

procedure TEllipseVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).setColor(Value);
end;

function TEllipseVisualizationFunctionality__getBorderColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getBorderColor;
end;

procedure TEllipseVisualizationFunctionality__setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).setBorderColor(Value);
end;

function TEllipseVisualizationFunctionality__getBorderWidth(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getBorderWidth;
end;

procedure TEllipseVisualizationFunctionality__setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).setBorderWidth(Value);
end;


{TTWMFVisualizationFunctionality}
function TTWMFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTWMFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTWMFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).getName;
end;

function TTWMFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).getImage;
end;

function TTWMFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TWMFVisualizationFunctionality}
procedure TWMFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TWMFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TWMFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TWMFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TWMFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TWMFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWMFVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).DATASize;
end;

function TWMFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TWMFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).getName;
end;

function TWMFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).getHint;
end;

procedure TWMFVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TWMFVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TWMFVisualizationFunctionality__GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetJPEGDATA(DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TWMFVisualizationFunctionality__GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetJPEGDATA(DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TWMFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

function TWMFVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TWMFVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TWMFVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

procedure TWMFVisualizationFunctionality__SetProportion(Functionality: TFunctionality); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).SetProportion;
end;


{TTPictureVisualizationFunctionality}
function TTPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).getName;
end;

function TTPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).getImage;
end;

function TTPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TPictureVisualizationFunctionality}
procedure TPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TPictureVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPictureVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).DATASize;
end;

function TPictureVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).getName;
end;

function TPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).getHint;
end;

procedure TPictureVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TPictureVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TPictureVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality__GetBMP(Functionality: TFunctionality;   out BMP: TBitmap); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetBMP(BMP);
end;

procedure TPictureVisualizationFunctionality__GetBMP1(Functionality: TFunctionality;   out BMP: TByteArray); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetBMP(BMP);
end;

procedure TPictureVisualizationFunctionality__SetProportion(Functionality: TFunctionality); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).SetProportion;
end;

function TPictureVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TPictureVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TPictureVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

procedure TPictureVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetParams(VisibleMinScale,VisibleMaxScale);
end;

procedure TPictureVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).SetParams(VisibleMinScale,VisibleMaxScale);
end;


{TTRoundVisualizationFunctionality}
function TTRoundVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTRoundVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTRoundVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality).getName;
end;

function TTRoundVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality).getImage;
end;

function TTRoundVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TRoundVisualizationFunctionality}
procedure TRoundVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TRoundVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TRoundVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TRoundVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TRoundVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TRoundVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TRoundVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TRoundVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TRoundVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getName;
end;

function TRoundVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getHint;
end;

function TRoundVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getColor;
end;

procedure TRoundVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).setColor(Value);
end;

function TRoundVisualizationFunctionality__getBorderColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getBorderColor;
end;

procedure TRoundVisualizationFunctionality__setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).setBorderColor(Value);
end;

function TRoundVisualizationFunctionality__getBorderWidth(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getBorderWidth;
end;

procedure TRoundVisualizationFunctionality__setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).setBorderWidth(Value);
end;


{TTGeodesyPointFunctionality}
function TTGeodesyPointFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality)._CreateInstance;
end;

procedure TTGeodesyPointFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGeodesyPointFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGeodesyPointFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGeodesyPointFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).getName;
end;

function TTGeodesyPointFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).getImage;
end;

function TTGeodesyPointFunctionality__ConvertSpaceCRDToGeoCRD(Functionality: TFunctionality;   const X,Y: Double; out Latitude,Longitude: Double): boolean; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).ConvertSpaceCRDToGeoCRD(X,Y,Latitude,Longitude);
end;

function TTGeodesyPointFunctionality__ConvertGeoCRDToSpaceCRD(Functionality: TFunctionality;   const Latitude,Longitude: Double; out X,Y: Double): boolean; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).ConvertGeoCRDToSpaceCRD(Latitude,Longitude,X,Y);
end;

procedure TTGeodesyPointFunctionality__GetNearestCrdSys(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;
begin
TTGeodesyPointFunctionality(Functionality).GetNearestCrdSys(pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeodesyPointFunctionality__GetInstanceListByCrdSys(Functionality: TFunctionality;   const idCrdSys: integer; out List: TByteArray); stdcall;
begin
TTGeodesyPointFunctionality(Functionality).GetInstanceListByCrdSys(idCrdSys,List);
end;

function TTGeodesyPointFunctionality__CrdSys_GetNearestGeoPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).CrdSys_GetNearestGeoPoints(idCrdSys,pLatitude,pLongitude,PointsCount,Points);
end;

function TTGeodesyPointFunctionality__CrdSys_GetNearestXYPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).CrdSys_GetNearestXYPoints(idCrdSys,pX,pY,PointsCount,Points);
end;


{TGeodesyPointFunctionality}
procedure TGeodesyPointFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TGeodesyPointFunctionality(Functionality)._ToClone(idClone);
end;

function TGeodesyPointFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TGeodesyPointFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGeodesyPointFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getName;
end;

function TGeodesyPointFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getHint;
end;

function TGeodesyPointFunctionality__getidCrdSys(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getidCrdSys;
end;

procedure TGeodesyPointFunctionality__setidCrdSys(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TGeodesyPointFunctionality(Functionality).setidCrdSys(Value);
end;

function TGeodesyPointFunctionality__getX(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getX;
end;

procedure TGeodesyPointFunctionality__setX(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TGeodesyPointFunctionality(Functionality).setX(Value);
end;

function TGeodesyPointFunctionality__getY(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getY;
end;

procedure TGeodesyPointFunctionality__setY(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TGeodesyPointFunctionality(Functionality).setY(Value);
end;

function TGeodesyPointFunctionality__getLatitude(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getLatitude;
end;

procedure TGeodesyPointFunctionality__setLatitude(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TGeodesyPointFunctionality(Functionality).setLatitude(Value);
end;

function TGeodesyPointFunctionality__getLongitude(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getLongitude;
end;

procedure TGeodesyPointFunctionality__setLongitude(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TGeodesyPointFunctionality(Functionality).setLongitude(Value);
end;

procedure TGeodesyPointFunctionality__GetParams(Functionality: TFunctionality;   out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double); stdcall;
begin
TGeodesyPointFunctionality(Functionality).GetParams(oidCrdSys,oX,oY,oLatitude,oLongitude);
end;

procedure TGeodesyPointFunctionality__SetParams(Functionality: TFunctionality;   const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double); stdcall;
begin
TGeodesyPointFunctionality(Functionality).SetParams(pidCrdSys,pX,pY,pLatitude,pLongitude);
end;

procedure TGeodesyPointFunctionality__ValidateByVisualizationComponent(Functionality: TFunctionality); stdcall;
begin
TGeodesyPointFunctionality(Functionality).ValidateByVisualizationComponent;
end;


{TTPrivateAreaVisualizationFunctionality}
function TTPrivateAreaVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTPrivateAreaVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTPrivateAreaVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).getName;
end;

function TTPrivateAreaVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).getImage;
end;

function TTPrivateAreaVisualizationFunctionality__CanCreateAsDetail(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).CanCreateAsDetail;
end;

function TTPrivateAreaVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TPrivateAreaVisualizationFunctionality}
procedure TPrivateAreaVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPrivateAreaVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TPrivateAreaVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TPrivateAreaVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TPrivateAreaVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TPrivateAreaVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TPrivateAreaVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TPrivateAreaVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPrivateAreaVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TPrivateAreaVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).getName;
end;

function TPrivateAreaVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).getHint;
end;

function TPrivateAreaVisualizationFunctionality__getAcquireObjectsInside(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).getAcquireObjectsInside;
end;

procedure TPrivateAreaVisualizationFunctionality__setAcquireObjectsInside(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TPrivateAreaVisualizationFunctionality(Functionality).setAcquireObjectsInside(Value);
end;


{TTHyperTextFunctionality}
function TTHyperTextFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHyperTextFunctionality(Functionality)._CreateInstance;
end;

procedure TTHyperTextFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTHyperTextFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTHyperTextFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHyperTextFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHyperTextFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHyperTextFunctionality(Functionality).getName;
end;

function TTHyperTextFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHyperTextFunctionality(Functionality).getImage;
end;


{THyperTextFunctionality}
procedure THyperTextFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall;
begin
THyperTextFunctionality(Functionality).UpdateDATA;
end;

procedure THyperTextFunctionality__ClearDATA(Functionality: TFunctionality); stdcall;
begin
THyperTextFunctionality(Functionality).ClearDATA;
end;

procedure THyperTextFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THyperTextFunctionality(Functionality)._ToClone(idClone);
end;

function THyperTextFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THyperTextFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure THyperTextFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
THyperTextFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure THyperTextFunctionality__SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
THyperTextFunctionality(Functionality).SaveToFile(FileName);
end;

function THyperTextFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=THyperTextFunctionality(Functionality).getName;
end;

function THyperTextFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=THyperTextFunctionality(Functionality).getHint;
end;

procedure THyperTextFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;
begin
THyperTextFunctionality(Functionality).GetDATA(Value);
end;

procedure THyperTextFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
THyperTextFunctionality(Functionality).GetDATA(Value);
end;

procedure THyperTextFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
THyperTextFunctionality(Functionality).SetDATA(Value);
end;

procedure THyperTextFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
THyperTextFunctionality(Functionality).SetDATA(Value);
end;


{TTComponentsFindServiceFunctionality}
function TTComponentsFindServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTComponentsFindServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTComponentsFindServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTComponentsFindServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTComponentsFindServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTComponentsFindServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTComponentsFindServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTComponentsFindServiceFunctionality(Functionality).getName;
end;

function TTComponentsFindServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTComponentsFindServiceFunctionality(Functionality).getImage;
end;


{TComponentsFindServiceFunctionality}
procedure TComponentsFindServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TComponentsFindServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TComponentsFindServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TComponentsFindServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TComponentsFindServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TComponentsFindServiceFunctionality(Functionality).getName;
end;

function TComponentsFindServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TComponentsFindServiceFunctionality(Functionality).getHint;
end;


{TTUsersServiceFunctionality}
function TTUsersServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTUsersServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTUsersServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTUsersServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTUsersServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTUsersServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTUsersServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTUsersServiceFunctionality(Functionality).getName;
end;

function TTUsersServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTUsersServiceFunctionality(Functionality).getImage;
end;


{TUsersServiceFunctionality}
procedure TUsersServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TUsersServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TUsersServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TUsersServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TUsersServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TUsersServiceFunctionality(Functionality).getName;
end;

function TUsersServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TUsersServiceFunctionality(Functionality).getHint;
end;


{TTTransportServiceFunctionality}
function TTTransportServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTransportServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTTransportServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTransportServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTransportServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTransportServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTransportServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTransportServiceFunctionality(Functionality).getName;
end;

function TTTransportServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTransportServiceFunctionality(Functionality).getImage;
end;


{TTransportServiceFunctionality}
procedure TTransportServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTransportServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TTransportServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTransportServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportServiceFunctionality(Functionality).getName;
end;

function TTransportServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportServiceFunctionality(Functionality).getHint;
end;


{TTMarketServiceFunctionality}
function TTMarketServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMarketServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTMarketServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMarketServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMarketServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMarketServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMarketServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMarketServiceFunctionality(Functionality).getName;
end;

function TTMarketServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMarketServiceFunctionality(Functionality).getImage;
end;


{TMarketServiceFunctionality}
procedure TMarketServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMarketServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TMarketServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMarketServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMarketServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMarketServiceFunctionality(Functionality).getName;
end;

function TMarketServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMarketServiceFunctionality(Functionality).getHint;
end;


{TTTelecomServiceFunctionality}
function TTTelecomServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTelecomServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTTelecomServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTelecomServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTelecomServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTelecomServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTelecomServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTelecomServiceFunctionality(Functionality).getName;
end;

function TTTelecomServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTelecomServiceFunctionality(Functionality).getImage;
end;


{TTelecomServiceFunctionality}
procedure TTelecomServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTelecomServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TTelecomServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTelecomServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTelecomServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTelecomServiceFunctionality(Functionality).getName;
end;

function TTelecomServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTelecomServiceFunctionality(Functionality).getHint;
end;


{TTWNDVisualizationFunctionality}
function TTWNDVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTWNDVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTWNDVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).getName;
end;

function TTWNDVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).getImage;
end;

function TTWNDVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TWNDVisualizationFunctionality}
procedure TWNDVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TWNDVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TWNDVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TWNDVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TWNDVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TWNDVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWNDVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).DATASize;
end;

function TWNDVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TWNDVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TWNDVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).getName;
end;

function TWNDVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).getHint;
end;

procedure TWNDVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TWNDVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TWNDVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

function TWNDVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TWNDVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TWNDVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).DATAFile_Clear;
end;


{TTMRKVisualizationFunctionality}
function TTMRKVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTMRKVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMRKVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).getName;
end;

function TTMRKVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).getImage;
end;

function TTMRKVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TMRKVisualizationFunctionality}
procedure TMRKVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TMRKVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TMRKVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TMRKVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TMRKVisualizationFunctionality__DoOnComponentUpdate(Functionality: TFunctionality); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).DoOnComponentUpdate;
end;

function TMRKVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TMRKVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMRKVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).DATASize;
end;

function TMRKVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TMRKVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getName;
end;

function TMRKVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getHint;
end;

procedure TMRKVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TMRKVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TMRKVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

function TMRKVisualizationFunctionality__getBindingPointIndex(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getBindingPointIndex;
end;

procedure TMRKVisualizationFunctionality__setBindingPointIndex(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).setBindingPointIndex(Value);
end;

function TMRKVisualizationFunctionality__getAlign(Functionality: TFunctionality): TMRKVisualizationAlign; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getAlign;
end;

function TMRKVisualizationFunctionality__getAlign1(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getAlign1;
end;

procedure TMRKVisualizationFunctionality__setAlign(Functionality: TFunctionality;   Value: TMRKVisualizationAlign); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).setAlign(Value);
end;

procedure TMRKVisualizationFunctionality__setAlign1(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).setAlign1(Value);
end;

function TMRKVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TMRKVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TMRKVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

procedure TMRKVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oAlign: integer; out oBindingPointIndex: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).GetParams(oAlign,oBindingPointIndex);
end;


{TTOrientedPictureVisualizationFunctionality}
function TTOrientedPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOrientedPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOrientedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).getName;
end;

function TTOrientedPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).getImage;
end;

function TTOrientedPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOrientedPictureVisualizationFunctionality}
procedure TOrientedPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TOrientedPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOrientedPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TOrientedPictureVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TOrientedPictureVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TOrientedPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedPictureVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).DATASize;
end;

function TOrientedPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOrientedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getName;
end;

function TOrientedPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getHint;
end;

procedure TOrientedPictureVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TOrientedPictureVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).GetDATA(DATAStream,DATAType,MaxSize);
end;

procedure TOrientedPictureVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

function TOrientedPictureVisualizationFunctionality__getWidth(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getWidth;
end;

procedure TOrientedPictureVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).setWidth(Value);
end;

function TOrientedPictureVisualizationFunctionality__getHeight(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getHeight;
end;

procedure TOrientedPictureVisualizationFunctionality__setHeight(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).setHeight(Value);
end;

function TOrientedPictureVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getOrientation;
end;

procedure TOrientedPictureVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).setOrientation(Value);
end;

procedure TOrientedPictureVisualizationFunctionality__ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).ChangeScale(ScaleFactor);
end;

procedure TOrientedPictureVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).UpdateContainer;
end;

function TOrientedPictureVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TOrientedPictureVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TOrientedPictureVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

function TOrientedPictureVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).IsNewContainerAcceptable(NewWidth,NewHeight,NewScale);
end;

procedure TOrientedPictureVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).GetParams(oWidth,oHeight,oOrientation);
end;


{TTOrientedTTFVisualizationFunctionality}
function TTOrientedTTFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOrientedTTFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOrientedTTFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality).getName;
end;

function TTOrientedTTFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality).getImage;
end;

function TTOrientedTTFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOrientedTTFVisualizationFunctionality}
procedure TOrientedTTFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TOrientedTTFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOrientedTTFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TOrientedTTFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TOrientedTTFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedTTFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedTTFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOrientedTTFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getName;
end;

function TOrientedTTFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getHint;
end;

function TOrientedTTFVisualizationFunctionality__getStr(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getStr;
end;

procedure TOrientedTTFVisualizationFunctionality__setStr(Functionality: TFunctionality;   const Value: string); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setStr(Value);
end;

function TOrientedTTFVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getColor;
end;

procedure TOrientedTTFVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setColor(Value);
end;

function TOrientedTTFVisualizationFunctionality__getFont_Name(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getFont_Name;
end;

procedure TOrientedTTFVisualizationFunctionality__setFont_Name(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setFont_Name(Value);
end;

function TOrientedTTFVisualizationFunctionality__getFont_Width(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getFont_Width;
end;

procedure TOrientedTTFVisualizationFunctionality__setFont_Width(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setFont_Width(Value);
end;

function TOrientedTTFVisualizationFunctionality__getFont_Height(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getFont_Height;
end;

procedure TOrientedTTFVisualizationFunctionality__setFont_Height(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setFont_Height(Value);
end;

function TOrientedTTFVisualizationFunctionality__getCharInterval(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getCharInterval;
end;

procedure TOrientedTTFVisualizationFunctionality__setCharInterval(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setCharInterval(Value);
end;

function TOrientedTTFVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getOrientation;
end;

procedure TOrientedTTFVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setOrientation(Value);
end;

procedure TOrientedTTFVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).UpdateContainer;
end;

function TOrientedTTFVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).IsNewContainerAcceptable(NewFontWidth,NewFontHeight,NewCharInterval,flNewStr,NewStr);
end;

procedure TOrientedTTFVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).GetParams(oStr,oFont_Width,oFont_Height,oFont_Name,oCharInterval,oOrientation);
end;

procedure TOrientedTTFVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).SetParams(pStr,pFont_Width,pFont_Height,pFont_Name,pCharInterval,pOrientation);
end;


{TTIconFunctionality}
function TTIconFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTIconFunctionality(Functionality)._CreateInstance;
end;

procedure TTIconFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTIconFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTIconFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTIconFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTIconFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTIconFunctionality(Functionality).getName;
end;

function TTIconFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTIconFunctionality(Functionality).getImage;
end;


{TIconFunctionality}
procedure TIconFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TIconFunctionality(Functionality)._ToClone(idClone);
end;

procedure TIconFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TIconFunctionality(Functionality).LoadFromFile(FileName);
end;

function TIconFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TIconFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TIconFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TIconFunctionality(Functionality).getName;
end;

function TIconFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TIconFunctionality(Functionality).getHint;
end;

procedure TIconFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall;
begin
TIconFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TIconFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TIconFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TIconFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall;
begin
TIconFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TIconFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall;
begin
TIconFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TIconFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;
begin
TIconFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;

procedure TIconFunctionality__GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall;
begin
TIconFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;


{TTMessageBoardMessageFunctionality}
function TTMessageBoardMessageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMessageBoardMessageFunctionality(Functionality)._CreateInstance;
end;

procedure TTMessageBoardMessageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMessageBoardMessageFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMessageBoardMessageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMessageBoardMessageFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMessageBoardMessageFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMessageBoardMessageFunctionality(Functionality).getName;
end;

function TTMessageBoardMessageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMessageBoardMessageFunctionality(Functionality).getImage;
end;


{TMessageBoardMessageFunctionality}
procedure TMessageBoardMessageFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality)._ToClone(idClone);
end;

function TMessageBoardMessageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMessageBoardMessageFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getName;
end;

function TMessageBoardMessageFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getHint;
end;

function TMessageBoardMessageFunctionality__getIdMessageBoard(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getIdMessageBoard;
end;

procedure TMessageBoardMessageFunctionality__setIdMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).setIdMessageBoard(Value);
end;

function TMessageBoardMessageFunctionality__getIdSenderMessageBoard(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getIdSenderMessageBoard;
end;

procedure TMessageBoardMessageFunctionality__setIdSenderMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).setIdSenderMessageBoard(Value);
end;

function TMessageBoardMessageFunctionality__DateCreated(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).DateCreated;
end;

function TMessageBoardMessageFunctionality__getSubject(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getSubject;
end;

procedure TMessageBoardMessageFunctionality__setSubject(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).setSubject(Value);
end;

procedure TMessageBoardMessageFunctionality__GetBody(Functionality: TFunctionality;   Value: TStringList); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).GetBody(Value);
end;

procedure TMessageBoardMessageFunctionality__GetBody1(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).GetBody(Value);
end;

procedure TMessageBoardMessageFunctionality__SetBody(Functionality: TFunctionality;   Value: TStringList); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).SetBody(Value);
end;

procedure TMessageBoardMessageFunctionality__SetBody1(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).SetBody(Value);
end;

function TMessageBoardMessageFunctionality__getFlRead(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getFlRead;
end;

procedure TMessageBoardMessageFunctionality__setFlRead(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).setFlRead(Value);
end;

function TMessageBoardMessageFunctionality__IsEmpty(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).IsEmpty;
end;

function TMessageBoardMessageFunctionality__IsCreatedByUser(Functionality: TFunctionality;   const pidUser: integer): boolean; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).IsCreatedByUser(pidUser);
end;


{TTMessageBoardFunctionality}
function TTMessageBoardFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMessageBoardFunctionality(Functionality)._CreateInstance;
end;

procedure TTMessageBoardFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMessageBoardFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMessageBoardFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMessageBoardFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMessageBoardFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMessageBoardFunctionality(Functionality).getName;
end;

function TTMessageBoardFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMessageBoardFunctionality(Functionality).getImage;
end;


{TMessageBoardFunctionality}
procedure TMessageBoardFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMessageBoardFunctionality(Functionality)._ToClone(idClone);
end;

function TMessageBoardFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TMessageBoardFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMessageBoardFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).getName;
end;

procedure TMessageBoardFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMessageBoardFunctionality(Functionality).setName(Value);
end;

function TMessageBoardFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).getHint;
end;

function TMessageBoardFunctionality__IsUnreadMessageExist(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).IsUnreadMessageExist;
end;

procedure TMessageBoardFunctionality__GetMessagesList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TMessageBoardFunctionality(Functionality).GetMessagesList(List);
end;

procedure TMessageBoardFunctionality__GetMessagesList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TMessageBoardFunctionality(Functionality).GetMessagesList(List);
end;

function TMessageBoardFunctionality__CreateNewMessage(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).CreateNewMessage;
end;

procedure TMessageBoardFunctionality__SendMessage(Functionality: TFunctionality;   const idMessage: integer); stdcall;
begin
TMessageBoardFunctionality(Functionality).SendMessage(idMessage);
end;

function TMessageBoardFunctionality__getIdUser(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).getIdUser;
end;

procedure TMessageBoardFunctionality__setIdUser(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMessageBoardFunctionality(Functionality).setIdUser(Value);
end;


{TTQDCVisualizationFunctionality}
function TTQDCVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTQDCVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTQDCVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).getName;
end;

function TTQDCVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).getImage;
end;

function TTQDCVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TQDCVisualizationFunctionality}
procedure TQDCVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TQDCVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TQDCVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TQDCVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TQDCVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAPtr: pointer): boolean; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).GetDATA(DATAPtr);
end;

function TQDCVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TQDCVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TQDCVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).DATASize;
end;

function TQDCVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TQDCVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).getName;
end;

function TQDCVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).getHint;
end;

procedure TQDCVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TQDCVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TQDCVisualizationFunctionality__LoadFromBitmap(Functionality: TFunctionality;   Bitmap: TBitmap); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).LoadFromBitmap(Bitmap);
end;

procedure TQDCVisualizationFunctionality__LoadFromBitmap1(Functionality: TFunctionality;   Bitmap: TByteArray); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).LoadFromBitmap(Bitmap);
end;

function TQDCVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TQDCVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TQDCVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).DATAFile_Clear;
end;


{TTOffersServerFunctionality}
function TTOffersServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOffersServerFunctionality(Functionality)._CreateInstance;
end;

procedure TTOffersServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTOffersServerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTOffersServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOffersServerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOffersServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOffersServerFunctionality(Functionality).getName;
end;

function TTOffersServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOffersServerFunctionality(Functionality).getImage;
end;


{TOffersServerFunctionality}
procedure TOffersServerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOffersServerFunctionality(Functionality)._ToClone(idClone);
end;

function TOffersServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOffersServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getName;
end;

function TOffersServerFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getHint;
end;

function TOffersServerFunctionality__getMailROBOT_Inbox(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getMailROBOT_Inbox;
end;

procedure TOffersServerFunctionality__setMailROBOT_Inbox(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOffersServerFunctionality(Functionality).setMailROBOT_Inbox(Value);
end;

function TOffersServerFunctionality__getMailROBOT_User(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getMailROBOT_User;
end;

procedure TOffersServerFunctionality__setMailROBOT_User(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOffersServerFunctionality(Functionality).setMailROBOT_User(Value);
end;

function TOffersServerFunctionality__getMailROBOT_Password(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getMailROBOT_Password;
end;

procedure TOffersServerFunctionality__setMailROBOT_Password(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOffersServerFunctionality(Functionality).setMailROBOT_Password(Value);
end;


{TTSecurityComponentOperationFunctionality}
function TTSecurityComponentOperationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSecurityComponentOperationFunctionality(Functionality)._CreateInstance;
end;

procedure TTSecurityComponentOperationFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityComponentOperationFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSecurityComponentOperationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSecurityComponentOperationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSecurityComponentOperationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTSecurityComponentOperationFunctionality(Functionality).getName;
end;

function TTSecurityComponentOperationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSecurityComponentOperationFunctionality(Functionality).getImage;
end;

procedure TTSecurityComponentOperationFunctionality__GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;
begin
TTSecurityComponentOperationFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;

procedure TTSecurityComponentOperationFunctionality__GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall;
begin
TTSecurityComponentOperationFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;


{TSecurityComponentOperationFunctionality}
procedure TSecurityComponentOperationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSecurityComponentOperationFunctionality(Functionality)._ToClone(idClone);
end;

function TSecurityComponentOperationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityComponentOperationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).getName;
end;

procedure TSecurityComponentOperationFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TSecurityComponentOperationFunctionality(Functionality).setName(Value);
end;

function TSecurityComponentOperationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).getHint;
end;

function TSecurityComponentOperationFunctionality__getSQLInfo(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).getSQLInfo;
end;

procedure TSecurityComponentOperationFunctionality__setSQLInfo(Functionality: TFunctionality;   Value: string); stdcall;
begin
TSecurityComponentOperationFunctionality(Functionality).setSQLInfo(Value);
end;


{TTSecurityKeyFunctionality}
function TTSecurityKeyFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality)._CreateInstance;
end;

procedure TTSecurityKeyFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityKeyFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSecurityKeyFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSecurityKeyFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality).getName;
end;

function TTSecurityKeyFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality).getImage;
end;

function TTSecurityKeyFunctionality__GetInstanceByCode(Functionality: TFunctionality;   const Code: string;  out idInstance: integer): boolean; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality).GetInstanceByCode(Code,idInstance);
end;

procedure TTSecurityKeyFunctionality__GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;
begin
TTSecurityKeyFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;

procedure TTSecurityKeyFunctionality__GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall;
begin
TTSecurityKeyFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;


{TSecurityKeyFunctionality}
procedure TSecurityKeyFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSecurityKeyFunctionality(Functionality)._ToClone(idClone);
end;

function TSecurityKeyFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityKeyFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).getName;
end;

procedure TSecurityKeyFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TSecurityKeyFunctionality(Functionality).setName(Value);
end;

function TSecurityKeyFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).getHint;
end;

function TSecurityKeyFunctionality__getInfo(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).getInfo;
end;

procedure TSecurityKeyFunctionality__setInfo(Functionality: TFunctionality;   Value: string); stdcall;
begin
TSecurityKeyFunctionality(Functionality).setInfo(Value);
end;

procedure TSecurityKeyFunctionality__GetAssotiatedUsers(Functionality: TFunctionality;   out Users: TList); stdcall;
begin
TSecurityKeyFunctionality(Functionality).GetAssotiatedUsers(Users);
end;

procedure TSecurityKeyFunctionality__GetAssotiatedUsers1(Functionality: TFunctionality;   out Users: TByteArray); stdcall;
begin
TSecurityKeyFunctionality(Functionality).GetAssotiatedUsers(Users);
end;

procedure TSecurityKeyFunctionality__GenerateCode(Functionality: TFunctionality); stdcall;
begin
TSecurityKeyFunctionality(Functionality).GenerateCode;
end;

function TSecurityKeyFunctionality__Code(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).Code;
end;


{TTSecurityFileFunctionality}
function TTSecurityFileFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSecurityFileFunctionality(Functionality)._CreateInstance;
end;

procedure TTSecurityFileFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityFileFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSecurityFileFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSecurityFileFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSecurityFileFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTSecurityFileFunctionality(Functionality).getName;
end;

function TTSecurityFileFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSecurityFileFunctionality(Functionality).getImage;
end;

procedure TTSecurityFileFunctionality__GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;
begin
TTSecurityFileFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;

procedure TTSecurityFileFunctionality__GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString;out List: TByteArray); stdcall;
begin
TTSecurityFileFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;


{TSecurityFileFunctionality}
procedure TSecurityFileFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSecurityFileFunctionality(Functionality)._ToClone(idClone);
end;

function TSecurityFileFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityFileFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).getName;
end;

procedure TSecurityFileFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TSecurityFileFunctionality(Functionality).setName(Value);
end;

function TSecurityFileFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).getHint;
end;

function TSecurityFileFunctionality__getInfo(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).getInfo;
end;

procedure TSecurityFileFunctionality__setInfo(Functionality: TFunctionality;   Value: string); stdcall;
begin
TSecurityFileFunctionality(Functionality).setInfo(Value);
end;

function TSecurityFileFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream): boolean; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).GetDATA(Value);
end;

function TSecurityFileFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TByteArray): boolean; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).GetDATA(Value);
end;

procedure TSecurityFileFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
TSecurityFileFunctionality(Functionality).SetDATA(Value);
end;

procedure TSecurityFileFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
TSecurityFileFunctionality(Functionality).SetDATA(Value);
end;

function TSecurityFileFunctionality__AddOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).AddOperationSecurityKey(OperationID,SecurityKeyID);
end;

function TSecurityFileFunctionality__RemoveOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).RemoveOperationSecurityKey(OperationID,SecurityKeyID);
end;

procedure TSecurityFileFunctionality__GetAssotiatedSecurityComponents(Functionality: TFunctionality;   out SecurityComponents: TList); stdcall;
begin
TSecurityFileFunctionality(Functionality).GetAssotiatedSecurityComponents(SecurityComponents);
end;

procedure TSecurityFileFunctionality__GetAssotiatedSecurityComponents1(Functionality: TFunctionality;   out SecurityComponents: TByteArray); stdcall;
begin
TSecurityFileFunctionality(Functionality).GetAssotiatedSecurityComponents(SecurityComponents);
end;


{TTSecurityComponentFunctionality}
function TTSecurityComponentFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality)._CreateInstance;
end;

procedure TTSecurityComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityComponentFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSecurityComponentFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSecurityComponentFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality).getName;
end;

function TTSecurityComponentFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality).getImage;
end;

procedure TTSecurityComponentFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityComponentFunctionality(Functionality).DestroyInstance(idObj);
end;


{TSecurityComponentFunctionality}
procedure TSecurityComponentFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSecurityComponentFunctionality(Functionality)._ToClone(idClone);
end;

function TSecurityComponentFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TSecurityComponentFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSecurityComponentFunctionality(Functionality).ToClone(idClone);
end;

function TSecurityComponentFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TSecurityComponentFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).getName;
end;

function TSecurityComponentFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).getHint;
end;

function TSecurityComponentFunctionality__getIdSecurityFile(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).getIdSecurityFile;
end;

procedure TSecurityComponentFunctionality__setIdSecurityFile(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TSecurityComponentFunctionality(Functionality).setIdSecurityFile(Value);
end;


{TTMODELUserFunctionality}
function TTMODELUserFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality)._CreateInstance;
end;

procedure TTMODELUserFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMODELUserFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMODELUserFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMODELUserFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality).getName;
end;

function TTMODELUserFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality).getImage;
end;

function TTMODELUserFunctionality__IsUserExist(Functionality: TFunctionality;   const UserName: string; out idUser: integer): boolean; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality).IsUserExist(UserName,idUser);
end;

procedure TTMODELUserFunctionality__GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;
begin
TTMODELUserFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;

procedure TTMODELUserFunctionality__GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall;
begin
TTMODELUserFunctionality(Functionality).GetInstanceListByContext(Context,List);
end;

procedure TTMODELUserFunctionality__GetOnlineUsersForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall;
begin
TTMODELUserFunctionality(Functionality).GetOnlineUsersForDomains(pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality__GetOnlineUsersForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall;
begin
TTMODELUserFunctionality(Functionality).GetOnlineUsersForDomains(pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality__GetOnlineExpertsForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall;
begin
TTMODELUserFunctionality(Functionality).GetOnlineExpertsForDomains(pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality__GetOnlineExpertsForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall;
begin
TTMODELUserFunctionality(Functionality).GetOnlineExpertsForDomains(pOnlineMaxDelay,pDomains,List);
end;


{TMODELUserFunctionality}
procedure TMODELUserFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMODELUserFunctionality(Functionality)._ToClone(idClone);
end;

function TMODELUserFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMODELUserFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getHint;
end;

function TMODELUserFunctionality__GetActiveStateInfo(Functionality: TFunctionality;   out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).GetActiveStateInfo(ProxySpaceID,ProxySpaceIP,ProxySpaceState);
end;

function TMODELUserFunctionality__IsUserOnLine(Functionality: TFunctionality;   const MaxDelay: Double): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).IsUserOnLine(MaxDelay);
end;

procedure TMODELUserFunctionality__Logout(Functionality: TFunctionality); stdcall;
begin
TMODELUserFunctionality(Functionality).Logout;
end;

procedure TMODELUserFunctionality__GetSecurityKeysList(Functionality: TFunctionality;   out SecurityKeys: TList); stdcall;
begin
TMODELUserFunctionality(Functionality).GetSecurityKeysList(SecurityKeys);
end;

procedure TMODELUserFunctionality__GetSecurityKeysList1(Functionality: TFunctionality;   out SecurityKeys: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).GetSecurityKeysList(SecurityKeys);
end;

function TMODELUserFunctionality__SecurityKeys_IsKeyExist(Functionality: TFunctionality;   const idSecurityKey: integer): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).SecurityKeys_IsKeyExist(idSecurityKey);
end;

procedure TMODELUserFunctionality__SecurityKeys_Insert(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).SecurityKeys_Insert(idSecurityKey);
end;

procedure TMODELUserFunctionality__SecurityKeys_Delete(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).SecurityKeys_Delete(idSecurityKey);
end;

procedure TMODELUserFunctionality__SecurityKeys_AddKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall;
begin
TMODELUserFunctionality(Functionality).SecurityKeys_AddKeyByCode(Code);
end;

procedure TMODELUserFunctionality__SecurityKeys_RemoveKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall;
begin
TMODELUserFunctionality(Functionality).SecurityKeys_RemoveKeyByCode(Code);
end;

function TMODELUserFunctionality__SecurityKeys_CreateAndAddNewKey(Functionality: TFunctionality;   const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).SecurityKeys_CreateAndAddNewKey(pName,pInfo,KeyCode);
end;

procedure TMODELUserFunctionality__GetMessageBoards(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TMODELUserFunctionality(Functionality).GetMessageBoards(List);
end;

procedure TMODELUserFunctionality__GetMessageBoards1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).GetMessageBoards(List);
end;

function TMODELUserFunctionality__HaveUnreadMessages(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).HaveUnreadMessages;
end;

procedure TMODELUserFunctionality__GetMessages(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TList); stdcall;
begin
TMODELUserFunctionality(Functionality).GetMessages(flUnreadOnly,MessageList);
end;

procedure TMODELUserFunctionality__GetMessages1(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).GetMessages(flUnreadOnly,MessageList);
end;

procedure TMODELUserFunctionality__IncomingMessages_SendNew(Functionality: TFunctionality;   const Message: TMemoryStream; const SenderID: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_SendNew(Message,SenderID);
end;

procedure TMODELUserFunctionality__IncomingMessages_SendNew1(Functionality: TFunctionality;   const Message: TByteArray; const SenderID: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_SendNew(Message,SenderID);
end;

function TMODELUserFunctionality__IncomingMessages_GetUnread(Functionality: TFunctionality;   out MessageList: TList): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).IncomingMessages_GetUnread(MessageList);
end;

function TMODELUserFunctionality__IncomingMessages_GetUnread1(Functionality: TFunctionality;   out MessageList: TByteArray): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).IncomingMessages_GetUnread(MessageList);
end;

procedure TMODELUserFunctionality__IncomingMessages_GetMessagesSince(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TList); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_GetMessagesSince(TimeStamp,MessageList);
end;

procedure TMODELUserFunctionality__IncomingMessages_GetMessagesSince1(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_GetMessagesSince(TimeStamp,MessageList);
end;

procedure TMODELUserFunctionality__IncomingMessages_GetMessage(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: TDateTime; out Message: TClientBlobStream; out SenderID: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_GetMessage(MessageID,TimeStamp,Message,SenderID);
end;

procedure TMODELUserFunctionality__IncomingMessages_GetMessage1(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_GetMessage(MessageID,TimeStamp,Message,SenderID);
end;

procedure TMODELUserFunctionality__IncomingMessages_DeleteTo(Functionality: TFunctionality;   const TimeStamp: TDateTime); stdcall;
begin
TMODELUserFunctionality(Functionality).IncomingMessages_DeleteTo(TimeStamp);
end;

function TMODELUserFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getName;
end;

procedure TMODELUserFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELUserFunctionality(Functionality).setName(Value);
end;

function TMODELUserFunctionality__getFullName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getFullName;
end;

procedure TMODELUserFunctionality__setFullName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELUserFunctionality(Functionality).setFullName(Value);
end;

function TMODELUserFunctionality__getContactInfo(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getContactInfo;
end;

procedure TMODELUserFunctionality__setContactInfo(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELUserFunctionality(Functionality).setContactInfo(Value);
end;

function TMODELUserFunctionality__getPassword(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getPassword;
end;

procedure TMODELUserFunctionality__setPassword(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELUserFunctionality(Functionality).setPassword(Value);
end;

function TMODELUserFunctionality__getIdSecurityFileForClone(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getIdSecurityFileForClone;
end;

procedure TMODELUserFunctionality__setIdSecurityFileForClone(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setIdSecurityFileForClone(Value);
end;

function TMODELUserFunctionality__getidSecurityFileForPrivate(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getidSecurityFileForPrivate;
end;

procedure TMODELUserFunctionality__setidSecurityFileForPrivate(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setidSecurityFileForPrivate(Value);
end;

function TMODELUserFunctionality__getDATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getDATASize;
end;

procedure TMODELUserFunctionality__setDATASize(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setDATASize(Value);
end;

function TMODELUserFunctionality__getMaxDATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getMaxDATASize;
end;

procedure TMODELUserFunctionality__setMaxDATASize(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setMaxDATASize(Value);
end;

function TMODELUserFunctionality__getSpaceSquare(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getSpaceSquare;
end;

procedure TMODELUserFunctionality__setSpaceSquare(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TMODELUserFunctionality(Functionality).setSpaceSquare(Value);
end;

function TMODELUserFunctionality__getMaxSpaceSquare(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getMaxSpaceSquare;
end;

procedure TMODELUserFunctionality__setMaxSpaceSquare(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setMaxSpaceSquare(Value);
end;

function TMODELUserFunctionality__getMaxSpaceSquarePerObject(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getMaxSpaceSquarePerObject;
end;

procedure TMODELUserFunctionality__setMaxSpaceSquarePerObject(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setMaxSpaceSquarePerObject(Value);
end;

function TMODELUserFunctionality__getDisabled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getDisabled;
end;

procedure TMODELUserFunctionality__setDisabled(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TMODELUserFunctionality(Functionality).setDisabled(Value);
end;

procedure TMODELUserFunctionality__GetStartObj(Functionality: TFunctionality;   out idTStartObj,idStartObj: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).GetStartObj(idTStartObj,idStartObj);
end;

procedure TMODELUserFunctionality__SetStartObj(Functionality: TFunctionality;   const idTStartObj,idStartObj: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).SetStartObj(idTStartObj,idStartObj);
end;

function TMODELUserFunctionality__getDomains(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getDomains;
end;

procedure TMODELUserFunctionality__setDomains(Functionality: TFunctionality;   Value: string); stdcall;
begin
TMODELUserFunctionality(Functionality).setDomains(Value);
end;

function TMODELUserFunctionality__getTaskEnabled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getTaskEnabled;
end;

procedure TMODELUserFunctionality__setTaskEnabled(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TMODELUserFunctionality(Functionality).setTaskEnabled(Value);
end;

procedure TMODELUserFunctionality__CheckDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).CheckDATASize(pAddDATASize);
end;

procedure TMODELUserFunctionality__AddDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).AddDATASize(pAddDATASize);
end;

procedure TMODELUserFunctionality__SubDATASize(Functionality: TFunctionality;   const pSubDATASize: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).SubDATASize(pSubDATASize);
end;

procedure TMODELUserFunctionality__CheckSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall;
begin
TMODELUserFunctionality(Functionality).CheckSpaceSquare(pAddSpaceSquare);
end;

procedure TMODELUserFunctionality__AddSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall;
begin
TMODELUserFunctionality(Functionality).AddSpaceSquare(pAddSpaceSquare);
end;

procedure TMODELUserFunctionality__SubSpaceSquare(Functionality: TFunctionality;   const pSubSpaceSquare: Double); stdcall;
begin
TMODELUserFunctionality(Functionality).SubSpaceSquare(pSubSpaceSquare);
end;

procedure TMODELUserFunctionality__CheckMaxSpaceSquarePerObject(Functionality: TFunctionality;   const pObjectSpaceSquare: Double); stdcall;
begin
TMODELUserFunctionality(Functionality).CheckMaxSpaceSquarePerObject(pObjectSpaceSquare);
end;

procedure TMODELUserFunctionality__ServerFolder_GetSubFoldersList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall;
begin
TMODELUserFunctionality(Functionality).ServerFolder_GetSubFoldersList(RelativePath,List);
end;

procedure TMODELUserFunctionality__ServerFolder_GetFilesList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall;
begin
TMODELUserFunctionality(Functionality).ServerFolder_GetFilesList(RelativePath,List);
end;

function TMODELUserFunctionality__ServerFolder_AddFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_AddFile(RelativePath,FileName,FileData);
end;

function TMODELUserFunctionality__ServerFolder_RemoveFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_RemoveFile(RelativePath,FileName);
end;

function TMODELUserFunctionality__ServerFolder_ReadFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_ReadFile(RelativePath,FileName,FileData);
end;

function TMODELUserFunctionality__ServerFolder_AddSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_AddSubFolder(RelativePath,SubFolderName);
end;

function TMODELUserFunctionality__ServerFolder_AddSubFolder1(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_AddSubFolder(RelativePath,SubFolderName,SubFolderData);
end;

function TMODELUserFunctionality__ServerFolder_RemoveSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_RemoveSubFolder(RelativePath,SubFolderName);
end;

function TMODELUserFunctionality__ServerFolder_ReadSubFolder(Functionality: TFunctionality;   const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_ReadSubFolder(Version,RelativePath,SubFolderName,Excludes,SubFolderData);
end;

function TMODELUserFunctionality__ServerFolder_ExchangeSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).ServerFolder_ExchangeSubFolder(RelativePath,SubFolderName,SubFolderInData,Excludes,SubFolderOutData);
end;

function TMODELUserFunctionality__Tasks_AddNew(Functionality: TFunctionality;   const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).Tasks_AddNew(pPriority,pType,pService,pTaskData,pComment);
end;

procedure TMODELUserFunctionality__Tasks_RemoveItem(Functionality: TFunctionality;   const idTask: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_RemoveItem(idTask);
end;

procedure TMODELUserFunctionality__Tasks_Clear(Functionality: TFunctionality); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Clear;
end;

procedure TMODELUserFunctionality__Tasks_GetData(Functionality: TFunctionality;   const Version: integer; const flOnlyActive: boolean; out oData: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_GetData(Version,flOnlyActive,oData);
end;

procedure TMODELUserFunctionality__Tasks_Item_GetTaskData(Functionality: TFunctionality;   const idTask: integer; out oTaskData: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_GetTaskData(idTask,oTaskData);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetPriority(Functionality: TFunctionality;   const idTask: integer; const pPriority: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetPriority(idTask,pPriority);
end;

procedure TMODELUserFunctionality__Tasks_Item_GetStatus(Functionality: TFunctionality;   const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_GetStatus(idTask,oStatus,oStatusReason,oStatusComment);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetStatus(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetStatus(idTask,pStatus,pStatusComment);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetStatus1(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetStatus(idTask,pStatus,pStatusReason,pStatusComment);
end;

procedure TMODELUserFunctionality__Tasks_Item_GetResultData(Functionality: TFunctionality;   const idTask: integer; out oResultData: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_GetResultData(idTask,oResultData);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetResult(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetResult(idTask,pResultCode,pResultComment);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetResult1(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetResult(idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultComment);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetResult2(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetResult(idTask,pResultCode,pResultData,pResultComment);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetResult3(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall;
begin
TMODELUserFunctionality(Functionality).Tasks_Item_SetResult(idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultData,pResultComment);
end;

procedure TMODELUserFunctionality__ClientProgram_GetReleases(Functionality: TFunctionality;   const ProgramID: integer; const Localization: WideString; out Data: TByteArray); stdcall;
begin
TMODELUserFunctionality(Functionality).ClientProgram_GetReleases(ProgramID,Localization,Data);
end;


{TTTextureFunctionality}
function TTTextureFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTextureFunctionality(Functionality)._CreateInstance;
end;

procedure TTTextureFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTextureFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTextureFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTextureFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTextureFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTextureFunctionality(Functionality).getName;
end;

function TTTextureFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTextureFunctionality(Functionality).getImage;
end;

procedure TTTextureFunctionality__GetInstanceListMatchingBy(Functionality: TFunctionality;   const NameContext: string; out List: TList); stdcall;
begin
TTTextureFunctionality(Functionality).GetInstanceListMatchingBy(NameContext,List);
end;

procedure TTTextureFunctionality__GetInstanceListMatchingBy1(Functionality: TFunctionality;   const NameContext: string; out List: TByteArray); stdcall;
begin
TTTextureFunctionality(Functionality).GetInstanceListMatchingBy(NameContext,List);
end;


{TTextureFunctionality}
procedure TTextureFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTextureFunctionality(Functionality)._ToClone(idClone);
end;

procedure TTextureFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TTextureFunctionality(Functionality).LoadFromFile(FileName);
end;

function TTextureFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTextureFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTextureFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTextureFunctionality(Functionality).getName;
end;

function TTextureFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTextureFunctionality(Functionality).getHint;
end;

procedure TTextureFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType); stdcall;
begin
TTextureFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TTextureFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TTextureFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TTextureFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TTextureDATAType); stdcall;
begin
TTextureFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TTextureFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall;
begin
TTextureFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TTextureFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;
begin
TTextureFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;

procedure TTextureFunctionality__GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall;
begin
TTextureFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;

procedure TTextureFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTextureFunctionality(Functionality).setName(Value);
end;


{TTBuffered3DVisualizationFunctionality}
function TTBuffered3DVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTBuffered3DVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTBuffered3DVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).getName;
end;

function TTBuffered3DVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).getImage;
end;

function TTBuffered3DVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TBuffered3DVisualizationFunctionality}
procedure TBuffered3DVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TBuffered3DVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TBuffered3DVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TBuffered3DVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TBuffered3DVisualizationFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).UpdateDATA;
end;

procedure TBuffered3DVisualizationFunctionality__GetData(Functionality: TFunctionality;   out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Double; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Double); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).GetData(vMeshes,vptrTransforMatrix,vScale,vTranslate_X,vTranslate_Y,vTranslate_Z,vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ);
end;

function TBuffered3DVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

procedure TBuffered3DVisualizationFunctionality__ReflectInScene(Functionality: TFunctionality;   Scene: TScene); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).ReflectInScene(Scene);
end;

function TBuffered3DVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBuffered3DVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).DATASize;
end;

function TBuffered3DVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TBuffered3DVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).getName;
end;

function TBuffered3DVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).getHint;
end;

procedure TBuffered3DVisualizationFunctionality__LoadFromStream(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).LoadFromStream(DATAStream,DATAType);
end;

procedure TBuffered3DVisualizationFunctionality__LoadFromStream1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).LoadFromStream(DATAStream,DATAType);
end;

procedure TBuffered3DVisualizationFunctionality__Get__Translate_XY(Functionality: TFunctionality;   out vTranslate_X,vTranslate_Y: Double); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).Get__Translate_XY(vTranslate_X,vTranslate_Y);
end;

procedure TBuffered3DVisualizationFunctionality__SetPropertiesLocal(Functionality: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).SetPropertiesLocal(pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
end;

function TBuffered3DVisualizationFunctionality__GetMinMax(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix; out Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Double): boolean; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).GetMinMax(TransforMatrix,Xmin,Ymin,Zmin,Xmax,Ymax,Zmax);
end;

procedure TBuffered3DVisualizationFunctionality__UpdateXOYProjection(Functionality: TFunctionality); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).UpdateXOYProjection;
end;

function TBuffered3DVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TBuffered3DVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TBuffered3DVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

function TBuffered3DVisualizationFunctionality__GetMeshesNodesApproximator(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix): TNodesApproximator; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).GetMeshesNodesApproximator(TransforMatrix);
end;

procedure TBuffered3DVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).GetParams(oScale,oTranslate_X,oTranslate_Y,oTranslate_Z,oRotate_AngleX,oRotate_AngleY,oRotate_AngleZ);
end;


{TTDATAFileFunctionality}
function TTDATAFileFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDATAFileFunctionality(Functionality)._CreateInstance;
end;

procedure TTDATAFileFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDATAFileFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDATAFileFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDATAFileFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDATAFileFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTDATAFileFunctionality(Functionality).getName;
end;

function TTDATAFileFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDATAFileFunctionality(Functionality).getImage;
end;


{TDATAFileFunctionality}
procedure TDATAFileFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDATAFileFunctionality(Functionality)._ToClone(idClone);
end;

procedure TDATAFileFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TDATAFileFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TDATAFileFunctionality__SaveToFile(Functionality: TFunctionality;   var FileName: string); stdcall;
begin
TDATAFileFunctionality(Functionality).SaveToFile(FileName);
end;

procedure TDATAFileFunctionality__Activate(Functionality: TFunctionality); stdcall;
begin
TDATAFileFunctionality(Functionality).Activate;
end;

function TDATAFileFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TDATAFileFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDATAFileFunctionality___GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality)._GetDataDocument(DataModel,DataType,flWithComponents,Document);
end;

procedure TDATAFileFunctionality__Check(Functionality: TFunctionality); stdcall;
begin
TDATAFileFunctionality(Functionality).Check;
end;

function TDATAFileFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).getName;
end;

function TDATAFileFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).getHint;
end;

function TDATAFileFunctionality__IsNull(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).IsNull;
end;

procedure TDATAFileFunctionality__Empty(Functionality: TFunctionality); stdcall;
begin
TDATAFileFunctionality(Functionality).Empty;
end;

procedure TDATAFileFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;
begin
TDATAFileFunctionality(Functionality).GetDATA(Value);
end;

procedure TDATAFileFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
TDATAFileFunctionality(Functionality).GetDATA(Value);
end;

procedure TDATAFileFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
TDATAFileFunctionality(Functionality).SetDATA(Value);
end;

procedure TDATAFileFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
TDATAFileFunctionality(Functionality).SetDATA(Value);
end;

function TDATAFileFunctionality__getDATAType(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).getDATAType;
end;

procedure TDATAFileFunctionality__setDATAType(Functionality: TFunctionality;   Value: string); stdcall;
begin
TDATAFileFunctionality(Functionality).setDATAType(Value);
end;


{TTCoComponentFunctionality}
function TTCoComponentFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoComponentFunctionality(Functionality)._CreateInstance;
end;

procedure TTCoComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCoComponentFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCoComponentFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoComponentFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoComponentFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCoComponentFunctionality(Functionality).getName;
end;

function TTCoComponentFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoComponentFunctionality(Functionality).getImage;
end;

procedure TTCoComponentFunctionality__GetInstanceListByCoType(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TList); stdcall;
begin
TTCoComponentFunctionality(Functionality).GetInstanceListByCoType(idCoType,InstanceList);
end;

procedure TTCoComponentFunctionality__GetInstanceListByCoType1(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TByteArray); stdcall;
begin
TTCoComponentFunctionality(Functionality).GetInstanceListByCoType(idCoType,InstanceList);
end;


{TCoComponentFunctionality}
procedure TCoComponentFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoComponentFunctionality(Functionality)._ToClone(idClone);
end;

function TCoComponentFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TCoComponentFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).getName;
end;

function TCoComponentFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).getHint;
end;

function TCoComponentFunctionality__idCoType(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).idCoType;
end;

function TCoComponentFunctionality__GetIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).GetIconImage(Image);
end;

function TCoComponentFunctionality__GetIconImage1(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).GetIconImage(oImage);
end;

function TCoComponentFunctionality__GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).GetVisualizationComponent(idTVisualization,idVisualization);
end;


{TTCoComponentTypeMarkerFunctionality}
function TTCoComponentTypeMarkerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoComponentTypeMarkerFunctionality(Functionality)._CreateInstance;
end;

procedure TTCoComponentTypeMarkerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCoComponentTypeMarkerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCoComponentTypeMarkerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoComponentTypeMarkerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoComponentTypeMarkerFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCoComponentTypeMarkerFunctionality(Functionality).getName;
end;

function TTCoComponentTypeMarkerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoComponentTypeMarkerFunctionality(Functionality).getImage;
end;


{TCoComponentTypeMarkerFunctionality}
procedure TCoComponentTypeMarkerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoComponentTypeMarkerFunctionality(Functionality)._ToClone(idClone);
end;

function TCoComponentTypeMarkerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentTypeMarkerFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TCoComponentTypeMarkerFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).getName;
end;

function TCoComponentTypeMarkerFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).getHint;
end;

function TCoComponentTypeMarkerFunctionality__GetTypeIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).GetTypeIconImage(Image);
end;

function TCoComponentTypeMarkerFunctionality__GetTypeIconImage1(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).GetTypeIconImage(oImage);
end;

procedure TCoComponentTypeMarkerFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TCoComponentTypeMarkerFunctionality(Functionality).setName(Value);
end;

function TCoComponentTypeMarkerFunctionality__getIDCoComponentType(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).getIDCoComponentType;
end;


{TTCoComponentTypeFunctionality}
function TTCoComponentTypeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoComponentTypeFunctionality(Functionality)._CreateInstance;
end;

procedure TTCoComponentTypeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCoComponentTypeFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCoComponentTypeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoComponentTypeFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoComponentTypeFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCoComponentTypeFunctionality(Functionality).getName;
end;

function TTCoComponentTypeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoComponentTypeFunctionality(Functionality).getImage;
end;

procedure TTCoComponentTypeFunctionality__GetInstanceListByFileType(Functionality: TFunctionality;   const FileType: shortstring; out List: TList); stdcall;
begin
TTCoComponentTypeFunctionality(Functionality).GetInstanceListByFileType(FileType,List);
end;

procedure TTCoComponentTypeFunctionality__GetInstanceListByFileType1(Functionality: TFunctionality;   const FileType: WideString; out List: TByteArray); stdcall;
begin
TTCoComponentTypeFunctionality(Functionality).GetInstanceListByFileType(FileType,List);
end;


{TCoComponentTypeFunctionality}
procedure TCoComponentTypeFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCoComponentTypeFunctionality(Functionality)._ToClone(idClone);
end;

function TCoComponentTypeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentTypeFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getName;
end;

function TCoComponentTypeFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getHint;
end;

procedure TCoComponentTypeFunctionality__GetDescription(Functionality: TFunctionality;   Value: TStringList); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).GetDescription(Value);
end;

procedure TCoComponentTypeFunctionality__GetDescription1(Functionality: TFunctionality;   out Value: TByteArray); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).GetDescription(Value);
end;

procedure TCoComponentTypeFunctionality__SetDescription(Functionality: TFunctionality;   Value: TStringList); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).SetDescription(Value);
end;

procedure TCoComponentTypeFunctionality__SetDescription1(Functionality: TFunctionality;   Value: TByteArray); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).SetDescription(Value);
end;

procedure TCoComponentTypeFunctionality__GetMarkersList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).GetMarkersList(List);
end;

procedure TCoComponentTypeFunctionality__GetMarkersList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).GetMarkersList(List);
end;

function TCoComponentTypeFunctionality__GetIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).GetIconImage(Image);
end;

function TCoComponentTypeFunctionality__GetIconImage1(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).GetIconImage(oImage);
end;

procedure TCoComponentTypeFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).setName(Value);
end;

function TCoComponentTypeFunctionality__getUID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getUID;
end;

function TCoComponentTypeFunctionality__getDateCreated(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getDateCreated;
end;

function TCoComponentTypeFunctionality__getFileType(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getFileType;
end;

procedure TCoComponentTypeFunctionality__setFileType(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).setFileType(Value);
end;

function TCoComponentTypeFunctionality__getCoComponentPrototypeID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getCoComponentPrototypeID;
end;

procedure TCoComponentTypeFunctionality__setCoComponentPrototypeID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).setCoComponentPrototypeID(Value);
end;


{TTAddressFunctionality}
function TTAddressFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTAddressFunctionality(Functionality)._CreateInstance;
end;

procedure TTAddressFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTAddressFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTAddressFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTAddressFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTAddressFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTAddressFunctionality(Functionality).getName;
end;

function TTAddressFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTAddressFunctionality(Functionality).getImage;
end;

procedure TTAddressFunctionality__Points_GetTypeNames(Functionality: TFunctionality;   out List: TStringList); stdcall;
begin
TTAddressFunctionality(Functionality).Points_GetTypeNames(List);
end;

procedure TTAddressFunctionality__Points_GetTypeNames1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTAddressFunctionality(Functionality).Points_GetTypeNames(List);
end;

procedure TTAddressFunctionality__Streets_GetTypeNames(Functionality: TFunctionality;   out List: TStringList); stdcall;
begin
TTAddressFunctionality(Functionality).Streets_GetTypeNames(List);
end;

procedure TTAddressFunctionality__Streets_GetTypeNames1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTAddressFunctionality(Functionality).Streets_GetTypeNames(List);
end;


{TAddressFunctionality}
procedure TAddressFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TAddressFunctionality(Functionality)._ToClone(idClone);
end;

function TAddressFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TAddressFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAddressFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getName;
end;

function TAddressFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getHint;
end;

function TAddressFunctionality__getIdPoint(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getIdPoint;
end;

procedure TAddressFunctionality__setIdPoint(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TAddressFunctionality(Functionality).setIdPoint(Value);
end;

function TAddressFunctionality__getPoint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getPoint;
end;

function TAddressFunctionality__getIdStreet(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getIdStreet;
end;

procedure TAddressFunctionality__setIdStreet(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TAddressFunctionality(Functionality).setIdStreet(Value);
end;

function TAddressFunctionality__getStreet(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getStreet;
end;

function TAddressFunctionality__getHouse(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getHouse;
end;

procedure TAddressFunctionality__setHouse(Functionality: TFunctionality;   Value: string); stdcall;
begin
TAddressFunctionality(Functionality).setHouse(Value);
end;

function TAddressFunctionality__getCorps(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getCorps;
end;

procedure TAddressFunctionality__setCorps(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TAddressFunctionality(Functionality).setCorps(Value);
end;

function TAddressFunctionality__getApartment(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getApartment;
end;

procedure TAddressFunctionality__setApartment(Functionality: TFunctionality;   Value: string); stdcall;
begin
TAddressFunctionality(Functionality).setApartment(Value);
end;

function TAddressFunctionality__getEntrance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getEntrance;
end;

procedure TAddressFunctionality__setEntrance(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TAddressFunctionality(Functionality).setEntrance(Value);
end;


{TTTransportRouteFunctionality}
function TTTransportRouteFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTransportRouteFunctionality(Functionality)._CreateInstance;
end;

procedure TTTransportRouteFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTransportRouteFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTransportRouteFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTransportRouteFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTransportRouteFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTransportRouteFunctionality(Functionality).getName;
end;

function TTTransportRouteFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTransportRouteFunctionality(Functionality).getImage;
end;

procedure TTTransportRouteFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTTransportRouteFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTTransportRouteFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTTransportRouteFunctionality(Functionality).GetInstanceList(List);
end;


{TTransportRouteFunctionality}
procedure TTransportRouteFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality)._ToClone(idClone);
end;

function TTransportRouteFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportRouteFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getName;
end;

procedure TTransportRouteFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTransportRouteFunctionality(Functionality).setName(Value);
end;

function TTransportRouteFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getHint;
end;

function TTransportRouteFunctionality__getidTTransport(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getidTTransport;
end;

procedure TTransportRouteFunctionality__setidTTransport(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality).setidTTransport(Value);
end;

function TTransportRouteFunctionality__getValid(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getValid;
end;

procedure TTransportRouteFunctionality__setValid(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TTransportRouteFunctionality(Functionality).setValid(Value);
end;

function TTransportRouteFunctionality__getRemarks(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getRemarks;
end;

procedure TTransportRouteFunctionality__setRemarks(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTransportRouteFunctionality(Functionality).setRemarks(Value);
end;

function TTransportRouteFunctionality__IsNodesExist(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).IsNodesExist;
end;

procedure TTransportRouteFunctionality__Nodes_GetList(Functionality: TFunctionality;   out List: TRouteNodesList); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes_GetList(List);
end;

procedure TTransportRouteFunctionality__Nodes_GetList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes_GetList(List);
end;

function TTransportRouteFunctionality__Nodes_IsNodeExist(Functionality: TFunctionality;   const idNode: integer): boolean; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).Nodes_IsNodeExist(idNode);
end;

procedure TTransportRouteFunctionality__Nodes_ChangeNodeOrder(Functionality: TFunctionality;   const idItem: integer; const Order: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes_ChangeNodeOrder(idItem,Order);
end;

function TTransportRouteFunctionality__Nodes__Node_DistanceBefore(Functionality: TFunctionality;   const idItem: integer): integer; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).Nodes__Node_DistanceBefore(idItem);
end;

procedure TTransportRouteFunctionality__Nodes__Node_SetDistanceBefore(Functionality: TFunctionality;   const idItem: integer; const D: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes__Node_SetDistanceBefore(idItem,D);
end;

function TTransportRouteFunctionality__Nodes__Node_OrderPrice(Functionality: TFunctionality;   const idItem: integer): string; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).Nodes__Node_OrderPrice(idItem);
end;

procedure TTransportRouteFunctionality__Nodes__Node_SetOrderPrice(Functionality: TFunctionality;   const idItem: integer; const Price: string); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes__Node_SetOrderPrice(idItem,Price);
end;

function TTransportRouteFunctionality__Nodes_Insert(Functionality: TFunctionality;   const idNode: integer): integer; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).Nodes_Insert(idNode);
end;

procedure TTransportRouteFunctionality__Nodes_Remove(Functionality: TFunctionality;   const idItem: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes_Remove(idItem);
end;


{TTTransportNodeFunctionality}
function TTTransportNodeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTransportNodeFunctionality(Functionality)._CreateInstance;
end;

procedure TTTransportNodeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTransportNodeFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTransportNodeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTransportNodeFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTransportNodeFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTransportNodeFunctionality(Functionality).getName;
end;

function TTTransportNodeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTransportNodeFunctionality(Functionality).getImage;
end;

procedure TTTransportNodeFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTTransportNodeFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTTransportNodeFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTTransportNodeFunctionality(Functionality).GetInstanceList(List);
end;


{TTransportNodeFunctionality}
procedure TTransportNodeFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTransportNodeFunctionality(Functionality)._ToClone(idClone);
end;

function TTransportNodeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportNodeFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).getName;
end;

procedure TTransportNodeFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTransportNodeFunctionality(Functionality).setName(Value);
end;

function TTransportNodeFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).getHint;
end;

function TTransportNodeFunctionality__IsRoutesExist(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).IsRoutesExist;
end;


{TTOfferGoodsFunctionality}
function TTOfferGoodsFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOfferGoodsFunctionality(Functionality)._CreateInstance;
end;

procedure TTOfferGoodsFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTOfferGoodsFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTOfferGoodsFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOfferGoodsFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOfferGoodsFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOfferGoodsFunctionality(Functionality).getName;
end;

function TTOfferGoodsFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOfferGoodsFunctionality(Functionality).getImage;
end;


{TOfferGoodsFunctionality}
procedure TOfferGoodsFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOfferGoodsFunctionality(Functionality)._ToClone(idClone);
end;

function TOfferGoodsFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOfferGoodsFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TOfferGoodsFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getName;
end;

function TOfferGoodsFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getHint;
end;

function TOfferGoodsFunctionality__idOffer(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).idOffer;
end;

function TOfferGoodsFunctionality__getIdGoods(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getIdGoods;
end;

procedure TOfferGoodsFunctionality__setIdGoods(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setIdGoods(Value);
end;

function TOfferGoodsFunctionality__getAmount(Functionality: TFunctionality): Double; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getAmount;
end;

procedure TOfferGoodsFunctionality__setAmount(Functionality: TFunctionality;   Value: Double); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setAmount(Value);
end;

function TOfferGoodsFunctionality__getIdMeasureUnit(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getIdMeasureUnit;
end;

procedure TOfferGoodsFunctionality__setIdMeasureUnit(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setIdMeasureUnit(Value);
end;

function TOfferGoodsFunctionality__getMeasureUnit(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getMeasureUnit;
end;

function TOfferGoodsFunctionality__getMinPrice(Functionality: TFunctionality): Currency; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getMinPrice;
end;

procedure TOfferGoodsFunctionality__setMinPrice(Functionality: TFunctionality;   Value: Currency); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setMinPrice(Value);
end;

function TOfferGoodsFunctionality__getMisc(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getMisc;
end;

procedure TOfferGoodsFunctionality__setMisc(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setMisc(Value);
end;


{TTTLFStationTMTFunctionality}
function TTTLFStationTMTFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTLFStationTMTFunctionality(Functionality)._CreateInstance;
end;

procedure TTTLFStationTMTFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTLFStationTMTFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTLFStationTMTFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTLFStationTMTFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTLFStationTMTFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTLFStationTMTFunctionality(Functionality).getName;
end;

function TTTLFStationTMTFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTLFStationTMTFunctionality(Functionality).getImage;
end;

procedure TTTLFStationTMTFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTTLFStationTMTFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTTLFStationTMTFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTTLFStationTMTFunctionality(Functionality).GetInstanceList(List);
end;


{TTLFStationTMTFunctionality}
procedure TTLFStationTMTFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTLFStationTMTFunctionality(Functionality)._ToClone(idClone);
end;

function TTLFStationTMTFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTLFStationTMTFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).getName;
end;

function TTLFStationTMTFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).getHint;
end;

function TTLFStationTMTFunctionality__getHostName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).getHostName;
end;

procedure TTLFStationTMTFunctionality__setHostName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTLFStationTMTFunctionality(Functionality).setHostName(Value);
end;

function TTLFStationTMTFunctionality__getTestChanel(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).getTestChanel;
end;

procedure TTLFStationTMTFunctionality__setTestChanel(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTLFStationTMTFunctionality(Functionality).setTestChanel(Value);
end;


{TTNameFunctionality}
function TTNameFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTNameFunctionality(Functionality)._CreateInstance;
end;

procedure TTNameFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTNameFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTNameFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTNameFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTNameFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTNameFunctionality(Functionality).getName;
end;

function TTNameFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTNameFunctionality(Functionality).getImage;
end;


{TNameFunctionality}
procedure TNameFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TNameFunctionality(Functionality)._ToClone(idClone);
end;

function TNameFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TNameFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TNameFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TNameFunctionality(Functionality).getName;
end;

function TNameFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TNameFunctionality(Functionality).getHint;
end;

function TNameFunctionality__Value(Functionality: TFunctionality): string; stdcall;
begin
Result:=TNameFunctionality(Functionality).Value;
end;

procedure TNameFunctionality__SetValue(Functionality: TFunctionality;   const NewValue: string); stdcall;
begin
TNameFunctionality(Functionality).SetValue(NewValue);
end;


{TTVisualizationFunctionality}
function TTVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality).getName;
end;

function TTVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality).getImage;
end;

function TTVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TVisualizationFunctionality}
procedure TVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).ContainerFilled;
end;

function TVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).getName;
end;

function TVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).getHint;
end;


{TTHREFVisualizationFunctionality}
function TTHREFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHREFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHREFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHREFVisualizationFunctionality(Functionality).getName;
end;

function TTHREFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHREFVisualizationFunctionality(Functionality).getImage;
end;


{THREFVisualizationFunctionality}
function THREFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=THREFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function THREFVisualizationFunctionality__DoOnOver(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=THREFVisualizationFunctionality(Functionality).DoOnOver;
end;

function THREFVisualizationFunctionality__DoOnClick(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=THREFVisualizationFunctionality(Functionality).DoOnClick;
end;

function THREFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=THREFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;


{TTTTFVisualizationFunctionality}
function TTTTFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTTTFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTTFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality).getName;
end;

function TTTTFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality).getImage;
end;

function TTTTFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TTTFVisualizationFunctionality}
procedure TTTFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTTFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

procedure TTTFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TTTFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TTTFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TTTFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TTTFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTTFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TTTFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).getName;
end;

function TTTFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).getHint;
end;

function TTTFVisualizationFunctionality__getStr(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).getStr;
end;

procedure TTTFVisualizationFunctionality__setStr(Functionality: TFunctionality;   const Value: string); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).setStr(Value);
end;

procedure TTTFVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).GetParams(oStr,oFont_Width,oFont_Height,oFont_Name);
end;

procedure TTTFVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).SetParams(pStr,pFont_Width,pFont_Height,pFont_Name);
end;


{TTObjectFunctionality}
function TTObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTObjectFunctionality(Functionality)._CreateInstance;
end;

procedure TTObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTObjectFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTObjectFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTObjectFunctionality(Functionality).getName;
end;

function TTObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTObjectFunctionality(Functionality).getImage;
end;


{TObjectFunctionality}
procedure TObjectFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TObjectFunctionality(Functionality)._ToClone(idClone);
end;

function TObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TObjectFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TObjectFunctionality(Functionality).getName;
end;

function TObjectFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TObjectFunctionality(Functionality).getHint;
end;


{TTLabelFunctionality}
function TTLabelFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTLabelFunctionality(Functionality)._CreateInstance;
end;

procedure TTLabelFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTLabelFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTLabelFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTLabelFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTLabelFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLabelFunctionality(Functionality).getName;
end;

function TTLabelFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTLabelFunctionality(Functionality).getImage;
end;


{TLabelFunctionality}
procedure TLabelFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TLabelFunctionality(Functionality)._ToClone(idClone);
end;

function TLabelFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TLabelFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLabelFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TLabelFunctionality(Functionality).getName;
end;

function TLabelFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TLabelFunctionality(Functionality).getHint;
end;


{TTStationFunctionality}
function TTStationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTStationFunctionality(Functionality)._CreateInstance;
end;

procedure TTStationFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTStationFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTStationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTStationFunctionality(Functionality).getName;
end;

function TTStationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTStationFunctionality(Functionality).getImage;
end;

function TTStationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTStationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

procedure TTStationFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTStationFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTStationFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTStationFunctionality(Functionality).GetInstanceList(List);
end;


{TStationFunctionality}
procedure TStationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TStationFunctionality(Functionality)._ToClone(idClone);
end;

function TStationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TStationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TStationFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TStationFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TStationFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TStationFunctionality(Functionality).getName;
end;

function TStationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TStationFunctionality(Functionality).getHint;
end;

procedure TStationFunctionality__GetNumbersBound(Functionality: TFunctionality;   out BegNumber,EndNumber: integer); stdcall;
begin
TStationFunctionality(Functionality).GetNumbersBound(BegNumber,EndNumber);
end;


{TTMainLineFunctionality}
function TTMainLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMainLineFunctionality(Functionality)._CreateInstance;
end;

procedure TTMainLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMainLineFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMainLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMainLineFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMainLineFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMainLineFunctionality(Functionality).getName;
end;

function TTMainLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMainLineFunctionality(Functionality).getImage;
end;


{TMainLineFunctionality}
procedure TMainLineFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMainLineFunctionality(Functionality)._ToClone(idClone);
end;

function TMainLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMainLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TMainLineFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).getName;
end;

function TMainLineFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).getHint;
end;

function TMainLineFunctionality__GetSTNOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).GetSTNOwner(idTOwner,idOwner);
end;


{TTDescriptionFunctionality}
function TTDescriptionFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDescriptionFunctionality(Functionality)._CreateInstance;
end;

procedure TTDescriptionFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDescriptionFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDescriptionFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDescriptionFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDescriptionFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTDescriptionFunctionality(Functionality).getName;
end;

function TTDescriptionFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDescriptionFunctionality(Functionality).getImage;
end;


{TDescriptionFunctionality}
procedure TDescriptionFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall;
begin
TDescriptionFunctionality(Functionality).UpdateDATA;
end;

procedure TDescriptionFunctionality__ClearDATA(Functionality: TFunctionality); stdcall;
begin
TDescriptionFunctionality(Functionality).ClearDATA;
end;

procedure TDescriptionFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDescriptionFunctionality(Functionality)._ToClone(idClone);
end;

function TDescriptionFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDescriptionFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDescriptionFunctionality___GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;
begin
Result:=TDescriptionFunctionality(Functionality)._GetDataDocument(DataModel,DataType,flWithComponents,Document);
end;

function TDescriptionFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDescriptionFunctionality(Functionality).getName;
end;

function TDescriptionFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDescriptionFunctionality(Functionality).getHint;
end;

procedure TDescriptionFunctionality__GetValue(Functionality: TFunctionality;   vText: TStringList); stdcall;
begin
TDescriptionFunctionality(Functionality).GetValue(vText);
end;

procedure TDescriptionFunctionality__GetValue1(Functionality: TFunctionality;   out vText: TByteArray); stdcall;
begin
TDescriptionFunctionality(Functionality).GetValue(vText);
end;

procedure TDescriptionFunctionality__SetValue(Functionality: TFunctionality;   NewValue: TStringList); stdcall;
begin
TDescriptionFunctionality(Functionality).SetValue(NewValue);
end;

procedure TDescriptionFunctionality__SetValue1(Functionality: TFunctionality;   NewValue: TByteArray); stdcall;
begin
TDescriptionFunctionality(Functionality).SetValue(NewValue);
end;


{TTImageFunctionality}
function TTImageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTImageFunctionality(Functionality)._CreateInstance;
end;

procedure TTImageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTImageFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTImageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTImageFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTImageFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTImageFunctionality(Functionality).getName;
end;

function TTImageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTImageFunctionality(Functionality).getImage;
end;


{TImageFunctionality}
procedure TImageFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall;
begin
TImageFunctionality(Functionality).UpdateDATA;
end;

procedure TImageFunctionality__ClearDATA(Functionality: TFunctionality); stdcall;
begin
TImageFunctionality(Functionality).ClearDATA;
end;

procedure TImageFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TImageFunctionality(Functionality)._ToClone(idClone);
end;

procedure TImageFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TImageFunctionality(Functionality).LoadFromFile(FileName);
end;

function TImageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TImageFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TImageFunctionality___GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;
begin
Result:=TImageFunctionality(Functionality)._GetDataDocument(DataModel,DataType,flWithComponents,Document);
end;

function TImageFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TImageFunctionality(Functionality).getName;
end;

function TImageFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TImageFunctionality(Functionality).getHint;
end;

function TImageFunctionality__GetDATAType(Functionality: TFunctionality): TImageDATAType; stdcall;
begin
Result:=TImageFunctionality(Functionality).GetDATAType;
end;

function TImageFunctionality__GetDATAType1(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TImageFunctionality(Functionality).GetDATAType1;
end;

procedure TImageFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall;
begin
TImageFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TImageFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;
begin
TImageFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TImageFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall;
begin
TImageFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TImageFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall;
begin
TImageFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TImageFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;
begin
TImageFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;

procedure TImageFunctionality__GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall;
begin
TImageFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;


{TTWellFunctionality}
function TTWellFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTWellFunctionality(Functionality)._CreateInstance;
end;

procedure TTWellFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTWellFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTWellFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTWellFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTWellFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTWellFunctionality(Functionality).getName;
end;

function TTWellFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTWellFunctionality(Functionality).getImage;
end;


{TWellFunctionality}
procedure TWellFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TWellFunctionality(Functionality)._ToClone(idClone);
end;

function TWellFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TWellFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWellFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TWellFunctionality(Functionality).getName;
end;

function TWellFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TWellFunctionality(Functionality).getHint;
end;


{TTBoxFunctionality}
function TTBoxFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTBoxFunctionality(Functionality)._CreateInstance;
end;

procedure TTBoxFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTBoxFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTBoxFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTBoxFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTBoxFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTBoxFunctionality(Functionality).getName;
end;

function TTBoxFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTBoxFunctionality(Functionality).getImage;
end;


{TBoxFunctionality}
procedure TBoxFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TBoxFunctionality(Functionality)._ToClone(idClone);
end;

function TBoxFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TBoxFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBoxFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TBoxFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TBoxFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBoxFunctionality(Functionality).getName;
end;

function TBoxFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TBoxFunctionality(Functionality).getHint;
end;


{TTCableBoxFunctionality}
function TTCableBoxFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCableBoxFunctionality(Functionality)._CreateInstance;
end;

procedure TTCableBoxFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCableBoxFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCableBoxFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCableBoxFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCableBoxFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCableBoxFunctionality(Functionality).getName;
end;

function TTCableBoxFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCableBoxFunctionality(Functionality).getImage;
end;


{TCableBoxFunctionality}
procedure TCableBoxFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCableBoxFunctionality(Functionality)._ToClone(idClone);
end;

function TCableBoxFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCableBoxFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCableBoxFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCableBoxFunctionality(Functionality).getName;
end;

function TCableBoxFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCableBoxFunctionality(Functionality).getHint;
end;


{TTDistrLineFunctionality}
function TTDistrLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDistrLineFunctionality(Functionality)._CreateInstance;
end;

procedure TTDistrLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDistrLineFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDistrLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDistrLineFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDistrLineFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTDistrLineFunctionality(Functionality).getName;
end;

function TTDistrLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDistrLineFunctionality(Functionality).getImage;
end;


{TDistrLineFunctionality}
procedure TDistrLineFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDistrLineFunctionality(Functionality)._ToClone(idClone);
end;

function TDistrLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDistrLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TDistrLineFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).getName;
end;

function TDistrLineFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).getHint;
end;


{TTClientFunctionality}
function TTClientFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTClientFunctionality(Functionality)._CreateInstance;
end;

procedure TTClientFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTClientFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTClientFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTClientFunctionality(Functionality).getName;
end;

function TTClientFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTClientFunctionality(Functionality).getImage;
end;

function TTClientFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTClientFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

procedure TTClientFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TTClientFunctionality(Functionality).GetInstanceList(List);
end;

procedure TTClientFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TTClientFunctionality(Functionality).GetInstanceList(List);
end;


{TClientFunctionality}
procedure TClientFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TClientFunctionality(Functionality)._ToClone(idClone);
end;

function TClientFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TClientFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TClientFunctionality__GetDebet(Functionality: TFunctionality;   out Value: Double): boolean; stdcall;
begin
Result:=TClientFunctionality(Functionality).GetDebet(Value);
end;

function TClientFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TClientFunctionality(Functionality).getName;
end;

function TClientFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TClientFunctionality(Functionality).getHint;
end;


{TTHouseFunctionality}
function TTHouseFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHouseFunctionality(Functionality)._CreateInstance;
end;

procedure TTHouseFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTHouseFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTHouseFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHouseFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHouseFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHouseFunctionality(Functionality).getName;
end;

function TTHouseFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHouseFunctionality(Functionality).getImage;
end;


{THouseFunctionality}
procedure THouseFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THouseFunctionality(Functionality)._ToClone(idClone);
end;

function THouseFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THouseFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THouseFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=THouseFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function THouseFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=THouseFunctionality(Functionality).getName;
end;

function THouseFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=THouseFunctionality(Functionality).getHint;
end;


{TTCommNodeFunctionality}
function TTCommNodeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCommNodeFunctionality(Functionality)._CreateInstance;
end;

procedure TTCommNodeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCommNodeFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCommNodeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCommNodeFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCommNodeFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCommNodeFunctionality(Functionality).getName;
end;

function TTCommNodeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCommNodeFunctionality(Functionality).getImage;
end;


{TCommNodeFunctionality}
procedure TCommNodeFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCommNodeFunctionality(Functionality)._ToClone(idClone);
end;

function TCommNodeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCommNodeFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCommNodeFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCommNodeFunctionality(Functionality).getName;
end;

function TCommNodeFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCommNodeFunctionality(Functionality).getHint;
end;


{TTCrossFunctionality}
function TTCrossFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCrossFunctionality(Functionality)._CreateInstance;
end;

procedure TTCrossFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCrossFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCrossFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCrossFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCrossFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCrossFunctionality(Functionality).getName;
end;

function TTCrossFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCrossFunctionality(Functionality).getImage;
end;


{TCrossFunctionality}
procedure TCrossFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCrossFunctionality(Functionality)._ToClone(idClone);
end;

function TCrossFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCrossFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCrossFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCrossFunctionality(Functionality).getName;
end;

function TCrossFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCrossFunctionality(Functionality).getHint;
end;


{TTCaseFunctionality}
function TTCaseFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCaseFunctionality(Functionality)._CreateInstance;
end;

procedure TTCaseFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCaseFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCaseFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCaseFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCaseFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCaseFunctionality(Functionality).getName;
end;

function TTCaseFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCaseFunctionality(Functionality).getImage;
end;


{TCaseFunctionality}
procedure TCaseFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCaseFunctionality(Functionality)._ToClone(idClone);
end;

function TCaseFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCaseFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCaseFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCaseFunctionality(Functionality).getName;
end;

function TCaseFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCaseFunctionality(Functionality).getHint;
end;


{TTStreetFunctionality}
function TTStreetFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTStreetFunctionality(Functionality)._CreateInstance;
end;

procedure TTStreetFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTStreetFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTStreetFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTStreetFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTStreetFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTStreetFunctionality(Functionality).getName;
end;

function TTStreetFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTStreetFunctionality(Functionality).getImage;
end;


{TStreetFunctionality}
procedure TStreetFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TStreetFunctionality(Functionality)._ToClone(idClone);
end;

function TStreetFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TStreetFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TStreetFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TStreetFunctionality(Functionality).getName;
end;

function TStreetFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TStreetFunctionality(Functionality).getHint;
end;


{TTOtherObjFunctionality}
function TTOtherObjFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOtherObjFunctionality(Functionality)._CreateInstance;
end;

procedure TTOtherObjFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTOtherObjFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTOtherObjFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOtherObjFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOtherObjFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOtherObjFunctionality(Functionality).getName;
end;

function TTOtherObjFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOtherObjFunctionality(Functionality).getImage;
end;


{TOtherObjFunctionality}
procedure TOtherObjFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOtherObjFunctionality(Functionality)._ToClone(idClone);
end;

function TOtherObjFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOtherObjFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOtherObjFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOtherObjFunctionality(Functionality).getName;
end;

function TOtherObjFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOtherObjFunctionality(Functionality).getHint;
end;


{TTSpanFunctionality}
function TTSpanFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSpanFunctionality(Functionality)._CreateInstance;
end;

procedure TTSpanFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSpanFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSpanFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSpanFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSpanFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTSpanFunctionality(Functionality).getName;
end;

function TTSpanFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSpanFunctionality(Functionality).getImage;
end;


{TSpanFunctionality}
procedure TSpanFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TSpanFunctionality(Functionality)._ToClone(idClone);
end;

function TSpanFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSpanFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSpanFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSpanFunctionality(Functionality).getName;
end;

function TSpanFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TSpanFunctionality(Functionality).getHint;
end;


{TTChanelFunctionality}
function TTChanelFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTChanelFunctionality(Functionality)._CreateInstance;
end;

procedure TTChanelFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTChanelFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTChanelFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTChanelFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTChanelFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTChanelFunctionality(Functionality).getName;
end;

function TTChanelFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTChanelFunctionality(Functionality).getImage;
end;


{TChanelFunctionality}
procedure TChanelFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TChanelFunctionality(Functionality)._ToClone(idClone);
end;

function TChanelFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TChanelFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TChanelFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TChanelFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TChanelFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TChanelFunctionality(Functionality).getName;
end;

function TChanelFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TChanelFunctionality(Functionality).getHint;
end;


{TTHandHoldFunctionality}
function TTHandHoldFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHandHoldFunctionality(Functionality)._CreateInstance;
end;

procedure TTHandHoldFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTHandHoldFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTHandHoldFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHandHoldFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHandHoldFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTHandHoldFunctionality(Functionality).getName;
end;

function TTHandHoldFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHandHoldFunctionality(Functionality).getImage;
end;


{THandHoldFunctionality}
procedure THandHoldFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
THandHoldFunctionality(Functionality)._ToClone(idClone);
end;

function THandHoldFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THandHoldFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THandHoldFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=THandHoldFunctionality(Functionality).getName;
end;

function THandHoldFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=THandHoldFunctionality(Functionality).getHint;
end;


{TTLineDistFunctionality}
function TTLineDistFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTLineDistFunctionality(Functionality)._CreateInstance;
end;

procedure TTLineDistFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTLineDistFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTLineDistFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTLineDistFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTLineDistFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLineDistFunctionality(Functionality).getName;
end;

function TTLineDistFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTLineDistFunctionality(Functionality).getImage;
end;


{TLineDistFunctionality}
procedure TLineDistFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TLineDistFunctionality(Functionality)._ToClone(idClone);
end;

function TLineDistFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TLineDistFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLineDistFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TLineDistFunctionality(Functionality).getName;
end;

function TLineDistFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TLineDistFunctionality(Functionality).getHint;
end;


{TTMuffFunctionality}
function TTMuffFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMuffFunctionality(Functionality)._CreateInstance;
end;

procedure TTMuffFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMuffFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMuffFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMuffFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMuffFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTMuffFunctionality(Functionality).getName;
end;

function TTMuffFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMuffFunctionality(Functionality).getImage;
end;


{TMuffFunctionality}
procedure TMuffFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TMuffFunctionality(Functionality)._ToClone(idClone);
end;

function TMuffFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMuffFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMuffFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMuffFunctionality(Functionality).getName;
end;

function TMuffFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMuffFunctionality(Functionality).getHint;
end;


{TTOfferFunctionality}
function TTOfferFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOfferFunctionality(Functionality)._CreateInstance;
end;

procedure TTOfferFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTOfferFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTOfferFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOfferFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOfferFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTOfferFunctionality(Functionality).getName;
end;

function TTOfferFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOfferFunctionality(Functionality).getImage;
end;

function TTOfferFunctionality__GetOfferByHumanID(Functionality: TFunctionality;   const HumanID: integer; out idOffer: integer): boolean; stdcall;
begin
Result:=TTOfferFunctionality(Functionality).GetOfferByHumanID(HumanID,idOffer);
end;


{TOfferFunctionality}
procedure TOfferFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TOfferFunctionality(Functionality)._ToClone(idClone);
end;

function TOfferFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOfferFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOfferFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TOfferFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TOfferFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getName;
end;

procedure TOfferFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOfferFunctionality(Functionality).setName(Value);
end;

function TOfferFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getHint;
end;

function TOfferFunctionality__getSchedule(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getSchedule;
end;

procedure TOfferFunctionality__setSchedule(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOfferFunctionality(Functionality).setSchedule(Value);
end;

function TOfferFunctionality__getPassword(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getPassword;
end;

procedure TOfferFunctionality__setPassword(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOfferFunctionality(Functionality).setPassword(Value);
end;

function TOfferFunctionality__getContactTLF(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getContactTLF;
end;

procedure TOfferFunctionality__setContactTLF(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOfferFunctionality(Functionality).setContactTLF(Value);
end;

function TOfferFunctionality__getLastUpdated(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getLastUpdated;
end;

procedure TOfferFunctionality__setLastUpdated(Functionality: TFunctionality;   Value: TDateTime); stdcall;
begin
TOfferFunctionality(Functionality).setLastUpdated(Value);
end;

procedure TOfferFunctionality__LoadDATAFromStream(Functionality: TFunctionality;   Stream: TStream); stdcall;
begin
TOfferFunctionality(Functionality).LoadDATAFromStream(Stream);
end;

procedure TOfferFunctionality__LoadDATAFromStream1(Functionality: TFunctionality;   Stream: TByteArray); stdcall;
begin
TOfferFunctionality(Functionality).LoadDATAFromStream(Stream);
end;

function TOfferFunctionality__UserID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferFunctionality(Functionality).UserID;
end;

function TOfferFunctionality__UID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferFunctionality(Functionality).UID;
end;

function TOfferFunctionality__AddressStr(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferFunctionality(Functionality).AddressStr;
end;

function TOfferFunctionality__Goods_Insert(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferFunctionality(Functionality).Goods_Insert;
end;

procedure TOfferFunctionality__Goods_GetList(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TOfferFunctionality(Functionality).Goods_GetList(List);
end;

procedure TOfferFunctionality__Goods_GetList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TOfferFunctionality(Functionality).Goods_GetList(List);
end;

procedure TOfferFunctionality__Goods_Remove(Functionality: TFunctionality;   const idOfferGoods: integer); stdcall;
begin
TOfferFunctionality(Functionality).Goods_Remove(idOfferGoods);
end;

procedure TOfferFunctionality__Goods_Clear(Functionality: TFunctionality); stdcall;
begin
TOfferFunctionality(Functionality).Goods_Clear;
end;


{TTDemandFunctionality}
function TTDemandFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDemandFunctionality(Functionality)._CreateInstance;
end;

procedure TTDemandFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDemandFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDemandFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDemandFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDemandFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTDemandFunctionality(Functionality).getName;
end;

function TTDemandFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDemandFunctionality(Functionality).getImage;
end;


{TDemandFunctionality}
procedure TDemandFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TDemandFunctionality(Functionality)._ToClone(idClone);
end;

function TDemandFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDemandFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDemandFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TDemandFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TDemandFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDemandFunctionality(Functionality).getName;
end;

function TDemandFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDemandFunctionality(Functionality).getHint;
end;


{TTCommLineFunctionality}
function TTCommLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCommLineFunctionality(Functionality)._CreateInstance;
end;

procedure TTCommLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCommLineFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCommLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCommLineFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCommLineFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCommLineFunctionality(Functionality).getName;
end;

function TTCommLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCommLineFunctionality(Functionality).getImage;
end;


{TCommLineFunctionality}
procedure TCommLineFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCommLineFunctionality(Functionality)._ToClone(idClone);
end;

function TCommLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCommLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TCommLineFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).getName;
end;

function TCommLineFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).getHint;
end;


{TTGoodsFunctionality}
function TTGoodsFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality)._CreateInstance;
end;

procedure TTGoodsFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGoodsFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGoodsFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGoodsFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality).getName;
end;

function TTGoodsFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality).getImage;
end;

procedure TTGoodsFunctionality__GetInstanceListContainingContext(Functionality: TFunctionality;   const Context: string; out List: TStringList); stdcall;
begin
TTGoodsFunctionality(Functionality).GetInstanceListContainingContext(Context,List);
end;

procedure TTGoodsFunctionality__GetInstanceListContainingContext1(Functionality: TFunctionality;   const Context: string; out List: TByteArray); stdcall;
begin
TTGoodsFunctionality(Functionality).GetInstanceListContainingContext(Context,List);
end;

function TTGoodsFunctionality__IsInstanceExist(Functionality: TFunctionality;   const pName: string; out idGoods: integer): boolean; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality).IsInstanceExist(pName,idGoods);
end;


{TGoodsFunctionality}
procedure TGoodsFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TGoodsFunctionality(Functionality)._ToClone(idClone);
end;

function TGoodsFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGoodsFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).getName;
end;

procedure TGoodsFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TGoodsFunctionality(Functionality).setName(Value);
end;

function TGoodsFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).getHint;
end;

function TGoodsFunctionality__StdAmount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).StdAmount;
end;

function TGoodsFunctionality__StdMeasureUnit(Functionality: TFunctionality): string; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).StdMeasureUnit;
end;


{TTCollectionFunctionality}
function TTCollectionFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCollectionFunctionality(Functionality)._CreateInstance;
end;

procedure TTCollectionFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCollectionFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCollectionFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCollectionFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCollectionFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTCollectionFunctionality(Functionality).getName;
end;

function TTCollectionFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCollectionFunctionality(Functionality).getImage;
end;


{TCollectionFunctionality}
procedure TCollectionFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;
begin
TCollectionFunctionality(Functionality)._ToClone(idClone);
end;

function TCollectionFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCollectionFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).getName;
end;

procedure TCollectionFunctionality__setName(Functionality: TFunctionality;   const Value: string); stdcall;
begin
TCollectionFunctionality(Functionality).setName(Value);
end;

function TCollectionFunctionality__getHint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).getHint;
end;

function TCollectionFunctionality__InsertItem(Functionality: TFunctionality;   const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).InsertItem(idTItem,idItem,Alias,ListOrder);
end;

procedure TCollectionFunctionality__RemoveItem(Functionality: TFunctionality;   const id: integer); stdcall;
begin
TCollectionFunctionality(Functionality).RemoveItem(id);
end;

procedure TCollectionFunctionality__Item_ChangeAlias(Functionality: TFunctionality;   const id: integer; const pAlias: string); stdcall;
begin
TCollectionFunctionality(Functionality).Item_ChangeAlias(id,pAlias);
end;

procedure TCollectionFunctionality__Item_ChangeListOrder(Functionality: TFunctionality;   const id: integer; const Order: integer); stdcall;
begin
TCollectionFunctionality(Functionality).Item_ChangeListOrder(id,Order);
end;

procedure TCollectionFunctionality__RemoveItems(Functionality: TFunctionality); stdcall;
begin
TCollectionFunctionality(Functionality).RemoveItems;
end;

function TCollectionFunctionality__IsItemExist(Functionality: TFunctionality;   const idTItem,idItem: integer): boolean; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).IsItemExist(idTItem,idItem);
end;

procedure TCollectionFunctionality__GetListItems(Functionality: TFunctionality;   out List: TList); stdcall;
begin
TCollectionFunctionality(Functionality).GetListItems(List);
end;

procedure TCollectionFunctionality__GetListItems1(Functionality: TFunctionality;   out List: TByteArray); stdcall;
begin
TCollectionFunctionality(Functionality).GetListItems(List);
end;

procedure TCollectionFunctionality__SaveListItems(Functionality: TFunctionality;   List: TList); stdcall;
begin
TCollectionFunctionality(Functionality).SaveListItems(List);
end;

procedure TCollectionFunctionality__SaveListItems1(Functionality: TFunctionality;   const List: TByteArray); stdcall;
begin
TCollectionFunctionality(Functionality).SaveListItems(List);
end;


