//. the export routines defines

{TTTileServerVisualizationFunctionality}
function TTTileServerVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTTileServerVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTileServerVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTTileServerVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTTileServerVisualizationFunctionality__CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTTileServerVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TTileServerVisualizationFunctionality}
procedure TTileServerVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TTileServerVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TTileServerVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTileServerVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TTileServerVisualizationFunctionality__ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

function TTileServerVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTileServerVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

procedure TTileServerVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall;

procedure TTileServerVisualizationFunctionality__SetProportion(Functionality: TFunctionality;   const Value: double); stdcall;

procedure TTileServerVisualizationFunctionality__Clear(Functionality: TFunctionality); stdcall;

function TTileServerVisualizationFunctionality__GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall;

procedure TTileServerVisualizationFunctionality__SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall;

function TTileServerVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

procedure TTileServerVisualizationFunctionality__GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall;

function TTileServerVisualizationFunctionality__TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall;

procedure TTileServerVisualizationFunctionality__Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall;

procedure TTileServerVisualizationFunctionality__Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall;

function TTileServerVisualizationFunctionality__UserData_GetTileProviderID(Functionality: TFunctionality;   out oTileProviderID: integer): boolean; stdcall;

procedure TTileServerVisualizationFunctionality__UserData_SetTileProviderID(Functionality: TFunctionality;   const pTileProviderID: integer); stdcall;

function TTileServerVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TTileServerVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTileServerVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TTileServerVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall;

procedure TTileServerVisualizationFunctionality__GetParams1(Functionality: TFunctionality;   out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer); stdcall;

procedure TTileServerVisualizationFunctionality__SetServerType(Functionality: TFunctionality;   const Value: integer); stdcall;

procedure TTileServerVisualizationFunctionality__SetServerURL(Functionality: TFunctionality;   const Value: string); stdcall;

procedure TTileServerVisualizationFunctionality__SetServerData(Functionality: TFunctionality;   const pData: TMemoryStream); stdcall;

procedure TTileServerVisualizationFunctionality__SetServerData1(Functionality: TFunctionality;   const Data: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality__GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality__GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall;

procedure TTileServerVisualizationFunctionality__RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;

procedure TTileServerVisualizationFunctionality__RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;

procedure TTileServerVisualizationFunctionality__AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall;

procedure TTileServerVisualizationFunctionality__GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality__Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;

procedure TTileServerVisualizationFunctionality__Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;

procedure TTileServerVisualizationFunctionality__Level_GetSegments(Functionality: TFunctionality;   const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality__Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality__Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality__Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality__GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;


{TTMeasurementObjectFunctionality}
function TTMeasurementObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMeasurementObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMeasurementObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMeasurementObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTMeasurementObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMeasurementObjectFunctionality__CreateNewInstance(Functionality: TFunctionality;   const pName: string; const pDomains: string): integer; stdcall;

function TTMeasurementObjectFunctionality__CreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall;

function TTMeasurementObjectFunctionality__CheckCreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall;

procedure TTMeasurementObjectFunctionality__GetInstanceListByNameContext(Functionality: TFunctionality;   const pName: string; out List: TByteArray); stdcall;

procedure TTMeasurementObjectFunctionality__GetInstanceDataByNameContext(Functionality: TFunctionality;   const pName: string; const Version: integer; out oData: TByteArray); stdcall;

function TTMeasurementObjectFunctionality__GetInstanceByGUID(Functionality: TFunctionality;   const pGUID: string): integer; stdcall;

function TTMeasurementObjectFunctionality__GetInstanceByGSOMeasurement(Functionality: TFunctionality;   const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer; stdcall;


{TMeasurementObjectFunctionality}
procedure TMeasurementObjectFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMeasurementObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMeasurementObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TMeasurementObjectFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TMeasurementObjectFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TMeasurementObjectFunctionality__getGUID(Functionality: TFunctionality): string; stdcall;

function TMeasurementObjectFunctionality__getDomains(Functionality: TFunctionality): string; stdcall;

procedure TMeasurementObjectFunctionality__setDomains(Functionality: TFunctionality;   Value: string); stdcall;

procedure TMeasurementObjectFunctionality__GetParams(Functionality: TFunctionality;   out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string); stdcall;

procedure TMeasurementObjectFunctionality__GSOMeasurements_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TMeasurementObjectFunctionality__GSOMeasurements_GetData(Functionality: TFunctionality;   const Version: integer; out oData: TByteArray); stdcall;

procedure TMeasurementObjectFunctionality__GSOMeasurements_Item_GetParams(Functionality: TFunctionality;   const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall;

procedure TMeasurementObjectFunctionality__GSOMeasurements_Item_GetParams1(Functionality: TFunctionality;   const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall;

procedure TMeasurementObjectFunctionality__GSOMeasurements_Item_GetData(Functionality: TFunctionality;   const idMeasurement: integer; out oData: TByteArray); stdcall;

procedure TMeasurementObjectFunctionality__GSOMeasurements_Item_GetData1(Functionality: TFunctionality;   const TimeID: Double; out oData: TByteArray); stdcall;


{TTAreaNotificationServerFunctionality}
function TTAreaNotificationServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTAreaNotificationServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTAreaNotificationServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTAreaNotificationServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTAreaNotificationServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TAreaNotificationServerFunctionality}
procedure TAreaNotificationServerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TAreaNotificationServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TAreaNotificationServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TAreaNotificationServerFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TAreaNotificationServerFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TAreaNotificationServerFunctionality__getInfo(Functionality: TFunctionality): string; stdcall;

procedure TAreaNotificationServerFunctionality__setInfo(Functionality: TFunctionality;   Value: string); stdcall;


{TTMODELServerVisualizationFunctionality}
function TTMODELServerVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTMODELServerVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMODELServerVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTMODELServerVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMODELServerVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TMODELServerVisualizationFunctionality}
procedure TMODELServerVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMODELServerVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TMODELServerVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TMODELServerVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMODELServerVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TMODELServerVisualizationFunctionality__ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

function TMODELServerVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TMODELServerVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TMODELServerVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TMODELServerVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TMODELServerVisualizationFunctionality__getServerURL(Functionality: TFunctionality): string; stdcall;

procedure TMODELServerVisualizationFunctionality__setServerURL(Functionality: TFunctionality;   Value: string); stdcall;


{TTDoubleVarFunctionality}
function TTDoubleVarFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDoubleVarFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDoubleVarFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDoubleVarFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTDoubleVarFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDoubleVarFunctionality}
procedure TDoubleVarFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TDoubleVarFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDoubleVarFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TDoubleVarFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TDoubleVarFunctionality__getValue(Functionality: TFunctionality): Double; stdcall;

procedure TDoubleVarFunctionality__setValue(Functionality: TFunctionality;   _Value: Double); stdcall;

function TDoubleVarFunctionality__getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;


{TTInt32VarFunctionality}
function TTInt32VarFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTInt32VarFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTInt32VarFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTInt32VarFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTInt32VarFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TInt32VarFunctionality}
procedure TInt32VarFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TInt32VarFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TInt32VarFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TInt32VarFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TInt32VarFunctionality__getValue(Functionality: TFunctionality): integer; stdcall;

procedure TInt32VarFunctionality__setValue(Functionality: TFunctionality;   _Value: integer); stdcall;

function TInt32VarFunctionality__getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;


{TTURLFunctionality}
function TTURLFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTURLFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTURLFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTURLFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTURLFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TURLFunctionality}
procedure TURLFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall;

procedure TURLFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TURLFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TURLFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TURLFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TURLFunctionality__getURL(Functionality: TFunctionality): string; stdcall;

procedure TURLFunctionality__setURL(Functionality: TFunctionality;   Value: string); stdcall;

function TURLFunctionality__getURLName(Functionality: TFunctionality): string; stdcall;

procedure TURLFunctionality__setURLName(Functionality: TFunctionality;   Value: string); stdcall;

function TURLFunctionality__getflPanelBrowser(Functionality: TFunctionality): boolean; stdcall;

procedure TURLFunctionality__setflPanelBrowser(Functionality: TFunctionality;   Value: boolean); stdcall;

procedure TURLFunctionality__GetParams(Functionality: TFunctionality;   out oURL: string; out oURLName: string; out oflPanelBrowser: boolean); stdcall;

procedure TURLFunctionality__SetParams(Functionality: TFunctionality;   const pURL: string; const pURLName: string; const pflPanelBrowser: boolean); stdcall;


{TTPatternVisualizationFunctionality}
function TTPatternVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTPatternVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTPatternVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTPatternVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTPatternVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TPatternVisualizationFunctionality}
procedure TPatternVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TPatternVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TPatternVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TPatternVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TPatternVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TPatternVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TPatternVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

function TPatternVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TPatternVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TPatternVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TPatternVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TPatternVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TPatternVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TPatternVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TPatternVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TPatternVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

function TPatternVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TPatternVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TPatternVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;


{TTMapFormatObjectFunctionality}
function TTMapFormatObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMapFormatObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMapFormatObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMapFormatObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTMapFormatObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTMapFormatObjectFunctionality__GetInstanceNames(Functionality: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); stdcall;

function TTMapFormatObjectFunctionality__GetDATAHash(Functionality: TFunctionality;   DATAStream: TMemoryStream): integer; stdcall;

function TTMapFormatObjectFunctionality__GetDATAHash1(Functionality: TFunctionality;   DATAStream: TByteArray): integer; stdcall;


{TMapFormatObjectFunctionality}
procedure TMapFormatObjectFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMapFormatObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMapFormatObjectFunctionality__DATAPanel_Create(Functionality: TFunctionality): TForm; stdcall;

function TMapFormatObjectFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TMapFormatObjectFunctionality___GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;

