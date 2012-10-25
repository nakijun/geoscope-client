//. the export routines defines

{TTTileServerVisualizationFunctionality}
function TTTileServerVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTTileServerVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTileServerVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTTileServerVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTTileServerVisualizationFunctionality___CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTTileServerVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TTileServerVisualizationFunctionality}
procedure TTileServerVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TTileServerVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TTileServerVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTileServerVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TTileServerVisualizationFunctionality___ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

function TTileServerVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTileServerVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

procedure TTileServerVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall;

procedure TTileServerVisualizationFunctionality___SetProportion(Functionality: TFunctionality;   const Value: double); stdcall;

procedure TTileServerVisualizationFunctionality___Clear(Functionality: TFunctionality); stdcall;

function TTileServerVisualizationFunctionality___GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall;

procedure TTileServerVisualizationFunctionality___SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall;

function TTileServerVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

procedure TTileServerVisualizationFunctionality___GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall;

function TTileServerVisualizationFunctionality___TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall;

procedure TTileServerVisualizationFunctionality___Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall;

procedure TTileServerVisualizationFunctionality___Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall;

function TTileServerVisualizationFunctionality___UserData_GetTileProviderID(Functionality: TFunctionality;   out oTileProviderID: integer): boolean; stdcall;

procedure TTileServerVisualizationFunctionality___UserData_SetTileProviderID(Functionality: TFunctionality;   const pTileProviderID: integer); stdcall;

function TTileServerVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TTileServerVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTileServerVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TTileServerVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall;

procedure TTileServerVisualizationFunctionality___GetParams1(Functionality: TFunctionality;   out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer); stdcall;

procedure TTileServerVisualizationFunctionality___SetServerType(Functionality: TFunctionality;   const Value: integer); stdcall;

procedure TTileServerVisualizationFunctionality___SetServerURL(Functionality: TFunctionality;   const Value: string); stdcall;

procedure TTileServerVisualizationFunctionality___SetServerData(Functionality: TFunctionality;   const Data: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality___SetServerData1(Functionality: TFunctionality;   const pData: TMemoryStream); stdcall;

procedure TTileServerVisualizationFunctionality___GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality___GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall;

procedure TTileServerVisualizationFunctionality___RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;

procedure TTileServerVisualizationFunctionality___RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;

procedure TTileServerVisualizationFunctionality___AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall;

procedure TTileServerVisualizationFunctionality___GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality___Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;

procedure TTileServerVisualizationFunctionality___Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;

procedure TTileServerVisualizationFunctionality___Level_GetSegments(Functionality: TFunctionality;   const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality___Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality___Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality___Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall;

procedure TTileServerVisualizationFunctionality___GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;


{TTMeasurementObjectFunctionality}
function TTMeasurementObjectFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMeasurementObjectFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMeasurementObjectFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMeasurementObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTMeasurementObjectFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMeasurementObjectFunctionality___CreateNewInstance(Functionality: TFunctionality;   const pName: string; const pDomains: string): integer; stdcall;

function TTMeasurementObjectFunctionality___CreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall;

function TTMeasurementObjectFunctionality___CheckCreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall;

procedure TTMeasurementObjectFunctionality___GetInstanceListByNameContext(Functionality: TFunctionality;   const pName: string; out List: TByteArray); stdcall;

procedure TTMeasurementObjectFunctionality___GetInstanceDataByNameContext(Functionality: TFunctionality;   const pName: string; const Version: integer; out oData: TByteArray); stdcall;

function TTMeasurementObjectFunctionality___GetInstanceByGUID(Functionality: TFunctionality;   const pGUID: string): integer; stdcall;

function TTMeasurementObjectFunctionality___GetInstanceByGSOMeasurement(Functionality: TFunctionality;   const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer; stdcall;


{TMeasurementObjectFunctionality}
procedure TMeasurementObjectFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMeasurementObjectFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMeasurementObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TMeasurementObjectFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TMeasurementObjectFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TMeasurementObjectFunctionality___getGUID(Functionality: TFunctionality): string; stdcall;

function TMeasurementObjectFunctionality___getDomains(Functionality: TFunctionality): string; stdcall;

procedure TMeasurementObjectFunctionality___setDomains(Functionality: TFunctionality;   Value: string); stdcall;

procedure TMeasurementObjectFunctionality___GetParams(Functionality: TFunctionality;   out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string); stdcall;

procedure TMeasurementObjectFunctionality___GSOMeasurements_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TMeasurementObjectFunctionality___GSOMeasurements_GetData(Functionality: TFunctionality;   const Version: integer; out oData: TByteArray); stdcall;

procedure TMeasurementObjectFunctionality___GSOMeasurements_Item_GetParams(Functionality: TFunctionality;   const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall;

procedure TMeasurementObjectFunctionality___GSOMeasurements_Item_GetParams1(Functionality: TFunctionality;   const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall;

procedure TMeasurementObjectFunctionality___GSOMeasurements_Item_GetData(Functionality: TFunctionality;   const idMeasurement: integer; out oData: TByteArray); stdcall;

procedure TMeasurementObjectFunctionality___GSOMeasurements_Item_GetData1(Functionality: TFunctionality;   const TimeID: Double; out oData: TByteArray); stdcall;


{TTAreaNotificationServerFunctionality}
function TTAreaNotificationServerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTAreaNotificationServerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTAreaNotificationServerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTAreaNotificationServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTAreaNotificationServerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TAreaNotificationServerFunctionality}
procedure TAreaNotificationServerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TAreaNotificationServerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TAreaNotificationServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TAreaNotificationServerFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TAreaNotificationServerFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TAreaNotificationServerFunctionality___getInfo(Functionality: TFunctionality): string; stdcall;

procedure TAreaNotificationServerFunctionality___setInfo(Functionality: TFunctionality;   Value: string); stdcall;


{TTMODELServerVisualizationFunctionality}
function TTMODELServerVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTMODELServerVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMODELServerVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTMODELServerVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMODELServerVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TMODELServerVisualizationFunctionality}
procedure TMODELServerVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMODELServerVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TMODELServerVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TMODELServerVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMODELServerVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TMODELServerVisualizationFunctionality___ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

function TMODELServerVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TMODELServerVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TMODELServerVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TMODELServerVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TMODELServerVisualizationFunctionality___getServerURL(Functionality: TFunctionality): string; stdcall;

procedure TMODELServerVisualizationFunctionality___setServerURL(Functionality: TFunctionality;   Value: string); stdcall;


{TTDoubleVarFunctionality}
function TTDoubleVarFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDoubleVarFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDoubleVarFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDoubleVarFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTDoubleVarFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDoubleVarFunctionality}
procedure TDoubleVarFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TDoubleVarFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDoubleVarFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TDoubleVarFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TDoubleVarFunctionality___getValue(Functionality: TFunctionality): Double; stdcall;

procedure TDoubleVarFunctionality___setValue(Functionality: TFunctionality;   _Value: Double); stdcall;

function TDoubleVarFunctionality___getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;


{TTInt32VarFunctionality}
function TTInt32VarFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTInt32VarFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTInt32VarFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTInt32VarFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTInt32VarFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TInt32VarFunctionality}
procedure TInt32VarFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TInt32VarFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TInt32VarFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TInt32VarFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TInt32VarFunctionality___getValue(Functionality: TFunctionality): integer; stdcall;

procedure TInt32VarFunctionality___setValue(Functionality: TFunctionality;   _Value: integer); stdcall;

function TInt32VarFunctionality___getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;


{TTURLFunctionality}
function TTURLFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTURLFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTURLFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTURLFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTURLFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TURLFunctionality}
procedure TURLFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall;

procedure TURLFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TURLFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TURLFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TURLFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TURLFunctionality___getURL(Functionality: TFunctionality): string; stdcall;

procedure TURLFunctionality___setURL(Functionality: TFunctionality;   Value: string); stdcall;

function TURLFunctionality___getURLName(Functionality: TFunctionality): string; stdcall;

procedure TURLFunctionality___setURLName(Functionality: TFunctionality;   Value: string); stdcall;

function TURLFunctionality___getflPanelBrowser(Functionality: TFunctionality): boolean; stdcall;

procedure TURLFunctionality___setflPanelBrowser(Functionality: TFunctionality;   Value: boolean); stdcall;

procedure TURLFunctionality___GetParams(Functionality: TFunctionality;   out oURL: string; out oURLName: string; out oflPanelBrowser: boolean); stdcall;

procedure TURLFunctionality___SetParams(Functionality: TFunctionality;   const pURL: string; const pURLName: string; const pflPanelBrowser: boolean); stdcall;


{TTPatternVisualizationFunctionality}
function TTPatternVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTPatternVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTPatternVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTPatternVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTPatternVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TPatternVisualizationFunctionality}
procedure TPatternVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TPatternVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TPatternVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TPatternVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TPatternVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TPatternVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TPatternVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

function TPatternVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TPatternVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TPatternVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TPatternVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TPatternVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TPatternVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TPatternVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TPatternVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

procedure TPatternVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

function TPatternVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TPatternVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TPatternVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;


{TTMapFormatObjectFunctionality}
function TTMapFormatObjectFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMapFormatObjectFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMapFormatObjectFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMapFormatObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTMapFormatObjectFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTMapFormatObjectFunctionality___GetInstanceNames(Functionality: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); stdcall;

function TTMapFormatObjectFunctionality___GetDATAHash(Functionality: TFunctionality;   DATAStream: TByteArray): integer; stdcall;

function TTMapFormatObjectFunctionality___GetDATAHash1(Functionality: TFunctionality;   DATAStream: TMemoryStream): integer; stdcall;


{TMapFormatObjectFunctionality}
procedure TMapFormatObjectFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMapFormatObjectFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMapFormatObjectFunctionality___DATAPanel_Create(Functionality: TFunctionality): TForm; stdcall;

function TMapFormatObjectFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TMapFormatObjectFunctionality____GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;

