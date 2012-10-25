//. import types functionality routines implementations

{TTTileServerVisualizationFunctionality}
function TTTileServerVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTTileServerVisualizationFunctionality____CreateInstance(Self);
end;

function TTTileServerVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTileServerVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTileServerVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality.getName: string;
begin
Result:=TTTileServerVisualizationFunctionality___getName(Self);
end;

function TTTileServerVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTTileServerVisualizationFunctionality___getImage(Self);
end;

function TTTileServerVisualizationFunctionality___CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality.CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
Result:=TTTileServerVisualizationFunctionality___CheckImportInstance(Self,   ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTTileServerVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTTileServerVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TTileServerVisualizationFunctionality}
procedure TTileServerVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality._ToClone(out idClone: integer);
begin
TTileServerVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TTileServerVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.DestroyData;
begin
TTileServerVisualizationFunctionality___DestroyData(Self);
end;

procedure TTileServerVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.CloneData(out idClone: integer);
begin
TTileServerVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TTileServerVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TTileServerVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TTileServerVisualizationFunctionality___ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
begin
Result:=TTileServerVisualizationFunctionality___ReflectOnCanvas(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TTileServerVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTileServerVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTileServerVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.DATASize: integer;
begin
Result:=TTileServerVisualizationFunctionality___DATASize(Self);
end;

procedure TTileServerVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetParams(const pWidth: integer; const pHeight: integer);
begin
TTileServerVisualizationFunctionality___SetParams(Self,   pWidth,pHeight);
end;

procedure TTileServerVisualizationFunctionality___SetProportion(Functionality: TFunctionality;   const Value: double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetProportion(const Value: double);
begin
TTileServerVisualizationFunctionality___SetProportion(Self,   Value);
end;

procedure TTileServerVisualizationFunctionality___Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Clear;
begin
TTileServerVisualizationFunctionality___Clear(Self);
end;

function TTileServerVisualizationFunctionality___GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.GetSegmentsStorageType: integer;
begin
Result:=TTileServerVisualizationFunctionality___GetSegmentsStorageType(Self);
end;

procedure TTileServerVisualizationFunctionality___SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetSegmentsStorageType(Value: integer);
begin
TTileServerVisualizationFunctionality___SetSegmentsStorageType(Self,   Value);
end;

function TTileServerVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TTileServerVisualizationFunctionality___ContainerFilled(Self);
end;

procedure TTileServerVisualizationFunctionality___GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GetLevelsInfoLocally(out Info: TByteArray);
begin
TTileServerVisualizationFunctionality___GetLevelsInfoLocally(Self,   Info);
end;

function TTileServerVisualizationFunctionality___TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.TLevelsPropsPanel_Create: TForm;
begin
Result:=TTileServerVisualizationFunctionality___TLevelsPropsPanel_Create(Self);
end;

procedure TTileServerVisualizationFunctionality___Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_ConvertPixPosToXY(const idLevel: integer; const PixX,PixY: integer; out X,Y: double);
begin
TTileServerVisualizationFunctionality___Level_ConvertPixPosToXY(Self,   idLevel,PixX,PixY,X,Y);
end;

procedure TTileServerVisualizationFunctionality___Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_ConvertXYToPixPos(const idLevel: integer; const X,Y: double; out PixX,PixY: integer);
begin
TTileServerVisualizationFunctionality___Level_ConvertXYToPixPos(Self,   idLevel,X,Y,PixX,PixY);
end;

function TTileServerVisualizationFunctionality___UserData_GetTileProviderID(Functionality: TFunctionality;   out oTileProviderID: integer): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.UserData_GetTileProviderID(out oTileProviderID: integer): boolean;
begin
Result:=TTileServerVisualizationFunctionality___UserData_GetTileProviderID(Self,   oTileProviderID);
end;

procedure TTileServerVisualizationFunctionality___UserData_SetTileProviderID(Functionality: TFunctionality;   const pTileProviderID: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.UserData_SetTileProviderID(const pTileProviderID: integer);
begin
TTileServerVisualizationFunctionality___UserData_SetTileProviderID(Self,   pTileProviderID);
end;

function TTileServerVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TTileServerVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TTileServerVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.getName: string;
begin
Result:=TTileServerVisualizationFunctionality___getName(Self);
end;

function TTileServerVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.getHint: string;
begin
Result:=TTileServerVisualizationFunctionality___getHint(Self);
end;

procedure TTileServerVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GetParams(out oWidth: integer; out oHeight: integer);
begin
TTileServerVisualizationFunctionality___GetParams(Self,   oWidth,oHeight);
end;

procedure TTileServerVisualizationFunctionality___GetParams1(Functionality: TFunctionality;   out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GetParams1(out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer);
begin
TTileServerVisualizationFunctionality___GetParams1(Self,   oServerType,oServerURL,oServerData,oTileProviderID,oWidth,oHeight);
end;

procedure TTileServerVisualizationFunctionality___SetServerType(Functionality: TFunctionality;   const Value: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetServerType(const Value: integer);
begin
TTileServerVisualizationFunctionality___SetServerType(Self,   Value);
end;

procedure TTileServerVisualizationFunctionality___SetServerURL(Functionality: TFunctionality;   const Value: string); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetServerURL(const Value: string);
begin
TTileServerVisualizationFunctionality___SetServerURL(Self,   Value);
end;

procedure TTileServerVisualizationFunctionality___SetServerData(Functionality: TFunctionality;   const Data: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetServerData(const Data: TByteArray);
begin
TTileServerVisualizationFunctionality___SetServerData(Self,   Data);
end;

procedure TTileServerVisualizationFunctionality___SetServerData1(Functionality: TFunctionality;   const pData: TMemoryStream); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetServerData1(const pData: TMemoryStream);
begin
TTileServerVisualizationFunctionality___SetServerData1(Self,   pData);
end;

procedure TTileServerVisualizationFunctionality___GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GenerateFromImage(DATAStream: TByteArray);
begin
TTileServerVisualizationFunctionality___GenerateFromImage(Self,   DATAStream);
end;

procedure TTileServerVisualizationFunctionality___GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GenerateFromTiles(const TilesFolder: string; const SizePowerOf2: integer);
begin
TTileServerVisualizationFunctionality___GenerateFromTiles(Self,   TilesFolder,SizePowerOf2);
end;

procedure TTileServerVisualizationFunctionality___RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.RegenerateRegionFromLevel(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
TTileServerVisualizationFunctionality___RegenerateRegionFromLevel(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TTileServerVisualizationFunctionality___RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.RegenerateRegion(const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
TTileServerVisualizationFunctionality___RegenerateRegion(Self,   XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TTileServerVisualizationFunctionality___AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.AddNewLevelAndRegenerate;
begin
TTileServerVisualizationFunctionality___AddNewLevelAndRegenerate(Self);
end;

procedure TTileServerVisualizationFunctionality___GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GetLevelsInfo(out Info: TByteArray);
begin
TTileServerVisualizationFunctionality___GetLevelsInfo(Self,   Info);
end;

procedure TTileServerVisualizationFunctionality___Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_GetParams(const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double);
begin
TTileServerVisualizationFunctionality___Level_GetParams(Self,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TTileServerVisualizationFunctionality___Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_SetParams(const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double);
begin
TTileServerVisualizationFunctionality___Level_SetParams(Self,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TTileServerVisualizationFunctionality___Level_GetSegments(Functionality: TFunctionality;   const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_GetSegments(const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray);
begin
TTileServerVisualizationFunctionality___Level_GetSegments(Self,   TileProviderID,idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
end;

procedure TTileServerVisualizationFunctionality___Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_GetSegmentsByIDs(const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray);
begin
TTileServerVisualizationFunctionality___Level_GetSegmentsByIDs(Self,   idLevel,SegmentsIDs,Segments);
end;

procedure TTileServerVisualizationFunctionality___Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_GetSegmentsHashes(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray);
begin
TTileServerVisualizationFunctionality___Level_GetSegmentsHashes(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
end;

procedure TTileServerVisualizationFunctionality___Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_SetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray);
begin
TTileServerVisualizationFunctionality___Level_SetSegments(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
end;

procedure TTileServerVisualizationFunctionality___GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TTileServerVisualizationFunctionality___GetCoordinates(Self,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;


{TTMeasurementObjectFunctionality}
function TTMeasurementObjectFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality._CreateInstance: integer;
begin
Result:=TTMeasurementObjectFunctionality____CreateInstance(Self);
end;

procedure TTMeasurementObjectFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMeasurementObjectFunctionality._DestroyInstance(const idObj: integer);
begin
TTMeasurementObjectFunctionality____DestroyInstance(Self,   idObj);
end;

function TTMeasurementObjectFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMeasurementObjectFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMeasurementObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.getName: string;
begin
Result:=TTMeasurementObjectFunctionality___getName(Self);
end;

function TTMeasurementObjectFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.getImage: TTypeImage;
begin
Result:=TTMeasurementObjectFunctionality___getImage(Self);
end;

function TTMeasurementObjectFunctionality___CreateNewInstance(Functionality: TFunctionality;   const pName: string; const pDomains: string): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.CreateNewInstance(const pName: string; const pDomains: string): integer;
begin
Result:=TTMeasurementObjectFunctionality___CreateNewInstance(Self,   pName,pDomains);
end;

function TTMeasurementObjectFunctionality___CreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.CreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
begin
Result:=TTMeasurementObjectFunctionality___CreateInstanceByGUID(Self,   pGUID,pName,pDomains);
end;

function TTMeasurementObjectFunctionality___CheckCreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.CheckCreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
begin
Result:=TTMeasurementObjectFunctionality___CheckCreateInstanceByGUID(Self,   pGUID,pName,pDomains);
end;

procedure TTMeasurementObjectFunctionality___GetInstanceListByNameContext(Functionality: TFunctionality;   const pName: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMeasurementObjectFunctionality.GetInstanceListByNameContext(const pName: string; out List: TByteArray);
begin
TTMeasurementObjectFunctionality___GetInstanceListByNameContext(Self,   pName,List);
end;

procedure TTMeasurementObjectFunctionality___GetInstanceDataByNameContext(Functionality: TFunctionality;   const pName: string; const Version: integer; out oData: TByteArray); stdcall; external TypesDLL;
procedure TTMeasurementObjectFunctionality.GetInstanceDataByNameContext(const pName: string; const Version: integer; out oData: TByteArray);
begin
TTMeasurementObjectFunctionality___GetInstanceDataByNameContext(Self,   pName,Version,oData);
end;

function TTMeasurementObjectFunctionality___GetInstanceByGUID(Functionality: TFunctionality;   const pGUID: string): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.GetInstanceByGUID(const pGUID: string): integer;
begin
Result:=TTMeasurementObjectFunctionality___GetInstanceByGUID(Self,   pGUID);
end;

function TTMeasurementObjectFunctionality___GetInstanceByGSOMeasurement(Functionality: TFunctionality;   const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.GetInstanceByGSOMeasurement(const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer;
begin
Result:=TTMeasurementObjectFunctionality___GetInstanceByGSOMeasurement(Self,   pidGeographServerObject,pMeasurementTimeID);
end;


{TMeasurementObjectFunctionality}
procedure TMeasurementObjectFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality._ToClone(out idClone: integer);
begin
TMeasurementObjectFunctionality____ToClone(Self,   idClone);
end;

function TMeasurementObjectFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMeasurementObjectFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMeasurementObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality.getName: string;
begin
Result:=TMeasurementObjectFunctionality___getName(Self);
end;

procedure TMeasurementObjectFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.setName(Value: string);
begin
TMeasurementObjectFunctionality___setName(Self,   Value);
end;

function TMeasurementObjectFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality.getHint: string;
begin
Result:=TMeasurementObjectFunctionality___getHint(Self);
end;

function TMeasurementObjectFunctionality___getGUID(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality.getGUID: string;
begin
Result:=TMeasurementObjectFunctionality___getGUID(Self);
end;

function TMeasurementObjectFunctionality___getDomains(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality.getDomains: string;
begin
Result:=TMeasurementObjectFunctionality___getDomains(Self);
end;

procedure TMeasurementObjectFunctionality___setDomains(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.setDomains(Value: string);
begin
TMeasurementObjectFunctionality___setDomains(Self,   Value);
end;

procedure TMeasurementObjectFunctionality___GetParams(Functionality: TFunctionality;   out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GetParams(out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string);
begin
TMeasurementObjectFunctionality___GetParams(Self,   oGUID,oidOwner,oName,oDomains);
end;

procedure TMeasurementObjectFunctionality___GSOMeasurements_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GSOMeasurements_GetList(out List: TByteArray);
begin
TMeasurementObjectFunctionality___GSOMeasurements_GetList(Self,   List);
end;

procedure TMeasurementObjectFunctionality___GSOMeasurements_GetData(Functionality: TFunctionality;   const Version: integer; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GSOMeasurements_GetData(const Version: integer; out oData: TByteArray);
begin
TMeasurementObjectFunctionality___GSOMeasurements_GetData(Self,   Version,oData);
end;

procedure TMeasurementObjectFunctionality___GSOMeasurements_Item_GetParams(Functionality: TFunctionality;   const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GSOMeasurements_Item_GetParams(const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);
begin
TMeasurementObjectFunctionality___GSOMeasurements_Item_GetParams(Self,   idMeasurement,oTimeID,oidGeographServerObject,oDataType);
end;

procedure TMeasurementObjectFunctionality___GSOMeasurements_Item_GetParams1(Functionality: TFunctionality;   const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GSOMeasurements_Item_GetParams1(const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);
begin
TMeasurementObjectFunctionality___GSOMeasurements_Item_GetParams1(Self,   TimeID,oidGeographServerObject,oDataType);
end;

procedure TMeasurementObjectFunctionality___GSOMeasurements_Item_GetData(Functionality: TFunctionality;   const idMeasurement: integer; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GSOMeasurements_Item_GetData(const idMeasurement: integer; out oData: TByteArray);
begin
TMeasurementObjectFunctionality___GSOMeasurements_Item_GetData(Self,   idMeasurement,oData);
end;

procedure TMeasurementObjectFunctionality___GSOMeasurements_Item_GetData1(Functionality: TFunctionality;   const TimeID: Double; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GSOMeasurements_Item_GetData1(const TimeID: Double; out oData: TByteArray);
begin
TMeasurementObjectFunctionality___GSOMeasurements_Item_GetData1(Self,   TimeID,oData);
end;


{TTAreaNotificationServerFunctionality}
function TTAreaNotificationServerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTAreaNotificationServerFunctionality._CreateInstance: integer;
begin
Result:=TTAreaNotificationServerFunctionality____CreateInstance(Self);
end;

procedure TTAreaNotificationServerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTAreaNotificationServerFunctionality._DestroyInstance(const idObj: integer);
begin
TTAreaNotificationServerFunctionality____DestroyInstance(Self,   idObj);
end;

function TTAreaNotificationServerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTAreaNotificationServerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTAreaNotificationServerFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTAreaNotificationServerFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTAreaNotificationServerFunctionality.getName: string;
begin
Result:=TTAreaNotificationServerFunctionality___getName(Self);
end;

function TTAreaNotificationServerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTAreaNotificationServerFunctionality.getImage: TTypeImage;
begin
Result:=TTAreaNotificationServerFunctionality___getImage(Self);
end;


{TAreaNotificationServerFunctionality}
procedure TAreaNotificationServerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TAreaNotificationServerFunctionality._ToClone(out idClone: integer);
begin
TAreaNotificationServerFunctionality____ToClone(Self,   idClone);
end;

function TAreaNotificationServerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TAreaNotificationServerFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAreaNotificationServerFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality.getName: string;
begin
Result:=TAreaNotificationServerFunctionality___getName(Self);
end;

procedure TAreaNotificationServerFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TAreaNotificationServerFunctionality.setName(Value: string);
begin
TAreaNotificationServerFunctionality___setName(Self,   Value);
end;

function TAreaNotificationServerFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality.getHint: string;
begin
Result:=TAreaNotificationServerFunctionality___getHint(Self);
end;

function TAreaNotificationServerFunctionality___getInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality.getInfo: string;
begin
Result:=TAreaNotificationServerFunctionality___getInfo(Self);
end;

procedure TAreaNotificationServerFunctionality___setInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TAreaNotificationServerFunctionality.setInfo(Value: string);
begin
TAreaNotificationServerFunctionality___setInfo(Self,   Value);
end;


{TTMODELServerVisualizationFunctionality}
function TTMODELServerVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTMODELServerVisualizationFunctionality____CreateInstance(Self);
end;

function TTMODELServerVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMODELServerVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMODELServerVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality.getName: string;
begin
Result:=TTMODELServerVisualizationFunctionality___getName(Self);
end;

function TTMODELServerVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTMODELServerVisualizationFunctionality___getImage(Self);
end;

function TTMODELServerVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTMODELServerVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TMODELServerVisualizationFunctionality}
procedure TMODELServerVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMODELServerVisualizationFunctionality._ToClone(out idClone: integer);
begin
TMODELServerVisualizationFunctionality____ToClone(Self,   idClone);
end;

function TMODELServerVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMODELServerVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TMODELServerVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMODELServerVisualizationFunctionality.DestroyData;
begin
TMODELServerVisualizationFunctionality___DestroyData(Self);
end;

procedure TMODELServerVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMODELServerVisualizationFunctionality.CloneData(out idClone: integer);
begin
TMODELServerVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TMODELServerVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TMODELServerVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TMODELServerVisualizationFunctionality___ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
begin
Result:=TMODELServerVisualizationFunctionality___ReflectOnCanvas(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TMODELServerVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TMODELServerVisualizationFunctionality___ContainerFilled(Self);
end;

function TMODELServerVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TMODELServerVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TMODELServerVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.getName: string;
begin
Result:=TMODELServerVisualizationFunctionality___getName(Self);
end;

function TMODELServerVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.getHint: string;
begin
Result:=TMODELServerVisualizationFunctionality___getHint(Self);
end;

function TMODELServerVisualizationFunctionality___getServerURL(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.getServerURL: string;
begin
Result:=TMODELServerVisualizationFunctionality___getServerURL(Self);
end;

procedure TMODELServerVisualizationFunctionality___setServerURL(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELServerVisualizationFunctionality.setServerURL(Value: string);
begin
TMODELServerVisualizationFunctionality___setServerURL(Self,   Value);
end;


{TTDoubleVarFunctionality}
function TTDoubleVarFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDoubleVarFunctionality._CreateInstance: integer;
begin
Result:=TTDoubleVarFunctionality____CreateInstance(Self);
end;

procedure TTDoubleVarFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTDoubleVarFunctionality._DestroyInstance(const idObj: integer);
begin
TTDoubleVarFunctionality____DestroyInstance(Self,   idObj);
end;

function TTDoubleVarFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDoubleVarFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTDoubleVarFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTDoubleVarFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDoubleVarFunctionality.getName: string;
begin
Result:=TTDoubleVarFunctionality___getName(Self);
end;

function TTDoubleVarFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDoubleVarFunctionality.getImage: TTypeImage;
begin
Result:=TTDoubleVarFunctionality___getImage(Self);
end;


{TDoubleVarFunctionality}
procedure TDoubleVarFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDoubleVarFunctionality._ToClone(out idClone: integer);
begin
TDoubleVarFunctionality____ToClone(Self,   idClone);
end;

function TDoubleVarFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDoubleVarFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TDoubleVarFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDoubleVarFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDoubleVarFunctionality.getName: string;
begin
Result:=TDoubleVarFunctionality___getName(Self);
end;

function TDoubleVarFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDoubleVarFunctionality.getHint: string;
begin
Result:=TDoubleVarFunctionality___getHint(Self);
end;

function TDoubleVarFunctionality___getValue(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TDoubleVarFunctionality.getValue: Double;
begin
Result:=TDoubleVarFunctionality___getValue(Self);
end;

procedure TDoubleVarFunctionality___setValue(Functionality: TFunctionality;   _Value: Double); stdcall; external TypesDLL;
procedure TDoubleVarFunctionality.setValue(_Value: Double);
begin
TDoubleVarFunctionality___setValue(Self,   _Value);
end;

function TDoubleVarFunctionality___getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TDoubleVarFunctionality.getSetTimeStamp: TDateTime;
begin
Result:=TDoubleVarFunctionality___getSetTimeStamp(Self);
end;


{TTInt32VarFunctionality}
function TTInt32VarFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTInt32VarFunctionality._CreateInstance: integer;
begin
Result:=TTInt32VarFunctionality____CreateInstance(Self);
end;

procedure TTInt32VarFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTInt32VarFunctionality._DestroyInstance(const idObj: integer);
begin
TTInt32VarFunctionality____DestroyInstance(Self,   idObj);
end;

function TTInt32VarFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTInt32VarFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTInt32VarFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTInt32VarFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTInt32VarFunctionality.getName: string;
begin
Result:=TTInt32VarFunctionality___getName(Self);
end;

function TTInt32VarFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTInt32VarFunctionality.getImage: TTypeImage;
begin
Result:=TTInt32VarFunctionality___getImage(Self);
end;


{TInt32VarFunctionality}
procedure TInt32VarFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TInt32VarFunctionality._ToClone(out idClone: integer);
begin
TInt32VarFunctionality____ToClone(Self,   idClone);
end;

function TInt32VarFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TInt32VarFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TInt32VarFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TInt32VarFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TInt32VarFunctionality.getName: string;
begin
Result:=TInt32VarFunctionality___getName(Self);
end;

function TInt32VarFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TInt32VarFunctionality.getHint: string;
begin
Result:=TInt32VarFunctionality___getHint(Self);
end;

function TInt32VarFunctionality___getValue(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TInt32VarFunctionality.getValue: integer;
begin
Result:=TInt32VarFunctionality___getValue(Self);
end;

procedure TInt32VarFunctionality___setValue(Functionality: TFunctionality;   _Value: integer); stdcall; external TypesDLL;
procedure TInt32VarFunctionality.setValue(_Value: integer);
begin
TInt32VarFunctionality___setValue(Self,   _Value);
end;

function TInt32VarFunctionality___getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TInt32VarFunctionality.getSetTimeStamp: TDateTime;
begin
Result:=TInt32VarFunctionality___getSetTimeStamp(Self);
end;


{TTURLFunctionality}
function TTURLFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTURLFunctionality._CreateInstance: integer;
begin
Result:=TTURLFunctionality____CreateInstance(Self);
end;

procedure TTURLFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTURLFunctionality._DestroyInstance(const idObj: integer);
begin
TTURLFunctionality____DestroyInstance(Self,   idObj);
end;

function TTURLFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTURLFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTURLFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTURLFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTURLFunctionality.getName: string;
begin
Result:=TTURLFunctionality___getName(Self);
end;

function TTURLFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTURLFunctionality.getImage: TTypeImage;
begin
Result:=TTURLFunctionality___getImage(Self);
end;


{TURLFunctionality}
procedure TURLFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TURLFunctionality.UpdateDATA;
begin
TURLFunctionality___UpdateDATA(Self);
end;

procedure TURLFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TURLFunctionality._ToClone(out idClone: integer);
begin
TURLFunctionality____ToClone(Self,   idClone);
end;

function TURLFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TURLFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TURLFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TURLFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TURLFunctionality.getName: string;
begin
Result:=TURLFunctionality___getName(Self);
end;

function TURLFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TURLFunctionality.getHint: string;
begin
Result:=TURLFunctionality___getHint(Self);
end;

function TURLFunctionality___getURL(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TURLFunctionality.getURL: string;
begin
Result:=TURLFunctionality___getURL(Self);
end;

procedure TURLFunctionality___setURL(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TURLFunctionality.setURL(Value: string);
begin
TURLFunctionality___setURL(Self,   Value);
end;

function TURLFunctionality___getURLName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TURLFunctionality.getURLName: string;
begin
Result:=TURLFunctionality___getURLName(Self);
end;

procedure TURLFunctionality___setURLName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TURLFunctionality.setURLName(Value: string);
begin
TURLFunctionality___setURLName(Self,   Value);
end;

function TURLFunctionality___getflPanelBrowser(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TURLFunctionality.getflPanelBrowser: boolean;
begin
Result:=TURLFunctionality___getflPanelBrowser(Self);
end;

procedure TURLFunctionality___setflPanelBrowser(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TURLFunctionality.setflPanelBrowser(Value: boolean);
begin
TURLFunctionality___setflPanelBrowser(Self,   Value);
end;

procedure TURLFunctionality___GetParams(Functionality: TFunctionality;   out oURL: string; out oURLName: string; out oflPanelBrowser: boolean); stdcall; external TypesDLL;
procedure TURLFunctionality.GetParams(out oURL: string; out oURLName: string; out oflPanelBrowser: boolean);
begin
TURLFunctionality___GetParams(Self,   oURL,oURLName,oflPanelBrowser);
end;

procedure TURLFunctionality___SetParams(Functionality: TFunctionality;   const pURL: string; const pURLName: string; const pflPanelBrowser: boolean); stdcall; external TypesDLL;
procedure TURLFunctionality.SetParams(const pURL: string; const pURLName: string; const pflPanelBrowser: boolean);
begin
TURLFunctionality___SetParams(Self,   pURL,pURLName,pflPanelBrowser);
end;


{TTPatternVisualizationFunctionality}
function TTPatternVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTPatternVisualizationFunctionality____CreateInstance(Self);
end;

function TTPatternVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTPatternVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTPatternVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality.getName: string;
begin
Result:=TTPatternVisualizationFunctionality___getName(Self);
end;

function TTPatternVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTPatternVisualizationFunctionality___getImage(Self);
end;

function TTPatternVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTPatternVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TPatternVisualizationFunctionality}
procedure TPatternVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality._ToClone(out idClone: integer);
begin
TPatternVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TPatternVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.DestroyData;
begin
TPatternVisualizationFunctionality___DestroyData(Self);
end;

procedure TPatternVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.CloneData(out idClone: integer);
begin
TPatternVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TPatternVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TPatternVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

function TPatternVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TPatternVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TPatternVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TPatternVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPatternVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.DATASize: integer;
begin
Result:=TPatternVisualizationFunctionality___DATASize(Self);
end;

function TPatternVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TPatternVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TPatternVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.getName: string;
begin
Result:=TPatternVisualizationFunctionality___getName(Self);
end;

function TPatternVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.getHint: string;
begin
Result:=TPatternVisualizationFunctionality___getHint(Self);
end;

procedure TPatternVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TPatternVisualizationFunctionality___GetDATA(Self,   DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TPatternVisualizationFunctionality___GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TPatternVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TPatternVisualizationFunctionality___GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TPatternVisualizationFunctionality___GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TPatternVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TPatternVisualizationFunctionality___SetDATA(Self,   DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TPatternVisualizationFunctionality___SetDATA1(Self,   DATAStream,DATAType);
end;

function TPatternVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TPatternVisualizationFunctionality___getDATAFileID(Self);
end;

procedure TPatternVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TPatternVisualizationFunctionality___setDATAFileID(Self,   Value);
end;

procedure TPatternVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.DATAFile_Clear;
begin
TPatternVisualizationFunctionality___DATAFile_Clear(Self);
end;


{TTMapFormatObjectFunctionality}
function TTMapFormatObjectFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality._CreateInstance: integer;
begin
Result:=TTMapFormatObjectFunctionality____CreateInstance(Self);
end;

procedure TTMapFormatObjectFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMapFormatObjectFunctionality._DestroyInstance(const idObj: integer);
begin
TTMapFormatObjectFunctionality____DestroyInstance(Self,   idObj);
end;

function TTMapFormatObjectFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMapFormatObjectFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMapFormatObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality.getName: string;
begin
Result:=TTMapFormatObjectFunctionality___getName(Self);
end;

function TTMapFormatObjectFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality.getImage: TTypeImage;
begin
Result:=TTMapFormatObjectFunctionality___getImage(Self);
end;

procedure TTMapFormatObjectFunctionality___GetInstanceNames(Functionality: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); stdcall; external TypesDLL;
procedure TTMapFormatObjectFunctionality.GetInstanceNames(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList);
begin
TTMapFormatObjectFunctionality___GetInstanceNames(Self,   IDs,IDs_Offset,IDs_Size,Names);
end;

function TTMapFormatObjectFunctionality___GetDATAHash(Functionality: TFunctionality;   DATAStream: TByteArray): integer; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality.GetDATAHash(DATAStream: TByteArray): integer;
begin
Result:=TTMapFormatObjectFunctionality___GetDATAHash(Self,   DATAStream);
end;

function TTMapFormatObjectFunctionality___GetDATAHash1(Functionality: TFunctionality;   DATAStream: TMemoryStream): integer; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality.GetDATAHash1(DATAStream: TMemoryStream): integer;
begin
Result:=TTMapFormatObjectFunctionality___GetDATAHash1(Self,   DATAStream);
end;


{TMapFormatObjectFunctionality}
procedure TMapFormatObjectFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality._ToClone(out idClone: integer);
begin
TMapFormatObjectFunctionality____ToClone(Self,   idClone);
end;

function TMapFormatObjectFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMapFormatObjectFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMapFormatObjectFunctionality___DATAPanel_Create(Functionality: TFunctionality): TForm; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.DATAPanel_Create: TForm;
begin
Result:=TMapFormatObjectFunctionality___DATAPanel_Create(Self);
end;

function TMapFormatObjectFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TMapFormatObjectFunctionality___Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TMapFormatObjectFunctionality____GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Result:=TMapFormatObjectFunctionality____GetDataDocument(Self,   DataModel,DataType,flWithComponents,Document);
end;

function TMapFormatObjectFunctionality___GetHintInfo(Functionality: TFunctionality;   const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
begin
Result:=TMapFormatObjectFunctionality___GetHintInfo(Self,   InfoType,InfoFormat,HintInfo);
end;

function TMapFormatObjectFunctionality___getidMap(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.getidMap: integer;
begin
Result:=TMapFormatObjectFunctionality___getidMap(Self);
end;

procedure TMapFormatObjectFunctionality___setidMap(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.setidMap(Value: integer);
begin
TMapFormatObjectFunctionality___setidMap(Self,   Value);
end;

function TMapFormatObjectFunctionality___getFormatID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.getFormatID: integer;
begin
Result:=TMapFormatObjectFunctionality___getFormatID(Self);
end;

procedure TMapFormatObjectFunctionality___setFormatID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.setFormatID(Value: integer);
begin
TMapFormatObjectFunctionality___setFormatID(Self,   Value);
end;

function TMapFormatObjectFunctionality___getKindID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.getKindID: integer;
begin
Result:=TMapFormatObjectFunctionality___getKindID(Self);
end;

procedure TMapFormatObjectFunctionality___setKindID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.setKindID(Value: integer);
begin
TMapFormatObjectFunctionality___setKindID(Self,   Value);
end;

function TMapFormatObjectFunctionality___getTypeID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.getTypeID: integer;
begin
Result:=TMapFormatObjectFunctionality___getTypeID(Self);
end;

procedure TMapFormatObjectFunctionality___setTypeID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.setTypeID(Value: integer);
begin
TMapFormatObjectFunctionality___setTypeID(Self,   Value);
end;

function TMapFormatObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.getName: string;
begin
Result:=TMapFormatObjectFunctionality___getName(Self);
end;

procedure TMapFormatObjectFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.setName(Value: string);
begin
TMapFormatObjectFunctionality___setName(Self,   Value);
end;

procedure TMapFormatObjectFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.GetDATA(out DATAStream: TByteArray);
begin
TMapFormatObjectFunctionality___GetDATA(Self,   DATAStream);
end;

procedure TMapFormatObjectFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.GetDATA1(out DATAStream: TMemoryStream);
begin
TMapFormatObjectFunctionality___GetDATA1(Self,   DATAStream);
end;

procedure TMapFormatObjectFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.SetDATA(DATAStream: TByteArray);
begin
TMapFormatObjectFunctionality___SetDATA(Self,   DATAStream);
end;

procedure TMapFormatObjectFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.SetDATA1(DATAStream: TMemoryStream);
begin
TMapFormatObjectFunctionality___SetDATA1(Self,   DATAStream);
end;

function TMapFormatObjectFunctionality___getDATAHash(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.getDATAHash: integer;
begin
Result:=TMapFormatObjectFunctionality___getDATAHash(Self);
end;

procedure TMapFormatObjectFunctionality___setDATAHash(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.setDATAHash(Value: integer);
begin
TMapFormatObjectFunctionality___setDATAHash(Self,   Value);
end;

procedure TMapFormatObjectFunctionality___GetParams(Functionality: TFunctionality;   out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.GetParams(out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string);
begin
TMapFormatObjectFunctionality___GetParams(Self,   oidMap,oFormatID,oKindID,oTypeID,oName);
end;

procedure TMapFormatObjectFunctionality___SetParams(Functionality: TFunctionality;   const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.SetParams(const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string);
begin
TMapFormatObjectFunctionality___SetParams(Self,   pidMap,pFormatID,pKindID,pTypeID,pName);
end;

procedure TMapFormatObjectFunctionality___SetObjectByDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.SetObjectByDATA;
begin
TMapFormatObjectFunctionality___SetObjectByDATA(Self);
end;

procedure TMapFormatObjectFunctionality___UpdateDATAHash(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.UpdateDATAHash;
begin
TMapFormatObjectFunctionality___UpdateDATAHash(Self);
end;

procedure TMapFormatObjectFunctionality___Compile(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.Compile;
begin
TMapFormatObjectFunctionality___Compile(Self);
end;

procedure TMapFormatObjectFunctionality___Build(Functionality: TFunctionality;   const flUsePrototype: boolean); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.Build(const flUsePrototype: boolean);
begin
TMapFormatObjectFunctionality___Build(Self,   flUsePrototype);
end;


{TTMapFormatMapFunctionality}
function TTMapFormatMapFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMapFormatMapFunctionality._CreateInstance: integer;
begin
Result:=TTMapFormatMapFunctionality____CreateInstance(Self);
end;

procedure TTMapFormatMapFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMapFormatMapFunctionality._DestroyInstance(const idObj: integer);
begin
TTMapFormatMapFunctionality____DestroyInstance(Self,   idObj);
end;

function TTMapFormatMapFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMapFormatMapFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMapFormatMapFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMapFormatMapFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMapFormatMapFunctionality.getName: string;
begin
Result:=TTMapFormatMapFunctionality___getName(Self);
end;

function TTMapFormatMapFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMapFormatMapFunctionality.getImage: TTypeImage;
begin
Result:=TTMapFormatMapFunctionality___getImage(Self);
end;

procedure TTMapFormatMapFunctionality___GetInstanceListByGeoSpace(Functionality: TFunctionality;   const idGeoSpace: integer; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMapFormatMapFunctionality.GetInstanceListByGeoSpace(const idGeoSpace: integer; out List: TByteArray);
begin
TTMapFormatMapFunctionality___GetInstanceListByGeoSpace(Self,   idGeoSpace,List);
end;


{TMapFormatMapFunctionality}
procedure TMapFormatMapFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality._ToClone(out idClone: integer);
begin
TMapFormatMapFunctionality____ToClone(Self,   idClone);
end;

function TMapFormatMapFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMapFormatMapFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMapFormatMapFunctionality___getGeoSpaceID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.getGeoSpaceID: integer;
begin
Result:=TMapFormatMapFunctionality___getGeoSpaceID(Self);
end;

procedure TMapFormatMapFunctionality___setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.setGeoSpaceID(Value: integer);
begin
TMapFormatMapFunctionality___setGeoSpaceID(Self,   Value);
end;

function TMapFormatMapFunctionality___getFormatID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.getFormatID: integer;
begin
Result:=TMapFormatMapFunctionality___getFormatID(Self);
end;

procedure TMapFormatMapFunctionality___setFormatID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.setFormatID(Value: integer);
begin
TMapFormatMapFunctionality___setFormatID(Self,   Value);
end;

function TMapFormatMapFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.getName: string;
begin
Result:=TMapFormatMapFunctionality___getName(Self);
end;

procedure TMapFormatMapFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.setName(Value: string);
begin
TMapFormatMapFunctionality___setName(Self,   Value);
end;

procedure TMapFormatMapFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetDATA(out DATAStream: TByteArray);
begin
TMapFormatMapFunctionality___GetDATA(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetDATA1(out DATAStream: TMemoryStream);
begin
TMapFormatMapFunctionality___GetDATA1(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.SetDATA(DATAStream: TByteArray);
begin
TMapFormatMapFunctionality___SetDATA(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.SetDATA1(DATAStream: TMemoryStream);
begin
TMapFormatMapFunctionality___SetDATA1(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality___GetObjectPrototypesDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetObjectPrototypesDATA(out DATAStream: TByteArray);
begin
TMapFormatMapFunctionality___GetObjectPrototypesDATA(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality___GetObjectPrototypesDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetObjectPrototypesDATA1(out DATAStream: TMemoryStream);
begin
TMapFormatMapFunctionality___GetObjectPrototypesDATA1(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality___SetObjectPrototypesDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.SetObjectPrototypesDATA(DATAStream: TByteArray);
begin
TMapFormatMapFunctionality___SetObjectPrototypesDATA(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality___SetObjectPrototypesDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.SetObjectPrototypesDATA1(DATAStream: TMemoryStream);
begin
TMapFormatMapFunctionality___SetObjectPrototypesDATA1(Self,   DATAStream);
end;

function TMapFormatMapFunctionality___GetObjectPrototype(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.GetObjectPrototype(const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean;
begin
Result:=TMapFormatMapFunctionality___GetObjectPrototype(Self,   KindID,TypeID,PrototypeID,LayID);
end;

procedure TMapFormatMapFunctionality___GetParams(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oFormatID: integer; out oName: string); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetParams(out oGeoSpaceID: integer; out oFormatID: integer; out oName: string);
begin
TMapFormatMapFunctionality___GetParams(Self,   oGeoSpaceID,oFormatID,oName);
end;

procedure TMapFormatMapFunctionality___SetParams(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pFormatID: integer; const pName: string); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.SetParams(const pGeoSpaceID: integer; const pFormatID: integer; const pName: string);
begin
TMapFormatMapFunctionality___SetParams(Self,   pGeoSpaceID,pFormatID,pName);
end;

function TMapFormatMapFunctionality___ObjectsCounter(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.ObjectsCounter: integer;
begin
Result:=TMapFormatMapFunctionality___ObjectsCounter(Self);
end;

procedure TMapFormatMapFunctionality___GetObjectsList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetObjectsList(out List: TByteArray);
begin
TMapFormatMapFunctionality___GetObjectsList(Self,   List);
end;

procedure TMapFormatMapFunctionality___GetObjectsList1(Functionality: TFunctionality;   const KindID: integer; out List: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetObjectsList1(const KindID: integer; out List: TByteArray);
begin
TMapFormatMapFunctionality___GetObjectsList1(Self,   KindID,List);
end;

procedure TMapFormatMapFunctionality___GetObjectsList2(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out List: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetObjectsList2(const KindID: integer; const TypeID: integer; out List: TByteArray);
begin
TMapFormatMapFunctionality___GetObjectsList2(Self,   KindID,TypeID,List);
end;

procedure TMapFormatMapFunctionality___GetObjectsList3(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetObjectsList3(const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray);
begin
TMapFormatMapFunctionality___GetObjectsList3(Self,   KindID,TypeID,NameContext,List);
end;

function TMapFormatMapFunctionality___GetObject(Functionality: TFunctionality;   const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.GetObject(const DATAHash: integer; out idMapFormatObject: integer): boolean;
begin
Result:=TMapFormatMapFunctionality___GetObject(Self,   DATAHash,idMapFormatObject);
end;

function TMapFormatMapFunctionality___GetObject1(Functionality: TFunctionality;   const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.GetObject1(const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean;
begin
Result:=TMapFormatMapFunctionality___GetObject1(Self,   KindID,DATAHash,idMapFormatObject);
end;

procedure TMapFormatMapFunctionality___ExportMap(Functionality: TFunctionality;   const pFormatID: integer; out ZipData: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.ExportMap(const pFormatID: integer; out ZipData: TByteArray);
begin
TMapFormatMapFunctionality___ExportMap(Self,   pFormatID,ZipData);
end;

procedure TMapFormatMapFunctionality___RemoveObjects(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.RemoveObjects;
begin
TMapFormatMapFunctionality___RemoveObjects(Self);
end;

procedure TMapFormatMapFunctionality___RemoveObjects1(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.RemoveObjects1(const KindID: integer; const TypeID: integer);
begin
TMapFormatMapFunctionality___RemoveObjects1(Self,   KindID,TypeID);
end;

procedure TMapFormatMapFunctionality___UpdateObjectDATAHashes(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.UpdateObjectDATAHashes;
begin
TMapFormatMapFunctionality___UpdateObjectDATAHashes(Self);
end;

procedure TMapFormatMapFunctionality___RecalculateMapArea(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.RecalculateMapArea;
begin
TMapFormatMapFunctionality___RecalculateMapArea(Self);
end;

procedure TMapFormatMapFunctionality___RemoveIrrelevantObjectsInMapArea(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.RemoveIrrelevantObjectsInMapArea;
begin
TMapFormatMapFunctionality___RemoveIrrelevantObjectsInMapArea(Self);
end;


{TTSPLVisualizationFunctionality}
function TTSPLVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTSPLVisualizationFunctionality____CreateInstance(Self);
end;

function TTSPLVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTSPLVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTSPLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality.getName: string;
begin
Result:=TTSPLVisualizationFunctionality___getName(Self);
end;

function TTSPLVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTSPLVisualizationFunctionality___getImage(Self);
end;

function TTSPLVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTSPLVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TSPLVisualizationFunctionality}
procedure TSPLVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality._ToClone(out idClone: integer);
begin
TSPLVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TSPLVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality.DestroyData;
begin
TSPLVisualizationFunctionality___DestroyData(Self);
end;

procedure TSPLVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality.CloneData(out idClone: integer);
begin
TSPLVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TSPLVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TSPLVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TSPLVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSPLVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSPLVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TSPLVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TSPLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality.getName: string;
begin
Result:=TSPLVisualizationFunctionality___getName(Self);
end;

function TSPLVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality.getHint: string;
begin
Result:=TSPLVisualizationFunctionality___getHint(Self);
end;

procedure TSPLVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out SPLType: integer; out SPLDATA: TByteArray); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality.GetParams(out SPLType: integer; out SPLDATA: TByteArray);
begin
TSPLVisualizationFunctionality___GetParams(Self,   SPLType,SPLDATA);
end;

procedure TSPLVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const SPLType: integer; const SPLDATA: TByteArray); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality.SetParams(const SPLType: integer; const SPLDATA: TByteArray);
begin
TSPLVisualizationFunctionality___SetParams(Self,   SPLType,SPLDATA);
end;


{TTBoolVarFunctionality}
function TTBoolVarFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTBoolVarFunctionality._CreateInstance: integer;
begin
Result:=TTBoolVarFunctionality____CreateInstance(Self);
end;

procedure TTBoolVarFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTBoolVarFunctionality._DestroyInstance(const idObj: integer);
begin
TTBoolVarFunctionality____DestroyInstance(Self,   idObj);
end;

function TTBoolVarFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTBoolVarFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTBoolVarFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTBoolVarFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTBoolVarFunctionality.getName: string;
begin
Result:=TTBoolVarFunctionality___getName(Self);
end;

function TTBoolVarFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTBoolVarFunctionality.getImage: TTypeImage;
begin
Result:=TTBoolVarFunctionality___getImage(Self);
end;


{TBoolVarFunctionality}
procedure TBoolVarFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBoolVarFunctionality._ToClone(out idClone: integer);
begin
TBoolVarFunctionality____ToClone(Self,   idClone);
end;

function TBoolVarFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TBoolVarFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TBoolVarFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBoolVarFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBoolVarFunctionality.getName: string;
begin
Result:=TBoolVarFunctionality___getName(Self);
end;

function TBoolVarFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBoolVarFunctionality.getHint: string;
begin
Result:=TBoolVarFunctionality___getHint(Self);
end;

function TBoolVarFunctionality___getValue(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TBoolVarFunctionality.getValue: boolean;
begin
Result:=TBoolVarFunctionality___getValue(Self);
end;

procedure TBoolVarFunctionality___setValue(Functionality: TFunctionality;   _Value: boolean); stdcall; external TypesDLL;
procedure TBoolVarFunctionality.setValue(_Value: boolean);
begin
TBoolVarFunctionality___setValue(Self,   _Value);
end;

function TBoolVarFunctionality___getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TBoolVarFunctionality.getSetTimeStamp: TDateTime;
begin
Result:=TBoolVarFunctionality___getSetTimeStamp(Self);
end;


{TTGeoSpaceFunctionality}
function TTGeoSpaceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGeoSpaceFunctionality._CreateInstance: integer;
begin
Result:=TTGeoSpaceFunctionality____CreateInstance(Self);
end;

procedure TTGeoSpaceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTGeoSpaceFunctionality._DestroyInstance(const idObj: integer);
begin
TTGeoSpaceFunctionality____DestroyInstance(Self,   idObj);
end;

function TTGeoSpaceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeoSpaceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTGeoSpaceFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTGeoSpaceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeoSpaceFunctionality.getName: string;
begin
Result:=TTGeoSpaceFunctionality___getName(Self);
end;

function TTGeoSpaceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGeoSpaceFunctionality.getImage: TTypeImage;
begin
Result:=TTGeoSpaceFunctionality___getImage(Self);
end;


{TGeoSpaceFunctionality}
procedure TGeoSpaceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality._ToClone(out idClone: integer);
begin
TGeoSpaceFunctionality____ToClone(Self,   idClone);
end;

function TGeoSpaceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGeoSpaceFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGeoSpaceFunctionality___GetDatumIDLocally(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.GetDatumIDLocally: integer;
begin
Result:=TGeoSpaceFunctionality___GetDatumIDLocally(Self);
end;

function TGeoSpaceFunctionality___ConvertGeoToXYLocally(Functionality: TFunctionality;   const Lat,Long: Extended; out Xr,Yr: Extended): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.ConvertGeoToXYLocally(const Lat,Long: Extended; out Xr,Yr: Extended): boolean;
begin
Result:=TGeoSpaceFunctionality___ConvertGeoToXYLocally(Self,   Lat,Long,Xr,Yr);
end;

function TGeoSpaceFunctionality___ConvertXYToGeoLocally(Functionality: TFunctionality;   const X,Y: Extended; out Lat,Long: Extended): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.ConvertXYToGeoLocally(const X,Y: Extended; out Lat,Long: Extended): boolean;
begin
Result:=TGeoSpaceFunctionality___ConvertXYToGeoLocally(Self,   X,Y,Lat,Long);
end;

function TGeoSpaceFunctionality___GetDistanceBetweenTwoXYPointsLocally(Functionality: TFunctionality;   const X0,Y0,X1,Y1: Extended; out Distance: Extended): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.GetDistanceBetweenTwoXYPointsLocally(const X0,Y0,X1,Y1: Extended; out Distance: Extended): boolean;
begin
Result:=TGeoSpaceFunctionality___GetDistanceBetweenTwoXYPointsLocally(Self,   X0,Y0,X1,Y1,Distance);
end;

function TGeoSpaceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.getName: string;
begin
Result:=TGeoSpaceFunctionality___getName(Self);
end;

procedure TGeoSpaceFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.setName(Value: string);
begin
TGeoSpaceFunctionality___setName(Self,   Value);
end;

function TGeoSpaceFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.getHint: string;
begin
Result:=TGeoSpaceFunctionality___getHint(Self);
end;

function TGeoSpaceFunctionality___getDatumID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.getDatumID: integer;
begin
Result:=TGeoSpaceFunctionality___getDatumID(Self);
end;

procedure TGeoSpaceFunctionality___setDatumID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.setDatumID(Value: integer);
begin
TGeoSpaceFunctionality___setDatumID(Self,   Value);
end;

function TGeoSpaceFunctionality___getProjectionID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.getProjectionID: integer;
begin
Result:=TGeoSpaceFunctionality___getProjectionID(Self);
end;

procedure TGeoSpaceFunctionality___setProjectionID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.setProjectionID(Value: integer);
begin
TGeoSpaceFunctionality___setProjectionID(Self,   Value);
end;

function TGeoSpaceFunctionality___ConvertXYToLatLong(Functionality: TFunctionality;   const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.ConvertXYToLatLong(const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean;
begin
Result:=TGeoSpaceFunctionality___ConvertXYToLatLong(Self,   X,Y,Latitude,Longitude);
end;

function TGeoSpaceFunctionality___ConvertXYToDatumLatLong(Functionality: TFunctionality;   const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.ConvertXYToDatumLatLong(const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean;
begin
Result:=TGeoSpaceFunctionality___ConvertXYToDatumLatLong(Self,   X,Y,pDatumID,Latitude,Longitude);
end;

function TGeoSpaceFunctionality___ConvertLatLongToXY(Functionality: TFunctionality;   const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.ConvertLatLongToXY(const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
begin
Result:=TGeoSpaceFunctionality___ConvertLatLongToXY(Self,   Latitude,Longitude,X,Y);
end;

function TGeoSpaceFunctionality___ConvertDatumLatLongToXY(Functionality: TFunctionality;   const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.ConvertDatumLatLongToXY(const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
begin
Result:=TGeoSpaceFunctionality___ConvertDatumLatLongToXY(Self,   pDatumID,Latitude,Longitude,X,Y);
end;

procedure TGeoSpaceFunctionality___GetGeoCrdSystemList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.GetGeoCrdSystemList(out List: TByteArray);
begin
TGeoSpaceFunctionality___GetGeoCrdSystemList(Self,   List);
end;

procedure TGeoSpaceFunctionality___GetGeoCrdSystemList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.GetGeoCrdSystemList1(out List: TList);
begin
TGeoSpaceFunctionality___GetGeoCrdSystemList1(Self,   List);
end;

procedure TGeoSpaceFunctionality___GetMapFormatMapList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.GetMapFormatMapList(out List: TByteArray);
begin
TGeoSpaceFunctionality___GetMapFormatMapList(Self,   List);
end;

procedure TGeoSpaceFunctionality___GetMapFormatMapList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.GetMapFormatMapList1(out List: TList);
begin
TGeoSpaceFunctionality___GetMapFormatMapList1(Self,   List);
end;

procedure TGeoSpaceFunctionality___GetMapFormatMapObjectsByNameContext(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.GetMapFormatMapObjectsByNameContext(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray);
begin
TGeoSpaceFunctionality___GetMapFormatMapObjectsByNameContext(Self,   pFormatID,pKindID,pTypeID,NameContext,List);
end;

procedure TGeoSpaceFunctionality___GetMapFormatMapObjectsByNameContext1(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TList); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.GetMapFormatMapObjectsByNameContext1(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TList);
begin
TGeoSpaceFunctionality___GetMapFormatMapObjectsByNameContext1(Self,   pFormatID,pKindID,pTypeID,NameContext,List);
end;


{TTUserAlertFunctionality}
function TTUserAlertFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTUserAlertFunctionality._CreateInstance: integer;
begin
Result:=TTUserAlertFunctionality____CreateInstance(Self);
end;

procedure TTUserAlertFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTUserAlertFunctionality._DestroyInstance(const idObj: integer);
begin
TTUserAlertFunctionality____DestroyInstance(Self,   idObj);
end;

function TTUserAlertFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTUserAlertFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTUserAlertFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTUserAlertFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTUserAlertFunctionality.getName: string;
begin
Result:=TTUserAlertFunctionality___getName(Self);
end;

function TTUserAlertFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTUserAlertFunctionality.getImage: TTypeImage;
begin
Result:=TTUserAlertFunctionality___getImage(Self);
end;

procedure TTUserAlertFunctionality___GetActiveInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTUserAlertFunctionality.GetActiveInstanceList(out List: TByteArray);
begin
TTUserAlertFunctionality___GetActiveInstanceList(Self,   List);
end;

procedure TTUserAlertFunctionality___GetActiveInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTUserAlertFunctionality.GetActiveInstanceList1(out List: TList);
begin
TTUserAlertFunctionality___GetActiveInstanceList1(Self,   List);
end;


{TUserAlertFunctionality}
procedure TUserAlertFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TUserAlertFunctionality._ToClone(out idClone: integer);
begin
TUserAlertFunctionality____ToClone(Self,   idClone);
end;

function TUserAlertFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TUserAlertFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TUserAlertFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TUserAlertFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUserAlertFunctionality.getName: string;
begin
Result:=TUserAlertFunctionality___getName(Self);
end;

function TUserAlertFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUserAlertFunctionality.getHint: string;
begin
Result:=TUserAlertFunctionality___getHint(Self);
end;

function TUserAlertFunctionality___getUserID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TUserAlertFunctionality.getUserID: integer;
begin
Result:=TUserAlertFunctionality___getUserID(Self);
end;

procedure TUserAlertFunctionality___setUserID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.setUserID(Value: integer);
begin
TUserAlertFunctionality___setUserID(Self,   Value);
end;

function TUserAlertFunctionality___getTimeStamp(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TUserAlertFunctionality.getTimeStamp: TDateTime;
begin
Result:=TUserAlertFunctionality___getTimeStamp(Self);
end;

procedure TUserAlertFunctionality___setTimeStamp(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.setTimeStamp(Value: TDateTime);
begin
TUserAlertFunctionality___setTimeStamp(Self,   Value);
end;

function TUserAlertFunctionality___getActive(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TUserAlertFunctionality.getActive: boolean;
begin
Result:=TUserAlertFunctionality___getActive(Self);
end;

procedure TUserAlertFunctionality___setActive(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.setActive(Value: boolean);
begin
TUserAlertFunctionality___setActive(Self,   Value);
end;

function TUserAlertFunctionality___getAlertID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TUserAlertFunctionality.getAlertID: integer;
begin
Result:=TUserAlertFunctionality___getAlertID(Self);
end;

procedure TUserAlertFunctionality___setAlertID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.setAlertID(Value: integer);
begin
TUserAlertFunctionality___setAlertID(Self,   Value);
end;

function TUserAlertFunctionality___getSeverity(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TUserAlertFunctionality.getSeverity: integer;
begin
Result:=TUserAlertFunctionality___getSeverity(Self);
end;

procedure TUserAlertFunctionality___setSeverity(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.setSeverity(Value: integer);
begin
TUserAlertFunctionality___setSeverity(Self,   Value);
end;

function TUserAlertFunctionality___getDescription(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUserAlertFunctionality.getDescription: string;
begin
Result:=TUserAlertFunctionality___getDescription(Self);
end;

procedure TUserAlertFunctionality___setDescription(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.setDescription(Value: string);
begin
TUserAlertFunctionality___setDescription(Self,   Value);
end;

procedure TUserAlertFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.GetDATA(out DATAStream: TByteArray);
begin
TUserAlertFunctionality___GetDATA(Self,   DATAStream);
end;

procedure TUserAlertFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.GetDATA1(out DATAStream: TMemoryStream);
begin
TUserAlertFunctionality___GetDATA1(Self,   DATAStream);
end;

procedure TUserAlertFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.SetDATA(DATAStream: TByteArray);
begin
TUserAlertFunctionality___SetDATA(Self,   DATAStream);
end;

procedure TUserAlertFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.SetDATA1(DATAStream: TMemoryStream);
begin
TUserAlertFunctionality___SetDATA1(Self,   DATAStream);
end;


{TTGeoGraphServerObjectFunctionality}
function TTGeoGraphServerObjectFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality._CreateInstance: integer;
begin
Result:=TTGeoGraphServerObjectFunctionality____CreateInstance(Self);
end;

procedure TTGeoGraphServerObjectFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTGeoGraphServerObjectFunctionality._DestroyInstance(const idObj: integer);
begin
TTGeoGraphServerObjectFunctionality____DestroyInstance(Self,   idObj);
end;

function TTGeoGraphServerObjectFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTGeoGraphServerObjectFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTGeoGraphServerObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality.getName: string;
begin
Result:=TTGeoGraphServerObjectFunctionality___getName(Self);
end;

function TTGeoGraphServerObjectFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality.getImage: TTypeImage;
begin
Result:=TTGeoGraphServerObjectFunctionality___getImage(Self);
end;

function TTGeoGraphServerObjectFunctionality___GetInstanceByServerObject(Functionality: TFunctionality;   const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality.GetInstanceByServerObject(const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean;
begin
Result:=TTGeoGraphServerObjectFunctionality___GetInstanceByServerObject(Self,   pGeoGraphServerID,pObjectID,idInstance);
end;


{TGeoGraphServerObjectFunctionality}
procedure TGeoGraphServerObjectFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality._ToClone(out idClone: integer);
begin
TGeoGraphServerObjectFunctionality____ToClone(Self,   idClone);
end;

function TGeoGraphServerObjectFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGeoGraphServerObjectFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TGeoGraphServerObjectFunctionality___AttachObject(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.AttachObject;
begin
TGeoGraphServerObjectFunctionality___AttachObject(Self);
end;

procedure TGeoGraphServerObjectFunctionality___DetachObject(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.DetachObject;
begin
TGeoGraphServerObjectFunctionality___DetachObject(Self);
end;

function TGeoGraphServerObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.getName: string;
begin
Result:=TGeoGraphServerObjectFunctionality___getName(Self);
end;

function TGeoGraphServerObjectFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.getHint: string;
begin
Result:=TGeoGraphServerObjectFunctionality___getHint(Self);
end;

function TGeoGraphServerObjectFunctionality___getGeoGraphServerID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.getGeoGraphServerID: integer;
begin
Result:=TGeoGraphServerObjectFunctionality___getGeoGraphServerID(Self);
end;

procedure TGeoGraphServerObjectFunctionality___setGeoGraphServerID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.setGeoGraphServerID(Value: integer);
begin
TGeoGraphServerObjectFunctionality___setGeoGraphServerID(Self,   Value);
end;

function TGeoGraphServerObjectFunctionality___getObjectID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.getObjectID: integer;
begin
Result:=TGeoGraphServerObjectFunctionality___getObjectID(Self);
end;

procedure TGeoGraphServerObjectFunctionality___setObjectID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.setObjectID(Value: integer);
begin
TGeoGraphServerObjectFunctionality___setObjectID(Self,   Value);
end;

function TGeoGraphServerObjectFunctionality___getBusinessModelID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.getBusinessModelID: integer;
begin
Result:=TGeoGraphServerObjectFunctionality___getBusinessModelID(Self);
end;

procedure TGeoGraphServerObjectFunctionality___setBusinessModelID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.setBusinessModelID(Value: integer);
begin
TGeoGraphServerObjectFunctionality___setBusinessModelID(Self,   Value);
end;

function TGeoGraphServerObjectFunctionality___getDomains(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.getDomains: string;
begin
Result:=TGeoGraphServerObjectFunctionality___getDomains(Self);
end;

procedure TGeoGraphServerObjectFunctionality___setDomains(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.setDomains(Value: string);
begin
TGeoGraphServerObjectFunctionality___setDomains(Self,   Value);
end;

procedure TGeoGraphServerObjectFunctionality___GetParams(Functionality: TFunctionality;   out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.GetParams(out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer);
begin
TGeoGraphServerObjectFunctionality___GetParams(Self,   oGeoGraphServerID,oObjectID,oObjectType,oBusinessModel);
end;

procedure TGeoGraphServerObjectFunctionality___ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
begin
TGeoGraphServerObjectFunctionality___ExecuteOperation(Self,   InData,OutData);
end;

function TGeoGraphServerObjectFunctionality___GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
begin
Result:=TGeoGraphServerObjectFunctionality___GetVisualizationComponent(Self,   idTVisualization,idVisualization);
end;

function TGeoGraphServerObjectFunctionality___GetNearestMapFormatObjects(Functionality: TFunctionality;   const MaxDistance: double; out List: TByteArray): boolean; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.GetNearestMapFormatObjects(const MaxDistance: double; out List: TByteArray): boolean;
begin
Result:=TGeoGraphServerObjectFunctionality___GetNearestMapFormatObjects(Self,   MaxDistance,List);
end;

function TGeoGraphServerObjectFunctionality___GetNearestMapFormatObjectsNames(Functionality: TFunctionality;   const MaxDistance: double; out Names: WideString): boolean; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.GetNearestMapFormatObjectsNames(const MaxDistance: double; out Names: WideString): boolean;
begin
Result:=TGeoGraphServerObjectFunctionality___GetNearestMapFormatObjectsNames(Self,   MaxDistance,Names);
end;

function TGeoGraphServerObjectFunctionality___Measurements_AddNew(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.Measurements_AddNew(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer;
begin
Result:=TGeoGraphServerObjectFunctionality___Measurements_AddNew(Self,   pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pData);
end;

function TGeoGraphServerObjectFunctionality___Measurements_AddNew1(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.Measurements_AddNew1(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer;
begin
Result:=TGeoGraphServerObjectFunctionality___Measurements_AddNew1(Self,   pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pDataSource,pData);
end;

procedure TGeoGraphServerObjectFunctionality___Measurements_Remove(Functionality: TFunctionality;   const pidMeasurement: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.Measurements_Remove(const pidMeasurement: integer);
begin
TGeoGraphServerObjectFunctionality___Measurements_Remove(Self,   pidMeasurement);
end;

procedure TGeoGraphServerObjectFunctionality___Measurements_Item_UpdateData(Functionality: TFunctionality;   const pTimeID: Double; const pData: TByteArray); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.Measurements_Item_UpdateData(const pTimeID: Double; const pData: TByteArray);
begin
TGeoGraphServerObjectFunctionality___Measurements_Item_UpdateData(Self,   pTimeID,pData);
end;


{TTGeoGraphServerFunctionality}
function TTGeoGraphServerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality._CreateInstance: integer;
begin
Result:=TTGeoGraphServerFunctionality____CreateInstance(Self);
end;

procedure TTGeoGraphServerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTGeoGraphServerFunctionality._DestroyInstance(const idObj: integer);
begin
TTGeoGraphServerFunctionality____DestroyInstance(Self,   idObj);
end;

function TTGeoGraphServerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTGeoGraphServerFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTGeoGraphServerFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality.getName: string;
begin
Result:=TTGeoGraphServerFunctionality___getName(Self);
end;

function TTGeoGraphServerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality.getImage: TTypeImage;
begin
Result:=TTGeoGraphServerFunctionality___getImage(Self);
end;

procedure TTGeoGraphServerFunctionality___GetActiveInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTGeoGraphServerFunctionality.GetActiveInstanceList(out List: TByteArray);
begin
TTGeoGraphServerFunctionality___GetActiveInstanceList(Self,   List);
end;

procedure TTGeoGraphServerFunctionality___GetActiveInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTGeoGraphServerFunctionality.GetActiveInstanceList1(out List: TList);
begin
TTGeoGraphServerFunctionality___GetActiveInstanceList1(Self,   List);
end;

function TTGeoGraphServerFunctionality___GetInstanceForRegistration(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality.GetInstanceForRegistration: integer;
begin
Result:=TTGeoGraphServerFunctionality___GetInstanceForRegistration(Self);
end;


{TGeoGraphServerFunctionality}
procedure TGeoGraphServerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality._ToClone(out idClone: integer);
begin
TGeoGraphServerFunctionality____ToClone(Self,   idClone);
end;

function TGeoGraphServerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGeoGraphServerFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TGeoGraphServerFunctionality___SetData(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.SetData(DATAStream: TMemoryStream);
begin
TGeoGraphServerFunctionality___SetData(Self,   DATAStream);
end;

function TGeoGraphServerFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.getName: string;
begin
Result:=TGeoGraphServerFunctionality___getName(Self);
end;

procedure TGeoGraphServerFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.setName(Value: string);
begin
TGeoGraphServerFunctionality___setName(Self,   Value);
end;

function TGeoGraphServerFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.getHint: string;
begin
Result:=TGeoGraphServerFunctionality___getHint(Self);
end;

function TGeoGraphServerFunctionality___getAddress(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.getAddress: string;
begin
Result:=TGeoGraphServerFunctionality___getAddress(Self);
end;

procedure TGeoGraphServerFunctionality___setAddress(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.setAddress(Value: string);
begin
TGeoGraphServerFunctionality___setAddress(Self,   Value);
end;

function TGeoGraphServerFunctionality___getInternalAddress(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.getInternalAddress: string;
begin
Result:=TGeoGraphServerFunctionality___getInternalAddress(Self);
end;

procedure TGeoGraphServerFunctionality___setInternalAddress(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.setInternalAddress(Value: string);
begin
TGeoGraphServerFunctionality___setInternalAddress(Self,   Value);
end;

function TGeoGraphServerFunctionality___getInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.getInfo: string;
begin
Result:=TGeoGraphServerFunctionality___getInfo(Self);
end;

procedure TGeoGraphServerFunctionality___setInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.setInfo(Value: string);
begin
TGeoGraphServerFunctionality___setInfo(Self,   Value);
end;

procedure TGeoGraphServerFunctionality___GetData(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.GetData(out DATAStream: TByteArray);
begin
TGeoGraphServerFunctionality___GetData(Self,   DATAStream);
end;

procedure TGeoGraphServerFunctionality___GetData1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.GetData1(out DATAStream: TMemoryStream);
begin
TGeoGraphServerFunctionality___GetData1(Self,   DATAStream);
end;

function TGeoGraphServerFunctionality___RegisterObject(Functionality: TFunctionality;   const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.RegisterObject(const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;
begin
Result:=TGeoGraphServerFunctionality___RegisterObject(Self,   ObjectName,VisualizationType,VisualizationID,GeoCrdSystemID,HintID);
end;

function TGeoGraphServerFunctionality___RegisterObject1(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.RegisterObject1(const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;
begin
Result:=TGeoGraphServerFunctionality___RegisterObject1(Self,   ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,GeoCrdSystemID,HintID);
end;

function TGeoGraphServerFunctionality___RegisterObject2(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.RegisterObject2(const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer;
begin
Result:=TGeoGraphServerFunctionality___RegisterObject2(Self,   ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality___UnRegisterObject(Functionality: TFunctionality;   const ObjectID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.UnRegisterObject(const ObjectID: integer);
begin
TGeoGraphServerFunctionality___UnRegisterObject(Self,   ObjectID);
end;

function TGeoGraphServerFunctionality___ObjectCounter(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.ObjectCounter: integer;
begin
Result:=TGeoGraphServerFunctionality___ObjectCounter(Self);
end;

procedure TGeoGraphServerFunctionality___ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
begin
TGeoGraphServerFunctionality___ExecuteOperation(Self,   InData,OutData);
end;

procedure TGeoGraphServerFunctionality___Object_GetProperties(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_GetProperties(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer);
begin
TGeoGraphServerFunctionality___Object_GetProperties(Self,   ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
end;

procedure TGeoGraphServerFunctionality___Object_GetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_GetProperties1(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer);
begin
TGeoGraphServerFunctionality___Object_GetProperties1(Self,   ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality___Object_SetProperties(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_SetProperties(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer);
begin
TGeoGraphServerFunctionality___Object_SetProperties(Self,   ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
end;

procedure TGeoGraphServerFunctionality___Object_SetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_SetProperties1(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer);
begin
TGeoGraphServerFunctionality___Object_SetProperties1(Self,   ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

function TGeoGraphServerFunctionality___Object_GetObjectType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.Object_GetObjectType(const ObjectID: integer): integer;
begin
Result:=TGeoGraphServerFunctionality___Object_GetObjectType(Self,   ObjectID);
end;

procedure TGeoGraphServerFunctionality___Object_SetObjectType(Functionality: TFunctionality;   const ObjectID: integer; const ObjectType: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_SetObjectType(const ObjectID: integer; const ObjectType: integer);
begin
TGeoGraphServerFunctionality___Object_SetObjectType(Self,   ObjectID,ObjectType);
end;

function TGeoGraphServerFunctionality___Object_GetBusinessType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.Object_GetBusinessType(const ObjectID: integer): integer;
begin
Result:=TGeoGraphServerFunctionality___Object_GetBusinessType(Self,   ObjectID);
end;

procedure TGeoGraphServerFunctionality___Object_SetBusinessType(Functionality: TFunctionality;   const ObjectID: integer; const BusinessType: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_SetBusinessType(const ObjectID: integer; const BusinessType: integer);
begin
TGeoGraphServerFunctionality___Object_SetBusinessType(Self,   ObjectID,BusinessType);
end;

function TGeoGraphServerFunctionality___Object_GetComponentID(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.Object_GetComponentID(const ObjectID: integer): integer;
begin
Result:=TGeoGraphServerFunctionality___Object_GetComponentID(Self,   ObjectID);
end;

procedure TGeoGraphServerFunctionality___Object_SetComponentID(Functionality: TFunctionality;   const ObjectID: integer; const ObjectComponentID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_SetComponentID(const ObjectID: integer; const ObjectComponentID: integer);
begin
TGeoGraphServerFunctionality___Object_SetComponentID(Self,   ObjectID,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality___Object_ExecuteOperation(Functionality: TFunctionality;   const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_ExecuteOperation(const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray);
begin
TGeoGraphServerFunctionality___Object_ExecuteOperation(Self,   ObjectID,InData,OutData);
end;

function TGeoGraphServerFunctionality___DataID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.DataID: integer;
begin
Result:=TGeoGraphServerFunctionality___DataID(Self);
end;


{TTGeoCrdSystemFunctionality}
function TTGeoCrdSystemFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGeoCrdSystemFunctionality._CreateInstance: integer;
begin
Result:=TTGeoCrdSystemFunctionality____CreateInstance(Self);
end;

procedure TTGeoCrdSystemFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality._DestroyInstance(const idObj: integer);
begin
TTGeoCrdSystemFunctionality____DestroyInstance(Self,   idObj);
end;

function TTGeoCrdSystemFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeoCrdSystemFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTGeoCrdSystemFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTGeoCrdSystemFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeoCrdSystemFunctionality.getName: string;
begin
Result:=TTGeoCrdSystemFunctionality___getName(Self);
end;

function TTGeoCrdSystemFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGeoCrdSystemFunctionality.getImage: TTypeImage;
begin
Result:=TTGeoCrdSystemFunctionality___getImage(Self);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceByLatLongLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceByLatLongLocally(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
begin
TTGeoCrdSystemFunctionality___GetInstanceByLatLongLocally(Self,   pGeoSpaceID,pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceByLatLongLocally1(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceByLatLongLocally1(const pLatitude,pLongitude: double; out oGeoSpaceID: integer; out idCrdSys: integer);
begin
TTGeoCrdSystemFunctionality___GetInstanceByLatLongLocally1(Self,   pLatitude,pLongitude,oGeoSpaceID,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceByXYLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceByXYLocally(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
begin
TTGeoCrdSystemFunctionality___GetInstanceByXYLocally(Self,   pGeoSpaceID,pX,pY,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceByXYLocally1(Functionality: TFunctionality;   const pX,pY: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceByXYLocally1(const pX,pY: double; out oGeoSpaceID: integer; out idCrdSys: integer);
begin
TTGeoCrdSystemFunctionality___GetInstanceByXYLocally1(Self,   pX,pY,oGeoSpaceID,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceList(out List: TByteArray);
begin
TTGeoCrdSystemFunctionality___GetInstanceList(Self,   List);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceList1(out List: TList);
begin
TTGeoCrdSystemFunctionality___GetInstanceList1(Self,   List);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceByLatLong(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceByLatLong(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
begin
TTGeoCrdSystemFunctionality___GetInstanceByLatLong(Self,   pGeoSpaceID,pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality___GetInstanceByXY(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceByXY(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
begin
TTGeoCrdSystemFunctionality___GetInstanceByXY(Self,   pGeoSpaceID,pX,pY,idCrdSys);
end;


{TGeoCrdSystemFunctionality}
procedure TGeoCrdSystemFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality._ToClone(out idClone: integer);
begin
TGeoCrdSystemFunctionality____ToClone(Self,   idClone);
end;

function TGeoCrdSystemFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGeoCrdSystemFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TGeoCrdSystemFunctionality___GetDataLocally(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oName: string; out oDatum: string; out oProjection: string; out oProjectionData: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.GetDataLocally(out oGeoSpaceID: integer; out oName: string; out oDatum: string; out oProjection: string; out oProjectionData: TMemoryStream);
begin
TGeoCrdSystemFunctionality___GetDataLocally(Self,   oGeoSpaceID,oName,oDatum,oProjection,oProjectionData);
end;

procedure TGeoCrdSystemFunctionality___GetGeodesyPointsLocally(Functionality: TFunctionality;   out Points: TByteArray); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.GetGeodesyPointsLocally(out Points: TByteArray);
begin
TGeoCrdSystemFunctionality___GetGeodesyPointsLocally(Self,   Points);
end;

function TGeoCrdSystemFunctionality___getGeoSpaceID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality.getGeoSpaceID: integer;
begin
Result:=TGeoCrdSystemFunctionality___getGeoSpaceID(Self);
end;

procedure TGeoCrdSystemFunctionality___setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.setGeoSpaceID(Value: integer);
begin
TGeoCrdSystemFunctionality___setGeoSpaceID(Self,   Value);
end;

function TGeoCrdSystemFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality.getName: string;
begin
Result:=TGeoCrdSystemFunctionality___getName(Self);
end;

procedure TGeoCrdSystemFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.setName(Value: string);
begin
TGeoCrdSystemFunctionality___setName(Self,   Value);
end;

function TGeoCrdSystemFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality.getHint: string;
begin
Result:=TGeoCrdSystemFunctionality___getHint(Self);
end;

function TGeoCrdSystemFunctionality___getDatum(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality.getDatum: string;
begin
Result:=TGeoCrdSystemFunctionality___getDatum(Self);
end;

procedure TGeoCrdSystemFunctionality___setDatum(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.setDatum(Value: string);
begin
TGeoCrdSystemFunctionality___setDatum(Self,   Value);
end;

function TGeoCrdSystemFunctionality___getProjection(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality.getProjection: string;
begin
Result:=TGeoCrdSystemFunctionality___getProjection(Self);
end;

procedure TGeoCrdSystemFunctionality___setProjection(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.setProjection(Value: string);
begin
TGeoCrdSystemFunctionality___setProjection(Self,   Value);
end;

procedure TGeoCrdSystemFunctionality___GetProjectionDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.GetProjectionDATA(out DATAStream: TByteArray);
begin
TGeoCrdSystemFunctionality___GetProjectionDATA(Self,   DATAStream);
end;

procedure TGeoCrdSystemFunctionality___GetProjectionDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.GetProjectionDATA1(out DATAStream: TMemoryStream);
begin
TGeoCrdSystemFunctionality___GetProjectionDATA1(Self,   DATAStream);
end;

procedure TGeoCrdSystemFunctionality___SetProjectionDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.SetProjectionDATA(DATAStream: TByteArray);
begin
TGeoCrdSystemFunctionality___SetProjectionDATA(Self,   DATAStream);
end;

procedure TGeoCrdSystemFunctionality___SetProjectionDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.SetProjectionDATA1(DATAStream: TMemoryStream);
begin
TGeoCrdSystemFunctionality___SetProjectionDATA1(Self,   DATAStream);
end;

procedure TGeoCrdSystemFunctionality___GetGeodesyPoints(Functionality: TFunctionality;   out Points: TByteArray); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.GetGeodesyPoints(out Points: TByteArray);
begin
TGeoCrdSystemFunctionality___GetGeodesyPoints(Self,   Points);
end;


{TTFilterVisualizationFunctionality}
function TTFilterVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTFilterVisualizationFunctionality____CreateInstance(Self);
end;

function TTFilterVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTFilterVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTFilterVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality.getName: string;
begin
Result:=TTFilterVisualizationFunctionality___getName(Self);
end;

function TTFilterVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTFilterVisualizationFunctionality___getImage(Self);
end;

function TTFilterVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTFilterVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TFilterVisualizationFunctionality}
procedure TFilterVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality._ToClone(out idClone: integer);
begin
TFilterVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TFilterVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality.DestroyData;
begin
TFilterVisualizationFunctionality___DestroyData(Self);
end;

procedure TFilterVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality.CloneData(out idClone: integer);
begin
TFilterVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TFilterVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TFilterVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TFilterVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TFilterVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TFilterVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TFilterVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TFilterVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality.getName: string;
begin
Result:=TFilterVisualizationFunctionality___getName(Self);
end;

function TFilterVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality.getHint: string;
begin
Result:=TFilterVisualizationFunctionality___getHint(Self);
end;

procedure TFilterVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out FilterType: integer; out FilterDATA: TByteArray); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality.GetParams(out FilterType: integer; out FilterDATA: TByteArray);
begin
TFilterVisualizationFunctionality___GetParams(Self,   FilterType,FilterDATA);
end;

procedure TFilterVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const FilterType: integer; const FilterDATA: TByteArray); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality.SetParams(const FilterType: integer; const FilterDATA: TByteArray);
begin
TFilterVisualizationFunctionality___SetParams(Self,   FilterType,FilterDATA);
end;


{TTHINTVisualizationFunctionality}
function TTHINTVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTHINTVisualizationFunctionality____CreateInstance(Self);
end;

function TTHINTVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHINTVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHINTVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality.getName: string;
begin
Result:=TTHINTVisualizationFunctionality___getName(Self);
end;

function TTHINTVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTHINTVisualizationFunctionality___getImage(Self);
end;

function TTHINTVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTHINTVisualizationFunctionality___StdObjectVisualization(Self);
end;

procedure TTHINTVisualizationFunctionality___GetInstanceParams(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall; external TypesDLL;
procedure TTHINTVisualizationFunctionality.GetInstanceParams(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
begin
TTHINTVisualizationFunctionality___GetInstanceParams(Self,   IDs,MaxInstanceSize,Params);
end;

procedure TTHINTVisualizationFunctionality___GetInstanceParams1(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall; external TypesDLL;
procedure TTHINTVisualizationFunctionality.GetInstanceParams1(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
begin
TTHINTVisualizationFunctionality___GetInstanceParams1(Self,   IDs,MaxInstanceSize,Params);
end;

procedure TTHINTVisualizationFunctionality___GetInstanceOwnerDatasAndParams(Functionality: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray); stdcall; external TypesDLL;
procedure TTHINTVisualizationFunctionality.GetInstanceOwnerDatasAndParams(const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray);
begin
TTHINTVisualizationFunctionality___GetInstanceOwnerDatasAndParams(Self,   IDs,DataFlags,MaxInstanceSize,Data,Params);
end;


{THINTVisualizationFunctionality}
procedure THINTVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality._ToClone(out idClone: integer);
begin
THINTVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure THINTVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.DestroyData;
begin
THINTVisualizationFunctionality___DestroyData(Self);
end;

procedure THINTVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.CloneData(out idClone: integer);
begin
THINTVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure THINTVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
THINTVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

function THINTVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=THINTVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function THINTVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=THINTVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THINTVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.DATASize: integer;
begin
Result:=THINTVisualizationFunctionality___DATASize(Self);
end;

function THINTVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=THINTVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function THINTVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.getName: string;
begin
Result:=THINTVisualizationFunctionality___getName(Self);
end;

function THINTVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.getHint: string;
begin
Result:=THINTVisualizationFunctionality___getHint(Self);
end;

procedure THINTVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
THINTVisualizationFunctionality___GetDATA(Self,   DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
THINTVisualizationFunctionality___GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure THINTVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
THINTVisualizationFunctionality___GetDATA2(Self,   DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
THINTVisualizationFunctionality___GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure THINTVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
THINTVisualizationFunctionality___SetDATA(Self,   DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
THINTVisualizationFunctionality___SetDATA1(Self,   DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality___GetPrivateDATA(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetPrivateDATA(out DATAStream: TByteArray);
begin
THINTVisualizationFunctionality___GetPrivateDATA(Self,   DATAStream);
end;

procedure THINTVisualizationFunctionality___GetPrivateDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetPrivateDATA1(out DATAStream: TByteArray; const MaxSize: integer);
begin
THINTVisualizationFunctionality___GetPrivateDATA1(Self,   DATAStream,MaxSize);
end;

procedure THINTVisualizationFunctionality___GetPrivateDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetPrivateDATA2(out DATAStream: TMemoryStream);
begin
THINTVisualizationFunctionality___GetPrivateDATA2(Self,   DATAStream);
end;

procedure THINTVisualizationFunctionality___GetPrivateDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetPrivateDATA3(out DATAStream: TMemoryStream; const MaxSize: integer);
begin
THINTVisualizationFunctionality___GetPrivateDATA3(Self,   DATAStream,MaxSize);
end;

procedure THINTVisualizationFunctionality___SetPrivateDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.SetPrivateDATA(DATAStream: TByteArray);
begin
THINTVisualizationFunctionality___SetPrivateDATA(Self,   DATAStream);
end;

procedure THINTVisualizationFunctionality___SetPrivateDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.SetPrivateDATA1(DATAStream: TMemoryStream);
begin
THINTVisualizationFunctionality___SetPrivateDATA1(Self,   DATAStream);
end;

function THINTVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=THINTVisualizationFunctionality___getDATAFileID(Self);
end;

procedure THINTVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.setDATAFileID(Value: integer);
begin
THINTVisualizationFunctionality___setDATAFileID(Self,   Value);
end;

procedure THINTVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.DATAFile_Clear;
begin
THINTVisualizationFunctionality___DATAFile_Clear(Self);
end;


{TTDetailedPictureVisualizationFunctionality}
function TTDetailedPictureVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTDetailedPictureVisualizationFunctionality____CreateInstance(Self);
end;

function TTDetailedPictureVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTDetailedPictureVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTDetailedPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality.getName: string;
begin
Result:=TTDetailedPictureVisualizationFunctionality___getName(Self);
end;

function TTDetailedPictureVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTDetailedPictureVisualizationFunctionality___getImage(Self);
end;

function TTDetailedPictureVisualizationFunctionality___CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality.CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
Result:=TTDetailedPictureVisualizationFunctionality___CheckImportInstance(Self,   ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTDetailedPictureVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTDetailedPictureVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TDetailedPictureVisualizationFunctionality}
procedure TDetailedPictureVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality._ToClone(out idClone: integer);
begin
TDetailedPictureVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TDetailedPictureVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.DestroyData;
begin
TDetailedPictureVisualizationFunctionality___DestroyData(Self);
end;

procedure TDetailedPictureVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.CloneData(out idClone: integer);
begin
TDetailedPictureVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TDetailedPictureVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TDetailedPictureVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TDetailedPictureVisualizationFunctionality___ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
begin
Result:=TDetailedPictureVisualizationFunctionality___ReflectOnCanvas(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TDetailedPictureVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TDetailedPictureVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDetailedPictureVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.DATASize: integer;
begin
Result:=TDetailedPictureVisualizationFunctionality___DATASize(Self);
end;

procedure TDetailedPictureVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.SetParams(const pWidth: integer; const pHeight: integer);
begin
TDetailedPictureVisualizationFunctionality___SetParams(Self,   pWidth,pHeight);
end;

procedure TDetailedPictureVisualizationFunctionality___SetProportion(Functionality: TFunctionality;   const Value: double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.SetProportion(const Value: double);
begin
TDetailedPictureVisualizationFunctionality___SetProportion(Self,   Value);
end;

procedure TDetailedPictureVisualizationFunctionality___Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Clear;
begin
TDetailedPictureVisualizationFunctionality___Clear(Self);
end;

function TDetailedPictureVisualizationFunctionality___GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.GetSegmentsStorageType: integer;
begin
Result:=TDetailedPictureVisualizationFunctionality___GetSegmentsStorageType(Self);
end;

procedure TDetailedPictureVisualizationFunctionality___SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.SetSegmentsStorageType(Value: integer);
begin
TDetailedPictureVisualizationFunctionality___SetSegmentsStorageType(Self,   Value);
end;

function TDetailedPictureVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TDetailedPictureVisualizationFunctionality___ContainerFilled(Self);
end;

procedure TDetailedPictureVisualizationFunctionality___GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.GetLevelsInfoLocally(out Info: TByteArray);
begin
TDetailedPictureVisualizationFunctionality___GetLevelsInfoLocally(Self,   Info);
end;

function TDetailedPictureVisualizationFunctionality___TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.TLevelsPropsPanel_Create: TForm;
begin
Result:=TDetailedPictureVisualizationFunctionality___TLevelsPropsPanel_Create(Self);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_ConvertPixPosToXY(const idLevel: integer; const PixX,PixY: integer; out X,Y: double);
begin
TDetailedPictureVisualizationFunctionality___Level_ConvertPixPosToXY(Self,   idLevel,PixX,PixY,X,Y);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_ConvertXYToPixPos(const idLevel: integer; const X,Y: double; out PixX,PixY: integer);
begin
TDetailedPictureVisualizationFunctionality___Level_ConvertXYToPixPos(Self,   idLevel,X,Y,PixX,PixY);
end;

function TDetailedPictureVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TDetailedPictureVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TDetailedPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.getName: string;
begin
Result:=TDetailedPictureVisualizationFunctionality___getName(Self);
end;

function TDetailedPictureVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.getHint: string;
begin
Result:=TDetailedPictureVisualizationFunctionality___getHint(Self);
end;

procedure TDetailedPictureVisualizationFunctionality___GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.GenerateFromImage(DATAStream: TByteArray);
begin
TDetailedPictureVisualizationFunctionality___GenerateFromImage(Self,   DATAStream);
end;

procedure TDetailedPictureVisualizationFunctionality___GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.GenerateFromTiles(const TilesFolder: string; const SizePowerOf2: integer);
begin
TDetailedPictureVisualizationFunctionality___GenerateFromTiles(Self,   TilesFolder,SizePowerOf2);
end;

procedure TDetailedPictureVisualizationFunctionality___RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.RegenerateRegionFromLevel(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
TDetailedPictureVisualizationFunctionality___RegenerateRegionFromLevel(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TDetailedPictureVisualizationFunctionality___RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.RegenerateRegion(const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
TDetailedPictureVisualizationFunctionality___RegenerateRegion(Self,   XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TDetailedPictureVisualizationFunctionality___AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.AddNewLevelAndRegenerate;
begin
TDetailedPictureVisualizationFunctionality___AddNewLevelAndRegenerate(Self);
end;

procedure TDetailedPictureVisualizationFunctionality___GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.GetLevelsInfo(out Info: TByteArray);
begin
TDetailedPictureVisualizationFunctionality___GetLevelsInfo(Self,   Info);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_GetParams(const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double);
begin
TDetailedPictureVisualizationFunctionality___Level_GetParams(Self,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_SetParams(const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double);
begin
TDetailedPictureVisualizationFunctionality___Level_SetParams(Self,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_GetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_GetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray);
begin
TDetailedPictureVisualizationFunctionality___Level_GetSegments(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_GetSegmentsByIDs(const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray);
begin
TDetailedPictureVisualizationFunctionality___Level_GetSegmentsByIDs(Self,   idLevel,SegmentsIDs,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_GetSegmentsHashes(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray);
begin
TDetailedPictureVisualizationFunctionality___Level_GetSegmentsHashes(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
end;

procedure TDetailedPictureVisualizationFunctionality___Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_SetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray);
begin
TDetailedPictureVisualizationFunctionality___Level_SetSegments(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.GetParams(out oWidth: integer; out oHeight: integer);
begin
TDetailedPictureVisualizationFunctionality___GetParams(Self,   oWidth,oHeight);
end;

procedure TDetailedPictureVisualizationFunctionality___GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TDetailedPictureVisualizationFunctionality___GetCoordinates(Self,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;


{TTCoVisualizationFunctionality}
function TTCoVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTCoVisualizationFunctionality____CreateInstance(Self);
end;

function TTCoVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCoVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCoVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality.getName: string;
begin
Result:=TTCoVisualizationFunctionality___getName(Self);
end;

function TTCoVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTCoVisualizationFunctionality___getImage(Self);
end;

function TTCoVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTCoVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TCoVisualizationFunctionality}
procedure TCoVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality._ToClone(out idClone: integer);
begin
TCoVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TCoVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.DestroyData;
begin
TCoVisualizationFunctionality___DestroyData(Self);
end;

procedure TCoVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.CloneData(out idClone: integer);
begin
TCoVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TCoVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TCoVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

function TCoVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TCoVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TCoVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCoVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.DATASize: integer;
begin
Result:=TCoVisualizationFunctionality___DATASize(Self);
end;

procedure TCoVisualizationFunctionality___UpdateContainer(Functionality: TFunctionality;   out oContainer: TExtendedContainerCoord); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.UpdateContainer(out oContainer: TExtendedContainerCoord);
begin
TCoVisualizationFunctionality___UpdateContainer(Self,   oContainer);
end;

procedure TCoVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.DATAFile_Clear;
begin
TCoVisualizationFunctionality___DATAFile_Clear(Self);
end;

function TCoVisualizationFunctionality___GetOwnSpaceHINTVisualizationLocally(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.GetOwnSpaceHINTVisualizationLocally(out idHINTVisualization: integer): boolean;
begin
Result:=TCoVisualizationFunctionality___GetOwnSpaceHINTVisualizationLocally(Self,   idHINTVisualization);
end;

procedure TCoVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.ToClone(out idClone: integer);
begin
TCoVisualizationFunctionality___ToClone(Self,   idClone);
end;

function TCoVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TCoVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TCoVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.getName: string;
begin
Result:=TCoVisualizationFunctionality___getName(Self);
end;

function TCoVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.getHint: string;
begin
Result:=TCoVisualizationFunctionality___getHint(Self);
end;

procedure TCoVisualizationFunctionality___GetSpace(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.GetSpace(out DATAStream: TByteArray);
begin
TCoVisualizationFunctionality___GetSpace(Self,   DATAStream);
end;

procedure TCoVisualizationFunctionality___GetSpace1(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.GetSpace1(out DATAStream: TByteArray; const MaxSize: integer);
begin
TCoVisualizationFunctionality___GetSpace1(Self,   DATAStream,MaxSize);
end;

procedure TCoVisualizationFunctionality___GetSpace2(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.GetSpace2(out DATAStream: TMemoryStream);
begin
TCoVisualizationFunctionality___GetSpace2(Self,   DATAStream);
end;

procedure TCoVisualizationFunctionality___GetSpace3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.GetSpace3(out DATAStream: TMemoryStream; const MaxSize: integer);
begin
TCoVisualizationFunctionality___GetSpace3(Self,   DATAStream,MaxSize);
end;

procedure TCoVisualizationFunctionality___SetSpace(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.SetSpace(DATAStream: TByteArray);
begin
TCoVisualizationFunctionality___SetSpace(Self,   DATAStream);
end;

procedure TCoVisualizationFunctionality___SetSpace1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.SetSpace1(DATAStream: TMemoryStream);
begin
TCoVisualizationFunctionality___SetSpace1(Self,   DATAStream);
end;

function TCoVisualizationFunctionality___GetOwnSpaceHINTVisualization(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.GetOwnSpaceHINTVisualization(out idHINTVisualization: integer): boolean;
begin
Result:=TCoVisualizationFunctionality___GetOwnSpaceHINTVisualization(Self,   idHINTVisualization);
end;

function TCoVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TCoVisualizationFunctionality___getDATAFileID(Self);
end;

procedure TCoVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TCoVisualizationFunctionality___setDATAFileID(Self,   Value);
end;

procedure TCoVisualizationFunctionality___Pack(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.Pack;
begin
TCoVisualizationFunctionality___Pack(Self);
end;

procedure TCoVisualizationFunctionality___UnPack(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.UnPack;
begin
TCoVisualizationFunctionality___UnPack(Self);
end;

function TCoVisualizationFunctionality___IsPacked(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.IsPacked: boolean;
begin
Result:=TCoVisualizationFunctionality___IsPacked(Self);
end;


{TTForumMessageFunctionality}
function TTForumMessageFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTForumMessageFunctionality._CreateInstance: integer;
begin
Result:=TTForumMessageFunctionality____CreateInstance(Self);
end;

procedure TTForumMessageFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTForumMessageFunctionality._DestroyInstance(const idObj: integer);
begin
TTForumMessageFunctionality____DestroyInstance(Self,   idObj);
end;

function TTForumMessageFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTForumMessageFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTForumMessageFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTForumMessageFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTForumMessageFunctionality.getName: string;
begin
Result:=TTForumMessageFunctionality___getName(Self);
end;

function TTForumMessageFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTForumMessageFunctionality.getImage: TTypeImage;
begin
Result:=TTForumMessageFunctionality___getImage(Self);
end;


{TForumMessageFunctionality}
procedure TForumMessageFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.UpdateDATA;
begin
TForumMessageFunctionality___UpdateDATA(Self);
end;

procedure TForumMessageFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TForumMessageFunctionality._ToClone(out idClone: integer);
begin
TForumMessageFunctionality____ToClone(Self,   idClone);
end;

function TForumMessageFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TForumMessageFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TForumMessageFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TForumMessageFunctionality___FunctionalityUserID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumMessageFunctionality.FunctionalityUserID: integer;
begin
Result:=TForumMessageFunctionality___FunctionalityUserID(Self);
end;

procedure TForumMessageFunctionality___setidUser(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.setidUser(Value: integer);
begin
TForumMessageFunctionality___setidUser(Self,   Value);
end;

procedure TForumMessageFunctionality___Modified(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.Modified;
begin
TForumMessageFunctionality___Modified(Self);
end;

function TForumMessageFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TForumMessageFunctionality.getName: string;
begin
Result:=TForumMessageFunctionality___getName(Self);
end;

function TForumMessageFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TForumMessageFunctionality.getHint: string;
begin
Result:=TForumMessageFunctionality___getHint(Self);
end;

function TForumMessageFunctionality___getidForum(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumMessageFunctionality.getidForum: integer;
begin
Result:=TForumMessageFunctionality___getidForum(Self);
end;

procedure TForumMessageFunctionality___setidForum(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.setidForum(Value: integer);
begin
TForumMessageFunctionality___setidForum(Self,   Value);
end;

function TForumMessageFunctionality___idUser(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumMessageFunctionality.idUser: integer;
begin
Result:=TForumMessageFunctionality___idUser(Self);
end;

procedure TForumMessageFunctionality___Send(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.Send;
begin
TForumMessageFunctionality___Send(Self);
end;

function TForumMessageFunctionality___SentTime(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TForumMessageFunctionality.SentTime: TDateTime;
begin
Result:=TForumMessageFunctionality___SentTime(Self);
end;

function TForumMessageFunctionality___getidForMessage(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumMessageFunctionality.getidForMessage: integer;
begin
Result:=TForumMessageFunctionality___getidForMessage(Self);
end;

procedure TForumMessageFunctionality___setidForMessage(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.setidForMessage(Value: integer);
begin
TForumMessageFunctionality___setidForMessage(Self,   Value);
end;

function TForumMessageFunctionality___LastModified(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TForumMessageFunctionality.LastModified: TDateTime;
begin
Result:=TForumMessageFunctionality___LastModified(Self);
end;

procedure TForumMessageFunctionality___GetMessage(Functionality: TFunctionality;   out Message: TByteArray); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.GetMessage(out Message: TByteArray);
begin
TForumMessageFunctionality___GetMessage(Self,   Message);
end;

procedure TForumMessageFunctionality___GetMessage1(Functionality: TFunctionality;   out Message: TMemoryStream); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.GetMessage1(out Message: TMemoryStream);
begin
TForumMessageFunctionality___GetMessage1(Self,   Message);
end;

procedure TForumMessageFunctionality___SetMessage(Functionality: TFunctionality;   const Message: TByteArray); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.SetMessage(const Message: TByteArray);
begin
TForumMessageFunctionality___SetMessage(Self,   Message);
end;

procedure TForumMessageFunctionality___SetMessage1(Functionality: TFunctionality;   const Message: TMemoryStream); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.SetMessage1(const Message: TMemoryStream);
begin
TForumMessageFunctionality___SetMessage1(Self,   Message);
end;

function TForumMessageFunctionality___ReplyMessageCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumMessageFunctionality.ReplyMessageCount: integer;
begin
Result:=TForumMessageFunctionality___ReplyMessageCount(Self);
end;

procedure TForumMessageFunctionality___GetReplyMessageList(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.GetReplyMessageList(out MessageList: TByteArray);
begin
TForumMessageFunctionality___GetReplyMessageList(Self,   MessageList);
end;

procedure TForumMessageFunctionality___GetReplyMessageList1(Functionality: TFunctionality;   out MessageList: TList); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.GetReplyMessageList1(out MessageList: TList);
begin
TForumMessageFunctionality___GetReplyMessageList1(Self,   MessageList);
end;


{TTForumFunctionality}
function TTForumFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTForumFunctionality._CreateInstance: integer;
begin
Result:=TTForumFunctionality____CreateInstance(Self);
end;

procedure TTForumFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTForumFunctionality._DestroyInstance(const idObj: integer);
begin
TTForumFunctionality____DestroyInstance(Self,   idObj);
end;

function TTForumFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTForumFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTForumFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTForumFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTForumFunctionality.getName: string;
begin
Result:=TTForumFunctionality___getName(Self);
end;

function TTForumFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTForumFunctionality.getImage: TTypeImage;
begin
Result:=TTForumFunctionality___getImage(Self);
end;


{TForumFunctionality}
procedure TForumFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TForumFunctionality._ToClone(out idClone: integer);
begin
TForumFunctionality____ToClone(Self,   idClone);
end;

function TForumFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TForumFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TForumFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TForumFunctionality___DeleteOldMessages(Functionality: TFunctionality;   const pMessageLifeTime: TDateTime); stdcall; external TypesDLL;
procedure TForumFunctionality.DeleteOldMessages(const pMessageLifeTime: TDateTime);
begin
TForumFunctionality___DeleteOldMessages(Self,   pMessageLifeTime);
end;

function TForumFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TForumFunctionality.getName: string;
begin
Result:=TForumFunctionality___getName(Self);
end;

procedure TForumFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TForumFunctionality.setName(Value: string);
begin
TForumFunctionality___setName(Self,   Value);
end;

function TForumFunctionality___getMessageLifeTime(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TForumFunctionality.getMessageLifeTime: TDateTime;
begin
Result:=TForumFunctionality___getMessageLifeTime(Self);
end;

procedure TForumFunctionality___setMessageLifeTime(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
procedure TForumFunctionality.setMessageLifeTime(Value: TDateTime);
begin
TForumFunctionality___setMessageLifeTime(Self,   Value);
end;

function TForumFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TForumFunctionality.getHint: string;
begin
Result:=TForumFunctionality___getHint(Self);
end;

function TForumFunctionality___RootMessageCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumFunctionality.RootMessageCount: integer;
begin
Result:=TForumFunctionality___RootMessageCount(Self);
end;

procedure TForumFunctionality___GetRootMessageList(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TForumFunctionality.GetRootMessageList(out MessageList: TByteArray);
begin
TForumFunctionality___GetRootMessageList(Self,   MessageList);
end;

procedure TForumFunctionality___GetRootMessageList1(Functionality: TFunctionality;   out MessageList: TList); stdcall; external TypesDLL;
procedure TForumFunctionality.GetRootMessageList1(out MessageList: TList);
begin
TForumFunctionality___GetRootMessageList1(Self,   MessageList);
end;

function TForumFunctionality___MessageCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumFunctionality.MessageCount: integer;
begin
Result:=TForumFunctionality___MessageCount(Self);
end;

procedure TForumFunctionality___GetMessageList(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TForumFunctionality.GetMessageList(out MessageList: TByteArray);
begin
TForumFunctionality___GetMessageList(Self,   MessageList);
end;

procedure TForumFunctionality___GetMessageList1(Functionality: TFunctionality;   out MessageList: TList); stdcall; external TypesDLL;
procedure TForumFunctionality.GetMessageList1(out MessageList: TList);
begin
TForumFunctionality___GetMessageList1(Self,   MessageList);
end;

function TForumFunctionality___AddMessage(Functionality: TFunctionality;   const pidUser: integer; const pidForMessage: integer): integer; stdcall; external TypesDLL;
function TForumFunctionality.AddMessage(const pidUser: integer; const pidForMessage: integer): integer;
begin
Result:=TForumFunctionality___AddMessage(Self,   pidUser,pidForMessage);
end;

procedure TForumFunctionality___DestroyMessage(Functionality: TFunctionality;   const pidMessage: integer); stdcall; external TypesDLL;
procedure TForumFunctionality.DestroyMessage(const pidMessage: integer);
begin
TForumFunctionality___DestroyMessage(Self,   pidMessage);
end;


{TTCUSTOMVisualizationFunctionality}
function TTCUSTOMVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTCUSTOMVisualizationFunctionality____CreateInstance(Self);
end;

function TTCUSTOMVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCUSTOMVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCUSTOMVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality.getName: string;
begin
Result:=TTCUSTOMVisualizationFunctionality___getName(Self);
end;

function TTCUSTOMVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTCUSTOMVisualizationFunctionality___getImage(Self);
end;

function TTCUSTOMVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTCUSTOMVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TCUSTOMVisualizationFunctionality}
procedure TCUSTOMVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality._ToClone(out idClone: integer);
begin
TCUSTOMVisualizationFunctionality____ToClone(Self,   idClone);
end;

function TCUSTOMVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCUSTOMVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TCUSTOMVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality.DestroyData;
begin
TCUSTOMVisualizationFunctionality___DestroyData(Self);
end;

procedure TCUSTOMVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality.CloneData(out idClone: integer);
begin
TCUSTOMVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TCUSTOMVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TCUSTOMVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TCUSTOMVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TCUSTOMVisualizationFunctionality___ContainerFilled(Self);
end;

function TCUSTOMVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TCUSTOMVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TCUSTOMVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.getName: string;
begin
Result:=TCUSTOMVisualizationFunctionality___getName(Self);
end;

function TCUSTOMVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.getHint: string;
begin
Result:=TCUSTOMVisualizationFunctionality___getHint(Self);
end;

function TCUSTOMVisualizationFunctionality___getMODULEName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.getMODULEName: string;
begin
Result:=TCUSTOMVisualizationFunctionality___getMODULEName(Self);
end;

procedure TCUSTOMVisualizationFunctionality___setMODULEName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality.setMODULEName(Value: string);
begin
TCUSTOMVisualizationFunctionality___setMODULEName(Self,   Value);
end;

function TCUSTOMVisualizationFunctionality___getFunctionName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.getFunctionName: string;
begin
Result:=TCUSTOMVisualizationFunctionality___getFunctionName(Self);
end;

procedure TCUSTOMVisualizationFunctionality___setFunctionName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality.setFunctionName(Value: string);
begin
TCUSTOMVisualizationFunctionality___setFunctionName(Self,   Value);
end;

function TCUSTOMVisualizationFunctionality___getFunctionVersion(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.getFunctionVersion: integer;
begin
Result:=TCUSTOMVisualizationFunctionality___getFunctionVersion(Self);
end;

procedure TCUSTOMVisualizationFunctionality___setFunctionVersion(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality.setFunctionVersion(Value: integer);
begin
TCUSTOMVisualizationFunctionality___setFunctionVersion(Self,   Value);
end;

procedure TCUSTOMVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality.GetParams(out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer);
begin
TCUSTOMVisualizationFunctionality___GetParams(Self,   oMODULEName,oFunctionName,oFunctionVersion);
end;


{TTOLEVisualizationFunctionality}
function TTOLEVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTOLEVisualizationFunctionality____CreateInstance(Self);
end;

function TTOLEVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOLEVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOLEVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality.getName: string;
begin
Result:=TTOLEVisualizationFunctionality___getName(Self);
end;

function TTOLEVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTOLEVisualizationFunctionality___getImage(Self);
end;

function TTOLEVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTOLEVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TOLEVisualizationFunctionality}
procedure TOLEVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality._ToClone(out idClone: integer);
begin
TOLEVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TOLEVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.DestroyData;
begin
TOLEVisualizationFunctionality___DestroyData(Self);
end;

procedure TOLEVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.CloneData(out idClone: integer);
begin
TOLEVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TOLEVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOLEVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TOLEVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TOLEVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

procedure TOLEVisualizationFunctionality___SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.SaveToFile(const FileName: string);
begin
TOLEVisualizationFunctionality___SaveToFile(Self,   FileName);
end;

procedure TOLEVisualizationFunctionality___EditDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.EditDATA;
begin
TOLEVisualizationFunctionality___EditDATA(Self);
end;

function TOLEVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TOLEVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOLEVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality.DATASize: integer;
begin
Result:=TOLEVisualizationFunctionality___DATASize(Self);
end;

function TOLEVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOLEVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TOLEVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality.getName: string;
begin
Result:=TOLEVisualizationFunctionality___getName(Self);
end;

function TOLEVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality.getHint: string;
begin
Result:=TOLEVisualizationFunctionality___getHint(Self);
end;

procedure TOLEVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.GetDATA(out Value: TByteArray);
begin
TOLEVisualizationFunctionality___GetDATA(Self,   Value);
end;

procedure TOLEVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.GetDATA1(out Value: TByteArray; const MaxSize: integer);
begin
TOLEVisualizationFunctionality___GetDATA1(Self,   Value,MaxSize);
end;

procedure TOLEVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.GetDATA2(out Value: TClientBlobStream);
begin
TOLEVisualizationFunctionality___GetDATA2(Self,   Value);
end;

procedure TOLEVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.GetDATA3(out Value: TClientBlobStream; const MaxSize: integer);
begin
TOLEVisualizationFunctionality___GetDATA3(Self,   Value,MaxSize);
end;

procedure TOLEVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.SetDATA(Value: TByteArray);
begin
TOLEVisualizationFunctionality___SetDATA(Self,   Value);
end;

procedure TOLEVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.SetDATA1(Value: TMemoryStream);
begin
TOLEVisualizationFunctionality___SetDATA1(Self,   Value);
end;


{TTHTMLVisualizationFunctionality}
function TTHTMLVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTHTMLVisualizationFunctionality____CreateInstance(Self);
end;

function TTHTMLVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHTMLVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHTMLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality.getName: string;
begin
Result:=TTHTMLVisualizationFunctionality___getName(Self);
end;

function TTHTMLVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTHTMLVisualizationFunctionality___getImage(Self);
end;

function TTHTMLVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTHTMLVisualizationFunctionality___StdObjectVisualization(Self);
end;


{THTMLVisualizationFunctionality}
procedure THTMLVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality._ToClone(out idClone: integer);
begin
THTMLVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure THTMLVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.DestroyData;
begin
THTMLVisualizationFunctionality___DestroyData(Self);
end;

procedure THTMLVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.CloneData(out idClone: integer);
begin
THTMLVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure THTMLVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
THTMLVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

procedure THTMLVisualizationFunctionality___SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.SaveToFile(const FileName: string);
begin
THTMLVisualizationFunctionality___SaveToFile(Self,   FileName);
end;

procedure THTMLVisualizationFunctionality___EditDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.EditDATA;
begin
THTMLVisualizationFunctionality___EditDATA(Self);
end;

function THTMLVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=THTMLVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function THTMLVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=THTMLVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THTMLVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.DATASize: integer;
begin
Result:=THTMLVisualizationFunctionality___DATASize(Self);
end;

function THTMLVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=THTMLVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function THTMLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.getName: string;
begin
Result:=THTMLVisualizationFunctionality___getName(Self);
end;

function THTMLVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.getHint: string;
begin
Result:=THTMLVisualizationFunctionality___getHint(Self);
end;

function THTMLVisualizationFunctionality___getWidth(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.getWidth: integer;
begin
Result:=THTMLVisualizationFunctionality___getWidth(Self);
end;

procedure THTMLVisualizationFunctionality___setWidth(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.setWidth(Value: integer);
begin
THTMLVisualizationFunctionality___setWidth(Self,   Value);
end;

procedure THTMLVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.GetDATA(out Value: TByteArray);
begin
THTMLVisualizationFunctionality___GetDATA(Self,   Value);
end;

procedure THTMLVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.GetDATA1(out Value: TByteArray; const MaxSize: integer);
begin
THTMLVisualizationFunctionality___GetDATA1(Self,   Value,MaxSize);
end;

procedure THTMLVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.GetDATA2(out Value: TClientBlobStream);
begin
THTMLVisualizationFunctionality___GetDATA2(Self,   Value);
end;

procedure THTMLVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.GetDATA3(out Value: TClientBlobStream; const MaxSize: integer);
begin
THTMLVisualizationFunctionality___GetDATA3(Self,   Value,MaxSize);
end;

procedure THTMLVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.SetDATA(Value: TByteArray);
begin
THTMLVisualizationFunctionality___SetDATA(Self,   Value);
end;

procedure THTMLVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.SetDATA1(Value: TMemoryStream);
begin
THTMLVisualizationFunctionality___SetDATA1(Self,   Value);
end;


{TTBZRVisualizationFunctionality}
function TTBZRVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTBZRVisualizationFunctionality____CreateInstance(Self);
end;

function TTBZRVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTBZRVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTBZRVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality.getName: string;
begin
Result:=TTBZRVisualizationFunctionality___getName(Self);
end;

function TTBZRVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTBZRVisualizationFunctionality___getImage(Self);
end;

function TTBZRVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTBZRVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TBZRVisualizationFunctionality}
procedure TBZRVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBZRVisualizationFunctionality._ToClone(out idClone: integer);
begin
TBZRVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TBZRVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBZRVisualizationFunctionality.DestroyData;
begin
TBZRVisualizationFunctionality___DestroyData(Self);
end;

procedure TBZRVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBZRVisualizationFunctionality.CloneData(out idClone: integer);
begin
TBZRVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TBZRVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TBZRVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TBZRVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TBZRVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBZRVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TBZRVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TBZRVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality.getName: string;
begin
Result:=TBZRVisualizationFunctionality___getName(Self);
end;

function TBZRVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality.getHint: string;
begin
Result:=TBZRVisualizationFunctionality___getHint(Self);
end;


{TTAGIFVisualizationFunctionality}
function TTAGIFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTAGIFVisualizationFunctionality____CreateInstance(Self);
end;

function TTAGIFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTAGIFVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTAGIFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality.getName: string;
begin
Result:=TTAGIFVisualizationFunctionality___getName(Self);
end;

function TTAGIFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTAGIFVisualizationFunctionality___getImage(Self);
end;

function TTAGIFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTAGIFVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TAGIFVisualizationFunctionality}
procedure TAGIFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality._ToClone(out idClone: integer);
begin
TAGIFVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TAGIFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.DestroyData;
begin
TAGIFVisualizationFunctionality___DestroyData(Self);
end;

procedure TAGIFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.CloneData(out idClone: integer);
begin
TAGIFVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TAGIFVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TAGIFVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

function TAGIFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TAGIFVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TAGIFVisualizationFunctionality___TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
begin
Result:=TAGIFVisualizationFunctionality___TVisualizationUpdating_Create(Self,   Reflecting);
end;

function TAGIFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TAGIFVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAGIFVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TAGIFVisualizationFunctionality___ContainerFilled(Self);
end;

function TAGIFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TAGIFVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TAGIFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.getName: string;
begin
Result:=TAGIFVisualizationFunctionality___getName(Self);
end;

function TAGIFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.getHint: string;
begin
Result:=TAGIFVisualizationFunctionality___getHint(Self);
end;

procedure TAGIFVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.GetDATA(out Value: TByteArray);
begin
TAGIFVisualizationFunctionality___GetDATA(Self,   Value);
end;

procedure TAGIFVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.GetDATA1(out Value: TByteArray; const MaxSize: integer);
begin
TAGIFVisualizationFunctionality___GetDATA1(Self,   Value,MaxSize);
end;

procedure TAGIFVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.GetDATA2(out Value: TClientBlobStream);
begin
TAGIFVisualizationFunctionality___GetDATA2(Self,   Value);
end;

procedure TAGIFVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.GetDATA3(out Value: TClientBlobStream; const MaxSize: integer);
begin
TAGIFVisualizationFunctionality___GetDATA3(Self,   Value,MaxSize);
end;

procedure TAGIFVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.SetDATA(Value: TByteArray);
begin
TAGIFVisualizationFunctionality___SetDATA(Self,   Value);
end;

procedure TAGIFVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.SetDATA1(Value: TMemoryStream);
begin
TAGIFVisualizationFunctionality___SetDATA1(Self,   Value);
end;


{TTOrientedVIDEOVisualizationFunctionality}
function TTOrientedVIDEOVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality____CreateInstance(Self);
end;

function TTOrientedVIDEOVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOrientedVIDEOVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality.getName: string;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality___getName(Self);
end;

function TTOrientedVIDEOVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality___getImage(Self);
end;

function TTOrientedVIDEOVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TOrientedVIDEOVisualizationFunctionality}
procedure TOrientedVIDEOVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality._ToClone(out idClone: integer);
begin
TOrientedVIDEOVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TOrientedVIDEOVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality.DestroyData;
begin
TOrientedVIDEOVisualizationFunctionality___DestroyData(Self);
end;

procedure TOrientedVIDEOVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality.CloneData(out idClone: integer);
begin
TOrientedVIDEOVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TOrientedVIDEOVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TOrientedVIDEOVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedVIDEOVisualizationFunctionality___TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
begin
Result:=TOrientedVIDEOVisualizationFunctionality___TVisualizationUpdating_Create(Self,   Reflecting);
end;

function TOrientedVIDEOVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOrientedVIDEOVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedVIDEOVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOrientedVIDEOVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TOrientedVIDEOVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.getName: string;
begin
Result:=TOrientedVIDEOVisualizationFunctionality___getName(Self);
end;

function TOrientedVIDEOVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.getHint: string;
begin
Result:=TOrientedVIDEOVisualizationFunctionality___getHint(Self);
end;

function TOrientedVIDEOVisualizationFunctionality___getDataServer(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.getDataServer: string;
begin
Result:=TOrientedVIDEOVisualizationFunctionality___getDataServer(Self);
end;

procedure TOrientedVIDEOVisualizationFunctionality___setDataServer(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality.setDataServer(Value: string);
begin
TOrientedVIDEOVisualizationFunctionality___setDataServer(Self,   Value);
end;

function TOrientedVIDEOVisualizationFunctionality___getObjectID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.getObjectID: integer;
begin
Result:=TOrientedVIDEOVisualizationFunctionality___getObjectID(Self);
end;

procedure TOrientedVIDEOVisualizationFunctionality___setObjectID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality.setObjectID(Value: integer);
begin
TOrientedVIDEOVisualizationFunctionality___setObjectID(Self,   Value);
end;


{TTVIDEOVisualizationFunctionality}
function TTVIDEOVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTVIDEOVisualizationFunctionality____CreateInstance(Self);
end;

function TTVIDEOVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTVIDEOVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTVIDEOVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality.getName: string;
begin
Result:=TTVIDEOVisualizationFunctionality___getName(Self);
end;

function TTVIDEOVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTVIDEOVisualizationFunctionality___getImage(Self);
end;

function TTVIDEOVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTVIDEOVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TVIDEOVisualizationFunctionality}
procedure TVIDEOVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality._ToClone(out idClone: integer);
begin
TVIDEOVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TVIDEOVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality.DestroyData;
begin
TVIDEOVisualizationFunctionality___DestroyData(Self);
end;

procedure TVIDEOVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality.CloneData(out idClone: integer);
begin
TVIDEOVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TVIDEOVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TVIDEOVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TVIDEOVisualizationFunctionality___TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
begin
Result:=TVIDEOVisualizationFunctionality___TVisualizationUpdating_Create(Self,   Reflecting);
end;

function TVIDEOVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TVIDEOVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TVIDEOVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TVIDEOVisualizationFunctionality___ContainerFilled(Self);
end;

function TVIDEOVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TVIDEOVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TVIDEOVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.getName: string;
begin
Result:=TVIDEOVisualizationFunctionality___getName(Self);
end;

function TVIDEOVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.getHint: string;
begin
Result:=TVIDEOVisualizationFunctionality___getHint(Self);
end;

function TVIDEOVisualizationFunctionality___getDataServer(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.getDataServer: string;
begin
Result:=TVIDEOVisualizationFunctionality___getDataServer(Self);
end;

procedure TVIDEOVisualizationFunctionality___setDataServer(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality.setDataServer(Value: string);
begin
TVIDEOVisualizationFunctionality___setDataServer(Self,   Value);
end;

function TVIDEOVisualizationFunctionality___getObjectID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.getObjectID: integer;
begin
Result:=TVIDEOVisualizationFunctionality___getObjectID(Self);
end;

procedure TVIDEOVisualizationFunctionality___setObjectID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality.setObjectID(Value: integer);
begin
TVIDEOVisualizationFunctionality___setObjectID(Self,   Value);
end;


{TTOPPVisualizationFunctionality}
function TTOPPVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTOPPVisualizationFunctionality____CreateInstance(Self);
end;

function TTOPPVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOPPVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOPPVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality.getName: string;
begin
Result:=TTOPPVisualizationFunctionality___getName(Self);
end;

function TTOPPVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTOPPVisualizationFunctionality___getImage(Self);
end;

function TTOPPVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTOPPVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TOPPVisualizationFunctionality}
procedure TOPPVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality._ToClone(out idClone: integer);
begin
TOPPVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TOPPVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality.DestroyData;
begin
TOPPVisualizationFunctionality___DestroyData(Self);
end;

procedure TOPPVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality.CloneData(out idClone: integer);
begin
TOPPVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TOPPVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TOPPVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOPPVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOPPVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOPPVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOPPVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TOPPVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.getName: string;
begin
Result:=TOPPVisualizationFunctionality___getName(Self);
end;

function TOPPVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.getHint: string;
begin
Result:=TOPPVisualizationFunctionality___getHint(Self);
end;

function TOPPVisualizationFunctionality___getPropsPanel_idTObj(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.getPropsPanel_idTObj: integer;
begin
Result:=TOPPVisualizationFunctionality___getPropsPanel_idTObj(Self);
end;

procedure TOPPVisualizationFunctionality___setPropsPanel_idTObj(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality.setPropsPanel_idTObj(Value: integer);
begin
TOPPVisualizationFunctionality___setPropsPanel_idTObj(Self,   Value);
end;

function TOPPVisualizationFunctionality___getPropsPanel_idObj(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.getPropsPanel_idObj: integer;
begin
Result:=TOPPVisualizationFunctionality___getPropsPanel_idObj(Self);
end;

procedure TOPPVisualizationFunctionality___setPropsPanel_idObj(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality.setPropsPanel_idObj(Value: integer);
begin
TOPPVisualizationFunctionality___setPropsPanel_idObj(Self,   Value);
end;

procedure TOPPVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality.GetParams(out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer);
begin
TOPPVisualizationFunctionality___GetParams(Self,   oPropsPanel_idTObj,oPropsPanel_idObj);
end;


{TTMODELServerFunctionality}
function TTMODELServerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMODELServerFunctionality._CreateInstance: integer;
begin
Result:=TTMODELServerFunctionality____CreateInstance(Self);
end;

procedure TTMODELServerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMODELServerFunctionality._DestroyInstance(const idObj: integer);
begin
TTMODELServerFunctionality____DestroyInstance(Self,   idObj);
end;

function TTMODELServerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMODELServerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMODELServerFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMODELServerFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMODELServerFunctionality.getName: string;
begin
Result:=TTMODELServerFunctionality___getName(Self);
end;

function TTMODELServerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMODELServerFunctionality.getImage: TTypeImage;
begin
Result:=TTMODELServerFunctionality___getImage(Self);
end;

function TTMODELServerFunctionality___GetInstanceByIPAddress(Functionality: TFunctionality;   const IPAddress: string;  out id: integer): boolean; stdcall; external TypesDLL;
function TTMODELServerFunctionality.GetInstanceByIPAddress(const IPAddress: string;  out id: integer): boolean;
begin
Result:=TTMODELServerFunctionality___GetInstanceByIPAddress(Self,   IPAddress,id);
end;


{TMODELServerFunctionality}
procedure TMODELServerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMODELServerFunctionality._ToClone(out idClone: integer);
begin
TMODELServerFunctionality____ToClone(Self,   idClone);
end;

function TMODELServerFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TMODELServerFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TMODELServerFunctionality___Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TMODELServerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMODELServerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMODELServerFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMODELServerFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerFunctionality.getName: string;
begin
Result:=TMODELServerFunctionality___getName(Self);
end;

procedure TMODELServerFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELServerFunctionality.setName(Value: string);
begin
TMODELServerFunctionality___setName(Self,   Value);
end;

function TMODELServerFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerFunctionality.getHint: string;
begin
Result:=TMODELServerFunctionality___getHint(Self);
end;

function TMODELServerFunctionality___getIPAddress(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerFunctionality.getIPAddress: string;
begin
Result:=TMODELServerFunctionality___getIPAddress(Self);
end;

procedure TMODELServerFunctionality___setIPAddress(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELServerFunctionality.setIPAddress(Value: string);
begin
TMODELServerFunctionality___setIPAddress(Self,   Value);
end;

function TMODELServerFunctionality___IsUserExist(Functionality: TFunctionality;   const _UserName,_UserPassword: string): boolean; stdcall; external TypesDLL;
function TMODELServerFunctionality.IsUserExist(const _UserName,_UserPassword: string): boolean;
begin
Result:=TMODELServerFunctionality___IsUserExist(Self,   _UserName,_UserPassword);
end;

function TMODELServerFunctionality___GetUserID(Functionality: TFunctionality;   const _UserName,_UserPassword: string): integer; stdcall; external TypesDLL;
function TMODELServerFunctionality.GetUserID(const _UserName,_UserPassword: string): integer;
begin
Result:=TMODELServerFunctionality___GetUserID(Self,   _UserName,_UserPassword);
end;

function TMODELServerFunctionality___IsOnLine(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMODELServerFunctionality.IsOnLine: boolean;
begin
Result:=TMODELServerFunctionality___IsOnLine(Self);
end;

function TMODELServerFunctionality___Info(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerFunctionality.Info: string;
begin
Result:=TMODELServerFunctionality___Info(Self);
end;

procedure TMODELServerFunctionality___GetLicense(Functionality: TFunctionality;   out License: WideString); stdcall; external TypesDLL;
procedure TMODELServerFunctionality.GetLicense(out License: WideString);
begin
TMODELServerFunctionality___GetLicense(Self,   License);
end;

procedure TMODELServerFunctionality___CreateNewUserByDefaultPrototype(Functionality: TFunctionality;   const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer); stdcall; external TypesDLL;
procedure TMODELServerFunctionality.CreateNewUserByDefaultPrototype(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer);
begin
TMODELServerFunctionality___CreateNewUserByDefaultPrototype(Self,   NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,idNewUser);
end;

procedure TMODELServerFunctionality___CreateNewUserByDefaultPrototype1(Functionality: TFunctionality;   const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString; const Signature: WideString;  out idNewUser: integer); stdcall; external TypesDLL;
procedure TMODELServerFunctionality.CreateNewUserByDefaultPrototype1(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString; const Signature: WideString;  out idNewUser: integer);
begin
TMODELServerFunctionality___CreateNewUserByDefaultPrototype1(Self,   NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,Signature,idNewUser);
end;


{TTCoReferenceFunctionality}
function TTCoReferenceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCoReferenceFunctionality._CreateInstance: integer;
begin
Result:=TTCoReferenceFunctionality____CreateInstance(Self);
end;

procedure TTCoReferenceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCoReferenceFunctionality._DestroyInstance(const idObj: integer);
begin
TTCoReferenceFunctionality____DestroyInstance(Self,   idObj);
end;

function TTCoReferenceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoReferenceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCoReferenceFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCoReferenceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoReferenceFunctionality.getName: string;
begin
Result:=TTCoReferenceFunctionality___getName(Self);
end;

function TTCoReferenceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCoReferenceFunctionality.getImage: TTypeImage;
begin
Result:=TTCoReferenceFunctionality___getImage(Self);
end;


{TCoReferenceFunctionality}
procedure TCoReferenceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoReferenceFunctionality._ToClone(out idClone: integer);
begin
TCoReferenceFunctionality____ToClone(Self,   idClone);
end;

function TCoReferenceFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TCoReferenceFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TCoReferenceFunctionality___Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TCoReferenceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoReferenceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCoReferenceFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TCoReferenceFunctionality___ShowReferencedObjectPanelProps(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCoReferenceFunctionality.ShowReferencedObjectPanelProps;
begin
TCoReferenceFunctionality___ShowReferencedObjectPanelProps(Self);
end;

function TCoReferenceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoReferenceFunctionality.getName: string;
begin
Result:=TCoReferenceFunctionality___getName(Self);
end;

procedure TCoReferenceFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TCoReferenceFunctionality.setName(Value: string);
begin
TCoReferenceFunctionality___setName(Self,   Value);
end;

function TCoReferenceFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoReferenceFunctionality.getHint: string;
begin
Result:=TCoReferenceFunctionality___getHint(Self);
end;

procedure TCoReferenceFunctionality___GetReferencedObject(Functionality: TFunctionality;   out idTReferencedObject,idReferencedObject: integer); stdcall; external TypesDLL;
procedure TCoReferenceFunctionality.GetReferencedObject(out idTReferencedObject,idReferencedObject: integer);
begin
TCoReferenceFunctionality___GetReferencedObject(Self,   idTReferencedObject,idReferencedObject);
end;

procedure TCoReferenceFunctionality___SetReferencedObject(Functionality: TFunctionality;   const idTReferencedObject,idReferencedObject: integer); stdcall; external TypesDLL;
procedure TCoReferenceFunctionality.SetReferencedObject(const idTReferencedObject,idReferencedObject: integer);
begin
TCoReferenceFunctionality___SetReferencedObject(Self,   idTReferencedObject,idReferencedObject);
end;


{TTPositionerFunctionality}
function TTPositionerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTPositionerFunctionality._CreateInstance: integer;
begin
Result:=TTPositionerFunctionality____CreateInstance(Self);
end;

procedure TTPositionerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTPositionerFunctionality._DestroyInstance(const idObj: integer);
begin
TTPositionerFunctionality____DestroyInstance(Self,   idObj);
end;

function TTPositionerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTPositionerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTPositionerFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTPositionerFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTPositionerFunctionality.getName: string;
begin
Result:=TTPositionerFunctionality___getName(Self);
end;

function TTPositionerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTPositionerFunctionality.getImage: TTypeImage;
begin
Result:=TTPositionerFunctionality___getImage(Self);
end;


{TPositionerFunctionality}
procedure TPositionerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPositionerFunctionality._ToClone(out idClone: integer);
begin
TPositionerFunctionality____ToClone(Self,   idClone);
end;

function TPositionerFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TPositionerFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TPositionerFunctionality___Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TPositionerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TPositionerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TPositionerFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TPositionerFunctionality___SetPosition(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPositionerFunctionality.SetPosition;
begin
TPositionerFunctionality___SetPosition(Self);
end;

function TPositionerFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPositionerFunctionality.getName: string;
begin
Result:=TPositionerFunctionality___getName(Self);
end;

function TPositionerFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPositionerFunctionality.getHint: string;
begin
Result:=TPositionerFunctionality___getHint(Self);
end;

procedure TPositionerFunctionality___Get2DPosition(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TPositionerFunctionality.Get2DPosition(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TPositionerFunctionality___Get2DPosition(Self,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TPositionerFunctionality___Save2DPosition(Functionality: TFunctionality;   const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TPositionerFunctionality.Save2DPosition(const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TPositionerFunctionality___Save2DPosition(Self,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TPositionerFunctionality___Save2DPosition1(Functionality: TFunctionality;   Reflector: TReflector); stdcall; external TypesDLL;
procedure TPositionerFunctionality.Save2DPosition1(Reflector: TReflector);
begin
TPositionerFunctionality___Save2DPosition1(Self,   Reflector);
end;

function TPositionerFunctionality___getPositionName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPositionerFunctionality.getPositionName: string;
begin
Result:=TPositionerFunctionality___getPositionName(Self);
end;

procedure TPositionerFunctionality___setPositionName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TPositionerFunctionality.setPositionName(Value: string);
begin
TPositionerFunctionality___setPositionName(Self,   Value);
end;


{TTOrientedWMFVisualizationFunctionality}
function TTOrientedWMFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTOrientedWMFVisualizationFunctionality____CreateInstance(Self);
end;

function TTOrientedWMFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOrientedWMFVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOrientedWMFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality.getName: string;
begin
Result:=TTOrientedWMFVisualizationFunctionality___getName(Self);
end;

function TTOrientedWMFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTOrientedWMFVisualizationFunctionality___getImage(Self);
end;

function TTOrientedWMFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTOrientedWMFVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TOrientedWMFVisualizationFunctionality}
procedure TOrientedWMFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality._ToClone(out idClone: integer);
begin
TOrientedWMFVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TOrientedWMFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.DestroyData;
begin
TOrientedWMFVisualizationFunctionality___DestroyData(Self);
end;

procedure TOrientedWMFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.CloneData(out idClone: integer);
begin
TOrientedWMFVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TOrientedWMFVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TOrientedWMFVisualizationFunctionality___DoOnChangeScale(Self,   ChangeCoef);
end;

procedure TOrientedWMFVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TOrientedWMFVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

function TOrientedWMFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TOrientedWMFVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedWMFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOrientedWMFVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedWMFVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.DATASize: integer;
begin
Result:=TOrientedWMFVisualizationFunctionality___DATASize(Self);
end;

function TOrientedWMFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOrientedWMFVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TOrientedWMFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.getName: string;
begin
Result:=TOrientedWMFVisualizationFunctionality___getName(Self);
end;

function TOrientedWMFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.getHint: string;
begin
Result:=TOrientedWMFVisualizationFunctionality___getHint(Self);
end;

procedure TOrientedWMFVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TOrientedWMFVisualizationFunctionality___GetDATA(Self,   DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TOrientedWMFVisualizationFunctionality___GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TOrientedWMFVisualizationFunctionality___GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TOrientedWMFVisualizationFunctionality___GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality___GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
TOrientedWMFVisualizationFunctionality___GetJPEGDATA(Self,   DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality___GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetJPEGDATA1(out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
TOrientedWMFVisualizationFunctionality___GetJPEGDATA1(Self,   DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TOrientedWMFVisualizationFunctionality___SetDATA(Self,   DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TOrientedWMFVisualizationFunctionality___SetDATA1(Self,   DATAStream,DATAType);
end;

function TOrientedWMFVisualizationFunctionality___getWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.getWidth: Double;
begin
Result:=TOrientedWMFVisualizationFunctionality___getWidth(Self);
end;

procedure TOrientedWMFVisualizationFunctionality___setWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.setWidth(Value: Double);
begin
TOrientedWMFVisualizationFunctionality___setWidth(Self,   Value);
end;

function TOrientedWMFVisualizationFunctionality___getHeight(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.getHeight: Double;
begin
Result:=TOrientedWMFVisualizationFunctionality___getHeight(Self);
end;

procedure TOrientedWMFVisualizationFunctionality___setHeight(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.setHeight(Value: Double);
begin
TOrientedWMFVisualizationFunctionality___setHeight(Self,   Value);
end;

function TOrientedWMFVisualizationFunctionality___getOrientation(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.getOrientation: integer;
begin
Result:=TOrientedWMFVisualizationFunctionality___getOrientation(Self);
end;

procedure TOrientedWMFVisualizationFunctionality___setOrientation(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.setOrientation(Value: integer);
begin
TOrientedWMFVisualizationFunctionality___setOrientation(Self,   Value);
end;

procedure TOrientedWMFVisualizationFunctionality___ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.ChangeScale(const ScaleFactor: Double);
begin
TOrientedWMFVisualizationFunctionality___ChangeScale(Self,   ScaleFactor);
end;

procedure TOrientedWMFVisualizationFunctionality___UpdateContainer(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.UpdateContainer;
begin
TOrientedWMFVisualizationFunctionality___UpdateContainer(Self);
end;

function TOrientedWMFVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TOrientedWMFVisualizationFunctionality___getDATAFileID(Self);
end;

procedure TOrientedWMFVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TOrientedWMFVisualizationFunctionality___setDATAFileID(Self,   Value);
end;

procedure TOrientedWMFVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.DATAFile_Clear;
begin
TOrientedWMFVisualizationFunctionality___DATAFile_Clear(Self);
end;

function TOrientedWMFVisualizationFunctionality___IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.IsNewContainerAcceptable(const NewWidth,NewHeight,NewScale: Double): boolean;
begin
Result:=TOrientedWMFVisualizationFunctionality___IsNewContainerAcceptable(Self,   NewWidth,NewHeight,NewScale);
end;

procedure TOrientedWMFVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetParams(out oWidth: Double; out oHeight: Double; out oOrientation: integer);
begin
TOrientedWMFVisualizationFunctionality___GetParams(Self,   oWidth,oHeight,oOrientation);
end;


{TTCELLVisualizationFunctionality}
function TTCELLVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTCELLVisualizationFunctionality____CreateInstance(Self);
end;

function TTCELLVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCELLVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCELLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality.getName: string;
begin
Result:=TTCELLVisualizationFunctionality___getName(Self);
end;

function TTCELLVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTCELLVisualizationFunctionality___getImage(Self);
end;

function TTCELLVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTCELLVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TCELLVisualizationFunctionality}
procedure TCELLVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality._ToClone(out idClone: integer);
begin
TCELLVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TCELLVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.DestroyData;
begin
TCELLVisualizationFunctionality___DestroyData(Self);
end;

procedure TCELLVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.CloneData(out idClone: integer);
begin
TCELLVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TCELLVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TCELLVisualizationFunctionality___DoOnChangeScale(Self,   ChangeCoef);
end;

function TCELLVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TCELLVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TCELLVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCELLVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TCELLVisualizationFunctionality___SetReflectorView(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.SetReflectorView;
begin
TCELLVisualizationFunctionality___SetReflectorView(Self);
end;

function TCELLVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TCELLVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TCELLVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getName: string;
begin
Result:=TCELLVisualizationFunctionality___getName(Self);
end;

function TCELLVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getHint: string;
begin
Result:=TCELLVisualizationFunctionality___getHint(Self);
end;

procedure TCELLVisualizationFunctionality___GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TCELLVisualizationFunctionality___GetCoordinates(Self,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TCELLVisualizationFunctionality___Change(Functionality: TFunctionality;   const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.Change(const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer);
begin
TCELLVisualizationFunctionality___Change(Self,   Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows);
end;

function TCELLVisualizationFunctionality___GetFormatNodes(Functionality: TFunctionality;   out NodesList: TByteArray; out SizeX,SizeY: integer): boolean; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.GetFormatNodes(out NodesList: TByteArray; out SizeX,SizeY: integer): boolean;
begin
Result:=TCELLVisualizationFunctionality___GetFormatNodes(Self,   NodesList,SizeX,SizeY);
end;

function TCELLVisualizationFunctionality___GetFormatNodes1(Functionality: TFunctionality;   out NodesList: TList; out SizeX,SizeY: integer): boolean; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.GetFormatNodes1(out NodesList: TList; out SizeX,SizeY: integer): boolean;
begin
Result:=TCELLVisualizationFunctionality___GetFormatNodes1(Self,   NodesList,SizeX,SizeY);
end;

procedure TCELLVisualizationFunctionality___DoQuad(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.DoQuad;
begin
TCELLVisualizationFunctionality___DoQuad(Self);
end;

procedure TCELLVisualizationFunctionality___GetInsideObjectsList(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.GetInsideObjectsList(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray);
begin
TCELLVisualizationFunctionality___GetInsideObjectsList(Self,   FindTypeID,flBuiltInType,List);
end;

procedure TCELLVisualizationFunctionality___GetInsideObjectsList1(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TComponentsList); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.GetInsideObjectsList1(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TComponentsList);
begin
TCELLVisualizationFunctionality___GetInsideObjectsList1(Self,   FindTypeID,flBuiltInType,List);
end;

function TCELLVisualizationFunctionality___getColCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getColCount: integer;
begin
Result:=TCELLVisualizationFunctionality___getColCount(Self);
end;

procedure TCELLVisualizationFunctionality___setColCount(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.setColCount(Value: integer);
begin
TCELLVisualizationFunctionality___setColCount(Self,   Value);
end;

function TCELLVisualizationFunctionality___getRowCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getRowCount: integer;
begin
Result:=TCELLVisualizationFunctionality___getRowCount(Self);
end;

procedure TCELLVisualizationFunctionality___setRowCount(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.setRowCount(Value: integer);
begin
TCELLVisualizationFunctionality___setRowCount(Self,   Value);
end;

function TCELLVisualizationFunctionality___getLineWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getLineWidth: Double;
begin
Result:=TCELLVisualizationFunctionality___getLineWidth(Self);
end;

procedure TCELLVisualizationFunctionality___setLineWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.setLineWidth(Value: Double);
begin
TCELLVisualizationFunctionality___setLineWidth(Self,   Value);
end;

function TCELLVisualizationFunctionality___getColSize(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getColSize: Double;
begin
Result:=TCELLVisualizationFunctionality___getColSize(Self);
end;

function TCELLVisualizationFunctionality___getRowSize(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getRowSize: Double;
begin
Result:=TCELLVisualizationFunctionality___getRowSize(Self);
end;

procedure TCELLVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oColCount: integer; out oRowCount: integer; out oLineWidth: Double); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.GetParams(out oColCount: integer; out oRowCount: integer; out oLineWidth: Double);
begin
TCELLVisualizationFunctionality___GetParams(Self,   oColCount,oRowCount,oLineWidth);
end;


{TTEllipseVisualizationFunctionality}
function TTEllipseVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTEllipseVisualizationFunctionality____CreateInstance(Self);
end;

function TTEllipseVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTEllipseVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTEllipseVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality.getName: string;
begin
Result:=TTEllipseVisualizationFunctionality___getName(Self);
end;

function TTEllipseVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTEllipseVisualizationFunctionality___getImage(Self);
end;

function TTEllipseVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTEllipseVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TEllipseVisualizationFunctionality}
procedure TEllipseVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality._ToClone(out idClone: integer);
begin
TEllipseVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TEllipseVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality.DestroyData;
begin
TEllipseVisualizationFunctionality___DestroyData(Self);
end;

procedure TEllipseVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality.CloneData(out idClone: integer);
begin
TEllipseVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TEllipseVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TEllipseVisualizationFunctionality___DoOnChangeScale(Self,   ChangeCoef);
end;

function TEllipseVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TEllipseVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TEllipseVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TEllipseVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TEllipseVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TEllipseVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TEllipseVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.getName: string;
begin
Result:=TEllipseVisualizationFunctionality___getName(Self);
end;

function TEllipseVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.getHint: string;
begin
Result:=TEllipseVisualizationFunctionality___getHint(Self);
end;

function TEllipseVisualizationFunctionality___getColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.getColor: TColor;
begin
Result:=TEllipseVisualizationFunctionality___getColor(Self);
end;

procedure TEllipseVisualizationFunctionality___setColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality.setColor(Value: TColor);
begin
TEllipseVisualizationFunctionality___setColor(Self,   Value);
end;

function TEllipseVisualizationFunctionality___getBorderColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.getBorderColor: TColor;
begin
Result:=TEllipseVisualizationFunctionality___getBorderColor(Self);
end;

procedure TEllipseVisualizationFunctionality___setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality.setBorderColor(Value: TColor);
begin
TEllipseVisualizationFunctionality___setBorderColor(Self,   Value);
end;

function TEllipseVisualizationFunctionality___getBorderWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.getBorderWidth: Double;
begin
Result:=TEllipseVisualizationFunctionality___getBorderWidth(Self);
end;

procedure TEllipseVisualizationFunctionality___setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality.setBorderWidth(Value: Double);
begin
TEllipseVisualizationFunctionality___setBorderWidth(Self,   Value);
end;


{TTWMFVisualizationFunctionality}
function TTWMFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTWMFVisualizationFunctionality____CreateInstance(Self);
end;

function TTWMFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTWMFVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTWMFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality.getName: string;
begin
Result:=TTWMFVisualizationFunctionality___getName(Self);
end;

function TTWMFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTWMFVisualizationFunctionality___getImage(Self);
end;

function TTWMFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTWMFVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TWMFVisualizationFunctionality}
procedure TWMFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality._ToClone(out idClone: integer);
begin
TWMFVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TWMFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.DestroyData;
begin
TWMFVisualizationFunctionality___DestroyData(Self);
end;

procedure TWMFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.CloneData(out idClone: integer);
begin
TWMFVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TWMFVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TWMFVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

function TWMFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TWMFVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TWMFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TWMFVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWMFVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.DATASize: integer;
begin
Result:=TWMFVisualizationFunctionality___DATASize(Self);
end;

function TWMFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TWMFVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TWMFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.getName: string;
begin
Result:=TWMFVisualizationFunctionality___getName(Self);
end;

function TWMFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.getHint: string;
begin
Result:=TWMFVisualizationFunctionality___getHint(Self);
end;

procedure TWMFVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TWMFVisualizationFunctionality___GetDATA(Self,   DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TWMFVisualizationFunctionality___GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TWMFVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TWMFVisualizationFunctionality___GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TWMFVisualizationFunctionality___GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TWMFVisualizationFunctionality___GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
TWMFVisualizationFunctionality___GetJPEGDATA(Self,   DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TWMFVisualizationFunctionality___GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.GetJPEGDATA1(out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
TWMFVisualizationFunctionality___GetJPEGDATA1(Self,   DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TWMFVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TWMFVisualizationFunctionality___SetDATA(Self,   DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TWMFVisualizationFunctionality___SetDATA1(Self,   DATAStream,DATAType);
end;

function TWMFVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TWMFVisualizationFunctionality___getDATAFileID(Self);
end;

procedure TWMFVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TWMFVisualizationFunctionality___setDATAFileID(Self,   Value);
end;

procedure TWMFVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.DATAFile_Clear;
begin
TWMFVisualizationFunctionality___DATAFile_Clear(Self);
end;

procedure TWMFVisualizationFunctionality___SetProportion(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.SetProportion;
begin
TWMFVisualizationFunctionality___SetProportion(Self);
end;


{TTPictureVisualizationFunctionality}
function TTPictureVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTPictureVisualizationFunctionality____CreateInstance(Self);
end;

function TTPictureVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTPictureVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality.getName: string;
begin
Result:=TTPictureVisualizationFunctionality___getName(Self);
end;

function TTPictureVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTPictureVisualizationFunctionality___getImage(Self);
end;

function TTPictureVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTPictureVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TPictureVisualizationFunctionality}
procedure TPictureVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality._ToClone(out idClone: integer);
begin
TPictureVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TPictureVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.DestroyData;
begin
TPictureVisualizationFunctionality___DestroyData(Self);
end;

procedure TPictureVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.CloneData(out idClone: integer);
begin
TPictureVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TPictureVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TPictureVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

function TPictureVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TPictureVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TPictureVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TPictureVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPictureVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.DATASize: integer;
begin
Result:=TPictureVisualizationFunctionality___DATASize(Self);
end;

function TPictureVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TPictureVisualizationFunctionality___ContainerFilled(Self);
end;

function TPictureVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TPictureVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.getName: string;
begin
Result:=TPictureVisualizationFunctionality___getName(Self);
end;

function TPictureVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.getHint: string;
begin
Result:=TPictureVisualizationFunctionality___getHint(Self);
end;

procedure TPictureVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TPictureVisualizationFunctionality___GetDATA(Self,   DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TPictureVisualizationFunctionality___GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TPictureVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TPictureVisualizationFunctionality___GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TPictureVisualizationFunctionality___GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TPictureVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TPictureVisualizationFunctionality___SetDATA(Self,   DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TPictureVisualizationFunctionality___SetDATA1(Self,   DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality___GetBMP(Functionality: TFunctionality;   out BMP: TByteArray); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetBMP(out BMP: TByteArray);
begin
TPictureVisualizationFunctionality___GetBMP(Self,   BMP);
end;

procedure TPictureVisualizationFunctionality___GetBMP1(Functionality: TFunctionality;   out BMP: TBitmap); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetBMP1(out BMP: TBitmap);
begin
TPictureVisualizationFunctionality___GetBMP1(Self,   BMP);
end;

procedure TPictureVisualizationFunctionality___SetProportion(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.SetProportion;
begin
TPictureVisualizationFunctionality___SetProportion(Self);
end;

function TPictureVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TPictureVisualizationFunctionality___getDATAFileID(Self);
end;

procedure TPictureVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TPictureVisualizationFunctionality___setDATAFileID(Self,   Value);
end;

procedure TPictureVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.DATAFile_Clear;
begin
TPictureVisualizationFunctionality___DATAFile_Clear(Self);
end;

procedure TPictureVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out VisibleMinScale: double; out VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetParams(out VisibleMinScale: double; out VisibleMaxScale: double);
begin
TPictureVisualizationFunctionality___GetParams(Self,   VisibleMinScale,VisibleMaxScale);
end;

procedure TPictureVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const VisibleMinScale: double; const VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.SetParams(const VisibleMinScale: double; const VisibleMaxScale: double);
begin
TPictureVisualizationFunctionality___SetParams(Self,   VisibleMinScale,VisibleMaxScale);
end;


{TTRoundVisualizationFunctionality}
function TTRoundVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTRoundVisualizationFunctionality____CreateInstance(Self);
end;

function TTRoundVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTRoundVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTRoundVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality.getName: string;
begin
Result:=TTRoundVisualizationFunctionality___getName(Self);
end;

function TTRoundVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTRoundVisualizationFunctionality___getImage(Self);
end;

function TTRoundVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTRoundVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TRoundVisualizationFunctionality}
procedure TRoundVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality._ToClone(out idClone: integer);
begin
TRoundVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TRoundVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality.DestroyData;
begin
TRoundVisualizationFunctionality___DestroyData(Self);
end;

procedure TRoundVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality.CloneData(out idClone: integer);
begin
TRoundVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TRoundVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TRoundVisualizationFunctionality___DoOnChangeScale(Self,   ChangeCoef);
end;

function TRoundVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TRoundVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TRoundVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TRoundVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TRoundVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TRoundVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TRoundVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.getName: string;
begin
Result:=TRoundVisualizationFunctionality___getName(Self);
end;

function TRoundVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.getHint: string;
begin
Result:=TRoundVisualizationFunctionality___getHint(Self);
end;

function TRoundVisualizationFunctionality___getColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.getColor: TColor;
begin
Result:=TRoundVisualizationFunctionality___getColor(Self);
end;

procedure TRoundVisualizationFunctionality___setColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality.setColor(Value: TColor);
begin
TRoundVisualizationFunctionality___setColor(Self,   Value);
end;

function TRoundVisualizationFunctionality___getBorderColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.getBorderColor: TColor;
begin
Result:=TRoundVisualizationFunctionality___getBorderColor(Self);
end;

procedure TRoundVisualizationFunctionality___setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality.setBorderColor(Value: TColor);
begin
TRoundVisualizationFunctionality___setBorderColor(Self,   Value);
end;

function TRoundVisualizationFunctionality___getBorderWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.getBorderWidth: Double;
begin
Result:=TRoundVisualizationFunctionality___getBorderWidth(Self);
end;

procedure TRoundVisualizationFunctionality___setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality.setBorderWidth(Value: Double);
begin
TRoundVisualizationFunctionality___setBorderWidth(Self,   Value);
end;


{TTGeodesyPointFunctionality}
function TTGeodesyPointFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality._CreateInstance: integer;
begin
Result:=TTGeodesyPointFunctionality____CreateInstance(Self);
end;

procedure TTGeodesyPointFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTGeodesyPointFunctionality._DestroyInstance(const idObj: integer);
begin
TTGeodesyPointFunctionality____DestroyInstance(Self,   idObj);
end;

function TTGeodesyPointFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTGeodesyPointFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTGeodesyPointFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.getName: string;
begin
Result:=TTGeodesyPointFunctionality___getName(Self);
end;

function TTGeodesyPointFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.getImage: TTypeImage;
begin
Result:=TTGeodesyPointFunctionality___getImage(Self);
end;

function TTGeodesyPointFunctionality___ConvertSpaceCRDToGeoCRD(Functionality: TFunctionality;   const X,Y: Double; out Latitude,Longitude: Double): boolean; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.ConvertSpaceCRDToGeoCRD(const X,Y: Double; out Latitude,Longitude: Double): boolean;
begin
Result:=TTGeodesyPointFunctionality___ConvertSpaceCRDToGeoCRD(Self,   X,Y,Latitude,Longitude);
end;

function TTGeodesyPointFunctionality___ConvertGeoCRDToSpaceCRD(Functionality: TFunctionality;   const Latitude,Longitude: Double; out X,Y: Double): boolean; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.ConvertGeoCRDToSpaceCRD(const Latitude,Longitude: Double; out X,Y: Double): boolean;
begin
Result:=TTGeodesyPointFunctionality___ConvertGeoCRDToSpaceCRD(Self,   Latitude,Longitude,X,Y);
end;

procedure TTGeodesyPointFunctionality___GetNearestCrdSys(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeodesyPointFunctionality.GetNearestCrdSys(const pLatitude,pLongitude: double; out idCrdSys: integer);
begin
TTGeodesyPointFunctionality___GetNearestCrdSys(Self,   pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeodesyPointFunctionality___GetInstanceListByCrdSys(Functionality: TFunctionality;   const idCrdSys: integer; out List: TByteArray); stdcall; external TypesDLL;
procedure TTGeodesyPointFunctionality.GetInstanceListByCrdSys(const idCrdSys: integer; out List: TByteArray);
begin
TTGeodesyPointFunctionality___GetInstanceListByCrdSys(Self,   idCrdSys,List);
end;

function TTGeodesyPointFunctionality___CrdSys_GetNearestGeoPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.CrdSys_GetNearestGeoPoints(const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean;
begin
Result:=TTGeodesyPointFunctionality___CrdSys_GetNearestGeoPoints(Self,   idCrdSys,pLatitude,pLongitude,PointsCount,Points);
end;

function TTGeodesyPointFunctionality___CrdSys_GetNearestXYPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.CrdSys_GetNearestXYPoints(const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean;
begin
Result:=TTGeodesyPointFunctionality___CrdSys_GetNearestXYPoints(Self,   idCrdSys,pX,pY,PointsCount,Points);
end;


{TGeodesyPointFunctionality}
procedure TGeodesyPointFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality._ToClone(out idClone: integer);
begin
TGeodesyPointFunctionality____ToClone(Self,   idClone);
end;

function TGeodesyPointFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TGeodesyPointFunctionality___Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TGeodesyPointFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGeodesyPointFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGeodesyPointFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getName: string;
begin
Result:=TGeodesyPointFunctionality___getName(Self);
end;

function TGeodesyPointFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getHint: string;
begin
Result:=TGeodesyPointFunctionality___getHint(Self);
end;

function TGeodesyPointFunctionality___getidCrdSys(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getidCrdSys: integer;
begin
Result:=TGeodesyPointFunctionality___getidCrdSys(Self);
end;

procedure TGeodesyPointFunctionality___setidCrdSys(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.setidCrdSys(Value: integer);
begin
TGeodesyPointFunctionality___setidCrdSys(Self,   Value);
end;

function TGeodesyPointFunctionality___getX(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getX: Double;
begin
Result:=TGeodesyPointFunctionality___getX(Self);
end;

procedure TGeodesyPointFunctionality___setX(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.setX(Value: Double);
begin
TGeodesyPointFunctionality___setX(Self,   Value);
end;

function TGeodesyPointFunctionality___getY(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getY: Double;
begin
Result:=TGeodesyPointFunctionality___getY(Self);
end;

procedure TGeodesyPointFunctionality___setY(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.setY(Value: Double);
begin
TGeodesyPointFunctionality___setY(Self,   Value);
end;

function TGeodesyPointFunctionality___getLatitude(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getLatitude: Double;
begin
Result:=TGeodesyPointFunctionality___getLatitude(Self);
end;

procedure TGeodesyPointFunctionality___setLatitude(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.setLatitude(Value: Double);
begin
TGeodesyPointFunctionality___setLatitude(Self,   Value);
end;

function TGeodesyPointFunctionality___getLongitude(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getLongitude: Double;
begin
Result:=TGeodesyPointFunctionality___getLongitude(Self);
end;

procedure TGeodesyPointFunctionality___setLongitude(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.setLongitude(Value: Double);
begin
TGeodesyPointFunctionality___setLongitude(Self,   Value);
end;

procedure TGeodesyPointFunctionality___GetParams(Functionality: TFunctionality;   out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.GetParams(out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double);
begin
TGeodesyPointFunctionality___GetParams(Self,   oidCrdSys,oX,oY,oLatitude,oLongitude);
end;

procedure TGeodesyPointFunctionality___SetParams(Functionality: TFunctionality;   const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.SetParams(const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double);
begin
TGeodesyPointFunctionality___SetParams(Self,   pidCrdSys,pX,pY,pLatitude,pLongitude);
end;

procedure TGeodesyPointFunctionality___ValidateByVisualizationComponent(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.ValidateByVisualizationComponent;
begin
TGeodesyPointFunctionality___ValidateByVisualizationComponent(Self);
end;


{TTPrivateAreaVisualizationFunctionality}
function TTPrivateAreaVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTPrivateAreaVisualizationFunctionality____CreateInstance(Self);
end;

function TTPrivateAreaVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTPrivateAreaVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTPrivateAreaVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality.getName: string;
begin
Result:=TTPrivateAreaVisualizationFunctionality___getName(Self);
end;

function TTPrivateAreaVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTPrivateAreaVisualizationFunctionality___getImage(Self);
end;

function TTPrivateAreaVisualizationFunctionality___CanCreateAsDetail(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality.CanCreateAsDetail: boolean;
begin
Result:=TTPrivateAreaVisualizationFunctionality___CanCreateAsDetail(Self);
end;

function TTPrivateAreaVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTPrivateAreaVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TPrivateAreaVisualizationFunctionality}
procedure TPrivateAreaVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPrivateAreaVisualizationFunctionality._ToClone(out idClone: integer);
begin
TPrivateAreaVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TPrivateAreaVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPrivateAreaVisualizationFunctionality.DestroyData;
begin
TPrivateAreaVisualizationFunctionality___DestroyData(Self);
end;

procedure TPrivateAreaVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPrivateAreaVisualizationFunctionality.CloneData(out idClone: integer);
begin
TPrivateAreaVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TPrivateAreaVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TPrivateAreaVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TPrivateAreaVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TPrivateAreaVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPrivateAreaVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TPrivateAreaVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TPrivateAreaVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality.getName: string;
begin
Result:=TPrivateAreaVisualizationFunctionality___getName(Self);
end;

function TPrivateAreaVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality.getHint: string;
begin
Result:=TPrivateAreaVisualizationFunctionality___getHint(Self);
end;

function TPrivateAreaVisualizationFunctionality___getAcquireObjectsInside(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality.getAcquireObjectsInside: boolean;
begin
Result:=TPrivateAreaVisualizationFunctionality___getAcquireObjectsInside(Self);
end;

procedure TPrivateAreaVisualizationFunctionality___setAcquireObjectsInside(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TPrivateAreaVisualizationFunctionality.setAcquireObjectsInside(Value: boolean);
begin
TPrivateAreaVisualizationFunctionality___setAcquireObjectsInside(Self,   Value);
end;


{TTHyperTextFunctionality}
function TTHyperTextFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHyperTextFunctionality._CreateInstance: integer;
begin
Result:=TTHyperTextFunctionality____CreateInstance(Self);
end;

procedure TTHyperTextFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTHyperTextFunctionality._DestroyInstance(const idObj: integer);
begin
TTHyperTextFunctionality____DestroyInstance(Self,   idObj);
end;

function TTHyperTextFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHyperTextFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHyperTextFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHyperTextFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHyperTextFunctionality.getName: string;
begin
Result:=TTHyperTextFunctionality___getName(Self);
end;

function TTHyperTextFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHyperTextFunctionality.getImage: TTypeImage;
begin
Result:=TTHyperTextFunctionality___getImage(Self);
end;


{THyperTextFunctionality}
procedure THyperTextFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THyperTextFunctionality.UpdateDATA;
begin
THyperTextFunctionality___UpdateDATA(Self);
end;

procedure THyperTextFunctionality___ClearDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THyperTextFunctionality.ClearDATA;
begin
THyperTextFunctionality___ClearDATA(Self);
end;

procedure THyperTextFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THyperTextFunctionality._ToClone(out idClone: integer);
begin
THyperTextFunctionality____ToClone(Self,   idClone);
end;

function THyperTextFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THyperTextFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=THyperTextFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure THyperTextFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THyperTextFunctionality.LoadFromFile(const FileName: string);
begin
THyperTextFunctionality___LoadFromFile(Self,   FileName);
end;

procedure THyperTextFunctionality___SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THyperTextFunctionality.SaveToFile(const FileName: string);
begin
THyperTextFunctionality___SaveToFile(Self,   FileName);
end;

function THyperTextFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THyperTextFunctionality.getName: string;
begin
Result:=THyperTextFunctionality___getName(Self);
end;

function THyperTextFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THyperTextFunctionality.getHint: string;
begin
Result:=THyperTextFunctionality___getHint(Self);
end;

procedure THyperTextFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure THyperTextFunctionality.GetDATA(out Value: TByteArray);
begin
THyperTextFunctionality___GetDATA(Self,   Value);
end;

procedure THyperTextFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure THyperTextFunctionality.GetDATA1(out Value: TClientBlobStream);
begin
THyperTextFunctionality___GetDATA1(Self,   Value);
end;

procedure THyperTextFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure THyperTextFunctionality.SetDATA(Value: TByteArray);
begin
THyperTextFunctionality___SetDATA(Self,   Value);
end;

procedure THyperTextFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
procedure THyperTextFunctionality.SetDATA1(Value: TMemoryStream);
begin
THyperTextFunctionality___SetDATA1(Self,   Value);
end;


{TTComponentsFindServiceFunctionality}
function TTComponentsFindServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTComponentsFindServiceFunctionality._CreateInstance: integer;
begin
Result:=TTComponentsFindServiceFunctionality____CreateInstance(Self);
end;

procedure TTComponentsFindServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTComponentsFindServiceFunctionality._DestroyInstance(const idObj: integer);
begin
TTComponentsFindServiceFunctionality____DestroyInstance(Self,   idObj);
end;

function TTComponentsFindServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTComponentsFindServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTComponentsFindServiceFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTComponentsFindServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTComponentsFindServiceFunctionality.getName: string;
begin
Result:=TTComponentsFindServiceFunctionality___getName(Self);
end;

function TTComponentsFindServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTComponentsFindServiceFunctionality.getImage: TTypeImage;
begin
Result:=TTComponentsFindServiceFunctionality___getImage(Self);
end;


{TComponentsFindServiceFunctionality}
procedure TComponentsFindServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TComponentsFindServiceFunctionality._ToClone(out idClone: integer);
begin
TComponentsFindServiceFunctionality____ToClone(Self,   idClone);
end;

function TComponentsFindServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TComponentsFindServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TComponentsFindServiceFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TComponentsFindServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TComponentsFindServiceFunctionality.getName: string;
begin
Result:=TComponentsFindServiceFunctionality___getName(Self);
end;

function TComponentsFindServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TComponentsFindServiceFunctionality.getHint: string;
begin
Result:=TComponentsFindServiceFunctionality___getHint(Self);
end;


{TTUsersServiceFunctionality}
function TTUsersServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTUsersServiceFunctionality._CreateInstance: integer;
begin
Result:=TTUsersServiceFunctionality____CreateInstance(Self);
end;

procedure TTUsersServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTUsersServiceFunctionality._DestroyInstance(const idObj: integer);
begin
TTUsersServiceFunctionality____DestroyInstance(Self,   idObj);
end;

function TTUsersServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTUsersServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTUsersServiceFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTUsersServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTUsersServiceFunctionality.getName: string;
begin
Result:=TTUsersServiceFunctionality___getName(Self);
end;

function TTUsersServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTUsersServiceFunctionality.getImage: TTypeImage;
begin
Result:=TTUsersServiceFunctionality___getImage(Self);
end;


{TUsersServiceFunctionality}
procedure TUsersServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TUsersServiceFunctionality._ToClone(out idClone: integer);
begin
TUsersServiceFunctionality____ToClone(Self,   idClone);
end;

function TUsersServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TUsersServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TUsersServiceFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TUsersServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUsersServiceFunctionality.getName: string;
begin
Result:=TUsersServiceFunctionality___getName(Self);
end;

function TUsersServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUsersServiceFunctionality.getHint: string;
begin
Result:=TUsersServiceFunctionality___getHint(Self);
end;


{TTTransportServiceFunctionality}
function TTTransportServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTransportServiceFunctionality._CreateInstance: integer;
begin
Result:=TTTransportServiceFunctionality____CreateInstance(Self);
end;

procedure TTTransportServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTransportServiceFunctionality._DestroyInstance(const idObj: integer);
begin
TTTransportServiceFunctionality____DestroyInstance(Self,   idObj);
end;

function TTTransportServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTransportServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTransportServiceFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTransportServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTransportServiceFunctionality.getName: string;
begin
Result:=TTTransportServiceFunctionality___getName(Self);
end;

function TTTransportServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTransportServiceFunctionality.getImage: TTypeImage;
begin
Result:=TTTransportServiceFunctionality___getImage(Self);
end;


{TTransportServiceFunctionality}
procedure TTransportServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTransportServiceFunctionality._ToClone(out idClone: integer);
begin
TTransportServiceFunctionality____ToClone(Self,   idClone);
end;

function TTransportServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTransportServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTransportServiceFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportServiceFunctionality.getName: string;
begin
Result:=TTransportServiceFunctionality___getName(Self);
end;

function TTransportServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportServiceFunctionality.getHint: string;
begin
Result:=TTransportServiceFunctionality___getHint(Self);
end;


{TTMarketServiceFunctionality}
function TTMarketServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMarketServiceFunctionality._CreateInstance: integer;
begin
Result:=TTMarketServiceFunctionality____CreateInstance(Self);
end;

procedure TTMarketServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMarketServiceFunctionality._DestroyInstance(const idObj: integer);
begin
TTMarketServiceFunctionality____DestroyInstance(Self,   idObj);
end;

function TTMarketServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMarketServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMarketServiceFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMarketServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMarketServiceFunctionality.getName: string;
begin
Result:=TTMarketServiceFunctionality___getName(Self);
end;

function TTMarketServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMarketServiceFunctionality.getImage: TTypeImage;
begin
Result:=TTMarketServiceFunctionality___getImage(Self);
end;


{TMarketServiceFunctionality}
procedure TMarketServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMarketServiceFunctionality._ToClone(out idClone: integer);
begin
TMarketServiceFunctionality____ToClone(Self,   idClone);
end;

function TMarketServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMarketServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMarketServiceFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMarketServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMarketServiceFunctionality.getName: string;
begin
Result:=TMarketServiceFunctionality___getName(Self);
end;

function TMarketServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMarketServiceFunctionality.getHint: string;
begin
Result:=TMarketServiceFunctionality___getHint(Self);
end;


{TTTelecomServiceFunctionality}
function TTTelecomServiceFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTelecomServiceFunctionality._CreateInstance: integer;
begin
Result:=TTTelecomServiceFunctionality____CreateInstance(Self);
end;

procedure TTTelecomServiceFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTelecomServiceFunctionality._DestroyInstance(const idObj: integer);
begin
TTTelecomServiceFunctionality____DestroyInstance(Self,   idObj);
end;

function TTTelecomServiceFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTelecomServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTelecomServiceFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTelecomServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTelecomServiceFunctionality.getName: string;
begin
Result:=TTTelecomServiceFunctionality___getName(Self);
end;

function TTTelecomServiceFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTelecomServiceFunctionality.getImage: TTypeImage;
begin
Result:=TTTelecomServiceFunctionality___getImage(Self);
end;


{TTelecomServiceFunctionality}
procedure TTelecomServiceFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTelecomServiceFunctionality._ToClone(out idClone: integer);
begin
TTelecomServiceFunctionality____ToClone(Self,   idClone);
end;

function TTelecomServiceFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTelecomServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTelecomServiceFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTelecomServiceFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTelecomServiceFunctionality.getName: string;
begin
Result:=TTelecomServiceFunctionality___getName(Self);
end;

function TTelecomServiceFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTelecomServiceFunctionality.getHint: string;
begin
Result:=TTelecomServiceFunctionality___getHint(Self);
end;


{TTWNDVisualizationFunctionality}
function TTWNDVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTWNDVisualizationFunctionality____CreateInstance(Self);
end;

function TTWNDVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTWNDVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTWNDVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality.getName: string;
begin
Result:=TTWNDVisualizationFunctionality___getName(Self);
end;

function TTWNDVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTWNDVisualizationFunctionality___getImage(Self);
end;

function TTWNDVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTWNDVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TWNDVisualizationFunctionality}
procedure TWNDVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality._ToClone(out idClone: integer);
begin
TWNDVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TWNDVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.DestroyData;
begin
TWNDVisualizationFunctionality___DestroyData(Self);
end;

procedure TWNDVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.CloneData(out idClone: integer);
begin
TWNDVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TWNDVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TWNDVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

function TWNDVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TWNDVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TWNDVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TWNDVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWNDVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.DATASize: integer;
begin
Result:=TWNDVisualizationFunctionality___DATASize(Self);
end;

function TWNDVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TWNDVisualizationFunctionality___ContainerFilled(Self);
end;

function TWNDVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TWNDVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TWNDVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.getName: string;
begin
Result:=TWNDVisualizationFunctionality___getName(Self);
end;

function TWNDVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.getHint: string;
begin
Result:=TWNDVisualizationFunctionality___getHint(Self);
end;

procedure TWNDVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TWNDVisualizationFunctionality___GetDATA(Self,   DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TWNDVisualizationFunctionality___GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TWNDVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TWNDVisualizationFunctionality___GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TWNDVisualizationFunctionality___GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TWNDVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TWNDVisualizationFunctionality___SetDATA(Self,   DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TWNDVisualizationFunctionality___SetDATA1(Self,   DATAStream,DATAType);
end;

function TWNDVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TWNDVisualizationFunctionality___getDATAFileID(Self);
end;

procedure TWNDVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TWNDVisualizationFunctionality___setDATAFileID(Self,   Value);
end;

procedure TWNDVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.DATAFile_Clear;
begin
TWNDVisualizationFunctionality___DATAFile_Clear(Self);
end;


{TTMRKVisualizationFunctionality}
function TTMRKVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTMRKVisualizationFunctionality____CreateInstance(Self);
end;

function TTMRKVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMRKVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMRKVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality.getName: string;
begin
Result:=TTMRKVisualizationFunctionality___getName(Self);
end;

function TTMRKVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTMRKVisualizationFunctionality___getImage(Self);
end;

function TTMRKVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTMRKVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TMRKVisualizationFunctionality}
procedure TMRKVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality._ToClone(out idClone: integer);
begin
TMRKVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TMRKVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.DestroyData;
begin
TMRKVisualizationFunctionality___DestroyData(Self);
end;

procedure TMRKVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.CloneData(out idClone: integer);
begin
TMRKVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TMRKVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TMRKVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

procedure TMRKVisualizationFunctionality___DoOnComponentUpdate(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.DoOnComponentUpdate;
begin
TMRKVisualizationFunctionality___DoOnComponentUpdate(Self);
end;

function TMRKVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TMRKVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TMRKVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMRKVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMRKVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.DATASize: integer;
begin
Result:=TMRKVisualizationFunctionality___DATASize(Self);
end;

function TMRKVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TMRKVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TMRKVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.getName: string;
begin
Result:=TMRKVisualizationFunctionality___getName(Self);
end;

function TMRKVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.getHint: string;
begin
Result:=TMRKVisualizationFunctionality___getHint(Self);
end;

procedure TMRKVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TMRKVisualizationFunctionality___GetDATA(Self,   DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TMRKVisualizationFunctionality___GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TMRKVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TMRKVisualizationFunctionality___GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TMRKVisualizationFunctionality___GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TMRKVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TMRKVisualizationFunctionality___SetDATA(Self,   DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TMRKVisualizationFunctionality___SetDATA1(Self,   DATAStream,DATAType);
end;

function TMRKVisualizationFunctionality___getBindingPointIndex(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.getBindingPointIndex: integer;
begin
Result:=TMRKVisualizationFunctionality___getBindingPointIndex(Self);
end;

procedure TMRKVisualizationFunctionality___setBindingPointIndex(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.setBindingPointIndex(Value: integer);
begin
TMRKVisualizationFunctionality___setBindingPointIndex(Self,   Value);
end;

function TMRKVisualizationFunctionality___getAlign(Functionality: TFunctionality): TMRKVisualizationAlign; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.getAlign: TMRKVisualizationAlign;
begin
Result:=TMRKVisualizationFunctionality___getAlign(Self);
end;

function TMRKVisualizationFunctionality___getAlign1(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.getAlign1: integer;
begin
Result:=TMRKVisualizationFunctionality___getAlign1(Self);
end;

procedure TMRKVisualizationFunctionality___setAlign(Functionality: TFunctionality;   Value: TMRKVisualizationAlign); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.setAlign(Value: TMRKVisualizationAlign);
begin
TMRKVisualizationFunctionality___setAlign(Self,   Value);
end;

procedure TMRKVisualizationFunctionality___setAlign1(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.setAlign1(Value: integer);
begin
TMRKVisualizationFunctionality___setAlign1(Self,   Value);
end;

function TMRKVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TMRKVisualizationFunctionality___getDATAFileID(Self);
end;

procedure TMRKVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TMRKVisualizationFunctionality___setDATAFileID(Self,   Value);
end;

procedure TMRKVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.DATAFile_Clear;
begin
TMRKVisualizationFunctionality___DATAFile_Clear(Self);
end;

procedure TMRKVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oAlign: integer; out oBindingPointIndex: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.GetParams(out oAlign: integer; out oBindingPointIndex: integer);
begin
TMRKVisualizationFunctionality___GetParams(Self,   oAlign,oBindingPointIndex);
end;


{TTOrientedPictureVisualizationFunctionality}
function TTOrientedPictureVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTOrientedPictureVisualizationFunctionality____CreateInstance(Self);
end;

function TTOrientedPictureVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOrientedPictureVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOrientedPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality.getName: string;
begin
Result:=TTOrientedPictureVisualizationFunctionality___getName(Self);
end;

function TTOrientedPictureVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTOrientedPictureVisualizationFunctionality___getImage(Self);
end;

function TTOrientedPictureVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTOrientedPictureVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TOrientedPictureVisualizationFunctionality}
procedure TOrientedPictureVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality._ToClone(out idClone: integer);
begin
TOrientedPictureVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TOrientedPictureVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.DestroyData;
begin
TOrientedPictureVisualizationFunctionality___DestroyData(Self);
end;

procedure TOrientedPictureVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.CloneData(out idClone: integer);
begin
TOrientedPictureVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TOrientedPictureVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TOrientedPictureVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

procedure TOrientedPictureVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TOrientedPictureVisualizationFunctionality___DoOnChangeScale(Self,   ChangeCoef);
end;

function TOrientedPictureVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TOrientedPictureVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedPictureVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOrientedPictureVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedPictureVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.DATASize: integer;
begin
Result:=TOrientedPictureVisualizationFunctionality___DATASize(Self);
end;

function TOrientedPictureVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOrientedPictureVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TOrientedPictureVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.getName: string;
begin
Result:=TOrientedPictureVisualizationFunctionality___getName(Self);
end;

function TOrientedPictureVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.getHint: string;
begin
Result:=TOrientedPictureVisualizationFunctionality___getHint(Self);
end;

procedure TOrientedPictureVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TOrientedPictureVisualizationFunctionality___GetDATA(Self,   DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TOrientedPictureVisualizationFunctionality___GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TOrientedPictureVisualizationFunctionality___GetDATA2(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.GetDATA2(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TOrientedPictureVisualizationFunctionality___GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality___GetDATA3(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.GetDATA3(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TOrientedPictureVisualizationFunctionality___GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TOrientedPictureVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: integer);
begin
TOrientedPictureVisualizationFunctionality___SetDATA(Self,   DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.SetDATA1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TOrientedPictureVisualizationFunctionality___SetDATA1(Self,   DATAStream,DATAType);
end;

function TOrientedPictureVisualizationFunctionality___getWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.getWidth: Double;
begin
Result:=TOrientedPictureVisualizationFunctionality___getWidth(Self);
end;

procedure TOrientedPictureVisualizationFunctionality___setWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.setWidth(Value: Double);
begin
TOrientedPictureVisualizationFunctionality___setWidth(Self,   Value);
end;

function TOrientedPictureVisualizationFunctionality___getHeight(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.getHeight: Double;
begin
Result:=TOrientedPictureVisualizationFunctionality___getHeight(Self);
end;

procedure TOrientedPictureVisualizationFunctionality___setHeight(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.setHeight(Value: Double);
begin
TOrientedPictureVisualizationFunctionality___setHeight(Self,   Value);
end;

function TOrientedPictureVisualizationFunctionality___getOrientation(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.getOrientation: integer;
begin
Result:=TOrientedPictureVisualizationFunctionality___getOrientation(Self);
end;

procedure TOrientedPictureVisualizationFunctionality___setOrientation(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.setOrientation(Value: integer);
begin
TOrientedPictureVisualizationFunctionality___setOrientation(Self,   Value);
end;

procedure TOrientedPictureVisualizationFunctionality___ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.ChangeScale(const ScaleFactor: Double);
begin
TOrientedPictureVisualizationFunctionality___ChangeScale(Self,   ScaleFactor);
end;

procedure TOrientedPictureVisualizationFunctionality___UpdateContainer(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.UpdateContainer;
begin
TOrientedPictureVisualizationFunctionality___UpdateContainer(Self);
end;

function TOrientedPictureVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TOrientedPictureVisualizationFunctionality___getDATAFileID(Self);
end;

procedure TOrientedPictureVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TOrientedPictureVisualizationFunctionality___setDATAFileID(Self,   Value);
end;

procedure TOrientedPictureVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.DATAFile_Clear;
begin
TOrientedPictureVisualizationFunctionality___DATAFile_Clear(Self);
end;

function TOrientedPictureVisualizationFunctionality___IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.IsNewContainerAcceptable(const NewWidth,NewHeight,NewScale: Double): boolean;
begin
Result:=TOrientedPictureVisualizationFunctionality___IsNewContainerAcceptable(Self,   NewWidth,NewHeight,NewScale);
end;

procedure TOrientedPictureVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.GetParams(out oWidth: Double; out oHeight: Double; out oOrientation: integer);
begin
TOrientedPictureVisualizationFunctionality___GetParams(Self,   oWidth,oHeight,oOrientation);
end;


{TTOrientedTTFVisualizationFunctionality}
function TTOrientedTTFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTOrientedTTFVisualizationFunctionality____CreateInstance(Self);
end;

function TTOrientedTTFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOrientedTTFVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOrientedTTFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality.getName: string;
begin
Result:=TTOrientedTTFVisualizationFunctionality___getName(Self);
end;

function TTOrientedTTFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTOrientedTTFVisualizationFunctionality___getImage(Self);
end;

function TTOrientedTTFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTOrientedTTFVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TOrientedTTFVisualizationFunctionality}
procedure TOrientedTTFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality._ToClone(out idClone: integer);
begin
TOrientedTTFVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TOrientedTTFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.DestroyData;
begin
TOrientedTTFVisualizationFunctionality___DestroyData(Self);
end;

procedure TOrientedTTFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.CloneData(out idClone: integer);
begin
TOrientedTTFVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TOrientedTTFVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TOrientedTTFVisualizationFunctionality___DoOnChangeScale(Self,   ChangeCoef);
end;

function TOrientedTTFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TOrientedTTFVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedTTFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOrientedTTFVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedTTFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOrientedTTFVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TOrientedTTFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getName: string;
begin
Result:=TOrientedTTFVisualizationFunctionality___getName(Self);
end;

function TOrientedTTFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getHint: string;
begin
Result:=TOrientedTTFVisualizationFunctionality___getHint(Self);
end;

function TOrientedTTFVisualizationFunctionality___getStr(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getStr: string;
begin
Result:=TOrientedTTFVisualizationFunctionality___getStr(Self);
end;

procedure TOrientedTTFVisualizationFunctionality___setStr(Functionality: TFunctionality;   const Value: string); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setStr(const Value: string);
begin
TOrientedTTFVisualizationFunctionality___setStr(Self,   Value);
end;

function TOrientedTTFVisualizationFunctionality___getColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getColor: TColor;
begin
Result:=TOrientedTTFVisualizationFunctionality___getColor(Self);
end;

procedure TOrientedTTFVisualizationFunctionality___setColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setColor(Value: TColor);
begin
TOrientedTTFVisualizationFunctionality___setColor(Self,   Value);
end;

function TOrientedTTFVisualizationFunctionality___getFont_Name(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getFont_Name: string;
begin
Result:=TOrientedTTFVisualizationFunctionality___getFont_Name(Self);
end;

procedure TOrientedTTFVisualizationFunctionality___setFont_Name(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setFont_Name(Value: string);
begin
TOrientedTTFVisualizationFunctionality___setFont_Name(Self,   Value);
end;

function TOrientedTTFVisualizationFunctionality___getFont_Width(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getFont_Width: Double;
begin
Result:=TOrientedTTFVisualizationFunctionality___getFont_Width(Self);
end;

procedure TOrientedTTFVisualizationFunctionality___setFont_Width(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setFont_Width(Value: Double);
begin
TOrientedTTFVisualizationFunctionality___setFont_Width(Self,   Value);
end;

function TOrientedTTFVisualizationFunctionality___getFont_Height(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getFont_Height: Double;
begin
Result:=TOrientedTTFVisualizationFunctionality___getFont_Height(Self);
end;

procedure TOrientedTTFVisualizationFunctionality___setFont_Height(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setFont_Height(Value: Double);
begin
TOrientedTTFVisualizationFunctionality___setFont_Height(Self,   Value);
end;

function TOrientedTTFVisualizationFunctionality___getCharInterval(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getCharInterval: Double;
begin
Result:=TOrientedTTFVisualizationFunctionality___getCharInterval(Self);
end;

procedure TOrientedTTFVisualizationFunctionality___setCharInterval(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setCharInterval(Value: Double);
begin
TOrientedTTFVisualizationFunctionality___setCharInterval(Self,   Value);
end;

function TOrientedTTFVisualizationFunctionality___getOrientation(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getOrientation: integer;
begin
Result:=TOrientedTTFVisualizationFunctionality___getOrientation(Self);
end;

procedure TOrientedTTFVisualizationFunctionality___setOrientation(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setOrientation(Value: integer);
begin
TOrientedTTFVisualizationFunctionality___setOrientation(Self,   Value);
end;

procedure TOrientedTTFVisualizationFunctionality___UpdateContainer(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.UpdateContainer;
begin
TOrientedTTFVisualizationFunctionality___UpdateContainer(Self);
end;

function TOrientedTTFVisualizationFunctionality___IsNewContainerAcceptable(Functionality: TFunctionality;   const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.IsNewContainerAcceptable(const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean;
begin
Result:=TOrientedTTFVisualizationFunctionality___IsNewContainerAcceptable(Self,   NewFontWidth,NewFontHeight,NewCharInterval,flNewStr,NewStr);
end;

procedure TOrientedTTFVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer);
begin
TOrientedTTFVisualizationFunctionality___GetParams(Self,   oStr,oFont_Width,oFont_Height,oFont_Name,oCharInterval,oOrientation);
end;

procedure TOrientedTTFVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer);
begin
TOrientedTTFVisualizationFunctionality___SetParams(Self,   pStr,pFont_Width,pFont_Height,pFont_Name,pCharInterval,pOrientation);
end;


{TTIconFunctionality}
function TTIconFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTIconFunctionality._CreateInstance: integer;
begin
Result:=TTIconFunctionality____CreateInstance(Self);
end;

procedure TTIconFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTIconFunctionality._DestroyInstance(const idObj: integer);
begin
TTIconFunctionality____DestroyInstance(Self,   idObj);
end;

function TTIconFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTIconFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTIconFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTIconFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTIconFunctionality.getName: string;
begin
Result:=TTIconFunctionality___getName(Self);
end;

function TTIconFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTIconFunctionality.getImage: TTypeImage;
begin
Result:=TTIconFunctionality___getImage(Self);
end;


{TIconFunctionality}
procedure TIconFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TIconFunctionality._ToClone(out idClone: integer);
begin
TIconFunctionality____ToClone(Self,   idClone);
end;

procedure TIconFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TIconFunctionality.LoadFromFile(const FileName: string);
begin
TIconFunctionality___LoadFromFile(Self,   FileName);
end;

function TIconFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TIconFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TIconFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TIconFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TIconFunctionality.getName: string;
begin
Result:=TIconFunctionality___getName(Self);
end;

function TIconFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TIconFunctionality.getHint: string;
begin
Result:=TIconFunctionality___getHint(Self);
end;

procedure TIconFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TIconFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TIconFunctionality___GetDATA(Self,   DATAStream,DATAType);
end;

procedure TIconFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall; external TypesDLL;
procedure TIconFunctionality.GetDATA1(out DATAStream: TClientBlobStream; out DATAType: TImageDATAType);
begin
TIconFunctionality___GetDATA1(Self,   DATAStream,DATAType);
end;

procedure TIconFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall; external TypesDLL;
procedure TIconFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: Integer);
begin
TIconFunctionality___SetDATA(Self,   DATAStream,DATAType);
end;

procedure TIconFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall; external TypesDLL;
procedure TIconFunctionality.SetDATA1(DATAStream: TMemoryStream; const DATAType: TImageDATAType);
begin
TIconFunctionality___SetDATA1(Self,   DATAStream,DATAType);
end;

procedure TIconFunctionality___GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall; external TypesDLL;
procedure TIconFunctionality.GetBitmapDATA(out BMPDATAStream: TByteArray);
begin
TIconFunctionality___GetBitmapDATA(Self,   BMPDATAStream);
end;

procedure TIconFunctionality___GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TIconFunctionality.GetBitmapDATA1(out BMPDATAStream: TMemoryStream);
begin
TIconFunctionality___GetBitmapDATA1(Self,   BMPDATAStream);
end;


{TTMessageBoardMessageFunctionality}
function TTMessageBoardMessageFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMessageBoardMessageFunctionality._CreateInstance: integer;
begin
Result:=TTMessageBoardMessageFunctionality____CreateInstance(Self);
end;

procedure TTMessageBoardMessageFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMessageBoardMessageFunctionality._DestroyInstance(const idObj: integer);
begin
TTMessageBoardMessageFunctionality____DestroyInstance(Self,   idObj);
end;

function TTMessageBoardMessageFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMessageBoardMessageFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMessageBoardMessageFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMessageBoardMessageFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMessageBoardMessageFunctionality.getName: string;
begin
Result:=TTMessageBoardMessageFunctionality___getName(Self);
end;

function TTMessageBoardMessageFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMessageBoardMessageFunctionality.getImage: TTypeImage;
begin
Result:=TTMessageBoardMessageFunctionality___getImage(Self);
end;


{TMessageBoardMessageFunctionality}
procedure TMessageBoardMessageFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality._ToClone(out idClone: integer);
begin
TMessageBoardMessageFunctionality____ToClone(Self,   idClone);
end;

function TMessageBoardMessageFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMessageBoardMessageFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMessageBoardMessageFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.getName: string;
begin
Result:=TMessageBoardMessageFunctionality___getName(Self);
end;

function TMessageBoardMessageFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.getHint: string;
begin
Result:=TMessageBoardMessageFunctionality___getHint(Self);
end;

function TMessageBoardMessageFunctionality___getIdMessageBoard(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.getIdMessageBoard: integer;
begin
Result:=TMessageBoardMessageFunctionality___getIdMessageBoard(Self);
end;

procedure TMessageBoardMessageFunctionality___setIdMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.setIdMessageBoard(Value: integer);
begin
TMessageBoardMessageFunctionality___setIdMessageBoard(Self,   Value);
end;

function TMessageBoardMessageFunctionality___getIdSenderMessageBoard(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.getIdSenderMessageBoard: integer;
begin
Result:=TMessageBoardMessageFunctionality___getIdSenderMessageBoard(Self);
end;

procedure TMessageBoardMessageFunctionality___setIdSenderMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.setIdSenderMessageBoard(Value: integer);
begin
TMessageBoardMessageFunctionality___setIdSenderMessageBoard(Self,   Value);
end;

function TMessageBoardMessageFunctionality___DateCreated(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.DateCreated: TDateTime;
begin
Result:=TMessageBoardMessageFunctionality___DateCreated(Self);
end;

function TMessageBoardMessageFunctionality___getSubject(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.getSubject: string;
begin
Result:=TMessageBoardMessageFunctionality___getSubject(Self);
end;

procedure TMessageBoardMessageFunctionality___setSubject(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.setSubject(Value: string);
begin
TMessageBoardMessageFunctionality___setSubject(Self,   Value);
end;

procedure TMessageBoardMessageFunctionality___GetBody(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.GetBody(out Value: TByteArray);
begin
TMessageBoardMessageFunctionality___GetBody(Self,   Value);
end;

procedure TMessageBoardMessageFunctionality___GetBody1(Functionality: TFunctionality;   Value: TStringList); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.GetBody1(Value: TStringList);
begin
TMessageBoardMessageFunctionality___GetBody1(Self,   Value);
end;

procedure TMessageBoardMessageFunctionality___SetBody(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.SetBody(Value: TByteArray);
begin
TMessageBoardMessageFunctionality___SetBody(Self,   Value);
end;

procedure TMessageBoardMessageFunctionality___SetBody1(Functionality: TFunctionality;   Value: TStringList); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.SetBody1(Value: TStringList);
begin
TMessageBoardMessageFunctionality___SetBody1(Self,   Value);
end;

function TMessageBoardMessageFunctionality___getFlRead(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.getFlRead: boolean;
begin
Result:=TMessageBoardMessageFunctionality___getFlRead(Self);
end;

procedure TMessageBoardMessageFunctionality___setFlRead(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.setFlRead(Value: boolean);
begin
TMessageBoardMessageFunctionality___setFlRead(Self,   Value);
end;

function TMessageBoardMessageFunctionality___IsEmpty(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.IsEmpty: boolean;
begin
Result:=TMessageBoardMessageFunctionality___IsEmpty(Self);
end;

function TMessageBoardMessageFunctionality___IsCreatedByUser(Functionality: TFunctionality;   const pidUser: integer): boolean; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.IsCreatedByUser(const pidUser: integer): boolean;
begin
Result:=TMessageBoardMessageFunctionality___IsCreatedByUser(Self,   pidUser);
end;


{TTMessageBoardFunctionality}
function TTMessageBoardFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMessageBoardFunctionality._CreateInstance: integer;
begin
Result:=TTMessageBoardFunctionality____CreateInstance(Self);
end;

procedure TTMessageBoardFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMessageBoardFunctionality._DestroyInstance(const idObj: integer);
begin
TTMessageBoardFunctionality____DestroyInstance(Self,   idObj);
end;

function TTMessageBoardFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMessageBoardFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMessageBoardFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMessageBoardFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMessageBoardFunctionality.getName: string;
begin
Result:=TTMessageBoardFunctionality___getName(Self);
end;

function TTMessageBoardFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMessageBoardFunctionality.getImage: TTypeImage;
begin
Result:=TTMessageBoardFunctionality___getImage(Self);
end;


{TMessageBoardFunctionality}
procedure TMessageBoardFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality._ToClone(out idClone: integer);
begin
TMessageBoardFunctionality____ToClone(Self,   idClone);
end;

function TMessageBoardFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TMessageBoardFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TMessageBoardFunctionality___Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TMessageBoardFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMessageBoardFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMessageBoardFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMessageBoardFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardFunctionality.getName: string;
begin
Result:=TMessageBoardFunctionality___getName(Self);
end;

procedure TMessageBoardFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality.setName(Value: string);
begin
TMessageBoardFunctionality___setName(Self,   Value);
end;

function TMessageBoardFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardFunctionality.getHint: string;
begin
Result:=TMessageBoardFunctionality___getHint(Self);
end;

function TMessageBoardFunctionality___IsUnreadMessageExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMessageBoardFunctionality.IsUnreadMessageExist: boolean;
begin
Result:=TMessageBoardFunctionality___IsUnreadMessageExist(Self);
end;

procedure TMessageBoardFunctionality___GetMessagesList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality.GetMessagesList(out List: TByteArray);
begin
TMessageBoardFunctionality___GetMessagesList(Self,   List);
end;

procedure TMessageBoardFunctionality___GetMessagesList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality.GetMessagesList1(out List: TList);
begin
TMessageBoardFunctionality___GetMessagesList1(Self,   List);
end;

function TMessageBoardFunctionality___CreateNewMessage(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMessageBoardFunctionality.CreateNewMessage: integer;
begin
Result:=TMessageBoardFunctionality___CreateNewMessage(Self);
end;

procedure TMessageBoardFunctionality___SendMessage(Functionality: TFunctionality;   const idMessage: integer); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality.SendMessage(const idMessage: integer);
begin
TMessageBoardFunctionality___SendMessage(Self,   idMessage);
end;

function TMessageBoardFunctionality___getIdUser(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMessageBoardFunctionality.getIdUser: integer;
begin
Result:=TMessageBoardFunctionality___getIdUser(Self);
end;

procedure TMessageBoardFunctionality___setIdUser(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality.setIdUser(Value: integer);
begin
TMessageBoardFunctionality___setIdUser(Self,   Value);
end;


{TTHREFFunctionality}
function TTHREFFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHREFFunctionality._CreateInstance: integer;
begin
Result:=TTHREFFunctionality____CreateInstance(Self);
end;

procedure TTHREFFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTHREFFunctionality._DestroyInstance(const idObj: integer);
begin
TTHREFFunctionality____DestroyInstance(Self,   idObj);
end;

function TTHREFFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHREFFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHREFFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHREFFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHREFFunctionality.getName: string;
begin
Result:=TTHREFFunctionality___getName(Self);
end;

function TTHREFFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHREFFunctionality.getImage: TTypeImage;
begin
Result:=TTHREFFunctionality___getImage(Self);
end;


{THREFFunctionality}
procedure THREFFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THREFFunctionality._ToClone(out idClone: integer);
begin
THREFFunctionality____ToClone(Self,   idClone);
end;

function THREFFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THREFFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=THREFFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THREFFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function THREFFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=THREFFunctionality___Notify(Self,   NotifyType,pidTObj,pidObj);
end;

procedure THREFFunctionality___Activate(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THREFFunctionality.Activate;
begin
THREFFunctionality___Activate(Self);
end;

function THREFFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THREFFunctionality.getName: string;
begin
Result:=THREFFunctionality___getName(Self);
end;

function THREFFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THREFFunctionality.getHint: string;
begin
Result:=THREFFunctionality___getHint(Self);
end;

function THREFFunctionality___getURL(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THREFFunctionality.getURL: string;
begin
Result:=THREFFunctionality___getURL(Self);
end;

procedure THREFFunctionality___setURL(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure THREFFunctionality.setURL(Value: string);
begin
THREFFunctionality___setURL(Self,   Value);
end;

function THREFFunctionality___getAutoStart(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function THREFFunctionality.getAutoStart: boolean;
begin
Result:=THREFFunctionality___getAutoStart(Self);
end;

procedure THREFFunctionality___setAutoStart(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure THREFFunctionality.setAutoStart(Value: boolean);
begin
THREFFunctionality___setAutoStart(Self,   Value);
end;


{TTQDCVisualizationFunctionality}
function TTQDCVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTQDCVisualizationFunctionality____CreateInstance(Self);
end;

function TTQDCVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTQDCVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTQDCVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality.getName: string;
begin
Result:=TTQDCVisualizationFunctionality___getName(Self);
end;

function TTQDCVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTQDCVisualizationFunctionality___getImage(Self);
end;

function TTQDCVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTQDCVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TQDCVisualizationFunctionality}
procedure TQDCVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality._ToClone(out idClone: integer);
begin
TQDCVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TQDCVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.DestroyData;
begin
TQDCVisualizationFunctionality___DestroyData(Self);
end;

procedure TQDCVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.CloneData(out idClone: integer);
begin
TQDCVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TQDCVisualizationFunctionality___GetDATA(Functionality: TFunctionality;   out DATAPtr: pointer): boolean; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.GetDATA(out DATAPtr: pointer): boolean;
begin
Result:=TQDCVisualizationFunctionality___GetDATA(Self,   DATAPtr);
end;

function TQDCVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TQDCVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TQDCVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TQDCVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TQDCVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.DATASize: integer;
begin
Result:=TQDCVisualizationFunctionality___DATASize(Self);
end;

function TQDCVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TQDCVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TQDCVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.getName: string;
begin
Result:=TQDCVisualizationFunctionality___getName(Self);
end;

function TQDCVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.getHint: string;
begin
Result:=TQDCVisualizationFunctionality___getHint(Self);
end;

procedure TQDCVisualizationFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.SetDATA(DATAStream: TByteArray);
begin
TQDCVisualizationFunctionality___SetDATA(Self,   DATAStream);
end;

procedure TQDCVisualizationFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.SetDATA1(DATAStream: TMemoryStream);
begin
TQDCVisualizationFunctionality___SetDATA1(Self,   DATAStream);
end;

procedure TQDCVisualizationFunctionality___LoadFromBitmap(Functionality: TFunctionality;   Bitmap: TByteArray); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.LoadFromBitmap(Bitmap: TByteArray);
begin
TQDCVisualizationFunctionality___LoadFromBitmap(Self,   Bitmap);
end;

procedure TQDCVisualizationFunctionality___LoadFromBitmap1(Functionality: TFunctionality;   Bitmap: TBitmap); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.LoadFromBitmap1(Bitmap: TBitmap);
begin
TQDCVisualizationFunctionality___LoadFromBitmap1(Self,   Bitmap);
end;

function TQDCVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TQDCVisualizationFunctionality___getDATAFileID(Self);
end;

procedure TQDCVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TQDCVisualizationFunctionality___setDATAFileID(Self,   Value);
end;

procedure TQDCVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.DATAFile_Clear;
begin
TQDCVisualizationFunctionality___DATAFile_Clear(Self);
end;


{TTOffersServerFunctionality}
function TTOffersServerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOffersServerFunctionality._CreateInstance: integer;
begin
Result:=TTOffersServerFunctionality____CreateInstance(Self);
end;

procedure TTOffersServerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTOffersServerFunctionality._DestroyInstance(const idObj: integer);
begin
TTOffersServerFunctionality____DestroyInstance(Self,   idObj);
end;

function TTOffersServerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOffersServerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOffersServerFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOffersServerFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOffersServerFunctionality.getName: string;
begin
Result:=TTOffersServerFunctionality___getName(Self);
end;

function TTOffersServerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOffersServerFunctionality.getImage: TTypeImage;
begin
Result:=TTOffersServerFunctionality___getImage(Self);
end;


{TOffersServerFunctionality}
procedure TOffersServerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOffersServerFunctionality._ToClone(out idClone: integer);
begin
TOffersServerFunctionality____ToClone(Self,   idClone);
end;

function TOffersServerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOffersServerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOffersServerFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOffersServerFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOffersServerFunctionality.getName: string;
begin
Result:=TOffersServerFunctionality___getName(Self);
end;

function TOffersServerFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOffersServerFunctionality.getHint: string;
begin
Result:=TOffersServerFunctionality___getHint(Self);
end;

function TOffersServerFunctionality___getMailROBOT_Inbox(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOffersServerFunctionality.getMailROBOT_Inbox: string;
begin
Result:=TOffersServerFunctionality___getMailROBOT_Inbox(Self);
end;

procedure TOffersServerFunctionality___setMailROBOT_Inbox(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOffersServerFunctionality.setMailROBOT_Inbox(Value: string);
begin
TOffersServerFunctionality___setMailROBOT_Inbox(Self,   Value);
end;

function TOffersServerFunctionality___getMailROBOT_User(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOffersServerFunctionality.getMailROBOT_User: string;
begin
Result:=TOffersServerFunctionality___getMailROBOT_User(Self);
end;

procedure TOffersServerFunctionality___setMailROBOT_User(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOffersServerFunctionality.setMailROBOT_User(Value: string);
begin
TOffersServerFunctionality___setMailROBOT_User(Self,   Value);
end;

function TOffersServerFunctionality___getMailROBOT_Password(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOffersServerFunctionality.getMailROBOT_Password: string;
begin
Result:=TOffersServerFunctionality___getMailROBOT_Password(Self);
end;

procedure TOffersServerFunctionality___setMailROBOT_Password(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOffersServerFunctionality.setMailROBOT_Password(Value: string);
begin
TOffersServerFunctionality___setMailROBOT_Password(Self,   Value);
end;


{TTSecurityComponentOperationFunctionality}
function TTSecurityComponentOperationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSecurityComponentOperationFunctionality._CreateInstance: integer;
begin
Result:=TTSecurityComponentOperationFunctionality____CreateInstance(Self);
end;

procedure TTSecurityComponentOperationFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTSecurityComponentOperationFunctionality._DestroyInstance(const idObj: integer);
begin
TTSecurityComponentOperationFunctionality____DestroyInstance(Self,   idObj);
end;

function TTSecurityComponentOperationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSecurityComponentOperationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTSecurityComponentOperationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTSecurityComponentOperationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSecurityComponentOperationFunctionality.getName: string;
begin
Result:=TTSecurityComponentOperationFunctionality___getName(Self);
end;

function TTSecurityComponentOperationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSecurityComponentOperationFunctionality.getImage: TTypeImage;
begin
Result:=TTSecurityComponentOperationFunctionality___getImage(Self);
end;

procedure TTSecurityComponentOperationFunctionality___GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall; external TypesDLL;
procedure TTSecurityComponentOperationFunctionality.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
TTSecurityComponentOperationFunctionality___GetInstanceListByContext(Self,   Context,List);
end;

procedure TTSecurityComponentOperationFunctionality___GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall; external TypesDLL;
procedure TTSecurityComponentOperationFunctionality.GetInstanceListByContext1(const Context: WideString; out List: TList);
begin
TTSecurityComponentOperationFunctionality___GetInstanceListByContext1(Self,   Context,List);
end;


{TSecurityComponentOperationFunctionality}
procedure TSecurityComponentOperationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSecurityComponentOperationFunctionality._ToClone(out idClone: integer);
begin
TSecurityComponentOperationFunctionality____ToClone(Self,   idClone);
end;

function TSecurityComponentOperationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSecurityComponentOperationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityComponentOperationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality.getName: string;
begin
Result:=TSecurityComponentOperationFunctionality___getName(Self);
end;

procedure TSecurityComponentOperationFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityComponentOperationFunctionality.setName(Value: string);
begin
TSecurityComponentOperationFunctionality___setName(Self,   Value);
end;

function TSecurityComponentOperationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality.getHint: string;
begin
Result:=TSecurityComponentOperationFunctionality___getHint(Self);
end;

function TSecurityComponentOperationFunctionality___getSQLInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality.getSQLInfo: string;
begin
Result:=TSecurityComponentOperationFunctionality___getSQLInfo(Self);
end;

procedure TSecurityComponentOperationFunctionality___setSQLInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityComponentOperationFunctionality.setSQLInfo(Value: string);
begin
TSecurityComponentOperationFunctionality___setSQLInfo(Self,   Value);
end;


{TTSecurityKeyFunctionality}
function TTSecurityKeyFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality._CreateInstance: integer;
begin
Result:=TTSecurityKeyFunctionality____CreateInstance(Self);
end;

procedure TTSecurityKeyFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTSecurityKeyFunctionality._DestroyInstance(const idObj: integer);
begin
TTSecurityKeyFunctionality____DestroyInstance(Self,   idObj);
end;

function TTSecurityKeyFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTSecurityKeyFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTSecurityKeyFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality.getName: string;
begin
Result:=TTSecurityKeyFunctionality___getName(Self);
end;

function TTSecurityKeyFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality.getImage: TTypeImage;
begin
Result:=TTSecurityKeyFunctionality___getImage(Self);
end;

function TTSecurityKeyFunctionality___GetInstanceByCode(Functionality: TFunctionality;   const Code: string;  out idInstance: integer): boolean; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality.GetInstanceByCode(const Code: string;  out idInstance: integer): boolean;
begin
Result:=TTSecurityKeyFunctionality___GetInstanceByCode(Self,   Code,idInstance);
end;

procedure TTSecurityKeyFunctionality___GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall; external TypesDLL;
procedure TTSecurityKeyFunctionality.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
TTSecurityKeyFunctionality___GetInstanceListByContext(Self,   Context,List);
end;

procedure TTSecurityKeyFunctionality___GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall; external TypesDLL;
procedure TTSecurityKeyFunctionality.GetInstanceListByContext1(const Context: WideString; out List: TList);
begin
TTSecurityKeyFunctionality___GetInstanceListByContext1(Self,   Context,List);
end;


{TSecurityKeyFunctionality}
procedure TSecurityKeyFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality._ToClone(out idClone: integer);
begin
TSecurityKeyFunctionality____ToClone(Self,   idClone);
end;

function TSecurityKeyFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSecurityKeyFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSecurityKeyFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityKeyFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityKeyFunctionality.getName: string;
begin
Result:=TSecurityKeyFunctionality___getName(Self);
end;

procedure TSecurityKeyFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality.setName(Value: string);
begin
TSecurityKeyFunctionality___setName(Self,   Value);
end;

function TSecurityKeyFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityKeyFunctionality.getHint: string;
begin
Result:=TSecurityKeyFunctionality___getHint(Self);
end;

function TSecurityKeyFunctionality___getInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityKeyFunctionality.getInfo: string;
begin
Result:=TSecurityKeyFunctionality___getInfo(Self);
end;

procedure TSecurityKeyFunctionality___setInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality.setInfo(Value: string);
begin
TSecurityKeyFunctionality___setInfo(Self,   Value);
end;

procedure TSecurityKeyFunctionality___GetAssotiatedUsers(Functionality: TFunctionality;   out Users: TByteArray); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality.GetAssotiatedUsers(out Users: TByteArray);
begin
TSecurityKeyFunctionality___GetAssotiatedUsers(Self,   Users);
end;

procedure TSecurityKeyFunctionality___GetAssotiatedUsers1(Functionality: TFunctionality;   out Users: TList); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality.GetAssotiatedUsers1(out Users: TList);
begin
TSecurityKeyFunctionality___GetAssotiatedUsers1(Self,   Users);
end;

procedure TSecurityKeyFunctionality___GenerateCode(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality.GenerateCode;
begin
TSecurityKeyFunctionality___GenerateCode(Self);
end;

function TSecurityKeyFunctionality___Code(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityKeyFunctionality.Code: string;
begin
Result:=TSecurityKeyFunctionality___Code(Self);
end;


{TTSecurityFileFunctionality}
function TTSecurityFileFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSecurityFileFunctionality._CreateInstance: integer;
begin
Result:=TTSecurityFileFunctionality____CreateInstance(Self);
end;

procedure TTSecurityFileFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTSecurityFileFunctionality._DestroyInstance(const idObj: integer);
begin
TTSecurityFileFunctionality____DestroyInstance(Self,   idObj);
end;

function TTSecurityFileFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSecurityFileFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTSecurityFileFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTSecurityFileFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSecurityFileFunctionality.getName: string;
begin
Result:=TTSecurityFileFunctionality___getName(Self);
end;

function TTSecurityFileFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSecurityFileFunctionality.getImage: TTypeImage;
begin
Result:=TTSecurityFileFunctionality___getImage(Self);
end;

procedure TTSecurityFileFunctionality___GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString;out List: TByteArray); stdcall; external TypesDLL;
procedure TTSecurityFileFunctionality.GetInstanceListByContext(const Context: WideString;out List: TByteArray);
begin
TTSecurityFileFunctionality___GetInstanceListByContext(Self,   Context,List);
end;

procedure TTSecurityFileFunctionality___GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall; external TypesDLL;
procedure TTSecurityFileFunctionality.GetInstanceListByContext1(const Context: WideString; out List: TList);
begin
TTSecurityFileFunctionality___GetInstanceListByContext1(Self,   Context,List);
end;


{TSecurityFileFunctionality}
procedure TSecurityFileFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality._ToClone(out idClone: integer);
begin
TSecurityFileFunctionality____ToClone(Self,   idClone);
end;

function TSecurityFileFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSecurityFileFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSecurityFileFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityFileFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityFileFunctionality.getName: string;
begin
Result:=TSecurityFileFunctionality___getName(Self);
end;

procedure TSecurityFileFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality.setName(Value: string);
begin
TSecurityFileFunctionality___setName(Self,   Value);
end;

function TSecurityFileFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityFileFunctionality.getHint: string;
begin
Result:=TSecurityFileFunctionality___getHint(Self);
end;

function TSecurityFileFunctionality___getInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityFileFunctionality.getInfo: string;
begin
Result:=TSecurityFileFunctionality___getInfo(Self);
end;

procedure TSecurityFileFunctionality___setInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality.setInfo(Value: string);
begin
TSecurityFileFunctionality___setInfo(Self,   Value);
end;

function TSecurityFileFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray): boolean; stdcall; external TypesDLL;
function TSecurityFileFunctionality.GetDATA(out Value: TByteArray): boolean;
begin
Result:=TSecurityFileFunctionality___GetDATA(Self,   Value);
end;

function TSecurityFileFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream): boolean; stdcall; external TypesDLL;
function TSecurityFileFunctionality.GetDATA1(out Value: TClientBlobStream): boolean;
begin
Result:=TSecurityFileFunctionality___GetDATA1(Self,   Value);
end;

procedure TSecurityFileFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality.SetDATA(Value: TByteArray);
begin
TSecurityFileFunctionality___SetDATA(Self,   Value);
end;

procedure TSecurityFileFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality.SetDATA1(Value: TMemoryStream);
begin
TSecurityFileFunctionality___SetDATA1(Self,   Value);
end;

function TSecurityFileFunctionality___AddOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall; external TypesDLL;
function TSecurityFileFunctionality.AddOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
begin
Result:=TSecurityFileFunctionality___AddOperationSecurityKey(Self,   OperationID,SecurityKeyID);
end;

function TSecurityFileFunctionality___RemoveOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall; external TypesDLL;
function TSecurityFileFunctionality.RemoveOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
begin
Result:=TSecurityFileFunctionality___RemoveOperationSecurityKey(Self,   OperationID,SecurityKeyID);
end;

procedure TSecurityFileFunctionality___GetAssotiatedSecurityComponents(Functionality: TFunctionality;   out SecurityComponents: TByteArray); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality.GetAssotiatedSecurityComponents(out SecurityComponents: TByteArray);
begin
TSecurityFileFunctionality___GetAssotiatedSecurityComponents(Self,   SecurityComponents);
end;

procedure TSecurityFileFunctionality___GetAssotiatedSecurityComponents1(Functionality: TFunctionality;   out SecurityComponents: TList); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality.GetAssotiatedSecurityComponents1(out SecurityComponents: TList);
begin
TSecurityFileFunctionality___GetAssotiatedSecurityComponents1(Self,   SecurityComponents);
end;


{TTSecurityComponentFunctionality}
function TTSecurityComponentFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSecurityComponentFunctionality._CreateInstance: integer;
begin
Result:=TTSecurityComponentFunctionality____CreateInstance(Self);
end;

procedure TTSecurityComponentFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTSecurityComponentFunctionality._DestroyInstance(const idObj: integer);
begin
TTSecurityComponentFunctionality____DestroyInstance(Self,   idObj);
end;

function TTSecurityComponentFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSecurityComponentFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTSecurityComponentFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTSecurityComponentFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSecurityComponentFunctionality.getName: string;
begin
Result:=TTSecurityComponentFunctionality___getName(Self);
end;

function TTSecurityComponentFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSecurityComponentFunctionality.getImage: TTypeImage;
begin
Result:=TTSecurityComponentFunctionality___getImage(Self);
end;

procedure TTSecurityComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTSecurityComponentFunctionality.DestroyInstance(const idObj: integer);
begin
TTSecurityComponentFunctionality___DestroyInstance(Self,   idObj);
end;


{TSecurityComponentFunctionality}
procedure TSecurityComponentFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSecurityComponentFunctionality._ToClone(out idClone: integer);
begin
TSecurityComponentFunctionality____ToClone(Self,   idClone);
end;

function TSecurityComponentFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSecurityComponentFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSecurityComponentFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TSecurityComponentFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSecurityComponentFunctionality.ToClone(out idClone: integer);
begin
TSecurityComponentFunctionality___ToClone(Self,   idClone);
end;

function TSecurityComponentFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TSecurityComponentFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TSecurityComponentFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TSecurityComponentFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentFunctionality.getName: string;
begin
Result:=TSecurityComponentFunctionality___getName(Self);
end;

function TSecurityComponentFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentFunctionality.getHint: string;
begin
Result:=TSecurityComponentFunctionality___getHint(Self);
end;

function TSecurityComponentFunctionality___getIdSecurityFile(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TSecurityComponentFunctionality.getIdSecurityFile: integer;
begin
Result:=TSecurityComponentFunctionality___getIdSecurityFile(Self);
end;

procedure TSecurityComponentFunctionality___setIdSecurityFile(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TSecurityComponentFunctionality.setIdSecurityFile(Value: integer);
begin
TSecurityComponentFunctionality___setIdSecurityFile(Self,   Value);
end;


{TTMODELUserFunctionality}
function TTMODELUserFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMODELUserFunctionality._CreateInstance: integer;
begin
Result:=TTMODELUserFunctionality____CreateInstance(Self);
end;

procedure TTMODELUserFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality._DestroyInstance(const idObj: integer);
begin
TTMODELUserFunctionality____DestroyInstance(Self,   idObj);
end;

function TTMODELUserFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMODELUserFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMODELUserFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMODELUserFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMODELUserFunctionality.getName: string;
begin
Result:=TTMODELUserFunctionality___getName(Self);
end;

function TTMODELUserFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMODELUserFunctionality.getImage: TTypeImage;
begin
Result:=TTMODELUserFunctionality___getImage(Self);
end;

function TTMODELUserFunctionality___IsUserExist(Functionality: TFunctionality;   const UserName: string; out idUser: integer): boolean; stdcall; external TypesDLL;
function TTMODELUserFunctionality.IsUserExist(const UserName: string; out idUser: integer): boolean;
begin
Result:=TTMODELUserFunctionality___IsUserExist(Self,   UserName,idUser);
end;

procedure TTMODELUserFunctionality___GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality.GetInstanceListByContext(const Context: WideString; out List: TByteArray);
begin
TTMODELUserFunctionality___GetInstanceListByContext(Self,   Context,List);
end;

procedure TTMODELUserFunctionality___GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality.GetInstanceListByContext1(const Context: WideString; out List: TList);
begin
TTMODELUserFunctionality___GetInstanceListByContext1(Self,   Context,List);
end;

procedure TTMODELUserFunctionality___GetOnlineUsersForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality.GetOnlineUsersForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
begin
TTMODELUserFunctionality___GetOnlineUsersForDomains(Self,   pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality___GetOnlineUsersForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality.GetOnlineUsersForDomains1(const pOnlineMaxDelay: Double; const pDomains: string; out List: TList);
begin
TTMODELUserFunctionality___GetOnlineUsersForDomains1(Self,   pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality___GetOnlineExpertsForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality.GetOnlineExpertsForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
begin
TTMODELUserFunctionality___GetOnlineExpertsForDomains(Self,   pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality___GetOnlineExpertsForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality.GetOnlineExpertsForDomains1(const pOnlineMaxDelay: Double; const pDomains: string; out List: TList);
begin
TTMODELUserFunctionality___GetOnlineExpertsForDomains1(Self,   pOnlineMaxDelay,pDomains,List);
end;


{TMODELUserFunctionality}
procedure TMODELUserFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality._ToClone(out idClone: integer);
begin
TMODELUserFunctionality____ToClone(Self,   idClone);
end;

function TMODELUserFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMODELUserFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMODELUserFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMODELUserFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality.getHint: string;
begin
Result:=TMODELUserFunctionality___getHint(Self);
end;

function TMODELUserFunctionality___GetActiveStateInfo(Functionality: TFunctionality;   out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.GetActiveStateInfo(out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean;
begin
Result:=TMODELUserFunctionality___GetActiveStateInfo(Self,   ProxySpaceID,ProxySpaceIP,ProxySpaceState);
end;

function TMODELUserFunctionality___IsUserOnLine(Functionality: TFunctionality;   const MaxDelay: Double): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.IsUserOnLine(const MaxDelay: Double): boolean;
begin
Result:=TMODELUserFunctionality___IsUserOnLine(Self,   MaxDelay);
end;

procedure TMODELUserFunctionality___Logout(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Logout;
begin
TMODELUserFunctionality___Logout(Self);
end;

procedure TMODELUserFunctionality___GetSecurityKeysList(Functionality: TFunctionality;   out SecurityKeys: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetSecurityKeysList(out SecurityKeys: TByteArray);
begin
TMODELUserFunctionality___GetSecurityKeysList(Self,   SecurityKeys);
end;

procedure TMODELUserFunctionality___GetSecurityKeysList1(Functionality: TFunctionality;   out SecurityKeys: TList); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetSecurityKeysList1(out SecurityKeys: TList);
begin
TMODELUserFunctionality___GetSecurityKeysList1(Self,   SecurityKeys);
end;

function TMODELUserFunctionality___SecurityKeys_IsKeyExist(Functionality: TFunctionality;   const idSecurityKey: integer): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.SecurityKeys_IsKeyExist(const idSecurityKey: integer): boolean;
begin
Result:=TMODELUserFunctionality___SecurityKeys_IsKeyExist(Self,   idSecurityKey);
end;

procedure TMODELUserFunctionality___SecurityKeys_Insert(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SecurityKeys_Insert(const idSecurityKey: integer);
begin
TMODELUserFunctionality___SecurityKeys_Insert(Self,   idSecurityKey);
end;

procedure TMODELUserFunctionality___SecurityKeys_Delete(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SecurityKeys_Delete(const idSecurityKey: integer);
begin
TMODELUserFunctionality___SecurityKeys_Delete(Self,   idSecurityKey);
end;

procedure TMODELUserFunctionality___SecurityKeys_AddKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SecurityKeys_AddKeyByCode(const Code: WideString);
begin
TMODELUserFunctionality___SecurityKeys_AddKeyByCode(Self,   Code);
end;

procedure TMODELUserFunctionality___SecurityKeys_RemoveKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SecurityKeys_RemoveKeyByCode(const Code: WideString);
begin
TMODELUserFunctionality___SecurityKeys_RemoveKeyByCode(Self,   Code);
end;

function TMODELUserFunctionality___SecurityKeys_CreateAndAddNewKey(Functionality: TFunctionality;   const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.SecurityKeys_CreateAndAddNewKey(const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer;
begin
Result:=TMODELUserFunctionality___SecurityKeys_CreateAndAddNewKey(Self,   pName,pInfo,KeyCode);
end;

procedure TMODELUserFunctionality___GetMessageBoards(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetMessageBoards(out List: TByteArray);
begin
TMODELUserFunctionality___GetMessageBoards(Self,   List);
end;

procedure TMODELUserFunctionality___GetMessageBoards1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetMessageBoards1(out List: TList);
begin
TMODELUserFunctionality___GetMessageBoards1(Self,   List);
end;

function TMODELUserFunctionality___HaveUnreadMessages(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.HaveUnreadMessages: boolean;
begin
Result:=TMODELUserFunctionality___HaveUnreadMessages(Self);
end;

procedure TMODELUserFunctionality___GetMessages(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetMessages(const flUnreadOnly: boolean; out MessageList: TByteArray);
begin
TMODELUserFunctionality___GetMessages(Self,   flUnreadOnly,MessageList);
end;

procedure TMODELUserFunctionality___GetMessages1(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TList); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetMessages1(const flUnreadOnly: boolean; out MessageList: TList);
begin
TMODELUserFunctionality___GetMessages1(Self,   flUnreadOnly,MessageList);
end;

procedure TMODELUserFunctionality___IncomingMessages_SendNew(Functionality: TFunctionality;   const Message: TByteArray; const SenderID: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_SendNew(const Message: TByteArray; const SenderID: integer);
begin
TMODELUserFunctionality___IncomingMessages_SendNew(Self,   Message,SenderID);
end;

procedure TMODELUserFunctionality___IncomingMessages_SendNew1(Functionality: TFunctionality;   const Message: TMemoryStream; const SenderID: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_SendNew1(const Message: TMemoryStream; const SenderID: integer);
begin
TMODELUserFunctionality___IncomingMessages_SendNew1(Self,   Message,SenderID);
end;

function TMODELUserFunctionality___IncomingMessages_GetUnread(Functionality: TFunctionality;   out MessageList: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.IncomingMessages_GetUnread(out MessageList: TByteArray): boolean;
begin
Result:=TMODELUserFunctionality___IncomingMessages_GetUnread(Self,   MessageList);
end;

function TMODELUserFunctionality___IncomingMessages_GetUnread1(Functionality: TFunctionality;   out MessageList: TList): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.IncomingMessages_GetUnread1(out MessageList: TList): boolean;
begin
Result:=TMODELUserFunctionality___IncomingMessages_GetUnread1(Self,   MessageList);
end;

procedure TMODELUserFunctionality___IncomingMessages_GetMessagesSince(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_GetMessagesSince(const TimeStamp: TDateTime; out MessageList: TByteArray);
begin
TMODELUserFunctionality___IncomingMessages_GetMessagesSince(Self,   TimeStamp,MessageList);
end;

procedure TMODELUserFunctionality___IncomingMessages_GetMessagesSince1(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TList); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_GetMessagesSince1(const TimeStamp: TDateTime; out MessageList: TList);
begin
TMODELUserFunctionality___IncomingMessages_GetMessagesSince1(Self,   TimeStamp,MessageList);
end;

procedure TMODELUserFunctionality___IncomingMessages_GetMessage(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_GetMessage(const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer);
begin
TMODELUserFunctionality___IncomingMessages_GetMessage(Self,   MessageID,TimeStamp,Message,SenderID);
end;

procedure TMODELUserFunctionality___IncomingMessages_GetMessage1(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: TDateTime; out Message: TClientBlobStream; out SenderID: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_GetMessage1(const MessageID: integer; out TimeStamp: TDateTime; out Message: TClientBlobStream; out SenderID: integer);
begin
TMODELUserFunctionality___IncomingMessages_GetMessage1(Self,   MessageID,TimeStamp,Message,SenderID);
end;

procedure TMODELUserFunctionality___IncomingMessages_DeleteTo(Functionality: TFunctionality;   const TimeStamp: TDateTime); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_DeleteTo(const TimeStamp: TDateTime);
begin
TMODELUserFunctionality___IncomingMessages_DeleteTo(Self,   TimeStamp);
end;

function TMODELUserFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality.getName: string;
begin
Result:=TMODELUserFunctionality___getName(Self);
end;

procedure TMODELUserFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setName(Value: string);
begin
TMODELUserFunctionality___setName(Self,   Value);
end;

function TMODELUserFunctionality___getFullName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality.getFullName: string;
begin
Result:=TMODELUserFunctionality___getFullName(Self);
end;

procedure TMODELUserFunctionality___setFullName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setFullName(Value: string);
begin
TMODELUserFunctionality___setFullName(Self,   Value);
end;

function TMODELUserFunctionality___getContactInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality.getContactInfo: string;
begin
Result:=TMODELUserFunctionality___getContactInfo(Self);
end;

procedure TMODELUserFunctionality___setContactInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setContactInfo(Value: string);
begin
TMODELUserFunctionality___setContactInfo(Self,   Value);
end;

function TMODELUserFunctionality___getPassword(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality.getPassword: string;
begin
Result:=TMODELUserFunctionality___getPassword(Self);
end;

procedure TMODELUserFunctionality___setPassword(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setPassword(Value: string);
begin
TMODELUserFunctionality___setPassword(Self,   Value);
end;

function TMODELUserFunctionality___getIdSecurityFileForClone(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getIdSecurityFileForClone: integer;
begin
Result:=TMODELUserFunctionality___getIdSecurityFileForClone(Self);
end;

procedure TMODELUserFunctionality___setIdSecurityFileForClone(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setIdSecurityFileForClone(Value: integer);
begin
TMODELUserFunctionality___setIdSecurityFileForClone(Self,   Value);
end;

function TMODELUserFunctionality___getidSecurityFileForPrivate(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getidSecurityFileForPrivate: integer;
begin
Result:=TMODELUserFunctionality___getidSecurityFileForPrivate(Self);
end;

procedure TMODELUserFunctionality___setidSecurityFileForPrivate(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setidSecurityFileForPrivate(Value: integer);
begin
TMODELUserFunctionality___setidSecurityFileForPrivate(Self,   Value);
end;

function TMODELUserFunctionality___getDATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getDATASize: integer;
begin
Result:=TMODELUserFunctionality___getDATASize(Self);
end;

procedure TMODELUserFunctionality___setDATASize(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setDATASize(Value: integer);
begin
TMODELUserFunctionality___setDATASize(Self,   Value);
end;

function TMODELUserFunctionality___getMaxDATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getMaxDATASize: integer;
begin
Result:=TMODELUserFunctionality___getMaxDATASize(Self);
end;

procedure TMODELUserFunctionality___setMaxDATASize(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setMaxDATASize(Value: integer);
begin
TMODELUserFunctionality___setMaxDATASize(Self,   Value);
end;

function TMODELUserFunctionality___getSpaceSquare(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TMODELUserFunctionality.getSpaceSquare: Double;
begin
Result:=TMODELUserFunctionality___getSpaceSquare(Self);
end;

procedure TMODELUserFunctionality___setSpaceSquare(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setSpaceSquare(Value: Double);
begin
TMODELUserFunctionality___setSpaceSquare(Self,   Value);
end;

function TMODELUserFunctionality___getMaxSpaceSquare(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getMaxSpaceSquare: integer;
begin
Result:=TMODELUserFunctionality___getMaxSpaceSquare(Self);
end;

procedure TMODELUserFunctionality___setMaxSpaceSquare(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setMaxSpaceSquare(Value: integer);
begin
TMODELUserFunctionality___setMaxSpaceSquare(Self,   Value);
end;

function TMODELUserFunctionality___getMaxSpaceSquarePerObject(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getMaxSpaceSquarePerObject: integer;
begin
Result:=TMODELUserFunctionality___getMaxSpaceSquarePerObject(Self);
end;

procedure TMODELUserFunctionality___setMaxSpaceSquarePerObject(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setMaxSpaceSquarePerObject(Value: integer);
begin
TMODELUserFunctionality___setMaxSpaceSquarePerObject(Self,   Value);
end;

function TMODELUserFunctionality___getDisabled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.getDisabled: boolean;
begin
Result:=TMODELUserFunctionality___getDisabled(Self);
end;

procedure TMODELUserFunctionality___setDisabled(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setDisabled(Value: boolean);
begin
TMODELUserFunctionality___setDisabled(Self,   Value);
end;

procedure TMODELUserFunctionality___GetStartObj(Functionality: TFunctionality;   out idTStartObj,idStartObj: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetStartObj(out idTStartObj,idStartObj: integer);
begin
TMODELUserFunctionality___GetStartObj(Self,   idTStartObj,idStartObj);
end;

procedure TMODELUserFunctionality___SetStartObj(Functionality: TFunctionality;   const idTStartObj,idStartObj: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SetStartObj(const idTStartObj,idStartObj: integer);
begin
TMODELUserFunctionality___SetStartObj(Self,   idTStartObj,idStartObj);
end;

function TMODELUserFunctionality___getDomains(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality.getDomains: string;
begin
Result:=TMODELUserFunctionality___getDomains(Self);
end;

procedure TMODELUserFunctionality___setDomains(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setDomains(Value: string);
begin
TMODELUserFunctionality___setDomains(Self,   Value);
end;

function TMODELUserFunctionality___getTaskEnabled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.getTaskEnabled: boolean;
begin
Result:=TMODELUserFunctionality___getTaskEnabled(Self);
end;

procedure TMODELUserFunctionality___setTaskEnabled(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setTaskEnabled(Value: boolean);
begin
TMODELUserFunctionality___setTaskEnabled(Self,   Value);
end;

function TMODELUserFunctionality___getBillingType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getBillingType: integer;
begin
Result:=TMODELUserFunctionality___getBillingType(Self);
end;

procedure TMODELUserFunctionality___setBillingType(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setBillingType(Value: integer);
begin
TMODELUserFunctionality___setBillingType(Self,   Value);
end;

procedure TMODELUserFunctionality___CheckDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.CheckDATASize(const pAddDATASize: integer);
begin
TMODELUserFunctionality___CheckDATASize(Self,   pAddDATASize);
end;

procedure TMODELUserFunctionality___AddDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.AddDATASize(const pAddDATASize: integer);
begin
TMODELUserFunctionality___AddDATASize(Self,   pAddDATASize);
end;

procedure TMODELUserFunctionality___SubDATASize(Functionality: TFunctionality;   const pSubDATASize: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SubDATASize(const pSubDATASize: integer);
begin
TMODELUserFunctionality___SubDATASize(Self,   pSubDATASize);
end;

procedure TMODELUserFunctionality___CheckSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.CheckSpaceSquare(const pAddSpaceSquare: Double);
begin
TMODELUserFunctionality___CheckSpaceSquare(Self,   pAddSpaceSquare);
end;

procedure TMODELUserFunctionality___AddSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.AddSpaceSquare(const pAddSpaceSquare: Double);
begin
TMODELUserFunctionality___AddSpaceSquare(Self,   pAddSpaceSquare);
end;

procedure TMODELUserFunctionality___SubSpaceSquare(Functionality: TFunctionality;   const pSubSpaceSquare: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SubSpaceSquare(const pSubSpaceSquare: Double);
begin
TMODELUserFunctionality___SubSpaceSquare(Self,   pSubSpaceSquare);
end;

procedure TMODELUserFunctionality___CheckMaxSpaceSquarePerObject(Functionality: TFunctionality;   const pObjectSpaceSquare: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.CheckMaxSpaceSquarePerObject(const pObjectSpaceSquare: Double);
begin
TMODELUserFunctionality___CheckMaxSpaceSquarePerObject(Self,   pObjectSpaceSquare);
end;

procedure TMODELUserFunctionality___ServerFolder_GetSubFoldersList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.ServerFolder_GetSubFoldersList(const RelativePath: WideString; out List: WideString);
begin
TMODELUserFunctionality___ServerFolder_GetSubFoldersList(Self,   RelativePath,List);
end;

procedure TMODELUserFunctionality___ServerFolder_GetFilesList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.ServerFolder_GetFilesList(const RelativePath: WideString; out List: WideString);
begin
TMODELUserFunctionality___ServerFolder_GetFilesList(Self,   RelativePath,List);
end;

function TMODELUserFunctionality___ServerFolder_AddFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_AddFile(const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean;
begin
Result:=TMODELUserFunctionality___ServerFolder_AddFile(Self,   RelativePath,FileName,FileData);
end;

function TMODELUserFunctionality___ServerFolder_RemoveFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_RemoveFile(const RelativePath: WideString; const FileName: WideString): boolean;
begin
Result:=TMODELUserFunctionality___ServerFolder_RemoveFile(Self,   RelativePath,FileName);
end;

function TMODELUserFunctionality___ServerFolder_ReadFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_ReadFile(const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean;
begin
Result:=TMODELUserFunctionality___ServerFolder_ReadFile(Self,   RelativePath,FileName,FileData);
end;

function TMODELUserFunctionality___ServerFolder_AddSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_AddSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;
begin
Result:=TMODELUserFunctionality___ServerFolder_AddSubFolder(Self,   RelativePath,SubFolderName);
end;

function TMODELUserFunctionality___ServerFolder_AddSubFolder1(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_AddSubFolder1(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean;
begin
Result:=TMODELUserFunctionality___ServerFolder_AddSubFolder1(Self,   RelativePath,SubFolderName,SubFolderData);
end;

function TMODELUserFunctionality___ServerFolder_RemoveSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_RemoveSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;
begin
Result:=TMODELUserFunctionality___ServerFolder_RemoveSubFolder(Self,   RelativePath,SubFolderName);
end;

function TMODELUserFunctionality___ServerFolder_ReadSubFolder(Functionality: TFunctionality;   const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_ReadSubFolder(const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean;
begin
Result:=TMODELUserFunctionality___ServerFolder_ReadSubFolder(Self,   Version,RelativePath,SubFolderName,Excludes,SubFolderData);
end;

function TMODELUserFunctionality___ServerFolder_ExchangeSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_ExchangeSubFolder(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean;
begin
Result:=TMODELUserFunctionality___ServerFolder_ExchangeSubFolder(Self,   RelativePath,SubFolderName,SubFolderInData,Excludes,SubFolderOutData);
end;

function TMODELUserFunctionality___Tasks_AddNew(Functionality: TFunctionality;   const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.Tasks_AddNew(const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer;
begin
Result:=TMODELUserFunctionality___Tasks_AddNew(Self,   pPriority,pType,pService,pTaskData,pComment);
end;

procedure TMODELUserFunctionality___Tasks_RemoveItem(Functionality: TFunctionality;   const idTask: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_RemoveItem(const idTask: integer);
begin
TMODELUserFunctionality___Tasks_RemoveItem(Self,   idTask);
end;

procedure TMODELUserFunctionality___Tasks_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Clear;
begin
TMODELUserFunctionality___Tasks_Clear(Self);
end;

procedure TMODELUserFunctionality___Tasks_GetData(Functionality: TFunctionality;   const Version: integer; const flOnlyActive: boolean; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_GetData(const Version: integer; const flOnlyActive: boolean; out oData: TByteArray);
begin
TMODELUserFunctionality___Tasks_GetData(Self,   Version,flOnlyActive,oData);
end;

procedure TMODELUserFunctionality___Tasks_Item_GetTaskData(Functionality: TFunctionality;   const idTask: integer; out oTaskData: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_GetTaskData(const idTask: integer; out oTaskData: TByteArray);
begin
TMODELUserFunctionality___Tasks_Item_GetTaskData(Self,   idTask,oTaskData);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetPriority(Functionality: TFunctionality;   const idTask: integer; const pPriority: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetPriority(const idTask: integer; const pPriority: integer);
begin
TMODELUserFunctionality___Tasks_Item_SetPriority(Self,   idTask,pPriority);
end;

procedure TMODELUserFunctionality___Tasks_Item_GetStatus(Functionality: TFunctionality;   const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_GetStatus(const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string);
begin
TMODELUserFunctionality___Tasks_Item_GetStatus(Self,   idTask,oStatus,oStatusReason,oStatusComment);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetStatus(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetStatus(const idTask: integer; const pStatus: integer; const pStatusComment: string);
begin
TMODELUserFunctionality___Tasks_Item_SetStatus(Self,   idTask,pStatus,pStatusComment);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetStatus1(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetStatus1(const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string);
begin
TMODELUserFunctionality___Tasks_Item_SetStatus1(Self,   idTask,pStatus,pStatusReason,pStatusComment);
end;

procedure TMODELUserFunctionality___Tasks_Item_GetResultData(Functionality: TFunctionality;   const idTask: integer; out oResultData: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_GetResultData(const idTask: integer; out oResultData: TByteArray);
begin
TMODELUserFunctionality___Tasks_Item_GetResultData(Self,   idTask,oResultData);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetResult(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetResult(const idTask: integer; const pResultCode: integer; const pResultComment: string);
begin
TMODELUserFunctionality___Tasks_Item_SetResult(Self,   idTask,pResultCode,pResultComment);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetResult1(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetResult1(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string);
begin
TMODELUserFunctionality___Tasks_Item_SetResult1(Self,   idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultComment);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetResult2(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetResult2(const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);
begin
TMODELUserFunctionality___Tasks_Item_SetResult2(Self,   idTask,pResultCode,pResultData,pResultComment);
end;

procedure TMODELUserFunctionality___Tasks_Item_SetResult3(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetResult3(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);
begin
TMODELUserFunctionality___Tasks_Item_SetResult3(Self,   idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultData,pResultComment);
end;

function TMODELUserFunctionality___Billing_Account(Functionality: TFunctionality): double; stdcall; external TypesDLL;
function TMODELUserFunctionality.Billing_Account: double;
begin
Result:=TMODELUserFunctionality___Billing_Account(Self);
end;

function TMODELUserFunctionality___Billing_Transactions_AddNew(Functionality: TFunctionality;   const pReason: integer; const pDelta: double; const pComment: string): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.Billing_Transactions_AddNew(const pReason: integer; const pDelta: double; const pComment: string): integer;
begin
Result:=TMODELUserFunctionality___Billing_Transactions_AddNew(Self,   pReason,pDelta,pComment);
end;

procedure TMODELUserFunctionality___Billing_Transactions_Remove(Functionality: TFunctionality;   const idTransaction: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Billing_Transactions_Remove(const idTransaction: integer);
begin
TMODELUserFunctionality___Billing_Transactions_Remove(Self,   idTransaction);
end;

procedure TMODELUserFunctionality___Billing_Transactions_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Billing_Transactions_Clear;
begin
TMODELUserFunctionality___Billing_Transactions_Clear(Self);
end;

procedure TMODELUserFunctionality___Billing_Transactions_GetData(Functionality: TFunctionality;   const Version: integer; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Billing_Transactions_GetData(const Version: integer; out oData: TByteArray);
begin
TMODELUserFunctionality___Billing_Transactions_GetData(Self,   Version,oData);
end;

procedure TMODELUserFunctionality___ClientProgram_GetReleases(Functionality: TFunctionality;   const ProgramID: integer; const Localization: WideString; out Data: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.ClientProgram_GetReleases(const ProgramID: integer; const Localization: WideString; out Data: TByteArray);
begin
TMODELUserFunctionality___ClientProgram_GetReleases(Self,   ProgramID,Localization,Data);
end;


{TTTextureFunctionality}
function TTTextureFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTextureFunctionality._CreateInstance: integer;
begin
Result:=TTTextureFunctionality____CreateInstance(Self);
end;

procedure TTTextureFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTextureFunctionality._DestroyInstance(const idObj: integer);
begin
TTTextureFunctionality____DestroyInstance(Self,   idObj);
end;

function TTTextureFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTextureFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTextureFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTextureFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTextureFunctionality.getName: string;
begin
Result:=TTTextureFunctionality___getName(Self);
end;

function TTTextureFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTextureFunctionality.getImage: TTypeImage;
begin
Result:=TTTextureFunctionality___getImage(Self);
end;

procedure TTTextureFunctionality___GetInstanceListMatchingBy(Functionality: TFunctionality;   const NameContext: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTTextureFunctionality.GetInstanceListMatchingBy(const NameContext: string; out List: TByteArray);
begin
TTTextureFunctionality___GetInstanceListMatchingBy(Self,   NameContext,List);
end;

procedure TTTextureFunctionality___GetInstanceListMatchingBy1(Functionality: TFunctionality;   const NameContext: string; out List: TList); stdcall; external TypesDLL;
procedure TTTextureFunctionality.GetInstanceListMatchingBy1(const NameContext: string; out List: TList);
begin
TTTextureFunctionality___GetInstanceListMatchingBy1(Self,   NameContext,List);
end;


{TTextureFunctionality}
procedure TTextureFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTextureFunctionality._ToClone(out idClone: integer);
begin
TTextureFunctionality____ToClone(Self,   idClone);
end;

procedure TTextureFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TTextureFunctionality.LoadFromFile(const FileName: string);
begin
TTextureFunctionality___LoadFromFile(Self,   FileName);
end;

function TTextureFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTextureFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTextureFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTextureFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTextureFunctionality.getName: string;
begin
Result:=TTextureFunctionality___getName(Self);
end;

function TTextureFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTextureFunctionality.getHint: string;
begin
Result:=TTextureFunctionality___getHint(Self);
end;

procedure TTextureFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TTextureFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TTextureFunctionality___GetDATA(Self,   DATAStream,DATAType);
end;

procedure TTextureFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType); stdcall; external TypesDLL;
procedure TTextureFunctionality.GetDATA1(out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType);
begin
TTextureFunctionality___GetDATA1(Self,   DATAStream,DATAType);
end;

procedure TTextureFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall; external TypesDLL;
procedure TTextureFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: Integer);
begin
TTextureFunctionality___SetDATA(Self,   DATAStream,DATAType);
end;

procedure TTextureFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TTextureDATAType); stdcall; external TypesDLL;
procedure TTextureFunctionality.SetDATA1(DATAStream: TMemoryStream; const DATAType: TTextureDATAType);
begin
TTextureFunctionality___SetDATA1(Self,   DATAStream,DATAType);
end;

procedure TTextureFunctionality___GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall; external TypesDLL;
procedure TTextureFunctionality.GetBitmapDATA(out BMPDATAStream: TByteArray);
begin
TTextureFunctionality___GetBitmapDATA(Self,   BMPDATAStream);
end;

procedure TTextureFunctionality___GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TTextureFunctionality.GetBitmapDATA1(out BMPDATAStream: TMemoryStream);
begin
TTextureFunctionality___GetBitmapDATA1(Self,   BMPDATAStream);
end;

procedure TTextureFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTextureFunctionality.setName(Value: string);
begin
TTextureFunctionality___setName(Self,   Value);
end;


{TTBuffered3DVisualizationFunctionality}
function TTBuffered3DVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTBuffered3DVisualizationFunctionality____CreateInstance(Self);
end;

function TTBuffered3DVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTBuffered3DVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTBuffered3DVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality.getName: string;
begin
Result:=TTBuffered3DVisualizationFunctionality___getName(Self);
end;

function TTBuffered3DVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTBuffered3DVisualizationFunctionality___getImage(Self);
end;

function TTBuffered3DVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTBuffered3DVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TBuffered3DVisualizationFunctionality}
procedure TBuffered3DVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality._ToClone(out idClone: integer);
begin
TBuffered3DVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TBuffered3DVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.DestroyData;
begin
TBuffered3DVisualizationFunctionality___DestroyData(Self);
end;

procedure TBuffered3DVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.CloneData(out idClone: integer);
begin
TBuffered3DVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TBuffered3DVisualizationFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TBuffered3DVisualizationFunctionality___LoadFromFile(Self,   FileName);
end;

procedure TBuffered3DVisualizationFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.UpdateDATA;
begin
TBuffered3DVisualizationFunctionality___UpdateDATA(Self);
end;

procedure TBuffered3DVisualizationFunctionality___GetData(Functionality: TFunctionality;   out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Double; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Double); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.GetData(out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Double; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Double);
begin
TBuffered3DVisualizationFunctionality___GetData(Self,   vMeshes,vptrTransforMatrix,vScale,vTranslate_X,vTranslate_Y,vTranslate_Z,vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ);
end;

function TBuffered3DVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TBuffered3DVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

procedure TBuffered3DVisualizationFunctionality___ReflectInScene(Functionality: TFunctionality;   Scene: TScene); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.ReflectInScene(Scene: TScene);
begin
TBuffered3DVisualizationFunctionality___ReflectInScene(Self,   Scene);
end;

function TBuffered3DVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TBuffered3DVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBuffered3DVisualizationFunctionality___DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.DATASize: integer;
begin
Result:=TBuffered3DVisualizationFunctionality___DATASize(Self);
end;

function TBuffered3DVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TBuffered3DVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TBuffered3DVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.getName: string;
begin
Result:=TBuffered3DVisualizationFunctionality___getName(Self);
end;

function TBuffered3DVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.getHint: string;
begin
Result:=TBuffered3DVisualizationFunctionality___getHint(Self);
end;

procedure TBuffered3DVisualizationFunctionality___LoadFromStream(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.LoadFromStream(DATAStream: TByteArray; const DATAType: integer);
begin
TBuffered3DVisualizationFunctionality___LoadFromStream(Self,   DATAStream,DATAType);
end;

procedure TBuffered3DVisualizationFunctionality___LoadFromStream1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.LoadFromStream1(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TBuffered3DVisualizationFunctionality___LoadFromStream1(Self,   DATAStream,DATAType);
end;

procedure TBuffered3DVisualizationFunctionality___Get__Translate_XY(Functionality: TFunctionality;   out vTranslate_X,vTranslate_Y: Double); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.Get__Translate_XY(out vTranslate_X,vTranslate_Y: Double);
begin
TBuffered3DVisualizationFunctionality___Get__Translate_XY(Self,   vTranslate_X,vTranslate_Y);
end;

procedure TBuffered3DVisualizationFunctionality___SetPropertiesLocal(Functionality: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
begin
TBuffered3DVisualizationFunctionality___SetPropertiesLocal(Self,   pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
end;

function TBuffered3DVisualizationFunctionality___GetMinMax(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix; out Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Double): boolean; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.GetMinMax(const TransforMatrix: TTransforMatrix; out Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Double): boolean;
begin
Result:=TBuffered3DVisualizationFunctionality___GetMinMax(Self,   TransforMatrix,Xmin,Ymin,Zmin,Xmax,Ymax,Zmax);
end;

procedure TBuffered3DVisualizationFunctionality___UpdateXOYProjection(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.UpdateXOYProjection;
begin
TBuffered3DVisualizationFunctionality___UpdateXOYProjection(Self);
end;

function TBuffered3DVisualizationFunctionality___getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TBuffered3DVisualizationFunctionality___getDATAFileID(Self);
end;

procedure TBuffered3DVisualizationFunctionality___setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TBuffered3DVisualizationFunctionality___setDATAFileID(Self,   Value);
end;

procedure TBuffered3DVisualizationFunctionality___DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.DATAFile_Clear;
begin
TBuffered3DVisualizationFunctionality___DATAFile_Clear(Self);
end;

function TBuffered3DVisualizationFunctionality___GetMeshesNodesApproximator(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix): TNodesApproximator; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.GetMeshesNodesApproximator(const TransforMatrix: TTransforMatrix): TNodesApproximator;
begin
Result:=TBuffered3DVisualizationFunctionality___GetMeshesNodesApproximator(Self,   TransforMatrix);
end;

procedure TBuffered3DVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.GetParams(out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double);
begin
TBuffered3DVisualizationFunctionality___GetParams(Self,   oScale,oTranslate_X,oTranslate_Y,oTranslate_Z,oRotate_AngleX,oRotate_AngleY,oRotate_AngleZ);
end;


{TTDATAFileFunctionality}
function TTDATAFileFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDATAFileFunctionality._CreateInstance: integer;
begin
Result:=TTDATAFileFunctionality____CreateInstance(Self);
end;

procedure TTDATAFileFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTDATAFileFunctionality._DestroyInstance(const idObj: integer);
begin
TTDATAFileFunctionality____DestroyInstance(Self,   idObj);
end;

function TTDATAFileFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDATAFileFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTDATAFileFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTDATAFileFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDATAFileFunctionality.getName: string;
begin
Result:=TTDATAFileFunctionality___getName(Self);
end;

function TTDATAFileFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDATAFileFunctionality.getImage: TTypeImage;
begin
Result:=TTDATAFileFunctionality___getImage(Self);
end;


{TDATAFileFunctionality}
procedure TDATAFileFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDATAFileFunctionality._ToClone(out idClone: integer);
begin
TDATAFileFunctionality____ToClone(Self,   idClone);
end;

procedure TDATAFileFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.LoadFromFile(const FileName: string);
begin
TDATAFileFunctionality___LoadFromFile(Self,   FileName);
end;

procedure TDATAFileFunctionality___SaveToFile(Functionality: TFunctionality;   var FileName: string); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.SaveToFile(var FileName: string);
begin
TDATAFileFunctionality___SaveToFile(Self,   FileName);
end;

procedure TDATAFileFunctionality___Activate(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.Activate;
begin
TDATAFileFunctionality___Activate(Self);
end;

function TDATAFileFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TDATAFileFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TDATAFileFunctionality___Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TDATAFileFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDATAFileFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TDATAFileFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDATAFileFunctionality____GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external TypesDLL;
function TDATAFileFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Result:=TDATAFileFunctionality____GetDataDocument(Self,   DataModel,DataType,flWithComponents,Document);
end;

procedure TDATAFileFunctionality___Check(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.Check;
begin
TDATAFileFunctionality___Check(Self);
end;

function TDATAFileFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDATAFileFunctionality.getName: string;
begin
Result:=TDATAFileFunctionality___getName(Self);
end;

function TDATAFileFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDATAFileFunctionality.getHint: string;
begin
Result:=TDATAFileFunctionality___getHint(Self);
end;

function TDATAFileFunctionality___IsNull(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TDATAFileFunctionality.IsNull: boolean;
begin
Result:=TDATAFileFunctionality___IsNull(Self);
end;

procedure TDATAFileFunctionality___Empty(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.Empty;
begin
TDATAFileFunctionality___Empty(Self);
end;

procedure TDATAFileFunctionality___GetDATA(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.GetDATA(out Value: TByteArray);
begin
TDATAFileFunctionality___GetDATA(Self,   Value);
end;

procedure TDATAFileFunctionality___GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.GetDATA1(out Value: TClientBlobStream);
begin
TDATAFileFunctionality___GetDATA1(Self,   Value);
end;

procedure TDATAFileFunctionality___SetDATA(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.SetDATA(Value: TByteArray);
begin
TDATAFileFunctionality___SetDATA(Self,   Value);
end;

procedure TDATAFileFunctionality___SetDATA1(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.SetDATA1(Value: TMemoryStream);
begin
TDATAFileFunctionality___SetDATA1(Self,   Value);
end;

function TDATAFileFunctionality___getDATAType(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDATAFileFunctionality.getDATAType: string;
begin
Result:=TDATAFileFunctionality___getDATAType(Self);
end;

procedure TDATAFileFunctionality___setDATAType(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.setDATAType(Value: string);
begin
TDATAFileFunctionality___setDATAType(Self,   Value);
end;


{TTCoComponentFunctionality}
function TTCoComponentFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCoComponentFunctionality._CreateInstance: integer;
begin
Result:=TTCoComponentFunctionality____CreateInstance(Self);
end;

procedure TTCoComponentFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCoComponentFunctionality._DestroyInstance(const idObj: integer);
begin
TTCoComponentFunctionality____DestroyInstance(Self,   idObj);
end;

function TTCoComponentFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoComponentFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCoComponentFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCoComponentFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoComponentFunctionality.getName: string;
begin
Result:=TTCoComponentFunctionality___getName(Self);
end;

function TTCoComponentFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCoComponentFunctionality.getImage: TTypeImage;
begin
Result:=TTCoComponentFunctionality___getImage(Self);
end;

procedure TTCoComponentFunctionality___GetInstanceListByCoType(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TByteArray); stdcall; external TypesDLL;
procedure TTCoComponentFunctionality.GetInstanceListByCoType(const idCoType: integer; out InstanceList: TByteArray);
begin
TTCoComponentFunctionality___GetInstanceListByCoType(Self,   idCoType,InstanceList);
end;

procedure TTCoComponentFunctionality___GetInstanceListByCoType1(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TList); stdcall; external TypesDLL;
procedure TTCoComponentFunctionality.GetInstanceListByCoType1(const idCoType: integer; out InstanceList: TList);
begin
TTCoComponentFunctionality___GetInstanceListByCoType1(Self,   idCoType,InstanceList);
end;


{TCoComponentFunctionality}
procedure TCoComponentFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoComponentFunctionality._ToClone(out idClone: integer);
begin
TCoComponentFunctionality____ToClone(Self,   idClone);
end;

function TCoComponentFunctionality___Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TCoComponentFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TCoComponentFunctionality___Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TCoComponentFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoComponentFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCoComponentFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentFunctionality.getName: string;
begin
Result:=TCoComponentFunctionality___getName(Self);
end;

function TCoComponentFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentFunctionality.getHint: string;
begin
Result:=TCoComponentFunctionality___getHint(Self);
end;

function TCoComponentFunctionality___idCoType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoComponentFunctionality.idCoType: integer;
begin
Result:=TCoComponentFunctionality___idCoType(Self);
end;

function TCoComponentFunctionality___GetIconImage(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall; external TypesDLL;
function TCoComponentFunctionality.GetIconImage(out oImage: TByteArray): boolean;
begin
Result:=TCoComponentFunctionality___GetIconImage(Self,   oImage);
end;

function TCoComponentFunctionality___GetIconImage1(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall; external TypesDLL;
function TCoComponentFunctionality.GetIconImage1(out Image: TBitmap): boolean;
begin
Result:=TCoComponentFunctionality___GetIconImage1(Self,   Image);
end;

function TCoComponentFunctionality___GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall; external TypesDLL;
function TCoComponentFunctionality.GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
begin
Result:=TCoComponentFunctionality___GetVisualizationComponent(Self,   idTVisualization,idVisualization);
end;


{TTCoComponentTypeMarkerFunctionality}
function TTCoComponentTypeMarkerFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCoComponentTypeMarkerFunctionality._CreateInstance: integer;
begin
Result:=TTCoComponentTypeMarkerFunctionality____CreateInstance(Self);
end;

procedure TTCoComponentTypeMarkerFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCoComponentTypeMarkerFunctionality._DestroyInstance(const idObj: integer);
begin
TTCoComponentTypeMarkerFunctionality____DestroyInstance(Self,   idObj);
end;

function TTCoComponentTypeMarkerFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoComponentTypeMarkerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCoComponentTypeMarkerFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCoComponentTypeMarkerFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoComponentTypeMarkerFunctionality.getName: string;
begin
Result:=TTCoComponentTypeMarkerFunctionality___getName(Self);
end;

function TTCoComponentTypeMarkerFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCoComponentTypeMarkerFunctionality.getImage: TTypeImage;
begin
Result:=TTCoComponentTypeMarkerFunctionality___getImage(Self);
end;


{TCoComponentTypeMarkerFunctionality}
procedure TCoComponentTypeMarkerFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoComponentTypeMarkerFunctionality._ToClone(out idClone: integer);
begin
TCoComponentTypeMarkerFunctionality____ToClone(Self,   idClone);
end;

function TCoComponentTypeMarkerFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCoComponentTypeMarkerFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentTypeMarkerFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TCoComponentTypeMarkerFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TCoComponentTypeMarkerFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.getName: string;
begin
Result:=TCoComponentTypeMarkerFunctionality___getName(Self);
end;

function TCoComponentTypeMarkerFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.getHint: string;
begin
Result:=TCoComponentTypeMarkerFunctionality___getHint(Self);
end;

function TCoComponentTypeMarkerFunctionality___GetTypeIconImage(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.GetTypeIconImage(out oImage: TByteArray): boolean;
begin
Result:=TCoComponentTypeMarkerFunctionality___GetTypeIconImage(Self,   oImage);
end;

function TCoComponentTypeMarkerFunctionality___GetTypeIconImage1(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.GetTypeIconImage1(out Image: TBitmap): boolean;
begin
Result:=TCoComponentTypeMarkerFunctionality___GetTypeIconImage1(Self,   Image);
end;

procedure TCoComponentTypeMarkerFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TCoComponentTypeMarkerFunctionality.setName(Value: string);
begin
TCoComponentTypeMarkerFunctionality___setName(Self,   Value);
end;

function TCoComponentTypeMarkerFunctionality___getIDCoComponentType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.getIDCoComponentType: integer;
begin
Result:=TCoComponentTypeMarkerFunctionality___getIDCoComponentType(Self);
end;


{TTCoComponentTypeFunctionality}
function TTCoComponentTypeFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCoComponentTypeFunctionality._CreateInstance: integer;
begin
Result:=TTCoComponentTypeFunctionality____CreateInstance(Self);
end;

procedure TTCoComponentTypeFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCoComponentTypeFunctionality._DestroyInstance(const idObj: integer);
begin
TTCoComponentTypeFunctionality____DestroyInstance(Self,   idObj);
end;

function TTCoComponentTypeFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoComponentTypeFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCoComponentTypeFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCoComponentTypeFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoComponentTypeFunctionality.getName: string;
begin
Result:=TTCoComponentTypeFunctionality___getName(Self);
end;

function TTCoComponentTypeFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCoComponentTypeFunctionality.getImage: TTypeImage;
begin
Result:=TTCoComponentTypeFunctionality___getImage(Self);
end;

procedure TTCoComponentTypeFunctionality___GetInstanceListByFileType(Functionality: TFunctionality;   const FileType: WideString; out List: TByteArray); stdcall; external TypesDLL;
procedure TTCoComponentTypeFunctionality.GetInstanceListByFileType(const FileType: WideString; out List: TByteArray);
begin
TTCoComponentTypeFunctionality___GetInstanceListByFileType(Self,   FileType,List);
end;

procedure TTCoComponentTypeFunctionality___GetInstanceListByFileType1(Functionality: TFunctionality;   const FileType: shortstring; out List: TList); stdcall; external TypesDLL;
procedure TTCoComponentTypeFunctionality.GetInstanceListByFileType1(const FileType: shortstring; out List: TList);
begin
TTCoComponentTypeFunctionality___GetInstanceListByFileType1(Self,   FileType,List);
end;


{TCoComponentTypeFunctionality}
procedure TCoComponentTypeFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality._ToClone(out idClone: integer);
begin
TCoComponentTypeFunctionality____ToClone(Self,   idClone);
end;

function TCoComponentTypeFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCoComponentTypeFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentTypeFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.getName: string;
begin
Result:=TCoComponentTypeFunctionality___getName(Self);
end;

function TCoComponentTypeFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.getHint: string;
begin
Result:=TCoComponentTypeFunctionality___getHint(Self);
end;

procedure TCoComponentTypeFunctionality___GetDescription(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.GetDescription(out Value: TByteArray);
begin
TCoComponentTypeFunctionality___GetDescription(Self,   Value);
end;

procedure TCoComponentTypeFunctionality___GetDescription1(Functionality: TFunctionality;   Value: TStringList); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.GetDescription1(Value: TStringList);
begin
TCoComponentTypeFunctionality___GetDescription1(Self,   Value);
end;

procedure TCoComponentTypeFunctionality___SetDescription(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.SetDescription(Value: TByteArray);
begin
TCoComponentTypeFunctionality___SetDescription(Self,   Value);
end;

procedure TCoComponentTypeFunctionality___SetDescription1(Functionality: TFunctionality;   Value: TStringList); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.SetDescription1(Value: TStringList);
begin
TCoComponentTypeFunctionality___SetDescription1(Self,   Value);
end;

procedure TCoComponentTypeFunctionality___GetMarkersList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.GetMarkersList(out List: TByteArray);
begin
TCoComponentTypeFunctionality___GetMarkersList(Self,   List);
end;

procedure TCoComponentTypeFunctionality___GetMarkersList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.GetMarkersList1(out List: TList);
begin
TCoComponentTypeFunctionality___GetMarkersList1(Self,   List);
end;

function TCoComponentTypeFunctionality___GetIconImage(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.GetIconImage(out oImage: TByteArray): boolean;
begin
Result:=TCoComponentTypeFunctionality___GetIconImage(Self,   oImage);
end;

function TCoComponentTypeFunctionality___GetIconImage1(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.GetIconImage1(out Image: TBitmap): boolean;
begin
Result:=TCoComponentTypeFunctionality___GetIconImage1(Self,   Image);
end;

procedure TCoComponentTypeFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.setName(Value: string);
begin
TCoComponentTypeFunctionality___setName(Self,   Value);
end;

function TCoComponentTypeFunctionality___getUID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.getUID: integer;
begin
Result:=TCoComponentTypeFunctionality___getUID(Self);
end;

function TCoComponentTypeFunctionality___getDateCreated(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.getDateCreated: TDateTime;
begin
Result:=TCoComponentTypeFunctionality___getDateCreated(Self);
end;

function TCoComponentTypeFunctionality___getFileType(Functionality: TFunctionality): shortstring; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.getFileType: shortstring;
begin
Result:=TCoComponentTypeFunctionality___getFileType(Self);
end;

procedure TCoComponentTypeFunctionality___setFileType(Functionality: TFunctionality;   Value: shortstring); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.setFileType(Value: shortstring);
begin
TCoComponentTypeFunctionality___setFileType(Self,   Value);
end;

function TCoComponentTypeFunctionality___getCoComponentPrototypeID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.getCoComponentPrototypeID: integer;
begin
Result:=TCoComponentTypeFunctionality___getCoComponentPrototypeID(Self);
end;

procedure TCoComponentTypeFunctionality___setCoComponentPrototypeID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.setCoComponentPrototypeID(Value: integer);
begin
TCoComponentTypeFunctionality___setCoComponentPrototypeID(Self,   Value);
end;


{TTAddressFunctionality}
function TTAddressFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTAddressFunctionality._CreateInstance: integer;
begin
Result:=TTAddressFunctionality____CreateInstance(Self);
end;

procedure TTAddressFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTAddressFunctionality._DestroyInstance(const idObj: integer);
begin
TTAddressFunctionality____DestroyInstance(Self,   idObj);
end;

function TTAddressFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTAddressFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTAddressFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTAddressFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTAddressFunctionality.getName: string;
begin
Result:=TTAddressFunctionality___getName(Self);
end;

function TTAddressFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTAddressFunctionality.getImage: TTypeImage;
begin
Result:=TTAddressFunctionality___getImage(Self);
end;

procedure TTAddressFunctionality___Points_GetTypeNames(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTAddressFunctionality.Points_GetTypeNames(out List: TByteArray);
begin
TTAddressFunctionality___Points_GetTypeNames(Self,   List);
end;

procedure TTAddressFunctionality___Points_GetTypeNames1(Functionality: TFunctionality;   out List: TStringList); stdcall; external TypesDLL;
procedure TTAddressFunctionality.Points_GetTypeNames1(out List: TStringList);
begin
TTAddressFunctionality___Points_GetTypeNames1(Self,   List);
end;

procedure TTAddressFunctionality___Streets_GetTypeNames(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTAddressFunctionality.Streets_GetTypeNames(out List: TByteArray);
begin
TTAddressFunctionality___Streets_GetTypeNames(Self,   List);
end;

procedure TTAddressFunctionality___Streets_GetTypeNames1(Functionality: TFunctionality;   out List: TStringList); stdcall; external TypesDLL;
procedure TTAddressFunctionality.Streets_GetTypeNames1(out List: TStringList);
begin
TTAddressFunctionality___Streets_GetTypeNames1(Self,   List);
end;


{TAddressFunctionality}
procedure TAddressFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TAddressFunctionality._ToClone(out idClone: integer);
begin
TAddressFunctionality____ToClone(Self,   idClone);
end;

function TAddressFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TAddressFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TAddressFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAddressFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality.getName: string;
begin
Result:=TAddressFunctionality___getName(Self);
end;

function TAddressFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality.getHint: string;
begin
Result:=TAddressFunctionality___getHint(Self);
end;

function TAddressFunctionality___getIdPoint(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TAddressFunctionality.getIdPoint: integer;
begin
Result:=TAddressFunctionality___getIdPoint(Self);
end;

procedure TAddressFunctionality___setIdPoint(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TAddressFunctionality.setIdPoint(Value: integer);
begin
TAddressFunctionality___setIdPoint(Self,   Value);
end;

function TAddressFunctionality___getPoint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality.getPoint: string;
begin
Result:=TAddressFunctionality___getPoint(Self);
end;

function TAddressFunctionality___getIdStreet(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TAddressFunctionality.getIdStreet: integer;
begin
Result:=TAddressFunctionality___getIdStreet(Self);
end;

procedure TAddressFunctionality___setIdStreet(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TAddressFunctionality.setIdStreet(Value: integer);
begin
TAddressFunctionality___setIdStreet(Self,   Value);
end;

function TAddressFunctionality___getStreet(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality.getStreet: string;
begin
Result:=TAddressFunctionality___getStreet(Self);
end;

function TAddressFunctionality___getHouse(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality.getHouse: string;
begin
Result:=TAddressFunctionality___getHouse(Self);
end;

procedure TAddressFunctionality___setHouse(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TAddressFunctionality.setHouse(Value: string);
begin
TAddressFunctionality___setHouse(Self,   Value);
end;

function TAddressFunctionality___getCorps(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TAddressFunctionality.getCorps: integer;
begin
Result:=TAddressFunctionality___getCorps(Self);
end;

procedure TAddressFunctionality___setCorps(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TAddressFunctionality.setCorps(Value: integer);
begin
TAddressFunctionality___setCorps(Self,   Value);
end;

function TAddressFunctionality___getApartment(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality.getApartment: string;
begin
Result:=TAddressFunctionality___getApartment(Self);
end;

procedure TAddressFunctionality___setApartment(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TAddressFunctionality.setApartment(Value: string);
begin
TAddressFunctionality___setApartment(Self,   Value);
end;

function TAddressFunctionality___getEntrance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TAddressFunctionality.getEntrance: integer;
begin
Result:=TAddressFunctionality___getEntrance(Self);
end;

procedure TAddressFunctionality___setEntrance(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TAddressFunctionality.setEntrance(Value: integer);
begin
TAddressFunctionality___setEntrance(Self,   Value);
end;


{TTTransportRouteFunctionality}
function TTTransportRouteFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTransportRouteFunctionality._CreateInstance: integer;
begin
Result:=TTTransportRouteFunctionality____CreateInstance(Self);
end;

procedure TTTransportRouteFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTransportRouteFunctionality._DestroyInstance(const idObj: integer);
begin
TTTransportRouteFunctionality____DestroyInstance(Self,   idObj);
end;

function TTTransportRouteFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTransportRouteFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTransportRouteFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTransportRouteFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTransportRouteFunctionality.getName: string;
begin
Result:=TTTransportRouteFunctionality___getName(Self);
end;

function TTTransportRouteFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTransportRouteFunctionality.getImage: TTypeImage;
begin
Result:=TTTransportRouteFunctionality___getImage(Self);
end;

procedure TTTransportRouteFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTTransportRouteFunctionality.GetInstanceList(out List: TByteArray);
begin
TTTransportRouteFunctionality___GetInstanceList(Self,   List);
end;

procedure TTTransportRouteFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTTransportRouteFunctionality.GetInstanceList1(out List: TList);
begin
TTTransportRouteFunctionality___GetInstanceList1(Self,   List);
end;


{TTransportRouteFunctionality}
procedure TTransportRouteFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality._ToClone(out idClone: integer);
begin
TTransportRouteFunctionality____ToClone(Self,   idClone);
end;

function TTransportRouteFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTransportRouteFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTransportRouteFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportRouteFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportRouteFunctionality.getName: string;
begin
Result:=TTransportRouteFunctionality___getName(Self);
end;

procedure TTransportRouteFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.setName(Value: string);
begin
TTransportRouteFunctionality___setName(Self,   Value);
end;

function TTransportRouteFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportRouteFunctionality.getHint: string;
begin
Result:=TTransportRouteFunctionality___getHint(Self);
end;

function TTransportRouteFunctionality___getidTTransport(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTransportRouteFunctionality.getidTTransport: integer;
begin
Result:=TTransportRouteFunctionality___getidTTransport(Self);
end;

procedure TTransportRouteFunctionality___setidTTransport(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.setidTTransport(Value: integer);
begin
TTransportRouteFunctionality___setidTTransport(Self,   Value);
end;

function TTransportRouteFunctionality___getValid(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTransportRouteFunctionality.getValid: boolean;
begin
Result:=TTransportRouteFunctionality___getValid(Self);
end;

procedure TTransportRouteFunctionality___setValid(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.setValid(Value: boolean);
begin
TTransportRouteFunctionality___setValid(Self,   Value);
end;

function TTransportRouteFunctionality___getRemarks(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportRouteFunctionality.getRemarks: string;
begin
Result:=TTransportRouteFunctionality___getRemarks(Self);
end;

procedure TTransportRouteFunctionality___setRemarks(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.setRemarks(Value: string);
begin
TTransportRouteFunctionality___setRemarks(Self,   Value);
end;

function TTransportRouteFunctionality___IsNodesExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTransportRouteFunctionality.IsNodesExist: boolean;
begin
Result:=TTransportRouteFunctionality___IsNodesExist(Self);
end;

procedure TTransportRouteFunctionality___Nodes_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.Nodes_GetList(out List: TByteArray);
begin
TTransportRouteFunctionality___Nodes_GetList(Self,   List);
end;

procedure TTransportRouteFunctionality___Nodes_GetList1(Functionality: TFunctionality;   out List: TRouteNodesList); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.Nodes_GetList1(out List: TRouteNodesList);
begin
TTransportRouteFunctionality___Nodes_GetList1(Self,   List);
end;

function TTransportRouteFunctionality___Nodes_IsNodeExist(Functionality: TFunctionality;   const idNode: integer): boolean; stdcall; external TypesDLL;
function TTransportRouteFunctionality.Nodes_IsNodeExist(const idNode: integer): boolean;
begin
Result:=TTransportRouteFunctionality___Nodes_IsNodeExist(Self,   idNode);
end;

procedure TTransportRouteFunctionality___Nodes_ChangeNodeOrder(Functionality: TFunctionality;   const idItem: integer; const Order: integer); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.Nodes_ChangeNodeOrder(const idItem: integer; const Order: integer);
begin
TTransportRouteFunctionality___Nodes_ChangeNodeOrder(Self,   idItem,Order);
end;

function TTransportRouteFunctionality___Nodes__Node_DistanceBefore(Functionality: TFunctionality;   const idItem: integer): integer; stdcall; external TypesDLL;
function TTransportRouteFunctionality.Nodes__Node_DistanceBefore(const idItem: integer): integer;
begin
Result:=TTransportRouteFunctionality___Nodes__Node_DistanceBefore(Self,   idItem);
end;

procedure TTransportRouteFunctionality___Nodes__Node_SetDistanceBefore(Functionality: TFunctionality;   const idItem: integer; const D: integer); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.Nodes__Node_SetDistanceBefore(const idItem: integer; const D: integer);
begin
TTransportRouteFunctionality___Nodes__Node_SetDistanceBefore(Self,   idItem,D);
end;

function TTransportRouteFunctionality___Nodes__Node_OrderPrice(Functionality: TFunctionality;   const idItem: integer): string; stdcall; external TypesDLL;
function TTransportRouteFunctionality.Nodes__Node_OrderPrice(const idItem: integer): string;
begin
Result:=TTransportRouteFunctionality___Nodes__Node_OrderPrice(Self,   idItem);
end;

procedure TTransportRouteFunctionality___Nodes__Node_SetOrderPrice(Functionality: TFunctionality;   const idItem: integer; const Price: string); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.Nodes__Node_SetOrderPrice(const idItem: integer; const Price: string);
begin
TTransportRouteFunctionality___Nodes__Node_SetOrderPrice(Self,   idItem,Price);
end;

function TTransportRouteFunctionality___Nodes_Insert(Functionality: TFunctionality;   const idNode: integer): integer; stdcall; external TypesDLL;
function TTransportRouteFunctionality.Nodes_Insert(const idNode: integer): integer;
begin
Result:=TTransportRouteFunctionality___Nodes_Insert(Self,   idNode);
end;

procedure TTransportRouteFunctionality___Nodes_Remove(Functionality: TFunctionality;   const idItem: integer); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.Nodes_Remove(const idItem: integer);
begin
TTransportRouteFunctionality___Nodes_Remove(Self,   idItem);
end;


{TTTransportNodeFunctionality}
function TTTransportNodeFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTransportNodeFunctionality._CreateInstance: integer;
begin
Result:=TTTransportNodeFunctionality____CreateInstance(Self);
end;

procedure TTTransportNodeFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTransportNodeFunctionality._DestroyInstance(const idObj: integer);
begin
TTTransportNodeFunctionality____DestroyInstance(Self,   idObj);
end;

function TTTransportNodeFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTransportNodeFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTransportNodeFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTransportNodeFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTransportNodeFunctionality.getName: string;
begin
Result:=TTTransportNodeFunctionality___getName(Self);
end;

function TTTransportNodeFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTransportNodeFunctionality.getImage: TTypeImage;
begin
Result:=TTTransportNodeFunctionality___getImage(Self);
end;

procedure TTTransportNodeFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTTransportNodeFunctionality.GetInstanceList(out List: TByteArray);
begin
TTTransportNodeFunctionality___GetInstanceList(Self,   List);
end;

procedure TTTransportNodeFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTTransportNodeFunctionality.GetInstanceList1(out List: TList);
begin
TTTransportNodeFunctionality___GetInstanceList1(Self,   List);
end;


{TTransportNodeFunctionality}
procedure TTransportNodeFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTransportNodeFunctionality._ToClone(out idClone: integer);
begin
TTransportNodeFunctionality____ToClone(Self,   idClone);
end;

function TTransportNodeFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTransportNodeFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTransportNodeFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportNodeFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportNodeFunctionality.getName: string;
begin
Result:=TTransportNodeFunctionality___getName(Self);
end;

procedure TTransportNodeFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTransportNodeFunctionality.setName(Value: string);
begin
TTransportNodeFunctionality___setName(Self,   Value);
end;

function TTransportNodeFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportNodeFunctionality.getHint: string;
begin
Result:=TTransportNodeFunctionality___getHint(Self);
end;

function TTransportNodeFunctionality___IsRoutesExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTransportNodeFunctionality.IsRoutesExist: boolean;
begin
Result:=TTransportNodeFunctionality___IsRoutesExist(Self);
end;


{TTOfferGoodsFunctionality}
function TTOfferGoodsFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOfferGoodsFunctionality._CreateInstance: integer;
begin
Result:=TTOfferGoodsFunctionality____CreateInstance(Self);
end;

procedure TTOfferGoodsFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTOfferGoodsFunctionality._DestroyInstance(const idObj: integer);
begin
TTOfferGoodsFunctionality____DestroyInstance(Self,   idObj);
end;

function TTOfferGoodsFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOfferGoodsFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOfferGoodsFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOfferGoodsFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOfferGoodsFunctionality.getName: string;
begin
Result:=TTOfferGoodsFunctionality___getName(Self);
end;

function TTOfferGoodsFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOfferGoodsFunctionality.getImage: TTypeImage;
begin
Result:=TTOfferGoodsFunctionality___getImage(Self);
end;


{TOfferGoodsFunctionality}
procedure TOfferGoodsFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality._ToClone(out idClone: integer);
begin
TOfferGoodsFunctionality____ToClone(Self,   idClone);
end;

function TOfferGoodsFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOfferGoodsFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOfferGoodsFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TOfferGoodsFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TOfferGoodsFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getName: string;
begin
Result:=TOfferGoodsFunctionality___getName(Self);
end;

function TOfferGoodsFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getHint: string;
begin
Result:=TOfferGoodsFunctionality___getHint(Self);
end;

function TOfferGoodsFunctionality___idOffer(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.idOffer: integer;
begin
Result:=TOfferGoodsFunctionality___idOffer(Self);
end;

function TOfferGoodsFunctionality___getIdGoods(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getIdGoods: integer;
begin
Result:=TOfferGoodsFunctionality___getIdGoods(Self);
end;

procedure TOfferGoodsFunctionality___setIdGoods(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality.setIdGoods(Value: integer);
begin
TOfferGoodsFunctionality___setIdGoods(Self,   Value);
end;

function TOfferGoodsFunctionality___getAmount(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getAmount: Double;
begin
Result:=TOfferGoodsFunctionality___getAmount(Self);
end;

procedure TOfferGoodsFunctionality___setAmount(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality.setAmount(Value: Double);
begin
TOfferGoodsFunctionality___setAmount(Self,   Value);
end;

function TOfferGoodsFunctionality___getIdMeasureUnit(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getIdMeasureUnit: integer;
begin
Result:=TOfferGoodsFunctionality___getIdMeasureUnit(Self);
end;

procedure TOfferGoodsFunctionality___setIdMeasureUnit(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality.setIdMeasureUnit(Value: integer);
begin
TOfferGoodsFunctionality___setIdMeasureUnit(Self,   Value);
end;

function TOfferGoodsFunctionality___getMeasureUnit(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getMeasureUnit: string;
begin
Result:=TOfferGoodsFunctionality___getMeasureUnit(Self);
end;

function TOfferGoodsFunctionality___getMinPrice(Functionality: TFunctionality): Currency; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getMinPrice: Currency;
begin
Result:=TOfferGoodsFunctionality___getMinPrice(Self);
end;

procedure TOfferGoodsFunctionality___setMinPrice(Functionality: TFunctionality;   Value: Currency); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality.setMinPrice(Value: Currency);
begin
TOfferGoodsFunctionality___setMinPrice(Self,   Value);
end;

function TOfferGoodsFunctionality___getMisc(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getMisc: string;
begin
Result:=TOfferGoodsFunctionality___getMisc(Self);
end;

procedure TOfferGoodsFunctionality___setMisc(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality.setMisc(Value: string);
begin
TOfferGoodsFunctionality___setMisc(Self,   Value);
end;


{TTTLFStationTMTFunctionality}
function TTTLFStationTMTFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTLFStationTMTFunctionality._CreateInstance: integer;
begin
Result:=TTTLFStationTMTFunctionality____CreateInstance(Self);
end;

procedure TTTLFStationTMTFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTLFStationTMTFunctionality._DestroyInstance(const idObj: integer);
begin
TTTLFStationTMTFunctionality____DestroyInstance(Self,   idObj);
end;

function TTTLFStationTMTFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTLFStationTMTFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTLFStationTMTFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTLFStationTMTFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTLFStationTMTFunctionality.getName: string;
begin
Result:=TTTLFStationTMTFunctionality___getName(Self);
end;

function TTTLFStationTMTFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTLFStationTMTFunctionality.getImage: TTypeImage;
begin
Result:=TTTLFStationTMTFunctionality___getImage(Self);
end;

procedure TTTLFStationTMTFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTTLFStationTMTFunctionality.GetInstanceList(out List: TByteArray);
begin
TTTLFStationTMTFunctionality___GetInstanceList(Self,   List);
end;

procedure TTTLFStationTMTFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTTLFStationTMTFunctionality.GetInstanceList1(out List: TList);
begin
TTTLFStationTMTFunctionality___GetInstanceList1(Self,   List);
end;


{TTLFStationTMTFunctionality}
procedure TTLFStationTMTFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTLFStationTMTFunctionality._ToClone(out idClone: integer);
begin
TTLFStationTMTFunctionality____ToClone(Self,   idClone);
end;

function TTLFStationTMTFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTLFStationTMTFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTLFStationTMTFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality.getName: string;
begin
Result:=TTLFStationTMTFunctionality___getName(Self);
end;

function TTLFStationTMTFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality.getHint: string;
begin
Result:=TTLFStationTMTFunctionality___getHint(Self);
end;

function TTLFStationTMTFunctionality___getHostName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality.getHostName: string;
begin
Result:=TTLFStationTMTFunctionality___getHostName(Self);
end;

procedure TTLFStationTMTFunctionality___setHostName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTLFStationTMTFunctionality.setHostName(Value: string);
begin
TTLFStationTMTFunctionality___setHostName(Self,   Value);
end;

function TTLFStationTMTFunctionality___getTestChanel(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality.getTestChanel: string;
begin
Result:=TTLFStationTMTFunctionality___getTestChanel(Self);
end;

procedure TTLFStationTMTFunctionality___setTestChanel(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTLFStationTMTFunctionality.setTestChanel(Value: string);
begin
TTLFStationTMTFunctionality___setTestChanel(Self,   Value);
end;


{TTNameFunctionality}
function TTNameFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTNameFunctionality._CreateInstance: integer;
begin
Result:=TTNameFunctionality____CreateInstance(Self);
end;

procedure TTNameFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTNameFunctionality._DestroyInstance(const idObj: integer);
begin
TTNameFunctionality____DestroyInstance(Self,   idObj);
end;

function TTNameFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTNameFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTNameFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTNameFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTNameFunctionality.getName: string;
begin
Result:=TTNameFunctionality___getName(Self);
end;

function TTNameFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTNameFunctionality.getImage: TTypeImage;
begin
Result:=TTNameFunctionality___getImage(Self);
end;


{TNameFunctionality}
procedure TNameFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TNameFunctionality._ToClone(out idClone: integer);
begin
TNameFunctionality____ToClone(Self,   idClone);
end;

function TNameFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TNameFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TNameFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TNameFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TNameFunctionality.getName: string;
begin
Result:=TNameFunctionality___getName(Self);
end;

function TNameFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TNameFunctionality.getHint: string;
begin
Result:=TNameFunctionality___getHint(Self);
end;

function TNameFunctionality___Value(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TNameFunctionality.Value: string;
begin
Result:=TNameFunctionality___Value(Self);
end;

procedure TNameFunctionality___SetValue(Functionality: TFunctionality;   const NewValue: string); stdcall; external TypesDLL;
procedure TNameFunctionality.SetValue(const NewValue: string);
begin
TNameFunctionality___SetValue(Self,   NewValue);
end;


{TTVisualizationFunctionality}
function TTVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTVisualizationFunctionality____CreateInstance(Self);
end;

function TTVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTVisualizationFunctionality.getName: string;
begin
Result:=TTVisualizationFunctionality___getName(Self);
end;

function TTVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTVisualizationFunctionality___getImage(Self);
end;

function TTVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TVisualizationFunctionality}
procedure TVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TVisualizationFunctionality._ToClone(out idClone: integer);
begin
TVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TVisualizationFunctionality.DestroyData;
begin
TVisualizationFunctionality___DestroyData(Self);
end;

procedure TVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TVisualizationFunctionality.CloneData(out idClone: integer);
begin
TVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TVisualizationFunctionality___ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TVisualizationFunctionality___ContainerFilled(Self);
end;

function TVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVisualizationFunctionality.getName: string;
begin
Result:=TVisualizationFunctionality___getName(Self);
end;

function TVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVisualizationFunctionality.getHint: string;
begin
Result:=TVisualizationFunctionality___getHint(Self);
end;


{TTHREFVisualizationFunctionality}
function TTHREFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHREFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHREFVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHREFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHREFVisualizationFunctionality.getName: string;
begin
Result:=TTHREFVisualizationFunctionality___getName(Self);
end;

function TTHREFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHREFVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTHREFVisualizationFunctionality___getImage(Self);
end;


{THREFVisualizationFunctionality}
function THREFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function THREFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=THREFVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function THREFVisualizationFunctionality___DoOnOver(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function THREFVisualizationFunctionality.DoOnOver: boolean;
begin
Result:=THREFVisualizationFunctionality___DoOnOver(Self);
end;

function THREFVisualizationFunctionality___DoOnClick(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function THREFVisualizationFunctionality.DoOnClick: boolean;
begin
Result:=THREFVisualizationFunctionality___DoOnClick(Self);
end;

function THREFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function THREFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=THREFVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function THREFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THREFVisualizationFunctionality.getName: string;
begin
Result:=THREFVisualizationFunctionality___getName(Self);
end;

function THREFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THREFVisualizationFunctionality.getHint: string;
begin
Result:=THREFVisualizationFunctionality___getHint(Self);
end;


{TTTTFVisualizationFunctionality}
function TTTTFVisualizationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTTTFVisualizationFunctionality____CreateInstance(Self);
end;

function TTTTFVisualizationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTTFVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTTFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality.getName: string;
begin
Result:=TTTTFVisualizationFunctionality___getName(Self);
end;

function TTTTFVisualizationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTTTFVisualizationFunctionality___getImage(Self);
end;

function TTTTFVisualizationFunctionality___StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTTTFVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TTTFVisualizationFunctionality}
procedure TTTFVisualizationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality._ToClone(out idClone: integer);
begin
TTTFVisualizationFunctionality____ToClone(Self,   idClone);
end;

procedure TTTFVisualizationFunctionality___DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality.DestroyData;
begin
TTTFVisualizationFunctionality___DestroyData(Self);
end;

procedure TTTFVisualizationFunctionality___CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality.CloneData(out idClone: integer);
begin
TTTFVisualizationFunctionality___CloneData(Self,   idClone);
end;

procedure TTTFVisualizationFunctionality___DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TTTFVisualizationFunctionality___DoOnChangeScale(Self,   ChangeCoef);
end;

function TTTFVisualizationFunctionality___Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TTTFVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TTTFVisualizationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTTFVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTTFVisualizationFunctionality___GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TTTFVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TTTFVisualizationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality.getName: string;
begin
Result:=TTTFVisualizationFunctionality___getName(Self);
end;

function TTTFVisualizationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality.getHint: string;
begin
Result:=TTTFVisualizationFunctionality___getHint(Self);
end;

function TTTFVisualizationFunctionality___getStr(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality.getStr: string;
begin
Result:=TTTFVisualizationFunctionality___getStr(Self);
end;

procedure TTTFVisualizationFunctionality___setStr(Functionality: TFunctionality;   const Value: string); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality.setStr(const Value: string);
begin
TTTFVisualizationFunctionality___setStr(Self,   Value);
end;

procedure TTTFVisualizationFunctionality___GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality.GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString);
begin
TTTFVisualizationFunctionality___GetParams(Self,   oStr,oFont_Width,oFont_Height,oFont_Name);
end;

procedure TTTFVisualizationFunctionality___SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality.SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString);
begin
TTTFVisualizationFunctionality___SetParams(Self,   pStr,pFont_Width,pFont_Height,pFont_Name);
end;


{TTObjectFunctionality}
function TTObjectFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTObjectFunctionality._CreateInstance: integer;
begin
Result:=TTObjectFunctionality____CreateInstance(Self);
end;

procedure TTObjectFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTObjectFunctionality._DestroyInstance(const idObj: integer);
begin
TTObjectFunctionality____DestroyInstance(Self,   idObj);
end;

function TTObjectFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTObjectFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTObjectFunctionality.getName: string;
begin
Result:=TTObjectFunctionality___getName(Self);
end;

function TTObjectFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTObjectFunctionality.getImage: TTypeImage;
begin
Result:=TTObjectFunctionality___getImage(Self);
end;


{TObjectFunctionality}
procedure TObjectFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TObjectFunctionality._ToClone(out idClone: integer);
begin
TObjectFunctionality____ToClone(Self,   idClone);
end;

function TObjectFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TObjectFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TObjectFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TObjectFunctionality.getName: string;
begin
Result:=TObjectFunctionality___getName(Self);
end;

function TObjectFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TObjectFunctionality.getHint: string;
begin
Result:=TObjectFunctionality___getHint(Self);
end;


{TTLabelFunctionality}
function TTLabelFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTLabelFunctionality._CreateInstance: integer;
begin
Result:=TTLabelFunctionality____CreateInstance(Self);
end;

procedure TTLabelFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTLabelFunctionality._DestroyInstance(const idObj: integer);
begin
TTLabelFunctionality____DestroyInstance(Self,   idObj);
end;

function TTLabelFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTLabelFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTLabelFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTLabelFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLabelFunctionality.getName: string;
begin
Result:=TTLabelFunctionality___getName(Self);
end;

function TTLabelFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTLabelFunctionality.getImage: TTypeImage;
begin
Result:=TTLabelFunctionality___getImage(Self);
end;


{TLabelFunctionality}
procedure TLabelFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TLabelFunctionality._ToClone(out idClone: integer);
begin
TLabelFunctionality____ToClone(Self,   idClone);
end;

function TLabelFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TLabelFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TLabelFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLabelFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TLabelFunctionality.getName: string;
begin
Result:=TLabelFunctionality___getName(Self);
end;

function TLabelFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TLabelFunctionality.getHint: string;
begin
Result:=TLabelFunctionality___getHint(Self);
end;


{TTStationFunctionality}
function TTStationFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTStationFunctionality._CreateInstance: integer;
begin
Result:=TTStationFunctionality____CreateInstance(Self);
end;

procedure TTStationFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTStationFunctionality._DestroyInstance(const idObj: integer);
begin
TTStationFunctionality____DestroyInstance(Self,   idObj);
end;

function TTStationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTStationFunctionality.getName: string;
begin
Result:=TTStationFunctionality___getName(Self);
end;

function TTStationFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTStationFunctionality.getImage: TTypeImage;
begin
Result:=TTStationFunctionality___getImage(Self);
end;

function TTStationFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTStationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTStationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

procedure TTStationFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTStationFunctionality.GetInstanceList(out List: TByteArray);
begin
TTStationFunctionality___GetInstanceList(Self,   List);
end;

procedure TTStationFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTStationFunctionality.GetInstanceList1(out List: TList);
begin
TTStationFunctionality___GetInstanceList1(Self,   List);
end;


{TStationFunctionality}
procedure TStationFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TStationFunctionality._ToClone(out idClone: integer);
begin
TStationFunctionality____ToClone(Self,   idClone);
end;

function TStationFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TStationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TStationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TStationFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TStationFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TStationFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TStationFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TStationFunctionality.getName: string;
begin
Result:=TStationFunctionality___getName(Self);
end;

function TStationFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TStationFunctionality.getHint: string;
begin
Result:=TStationFunctionality___getHint(Self);
end;

procedure TStationFunctionality___GetNumbersBound(Functionality: TFunctionality;   out BegNumber,EndNumber: integer); stdcall; external TypesDLL;
procedure TStationFunctionality.GetNumbersBound(out BegNumber,EndNumber: integer);
begin
TStationFunctionality___GetNumbersBound(Self,   BegNumber,EndNumber);
end;


{TTMainLineFunctionality}
function TTMainLineFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMainLineFunctionality._CreateInstance: integer;
begin
Result:=TTMainLineFunctionality____CreateInstance(Self);
end;

procedure TTMainLineFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMainLineFunctionality._DestroyInstance(const idObj: integer);
begin
TTMainLineFunctionality____DestroyInstance(Self,   idObj);
end;

function TTMainLineFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMainLineFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMainLineFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMainLineFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMainLineFunctionality.getName: string;
begin
Result:=TTMainLineFunctionality___getName(Self);
end;

function TTMainLineFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMainLineFunctionality.getImage: TTypeImage;
begin
Result:=TTMainLineFunctionality___getImage(Self);
end;


{TMainLineFunctionality}
procedure TMainLineFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMainLineFunctionality._ToClone(out idClone: integer);
begin
TMainLineFunctionality____ToClone(Self,   idClone);
end;

function TMainLineFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMainLineFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMainLineFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMainLineFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TMainLineFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TMainLineFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TMainLineFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMainLineFunctionality.getName: string;
begin
Result:=TMainLineFunctionality___getName(Self);
end;

function TMainLineFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMainLineFunctionality.getHint: string;
begin
Result:=TMainLineFunctionality___getHint(Self);
end;

function TMainLineFunctionality___GetSTNOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TMainLineFunctionality.GetSTNOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TMainLineFunctionality___GetSTNOwner(Self,   idTOwner,idOwner);
end;


{TTDescriptionFunctionality}
function TTDescriptionFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDescriptionFunctionality._CreateInstance: integer;
begin
Result:=TTDescriptionFunctionality____CreateInstance(Self);
end;

procedure TTDescriptionFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTDescriptionFunctionality._DestroyInstance(const idObj: integer);
begin
TTDescriptionFunctionality____DestroyInstance(Self,   idObj);
end;

function TTDescriptionFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDescriptionFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTDescriptionFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTDescriptionFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDescriptionFunctionality.getName: string;
begin
Result:=TTDescriptionFunctionality___getName(Self);
end;

function TTDescriptionFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDescriptionFunctionality.getImage: TTypeImage;
begin
Result:=TTDescriptionFunctionality___getImage(Self);
end;


{TDescriptionFunctionality}
procedure TDescriptionFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDescriptionFunctionality.UpdateDATA;
begin
TDescriptionFunctionality___UpdateDATA(Self);
end;

procedure TDescriptionFunctionality___ClearDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDescriptionFunctionality.ClearDATA;
begin
TDescriptionFunctionality___ClearDATA(Self);
end;

procedure TDescriptionFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDescriptionFunctionality._ToClone(out idClone: integer);
begin
TDescriptionFunctionality____ToClone(Self,   idClone);
end;

function TDescriptionFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDescriptionFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TDescriptionFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDescriptionFunctionality____GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external TypesDLL;
function TDescriptionFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Result:=TDescriptionFunctionality____GetDataDocument(Self,   DataModel,DataType,flWithComponents,Document);
end;

function TDescriptionFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDescriptionFunctionality.getName: string;
begin
Result:=TDescriptionFunctionality___getName(Self);
end;

function TDescriptionFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDescriptionFunctionality.getHint: string;
begin
Result:=TDescriptionFunctionality___getHint(Self);
end;

procedure TDescriptionFunctionality___GetValue(Functionality: TFunctionality;   out vText: TByteArray); stdcall; external TypesDLL;
procedure TDescriptionFunctionality.GetValue(out vText: TByteArray);
begin
TDescriptionFunctionality___GetValue(Self,   vText);
end;

procedure TDescriptionFunctionality___GetValue1(Functionality: TFunctionality;   vText: TStringList); stdcall; external TypesDLL;
procedure TDescriptionFunctionality.GetValue1(vText: TStringList);
begin
TDescriptionFunctionality___GetValue1(Self,   vText);
end;

procedure TDescriptionFunctionality___SetValue(Functionality: TFunctionality;   NewValue: TByteArray); stdcall; external TypesDLL;
procedure TDescriptionFunctionality.SetValue(NewValue: TByteArray);
begin
TDescriptionFunctionality___SetValue(Self,   NewValue);
end;

procedure TDescriptionFunctionality___SetValue1(Functionality: TFunctionality;   NewValue: TStringList); stdcall; external TypesDLL;
procedure TDescriptionFunctionality.SetValue1(NewValue: TStringList);
begin
TDescriptionFunctionality___SetValue1(Self,   NewValue);
end;


{TTImageFunctionality}
function TTImageFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTImageFunctionality._CreateInstance: integer;
begin
Result:=TTImageFunctionality____CreateInstance(Self);
end;

procedure TTImageFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTImageFunctionality._DestroyInstance(const idObj: integer);
begin
TTImageFunctionality____DestroyInstance(Self,   idObj);
end;

function TTImageFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTImageFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTImageFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTImageFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTImageFunctionality.getName: string;
begin
Result:=TTImageFunctionality___getName(Self);
end;

function TTImageFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTImageFunctionality.getImage: TTypeImage;
begin
Result:=TTImageFunctionality___getImage(Self);
end;


{TImageFunctionality}
procedure TImageFunctionality___UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TImageFunctionality.UpdateDATA;
begin
TImageFunctionality___UpdateDATA(Self);
end;

procedure TImageFunctionality___ClearDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TImageFunctionality.ClearDATA;
begin
TImageFunctionality___ClearDATA(Self);
end;

procedure TImageFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TImageFunctionality._ToClone(out idClone: integer);
begin
TImageFunctionality____ToClone(Self,   idClone);
end;

procedure TImageFunctionality___LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TImageFunctionality.LoadFromFile(const FileName: string);
begin
TImageFunctionality___LoadFromFile(Self,   FileName);
end;

function TImageFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TImageFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TImageFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TImageFunctionality____GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external TypesDLL;
function TImageFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Result:=TImageFunctionality____GetDataDocument(Self,   DataModel,DataType,flWithComponents,Document);
end;

function TImageFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TImageFunctionality.getName: string;
begin
Result:=TImageFunctionality___getName(Self);
end;

function TImageFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TImageFunctionality.getHint: string;
begin
Result:=TImageFunctionality___getHint(Self);
end;

function TImageFunctionality___GetDATAType(Functionality: TFunctionality): TImageDATAType; stdcall; external TypesDLL;
function TImageFunctionality.GetDATAType: TImageDATAType;
begin
Result:=TImageFunctionality___GetDATAType(Self);
end;

function TImageFunctionality___GetDATAType1(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TImageFunctionality.GetDATAType1: integer;
begin
Result:=TImageFunctionality___GetDATAType1(Self);
end;

procedure TImageFunctionality___GetDATA(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TImageFunctionality.GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
begin
TImageFunctionality___GetDATA(Self,   DATAStream,DATAType);
end;

procedure TImageFunctionality___GetDATA1(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall; external TypesDLL;
procedure TImageFunctionality.GetDATA1(out DATAStream: TClientBlobStream; out DATAType: TImageDATAType);
begin
TImageFunctionality___GetDATA1(Self,   DATAStream,DATAType);
end;

procedure TImageFunctionality___SetDATA(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall; external TypesDLL;
procedure TImageFunctionality.SetDATA(DATAStream: TByteArray; const DATAType: Integer);
begin
TImageFunctionality___SetDATA(Self,   DATAStream,DATAType);
end;

procedure TImageFunctionality___SetDATA1(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall; external TypesDLL;
procedure TImageFunctionality.SetDATA1(DATAStream: TMemoryStream; const DATAType: TImageDATAType);
begin
TImageFunctionality___SetDATA1(Self,   DATAStream,DATAType);
end;

procedure TImageFunctionality___GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall; external TypesDLL;
procedure TImageFunctionality.GetBitmapDATA(out BMPDATAStream: TByteArray);
begin
TImageFunctionality___GetBitmapDATA(Self,   BMPDATAStream);
end;

procedure TImageFunctionality___GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TImageFunctionality.GetBitmapDATA1(out BMPDATAStream: TMemoryStream);
begin
TImageFunctionality___GetBitmapDATA1(Self,   BMPDATAStream);
end;


{TTWellFunctionality}
function TTWellFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTWellFunctionality._CreateInstance: integer;
begin
Result:=TTWellFunctionality____CreateInstance(Self);
end;

procedure TTWellFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTWellFunctionality._DestroyInstance(const idObj: integer);
begin
TTWellFunctionality____DestroyInstance(Self,   idObj);
end;

function TTWellFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTWellFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTWellFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTWellFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTWellFunctionality.getName: string;
begin
Result:=TTWellFunctionality___getName(Self);
end;

function TTWellFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTWellFunctionality.getImage: TTypeImage;
begin
Result:=TTWellFunctionality___getImage(Self);
end;


{TWellFunctionality}
procedure TWellFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWellFunctionality._ToClone(out idClone: integer);
begin
TWellFunctionality____ToClone(Self,   idClone);
end;

function TWellFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TWellFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TWellFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWellFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWellFunctionality.getName: string;
begin
Result:=TWellFunctionality___getName(Self);
end;

function TWellFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWellFunctionality.getHint: string;
begin
Result:=TWellFunctionality___getHint(Self);
end;


{TTTLFFunctionality}
function TTTLFFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTLFFunctionality._CreateInstance: integer;
begin
Result:=TTTLFFunctionality____CreateInstance(Self);
end;

procedure TTTLFFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTLFFunctionality._DestroyInstance(const idObj: integer);
begin
TTTLFFunctionality____DestroyInstance(Self,   idObj);
end;

function TTTLFFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTLFFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTLFFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTLFFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTLFFunctionality.getName: string;
begin
Result:=TTTLFFunctionality___getName(Self);
end;

function TTTLFFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTLFFunctionality.getImage: TTypeImage;
begin
Result:=TTTLFFunctionality___getImage(Self);
end;

procedure TTTLFFunctionality___GetIDInstanceByNumber(Functionality: TFunctionality;   out ID: integer; const Number: integer); stdcall; external TypesDLL;
procedure TTTLFFunctionality.GetIDInstanceByNumber(out ID: integer; const Number: integer);
begin
TTTLFFunctionality___GetIDInstanceByNumber(Self,   ID,Number);
end;


{TTLFFunctionality}
procedure TTLFFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTLFFunctionality._ToClone(out idClone: integer);
begin
TTLFFunctionality____ToClone(Self,   idClone);
end;

function TTLFFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTLFFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTLFFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTLFFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TTLFFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TTLFFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TTLFFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFFunctionality.getName: string;
begin
Result:=TTLFFunctionality___getName(Self);
end;

function TTLFFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFFunctionality.getHint: string;
begin
Result:=TTLFFunctionality___getHint(Self);
end;

function TTLFFunctionality___Number(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTLFFunctionality.Number: integer;
begin
Result:=TTLFFunctionality___Number(Self);
end;

function TTLFFunctionality___Kind(Functionality: TFunctionality): TAbonentKind; stdcall; external TypesDLL;
function TTLFFunctionality.Kind: TAbonentKind;
begin
Result:=TTLFFunctionality___Kind(Self);
end;

function TTLFFunctionality___LocalELockExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTLFFunctionality.LocalELockExist: boolean;
begin
Result:=TTLFFunctionality___LocalELockExist(Self);
end;

function TTLFFunctionality___GlobalELockExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTLFFunctionality.GlobalELockExist: boolean;
begin
Result:=TTLFFunctionality___GlobalELockExist(Self);
end;

function TTLFFunctionality___GetFinishDevice(Functionality: TFunctionality;   out vidTObj,vidObj: integer): boolean; stdcall; external TypesDLL;
function TTLFFunctionality.GetFinishDevice(out vidTObj,vidObj: integer): boolean;
begin
Result:=TTLFFunctionality___GetFinishDevice(Self,   vidTObj,vidObj);
end;

function TTLFFunctionality___IsDamaged(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTLFFunctionality.IsDamaged: boolean;
begin
Result:=TTLFFunctionality___IsDamaged(Self);
end;

function TTLFFunctionality___idDamage(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTLFFunctionality.idDamage: integer;
begin
Result:=TTLFFunctionality___idDamage(Self);
end;

function TTLFFunctionality___getDamage_TimeNote(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TTLFFunctionality.getDamage_TimeNote: TDateTime;
begin
Result:=TTLFFunctionality___getDamage_TimeNote(Self);
end;

procedure TTLFFunctionality___setDamage_TimeNote(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
procedure TTLFFunctionality.setDamage_TimeNote(Value: TDateTime);
begin
TTLFFunctionality___setDamage_TimeNote(Self,   Value);
end;

function TTLFFunctionality___getDamage_Note(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFFunctionality.getDamage_Note: string;
begin
Result:=TTLFFunctionality___getDamage_Note(Self);
end;

procedure TTLFFunctionality___setDamage_Note(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTLFFunctionality.setDamage_Note(Value: string);
begin
TTLFFunctionality___setDamage_Note(Self,   Value);
end;

function TTLFFunctionality___getDamage_Measured(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFFunctionality.getDamage_Measured: string;
begin
Result:=TTLFFunctionality___getDamage_Measured(Self);
end;

procedure TTLFFunctionality___setDamage_Measured(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTLFFunctionality.setDamage_Measured(Value: string);
begin
TTLFFunctionality___setDamage_Measured(Self,   Value);
end;

function TTLFFunctionality___getDamage_Acceptor(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFFunctionality.getDamage_Acceptor: string;
begin
Result:=TTLFFunctionality___getDamage_Acceptor(Self);
end;

procedure TTLFFunctionality___setDamage_Acceptor(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTLFFunctionality.setDamage_Acceptor(Value: string);
begin
TTLFFunctionality___setDamage_Acceptor(Self,   Value);
end;

function TTLFFunctionality___getDamage_TimeBegRepair(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TTLFFunctionality.getDamage_TimeBegRepair: TDateTime;
begin
Result:=TTLFFunctionality___getDamage_TimeBegRepair(Self);
end;

procedure TTLFFunctionality___setDamage_TimeBegRepair(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
procedure TTLFFunctionality.setDamage_TimeBegRepair(Value: TDateTime);
begin
TTLFFunctionality___setDamage_TimeBegRepair(Self,   Value);
end;

function TTLFFunctionality___getDamage_TimeEndRepair(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TTLFFunctionality.getDamage_TimeEndRepair: TDateTime;
begin
Result:=TTLFFunctionality___getDamage_TimeEndRepair(Self);
end;

procedure TTLFFunctionality___setDamage_TimeEndRepair(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
procedure TTLFFunctionality.setDamage_TimeEndRepair(Value: TDateTime);
begin
TTLFFunctionality___setDamage_TimeEndRepair(Self,   Value);
end;

function TTLFFunctionality___getDamage_Damage(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFFunctionality.getDamage_Damage: string;
begin
Result:=TTLFFunctionality___getDamage_Damage(Self);
end;

procedure TTLFFunctionality___setDamage_Damage(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTLFFunctionality.setDamage_Damage(Value: string);
begin
TTLFFunctionality___setDamage_Damage(Self,   Value);
end;

function TTLFFunctionality___getDamage_Executor(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFFunctionality.getDamage_Executor: string;
begin
Result:=TTLFFunctionality___getDamage_Executor(Self);
end;

procedure TTLFFunctionality___setDamage_Executor(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTLFFunctionality.setDamage_Executor(Value: string);
begin
TTLFFunctionality___setDamage_Executor(Self,   Value);
end;

function TTLFFunctionality___getDamage_Remarks(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFFunctionality.getDamage_Remarks: string;
begin
Result:=TTLFFunctionality___getDamage_Remarks(Self);
end;

procedure TTLFFunctionality___setDamage_Remarks(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTLFFunctionality.setDamage_Remarks(Value: string);
begin
TTLFFunctionality___setDamage_Remarks(Self,   Value);
end;

procedure TTLFFunctionality___WriteEvent(Functionality: TFunctionality;   const Event: string; const EventTime: TDateTime); stdcall; external TypesDLL;
procedure TTLFFunctionality.WriteEvent(const Event: string; const EventTime: TDateTime);
begin
TTLFFunctionality___WriteEvent(Self,   Event,EventTime);
end;


{TTBoxFunctionality}
function TTBoxFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTBoxFunctionality._CreateInstance: integer;
begin
Result:=TTBoxFunctionality____CreateInstance(Self);
end;

procedure TTBoxFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTBoxFunctionality._DestroyInstance(const idObj: integer);
begin
TTBoxFunctionality____DestroyInstance(Self,   idObj);
end;

function TTBoxFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTBoxFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTBoxFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTBoxFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTBoxFunctionality.getName: string;
begin
Result:=TTBoxFunctionality___getName(Self);
end;

function TTBoxFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTBoxFunctionality.getImage: TTypeImage;
begin
Result:=TTBoxFunctionality___getImage(Self);
end;


{TBoxFunctionality}
procedure TBoxFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBoxFunctionality._ToClone(out idClone: integer);
begin
TBoxFunctionality____ToClone(Self,   idClone);
end;

function TBoxFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TBoxFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TBoxFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBoxFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TBoxFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TBoxFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TBoxFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBoxFunctionality.getName: string;
begin
Result:=TBoxFunctionality___getName(Self);
end;

function TBoxFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBoxFunctionality.getHint: string;
begin
Result:=TBoxFunctionality___getHint(Self);
end;


{TTCableBoxFunctionality}
function TTCableBoxFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCableBoxFunctionality._CreateInstance: integer;
begin
Result:=TTCableBoxFunctionality____CreateInstance(Self);
end;

procedure TTCableBoxFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCableBoxFunctionality._DestroyInstance(const idObj: integer);
begin
TTCableBoxFunctionality____DestroyInstance(Self,   idObj);
end;

function TTCableBoxFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCableBoxFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCableBoxFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCableBoxFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCableBoxFunctionality.getName: string;
begin
Result:=TTCableBoxFunctionality___getName(Self);
end;

function TTCableBoxFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCableBoxFunctionality.getImage: TTypeImage;
begin
Result:=TTCableBoxFunctionality___getImage(Self);
end;


{TCableBoxFunctionality}
procedure TCableBoxFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCableBoxFunctionality._ToClone(out idClone: integer);
begin
TCableBoxFunctionality____ToClone(Self,   idClone);
end;

function TCableBoxFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCableBoxFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCableBoxFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCableBoxFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCableBoxFunctionality.getName: string;
begin
Result:=TCableBoxFunctionality___getName(Self);
end;

function TCableBoxFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCableBoxFunctionality.getHint: string;
begin
Result:=TCableBoxFunctionality___getHint(Self);
end;


{TTDistrLineFunctionality}
function TTDistrLineFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDistrLineFunctionality._CreateInstance: integer;
begin
Result:=TTDistrLineFunctionality____CreateInstance(Self);
end;

procedure TTDistrLineFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTDistrLineFunctionality._DestroyInstance(const idObj: integer);
begin
TTDistrLineFunctionality____DestroyInstance(Self,   idObj);
end;

function TTDistrLineFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDistrLineFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTDistrLineFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTDistrLineFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDistrLineFunctionality.getName: string;
begin
Result:=TTDistrLineFunctionality___getName(Self);
end;

function TTDistrLineFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDistrLineFunctionality.getImage: TTypeImage;
begin
Result:=TTDistrLineFunctionality___getImage(Self);
end;


{TDistrLineFunctionality}
procedure TDistrLineFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDistrLineFunctionality._ToClone(out idClone: integer);
begin
TDistrLineFunctionality____ToClone(Self,   idClone);
end;

function TDistrLineFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDistrLineFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TDistrLineFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDistrLineFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TDistrLineFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TDistrLineFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TDistrLineFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDistrLineFunctionality.getName: string;
begin
Result:=TDistrLineFunctionality___getName(Self);
end;

function TDistrLineFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDistrLineFunctionality.getHint: string;
begin
Result:=TDistrLineFunctionality___getHint(Self);
end;


{TTClientFunctionality}
function TTClientFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTClientFunctionality._CreateInstance: integer;
begin
Result:=TTClientFunctionality____CreateInstance(Self);
end;

procedure TTClientFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTClientFunctionality._DestroyInstance(const idObj: integer);
begin
TTClientFunctionality____DestroyInstance(Self,   idObj);
end;

function TTClientFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTClientFunctionality.getName: string;
begin
Result:=TTClientFunctionality___getName(Self);
end;

function TTClientFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTClientFunctionality.getImage: TTypeImage;
begin
Result:=TTClientFunctionality___getImage(Self);
end;

function TTClientFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTClientFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTClientFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

procedure TTClientFunctionality___GetInstanceList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTClientFunctionality.GetInstanceList(out List: TByteArray);
begin
TTClientFunctionality___GetInstanceList(Self,   List);
end;

procedure TTClientFunctionality___GetInstanceList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTClientFunctionality.GetInstanceList1(out List: TList);
begin
TTClientFunctionality___GetInstanceList1(Self,   List);
end;


{TClientFunctionality}
procedure TClientFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TClientFunctionality._ToClone(out idClone: integer);
begin
TClientFunctionality____ToClone(Self,   idClone);
end;

function TClientFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TClientFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TClientFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TClientFunctionality___GetDebet(Functionality: TFunctionality;   out Value: Double): boolean; stdcall; external TypesDLL;
function TClientFunctionality.GetDebet(out Value: Double): boolean;
begin
Result:=TClientFunctionality___GetDebet(Self,   Value);
end;

function TClientFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TClientFunctionality.getName: string;
begin
Result:=TClientFunctionality___getName(Self);
end;

function TClientFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TClientFunctionality.getHint: string;
begin
Result:=TClientFunctionality___getHint(Self);
end;


{TTHouseFunctionality}
function TTHouseFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHouseFunctionality._CreateInstance: integer;
begin
Result:=TTHouseFunctionality____CreateInstance(Self);
end;

procedure TTHouseFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTHouseFunctionality._DestroyInstance(const idObj: integer);
begin
TTHouseFunctionality____DestroyInstance(Self,   idObj);
end;

function TTHouseFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHouseFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHouseFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHouseFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHouseFunctionality.getName: string;
begin
Result:=TTHouseFunctionality___getName(Self);
end;

function TTHouseFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHouseFunctionality.getImage: TTypeImage;
begin
Result:=TTHouseFunctionality___getImage(Self);
end;


{THouseFunctionality}
procedure THouseFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THouseFunctionality._ToClone(out idClone: integer);
begin
THouseFunctionality____ToClone(Self,   idClone);
end;

function THouseFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THouseFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=THouseFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THouseFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function THouseFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=THouseFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function THouseFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THouseFunctionality.getName: string;
begin
Result:=THouseFunctionality___getName(Self);
end;

function THouseFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THouseFunctionality.getHint: string;
begin
Result:=THouseFunctionality___getHint(Self);
end;


{TTCommNodeFunctionality}
function TTCommNodeFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCommNodeFunctionality._CreateInstance: integer;
begin
Result:=TTCommNodeFunctionality____CreateInstance(Self);
end;

procedure TTCommNodeFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCommNodeFunctionality._DestroyInstance(const idObj: integer);
begin
TTCommNodeFunctionality____DestroyInstance(Self,   idObj);
end;

function TTCommNodeFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCommNodeFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCommNodeFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCommNodeFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCommNodeFunctionality.getName: string;
begin
Result:=TTCommNodeFunctionality___getName(Self);
end;

function TTCommNodeFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCommNodeFunctionality.getImage: TTypeImage;
begin
Result:=TTCommNodeFunctionality___getImage(Self);
end;


{TCommNodeFunctionality}
procedure TCommNodeFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCommNodeFunctionality._ToClone(out idClone: integer);
begin
TCommNodeFunctionality____ToClone(Self,   idClone);
end;

function TCommNodeFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCommNodeFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCommNodeFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCommNodeFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCommNodeFunctionality.getName: string;
begin
Result:=TCommNodeFunctionality___getName(Self);
end;

function TCommNodeFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCommNodeFunctionality.getHint: string;
begin
Result:=TCommNodeFunctionality___getHint(Self);
end;


{TTCrossFunctionality}
function TTCrossFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCrossFunctionality._CreateInstance: integer;
begin
Result:=TTCrossFunctionality____CreateInstance(Self);
end;

procedure TTCrossFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCrossFunctionality._DestroyInstance(const idObj: integer);
begin
TTCrossFunctionality____DestroyInstance(Self,   idObj);
end;

function TTCrossFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCrossFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCrossFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCrossFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCrossFunctionality.getName: string;
begin
Result:=TTCrossFunctionality___getName(Self);
end;

function TTCrossFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCrossFunctionality.getImage: TTypeImage;
begin
Result:=TTCrossFunctionality___getImage(Self);
end;


{TCrossFunctionality}
procedure TCrossFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCrossFunctionality._ToClone(out idClone: integer);
begin
TCrossFunctionality____ToClone(Self,   idClone);
end;

function TCrossFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCrossFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCrossFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCrossFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCrossFunctionality.getName: string;
begin
Result:=TCrossFunctionality___getName(Self);
end;

function TCrossFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCrossFunctionality.getHint: string;
begin
Result:=TCrossFunctionality___getHint(Self);
end;


{TTCaseFunctionality}
function TTCaseFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCaseFunctionality._CreateInstance: integer;
begin
Result:=TTCaseFunctionality____CreateInstance(Self);
end;

procedure TTCaseFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCaseFunctionality._DestroyInstance(const idObj: integer);
begin
TTCaseFunctionality____DestroyInstance(Self,   idObj);
end;

function TTCaseFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCaseFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCaseFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCaseFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCaseFunctionality.getName: string;
begin
Result:=TTCaseFunctionality___getName(Self);
end;

function TTCaseFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCaseFunctionality.getImage: TTypeImage;
begin
Result:=TTCaseFunctionality___getImage(Self);
end;


{TCaseFunctionality}
procedure TCaseFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCaseFunctionality._ToClone(out idClone: integer);
begin
TCaseFunctionality____ToClone(Self,   idClone);
end;

function TCaseFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCaseFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCaseFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCaseFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCaseFunctionality.getName: string;
begin
Result:=TCaseFunctionality___getName(Self);
end;

function TCaseFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCaseFunctionality.getHint: string;
begin
Result:=TCaseFunctionality___getHint(Self);
end;


{TTStreetFunctionality}
function TTStreetFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTStreetFunctionality._CreateInstance: integer;
begin
Result:=TTStreetFunctionality____CreateInstance(Self);
end;

procedure TTStreetFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTStreetFunctionality._DestroyInstance(const idObj: integer);
begin
TTStreetFunctionality____DestroyInstance(Self,   idObj);
end;

function TTStreetFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTStreetFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTStreetFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTStreetFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTStreetFunctionality.getName: string;
begin
Result:=TTStreetFunctionality___getName(Self);
end;

function TTStreetFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTStreetFunctionality.getImage: TTypeImage;
begin
Result:=TTStreetFunctionality___getImage(Self);
end;


{TStreetFunctionality}
procedure TStreetFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TStreetFunctionality._ToClone(out idClone: integer);
begin
TStreetFunctionality____ToClone(Self,   idClone);
end;

function TStreetFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TStreetFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TStreetFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TStreetFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TStreetFunctionality.getName: string;
begin
Result:=TStreetFunctionality___getName(Self);
end;

function TStreetFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TStreetFunctionality.getHint: string;
begin
Result:=TStreetFunctionality___getHint(Self);
end;


{TTOtherObjFunctionality}
function TTOtherObjFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOtherObjFunctionality._CreateInstance: integer;
begin
Result:=TTOtherObjFunctionality____CreateInstance(Self);
end;

procedure TTOtherObjFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTOtherObjFunctionality._DestroyInstance(const idObj: integer);
begin
TTOtherObjFunctionality____DestroyInstance(Self,   idObj);
end;

function TTOtherObjFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOtherObjFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOtherObjFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOtherObjFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOtherObjFunctionality.getName: string;
begin
Result:=TTOtherObjFunctionality___getName(Self);
end;

function TTOtherObjFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOtherObjFunctionality.getImage: TTypeImage;
begin
Result:=TTOtherObjFunctionality___getImage(Self);
end;


{TOtherObjFunctionality}
procedure TOtherObjFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOtherObjFunctionality._ToClone(out idClone: integer);
begin
TOtherObjFunctionality____ToClone(Self,   idClone);
end;

function TOtherObjFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOtherObjFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOtherObjFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOtherObjFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOtherObjFunctionality.getName: string;
begin
Result:=TOtherObjFunctionality___getName(Self);
end;

function TOtherObjFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOtherObjFunctionality.getHint: string;
begin
Result:=TOtherObjFunctionality___getHint(Self);
end;


{TTSpanFunctionality}
function TTSpanFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSpanFunctionality._CreateInstance: integer;
begin
Result:=TTSpanFunctionality____CreateInstance(Self);
end;

procedure TTSpanFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTSpanFunctionality._DestroyInstance(const idObj: integer);
begin
TTSpanFunctionality____DestroyInstance(Self,   idObj);
end;

function TTSpanFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSpanFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTSpanFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTSpanFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSpanFunctionality.getName: string;
begin
Result:=TTSpanFunctionality___getName(Self);
end;

function TTSpanFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSpanFunctionality.getImage: TTypeImage;
begin
Result:=TTSpanFunctionality___getImage(Self);
end;


{TSpanFunctionality}
procedure TSpanFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSpanFunctionality._ToClone(out idClone: integer);
begin
TSpanFunctionality____ToClone(Self,   idClone);
end;

function TSpanFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSpanFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSpanFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSpanFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSpanFunctionality.getName: string;
begin
Result:=TSpanFunctionality___getName(Self);
end;

function TSpanFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSpanFunctionality.getHint: string;
begin
Result:=TSpanFunctionality___getHint(Self);
end;


{TTChanelFunctionality}
function TTChanelFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTChanelFunctionality._CreateInstance: integer;
begin
Result:=TTChanelFunctionality____CreateInstance(Self);
end;

procedure TTChanelFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTChanelFunctionality._DestroyInstance(const idObj: integer);
begin
TTChanelFunctionality____DestroyInstance(Self,   idObj);
end;

function TTChanelFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTChanelFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTChanelFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTChanelFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTChanelFunctionality.getName: string;
begin
Result:=TTChanelFunctionality___getName(Self);
end;

function TTChanelFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTChanelFunctionality.getImage: TTypeImage;
begin
Result:=TTChanelFunctionality___getImage(Self);
end;


{TChanelFunctionality}
procedure TChanelFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TChanelFunctionality._ToClone(out idClone: integer);
begin
TChanelFunctionality____ToClone(Self,   idClone);
end;

function TChanelFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TChanelFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TChanelFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TChanelFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TChanelFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TChanelFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TChanelFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TChanelFunctionality.getName: string;
begin
Result:=TChanelFunctionality___getName(Self);
end;

function TChanelFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TChanelFunctionality.getHint: string;
begin
Result:=TChanelFunctionality___getHint(Self);
end;


{TTHandHoldFunctionality}
function TTHandHoldFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHandHoldFunctionality._CreateInstance: integer;
begin
Result:=TTHandHoldFunctionality____CreateInstance(Self);
end;

procedure TTHandHoldFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTHandHoldFunctionality._DestroyInstance(const idObj: integer);
begin
TTHandHoldFunctionality____DestroyInstance(Self,   idObj);
end;

function TTHandHoldFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHandHoldFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHandHoldFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHandHoldFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHandHoldFunctionality.getName: string;
begin
Result:=TTHandHoldFunctionality___getName(Self);
end;

function TTHandHoldFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHandHoldFunctionality.getImage: TTypeImage;
begin
Result:=TTHandHoldFunctionality___getImage(Self);
end;


{THandHoldFunctionality}
procedure THandHoldFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THandHoldFunctionality._ToClone(out idClone: integer);
begin
THandHoldFunctionality____ToClone(Self,   idClone);
end;

function THandHoldFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THandHoldFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=THandHoldFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THandHoldFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THandHoldFunctionality.getName: string;
begin
Result:=THandHoldFunctionality___getName(Self);
end;

function THandHoldFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THandHoldFunctionality.getHint: string;
begin
Result:=THandHoldFunctionality___getHint(Self);
end;


{TTLineDistFunctionality}
function TTLineDistFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTLineDistFunctionality._CreateInstance: integer;
begin
Result:=TTLineDistFunctionality____CreateInstance(Self);
end;

procedure TTLineDistFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTLineDistFunctionality._DestroyInstance(const idObj: integer);
begin
TTLineDistFunctionality____DestroyInstance(Self,   idObj);
end;

function TTLineDistFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTLineDistFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTLineDistFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTLineDistFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLineDistFunctionality.getName: string;
begin
Result:=TTLineDistFunctionality___getName(Self);
end;

function TTLineDistFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTLineDistFunctionality.getImage: TTypeImage;
begin
Result:=TTLineDistFunctionality___getImage(Self);
end;


{TLineDistFunctionality}
procedure TLineDistFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TLineDistFunctionality._ToClone(out idClone: integer);
begin
TLineDistFunctionality____ToClone(Self,   idClone);
end;

function TLineDistFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TLineDistFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TLineDistFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLineDistFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TLineDistFunctionality.getName: string;
begin
Result:=TLineDistFunctionality___getName(Self);
end;

function TLineDistFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TLineDistFunctionality.getHint: string;
begin
Result:=TLineDistFunctionality___getHint(Self);
end;


{TTMuffFunctionality}
function TTMuffFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMuffFunctionality._CreateInstance: integer;
begin
Result:=TTMuffFunctionality____CreateInstance(Self);
end;

procedure TTMuffFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMuffFunctionality._DestroyInstance(const idObj: integer);
begin
TTMuffFunctionality____DestroyInstance(Self,   idObj);
end;

function TTMuffFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMuffFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMuffFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMuffFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMuffFunctionality.getName: string;
begin
Result:=TTMuffFunctionality___getName(Self);
end;

function TTMuffFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMuffFunctionality.getImage: TTypeImage;
begin
Result:=TTMuffFunctionality___getImage(Self);
end;


{TMuffFunctionality}
procedure TMuffFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMuffFunctionality._ToClone(out idClone: integer);
begin
TMuffFunctionality____ToClone(Self,   idClone);
end;

function TMuffFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMuffFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMuffFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMuffFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMuffFunctionality.getName: string;
begin
Result:=TMuffFunctionality___getName(Self);
end;

function TMuffFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMuffFunctionality.getHint: string;
begin
Result:=TMuffFunctionality___getHint(Self);
end;


{TTOfferFunctionality}
function TTOfferFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOfferFunctionality._CreateInstance: integer;
begin
Result:=TTOfferFunctionality____CreateInstance(Self);
end;

procedure TTOfferFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTOfferFunctionality._DestroyInstance(const idObj: integer);
begin
TTOfferFunctionality____DestroyInstance(Self,   idObj);
end;

function TTOfferFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOfferFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOfferFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOfferFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOfferFunctionality.getName: string;
begin
Result:=TTOfferFunctionality___getName(Self);
end;

function TTOfferFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOfferFunctionality.getImage: TTypeImage;
begin
Result:=TTOfferFunctionality___getImage(Self);
end;

function TTOfferFunctionality___GetOfferByHumanID(Functionality: TFunctionality;   const HumanID: integer; out idOffer: integer): boolean; stdcall; external TypesDLL;
function TTOfferFunctionality.GetOfferByHumanID(const HumanID: integer; out idOffer: integer): boolean;
begin
Result:=TTOfferFunctionality___GetOfferByHumanID(Self,   HumanID,idOffer);
end;


{TOfferFunctionality}
procedure TOfferFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOfferFunctionality._ToClone(out idClone: integer);
begin
TOfferFunctionality____ToClone(Self,   idClone);
end;

function TOfferFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOfferFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOfferFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOfferFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TOfferFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TOfferFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TOfferFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferFunctionality.getName: string;
begin
Result:=TOfferFunctionality___getName(Self);
end;

procedure TOfferFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOfferFunctionality.setName(Value: string);
begin
TOfferFunctionality___setName(Self,   Value);
end;

function TOfferFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferFunctionality.getHint: string;
begin
Result:=TOfferFunctionality___getHint(Self);
end;

function TOfferFunctionality___getSchedule(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferFunctionality.getSchedule: string;
begin
Result:=TOfferFunctionality___getSchedule(Self);
end;

procedure TOfferFunctionality___setSchedule(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOfferFunctionality.setSchedule(Value: string);
begin
TOfferFunctionality___setSchedule(Self,   Value);
end;

function TOfferFunctionality___getPassword(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferFunctionality.getPassword: string;
begin
Result:=TOfferFunctionality___getPassword(Self);
end;

procedure TOfferFunctionality___setPassword(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOfferFunctionality.setPassword(Value: string);
begin
TOfferFunctionality___setPassword(Self,   Value);
end;

function TOfferFunctionality___getContactTLF(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferFunctionality.getContactTLF: integer;
begin
Result:=TOfferFunctionality___getContactTLF(Self);
end;

procedure TOfferFunctionality___setContactTLF(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOfferFunctionality.setContactTLF(Value: integer);
begin
TOfferFunctionality___setContactTLF(Self,   Value);
end;

function TOfferFunctionality___getLastUpdated(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TOfferFunctionality.getLastUpdated: TDateTime;
begin
Result:=TOfferFunctionality___getLastUpdated(Self);
end;

procedure TOfferFunctionality___setLastUpdated(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
procedure TOfferFunctionality.setLastUpdated(Value: TDateTime);
begin
TOfferFunctionality___setLastUpdated(Self,   Value);
end;

procedure TOfferFunctionality___LoadDATAFromStream(Functionality: TFunctionality;   Stream: TByteArray); stdcall; external TypesDLL;
procedure TOfferFunctionality.LoadDATAFromStream(Stream: TByteArray);
begin
TOfferFunctionality___LoadDATAFromStream(Self,   Stream);
end;

procedure TOfferFunctionality___LoadDATAFromStream1(Functionality: TFunctionality;   Stream: TStream); stdcall; external TypesDLL;
procedure TOfferFunctionality.LoadDATAFromStream1(Stream: TStream);
begin
TOfferFunctionality___LoadDATAFromStream1(Self,   Stream);
end;

function TOfferFunctionality___UserID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferFunctionality.UserID: integer;
begin
Result:=TOfferFunctionality___UserID(Self);
end;

function TOfferFunctionality___UID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferFunctionality.UID: integer;
begin
Result:=TOfferFunctionality___UID(Self);
end;

function TOfferFunctionality___AddressStr(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferFunctionality.AddressStr: string;
begin
Result:=TOfferFunctionality___AddressStr(Self);
end;

function TOfferFunctionality___Goods_Insert(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferFunctionality.Goods_Insert: integer;
begin
Result:=TOfferFunctionality___Goods_Insert(Self);
end;

procedure TOfferFunctionality___Goods_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TOfferFunctionality.Goods_GetList(out List: TByteArray);
begin
TOfferFunctionality___Goods_GetList(Self,   List);
end;

procedure TOfferFunctionality___Goods_GetList1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TOfferFunctionality.Goods_GetList1(out List: TList);
begin
TOfferFunctionality___Goods_GetList1(Self,   List);
end;

procedure TOfferFunctionality___Goods_Remove(Functionality: TFunctionality;   const idOfferGoods: integer); stdcall; external TypesDLL;
procedure TOfferFunctionality.Goods_Remove(const idOfferGoods: integer);
begin
TOfferFunctionality___Goods_Remove(Self,   idOfferGoods);
end;

procedure TOfferFunctionality___Goods_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOfferFunctionality.Goods_Clear;
begin
TOfferFunctionality___Goods_Clear(Self);
end;


{TTDemandFunctionality}
function TTDemandFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDemandFunctionality._CreateInstance: integer;
begin
Result:=TTDemandFunctionality____CreateInstance(Self);
end;

procedure TTDemandFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTDemandFunctionality._DestroyInstance(const idObj: integer);
begin
TTDemandFunctionality____DestroyInstance(Self,   idObj);
end;

function TTDemandFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDemandFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTDemandFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTDemandFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDemandFunctionality.getName: string;
begin
Result:=TTDemandFunctionality___getName(Self);
end;

function TTDemandFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDemandFunctionality.getImage: TTypeImage;
begin
Result:=TTDemandFunctionality___getImage(Self);
end;


{TDemandFunctionality}
procedure TDemandFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDemandFunctionality._ToClone(out idClone: integer);
begin
TDemandFunctionality____ToClone(Self,   idClone);
end;

function TDemandFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDemandFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TDemandFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDemandFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TDemandFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TDemandFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TDemandFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDemandFunctionality.getName: string;
begin
Result:=TDemandFunctionality___getName(Self);
end;

function TDemandFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDemandFunctionality.getHint: string;
begin
Result:=TDemandFunctionality___getHint(Self);
end;


{TTCommLineFunctionality}
function TTCommLineFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCommLineFunctionality._CreateInstance: integer;
begin
Result:=TTCommLineFunctionality____CreateInstance(Self);
end;

procedure TTCommLineFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCommLineFunctionality._DestroyInstance(const idObj: integer);
begin
TTCommLineFunctionality____DestroyInstance(Self,   idObj);
end;

function TTCommLineFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCommLineFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCommLineFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCommLineFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCommLineFunctionality.getName: string;
begin
Result:=TTCommLineFunctionality___getName(Self);
end;

function TTCommLineFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCommLineFunctionality.getImage: TTypeImage;
begin
Result:=TTCommLineFunctionality___getImage(Self);
end;


{TCommLineFunctionality}
procedure TCommLineFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCommLineFunctionality._ToClone(out idClone: integer);
begin
TCommLineFunctionality____ToClone(Self,   idClone);
end;

function TCommLineFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCommLineFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCommLineFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCommLineFunctionality___SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TCommLineFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TCommLineFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TCommLineFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCommLineFunctionality.getName: string;
begin
Result:=TCommLineFunctionality___getName(Self);
end;

function TCommLineFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCommLineFunctionality.getHint: string;
begin
Result:=TCommLineFunctionality___getHint(Self);
end;


{TTGoodsFunctionality}
function TTGoodsFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGoodsFunctionality._CreateInstance: integer;
begin
Result:=TTGoodsFunctionality____CreateInstance(Self);
end;

procedure TTGoodsFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTGoodsFunctionality._DestroyInstance(const idObj: integer);
begin
TTGoodsFunctionality____DestroyInstance(Self,   idObj);
end;

function TTGoodsFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGoodsFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTGoodsFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTGoodsFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGoodsFunctionality.getName: string;
begin
Result:=TTGoodsFunctionality___getName(Self);
end;

function TTGoodsFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGoodsFunctionality.getImage: TTypeImage;
begin
Result:=TTGoodsFunctionality___getImage(Self);
end;

procedure TTGoodsFunctionality___GetInstanceListContainingContext(Functionality: TFunctionality;   const Context: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTGoodsFunctionality.GetInstanceListContainingContext(const Context: string; out List: TByteArray);
begin
TTGoodsFunctionality___GetInstanceListContainingContext(Self,   Context,List);
end;

procedure TTGoodsFunctionality___GetInstanceListContainingContext1(Functionality: TFunctionality;   const Context: string; out List: TStringList); stdcall; external TypesDLL;
procedure TTGoodsFunctionality.GetInstanceListContainingContext1(const Context: string; out List: TStringList);
begin
TTGoodsFunctionality___GetInstanceListContainingContext1(Self,   Context,List);
end;

function TTGoodsFunctionality___IsInstanceExist(Functionality: TFunctionality;   const pName: string; out idGoods: integer): boolean; stdcall; external TypesDLL;
function TTGoodsFunctionality.IsInstanceExist(const pName: string; out idGoods: integer): boolean;
begin
Result:=TTGoodsFunctionality___IsInstanceExist(Self,   pName,idGoods);
end;


{TGoodsFunctionality}
procedure TGoodsFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TGoodsFunctionality._ToClone(out idClone: integer);
begin
TGoodsFunctionality____ToClone(Self,   idClone);
end;

function TGoodsFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGoodsFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGoodsFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGoodsFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGoodsFunctionality.getName: string;
begin
Result:=TGoodsFunctionality___getName(Self);
end;

procedure TGoodsFunctionality___setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGoodsFunctionality.setName(Value: string);
begin
TGoodsFunctionality___setName(Self,   Value);
end;

function TGoodsFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGoodsFunctionality.getHint: string;
begin
Result:=TGoodsFunctionality___getHint(Self);
end;

function TGoodsFunctionality___StdAmount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGoodsFunctionality.StdAmount: integer;
begin
Result:=TGoodsFunctionality___StdAmount(Self);
end;

function TGoodsFunctionality___StdMeasureUnit(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGoodsFunctionality.StdMeasureUnit: string;
begin
Result:=TGoodsFunctionality___StdMeasureUnit(Self);
end;


{TTCollectionFunctionality}
function TTCollectionFunctionality____CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCollectionFunctionality._CreateInstance: integer;
begin
Result:=TTCollectionFunctionality____CreateInstance(Self);
end;

procedure TTCollectionFunctionality____DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCollectionFunctionality._DestroyInstance(const idObj: integer);
begin
TTCollectionFunctionality____DestroyInstance(Self,   idObj);
end;

function TTCollectionFunctionality___TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCollectionFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCollectionFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCollectionFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCollectionFunctionality.getName: string;
begin
Result:=TTCollectionFunctionality___getName(Self);
end;

function TTCollectionFunctionality___getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCollectionFunctionality.getImage: TTypeImage;
begin
Result:=TTCollectionFunctionality___getImage(Self);
end;


{TCollectionFunctionality}
procedure TCollectionFunctionality____ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCollectionFunctionality._ToClone(out idClone: integer);
begin
TCollectionFunctionality____ToClone(Self,   idClone);
end;

function TCollectionFunctionality___TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCollectionFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCollectionFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCollectionFunctionality___getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCollectionFunctionality.getName: string;
begin
Result:=TCollectionFunctionality___getName(Self);
end;

procedure TCollectionFunctionality___setName(Functionality: TFunctionality;   const Value: string); stdcall; external TypesDLL;
procedure TCollectionFunctionality.setName(const Value: string);
begin
TCollectionFunctionality___setName(Self,   Value);
end;

function TCollectionFunctionality___getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCollectionFunctionality.getHint: string;
begin
Result:=TCollectionFunctionality___getHint(Self);
end;

function TCollectionFunctionality___InsertItem(Functionality: TFunctionality;   const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer; stdcall; external TypesDLL;
function TCollectionFunctionality.InsertItem(const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer;
begin
Result:=TCollectionFunctionality___InsertItem(Self,   idTItem,idItem,Alias,ListOrder);
end;

procedure TCollectionFunctionality___RemoveItem(Functionality: TFunctionality;   const id: integer); stdcall; external TypesDLL;
procedure TCollectionFunctionality.RemoveItem(const id: integer);
begin
TCollectionFunctionality___RemoveItem(Self,   id);
end;

procedure TCollectionFunctionality___Item_ChangeAlias(Functionality: TFunctionality;   const id: integer; const pAlias: string); stdcall; external TypesDLL;
procedure TCollectionFunctionality.Item_ChangeAlias(const id: integer; const pAlias: string);
begin
TCollectionFunctionality___Item_ChangeAlias(Self,   id,pAlias);
end;

procedure TCollectionFunctionality___Item_ChangeListOrder(Functionality: TFunctionality;   const id: integer; const Order: integer); stdcall; external TypesDLL;
procedure TCollectionFunctionality.Item_ChangeListOrder(const id: integer; const Order: integer);
begin
TCollectionFunctionality___Item_ChangeListOrder(Self,   id,Order);
end;

procedure TCollectionFunctionality___RemoveItems(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCollectionFunctionality.RemoveItems;
begin
TCollectionFunctionality___RemoveItems(Self);
end;

function TCollectionFunctionality___IsItemExist(Functionality: TFunctionality;   const idTItem,idItem: integer): boolean; stdcall; external TypesDLL;
function TCollectionFunctionality.IsItemExist(const idTItem,idItem: integer): boolean;
begin
Result:=TCollectionFunctionality___IsItemExist(Self,   idTItem,idItem);
end;

procedure TCollectionFunctionality___GetListItems(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TCollectionFunctionality.GetListItems(out List: TByteArray);
begin
TCollectionFunctionality___GetListItems(Self,   List);
end;

procedure TCollectionFunctionality___GetListItems1(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TCollectionFunctionality.GetListItems1(out List: TList);
begin
TCollectionFunctionality___GetListItems1(Self,   List);
end;

procedure TCollectionFunctionality___SaveListItems(Functionality: TFunctionality;   const List: TByteArray); stdcall; external TypesDLL;
procedure TCollectionFunctionality.SaveListItems(const List: TByteArray);
begin
TCollectionFunctionality___SaveListItems(Self,   List);
end;

procedure TCollectionFunctionality___SaveListItems1(Functionality: TFunctionality;   List: TList); stdcall; external TypesDLL;
procedure TCollectionFunctionality.SaveListItems1(List: TList);
begin
TCollectionFunctionality___SaveListItems1(Self,   List);
end;