function TMapFormatObjectFunctionality__GetHintInfo(Functionality: TFunctionality;   const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall;

function TMapFormatObjectFunctionality__getidMap(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatObjectFunctionality__setidMap(Functionality: TFunctionality;   Value: integer); stdcall;

function TMapFormatObjectFunctionality__getFormatID(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatObjectFunctionality__setFormatID(Functionality: TFunctionality;   Value: integer); stdcall;

function TMapFormatObjectFunctionality__getKindID(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatObjectFunctionality__setKindID(Functionality: TFunctionality;   Value: integer); stdcall;

function TMapFormatObjectFunctionality__getTypeID(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatObjectFunctionality__setTypeID(Functionality: TFunctionality;   Value: integer); stdcall;

function TMapFormatObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TMapFormatObjectFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

procedure TMapFormatObjectFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TMapFormatObjectFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TMapFormatObjectFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure TMapFormatObjectFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

function TMapFormatObjectFunctionality__getDATAHash(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatObjectFunctionality__setDATAHash(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TMapFormatObjectFunctionality__GetParams(Functionality: TFunctionality;   out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string); stdcall;

procedure TMapFormatObjectFunctionality__SetParams(Functionality: TFunctionality;   const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string); stdcall;

procedure TMapFormatObjectFunctionality__SetObjectByDATA(Functionality: TFunctionality); stdcall;

procedure TMapFormatObjectFunctionality__UpdateDATAHash(Functionality: TFunctionality); stdcall;

procedure TMapFormatObjectFunctionality__Compile(Functionality: TFunctionality); stdcall;

procedure TMapFormatObjectFunctionality__Build(Functionality: TFunctionality;   const flUsePrototype: boolean); stdcall;


{TTMapFormatMapFunctionality}
function TTMapFormatMapFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMapFormatMapFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMapFormatMapFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMapFormatMapFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTMapFormatMapFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTMapFormatMapFunctionality__GetInstanceListByGeoSpace(Functionality: TFunctionality;   const idGeoSpace: integer; out List: TByteArray); stdcall;


{TMapFormatMapFunctionality}
procedure TMapFormatMapFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMapFormatMapFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMapFormatMapFunctionality__getGeoSpaceID(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatMapFunctionality__setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall;

function TMapFormatMapFunctionality__getFormatID(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatMapFunctionality__setFormatID(Functionality: TFunctionality;   Value: integer); stdcall;

function TMapFormatMapFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TMapFormatMapFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

procedure TMapFormatMapFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TMapFormatMapFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TMapFormatMapFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure TMapFormatMapFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TMapFormatMapFunctionality__GetObjectPrototypesDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TMapFormatMapFunctionality__GetObjectPrototypesDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TMapFormatMapFunctionality__SetObjectPrototypesDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure TMapFormatMapFunctionality__SetObjectPrototypesDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

function TMapFormatMapFunctionality__GetObjectPrototype(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean; stdcall;

procedure TMapFormatMapFunctionality__GetParams(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oFormatID: integer; out oName: string); stdcall;

procedure TMapFormatMapFunctionality__SetParams(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pFormatID: integer; const pName: string); stdcall;

function TMapFormatMapFunctionality__ObjectsCounter(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatMapFunctionality__GetObjectsList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TMapFormatMapFunctionality__GetObjectsList1(Functionality: TFunctionality;   const KindID: integer; out List: TByteArray); stdcall;

procedure TMapFormatMapFunctionality__GetObjectsList2(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out List: TByteArray); stdcall;

procedure TMapFormatMapFunctionality__GetObjectsList3(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray); stdcall;

function TMapFormatMapFunctionality__GetObject(Functionality: TFunctionality;   const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall;

function TMapFormatMapFunctionality__GetObject1(Functionality: TFunctionality;   const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall;

procedure TMapFormatMapFunctionality__ExportMap(Functionality: TFunctionality;   const pFormatID: integer; out ZipData: TByteArray); stdcall;

procedure TMapFormatMapFunctionality__RemoveObjects(Functionality: TFunctionality); stdcall;

procedure TMapFormatMapFunctionality__RemoveObjects1(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer); stdcall;

procedure TMapFormatMapFunctionality__UpdateObjectDATAHashes(Functionality: TFunctionality); stdcall;

procedure TMapFormatMapFunctionality__RecalculateMapArea(Functionality: TFunctionality); stdcall;

procedure TMapFormatMapFunctionality__RemoveIrrelevantObjectsInMapArea(Functionality: TFunctionality); stdcall;


{TTSPLVisualizationFunctionality}
function TTSPLVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTSPLVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSPLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTSPLVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTSPLVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TSPLVisualizationFunctionality}
procedure TSPLVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TSPLVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TSPLVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSPLVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TSPLVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSPLVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TSPLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TSPLVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TSPLVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out SPLType: integer; out SPLDATA: TByteArray); stdcall;

procedure TSPLVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const SPLType: integer; const SPLDATA: TByteArray); stdcall;


{TTBoolVarFunctionality}
function TTBoolVarFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTBoolVarFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTBoolVarFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTBoolVarFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTBoolVarFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TBoolVarFunctionality}
procedure TBoolVarFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TBoolVarFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TBoolVarFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TBoolVarFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TBoolVarFunctionality__getValue(Functionality: TFunctionality): boolean; stdcall;

procedure TBoolVarFunctionality__setValue(Functionality: TFunctionality;   _Value: boolean); stdcall;

function TBoolVarFunctionality__getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;


{TTGeoSpaceFunctionality}
function TTGeoSpaceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGeoSpaceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGeoSpaceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGeoSpaceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTGeoSpaceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TGeoSpaceFunctionality}
procedure TGeoSpaceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TGeoSpaceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TGeoSpaceFunctionality__GetDatumIDLocally(Functionality: TFunctionality): integer; stdcall;

function TGeoSpaceFunctionality__ConvertGeoToXYLocally(Functionality: TFunctionality;   const Lat,Long: Extended; out Xr,Yr: Extended): boolean; stdcall;

function TGeoSpaceFunctionality__ConvertXYToGeoLocally(Functionality: TFunctionality;   const X,Y: Extended; out Lat,Long: Extended): boolean; stdcall;

function TGeoSpaceFunctionality__GetDistanceBetweenTwoXYPointsLocally(Functionality: TFunctionality;   const X0,Y0,X1,Y1: Extended; out Distance: Extended): boolean; stdcall;

function TGeoSpaceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TGeoSpaceFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TGeoSpaceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TGeoSpaceFunctionality__getDatumID(Functionality: TFunctionality): integer; stdcall;

procedure TGeoSpaceFunctionality__setDatumID(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeoSpaceFunctionality__getProjectionID(Functionality: TFunctionality): integer; stdcall;

procedure TGeoSpaceFunctionality__setProjectionID(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeoSpaceFunctionality__ConvertXYToLatLong(Functionality: TFunctionality;   const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean; stdcall;

function TGeoSpaceFunctionality__ConvertXYToDatumLatLong(Functionality: TFunctionality;   const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean; stdcall;

function TGeoSpaceFunctionality__ConvertLatLongToXY(Functionality: TFunctionality;   const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall;

function TGeoSpaceFunctionality__ConvertDatumLatLongToXY(Functionality: TFunctionality;   const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall;

procedure TGeoSpaceFunctionality__GetGeoCrdSystemList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TGeoSpaceFunctionality__GetGeoCrdSystemList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TGeoSpaceFunctionality__GetMapFormatMapList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TGeoSpaceFunctionality__GetMapFormatMapList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TGeoSpaceFunctionality__GetMapFormatMapObjectsByNameContext(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TList); stdcall;

procedure TGeoSpaceFunctionality__GetMapFormatMapObjectsByNameContext1(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray); stdcall;


{TTUserAlertFunctionality}
function TTUserAlertFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTUserAlertFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTUserAlertFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTUserAlertFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTUserAlertFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTUserAlertFunctionality__GetActiveInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TTUserAlertFunctionality__GetActiveInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;


{TUserAlertFunctionality}
procedure TUserAlertFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TUserAlertFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TUserAlertFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TUserAlertFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TUserAlertFunctionality__getUserID(Functionality: TFunctionality): integer; stdcall;

procedure TUserAlertFunctionality__setUserID(Functionality: TFunctionality;   Value: integer); stdcall;

function TUserAlertFunctionality__getTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;

procedure TUserAlertFunctionality__setTimeStamp(Functionality: TFunctionality;   Value: TDateTime); stdcall;

function TUserAlertFunctionality__getActive(Functionality: TFunctionality): boolean; stdcall;

procedure TUserAlertFunctionality__setActive(Functionality: TFunctionality;   Value: boolean); stdcall;

function TUserAlertFunctionality__getAlertID(Functionality: TFunctionality): integer; stdcall;

procedure TUserAlertFunctionality__setAlertID(Functionality: TFunctionality;   Value: integer); stdcall;

function TUserAlertFunctionality__getSeverity(Functionality: TFunctionality): integer; stdcall;

procedure TUserAlertFunctionality__setSeverity(Functionality: TFunctionality;   Value: integer); stdcall;

function TUserAlertFunctionality__getDescription(Functionality: TFunctionality): string; stdcall;

procedure TUserAlertFunctionality__setDescription(Functionality: TFunctionality;   Value: string); stdcall;

procedure TUserAlertFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TUserAlertFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TUserAlertFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure TUserAlertFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;


{TTGeoGraphServerObjectFunctionality}
function TTGeoGraphServerObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGeoGraphServerObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGeoGraphServerObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGeoGraphServerObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTGeoGraphServerObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTGeoGraphServerObjectFunctionality__GetInstanceByServerObject(Functionality: TFunctionality;   const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean; stdcall;


{TGeoGraphServerObjectFunctionality}
procedure TGeoGraphServerObjectFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TGeoGraphServerObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TGeoGraphServerObjectFunctionality__AttachObject(Functionality: TFunctionality); stdcall;

procedure TGeoGraphServerObjectFunctionality__DetachObject(Functionality: TFunctionality); stdcall;

function TGeoGraphServerObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TGeoGraphServerObjectFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TGeoGraphServerObjectFunctionality__getGeoGraphServerID(Functionality: TFunctionality): integer; stdcall;

procedure TGeoGraphServerObjectFunctionality__setGeoGraphServerID(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeoGraphServerObjectFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall;

procedure TGeoGraphServerObjectFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeoGraphServerObjectFunctionality__getBusinessModelID(Functionality: TFunctionality): integer; stdcall;

procedure TGeoGraphServerObjectFunctionality__setBusinessModelID(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeoGraphServerObjectFunctionality__getDomains(Functionality: TFunctionality): string; stdcall;

procedure TGeoGraphServerObjectFunctionality__setDomains(Functionality: TFunctionality;   Value: string); stdcall;

procedure TGeoGraphServerObjectFunctionality__GetParams(Functionality: TFunctionality;   out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer); stdcall;

procedure TGeoGraphServerObjectFunctionality__ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall;

function TGeoGraphServerObjectFunctionality__GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall;

function TGeoGraphServerObjectFunctionality__GetNearestMapFormatObjects(Functionality: TFunctionality;   const MaxDistance: double; out List: TByteArray): boolean; stdcall;

function TGeoGraphServerObjectFunctionality__GetNearestMapFormatObjectsNames(Functionality: TFunctionality;   const MaxDistance: double; out Names: WideString): boolean; stdcall;

function TGeoGraphServerObjectFunctionality__Measurements_AddNew(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer; stdcall;

function TGeoGraphServerObjectFunctionality__Measurements_AddNew1(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer; stdcall;

procedure TGeoGraphServerObjectFunctionality__Measurements_Remove(Functionality: TFunctionality;   const pidMeasurement: integer); stdcall;

procedure TGeoGraphServerObjectFunctionality__Measurements_Item_UpdateData(Functionality: TFunctionality;   const pTimeID: Double; const pData: TByteArray); stdcall;


{TTGeoGraphServerFunctionality}
function TTGeoGraphServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGeoGraphServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGeoGraphServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGeoGraphServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTGeoGraphServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTGeoGraphServerFunctionality__GetActiveInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TTGeoGraphServerFunctionality__GetActiveInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;

function TTGeoGraphServerFunctionality__GetInstanceForRegistration(Functionality: TFunctionality): integer; stdcall;


{TGeoGraphServerFunctionality}
procedure TGeoGraphServerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TGeoGraphServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TGeoGraphServerFunctionality__SetData(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

function TGeoGraphServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TGeoGraphServerFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TGeoGraphServerFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TGeoGraphServerFunctionality__getAddress(Functionality: TFunctionality): string; stdcall;

procedure TGeoGraphServerFunctionality__setAddress(Functionality: TFunctionality;   Value: string); stdcall;

function TGeoGraphServerFunctionality__getInternalAddress(Functionality: TFunctionality): string; stdcall;

procedure TGeoGraphServerFunctionality__setInternalAddress(Functionality: TFunctionality;   Value: string); stdcall;

function TGeoGraphServerFunctionality__getInfo(Functionality: TFunctionality): string; stdcall;

procedure TGeoGraphServerFunctionality__setInfo(Functionality: TFunctionality;   Value: string); stdcall;

procedure TGeoGraphServerFunctionality__GetData(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TGeoGraphServerFunctionality__GetData1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

function TGeoGraphServerFunctionality__RegisterObject(Functionality: TFunctionality;   const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall;

function TGeoGraphServerFunctionality__RegisterObject1(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall;

function TGeoGraphServerFunctionality__RegisterObject2(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer; stdcall;

procedure TGeoGraphServerFunctionality__UnRegisterObject(Functionality: TFunctionality;   const ObjectID: integer); stdcall;

function TGeoGraphServerFunctionality__ObjectCounter(Functionality: TFunctionality): integer; stdcall;

procedure TGeoGraphServerFunctionality__ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall;

procedure TGeoGraphServerFunctionality__Object_GetProperties(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer); stdcall;

procedure TGeoGraphServerFunctionality__Object_GetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer); stdcall;

procedure TGeoGraphServerFunctionality__Object_SetProperties(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer); stdcall;

procedure TGeoGraphServerFunctionality__Object_SetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer); stdcall;

function TGeoGraphServerFunctionality__Object_GetObjectType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall;

procedure TGeoGraphServerFunctionality__Object_SetObjectType(Functionality: TFunctionality;   const ObjectID: integer; const ObjectType: integer); stdcall;

function TGeoGraphServerFunctionality__Object_GetBusinessType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall;

procedure TGeoGraphServerFunctionality__Object_SetBusinessType(Functionality: TFunctionality;   const ObjectID: integer; const BusinessType: integer); stdcall;

function TGeoGraphServerFunctionality__Object_GetComponentID(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall;

procedure TGeoGraphServerFunctionality__Object_SetComponentID(Functionality: TFunctionality;   const ObjectID: integer; const ObjectComponentID: integer); stdcall;

procedure TGeoGraphServerFunctionality__Object_ExecuteOperation(Functionality: TFunctionality;   const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray); stdcall;

function TGeoGraphServerFunctionality__DataID(Functionality: TFunctionality): integer; stdcall;


{TTGeoCrdSystemFunctionality}
function TTGeoCrdSystemFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGeoCrdSystemFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGeoCrdSystemFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGeoCrdSystemFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTGeoCrdSystemFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTGeoCrdSystemFunctionality__GetInstanceByLatLongLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;

procedure TTGeoCrdSystemFunctionality__GetInstanceByLatLongLocally1(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall;

procedure TTGeoCrdSystemFunctionality__GetInstanceByXYLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall;

procedure TTGeoCrdSystemFunctionality__GetInstanceByXYLocally1(Functionality: TFunctionality;   const pX,pY: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall;

procedure TTGeoCrdSystemFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TTGeoCrdSystemFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTGeoCrdSystemFunctionality__GetInstanceByLatLong(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;

procedure TTGeoCrdSystemFunctionality__GetInstanceByXY(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall;


{TGeoCrdSystemFunctionality}
procedure TGeoCrdSystemFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TGeoCrdSystemFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TGeoCrdSystemFunctionality__GetDataLocally(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oName: string; out oDatum: string; out oProjection: string; out oProjectionData: TMemoryStream); stdcall;

procedure TGeoCrdSystemFunctionality__GetGeodesyPointsLocally(Functionality: TFunctionality;   out Points: TByteArray); stdcall;

function TGeoCrdSystemFunctionality__getGeoSpaceID(Functionality: TFunctionality): integer; stdcall;

procedure TGeoCrdSystemFunctionality__setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeoCrdSystemFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TGeoCrdSystemFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TGeoCrdSystemFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TGeoCrdSystemFunctionality__getDatum(Functionality: TFunctionality): string; stdcall;

procedure TGeoCrdSystemFunctionality__setDatum(Functionality: TFunctionality;   Value: string); stdcall;

function TGeoCrdSystemFunctionality__getProjection(Functionality: TFunctionality): string; stdcall;

procedure TGeoCrdSystemFunctionality__setProjection(Functionality: TFunctionality;   Value: string); stdcall;

procedure TGeoCrdSystemFunctionality__GetProjectionDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TGeoCrdSystemFunctionality__GetProjectionDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TGeoCrdSystemFunctionality__SetProjectionDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure TGeoCrdSystemFunctionality__SetProjectionDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TGeoCrdSystemFunctionality__GetGeodesyPoints(Functionality: TFunctionality;   out Points: TByteArray); stdcall;


{TTFilterVisualizationFunctionality}
function TTFilterVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTFilterVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTFilterVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTFilterVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTFilterVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TFilterVisualizationFunctionality}
procedure TFilterVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TFilterVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TFilterVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TFilterVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TFilterVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TFilterVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TFilterVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TFilterVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TFilterVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out FilterType: integer; out FilterDATA: TByteArray); stdcall;

procedure TFilterVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const FilterType: integer; const FilterDATA: TByteArray); stdcall;


{TTHINTVisualizationFunctionality}
function TTHINTVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTHINTVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHINTVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTHINTVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTHINTVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;

procedure TTHINTVisualizationFunctionality__GetInstanceParams(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall;

procedure TTHINTVisualizationFunctionality__GetInstanceParams1(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall;

procedure TTHINTVisualizationFunctionality__GetInstanceOwnerDatasAndParams(Functionality: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray); stdcall;


{THINTVisualizationFunctionality}
procedure THINTVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure THINTVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure THINTVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure THINTVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function THINTVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function THINTVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function THINTVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

function THINTVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function THINTVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function THINTVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure THINTVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure THINTVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure THINTVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure THINTVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure THINTVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure THINTVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

procedure THINTVisualizationFunctionality__GetPrivateDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure THINTVisualizationFunctionality__GetPrivateDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall;

procedure THINTVisualizationFunctionality__GetPrivateDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure THINTVisualizationFunctionality__GetPrivateDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall;

procedure THINTVisualizationFunctionality__SetPrivateDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure THINTVisualizationFunctionality__SetPrivateDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

function THINTVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure THINTVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure THINTVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;


{TTDetailedPictureVisualizationFunctionality}
function TTDetailedPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTDetailedPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDetailedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTDetailedPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTDetailedPictureVisualizationFunctionality__CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTDetailedPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TDetailedPictureVisualizationFunctionality}
procedure TDetailedPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TDetailedPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TDetailedPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TDetailedPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TDetailedPictureVisualizationFunctionality__ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

function TDetailedPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDetailedPictureVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

procedure TDetailedPictureVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall;

procedure TDetailedPictureVisualizationFunctionality__SetProportion(Functionality: TFunctionality;   const Value: double); stdcall;

procedure TDetailedPictureVisualizationFunctionality__Clear(Functionality: TFunctionality); stdcall;

function TDetailedPictureVisualizationFunctionality__GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall;

procedure TDetailedPictureVisualizationFunctionality__SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall;

function TDetailedPictureVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

procedure TDetailedPictureVisualizationFunctionality__GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall;

function TDetailedPictureVisualizationFunctionality__TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall;

procedure TDetailedPictureVisualizationFunctionality__Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall;

procedure TDetailedPictureVisualizationFunctionality__Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall;

function TDetailedPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TDetailedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TDetailedPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TDetailedPictureVisualizationFunctionality__GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TDetailedPictureVisualizationFunctionality__GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall;

procedure TDetailedPictureVisualizationFunctionality__RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;

procedure TDetailedPictureVisualizationFunctionality__RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;

procedure TDetailedPictureVisualizationFunctionality__AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall;

procedure TDetailedPictureVisualizationFunctionality__GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall;

procedure TDetailedPictureVisualizationFunctionality__Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;

procedure TDetailedPictureVisualizationFunctionality__Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;

procedure TDetailedPictureVisualizationFunctionality__Level_GetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;

procedure TDetailedPictureVisualizationFunctionality__Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall;

procedure TDetailedPictureVisualizationFunctionality__Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall;

procedure TDetailedPictureVisualizationFunctionality__Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall;

procedure TDetailedPictureVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall;

procedure TDetailedPictureVisualizationFunctionality__GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;


{TTCoVisualizationFunctionality}
function TTCoVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTCoVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCoVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTCoVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TCoVisualizationFunctionality}
procedure TCoVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TCoVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TCoVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TCoVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TCoVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TCoVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCoVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

procedure TCoVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality;   out oContainer: TExtendedContainerCoord); stdcall;

procedure TCoVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

function TCoVisualizationFunctionality__GetOwnSpaceHINTVisualizationLocally(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall;

procedure TCoVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCoVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TCoVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TCoVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TCoVisualizationFunctionality__GetSpace(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TCoVisualizationFunctionality__GetSpace1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall;

procedure TCoVisualizationFunctionality__GetSpace2(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TCoVisualizationFunctionality__GetSpace3(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall;

procedure TCoVisualizationFunctionality__SetSpace(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure TCoVisualizationFunctionality__SetSpace1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

function TCoVisualizationFunctionality__GetOwnSpaceHINTVisualization(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall;

function TCoVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TCoVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TCoVisualizationFunctionality__Pack(Functionality: TFunctionality); stdcall;

procedure TCoVisualizationFunctionality__UnPack(Functionality: TFunctionality); stdcall;

function TCoVisualizationFunctionality__IsPacked(Functionality: TFunctionality): boolean; stdcall;


{TTForumMessageFunctionality}
function TTForumMessageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTForumMessageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTForumMessageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTForumMessageFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTForumMessageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TForumMessageFunctionality}
procedure TForumMessageFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall;

procedure TForumMessageFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TForumMessageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TForumMessageFunctionality__FunctionalityUserID(Functionality: TFunctionality): integer; stdcall;

procedure TForumMessageFunctionality__setidUser(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TForumMessageFunctionality__Modified(Functionality: TFunctionality); stdcall;

function TForumMessageFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TForumMessageFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TForumMessageFunctionality__getidForum(Functionality: TFunctionality): integer; stdcall;

procedure TForumMessageFunctionality__setidForum(Functionality: TFunctionality;   Value: integer); stdcall;

function TForumMessageFunctionality__idUser(Functionality: TFunctionality): integer; stdcall;

procedure TForumMessageFunctionality__Send(Functionality: TFunctionality); stdcall;

function TForumMessageFunctionality__SentTime(Functionality: TFunctionality): TDateTime; stdcall;

function TForumMessageFunctionality__getidForMessage(Functionality: TFunctionality): integer; stdcall;

procedure TForumMessageFunctionality__setidForMessage(Functionality: TFunctionality;   Value: integer); stdcall;

function TForumMessageFunctionality__LastModified(Functionality: TFunctionality): TDateTime; stdcall;

procedure TForumMessageFunctionality__GetMessage(Functionality: TFunctionality;   out Message: TMemoryStream); stdcall;

procedure TForumMessageFunctionality__GetMessage1(Functionality: TFunctionality;   out Message: TByteArray); stdcall;

procedure TForumMessageFunctionality__SetMessage(Functionality: TFunctionality;   const Message: TMemoryStream); stdcall;

procedure TForumMessageFunctionality__SetMessage1(Functionality: TFunctionality;   const Message: TByteArray); stdcall;

function TForumMessageFunctionality__ReplyMessageCount(Functionality: TFunctionality): integer; stdcall;

procedure TForumMessageFunctionality__GetReplyMessageList(Functionality: TFunctionality;   out MessageList: TList); stdcall;

procedure TForumMessageFunctionality__GetReplyMessageList1(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall;


{TTForumFunctionality}
function TTForumFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTForumFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTForumFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTForumFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTForumFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TForumFunctionality}
procedure TForumFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TForumFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TForumFunctionality__DeleteOldMessages(Functionality: TFunctionality;   const pMessageLifeTime: TDateTime); stdcall;

function TForumFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TForumFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TForumFunctionality__getMessageLifeTime(Functionality: TFunctionality): TDateTime; stdcall;

procedure TForumFunctionality__setMessageLifeTime(Functionality: TFunctionality;   Value: TDateTime); stdcall;

function TForumFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TForumFunctionality__RootMessageCount(Functionality: TFunctionality): integer; stdcall;

procedure TForumFunctionality__GetRootMessageList(Functionality: TFunctionality;   out MessageList: TList); stdcall;

procedure TForumFunctionality__GetRootMessageList1(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall;

function TForumFunctionality__MessageCount(Functionality: TFunctionality): integer; stdcall;

procedure TForumFunctionality__GetMessageList(Functionality: TFunctionality;   out MessageList: TList); stdcall;

procedure TForumFunctionality__GetMessageList1(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall;

function TForumFunctionality__AddMessage(Functionality: TFunctionality;   const pidUser: integer; const pidForMessage: integer): integer; stdcall;

procedure TForumFunctionality__DestroyMessage(Functionality: TFunctionality;   const pidMessage: integer); stdcall;


{TTCUSTOMVisualizationFunctionality}
function TTCUSTOMVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTCUSTOMVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCUSTOMVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCUSTOMVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTCUSTOMVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TCUSTOMVisualizationFunctionality}
procedure TCUSTOMVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCUSTOMVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TCUSTOMVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TCUSTOMVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCUSTOMVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TCUSTOMVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TCUSTOMVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TCUSTOMVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TCUSTOMVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TCUSTOMVisualizationFunctionality__getMODULEName(Functionality: TFunctionality): string; stdcall;

procedure TCUSTOMVisualizationFunctionality__setMODULEName(Functionality: TFunctionality;   Value: string); stdcall;

function TCUSTOMVisualizationFunctionality__getFunctionName(Functionality: TFunctionality): string; stdcall;

procedure TCUSTOMVisualizationFunctionality__setFunctionName(Functionality: TFunctionality;   Value: string); stdcall;

function TCUSTOMVisualizationFunctionality__getFunctionVersion(Functionality: TFunctionality): integer; stdcall;

procedure TCUSTOMVisualizationFunctionality__setFunctionVersion(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TCUSTOMVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer); stdcall;


{TTOLEVisualizationFunctionality}
function TTOLEVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOLEVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOLEVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTOLEVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOLEVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOLEVisualizationFunctionality}
procedure TOLEVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOLEVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TOLEVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOLEVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TOLEVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TOLEVisualizationFunctionality__SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TOLEVisualizationFunctionality__EditDATA(Functionality: TFunctionality); stdcall;

function TOLEVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TOLEVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

function TOLEVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TOLEVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TOLEVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TOLEVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;

procedure TOLEVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall;

procedure TOLEVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure TOLEVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall;

procedure TOLEVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;

procedure TOLEVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall;


{TTHTMLVisualizationFunctionality}
function TTHTMLVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTHTMLVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHTMLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTHTMLVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTHTMLVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{THTMLVisualizationFunctionality}
procedure THTMLVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure THTMLVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure THTMLVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure THTMLVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure THTMLVisualizationFunctionality__SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure THTMLVisualizationFunctionality__EditDATA(Functionality: TFunctionality); stdcall;

function THTMLVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function THTMLVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function THTMLVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

function THTMLVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function THTMLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function THTMLVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function THTMLVisualizationFunctionality__getWidth(Functionality: TFunctionality): integer; stdcall;

procedure THTMLVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: integer); stdcall;

procedure THTMLVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;

procedure THTMLVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall;

procedure THTMLVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure THTMLVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall;

procedure THTMLVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;

procedure THTMLVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall;


{TTBZRVisualizationFunctionality}
function TTBZRVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTBZRVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTBZRVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTBZRVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTBZRVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TBZRVisualizationFunctionality}
procedure TBZRVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TBZRVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TBZRVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TBZRVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TBZRVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TBZRVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TBZRVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TBZRVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTAGIFVisualizationFunctionality}
function TTAGIFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTAGIFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTAGIFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTAGIFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTAGIFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TAGIFVisualizationFunctionality}
procedure TAGIFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TAGIFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TAGIFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TAGIFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TAGIFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TAGIFVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;

function TAGIFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TAGIFVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TAGIFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TAGIFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TAGIFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TAGIFVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;

procedure TAGIFVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall;

procedure TAGIFVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure TAGIFVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall;

procedure TAGIFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;

procedure TAGIFVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall;


{TTOrientedVIDEOVisualizationFunctionality}
function TTOrientedVIDEOVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOrientedVIDEOVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOrientedVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTOrientedVIDEOVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOrientedVIDEOVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOrientedVIDEOVisualizationFunctionality}
procedure TOrientedVIDEOVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedVIDEOVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TOrientedVIDEOVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOrientedVIDEOVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TOrientedVIDEOVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;

function TOrientedVIDEOVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOrientedVIDEOVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TOrientedVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TOrientedVIDEOVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TOrientedVIDEOVisualizationFunctionality__getDataServer(Functionality: TFunctionality): string; stdcall;

procedure TOrientedVIDEOVisualizationFunctionality__setDataServer(Functionality: TFunctionality;   Value: string); stdcall;

function TOrientedVIDEOVisualizationFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedVIDEOVisualizationFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;


{TTVIDEOVisualizationFunctionality}
function TTVIDEOVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTVIDEOVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTVIDEOVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTVIDEOVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TVIDEOVisualizationFunctionality}
procedure TVIDEOVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TVIDEOVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TVIDEOVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TVIDEOVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TVIDEOVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;

function TVIDEOVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TVIDEOVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TVIDEOVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TVIDEOVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TVIDEOVisualizationFunctionality__getDataServer(Functionality: TFunctionality): string; stdcall;

procedure TVIDEOVisualizationFunctionality__setDataServer(Functionality: TFunctionality;   Value: string); stdcall;

function TVIDEOVisualizationFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall;

procedure TVIDEOVisualizationFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;


{TTOPPVisualizationFunctionality}
function TTOPPVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOPPVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOPPVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTOPPVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOPPVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOPPVisualizationFunctionality}
procedure TOPPVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOPPVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TOPPVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOPPVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TOPPVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOPPVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TOPPVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TOPPVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TOPPVisualizationFunctionality__getPropsPanel_idTObj(Functionality: TFunctionality): integer; stdcall;

procedure TOPPVisualizationFunctionality__setPropsPanel_idTObj(Functionality: TFunctionality;   Value: integer); stdcall;

function TOPPVisualizationFunctionality__getPropsPanel_idObj(Functionality: TFunctionality): integer; stdcall;

procedure TOPPVisualizationFunctionality__setPropsPanel_idObj(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOPPVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer); stdcall;


{TTMODELServerFunctionality}
function TTMODELServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMODELServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMODELServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMODELServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTMODELServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMODELServerFunctionality__GetInstanceByIPAddress(Functionality: TFunctionality;   const IPAddress: string;  out id: integer): boolean; stdcall;


{TMODELServerFunctionality}
procedure TMODELServerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMODELServerFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TMODELServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMODELServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TMODELServerFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELServerFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TMODELServerFunctionality__getIPAddress(Functionality: TFunctionality): string; stdcall;

procedure TMODELServerFunctionality__setIPAddress(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELServerFunctionality__IsUserExist(Functionality: TFunctionality;   const _UserName,_UserPassword: string): boolean; stdcall;

function TMODELServerFunctionality__GetUserID(Functionality: TFunctionality;   const _UserName,_UserPassword: string): integer; stdcall;

function TMODELServerFunctionality__IsOnLine(Functionality: TFunctionality): boolean; stdcall;

function TMODELServerFunctionality__Info(Functionality: TFunctionality): string; stdcall;

procedure TMODELServerFunctionality__GetLicense(Functionality: TFunctionality;   out License: WideString); stdcall;

procedure TMODELServerFunctionality__CreateNewUserByDefaultPrototype(Functionality: TFunctionality;   const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer); stdcall;


{TTCoReferenceFunctionality}
function TTCoReferenceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCoReferenceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCoReferenceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoReferenceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCoReferenceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCoReferenceFunctionality}
procedure TCoReferenceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCoReferenceFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TCoReferenceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TCoReferenceFunctionality__ShowReferencedObjectPanelProps(Functionality: TFunctionality); stdcall;

function TCoReferenceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TCoReferenceFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TCoReferenceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TCoReferenceFunctionality__GetReferencedObject(Functionality: TFunctionality;   out idTReferencedObject,idReferencedObject: integer); stdcall;

procedure TCoReferenceFunctionality__SetReferencedObject(Functionality: TFunctionality;   const idTReferencedObject,idReferencedObject: integer); stdcall;


{TTPositionerFunctionality}
function TTPositionerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTPositionerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTPositionerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTPositionerFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTPositionerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TPositionerFunctionality}
procedure TPositionerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TPositionerFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TPositionerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TPositionerFunctionality__SetPosition(Functionality: TFunctionality); stdcall;

function TPositionerFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TPositionerFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TPositionerFunctionality__Get2DPosition(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;

procedure TPositionerFunctionality__Save2DPosition(Functionality: TFunctionality;   Reflector: TReflector); stdcall;

procedure TPositionerFunctionality__Save2DPosition1(Functionality: TFunctionality;   const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;

function TPositionerFunctionality__getPositionName(Functionality: TFunctionality): string; stdcall;

procedure TPositionerFunctionality__setPositionName(Functionality: TFunctionality;   Value: string); stdcall;


{TTOrientedWMFVisualizationFunctionality}
function TTOrientedWMFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOrientedWMFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOrientedWMFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTOrientedWMFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOrientedWMFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOrientedWMFVisualizationFunctionality}
procedure TOrientedWMFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TOrientedWMFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

procedure TOrientedWMFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TOrientedWMFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TOrientedWMFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOrientedWMFVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

function TOrientedWMFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TOrientedWMFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TOrientedWMFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TOrientedWMFVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TOrientedWMFVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality__GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality__GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TOrientedWMFVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

function TOrientedWMFVisualizationFunctionality__getWidth(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedWMFVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedWMFVisualizationFunctionality__getHeight(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedWMFVisualizationFunctionality__setHeight(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedWMFVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedWMFVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality__ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall;

procedure TOrientedWMFVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall;

function TOrientedWMFVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedWMFVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

function TOrientedWMFVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall;

procedure TOrientedWMFVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall;


{TTCELLVisualizationFunctionality}
function TTCELLVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTCELLVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCELLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCELLVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTCELLVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TCELLVisualizationFunctionality}
procedure TCELLVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TCELLVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TCELLVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TCELLVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

function TCELLVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TCELLVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TCELLVisualizationFunctionality__SetReflectorView(Functionality: TFunctionality); stdcall;

function TCELLVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TCELLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TCELLVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TCELLVisualizationFunctionality__GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;

procedure TCELLVisualizationFunctionality__Change(Functionality: TFunctionality;   const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer); stdcall;

function TCELLVisualizationFunctionality__GetFormatNodes(Functionality: TFunctionality;   out NodesList: TList; out SizeX,SizeY: integer): boolean; stdcall;

function TCELLVisualizationFunctionality__GetFormatNodes1(Functionality: TFunctionality;   out NodesList: TByteArray; out SizeX,SizeY: integer): boolean; stdcall;

procedure TCELLVisualizationFunctionality__DoQuad(Functionality: TFunctionality); stdcall;

procedure TCELLVisualizationFunctionality__GetInsideObjectsList(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TComponentsList); stdcall;

procedure TCELLVisualizationFunctionality__GetInsideObjectsList1(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray); stdcall;

function TCELLVisualizationFunctionality__getColCount(Functionality: TFunctionality): integer; stdcall;

procedure TCELLVisualizationFunctionality__setColCount(Functionality: TFunctionality;   Value: integer); stdcall;

function TCELLVisualizationFunctionality__getRowCount(Functionality: TFunctionality): integer; stdcall;

procedure TCELLVisualizationFunctionality__setRowCount(Functionality: TFunctionality;   Value: integer); stdcall;

function TCELLVisualizationFunctionality__getLineWidth(Functionality: TFunctionality): Double; stdcall;

procedure TCELLVisualizationFunctionality__setLineWidth(Functionality: TFunctionality;   Value: Double); stdcall;

function TCELLVisualizationFunctionality__getColSize(Functionality: TFunctionality): Double; stdcall;

function TCELLVisualizationFunctionality__getRowSize(Functionality: TFunctionality): Double; stdcall;

procedure TCELLVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oColCount: integer; out oRowCount: integer; out oLineWidth: Double); stdcall;


{TTEllipseVisualizationFunctionality}
function TTEllipseVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTEllipseVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTEllipseVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTEllipseVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTEllipseVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TEllipseVisualizationFunctionality}
procedure TEllipseVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TEllipseVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TEllipseVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TEllipseVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

function TEllipseVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TEllipseVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TEllipseVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TEllipseVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TEllipseVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TEllipseVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall;

procedure TEllipseVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TEllipseVisualizationFunctionality__getBorderColor(Functionality: TFunctionality): TColor; stdcall;

procedure TEllipseVisualizationFunctionality__setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TEllipseVisualizationFunctionality__getBorderWidth(Functionality: TFunctionality): Double; stdcall;

procedure TEllipseVisualizationFunctionality__setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall;


{TTWMFVisualizationFunctionality}
function TTWMFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTWMFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTWMFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTWMFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTWMFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TWMFVisualizationFunctionality}
procedure TWMFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TWMFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TWMFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TWMFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TWMFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TWMFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TWMFVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

function TWMFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TWMFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TWMFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TWMFVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TWMFVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TWMFVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TWMFVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TWMFVisualizationFunctionality__GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;

procedure TWMFVisualizationFunctionality__GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;

procedure TWMFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TWMFVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

function TWMFVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TWMFVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TWMFVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

procedure TWMFVisualizationFunctionality__SetProportion(Functionality: TFunctionality); stdcall;


{TTPictureVisualizationFunctionality}
function TTPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TPictureVisualizationFunctionality}
procedure TPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TPictureVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TPictureVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

function TPictureVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TPictureVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TPictureVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TPictureVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TPictureVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TPictureVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TPictureVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

procedure TPictureVisualizationFunctionality__GetBMP(Functionality: TFunctionality;   out BMP: TBitmap); stdcall;

procedure TPictureVisualizationFunctionality__GetBMP1(Functionality: TFunctionality;   out BMP: TByteArray); stdcall;

procedure TPictureVisualizationFunctionality__SetProportion(Functionality: TFunctionality); stdcall;

function TPictureVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TPictureVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TPictureVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

procedure TPictureVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;

procedure TPictureVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;


{TTRoundVisualizationFunctionality}
function TTRoundVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTRoundVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTRoundVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTRoundVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTRoundVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TRoundVisualizationFunctionality}
procedure TRoundVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TRoundVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TRoundVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TRoundVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

function TRoundVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TRoundVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TRoundVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TRoundVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TRoundVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TRoundVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall;

procedure TRoundVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TRoundVisualizationFunctionality__getBorderColor(Functionality: TFunctionality): TColor; stdcall;

procedure TRoundVisualizationFunctionality__setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TRoundVisualizationFunctionality__getBorderWidth(Functionality: TFunctionality): Double; stdcall;

procedure TRoundVisualizationFunctionality__setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall;


{TTGeodesyPointFunctionality}
function TTGeodesyPointFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGeodesyPointFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGeodesyPointFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGeodesyPointFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTGeodesyPointFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTGeodesyPointFunctionality__ConvertSpaceCRDToGeoCRD(Functionality: TFunctionality;   const X,Y: Double; out Latitude,Longitude: Double): boolean; stdcall;

function TTGeodesyPointFunctionality__ConvertGeoCRDToSpaceCRD(Functionality: TFunctionality;   const Latitude,Longitude: Double; out X,Y: Double): boolean; stdcall;

procedure TTGeodesyPointFunctionality__GetNearestCrdSys(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;

procedure TTGeodesyPointFunctionality__GetInstanceListByCrdSys(Functionality: TFunctionality;   const idCrdSys: integer; out List: TByteArray); stdcall;

function TTGeodesyPointFunctionality__CrdSys_GetNearestGeoPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall;

function TTGeodesyPointFunctionality__CrdSys_GetNearestXYPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall;


{TGeodesyPointFunctionality}
procedure TGeodesyPointFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TGeodesyPointFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TGeodesyPointFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TGeodesyPointFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TGeodesyPointFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TGeodesyPointFunctionality__getidCrdSys(Functionality: TFunctionality): integer; stdcall;

procedure TGeodesyPointFunctionality__setidCrdSys(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeodesyPointFunctionality__getX(Functionality: TFunctionality): Double; stdcall;

procedure TGeodesyPointFunctionality__setX(Functionality: TFunctionality;   Value: Double); stdcall;

function TGeodesyPointFunctionality__getY(Functionality: TFunctionality): Double; stdcall;

procedure TGeodesyPointFunctionality__setY(Functionality: TFunctionality;   Value: Double); stdcall;

function TGeodesyPointFunctionality__getLatitude(Functionality: TFunctionality): Double; stdcall;

procedure TGeodesyPointFunctionality__setLatitude(Functionality: TFunctionality;   Value: Double); stdcall;

function TGeodesyPointFunctionality__getLongitude(Functionality: TFunctionality): Double; stdcall;

procedure TGeodesyPointFunctionality__setLongitude(Functionality: TFunctionality;   Value: Double); stdcall;

procedure TGeodesyPointFunctionality__GetParams(Functionality: TFunctionality;   out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double); stdcall;

procedure TGeodesyPointFunctionality__SetParams(Functionality: TFunctionality;   const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double); stdcall;

procedure TGeodesyPointFunctionality__ValidateByVisualizationComponent(Functionality: TFunctionality); stdcall;


{TTPrivateAreaVisualizationFunctionality}
function TTPrivateAreaVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTPrivateAreaVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTPrivateAreaVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTPrivateAreaVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTPrivateAreaVisualizationFunctionality__CanCreateAsDetail(Functionality: TFunctionality): boolean; stdcall;

function TTPrivateAreaVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TPrivateAreaVisualizationFunctionality}
procedure TPrivateAreaVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TPrivateAreaVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TPrivateAreaVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TPrivateAreaVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TPrivateAreaVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TPrivateAreaVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TPrivateAreaVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TPrivateAreaVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TPrivateAreaVisualizationFunctionality__getAcquireObjectsInside(Functionality: TFunctionality): boolean; stdcall;

procedure TPrivateAreaVisualizationFunctionality__setAcquireObjectsInside(Functionality: TFunctionality;   Value: boolean); stdcall;


{TTHyperTextFunctionality}
function TTHyperTextFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTHyperTextFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTHyperTextFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHyperTextFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTHyperTextFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{THyperTextFunctionality}
procedure THyperTextFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall;

procedure THyperTextFunctionality__ClearDATA(Functionality: TFunctionality); stdcall;

procedure THyperTextFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function THyperTextFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure THyperTextFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure THyperTextFunctionality__SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function THyperTextFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function THyperTextFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure THyperTextFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;

procedure THyperTextFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure THyperTextFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;

procedure THyperTextFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall;


{TTComponentsFindServiceFunctionality}
function TTComponentsFindServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTComponentsFindServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTComponentsFindServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTComponentsFindServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTComponentsFindServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TComponentsFindServiceFunctionality}
procedure TComponentsFindServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TComponentsFindServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TComponentsFindServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TComponentsFindServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTUsersServiceFunctionality}
function TTUsersServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTUsersServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTUsersServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTUsersServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTUsersServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TUsersServiceFunctionality}
procedure TUsersServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TUsersServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TUsersServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TUsersServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTTransportServiceFunctionality}
function TTTransportServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTransportServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTransportServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTransportServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTTransportServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TTransportServiceFunctionality}
procedure TTransportServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTransportServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTransportServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTransportServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTMarketServiceFunctionality}
function TTMarketServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMarketServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMarketServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMarketServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTMarketServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMarketServiceFunctionality}
procedure TMarketServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMarketServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMarketServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TMarketServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTTelecomServiceFunctionality}
function TTTelecomServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTelecomServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTelecomServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTelecomServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTTelecomServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TTelecomServiceFunctionality}
procedure TTelecomServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTelecomServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTelecomServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTelecomServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTWNDVisualizationFunctionality}
function TTWNDVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTWNDVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTWNDVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTWNDVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTWNDVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TWNDVisualizationFunctionality}
procedure TWNDVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TWNDVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TWNDVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TWNDVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TWNDVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TWNDVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TWNDVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

function TWNDVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TWNDVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TWNDVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TWNDVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TWNDVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TWNDVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TWNDVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TWNDVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TWNDVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TWNDVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

function TWNDVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TWNDVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TWNDVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;


{TTMRKVisualizationFunctionality}
function TTMRKVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTMRKVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMRKVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTMRKVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMRKVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TMRKVisualizationFunctionality}
procedure TMRKVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TMRKVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TMRKVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TMRKVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TMRKVisualizationFunctionality__DoOnComponentUpdate(Functionality: TFunctionality); stdcall;

function TMRKVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TMRKVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMRKVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

function TMRKVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TMRKVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TMRKVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TMRKVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TMRKVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TMRKVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TMRKVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TMRKVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TMRKVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

function TMRKVisualizationFunctionality__getBindingPointIndex(Functionality: TFunctionality): integer; stdcall;

procedure TMRKVisualizationFunctionality__setBindingPointIndex(Functionality: TFunctionality;   Value: integer); stdcall;

function TMRKVisualizationFunctionality__getAlign(Functionality: TFunctionality): TMRKVisualizationAlign; stdcall;

function TMRKVisualizationFunctionality__getAlign1(Functionality: TFunctionality): integer; stdcall;

procedure TMRKVisualizationFunctionality__setAlign(Functionality: TFunctionality;   Value: TMRKVisualizationAlign); stdcall;

procedure TMRKVisualizationFunctionality__setAlign1(Functionality: TFunctionality;   Value: integer); stdcall;

function TMRKVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TMRKVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TMRKVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

procedure TMRKVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oAlign: integer; out oBindingPointIndex: integer); stdcall;


{TTOrientedPictureVisualizationFunctionality}
function TTOrientedPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOrientedPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOrientedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTOrientedPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOrientedPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOrientedPictureVisualizationFunctionality}
procedure TOrientedPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TOrientedPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TOrientedPictureVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

function TOrientedPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TOrientedPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOrientedPictureVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

function TOrientedPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TOrientedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TOrientedPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TOrientedPictureVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TOrientedPictureVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TOrientedPictureVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

function TOrientedPictureVisualizationFunctionality__getWidth(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedPictureVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedPictureVisualizationFunctionality__getHeight(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedPictureVisualizationFunctionality__setHeight(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedPictureVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedPictureVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality__ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall;

procedure TOrientedPictureVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall;

function TOrientedPictureVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedPictureVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

function TOrientedPictureVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall;

procedure TOrientedPictureVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall;


{TTOrientedTTFVisualizationFunctionality}
function TTOrientedTTFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOrientedTTFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOrientedTTFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTOrientedTTFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOrientedTTFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOrientedTTFVisualizationFunctionality}
procedure TOrientedTTFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedTTFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TOrientedTTFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedTTFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

function TOrientedTTFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TOrientedTTFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOrientedTTFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TOrientedTTFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TOrientedTTFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TOrientedTTFVisualizationFunctionality__getStr(Functionality: TFunctionality): string; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setStr(Functionality: TFunctionality;   const Value: string); stdcall;

function TOrientedTTFVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TOrientedTTFVisualizationFunctionality__getFont_Name(Functionality: TFunctionality): string; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setFont_Name(Functionality: TFunctionality;   Value: string); stdcall;

function TOrientedTTFVisualizationFunctionality__getFont_Width(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setFont_Width(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedTTFVisualizationFunctionality__getFont_Height(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setFont_Height(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedTTFVisualizationFunctionality__getCharInterval(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setCharInterval(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedTTFVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedTTFVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall;

function TOrientedTTFVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean; stdcall;

procedure TOrientedTTFVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer); stdcall;

procedure TOrientedTTFVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer); stdcall;


{TTIconFunctionality}
function TTIconFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTIconFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTIconFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTIconFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTIconFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TIconFunctionality}
procedure TIconFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TIconFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TIconFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TIconFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TIconFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TIconFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall;

procedure TIconFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TIconFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall;

procedure TIconFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall;

procedure TIconFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;

procedure TIconFunctionality__GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall;


{TTMessageBoardMessageFunctionality}
function TTMessageBoardMessageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMessageBoardMessageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMessageBoardMessageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMessageBoardMessageFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTMessageBoardMessageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMessageBoardMessageFunctionality}
procedure TMessageBoardMessageFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMessageBoardMessageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMessageBoardMessageFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TMessageBoardMessageFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TMessageBoardMessageFunctionality__getIdMessageBoard(Functionality: TFunctionality): integer; stdcall;

procedure TMessageBoardMessageFunctionality__setIdMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall;

function TMessageBoardMessageFunctionality__getIdSenderMessageBoard(Functionality: TFunctionality): integer; stdcall;

procedure TMessageBoardMessageFunctionality__setIdSenderMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall;

function TMessageBoardMessageFunctionality__DateCreated(Functionality: TFunctionality): TDateTime; stdcall;

function TMessageBoardMessageFunctionality__getSubject(Functionality: TFunctionality): string; stdcall;

procedure TMessageBoardMessageFunctionality__setSubject(Functionality: TFunctionality;   Value: string); stdcall;

procedure TMessageBoardMessageFunctionality__GetBody(Functionality: TFunctionality;   Value: TStringList); stdcall;

procedure TMessageBoardMessageFunctionality__GetBody1(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure TMessageBoardMessageFunctionality__SetBody(Functionality: TFunctionality;   Value: TStringList); stdcall;

procedure TMessageBoardMessageFunctionality__SetBody1(Functionality: TFunctionality;   Value: TByteArray); stdcall;

function TMessageBoardMessageFunctionality__getFlRead(Functionality: TFunctionality): boolean; stdcall;

procedure TMessageBoardMessageFunctionality__setFlRead(Functionality: TFunctionality;   Value: boolean); stdcall;

function TMessageBoardMessageFunctionality__IsEmpty(Functionality: TFunctionality): boolean; stdcall;

function TMessageBoardMessageFunctionality__IsCreatedByUser(Functionality: TFunctionality;   const pidUser: integer): boolean; stdcall;


{TTMessageBoardFunctionality}
function TTMessageBoardFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMessageBoardFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMessageBoardFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMessageBoardFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTMessageBoardFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMessageBoardFunctionality}
procedure TMessageBoardFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMessageBoardFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TMessageBoardFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMessageBoardFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TMessageBoardFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TMessageBoardFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TMessageBoardFunctionality__IsUnreadMessageExist(Functionality: TFunctionality): boolean; stdcall;

procedure TMessageBoardFunctionality__GetMessagesList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TMessageBoardFunctionality__GetMessagesList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;

function TMessageBoardFunctionality__CreateNewMessage(Functionality: TFunctionality): integer; stdcall;

procedure TMessageBoardFunctionality__SendMessage(Functionality: TFunctionality;   const idMessage: integer); stdcall;

function TMessageBoardFunctionality__getIdUser(Functionality: TFunctionality): integer; stdcall;

procedure TMessageBoardFunctionality__setIdUser(Functionality: TFunctionality;   Value: integer); stdcall;


{TTQDCVisualizationFunctionality}
function TTQDCVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTQDCVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTQDCVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTQDCVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTQDCVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TQDCVisualizationFunctionality}
procedure TQDCVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TQDCVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TQDCVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TQDCVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAPtr: pointer): boolean; stdcall;

function TQDCVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TQDCVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TQDCVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

function TQDCVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TQDCVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TQDCVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TQDCVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure TQDCVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TQDCVisualizationFunctionality__LoadFromBitmap(Functionality: TFunctionality;   Bitmap: TBitmap); stdcall;

procedure TQDCVisualizationFunctionality__LoadFromBitmap1(Functionality: TFunctionality;   Bitmap: TByteArray); stdcall;

function TQDCVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TQDCVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TQDCVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;


{TTOffersServerFunctionality}
function TTOffersServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTOffersServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTOffersServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOffersServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTOffersServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TOffersServerFunctionality}
procedure TOffersServerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOffersServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOffersServerFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TOffersServerFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TOffersServerFunctionality__getMailROBOT_Inbox(Functionality: TFunctionality): string; stdcall;

procedure TOffersServerFunctionality__setMailROBOT_Inbox(Functionality: TFunctionality;   Value: string); stdcall;

function TOffersServerFunctionality__getMailROBOT_User(Functionality: TFunctionality): string; stdcall;

procedure TOffersServerFunctionality__setMailROBOT_User(Functionality: TFunctionality;   Value: string); stdcall;

function TOffersServerFunctionality__getMailROBOT_Password(Functionality: TFunctionality): string; stdcall;

procedure TOffersServerFunctionality__setMailROBOT_Password(Functionality: TFunctionality;   Value: string); stdcall;


{TTSecurityComponentOperationFunctionality}
function TTSecurityComponentOperationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSecurityComponentOperationFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSecurityComponentOperationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSecurityComponentOperationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTSecurityComponentOperationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTSecurityComponentOperationFunctionality__GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;

procedure TTSecurityComponentOperationFunctionality__GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall;


{TSecurityComponentOperationFunctionality}
procedure TSecurityComponentOperationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSecurityComponentOperationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSecurityComponentOperationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TSecurityComponentOperationFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TSecurityComponentOperationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TSecurityComponentOperationFunctionality__getSQLInfo(Functionality: TFunctionality): string; stdcall;

procedure TSecurityComponentOperationFunctionality__setSQLInfo(Functionality: TFunctionality;   Value: string); stdcall;


{TTSecurityKeyFunctionality}
function TTSecurityKeyFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSecurityKeyFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSecurityKeyFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSecurityKeyFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTSecurityKeyFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTSecurityKeyFunctionality__GetInstanceByCode(Functionality: TFunctionality;   const Code: string;  out idInstance: integer): boolean; stdcall;

procedure TTSecurityKeyFunctionality__GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;

procedure TTSecurityKeyFunctionality__GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall;


{TSecurityKeyFunctionality}
procedure TSecurityKeyFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSecurityKeyFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSecurityKeyFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TSecurityKeyFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TSecurityKeyFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TSecurityKeyFunctionality__getInfo(Functionality: TFunctionality): string; stdcall;

procedure TSecurityKeyFunctionality__setInfo(Functionality: TFunctionality;   Value: string); stdcall;

procedure TSecurityKeyFunctionality__GetAssotiatedUsers(Functionality: TFunctionality;   out Users: TList); stdcall;

procedure TSecurityKeyFunctionality__GetAssotiatedUsers1(Functionality: TFunctionality;   out Users: TByteArray); stdcall;

procedure TSecurityKeyFunctionality__GenerateCode(Functionality: TFunctionality); stdcall;

function TSecurityKeyFunctionality__Code(Functionality: TFunctionality): string; stdcall;


{TTSecurityFileFunctionality}
function TTSecurityFileFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSecurityFileFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSecurityFileFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSecurityFileFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTSecurityFileFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTSecurityFileFunctionality__GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;

procedure TTSecurityFileFunctionality__GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString;out List: TByteArray); stdcall;


{TSecurityFileFunctionality}
procedure TSecurityFileFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSecurityFileFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSecurityFileFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TSecurityFileFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TSecurityFileFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TSecurityFileFunctionality__getInfo(Functionality: TFunctionality): string; stdcall;

procedure TSecurityFileFunctionality__setInfo(Functionality: TFunctionality;   Value: string); stdcall;

function TSecurityFileFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream): boolean; stdcall;

function TSecurityFileFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TByteArray): boolean; stdcall;

procedure TSecurityFileFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;

procedure TSecurityFileFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall;

function TSecurityFileFunctionality__AddOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall;

function TSecurityFileFunctionality__RemoveOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall;

procedure TSecurityFileFunctionality__GetAssotiatedSecurityComponents(Functionality: TFunctionality;   out SecurityComponents: TList); stdcall;

procedure TSecurityFileFunctionality__GetAssotiatedSecurityComponents1(Functionality: TFunctionality;   out SecurityComponents: TByteArray); stdcall;


{TTSecurityComponentFunctionality}
function TTSecurityComponentFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSecurityComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSecurityComponentFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSecurityComponentFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTSecurityComponentFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTSecurityComponentFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;


{TSecurityComponentFunctionality}
procedure TSecurityComponentFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSecurityComponentFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TSecurityComponentFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSecurityComponentFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TSecurityComponentFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TSecurityComponentFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TSecurityComponentFunctionality__getIdSecurityFile(Functionality: TFunctionality): integer; stdcall;

procedure TSecurityComponentFunctionality__setIdSecurityFile(Functionality: TFunctionality;   Value: integer); stdcall;


{TTMODELUserFunctionality}
function TTMODELUserFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMODELUserFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMODELUserFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMODELUserFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTMODELUserFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMODELUserFunctionality__IsUserExist(Functionality: TFunctionality;   const UserName: string; out idUser: integer): boolean; stdcall;

procedure TTMODELUserFunctionality__GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;

procedure TTMODELUserFunctionality__GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall;

procedure TTMODELUserFunctionality__GetOnlineUsersForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall;

procedure TTMODELUserFunctionality__GetOnlineUsersForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall;

procedure TTMODELUserFunctionality__GetOnlineExpertsForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall;

procedure TTMODELUserFunctionality__GetOnlineExpertsForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall;


{TMODELUserFunctionality}
procedure TMODELUserFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMODELUserFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMODELUserFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TMODELUserFunctionality__GetActiveStateInfo(Functionality: TFunctionality;   out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean; stdcall;

function TMODELUserFunctionality__IsUserOnLine(Functionality: TFunctionality;   const MaxDelay: Double): boolean; stdcall;

procedure TMODELUserFunctionality__Logout(Functionality: TFunctionality); stdcall;

procedure TMODELUserFunctionality__GetSecurityKeysList(Functionality: TFunctionality;   out SecurityKeys: TList); stdcall;

procedure TMODELUserFunctionality__GetSecurityKeysList1(Functionality: TFunctionality;   out SecurityKeys: TByteArray); stdcall;

function TMODELUserFunctionality__SecurityKeys_IsKeyExist(Functionality: TFunctionality;   const idSecurityKey: integer): boolean; stdcall;

procedure TMODELUserFunctionality__SecurityKeys_Insert(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall;

procedure TMODELUserFunctionality__SecurityKeys_Delete(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall;

procedure TMODELUserFunctionality__SecurityKeys_AddKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall;

procedure TMODELUserFunctionality__SecurityKeys_RemoveKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall;

function TMODELUserFunctionality__SecurityKeys_CreateAndAddNewKey(Functionality: TFunctionality;   const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer; stdcall;

procedure TMODELUserFunctionality__GetMessageBoards(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TMODELUserFunctionality__GetMessageBoards1(Functionality: TFunctionality;   out List: TByteArray); stdcall;

function TMODELUserFunctionality__HaveUnreadMessages(Functionality: TFunctionality): boolean; stdcall;

procedure TMODELUserFunctionality__GetMessages(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TList); stdcall;

procedure TMODELUserFunctionality__GetMessages1(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TByteArray); stdcall;

procedure TMODELUserFunctionality__IncomingMessages_SendNew(Functionality: TFunctionality;   const Message: TMemoryStream; const SenderID: integer); stdcall;

procedure TMODELUserFunctionality__IncomingMessages_SendNew1(Functionality: TFunctionality;   const Message: TByteArray; const SenderID: integer); stdcall;

function TMODELUserFunctionality__IncomingMessages_GetUnread(Functionality: TFunctionality;   out MessageList: TList): boolean; stdcall;

function TMODELUserFunctionality__IncomingMessages_GetUnread1(Functionality: TFunctionality;   out MessageList: TByteArray): boolean; stdcall;

procedure TMODELUserFunctionality__IncomingMessages_GetMessagesSince(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TList); stdcall;

procedure TMODELUserFunctionality__IncomingMessages_GetMessagesSince1(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TByteArray); stdcall;

procedure TMODELUserFunctionality__IncomingMessages_GetMessage(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: TDateTime; out Message: TClientBlobStream; out SenderID: integer); stdcall;

procedure TMODELUserFunctionality__IncomingMessages_GetMessage1(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer); stdcall;

procedure TMODELUserFunctionality__IncomingMessages_DeleteTo(Functionality: TFunctionality;   const TimeStamp: TDateTime); stdcall;

function TMODELUserFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TMODELUserFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELUserFunctionality__getFullName(Functionality: TFunctionality): string; stdcall;

procedure TMODELUserFunctionality__setFullName(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELUserFunctionality__getContactInfo(Functionality: TFunctionality): string; stdcall;

procedure TMODELUserFunctionality__setContactInfo(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELUserFunctionality__getPassword(Functionality: TFunctionality): string; stdcall;

procedure TMODELUserFunctionality__setPassword(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELUserFunctionality__getIdSecurityFileForClone(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality__setIdSecurityFileForClone(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality__getidSecurityFileForPrivate(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality__setidSecurityFileForPrivate(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality__getDATASize(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality__setDATASize(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality__getMaxDATASize(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality__setMaxDATASize(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality__getSpaceSquare(Functionality: TFunctionality): Double; stdcall;

procedure TMODELUserFunctionality__setSpaceSquare(Functionality: TFunctionality;   Value: Double); stdcall;

function TMODELUserFunctionality__getMaxSpaceSquare(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality__setMaxSpaceSquare(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality__getMaxSpaceSquarePerObject(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality__setMaxSpaceSquarePerObject(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality__getDisabled(Functionality: TFunctionality): boolean; stdcall;

procedure TMODELUserFunctionality__setDisabled(Functionality: TFunctionality;   Value: boolean); stdcall;

procedure TMODELUserFunctionality__GetStartObj(Functionality: TFunctionality;   out idTStartObj,idStartObj: integer); stdcall;

procedure TMODELUserFunctionality__SetStartObj(Functionality: TFunctionality;   const idTStartObj,idStartObj: integer); stdcall;

function TMODELUserFunctionality__getDomains(Functionality: TFunctionality): string; stdcall;

procedure TMODELUserFunctionality__setDomains(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELUserFunctionality__getTaskEnabled(Functionality: TFunctionality): boolean; stdcall;

procedure TMODELUserFunctionality__setTaskEnabled(Functionality: TFunctionality;   Value: boolean); stdcall;

procedure TMODELUserFunctionality__CheckDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall;

procedure TMODELUserFunctionality__AddDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall;

procedure TMODELUserFunctionality__SubDATASize(Functionality: TFunctionality;   const pSubDATASize: integer); stdcall;

procedure TMODELUserFunctionality__CheckSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall;

procedure TMODELUserFunctionality__AddSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall;

procedure TMODELUserFunctionality__SubSpaceSquare(Functionality: TFunctionality;   const pSubSpaceSquare: Double); stdcall;

procedure TMODELUserFunctionality__CheckMaxSpaceSquarePerObject(Functionality: TFunctionality;   const pObjectSpaceSquare: Double); stdcall;

procedure TMODELUserFunctionality__ServerFolder_GetSubFoldersList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall;

procedure TMODELUserFunctionality__ServerFolder_GetFilesList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall;

function TMODELUserFunctionality__ServerFolder_AddFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean; stdcall;

function TMODELUserFunctionality__ServerFolder_RemoveFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString): boolean; stdcall;

function TMODELUserFunctionality__ServerFolder_ReadFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean; stdcall;

function TMODELUserFunctionality__ServerFolder_AddSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall;

function TMODELUserFunctionality__ServerFolder_AddSubFolder1(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean; stdcall;

function TMODELUserFunctionality__ServerFolder_RemoveSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall;

function TMODELUserFunctionality__ServerFolder_ReadSubFolder(Functionality: TFunctionality;   const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean; stdcall;

function TMODELUserFunctionality__ServerFolder_ExchangeSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean; stdcall;

function TMODELUserFunctionality__Tasks_AddNew(Functionality: TFunctionality;   const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer; stdcall;

procedure TMODELUserFunctionality__Tasks_RemoveItem(Functionality: TFunctionality;   const idTask: integer); stdcall;

procedure TMODELUserFunctionality__Tasks_Clear(Functionality: TFunctionality); stdcall;

procedure TMODELUserFunctionality__Tasks_GetData(Functionality: TFunctionality;   const Version: integer; const flOnlyActive: boolean; out oData: TByteArray); stdcall;

procedure TMODELUserFunctionality__Tasks_Item_GetTaskData(Functionality: TFunctionality;   const idTask: integer; out oTaskData: TByteArray); stdcall;

procedure TMODELUserFunctionality__Tasks_Item_SetPriority(Functionality: TFunctionality;   const idTask: integer; const pPriority: integer); stdcall;

procedure TMODELUserFunctionality__Tasks_Item_GetStatus(Functionality: TFunctionality;   const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string); stdcall;

procedure TMODELUserFunctionality__Tasks_Item_SetStatus(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusComment: string); stdcall;

procedure TMODELUserFunctionality__Tasks_Item_SetStatus1(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string); stdcall;

procedure TMODELUserFunctionality__Tasks_Item_GetResultData(Functionality: TFunctionality;   const idTask: integer; out oResultData: TByteArray); stdcall;

procedure TMODELUserFunctionality__Tasks_Item_SetResult(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultComment: string); stdcall;

procedure TMODELUserFunctionality__Tasks_Item_SetResult1(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string); stdcall;

procedure TMODELUserFunctionality__Tasks_Item_SetResult2(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall;

procedure TMODELUserFunctionality__Tasks_Item_SetResult3(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall;

procedure TMODELUserFunctionality__ClientProgram_GetReleases(Functionality: TFunctionality;   const ProgramID: integer; const Localization: WideString; out Data: TByteArray); stdcall;


{TTTextureFunctionality}
function TTTextureFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTextureFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTextureFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTextureFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTTextureFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTTextureFunctionality__GetInstanceListMatchingBy(Functionality: TFunctionality;   const NameContext: string; out List: TList); stdcall;

procedure TTTextureFunctionality__GetInstanceListMatchingBy1(Functionality: TFunctionality;   const NameContext: string; out List: TByteArray); stdcall;


{TTextureFunctionality}
procedure TTextureFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TTextureFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TTextureFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTextureFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTextureFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TTextureFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType); stdcall;

procedure TTextureFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TTextureFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TTextureDATAType); stdcall;

procedure TTextureFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall;

procedure TTextureFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;

procedure TTextureFunctionality__GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall;

procedure TTextureFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;


{TTBuffered3DVisualizationFunctionality}
function TTBuffered3DVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTBuffered3DVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTBuffered3DVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTBuffered3DVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTBuffered3DVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TBuffered3DVisualizationFunctionality}
procedure TBuffered3DVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TBuffered3DVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TBuffered3DVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TBuffered3DVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TBuffered3DVisualizationFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall;

procedure TBuffered3DVisualizationFunctionality__GetData(Functionality: TFunctionality;   out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Double; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Double); stdcall;

function TBuffered3DVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

procedure TBuffered3DVisualizationFunctionality__ReflectInScene(Functionality: TFunctionality;   Scene: TScene); stdcall;

function TBuffered3DVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TBuffered3DVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall;

function TBuffered3DVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TBuffered3DVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TBuffered3DVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TBuffered3DVisualizationFunctionality__LoadFromStream(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TBuffered3DVisualizationFunctionality__LoadFromStream1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

procedure TBuffered3DVisualizationFunctionality__Get__Translate_XY(Functionality: TFunctionality;   out vTranslate_X,vTranslate_Y: Double); stdcall;

procedure TBuffered3DVisualizationFunctionality__SetPropertiesLocal(Functionality: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall;

function TBuffered3DVisualizationFunctionality__GetMinMax(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix; out Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Double): boolean; stdcall;

procedure TBuffered3DVisualizationFunctionality__UpdateXOYProjection(Functionality: TFunctionality); stdcall;

function TBuffered3DVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TBuffered3DVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TBuffered3DVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

function TBuffered3DVisualizationFunctionality__GetMeshesNodesApproximator(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix): TNodesApproximator; stdcall;

procedure TBuffered3DVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double); stdcall;


{TTDATAFileFunctionality}
function TTDATAFileFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDATAFileFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDATAFileFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDATAFileFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTDATAFileFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDATAFileFunctionality}
procedure TDATAFileFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TDATAFileFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TDATAFileFunctionality__SaveToFile(Functionality: TFunctionality;   var FileName: string); stdcall;

procedure TDATAFileFunctionality__Activate(Functionality: TFunctionality); stdcall;

function TDATAFileFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TDATAFileFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDATAFileFunctionality___GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;

procedure TDATAFileFunctionality__Check(Functionality: TFunctionality); stdcall;

function TDATAFileFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TDATAFileFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TDATAFileFunctionality__IsNull(Functionality: TFunctionality): boolean; stdcall;

procedure TDATAFileFunctionality__Empty(Functionality: TFunctionality); stdcall;

procedure TDATAFileFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;

procedure TDATAFileFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure TDATAFileFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;

procedure TDATAFileFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall;

function TDATAFileFunctionality__getDATAType(Functionality: TFunctionality): string; stdcall;

procedure TDATAFileFunctionality__setDATAType(Functionality: TFunctionality;   Value: string); stdcall;


{TTCoComponentFunctionality}
function TTCoComponentFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCoComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCoComponentFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoComponentFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCoComponentFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTCoComponentFunctionality__GetInstanceListByCoType(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TList); stdcall;

procedure TTCoComponentFunctionality__GetInstanceListByCoType1(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TByteArray); stdcall;


{TCoComponentFunctionality}
procedure TCoComponentFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCoComponentFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TCoComponentFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCoComponentFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TCoComponentFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TCoComponentFunctionality__idCoType(Functionality: TFunctionality): integer; stdcall;

function TCoComponentFunctionality__GetIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;

function TCoComponentFunctionality__GetIconImage1(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall;

function TCoComponentFunctionality__GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall;


{TTCoComponentTypeMarkerFunctionality}
function TTCoComponentTypeMarkerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCoComponentTypeMarkerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCoComponentTypeMarkerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoComponentTypeMarkerFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCoComponentTypeMarkerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCoComponentTypeMarkerFunctionality}
procedure TCoComponentTypeMarkerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCoComponentTypeMarkerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCoComponentTypeMarkerFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TCoComponentTypeMarkerFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TCoComponentTypeMarkerFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TCoComponentTypeMarkerFunctionality__GetTypeIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;

function TCoComponentTypeMarkerFunctionality__GetTypeIconImage1(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall;

procedure TCoComponentTypeMarkerFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TCoComponentTypeMarkerFunctionality__getIDCoComponentType(Functionality: TFunctionality): integer; stdcall;


{TTCoComponentTypeFunctionality}
function TTCoComponentTypeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCoComponentTypeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCoComponentTypeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoComponentTypeFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCoComponentTypeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTCoComponentTypeFunctionality__GetInstanceListByFileType(Functionality: TFunctionality;   const FileType: shortstring; out List: TList); stdcall;

procedure TTCoComponentTypeFunctionality__GetInstanceListByFileType1(Functionality: TFunctionality;   const FileType: WideString; out List: TByteArray); stdcall;


{TCoComponentTypeFunctionality}
procedure TCoComponentTypeFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCoComponentTypeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCoComponentTypeFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TCoComponentTypeFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TCoComponentTypeFunctionality__GetDescription(Functionality: TFunctionality;   Value: TStringList); stdcall;

procedure TCoComponentTypeFunctionality__GetDescription1(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure TCoComponentTypeFunctionality__SetDescription(Functionality: TFunctionality;   Value: TStringList); stdcall;

procedure TCoComponentTypeFunctionality__SetDescription1(Functionality: TFunctionality;   Value: TByteArray); stdcall;

procedure TCoComponentTypeFunctionality__GetMarkersList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TCoComponentTypeFunctionality__GetMarkersList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;

function TCoComponentTypeFunctionality__GetIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;

function TCoComponentTypeFunctionality__GetIconImage1(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall;

procedure TCoComponentTypeFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TCoComponentTypeFunctionality__getUID(Functionality: TFunctionality): integer; stdcall;

function TCoComponentTypeFunctionality__getDateCreated(Functionality: TFunctionality): TDateTime; stdcall;

function TCoComponentTypeFunctionality__getFileType(Functionality: TFunctionality): shortstring; stdcall;

procedure TCoComponentTypeFunctionality__setFileType(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TCoComponentTypeFunctionality__getCoComponentPrototypeID(Functionality: TFunctionality): integer; stdcall;

procedure TCoComponentTypeFunctionality__setCoComponentPrototypeID(Functionality: TFunctionality;   Value: integer); stdcall;


{TTAddressFunctionality}
function TTAddressFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTAddressFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTAddressFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTAddressFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTAddressFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTAddressFunctionality__Points_GetTypeNames(Functionality: TFunctionality;   out List: TStringList); stdcall;

procedure TTAddressFunctionality__Points_GetTypeNames1(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTAddressFunctionality__Streets_GetTypeNames(Functionality: TFunctionality;   out List: TStringList); stdcall;

procedure TTAddressFunctionality__Streets_GetTypeNames1(Functionality: TFunctionality;   out List: TByteArray); stdcall;


{TAddressFunctionality}
procedure TAddressFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TAddressFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TAddressFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TAddressFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TAddressFunctionality__getIdPoint(Functionality: TFunctionality): integer; stdcall;

procedure TAddressFunctionality__setIdPoint(Functionality: TFunctionality;   Value: integer); stdcall;

function TAddressFunctionality__getPoint(Functionality: TFunctionality): string; stdcall;

function TAddressFunctionality__getIdStreet(Functionality: TFunctionality): integer; stdcall;

procedure TAddressFunctionality__setIdStreet(Functionality: TFunctionality;   Value: integer); stdcall;

function TAddressFunctionality__getStreet(Functionality: TFunctionality): string; stdcall;

function TAddressFunctionality__getHouse(Functionality: TFunctionality): string; stdcall;

procedure TAddressFunctionality__setHouse(Functionality: TFunctionality;   Value: string); stdcall;

function TAddressFunctionality__getCorps(Functionality: TFunctionality): integer; stdcall;

procedure TAddressFunctionality__setCorps(Functionality: TFunctionality;   Value: integer); stdcall;

function TAddressFunctionality__getApartment(Functionality: TFunctionality): string; stdcall;

procedure TAddressFunctionality__setApartment(Functionality: TFunctionality;   Value: string); stdcall;

function TAddressFunctionality__getEntrance(Functionality: TFunctionality): integer; stdcall;

procedure TAddressFunctionality__setEntrance(Functionality: TFunctionality;   Value: integer); stdcall;


{TTTransportRouteFunctionality}
function TTTransportRouteFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTransportRouteFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTransportRouteFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTransportRouteFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTTransportRouteFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTTransportRouteFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TTTransportRouteFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;


{TTransportRouteFunctionality}
procedure TTransportRouteFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTransportRouteFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTransportRouteFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TTransportRouteFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TTransportRouteFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TTransportRouteFunctionality__getidTTransport(Functionality: TFunctionality): integer; stdcall;

procedure TTransportRouteFunctionality__setidTTransport(Functionality: TFunctionality;   Value: integer); stdcall;

function TTransportRouteFunctionality__getValid(Functionality: TFunctionality): boolean; stdcall;

procedure TTransportRouteFunctionality__setValid(Functionality: TFunctionality;   Value: boolean); stdcall;

function TTransportRouteFunctionality__getRemarks(Functionality: TFunctionality): string; stdcall;

procedure TTransportRouteFunctionality__setRemarks(Functionality: TFunctionality;   Value: string); stdcall;

function TTransportRouteFunctionality__IsNodesExist(Functionality: TFunctionality): boolean; stdcall;

procedure TTransportRouteFunctionality__Nodes_GetList(Functionality: TFunctionality;   out List: TRouteNodesList); stdcall;

procedure TTransportRouteFunctionality__Nodes_GetList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;

function TTransportRouteFunctionality__Nodes_IsNodeExist(Functionality: TFunctionality;   const idNode: integer): boolean; stdcall;

procedure TTransportRouteFunctionality__Nodes_ChangeNodeOrder(Functionality: TFunctionality;   const idItem: integer; const Order: integer); stdcall;

function TTransportRouteFunctionality__Nodes__Node_DistanceBefore(Functionality: TFunctionality;   const idItem: integer): integer; stdcall;

procedure TTransportRouteFunctionality__Nodes__Node_SetDistanceBefore(Functionality: TFunctionality;   const idItem: integer; const D: integer); stdcall;

function TTransportRouteFunctionality__Nodes__Node_OrderPrice(Functionality: TFunctionality;   const idItem: integer): string; stdcall;

procedure TTransportRouteFunctionality__Nodes__Node_SetOrderPrice(Functionality: TFunctionality;   const idItem: integer; const Price: string); stdcall;

function TTransportRouteFunctionality__Nodes_Insert(Functionality: TFunctionality;   const idNode: integer): integer; stdcall;

procedure TTransportRouteFunctionality__Nodes_Remove(Functionality: TFunctionality;   const idItem: integer); stdcall;


{TTTransportNodeFunctionality}
function TTTransportNodeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTransportNodeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTransportNodeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTransportNodeFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTTransportNodeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTTransportNodeFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TTTransportNodeFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;


{TTransportNodeFunctionality}
procedure TTransportNodeFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTransportNodeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTransportNodeFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TTransportNodeFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TTransportNodeFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TTransportNodeFunctionality__IsRoutesExist(Functionality: TFunctionality): boolean; stdcall;


{TTOfferGoodsFunctionality}
function TTOfferGoodsFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTOfferGoodsFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTOfferGoodsFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOfferGoodsFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTOfferGoodsFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TOfferGoodsFunctionality}
procedure TOfferGoodsFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOfferGoodsFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOfferGoodsFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TOfferGoodsFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TOfferGoodsFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TOfferGoodsFunctionality__idOffer(Functionality: TFunctionality): integer; stdcall;

function TOfferGoodsFunctionality__getIdGoods(Functionality: TFunctionality): integer; stdcall;

procedure TOfferGoodsFunctionality__setIdGoods(Functionality: TFunctionality;   Value: integer); stdcall;

function TOfferGoodsFunctionality__getAmount(Functionality: TFunctionality): Double; stdcall;

procedure TOfferGoodsFunctionality__setAmount(Functionality: TFunctionality;   Value: Double); stdcall;

function TOfferGoodsFunctionality__getIdMeasureUnit(Functionality: TFunctionality): integer; stdcall;

procedure TOfferGoodsFunctionality__setIdMeasureUnit(Functionality: TFunctionality;   Value: integer); stdcall;

function TOfferGoodsFunctionality__getMeasureUnit(Functionality: TFunctionality): string; stdcall;

function TOfferGoodsFunctionality__getMinPrice(Functionality: TFunctionality): Currency; stdcall;

procedure TOfferGoodsFunctionality__setMinPrice(Functionality: TFunctionality;   Value: Currency); stdcall;

function TOfferGoodsFunctionality__getMisc(Functionality: TFunctionality): string; stdcall;

procedure TOfferGoodsFunctionality__setMisc(Functionality: TFunctionality;   Value: string); stdcall;


{TTTLFStationTMTFunctionality}
function TTTLFStationTMTFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTLFStationTMTFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTLFStationTMTFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTLFStationTMTFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTTLFStationTMTFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTTLFStationTMTFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TTTLFStationTMTFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;


{TTLFStationTMTFunctionality}
procedure TTLFStationTMTFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTLFStationTMTFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTLFStationTMTFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTLFStationTMTFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TTLFStationTMTFunctionality__getHostName(Functionality: TFunctionality): string; stdcall;

procedure TTLFStationTMTFunctionality__setHostName(Functionality: TFunctionality;   Value: string); stdcall;

function TTLFStationTMTFunctionality__getTestChanel(Functionality: TFunctionality): string; stdcall;

procedure TTLFStationTMTFunctionality__setTestChanel(Functionality: TFunctionality;   Value: string); stdcall;


{TTNameFunctionality}
function TTNameFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTNameFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTNameFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTNameFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTNameFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TNameFunctionality}
procedure TNameFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TNameFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TNameFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TNameFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TNameFunctionality__Value(Functionality: TFunctionality): string; stdcall;

procedure TNameFunctionality__SetValue(Functionality: TFunctionality;   const NewValue: string); stdcall;


{TTVisualizationFunctionality}
function TTVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TVisualizationFunctionality}
procedure TVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTHREFVisualizationFunctionality}
function TTHREFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHREFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTHREFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{THREFVisualizationFunctionality}
function THREFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function THREFVisualizationFunctionality__DoOnOver(Functionality: TFunctionality): boolean; stdcall;

function THREFVisualizationFunctionality__DoOnClick(Functionality: TFunctionality): boolean; stdcall;

function THREFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;


{TTTTFVisualizationFunctionality}
function TTTTFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTTTFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTTFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTTTFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTTTFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TTTFVisualizationFunctionality}
procedure TTTFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TTTFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TTTFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TTTFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

function TTTFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TTTFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTTFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TTTFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTTFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TTTFVisualizationFunctionality__getStr(Functionality: TFunctionality): string; stdcall;

procedure TTTFVisualizationFunctionality__setStr(Functionality: TFunctionality;   const Value: string); stdcall;

procedure TTTFVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString); stdcall;

procedure TTTFVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString); stdcall;


{TTObjectFunctionality}
function TTObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TObjectFunctionality}
procedure TObjectFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TObjectFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTLabelFunctionality}
function TTLabelFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTLabelFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTLabelFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTLabelFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTLabelFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TLabelFunctionality}
procedure TLabelFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TLabelFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TLabelFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TLabelFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTStationFunctionality}
function TTStationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTStationFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTStationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTStationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTStationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

procedure TTStationFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TTStationFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;


{TStationFunctionality}
procedure TStationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TStationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TStationFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TStationFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TStationFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TStationFunctionality__GetNumbersBound(Functionality: TFunctionality;   out BegNumber,EndNumber: integer); stdcall;


{TTMainLineFunctionality}
function TTMainLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMainLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMainLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMainLineFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTMainLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMainLineFunctionality}
procedure TMainLineFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMainLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMainLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TMainLineFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TMainLineFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TMainLineFunctionality__GetSTNOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;


{TTDescriptionFunctionality}
function TTDescriptionFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDescriptionFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDescriptionFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDescriptionFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTDescriptionFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDescriptionFunctionality}
procedure TDescriptionFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall;

procedure TDescriptionFunctionality__ClearDATA(Functionality: TFunctionality); stdcall;

procedure TDescriptionFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TDescriptionFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDescriptionFunctionality___GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;

function TDescriptionFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TDescriptionFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

procedure TDescriptionFunctionality__GetValue(Functionality: TFunctionality;   vText: TStringList); stdcall;

procedure TDescriptionFunctionality__GetValue1(Functionality: TFunctionality;   out vText: TByteArray); stdcall;

procedure TDescriptionFunctionality__SetValue(Functionality: TFunctionality;   NewValue: TStringList); stdcall;

procedure TDescriptionFunctionality__SetValue1(Functionality: TFunctionality;   NewValue: TByteArray); stdcall;


{TTImageFunctionality}
function TTImageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTImageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTImageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTImageFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTImageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TImageFunctionality}
procedure TImageFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall;

procedure TImageFunctionality__ClearDATA(Functionality: TFunctionality); stdcall;

procedure TImageFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TImageFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TImageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TImageFunctionality___GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;

function TImageFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TImageFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TImageFunctionality__GetDATAType(Functionality: TFunctionality): TImageDATAType; stdcall;

function TImageFunctionality__GetDATAType1(Functionality: TFunctionality): integer; stdcall;

procedure TImageFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall;

procedure TImageFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TImageFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall;

procedure TImageFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall;

procedure TImageFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;

procedure TImageFunctionality__GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall;


{TTWellFunctionality}
function TTWellFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTWellFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTWellFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTWellFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTWellFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TWellFunctionality}
procedure TWellFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TWellFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TWellFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TWellFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTBoxFunctionality}
function TTBoxFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTBoxFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTBoxFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTBoxFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTBoxFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TBoxFunctionality}
procedure TBoxFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TBoxFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TBoxFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TBoxFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TBoxFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTCableBoxFunctionality}
function TTCableBoxFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCableBoxFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCableBoxFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCableBoxFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCableBoxFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCableBoxFunctionality}
procedure TCableBoxFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCableBoxFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCableBoxFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TCableBoxFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTDistrLineFunctionality}
function TTDistrLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDistrLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDistrLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDistrLineFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTDistrLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDistrLineFunctionality}
procedure TDistrLineFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TDistrLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDistrLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TDistrLineFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TDistrLineFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTClientFunctionality}
function TTClientFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTClientFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTClientFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTClientFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTClientFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

procedure TTClientFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TTClientFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;


{TClientFunctionality}
procedure TClientFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TClientFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TClientFunctionality__GetDebet(Functionality: TFunctionality;   out Value: Double): boolean; stdcall;

function TClientFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TClientFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTHouseFunctionality}
function TTHouseFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTHouseFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTHouseFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHouseFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTHouseFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{THouseFunctionality}
procedure THouseFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function THouseFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function THouseFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function THouseFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function THouseFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTCommNodeFunctionality}
function TTCommNodeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCommNodeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCommNodeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCommNodeFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCommNodeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCommNodeFunctionality}
procedure TCommNodeFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCommNodeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCommNodeFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TCommNodeFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTCrossFunctionality}
function TTCrossFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCrossFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCrossFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCrossFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCrossFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCrossFunctionality}
procedure TCrossFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCrossFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCrossFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TCrossFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTCaseFunctionality}
function TTCaseFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCaseFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCaseFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCaseFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCaseFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCaseFunctionality}
procedure TCaseFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCaseFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCaseFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TCaseFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTStreetFunctionality}
function TTStreetFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTStreetFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTStreetFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTStreetFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTStreetFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TStreetFunctionality}
procedure TStreetFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TStreetFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TStreetFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TStreetFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTOtherObjFunctionality}
function TTOtherObjFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTOtherObjFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTOtherObjFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOtherObjFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTOtherObjFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TOtherObjFunctionality}
procedure TOtherObjFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOtherObjFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOtherObjFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TOtherObjFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTSpanFunctionality}
function TTSpanFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSpanFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSpanFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSpanFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTSpanFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TSpanFunctionality}
procedure TSpanFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSpanFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSpanFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TSpanFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTChanelFunctionality}
function TTChanelFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTChanelFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTChanelFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTChanelFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTChanelFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TChanelFunctionality}
procedure TChanelFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TChanelFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TChanelFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TChanelFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TChanelFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTHandHoldFunctionality}
function TTHandHoldFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTHandHoldFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTHandHoldFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHandHoldFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTHandHoldFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{THandHoldFunctionality}
procedure THandHoldFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function THandHoldFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function THandHoldFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function THandHoldFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTLineDistFunctionality}
function TTLineDistFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTLineDistFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTLineDistFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTLineDistFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTLineDistFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TLineDistFunctionality}
procedure TLineDistFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TLineDistFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TLineDistFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TLineDistFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTMuffFunctionality}
function TTMuffFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMuffFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMuffFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMuffFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTMuffFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMuffFunctionality}
procedure TMuffFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMuffFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMuffFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TMuffFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTOfferFunctionality}
function TTOfferFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTOfferFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTOfferFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOfferFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTOfferFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOfferFunctionality__GetOfferByHumanID(Functionality: TFunctionality;   const HumanID: integer; out idOffer: integer): boolean; stdcall;