function TMapFormatObjectFunctionality___GetHintInfo(Functionality: TFunctionality;   const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall;

function TMapFormatObjectFunctionality___getidMap(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatObjectFunctionality___setidMap(Functionality: TFunctionality;   Value: integer); stdcall;

function TMapFormatObjectFunctionality___getFormatID(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatObjectFunctionality___setFormatID(Functionality: TFunctionality;   Value: integer); stdcall;

function TMapFormatObjectFunctionality___getKindID(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatObjectFunctionality___setKindID(Functionality: TFunctionality;   Value: integer); stdcall;

function TMapFormatObjectFunctionality___getTypeID(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatObjectFunctionality___setTypeID(Functionality: TFunctionality;   Value: integer); stdcall;

function TMapFormatObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TMapFormatObjectFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

procedure TMapFormatObjectFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TMapFormatObjectFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TMapFormatObjectFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TMapFormatObjectFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

function TMapFormatObjectFunctionality___getDATAHash(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatObjectFunctionality___setDATAHash(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TMapFormatObjectFunctionality___GetParams(Functionality: TFunctionality;   out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string); stdcall;

procedure TMapFormatObjectFunctionality___SetParams(Functionality: TFunctionality;   const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string); stdcall;

procedure TMapFormatObjectFunctionality___SetObjectByDATA(Functionality: TFunctionality); stdcall;

procedure TMapFormatObjectFunctionality___UpdateDATAHash(Functionality: TFunctionality); stdcall;

procedure TMapFormatObjectFunctionality___Compile(Functionality: TFunctionality); stdcall;

procedure TMapFormatObjectFunctionality___Build(Functionality: TFunctionality;   const flUsePrototype: boolean); stdcall;


{TTMapFormatMapFunctionality}
function TTMapFormatMapFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMapFormatMapFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMapFormatMapFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMapFormatMapFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTMapFormatMapFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTMapFormatMapFunctionality___GetInstanceListByGeoSpace(Functionality: TFunctionality;   const idGeoSpace: integer; out List: TByteArray); stdcall;


{TMapFormatMapFunctionality}
procedure TMapFormatMapFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMapFormatMapFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMapFormatMapFunctionality___getGeoSpaceID(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatMapFunctionality___setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall;

function TMapFormatMapFunctionality___getFormatID(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatMapFunctionality___setFormatID(Functionality: TFunctionality;   Value: integer); stdcall;

function TMapFormatMapFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TMapFormatMapFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

procedure TMapFormatMapFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TMapFormatMapFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TMapFormatMapFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TMapFormatMapFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure TMapFormatMapFunctionality___GetObjectPrototypesDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TMapFormatMapFunctionality___GetObjectPrototypesDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TMapFormatMapFunctionality___SetObjectPrototypesDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TMapFormatMapFunctionality___SetObjectPrototypesDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

function TMapFormatMapFunctionality___GetObjectPrototype(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean; stdcall;

procedure TMapFormatMapFunctionality___GetParams(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oFormatID: integer; out oName: string); stdcall;

procedure TMapFormatMapFunctionality___SetParams(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pFormatID: integer; const pName: string); stdcall;

function TMapFormatMapFunctionality___ObjectsCounter(Functionality: TFunctionality): integer; stdcall;

procedure TMapFormatMapFunctionality___GetObjectsList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TMapFormatMapFunctionality___GetObjectsList1(Functionality: TFunctionality;   const KindID: integer; out List: TByteArray); stdcall;

procedure TMapFormatMapFunctionality___GetObjectsList2(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out List: TByteArray); stdcall;

procedure TMapFormatMapFunctionality___GetObjectsList3(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray); stdcall;

function TMapFormatMapFunctionality___GetObject(Functionality: TFunctionality;   const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall;

function TMapFormatMapFunctionality___GetObject1(Functionality: TFunctionality;   const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall;

procedure TMapFormatMapFunctionality___ExportMap(Functionality: TFunctionality;   const pFormatID: integer; out ZipData: TByteArray); stdcall;

procedure TMapFormatMapFunctionality___RemoveObjects(Functionality: TFunctionality); stdcall;

procedure TMapFormatMapFunctionality___RemoveObjects1(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer); stdcall;

procedure TMapFormatMapFunctionality___UpdateObjectDATAHashes(Functionality: TFunctionality); stdcall;

procedure TMapFormatMapFunctionality___RecalculateMapArea(Functionality: TFunctionality); stdcall;

procedure TMapFormatMapFunctionality___RemoveIrrelevantObjectsInMapArea(Functionality: TFunctionality); stdcall;


{TTSPLVisualizationFunctionality}
function TTSPLVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTSPLVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSPLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTSPLVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTSPLVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TSPLVisualizationFunctionality}
procedure TSPLVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TSPLVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TSPLVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSPLVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TSPLVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSPLVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TSPLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TSPLVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TSPLVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out SPLType: integer; out SPLDATA: TByteArray); stdcall;

procedure TSPLVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const SPLType: integer; const SPLDATA: TByteArray); stdcall;


{TTBoolVarFunctionality}
function TTBoolVarFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTBoolVarFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTBoolVarFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTBoolVarFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTBoolVarFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TBoolVarFunctionality}
procedure TBoolVarFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TBoolVarFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TBoolVarFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TBoolVarFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TBoolVarFunctionality___getValue(Functionality: TFunctionality): boolean; stdcall;

procedure TBoolVarFunctionality___setValue(Functionality: TFunctionality;   _Value: boolean); stdcall;

function TBoolVarFunctionality___getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;


{TTGeoSpaceFunctionality}
function TTGeoSpaceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGeoSpaceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGeoSpaceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGeoSpaceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTGeoSpaceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TGeoSpaceFunctionality}
procedure TGeoSpaceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TGeoSpaceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TGeoSpaceFunctionality___GetDatumIDLocally(Functionality: TFunctionality): integer; stdcall;

function TGeoSpaceFunctionality___ConvertGeoToXYLocally(Functionality: TFunctionality;   const Lat,Long: Extended; out Xr,Yr: Extended): boolean; stdcall;

function TGeoSpaceFunctionality___ConvertXYToGeoLocally(Functionality: TFunctionality;   const X,Y: Extended; out Lat,Long: Extended): boolean; stdcall;

function TGeoSpaceFunctionality___GetDistanceBetweenTwoXYPointsLocally(Functionality: TFunctionality;   const X0,Y0,X1,Y1: Extended; out Distance: Extended): boolean; stdcall;

function TGeoSpaceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TGeoSpaceFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TGeoSpaceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TGeoSpaceFunctionality___getDatumID(Functionality: TFunctionality): integer; stdcall;

procedure TGeoSpaceFunctionality___setDatumID(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeoSpaceFunctionality___getProjectionID(Functionality: TFunctionality): integer; stdcall;

procedure TGeoSpaceFunctionality___setProjectionID(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeoSpaceFunctionality___ConvertXYToLatLong(Functionality: TFunctionality;   const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean; stdcall;

function TGeoSpaceFunctionality___ConvertXYToDatumLatLong(Functionality: TFunctionality;   const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean; stdcall;

function TGeoSpaceFunctionality___ConvertLatLongToXY(Functionality: TFunctionality;   const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall;

function TGeoSpaceFunctionality___ConvertDatumLatLongToXY(Functionality: TFunctionality;   const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall;

procedure TGeoSpaceFunctionality___GetGeoCrdSystemList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TGeoSpaceFunctionality___GetGeoCrdSystemList1(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TGeoSpaceFunctionality___GetMapFormatMapList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TGeoSpaceFunctionality___GetMapFormatMapList1(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TGeoSpaceFunctionality___GetMapFormatMapObjectsByNameContext(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray); stdcall;

procedure TGeoSpaceFunctionality___GetMapFormatMapObjectsByNameContext1(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TList); stdcall;


{TTUserAlertFunctionality}
function TTUserAlertFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTUserAlertFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTUserAlertFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTUserAlertFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTUserAlertFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTUserAlertFunctionality___GetActiveInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTUserAlertFunctionality___GetActiveInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;


{TUserAlertFunctionality}
procedure TUserAlertFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TUserAlertFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TUserAlertFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TUserAlertFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TUserAlertFunctionality___getUserID(Functionality: TFunctionality): integer; stdcall;

procedure TUserAlertFunctionality___setUserID(Functionality: TFunctionality;   Value: integer); stdcall;

function TUserAlertFunctionality___getTimeStamp(Functionality: TFunctionality): TDateTime; stdcall;

procedure TUserAlertFunctionality___setTimeStamp(Functionality: TFunctionality;   Value: TDateTime); stdcall;

function TUserAlertFunctionality___getActive(Functionality: TFunctionality): boolean; stdcall;

procedure TUserAlertFunctionality___setActive(Functionality: TFunctionality;   Value: boolean); stdcall;

function TUserAlertFunctionality___getAlertID(Functionality: TFunctionality): integer; stdcall;

procedure TUserAlertFunctionality___setAlertID(Functionality: TFunctionality;   Value: integer); stdcall;

function TUserAlertFunctionality___getSeverity(Functionality: TFunctionality): integer; stdcall;

procedure TUserAlertFunctionality___setSeverity(Functionality: TFunctionality;   Value: integer); stdcall;

function TUserAlertFunctionality___getDescription(Functionality: TFunctionality): string; stdcall;

procedure TUserAlertFunctionality___setDescription(Functionality: TFunctionality;   Value: string); stdcall;

procedure TUserAlertFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TUserAlertFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TUserAlertFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TUserAlertFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;


{TTGeoGraphServerObjectFunctionality}
function TTGeoGraphServerObjectFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGeoGraphServerObjectFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGeoGraphServerObjectFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGeoGraphServerObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTGeoGraphServerObjectFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTGeoGraphServerObjectFunctionality___GetInstanceByServerObject(Functionality: TFunctionality;   const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean; stdcall;


{TGeoGraphServerObjectFunctionality}
procedure TGeoGraphServerObjectFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TGeoGraphServerObjectFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TGeoGraphServerObjectFunctionality___AttachObject(Functionality: TFunctionality); stdcall;

procedure TGeoGraphServerObjectFunctionality___DetachObject(Functionality: TFunctionality); stdcall;

function TGeoGraphServerObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TGeoGraphServerObjectFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TGeoGraphServerObjectFunctionality___getGeoGraphServerID(Functionality: TFunctionality): integer; stdcall;

procedure TGeoGraphServerObjectFunctionality___setGeoGraphServerID(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeoGraphServerObjectFunctionality___getObjectID(Functionality: TFunctionality): integer; stdcall;

procedure TGeoGraphServerObjectFunctionality___setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeoGraphServerObjectFunctionality___getBusinessModelID(Functionality: TFunctionality): integer; stdcall;

procedure TGeoGraphServerObjectFunctionality___setBusinessModelID(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeoGraphServerObjectFunctionality___getDomains(Functionality: TFunctionality): string; stdcall;

procedure TGeoGraphServerObjectFunctionality___setDomains(Functionality: TFunctionality;   Value: string); stdcall;

procedure TGeoGraphServerObjectFunctionality___GetParams(Functionality: TFunctionality;   out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer); stdcall;

procedure TGeoGraphServerObjectFunctionality___ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall;

function TGeoGraphServerObjectFunctionality___GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall;

function TGeoGraphServerObjectFunctionality___GetNearestMapFormatObjects(Functionality: TFunctionality;   const MaxDistance: double; out List: TByteArray): boolean; stdcall;

function TGeoGraphServerObjectFunctionality___GetNearestMapFormatObjectsNames(Functionality: TFunctionality;   const MaxDistance: double; out Names: WideString): boolean; stdcall;

function TGeoGraphServerObjectFunctionality___Measurements_AddNew(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer; stdcall;

function TGeoGraphServerObjectFunctionality___Measurements_AddNew1(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer; stdcall;

procedure TGeoGraphServerObjectFunctionality___Measurements_Remove(Functionality: TFunctionality;   const pidMeasurement: integer); stdcall;

procedure TGeoGraphServerObjectFunctionality___Measurements_Item_UpdateData(Functionality: TFunctionality;   const pTimeID: Double; const pData: TByteArray); stdcall;


{TTGeoGraphServerFunctionality}
function TTGeoGraphServerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGeoGraphServerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGeoGraphServerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGeoGraphServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTGeoGraphServerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTGeoGraphServerFunctionality___GetActiveInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTGeoGraphServerFunctionality___GetActiveInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;

function TTGeoGraphServerFunctionality___GetInstanceForRegistration(Functionality: TFunctionality): integer; stdcall;


{TGeoGraphServerFunctionality}
procedure TGeoGraphServerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TGeoGraphServerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TGeoGraphServerFunctionality___SetData(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

function TGeoGraphServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TGeoGraphServerFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TGeoGraphServerFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TGeoGraphServerFunctionality___getAddress(Functionality: TFunctionality): string; stdcall;

procedure TGeoGraphServerFunctionality___setAddress(Functionality: TFunctionality;   Value: string); stdcall;

function TGeoGraphServerFunctionality___getInternalAddress(Functionality: TFunctionality): string; stdcall;

procedure TGeoGraphServerFunctionality___setInternalAddress(Functionality: TFunctionality;   Value: string); stdcall;

function TGeoGraphServerFunctionality___getInfo(Functionality: TFunctionality): string; stdcall;

procedure TGeoGraphServerFunctionality___setInfo(Functionality: TFunctionality;   Value: string); stdcall;

procedure TGeoGraphServerFunctionality___GetData(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TGeoGraphServerFunctionality___GetData1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

function TGeoGraphServerFunctionality___RegisterObject(Functionality: TFunctionality;   const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall;

function TGeoGraphServerFunctionality___RegisterObject1(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall;

function TGeoGraphServerFunctionality___RegisterObject2(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer; stdcall;

procedure TGeoGraphServerFunctionality___UnRegisterObject(Functionality: TFunctionality;   const ObjectID: integer); stdcall;

function TGeoGraphServerFunctionality___ObjectCounter(Functionality: TFunctionality): integer; stdcall;

procedure TGeoGraphServerFunctionality___ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall;

procedure TGeoGraphServerFunctionality___Object_GetProperties(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer); stdcall;

procedure TGeoGraphServerFunctionality___Object_GetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer); stdcall;

procedure TGeoGraphServerFunctionality___Object_SetProperties(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer); stdcall;

procedure TGeoGraphServerFunctionality___Object_SetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer); stdcall;

function TGeoGraphServerFunctionality___Object_GetObjectType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall;

procedure TGeoGraphServerFunctionality___Object_SetObjectType(Functionality: TFunctionality;   const ObjectID: integer; const ObjectType: integer); stdcall;

function TGeoGraphServerFunctionality___Object_GetBusinessType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall;

procedure TGeoGraphServerFunctionality___Object_SetBusinessType(Functionality: TFunctionality;   const ObjectID: integer; const BusinessType: integer); stdcall;

function TGeoGraphServerFunctionality___Object_GetComponentID(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall;

procedure TGeoGraphServerFunctionality___Object_SetComponentID(Functionality: TFunctionality;   const ObjectID: integer; const ObjectComponentID: integer); stdcall;

procedure TGeoGraphServerFunctionality___Object_ExecuteOperation(Functionality: TFunctionality;   const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray); stdcall;

function TGeoGraphServerFunctionality___DataID(Functionality: TFunctionality): integer; stdcall;


{TTGeoCrdSystemFunctionality}
function TTGeoCrdSystemFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGeoCrdSystemFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGeoCrdSystemFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGeoCrdSystemFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTGeoCrdSystemFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTGeoCrdSystemFunctionality___GetInstanceByLatLongLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;

procedure TTGeoCrdSystemFunctionality___GetInstanceByLatLongLocally1(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall;

procedure TTGeoCrdSystemFunctionality___GetInstanceByXYLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall;

procedure TTGeoCrdSystemFunctionality___GetInstanceByXYLocally1(Functionality: TFunctionality;   const pX,pY: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall;

procedure TTGeoCrdSystemFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTGeoCrdSystemFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TTGeoCrdSystemFunctionality___GetInstanceByLatLong(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;

procedure TTGeoCrdSystemFunctionality___GetInstanceByXY(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall;


{TGeoCrdSystemFunctionality}
procedure TGeoCrdSystemFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TGeoCrdSystemFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TGeoCrdSystemFunctionality___GetDataLocally(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oName: string; out oDatum: string; out oProjection: string; out oProjectionData: TMemoryStream); stdcall;

procedure TGeoCrdSystemFunctionality___GetGeodesyPointsLocally(Functionality: TFunctionality;   out Points: TByteArray); stdcall;

function TGeoCrdSystemFunctionality___getGeoSpaceID(Functionality: TFunctionality): integer; stdcall;

procedure TGeoCrdSystemFunctionality___setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeoCrdSystemFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TGeoCrdSystemFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TGeoCrdSystemFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TGeoCrdSystemFunctionality___getDatum(Functionality: TFunctionality): string; stdcall;

procedure TGeoCrdSystemFunctionality___setDatum(Functionality: TFunctionality;   Value: string); stdcall;

function TGeoCrdSystemFunctionality___getProjection(Functionality: TFunctionality): string; stdcall;

procedure TGeoCrdSystemFunctionality___setProjection(Functionality: TFunctionality;   Value: string); stdcall;

procedure TGeoCrdSystemFunctionality___GetProjectionDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TGeoCrdSystemFunctionality___GetProjectionDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TGeoCrdSystemFunctionality___SetProjectionDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TGeoCrdSystemFunctionality___SetProjectionDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure TGeoCrdSystemFunctionality___GetGeodesyPoints(Functionality: TFunctionality;   out Points: TByteArray); stdcall;


{TTFilterVisualizationFunctionality}
function TTFilterVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTFilterVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTFilterVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTFilterVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTFilterVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TFilterVisualizationFunctionality}
procedure TFilterVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TFilterVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TFilterVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TFilterVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TFilterVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TFilterVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TFilterVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TFilterVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TFilterVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out FilterType: integer; out FilterDATA: TByteArray); stdcall;

procedure TFilterVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const FilterType: integer; const FilterDATA: TByteArray); stdcall;


{TTHINTVisualizationFunctionality}
function TTHINTVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTHINTVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHINTVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTHINTVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTHINTVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;

procedure TTHINTVisualizationFunctionality___GetInstanceParams(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall;

procedure TTHINTVisualizationFunctionality___GetInstanceParams1(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall;

procedure TTHINTVisualizationFunctionality___GetInstanceOwnerDatasAndParams(Functionality: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray); stdcall;


{THINTVisualizationFunctionality}
procedure THINTVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure THINTVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure THINTVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure THINTVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function THINTVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function THINTVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function THINTVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

function THINTVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function THINTVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function THINTVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure THINTVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure THINTVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure THINTVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure THINTVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure THINTVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

procedure THINTVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure THINTVisualizationFunctionality___GetPrivateDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure THINTVisualizationFunctionality___GetPrivateDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall;

procedure THINTVisualizationFunctionality___GetPrivateDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure THINTVisualizationFunctionality___GetPrivateDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall;

procedure THINTVisualizationFunctionality___SetPrivateDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure THINTVisualizationFunctionality___SetPrivateDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

function THINTVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure THINTVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure THINTVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;


{TTDetailedPictureVisualizationFunctionality}
function TTDetailedPictureVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTDetailedPictureVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDetailedPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTDetailedPictureVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTDetailedPictureVisualizationFunctionality___CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTDetailedPictureVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TDetailedPictureVisualizationFunctionality}
procedure TDetailedPictureVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TDetailedPictureVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TDetailedPictureVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TDetailedPictureVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TDetailedPictureVisualizationFunctionality___ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

function TDetailedPictureVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDetailedPictureVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

procedure TDetailedPictureVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall;

procedure TDetailedPictureVisualizationFunctionality___SetProportion(Functionality: TFunctionality;   const Value: double); stdcall;

procedure TDetailedPictureVisualizationFunctionality___Clear(Functionality: TFunctionality); stdcall;

function TDetailedPictureVisualizationFunctionality___GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall;

procedure TDetailedPictureVisualizationFunctionality___SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall;

function TDetailedPictureVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

procedure TDetailedPictureVisualizationFunctionality___GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall;

function TDetailedPictureVisualizationFunctionality___TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall;

procedure TDetailedPictureVisualizationFunctionality___Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall;

procedure TDetailedPictureVisualizationFunctionality___Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall;

function TDetailedPictureVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TDetailedPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TDetailedPictureVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TDetailedPictureVisualizationFunctionality___GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TDetailedPictureVisualizationFunctionality___GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall;

procedure TDetailedPictureVisualizationFunctionality___RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;

procedure TDetailedPictureVisualizationFunctionality___RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall;

procedure TDetailedPictureVisualizationFunctionality___AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall;

procedure TDetailedPictureVisualizationFunctionality___GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall;

procedure TDetailedPictureVisualizationFunctionality___Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;

procedure TDetailedPictureVisualizationFunctionality___Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;

procedure TDetailedPictureVisualizationFunctionality___Level_GetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall;

procedure TDetailedPictureVisualizationFunctionality___Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall;

procedure TDetailedPictureVisualizationFunctionality___Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall;

procedure TDetailedPictureVisualizationFunctionality___Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall;

procedure TDetailedPictureVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall;

procedure TDetailedPictureVisualizationFunctionality___GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;


{TTCoVisualizationFunctionality}
function TTCoVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTCoVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCoVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTCoVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TCoVisualizationFunctionality}
procedure TCoVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TCoVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TCoVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TCoVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TCoVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TCoVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCoVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

procedure TCoVisualizationFunctionality___UpdateContainer(Functionality: TFunctionality;   out oContainer: TExtendedContainerCoord); stdcall;

procedure TCoVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;

function TCoVisualizationFunctionality___GetOwnSpaceHINTVisualizationLocally(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall;

procedure TCoVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCoVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TCoVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TCoVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TCoVisualizationFunctionality___GetSpace(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall;

procedure TCoVisualizationFunctionality___GetSpace1(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall;

procedure TCoVisualizationFunctionality___GetSpace2(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall;

procedure TCoVisualizationFunctionality___GetSpace3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall;

procedure TCoVisualizationFunctionality___SetSpace(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TCoVisualizationFunctionality___SetSpace1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

function TCoVisualizationFunctionality___GetOwnSpaceHINTVisualization(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall;

function TCoVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TCoVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TCoVisualizationFunctionality___Pack(Functionality: TFunctionality); stdcall;

procedure TCoVisualizationFunctionality___UnPack(Functionality: TFunctionality); stdcall;

function TCoVisualizationFunctionality___IsPacked(Functionality: TFunctionality): boolean; stdcall;


{TTForumMessageFunctionality}
function TTForumMessageFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTForumMessageFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTForumMessageFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTForumMessageFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTForumMessageFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TForumMessageFunctionality}
procedure TForumMessageFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall;

procedure TForumMessageFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TForumMessageFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TForumMessageFunctionality___FunctionalityUserID(Functionality: TFunctionality): integer; stdcall;

procedure TForumMessageFunctionality___setidUser(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TForumMessageFunctionality___Modified(Functionality: TFunctionality); stdcall;

function TForumMessageFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TForumMessageFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TForumMessageFunctionality___getidForum(Functionality: TFunctionality): integer; stdcall;

procedure TForumMessageFunctionality___setidForum(Functionality: TFunctionality;   Value: integer); stdcall;

function TForumMessageFunctionality___idUser(Functionality: TFunctionality): integer; stdcall;

procedure TForumMessageFunctionality___Send(Functionality: TFunctionality); stdcall;

function TForumMessageFunctionality___SentTime(Functionality: TFunctionality): TDateTime; stdcall;

function TForumMessageFunctionality___getidForMessage(Functionality: TFunctionality): integer; stdcall;

procedure TForumMessageFunctionality___setidForMessage(Functionality: TFunctionality;   Value: integer); stdcall;

function TForumMessageFunctionality___LastModified(Functionality: TFunctionality): TDateTime; stdcall;

procedure TForumMessageFunctionality___GetMessage(Functionality: TFunctionality;   out Message: TByteArray); stdcall;

procedure TForumMessageFunctionality___GetMessage1(Functionality: TFunctionality;   out Message: TMemoryStream); stdcall;

procedure TForumMessageFunctionality___SetMessage(Functionality: TFunctionality;   const Message: TByteArray); stdcall;

procedure TForumMessageFunctionality___SetMessage1(Functionality: TFunctionality;   const Message: TMemoryStream); stdcall;

function TForumMessageFunctionality___ReplyMessageCount(Functionality: TFunctionality): integer; stdcall;

procedure TForumMessageFunctionality___GetReplyMessageList(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall;

procedure TForumMessageFunctionality___GetReplyMessageList1(Functionality: TFunctionality;   out MessageList: TList); stdcall;


{TTForumFunctionality}
function TTForumFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTForumFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTForumFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTForumFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTForumFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TForumFunctionality}
procedure TForumFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TForumFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TForumFunctionality___DeleteOldMessages(Functionality: TFunctionality;   const pMessageLifeTime: TDateTime); stdcall;

function TForumFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TForumFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TForumFunctionality___getMessageLifeTime(Functionality: TFunctionality): TDateTime; stdcall;

procedure TForumFunctionality___setMessageLifeTime(Functionality: TFunctionality;   Value: TDateTime); stdcall;

function TForumFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TForumFunctionality___RootMessageCount(Functionality: TFunctionality): integer; stdcall;

procedure TForumFunctionality___GetRootMessageList(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall;

procedure TForumFunctionality___GetRootMessageList1(Functionality: TFunctionality;   out MessageList: TList); stdcall;

function TForumFunctionality___MessageCount(Functionality: TFunctionality): integer; stdcall;

procedure TForumFunctionality___GetMessageList(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall;

procedure TForumFunctionality___GetMessageList1(Functionality: TFunctionality;   out MessageList: TList); stdcall;

function TForumFunctionality___AddMessage(Functionality: TFunctionality;   const pidUser: integer; const pidForMessage: integer): integer; stdcall;

procedure TForumFunctionality___DestroyMessage(Functionality: TFunctionality;   const pidMessage: integer); stdcall;


{TTCUSTOMVisualizationFunctionality}
function TTCUSTOMVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTCUSTOMVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCUSTOMVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCUSTOMVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTCUSTOMVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TCUSTOMVisualizationFunctionality}
procedure TCUSTOMVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCUSTOMVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TCUSTOMVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TCUSTOMVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCUSTOMVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TCUSTOMVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TCUSTOMVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TCUSTOMVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TCUSTOMVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TCUSTOMVisualizationFunctionality___getMODULEName(Functionality: TFunctionality): string; stdcall;

procedure TCUSTOMVisualizationFunctionality___setMODULEName(Functionality: TFunctionality;   Value: string); stdcall;

function TCUSTOMVisualizationFunctionality___getFunctionName(Functionality: TFunctionality): string; stdcall;

procedure TCUSTOMVisualizationFunctionality___setFunctionName(Functionality: TFunctionality;   Value: string); stdcall;

function TCUSTOMVisualizationFunctionality___getFunctionVersion(Functionality: TFunctionality): integer; stdcall;

procedure TCUSTOMVisualizationFunctionality___setFunctionVersion(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TCUSTOMVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer); stdcall;


{TTOLEVisualizationFunctionality}
function TTOLEVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOLEVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOLEVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTOLEVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOLEVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOLEVisualizationFunctionality}
procedure TOLEVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOLEVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TOLEVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOLEVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TOLEVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TOLEVisualizationFunctionality___SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TOLEVisualizationFunctionality___EditDATA(Functionality: TFunctionality); stdcall;

function TOLEVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TOLEVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

function TOLEVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TOLEVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TOLEVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TOLEVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure TOLEVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall;

procedure TOLEVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;

procedure TOLEVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall;

procedure TOLEVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall;

procedure TOLEVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;


{TTHTMLVisualizationFunctionality}
function TTHTMLVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTHTMLVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHTMLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTHTMLVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTHTMLVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{THTMLVisualizationFunctionality}
procedure THTMLVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure THTMLVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure THTMLVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure THTMLVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure THTMLVisualizationFunctionality___SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure THTMLVisualizationFunctionality___EditDATA(Functionality: TFunctionality); stdcall;

function THTMLVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function THTMLVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function THTMLVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

function THTMLVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function THTMLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function THTMLVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function THTMLVisualizationFunctionality___getWidth(Functionality: TFunctionality): integer; stdcall;

procedure THTMLVisualizationFunctionality___setWidth(Functionality: TFunctionality;   Value: integer); stdcall;

procedure THTMLVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure THTMLVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall;

procedure THTMLVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;

procedure THTMLVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall;

procedure THTMLVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall;

procedure THTMLVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;


{TTBZRVisualizationFunctionality}
function TTBZRVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTBZRVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTBZRVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTBZRVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTBZRVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TBZRVisualizationFunctionality}
procedure TBZRVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TBZRVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TBZRVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TBZRVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TBZRVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TBZRVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TBZRVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TBZRVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTAGIFVisualizationFunctionality}
function TTAGIFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTAGIFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTAGIFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTAGIFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTAGIFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TAGIFVisualizationFunctionality}
procedure TAGIFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TAGIFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TAGIFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TAGIFVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TAGIFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TAGIFVisualizationFunctionality___TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;

function TAGIFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TAGIFVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TAGIFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TAGIFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TAGIFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TAGIFVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure TAGIFVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall;

procedure TAGIFVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;

procedure TAGIFVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall;

procedure TAGIFVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall;

procedure TAGIFVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;


{TTOrientedVIDEOVisualizationFunctionality}
function TTOrientedVIDEOVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOrientedVIDEOVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOrientedVIDEOVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTOrientedVIDEOVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOrientedVIDEOVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOrientedVIDEOVisualizationFunctionality}
procedure TOrientedVIDEOVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedVIDEOVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TOrientedVIDEOVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOrientedVIDEOVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TOrientedVIDEOVisualizationFunctionality___TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;

function TOrientedVIDEOVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOrientedVIDEOVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TOrientedVIDEOVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TOrientedVIDEOVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TOrientedVIDEOVisualizationFunctionality___getDataServer(Functionality: TFunctionality): string; stdcall;

procedure TOrientedVIDEOVisualizationFunctionality___setDataServer(Functionality: TFunctionality;   Value: string); stdcall;

function TOrientedVIDEOVisualizationFunctionality___getObjectID(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedVIDEOVisualizationFunctionality___setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;


{TTVIDEOVisualizationFunctionality}
function TTVIDEOVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTVIDEOVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTVIDEOVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTVIDEOVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTVIDEOVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TVIDEOVisualizationFunctionality}
procedure TVIDEOVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TVIDEOVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TVIDEOVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TVIDEOVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TVIDEOVisualizationFunctionality___TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;

function TVIDEOVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TVIDEOVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TVIDEOVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TVIDEOVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TVIDEOVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TVIDEOVisualizationFunctionality___getDataServer(Functionality: TFunctionality): string; stdcall;

procedure TVIDEOVisualizationFunctionality___setDataServer(Functionality: TFunctionality;   Value: string); stdcall;

function TVIDEOVisualizationFunctionality___getObjectID(Functionality: TFunctionality): integer; stdcall;

procedure TVIDEOVisualizationFunctionality___setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;


{TTOPPVisualizationFunctionality}
function TTOPPVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOPPVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOPPVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTOPPVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOPPVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOPPVisualizationFunctionality}
procedure TOPPVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOPPVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TOPPVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOPPVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TOPPVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOPPVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TOPPVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TOPPVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TOPPVisualizationFunctionality___getPropsPanel_idTObj(Functionality: TFunctionality): integer; stdcall;

procedure TOPPVisualizationFunctionality___setPropsPanel_idTObj(Functionality: TFunctionality;   Value: integer); stdcall;

function TOPPVisualizationFunctionality___getPropsPanel_idObj(Functionality: TFunctionality): integer; stdcall;

procedure TOPPVisualizationFunctionality___setPropsPanel_idObj(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOPPVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer); stdcall;


{TTMODELServerFunctionality}
function TTMODELServerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMODELServerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMODELServerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMODELServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTMODELServerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMODELServerFunctionality___GetInstanceByIPAddress(Functionality: TFunctionality;   const IPAddress: string;  out id: integer): boolean; stdcall;


{TMODELServerFunctionality}
procedure TMODELServerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMODELServerFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TMODELServerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMODELServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TMODELServerFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELServerFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TMODELServerFunctionality___getIPAddress(Functionality: TFunctionality): string; stdcall;

procedure TMODELServerFunctionality___setIPAddress(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELServerFunctionality___IsUserExist(Functionality: TFunctionality;   const _UserName,_UserPassword: string): boolean; stdcall;

function TMODELServerFunctionality___GetUserID(Functionality: TFunctionality;   const _UserName,_UserPassword: string): integer; stdcall;

function TMODELServerFunctionality___IsOnLine(Functionality: TFunctionality): boolean; stdcall;

function TMODELServerFunctionality___Info(Functionality: TFunctionality): string; stdcall;

procedure TMODELServerFunctionality___GetLicense(Functionality: TFunctionality;   out License: WideString); stdcall;

procedure TMODELServerFunctionality___CreateNewUserByDefaultPrototype(Functionality: TFunctionality;   const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer); stdcall;

procedure TMODELServerFunctionality___CreateNewUserByDefaultPrototype1(Functionality: TFunctionality;   const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString; const Signature: WideString;  out idNewUser: integer); stdcall;


{TTCoReferenceFunctionality}
function TTCoReferenceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCoReferenceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCoReferenceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoReferenceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCoReferenceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCoReferenceFunctionality}
procedure TCoReferenceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCoReferenceFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TCoReferenceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TCoReferenceFunctionality___ShowReferencedObjectPanelProps(Functionality: TFunctionality); stdcall;

function TCoReferenceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TCoReferenceFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TCoReferenceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TCoReferenceFunctionality___GetReferencedObject(Functionality: TFunctionality;   out idTReferencedObject,idReferencedObject: integer); stdcall;

procedure TCoReferenceFunctionality___SetReferencedObject(Functionality: TFunctionality;   const idTReferencedObject,idReferencedObject: integer); stdcall;


{TTPositionerFunctionality}
function TTPositionerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTPositionerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTPositionerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTPositionerFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTPositionerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TPositionerFunctionality}
procedure TPositionerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TPositionerFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TPositionerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TPositionerFunctionality___SetPosition(Functionality: TFunctionality); stdcall;

function TPositionerFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TPositionerFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TPositionerFunctionality___Get2DPosition(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;

procedure TPositionerFunctionality___Save2DPosition(Functionality: TFunctionality;   const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;

procedure TPositionerFunctionality___Save2DPosition1(Functionality: TFunctionality;   Reflector: TReflector); stdcall;

function TPositionerFunctionality___getPositionName(Functionality: TFunctionality): string; stdcall;

procedure TPositionerFunctionality___setPositionName(Functionality: TFunctionality;   Value: string); stdcall;


{TTOrientedWMFVisualizationFunctionality}
function TTOrientedWMFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOrientedWMFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOrientedWMFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTOrientedWMFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOrientedWMFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOrientedWMFVisualizationFunctionality}
procedure TOrientedWMFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TOrientedWMFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

procedure TOrientedWMFVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TOrientedWMFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TOrientedWMFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOrientedWMFVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

function TOrientedWMFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TOrientedWMFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TOrientedWMFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TOrientedWMFVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TOrientedWMFVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality___GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality___GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

function TOrientedWMFVisualizationFunctionality___getWidth(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedWMFVisualizationFunctionality___setWidth(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedWMFVisualizationFunctionality___getHeight(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedWMFVisualizationFunctionality___setHeight(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedWMFVisualizationFunctionality___getOrientation(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedWMFVisualizationFunctionality___setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality___ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall;

procedure TOrientedWMFVisualizationFunctionality___UpdateContainer(Functionality: TFunctionality); stdcall;

function TOrientedWMFVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedWMFVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;

function TOrientedWMFVisualizationFunctionality___IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall;

procedure TOrientedWMFVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall;


{TTCELLVisualizationFunctionality}
function TTCELLVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTCELLVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCELLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCELLVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTCELLVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TCELLVisualizationFunctionality}
procedure TCELLVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TCELLVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TCELLVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TCELLVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

function TCELLVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TCELLVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TCELLVisualizationFunctionality___SetReflectorView(Functionality: TFunctionality); stdcall;

function TCELLVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TCELLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TCELLVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TCELLVisualizationFunctionality___GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall;

procedure TCELLVisualizationFunctionality___Change(Functionality: TFunctionality;   const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer); stdcall;

function TCELLVisualizationFunctionality___GetFormatNodes(Functionality: TFunctionality;   out NodesList: TByteArray; out SizeX,SizeY: integer): boolean; stdcall;

function TCELLVisualizationFunctionality___GetFormatNodes1(Functionality: TFunctionality;   out NodesList: TList; out SizeX,SizeY: integer): boolean; stdcall;

procedure TCELLVisualizationFunctionality___DoQuad(Functionality: TFunctionality); stdcall;

procedure TCELLVisualizationFunctionality___GetInsideObjectsList(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray); stdcall;

procedure TCELLVisualizationFunctionality___GetInsideObjectsList1(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TComponentsList); stdcall;

function TCELLVisualizationFunctionality___getColCount(Functionality: TFunctionality): integer; stdcall;

procedure TCELLVisualizationFunctionality___setColCount(Functionality: TFunctionality;   Value: integer); stdcall;

function TCELLVisualizationFunctionality___getRowCount(Functionality: TFunctionality): integer; stdcall;

procedure TCELLVisualizationFunctionality___setRowCount(Functionality: TFunctionality;   Value: integer); stdcall;

function TCELLVisualizationFunctionality___getLineWidth(Functionality: TFunctionality): Double; stdcall;

procedure TCELLVisualizationFunctionality___setLineWidth(Functionality: TFunctionality;   Value: Double); stdcall;

function TCELLVisualizationFunctionality___getColSize(Functionality: TFunctionality): Double; stdcall;

function TCELLVisualizationFunctionality___getRowSize(Functionality: TFunctionality): Double; stdcall;

procedure TCELLVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oColCount: integer; out oRowCount: integer; out oLineWidth: Double); stdcall;


{TTEllipseVisualizationFunctionality}
function TTEllipseVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTEllipseVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTEllipseVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTEllipseVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTEllipseVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TEllipseVisualizationFunctionality}
procedure TEllipseVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TEllipseVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TEllipseVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TEllipseVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

function TEllipseVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TEllipseVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TEllipseVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TEllipseVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TEllipseVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TEllipseVisualizationFunctionality___getColor(Functionality: TFunctionality): TColor; stdcall;

procedure TEllipseVisualizationFunctionality___setColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TEllipseVisualizationFunctionality___getBorderColor(Functionality: TFunctionality): TColor; stdcall;

procedure TEllipseVisualizationFunctionality___setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TEllipseVisualizationFunctionality___getBorderWidth(Functionality: TFunctionality): Double; stdcall;

procedure TEllipseVisualizationFunctionality___setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall;


{TTWMFVisualizationFunctionality}
function TTWMFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTWMFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTWMFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTWMFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTWMFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TWMFVisualizationFunctionality}
procedure TWMFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TWMFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TWMFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TWMFVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TWMFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TWMFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TWMFVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

function TWMFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TWMFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TWMFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TWMFVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TWMFVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TWMFVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TWMFVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TWMFVisualizationFunctionality___GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;

procedure TWMFVisualizationFunctionality___GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall;

procedure TWMFVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

procedure TWMFVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

function TWMFVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TWMFVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TWMFVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;

procedure TWMFVisualizationFunctionality___SetProportion(Functionality: TFunctionality); stdcall;


{TTPictureVisualizationFunctionality}
function TTPictureVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTPictureVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTPictureVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTPictureVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TPictureVisualizationFunctionality}
procedure TPictureVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TPictureVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TPictureVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TPictureVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TPictureVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TPictureVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TPictureVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

function TPictureVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TPictureVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TPictureVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TPictureVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TPictureVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TPictureVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TPictureVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TPictureVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

procedure TPictureVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TPictureVisualizationFunctionality___GetBMP(Functionality: TFunctionality;   out BMP: TByteArray); stdcall;

procedure TPictureVisualizationFunctionality___GetBMP1(Functionality: TFunctionality;   out BMP: TBitmap); stdcall;

procedure TPictureVisualizationFunctionality___SetProportion(Functionality: TFunctionality); stdcall;

function TPictureVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TPictureVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TPictureVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;

procedure TPictureVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out VisibleMinScale: double; out VisibleMaxScale: double); stdcall;

procedure TPictureVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const VisibleMinScale: double; const VisibleMaxScale: double); stdcall;


{TTRoundVisualizationFunctionality}
function TTRoundVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTRoundVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTRoundVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTRoundVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTRoundVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TRoundVisualizationFunctionality}
procedure TRoundVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TRoundVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TRoundVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TRoundVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

function TRoundVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TRoundVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TRoundVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TRoundVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TRoundVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TRoundVisualizationFunctionality___getColor(Functionality: TFunctionality): TColor; stdcall;

procedure TRoundVisualizationFunctionality___setColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TRoundVisualizationFunctionality___getBorderColor(Functionality: TFunctionality): TColor; stdcall;

procedure TRoundVisualizationFunctionality___setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TRoundVisualizationFunctionality___getBorderWidth(Functionality: TFunctionality): Double; stdcall;

procedure TRoundVisualizationFunctionality___setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall;


{TTGeodesyPointFunctionality}
function TTGeodesyPointFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGeodesyPointFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGeodesyPointFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGeodesyPointFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTGeodesyPointFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTGeodesyPointFunctionality___ConvertSpaceCRDToGeoCRD(Functionality: TFunctionality;   const X,Y: Double; out Latitude,Longitude: Double): boolean; stdcall;

function TTGeodesyPointFunctionality___ConvertGeoCRDToSpaceCRD(Functionality: TFunctionality;   const Latitude,Longitude: Double; out X,Y: Double): boolean; stdcall;

procedure TTGeodesyPointFunctionality___GetNearestCrdSys(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall;

procedure TTGeodesyPointFunctionality___GetInstanceListByCrdSys(Functionality: TFunctionality;   const idCrdSys: integer; out List: TByteArray); stdcall;

function TTGeodesyPointFunctionality___CrdSys_GetNearestGeoPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall;

function TTGeodesyPointFunctionality___CrdSys_GetNearestXYPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall;


{TGeodesyPointFunctionality}
procedure TGeodesyPointFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TGeodesyPointFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TGeodesyPointFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TGeodesyPointFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TGeodesyPointFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TGeodesyPointFunctionality___getidCrdSys(Functionality: TFunctionality): integer; stdcall;

procedure TGeodesyPointFunctionality___setidCrdSys(Functionality: TFunctionality;   Value: integer); stdcall;

function TGeodesyPointFunctionality___getX(Functionality: TFunctionality): Double; stdcall;

procedure TGeodesyPointFunctionality___setX(Functionality: TFunctionality;   Value: Double); stdcall;

function TGeodesyPointFunctionality___getY(Functionality: TFunctionality): Double; stdcall;

procedure TGeodesyPointFunctionality___setY(Functionality: TFunctionality;   Value: Double); stdcall;

function TGeodesyPointFunctionality___getLatitude(Functionality: TFunctionality): Double; stdcall;

procedure TGeodesyPointFunctionality___setLatitude(Functionality: TFunctionality;   Value: Double); stdcall;

function TGeodesyPointFunctionality___getLongitude(Functionality: TFunctionality): Double; stdcall;

procedure TGeodesyPointFunctionality___setLongitude(Functionality: TFunctionality;   Value: Double); stdcall;

procedure TGeodesyPointFunctionality___GetParams(Functionality: TFunctionality;   out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double); stdcall;

procedure TGeodesyPointFunctionality___SetParams(Functionality: TFunctionality;   const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double); stdcall;

procedure TGeodesyPointFunctionality___ValidateByVisualizationComponent(Functionality: TFunctionality); stdcall;


{TTPrivateAreaVisualizationFunctionality}
function TTPrivateAreaVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTPrivateAreaVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTPrivateAreaVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTPrivateAreaVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTPrivateAreaVisualizationFunctionality___CanCreateAsDetail(Functionality: TFunctionality): boolean; stdcall;

function TTPrivateAreaVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TPrivateAreaVisualizationFunctionality}
procedure TPrivateAreaVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TPrivateAreaVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TPrivateAreaVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TPrivateAreaVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TPrivateAreaVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TPrivateAreaVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TPrivateAreaVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TPrivateAreaVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TPrivateAreaVisualizationFunctionality___getAcquireObjectsInside(Functionality: TFunctionality): boolean; stdcall;

procedure TPrivateAreaVisualizationFunctionality___setAcquireObjectsInside(Functionality: TFunctionality;   Value: boolean); stdcall;


{TTHyperTextFunctionality}
function TTHyperTextFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTHyperTextFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTHyperTextFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHyperTextFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTHyperTextFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{THyperTextFunctionality}
procedure THyperTextFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall;

procedure THyperTextFunctionality___ClearDATA(Functionality: TFunctionality); stdcall;

procedure THyperTextFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function THyperTextFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure THyperTextFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure THyperTextFunctionality___SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function THyperTextFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function THyperTextFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure THyperTextFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure THyperTextFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;

procedure THyperTextFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall;

procedure THyperTextFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;


{TTComponentsFindServiceFunctionality}
function TTComponentsFindServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTComponentsFindServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTComponentsFindServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTComponentsFindServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTComponentsFindServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TComponentsFindServiceFunctionality}
procedure TComponentsFindServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TComponentsFindServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TComponentsFindServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TComponentsFindServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTUsersServiceFunctionality}
function TTUsersServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTUsersServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTUsersServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTUsersServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTUsersServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TUsersServiceFunctionality}
procedure TUsersServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TUsersServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TUsersServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TUsersServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTTransportServiceFunctionality}
function TTTransportServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTransportServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTransportServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTransportServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTTransportServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TTransportServiceFunctionality}
procedure TTransportServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTransportServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTransportServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTransportServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTMarketServiceFunctionality}
function TTMarketServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMarketServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMarketServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMarketServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTMarketServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMarketServiceFunctionality}
procedure TMarketServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMarketServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMarketServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TMarketServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTTelecomServiceFunctionality}
function TTTelecomServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTelecomServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTelecomServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTelecomServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTTelecomServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TTelecomServiceFunctionality}
procedure TTelecomServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTelecomServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTelecomServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTelecomServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTWNDVisualizationFunctionality}
function TTWNDVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTWNDVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTWNDVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTWNDVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTWNDVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TWNDVisualizationFunctionality}
procedure TWNDVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TWNDVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TWNDVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TWNDVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TWNDVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TWNDVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TWNDVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

function TWNDVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TWNDVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TWNDVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TWNDVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TWNDVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TWNDVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TWNDVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TWNDVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TWNDVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

procedure TWNDVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

function TWNDVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TWNDVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TWNDVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;


{TTMRKVisualizationFunctionality}
function TTMRKVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTMRKVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMRKVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTMRKVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMRKVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TMRKVisualizationFunctionality}
procedure TMRKVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TMRKVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TMRKVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TMRKVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TMRKVisualizationFunctionality___DoOnComponentUpdate(Functionality: TFunctionality); stdcall;

function TMRKVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TMRKVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMRKVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

function TMRKVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TMRKVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TMRKVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TMRKVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TMRKVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TMRKVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TMRKVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TMRKVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

procedure TMRKVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

function TMRKVisualizationFunctionality___getBindingPointIndex(Functionality: TFunctionality): integer; stdcall;

procedure TMRKVisualizationFunctionality___setBindingPointIndex(Functionality: TFunctionality;   Value: integer); stdcall;

function TMRKVisualizationFunctionality___getAlign(Functionality: TFunctionality): TMRKVisualizationAlign; stdcall;

function TMRKVisualizationFunctionality___getAlign1(Functionality: TFunctionality): integer; stdcall;

procedure TMRKVisualizationFunctionality___setAlign(Functionality: TFunctionality;   Value: TMRKVisualizationAlign); stdcall;

procedure TMRKVisualizationFunctionality___setAlign1(Functionality: TFunctionality;   Value: integer); stdcall;

function TMRKVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TMRKVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TMRKVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;

procedure TMRKVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oAlign: integer; out oBindingPointIndex: integer); stdcall;


{TTOrientedPictureVisualizationFunctionality}
function TTOrientedPictureVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOrientedPictureVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOrientedPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTOrientedPictureVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOrientedPictureVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOrientedPictureVisualizationFunctionality}
procedure TOrientedPictureVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TOrientedPictureVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TOrientedPictureVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

function TOrientedPictureVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TOrientedPictureVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOrientedPictureVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

function TOrientedPictureVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TOrientedPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TOrientedPictureVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TOrientedPictureVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall;

procedure TOrientedPictureVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

function TOrientedPictureVisualizationFunctionality___getWidth(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedPictureVisualizationFunctionality___setWidth(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedPictureVisualizationFunctionality___getHeight(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedPictureVisualizationFunctionality___setHeight(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedPictureVisualizationFunctionality___getOrientation(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedPictureVisualizationFunctionality___setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality___ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall;

procedure TOrientedPictureVisualizationFunctionality___UpdateContainer(Functionality: TFunctionality); stdcall;

function TOrientedPictureVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedPictureVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;

function TOrientedPictureVisualizationFunctionality___IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall;

procedure TOrientedPictureVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall;


{TTOrientedTTFVisualizationFunctionality}
function TTOrientedTTFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOrientedTTFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOrientedTTFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTOrientedTTFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOrientedTTFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOrientedTTFVisualizationFunctionality}
procedure TOrientedTTFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedTTFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TOrientedTTFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TOrientedTTFVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

function TOrientedTTFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TOrientedTTFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOrientedTTFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TOrientedTTFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TOrientedTTFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TOrientedTTFVisualizationFunctionality___getStr(Functionality: TFunctionality): string; stdcall;

procedure TOrientedTTFVisualizationFunctionality___setStr(Functionality: TFunctionality;   const Value: string); stdcall;

function TOrientedTTFVisualizationFunctionality___getColor(Functionality: TFunctionality): TColor; stdcall;

procedure TOrientedTTFVisualizationFunctionality___setColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TOrientedTTFVisualizationFunctionality___getFont_Name(Functionality: TFunctionality): string; stdcall;

procedure TOrientedTTFVisualizationFunctionality___setFont_Name(Functionality: TFunctionality;   Value: string); stdcall;

function TOrientedTTFVisualizationFunctionality___getFont_Width(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedTTFVisualizationFunctionality___setFont_Width(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedTTFVisualizationFunctionality___getFont_Height(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedTTFVisualizationFunctionality___setFont_Height(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedTTFVisualizationFunctionality___getCharInterval(Functionality: TFunctionality): Double; stdcall;

procedure TOrientedTTFVisualizationFunctionality___setCharInterval(Functionality: TFunctionality;   Value: Double); stdcall;

function TOrientedTTFVisualizationFunctionality___getOrientation(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedTTFVisualizationFunctionality___setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedTTFVisualizationFunctionality___UpdateContainer(Functionality: TFunctionality); stdcall;

function TOrientedTTFVisualizationFunctionality___IsNewContainerAcceptable(Functionality: TFunctionality;   const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean; stdcall;

procedure TOrientedTTFVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer); stdcall;

procedure TOrientedTTFVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer); stdcall;


{TTIconFunctionality}
function TTIconFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTIconFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTIconFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTIconFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTIconFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TIconFunctionality}
procedure TIconFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TIconFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TIconFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TIconFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TIconFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TIconFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TIconFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall;

procedure TIconFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall;

procedure TIconFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall;

procedure TIconFunctionality___GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall;

procedure TIconFunctionality___GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;


{TTMessageBoardMessageFunctionality}
function TTMessageBoardMessageFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMessageBoardMessageFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMessageBoardMessageFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMessageBoardMessageFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTMessageBoardMessageFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMessageBoardMessageFunctionality}
procedure TMessageBoardMessageFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMessageBoardMessageFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMessageBoardMessageFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TMessageBoardMessageFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TMessageBoardMessageFunctionality___getIdMessageBoard(Functionality: TFunctionality): integer; stdcall;

procedure TMessageBoardMessageFunctionality___setIdMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall;

function TMessageBoardMessageFunctionality___getIdSenderMessageBoard(Functionality: TFunctionality): integer; stdcall;

procedure TMessageBoardMessageFunctionality___setIdSenderMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall;

function TMessageBoardMessageFunctionality___DateCreated(Functionality: TFunctionality): TDateTime; stdcall;

function TMessageBoardMessageFunctionality___getSubject(Functionality: TFunctionality): string; stdcall;

procedure TMessageBoardMessageFunctionality___setSubject(Functionality: TFunctionality;   Value: string); stdcall;

procedure TMessageBoardMessageFunctionality___GetBody(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure TMessageBoardMessageFunctionality___GetBody1(Functionality: TFunctionality;   Value: TStringList); stdcall;

procedure TMessageBoardMessageFunctionality___SetBody(Functionality: TFunctionality;   Value: TByteArray); stdcall;

procedure TMessageBoardMessageFunctionality___SetBody1(Functionality: TFunctionality;   Value: TStringList); stdcall;

function TMessageBoardMessageFunctionality___getFlRead(Functionality: TFunctionality): boolean; stdcall;

procedure TMessageBoardMessageFunctionality___setFlRead(Functionality: TFunctionality;   Value: boolean); stdcall;

function TMessageBoardMessageFunctionality___IsEmpty(Functionality: TFunctionality): boolean; stdcall;

function TMessageBoardMessageFunctionality___IsCreatedByUser(Functionality: TFunctionality;   const pidUser: integer): boolean; stdcall;


{TTMessageBoardFunctionality}
function TTMessageBoardFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMessageBoardFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMessageBoardFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMessageBoardFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTMessageBoardFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMessageBoardFunctionality}
procedure TMessageBoardFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMessageBoardFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TMessageBoardFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMessageBoardFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TMessageBoardFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TMessageBoardFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TMessageBoardFunctionality___IsUnreadMessageExist(Functionality: TFunctionality): boolean; stdcall;

procedure TMessageBoardFunctionality___GetMessagesList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TMessageBoardFunctionality___GetMessagesList1(Functionality: TFunctionality;   out List: TList); stdcall;

function TMessageBoardFunctionality___CreateNewMessage(Functionality: TFunctionality): integer; stdcall;

procedure TMessageBoardFunctionality___SendMessage(Functionality: TFunctionality;   const idMessage: integer); stdcall;

function TMessageBoardFunctionality___getIdUser(Functionality: TFunctionality): integer; stdcall;

procedure TMessageBoardFunctionality___setIdUser(Functionality: TFunctionality;   Value: integer); stdcall;


{TTHREFFunctionality}
function TTHREFFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTHREFFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTHREFFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHREFFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTHREFFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{THREFFunctionality}
procedure THREFFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function THREFFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function THREFFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

procedure THREFFunctionality___Activate(Functionality: TFunctionality); stdcall;

function THREFFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function THREFFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function THREFFunctionality___getURL(Functionality: TFunctionality): string; stdcall;

procedure THREFFunctionality___setURL(Functionality: TFunctionality;   Value: string); stdcall;

function THREFFunctionality___getAutoStart(Functionality: TFunctionality): boolean; stdcall;

procedure THREFFunctionality___setAutoStart(Functionality: TFunctionality;   Value: boolean); stdcall;


{TTQDCVisualizationFunctionality}
function TTQDCVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTQDCVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTQDCVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTQDCVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTQDCVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TQDCVisualizationFunctionality}
procedure TQDCVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TQDCVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TQDCVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TQDCVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAPtr: pointer): boolean; stdcall;

function TQDCVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TQDCVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TQDCVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

function TQDCVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TQDCVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TQDCVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TQDCVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall;

procedure TQDCVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure TQDCVisualizationFunctionality___LoadFromBitmap(Functionality: TFunctionality;   Bitmap: TByteArray); stdcall;

procedure TQDCVisualizationFunctionality___LoadFromBitmap1(Functionality: TFunctionality;   Bitmap: TBitmap); stdcall;

function TQDCVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TQDCVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TQDCVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;


{TTOffersServerFunctionality}
function TTOffersServerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTOffersServerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTOffersServerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOffersServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTOffersServerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TOffersServerFunctionality}
procedure TOffersServerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOffersServerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOffersServerFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TOffersServerFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TOffersServerFunctionality___getMailROBOT_Inbox(Functionality: TFunctionality): string; stdcall;

procedure TOffersServerFunctionality___setMailROBOT_Inbox(Functionality: TFunctionality;   Value: string); stdcall;

function TOffersServerFunctionality___getMailROBOT_User(Functionality: TFunctionality): string; stdcall;

procedure TOffersServerFunctionality___setMailROBOT_User(Functionality: TFunctionality;   Value: string); stdcall;

function TOffersServerFunctionality___getMailROBOT_Password(Functionality: TFunctionality): string; stdcall;

procedure TOffersServerFunctionality___setMailROBOT_Password(Functionality: TFunctionality;   Value: string); stdcall;


{TTSecurityComponentOperationFunctionality}
function TTSecurityComponentOperationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSecurityComponentOperationFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSecurityComponentOperationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSecurityComponentOperationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTSecurityComponentOperationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTSecurityComponentOperationFunctionality___GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall;

procedure TTSecurityComponentOperationFunctionality___GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;


{TSecurityComponentOperationFunctionality}
procedure TSecurityComponentOperationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSecurityComponentOperationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSecurityComponentOperationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TSecurityComponentOperationFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TSecurityComponentOperationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TSecurityComponentOperationFunctionality___getSQLInfo(Functionality: TFunctionality): string; stdcall;

procedure TSecurityComponentOperationFunctionality___setSQLInfo(Functionality: TFunctionality;   Value: string); stdcall;


{TTSecurityKeyFunctionality}
function TTSecurityKeyFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSecurityKeyFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSecurityKeyFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSecurityKeyFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTSecurityKeyFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTSecurityKeyFunctionality___GetInstanceByCode(Functionality: TFunctionality;   const Code: string;  out idInstance: integer): boolean; stdcall;

procedure TTSecurityKeyFunctionality___GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall;

procedure TTSecurityKeyFunctionality___GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;


{TSecurityKeyFunctionality}
procedure TSecurityKeyFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSecurityKeyFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSecurityKeyFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TSecurityKeyFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TSecurityKeyFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TSecurityKeyFunctionality___getInfo(Functionality: TFunctionality): string; stdcall;

procedure TSecurityKeyFunctionality___setInfo(Functionality: TFunctionality;   Value: string); stdcall;

procedure TSecurityKeyFunctionality___GetAssotiatedUsers(Functionality: TFunctionality;   out Users: TByteArray); stdcall;

procedure TSecurityKeyFunctionality___GetAssotiatedUsers1(Functionality: TFunctionality;   out Users: TList); stdcall;

procedure TSecurityKeyFunctionality___GenerateCode(Functionality: TFunctionality); stdcall;

function TSecurityKeyFunctionality___Code(Functionality: TFunctionality): string; stdcall;


{TTSecurityFileFunctionality}
function TTSecurityFileFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSecurityFileFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSecurityFileFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSecurityFileFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTSecurityFileFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTSecurityFileFunctionality___GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString;out List: TByteArray); stdcall;

procedure TTSecurityFileFunctionality___GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;


{TSecurityFileFunctionality}
procedure TSecurityFileFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSecurityFileFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSecurityFileFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TSecurityFileFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TSecurityFileFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TSecurityFileFunctionality___getInfo(Functionality: TFunctionality): string; stdcall;

procedure TSecurityFileFunctionality___setInfo(Functionality: TFunctionality;   Value: string); stdcall;

function TSecurityFileFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray): boolean; stdcall;

function TSecurityFileFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream): boolean; stdcall;

procedure TSecurityFileFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall;

procedure TSecurityFileFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;

function TSecurityFileFunctionality___AddOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall;

function TSecurityFileFunctionality___RemoveOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall;

procedure TSecurityFileFunctionality___GetAssotiatedSecurityComponents(Functionality: TFunctionality;   out SecurityComponents: TByteArray); stdcall;

procedure TSecurityFileFunctionality___GetAssotiatedSecurityComponents1(Functionality: TFunctionality;   out SecurityComponents: TList); stdcall;


{TTSecurityComponentFunctionality}
function TTSecurityComponentFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSecurityComponentFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSecurityComponentFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSecurityComponentFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTSecurityComponentFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTSecurityComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;


{TSecurityComponentFunctionality}
procedure TSecurityComponentFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSecurityComponentFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

procedure TSecurityComponentFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSecurityComponentFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TSecurityComponentFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TSecurityComponentFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TSecurityComponentFunctionality___getIdSecurityFile(Functionality: TFunctionality): integer; stdcall;

procedure TSecurityComponentFunctionality___setIdSecurityFile(Functionality: TFunctionality;   Value: integer); stdcall;


{TTMODELUserFunctionality}
function TTMODELUserFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMODELUserFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMODELUserFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMODELUserFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTMODELUserFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMODELUserFunctionality___IsUserExist(Functionality: TFunctionality;   const UserName: string; out idUser: integer): boolean; stdcall;

procedure TTMODELUserFunctionality___GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall;

procedure TTMODELUserFunctionality___GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall;

procedure TTMODELUserFunctionality___GetOnlineUsersForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall;

procedure TTMODELUserFunctionality___GetOnlineUsersForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall;

procedure TTMODELUserFunctionality___GetOnlineExpertsForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall;

procedure TTMODELUserFunctionality___GetOnlineExpertsForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall;


{TMODELUserFunctionality}
procedure TMODELUserFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMODELUserFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMODELUserFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TMODELUserFunctionality___GetActiveStateInfo(Functionality: TFunctionality;   out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean; stdcall;

function TMODELUserFunctionality___IsUserOnLine(Functionality: TFunctionality;   const MaxDelay: Double): boolean; stdcall;

procedure TMODELUserFunctionality___Logout(Functionality: TFunctionality); stdcall;

procedure TMODELUserFunctionality___GetSecurityKeysList(Functionality: TFunctionality;   out SecurityKeys: TByteArray); stdcall;

procedure TMODELUserFunctionality___GetSecurityKeysList1(Functionality: TFunctionality;   out SecurityKeys: TList); stdcall;

function TMODELUserFunctionality___SecurityKeys_IsKeyExist(Functionality: TFunctionality;   const idSecurityKey: integer): boolean; stdcall;

procedure TMODELUserFunctionality___SecurityKeys_Insert(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall;

procedure TMODELUserFunctionality___SecurityKeys_Delete(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall;

procedure TMODELUserFunctionality___SecurityKeys_AddKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall;

procedure TMODELUserFunctionality___SecurityKeys_RemoveKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall;

function TMODELUserFunctionality___SecurityKeys_CreateAndAddNewKey(Functionality: TFunctionality;   const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer; stdcall;

procedure TMODELUserFunctionality___GetMessageBoards(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TMODELUserFunctionality___GetMessageBoards1(Functionality: TFunctionality;   out List: TList); stdcall;

function TMODELUserFunctionality___HaveUnreadMessages(Functionality: TFunctionality): boolean; stdcall;

procedure TMODELUserFunctionality___GetMessages(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TByteArray); stdcall;

procedure TMODELUserFunctionality___GetMessages1(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TList); stdcall;

procedure TMODELUserFunctionality___IncomingMessages_SendNew(Functionality: TFunctionality;   const Message: TByteArray; const SenderID: integer); stdcall;

procedure TMODELUserFunctionality___IncomingMessages_SendNew1(Functionality: TFunctionality;   const Message: TMemoryStream; const SenderID: integer); stdcall;

function TMODELUserFunctionality___IncomingMessages_GetUnread(Functionality: TFunctionality;   out MessageList: TByteArray): boolean; stdcall;

function TMODELUserFunctionality___IncomingMessages_GetUnread1(Functionality: TFunctionality;   out MessageList: TList): boolean; stdcall;

procedure TMODELUserFunctionality___IncomingMessages_GetMessagesSince(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TByteArray); stdcall;

procedure TMODELUserFunctionality___IncomingMessages_GetMessagesSince1(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TList); stdcall;

procedure TMODELUserFunctionality___IncomingMessages_GetMessage(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer); stdcall;

procedure TMODELUserFunctionality___IncomingMessages_GetMessage1(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: TDateTime; out Message: TClientBlobStream; out SenderID: integer); stdcall;

procedure TMODELUserFunctionality___IncomingMessages_DeleteTo(Functionality: TFunctionality;   const TimeStamp: TDateTime); stdcall;

function TMODELUserFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TMODELUserFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELUserFunctionality___getFullName(Functionality: TFunctionality): string; stdcall;

procedure TMODELUserFunctionality___setFullName(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELUserFunctionality___getContactInfo(Functionality: TFunctionality): string; stdcall;

procedure TMODELUserFunctionality___setContactInfo(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELUserFunctionality___getPassword(Functionality: TFunctionality): string; stdcall;

procedure TMODELUserFunctionality___setPassword(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELUserFunctionality___getIdSecurityFileForClone(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality___setIdSecurityFileForClone(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality___getidSecurityFileForPrivate(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality___setidSecurityFileForPrivate(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality___getDATASize(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality___setDATASize(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality___getMaxDATASize(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality___setMaxDATASize(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality___getSpaceSquare(Functionality: TFunctionality): Double; stdcall;

procedure TMODELUserFunctionality___setSpaceSquare(Functionality: TFunctionality;   Value: Double); stdcall;

function TMODELUserFunctionality___getMaxSpaceSquare(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality___setMaxSpaceSquare(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality___getMaxSpaceSquarePerObject(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality___setMaxSpaceSquarePerObject(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality___getDisabled(Functionality: TFunctionality): boolean; stdcall;

procedure TMODELUserFunctionality___setDisabled(Functionality: TFunctionality;   Value: boolean); stdcall;

procedure TMODELUserFunctionality___GetStartObj(Functionality: TFunctionality;   out idTStartObj,idStartObj: integer); stdcall;

procedure TMODELUserFunctionality___SetStartObj(Functionality: TFunctionality;   const idTStartObj,idStartObj: integer); stdcall;

function TMODELUserFunctionality___getDomains(Functionality: TFunctionality): string; stdcall;

procedure TMODELUserFunctionality___setDomains(Functionality: TFunctionality;   Value: string); stdcall;

function TMODELUserFunctionality___getTaskEnabled(Functionality: TFunctionality): boolean; stdcall;

procedure TMODELUserFunctionality___setTaskEnabled(Functionality: TFunctionality;   Value: boolean); stdcall;

function TMODELUserFunctionality___getBillingType(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality___setBillingType(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TMODELUserFunctionality___CheckDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall;

procedure TMODELUserFunctionality___AddDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall;

procedure TMODELUserFunctionality___SubDATASize(Functionality: TFunctionality;   const pSubDATASize: integer); stdcall;

procedure TMODELUserFunctionality___CheckSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall;

procedure TMODELUserFunctionality___AddSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall;

procedure TMODELUserFunctionality___SubSpaceSquare(Functionality: TFunctionality;   const pSubSpaceSquare: Double); stdcall;

procedure TMODELUserFunctionality___CheckMaxSpaceSquarePerObject(Functionality: TFunctionality;   const pObjectSpaceSquare: Double); stdcall;

procedure TMODELUserFunctionality___ServerFolder_GetSubFoldersList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall;

procedure TMODELUserFunctionality___ServerFolder_GetFilesList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall;

function TMODELUserFunctionality___ServerFolder_AddFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean; stdcall;

function TMODELUserFunctionality___ServerFolder_RemoveFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString): boolean; stdcall;

function TMODELUserFunctionality___ServerFolder_ReadFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean; stdcall;

function TMODELUserFunctionality___ServerFolder_AddSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall;

function TMODELUserFunctionality___ServerFolder_AddSubFolder1(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean; stdcall;

function TMODELUserFunctionality___ServerFolder_RemoveSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall;

function TMODELUserFunctionality___ServerFolder_ReadSubFolder(Functionality: TFunctionality;   const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean; stdcall;

function TMODELUserFunctionality___ServerFolder_ExchangeSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean; stdcall;

function TMODELUserFunctionality___Tasks_AddNew(Functionality: TFunctionality;   const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer; stdcall;

procedure TMODELUserFunctionality___Tasks_RemoveItem(Functionality: TFunctionality;   const idTask: integer); stdcall;

procedure TMODELUserFunctionality___Tasks_Clear(Functionality: TFunctionality); stdcall;

procedure TMODELUserFunctionality___Tasks_GetData(Functionality: TFunctionality;   const Version: integer; const flOnlyActive: boolean; out oData: TByteArray); stdcall;

procedure TMODELUserFunctionality___Tasks_Item_GetTaskData(Functionality: TFunctionality;   const idTask: integer; out oTaskData: TByteArray); stdcall;

procedure TMODELUserFunctionality___Tasks_Item_SetPriority(Functionality: TFunctionality;   const idTask: integer; const pPriority: integer); stdcall;

procedure TMODELUserFunctionality___Tasks_Item_GetStatus(Functionality: TFunctionality;   const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string); stdcall;

procedure TMODELUserFunctionality___Tasks_Item_SetStatus(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusComment: string); stdcall;

procedure TMODELUserFunctionality___Tasks_Item_SetStatus1(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string); stdcall;

procedure TMODELUserFunctionality___Tasks_Item_GetResultData(Functionality: TFunctionality;   const idTask: integer; out oResultData: TByteArray); stdcall;

procedure TMODELUserFunctionality___Tasks_Item_SetResult(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultComment: string); stdcall;

procedure TMODELUserFunctionality___Tasks_Item_SetResult1(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string); stdcall;

procedure TMODELUserFunctionality___Tasks_Item_SetResult2(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall;

procedure TMODELUserFunctionality___Tasks_Item_SetResult3(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall;

function TMODELUserFunctionality___Billing_Account(Functionality: TFunctionality): double; stdcall;

function TMODELUserFunctionality___Billing_Transactions_AddNew(Functionality: TFunctionality;   const pReason: integer; const pDelta: double; const pComment: string): integer; stdcall;

procedure TMODELUserFunctionality___Billing_Transactions_Remove(Functionality: TFunctionality;   const idTransaction: integer); stdcall;

procedure TMODELUserFunctionality___Billing_Transactions_Clear(Functionality: TFunctionality); stdcall;

procedure TMODELUserFunctionality___Billing_Transactions_GetData(Functionality: TFunctionality;   const Version: integer; out oData: TByteArray); stdcall;

procedure TMODELUserFunctionality___ClientProgram_GetReleases(Functionality: TFunctionality;   const ProgramID: integer; const Localization: WideString; out Data: TByteArray); stdcall;


{TTTextureFunctionality}
function TTTextureFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTextureFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTextureFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTextureFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTTextureFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTTextureFunctionality___GetInstanceListMatchingBy(Functionality: TFunctionality;   const NameContext: string; out List: TByteArray); stdcall;

procedure TTTextureFunctionality___GetInstanceListMatchingBy1(Functionality: TFunctionality;   const NameContext: string; out List: TList); stdcall;


{TTextureFunctionality}
procedure TTextureFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TTextureFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TTextureFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTextureFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTextureFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TTextureFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TTextureFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType); stdcall;

procedure TTextureFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall;

procedure TTextureFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TTextureDATAType); stdcall;

procedure TTextureFunctionality___GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall;

procedure TTextureFunctionality___GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;

procedure TTextureFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;


{TTBuffered3DVisualizationFunctionality}
function TTBuffered3DVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTBuffered3DVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTBuffered3DVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTBuffered3DVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTBuffered3DVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TBuffered3DVisualizationFunctionality}
procedure TBuffered3DVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TBuffered3DVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TBuffered3DVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TBuffered3DVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TBuffered3DVisualizationFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall;

procedure TBuffered3DVisualizationFunctionality___GetData(Functionality: TFunctionality;   out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Double; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Double); stdcall;

function TBuffered3DVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

procedure TBuffered3DVisualizationFunctionality___ReflectInScene(Functionality: TFunctionality;   Scene: TScene); stdcall;

function TBuffered3DVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TBuffered3DVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall;

function TBuffered3DVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TBuffered3DVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TBuffered3DVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TBuffered3DVisualizationFunctionality___LoadFromStream(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall;

procedure TBuffered3DVisualizationFunctionality___LoadFromStream1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TBuffered3DVisualizationFunctionality___Get__Translate_XY(Functionality: TFunctionality;   out vTranslate_X,vTranslate_Y: Double); stdcall;

procedure TBuffered3DVisualizationFunctionality___SetPropertiesLocal(Functionality: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall;

function TBuffered3DVisualizationFunctionality___GetMinMax(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix; out Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Double): boolean; stdcall;

procedure TBuffered3DVisualizationFunctionality___UpdateXOYProjection(Functionality: TFunctionality); stdcall;

function TBuffered3DVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TBuffered3DVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TBuffered3DVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall;

function TBuffered3DVisualizationFunctionality___GetMeshesNodesApproximator(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix): TNodesApproximator; stdcall;

procedure TBuffered3DVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double); stdcall;


{TTDATAFileFunctionality}
function TTDATAFileFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDATAFileFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDATAFileFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDATAFileFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTDATAFileFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDATAFileFunctionality}
procedure TDATAFileFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TDATAFileFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TDATAFileFunctionality___SaveToFile(Functionality: TFunctionality;   var FileName: string); stdcall;

procedure TDATAFileFunctionality___Activate(Functionality: TFunctionality); stdcall;

function TDATAFileFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TDATAFileFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDATAFileFunctionality____GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;

procedure TDATAFileFunctionality___Check(Functionality: TFunctionality); stdcall;

function TDATAFileFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TDATAFileFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TDATAFileFunctionality___IsNull(Functionality: TFunctionality): boolean; stdcall;

procedure TDATAFileFunctionality___Empty(Functionality: TFunctionality); stdcall;

procedure TDATAFileFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure TDATAFileFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall;

procedure TDATAFileFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall;

procedure TDATAFileFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;

function TDATAFileFunctionality___getDATAType(Functionality: TFunctionality): string; stdcall;

procedure TDATAFileFunctionality___setDATAType(Functionality: TFunctionality;   Value: string); stdcall;


{TTCoComponentFunctionality}
function TTCoComponentFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCoComponentFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCoComponentFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoComponentFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCoComponentFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTCoComponentFunctionality___GetInstanceListByCoType(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TByteArray); stdcall;

procedure TTCoComponentFunctionality___GetInstanceListByCoType1(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TList); stdcall;


{TCoComponentFunctionality}
procedure TCoComponentFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCoComponentFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TCoComponentFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCoComponentFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TCoComponentFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TCoComponentFunctionality___idCoType(Functionality: TFunctionality): integer; stdcall;

function TCoComponentFunctionality___GetIconImage(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall;

function TCoComponentFunctionality___GetIconImage1(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;

function TCoComponentFunctionality___GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall;


{TTCoComponentTypeMarkerFunctionality}
function TTCoComponentTypeMarkerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCoComponentTypeMarkerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCoComponentTypeMarkerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoComponentTypeMarkerFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCoComponentTypeMarkerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCoComponentTypeMarkerFunctionality}
procedure TCoComponentTypeMarkerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCoComponentTypeMarkerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCoComponentTypeMarkerFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TCoComponentTypeMarkerFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TCoComponentTypeMarkerFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TCoComponentTypeMarkerFunctionality___GetTypeIconImage(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall;

function TCoComponentTypeMarkerFunctionality___GetTypeIconImage1(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;

procedure TCoComponentTypeMarkerFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TCoComponentTypeMarkerFunctionality___getIDCoComponentType(Functionality: TFunctionality): integer; stdcall;


{TTCoComponentTypeFunctionality}
function TTCoComponentTypeFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCoComponentTypeFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCoComponentTypeFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoComponentTypeFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCoComponentTypeFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTCoComponentTypeFunctionality___GetInstanceListByFileType(Functionality: TFunctionality;   const FileType: WideString; out List: TByteArray); stdcall;

procedure TTCoComponentTypeFunctionality___GetInstanceListByFileType1(Functionality: TFunctionality;   const FileType: shortstring; out List: TList); stdcall;


{TCoComponentTypeFunctionality}
procedure TCoComponentTypeFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCoComponentTypeFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCoComponentTypeFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TCoComponentTypeFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TCoComponentTypeFunctionality___GetDescription(Functionality: TFunctionality;   out Value: TByteArray); stdcall;

procedure TCoComponentTypeFunctionality___GetDescription1(Functionality: TFunctionality;   Value: TStringList); stdcall;

procedure TCoComponentTypeFunctionality___SetDescription(Functionality: TFunctionality;   Value: TByteArray); stdcall;

procedure TCoComponentTypeFunctionality___SetDescription1(Functionality: TFunctionality;   Value: TStringList); stdcall;

procedure TCoComponentTypeFunctionality___GetMarkersList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TCoComponentTypeFunctionality___GetMarkersList1(Functionality: TFunctionality;   out List: TList); stdcall;

function TCoComponentTypeFunctionality___GetIconImage(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall;

function TCoComponentTypeFunctionality___GetIconImage1(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;

procedure TCoComponentTypeFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TCoComponentTypeFunctionality___getUID(Functionality: TFunctionality): integer; stdcall;

function TCoComponentTypeFunctionality___getDateCreated(Functionality: TFunctionality): TDateTime; stdcall;

function TCoComponentTypeFunctionality___getFileType(Functionality: TFunctionality): shortstring; stdcall;

procedure TCoComponentTypeFunctionality___setFileType(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TCoComponentTypeFunctionality___getCoComponentPrototypeID(Functionality: TFunctionality): integer; stdcall;

procedure TCoComponentTypeFunctionality___setCoComponentPrototypeID(Functionality: TFunctionality;   Value: integer); stdcall;


{TTAddressFunctionality}
function TTAddressFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTAddressFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTAddressFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTAddressFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTAddressFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTAddressFunctionality___Points_GetTypeNames(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTAddressFunctionality___Points_GetTypeNames1(Functionality: TFunctionality;   out List: TStringList); stdcall;

procedure TTAddressFunctionality___Streets_GetTypeNames(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTAddressFunctionality___Streets_GetTypeNames1(Functionality: TFunctionality;   out List: TStringList); stdcall;


{TAddressFunctionality}
procedure TAddressFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TAddressFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TAddressFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TAddressFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TAddressFunctionality___getIdPoint(Functionality: TFunctionality): integer; stdcall;

procedure TAddressFunctionality___setIdPoint(Functionality: TFunctionality;   Value: integer); stdcall;

function TAddressFunctionality___getPoint(Functionality: TFunctionality): string; stdcall;

function TAddressFunctionality___getIdStreet(Functionality: TFunctionality): integer; stdcall;

procedure TAddressFunctionality___setIdStreet(Functionality: TFunctionality;   Value: integer); stdcall;

function TAddressFunctionality___getStreet(Functionality: TFunctionality): string; stdcall;

function TAddressFunctionality___getHouse(Functionality: TFunctionality): string; stdcall;

procedure TAddressFunctionality___setHouse(Functionality: TFunctionality;   Value: string); stdcall;

function TAddressFunctionality___getCorps(Functionality: TFunctionality): integer; stdcall;

procedure TAddressFunctionality___setCorps(Functionality: TFunctionality;   Value: integer); stdcall;

function TAddressFunctionality___getApartment(Functionality: TFunctionality): string; stdcall;

procedure TAddressFunctionality___setApartment(Functionality: TFunctionality;   Value: string); stdcall;

function TAddressFunctionality___getEntrance(Functionality: TFunctionality): integer; stdcall;

procedure TAddressFunctionality___setEntrance(Functionality: TFunctionality;   Value: integer); stdcall;


{TTTransportRouteFunctionality}
function TTTransportRouteFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTransportRouteFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTransportRouteFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTransportRouteFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTTransportRouteFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTTransportRouteFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTTransportRouteFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;


{TTransportRouteFunctionality}
procedure TTransportRouteFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTransportRouteFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTransportRouteFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TTransportRouteFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TTransportRouteFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TTransportRouteFunctionality___getidTTransport(Functionality: TFunctionality): integer; stdcall;

procedure TTransportRouteFunctionality___setidTTransport(Functionality: TFunctionality;   Value: integer); stdcall;

function TTransportRouteFunctionality___getValid(Functionality: TFunctionality): boolean; stdcall;

procedure TTransportRouteFunctionality___setValid(Functionality: TFunctionality;   Value: boolean); stdcall;

function TTransportRouteFunctionality___getRemarks(Functionality: TFunctionality): string; stdcall;

procedure TTransportRouteFunctionality___setRemarks(Functionality: TFunctionality;   Value: string); stdcall;

function TTransportRouteFunctionality___IsNodesExist(Functionality: TFunctionality): boolean; stdcall;

procedure TTransportRouteFunctionality___Nodes_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTransportRouteFunctionality___Nodes_GetList1(Functionality: TFunctionality;   out List: TRouteNodesList); stdcall;

function TTransportRouteFunctionality___Nodes_IsNodeExist(Functionality: TFunctionality;   const idNode: integer): boolean; stdcall;

procedure TTransportRouteFunctionality___Nodes_ChangeNodeOrder(Functionality: TFunctionality;   const idItem: integer; const Order: integer); stdcall;

function TTransportRouteFunctionality___Nodes__Node_DistanceBefore(Functionality: TFunctionality;   const idItem: integer): integer; stdcall;

procedure TTransportRouteFunctionality___Nodes__Node_SetDistanceBefore(Functionality: TFunctionality;   const idItem: integer; const D: integer); stdcall;

function TTransportRouteFunctionality___Nodes__Node_OrderPrice(Functionality: TFunctionality;   const idItem: integer): string; stdcall;

procedure TTransportRouteFunctionality___Nodes__Node_SetOrderPrice(Functionality: TFunctionality;   const idItem: integer; const Price: string); stdcall;

function TTransportRouteFunctionality___Nodes_Insert(Functionality: TFunctionality;   const idNode: integer): integer; stdcall;

procedure TTransportRouteFunctionality___Nodes_Remove(Functionality: TFunctionality;   const idItem: integer); stdcall;


{TTTransportNodeFunctionality}
function TTTransportNodeFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTransportNodeFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTransportNodeFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTransportNodeFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTTransportNodeFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTTransportNodeFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTTransportNodeFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;


{TTransportNodeFunctionality}
procedure TTransportNodeFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTransportNodeFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTransportNodeFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TTransportNodeFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TTransportNodeFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TTransportNodeFunctionality___IsRoutesExist(Functionality: TFunctionality): boolean; stdcall;


{TTOfferGoodsFunctionality}
function TTOfferGoodsFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTOfferGoodsFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTOfferGoodsFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOfferGoodsFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTOfferGoodsFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TOfferGoodsFunctionality}
procedure TOfferGoodsFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOfferGoodsFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOfferGoodsFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TOfferGoodsFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TOfferGoodsFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TOfferGoodsFunctionality___idOffer(Functionality: TFunctionality): integer; stdcall;

function TOfferGoodsFunctionality___getIdGoods(Functionality: TFunctionality): integer; stdcall;

procedure TOfferGoodsFunctionality___setIdGoods(Functionality: TFunctionality;   Value: integer); stdcall;

function TOfferGoodsFunctionality___getAmount(Functionality: TFunctionality): Double; stdcall;

procedure TOfferGoodsFunctionality___setAmount(Functionality: TFunctionality;   Value: Double); stdcall;

function TOfferGoodsFunctionality___getIdMeasureUnit(Functionality: TFunctionality): integer; stdcall;

procedure TOfferGoodsFunctionality___setIdMeasureUnit(Functionality: TFunctionality;   Value: integer); stdcall;

function TOfferGoodsFunctionality___getMeasureUnit(Functionality: TFunctionality): string; stdcall;

function TOfferGoodsFunctionality___getMinPrice(Functionality: TFunctionality): Currency; stdcall;

procedure TOfferGoodsFunctionality___setMinPrice(Functionality: TFunctionality;   Value: Currency); stdcall;

function TOfferGoodsFunctionality___getMisc(Functionality: TFunctionality): string; stdcall;

procedure TOfferGoodsFunctionality___setMisc(Functionality: TFunctionality;   Value: string); stdcall;


{TTTLFStationTMTFunctionality}
function TTTLFStationTMTFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTLFStationTMTFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTLFStationTMTFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTLFStationTMTFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTTLFStationTMTFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTTLFStationTMTFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTTLFStationTMTFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;


{TTLFStationTMTFunctionality}
procedure TTLFStationTMTFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTLFStationTMTFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTLFStationTMTFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTLFStationTMTFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TTLFStationTMTFunctionality___getHostName(Functionality: TFunctionality): string; stdcall;

procedure TTLFStationTMTFunctionality___setHostName(Functionality: TFunctionality;   Value: string); stdcall;

function TTLFStationTMTFunctionality___getTestChanel(Functionality: TFunctionality): string; stdcall;

procedure TTLFStationTMTFunctionality___setTestChanel(Functionality: TFunctionality;   Value: string); stdcall;


{TTNameFunctionality}
function TTNameFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTNameFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTNameFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTNameFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTNameFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TNameFunctionality}
procedure TNameFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TNameFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TNameFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TNameFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TNameFunctionality___Value(Functionality: TFunctionality): string; stdcall;

procedure TNameFunctionality___SetValue(Functionality: TFunctionality;   const NewValue: string); stdcall;


{TTVisualizationFunctionality}
function TTVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TVisualizationFunctionality}
procedure TVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall;

function TVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTHREFVisualizationFunctionality}
function TTHREFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHREFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTHREFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{THREFVisualizationFunctionality}
function THREFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function THREFVisualizationFunctionality___DoOnOver(Functionality: TFunctionality): boolean; stdcall;

function THREFVisualizationFunctionality___DoOnClick(Functionality: TFunctionality): boolean; stdcall;

function THREFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function THREFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function THREFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTTTFVisualizationFunctionality}
function TTTTFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTTTFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTTFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTTTFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTTTFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TTTFVisualizationFunctionality}
procedure TTTFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TTTFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall;

procedure TTTFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TTTFVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall;

function TTTFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TTTFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTTFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TTTFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTTFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TTTFVisualizationFunctionality___getStr(Functionality: TFunctionality): string; stdcall;

procedure TTTFVisualizationFunctionality___setStr(Functionality: TFunctionality;   const Value: string); stdcall;

procedure TTTFVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString); stdcall;

procedure TTTFVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString); stdcall;


{TTObjectFunctionality}
function TTObjectFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTObjectFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTObjectFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTObjectFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TObjectFunctionality}
procedure TObjectFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TObjectFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TObjectFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTLabelFunctionality}
function TTLabelFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTLabelFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTLabelFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTLabelFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTLabelFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TLabelFunctionality}
procedure TLabelFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TLabelFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TLabelFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TLabelFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTStationFunctionality}
function TTStationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTStationFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTStationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTStationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTStationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

procedure TTStationFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTStationFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;


{TStationFunctionality}
procedure TStationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TStationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TStationFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TStationFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TStationFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TStationFunctionality___GetNumbersBound(Functionality: TFunctionality;   out BegNumber,EndNumber: integer); stdcall;


{TTMainLineFunctionality}
function TTMainLineFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMainLineFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMainLineFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMainLineFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTMainLineFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMainLineFunctionality}
procedure TMainLineFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMainLineFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMainLineFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TMainLineFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TMainLineFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TMainLineFunctionality___GetSTNOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;


{TTDescriptionFunctionality}
function TTDescriptionFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDescriptionFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDescriptionFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDescriptionFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTDescriptionFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDescriptionFunctionality}
procedure TDescriptionFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall;

procedure TDescriptionFunctionality___ClearDATA(Functionality: TFunctionality); stdcall;

procedure TDescriptionFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TDescriptionFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDescriptionFunctionality____GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;

function TDescriptionFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TDescriptionFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

procedure TDescriptionFunctionality___GetValue(Functionality: TFunctionality;   out vText: TByteArray); stdcall;

procedure TDescriptionFunctionality___GetValue1(Functionality: TFunctionality;   vText: TStringList); stdcall;

procedure TDescriptionFunctionality___SetValue(Functionality: TFunctionality;   NewValue: TByteArray); stdcall;

procedure TDescriptionFunctionality___SetValue1(Functionality: TFunctionality;   NewValue: TStringList); stdcall;


{TTImageFunctionality}
function TTImageFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTImageFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTImageFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTImageFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTImageFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TImageFunctionality}
procedure TImageFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall;

procedure TImageFunctionality___ClearDATA(Functionality: TFunctionality); stdcall;

procedure TImageFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

procedure TImageFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TImageFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TImageFunctionality____GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;

function TImageFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TImageFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TImageFunctionality___GetDATAType(Functionality: TFunctionality): TImageDATAType; stdcall;

function TImageFunctionality___GetDATAType1(Functionality: TFunctionality): integer; stdcall;

procedure TImageFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall;

procedure TImageFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall;

procedure TImageFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall;

procedure TImageFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall;

procedure TImageFunctionality___GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall;

procedure TImageFunctionality___GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;


{TTWellFunctionality}
function TTWellFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTWellFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTWellFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTWellFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTWellFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TWellFunctionality}
procedure TWellFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TWellFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TWellFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TWellFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTTLFFunctionality}
function TTTLFFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTLFFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTLFFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTLFFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTTLFFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTTLFFunctionality___GetIDInstanceByNumber(Functionality: TFunctionality;   out ID: integer; const Number: integer); stdcall;


{TTLFFunctionality}
procedure TTLFFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TTLFFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTLFFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TTLFFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTLFFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TTLFFunctionality___Number(Functionality: TFunctionality): integer; stdcall;

function TTLFFunctionality___Kind(Functionality: TFunctionality): TAbonentKind; stdcall;

function TTLFFunctionality___LocalELockExist(Functionality: TFunctionality): boolean; stdcall;

function TTLFFunctionality___GlobalELockExist(Functionality: TFunctionality): boolean; stdcall;

function TTLFFunctionality___GetFinishDevice(Functionality: TFunctionality;   out vidTObj,vidObj: integer): boolean; stdcall;

function TTLFFunctionality___IsDamaged(Functionality: TFunctionality): boolean; stdcall;

function TTLFFunctionality___idDamage(Functionality: TFunctionality): integer; stdcall;

function TTLFFunctionality___getDamage_TimeNote(Functionality: TFunctionality): TDateTime; stdcall;

procedure TTLFFunctionality___setDamage_TimeNote(Functionality: TFunctionality;   Value: TDateTime); stdcall;

function TTLFFunctionality___getDamage_Note(Functionality: TFunctionality): string; stdcall;

procedure TTLFFunctionality___setDamage_Note(Functionality: TFunctionality;   Value: string); stdcall;

function TTLFFunctionality___getDamage_Measured(Functionality: TFunctionality): string; stdcall;

procedure TTLFFunctionality___setDamage_Measured(Functionality: TFunctionality;   Value: string); stdcall;

function TTLFFunctionality___getDamage_Acceptor(Functionality: TFunctionality): string; stdcall;

procedure TTLFFunctionality___setDamage_Acceptor(Functionality: TFunctionality;   Value: string); stdcall;

function TTLFFunctionality___getDamage_TimeBegRepair(Functionality: TFunctionality): TDateTime; stdcall;

procedure TTLFFunctionality___setDamage_TimeBegRepair(Functionality: TFunctionality;   Value: TDateTime); stdcall;

function TTLFFunctionality___getDamage_TimeEndRepair(Functionality: TFunctionality): TDateTime; stdcall;

procedure TTLFFunctionality___setDamage_TimeEndRepair(Functionality: TFunctionality;   Value: TDateTime); stdcall;

function TTLFFunctionality___getDamage_Damage(Functionality: TFunctionality): string; stdcall;

procedure TTLFFunctionality___setDamage_Damage(Functionality: TFunctionality;   Value: string); stdcall;

function TTLFFunctionality___getDamage_Executor(Functionality: TFunctionality): string; stdcall;

procedure TTLFFunctionality___setDamage_Executor(Functionality: TFunctionality;   Value: string); stdcall;

function TTLFFunctionality___getDamage_Remarks(Functionality: TFunctionality): string; stdcall;

procedure TTLFFunctionality___setDamage_Remarks(Functionality: TFunctionality;   Value: string); stdcall;

procedure TTLFFunctionality___WriteEvent(Functionality: TFunctionality;   const Event: string; const EventTime: TDateTime); stdcall;


{TTBoxFunctionality}
function TTBoxFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTBoxFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTBoxFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTBoxFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTBoxFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TBoxFunctionality}
procedure TBoxFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TBoxFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TBoxFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TBoxFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TBoxFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTCableBoxFunctionality}
function TTCableBoxFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCableBoxFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCableBoxFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCableBoxFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCableBoxFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCableBoxFunctionality}
procedure TCableBoxFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCableBoxFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCableBoxFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TCableBoxFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTDistrLineFunctionality}
function TTDistrLineFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDistrLineFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDistrLineFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDistrLineFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTDistrLineFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDistrLineFunctionality}
procedure TDistrLineFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TDistrLineFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDistrLineFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TDistrLineFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TDistrLineFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTClientFunctionality}
function TTClientFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTClientFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTClientFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTClientFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTClientFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

procedure TTClientFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TTClientFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall;


{TClientFunctionality}
procedure TClientFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TClientFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TClientFunctionality___GetDebet(Functionality: TFunctionality;   out Value: Double): boolean; stdcall;

function TClientFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TClientFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTHouseFunctionality}
function TTHouseFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTHouseFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTHouseFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHouseFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTHouseFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{THouseFunctionality}
procedure THouseFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function THouseFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function THouseFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function THouseFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function THouseFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTCommNodeFunctionality}
function TTCommNodeFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCommNodeFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCommNodeFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCommNodeFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCommNodeFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCommNodeFunctionality}
procedure TCommNodeFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCommNodeFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCommNodeFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TCommNodeFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTCrossFunctionality}
function TTCrossFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCrossFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCrossFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCrossFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCrossFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCrossFunctionality}
procedure TCrossFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCrossFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCrossFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TCrossFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTCaseFunctionality}
function TTCaseFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCaseFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCaseFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCaseFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCaseFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCaseFunctionality}
procedure TCaseFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCaseFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCaseFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TCaseFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTStreetFunctionality}
function TTStreetFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTStreetFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTStreetFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTStreetFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTStreetFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TStreetFunctionality}
procedure TStreetFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TStreetFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TStreetFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TStreetFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTOtherObjFunctionality}
function TTOtherObjFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTOtherObjFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTOtherObjFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOtherObjFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTOtherObjFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TOtherObjFunctionality}
procedure TOtherObjFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOtherObjFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOtherObjFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TOtherObjFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTSpanFunctionality}
function TTSpanFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSpanFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSpanFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSpanFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTSpanFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TSpanFunctionality}
procedure TSpanFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TSpanFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSpanFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TSpanFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTChanelFunctionality}
function TTChanelFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTChanelFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTChanelFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTChanelFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTChanelFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TChanelFunctionality}
procedure TChanelFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TChanelFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TChanelFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TChanelFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TChanelFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTHandHoldFunctionality}
function TTHandHoldFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTHandHoldFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTHandHoldFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHandHoldFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTHandHoldFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{THandHoldFunctionality}
procedure THandHoldFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function THandHoldFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function THandHoldFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function THandHoldFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTLineDistFunctionality}
function TTLineDistFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTLineDistFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTLineDistFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTLineDistFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTLineDistFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TLineDistFunctionality}
procedure TLineDistFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TLineDistFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TLineDistFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TLineDistFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTMuffFunctionality}
function TTMuffFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMuffFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMuffFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMuffFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTMuffFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMuffFunctionality}
procedure TMuffFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TMuffFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMuffFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TMuffFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTOfferFunctionality}
function TTOfferFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTOfferFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTOfferFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOfferFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTOfferFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOfferFunctionality___GetOfferByHumanID(Functionality: TFunctionality;   const HumanID: integer; out idOffer: integer): boolean; stdcall;


