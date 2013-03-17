//. Server import types functionality routines implementations
const TypesDLL = SpaceEmbeddedServerExecutive;


function  Space_TTypeFunctionality_Create(const idType: integer; const pUserName,pUserPassword: WideString): TFunctionality; stdcall; external TypesDLL name 'Space_TTypeFunctionality_Create'
function  Space_TComponentFunctionality_Create(const idTObj,idObj: integer; const pUserName,pUserPassword: WideString): TFunctionality; stdcall; external TypesDLL name 'Space_TComponentFunctionality_Create'
procedure Space_TFunctionality_Release(var F: TFunctionality); stdcall; external TypesDLL name 'Space_TFunctionality_Release'


{TTTileServerVisualizationFunctionality}
function TTTileServerVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality_CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TTileServerVisualizationFunctionality}
procedure TTileServerVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_SetProportion(Functionality: TFunctionality;   const Value: double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_UserData_GetTileProviderID(Functionality: TFunctionality;   out oTileProviderID: integer): boolean; stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_UserData_SetTileProviderID(Functionality: TFunctionality;   const pTileProviderID: integer); stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_GetParams1(Functionality: TFunctionality;   out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_SetServerType(Functionality: TFunctionality;   const Value: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_SetServerURL(Functionality: TFunctionality;   const Value: string); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_SetServerData(Functionality: TFunctionality;   const Data: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_SetServerData1(Functionality: TFunctionality;   const pData: TMemoryStream); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_Level_GetSegments(Functionality: TFunctionality;   const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality_GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;

{TTMeasurementObjectFunctionality}
function TTMeasurementObjectFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTMeasurementObjectFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality_CreateNewInstance(Functionality: TFunctionality;   const pName: string; const pDomains: string): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality_CreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality_CheckCreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall; external TypesDLL;
procedure TTMeasurementObjectFunctionality_GetInstanceListByNameContext(Functionality: TFunctionality;   const pName: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMeasurementObjectFunctionality_GetInstanceDataByNameContext(Functionality: TFunctionality;   const pName: string; const Version: integer; out oData: TByteArray); stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality_GetInstanceByGUID(Functionality: TFunctionality;   const pGUID: string): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality_GetInstanceByGSOMeasurement(Functionality: TFunctionality;   const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer; stdcall; external TypesDLL;

{TMeasurementObjectFunctionality}
procedure TMeasurementObjectFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TMeasurementObjectFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TMeasurementObjectFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality_getGUID(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality_getDomains(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality_setDomains(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality_GetParams(Functionality: TFunctionality;   out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality_GSOMeasurements_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality_GSOMeasurements_GetData(Functionality: TFunctionality;   const Version: integer; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality_GSOMeasurements_Item_GetParams(Functionality: TFunctionality;   const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality_GSOMeasurements_Item_GetParams1(Functionality: TFunctionality;   const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality_GSOMeasurements_Item_GetData(Functionality: TFunctionality;   const idMeasurement: integer; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality_GSOMeasurements_Item_GetData1(Functionality: TFunctionality;   const TimeID: Double; out oData: TByteArray); stdcall; external TypesDLL;

{TTAreaNotificationServerFunctionality}
function TTAreaNotificationServerFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTAreaNotificationServerFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTAreaNotificationServerFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTAreaNotificationServerFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTAreaNotificationServerFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TAreaNotificationServerFunctionality}
procedure TAreaNotificationServerFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TAreaNotificationServerFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality_getInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TAreaNotificationServerFunctionality_setInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;

{TTMODELServerVisualizationFunctionality}
function TTMODELServerVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TMODELServerVisualizationFunctionality}
procedure TMODELServerVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
procedure TMODELServerVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMODELServerVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality_ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality_ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality_getServerURL(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMODELServerVisualizationFunctionality_setServerURL(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;

{TTDoubleVarFunctionality}
function TTDoubleVarFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTDoubleVarFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTDoubleVarFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDoubleVarFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDoubleVarFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TDoubleVarFunctionality}
procedure TDoubleVarFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TDoubleVarFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDoubleVarFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TDoubleVarFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDoubleVarFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDoubleVarFunctionality_getValue(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TDoubleVarFunctionality_setValue(Functionality: TFunctionality;   _Value: Double); stdcall; external TypesDLL;
function TDoubleVarFunctionality_getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;

{TTInt32VarFunctionality}
function TTInt32VarFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTInt32VarFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTInt32VarFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTInt32VarFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTInt32VarFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TInt32VarFunctionality}
procedure TInt32VarFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TInt32VarFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TInt32VarFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TInt32VarFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TInt32VarFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TInt32VarFunctionality_getValue(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TInt32VarFunctionality_setValue(Functionality: TFunctionality;   _Value: integer); stdcall; external TypesDLL;
function TInt32VarFunctionality_getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;

{TTURLFunctionality}
function TTURLFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTURLFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTURLFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTURLFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTURLFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TURLFunctionality}
procedure TURLFunctionality_UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TURLFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TURLFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TURLFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TURLFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TURLFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TURLFunctionality_getURL(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TURLFunctionality_setURL(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TURLFunctionality_getURLName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TURLFunctionality_setURLName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TURLFunctionality_getflPanelBrowser(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TURLFunctionality_setflPanelBrowser(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TURLFunctionality_GetParams(Functionality: TFunctionality;   out oURL: string; out oURLName: string; out oflPanelBrowser: boolean); stdcall; external TypesDLL;
procedure TURLFunctionality_SetParams(Functionality: TFunctionality;   const pURL: string; const pURLName: string; const pflPanelBrowser: boolean); stdcall; external TypesDLL;

{TTPatternVisualizationFunctionality}
function TTPatternVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TPatternVisualizationFunctionality}
procedure TPatternVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
function TPatternVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality_GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality_GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
function TPatternVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality_getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality_setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality_DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;

{TTMapFormatObjectFunctionality}
function TTMapFormatObjectFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTMapFormatObjectFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTMapFormatObjectFunctionality_GetInstanceNames(Functionality: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality_GetDATAHash(Functionality: TFunctionality;   DATAStream: TByteArray): integer; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality_GetDATAHash1(Functionality: TFunctionality;   DATAStream: TMemoryStream): integer; stdcall; external TypesDLL;

{TMapFormatObjectFunctionality}
procedure TMapFormatObjectFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TMapFormatObjectFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality_DATAPanel_Create(Functionality: TFunctionality): TForm; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality_Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality__GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality_GetHintInfo(Functionality: TFunctionality;   const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality_getidMap(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_setidMap(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMapFormatObjectFunctionality_getFormatID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_setFormatID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMapFormatObjectFunctionality_getKindID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_setKindID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMapFormatObjectFunctionality_getTypeID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_setTypeID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMapFormatObjectFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
function TMapFormatObjectFunctionality_getDATAHash(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_setDATAHash(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_GetParams(Functionality: TFunctionality;   out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_SetParams(Functionality: TFunctionality;   const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_SetObjectByDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_UpdateDATAHash(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_Compile(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality_Build(Functionality: TFunctionality;   const flUsePrototype: boolean); stdcall; external TypesDLL;

{TTMapFormatMapFunctionality}
function TTMapFormatMapFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTMapFormatMapFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTMapFormatMapFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMapFormatMapFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMapFormatMapFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTMapFormatMapFunctionality_GetInstanceListByGeoSpace(Functionality: TFunctionality;   const idGeoSpace: integer; out List: TByteArray); stdcall; external TypesDLL;

{TMapFormatMapFunctionality}
procedure TMapFormatMapFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TMapFormatMapFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMapFormatMapFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TMapFormatMapFunctionality_getGeoSpaceID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMapFormatMapFunctionality_getFormatID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_setFormatID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMapFormatMapFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_GetObjectPrototypesDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_GetObjectPrototypesDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_SetObjectPrototypesDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_SetObjectPrototypesDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
function TMapFormatMapFunctionality_GetObjectPrototype(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean; stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_GetParams(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oFormatID: integer; out oName: string); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_SetParams(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pFormatID: integer; const pName: string); stdcall; external TypesDLL;
function TMapFormatMapFunctionality_ObjectsCounter(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_GetObjectsList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_GetObjectsList1(Functionality: TFunctionality;   const KindID: integer; out List: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_GetObjectsList2(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out List: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_GetObjectsList3(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray); stdcall; external TypesDLL;
function TMapFormatMapFunctionality_GetObject(Functionality: TFunctionality;   const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall; external TypesDLL;
function TMapFormatMapFunctionality_GetObject1(Functionality: TFunctionality;   const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_ExportMap(Functionality: TFunctionality;   const pFormatID: integer; out ZipData: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_RemoveObjects(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_RemoveObjects1(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_UpdateObjectDATAHashes(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_RecalculateMapArea(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality_RemoveIrrelevantObjectsInMapArea(Functionality: TFunctionality); stdcall; external TypesDLL;

{TTSPLVisualizationFunctionality}
function TTSPLVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TSPLVisualizationFunctionality}
procedure TSPLVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TSPLVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out SPLType: integer; out SPLDATA: TByteArray); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality_SetParams(Functionality: TFunctionality;   const SPLType: integer; const SPLDATA: TByteArray); stdcall; external TypesDLL;

{TTBoolVarFunctionality}
function TTBoolVarFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTBoolVarFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTBoolVarFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTBoolVarFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTBoolVarFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TBoolVarFunctionality}
procedure TBoolVarFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TBoolVarFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TBoolVarFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TBoolVarFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBoolVarFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBoolVarFunctionality_getValue(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TBoolVarFunctionality_setValue(Functionality: TFunctionality;   _Value: boolean); stdcall; external TypesDLL;
function TBoolVarFunctionality_getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;

{TTGeoSpaceFunctionality}
function TTGeoSpaceFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTGeoSpaceFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTGeoSpaceFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeoSpaceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeoSpaceFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TGeoSpaceFunctionality}
procedure TGeoSpaceFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TGeoSpaceFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGeoSpaceFunctionality_GetDatumIDLocally(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoSpaceFunctionality_ConvertGeoToXYLocally(Functionality: TFunctionality;   const Lat,Long: Extended; out Xr,Yr: Extended): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality_ConvertXYToGeoLocally(Functionality: TFunctionality;   const X,Y: Extended; out Lat,Long: Extended): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality_GetDistanceBetweenTwoXYPointsLocally(Functionality: TFunctionality;   const X0,Y0,X1,Y1: Extended; out Distance: Extended): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TGeoSpaceFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoSpaceFunctionality_getDatumID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality_setDatumID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TGeoSpaceFunctionality_getProjectionID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality_setProjectionID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TGeoSpaceFunctionality_ConvertXYToLatLong(Functionality: TFunctionality;   const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality_ConvertXYToDatumLatLong(Functionality: TFunctionality;   const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality_ConvertLatLongToXY(Functionality: TFunctionality;   const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality_ConvertDatumLatLongToXY(Functionality: TFunctionality;   const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality_GetGeoCrdSystemList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality_GetGeoCrdSystemList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality_GetMapFormatMapList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality_GetMapFormatMapList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality_GetMapFormatMapObjectsByNameContext(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality_GetMapFormatMapObjectsByNameContext1(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TList); stdcall; external TypesDLL;

{TTUserAlertFunctionality}
function TTUserAlertFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTUserAlertFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTUserAlertFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTUserAlertFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTUserAlertFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTUserAlertFunctionality_GetActiveInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTUserAlertFunctionality_GetActiveInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;

{TUserAlertFunctionality}
procedure TUserAlertFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TUserAlertFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TUserAlertFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TUserAlertFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUserAlertFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUserAlertFunctionality_getUserID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TUserAlertFunctionality_setUserID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TUserAlertFunctionality_getTimeStamp(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
procedure TUserAlertFunctionality_setTimeStamp(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
function TUserAlertFunctionality_getActive(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TUserAlertFunctionality_setActive(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
function TUserAlertFunctionality_getAlertID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TUserAlertFunctionality_setAlertID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TUserAlertFunctionality_getSeverity(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TUserAlertFunctionality_setSeverity(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TUserAlertFunctionality_getDescription(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TUserAlertFunctionality_setDescription(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TUserAlertFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TUserAlertFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TUserAlertFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TUserAlertFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;

{TTGeoGraphServerObjectFunctionality}
function TTGeoGraphServerObjectFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTGeoGraphServerObjectFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality_GetInstanceByServerObject(Functionality: TFunctionality;   const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean; stdcall; external TypesDLL;

{TGeoGraphServerObjectFunctionality}
procedure TGeoGraphServerObjectFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality_AttachObject(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality_DetachObject(Functionality: TFunctionality); stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_getGeoGraphServerID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality_setGeoGraphServerID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_getObjectID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality_setObjectID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_getBusinessModelID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality_setBusinessModelID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_getDomains(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality_setDomains(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality_GetParams(Functionality: TFunctionality;   out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality_ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_GetNearestMapFormatObjects(Functionality: TFunctionality;   const MaxDistance: double; out List: TByteArray): boolean; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_GetNearestMapFormatObjectsNames(Functionality: TFunctionality;   const MaxDistance: double; out Names: WideString): boolean; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_Measurements_AddNew(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality_Measurements_AddNew1(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer; stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality_Measurements_Remove(Functionality: TFunctionality;   const pidMeasurement: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality_Measurements_Item_UpdateData(Functionality: TFunctionality;   const pTimeID: Double; const pData: TByteArray); stdcall; external TypesDLL;

{TTGeoGraphServerFunctionality}
function TTGeoGraphServerFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTGeoGraphServerFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTGeoGraphServerFunctionality_GetActiveInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTGeoGraphServerFunctionality_GetActiveInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality_GetInstanceForRegistration(Functionality: TFunctionality): integer; stdcall; external TypesDLL;

{TGeoGraphServerFunctionality}
procedure TGeoGraphServerFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_SetData(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_getAddress(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_setAddress(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_getInternalAddress(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_setInternalAddress(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_getInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_setInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_GetData(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_GetData1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_RegisterObject(Functionality: TFunctionality;   const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_RegisterObject1(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_RegisterObject2(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer; stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_UnRegisterObject(Functionality: TFunctionality;   const ObjectID: integer); stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_ObjectCounter(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_Object_GetProperties(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_Object_GetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_Object_SetProperties(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_Object_SetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer); stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_Object_GetObjectType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_Object_SetObjectType(Functionality: TFunctionality;   const ObjectID: integer; const ObjectType: integer); stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_Object_GetBusinessType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_Object_SetBusinessType(Functionality: TFunctionality;   const ObjectID: integer; const BusinessType: integer); stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_Object_GetComponentID(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_Object_SetComponentID(Functionality: TFunctionality;   const ObjectID: integer; const ObjectComponentID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality_Object_ExecuteOperation(Functionality: TFunctionality;   const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray); stdcall; external TypesDLL;
function TGeoGraphServerFunctionality_DataID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;

{TTGeoCrdSystemFunctionality}
function TTGeoCrdSystemFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTGeoCrdSystemFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeoCrdSystemFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeoCrdSystemFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality_GetInstanceByLatLongLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality_GetInstanceByLatLongLocally1(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality_GetInstanceByXYLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality_GetInstanceByXYLocally1(Functionality: TFunctionality;   const pX,pY: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality_GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality_GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality_GetInstanceByLatLong(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality_GetInstanceByXY(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall; external TypesDLL;

{TGeoCrdSystemFunctionality}
procedure TGeoCrdSystemFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality_GetDataLocally(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oName: string; out oDatum: string; out oProjection: string; out oProjectionData: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality_GetGeodesyPointsLocally(Functionality: TFunctionality;   out Points: TByteArray); stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality_getGeoSpaceID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality_setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality_getDatum(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality_setDatum(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality_getProjection(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality_setProjection(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality_GetProjectionDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality_GetProjectionDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality_SetProjectionDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality_SetProjectionDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality_GetGeodesyPoints(Functionality: TFunctionality;   out Points: TByteArray); stdcall; external TypesDLL;

{TTFilterVisualizationFunctionality}
function TTFilterVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TFilterVisualizationFunctionality}
procedure TFilterVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TFilterVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out FilterType: integer; out FilterDATA: TByteArray); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality_SetParams(Functionality: TFunctionality;   const FilterType: integer; const FilterDATA: TByteArray); stdcall; external TypesDLL;

{TTHINTVisualizationFunctionality}
function TTHINTVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
procedure TTHINTVisualizationFunctionality_GetInstanceParams(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall; external TypesDLL;
procedure TTHINTVisualizationFunctionality_GetInstanceParams1(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall; external TypesDLL;
procedure TTHINTVisualizationFunctionality_GetInstanceOwnerDatasAndParams(Functionality: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray); stdcall; external TypesDLL;

{THINTVisualizationFunctionality}
procedure THINTVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
function THINTVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function THINTVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THINTVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function THINTVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function THINTVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function THINTVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THINTVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_GetPrivateDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_GetPrivateDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_GetPrivateDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_GetPrivateDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_SetPrivateDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_SetPrivateDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
function THINTVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function THINTVisualizationFunctionality_getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality_DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;

{TTDetailedPictureVisualizationFunctionality}
function TTDetailedPictureVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality_CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TDetailedPictureVisualizationFunctionality}
procedure TDetailedPictureVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality_ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_SetProportion(Functionality: TFunctionality;   const Value: double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality_GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality_ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality_TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_Level_GetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality_GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;

{TTCoVisualizationFunctionality}
function TTCoVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TCoVisualizationFunctionality}
procedure TCoVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
function TCoVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_UpdateContainer(Functionality: TFunctionality;   out oContainer: TExtendedContainerCoord); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
function TCoVisualizationFunctionality_GetOwnSpaceHINTVisualizationLocally(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCoVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_GetSpace(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_GetSpace1(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_GetSpace2(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_GetSpace3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_SetSpace(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_SetSpace1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
function TCoVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TCoVisualizationFunctionality_GetOwnSpaceHINTVisualization(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality_getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_Pack(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality_UnPack(Functionality: TFunctionality); stdcall; external TypesDLL;
function TCoVisualizationFunctionality_IsPacked(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;

{TTForumMessageFunctionality}
function TTForumMessageFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTForumMessageFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTForumMessageFunctionality_CheckUserOperation(Functionality: TFunctionality;   const idObj: integer; const idOperation: integer); stdcall; external TypesDLL;
function TTForumMessageFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTForumMessageFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTForumMessageFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TForumMessageFunctionality}
procedure TForumMessageFunctionality_UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TForumMessageFunctionality_CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall; external TypesDLL;
procedure TForumMessageFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TForumMessageFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TForumMessageFunctionality_FunctionalityUserID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TForumMessageFunctionality_setidUser(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TForumMessageFunctionality_Modified(Functionality: TFunctionality); stdcall; external TypesDLL;
function TForumMessageFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TForumMessageFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TForumMessageFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TForumMessageFunctionality_getidForum(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TForumMessageFunctionality_setidForum(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TForumMessageFunctionality_idUser(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TForumMessageFunctionality_Send(Functionality: TFunctionality); stdcall; external TypesDLL;
function TForumMessageFunctionality_SentTime(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TForumMessageFunctionality_getidForMessage(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TForumMessageFunctionality_setidForMessage(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TForumMessageFunctionality_LastModified(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
procedure TForumMessageFunctionality_GetMessage(Functionality: TFunctionality;   out Message: TByteArray); stdcall; external TypesDLL;
procedure TForumMessageFunctionality_GetMessage1(Functionality: TFunctionality;   out Message: TMemoryStream); stdcall; external TypesDLL;
procedure TForumMessageFunctionality_SetMessage(Functionality: TFunctionality;   const Message: TByteArray); stdcall; external TypesDLL;
procedure TForumMessageFunctionality_SetMessage1(Functionality: TFunctionality;   const Message: TMemoryStream); stdcall; external TypesDLL;
function TForumMessageFunctionality_ReplyMessageCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TForumMessageFunctionality_GetReplyMessageList(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TForumMessageFunctionality_GetReplyMessageList1(Functionality: TFunctionality;   out MessageList: TList); stdcall; external TypesDLL;

{TTForumFunctionality}
function TTForumFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTForumFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTForumFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTForumFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTForumFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TForumFunctionality}
procedure TForumFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TForumFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
procedure TForumFunctionality_DeleteOldMessages(Functionality: TFunctionality;   const pMessageLifeTime: TDateTime); stdcall; external TypesDLL;
function TForumFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TForumFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TForumFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TForumFunctionality_getMessageLifeTime(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
procedure TForumFunctionality_setMessageLifeTime(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
function TForumFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TForumFunctionality_RootMessageCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TForumFunctionality_GetRootMessageList(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TForumFunctionality_GetRootMessageList1(Functionality: TFunctionality;   out MessageList: TList); stdcall; external TypesDLL;
function TForumFunctionality_MessageCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TForumFunctionality_GetMessageList(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TForumFunctionality_GetMessageList1(Functionality: TFunctionality;   out MessageList: TList); stdcall; external TypesDLL;
function TForumFunctionality_AddMessage(Functionality: TFunctionality;   const pidUser: integer; const pidForMessage: integer): integer; stdcall; external TypesDLL;
procedure TForumFunctionality_DestroyMessage(Functionality: TFunctionality;   const pidMessage: integer); stdcall; external TypesDLL;

{TTCUSTOMVisualizationFunctionality}
function TTCUSTOMVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TCUSTOMVisualizationFunctionality}
procedure TCUSTOMVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality_ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality_getMODULEName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality_setMODULEName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality_getFunctionName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality_setFunctionName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality_getFunctionVersion(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality_setFunctionVersion(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer); stdcall; external TypesDLL;

{TTOLEVisualizationFunctionality}
function TTOLEVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TOLEVisualizationFunctionality}
procedure TOLEVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TOLEVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality_SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality_EditDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
function TOLEVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality_GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality_GetDATA1(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality_GetDATA2(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality_GetDATA3(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality_SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality_SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;

{TTHTMLVisualizationFunctionality}
function TTHTMLVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{THTMLVisualizationFunctionality}
procedure THTMLVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality_SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality_EditDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
function THTMLVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality_getWidth(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality_setWidth(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality_GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality_GetDATA1(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality_GetDATA2(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality_GetDATA3(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality_SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality_SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;

{TTBZRVisualizationFunctionality}
function TTBZRVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TBZRVisualizationFunctionality}
procedure TBZRVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBZRVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBZRVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TBZRVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTAGIFVisualizationFunctionality}
function TTAGIFVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TAGIFVisualizationFunctionality}
procedure TAGIFVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality_TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality_ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality_GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality_GetDATA1(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality_GetDATA2(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality_GetDATA3(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality_SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality_SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;

{TTOrientedVIDEOVisualizationFunctionality}
function TTOrientedVIDEOVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TOrientedVIDEOVisualizationFunctionality}
procedure TOrientedVIDEOVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality_TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality_getDataServer(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality_setDataServer(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality_getObjectID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality_setObjectID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;

{TTVIDEOVisualizationFunctionality}
function TTVIDEOVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TVIDEOVisualizationFunctionality}
procedure TVIDEOVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality_TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality_ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality_getDataServer(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality_setDataServer(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality_getObjectID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality_setObjectID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;

{TTOPPVisualizationFunctionality}
function TTOPPVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TOPPVisualizationFunctionality}
procedure TOPPVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TOPPVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality_getPropsPanel_idTObj(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality_setPropsPanel_idTObj(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TOPPVisualizationFunctionality_getPropsPanel_idObj(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality_setPropsPanel_idObj(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer); stdcall; external TypesDLL;

{TTMODELServerFunctionality}
function TTMODELServerFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTMODELServerFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTMODELServerFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMODELServerFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMODELServerFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMODELServerFunctionality_GetInstanceByIPAddress(Functionality: TFunctionality;   const IPAddress: string;  out id: integer): boolean; stdcall; external TypesDLL;

{TMODELServerFunctionality}
procedure TMODELServerFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TMODELServerFunctionality_Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TMODELServerFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMODELServerFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TMODELServerFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMODELServerFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TMODELServerFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerFunctionality_getIPAddress(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMODELServerFunctionality_setIPAddress(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TMODELServerFunctionality_IsUserExist(Functionality: TFunctionality;   const _UserName,_UserPassword: string): boolean; stdcall; external TypesDLL;
function TMODELServerFunctionality_GetUserID(Functionality: TFunctionality;   const _UserName,_UserPassword: string): integer; stdcall; external TypesDLL;
function TMODELServerFunctionality_IsOnLine(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMODELServerFunctionality_Info(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMODELServerFunctionality_GetLicense(Functionality: TFunctionality;   out License: WideString); stdcall; external TypesDLL;
procedure TMODELServerFunctionality_CreateNewUserByDefaultPrototype(Functionality: TFunctionality;   const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer); stdcall; external TypesDLL;
procedure TMODELServerFunctionality_CreateNewUserByDefaultPrototype1(Functionality: TFunctionality;   const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString; const Signature: WideString;  out idNewUser: integer); stdcall; external TypesDLL;

{TTCoReferenceFunctionality}
function TTCoReferenceFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTCoReferenceFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTCoReferenceFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoReferenceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoReferenceFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TCoReferenceFunctionality}
procedure TCoReferenceFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCoReferenceFunctionality_Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TCoReferenceFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
procedure TCoReferenceFunctionality_ShowReferencedObjectPanelProps(Functionality: TFunctionality); stdcall; external TypesDLL;
function TCoReferenceFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCoReferenceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TCoReferenceFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TCoReferenceFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TCoReferenceFunctionality_GetReferencedObject(Functionality: TFunctionality;   out idTReferencedObject,idReferencedObject: integer); stdcall; external TypesDLL;
procedure TCoReferenceFunctionality_SetReferencedObject(Functionality: TFunctionality;   const idTReferencedObject,idReferencedObject: integer); stdcall; external TypesDLL;

{TTPositionerFunctionality}
function TTPositionerFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTPositionerFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTPositionerFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTPositionerFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTPositionerFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TPositionerFunctionality}
procedure TPositionerFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TPositionerFunctionality_Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TPositionerFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
procedure TPositionerFunctionality_SetPosition(Functionality: TFunctionality); stdcall; external TypesDLL;
function TPositionerFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TPositionerFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPositionerFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TPositionerFunctionality_Get2DPosition(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TPositionerFunctionality_Save2DPosition(Functionality: TFunctionality;   const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TPositionerFunctionality_Save2DPosition1(Functionality: TFunctionality;   Reflector: TReflector); stdcall; external TypesDLL;
function TPositionerFunctionality_getPositionName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TPositionerFunctionality_setPositionName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;

{TTOrientedWMFVisualizationFunctionality}
function TTOrientedWMFVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;

{TOrientedWMFVisualizationFunctionality}
procedure TOrientedWMFVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_getWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_setWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_getHeight(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_setHeight(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_getOrientation(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_setOrientation(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_UpdateContainer(Functionality: TFunctionality); stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality_IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall; external TypesDLL;

{TTCELLVisualizationFunctionality}
function TTCELLVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TCELLVisualizationFunctionality}
procedure TCELLVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_SetReflectorView(Functionality: TFunctionality); stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_Change(Functionality: TFunctionality;   const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer); stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_GetFormatNodes(Functionality: TFunctionality;   out NodesList: TByteArray; out SizeX,SizeY: integer): boolean; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_GetFormatNodes1(Functionality: TFunctionality;   out NodesList: TList; out SizeX,SizeY: integer): boolean; stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_DoQuad(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_GetInsideObjectsList(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_GetInsideObjectsList1(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TComponentsList); stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_getColCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_setColCount(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_getRowCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_setRowCount(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_getLineWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_setLineWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_getColSize(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality_getRowSize(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out oColCount: integer; out oRowCount: integer; out oLineWidth: Double); stdcall; external TypesDLL;

{TTEllipseVisualizationFunctionality}
function TTEllipseVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TEllipseVisualizationFunctionality}
procedure TEllipseVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality_DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality_getColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality_setColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality_getBorderColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality_setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality_getBorderWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality_setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;

{TTWMFVisualizationFunctionality}
function TTWMFVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TWMFVisualizationFunctionality}
procedure TWMFVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
function TWMFVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
function TWMFVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality_getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality_SetProportion(Functionality: TFunctionality); stdcall; external TypesDLL;

{TTPictureVisualizationFunctionality}
function TTPictureVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TPictureVisualizationFunctionality}
procedure TPictureVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
function TPictureVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality_ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_GetBMP(Functionality: TFunctionality;   out BMP: TByteArray); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_GetBMP1(Functionality: TFunctionality;   out BMP: TBitmap); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_SetProportion(Functionality: TFunctionality); stdcall; external TypesDLL;
function TPictureVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality_getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out VisibleMinScale: double; out VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality_SetParams(Functionality: TFunctionality;   const VisibleMinScale: double; const VisibleMaxScale: double); stdcall; external TypesDLL;

{TTRoundVisualizationFunctionality}
function TTRoundVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TRoundVisualizationFunctionality}
procedure TRoundVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality_DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
function TRoundVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality_getColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality_setColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
function TRoundVisualizationFunctionality_getBorderColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality_setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
function TRoundVisualizationFunctionality_getBorderWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality_setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;

{TTGeodesyPointFunctionality}
function TTGeodesyPointFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTGeodesyPointFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTGeodesyPointFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality_ConvertSpaceCRDToGeoCRD(Functionality: TFunctionality;   const X,Y: Double; out Latitude,Longitude: Double): boolean; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality_ConvertGeoCRDToSpaceCRD(Functionality: TFunctionality;   const Latitude,Longitude: Double; out X,Y: Double): boolean; stdcall; external TypesDLL;
procedure TTGeodesyPointFunctionality_GetNearestCrdSys(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeodesyPointFunctionality_GetInstanceListByCrdSys(Functionality: TFunctionality;   const idCrdSys: integer; out List: TByteArray); stdcall; external TypesDLL;
function TTGeodesyPointFunctionality_CrdSys_GetNearestGeoPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality_CrdSys_GetNearestXYPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall; external TypesDLL;

{TGeodesyPointFunctionality}
procedure TGeodesyPointFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TGeodesyPointFunctionality_Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TGeodesyPointFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGeodesyPointFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TGeodesyPointFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeodesyPointFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeodesyPointFunctionality_getidCrdSys(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality_setidCrdSys(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TGeodesyPointFunctionality_getX(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality_setX(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TGeodesyPointFunctionality_getY(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality_setY(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TGeodesyPointFunctionality_getLatitude(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality_setLatitude(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TGeodesyPointFunctionality_getLongitude(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality_setLongitude(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality_GetParams(Functionality: TFunctionality;   out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality_SetParams(Functionality: TFunctionality;   const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality_ValidateByVisualizationComponent(Functionality: TFunctionality); stdcall; external TypesDLL;

{TTPrivateAreaVisualizationFunctionality}
function TTPrivateAreaVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality_CanCreateAsDetail(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TPrivateAreaVisualizationFunctionality}
procedure TPrivateAreaVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPrivateAreaVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPrivateAreaVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality_getAcquireObjectsInside(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TPrivateAreaVisualizationFunctionality_setAcquireObjectsInside(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;

{TTHyperTextFunctionality}
function TTHyperTextFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTHyperTextFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTHyperTextFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHyperTextFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHyperTextFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{THyperTextFunctionality}
procedure THyperTextFunctionality_UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THyperTextFunctionality_ClearDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THyperTextFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function THyperTextFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
procedure THyperTextFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THyperTextFunctionality_SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
function THyperTextFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function THyperTextFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THyperTextFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure THyperTextFunctionality_GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure THyperTextFunctionality_GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure THyperTextFunctionality_SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure THyperTextFunctionality_SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;

{TTComponentsFindServiceFunctionality}
function TTComponentsFindServiceFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTComponentsFindServiceFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTComponentsFindServiceFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTComponentsFindServiceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTComponentsFindServiceFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TComponentsFindServiceFunctionality}
procedure TComponentsFindServiceFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TComponentsFindServiceFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TComponentsFindServiceFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TComponentsFindServiceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TComponentsFindServiceFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTUsersServiceFunctionality}
function TTUsersServiceFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTUsersServiceFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTUsersServiceFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTUsersServiceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTUsersServiceFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TUsersServiceFunctionality}
procedure TUsersServiceFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TUsersServiceFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TUsersServiceFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TUsersServiceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUsersServiceFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTTransportServiceFunctionality}
function TTTransportServiceFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTTransportServiceFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTTransportServiceFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTransportServiceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTransportServiceFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TTransportServiceFunctionality}
procedure TTransportServiceFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TTransportServiceFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTransportServiceFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TTransportServiceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportServiceFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTMarketServiceFunctionality}
function TTMarketServiceFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTMarketServiceFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTMarketServiceFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMarketServiceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMarketServiceFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TMarketServiceFunctionality}
procedure TMarketServiceFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TMarketServiceFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMarketServiceFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TMarketServiceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMarketServiceFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTTelecomServiceFunctionality}
function TTTelecomServiceFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTTelecomServiceFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTTelecomServiceFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTelecomServiceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTelecomServiceFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TTelecomServiceFunctionality}
procedure TTelecomServiceFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TTelecomServiceFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTelecomServiceFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TTelecomServiceFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTelecomServiceFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTWNDVisualizationFunctionality}
function TTWNDVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TWNDVisualizationFunctionality}
procedure TWNDVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
function TWNDVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality_ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality_GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality_GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
function TWNDVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality_getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality_setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality_DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;

{TTMRKVisualizationFunctionality}
function TTMRKVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TMRKVisualizationFunctionality}
procedure TMRKVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_DoOnComponentUpdate(Functionality: TFunctionality); stdcall; external TypesDLL;
function TMRKVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
function TMRKVisualizationFunctionality_getBindingPointIndex(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_setBindingPointIndex(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMRKVisualizationFunctionality_getAlign(Functionality: TFunctionality): TMRKVisualizationAlign; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality_getAlign1(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_setAlign(Functionality: TFunctionality;   Value: TMRKVisualizationAlign); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_setAlign1(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMRKVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality_getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out oAlign: integer; out oBindingPointIndex: integer); stdcall; external TypesDLL;

{TTOrientedPictureVisualizationFunctionality}
function TTOrientedPictureVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TOrientedPictureVisualizationFunctionality}
procedure TOrientedPictureVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_getWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_setWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_getHeight(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_setHeight(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_getOrientation(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_setOrientation(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_UpdateContainer(Functionality: TFunctionality); stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality_IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall; external TypesDLL;

{TTOrientedTTFVisualizationFunctionality}
function TTOrientedTTFVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TOrientedTTFVisualizationFunctionality}
procedure TOrientedTTFVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_getStr(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_setStr(Functionality: TFunctionality;   const Value: string); stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_getColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_setColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_getFont_Name(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_setFont_Name(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_getFont_Width(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_setFont_Width(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_getFont_Height(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_setFont_Height(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_getCharInterval(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_setCharInterval(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_getOrientation(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_setOrientation(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_UpdateContainer(Functionality: TFunctionality); stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality_IsNewContainerAcceptable(Functionality: TFunctionality;   const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean; stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality_SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer); stdcall; external TypesDLL;

{TTIconFunctionality}
function TTIconFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTIconFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTIconFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTIconFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTIconFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TIconFunctionality}
procedure TIconFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TIconFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
function TIconFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TIconFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TIconFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TIconFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TIconFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TIconFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall; external TypesDLL;
procedure TIconFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall; external TypesDLL;
procedure TIconFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall; external TypesDLL;
procedure TIconFunctionality_GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall; external TypesDLL;
procedure TIconFunctionality_GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall; external TypesDLL;

{TTMessageBoardMessageFunctionality}
procedure TTMessageBoardMessageFunctionality_CheckUserOperation(Functionality: TFunctionality;   const idObj: integer; const idOperation: integer); stdcall; external TypesDLL;
function TTMessageBoardMessageFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTMessageBoardMessageFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTMessageBoardMessageFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMessageBoardMessageFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMessageBoardMessageFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TMessageBoardMessageFunctionality}
procedure TMessageBoardMessageFunctionality_CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality_getIdMessageBoard(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality_setIdMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality_getIdSenderMessageBoard(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality_setIdSenderMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality_DateCreated(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality_getSubject(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality_setSubject(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality_GetBody(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality_GetBody1(Functionality: TFunctionality;   Value: TStringList); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality_SetBody(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality_SetBody1(Functionality: TFunctionality;   Value: TStringList); stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality_getFlRead(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality_setFlRead(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality_IsEmpty(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality_IsCreatedByUser(Functionality: TFunctionality;   const pidUser: integer): boolean; stdcall; external TypesDLL;

{TTMessageBoardFunctionality}
function TTMessageBoardFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTMessageBoardFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTMessageBoardFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMessageBoardFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMessageBoardFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TMessageBoardFunctionality}
procedure TMessageBoardFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TMessageBoardFunctionality_Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TMessageBoardFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMessageBoardFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TMessageBoardFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMessageBoardFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TMessageBoardFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardFunctionality_IsUnreadMessageExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TMessageBoardFunctionality_GetMessagesList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality_GetMessagesList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
function TMessageBoardFunctionality_CreateNewMessage(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMessageBoardFunctionality_SendMessage(Functionality: TFunctionality;   const idMessage: integer); stdcall; external TypesDLL;
function TMessageBoardFunctionality_getIdUser(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMessageBoardFunctionality_setIdUser(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;

{TTHREFFunctionality}
function TTHREFFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTHREFFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTHREFFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHREFFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHREFFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{THREFFunctionality}
procedure THREFFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function THREFFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THREFFunctionality_Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
procedure THREFFunctionality_Activate(Functionality: TFunctionality); stdcall; external TypesDLL;
function THREFFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function THREFFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THREFFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THREFFunctionality_getURL(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure THREFFunctionality_setURL(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function THREFFunctionality_getAutoStart(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure THREFFunctionality_setAutoStart(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;

{TTQDCVisualizationFunctionality}
function TTQDCVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TQDCVisualizationFunctionality}
procedure TQDCVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TQDCVisualizationFunctionality_GetDATA(Functionality: TFunctionality;   out DATAPtr: pointer): boolean; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality_LoadFromBitmap(Functionality: TFunctionality;   Bitmap: TByteArray); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality_LoadFromBitmap1(Functionality: TFunctionality;   Bitmap: TBitmap); stdcall; external TypesDLL;
function TQDCVisualizationFunctionality_getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality_setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality_DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;

{TTOffersServerFunctionality}
function TTOffersServerFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTOffersServerFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTOffersServerFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOffersServerFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOffersServerFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TOffersServerFunctionality}
procedure TOffersServerFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TOffersServerFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOffersServerFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TOffersServerFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOffersServerFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOffersServerFunctionality_getMailROBOT_Inbox(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOffersServerFunctionality_setMailROBOT_Inbox(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TOffersServerFunctionality_getMailROBOT_User(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOffersServerFunctionality_setMailROBOT_User(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TOffersServerFunctionality_getMailROBOT_Password(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOffersServerFunctionality_setMailROBOT_Password(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;

{TTSecurityComponentOperationFunctionality}
function TTSecurityComponentOperationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTSecurityComponentOperationFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTSecurityComponentOperationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSecurityComponentOperationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSecurityComponentOperationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTSecurityComponentOperationFunctionality_GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall; external TypesDLL;
procedure TTSecurityComponentOperationFunctionality_GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall; external TypesDLL;

{TSecurityComponentOperationFunctionality}
procedure TSecurityComponentOperationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TSecurityComponentOperationFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality_getSQLInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TSecurityComponentOperationFunctionality_setSQLInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;

{TTSecurityKeyFunctionality}
function TTSecurityKeyFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTSecurityKeyFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTSecurityKeyFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality_GetInstanceByCode(Functionality: TFunctionality;   const Code: string;  out idInstance: integer): boolean; stdcall; external TypesDLL;
procedure TTSecurityKeyFunctionality_GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall; external TypesDLL;
procedure TTSecurityKeyFunctionality_GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall; external TypesDLL;

{TSecurityKeyFunctionality}
procedure TSecurityKeyFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TSecurityKeyFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSecurityKeyFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TSecurityKeyFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TSecurityKeyFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TSecurityKeyFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityKeyFunctionality_getInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality_setInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality_GetAssotiatedUsers(Functionality: TFunctionality;   out Users: TByteArray); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality_GetAssotiatedUsers1(Functionality: TFunctionality;   out Users: TList); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality_GenerateCode(Functionality: TFunctionality); stdcall; external TypesDLL;
function TSecurityKeyFunctionality_Code(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTSecurityFileFunctionality}
function TTSecurityFileFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTSecurityFileFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTSecurityFileFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSecurityFileFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSecurityFileFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTSecurityFileFunctionality_GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString;out List: TByteArray); stdcall; external TypesDLL;
procedure TTSecurityFileFunctionality_GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall; external TypesDLL;

{TSecurityFileFunctionality}
procedure TSecurityFileFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TSecurityFileFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSecurityFileFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TSecurityFileFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TSecurityFileFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TSecurityFileFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TSecurityFileFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityFileFunctionality_getInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TSecurityFileFunctionality_setInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TSecurityFileFunctionality_GetDATA(Functionality: TFunctionality;   out Value: TByteArray): boolean; stdcall; external TypesDLL;
function TSecurityFileFunctionality_GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream): boolean; stdcall; external TypesDLL;
procedure TSecurityFileFunctionality_SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality_SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
function TSecurityFileFunctionality_AddOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall; external TypesDLL;
function TSecurityFileFunctionality_RemoveOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall; external TypesDLL;
procedure TSecurityFileFunctionality_GetAssotiatedSecurityComponents(Functionality: TFunctionality;   out SecurityComponents: TByteArray); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality_GetAssotiatedSecurityComponents1(Functionality: TFunctionality;   out SecurityComponents: TList); stdcall; external TypesDLL;

{TTSecurityComponentFunctionality}
function TTSecurityComponentFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTSecurityComponentFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTSecurityComponentFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSecurityComponentFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSecurityComponentFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTSecurityComponentFunctionality_DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTSecurityComponentFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;

{TSecurityComponentFunctionality}
procedure TSecurityComponentFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TSecurityComponentFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
procedure TSecurityComponentFunctionality_ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TSecurityComponentFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TSecurityComponentFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TSecurityComponentFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentFunctionality_getIdSecurityFile(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TSecurityComponentFunctionality_setIdSecurityFile(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;

{TTMODELUserFunctionality}
function TTMODELUserFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTMODELUserFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTMODELUserFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMODELUserFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMODELUserFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMODELUserFunctionality_IsUserExist(Functionality: TFunctionality;   const UserName: string; out idUser: integer): boolean; stdcall; external TypesDLL;
procedure TTMODELUserFunctionality_GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality_GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality_GetOnlineUsersForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality_GetOnlineUsersForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality_GetOnlineExpertsForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality_GetOnlineExpertsForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall; external TypesDLL;

{TMODELUserFunctionality}
procedure TMODELUserFunctionality_CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TMODELUserFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMODELUserFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
function TMODELUserFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality_GetActiveStateInfo(Functionality: TFunctionality;   out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality_IsUserOnLine(Functionality: TFunctionality;   const MaxDelay: Double): boolean; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Logout(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_GetSecurityKeysList(Functionality: TFunctionality;   out SecurityKeys: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_GetSecurityKeysList1(Functionality: TFunctionality;   out SecurityKeys: TList); stdcall; external TypesDLL;
function TMODELUserFunctionality_SecurityKeys_IsKeyExist(Functionality: TFunctionality;   const idSecurityKey: integer): boolean; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_SecurityKeys_Insert(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_SecurityKeys_Delete(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_SecurityKeys_AddKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_SecurityKeys_RemoveKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall; external TypesDLL;
function TMODELUserFunctionality_SecurityKeys_CreateAndAddNewKey(Functionality: TFunctionality;   const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_GetMessageBoards(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_GetMessageBoards1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
function TMODELUserFunctionality_HaveUnreadMessages(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_GetMessages(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_GetMessages1(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TList); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_IncomingMessages_SendNew(Functionality: TFunctionality;   const Message: TByteArray; const SenderID: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_IncomingMessages_SendNew1(Functionality: TFunctionality;   const Message: TMemoryStream; const SenderID: integer); stdcall; external TypesDLL;
function TMODELUserFunctionality_IncomingMessages_GetUnread(Functionality: TFunctionality;   out MessageList: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality_IncomingMessages_GetUnread1(Functionality: TFunctionality;   out MessageList: TList): boolean; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_IncomingMessages_GetMessagesSince(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_IncomingMessages_GetMessagesSince1(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TList); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_IncomingMessages_GetMessage(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_IncomingMessages_GetMessage1(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: TDateTime; out Message: TClientBlobStream; out SenderID: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_IncomingMessages_DeleteTo(Functionality: TFunctionality;   const TimeStamp: TDateTime); stdcall; external TypesDLL;
function TMODELUserFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TMODELUserFunctionality_getFullName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setFullName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TMODELUserFunctionality_getContactInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setContactInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TMODELUserFunctionality_getPassword(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setPassword(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TMODELUserFunctionality_getIdSecurityFileForClone(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setIdSecurityFileForClone(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMODELUserFunctionality_getidSecurityFileForPrivate(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setidSecurityFileForPrivate(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMODELUserFunctionality_getDATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setDATASize(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMODELUserFunctionality_getMaxDATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setMaxDATASize(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMODELUserFunctionality_getSpaceSquare(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setSpaceSquare(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TMODELUserFunctionality_getMaxSpaceSquare(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setMaxSpaceSquare(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMODELUserFunctionality_getMaxSpaceSquarePerObject(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setMaxSpaceSquarePerObject(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TMODELUserFunctionality_getDisabled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setDisabled(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_GetStartObj(Functionality: TFunctionality;   out idTStartObj,idStartObj: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_SetStartObj(Functionality: TFunctionality;   const idTStartObj,idStartObj: integer); stdcall; external TypesDLL;
function TMODELUserFunctionality_getDomains(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setDomains(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TMODELUserFunctionality_getTaskEnabled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setTaskEnabled(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
function TMODELUserFunctionality_getBillingType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_setBillingType(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_CheckDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_AddDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_SubDATASize(Functionality: TFunctionality;   const pSubDATASize: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_CheckSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_AddSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_SubSpaceSquare(Functionality: TFunctionality;   const pSubSpaceSquare: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_CheckMaxSpaceSquarePerObject(Functionality: TFunctionality;   const pObjectSpaceSquare: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_ServerFolder_GetSubFoldersList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_ServerFolder_GetFilesList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall; external TypesDLL;
function TMODELUserFunctionality_ServerFolder_AddFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality_ServerFolder_RemoveFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality_ServerFolder_ReadFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality_ServerFolder_AddSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality_ServerFolder_AddSubFolder1(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality_ServerFolder_RemoveSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality_ServerFolder_ReadSubFolder(Functionality: TFunctionality;   const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality_ServerFolder_ExchangeSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality_Tasks_AddNew(Functionality: TFunctionality;   const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_RemoveItem(Functionality: TFunctionality;   const idTask: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_GetData(Functionality: TFunctionality;   const Version: integer; const flOnlyActive: boolean; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_Item_GetTaskData(Functionality: TFunctionality;   const idTask: integer; out oTaskData: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_Item_SetPriority(Functionality: TFunctionality;   const idTask: integer; const pPriority: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_Item_GetStatus(Functionality: TFunctionality;   const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_Item_SetStatus(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_Item_SetStatus1(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_Item_GetResultData(Functionality: TFunctionality;   const idTask: integer; out oResultData: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_Item_SetResult(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_Item_SetResult1(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_Item_SetResult2(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Tasks_Item_SetResult3(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall; external TypesDLL;
function TMODELUserFunctionality_Billing_Account(Functionality: TFunctionality): double; stdcall; external TypesDLL;
function TMODELUserFunctionality_Billing_Transactions_AddNew(Functionality: TFunctionality;   const pReason: integer; const pDelta: double; const pComment: string): integer; stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Billing_Transactions_Remove(Functionality: TFunctionality;   const idTransaction: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Billing_Transactions_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_Billing_Transactions_GetData(Functionality: TFunctionality;   const Version: integer; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality_ClientProgram_GetReleases(Functionality: TFunctionality;   const ProgramID: integer; const Localization: WideString; out Data: TByteArray); stdcall; external TypesDLL;

{TTTextureFunctionality}
function TTTextureFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTTextureFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTTextureFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTextureFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTextureFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTTextureFunctionality_GetInstanceListMatchingBy(Functionality: TFunctionality;   const NameContext: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTTextureFunctionality_GetInstanceListMatchingBy1(Functionality: TFunctionality;   const NameContext: string; out List: TList); stdcall; external TypesDLL;

{TTextureFunctionality}
procedure TTextureFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTextureFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
function TTextureFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTextureFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TTextureFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTextureFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTextureFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TTextureFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType); stdcall; external TypesDLL;
procedure TTextureFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall; external TypesDLL;
procedure TTextureFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TTextureDATAType); stdcall; external TypesDLL;
procedure TTextureFunctionality_GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall; external TypesDLL;
procedure TTextureFunctionality_GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TTextureFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;

{TTBuffered3DVisualizationFunctionality}
function TTBuffered3DVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality_ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TBuffered3DVisualizationFunctionality}
procedure TBuffered3DVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_GetData(Functionality: TFunctionality;   out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Double; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Double); stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_ReflectInScene(Functionality: TFunctionality;   Scene: TScene); stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality_DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality_GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList): IXMLDOMElement; stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_LoadFromStream(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_LoadFromStream1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_Get__Translate_XY(Functionality: TFunctionality;   out vTranslate_X,vTranslate_Y: Double); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_SetPropertiesLocal(Functionality: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality_GetMinMax(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix; out Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Double): boolean; stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_UpdateXOYProjection(Functionality: TFunctionality); stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality_getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality_GetMeshesNodesApproximator(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix): TNodesApproximator; stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double); stdcall; external TypesDLL;

{TTDATAFileFunctionality}
function TTDATAFileFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTDATAFileFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTDATAFileFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDATAFileFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDATAFileFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TDATAFileFunctionality}
procedure TDATAFileFunctionality_CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall; external TypesDLL;
procedure TDATAFileFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDATAFileFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TDATAFileFunctionality_SaveToFile(Functionality: TFunctionality;   var FileName: string); stdcall; external TypesDLL;
procedure TDATAFileFunctionality_Activate(Functionality: TFunctionality); stdcall; external TypesDLL;
function TDATAFileFunctionality_Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TDATAFileFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDATAFileFunctionality__GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external TypesDLL;
procedure TDATAFileFunctionality_Check(Functionality: TFunctionality); stdcall; external TypesDLL;
function TDATAFileFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TDATAFileFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDATAFileFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDATAFileFunctionality_IsNull(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TDATAFileFunctionality_Empty(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDATAFileFunctionality_GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TDATAFileFunctionality_GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure TDATAFileFunctionality_SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TDATAFileFunctionality_SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
function TDATAFileFunctionality_getDATAType(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TDATAFileFunctionality_setDATAType(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;

{TTCoComponentFunctionality}
function TTCoComponentFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTCoComponentFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTCoComponentFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoComponentFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoComponentFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTCoComponentFunctionality_GetInstanceListByCoType(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TByteArray); stdcall; external TypesDLL;
procedure TTCoComponentFunctionality_GetInstanceListByCoType1(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TList); stdcall; external TypesDLL;

{TCoComponentFunctionality}
procedure TCoComponentFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCoComponentFunctionality_Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TCoComponentFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoComponentFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCoComponentFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentFunctionality_idCoType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoComponentFunctionality_GetIconImage(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall; external TypesDLL;
function TCoComponentFunctionality_GetIconImage1(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall; external TypesDLL;
function TCoComponentFunctionality_GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall; external TypesDLL;

{TTCoComponentTypeMarkerFunctionality}
function TTCoComponentTypeMarkerFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTCoComponentTypeMarkerFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTCoComponentTypeMarkerFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoComponentTypeMarkerFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoComponentTypeMarkerFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TCoComponentTypeMarkerFunctionality}
procedure TCoComponentTypeMarkerFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality_GetTypeIconImage(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality_GetTypeIconImage1(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall; external TypesDLL;
procedure TCoComponentTypeMarkerFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality_getIDCoComponentType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;

{TTCoComponentTypeFunctionality}
function TTCoComponentTypeFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTCoComponentTypeFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTCoComponentTypeFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoComponentTypeFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoComponentTypeFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTCoComponentTypeFunctionality_GetInstanceListByFileType(Functionality: TFunctionality;   const FileType: WideString; out List: TByteArray); stdcall; external TypesDLL;
procedure TTCoComponentTypeFunctionality_GetInstanceListByFileType1(Functionality: TFunctionality;   const FileType: shortstring; out List: TList); stdcall; external TypesDLL;

{TCoComponentTypeFunctionality}
procedure TCoComponentTypeFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCoComponentTypeFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality_GetDescription(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality_GetDescription1(Functionality: TFunctionality;   Value: TStringList); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality_SetDescription(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality_SetDescription1(Functionality: TFunctionality;   Value: TStringList); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality_GetMarkersList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality_GetMarkersList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
function TCoComponentTypeFunctionality_GetIconImage(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality_GetIconImage1(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TCoComponentTypeFunctionality_getUID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality_getDateCreated(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality_getFileType(Functionality: TFunctionality): shortstring; stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality_setFileType(Functionality: TFunctionality;   Value: shortstring); stdcall; external TypesDLL;
function TCoComponentTypeFunctionality_getCoComponentPrototypeID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality_setCoComponentPrototypeID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;

{TTAddressFunctionality}
function TTAddressFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTAddressFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTAddressFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTAddressFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTAddressFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTAddressFunctionality_Points_GetTypeNames(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTAddressFunctionality_Points_GetTypeNames1(Functionality: TFunctionality;   out List: TStringList); stdcall; external TypesDLL;
procedure TTAddressFunctionality_Streets_GetTypeNames(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTAddressFunctionality_Streets_GetTypeNames1(Functionality: TFunctionality;   out List: TStringList); stdcall; external TypesDLL;

{TAddressFunctionality}
procedure TAddressFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TAddressFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TAddressFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TAddressFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality_getIdPoint(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TAddressFunctionality_setIdPoint(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TAddressFunctionality_getPoint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality_getIdStreet(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TAddressFunctionality_setIdStreet(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TAddressFunctionality_getStreet(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality_getHouse(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TAddressFunctionality_setHouse(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TAddressFunctionality_getCorps(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TAddressFunctionality_setCorps(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TAddressFunctionality_getApartment(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TAddressFunctionality_setApartment(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TAddressFunctionality_getEntrance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TAddressFunctionality_setEntrance(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;

{TTTransportRouteFunctionality}
function TTTransportRouteFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTTransportRouteFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTTransportRouteFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTransportRouteFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTransportRouteFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTTransportRouteFunctionality_GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTTransportRouteFunctionality_GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;

{TTransportRouteFunctionality}
procedure TTransportRouteFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TTransportRouteFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTransportRouteFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TTransportRouteFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTransportRouteFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TTransportRouteFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportRouteFunctionality_getidTTransport(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTransportRouteFunctionality_setidTTransport(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TTransportRouteFunctionality_getValid(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TTransportRouteFunctionality_setValid(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
function TTransportRouteFunctionality_getRemarks(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTransportRouteFunctionality_setRemarks(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TTransportRouteFunctionality_IsNodesExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
procedure TTransportRouteFunctionality_Nodes_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality_Nodes_GetList1(Functionality: TFunctionality;   out List: TRouteNodesList); stdcall; external TypesDLL;
function TTransportRouteFunctionality_Nodes_IsNodeExist(Functionality: TFunctionality;   const idNode: integer): boolean; stdcall; external TypesDLL;
procedure TTransportRouteFunctionality_Nodes_ChangeNodeOrder(Functionality: TFunctionality;   const idItem: integer; const Order: integer); stdcall; external TypesDLL;
function TTransportRouteFunctionality_Nodes__Node_DistanceBefore(Functionality: TFunctionality;   const idItem: integer): integer; stdcall; external TypesDLL;
procedure TTransportRouteFunctionality_Nodes__Node_SetDistanceBefore(Functionality: TFunctionality;   const idItem: integer; const D: integer); stdcall; external TypesDLL;
function TTransportRouteFunctionality_Nodes__Node_OrderPrice(Functionality: TFunctionality;   const idItem: integer): string; stdcall; external TypesDLL;
procedure TTransportRouteFunctionality_Nodes__Node_SetOrderPrice(Functionality: TFunctionality;   const idItem: integer; const Price: string); stdcall; external TypesDLL;
function TTransportRouteFunctionality_Nodes_Insert(Functionality: TFunctionality;   const idNode: integer): integer; stdcall; external TypesDLL;
procedure TTransportRouteFunctionality_Nodes_Remove(Functionality: TFunctionality;   const idItem: integer); stdcall; external TypesDLL;

{TTTransportNodeFunctionality}
function TTTransportNodeFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTTransportNodeFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTTransportNodeFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTransportNodeFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTransportNodeFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTTransportNodeFunctionality_GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTTransportNodeFunctionality_GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;

{TTransportNodeFunctionality}
procedure TTransportNodeFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TTransportNodeFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTransportNodeFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TTransportNodeFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTransportNodeFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TTransportNodeFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportNodeFunctionality_IsRoutesExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;

{TTOfferGoodsFunctionality}
function TTOfferGoodsFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTOfferGoodsFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTOfferGoodsFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOfferGoodsFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOfferGoodsFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TOfferGoodsFunctionality}
procedure TOfferGoodsFunctionality_CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TOfferGoodsFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOfferGoodsFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TOfferGoodsFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TOfferGoodsFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferGoodsFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferGoodsFunctionality_idOffer(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferGoodsFunctionality_getIdGoods(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality_setIdGoods(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TOfferGoodsFunctionality_getAmount(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality_setAmount(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
function TOfferGoodsFunctionality_getIdMeasureUnit(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality_setIdMeasureUnit(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TOfferGoodsFunctionality_getMeasureUnit(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferGoodsFunctionality_getMinPrice(Functionality: TFunctionality): Currency; stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality_setMinPrice(Functionality: TFunctionality;   Value: Currency); stdcall; external TypesDLL;
function TOfferGoodsFunctionality_getMisc(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality_setMisc(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;

{TMeasureUnitFunctionality}
function TMeasureUnitFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTTLFStationTMTFunctionality}
function TTTLFStationTMTFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTTLFStationTMTFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTTLFStationTMTFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTLFStationTMTFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTLFStationTMTFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTTLFStationTMTFunctionality_GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTTLFStationTMTFunctionality_GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;

{TTLFStationTMTFunctionality}
procedure TTLFStationTMTFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TTLFStationTMTFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality_getHostName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTLFStationTMTFunctionality_setHostName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TTLFStationTMTFunctionality_getTestChanel(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTLFStationTMTFunctionality_setTestChanel(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;

{TTNameFunctionality}
function TTNameFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTNameFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTNameFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTNameFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTNameFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TNameFunctionality}
procedure TNameFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TNameFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TNameFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TNameFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TNameFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TNameFunctionality_Value(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TNameFunctionality_SetValue(Functionality: TFunctionality;   const NewValue: string); stdcall; external TypesDLL;

{TTVisualizationFunctionality}
function TTVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TVisualizationFunctionality}
procedure TVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TVisualizationFunctionality_ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTHREFVisualizationFunctionality}
function TTHREFVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHREFVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHREFVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{THREFVisualizationFunctionality}
function THREFVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function THREFVisualizationFunctionality_DoOnOver(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function THREFVisualizationFunctionality_DoOnClick(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function THREFVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function THREFVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THREFVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTTTFVisualizationFunctionality}
function TTTTFVisualizationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality__CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality_StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;

{TTTFVisualizationFunctionality}
procedure TTTFVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality_DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality_CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality_DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
function TTTFVisualizationFunctionality_Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality_GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality_getStr(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality_setStr(Functionality: TFunctionality;   const Value: string); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality_GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality_SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString); stdcall; external TypesDLL;

{TTObjectFunctionality}
function TTObjectFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTObjectFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTObjectFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTObjectFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTObjectFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TObjectFunctionality}
procedure TObjectFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TObjectFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TObjectFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TObjectFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TObjectFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTLabelFunctionality}
function TTLabelFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTLabelFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTLabelFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTLabelFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLabelFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TLabelFunctionality}
procedure TLabelFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TLabelFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TLabelFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TLabelFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TLabelFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTStationFunctionality}
function TTStationFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTStationFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTStationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTStationFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTStationFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
procedure TTStationFunctionality_GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTStationFunctionality_GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;

{TStationFunctionality}
procedure TStationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TStationFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TStationFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TStationFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TStationFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TStationFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TStationFunctionality_GetNumbersBound(Functionality: TFunctionality;   out BegNumber,EndNumber: integer); stdcall; external TypesDLL;

{TTMainLineFunctionality}
function TTMainLineFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTMainLineFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTMainLineFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMainLineFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMainLineFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TMainLineFunctionality}
procedure TMainLineFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TMainLineFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMainLineFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TMainLineFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TMainLineFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMainLineFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMainLineFunctionality_GetSTNOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;

{TTDescriptionFunctionality}
function TTDescriptionFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTDescriptionFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTDescriptionFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDescriptionFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDescriptionFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TDescriptionFunctionality}
procedure TDescriptionFunctionality_UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDescriptionFunctionality_ClearDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDescriptionFunctionality_CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall; external TypesDLL;
procedure TDescriptionFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TDescriptionFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDescriptionFunctionality__GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external TypesDLL;
function TDescriptionFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TDescriptionFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDescriptionFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TDescriptionFunctionality_GetValue(Functionality: TFunctionality;   out vText: TByteArray); stdcall; external TypesDLL;
procedure TDescriptionFunctionality_GetValue1(Functionality: TFunctionality;   vText: TStringList); stdcall; external TypesDLL;
procedure TDescriptionFunctionality_SetValue(Functionality: TFunctionality;   NewValue: TByteArray); stdcall; external TypesDLL;
procedure TDescriptionFunctionality_SetValue1(Functionality: TFunctionality;   NewValue: TStringList); stdcall; external TypesDLL;

{TTImageFunctionality}
function TTImageFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTImageFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTImageFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTImageFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTImageFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TImageFunctionality}
procedure TImageFunctionality_UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TImageFunctionality_ClearDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TImageFunctionality_CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall; external TypesDLL;
procedure TImageFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TImageFunctionality_LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
function TImageFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TImageFunctionality__GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external TypesDLL;
function TImageFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TImageFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TImageFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TImageFunctionality_GetDATAType(Functionality: TFunctionality): TImageDATAType; stdcall; external TypesDLL;
function TImageFunctionality_GetDATAType1(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TImageFunctionality_GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TImageFunctionality_GetDATA1(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall; external TypesDLL;
procedure TImageFunctionality_SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall; external TypesDLL;
procedure TImageFunctionality_SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall; external TypesDLL;
procedure TImageFunctionality_GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall; external TypesDLL;
procedure TImageFunctionality_GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall; external TypesDLL;

{TTWellFunctionality}
function TTWellFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTWellFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTWellFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTWellFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTWellFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TWellFunctionality}
procedure TWellFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TWellFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TWellFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TWellFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWellFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTTLFFunctionality}
function TTTLFFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTTLFFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTTLFFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTLFFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTLFFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTTLFFunctionality_GetIDInstanceByNumber(Functionality: TFunctionality;   out ID: integer; const Number: integer); stdcall; external TypesDLL;

{TTLFFunctionality}
procedure TTLFFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TTLFFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTLFFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TTLFFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TTLFFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFFunctionality_Number(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTLFFunctionality_Kind(Functionality: TFunctionality): TAbonentKind; stdcall; external TypesDLL;
function TTLFFunctionality_LocalELockExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTLFFunctionality_GlobalELockExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTLFFunctionality_GetFinishDevice(Functionality: TFunctionality;   out vidTObj,vidObj: integer): boolean; stdcall; external TypesDLL;
function TTLFFunctionality_IsDamaged(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTLFFunctionality_idDamage(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTLFFunctionality_getDamage_TimeNote(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
procedure TTLFFunctionality_setDamage_TimeNote(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
function TTLFFunctionality_getDamage_Note(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTLFFunctionality_setDamage_Note(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TTLFFunctionality_getDamage_Measured(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTLFFunctionality_setDamage_Measured(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TTLFFunctionality_getDamage_Acceptor(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTLFFunctionality_setDamage_Acceptor(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TTLFFunctionality_getDamage_TimeBegRepair(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
procedure TTLFFunctionality_setDamage_TimeBegRepair(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
function TTLFFunctionality_getDamage_TimeEndRepair(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
procedure TTLFFunctionality_setDamage_TimeEndRepair(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
function TTLFFunctionality_getDamage_Damage(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTLFFunctionality_setDamage_Damage(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TTLFFunctionality_getDamage_Executor(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTLFFunctionality_setDamage_Executor(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TTLFFunctionality_getDamage_Remarks(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TTLFFunctionality_setDamage_Remarks(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTLFFunctionality_WriteEvent(Functionality: TFunctionality;   const Event: string; const EventTime: TDateTime); stdcall; external TypesDLL;

{TTBoxFunctionality}
function TTBoxFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTBoxFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTBoxFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTBoxFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTBoxFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TBoxFunctionality}
procedure TBoxFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TBoxFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TBoxFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TBoxFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TBoxFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBoxFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTCableBoxFunctionality}
function TTCableBoxFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTCableBoxFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTCableBoxFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCableBoxFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCableBoxFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TCableBoxFunctionality}
procedure TCableBoxFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCableBoxFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCableBoxFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCableBoxFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCableBoxFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTDistrLineFunctionality}
function TTDistrLineFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTDistrLineFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTDistrLineFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDistrLineFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDistrLineFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TDistrLineFunctionality}
procedure TDistrLineFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TDistrLineFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDistrLineFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TDistrLineFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TDistrLineFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDistrLineFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTClientFunctionality}
function TTClientFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTClientFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTClientFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTClientFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTClientFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
procedure TTClientFunctionality_GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTClientFunctionality_GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;

{TClientFunctionality}
procedure TClientFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TClientFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TClientFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TClientFunctionality_GetDebet(Functionality: TFunctionality;   out Value: Double): boolean; stdcall; external TypesDLL;
function TClientFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TClientFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTHouseFunctionality}
function TTHouseFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTHouseFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTHouseFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHouseFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHouseFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{THouseFunctionality}
procedure THouseFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function THouseFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THouseFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function THouseFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function THouseFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THouseFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTCommNodeFunctionality}
function TTCommNodeFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTCommNodeFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTCommNodeFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCommNodeFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCommNodeFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TCommNodeFunctionality}
procedure TCommNodeFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCommNodeFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCommNodeFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCommNodeFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCommNodeFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTCrossFunctionality}
function TTCrossFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTCrossFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTCrossFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCrossFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCrossFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TCrossFunctionality}
procedure TCrossFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCrossFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCrossFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCrossFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCrossFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTCaseFunctionality}
function TTCaseFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTCaseFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTCaseFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCaseFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCaseFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TCaseFunctionality}
procedure TCaseFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCaseFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCaseFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCaseFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCaseFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTStreetFunctionality}
function TTStreetFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTStreetFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTStreetFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTStreetFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTStreetFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TStreetFunctionality}
procedure TStreetFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TStreetFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TStreetFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TStreetFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TStreetFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTOtherObjFunctionality}
function TTOtherObjFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTOtherObjFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTOtherObjFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOtherObjFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOtherObjFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TOtherObjFunctionality}
procedure TOtherObjFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TOtherObjFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOtherObjFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TOtherObjFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOtherObjFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTSpanFunctionality}
function TTSpanFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTSpanFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTSpanFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSpanFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSpanFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TSpanFunctionality}
procedure TSpanFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TSpanFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSpanFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TSpanFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSpanFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTChanelFunctionality}
function TTChanelFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTChanelFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTChanelFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTChanelFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTChanelFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TChanelFunctionality}
procedure TChanelFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TChanelFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TChanelFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TChanelFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TChanelFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TChanelFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTHandHoldFunctionality}
function TTHandHoldFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTHandHoldFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTHandHoldFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHandHoldFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHandHoldFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{THandHoldFunctionality}
procedure THandHoldFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function THandHoldFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THandHoldFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function THandHoldFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THandHoldFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTLineDistFunctionality}
function TTLineDistFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTLineDistFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTLineDistFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTLineDistFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLineDistFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TLineDistFunctionality}
procedure TLineDistFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TLineDistFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TLineDistFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TLineDistFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TLineDistFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTMuffFunctionality}
function TTMuffFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTMuffFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTMuffFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMuffFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMuffFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TMuffFunctionality}
procedure TMuffFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TMuffFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMuffFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TMuffFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMuffFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTOfferFunctionality}
function TTOfferFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTOfferFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTOfferFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOfferFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOfferFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOfferFunctionality_GetOfferByHumanID(Functionality: TFunctionality;   const HumanID: integer; out idOffer: integer): boolean; stdcall; external TypesDLL;

{TOfferFunctionality}
procedure TOfferFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TOfferFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOfferFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TOfferFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TOfferFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOfferFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TOfferFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferFunctionality_getSchedule(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOfferFunctionality_setSchedule(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TOfferFunctionality_getPassword(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TOfferFunctionality_setPassword(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TOfferFunctionality_getContactTLF(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TOfferFunctionality_setContactTLF(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
function TOfferFunctionality_getLastUpdated(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
procedure TOfferFunctionality_setLastUpdated(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
procedure TOfferFunctionality_LoadDATAFromStream(Functionality: TFunctionality;   Stream: TByteArray); stdcall; external TypesDLL;
procedure TOfferFunctionality_LoadDATAFromStream1(Functionality: TFunctionality;   Stream: TStream); stdcall; external TypesDLL;
function TOfferFunctionality_UserID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferFunctionality_UID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferFunctionality_AddressStr(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferFunctionality_Goods_Insert(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TOfferFunctionality_Goods_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TOfferFunctionality_Goods_GetList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TOfferFunctionality_Goods_Remove(Functionality: TFunctionality;   const idOfferGoods: integer); stdcall; external TypesDLL;
procedure TOfferFunctionality_Goods_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;

{TTDemandFunctionality}
function TTDemandFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTDemandFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTDemandFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDemandFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDemandFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TDemandFunctionality}
procedure TDemandFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TDemandFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDemandFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TDemandFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TDemandFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDemandFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTCommLineFunctionality}
function TTCommLineFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTCommLineFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTCommLineFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCommLineFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCommLineFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TCommLineFunctionality}
procedure TCommLineFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCommLineFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCommLineFunctionality_SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TCommLineFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCommLineFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCommLineFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTGoodsFunctionality}
function TTGoodsFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTGoodsFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTGoodsFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGoodsFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGoodsFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
procedure TTGoodsFunctionality_GetInstanceListContainingContext(Functionality: TFunctionality;   const Context: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTGoodsFunctionality_GetInstanceListContainingContext1(Functionality: TFunctionality;   const Context: string; out List: TStringList); stdcall; external TypesDLL;
function TTGoodsFunctionality_IsInstanceExist(Functionality: TFunctionality;   const pName: string; out idGoods: integer): boolean; stdcall; external TypesDLL;

{TGoodsFunctionality}
procedure TGoodsFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TGoodsFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGoodsFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TGoodsFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TGoodsFunctionality_setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
function TGoodsFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGoodsFunctionality_StdAmount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGoodsFunctionality_StdMeasureUnit(Functionality: TFunctionality): string; stdcall; external TypesDLL;

{TTCollectionFunctionality}
function TTCollectionFunctionality__CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
procedure TTCollectionFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
function TTCollectionFunctionality_TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCollectionFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCollectionFunctionality_getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;

{TCollectionFunctionality}
procedure TCollectionFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
function TCollectionFunctionality_TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCollectionFunctionality_CanDestroy(Functionality: TFunctionality;   out Reason: string): boolean; stdcall; external TypesDLL;
function TCollectionFunctionality_getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
procedure TCollectionFunctionality_setName(Functionality: TFunctionality;   const Value: string); stdcall; external TypesDLL;
function TCollectionFunctionality_getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCollectionFunctionality_InsertItem(Functionality: TFunctionality;   const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer; stdcall; external TypesDLL;
procedure TCollectionFunctionality_RemoveItem(Functionality: TFunctionality;   const id: integer); stdcall; external TypesDLL;
procedure TCollectionFunctionality_Item_ChangeAlias(Functionality: TFunctionality;   const id: integer; const pAlias: string); stdcall; external TypesDLL;
procedure TCollectionFunctionality_Item_ChangeListOrder(Functionality: TFunctionality;   const id: integer; const Order: integer); stdcall; external TypesDLL;
procedure TCollectionFunctionality_RemoveItems(Functionality: TFunctionality); stdcall; external TypesDLL;
function TCollectionFunctionality_IsItemExist(Functionality: TFunctionality;   const idTItem,idItem: integer): boolean; stdcall; external TypesDLL;
procedure TCollectionFunctionality_GetListItems(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TCollectionFunctionality_GetListItems1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TCollectionFunctionality_SaveListItems(Functionality: TFunctionality;   const List: TByteArray); stdcall; external TypesDLL;
procedure TCollectionFunctionality_SaveListItems1(Functionality: TFunctionality;   List: TList); stdcall; external TypesDLL;