{TOfferFunctionality}
procedure TOfferFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOfferFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOfferFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TOfferFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TOfferFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TOfferFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TOfferFunctionality__getSchedule(Functionality: TFunctionality): string; stdcall;

procedure TOfferFunctionality__setSchedule(Functionality: TFunctionality;   Value: string); stdcall;

function TOfferFunctionality__getPassword(Functionality: TFunctionality): string; stdcall;

procedure TOfferFunctionality__setPassword(Functionality: TFunctionality;   Value: string); stdcall;

function TOfferFunctionality__getContactTLF(Functionality: TFunctionality): integer; stdcall;

procedure TOfferFunctionality__setContactTLF(Functionality: TFunctionality;   Value: integer); stdcall;

function TOfferFunctionality__getLastUpdated(Functionality: TFunctionality): TDateTime; stdcall;

procedure TOfferFunctionality__setLastUpdated(Functionality: TFunctionality;   Value: TDateTime); stdcall;

procedure TOfferFunctionality__LoadDATAFromStream(Functionality: TFunctionality;   Stream: TStream); stdcall;

procedure TOfferFunctionality__LoadDATAFromStream1(Functionality: TFunctionality;   Stream: TByteArray); stdcall;

function TOfferFunctionality__UserID(Functionality: TFunctionality): integer; stdcall;