{TOfferFunctionality}
procedure TOfferFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TOfferFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOfferFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TOfferFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TOfferFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TOfferFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TOfferFunctionality___getSchedule(Functionality: TFunctionality): string; stdcall;

procedure TOfferFunctionality___setSchedule(Functionality: TFunctionality;   Value: string); stdcall;

function TOfferFunctionality___getPassword(Functionality: TFunctionality): string; stdcall;

procedure TOfferFunctionality___setPassword(Functionality: TFunctionality;   Value: string); stdcall;

function TOfferFunctionality___getContactTLF(Functionality: TFunctionality): integer; stdcall;

procedure TOfferFunctionality___setContactTLF(Functionality: TFunctionality;   Value: integer); stdcall;

function TOfferFunctionality___getLastUpdated(Functionality: TFunctionality): TDateTime; stdcall;

procedure TOfferFunctionality___setLastUpdated(Functionality: TFunctionality;   Value: TDateTime); stdcall;

procedure TOfferFunctionality___LoadDATAFromStream(Functionality: TFunctionality;   Stream: TByteArray); stdcall;

procedure TOfferFunctionality___LoadDATAFromStream1(Functionality: TFunctionality;   Stream: TStream); stdcall;

function TOfferFunctionality___UserID(Functionality: TFunctionality): integer; stdcall;

function TOfferFunctionality___UID(Functionality: TFunctionality): integer; stdcall;

function TOfferFunctionality___AddressStr(Functionality: TFunctionality): string; stdcall;

function TOfferFunctionality___Goods_Insert(Functionality: TFunctionality): integer; stdcall;

procedure TOfferFunctionality___Goods_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TOfferFunctionality___Goods_GetList1(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TOfferFunctionality___Goods_Remove(Functionality: TFunctionality;   const idOfferGoods: integer); stdcall;

procedure TOfferFunctionality___Goods_Clear(Functionality: TFunctionality); stdcall;


{TTDemandFunctionality}
function TTDemandFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDemandFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDemandFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDemandFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTDemandFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDemandFunctionality}
procedure TDemandFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TDemandFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDemandFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TDemandFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TDemandFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTCommLineFunctionality}
function TTCommLineFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCommLineFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCommLineFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCommLineFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCommLineFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCommLineFunctionality}
procedure TCommLineFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCommLineFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCommLineFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TCommLineFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TCommLineFunctionality___getHint(Functionality: TFunctionality): string; stdcall;


{TTGoodsFunctionality}
function TTGoodsFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGoodsFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGoodsFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGoodsFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTGoodsFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTGoodsFunctionality___GetInstanceListContainingContext(Functionality: TFunctionality;   const Context: string; out List: TByteArray); stdcall;