function TOfferFunctionality__UID(Functionality: TFunctionality): integer; stdcall;

function TOfferFunctionality__AddressStr(Functionality: TFunctionality): string; stdcall;

function TOfferFunctionality__Goods_Insert(Functionality: TFunctionality): integer; stdcall;

procedure TOfferFunctionality__Goods_GetList(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TOfferFunctionality__Goods_GetList1(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TOfferFunctionality__Goods_Remove(Functionality: TFunctionality;   const idOfferGoods: integer); stdcall;

procedure TOfferFunctionality__Goods_Clear(Functionality: TFunctionality); stdcall;


{TTDemandFunctionality}
function TTDemandFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDemandFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDemandFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDemandFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTDemandFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDemandFunctionality}
procedure TDemandFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TDemandFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDemandFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TDemandFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TDemandFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTCommLineFunctionality}
function TTCommLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCommLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCommLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCommLineFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCommLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCommLineFunctionality}
procedure TCommLineFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCommLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCommLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TCommLineFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TCommLineFunctionality__getHint(Functionality: TFunctionality): string; stdcall;


{TTGoodsFunctionality}
function TTGoodsFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGoodsFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGoodsFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGoodsFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTGoodsFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTGoodsFunctionality__GetInstanceListContainingContext(Functionality: TFunctionality;   const Context: string; out List: TStringList); stdcall;