procedure TTGoodsFunctionality___GetInstanceListContainingContext1(Functionality: TFunctionality;   const Context: string; out List: TStringList); stdcall;

function TTGoodsFunctionality___IsInstanceExist(Functionality: TFunctionality;   const pName: string; out idGoods: integer): boolean; stdcall;


{TGoodsFunctionality}
procedure TGoodsFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TGoodsFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TGoodsFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TGoodsFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall;

function TGoodsFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TGoodsFunctionality___StdAmount(Functionality: TFunctionality): integer; stdcall;

function TGoodsFunctionality___StdMeasureUnit(Functionality: TFunctionality): string; stdcall;


{TTCollectionFunctionality}
function TTCollectionFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCollectionFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCollectionFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCollectionFunctionality___getName(Functionality: TFunctionality): string; stdcall;

function TTCollectionFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCollectionFunctionality}
procedure TCollectionFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall;

function TCollectionFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCollectionFunctionality___getName(Functionality: TFunctionality): string; stdcall;

procedure TCollectionFunctionality___setName(Functionality: TFunctionality;   const Value: string); stdcall;

function TCollectionFunctionality___getHint(Functionality: TFunctionality): string; stdcall;

function TCollectionFunctionality___InsertItem(Functionality: TFunctionality;   const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer; stdcall;

procedure TCollectionFunctionality___RemoveItem(Functionality: TFunctionality;   const id: integer); stdcall;

procedure TCollectionFunctionality___Item_ChangeAlias(Functionality: TFunctionality;   const id: integer; const pAlias: string); stdcall;

procedure TCollectionFunctionality___Item_ChangeListOrder(Functionality: TFunctionality;   const id: integer; const Order: integer); stdcall;

procedure TCollectionFunctionality___RemoveItems(Functionality: TFunctionality); stdcall;

function TCollectionFunctionality___IsItemExist(Functionality: TFunctionality;   const idTItem,idItem: integer): boolean; stdcall;

procedure TCollectionFunctionality___GetListItems(Functionality: TFunctionality;   out List: TByteArray); stdcall;

procedure TCollectionFunctionality___GetListItems1(Functionality: TFunctionality;   out List: TList); stdcall;

procedure TCollectionFunctionality___SaveListItems(Functionality: TFunctionality;   const List: TByteArray); stdcall;

procedure TCollectionFunctionality___SaveListItems1(Functionality: TFunctionality;   List: TList); stdcall;