procedure TTGoodsFunctionality__GetInstanceListContainingContext1(Functionality: TFunctionality;   const Context: string; out List: TByteArray); stdcall;

function TTGoodsFunctionality__IsInstanceExist(Functionality: TFunctionality;   const pName: string; out idGoods: integer): boolean; stdcall;


{TGoodsFunctionality}
procedure TGoodsFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TGoodsFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TGoodsFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TGoodsFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall;

function TGoodsFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TGoodsFunctionality__StdAmount(Functionality: TFunctionality): integer; stdcall;

function TGoodsFunctionality__StdMeasureUnit(Functionality: TFunctionality): string; stdcall;


{TTCollectionFunctionality}
function TTCollectionFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCollectionFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCollectionFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCollectionFunctionality__getName(Functionality: TFunctionality): string; stdcall;

function TTCollectionFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCollectionFunctionality}
procedure TCollectionFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCollectionFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCollectionFunctionality__getName(Functionality: TFunctionality): string; stdcall;

procedure TCollectionFunctionality__setName(Functionality: TFunctionality;   const Value: string); stdcall;

function TCollectionFunctionality__getHint(Functionality: TFunctionality): string; stdcall;

function TCollectionFunctionality__InsertItem(Functionality: TFunctionality;   const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer; stdcall;

procedure TCollectionFunctionality__RemoveItem(Functionality: TFunctionality;   const id: integer); stdcall;

procedure TCollectionFunctionality__Item_ChangeAlias(Functionality: TFunctionality;   const id: integer; const pAlias: string); stdcall;

procedure TCollectionFunctionality__Item_ChangeListOrder(Functionality: TFunctionality;   const id: integer; const Order: integer); stdcall;

procedure TCollectionFunctionality__RemoveItems(Functionality: TFunctionality); stdcall;

function TCollectionFunctionality__IsItemExist(Functionality: TFunctionality;   const idTItem,idItem: integer): boolean; stdcall;

procedure TCollectionFunctionality__GetListItems(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TCollectionFunctionality__GetListItems1(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TCollectionFunctionality__SaveListItems(Functionality: TFunctionality;   List: TList); stdcall;

procedure TCollectionFunctionality__SaveListItems1(Functionality: TFunctionality;   const List: TByteArray); stdcall;


