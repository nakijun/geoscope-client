//. import types functionality routines implementations

{TTTileServerVisualizationFunctionality}
function TTTileServerVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTTileServerVisualizationFunctionality___CreateInstance(Self);
end;

function TTTileServerVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTileServerVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTileServerVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality.getName: string;
begin
Result:=TTTileServerVisualizationFunctionality__getName(Self);
end;

function TTTileServerVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTTileServerVisualizationFunctionality__getImage(Self);
end;

function TTTileServerVisualizationFunctionality__CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality.CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
Result:=TTTileServerVisualizationFunctionality__CheckImportInstance(Self,   ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTTileServerVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTTileServerVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTTileServerVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TTileServerVisualizationFunctionality}
procedure TTileServerVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality._ToClone(out idClone: integer);
begin
TTileServerVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TTileServerVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.DestroyData;
begin
TTileServerVisualizationFunctionality__DestroyData(Self);
end;

procedure TTileServerVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.CloneData(out idClone: integer);
begin
TTileServerVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TTileServerVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TTileServerVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TTileServerVisualizationFunctionality__ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
begin
Result:=TTileServerVisualizationFunctionality__ReflectOnCanvas(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TTileServerVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTileServerVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTileServerVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.DATASize: integer;
begin
Result:=TTileServerVisualizationFunctionality__DATASize(Self);
end;

procedure TTileServerVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetParams(const pWidth: integer; const pHeight: integer);
begin
TTileServerVisualizationFunctionality__SetParams(Self,   pWidth,pHeight);
end;

procedure TTileServerVisualizationFunctionality__SetProportion(Functionality: TFunctionality;   const Value: double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetProportion(const Value: double);
begin
TTileServerVisualizationFunctionality__SetProportion(Self,   Value);
end;

procedure TTileServerVisualizationFunctionality__Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Clear;
begin
TTileServerVisualizationFunctionality__Clear(Self);
end;

function TTileServerVisualizationFunctionality__GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.GetSegmentsStorageType: integer;
begin
Result:=TTileServerVisualizationFunctionality__GetSegmentsStorageType(Self);
end;

procedure TTileServerVisualizationFunctionality__SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetSegmentsStorageType(Value: integer);
begin
TTileServerVisualizationFunctionality__SetSegmentsStorageType(Self,   Value);
end;

function TTileServerVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TTileServerVisualizationFunctionality__ContainerFilled(Self);
end;

procedure TTileServerVisualizationFunctionality__GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GetLevelsInfoLocally(out Info: TByteArray);
begin
TTileServerVisualizationFunctionality__GetLevelsInfoLocally(Self,   Info);
end;

function TTileServerVisualizationFunctionality__TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.TLevelsPropsPanel_Create: TForm;
begin
Result:=TTileServerVisualizationFunctionality__TLevelsPropsPanel_Create(Self);
end;

procedure TTileServerVisualizationFunctionality__Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_ConvertPixPosToXY(const idLevel: integer; const PixX,PixY: integer; out X,Y: double);
begin
TTileServerVisualizationFunctionality__Level_ConvertPixPosToXY(Self,   idLevel,PixX,PixY,X,Y);
end;

procedure TTileServerVisualizationFunctionality__Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_ConvertXYToPixPos(const idLevel: integer; const X,Y: double; out PixX,PixY: integer);
begin
TTileServerVisualizationFunctionality__Level_ConvertXYToPixPos(Self,   idLevel,X,Y,PixX,PixY);
end;

function TTileServerVisualizationFunctionality__UserData_GetTileProviderID(Functionality: TFunctionality;   out oTileProviderID: integer): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.UserData_GetTileProviderID(out oTileProviderID: integer): boolean;
begin
Result:=TTileServerVisualizationFunctionality__UserData_GetTileProviderID(Self,   oTileProviderID);
end;

procedure TTileServerVisualizationFunctionality__UserData_SetTileProviderID(Functionality: TFunctionality;   const pTileProviderID: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.UserData_SetTileProviderID(const pTileProviderID: integer);
begin
TTileServerVisualizationFunctionality__UserData_SetTileProviderID(Self,   pTileProviderID);
end;

function TTileServerVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TTileServerVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TTileServerVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.getName: string;
begin
Result:=TTileServerVisualizationFunctionality__getName(Self);
end;

function TTileServerVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTileServerVisualizationFunctionality.getHint: string;
begin
Result:=TTileServerVisualizationFunctionality__getHint(Self);
end;

procedure TTileServerVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GetParams(out oWidth: integer; out oHeight: integer);
begin
TTileServerVisualizationFunctionality__GetParams(Self,   oWidth,oHeight);
end;

procedure TTileServerVisualizationFunctionality__GetParams1(Functionality: TFunctionality;   out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GetParams1(out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer);
begin
TTileServerVisualizationFunctionality__GetParams1(Self,   oServerType,oServerURL,oServerData,oTileProviderID,oWidth,oHeight);
end;

procedure TTileServerVisualizationFunctionality__SetServerType(Functionality: TFunctionality;   const Value: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetServerType(const Value: integer);
begin
TTileServerVisualizationFunctionality__SetServerType(Self,   Value);
end;

procedure TTileServerVisualizationFunctionality__SetServerURL(Functionality: TFunctionality;   const Value: string); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetServerURL(const Value: string);
begin
TTileServerVisualizationFunctionality__SetServerURL(Self,   Value);
end;

procedure TTileServerVisualizationFunctionality__SetServerData(Functionality: TFunctionality;   const pData: TMemoryStream); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetServerData(const pData: TMemoryStream);
begin
TTileServerVisualizationFunctionality__SetServerData(Self,   pData);
end;

procedure TTileServerVisualizationFunctionality__SetServerData1(Functionality: TFunctionality;   const Data: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.SetServerData1(const Data: TByteArray);
begin
TTileServerVisualizationFunctionality__SetServerData1(Self,   Data);
end;

procedure TTileServerVisualizationFunctionality__GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GenerateFromImage(DATAStream: TByteArray);
begin
TTileServerVisualizationFunctionality__GenerateFromImage(Self,   DATAStream);
end;

procedure TTileServerVisualizationFunctionality__GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GenerateFromTiles(const TilesFolder: string; const SizePowerOf2: integer);
begin
TTileServerVisualizationFunctionality__GenerateFromTiles(Self,   TilesFolder,SizePowerOf2);
end;

procedure TTileServerVisualizationFunctionality__RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.RegenerateRegionFromLevel(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
TTileServerVisualizationFunctionality__RegenerateRegionFromLevel(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TTileServerVisualizationFunctionality__RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.RegenerateRegion(const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
TTileServerVisualizationFunctionality__RegenerateRegion(Self,   XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TTileServerVisualizationFunctionality__AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.AddNewLevelAndRegenerate;
begin
TTileServerVisualizationFunctionality__AddNewLevelAndRegenerate(Self);
end;

procedure TTileServerVisualizationFunctionality__GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GetLevelsInfo(out Info: TByteArray);
begin
TTileServerVisualizationFunctionality__GetLevelsInfo(Self,   Info);
end;

procedure TTileServerVisualizationFunctionality__Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_GetParams(const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double);
begin
TTileServerVisualizationFunctionality__Level_GetParams(Self,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TTileServerVisualizationFunctionality__Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_SetParams(const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double);
begin
TTileServerVisualizationFunctionality__Level_SetParams(Self,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TTileServerVisualizationFunctionality__Level_GetSegments(Functionality: TFunctionality;   const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_GetSegments(const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray);
begin
TTileServerVisualizationFunctionality__Level_GetSegments(Self,   TileProviderID,idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
end;

procedure TTileServerVisualizationFunctionality__Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_GetSegmentsByIDs(const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray);
begin
TTileServerVisualizationFunctionality__Level_GetSegmentsByIDs(Self,   idLevel,SegmentsIDs,Segments);
end;

procedure TTileServerVisualizationFunctionality__Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_GetSegmentsHashes(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray);
begin
TTileServerVisualizationFunctionality__Level_GetSegmentsHashes(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
end;

procedure TTileServerVisualizationFunctionality__Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.Level_SetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray);
begin
TTileServerVisualizationFunctionality__Level_SetSegments(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
end;

procedure TTileServerVisualizationFunctionality__GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TTileServerVisualizationFunctionality.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TTileServerVisualizationFunctionality__GetCoordinates(Self,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;


{TTMeasurementObjectFunctionality}
function TTMeasurementObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality._CreateInstance: integer;
begin
Result:=TTMeasurementObjectFunctionality___CreateInstance(Self);
end;

procedure TTMeasurementObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMeasurementObjectFunctionality._DestroyInstance(const idObj: integer);
begin
TTMeasurementObjectFunctionality___DestroyInstance(Self,   idObj);
end;

function TTMeasurementObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMeasurementObjectFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMeasurementObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.getName: string;
begin
Result:=TTMeasurementObjectFunctionality__getName(Self);
end;

function TTMeasurementObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.getImage: TTypeImage;
begin
Result:=TTMeasurementObjectFunctionality__getImage(Self);
end;

function TTMeasurementObjectFunctionality__CreateNewInstance(Functionality: TFunctionality;   const pName: string; const pDomains: string): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.CreateNewInstance(const pName: string; const pDomains: string): integer;
begin
Result:=TTMeasurementObjectFunctionality__CreateNewInstance(Self,   pName,pDomains);
end;

function TTMeasurementObjectFunctionality__CreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.CreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
begin
Result:=TTMeasurementObjectFunctionality__CreateInstanceByGUID(Self,   pGUID,pName,pDomains);
end;

function TTMeasurementObjectFunctionality__CheckCreateInstanceByGUID(Functionality: TFunctionality;   const pGUID: string; const pName: string; const pDomains: string): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.CheckCreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
begin
Result:=TTMeasurementObjectFunctionality__CheckCreateInstanceByGUID(Self,   pGUID,pName,pDomains);
end;

procedure TTMeasurementObjectFunctionality__GetInstanceListByNameContext(Functionality: TFunctionality;   const pName: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMeasurementObjectFunctionality.GetInstanceListByNameContext(const pName: string; out List: TByteArray);
begin
TTMeasurementObjectFunctionality__GetInstanceListByNameContext(Self,   pName,List);
end;

procedure TTMeasurementObjectFunctionality__GetInstanceDataByNameContext(Functionality: TFunctionality;   const pName: string; const Version: integer; out oData: TByteArray); stdcall; external TypesDLL;
procedure TTMeasurementObjectFunctionality.GetInstanceDataByNameContext(const pName: string; const Version: integer; out oData: TByteArray);
begin
TTMeasurementObjectFunctionality__GetInstanceDataByNameContext(Self,   pName,Version,oData);
end;

function TTMeasurementObjectFunctionality__GetInstanceByGUID(Functionality: TFunctionality;   const pGUID: string): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.GetInstanceByGUID(const pGUID: string): integer;
begin
Result:=TTMeasurementObjectFunctionality__GetInstanceByGUID(Self,   pGUID);
end;

function TTMeasurementObjectFunctionality__GetInstanceByGSOMeasurement(Functionality: TFunctionality;   const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer; stdcall; external TypesDLL;
function TTMeasurementObjectFunctionality.GetInstanceByGSOMeasurement(const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer;
begin
Result:=TTMeasurementObjectFunctionality__GetInstanceByGSOMeasurement(Self,   pidGeographServerObject,pMeasurementTimeID);
end;


{TMeasurementObjectFunctionality}
procedure TMeasurementObjectFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality._ToClone(out idClone: integer);
begin
TMeasurementObjectFunctionality___ToClone(Self,   idClone);
end;

function TMeasurementObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMeasurementObjectFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMeasurementObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality.getName: string;
begin
Result:=TMeasurementObjectFunctionality__getName(Self);
end;

procedure TMeasurementObjectFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.setName(Value: string);
begin
TMeasurementObjectFunctionality__setName(Self,   Value);
end;

function TMeasurementObjectFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality.getHint: string;
begin
Result:=TMeasurementObjectFunctionality__getHint(Self);
end;

function TMeasurementObjectFunctionality__getGUID(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality.getGUID: string;
begin
Result:=TMeasurementObjectFunctionality__getGUID(Self);
end;

function TMeasurementObjectFunctionality__getDomains(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMeasurementObjectFunctionality.getDomains: string;
begin
Result:=TMeasurementObjectFunctionality__getDomains(Self);
end;

procedure TMeasurementObjectFunctionality__setDomains(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.setDomains(Value: string);
begin
TMeasurementObjectFunctionality__setDomains(Self,   Value);
end;

procedure TMeasurementObjectFunctionality__GetParams(Functionality: TFunctionality;   out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GetParams(out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string);
begin
TMeasurementObjectFunctionality__GetParams(Self,   oGUID,oidOwner,oName,oDomains);
end;

procedure TMeasurementObjectFunctionality__GSOMeasurements_GetList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GSOMeasurements_GetList(out List: TByteArray);
begin
TMeasurementObjectFunctionality__GSOMeasurements_GetList(Self,   List);
end;

procedure TMeasurementObjectFunctionality__GSOMeasurements_GetData(Functionality: TFunctionality;   const Version: integer; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GSOMeasurements_GetData(const Version: integer; out oData: TByteArray);
begin
TMeasurementObjectFunctionality__GSOMeasurements_GetData(Self,   Version,oData);
end;

procedure TMeasurementObjectFunctionality__GSOMeasurements_Item_GetParams(Functionality: TFunctionality;   const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GSOMeasurements_Item_GetParams(const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);
begin
TMeasurementObjectFunctionality__GSOMeasurements_Item_GetParams(Self,   idMeasurement,oTimeID,oidGeographServerObject,oDataType);
end;

procedure TMeasurementObjectFunctionality__GSOMeasurements_Item_GetParams1(Functionality: TFunctionality;   const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GSOMeasurements_Item_GetParams1(const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);
begin
TMeasurementObjectFunctionality__GSOMeasurements_Item_GetParams1(Self,   TimeID,oidGeographServerObject,oDataType);
end;

procedure TMeasurementObjectFunctionality__GSOMeasurements_Item_GetData(Functionality: TFunctionality;   const idMeasurement: integer; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GSOMeasurements_Item_GetData(const idMeasurement: integer; out oData: TByteArray);
begin
TMeasurementObjectFunctionality__GSOMeasurements_Item_GetData(Self,   idMeasurement,oData);
end;

procedure TMeasurementObjectFunctionality__GSOMeasurements_Item_GetData1(Functionality: TFunctionality;   const TimeID: Double; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMeasurementObjectFunctionality.GSOMeasurements_Item_GetData1(const TimeID: Double; out oData: TByteArray);
begin
TMeasurementObjectFunctionality__GSOMeasurements_Item_GetData1(Self,   TimeID,oData);
end;


{TTAreaNotificationServerFunctionality}
function TTAreaNotificationServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTAreaNotificationServerFunctionality._CreateInstance: integer;
begin
Result:=TTAreaNotificationServerFunctionality___CreateInstance(Self);
end;

procedure TTAreaNotificationServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTAreaNotificationServerFunctionality._DestroyInstance(const idObj: integer);
begin
TTAreaNotificationServerFunctionality___DestroyInstance(Self,   idObj);
end;

function TTAreaNotificationServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTAreaNotificationServerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTAreaNotificationServerFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTAreaNotificationServerFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTAreaNotificationServerFunctionality.getName: string;
begin
Result:=TTAreaNotificationServerFunctionality__getName(Self);
end;

function TTAreaNotificationServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTAreaNotificationServerFunctionality.getImage: TTypeImage;
begin
Result:=TTAreaNotificationServerFunctionality__getImage(Self);
end;


{TAreaNotificationServerFunctionality}
procedure TAreaNotificationServerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TAreaNotificationServerFunctionality._ToClone(out idClone: integer);
begin
TAreaNotificationServerFunctionality___ToClone(Self,   idClone);
end;

function TAreaNotificationServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TAreaNotificationServerFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAreaNotificationServerFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality.getName: string;
begin
Result:=TAreaNotificationServerFunctionality__getName(Self);
end;

procedure TAreaNotificationServerFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TAreaNotificationServerFunctionality.setName(Value: string);
begin
TAreaNotificationServerFunctionality__setName(Self,   Value);
end;

function TAreaNotificationServerFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality.getHint: string;
begin
Result:=TAreaNotificationServerFunctionality__getHint(Self);
end;

function TAreaNotificationServerFunctionality__getInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAreaNotificationServerFunctionality.getInfo: string;
begin
Result:=TAreaNotificationServerFunctionality__getInfo(Self);
end;

procedure TAreaNotificationServerFunctionality__setInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TAreaNotificationServerFunctionality.setInfo(Value: string);
begin
TAreaNotificationServerFunctionality__setInfo(Self,   Value);
end;


{TTMODELServerVisualizationFunctionality}
function TTMODELServerVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTMODELServerVisualizationFunctionality___CreateInstance(Self);
end;

function TTMODELServerVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMODELServerVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMODELServerVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality.getName: string;
begin
Result:=TTMODELServerVisualizationFunctionality__getName(Self);
end;

function TTMODELServerVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTMODELServerVisualizationFunctionality__getImage(Self);
end;

function TTMODELServerVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTMODELServerVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTMODELServerVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TMODELServerVisualizationFunctionality}
procedure TMODELServerVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMODELServerVisualizationFunctionality._ToClone(out idClone: integer);
begin
TMODELServerVisualizationFunctionality___ToClone(Self,   idClone);
end;

function TMODELServerVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMODELServerVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TMODELServerVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMODELServerVisualizationFunctionality.DestroyData;
begin
TMODELServerVisualizationFunctionality__DestroyData(Self);
end;

procedure TMODELServerVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMODELServerVisualizationFunctionality.CloneData(out idClone: integer);
begin
TMODELServerVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TMODELServerVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TMODELServerVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TMODELServerVisualizationFunctionality__ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
begin
Result:=TMODELServerVisualizationFunctionality__ReflectOnCanvas(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TMODELServerVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TMODELServerVisualizationFunctionality__ContainerFilled(Self);
end;

function TMODELServerVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TMODELServerVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TMODELServerVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.getName: string;
begin
Result:=TMODELServerVisualizationFunctionality__getName(Self);
end;

function TMODELServerVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.getHint: string;
begin
Result:=TMODELServerVisualizationFunctionality__getHint(Self);
end;

function TMODELServerVisualizationFunctionality__getServerURL(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerVisualizationFunctionality.getServerURL: string;
begin
Result:=TMODELServerVisualizationFunctionality__getServerURL(Self);
end;

procedure TMODELServerVisualizationFunctionality__setServerURL(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELServerVisualizationFunctionality.setServerURL(Value: string);
begin
TMODELServerVisualizationFunctionality__setServerURL(Self,   Value);
end;


{TTDoubleVarFunctionality}
function TTDoubleVarFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDoubleVarFunctionality._CreateInstance: integer;
begin
Result:=TTDoubleVarFunctionality___CreateInstance(Self);
end;

procedure TTDoubleVarFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTDoubleVarFunctionality._DestroyInstance(const idObj: integer);
begin
TTDoubleVarFunctionality___DestroyInstance(Self,   idObj);
end;

function TTDoubleVarFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDoubleVarFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTDoubleVarFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTDoubleVarFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDoubleVarFunctionality.getName: string;
begin
Result:=TTDoubleVarFunctionality__getName(Self);
end;

function TTDoubleVarFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDoubleVarFunctionality.getImage: TTypeImage;
begin
Result:=TTDoubleVarFunctionality__getImage(Self);
end;


{TDoubleVarFunctionality}
procedure TDoubleVarFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDoubleVarFunctionality._ToClone(out idClone: integer);
begin
TDoubleVarFunctionality___ToClone(Self,   idClone);
end;

function TDoubleVarFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDoubleVarFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TDoubleVarFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDoubleVarFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDoubleVarFunctionality.getName: string;
begin
Result:=TDoubleVarFunctionality__getName(Self);
end;

function TDoubleVarFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDoubleVarFunctionality.getHint: string;
begin
Result:=TDoubleVarFunctionality__getHint(Self);
end;

function TDoubleVarFunctionality__getValue(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TDoubleVarFunctionality.getValue: Double;
begin
Result:=TDoubleVarFunctionality__getValue(Self);
end;

procedure TDoubleVarFunctionality__setValue(Functionality: TFunctionality;   _Value: Double); stdcall; external TypesDLL;
procedure TDoubleVarFunctionality.setValue(_Value: Double);
begin
TDoubleVarFunctionality__setValue(Self,   _Value);
end;

function TDoubleVarFunctionality__getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TDoubleVarFunctionality.getSetTimeStamp: TDateTime;
begin
Result:=TDoubleVarFunctionality__getSetTimeStamp(Self);
end;


{TTInt32VarFunctionality}
function TTInt32VarFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTInt32VarFunctionality._CreateInstance: integer;
begin
Result:=TTInt32VarFunctionality___CreateInstance(Self);
end;

procedure TTInt32VarFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTInt32VarFunctionality._DestroyInstance(const idObj: integer);
begin
TTInt32VarFunctionality___DestroyInstance(Self,   idObj);
end;

function TTInt32VarFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTInt32VarFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTInt32VarFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTInt32VarFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTInt32VarFunctionality.getName: string;
begin
Result:=TTInt32VarFunctionality__getName(Self);
end;

function TTInt32VarFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTInt32VarFunctionality.getImage: TTypeImage;
begin
Result:=TTInt32VarFunctionality__getImage(Self);
end;


{TInt32VarFunctionality}
procedure TInt32VarFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TInt32VarFunctionality._ToClone(out idClone: integer);
begin
TInt32VarFunctionality___ToClone(Self,   idClone);
end;

function TInt32VarFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TInt32VarFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TInt32VarFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TInt32VarFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TInt32VarFunctionality.getName: string;
begin
Result:=TInt32VarFunctionality__getName(Self);
end;

function TInt32VarFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TInt32VarFunctionality.getHint: string;
begin
Result:=TInt32VarFunctionality__getHint(Self);
end;

function TInt32VarFunctionality__getValue(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TInt32VarFunctionality.getValue: integer;
begin
Result:=TInt32VarFunctionality__getValue(Self);
end;

procedure TInt32VarFunctionality__setValue(Functionality: TFunctionality;   _Value: integer); stdcall; external TypesDLL;
procedure TInt32VarFunctionality.setValue(_Value: integer);
begin
TInt32VarFunctionality__setValue(Self,   _Value);
end;

function TInt32VarFunctionality__getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TInt32VarFunctionality.getSetTimeStamp: TDateTime;
begin
Result:=TInt32VarFunctionality__getSetTimeStamp(Self);
end;


{TTURLFunctionality}
function TTURLFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTURLFunctionality._CreateInstance: integer;
begin
Result:=TTURLFunctionality___CreateInstance(Self);
end;

procedure TTURLFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTURLFunctionality._DestroyInstance(const idObj: integer);
begin
TTURLFunctionality___DestroyInstance(Self,   idObj);
end;

function TTURLFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTURLFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTURLFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTURLFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTURLFunctionality.getName: string;
begin
Result:=TTURLFunctionality__getName(Self);
end;

function TTURLFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTURLFunctionality.getImage: TTypeImage;
begin
Result:=TTURLFunctionality__getImage(Self);
end;


{TURLFunctionality}
procedure TURLFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TURLFunctionality.UpdateDATA;
begin
TURLFunctionality__UpdateDATA(Self);
end;

procedure TURLFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TURLFunctionality._ToClone(out idClone: integer);
begin
TURLFunctionality___ToClone(Self,   idClone);
end;

function TURLFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TURLFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TURLFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TURLFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TURLFunctionality.getName: string;
begin
Result:=TURLFunctionality__getName(Self);
end;

function TURLFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TURLFunctionality.getHint: string;
begin
Result:=TURLFunctionality__getHint(Self);
end;

function TURLFunctionality__getURL(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TURLFunctionality.getURL: string;
begin
Result:=TURLFunctionality__getURL(Self);
end;

procedure TURLFunctionality__setURL(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TURLFunctionality.setURL(Value: string);
begin
TURLFunctionality__setURL(Self,   Value);
end;

function TURLFunctionality__getURLName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TURLFunctionality.getURLName: string;
begin
Result:=TURLFunctionality__getURLName(Self);
end;

procedure TURLFunctionality__setURLName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TURLFunctionality.setURLName(Value: string);
begin
TURLFunctionality__setURLName(Self,   Value);
end;

function TURLFunctionality__getflPanelBrowser(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TURLFunctionality.getflPanelBrowser: boolean;
begin
Result:=TURLFunctionality__getflPanelBrowser(Self);
end;

procedure TURLFunctionality__setflPanelBrowser(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TURLFunctionality.setflPanelBrowser(Value: boolean);
begin
TURLFunctionality__setflPanelBrowser(Self,   Value);
end;

procedure TURLFunctionality__GetParams(Functionality: TFunctionality;   out oURL: string; out oURLName: string; out oflPanelBrowser: boolean); stdcall; external TypesDLL;
procedure TURLFunctionality.GetParams(out oURL: string; out oURLName: string; out oflPanelBrowser: boolean);
begin
TURLFunctionality__GetParams(Self,   oURL,oURLName,oflPanelBrowser);
end;

procedure TURLFunctionality__SetParams(Functionality: TFunctionality;   const pURL: string; const pURLName: string; const pflPanelBrowser: boolean); stdcall; external TypesDLL;
procedure TURLFunctionality.SetParams(const pURL: string; const pURLName: string; const pflPanelBrowser: boolean);
begin
TURLFunctionality__SetParams(Self,   pURL,pURLName,pflPanelBrowser);
end;


{TTPatternVisualizationFunctionality}
function TTPatternVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTPatternVisualizationFunctionality___CreateInstance(Self);
end;

function TTPatternVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTPatternVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTPatternVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality.getName: string;
begin
Result:=TTPatternVisualizationFunctionality__getName(Self);
end;

function TTPatternVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTPatternVisualizationFunctionality__getImage(Self);
end;

function TTPatternVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTPatternVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTPatternVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TPatternVisualizationFunctionality}
procedure TPatternVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality._ToClone(out idClone: integer);
begin
TPatternVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TPatternVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.DestroyData;
begin
TPatternVisualizationFunctionality__DestroyData(Self);
end;

procedure TPatternVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.CloneData(out idClone: integer);
begin
TPatternVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TPatternVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TPatternVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

function TPatternVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TPatternVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TPatternVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TPatternVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPatternVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.DATASize: integer;
begin
Result:=TPatternVisualizationFunctionality__DATASize(Self);
end;

function TPatternVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TPatternVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TPatternVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.getName: string;
begin
Result:=TPatternVisualizationFunctionality__getName(Self);
end;

function TPatternVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.getHint: string;
begin
Result:=TPatternVisualizationFunctionality__getHint(Self);
end;

procedure TPatternVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TPatternVisualizationFunctionality__GetDATA(Self,   DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.GetDATA1(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TPatternVisualizationFunctionality__GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TPatternVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.GetDATA2(out DATAStream: TByteArray; out DATAType: Integer);
begin
TPatternVisualizationFunctionality__GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.GetDATA3(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TPatternVisualizationFunctionality__GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TPatternVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TPatternVisualizationFunctionality__SetDATA(Self,   DATAStream,DATAType);
end;

procedure TPatternVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.SetDATA1(DATAStream: TByteArray; const DATAType: integer);
begin
TPatternVisualizationFunctionality__SetDATA1(Self,   DATAStream,DATAType);
end;

function TPatternVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TPatternVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TPatternVisualizationFunctionality__getDATAFileID(Self);
end;

procedure TPatternVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TPatternVisualizationFunctionality__setDATAFileID(Self,   Value);
end;

procedure TPatternVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPatternVisualizationFunctionality.DATAFile_Clear;
begin
TPatternVisualizationFunctionality__DATAFile_Clear(Self);
end;


{TTMapFormatObjectFunctionality}
function TTMapFormatObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality._CreateInstance: integer;
begin
Result:=TTMapFormatObjectFunctionality___CreateInstance(Self);
end;

procedure TTMapFormatObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMapFormatObjectFunctionality._DestroyInstance(const idObj: integer);
begin
TTMapFormatObjectFunctionality___DestroyInstance(Self,   idObj);
end;

function TTMapFormatObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMapFormatObjectFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMapFormatObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality.getName: string;
begin
Result:=TTMapFormatObjectFunctionality__getName(Self);
end;

function TTMapFormatObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality.getImage: TTypeImage;
begin
Result:=TTMapFormatObjectFunctionality__getImage(Self);
end;

procedure TTMapFormatObjectFunctionality__GetInstanceNames(Functionality: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); stdcall; external TypesDLL;
procedure TTMapFormatObjectFunctionality.GetInstanceNames(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList);
begin
TTMapFormatObjectFunctionality__GetInstanceNames(Self,   IDs,IDs_Offset,IDs_Size,Names);
end;

function TTMapFormatObjectFunctionality__GetDATAHash(Functionality: TFunctionality;   DATAStream: TMemoryStream): integer; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality.GetDATAHash(DATAStream: TMemoryStream): integer;
begin
Result:=TTMapFormatObjectFunctionality__GetDATAHash(Self,   DATAStream);
end;

function TTMapFormatObjectFunctionality__GetDATAHash1(Functionality: TFunctionality;   DATAStream: TByteArray): integer; stdcall; external TypesDLL;
function TTMapFormatObjectFunctionality.GetDATAHash1(DATAStream: TByteArray): integer;
begin
Result:=TTMapFormatObjectFunctionality__GetDATAHash1(Self,   DATAStream);
end;


{TMapFormatObjectFunctionality}
procedure TMapFormatObjectFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality._ToClone(out idClone: integer);
begin
TMapFormatObjectFunctionality___ToClone(Self,   idClone);
end;

function TMapFormatObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMapFormatObjectFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMapFormatObjectFunctionality__DATAPanel_Create(Functionality: TFunctionality): TForm; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.DATAPanel_Create: TForm;
begin
Result:=TMapFormatObjectFunctionality__DATAPanel_Create(Self);
end;

function TMapFormatObjectFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TMapFormatObjectFunctionality__Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TMapFormatObjectFunctionality___GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Result:=TMapFormatObjectFunctionality___GetDataDocument(Self,   DataModel,DataType,flWithComponents,Document);
end;

function TMapFormatObjectFunctionality__GetHintInfo(Functionality: TFunctionality;   const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
begin
Result:=TMapFormatObjectFunctionality__GetHintInfo(Self,   InfoType,InfoFormat,HintInfo);
end;

function TMapFormatObjectFunctionality__getidMap(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.getidMap: integer;
begin
Result:=TMapFormatObjectFunctionality__getidMap(Self);
end;

procedure TMapFormatObjectFunctionality__setidMap(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.setidMap(Value: integer);
begin
TMapFormatObjectFunctionality__setidMap(Self,   Value);
end;

function TMapFormatObjectFunctionality__getFormatID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.getFormatID: integer;
begin
Result:=TMapFormatObjectFunctionality__getFormatID(Self);
end;

procedure TMapFormatObjectFunctionality__setFormatID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.setFormatID(Value: integer);
begin
TMapFormatObjectFunctionality__setFormatID(Self,   Value);
end;

function TMapFormatObjectFunctionality__getKindID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.getKindID: integer;
begin
Result:=TMapFormatObjectFunctionality__getKindID(Self);
end;

procedure TMapFormatObjectFunctionality__setKindID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.setKindID(Value: integer);
begin
TMapFormatObjectFunctionality__setKindID(Self,   Value);
end;

function TMapFormatObjectFunctionality__getTypeID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.getTypeID: integer;
begin
Result:=TMapFormatObjectFunctionality__getTypeID(Self);
end;

procedure TMapFormatObjectFunctionality__setTypeID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.setTypeID(Value: integer);
begin
TMapFormatObjectFunctionality__setTypeID(Self,   Value);
end;

function TMapFormatObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.getName: string;
begin
Result:=TMapFormatObjectFunctionality__getName(Self);
end;

procedure TMapFormatObjectFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.setName(Value: string);
begin
TMapFormatObjectFunctionality__setName(Self,   Value);
end;

procedure TMapFormatObjectFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.GetDATA(out DATAStream: TMemoryStream);
begin
TMapFormatObjectFunctionality__GetDATA(Self,   DATAStream);
end;

procedure TMapFormatObjectFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.GetDATA1(out DATAStream: TByteArray);
begin
TMapFormatObjectFunctionality__GetDATA1(Self,   DATAStream);
end;

procedure TMapFormatObjectFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.SetDATA(DATAStream: TMemoryStream);
begin
TMapFormatObjectFunctionality__SetDATA(Self,   DATAStream);
end;

procedure TMapFormatObjectFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.SetDATA1(DATAStream: TByteArray);
begin
TMapFormatObjectFunctionality__SetDATA1(Self,   DATAStream);
end;

function TMapFormatObjectFunctionality__getDATAHash(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatObjectFunctionality.getDATAHash: integer;
begin
Result:=TMapFormatObjectFunctionality__getDATAHash(Self);
end;

procedure TMapFormatObjectFunctionality__setDATAHash(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.setDATAHash(Value: integer);
begin
TMapFormatObjectFunctionality__setDATAHash(Self,   Value);
end;

procedure TMapFormatObjectFunctionality__GetParams(Functionality: TFunctionality;   out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.GetParams(out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string);
begin
TMapFormatObjectFunctionality__GetParams(Self,   oidMap,oFormatID,oKindID,oTypeID,oName);
end;

procedure TMapFormatObjectFunctionality__SetParams(Functionality: TFunctionality;   const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.SetParams(const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string);
begin
TMapFormatObjectFunctionality__SetParams(Self,   pidMap,pFormatID,pKindID,pTypeID,pName);
end;

procedure TMapFormatObjectFunctionality__SetObjectByDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.SetObjectByDATA;
begin
TMapFormatObjectFunctionality__SetObjectByDATA(Self);
end;

procedure TMapFormatObjectFunctionality__UpdateDATAHash(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.UpdateDATAHash;
begin
TMapFormatObjectFunctionality__UpdateDATAHash(Self);
end;

procedure TMapFormatObjectFunctionality__Compile(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.Compile;
begin
TMapFormatObjectFunctionality__Compile(Self);
end;

procedure TMapFormatObjectFunctionality__Build(Functionality: TFunctionality;   const flUsePrototype: boolean); stdcall; external TypesDLL;
procedure TMapFormatObjectFunctionality.Build(const flUsePrototype: boolean);
begin
TMapFormatObjectFunctionality__Build(Self,   flUsePrototype);
end;


{TTMapFormatMapFunctionality}
function TTMapFormatMapFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMapFormatMapFunctionality._CreateInstance: integer;
begin
Result:=TTMapFormatMapFunctionality___CreateInstance(Self);
end;

procedure TTMapFormatMapFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMapFormatMapFunctionality._DestroyInstance(const idObj: integer);
begin
TTMapFormatMapFunctionality___DestroyInstance(Self,   idObj);
end;

function TTMapFormatMapFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMapFormatMapFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMapFormatMapFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMapFormatMapFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMapFormatMapFunctionality.getName: string;
begin
Result:=TTMapFormatMapFunctionality__getName(Self);
end;

function TTMapFormatMapFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMapFormatMapFunctionality.getImage: TTypeImage;
begin
Result:=TTMapFormatMapFunctionality__getImage(Self);
end;

procedure TTMapFormatMapFunctionality__GetInstanceListByGeoSpace(Functionality: TFunctionality;   const idGeoSpace: integer; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMapFormatMapFunctionality.GetInstanceListByGeoSpace(const idGeoSpace: integer; out List: TByteArray);
begin
TTMapFormatMapFunctionality__GetInstanceListByGeoSpace(Self,   idGeoSpace,List);
end;


{TMapFormatMapFunctionality}
procedure TMapFormatMapFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality._ToClone(out idClone: integer);
begin
TMapFormatMapFunctionality___ToClone(Self,   idClone);
end;

function TMapFormatMapFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMapFormatMapFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMapFormatMapFunctionality__getGeoSpaceID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.getGeoSpaceID: integer;
begin
Result:=TMapFormatMapFunctionality__getGeoSpaceID(Self);
end;

procedure TMapFormatMapFunctionality__setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.setGeoSpaceID(Value: integer);
begin
TMapFormatMapFunctionality__setGeoSpaceID(Self,   Value);
end;

function TMapFormatMapFunctionality__getFormatID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.getFormatID: integer;
begin
Result:=TMapFormatMapFunctionality__getFormatID(Self);
end;

procedure TMapFormatMapFunctionality__setFormatID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.setFormatID(Value: integer);
begin
TMapFormatMapFunctionality__setFormatID(Self,   Value);
end;

function TMapFormatMapFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.getName: string;
begin
Result:=TMapFormatMapFunctionality__getName(Self);
end;

procedure TMapFormatMapFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.setName(Value: string);
begin
TMapFormatMapFunctionality__setName(Self,   Value);
end;

procedure TMapFormatMapFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetDATA(out DATAStream: TMemoryStream);
begin
TMapFormatMapFunctionality__GetDATA(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetDATA1(out DATAStream: TByteArray);
begin
TMapFormatMapFunctionality__GetDATA1(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.SetDATA(DATAStream: TMemoryStream);
begin
TMapFormatMapFunctionality__SetDATA(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.SetDATA1(DATAStream: TByteArray);
begin
TMapFormatMapFunctionality__SetDATA1(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality__GetObjectPrototypesDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetObjectPrototypesDATA(out DATAStream: TMemoryStream);
begin
TMapFormatMapFunctionality__GetObjectPrototypesDATA(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality__GetObjectPrototypesDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetObjectPrototypesDATA1(out DATAStream: TByteArray);
begin
TMapFormatMapFunctionality__GetObjectPrototypesDATA1(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality__SetObjectPrototypesDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.SetObjectPrototypesDATA(DATAStream: TMemoryStream);
begin
TMapFormatMapFunctionality__SetObjectPrototypesDATA(Self,   DATAStream);
end;

procedure TMapFormatMapFunctionality__SetObjectPrototypesDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.SetObjectPrototypesDATA1(DATAStream: TByteArray);
begin
TMapFormatMapFunctionality__SetObjectPrototypesDATA1(Self,   DATAStream);
end;

function TMapFormatMapFunctionality__GetObjectPrototype(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.GetObjectPrototype(const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean;
begin
Result:=TMapFormatMapFunctionality__GetObjectPrototype(Self,   KindID,TypeID,PrototypeID,LayID);
end;

procedure TMapFormatMapFunctionality__GetParams(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oFormatID: integer; out oName: string); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetParams(out oGeoSpaceID: integer; out oFormatID: integer; out oName: string);
begin
TMapFormatMapFunctionality__GetParams(Self,   oGeoSpaceID,oFormatID,oName);
end;

procedure TMapFormatMapFunctionality__SetParams(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pFormatID: integer; const pName: string); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.SetParams(const pGeoSpaceID: integer; const pFormatID: integer; const pName: string);
begin
TMapFormatMapFunctionality__SetParams(Self,   pGeoSpaceID,pFormatID,pName);
end;

function TMapFormatMapFunctionality__ObjectsCounter(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.ObjectsCounter: integer;
begin
Result:=TMapFormatMapFunctionality__ObjectsCounter(Self);
end;

procedure TMapFormatMapFunctionality__GetObjectsList(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetObjectsList(out List: TByteArray);
begin
TMapFormatMapFunctionality__GetObjectsList(Self,   List);
end;

procedure TMapFormatMapFunctionality__GetObjectsList1(Functionality: TFunctionality;   const KindID: integer; out List: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetObjectsList1(const KindID: integer; out List: TByteArray);
begin
TMapFormatMapFunctionality__GetObjectsList1(Self,   KindID,List);
end;

procedure TMapFormatMapFunctionality__GetObjectsList2(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; out List: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetObjectsList2(const KindID: integer; const TypeID: integer; out List: TByteArray);
begin
TMapFormatMapFunctionality__GetObjectsList2(Self,   KindID,TypeID,List);
end;

procedure TMapFormatMapFunctionality__GetObjectsList3(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.GetObjectsList3(const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray);
begin
TMapFormatMapFunctionality__GetObjectsList3(Self,   KindID,TypeID,NameContext,List);
end;

function TMapFormatMapFunctionality__GetObject(Functionality: TFunctionality;   const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.GetObject(const DATAHash: integer; out idMapFormatObject: integer): boolean;
begin
Result:=TMapFormatMapFunctionality__GetObject(Self,   DATAHash,idMapFormatObject);
end;

function TMapFormatMapFunctionality__GetObject1(Functionality: TFunctionality;   const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean; stdcall; external TypesDLL;
function TMapFormatMapFunctionality.GetObject1(const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean;
begin
Result:=TMapFormatMapFunctionality__GetObject1(Self,   KindID,DATAHash,idMapFormatObject);
end;

procedure TMapFormatMapFunctionality__ExportMap(Functionality: TFunctionality;   const pFormatID: integer; out ZipData: TByteArray); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.ExportMap(const pFormatID: integer; out ZipData: TByteArray);
begin
TMapFormatMapFunctionality__ExportMap(Self,   pFormatID,ZipData);
end;

procedure TMapFormatMapFunctionality__RemoveObjects(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.RemoveObjects;
begin
TMapFormatMapFunctionality__RemoveObjects(Self);
end;

procedure TMapFormatMapFunctionality__RemoveObjects1(Functionality: TFunctionality;   const KindID: integer; const TypeID: integer); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.RemoveObjects1(const KindID: integer; const TypeID: integer);
begin
TMapFormatMapFunctionality__RemoveObjects1(Self,   KindID,TypeID);
end;

procedure TMapFormatMapFunctionality__UpdateObjectDATAHashes(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.UpdateObjectDATAHashes;
begin
TMapFormatMapFunctionality__UpdateObjectDATAHashes(Self);
end;

procedure TMapFormatMapFunctionality__RecalculateMapArea(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.RecalculateMapArea;
begin
TMapFormatMapFunctionality__RecalculateMapArea(Self);
end;

procedure TMapFormatMapFunctionality__RemoveIrrelevantObjectsInMapArea(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMapFormatMapFunctionality.RemoveIrrelevantObjectsInMapArea;
begin
TMapFormatMapFunctionality__RemoveIrrelevantObjectsInMapArea(Self);
end;


{TTSPLVisualizationFunctionality}
function TTSPLVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTSPLVisualizationFunctionality___CreateInstance(Self);
end;

function TTSPLVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTSPLVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTSPLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality.getName: string;
begin
Result:=TTSPLVisualizationFunctionality__getName(Self);
end;

function TTSPLVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTSPLVisualizationFunctionality__getImage(Self);
end;

function TTSPLVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTSPLVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTSPLVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TSPLVisualizationFunctionality}
procedure TSPLVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality._ToClone(out idClone: integer);
begin
TSPLVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TSPLVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality.DestroyData;
begin
TSPLVisualizationFunctionality__DestroyData(Self);
end;

procedure TSPLVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality.CloneData(out idClone: integer);
begin
TSPLVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TSPLVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TSPLVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TSPLVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSPLVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSPLVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TSPLVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TSPLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality.getName: string;
begin
Result:=TSPLVisualizationFunctionality__getName(Self);
end;

function TSPLVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSPLVisualizationFunctionality.getHint: string;
begin
Result:=TSPLVisualizationFunctionality__getHint(Self);
end;

procedure TSPLVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out SPLType: integer; out SPLDATA: TByteArray); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality.GetParams(out SPLType: integer; out SPLDATA: TByteArray);
begin
TSPLVisualizationFunctionality__GetParams(Self,   SPLType,SPLDATA);
end;

procedure TSPLVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const SPLType: integer; const SPLDATA: TByteArray); stdcall; external TypesDLL;
procedure TSPLVisualizationFunctionality.SetParams(const SPLType: integer; const SPLDATA: TByteArray);
begin
TSPLVisualizationFunctionality__SetParams(Self,   SPLType,SPLDATA);
end;


{TTBoolVarFunctionality}
function TTBoolVarFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTBoolVarFunctionality._CreateInstance: integer;
begin
Result:=TTBoolVarFunctionality___CreateInstance(Self);
end;

procedure TTBoolVarFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTBoolVarFunctionality._DestroyInstance(const idObj: integer);
begin
TTBoolVarFunctionality___DestroyInstance(Self,   idObj);
end;

function TTBoolVarFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTBoolVarFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTBoolVarFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTBoolVarFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTBoolVarFunctionality.getName: string;
begin
Result:=TTBoolVarFunctionality__getName(Self);
end;

function TTBoolVarFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTBoolVarFunctionality.getImage: TTypeImage;
begin
Result:=TTBoolVarFunctionality__getImage(Self);
end;


{TBoolVarFunctionality}
procedure TBoolVarFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBoolVarFunctionality._ToClone(out idClone: integer);
begin
TBoolVarFunctionality___ToClone(Self,   idClone);
end;

function TBoolVarFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TBoolVarFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TBoolVarFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBoolVarFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBoolVarFunctionality.getName: string;
begin
Result:=TBoolVarFunctionality__getName(Self);
end;

function TBoolVarFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBoolVarFunctionality.getHint: string;
begin
Result:=TBoolVarFunctionality__getHint(Self);
end;

function TBoolVarFunctionality__getValue(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TBoolVarFunctionality.getValue: boolean;
begin
Result:=TBoolVarFunctionality__getValue(Self);
end;

procedure TBoolVarFunctionality__setValue(Functionality: TFunctionality;   _Value: boolean); stdcall; external TypesDLL;
procedure TBoolVarFunctionality.setValue(_Value: boolean);
begin
TBoolVarFunctionality__setValue(Self,   _Value);
end;

function TBoolVarFunctionality__getSetTimeStamp(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TBoolVarFunctionality.getSetTimeStamp: TDateTime;
begin
Result:=TBoolVarFunctionality__getSetTimeStamp(Self);
end;


{TTGeoSpaceFunctionality}
function TTGeoSpaceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGeoSpaceFunctionality._CreateInstance: integer;
begin
Result:=TTGeoSpaceFunctionality___CreateInstance(Self);
end;

procedure TTGeoSpaceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTGeoSpaceFunctionality._DestroyInstance(const idObj: integer);
begin
TTGeoSpaceFunctionality___DestroyInstance(Self,   idObj);
end;

function TTGeoSpaceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeoSpaceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTGeoSpaceFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTGeoSpaceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeoSpaceFunctionality.getName: string;
begin
Result:=TTGeoSpaceFunctionality__getName(Self);
end;

function TTGeoSpaceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGeoSpaceFunctionality.getImage: TTypeImage;
begin
Result:=TTGeoSpaceFunctionality__getImage(Self);
end;


{TGeoSpaceFunctionality}
procedure TGeoSpaceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality._ToClone(out idClone: integer);
begin
TGeoSpaceFunctionality___ToClone(Self,   idClone);
end;

function TGeoSpaceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGeoSpaceFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGeoSpaceFunctionality__GetDatumIDLocally(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.GetDatumIDLocally: integer;
begin
Result:=TGeoSpaceFunctionality__GetDatumIDLocally(Self);
end;

function TGeoSpaceFunctionality__ConvertGeoToXYLocally(Functionality: TFunctionality;   const Lat,Long: Extended; out Xr,Yr: Extended): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.ConvertGeoToXYLocally(const Lat,Long: Extended; out Xr,Yr: Extended): boolean;
begin
Result:=TGeoSpaceFunctionality__ConvertGeoToXYLocally(Self,   Lat,Long,Xr,Yr);
end;

function TGeoSpaceFunctionality__ConvertXYToGeoLocally(Functionality: TFunctionality;   const X,Y: Extended; out Lat,Long: Extended): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.ConvertXYToGeoLocally(const X,Y: Extended; out Lat,Long: Extended): boolean;
begin
Result:=TGeoSpaceFunctionality__ConvertXYToGeoLocally(Self,   X,Y,Lat,Long);
end;

function TGeoSpaceFunctionality__GetDistanceBetweenTwoXYPointsLocally(Functionality: TFunctionality;   const X0,Y0,X1,Y1: Extended; out Distance: Extended): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.GetDistanceBetweenTwoXYPointsLocally(const X0,Y0,X1,Y1: Extended; out Distance: Extended): boolean;
begin
Result:=TGeoSpaceFunctionality__GetDistanceBetweenTwoXYPointsLocally(Self,   X0,Y0,X1,Y1,Distance);
end;

function TGeoSpaceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.getName: string;
begin
Result:=TGeoSpaceFunctionality__getName(Self);
end;

procedure TGeoSpaceFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.setName(Value: string);
begin
TGeoSpaceFunctionality__setName(Self,   Value);
end;

function TGeoSpaceFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.getHint: string;
begin
Result:=TGeoSpaceFunctionality__getHint(Self);
end;

function TGeoSpaceFunctionality__getDatumID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.getDatumID: integer;
begin
Result:=TGeoSpaceFunctionality__getDatumID(Self);
end;

procedure TGeoSpaceFunctionality__setDatumID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.setDatumID(Value: integer);
begin
TGeoSpaceFunctionality__setDatumID(Self,   Value);
end;

function TGeoSpaceFunctionality__getProjectionID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.getProjectionID: integer;
begin
Result:=TGeoSpaceFunctionality__getProjectionID(Self);
end;

procedure TGeoSpaceFunctionality__setProjectionID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.setProjectionID(Value: integer);
begin
TGeoSpaceFunctionality__setProjectionID(Self,   Value);
end;

function TGeoSpaceFunctionality__ConvertXYToLatLong(Functionality: TFunctionality;   const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.ConvertXYToLatLong(const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean;
begin
Result:=TGeoSpaceFunctionality__ConvertXYToLatLong(Self,   X,Y,Latitude,Longitude);
end;

function TGeoSpaceFunctionality__ConvertXYToDatumLatLong(Functionality: TFunctionality;   const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.ConvertXYToDatumLatLong(const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean;
begin
Result:=TGeoSpaceFunctionality__ConvertXYToDatumLatLong(Self,   X,Y,pDatumID,Latitude,Longitude);
end;

function TGeoSpaceFunctionality__ConvertLatLongToXY(Functionality: TFunctionality;   const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.ConvertLatLongToXY(const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
begin
Result:=TGeoSpaceFunctionality__ConvertLatLongToXY(Self,   Latitude,Longitude,X,Y);
end;

function TGeoSpaceFunctionality__ConvertDatumLatLongToXY(Functionality: TFunctionality;   const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean; stdcall; external TypesDLL;
function TGeoSpaceFunctionality.ConvertDatumLatLongToXY(const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
begin
Result:=TGeoSpaceFunctionality__ConvertDatumLatLongToXY(Self,   pDatumID,Latitude,Longitude,X,Y);
end;

procedure TGeoSpaceFunctionality__GetGeoCrdSystemList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.GetGeoCrdSystemList(out List: TList);
begin
TGeoSpaceFunctionality__GetGeoCrdSystemList(Self,   List);
end;

procedure TGeoSpaceFunctionality__GetGeoCrdSystemList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.GetGeoCrdSystemList1(out List: TByteArray);
begin
TGeoSpaceFunctionality__GetGeoCrdSystemList1(Self,   List);
end;

procedure TGeoSpaceFunctionality__GetMapFormatMapList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.GetMapFormatMapList(out List: TList);
begin
TGeoSpaceFunctionality__GetMapFormatMapList(Self,   List);
end;

procedure TGeoSpaceFunctionality__GetMapFormatMapList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.GetMapFormatMapList1(out List: TByteArray);
begin
TGeoSpaceFunctionality__GetMapFormatMapList1(Self,   List);
end;

procedure TGeoSpaceFunctionality__GetMapFormatMapObjectsByNameContext(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TList); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.GetMapFormatMapObjectsByNameContext(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TList);
begin
TGeoSpaceFunctionality__GetMapFormatMapObjectsByNameContext(Self,   pFormatID,pKindID,pTypeID,NameContext,List);
end;

procedure TGeoSpaceFunctionality__GetMapFormatMapObjectsByNameContext1(Functionality: TFunctionality;   const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TGeoSpaceFunctionality.GetMapFormatMapObjectsByNameContext1(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray);
begin
TGeoSpaceFunctionality__GetMapFormatMapObjectsByNameContext1(Self,   pFormatID,pKindID,pTypeID,NameContext,List);
end;


{TTUserAlertFunctionality}
function TTUserAlertFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTUserAlertFunctionality._CreateInstance: integer;
begin
Result:=TTUserAlertFunctionality___CreateInstance(Self);
end;

procedure TTUserAlertFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTUserAlertFunctionality._DestroyInstance(const idObj: integer);
begin
TTUserAlertFunctionality___DestroyInstance(Self,   idObj);
end;

function TTUserAlertFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTUserAlertFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTUserAlertFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTUserAlertFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTUserAlertFunctionality.getName: string;
begin
Result:=TTUserAlertFunctionality__getName(Self);
end;

function TTUserAlertFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTUserAlertFunctionality.getImage: TTypeImage;
begin
Result:=TTUserAlertFunctionality__getImage(Self);
end;

procedure TTUserAlertFunctionality__GetActiveInstanceList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTUserAlertFunctionality.GetActiveInstanceList(out List: TList);
begin
TTUserAlertFunctionality__GetActiveInstanceList(Self,   List);
end;

procedure TTUserAlertFunctionality__GetActiveInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTUserAlertFunctionality.GetActiveInstanceList1(out List: TByteArray);
begin
TTUserAlertFunctionality__GetActiveInstanceList1(Self,   List);
end;


{TUserAlertFunctionality}
procedure TUserAlertFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TUserAlertFunctionality._ToClone(out idClone: integer);
begin
TUserAlertFunctionality___ToClone(Self,   idClone);
end;

function TUserAlertFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TUserAlertFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TUserAlertFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TUserAlertFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUserAlertFunctionality.getName: string;
begin
Result:=TUserAlertFunctionality__getName(Self);
end;

function TUserAlertFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUserAlertFunctionality.getHint: string;
begin
Result:=TUserAlertFunctionality__getHint(Self);
end;

function TUserAlertFunctionality__getUserID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TUserAlertFunctionality.getUserID: integer;
begin
Result:=TUserAlertFunctionality__getUserID(Self);
end;

procedure TUserAlertFunctionality__setUserID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.setUserID(Value: integer);
begin
TUserAlertFunctionality__setUserID(Self,   Value);
end;

function TUserAlertFunctionality__getTimeStamp(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TUserAlertFunctionality.getTimeStamp: TDateTime;
begin
Result:=TUserAlertFunctionality__getTimeStamp(Self);
end;

procedure TUserAlertFunctionality__setTimeStamp(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.setTimeStamp(Value: TDateTime);
begin
TUserAlertFunctionality__setTimeStamp(Self,   Value);
end;

function TUserAlertFunctionality__getActive(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TUserAlertFunctionality.getActive: boolean;
begin
Result:=TUserAlertFunctionality__getActive(Self);
end;

procedure TUserAlertFunctionality__setActive(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.setActive(Value: boolean);
begin
TUserAlertFunctionality__setActive(Self,   Value);
end;

function TUserAlertFunctionality__getAlertID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TUserAlertFunctionality.getAlertID: integer;
begin
Result:=TUserAlertFunctionality__getAlertID(Self);
end;

procedure TUserAlertFunctionality__setAlertID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.setAlertID(Value: integer);
begin
TUserAlertFunctionality__setAlertID(Self,   Value);
end;

function TUserAlertFunctionality__getSeverity(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TUserAlertFunctionality.getSeverity: integer;
begin
Result:=TUserAlertFunctionality__getSeverity(Self);
end;

procedure TUserAlertFunctionality__setSeverity(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.setSeverity(Value: integer);
begin
TUserAlertFunctionality__setSeverity(Self,   Value);
end;

function TUserAlertFunctionality__getDescription(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUserAlertFunctionality.getDescription: string;
begin
Result:=TUserAlertFunctionality__getDescription(Self);
end;

procedure TUserAlertFunctionality__setDescription(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.setDescription(Value: string);
begin
TUserAlertFunctionality__setDescription(Self,   Value);
end;

procedure TUserAlertFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.GetDATA(out DATAStream: TMemoryStream);
begin
TUserAlertFunctionality__GetDATA(Self,   DATAStream);
end;

procedure TUserAlertFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.GetDATA1(out DATAStream: TByteArray);
begin
TUserAlertFunctionality__GetDATA1(Self,   DATAStream);
end;

procedure TUserAlertFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.SetDATA(DATAStream: TMemoryStream);
begin
TUserAlertFunctionality__SetDATA(Self,   DATAStream);
end;

procedure TUserAlertFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TUserAlertFunctionality.SetDATA1(DATAStream: TByteArray);
begin
TUserAlertFunctionality__SetDATA1(Self,   DATAStream);
end;


{TTGeoGraphServerObjectFunctionality}
function TTGeoGraphServerObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality._CreateInstance: integer;
begin
Result:=TTGeoGraphServerObjectFunctionality___CreateInstance(Self);
end;

procedure TTGeoGraphServerObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTGeoGraphServerObjectFunctionality._DestroyInstance(const idObj: integer);
begin
TTGeoGraphServerObjectFunctionality___DestroyInstance(Self,   idObj);
end;

function TTGeoGraphServerObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTGeoGraphServerObjectFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTGeoGraphServerObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality.getName: string;
begin
Result:=TTGeoGraphServerObjectFunctionality__getName(Self);
end;

function TTGeoGraphServerObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality.getImage: TTypeImage;
begin
Result:=TTGeoGraphServerObjectFunctionality__getImage(Self);
end;

function TTGeoGraphServerObjectFunctionality__GetInstanceByServerObject(Functionality: TFunctionality;   const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean; stdcall; external TypesDLL;
function TTGeoGraphServerObjectFunctionality.GetInstanceByServerObject(const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean;
begin
Result:=TTGeoGraphServerObjectFunctionality__GetInstanceByServerObject(Self,   pGeoGraphServerID,pObjectID,idInstance);
end;


{TGeoGraphServerObjectFunctionality}
procedure TGeoGraphServerObjectFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality._ToClone(out idClone: integer);
begin
TGeoGraphServerObjectFunctionality___ToClone(Self,   idClone);
end;

function TGeoGraphServerObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGeoGraphServerObjectFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TGeoGraphServerObjectFunctionality__AttachObject(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.AttachObject;
begin
TGeoGraphServerObjectFunctionality__AttachObject(Self);
end;

procedure TGeoGraphServerObjectFunctionality__DetachObject(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.DetachObject;
begin
TGeoGraphServerObjectFunctionality__DetachObject(Self);
end;

function TGeoGraphServerObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.getName: string;
begin
Result:=TGeoGraphServerObjectFunctionality__getName(Self);
end;

function TGeoGraphServerObjectFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.getHint: string;
begin
Result:=TGeoGraphServerObjectFunctionality__getHint(Self);
end;

function TGeoGraphServerObjectFunctionality__getGeoGraphServerID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.getGeoGraphServerID: integer;
begin
Result:=TGeoGraphServerObjectFunctionality__getGeoGraphServerID(Self);
end;

procedure TGeoGraphServerObjectFunctionality__setGeoGraphServerID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.setGeoGraphServerID(Value: integer);
begin
TGeoGraphServerObjectFunctionality__setGeoGraphServerID(Self,   Value);
end;

function TGeoGraphServerObjectFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.getObjectID: integer;
begin
Result:=TGeoGraphServerObjectFunctionality__getObjectID(Self);
end;

procedure TGeoGraphServerObjectFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.setObjectID(Value: integer);
begin
TGeoGraphServerObjectFunctionality__setObjectID(Self,   Value);
end;

function TGeoGraphServerObjectFunctionality__getBusinessModelID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.getBusinessModelID: integer;
begin
Result:=TGeoGraphServerObjectFunctionality__getBusinessModelID(Self);
end;

procedure TGeoGraphServerObjectFunctionality__setBusinessModelID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.setBusinessModelID(Value: integer);
begin
TGeoGraphServerObjectFunctionality__setBusinessModelID(Self,   Value);
end;

function TGeoGraphServerObjectFunctionality__getDomains(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.getDomains: string;
begin
Result:=TGeoGraphServerObjectFunctionality__getDomains(Self);
end;

procedure TGeoGraphServerObjectFunctionality__setDomains(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.setDomains(Value: string);
begin
TGeoGraphServerObjectFunctionality__setDomains(Self,   Value);
end;

procedure TGeoGraphServerObjectFunctionality__GetParams(Functionality: TFunctionality;   out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.GetParams(out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer);
begin
TGeoGraphServerObjectFunctionality__GetParams(Self,   oGeoGraphServerID,oObjectID,oObjectType,oBusinessModel);
end;

procedure TGeoGraphServerObjectFunctionality__ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
begin
TGeoGraphServerObjectFunctionality__ExecuteOperation(Self,   InData,OutData);
end;

function TGeoGraphServerObjectFunctionality__GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
begin
Result:=TGeoGraphServerObjectFunctionality__GetVisualizationComponent(Self,   idTVisualization,idVisualization);
end;

function TGeoGraphServerObjectFunctionality__GetNearestMapFormatObjects(Functionality: TFunctionality;   const MaxDistance: double; out List: TByteArray): boolean; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.GetNearestMapFormatObjects(const MaxDistance: double; out List: TByteArray): boolean;
begin
Result:=TGeoGraphServerObjectFunctionality__GetNearestMapFormatObjects(Self,   MaxDistance,List);
end;

function TGeoGraphServerObjectFunctionality__GetNearestMapFormatObjectsNames(Functionality: TFunctionality;   const MaxDistance: double; out Names: WideString): boolean; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.GetNearestMapFormatObjectsNames(const MaxDistance: double; out Names: WideString): boolean;
begin
Result:=TGeoGraphServerObjectFunctionality__GetNearestMapFormatObjectsNames(Self,   MaxDistance,Names);
end;

function TGeoGraphServerObjectFunctionality__Measurements_AddNew(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.Measurements_AddNew(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer;
begin
Result:=TGeoGraphServerObjectFunctionality__Measurements_AddNew(Self,   pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pData);
end;

function TGeoGraphServerObjectFunctionality__Measurements_AddNew1(Functionality: TFunctionality;   const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer; stdcall; external TypesDLL;
function TGeoGraphServerObjectFunctionality.Measurements_AddNew1(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer;
begin
Result:=TGeoGraphServerObjectFunctionality__Measurements_AddNew1(Self,   pTimeID,pidMeasurementObject,pguidMeasurementObject,pDataType,pDataSource,pData);
end;

procedure TGeoGraphServerObjectFunctionality__Measurements_Remove(Functionality: TFunctionality;   const pidMeasurement: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.Measurements_Remove(const pidMeasurement: integer);
begin
TGeoGraphServerObjectFunctionality__Measurements_Remove(Self,   pidMeasurement);
end;

procedure TGeoGraphServerObjectFunctionality__Measurements_Item_UpdateData(Functionality: TFunctionality;   const pTimeID: Double; const pData: TByteArray); stdcall; external TypesDLL;
procedure TGeoGraphServerObjectFunctionality.Measurements_Item_UpdateData(const pTimeID: Double; const pData: TByteArray);
begin
TGeoGraphServerObjectFunctionality__Measurements_Item_UpdateData(Self,   pTimeID,pData);
end;


{TTGeoGraphServerFunctionality}
function TTGeoGraphServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality._CreateInstance: integer;
begin
Result:=TTGeoGraphServerFunctionality___CreateInstance(Self);
end;

procedure TTGeoGraphServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTGeoGraphServerFunctionality._DestroyInstance(const idObj: integer);
begin
TTGeoGraphServerFunctionality___DestroyInstance(Self,   idObj);
end;

function TTGeoGraphServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTGeoGraphServerFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTGeoGraphServerFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality.getName: string;
begin
Result:=TTGeoGraphServerFunctionality__getName(Self);
end;

function TTGeoGraphServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality.getImage: TTypeImage;
begin
Result:=TTGeoGraphServerFunctionality__getImage(Self);
end;

procedure TTGeoGraphServerFunctionality__GetActiveInstanceList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTGeoGraphServerFunctionality.GetActiveInstanceList(out List: TList);
begin
TTGeoGraphServerFunctionality__GetActiveInstanceList(Self,   List);
end;

procedure TTGeoGraphServerFunctionality__GetActiveInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTGeoGraphServerFunctionality.GetActiveInstanceList1(out List: TByteArray);
begin
TTGeoGraphServerFunctionality__GetActiveInstanceList1(Self,   List);
end;

function TTGeoGraphServerFunctionality__GetInstanceForRegistration(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGeoGraphServerFunctionality.GetInstanceForRegistration: integer;
begin
Result:=TTGeoGraphServerFunctionality__GetInstanceForRegistration(Self);
end;


{TGeoGraphServerFunctionality}
procedure TGeoGraphServerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality._ToClone(out idClone: integer);
begin
TGeoGraphServerFunctionality___ToClone(Self,   idClone);
end;

function TGeoGraphServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGeoGraphServerFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TGeoGraphServerFunctionality__SetData(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.SetData(DATAStream: TMemoryStream);
begin
TGeoGraphServerFunctionality__SetData(Self,   DATAStream);
end;

function TGeoGraphServerFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.getName: string;
begin
Result:=TGeoGraphServerFunctionality__getName(Self);
end;

procedure TGeoGraphServerFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.setName(Value: string);
begin
TGeoGraphServerFunctionality__setName(Self,   Value);
end;

function TGeoGraphServerFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.getHint: string;
begin
Result:=TGeoGraphServerFunctionality__getHint(Self);
end;

function TGeoGraphServerFunctionality__getAddress(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.getAddress: string;
begin
Result:=TGeoGraphServerFunctionality__getAddress(Self);
end;

procedure TGeoGraphServerFunctionality__setAddress(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.setAddress(Value: string);
begin
TGeoGraphServerFunctionality__setAddress(Self,   Value);
end;

function TGeoGraphServerFunctionality__getInternalAddress(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.getInternalAddress: string;
begin
Result:=TGeoGraphServerFunctionality__getInternalAddress(Self);
end;

procedure TGeoGraphServerFunctionality__setInternalAddress(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.setInternalAddress(Value: string);
begin
TGeoGraphServerFunctionality__setInternalAddress(Self,   Value);
end;

function TGeoGraphServerFunctionality__getInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.getInfo: string;
begin
Result:=TGeoGraphServerFunctionality__getInfo(Self);
end;

procedure TGeoGraphServerFunctionality__setInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.setInfo(Value: string);
begin
TGeoGraphServerFunctionality__setInfo(Self,   Value);
end;

procedure TGeoGraphServerFunctionality__GetData(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.GetData(out DATAStream: TMemoryStream);
begin
TGeoGraphServerFunctionality__GetData(Self,   DATAStream);
end;

procedure TGeoGraphServerFunctionality__GetData1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.GetData1(out DATAStream: TByteArray);
begin
TGeoGraphServerFunctionality__GetData1(Self,   DATAStream);
end;

function TGeoGraphServerFunctionality__RegisterObject(Functionality: TFunctionality;   const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.RegisterObject(const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;
begin
Result:=TGeoGraphServerFunctionality__RegisterObject(Self,   ObjectName,VisualizationType,VisualizationID,GeoCrdSystemID,HintID);
end;

function TGeoGraphServerFunctionality__RegisterObject1(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.RegisterObject1(const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;
begin
Result:=TGeoGraphServerFunctionality__RegisterObject1(Self,   ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,GeoCrdSystemID,HintID);
end;

function TGeoGraphServerFunctionality__RegisterObject2(Functionality: TFunctionality;   const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.RegisterObject2(const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer;
begin
Result:=TGeoGraphServerFunctionality__RegisterObject2(Self,   ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality__UnRegisterObject(Functionality: TFunctionality;   const ObjectID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.UnRegisterObject(const ObjectID: integer);
begin
TGeoGraphServerFunctionality__UnRegisterObject(Self,   ObjectID);
end;

function TGeoGraphServerFunctionality__ObjectCounter(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.ObjectCounter: integer;
begin
Result:=TGeoGraphServerFunctionality__ObjectCounter(Self);
end;

procedure TGeoGraphServerFunctionality__ExecuteOperation(Functionality: TFunctionality;   const InData: TByteArray; out OutData: TByteArray); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
begin
TGeoGraphServerFunctionality__ExecuteOperation(Self,   InData,OutData);
end;

procedure TGeoGraphServerFunctionality__Object_GetProperties(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_GetProperties(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer);
begin
TGeoGraphServerFunctionality__Object_GetProperties(Self,   ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
end;

procedure TGeoGraphServerFunctionality__Object_GetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_GetProperties1(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer);
begin
TGeoGraphServerFunctionality__Object_GetProperties1(Self,   ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality__Object_SetProperties(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_SetProperties(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer);
begin
TGeoGraphServerFunctionality__Object_SetProperties(Self,   ObjectID,ObjectName,ObjectType,ObjectDatumID,VisualizationType,VisualizationID,GeoSpaceID,HintID);
end;

procedure TGeoGraphServerFunctionality__Object_SetProperties1(Functionality: TFunctionality;   const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_SetProperties1(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer);
begin
TGeoGraphServerFunctionality__Object_SetProperties1(Self,   ObjectID,ObjectName,ObjectType,BusinessType,ObjectComponentID);
end;

function TGeoGraphServerFunctionality__Object_GetObjectType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.Object_GetObjectType(const ObjectID: integer): integer;
begin
Result:=TGeoGraphServerFunctionality__Object_GetObjectType(Self,   ObjectID);
end;

procedure TGeoGraphServerFunctionality__Object_SetObjectType(Functionality: TFunctionality;   const ObjectID: integer; const ObjectType: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_SetObjectType(const ObjectID: integer; const ObjectType: integer);
begin
TGeoGraphServerFunctionality__Object_SetObjectType(Self,   ObjectID,ObjectType);
end;

function TGeoGraphServerFunctionality__Object_GetBusinessType(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.Object_GetBusinessType(const ObjectID: integer): integer;
begin
Result:=TGeoGraphServerFunctionality__Object_GetBusinessType(Self,   ObjectID);
end;

procedure TGeoGraphServerFunctionality__Object_SetBusinessType(Functionality: TFunctionality;   const ObjectID: integer; const BusinessType: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_SetBusinessType(const ObjectID: integer; const BusinessType: integer);
begin
TGeoGraphServerFunctionality__Object_SetBusinessType(Self,   ObjectID,BusinessType);
end;

function TGeoGraphServerFunctionality__Object_GetComponentID(Functionality: TFunctionality;   const ObjectID: integer): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.Object_GetComponentID(const ObjectID: integer): integer;
begin
Result:=TGeoGraphServerFunctionality__Object_GetComponentID(Self,   ObjectID);
end;

procedure TGeoGraphServerFunctionality__Object_SetComponentID(Functionality: TFunctionality;   const ObjectID: integer; const ObjectComponentID: integer); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_SetComponentID(const ObjectID: integer; const ObjectComponentID: integer);
begin
TGeoGraphServerFunctionality__Object_SetComponentID(Self,   ObjectID,ObjectComponentID);
end;

procedure TGeoGraphServerFunctionality__Object_ExecuteOperation(Functionality: TFunctionality;   const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray); stdcall; external TypesDLL;
procedure TGeoGraphServerFunctionality.Object_ExecuteOperation(const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray);
begin
TGeoGraphServerFunctionality__Object_ExecuteOperation(Self,   ObjectID,InData,OutData);
end;

function TGeoGraphServerFunctionality__DataID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoGraphServerFunctionality.DataID: integer;
begin
Result:=TGeoGraphServerFunctionality__DataID(Self);
end;


{TTGeoCrdSystemFunctionality}
function TTGeoCrdSystemFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGeoCrdSystemFunctionality._CreateInstance: integer;
begin
Result:=TTGeoCrdSystemFunctionality___CreateInstance(Self);
end;

procedure TTGeoCrdSystemFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality._DestroyInstance(const idObj: integer);
begin
TTGeoCrdSystemFunctionality___DestroyInstance(Self,   idObj);
end;

function TTGeoCrdSystemFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeoCrdSystemFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTGeoCrdSystemFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTGeoCrdSystemFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeoCrdSystemFunctionality.getName: string;
begin
Result:=TTGeoCrdSystemFunctionality__getName(Self);
end;

function TTGeoCrdSystemFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGeoCrdSystemFunctionality.getImage: TTypeImage;
begin
Result:=TTGeoCrdSystemFunctionality__getImage(Self);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceByLatLongLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceByLatLongLocally(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
begin
TTGeoCrdSystemFunctionality__GetInstanceByLatLongLocally(Self,   pGeoSpaceID,pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceByLatLongLocally1(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceByLatLongLocally1(const pLatitude,pLongitude: double; out oGeoSpaceID: integer; out idCrdSys: integer);
begin
TTGeoCrdSystemFunctionality__GetInstanceByLatLongLocally1(Self,   pLatitude,pLongitude,oGeoSpaceID,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceByXYLocally(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceByXYLocally(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
begin
TTGeoCrdSystemFunctionality__GetInstanceByXYLocally(Self,   pGeoSpaceID,pX,pY,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceByXYLocally1(Functionality: TFunctionality;   const pX,pY: double; out oGeoSpaceID: integer; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceByXYLocally1(const pX,pY: double; out oGeoSpaceID: integer; out idCrdSys: integer);
begin
TTGeoCrdSystemFunctionality__GetInstanceByXYLocally1(Self,   pX,pY,oGeoSpaceID,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceList(out List: TList);
begin
TTGeoCrdSystemFunctionality__GetInstanceList(Self,   List);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceList1(out List: TByteArray);
begin
TTGeoCrdSystemFunctionality__GetInstanceList1(Self,   List);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceByLatLong(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceByLatLong(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
begin
TTGeoCrdSystemFunctionality__GetInstanceByLatLong(Self,   pGeoSpaceID,pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeoCrdSystemFunctionality__GetInstanceByXY(Functionality: TFunctionality;   const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeoCrdSystemFunctionality.GetInstanceByXY(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
begin
TTGeoCrdSystemFunctionality__GetInstanceByXY(Self,   pGeoSpaceID,pX,pY,idCrdSys);
end;


{TGeoCrdSystemFunctionality}
procedure TGeoCrdSystemFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality._ToClone(out idClone: integer);
begin
TGeoCrdSystemFunctionality___ToClone(Self,   idClone);
end;

function TGeoCrdSystemFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGeoCrdSystemFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TGeoCrdSystemFunctionality__GetDataLocally(Functionality: TFunctionality;   out oGeoSpaceID: integer; out oName: string; out oDatum: string; out oProjection: string; out oProjectionData: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.GetDataLocally(out oGeoSpaceID: integer; out oName: string; out oDatum: string; out oProjection: string; out oProjectionData: TMemoryStream);
begin
TGeoCrdSystemFunctionality__GetDataLocally(Self,   oGeoSpaceID,oName,oDatum,oProjection,oProjectionData);
end;

procedure TGeoCrdSystemFunctionality__GetGeodesyPointsLocally(Functionality: TFunctionality;   out Points: TByteArray); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.GetGeodesyPointsLocally(out Points: TByteArray);
begin
TGeoCrdSystemFunctionality__GetGeodesyPointsLocally(Self,   Points);
end;

function TGeoCrdSystemFunctionality__getGeoSpaceID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality.getGeoSpaceID: integer;
begin
Result:=TGeoCrdSystemFunctionality__getGeoSpaceID(Self);
end;

procedure TGeoCrdSystemFunctionality__setGeoSpaceID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.setGeoSpaceID(Value: integer);
begin
TGeoCrdSystemFunctionality__setGeoSpaceID(Self,   Value);
end;

function TGeoCrdSystemFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality.getName: string;
begin
Result:=TGeoCrdSystemFunctionality__getName(Self);
end;

procedure TGeoCrdSystemFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.setName(Value: string);
begin
TGeoCrdSystemFunctionality__setName(Self,   Value);
end;

function TGeoCrdSystemFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality.getHint: string;
begin
Result:=TGeoCrdSystemFunctionality__getHint(Self);
end;

function TGeoCrdSystemFunctionality__getDatum(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality.getDatum: string;
begin
Result:=TGeoCrdSystemFunctionality__getDatum(Self);
end;

procedure TGeoCrdSystemFunctionality__setDatum(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.setDatum(Value: string);
begin
TGeoCrdSystemFunctionality__setDatum(Self,   Value);
end;

function TGeoCrdSystemFunctionality__getProjection(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeoCrdSystemFunctionality.getProjection: string;
begin
Result:=TGeoCrdSystemFunctionality__getProjection(Self);
end;

procedure TGeoCrdSystemFunctionality__setProjection(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.setProjection(Value: string);
begin
TGeoCrdSystemFunctionality__setProjection(Self,   Value);
end;

procedure TGeoCrdSystemFunctionality__GetProjectionDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.GetProjectionDATA(out DATAStream: TMemoryStream);
begin
TGeoCrdSystemFunctionality__GetProjectionDATA(Self,   DATAStream);
end;

procedure TGeoCrdSystemFunctionality__GetProjectionDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.GetProjectionDATA1(out DATAStream: TByteArray);
begin
TGeoCrdSystemFunctionality__GetProjectionDATA1(Self,   DATAStream);
end;

procedure TGeoCrdSystemFunctionality__SetProjectionDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.SetProjectionDATA(DATAStream: TMemoryStream);
begin
TGeoCrdSystemFunctionality__SetProjectionDATA(Self,   DATAStream);
end;

procedure TGeoCrdSystemFunctionality__SetProjectionDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.SetProjectionDATA1(DATAStream: TByteArray);
begin
TGeoCrdSystemFunctionality__SetProjectionDATA1(Self,   DATAStream);
end;

procedure TGeoCrdSystemFunctionality__GetGeodesyPoints(Functionality: TFunctionality;   out Points: TByteArray); stdcall; external TypesDLL;
procedure TGeoCrdSystemFunctionality.GetGeodesyPoints(out Points: TByteArray);
begin
TGeoCrdSystemFunctionality__GetGeodesyPoints(Self,   Points);
end;


{TTFilterVisualizationFunctionality}
function TTFilterVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTFilterVisualizationFunctionality___CreateInstance(Self);
end;

function TTFilterVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTFilterVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTFilterVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality.getName: string;
begin
Result:=TTFilterVisualizationFunctionality__getName(Self);
end;

function TTFilterVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTFilterVisualizationFunctionality__getImage(Self);
end;

function TTFilterVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTFilterVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTFilterVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TFilterVisualizationFunctionality}
procedure TFilterVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality._ToClone(out idClone: integer);
begin
TFilterVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TFilterVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality.DestroyData;
begin
TFilterVisualizationFunctionality__DestroyData(Self);
end;

procedure TFilterVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality.CloneData(out idClone: integer);
begin
TFilterVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TFilterVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TFilterVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TFilterVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TFilterVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TFilterVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TFilterVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TFilterVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality.getName: string;
begin
Result:=TFilterVisualizationFunctionality__getName(Self);
end;

function TFilterVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TFilterVisualizationFunctionality.getHint: string;
begin
Result:=TFilterVisualizationFunctionality__getHint(Self);
end;

procedure TFilterVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out FilterType: integer; out FilterDATA: TByteArray); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality.GetParams(out FilterType: integer; out FilterDATA: TByteArray);
begin
TFilterVisualizationFunctionality__GetParams(Self,   FilterType,FilterDATA);
end;

procedure TFilterVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const FilterType: integer; const FilterDATA: TByteArray); stdcall; external TypesDLL;
procedure TFilterVisualizationFunctionality.SetParams(const FilterType: integer; const FilterDATA: TByteArray);
begin
TFilterVisualizationFunctionality__SetParams(Self,   FilterType,FilterDATA);
end;


{TTHINTVisualizationFunctionality}
function TTHINTVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTHINTVisualizationFunctionality___CreateInstance(Self);
end;

function TTHINTVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHINTVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHINTVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality.getName: string;
begin
Result:=TTHINTVisualizationFunctionality__getName(Self);
end;

function TTHINTVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTHINTVisualizationFunctionality__getImage(Self);
end;

function TTHINTVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTHINTVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTHINTVisualizationFunctionality__StdObjectVisualization(Self);
end;

procedure TTHINTVisualizationFunctionality__GetInstanceParams(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall; external TypesDLL;
procedure TTHINTVisualizationFunctionality.GetInstanceParams(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
begin
TTHINTVisualizationFunctionality__GetInstanceParams(Self,   IDs,MaxInstanceSize,Params);
end;

procedure TTHINTVisualizationFunctionality__GetInstanceParams1(Functionality: TFunctionality;   const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray); stdcall; external TypesDLL;
procedure TTHINTVisualizationFunctionality.GetInstanceParams1(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
begin
TTHINTVisualizationFunctionality__GetInstanceParams1(Self,   IDs,MaxInstanceSize,Params);
end;

procedure TTHINTVisualizationFunctionality__GetInstanceOwnerDatasAndParams(Functionality: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray); stdcall; external TypesDLL;
procedure TTHINTVisualizationFunctionality.GetInstanceOwnerDatasAndParams(const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray);
begin
TTHINTVisualizationFunctionality__GetInstanceOwnerDatasAndParams(Self,   IDs,DataFlags,MaxInstanceSize,Data,Params);
end;


{THINTVisualizationFunctionality}
procedure THINTVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality._ToClone(out idClone: integer);
begin
THINTVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure THINTVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.DestroyData;
begin
THINTVisualizationFunctionality__DestroyData(Self);
end;

procedure THINTVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.CloneData(out idClone: integer);
begin
THINTVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure THINTVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
THINTVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

function THINTVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=THINTVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function THINTVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=THINTVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THINTVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.DATASize: integer;
begin
Result:=THINTVisualizationFunctionality__DATASize(Self);
end;

function THINTVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=THINTVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function THINTVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.getName: string;
begin
Result:=THINTVisualizationFunctionality__getName(Self);
end;

function THINTVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.getHint: string;
begin
Result:=THINTVisualizationFunctionality__getHint(Self);
end;

procedure THINTVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
THINTVisualizationFunctionality__GetDATA(Self,   DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetDATA1(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
THINTVisualizationFunctionality__GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure THINTVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetDATA2(out DATAStream: TByteArray; out DATAType: Integer);
begin
THINTVisualizationFunctionality__GetDATA2(Self,   DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetDATA3(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
THINTVisualizationFunctionality__GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure THINTVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
THINTVisualizationFunctionality__SetDATA(Self,   DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.SetDATA1(DATAStream: TByteArray; const DATAType: integer);
begin
THINTVisualizationFunctionality__SetDATA1(Self,   DATAStream,DATAType);
end;

procedure THINTVisualizationFunctionality__GetPrivateDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetPrivateDATA(out DATAStream: TMemoryStream);
begin
THINTVisualizationFunctionality__GetPrivateDATA(Self,   DATAStream);
end;

procedure THINTVisualizationFunctionality__GetPrivateDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetPrivateDATA1(out DATAStream: TMemoryStream; const MaxSize: integer);
begin
THINTVisualizationFunctionality__GetPrivateDATA1(Self,   DATAStream,MaxSize);
end;

procedure THINTVisualizationFunctionality__GetPrivateDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetPrivateDATA2(out DATAStream: TByteArray);
begin
THINTVisualizationFunctionality__GetPrivateDATA2(Self,   DATAStream);
end;

procedure THINTVisualizationFunctionality__GetPrivateDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.GetPrivateDATA3(out DATAStream: TByteArray; const MaxSize: integer);
begin
THINTVisualizationFunctionality__GetPrivateDATA3(Self,   DATAStream,MaxSize);
end;

procedure THINTVisualizationFunctionality__SetPrivateDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.SetPrivateDATA(DATAStream: TMemoryStream);
begin
THINTVisualizationFunctionality__SetPrivateDATA(Self,   DATAStream);
end;

procedure THINTVisualizationFunctionality__SetPrivateDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.SetPrivateDATA1(DATAStream: TByteArray);
begin
THINTVisualizationFunctionality__SetPrivateDATA1(Self,   DATAStream);
end;

function THINTVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function THINTVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=THINTVisualizationFunctionality__getDATAFileID(Self);
end;

procedure THINTVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.setDATAFileID(Value: integer);
begin
THINTVisualizationFunctionality__setDATAFileID(Self,   Value);
end;

procedure THINTVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THINTVisualizationFunctionality.DATAFile_Clear;
begin
THINTVisualizationFunctionality__DATAFile_Clear(Self);
end;


{TTDetailedPictureVisualizationFunctionality}
function TTDetailedPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTDetailedPictureVisualizationFunctionality___CreateInstance(Self);
end;

function TTDetailedPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTDetailedPictureVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTDetailedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality.getName: string;
begin
Result:=TTDetailedPictureVisualizationFunctionality__getName(Self);
end;

function TTDetailedPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTDetailedPictureVisualizationFunctionality__getImage(Self);
end;

function TTDetailedPictureVisualizationFunctionality__CheckImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality.CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
Result:=TTDetailedPictureVisualizationFunctionality__CheckImportInstance(Self,   ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTDetailedPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTDetailedPictureVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTDetailedPictureVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TDetailedPictureVisualizationFunctionality}
procedure TDetailedPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality._ToClone(out idClone: integer);
begin
TDetailedPictureVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TDetailedPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.DestroyData;
begin
TDetailedPictureVisualizationFunctionality__DestroyData(Self);
end;

procedure TDetailedPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.CloneData(out idClone: integer);
begin
TDetailedPictureVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TDetailedPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TDetailedPictureVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TDetailedPictureVisualizationFunctionality__ReflectOnCanvas(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
begin
Result:=TDetailedPictureVisualizationFunctionality__ReflectOnCanvas(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TDetailedPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TDetailedPictureVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDetailedPictureVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.DATASize: integer;
begin
Result:=TDetailedPictureVisualizationFunctionality__DATASize(Self);
end;

procedure TDetailedPictureVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const pWidth: integer; const pHeight: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.SetParams(const pWidth: integer; const pHeight: integer);
begin
TDetailedPictureVisualizationFunctionality__SetParams(Self,   pWidth,pHeight);
end;

procedure TDetailedPictureVisualizationFunctionality__SetProportion(Functionality: TFunctionality;   const Value: double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.SetProportion(const Value: double);
begin
TDetailedPictureVisualizationFunctionality__SetProportion(Self,   Value);
end;

procedure TDetailedPictureVisualizationFunctionality__Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Clear;
begin
TDetailedPictureVisualizationFunctionality__Clear(Self);
end;

function TDetailedPictureVisualizationFunctionality__GetSegmentsStorageType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.GetSegmentsStorageType: integer;
begin
Result:=TDetailedPictureVisualizationFunctionality__GetSegmentsStorageType(Self);
end;

procedure TDetailedPictureVisualizationFunctionality__SetSegmentsStorageType(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.SetSegmentsStorageType(Value: integer);
begin
TDetailedPictureVisualizationFunctionality__SetSegmentsStorageType(Self,   Value);
end;

function TDetailedPictureVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TDetailedPictureVisualizationFunctionality__ContainerFilled(Self);
end;

procedure TDetailedPictureVisualizationFunctionality__GetLevelsInfoLocally(Functionality: TFunctionality;   out Info: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.GetLevelsInfoLocally(out Info: TByteArray);
begin
TDetailedPictureVisualizationFunctionality__GetLevelsInfoLocally(Self,   Info);
end;

function TDetailedPictureVisualizationFunctionality__TLevelsPropsPanel_Create(Functionality: TFunctionality): TForm; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.TLevelsPropsPanel_Create: TForm;
begin
Result:=TDetailedPictureVisualizationFunctionality__TLevelsPropsPanel_Create(Self);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_ConvertPixPosToXY(Functionality: TFunctionality;   const idLevel: integer; const PixX,PixY: integer; out X,Y: double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_ConvertPixPosToXY(const idLevel: integer; const PixX,PixY: integer; out X,Y: double);
begin
TDetailedPictureVisualizationFunctionality__Level_ConvertPixPosToXY(Self,   idLevel,PixX,PixY,X,Y);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_ConvertXYToPixPos(Functionality: TFunctionality;   const idLevel: integer; const X,Y: double; out PixX,PixY: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_ConvertXYToPixPos(const idLevel: integer; const X,Y: double; out PixX,PixY: integer);
begin
TDetailedPictureVisualizationFunctionality__Level_ConvertXYToPixPos(Self,   idLevel,X,Y,PixX,PixY);
end;

function TDetailedPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TDetailedPictureVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TDetailedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.getName: string;
begin
Result:=TDetailedPictureVisualizationFunctionality__getName(Self);
end;

function TDetailedPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDetailedPictureVisualizationFunctionality.getHint: string;
begin
Result:=TDetailedPictureVisualizationFunctionality__getHint(Self);
end;

procedure TDetailedPictureVisualizationFunctionality__GenerateFromImage(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.GenerateFromImage(DATAStream: TByteArray);
begin
TDetailedPictureVisualizationFunctionality__GenerateFromImage(Self,   DATAStream);
end;

procedure TDetailedPictureVisualizationFunctionality__GenerateFromTiles(Functionality: TFunctionality;   const TilesFolder: string; const SizePowerOf2: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.GenerateFromTiles(const TilesFolder: string; const SizePowerOf2: integer);
begin
TDetailedPictureVisualizationFunctionality__GenerateFromTiles(Self,   TilesFolder,SizePowerOf2);
end;

procedure TDetailedPictureVisualizationFunctionality__RegenerateRegionFromLevel(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.RegenerateRegionFromLevel(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
TDetailedPictureVisualizationFunctionality__RegenerateRegionFromLevel(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TDetailedPictureVisualizationFunctionality__RegenerateRegion(Functionality: TFunctionality;   const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.RegenerateRegion(const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
begin
TDetailedPictureVisualizationFunctionality__RegenerateRegion(Self,   XIndexMin,XIndexMax,YIndexMin,YIndexMax);
end;

procedure TDetailedPictureVisualizationFunctionality__AddNewLevelAndRegenerate(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.AddNewLevelAndRegenerate;
begin
TDetailedPictureVisualizationFunctionality__AddNewLevelAndRegenerate(Self);
end;

procedure TDetailedPictureVisualizationFunctionality__GetLevelsInfo(Functionality: TFunctionality;   out Info: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.GetLevelsInfo(out Info: TByteArray);
begin
TDetailedPictureVisualizationFunctionality__GetLevelsInfo(Self,   Info);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_GetParams(Functionality: TFunctionality;   const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_GetParams(const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double);
begin
TDetailedPictureVisualizationFunctionality__Level_GetParams(Self,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_SetParams(Functionality: TFunctionality;   const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_SetParams(const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double);
begin
TDetailedPictureVisualizationFunctionality__Level_SetParams(Self,   idLevel,DivX,DivY,SegmentWidth,SegmentHeight,VisibleMinScale,VisibleMaxScale);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_GetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_GetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray);
begin
TDetailedPictureVisualizationFunctionality__Level_GetSegments(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_GetSegmentsByIDs(Functionality: TFunctionality;   const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_GetSegmentsByIDs(const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray);
begin
TDetailedPictureVisualizationFunctionality__Level_GetSegmentsByIDs(Self,   idLevel,SegmentsIDs,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_GetSegmentsHashes(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_GetSegmentsHashes(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray);
begin
TDetailedPictureVisualizationFunctionality__Level_GetSegmentsHashes(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,ExceptSegments,SegmentsHashes);
end;

procedure TDetailedPictureVisualizationFunctionality__Level_SetSegments(Functionality: TFunctionality;   const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.Level_SetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray);
begin
TDetailedPictureVisualizationFunctionality__Level_SetSegments(Self,   idLevel,XIndexMin,XIndexMax,YIndexMin,YIndexMax,Segments);
end;

procedure TDetailedPictureVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oWidth: integer; out oHeight: integer); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.GetParams(out oWidth: integer; out oHeight: integer);
begin
TDetailedPictureVisualizationFunctionality__GetParams(Self,   oWidth,oHeight);
end;

procedure TDetailedPictureVisualizationFunctionality__GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TDetailedPictureVisualizationFunctionality.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TDetailedPictureVisualizationFunctionality__GetCoordinates(Self,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;


{TTCoVisualizationFunctionality}
function TTCoVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTCoVisualizationFunctionality___CreateInstance(Self);
end;

function TTCoVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCoVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCoVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality.getName: string;
begin
Result:=TTCoVisualizationFunctionality__getName(Self);
end;

function TTCoVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTCoVisualizationFunctionality__getImage(Self);
end;

function TTCoVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTCoVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTCoVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TCoVisualizationFunctionality}
procedure TCoVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality._ToClone(out idClone: integer);
begin
TCoVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TCoVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.DestroyData;
begin
TCoVisualizationFunctionality__DestroyData(Self);
end;

procedure TCoVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.CloneData(out idClone: integer);
begin
TCoVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TCoVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TCoVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

function TCoVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TCoVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TCoVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCoVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.DATASize: integer;
begin
Result:=TCoVisualizationFunctionality__DATASize(Self);
end;

procedure TCoVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality;   out oContainer: TExtendedContainerCoord); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.UpdateContainer(out oContainer: TExtendedContainerCoord);
begin
TCoVisualizationFunctionality__UpdateContainer(Self,   oContainer);
end;

procedure TCoVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.DATAFile_Clear;
begin
TCoVisualizationFunctionality__DATAFile_Clear(Self);
end;

function TCoVisualizationFunctionality__GetOwnSpaceHINTVisualizationLocally(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.GetOwnSpaceHINTVisualizationLocally(out idHINTVisualization: integer): boolean;
begin
Result:=TCoVisualizationFunctionality__GetOwnSpaceHINTVisualizationLocally(Self,   idHINTVisualization);
end;

procedure TCoVisualizationFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.ToClone(out idClone: integer);
begin
TCoVisualizationFunctionality__ToClone(Self,   idClone);
end;

function TCoVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TCoVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TCoVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.getName: string;
begin
Result:=TCoVisualizationFunctionality__getName(Self);
end;

function TCoVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.getHint: string;
begin
Result:=TCoVisualizationFunctionality__getHint(Self);
end;

procedure TCoVisualizationFunctionality__GetSpace(Functionality: TFunctionality;   out DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.GetSpace(out DATAStream: TMemoryStream);
begin
TCoVisualizationFunctionality__GetSpace(Self,   DATAStream);
end;

procedure TCoVisualizationFunctionality__GetSpace1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.GetSpace1(out DATAStream: TMemoryStream; const MaxSize: integer);
begin
TCoVisualizationFunctionality__GetSpace1(Self,   DATAStream,MaxSize);
end;

procedure TCoVisualizationFunctionality__GetSpace2(Functionality: TFunctionality;   out DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.GetSpace2(out DATAStream: TByteArray);
begin
TCoVisualizationFunctionality__GetSpace2(Self,   DATAStream);
end;

procedure TCoVisualizationFunctionality__GetSpace3(Functionality: TFunctionality;   out DATAStream: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.GetSpace3(out DATAStream: TByteArray; const MaxSize: integer);
begin
TCoVisualizationFunctionality__GetSpace3(Self,   DATAStream,MaxSize);
end;

procedure TCoVisualizationFunctionality__SetSpace(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.SetSpace(DATAStream: TMemoryStream);
begin
TCoVisualizationFunctionality__SetSpace(Self,   DATAStream);
end;

procedure TCoVisualizationFunctionality__SetSpace1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.SetSpace1(DATAStream: TByteArray);
begin
TCoVisualizationFunctionality__SetSpace1(Self,   DATAStream);
end;

function TCoVisualizationFunctionality__GetOwnSpaceHINTVisualization(Functionality: TFunctionality;   out idHINTVisualization: integer): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.GetOwnSpaceHINTVisualization(out idHINTVisualization: integer): boolean;
begin
Result:=TCoVisualizationFunctionality__GetOwnSpaceHINTVisualization(Self,   idHINTVisualization);
end;

function TCoVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TCoVisualizationFunctionality__getDATAFileID(Self);
end;

procedure TCoVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TCoVisualizationFunctionality__setDATAFileID(Self,   Value);
end;

procedure TCoVisualizationFunctionality__Pack(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.Pack;
begin
TCoVisualizationFunctionality__Pack(Self);
end;

procedure TCoVisualizationFunctionality__UnPack(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCoVisualizationFunctionality.UnPack;
begin
TCoVisualizationFunctionality__UnPack(Self);
end;

function TCoVisualizationFunctionality__IsPacked(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TCoVisualizationFunctionality.IsPacked: boolean;
begin
Result:=TCoVisualizationFunctionality__IsPacked(Self);
end;


{TTForumMessageFunctionality}
function TTForumMessageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTForumMessageFunctionality._CreateInstance: integer;
begin
Result:=TTForumMessageFunctionality___CreateInstance(Self);
end;

procedure TTForumMessageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTForumMessageFunctionality._DestroyInstance(const idObj: integer);
begin
TTForumMessageFunctionality___DestroyInstance(Self,   idObj);
end;

function TTForumMessageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTForumMessageFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTForumMessageFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTForumMessageFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTForumMessageFunctionality.getName: string;
begin
Result:=TTForumMessageFunctionality__getName(Self);
end;

function TTForumMessageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTForumMessageFunctionality.getImage: TTypeImage;
begin
Result:=TTForumMessageFunctionality__getImage(Self);
end;


{TForumMessageFunctionality}
procedure TForumMessageFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.UpdateDATA;
begin
TForumMessageFunctionality__UpdateDATA(Self);
end;

procedure TForumMessageFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TForumMessageFunctionality._ToClone(out idClone: integer);
begin
TForumMessageFunctionality___ToClone(Self,   idClone);
end;

function TForumMessageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TForumMessageFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TForumMessageFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TForumMessageFunctionality__FunctionalityUserID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumMessageFunctionality.FunctionalityUserID: integer;
begin
Result:=TForumMessageFunctionality__FunctionalityUserID(Self);
end;

procedure TForumMessageFunctionality__setidUser(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.setidUser(Value: integer);
begin
TForumMessageFunctionality__setidUser(Self,   Value);
end;

procedure TForumMessageFunctionality__Modified(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.Modified;
begin
TForumMessageFunctionality__Modified(Self);
end;

function TForumMessageFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TForumMessageFunctionality.getName: string;
begin
Result:=TForumMessageFunctionality__getName(Self);
end;

function TForumMessageFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TForumMessageFunctionality.getHint: string;
begin
Result:=TForumMessageFunctionality__getHint(Self);
end;

function TForumMessageFunctionality__getidForum(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumMessageFunctionality.getidForum: integer;
begin
Result:=TForumMessageFunctionality__getidForum(Self);
end;

procedure TForumMessageFunctionality__setidForum(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.setidForum(Value: integer);
begin
TForumMessageFunctionality__setidForum(Self,   Value);
end;

function TForumMessageFunctionality__idUser(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumMessageFunctionality.idUser: integer;
begin
Result:=TForumMessageFunctionality__idUser(Self);
end;

procedure TForumMessageFunctionality__Send(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.Send;
begin
TForumMessageFunctionality__Send(Self);
end;

function TForumMessageFunctionality__SentTime(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TForumMessageFunctionality.SentTime: TDateTime;
begin
Result:=TForumMessageFunctionality__SentTime(Self);
end;

function TForumMessageFunctionality__getidForMessage(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumMessageFunctionality.getidForMessage: integer;
begin
Result:=TForumMessageFunctionality__getidForMessage(Self);
end;

procedure TForumMessageFunctionality__setidForMessage(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.setidForMessage(Value: integer);
begin
TForumMessageFunctionality__setidForMessage(Self,   Value);
end;

function TForumMessageFunctionality__LastModified(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TForumMessageFunctionality.LastModified: TDateTime;
begin
Result:=TForumMessageFunctionality__LastModified(Self);
end;

procedure TForumMessageFunctionality__GetMessage(Functionality: TFunctionality;   out Message: TMemoryStream); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.GetMessage(out Message: TMemoryStream);
begin
TForumMessageFunctionality__GetMessage(Self,   Message);
end;

procedure TForumMessageFunctionality__GetMessage1(Functionality: TFunctionality;   out Message: TByteArray); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.GetMessage1(out Message: TByteArray);
begin
TForumMessageFunctionality__GetMessage1(Self,   Message);
end;

procedure TForumMessageFunctionality__SetMessage(Functionality: TFunctionality;   const Message: TMemoryStream); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.SetMessage(const Message: TMemoryStream);
begin
TForumMessageFunctionality__SetMessage(Self,   Message);
end;

procedure TForumMessageFunctionality__SetMessage1(Functionality: TFunctionality;   const Message: TByteArray); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.SetMessage1(const Message: TByteArray);
begin
TForumMessageFunctionality__SetMessage1(Self,   Message);
end;

function TForumMessageFunctionality__ReplyMessageCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumMessageFunctionality.ReplyMessageCount: integer;
begin
Result:=TForumMessageFunctionality__ReplyMessageCount(Self);
end;

procedure TForumMessageFunctionality__GetReplyMessageList(Functionality: TFunctionality;   out MessageList: TList); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.GetReplyMessageList(out MessageList: TList);
begin
TForumMessageFunctionality__GetReplyMessageList(Self,   MessageList);
end;

procedure TForumMessageFunctionality__GetReplyMessageList1(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TForumMessageFunctionality.GetReplyMessageList1(out MessageList: TByteArray);
begin
TForumMessageFunctionality__GetReplyMessageList1(Self,   MessageList);
end;


{TTForumFunctionality}
function TTForumFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTForumFunctionality._CreateInstance: integer;
begin
Result:=TTForumFunctionality___CreateInstance(Self);
end;

procedure TTForumFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTForumFunctionality._DestroyInstance(const idObj: integer);
begin
TTForumFunctionality___DestroyInstance(Self,   idObj);
end;

function TTForumFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTForumFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTForumFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTForumFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTForumFunctionality.getName: string;
begin
Result:=TTForumFunctionality__getName(Self);
end;

function TTForumFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTForumFunctionality.getImage: TTypeImage;
begin
Result:=TTForumFunctionality__getImage(Self);
end;


{TForumFunctionality}
procedure TForumFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TForumFunctionality._ToClone(out idClone: integer);
begin
TForumFunctionality___ToClone(Self,   idClone);
end;

function TForumFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TForumFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TForumFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TForumFunctionality__DeleteOldMessages(Functionality: TFunctionality;   const pMessageLifeTime: TDateTime); stdcall; external TypesDLL;
procedure TForumFunctionality.DeleteOldMessages(const pMessageLifeTime: TDateTime);
begin
TForumFunctionality__DeleteOldMessages(Self,   pMessageLifeTime);
end;

function TForumFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TForumFunctionality.getName: string;
begin
Result:=TForumFunctionality__getName(Self);
end;

procedure TForumFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TForumFunctionality.setName(Value: string);
begin
TForumFunctionality__setName(Self,   Value);
end;

function TForumFunctionality__getMessageLifeTime(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TForumFunctionality.getMessageLifeTime: TDateTime;
begin
Result:=TForumFunctionality__getMessageLifeTime(Self);
end;

procedure TForumFunctionality__setMessageLifeTime(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
procedure TForumFunctionality.setMessageLifeTime(Value: TDateTime);
begin
TForumFunctionality__setMessageLifeTime(Self,   Value);
end;

function TForumFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TForumFunctionality.getHint: string;
begin
Result:=TForumFunctionality__getHint(Self);
end;

function TForumFunctionality__RootMessageCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumFunctionality.RootMessageCount: integer;
begin
Result:=TForumFunctionality__RootMessageCount(Self);
end;

procedure TForumFunctionality__GetRootMessageList(Functionality: TFunctionality;   out MessageList: TList); stdcall; external TypesDLL;
procedure TForumFunctionality.GetRootMessageList(out MessageList: TList);
begin
TForumFunctionality__GetRootMessageList(Self,   MessageList);
end;

procedure TForumFunctionality__GetRootMessageList1(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TForumFunctionality.GetRootMessageList1(out MessageList: TByteArray);
begin
TForumFunctionality__GetRootMessageList1(Self,   MessageList);
end;

function TForumFunctionality__MessageCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TForumFunctionality.MessageCount: integer;
begin
Result:=TForumFunctionality__MessageCount(Self);
end;

procedure TForumFunctionality__GetMessageList(Functionality: TFunctionality;   out MessageList: TList); stdcall; external TypesDLL;
procedure TForumFunctionality.GetMessageList(out MessageList: TList);
begin
TForumFunctionality__GetMessageList(Self,   MessageList);
end;

procedure TForumFunctionality__GetMessageList1(Functionality: TFunctionality;   out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TForumFunctionality.GetMessageList1(out MessageList: TByteArray);
begin
TForumFunctionality__GetMessageList1(Self,   MessageList);
end;

function TForumFunctionality__AddMessage(Functionality: TFunctionality;   const pidUser: integer; const pidForMessage: integer): integer; stdcall; external TypesDLL;
function TForumFunctionality.AddMessage(const pidUser: integer; const pidForMessage: integer): integer;
begin
Result:=TForumFunctionality__AddMessage(Self,   pidUser,pidForMessage);
end;

procedure TForumFunctionality__DestroyMessage(Functionality: TFunctionality;   const pidMessage: integer); stdcall; external TypesDLL;
procedure TForumFunctionality.DestroyMessage(const pidMessage: integer);
begin
TForumFunctionality__DestroyMessage(Self,   pidMessage);
end;


{TTCUSTOMVisualizationFunctionality}
function TTCUSTOMVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTCUSTOMVisualizationFunctionality___CreateInstance(Self);
end;

function TTCUSTOMVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCUSTOMVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCUSTOMVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality.getName: string;
begin
Result:=TTCUSTOMVisualizationFunctionality__getName(Self);
end;

function TTCUSTOMVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTCUSTOMVisualizationFunctionality__getImage(Self);
end;

function TTCUSTOMVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTCUSTOMVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTCUSTOMVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TCUSTOMVisualizationFunctionality}
procedure TCUSTOMVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality._ToClone(out idClone: integer);
begin
TCUSTOMVisualizationFunctionality___ToClone(Self,   idClone);
end;

function TCUSTOMVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCUSTOMVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TCUSTOMVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality.DestroyData;
begin
TCUSTOMVisualizationFunctionality__DestroyData(Self);
end;

procedure TCUSTOMVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality.CloneData(out idClone: integer);
begin
TCUSTOMVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TCUSTOMVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TCUSTOMVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TCUSTOMVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TCUSTOMVisualizationFunctionality__ContainerFilled(Self);
end;

function TCUSTOMVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TCUSTOMVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TCUSTOMVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.getName: string;
begin
Result:=TCUSTOMVisualizationFunctionality__getName(Self);
end;

function TCUSTOMVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.getHint: string;
begin
Result:=TCUSTOMVisualizationFunctionality__getHint(Self);
end;

function TCUSTOMVisualizationFunctionality__getMODULEName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.getMODULEName: string;
begin
Result:=TCUSTOMVisualizationFunctionality__getMODULEName(Self);
end;

procedure TCUSTOMVisualizationFunctionality__setMODULEName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality.setMODULEName(Value: string);
begin
TCUSTOMVisualizationFunctionality__setMODULEName(Self,   Value);
end;

function TCUSTOMVisualizationFunctionality__getFunctionName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.getFunctionName: string;
begin
Result:=TCUSTOMVisualizationFunctionality__getFunctionName(Self);
end;

procedure TCUSTOMVisualizationFunctionality__setFunctionName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality.setFunctionName(Value: string);
begin
TCUSTOMVisualizationFunctionality__setFunctionName(Self,   Value);
end;

function TCUSTOMVisualizationFunctionality__getFunctionVersion(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCUSTOMVisualizationFunctionality.getFunctionVersion: integer;
begin
Result:=TCUSTOMVisualizationFunctionality__getFunctionVersion(Self);
end;

procedure TCUSTOMVisualizationFunctionality__setFunctionVersion(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality.setFunctionVersion(Value: integer);
begin
TCUSTOMVisualizationFunctionality__setFunctionVersion(Self,   Value);
end;

procedure TCUSTOMVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer); stdcall; external TypesDLL;
procedure TCUSTOMVisualizationFunctionality.GetParams(out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer);
begin
TCUSTOMVisualizationFunctionality__GetParams(Self,   oMODULEName,oFunctionName,oFunctionVersion);
end;


{TTOLEVisualizationFunctionality}
function TTOLEVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTOLEVisualizationFunctionality___CreateInstance(Self);
end;

function TTOLEVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOLEVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOLEVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality.getName: string;
begin
Result:=TTOLEVisualizationFunctionality__getName(Self);
end;

function TTOLEVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTOLEVisualizationFunctionality__getImage(Self);
end;

function TTOLEVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOLEVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTOLEVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TOLEVisualizationFunctionality}
procedure TOLEVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality._ToClone(out idClone: integer);
begin
TOLEVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TOLEVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.DestroyData;
begin
TOLEVisualizationFunctionality__DestroyData(Self);
end;

procedure TOLEVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.CloneData(out idClone: integer);
begin
TOLEVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TOLEVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOLEVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TOLEVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TOLEVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

procedure TOLEVisualizationFunctionality__SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.SaveToFile(const FileName: string);
begin
TOLEVisualizationFunctionality__SaveToFile(Self,   FileName);
end;

procedure TOLEVisualizationFunctionality__EditDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.EditDATA;
begin
TOLEVisualizationFunctionality__EditDATA(Self);
end;

function TOLEVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TOLEVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOLEVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality.DATASize: integer;
begin
Result:=TOLEVisualizationFunctionality__DATASize(Self);
end;

function TOLEVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOLEVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TOLEVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality.getName: string;
begin
Result:=TOLEVisualizationFunctionality__getName(Self);
end;

function TOLEVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOLEVisualizationFunctionality.getHint: string;
begin
Result:=TOLEVisualizationFunctionality__getHint(Self);
end;

procedure TOLEVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.GetDATA(out Value: TClientBlobStream);
begin
TOLEVisualizationFunctionality__GetDATA(Self,   Value);
end;

procedure TOLEVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.GetDATA1(out Value: TClientBlobStream; const MaxSize: integer);
begin
TOLEVisualizationFunctionality__GetDATA1(Self,   Value,MaxSize);
end;

procedure TOLEVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.GetDATA2(out Value: TByteArray);
begin
TOLEVisualizationFunctionality__GetDATA2(Self,   Value);
end;

procedure TOLEVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.GetDATA3(out Value: TByteArray; const MaxSize: integer);
begin
TOLEVisualizationFunctionality__GetDATA3(Self,   Value,MaxSize);
end;

procedure TOLEVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.SetDATA(Value: TMemoryStream);
begin
TOLEVisualizationFunctionality__SetDATA(Self,   Value);
end;

procedure TOLEVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TOLEVisualizationFunctionality.SetDATA1(Value: TByteArray);
begin
TOLEVisualizationFunctionality__SetDATA1(Self,   Value);
end;


{TTHTMLVisualizationFunctionality}
function TTHTMLVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTHTMLVisualizationFunctionality___CreateInstance(Self);
end;

function TTHTMLVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHTMLVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHTMLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality.getName: string;
begin
Result:=TTHTMLVisualizationFunctionality__getName(Self);
end;

function TTHTMLVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTHTMLVisualizationFunctionality__getImage(Self);
end;

function TTHTMLVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTHTMLVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTHTMLVisualizationFunctionality__StdObjectVisualization(Self);
end;


{THTMLVisualizationFunctionality}
procedure THTMLVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality._ToClone(out idClone: integer);
begin
THTMLVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure THTMLVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.DestroyData;
begin
THTMLVisualizationFunctionality__DestroyData(Self);
end;

procedure THTMLVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.CloneData(out idClone: integer);
begin
THTMLVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure THTMLVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
THTMLVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

procedure THTMLVisualizationFunctionality__SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.SaveToFile(const FileName: string);
begin
THTMLVisualizationFunctionality__SaveToFile(Self,   FileName);
end;

procedure THTMLVisualizationFunctionality__EditDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.EditDATA;
begin
THTMLVisualizationFunctionality__EditDATA(Self);
end;

function THTMLVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=THTMLVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function THTMLVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=THTMLVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THTMLVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.DATASize: integer;
begin
Result:=THTMLVisualizationFunctionality__DATASize(Self);
end;

function THTMLVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=THTMLVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function THTMLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.getName: string;
begin
Result:=THTMLVisualizationFunctionality__getName(Self);
end;

function THTMLVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.getHint: string;
begin
Result:=THTMLVisualizationFunctionality__getHint(Self);
end;

function THTMLVisualizationFunctionality__getWidth(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function THTMLVisualizationFunctionality.getWidth: integer;
begin
Result:=THTMLVisualizationFunctionality__getWidth(Self);
end;

procedure THTMLVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.setWidth(Value: integer);
begin
THTMLVisualizationFunctionality__setWidth(Self,   Value);
end;

procedure THTMLVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.GetDATA(out Value: TClientBlobStream);
begin
THTMLVisualizationFunctionality__GetDATA(Self,   Value);
end;

procedure THTMLVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.GetDATA1(out Value: TClientBlobStream; const MaxSize: integer);
begin
THTMLVisualizationFunctionality__GetDATA1(Self,   Value,MaxSize);
end;

procedure THTMLVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.GetDATA2(out Value: TByteArray);
begin
THTMLVisualizationFunctionality__GetDATA2(Self,   Value);
end;

procedure THTMLVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.GetDATA3(out Value: TByteArray; const MaxSize: integer);
begin
THTMLVisualizationFunctionality__GetDATA3(Self,   Value,MaxSize);
end;

procedure THTMLVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.SetDATA(Value: TMemoryStream);
begin
THTMLVisualizationFunctionality__SetDATA(Self,   Value);
end;

procedure THTMLVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure THTMLVisualizationFunctionality.SetDATA1(Value: TByteArray);
begin
THTMLVisualizationFunctionality__SetDATA1(Self,   Value);
end;


{TTBZRVisualizationFunctionality}
function TTBZRVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTBZRVisualizationFunctionality___CreateInstance(Self);
end;

function TTBZRVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTBZRVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTBZRVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality.getName: string;
begin
Result:=TTBZRVisualizationFunctionality__getName(Self);
end;

function TTBZRVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTBZRVisualizationFunctionality__getImage(Self);
end;

function TTBZRVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTBZRVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTBZRVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TBZRVisualizationFunctionality}
procedure TBZRVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBZRVisualizationFunctionality._ToClone(out idClone: integer);
begin
TBZRVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TBZRVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBZRVisualizationFunctionality.DestroyData;
begin
TBZRVisualizationFunctionality__DestroyData(Self);
end;

procedure TBZRVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBZRVisualizationFunctionality.CloneData(out idClone: integer);
begin
TBZRVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TBZRVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TBZRVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TBZRVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TBZRVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBZRVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TBZRVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TBZRVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality.getName: string;
begin
Result:=TBZRVisualizationFunctionality__getName(Self);
end;

function TBZRVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBZRVisualizationFunctionality.getHint: string;
begin
Result:=TBZRVisualizationFunctionality__getHint(Self);
end;


{TTAGIFVisualizationFunctionality}
function TTAGIFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTAGIFVisualizationFunctionality___CreateInstance(Self);
end;

function TTAGIFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTAGIFVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTAGIFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality.getName: string;
begin
Result:=TTAGIFVisualizationFunctionality__getName(Self);
end;

function TTAGIFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTAGIFVisualizationFunctionality__getImage(Self);
end;

function TTAGIFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTAGIFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTAGIFVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TAGIFVisualizationFunctionality}
procedure TAGIFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality._ToClone(out idClone: integer);
begin
TAGIFVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TAGIFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.DestroyData;
begin
TAGIFVisualizationFunctionality__DestroyData(Self);
end;

procedure TAGIFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.CloneData(out idClone: integer);
begin
TAGIFVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TAGIFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TAGIFVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

function TAGIFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TAGIFVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TAGIFVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
begin
Result:=TAGIFVisualizationFunctionality__TVisualizationUpdating_Create(Self,   Reflecting);
end;

function TAGIFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TAGIFVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAGIFVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TAGIFVisualizationFunctionality__ContainerFilled(Self);
end;

function TAGIFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TAGIFVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TAGIFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.getName: string;
begin
Result:=TAGIFVisualizationFunctionality__getName(Self);
end;

function TAGIFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAGIFVisualizationFunctionality.getHint: string;
begin
Result:=TAGIFVisualizationFunctionality__getHint(Self);
end;

procedure TAGIFVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.GetDATA(out Value: TClientBlobStream);
begin
TAGIFVisualizationFunctionality__GetDATA(Self,   Value);
end;

procedure TAGIFVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TClientBlobStream; const MaxSize: integer); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.GetDATA1(out Value: TClientBlobStream; const MaxSize: integer);
begin
TAGIFVisualizationFunctionality__GetDATA1(Self,   Value,MaxSize);
end;

procedure TAGIFVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.GetDATA2(out Value: TByteArray);
begin
TAGIFVisualizationFunctionality__GetDATA2(Self,   Value);
end;

procedure TAGIFVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out Value: TByteArray; const MaxSize: integer); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.GetDATA3(out Value: TByteArray; const MaxSize: integer);
begin
TAGIFVisualizationFunctionality__GetDATA3(Self,   Value,MaxSize);
end;

procedure TAGIFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.SetDATA(Value: TMemoryStream);
begin
TAGIFVisualizationFunctionality__SetDATA(Self,   Value);
end;

procedure TAGIFVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TAGIFVisualizationFunctionality.SetDATA1(Value: TByteArray);
begin
TAGIFVisualizationFunctionality__SetDATA1(Self,   Value);
end;


{TTOrientedVIDEOVisualizationFunctionality}
function TTOrientedVIDEOVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality___CreateInstance(Self);
end;

function TTOrientedVIDEOVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOrientedVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality.getName: string;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality__getName(Self);
end;

function TTOrientedVIDEOVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality__getImage(Self);
end;

function TTOrientedVIDEOVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOrientedVIDEOVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TOrientedVIDEOVisualizationFunctionality}
procedure TOrientedVIDEOVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality._ToClone(out idClone: integer);
begin
TOrientedVIDEOVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TOrientedVIDEOVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality.DestroyData;
begin
TOrientedVIDEOVisualizationFunctionality__DestroyData(Self);
end;

procedure TOrientedVIDEOVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality.CloneData(out idClone: integer);
begin
TOrientedVIDEOVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TOrientedVIDEOVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TOrientedVIDEOVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedVIDEOVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
begin
Result:=TOrientedVIDEOVisualizationFunctionality__TVisualizationUpdating_Create(Self,   Reflecting);
end;

function TOrientedVIDEOVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOrientedVIDEOVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedVIDEOVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOrientedVIDEOVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TOrientedVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.getName: string;
begin
Result:=TOrientedVIDEOVisualizationFunctionality__getName(Self);
end;

function TOrientedVIDEOVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.getHint: string;
begin
Result:=TOrientedVIDEOVisualizationFunctionality__getHint(Self);
end;

function TOrientedVIDEOVisualizationFunctionality__getDataServer(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.getDataServer: string;
begin
Result:=TOrientedVIDEOVisualizationFunctionality__getDataServer(Self);
end;

procedure TOrientedVIDEOVisualizationFunctionality__setDataServer(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality.setDataServer(Value: string);
begin
TOrientedVIDEOVisualizationFunctionality__setDataServer(Self,   Value);
end;

function TOrientedVIDEOVisualizationFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedVIDEOVisualizationFunctionality.getObjectID: integer;
begin
Result:=TOrientedVIDEOVisualizationFunctionality__getObjectID(Self);
end;

procedure TOrientedVIDEOVisualizationFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedVIDEOVisualizationFunctionality.setObjectID(Value: integer);
begin
TOrientedVIDEOVisualizationFunctionality__setObjectID(Self,   Value);
end;


{TTVIDEOVisualizationFunctionality}
function TTVIDEOVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTVIDEOVisualizationFunctionality___CreateInstance(Self);
end;

function TTVIDEOVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTVIDEOVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality.getName: string;
begin
Result:=TTVIDEOVisualizationFunctionality__getName(Self);
end;

function TTVIDEOVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTVIDEOVisualizationFunctionality__getImage(Self);
end;

function TTVIDEOVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTVIDEOVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTVIDEOVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TVIDEOVisualizationFunctionality}
procedure TVIDEOVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality._ToClone(out idClone: integer);
begin
TVIDEOVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TVIDEOVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality.DestroyData;
begin
TVIDEOVisualizationFunctionality__DestroyData(Self);
end;

procedure TVIDEOVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality.CloneData(out idClone: integer);
begin
TVIDEOVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TVIDEOVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TVIDEOVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TVIDEOVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
begin
Result:=TVIDEOVisualizationFunctionality__TVisualizationUpdating_Create(Self,   Reflecting);
end;

function TVIDEOVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TVIDEOVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TVIDEOVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TVIDEOVisualizationFunctionality__ContainerFilled(Self);
end;

function TVIDEOVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TVIDEOVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.getName: string;
begin
Result:=TVIDEOVisualizationFunctionality__getName(Self);
end;

function TVIDEOVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.getHint: string;
begin
Result:=TVIDEOVisualizationFunctionality__getHint(Self);
end;

function TVIDEOVisualizationFunctionality__getDataServer(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.getDataServer: string;
begin
Result:=TVIDEOVisualizationFunctionality__getDataServer(Self);
end;

procedure TVIDEOVisualizationFunctionality__setDataServer(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality.setDataServer(Value: string);
begin
TVIDEOVisualizationFunctionality__setDataServer(Self,   Value);
end;

function TVIDEOVisualizationFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TVIDEOVisualizationFunctionality.getObjectID: integer;
begin
Result:=TVIDEOVisualizationFunctionality__getObjectID(Self);
end;

procedure TVIDEOVisualizationFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TVIDEOVisualizationFunctionality.setObjectID(Value: integer);
begin
TVIDEOVisualizationFunctionality__setObjectID(Self,   Value);
end;


{TTOPPVisualizationFunctionality}
function TTOPPVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTOPPVisualizationFunctionality___CreateInstance(Self);
end;

function TTOPPVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOPPVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOPPVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality.getName: string;
begin
Result:=TTOPPVisualizationFunctionality__getName(Self);
end;

function TTOPPVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTOPPVisualizationFunctionality__getImage(Self);
end;

function TTOPPVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOPPVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTOPPVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TOPPVisualizationFunctionality}
procedure TOPPVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality._ToClone(out idClone: integer);
begin
TOPPVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TOPPVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality.DestroyData;
begin
TOPPVisualizationFunctionality__DestroyData(Self);
end;

procedure TOPPVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality.CloneData(out idClone: integer);
begin
TOPPVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TOPPVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TOPPVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOPPVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOPPVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOPPVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOPPVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TOPPVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.getName: string;
begin
Result:=TOPPVisualizationFunctionality__getName(Self);
end;

function TOPPVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.getHint: string;
begin
Result:=TOPPVisualizationFunctionality__getHint(Self);
end;

function TOPPVisualizationFunctionality__getPropsPanel_idTObj(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.getPropsPanel_idTObj: integer;
begin
Result:=TOPPVisualizationFunctionality__getPropsPanel_idTObj(Self);
end;

procedure TOPPVisualizationFunctionality__setPropsPanel_idTObj(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality.setPropsPanel_idTObj(Value: integer);
begin
TOPPVisualizationFunctionality__setPropsPanel_idTObj(Self,   Value);
end;

function TOPPVisualizationFunctionality__getPropsPanel_idObj(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOPPVisualizationFunctionality.getPropsPanel_idObj: integer;
begin
Result:=TOPPVisualizationFunctionality__getPropsPanel_idObj(Self);
end;

procedure TOPPVisualizationFunctionality__setPropsPanel_idObj(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality.setPropsPanel_idObj(Value: integer);
begin
TOPPVisualizationFunctionality__setPropsPanel_idObj(Self,   Value);
end;

procedure TOPPVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer); stdcall; external TypesDLL;
procedure TOPPVisualizationFunctionality.GetParams(out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer);
begin
TOPPVisualizationFunctionality__GetParams(Self,   oPropsPanel_idTObj,oPropsPanel_idObj);
end;


{TTMODELServerFunctionality}
function TTMODELServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMODELServerFunctionality._CreateInstance: integer;
begin
Result:=TTMODELServerFunctionality___CreateInstance(Self);
end;

procedure TTMODELServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMODELServerFunctionality._DestroyInstance(const idObj: integer);
begin
TTMODELServerFunctionality___DestroyInstance(Self,   idObj);
end;

function TTMODELServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMODELServerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMODELServerFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMODELServerFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMODELServerFunctionality.getName: string;
begin
Result:=TTMODELServerFunctionality__getName(Self);
end;

function TTMODELServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMODELServerFunctionality.getImage: TTypeImage;
begin
Result:=TTMODELServerFunctionality__getImage(Self);
end;

function TTMODELServerFunctionality__GetInstanceByIPAddress(Functionality: TFunctionality;   const IPAddress: string;  out id: integer): boolean; stdcall; external TypesDLL;
function TTMODELServerFunctionality.GetInstanceByIPAddress(const IPAddress: string;  out id: integer): boolean;
begin
Result:=TTMODELServerFunctionality__GetInstanceByIPAddress(Self,   IPAddress,id);
end;


{TMODELServerFunctionality}
procedure TMODELServerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMODELServerFunctionality._ToClone(out idClone: integer);
begin
TMODELServerFunctionality___ToClone(Self,   idClone);
end;

function TMODELServerFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TMODELServerFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TMODELServerFunctionality__Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TMODELServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMODELServerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMODELServerFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMODELServerFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerFunctionality.getName: string;
begin
Result:=TMODELServerFunctionality__getName(Self);
end;

procedure TMODELServerFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELServerFunctionality.setName(Value: string);
begin
TMODELServerFunctionality__setName(Self,   Value);
end;

function TMODELServerFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerFunctionality.getHint: string;
begin
Result:=TMODELServerFunctionality__getHint(Self);
end;

function TMODELServerFunctionality__getIPAddress(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerFunctionality.getIPAddress: string;
begin
Result:=TMODELServerFunctionality__getIPAddress(Self);
end;

procedure TMODELServerFunctionality__setIPAddress(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELServerFunctionality.setIPAddress(Value: string);
begin
TMODELServerFunctionality__setIPAddress(Self,   Value);
end;

function TMODELServerFunctionality__IsUserExist(Functionality: TFunctionality;   const _UserName,_UserPassword: string): boolean; stdcall; external TypesDLL;
function TMODELServerFunctionality.IsUserExist(const _UserName,_UserPassword: string): boolean;
begin
Result:=TMODELServerFunctionality__IsUserExist(Self,   _UserName,_UserPassword);
end;

function TMODELServerFunctionality__GetUserID(Functionality: TFunctionality;   const _UserName,_UserPassword: string): integer; stdcall; external TypesDLL;
function TMODELServerFunctionality.GetUserID(const _UserName,_UserPassword: string): integer;
begin
Result:=TMODELServerFunctionality__GetUserID(Self,   _UserName,_UserPassword);
end;

function TMODELServerFunctionality__IsOnLine(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMODELServerFunctionality.IsOnLine: boolean;
begin
Result:=TMODELServerFunctionality__IsOnLine(Self);
end;

function TMODELServerFunctionality__Info(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELServerFunctionality.Info: string;
begin
Result:=TMODELServerFunctionality__Info(Self);
end;

procedure TMODELServerFunctionality__GetLicense(Functionality: TFunctionality;   out License: WideString); stdcall; external TypesDLL;
procedure TMODELServerFunctionality.GetLicense(out License: WideString);
begin
TMODELServerFunctionality__GetLicense(Self,   License);
end;

procedure TMODELServerFunctionality__CreateNewUserByDefaultPrototype(Functionality: TFunctionality;   const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer); stdcall; external TypesDLL;
procedure TMODELServerFunctionality.CreateNewUserByDefaultPrototype(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer);
begin
TMODELServerFunctionality__CreateNewUserByDefaultPrototype(Self,   NewUserName,NewUserPassword,NewUserFullName,NewUserContactInfo,idNewUser);
end;


{TTCoReferenceFunctionality}
function TTCoReferenceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCoReferenceFunctionality._CreateInstance: integer;
begin
Result:=TTCoReferenceFunctionality___CreateInstance(Self);
end;

procedure TTCoReferenceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCoReferenceFunctionality._DestroyInstance(const idObj: integer);
begin
TTCoReferenceFunctionality___DestroyInstance(Self,   idObj);
end;

function TTCoReferenceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoReferenceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCoReferenceFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCoReferenceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoReferenceFunctionality.getName: string;
begin
Result:=TTCoReferenceFunctionality__getName(Self);
end;

function TTCoReferenceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCoReferenceFunctionality.getImage: TTypeImage;
begin
Result:=TTCoReferenceFunctionality__getImage(Self);
end;


{TCoReferenceFunctionality}
procedure TCoReferenceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoReferenceFunctionality._ToClone(out idClone: integer);
begin
TCoReferenceFunctionality___ToClone(Self,   idClone);
end;

function TCoReferenceFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TCoReferenceFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TCoReferenceFunctionality__Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TCoReferenceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoReferenceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCoReferenceFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TCoReferenceFunctionality__ShowReferencedObjectPanelProps(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCoReferenceFunctionality.ShowReferencedObjectPanelProps;
begin
TCoReferenceFunctionality__ShowReferencedObjectPanelProps(Self);
end;

function TCoReferenceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoReferenceFunctionality.getName: string;
begin
Result:=TCoReferenceFunctionality__getName(Self);
end;

procedure TCoReferenceFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TCoReferenceFunctionality.setName(Value: string);
begin
TCoReferenceFunctionality__setName(Self,   Value);
end;

function TCoReferenceFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoReferenceFunctionality.getHint: string;
begin
Result:=TCoReferenceFunctionality__getHint(Self);
end;

procedure TCoReferenceFunctionality__GetReferencedObject(Functionality: TFunctionality;   out idTReferencedObject,idReferencedObject: integer); stdcall; external TypesDLL;
procedure TCoReferenceFunctionality.GetReferencedObject(out idTReferencedObject,idReferencedObject: integer);
begin
TCoReferenceFunctionality__GetReferencedObject(Self,   idTReferencedObject,idReferencedObject);
end;

procedure TCoReferenceFunctionality__SetReferencedObject(Functionality: TFunctionality;   const idTReferencedObject,idReferencedObject: integer); stdcall; external TypesDLL;
procedure TCoReferenceFunctionality.SetReferencedObject(const idTReferencedObject,idReferencedObject: integer);
begin
TCoReferenceFunctionality__SetReferencedObject(Self,   idTReferencedObject,idReferencedObject);
end;


{TTPositionerFunctionality}
function TTPositionerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTPositionerFunctionality._CreateInstance: integer;
begin
Result:=TTPositionerFunctionality___CreateInstance(Self);
end;

procedure TTPositionerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTPositionerFunctionality._DestroyInstance(const idObj: integer);
begin
TTPositionerFunctionality___DestroyInstance(Self,   idObj);
end;

function TTPositionerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTPositionerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTPositionerFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTPositionerFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTPositionerFunctionality.getName: string;
begin
Result:=TTPositionerFunctionality__getName(Self);
end;

function TTPositionerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTPositionerFunctionality.getImage: TTypeImage;
begin
Result:=TTPositionerFunctionality__getImage(Self);
end;


{TPositionerFunctionality}
procedure TPositionerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPositionerFunctionality._ToClone(out idClone: integer);
begin
TPositionerFunctionality___ToClone(Self,   idClone);
end;

function TPositionerFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TPositionerFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TPositionerFunctionality__Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TPositionerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TPositionerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TPositionerFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TPositionerFunctionality__SetPosition(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPositionerFunctionality.SetPosition;
begin
TPositionerFunctionality__SetPosition(Self);
end;

function TPositionerFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPositionerFunctionality.getName: string;
begin
Result:=TPositionerFunctionality__getName(Self);
end;

function TPositionerFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPositionerFunctionality.getHint: string;
begin
Result:=TPositionerFunctionality__getHint(Self);
end;

procedure TPositionerFunctionality__Get2DPosition(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TPositionerFunctionality.Get2DPosition(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TPositionerFunctionality__Get2DPosition(Self,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TPositionerFunctionality__Save2DPosition(Functionality: TFunctionality;   Reflector: TReflector); stdcall; external TypesDLL;
procedure TPositionerFunctionality.Save2DPosition(Reflector: TReflector);
begin
TPositionerFunctionality__Save2DPosition(Self,   Reflector);
end;

procedure TPositionerFunctionality__Save2DPosition1(Functionality: TFunctionality;   const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TPositionerFunctionality.Save2DPosition1(const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TPositionerFunctionality__Save2DPosition1(Self,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

function TPositionerFunctionality__getPositionName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPositionerFunctionality.getPositionName: string;
begin
Result:=TPositionerFunctionality__getPositionName(Self);
end;

procedure TPositionerFunctionality__setPositionName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TPositionerFunctionality.setPositionName(Value: string);
begin
TPositionerFunctionality__setPositionName(Self,   Value);
end;


{TTOrientedWMFVisualizationFunctionality}
function TTOrientedWMFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTOrientedWMFVisualizationFunctionality___CreateInstance(Self);
end;

function TTOrientedWMFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOrientedWMFVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOrientedWMFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality.getName: string;
begin
Result:=TTOrientedWMFVisualizationFunctionality__getName(Self);
end;

function TTOrientedWMFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTOrientedWMFVisualizationFunctionality__getImage(Self);
end;

function TTOrientedWMFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOrientedWMFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTOrientedWMFVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TOrientedWMFVisualizationFunctionality}
procedure TOrientedWMFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality._ToClone(out idClone: integer);
begin
TOrientedWMFVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TOrientedWMFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.DestroyData;
begin
TOrientedWMFVisualizationFunctionality__DestroyData(Self);
end;

procedure TOrientedWMFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.CloneData(out idClone: integer);
begin
TOrientedWMFVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TOrientedWMFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TOrientedWMFVisualizationFunctionality__DoOnChangeScale(Self,   ChangeCoef);
end;

procedure TOrientedWMFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TOrientedWMFVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

function TOrientedWMFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TOrientedWMFVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedWMFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOrientedWMFVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedWMFVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.DATASize: integer;
begin
Result:=TOrientedWMFVisualizationFunctionality__DATASize(Self);
end;

function TOrientedWMFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOrientedWMFVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TOrientedWMFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.getName: string;
begin
Result:=TOrientedWMFVisualizationFunctionality__getName(Self);
end;

function TOrientedWMFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.getHint: string;
begin
Result:=TOrientedWMFVisualizationFunctionality__getHint(Self);
end;

procedure TOrientedWMFVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TOrientedWMFVisualizationFunctionality__GetDATA(Self,   DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetDATA1(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TOrientedWMFVisualizationFunctionality__GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetDATA2(out DATAStream: TByteArray; out DATAType: Integer);
begin
TOrientedWMFVisualizationFunctionality__GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetDATA3(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TOrientedWMFVisualizationFunctionality__GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality__GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetJPEGDATA(out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
TOrientedWMFVisualizationFunctionality__GetJPEGDATA(Self,   DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality__GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetJPEGDATA1(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
TOrientedWMFVisualizationFunctionality__GetJPEGDATA1(Self,   DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TOrientedWMFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TOrientedWMFVisualizationFunctionality__SetDATA(Self,   DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.SetDATA1(DATAStream: TByteArray; const DATAType: integer);
begin
TOrientedWMFVisualizationFunctionality__SetDATA1(Self,   DATAStream,DATAType);
end;

function TOrientedWMFVisualizationFunctionality__getWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.getWidth: Double;
begin
Result:=TOrientedWMFVisualizationFunctionality__getWidth(Self);
end;

procedure TOrientedWMFVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.setWidth(Value: Double);
begin
TOrientedWMFVisualizationFunctionality__setWidth(Self,   Value);
end;

function TOrientedWMFVisualizationFunctionality__getHeight(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.getHeight: Double;
begin
Result:=TOrientedWMFVisualizationFunctionality__getHeight(Self);
end;

procedure TOrientedWMFVisualizationFunctionality__setHeight(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.setHeight(Value: Double);
begin
TOrientedWMFVisualizationFunctionality__setHeight(Self,   Value);
end;

function TOrientedWMFVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.getOrientation: integer;
begin
Result:=TOrientedWMFVisualizationFunctionality__getOrientation(Self);
end;

procedure TOrientedWMFVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.setOrientation(Value: integer);
begin
TOrientedWMFVisualizationFunctionality__setOrientation(Self,   Value);
end;

procedure TOrientedWMFVisualizationFunctionality__ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.ChangeScale(const ScaleFactor: Double);
begin
TOrientedWMFVisualizationFunctionality__ChangeScale(Self,   ScaleFactor);
end;

procedure TOrientedWMFVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.UpdateContainer;
begin
TOrientedWMFVisualizationFunctionality__UpdateContainer(Self);
end;

function TOrientedWMFVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TOrientedWMFVisualizationFunctionality__getDATAFileID(Self);
end;

procedure TOrientedWMFVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TOrientedWMFVisualizationFunctionality__setDATAFileID(Self,   Value);
end;

procedure TOrientedWMFVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.DATAFile_Clear;
begin
TOrientedWMFVisualizationFunctionality__DATAFile_Clear(Self);
end;

function TOrientedWMFVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall; external TypesDLL;
function TOrientedWMFVisualizationFunctionality.IsNewContainerAcceptable(const NewWidth,NewHeight,NewScale: Double): boolean;
begin
Result:=TOrientedWMFVisualizationFunctionality__IsNewContainerAcceptable(Self,   NewWidth,NewHeight,NewScale);
end;

procedure TOrientedWMFVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall; external TypesDLL;
procedure TOrientedWMFVisualizationFunctionality.GetParams(out oWidth: Double; out oHeight: Double; out oOrientation: integer);
begin
TOrientedWMFVisualizationFunctionality__GetParams(Self,   oWidth,oHeight,oOrientation);
end;


{TTCELLVisualizationFunctionality}
function TTCELLVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTCELLVisualizationFunctionality___CreateInstance(Self);
end;

function TTCELLVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCELLVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCELLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality.getName: string;
begin
Result:=TTCELLVisualizationFunctionality__getName(Self);
end;

function TTCELLVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTCELLVisualizationFunctionality__getImage(Self);
end;

function TTCELLVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTCELLVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTCELLVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TCELLVisualizationFunctionality}
procedure TCELLVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality._ToClone(out idClone: integer);
begin
TCELLVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TCELLVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.DestroyData;
begin
TCELLVisualizationFunctionality__DestroyData(Self);
end;

procedure TCELLVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.CloneData(out idClone: integer);
begin
TCELLVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TCELLVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TCELLVisualizationFunctionality__DoOnChangeScale(Self,   ChangeCoef);
end;

function TCELLVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TCELLVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TCELLVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCELLVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TCELLVisualizationFunctionality__SetReflectorView(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.SetReflectorView;
begin
TCELLVisualizationFunctionality__SetReflectorView(Self);
end;

function TCELLVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TCELLVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TCELLVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getName: string;
begin
Result:=TCELLVisualizationFunctionality__getName(Self);
end;

function TCELLVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getHint: string;
begin
Result:=TCELLVisualizationFunctionality__getHint(Self);
end;

procedure TCELLVisualizationFunctionality__GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
begin
TCELLVisualizationFunctionality__GetCoordinates(Self,   X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TCELLVisualizationFunctionality__Change(Functionality: TFunctionality;   const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.Change(const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer);
begin
TCELLVisualizationFunctionality__Change(Self,   Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows);
end;

function TCELLVisualizationFunctionality__GetFormatNodes(Functionality: TFunctionality;   out NodesList: TList; out SizeX,SizeY: integer): boolean; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.GetFormatNodes(out NodesList: TList; out SizeX,SizeY: integer): boolean;
begin
Result:=TCELLVisualizationFunctionality__GetFormatNodes(Self,   NodesList,SizeX,SizeY);
end;

function TCELLVisualizationFunctionality__GetFormatNodes1(Functionality: TFunctionality;   out NodesList: TByteArray; out SizeX,SizeY: integer): boolean; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.GetFormatNodes1(out NodesList: TByteArray; out SizeX,SizeY: integer): boolean;
begin
Result:=TCELLVisualizationFunctionality__GetFormatNodes1(Self,   NodesList,SizeX,SizeY);
end;

procedure TCELLVisualizationFunctionality__DoQuad(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.DoQuad;
begin
TCELLVisualizationFunctionality__DoQuad(Self);
end;

procedure TCELLVisualizationFunctionality__GetInsideObjectsList(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TComponentsList); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.GetInsideObjectsList(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TComponentsList);
begin
TCELLVisualizationFunctionality__GetInsideObjectsList(Self,   FindTypeID,flBuiltInType,List);
end;

procedure TCELLVisualizationFunctionality__GetInsideObjectsList1(Functionality: TFunctionality;   const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.GetInsideObjectsList1(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray);
begin
TCELLVisualizationFunctionality__GetInsideObjectsList1(Self,   FindTypeID,flBuiltInType,List);
end;

function TCELLVisualizationFunctionality__getColCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getColCount: integer;
begin
Result:=TCELLVisualizationFunctionality__getColCount(Self);
end;

procedure TCELLVisualizationFunctionality__setColCount(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.setColCount(Value: integer);
begin
TCELLVisualizationFunctionality__setColCount(Self,   Value);
end;

function TCELLVisualizationFunctionality__getRowCount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getRowCount: integer;
begin
Result:=TCELLVisualizationFunctionality__getRowCount(Self);
end;

procedure TCELLVisualizationFunctionality__setRowCount(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.setRowCount(Value: integer);
begin
TCELLVisualizationFunctionality__setRowCount(Self,   Value);
end;

function TCELLVisualizationFunctionality__getLineWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getLineWidth: Double;
begin
Result:=TCELLVisualizationFunctionality__getLineWidth(Self);
end;

procedure TCELLVisualizationFunctionality__setLineWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.setLineWidth(Value: Double);
begin
TCELLVisualizationFunctionality__setLineWidth(Self,   Value);
end;

function TCELLVisualizationFunctionality__getColSize(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getColSize: Double;
begin
Result:=TCELLVisualizationFunctionality__getColSize(Self);
end;

function TCELLVisualizationFunctionality__getRowSize(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TCELLVisualizationFunctionality.getRowSize: Double;
begin
Result:=TCELLVisualizationFunctionality__getRowSize(Self);
end;

procedure TCELLVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oColCount: integer; out oRowCount: integer; out oLineWidth: Double); stdcall; external TypesDLL;
procedure TCELLVisualizationFunctionality.GetParams(out oColCount: integer; out oRowCount: integer; out oLineWidth: Double);
begin
TCELLVisualizationFunctionality__GetParams(Self,   oColCount,oRowCount,oLineWidth);
end;


{TTEllipseVisualizationFunctionality}
function TTEllipseVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTEllipseVisualizationFunctionality___CreateInstance(Self);
end;

function TTEllipseVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTEllipseVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTEllipseVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality.getName: string;
begin
Result:=TTEllipseVisualizationFunctionality__getName(Self);
end;

function TTEllipseVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTEllipseVisualizationFunctionality__getImage(Self);
end;

function TTEllipseVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTEllipseVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTEllipseVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TEllipseVisualizationFunctionality}
procedure TEllipseVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality._ToClone(out idClone: integer);
begin
TEllipseVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TEllipseVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality.DestroyData;
begin
TEllipseVisualizationFunctionality__DestroyData(Self);
end;

procedure TEllipseVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality.CloneData(out idClone: integer);
begin
TEllipseVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TEllipseVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TEllipseVisualizationFunctionality__DoOnChangeScale(Self,   ChangeCoef);
end;

function TEllipseVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TEllipseVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TEllipseVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TEllipseVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TEllipseVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TEllipseVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TEllipseVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.getName: string;
begin
Result:=TEllipseVisualizationFunctionality__getName(Self);
end;

function TEllipseVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.getHint: string;
begin
Result:=TEllipseVisualizationFunctionality__getHint(Self);
end;

function TEllipseVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.getColor: TColor;
begin
Result:=TEllipseVisualizationFunctionality__getColor(Self);
end;

procedure TEllipseVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality.setColor(Value: TColor);
begin
TEllipseVisualizationFunctionality__setColor(Self,   Value);
end;

function TEllipseVisualizationFunctionality__getBorderColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.getBorderColor: TColor;
begin
Result:=TEllipseVisualizationFunctionality__getBorderColor(Self);
end;

procedure TEllipseVisualizationFunctionality__setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality.setBorderColor(Value: TColor);
begin
TEllipseVisualizationFunctionality__setBorderColor(Self,   Value);
end;

function TEllipseVisualizationFunctionality__getBorderWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TEllipseVisualizationFunctionality.getBorderWidth: Double;
begin
Result:=TEllipseVisualizationFunctionality__getBorderWidth(Self);
end;

procedure TEllipseVisualizationFunctionality__setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TEllipseVisualizationFunctionality.setBorderWidth(Value: Double);
begin
TEllipseVisualizationFunctionality__setBorderWidth(Self,   Value);
end;


{TTWMFVisualizationFunctionality}
function TTWMFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTWMFVisualizationFunctionality___CreateInstance(Self);
end;

function TTWMFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTWMFVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTWMFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality.getName: string;
begin
Result:=TTWMFVisualizationFunctionality__getName(Self);
end;

function TTWMFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTWMFVisualizationFunctionality__getImage(Self);
end;

function TTWMFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTWMFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTWMFVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TWMFVisualizationFunctionality}
procedure TWMFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality._ToClone(out idClone: integer);
begin
TWMFVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TWMFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.DestroyData;
begin
TWMFVisualizationFunctionality__DestroyData(Self);
end;

procedure TWMFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.CloneData(out idClone: integer);
begin
TWMFVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TWMFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TWMFVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

function TWMFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TWMFVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TWMFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TWMFVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWMFVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.DATASize: integer;
begin
Result:=TWMFVisualizationFunctionality__DATASize(Self);
end;

function TWMFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TWMFVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TWMFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.getName: string;
begin
Result:=TWMFVisualizationFunctionality__getName(Self);
end;

function TWMFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.getHint: string;
begin
Result:=TWMFVisualizationFunctionality__getHint(Self);
end;

procedure TWMFVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TWMFVisualizationFunctionality__GetDATA(Self,   DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.GetDATA1(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TWMFVisualizationFunctionality__GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TWMFVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.GetDATA2(out DATAStream: TByteArray; out DATAType: Integer);
begin
TWMFVisualizationFunctionality__GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.GetDATA3(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TWMFVisualizationFunctionality__GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TWMFVisualizationFunctionality__GetJPEGDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.GetJPEGDATA(out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
TWMFVisualizationFunctionality__GetJPEGDATA(Self,   DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TWMFVisualizationFunctionality__GetJPEGDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.GetJPEGDATA1(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
begin
TWMFVisualizationFunctionality__GetJPEGDATA1(Self,   DATAStream,pWidth,pHeight,pQuality,MaxSize);
end;

procedure TWMFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TWMFVisualizationFunctionality__SetDATA(Self,   DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.SetDATA1(DATAStream: TByteArray; const DATAType: integer);
begin
TWMFVisualizationFunctionality__SetDATA1(Self,   DATAStream,DATAType);
end;

function TWMFVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TWMFVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TWMFVisualizationFunctionality__getDATAFileID(Self);
end;

procedure TWMFVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TWMFVisualizationFunctionality__setDATAFileID(Self,   Value);
end;

procedure TWMFVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.DATAFile_Clear;
begin
TWMFVisualizationFunctionality__DATAFile_Clear(Self);
end;

procedure TWMFVisualizationFunctionality__SetProportion(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWMFVisualizationFunctionality.SetProportion;
begin
TWMFVisualizationFunctionality__SetProportion(Self);
end;


{TTPictureVisualizationFunctionality}
function TTPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTPictureVisualizationFunctionality___CreateInstance(Self);
end;

function TTPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTPictureVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality.getName: string;
begin
Result:=TTPictureVisualizationFunctionality__getName(Self);
end;

function TTPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTPictureVisualizationFunctionality__getImage(Self);
end;

function TTPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTPictureVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTPictureVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TPictureVisualizationFunctionality}
procedure TPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality._ToClone(out idClone: integer);
begin
TPictureVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.DestroyData;
begin
TPictureVisualizationFunctionality__DestroyData(Self);
end;

procedure TPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.CloneData(out idClone: integer);
begin
TPictureVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TPictureVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TPictureVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

function TPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TPictureVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TPictureVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPictureVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.DATASize: integer;
begin
Result:=TPictureVisualizationFunctionality__DATASize(Self);
end;

function TPictureVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TPictureVisualizationFunctionality__ContainerFilled(Self);
end;

function TPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TPictureVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.getName: string;
begin
Result:=TPictureVisualizationFunctionality__getName(Self);
end;

function TPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.getHint: string;
begin
Result:=TPictureVisualizationFunctionality__getHint(Self);
end;

procedure TPictureVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TPictureVisualizationFunctionality__GetDATA(Self,   DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetDATA1(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TPictureVisualizationFunctionality__GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TPictureVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetDATA2(out DATAStream: TByteArray; out DATAType: Integer);
begin
TPictureVisualizationFunctionality__GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetDATA3(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TPictureVisualizationFunctionality__GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TPictureVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TPictureVisualizationFunctionality__SetDATA(Self,   DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.SetDATA1(DATAStream: TByteArray; const DATAType: integer);
begin
TPictureVisualizationFunctionality__SetDATA1(Self,   DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality__GetBMP(Functionality: TFunctionality;   out BMP: TBitmap); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetBMP(out BMP: TBitmap);
begin
TPictureVisualizationFunctionality__GetBMP(Self,   BMP);
end;

procedure TPictureVisualizationFunctionality__GetBMP1(Functionality: TFunctionality;   out BMP: TByteArray); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetBMP1(out BMP: TByteArray);
begin
TPictureVisualizationFunctionality__GetBMP1(Self,   BMP);
end;

procedure TPictureVisualizationFunctionality__SetProportion(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.SetProportion;
begin
TPictureVisualizationFunctionality__SetProportion(Self);
end;

function TPictureVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TPictureVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TPictureVisualizationFunctionality__getDATAFileID(Self);
end;

procedure TPictureVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TPictureVisualizationFunctionality__setDATAFileID(Self,   Value);
end;

procedure TPictureVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.DATAFile_Clear;
begin
TPictureVisualizationFunctionality__DATAFile_Clear(Self);
end;

procedure TPictureVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out VisibleMinScale: double; out VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.GetParams(out VisibleMinScale: double; out VisibleMaxScale: double);
begin
TPictureVisualizationFunctionality__GetParams(Self,   VisibleMinScale,VisibleMaxScale);
end;

procedure TPictureVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const VisibleMinScale: double; const VisibleMaxScale: double); stdcall; external TypesDLL;
procedure TPictureVisualizationFunctionality.SetParams(const VisibleMinScale: double; const VisibleMaxScale: double);
begin
TPictureVisualizationFunctionality__SetParams(Self,   VisibleMinScale,VisibleMaxScale);
end;


{TTRoundVisualizationFunctionality}
function TTRoundVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTRoundVisualizationFunctionality___CreateInstance(Self);
end;

function TTRoundVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTRoundVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTRoundVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality.getName: string;
begin
Result:=TTRoundVisualizationFunctionality__getName(Self);
end;

function TTRoundVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTRoundVisualizationFunctionality__getImage(Self);
end;

function TTRoundVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTRoundVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTRoundVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TRoundVisualizationFunctionality}
procedure TRoundVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality._ToClone(out idClone: integer);
begin
TRoundVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TRoundVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality.DestroyData;
begin
TRoundVisualizationFunctionality__DestroyData(Self);
end;

procedure TRoundVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality.CloneData(out idClone: integer);
begin
TRoundVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TRoundVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TRoundVisualizationFunctionality__DoOnChangeScale(Self,   ChangeCoef);
end;

function TRoundVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TRoundVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TRoundVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TRoundVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TRoundVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TRoundVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TRoundVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.getName: string;
begin
Result:=TRoundVisualizationFunctionality__getName(Self);
end;

function TRoundVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.getHint: string;
begin
Result:=TRoundVisualizationFunctionality__getHint(Self);
end;

function TRoundVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.getColor: TColor;
begin
Result:=TRoundVisualizationFunctionality__getColor(Self);
end;

procedure TRoundVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality.setColor(Value: TColor);
begin
TRoundVisualizationFunctionality__setColor(Self,   Value);
end;

function TRoundVisualizationFunctionality__getBorderColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.getBorderColor: TColor;
begin
Result:=TRoundVisualizationFunctionality__getBorderColor(Self);
end;

procedure TRoundVisualizationFunctionality__setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality.setBorderColor(Value: TColor);
begin
TRoundVisualizationFunctionality__setBorderColor(Self,   Value);
end;

function TRoundVisualizationFunctionality__getBorderWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TRoundVisualizationFunctionality.getBorderWidth: Double;
begin
Result:=TRoundVisualizationFunctionality__getBorderWidth(Self);
end;

procedure TRoundVisualizationFunctionality__setBorderWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TRoundVisualizationFunctionality.setBorderWidth(Value: Double);
begin
TRoundVisualizationFunctionality__setBorderWidth(Self,   Value);
end;


{TTGeodesyPointFunctionality}
function TTGeodesyPointFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality._CreateInstance: integer;
begin
Result:=TTGeodesyPointFunctionality___CreateInstance(Self);
end;

procedure TTGeodesyPointFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTGeodesyPointFunctionality._DestroyInstance(const idObj: integer);
begin
TTGeodesyPointFunctionality___DestroyInstance(Self,   idObj);
end;

function TTGeodesyPointFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTGeodesyPointFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTGeodesyPointFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.getName: string;
begin
Result:=TTGeodesyPointFunctionality__getName(Self);
end;

function TTGeodesyPointFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.getImage: TTypeImage;
begin
Result:=TTGeodesyPointFunctionality__getImage(Self);
end;

function TTGeodesyPointFunctionality__ConvertSpaceCRDToGeoCRD(Functionality: TFunctionality;   const X,Y: Double; out Latitude,Longitude: Double): boolean; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.ConvertSpaceCRDToGeoCRD(const X,Y: Double; out Latitude,Longitude: Double): boolean;
begin
Result:=TTGeodesyPointFunctionality__ConvertSpaceCRDToGeoCRD(Self,   X,Y,Latitude,Longitude);
end;

function TTGeodesyPointFunctionality__ConvertGeoCRDToSpaceCRD(Functionality: TFunctionality;   const Latitude,Longitude: Double; out X,Y: Double): boolean; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.ConvertGeoCRDToSpaceCRD(const Latitude,Longitude: Double; out X,Y: Double): boolean;
begin
Result:=TTGeodesyPointFunctionality__ConvertGeoCRDToSpaceCRD(Self,   Latitude,Longitude,X,Y);
end;

procedure TTGeodesyPointFunctionality__GetNearestCrdSys(Functionality: TFunctionality;   const pLatitude,pLongitude: double; out idCrdSys: integer); stdcall; external TypesDLL;
procedure TTGeodesyPointFunctionality.GetNearestCrdSys(const pLatitude,pLongitude: double; out idCrdSys: integer);
begin
TTGeodesyPointFunctionality__GetNearestCrdSys(Self,   pLatitude,pLongitude,idCrdSys);
end;

procedure TTGeodesyPointFunctionality__GetInstanceListByCrdSys(Functionality: TFunctionality;   const idCrdSys: integer; out List: TByteArray); stdcall; external TypesDLL;
procedure TTGeodesyPointFunctionality.GetInstanceListByCrdSys(const idCrdSys: integer; out List: TByteArray);
begin
TTGeodesyPointFunctionality__GetInstanceListByCrdSys(Self,   idCrdSys,List);
end;

function TTGeodesyPointFunctionality__CrdSys_GetNearestGeoPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.CrdSys_GetNearestGeoPoints(const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean;
begin
Result:=TTGeodesyPointFunctionality__CrdSys_GetNearestGeoPoints(Self,   idCrdSys,pLatitude,pLongitude,PointsCount,Points);
end;

function TTGeodesyPointFunctionality__CrdSys_GetNearestXYPoints(Functionality: TFunctionality;   const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean; stdcall; external TypesDLL;
function TTGeodesyPointFunctionality.CrdSys_GetNearestXYPoints(const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean;
begin
Result:=TTGeodesyPointFunctionality__CrdSys_GetNearestXYPoints(Self,   idCrdSys,pX,pY,PointsCount,Points);
end;


{TGeodesyPointFunctionality}
procedure TGeodesyPointFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality._ToClone(out idClone: integer);
begin
TGeodesyPointFunctionality___ToClone(Self,   idClone);
end;

function TGeodesyPointFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TGeodesyPointFunctionality__Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TGeodesyPointFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGeodesyPointFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGeodesyPointFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getName: string;
begin
Result:=TGeodesyPointFunctionality__getName(Self);
end;

function TGeodesyPointFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getHint: string;
begin
Result:=TGeodesyPointFunctionality__getHint(Self);
end;

function TGeodesyPointFunctionality__getidCrdSys(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getidCrdSys: integer;
begin
Result:=TGeodesyPointFunctionality__getidCrdSys(Self);
end;

procedure TGeodesyPointFunctionality__setidCrdSys(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.setidCrdSys(Value: integer);
begin
TGeodesyPointFunctionality__setidCrdSys(Self,   Value);
end;

function TGeodesyPointFunctionality__getX(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getX: Double;
begin
Result:=TGeodesyPointFunctionality__getX(Self);
end;

procedure TGeodesyPointFunctionality__setX(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.setX(Value: Double);
begin
TGeodesyPointFunctionality__setX(Self,   Value);
end;

function TGeodesyPointFunctionality__getY(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getY: Double;
begin
Result:=TGeodesyPointFunctionality__getY(Self);
end;

procedure TGeodesyPointFunctionality__setY(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.setY(Value: Double);
begin
TGeodesyPointFunctionality__setY(Self,   Value);
end;

function TGeodesyPointFunctionality__getLatitude(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getLatitude: Double;
begin
Result:=TGeodesyPointFunctionality__getLatitude(Self);
end;

procedure TGeodesyPointFunctionality__setLatitude(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.setLatitude(Value: Double);
begin
TGeodesyPointFunctionality__setLatitude(Self,   Value);
end;

function TGeodesyPointFunctionality__getLongitude(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TGeodesyPointFunctionality.getLongitude: Double;
begin
Result:=TGeodesyPointFunctionality__getLongitude(Self);
end;

procedure TGeodesyPointFunctionality__setLongitude(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.setLongitude(Value: Double);
begin
TGeodesyPointFunctionality__setLongitude(Self,   Value);
end;

procedure TGeodesyPointFunctionality__GetParams(Functionality: TFunctionality;   out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.GetParams(out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double);
begin
TGeodesyPointFunctionality__GetParams(Self,   oidCrdSys,oX,oY,oLatitude,oLongitude);
end;

procedure TGeodesyPointFunctionality__SetParams(Functionality: TFunctionality;   const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.SetParams(const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double);
begin
TGeodesyPointFunctionality__SetParams(Self,   pidCrdSys,pX,pY,pLatitude,pLongitude);
end;

procedure TGeodesyPointFunctionality__ValidateByVisualizationComponent(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TGeodesyPointFunctionality.ValidateByVisualizationComponent;
begin
TGeodesyPointFunctionality__ValidateByVisualizationComponent(Self);
end;


{TTPrivateAreaVisualizationFunctionality}
function TTPrivateAreaVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTPrivateAreaVisualizationFunctionality___CreateInstance(Self);
end;

function TTPrivateAreaVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTPrivateAreaVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTPrivateAreaVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality.getName: string;
begin
Result:=TTPrivateAreaVisualizationFunctionality__getName(Self);
end;

function TTPrivateAreaVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTPrivateAreaVisualizationFunctionality__getImage(Self);
end;

function TTPrivateAreaVisualizationFunctionality__CanCreateAsDetail(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality.CanCreateAsDetail: boolean;
begin
Result:=TTPrivateAreaVisualizationFunctionality__CanCreateAsDetail(Self);
end;

function TTPrivateAreaVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTPrivateAreaVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTPrivateAreaVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TPrivateAreaVisualizationFunctionality}
procedure TPrivateAreaVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPrivateAreaVisualizationFunctionality._ToClone(out idClone: integer);
begin
TPrivateAreaVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TPrivateAreaVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TPrivateAreaVisualizationFunctionality.DestroyData;
begin
TPrivateAreaVisualizationFunctionality__DestroyData(Self);
end;

procedure TPrivateAreaVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TPrivateAreaVisualizationFunctionality.CloneData(out idClone: integer);
begin
TPrivateAreaVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TPrivateAreaVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TPrivateAreaVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TPrivateAreaVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TPrivateAreaVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPrivateAreaVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TPrivateAreaVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TPrivateAreaVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality.getName: string;
begin
Result:=TPrivateAreaVisualizationFunctionality__getName(Self);
end;

function TPrivateAreaVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality.getHint: string;
begin
Result:=TPrivateAreaVisualizationFunctionality__getHint(Self);
end;

function TPrivateAreaVisualizationFunctionality__getAcquireObjectsInside(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TPrivateAreaVisualizationFunctionality.getAcquireObjectsInside: boolean;
begin
Result:=TPrivateAreaVisualizationFunctionality__getAcquireObjectsInside(Self);
end;

procedure TPrivateAreaVisualizationFunctionality__setAcquireObjectsInside(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TPrivateAreaVisualizationFunctionality.setAcquireObjectsInside(Value: boolean);
begin
TPrivateAreaVisualizationFunctionality__setAcquireObjectsInside(Self,   Value);
end;


{TTHyperTextFunctionality}
function TTHyperTextFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHyperTextFunctionality._CreateInstance: integer;
begin
Result:=TTHyperTextFunctionality___CreateInstance(Self);
end;

procedure TTHyperTextFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTHyperTextFunctionality._DestroyInstance(const idObj: integer);
begin
TTHyperTextFunctionality___DestroyInstance(Self,   idObj);
end;

function TTHyperTextFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHyperTextFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHyperTextFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHyperTextFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHyperTextFunctionality.getName: string;
begin
Result:=TTHyperTextFunctionality__getName(Self);
end;

function TTHyperTextFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHyperTextFunctionality.getImage: TTypeImage;
begin
Result:=TTHyperTextFunctionality__getImage(Self);
end;


{THyperTextFunctionality}
procedure THyperTextFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THyperTextFunctionality.UpdateDATA;
begin
THyperTextFunctionality__UpdateDATA(Self);
end;

procedure THyperTextFunctionality__ClearDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure THyperTextFunctionality.ClearDATA;
begin
THyperTextFunctionality__ClearDATA(Self);
end;

procedure THyperTextFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THyperTextFunctionality._ToClone(out idClone: integer);
begin
THyperTextFunctionality___ToClone(Self,   idClone);
end;

function THyperTextFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THyperTextFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=THyperTextFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure THyperTextFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THyperTextFunctionality.LoadFromFile(const FileName: string);
begin
THyperTextFunctionality__LoadFromFile(Self,   FileName);
end;

procedure THyperTextFunctionality__SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure THyperTextFunctionality.SaveToFile(const FileName: string);
begin
THyperTextFunctionality__SaveToFile(Self,   FileName);
end;

function THyperTextFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THyperTextFunctionality.getName: string;
begin
Result:=THyperTextFunctionality__getName(Self);
end;

function THyperTextFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THyperTextFunctionality.getHint: string;
begin
Result:=THyperTextFunctionality__getHint(Self);
end;

procedure THyperTextFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure THyperTextFunctionality.GetDATA(out Value: TClientBlobStream);
begin
THyperTextFunctionality__GetDATA(Self,   Value);
end;

procedure THyperTextFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure THyperTextFunctionality.GetDATA1(out Value: TByteArray);
begin
THyperTextFunctionality__GetDATA1(Self,   Value);
end;

procedure THyperTextFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
procedure THyperTextFunctionality.SetDATA(Value: TMemoryStream);
begin
THyperTextFunctionality__SetDATA(Self,   Value);
end;

procedure THyperTextFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure THyperTextFunctionality.SetDATA1(Value: TByteArray);
begin
THyperTextFunctionality__SetDATA1(Self,   Value);
end;


{TTComponentsFindServiceFunctionality}
function TTComponentsFindServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTComponentsFindServiceFunctionality._CreateInstance: integer;
begin
Result:=TTComponentsFindServiceFunctionality___CreateInstance(Self);
end;

procedure TTComponentsFindServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTComponentsFindServiceFunctionality._DestroyInstance(const idObj: integer);
begin
TTComponentsFindServiceFunctionality___DestroyInstance(Self,   idObj);
end;

function TTComponentsFindServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTComponentsFindServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTComponentsFindServiceFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTComponentsFindServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTComponentsFindServiceFunctionality.getName: string;
begin
Result:=TTComponentsFindServiceFunctionality__getName(Self);
end;

function TTComponentsFindServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTComponentsFindServiceFunctionality.getImage: TTypeImage;
begin
Result:=TTComponentsFindServiceFunctionality__getImage(Self);
end;


{TComponentsFindServiceFunctionality}
procedure TComponentsFindServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TComponentsFindServiceFunctionality._ToClone(out idClone: integer);
begin
TComponentsFindServiceFunctionality___ToClone(Self,   idClone);
end;

function TComponentsFindServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TComponentsFindServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TComponentsFindServiceFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TComponentsFindServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TComponentsFindServiceFunctionality.getName: string;
begin
Result:=TComponentsFindServiceFunctionality__getName(Self);
end;

function TComponentsFindServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TComponentsFindServiceFunctionality.getHint: string;
begin
Result:=TComponentsFindServiceFunctionality__getHint(Self);
end;


{TTUsersServiceFunctionality}
function TTUsersServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTUsersServiceFunctionality._CreateInstance: integer;
begin
Result:=TTUsersServiceFunctionality___CreateInstance(Self);
end;

procedure TTUsersServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTUsersServiceFunctionality._DestroyInstance(const idObj: integer);
begin
TTUsersServiceFunctionality___DestroyInstance(Self,   idObj);
end;

function TTUsersServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTUsersServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTUsersServiceFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTUsersServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTUsersServiceFunctionality.getName: string;
begin
Result:=TTUsersServiceFunctionality__getName(Self);
end;

function TTUsersServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTUsersServiceFunctionality.getImage: TTypeImage;
begin
Result:=TTUsersServiceFunctionality__getImage(Self);
end;


{TUsersServiceFunctionality}
procedure TUsersServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TUsersServiceFunctionality._ToClone(out idClone: integer);
begin
TUsersServiceFunctionality___ToClone(Self,   idClone);
end;

function TUsersServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TUsersServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TUsersServiceFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TUsersServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUsersServiceFunctionality.getName: string;
begin
Result:=TUsersServiceFunctionality__getName(Self);
end;

function TUsersServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TUsersServiceFunctionality.getHint: string;
begin
Result:=TUsersServiceFunctionality__getHint(Self);
end;


{TTTransportServiceFunctionality}
function TTTransportServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTransportServiceFunctionality._CreateInstance: integer;
begin
Result:=TTTransportServiceFunctionality___CreateInstance(Self);
end;

procedure TTTransportServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTransportServiceFunctionality._DestroyInstance(const idObj: integer);
begin
TTTransportServiceFunctionality___DestroyInstance(Self,   idObj);
end;

function TTTransportServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTransportServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTransportServiceFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTransportServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTransportServiceFunctionality.getName: string;
begin
Result:=TTTransportServiceFunctionality__getName(Self);
end;

function TTTransportServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTransportServiceFunctionality.getImage: TTypeImage;
begin
Result:=TTTransportServiceFunctionality__getImage(Self);
end;


{TTransportServiceFunctionality}
procedure TTransportServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTransportServiceFunctionality._ToClone(out idClone: integer);
begin
TTransportServiceFunctionality___ToClone(Self,   idClone);
end;

function TTransportServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTransportServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTransportServiceFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportServiceFunctionality.getName: string;
begin
Result:=TTransportServiceFunctionality__getName(Self);
end;

function TTransportServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportServiceFunctionality.getHint: string;
begin
Result:=TTransportServiceFunctionality__getHint(Self);
end;


{TTMarketServiceFunctionality}
function TTMarketServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMarketServiceFunctionality._CreateInstance: integer;
begin
Result:=TTMarketServiceFunctionality___CreateInstance(Self);
end;

procedure TTMarketServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMarketServiceFunctionality._DestroyInstance(const idObj: integer);
begin
TTMarketServiceFunctionality___DestroyInstance(Self,   idObj);
end;

function TTMarketServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMarketServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMarketServiceFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMarketServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMarketServiceFunctionality.getName: string;
begin
Result:=TTMarketServiceFunctionality__getName(Self);
end;

function TTMarketServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMarketServiceFunctionality.getImage: TTypeImage;
begin
Result:=TTMarketServiceFunctionality__getImage(Self);
end;


{TMarketServiceFunctionality}
procedure TMarketServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMarketServiceFunctionality._ToClone(out idClone: integer);
begin
TMarketServiceFunctionality___ToClone(Self,   idClone);
end;

function TMarketServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMarketServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMarketServiceFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMarketServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMarketServiceFunctionality.getName: string;
begin
Result:=TMarketServiceFunctionality__getName(Self);
end;

function TMarketServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMarketServiceFunctionality.getHint: string;
begin
Result:=TMarketServiceFunctionality__getHint(Self);
end;


{TTTelecomServiceFunctionality}
function TTTelecomServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTelecomServiceFunctionality._CreateInstance: integer;
begin
Result:=TTTelecomServiceFunctionality___CreateInstance(Self);
end;

procedure TTTelecomServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTelecomServiceFunctionality._DestroyInstance(const idObj: integer);
begin
TTTelecomServiceFunctionality___DestroyInstance(Self,   idObj);
end;

function TTTelecomServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTelecomServiceFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTelecomServiceFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTelecomServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTelecomServiceFunctionality.getName: string;
begin
Result:=TTTelecomServiceFunctionality__getName(Self);
end;

function TTTelecomServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTelecomServiceFunctionality.getImage: TTypeImage;
begin
Result:=TTTelecomServiceFunctionality__getImage(Self);
end;


{TTelecomServiceFunctionality}
procedure TTelecomServiceFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTelecomServiceFunctionality._ToClone(out idClone: integer);
begin
TTelecomServiceFunctionality___ToClone(Self,   idClone);
end;

function TTelecomServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTelecomServiceFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTelecomServiceFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTelecomServiceFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTelecomServiceFunctionality.getName: string;
begin
Result:=TTelecomServiceFunctionality__getName(Self);
end;

function TTelecomServiceFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTelecomServiceFunctionality.getHint: string;
begin
Result:=TTelecomServiceFunctionality__getHint(Self);
end;


{TTWNDVisualizationFunctionality}
function TTWNDVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTWNDVisualizationFunctionality___CreateInstance(Self);
end;

function TTWNDVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTWNDVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTWNDVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality.getName: string;
begin
Result:=TTWNDVisualizationFunctionality__getName(Self);
end;

function TTWNDVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTWNDVisualizationFunctionality__getImage(Self);
end;

function TTWNDVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTWNDVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTWNDVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TWNDVisualizationFunctionality}
procedure TWNDVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality._ToClone(out idClone: integer);
begin
TWNDVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TWNDVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.DestroyData;
begin
TWNDVisualizationFunctionality__DestroyData(Self);
end;

procedure TWNDVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.CloneData(out idClone: integer);
begin
TWNDVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TWNDVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TWNDVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

function TWNDVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TWNDVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TWNDVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TWNDVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWNDVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.DATASize: integer;
begin
Result:=TWNDVisualizationFunctionality__DATASize(Self);
end;

function TWNDVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TWNDVisualizationFunctionality__ContainerFilled(Self);
end;

function TWNDVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TWNDVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TWNDVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.getName: string;
begin
Result:=TWNDVisualizationFunctionality__getName(Self);
end;

function TWNDVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.getHint: string;
begin
Result:=TWNDVisualizationFunctionality__getHint(Self);
end;

procedure TWNDVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TWNDVisualizationFunctionality__GetDATA(Self,   DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.GetDATA1(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TWNDVisualizationFunctionality__GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TWNDVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.GetDATA2(out DATAStream: TByteArray; out DATAType: Integer);
begin
TWNDVisualizationFunctionality__GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.GetDATA3(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TWNDVisualizationFunctionality__GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TWNDVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TWNDVisualizationFunctionality__SetDATA(Self,   DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.SetDATA1(DATAStream: TByteArray; const DATAType: integer);
begin
TWNDVisualizationFunctionality__SetDATA1(Self,   DATAStream,DATAType);
end;

function TWNDVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TWNDVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TWNDVisualizationFunctionality__getDATAFileID(Self);
end;

procedure TWNDVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TWNDVisualizationFunctionality__setDATAFileID(Self,   Value);
end;

procedure TWNDVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TWNDVisualizationFunctionality.DATAFile_Clear;
begin
TWNDVisualizationFunctionality__DATAFile_Clear(Self);
end;


{TTMRKVisualizationFunctionality}
function TTMRKVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTMRKVisualizationFunctionality___CreateInstance(Self);
end;

function TTMRKVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMRKVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMRKVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality.getName: string;
begin
Result:=TTMRKVisualizationFunctionality__getName(Self);
end;

function TTMRKVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTMRKVisualizationFunctionality__getImage(Self);
end;

function TTMRKVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTMRKVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTMRKVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TMRKVisualizationFunctionality}
procedure TMRKVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality._ToClone(out idClone: integer);
begin
TMRKVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TMRKVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.DestroyData;
begin
TMRKVisualizationFunctionality__DestroyData(Self);
end;

procedure TMRKVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.CloneData(out idClone: integer);
begin
TMRKVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TMRKVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TMRKVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

procedure TMRKVisualizationFunctionality__DoOnComponentUpdate(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.DoOnComponentUpdate;
begin
TMRKVisualizationFunctionality__DoOnComponentUpdate(Self);
end;

function TMRKVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TMRKVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TMRKVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMRKVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMRKVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.DATASize: integer;
begin
Result:=TMRKVisualizationFunctionality__DATASize(Self);
end;

function TMRKVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TMRKVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TMRKVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.getName: string;
begin
Result:=TMRKVisualizationFunctionality__getName(Self);
end;

function TMRKVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.getHint: string;
begin
Result:=TMRKVisualizationFunctionality__getHint(Self);
end;

procedure TMRKVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TMRKVisualizationFunctionality__GetDATA(Self,   DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.GetDATA1(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TMRKVisualizationFunctionality__GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TMRKVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.GetDATA2(out DATAStream: TByteArray; out DATAType: Integer);
begin
TMRKVisualizationFunctionality__GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.GetDATA3(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TMRKVisualizationFunctionality__GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TMRKVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TMRKVisualizationFunctionality__SetDATA(Self,   DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.SetDATA1(DATAStream: TByteArray; const DATAType: integer);
begin
TMRKVisualizationFunctionality__SetDATA1(Self,   DATAStream,DATAType);
end;

function TMRKVisualizationFunctionality__getBindingPointIndex(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.getBindingPointIndex: integer;
begin
Result:=TMRKVisualizationFunctionality__getBindingPointIndex(Self);
end;

procedure TMRKVisualizationFunctionality__setBindingPointIndex(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.setBindingPointIndex(Value: integer);
begin
TMRKVisualizationFunctionality__setBindingPointIndex(Self,   Value);
end;

function TMRKVisualizationFunctionality__getAlign(Functionality: TFunctionality): TMRKVisualizationAlign; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.getAlign: TMRKVisualizationAlign;
begin
Result:=TMRKVisualizationFunctionality__getAlign(Self);
end;

function TMRKVisualizationFunctionality__getAlign1(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.getAlign1: integer;
begin
Result:=TMRKVisualizationFunctionality__getAlign1(Self);
end;

procedure TMRKVisualizationFunctionality__setAlign(Functionality: TFunctionality;   Value: TMRKVisualizationAlign); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.setAlign(Value: TMRKVisualizationAlign);
begin
TMRKVisualizationFunctionality__setAlign(Self,   Value);
end;

procedure TMRKVisualizationFunctionality__setAlign1(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.setAlign1(Value: integer);
begin
TMRKVisualizationFunctionality__setAlign1(Self,   Value);
end;

function TMRKVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMRKVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TMRKVisualizationFunctionality__getDATAFileID(Self);
end;

procedure TMRKVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TMRKVisualizationFunctionality__setDATAFileID(Self,   Value);
end;

procedure TMRKVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.DATAFile_Clear;
begin
TMRKVisualizationFunctionality__DATAFile_Clear(Self);
end;

procedure TMRKVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oAlign: integer; out oBindingPointIndex: integer); stdcall; external TypesDLL;
procedure TMRKVisualizationFunctionality.GetParams(out oAlign: integer; out oBindingPointIndex: integer);
begin
TMRKVisualizationFunctionality__GetParams(Self,   oAlign,oBindingPointIndex);
end;


{TTOrientedPictureVisualizationFunctionality}
function TTOrientedPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTOrientedPictureVisualizationFunctionality___CreateInstance(Self);
end;

function TTOrientedPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOrientedPictureVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOrientedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality.getName: string;
begin
Result:=TTOrientedPictureVisualizationFunctionality__getName(Self);
end;

function TTOrientedPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTOrientedPictureVisualizationFunctionality__getImage(Self);
end;

function TTOrientedPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOrientedPictureVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTOrientedPictureVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TOrientedPictureVisualizationFunctionality}
procedure TOrientedPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality._ToClone(out idClone: integer);
begin
TOrientedPictureVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TOrientedPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.DestroyData;
begin
TOrientedPictureVisualizationFunctionality__DestroyData(Self);
end;

procedure TOrientedPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.CloneData(out idClone: integer);
begin
TOrientedPictureVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TOrientedPictureVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TOrientedPictureVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

procedure TOrientedPictureVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TOrientedPictureVisualizationFunctionality__DoOnChangeScale(Self,   ChangeCoef);
end;

function TOrientedPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TOrientedPictureVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOrientedPictureVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedPictureVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.DATASize: integer;
begin
Result:=TOrientedPictureVisualizationFunctionality__DATASize(Self);
end;

function TOrientedPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOrientedPictureVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TOrientedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.getName: string;
begin
Result:=TOrientedPictureVisualizationFunctionality__getName(Self);
end;

function TOrientedPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.getHint: string;
begin
Result:=TOrientedPictureVisualizationFunctionality__getHint(Self);
end;

procedure TOrientedPictureVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);
begin
TOrientedPictureVisualizationFunctionality__GetDATA(Self,   DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.GetDATA1(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);
begin
TOrientedPictureVisualizationFunctionality__GetDATA1(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TOrientedPictureVisualizationFunctionality__GetDATA2(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.GetDATA2(out DATAStream: TByteArray; out DATAType: Integer);
begin
TOrientedPictureVisualizationFunctionality__GetDATA2(Self,   DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality__GetDATA3(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.GetDATA3(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
begin
TOrientedPictureVisualizationFunctionality__GetDATA3(Self,   DATAStream,DATAType,MaxSize);
end;

procedure TOrientedPictureVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TOrientedPictureVisualizationFunctionality__SetDATA(Self,   DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.SetDATA1(DATAStream: TByteArray; const DATAType: integer);
begin
TOrientedPictureVisualizationFunctionality__SetDATA1(Self,   DATAStream,DATAType);
end;

function TOrientedPictureVisualizationFunctionality__getWidth(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.getWidth: Double;
begin
Result:=TOrientedPictureVisualizationFunctionality__getWidth(Self);
end;

procedure TOrientedPictureVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.setWidth(Value: Double);
begin
TOrientedPictureVisualizationFunctionality__setWidth(Self,   Value);
end;

function TOrientedPictureVisualizationFunctionality__getHeight(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.getHeight: Double;
begin
Result:=TOrientedPictureVisualizationFunctionality__getHeight(Self);
end;

procedure TOrientedPictureVisualizationFunctionality__setHeight(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.setHeight(Value: Double);
begin
TOrientedPictureVisualizationFunctionality__setHeight(Self,   Value);
end;

function TOrientedPictureVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.getOrientation: integer;
begin
Result:=TOrientedPictureVisualizationFunctionality__getOrientation(Self);
end;

procedure TOrientedPictureVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.setOrientation(Value: integer);
begin
TOrientedPictureVisualizationFunctionality__setOrientation(Self,   Value);
end;

procedure TOrientedPictureVisualizationFunctionality__ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Double); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.ChangeScale(const ScaleFactor: Double);
begin
TOrientedPictureVisualizationFunctionality__ChangeScale(Self,   ScaleFactor);
end;

procedure TOrientedPictureVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.UpdateContainer;
begin
TOrientedPictureVisualizationFunctionality__UpdateContainer(Self);
end;

function TOrientedPictureVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TOrientedPictureVisualizationFunctionality__getDATAFileID(Self);
end;

procedure TOrientedPictureVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TOrientedPictureVisualizationFunctionality__setDATAFileID(Self,   Value);
end;

procedure TOrientedPictureVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.DATAFile_Clear;
begin
TOrientedPictureVisualizationFunctionality__DATAFile_Clear(Self);
end;

function TOrientedPictureVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Double): boolean; stdcall; external TypesDLL;
function TOrientedPictureVisualizationFunctionality.IsNewContainerAcceptable(const NewWidth,NewHeight,NewScale: Double): boolean;
begin
Result:=TOrientedPictureVisualizationFunctionality__IsNewContainerAcceptable(Self,   NewWidth,NewHeight,NewScale);
end;

procedure TOrientedPictureVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oWidth: Double; out oHeight: Double; out oOrientation: integer); stdcall; external TypesDLL;
procedure TOrientedPictureVisualizationFunctionality.GetParams(out oWidth: Double; out oHeight: Double; out oOrientation: integer);
begin
TOrientedPictureVisualizationFunctionality__GetParams(Self,   oWidth,oHeight,oOrientation);
end;


{TTOrientedTTFVisualizationFunctionality}
function TTOrientedTTFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTOrientedTTFVisualizationFunctionality___CreateInstance(Self);
end;

function TTOrientedTTFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOrientedTTFVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOrientedTTFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality.getName: string;
begin
Result:=TTOrientedTTFVisualizationFunctionality__getName(Self);
end;

function TTOrientedTTFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTOrientedTTFVisualizationFunctionality__getImage(Self);
end;

function TTOrientedTTFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTOrientedTTFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTOrientedTTFVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TOrientedTTFVisualizationFunctionality}
procedure TOrientedTTFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality._ToClone(out idClone: integer);
begin
TOrientedTTFVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TOrientedTTFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.DestroyData;
begin
TOrientedTTFVisualizationFunctionality__DestroyData(Self);
end;

procedure TOrientedTTFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.CloneData(out idClone: integer);
begin
TOrientedTTFVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TOrientedTTFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TOrientedTTFVisualizationFunctionality__DoOnChangeScale(Self,   ChangeCoef);
end;

function TOrientedTTFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TOrientedTTFVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TOrientedTTFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOrientedTTFVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedTTFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TOrientedTTFVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TOrientedTTFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getName: string;
begin
Result:=TOrientedTTFVisualizationFunctionality__getName(Self);
end;

function TOrientedTTFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getHint: string;
begin
Result:=TOrientedTTFVisualizationFunctionality__getHint(Self);
end;

function TOrientedTTFVisualizationFunctionality__getStr(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getStr: string;
begin
Result:=TOrientedTTFVisualizationFunctionality__getStr(Self);
end;

procedure TOrientedTTFVisualizationFunctionality__setStr(Functionality: TFunctionality;   const Value: string); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setStr(const Value: string);
begin
TOrientedTTFVisualizationFunctionality__setStr(Self,   Value);
end;

function TOrientedTTFVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getColor: TColor;
begin
Result:=TOrientedTTFVisualizationFunctionality__getColor(Self);
end;

procedure TOrientedTTFVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setColor(Value: TColor);
begin
TOrientedTTFVisualizationFunctionality__setColor(Self,   Value);
end;

function TOrientedTTFVisualizationFunctionality__getFont_Name(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getFont_Name: string;
begin
Result:=TOrientedTTFVisualizationFunctionality__getFont_Name(Self);
end;

procedure TOrientedTTFVisualizationFunctionality__setFont_Name(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setFont_Name(Value: string);
begin
TOrientedTTFVisualizationFunctionality__setFont_Name(Self,   Value);
end;

function TOrientedTTFVisualizationFunctionality__getFont_Width(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getFont_Width: Double;
begin
Result:=TOrientedTTFVisualizationFunctionality__getFont_Width(Self);
end;

procedure TOrientedTTFVisualizationFunctionality__setFont_Width(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setFont_Width(Value: Double);
begin
TOrientedTTFVisualizationFunctionality__setFont_Width(Self,   Value);
end;

function TOrientedTTFVisualizationFunctionality__getFont_Height(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getFont_Height: Double;
begin
Result:=TOrientedTTFVisualizationFunctionality__getFont_Height(Self);
end;

procedure TOrientedTTFVisualizationFunctionality__setFont_Height(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setFont_Height(Value: Double);
begin
TOrientedTTFVisualizationFunctionality__setFont_Height(Self,   Value);
end;

function TOrientedTTFVisualizationFunctionality__getCharInterval(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getCharInterval: Double;
begin
Result:=TOrientedTTFVisualizationFunctionality__getCharInterval(Self);
end;

procedure TOrientedTTFVisualizationFunctionality__setCharInterval(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setCharInterval(Value: Double);
begin
TOrientedTTFVisualizationFunctionality__setCharInterval(Self,   Value);
end;

function TOrientedTTFVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.getOrientation: integer;
begin
Result:=TOrientedTTFVisualizationFunctionality__getOrientation(Self);
end;

procedure TOrientedTTFVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.setOrientation(Value: integer);
begin
TOrientedTTFVisualizationFunctionality__setOrientation(Self,   Value);
end;

procedure TOrientedTTFVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.UpdateContainer;
begin
TOrientedTTFVisualizationFunctionality__UpdateContainer(Self);
end;

function TOrientedTTFVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean; stdcall; external TypesDLL;
function TOrientedTTFVisualizationFunctionality.IsNewContainerAcceptable(const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean;
begin
Result:=TOrientedTTFVisualizationFunctionality__IsNewContainerAcceptable(Self,   NewFontWidth,NewFontHeight,NewCharInterval,flNewStr,NewStr);
end;

procedure TOrientedTTFVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer);
begin
TOrientedTTFVisualizationFunctionality__GetParams(Self,   oStr,oFont_Width,oFont_Height,oFont_Name,oCharInterval,oOrientation);
end;

procedure TOrientedTTFVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer); stdcall; external TypesDLL;
procedure TOrientedTTFVisualizationFunctionality.SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer);
begin
TOrientedTTFVisualizationFunctionality__SetParams(Self,   pStr,pFont_Width,pFont_Height,pFont_Name,pCharInterval,pOrientation);
end;


{TTIconFunctionality}
function TTIconFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTIconFunctionality._CreateInstance: integer;
begin
Result:=TTIconFunctionality___CreateInstance(Self);
end;

procedure TTIconFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTIconFunctionality._DestroyInstance(const idObj: integer);
begin
TTIconFunctionality___DestroyInstance(Self,   idObj);
end;

function TTIconFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTIconFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTIconFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTIconFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTIconFunctionality.getName: string;
begin
Result:=TTIconFunctionality__getName(Self);
end;

function TTIconFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTIconFunctionality.getImage: TTypeImage;
begin
Result:=TTIconFunctionality__getImage(Self);
end;


{TIconFunctionality}
procedure TIconFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TIconFunctionality._ToClone(out idClone: integer);
begin
TIconFunctionality___ToClone(Self,   idClone);
end;

procedure TIconFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TIconFunctionality.LoadFromFile(const FileName: string);
begin
TIconFunctionality__LoadFromFile(Self,   FileName);
end;

function TIconFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TIconFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TIconFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TIconFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TIconFunctionality.getName: string;
begin
Result:=TIconFunctionality__getName(Self);
end;

function TIconFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TIconFunctionality.getHint: string;
begin
Result:=TIconFunctionality__getHint(Self);
end;

procedure TIconFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall; external TypesDLL;
procedure TIconFunctionality.GetDATA(out DATAStream: TClientBlobStream; out DATAType: TImageDATAType);
begin
TIconFunctionality__GetDATA(Self,   DATAStream,DATAType);
end;

procedure TIconFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TIconFunctionality.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer);
begin
TIconFunctionality__GetDATA1(Self,   DATAStream,DATAType);
end;

procedure TIconFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall; external TypesDLL;
procedure TIconFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TImageDATAType);
begin
TIconFunctionality__SetDATA(Self,   DATAStream,DATAType);
end;

procedure TIconFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall; external TypesDLL;
procedure TIconFunctionality.SetDATA1(DATAStream: TByteArray; const DATAType: Integer);
begin
TIconFunctionality__SetDATA1(Self,   DATAStream,DATAType);
end;

procedure TIconFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TIconFunctionality.GetBitmapDATA(out BMPDATAStream: TMemoryStream);
begin
TIconFunctionality__GetBitmapDATA(Self,   BMPDATAStream);
end;

procedure TIconFunctionality__GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall; external TypesDLL;
procedure TIconFunctionality.GetBitmapDATA1(out BMPDATAStream: TByteArray);
begin
TIconFunctionality__GetBitmapDATA1(Self,   BMPDATAStream);
end;


{TTMessageBoardMessageFunctionality}
function TTMessageBoardMessageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMessageBoardMessageFunctionality._CreateInstance: integer;
begin
Result:=TTMessageBoardMessageFunctionality___CreateInstance(Self);
end;

procedure TTMessageBoardMessageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMessageBoardMessageFunctionality._DestroyInstance(const idObj: integer);
begin
TTMessageBoardMessageFunctionality___DestroyInstance(Self,   idObj);
end;

function TTMessageBoardMessageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMessageBoardMessageFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMessageBoardMessageFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMessageBoardMessageFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMessageBoardMessageFunctionality.getName: string;
begin
Result:=TTMessageBoardMessageFunctionality__getName(Self);
end;

function TTMessageBoardMessageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMessageBoardMessageFunctionality.getImage: TTypeImage;
begin
Result:=TTMessageBoardMessageFunctionality__getImage(Self);
end;


{TMessageBoardMessageFunctionality}
procedure TMessageBoardMessageFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality._ToClone(out idClone: integer);
begin
TMessageBoardMessageFunctionality___ToClone(Self,   idClone);
end;

function TMessageBoardMessageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMessageBoardMessageFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMessageBoardMessageFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.getName: string;
begin
Result:=TMessageBoardMessageFunctionality__getName(Self);
end;

function TMessageBoardMessageFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.getHint: string;
begin
Result:=TMessageBoardMessageFunctionality__getHint(Self);
end;

function TMessageBoardMessageFunctionality__getIdMessageBoard(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.getIdMessageBoard: integer;
begin
Result:=TMessageBoardMessageFunctionality__getIdMessageBoard(Self);
end;

procedure TMessageBoardMessageFunctionality__setIdMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.setIdMessageBoard(Value: integer);
begin
TMessageBoardMessageFunctionality__setIdMessageBoard(Self,   Value);
end;

function TMessageBoardMessageFunctionality__getIdSenderMessageBoard(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.getIdSenderMessageBoard: integer;
begin
Result:=TMessageBoardMessageFunctionality__getIdSenderMessageBoard(Self);
end;

procedure TMessageBoardMessageFunctionality__setIdSenderMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.setIdSenderMessageBoard(Value: integer);
begin
TMessageBoardMessageFunctionality__setIdSenderMessageBoard(Self,   Value);
end;

function TMessageBoardMessageFunctionality__DateCreated(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.DateCreated: TDateTime;
begin
Result:=TMessageBoardMessageFunctionality__DateCreated(Self);
end;

function TMessageBoardMessageFunctionality__getSubject(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.getSubject: string;
begin
Result:=TMessageBoardMessageFunctionality__getSubject(Self);
end;

procedure TMessageBoardMessageFunctionality__setSubject(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.setSubject(Value: string);
begin
TMessageBoardMessageFunctionality__setSubject(Self,   Value);
end;

procedure TMessageBoardMessageFunctionality__GetBody(Functionality: TFunctionality;   Value: TStringList); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.GetBody(Value: TStringList);
begin
TMessageBoardMessageFunctionality__GetBody(Self,   Value);
end;

procedure TMessageBoardMessageFunctionality__GetBody1(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.GetBody1(out Value: TByteArray);
begin
TMessageBoardMessageFunctionality__GetBody1(Self,   Value);
end;

procedure TMessageBoardMessageFunctionality__SetBody(Functionality: TFunctionality;   Value: TStringList); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.SetBody(Value: TStringList);
begin
TMessageBoardMessageFunctionality__SetBody(Self,   Value);
end;

procedure TMessageBoardMessageFunctionality__SetBody1(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.SetBody1(Value: TByteArray);
begin
TMessageBoardMessageFunctionality__SetBody1(Self,   Value);
end;

function TMessageBoardMessageFunctionality__getFlRead(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.getFlRead: boolean;
begin
Result:=TMessageBoardMessageFunctionality__getFlRead(Self);
end;

procedure TMessageBoardMessageFunctionality__setFlRead(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TMessageBoardMessageFunctionality.setFlRead(Value: boolean);
begin
TMessageBoardMessageFunctionality__setFlRead(Self,   Value);
end;

function TMessageBoardMessageFunctionality__IsEmpty(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.IsEmpty: boolean;
begin
Result:=TMessageBoardMessageFunctionality__IsEmpty(Self);
end;

function TMessageBoardMessageFunctionality__IsCreatedByUser(Functionality: TFunctionality;   const pidUser: integer): boolean; stdcall; external TypesDLL;
function TMessageBoardMessageFunctionality.IsCreatedByUser(const pidUser: integer): boolean;
begin
Result:=TMessageBoardMessageFunctionality__IsCreatedByUser(Self,   pidUser);
end;


{TTMessageBoardFunctionality}
function TTMessageBoardFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMessageBoardFunctionality._CreateInstance: integer;
begin
Result:=TTMessageBoardFunctionality___CreateInstance(Self);
end;

procedure TTMessageBoardFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMessageBoardFunctionality._DestroyInstance(const idObj: integer);
begin
TTMessageBoardFunctionality___DestroyInstance(Self,   idObj);
end;

function TTMessageBoardFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMessageBoardFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMessageBoardFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMessageBoardFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMessageBoardFunctionality.getName: string;
begin
Result:=TTMessageBoardFunctionality__getName(Self);
end;

function TTMessageBoardFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMessageBoardFunctionality.getImage: TTypeImage;
begin
Result:=TTMessageBoardFunctionality__getImage(Self);
end;


{TMessageBoardFunctionality}
procedure TMessageBoardFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality._ToClone(out idClone: integer);
begin
TMessageBoardFunctionality___ToClone(Self,   idClone);
end;

function TMessageBoardFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TMessageBoardFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TMessageBoardFunctionality__Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TMessageBoardFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMessageBoardFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMessageBoardFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMessageBoardFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardFunctionality.getName: string;
begin
Result:=TMessageBoardFunctionality__getName(Self);
end;

procedure TMessageBoardFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality.setName(Value: string);
begin
TMessageBoardFunctionality__setName(Self,   Value);
end;

function TMessageBoardFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMessageBoardFunctionality.getHint: string;
begin
Result:=TMessageBoardFunctionality__getHint(Self);
end;

function TMessageBoardFunctionality__IsUnreadMessageExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMessageBoardFunctionality.IsUnreadMessageExist: boolean;
begin
Result:=TMessageBoardFunctionality__IsUnreadMessageExist(Self);
end;

procedure TMessageBoardFunctionality__GetMessagesList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality.GetMessagesList(out List: TList);
begin
TMessageBoardFunctionality__GetMessagesList(Self,   List);
end;

procedure TMessageBoardFunctionality__GetMessagesList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality.GetMessagesList1(out List: TByteArray);
begin
TMessageBoardFunctionality__GetMessagesList1(Self,   List);
end;

function TMessageBoardFunctionality__CreateNewMessage(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMessageBoardFunctionality.CreateNewMessage: integer;
begin
Result:=TMessageBoardFunctionality__CreateNewMessage(Self);
end;

procedure TMessageBoardFunctionality__SendMessage(Functionality: TFunctionality;   const idMessage: integer); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality.SendMessage(const idMessage: integer);
begin
TMessageBoardFunctionality__SendMessage(Self,   idMessage);
end;

function TMessageBoardFunctionality__getIdUser(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMessageBoardFunctionality.getIdUser: integer;
begin
Result:=TMessageBoardFunctionality__getIdUser(Self);
end;

procedure TMessageBoardFunctionality__setIdUser(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMessageBoardFunctionality.setIdUser(Value: integer);
begin
TMessageBoardFunctionality__setIdUser(Self,   Value);
end;


{TTQDCVisualizationFunctionality}
function TTQDCVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTQDCVisualizationFunctionality___CreateInstance(Self);
end;

function TTQDCVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTQDCVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTQDCVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality.getName: string;
begin
Result:=TTQDCVisualizationFunctionality__getName(Self);
end;

function TTQDCVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTQDCVisualizationFunctionality__getImage(Self);
end;

function TTQDCVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTQDCVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTQDCVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TQDCVisualizationFunctionality}
procedure TQDCVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality._ToClone(out idClone: integer);
begin
TQDCVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TQDCVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.DestroyData;
begin
TQDCVisualizationFunctionality__DestroyData(Self);
end;

procedure TQDCVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.CloneData(out idClone: integer);
begin
TQDCVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TQDCVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAPtr: pointer): boolean; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.GetDATA(out DATAPtr: pointer): boolean;
begin
Result:=TQDCVisualizationFunctionality__GetDATA(Self,   DATAPtr);
end;

function TQDCVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TQDCVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TQDCVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TQDCVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TQDCVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.DATASize: integer;
begin
Result:=TQDCVisualizationFunctionality__DATASize(Self);
end;

function TQDCVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TQDCVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TQDCVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.getName: string;
begin
Result:=TQDCVisualizationFunctionality__getName(Self);
end;

function TQDCVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.getHint: string;
begin
Result:=TQDCVisualizationFunctionality__getHint(Self);
end;

procedure TQDCVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.SetDATA(DATAStream: TMemoryStream);
begin
TQDCVisualizationFunctionality__SetDATA(Self,   DATAStream);
end;

procedure TQDCVisualizationFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.SetDATA1(DATAStream: TByteArray);
begin
TQDCVisualizationFunctionality__SetDATA1(Self,   DATAStream);
end;

procedure TQDCVisualizationFunctionality__LoadFromBitmap(Functionality: TFunctionality;   Bitmap: TBitmap); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.LoadFromBitmap(Bitmap: TBitmap);
begin
TQDCVisualizationFunctionality__LoadFromBitmap(Self,   Bitmap);
end;

procedure TQDCVisualizationFunctionality__LoadFromBitmap1(Functionality: TFunctionality;   Bitmap: TByteArray); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.LoadFromBitmap1(Bitmap: TByteArray);
begin
TQDCVisualizationFunctionality__LoadFromBitmap1(Self,   Bitmap);
end;

function TQDCVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TQDCVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TQDCVisualizationFunctionality__getDATAFileID(Self);
end;

procedure TQDCVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TQDCVisualizationFunctionality__setDATAFileID(Self,   Value);
end;

procedure TQDCVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TQDCVisualizationFunctionality.DATAFile_Clear;
begin
TQDCVisualizationFunctionality__DATAFile_Clear(Self);
end;


{TTOffersServerFunctionality}
function TTOffersServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOffersServerFunctionality._CreateInstance: integer;
begin
Result:=TTOffersServerFunctionality___CreateInstance(Self);
end;

procedure TTOffersServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTOffersServerFunctionality._DestroyInstance(const idObj: integer);
begin
TTOffersServerFunctionality___DestroyInstance(Self,   idObj);
end;

function TTOffersServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOffersServerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOffersServerFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOffersServerFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOffersServerFunctionality.getName: string;
begin
Result:=TTOffersServerFunctionality__getName(Self);
end;

function TTOffersServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOffersServerFunctionality.getImage: TTypeImage;
begin
Result:=TTOffersServerFunctionality__getImage(Self);
end;


{TOffersServerFunctionality}
procedure TOffersServerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOffersServerFunctionality._ToClone(out idClone: integer);
begin
TOffersServerFunctionality___ToClone(Self,   idClone);
end;

function TOffersServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOffersServerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOffersServerFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOffersServerFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOffersServerFunctionality.getName: string;
begin
Result:=TOffersServerFunctionality__getName(Self);
end;

function TOffersServerFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOffersServerFunctionality.getHint: string;
begin
Result:=TOffersServerFunctionality__getHint(Self);
end;

function TOffersServerFunctionality__getMailROBOT_Inbox(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOffersServerFunctionality.getMailROBOT_Inbox: string;
begin
Result:=TOffersServerFunctionality__getMailROBOT_Inbox(Self);
end;

procedure TOffersServerFunctionality__setMailROBOT_Inbox(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOffersServerFunctionality.setMailROBOT_Inbox(Value: string);
begin
TOffersServerFunctionality__setMailROBOT_Inbox(Self,   Value);
end;

function TOffersServerFunctionality__getMailROBOT_User(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOffersServerFunctionality.getMailROBOT_User: string;
begin
Result:=TOffersServerFunctionality__getMailROBOT_User(Self);
end;

procedure TOffersServerFunctionality__setMailROBOT_User(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOffersServerFunctionality.setMailROBOT_User(Value: string);
begin
TOffersServerFunctionality__setMailROBOT_User(Self,   Value);
end;

function TOffersServerFunctionality__getMailROBOT_Password(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOffersServerFunctionality.getMailROBOT_Password: string;
begin
Result:=TOffersServerFunctionality__getMailROBOT_Password(Self);
end;

procedure TOffersServerFunctionality__setMailROBOT_Password(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOffersServerFunctionality.setMailROBOT_Password(Value: string);
begin
TOffersServerFunctionality__setMailROBOT_Password(Self,   Value);
end;


{TTSecurityComponentOperationFunctionality}
function TTSecurityComponentOperationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSecurityComponentOperationFunctionality._CreateInstance: integer;
begin
Result:=TTSecurityComponentOperationFunctionality___CreateInstance(Self);
end;

procedure TTSecurityComponentOperationFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTSecurityComponentOperationFunctionality._DestroyInstance(const idObj: integer);
begin
TTSecurityComponentOperationFunctionality___DestroyInstance(Self,   idObj);
end;

function TTSecurityComponentOperationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSecurityComponentOperationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTSecurityComponentOperationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTSecurityComponentOperationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSecurityComponentOperationFunctionality.getName: string;
begin
Result:=TTSecurityComponentOperationFunctionality__getName(Self);
end;

function TTSecurityComponentOperationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSecurityComponentOperationFunctionality.getImage: TTypeImage;
begin
Result:=TTSecurityComponentOperationFunctionality__getImage(Self);
end;

procedure TTSecurityComponentOperationFunctionality__GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall; external TypesDLL;
procedure TTSecurityComponentOperationFunctionality.GetInstanceListByContext(const Context: WideString; out List: TList);
begin
TTSecurityComponentOperationFunctionality__GetInstanceListByContext(Self,   Context,List);
end;

procedure TTSecurityComponentOperationFunctionality__GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall; external TypesDLL;
procedure TTSecurityComponentOperationFunctionality.GetInstanceListByContext1(const Context: WideString; out List: TByteArray);
begin
TTSecurityComponentOperationFunctionality__GetInstanceListByContext1(Self,   Context,List);
end;


{TSecurityComponentOperationFunctionality}
procedure TSecurityComponentOperationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSecurityComponentOperationFunctionality._ToClone(out idClone: integer);
begin
TSecurityComponentOperationFunctionality___ToClone(Self,   idClone);
end;

function TSecurityComponentOperationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSecurityComponentOperationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityComponentOperationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality.getName: string;
begin
Result:=TSecurityComponentOperationFunctionality__getName(Self);
end;

procedure TSecurityComponentOperationFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityComponentOperationFunctionality.setName(Value: string);
begin
TSecurityComponentOperationFunctionality__setName(Self,   Value);
end;

function TSecurityComponentOperationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality.getHint: string;
begin
Result:=TSecurityComponentOperationFunctionality__getHint(Self);
end;

function TSecurityComponentOperationFunctionality__getSQLInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentOperationFunctionality.getSQLInfo: string;
begin
Result:=TSecurityComponentOperationFunctionality__getSQLInfo(Self);
end;

procedure TSecurityComponentOperationFunctionality__setSQLInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityComponentOperationFunctionality.setSQLInfo(Value: string);
begin
TSecurityComponentOperationFunctionality__setSQLInfo(Self,   Value);
end;


{TTSecurityKeyFunctionality}
function TTSecurityKeyFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality._CreateInstance: integer;
begin
Result:=TTSecurityKeyFunctionality___CreateInstance(Self);
end;

procedure TTSecurityKeyFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTSecurityKeyFunctionality._DestroyInstance(const idObj: integer);
begin
TTSecurityKeyFunctionality___DestroyInstance(Self,   idObj);
end;

function TTSecurityKeyFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTSecurityKeyFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTSecurityKeyFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality.getName: string;
begin
Result:=TTSecurityKeyFunctionality__getName(Self);
end;

function TTSecurityKeyFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality.getImage: TTypeImage;
begin
Result:=TTSecurityKeyFunctionality__getImage(Self);
end;

function TTSecurityKeyFunctionality__GetInstanceByCode(Functionality: TFunctionality;   const Code: string;  out idInstance: integer): boolean; stdcall; external TypesDLL;
function TTSecurityKeyFunctionality.GetInstanceByCode(const Code: string;  out idInstance: integer): boolean;
begin
Result:=TTSecurityKeyFunctionality__GetInstanceByCode(Self,   Code,idInstance);
end;

procedure TTSecurityKeyFunctionality__GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall; external TypesDLL;
procedure TTSecurityKeyFunctionality.GetInstanceListByContext(const Context: WideString; out List: TList);
begin
TTSecurityKeyFunctionality__GetInstanceListByContext(Self,   Context,List);
end;

procedure TTSecurityKeyFunctionality__GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall; external TypesDLL;
procedure TTSecurityKeyFunctionality.GetInstanceListByContext1(const Context: WideString; out List: TByteArray);
begin
TTSecurityKeyFunctionality__GetInstanceListByContext1(Self,   Context,List);
end;


{TSecurityKeyFunctionality}
procedure TSecurityKeyFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality._ToClone(out idClone: integer);
begin
TSecurityKeyFunctionality___ToClone(Self,   idClone);
end;

function TSecurityKeyFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSecurityKeyFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSecurityKeyFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityKeyFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityKeyFunctionality.getName: string;
begin
Result:=TSecurityKeyFunctionality__getName(Self);
end;

procedure TSecurityKeyFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality.setName(Value: string);
begin
TSecurityKeyFunctionality__setName(Self,   Value);
end;

function TSecurityKeyFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityKeyFunctionality.getHint: string;
begin
Result:=TSecurityKeyFunctionality__getHint(Self);
end;

function TSecurityKeyFunctionality__getInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityKeyFunctionality.getInfo: string;
begin
Result:=TSecurityKeyFunctionality__getInfo(Self);
end;

procedure TSecurityKeyFunctionality__setInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality.setInfo(Value: string);
begin
TSecurityKeyFunctionality__setInfo(Self,   Value);
end;

procedure TSecurityKeyFunctionality__GetAssotiatedUsers(Functionality: TFunctionality;   out Users: TList); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality.GetAssotiatedUsers(out Users: TList);
begin
TSecurityKeyFunctionality__GetAssotiatedUsers(Self,   Users);
end;

procedure TSecurityKeyFunctionality__GetAssotiatedUsers1(Functionality: TFunctionality;   out Users: TByteArray); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality.GetAssotiatedUsers1(out Users: TByteArray);
begin
TSecurityKeyFunctionality__GetAssotiatedUsers1(Self,   Users);
end;

procedure TSecurityKeyFunctionality__GenerateCode(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TSecurityKeyFunctionality.GenerateCode;
begin
TSecurityKeyFunctionality__GenerateCode(Self);
end;

function TSecurityKeyFunctionality__Code(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityKeyFunctionality.Code: string;
begin
Result:=TSecurityKeyFunctionality__Code(Self);
end;


{TTSecurityFileFunctionality}
function TTSecurityFileFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSecurityFileFunctionality._CreateInstance: integer;
begin
Result:=TTSecurityFileFunctionality___CreateInstance(Self);
end;

procedure TTSecurityFileFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTSecurityFileFunctionality._DestroyInstance(const idObj: integer);
begin
TTSecurityFileFunctionality___DestroyInstance(Self,   idObj);
end;

function TTSecurityFileFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSecurityFileFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTSecurityFileFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTSecurityFileFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSecurityFileFunctionality.getName: string;
begin
Result:=TTSecurityFileFunctionality__getName(Self);
end;

function TTSecurityFileFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSecurityFileFunctionality.getImage: TTypeImage;
begin
Result:=TTSecurityFileFunctionality__getImage(Self);
end;

procedure TTSecurityFileFunctionality__GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall; external TypesDLL;
procedure TTSecurityFileFunctionality.GetInstanceListByContext(const Context: WideString; out List: TList);
begin
TTSecurityFileFunctionality__GetInstanceListByContext(Self,   Context,List);
end;

procedure TTSecurityFileFunctionality__GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString;out List: TByteArray); stdcall; external TypesDLL;
procedure TTSecurityFileFunctionality.GetInstanceListByContext1(const Context: WideString;out List: TByteArray);
begin
TTSecurityFileFunctionality__GetInstanceListByContext1(Self,   Context,List);
end;


{TSecurityFileFunctionality}
procedure TSecurityFileFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality._ToClone(out idClone: integer);
begin
TSecurityFileFunctionality___ToClone(Self,   idClone);
end;

function TSecurityFileFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSecurityFileFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSecurityFileFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityFileFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityFileFunctionality.getName: string;
begin
Result:=TSecurityFileFunctionality__getName(Self);
end;

procedure TSecurityFileFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality.setName(Value: string);
begin
TSecurityFileFunctionality__setName(Self,   Value);
end;

function TSecurityFileFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityFileFunctionality.getHint: string;
begin
Result:=TSecurityFileFunctionality__getHint(Self);
end;

function TSecurityFileFunctionality__getInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityFileFunctionality.getInfo: string;
begin
Result:=TSecurityFileFunctionality__getInfo(Self);
end;

procedure TSecurityFileFunctionality__setInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality.setInfo(Value: string);
begin
TSecurityFileFunctionality__setInfo(Self,   Value);
end;

function TSecurityFileFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream): boolean; stdcall; external TypesDLL;
function TSecurityFileFunctionality.GetDATA(out Value: TClientBlobStream): boolean;
begin
Result:=TSecurityFileFunctionality__GetDATA(Self,   Value);
end;

function TSecurityFileFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TByteArray): boolean; stdcall; external TypesDLL;
function TSecurityFileFunctionality.GetDATA1(out Value: TByteArray): boolean;
begin
Result:=TSecurityFileFunctionality__GetDATA1(Self,   Value);
end;

procedure TSecurityFileFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality.SetDATA(Value: TMemoryStream);
begin
TSecurityFileFunctionality__SetDATA(Self,   Value);
end;

procedure TSecurityFileFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality.SetDATA1(Value: TByteArray);
begin
TSecurityFileFunctionality__SetDATA1(Self,   Value);
end;

function TSecurityFileFunctionality__AddOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall; external TypesDLL;
function TSecurityFileFunctionality.AddOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
begin
Result:=TSecurityFileFunctionality__AddOperationSecurityKey(Self,   OperationID,SecurityKeyID);
end;

function TSecurityFileFunctionality__RemoveOperationSecurityKey(Functionality: TFunctionality;   const OperationID: integer; const SecurityKeyID: integer): boolean; stdcall; external TypesDLL;
function TSecurityFileFunctionality.RemoveOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
begin
Result:=TSecurityFileFunctionality__RemoveOperationSecurityKey(Self,   OperationID,SecurityKeyID);
end;

procedure TSecurityFileFunctionality__GetAssotiatedSecurityComponents(Functionality: TFunctionality;   out SecurityComponents: TList); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality.GetAssotiatedSecurityComponents(out SecurityComponents: TList);
begin
TSecurityFileFunctionality__GetAssotiatedSecurityComponents(Self,   SecurityComponents);
end;

procedure TSecurityFileFunctionality__GetAssotiatedSecurityComponents1(Functionality: TFunctionality;   out SecurityComponents: TByteArray); stdcall; external TypesDLL;
procedure TSecurityFileFunctionality.GetAssotiatedSecurityComponents1(out SecurityComponents: TByteArray);
begin
TSecurityFileFunctionality__GetAssotiatedSecurityComponents1(Self,   SecurityComponents);
end;


{TTSecurityComponentFunctionality}
function TTSecurityComponentFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSecurityComponentFunctionality._CreateInstance: integer;
begin
Result:=TTSecurityComponentFunctionality___CreateInstance(Self);
end;

procedure TTSecurityComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTSecurityComponentFunctionality._DestroyInstance(const idObj: integer);
begin
TTSecurityComponentFunctionality___DestroyInstance(Self,   idObj);
end;

function TTSecurityComponentFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSecurityComponentFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTSecurityComponentFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTSecurityComponentFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSecurityComponentFunctionality.getName: string;
begin
Result:=TTSecurityComponentFunctionality__getName(Self);
end;

function TTSecurityComponentFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSecurityComponentFunctionality.getImage: TTypeImage;
begin
Result:=TTSecurityComponentFunctionality__getImage(Self);
end;

procedure TTSecurityComponentFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTSecurityComponentFunctionality.DestroyInstance(const idObj: integer);
begin
TTSecurityComponentFunctionality__DestroyInstance(Self,   idObj);
end;


{TSecurityComponentFunctionality}
procedure TSecurityComponentFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSecurityComponentFunctionality._ToClone(out idClone: integer);
begin
TSecurityComponentFunctionality___ToClone(Self,   idClone);
end;

function TSecurityComponentFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSecurityComponentFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSecurityComponentFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

procedure TSecurityComponentFunctionality__ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSecurityComponentFunctionality.ToClone(out idClone: integer);
begin
TSecurityComponentFunctionality__ToClone(Self,   idClone);
end;

function TSecurityComponentFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TSecurityComponentFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TSecurityComponentFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TSecurityComponentFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentFunctionality.getName: string;
begin
Result:=TSecurityComponentFunctionality__getName(Self);
end;

function TSecurityComponentFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSecurityComponentFunctionality.getHint: string;
begin
Result:=TSecurityComponentFunctionality__getHint(Self);
end;

function TSecurityComponentFunctionality__getIdSecurityFile(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TSecurityComponentFunctionality.getIdSecurityFile: integer;
begin
Result:=TSecurityComponentFunctionality__getIdSecurityFile(Self);
end;

procedure TSecurityComponentFunctionality__setIdSecurityFile(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TSecurityComponentFunctionality.setIdSecurityFile(Value: integer);
begin
TSecurityComponentFunctionality__setIdSecurityFile(Self,   Value);
end;


{TTMODELUserFunctionality}
function TTMODELUserFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMODELUserFunctionality._CreateInstance: integer;
begin
Result:=TTMODELUserFunctionality___CreateInstance(Self);
end;

procedure TTMODELUserFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality._DestroyInstance(const idObj: integer);
begin
TTMODELUserFunctionality___DestroyInstance(Self,   idObj);
end;

function TTMODELUserFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMODELUserFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMODELUserFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMODELUserFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMODELUserFunctionality.getName: string;
begin
Result:=TTMODELUserFunctionality__getName(Self);
end;

function TTMODELUserFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMODELUserFunctionality.getImage: TTypeImage;
begin
Result:=TTMODELUserFunctionality__getImage(Self);
end;

function TTMODELUserFunctionality__IsUserExist(Functionality: TFunctionality;   const UserName: string; out idUser: integer): boolean; stdcall; external TypesDLL;
function TTMODELUserFunctionality.IsUserExist(const UserName: string; out idUser: integer): boolean;
begin
Result:=TTMODELUserFunctionality__IsUserExist(Self,   UserName,idUser);
end;

procedure TTMODELUserFunctionality__GetInstanceListByContext(Functionality: TFunctionality;   const Context: WideString; out List: TList); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality.GetInstanceListByContext(const Context: WideString; out List: TList);
begin
TTMODELUserFunctionality__GetInstanceListByContext(Self,   Context,List);
end;

procedure TTMODELUserFunctionality__GetInstanceListByContext1(Functionality: TFunctionality;   const Context: WideString; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality.GetInstanceListByContext1(const Context: WideString; out List: TByteArray);
begin
TTMODELUserFunctionality__GetInstanceListByContext1(Self,   Context,List);
end;

procedure TTMODELUserFunctionality__GetOnlineUsersForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality.GetOnlineUsersForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TList);
begin
TTMODELUserFunctionality__GetOnlineUsersForDomains(Self,   pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality__GetOnlineUsersForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality.GetOnlineUsersForDomains1(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
begin
TTMODELUserFunctionality__GetOnlineUsersForDomains1(Self,   pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality__GetOnlineExpertsForDomains(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TList); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality.GetOnlineExpertsForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TList);
begin
TTMODELUserFunctionality__GetOnlineExpertsForDomains(Self,   pOnlineMaxDelay,pDomains,List);
end;

procedure TTMODELUserFunctionality__GetOnlineExpertsForDomains1(Functionality: TFunctionality;   const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTMODELUserFunctionality.GetOnlineExpertsForDomains1(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
begin
TTMODELUserFunctionality__GetOnlineExpertsForDomains1(Self,   pOnlineMaxDelay,pDomains,List);
end;


{TMODELUserFunctionality}
procedure TMODELUserFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality._ToClone(out idClone: integer);
begin
TMODELUserFunctionality___ToClone(Self,   idClone);
end;

function TMODELUserFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMODELUserFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMODELUserFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMODELUserFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality.getHint: string;
begin
Result:=TMODELUserFunctionality__getHint(Self);
end;

function TMODELUserFunctionality__GetActiveStateInfo(Functionality: TFunctionality;   out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.GetActiveStateInfo(out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean;
begin
Result:=TMODELUserFunctionality__GetActiveStateInfo(Self,   ProxySpaceID,ProxySpaceIP,ProxySpaceState);
end;

function TMODELUserFunctionality__IsUserOnLine(Functionality: TFunctionality;   const MaxDelay: Double): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.IsUserOnLine(const MaxDelay: Double): boolean;
begin
Result:=TMODELUserFunctionality__IsUserOnLine(Self,   MaxDelay);
end;

procedure TMODELUserFunctionality__Logout(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Logout;
begin
TMODELUserFunctionality__Logout(Self);
end;

procedure TMODELUserFunctionality__GetSecurityKeysList(Functionality: TFunctionality;   out SecurityKeys: TList); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetSecurityKeysList(out SecurityKeys: TList);
begin
TMODELUserFunctionality__GetSecurityKeysList(Self,   SecurityKeys);
end;

procedure TMODELUserFunctionality__GetSecurityKeysList1(Functionality: TFunctionality;   out SecurityKeys: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetSecurityKeysList1(out SecurityKeys: TByteArray);
begin
TMODELUserFunctionality__GetSecurityKeysList1(Self,   SecurityKeys);
end;

function TMODELUserFunctionality__SecurityKeys_IsKeyExist(Functionality: TFunctionality;   const idSecurityKey: integer): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.SecurityKeys_IsKeyExist(const idSecurityKey: integer): boolean;
begin
Result:=TMODELUserFunctionality__SecurityKeys_IsKeyExist(Self,   idSecurityKey);
end;

procedure TMODELUserFunctionality__SecurityKeys_Insert(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SecurityKeys_Insert(const idSecurityKey: integer);
begin
TMODELUserFunctionality__SecurityKeys_Insert(Self,   idSecurityKey);
end;

procedure TMODELUserFunctionality__SecurityKeys_Delete(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SecurityKeys_Delete(const idSecurityKey: integer);
begin
TMODELUserFunctionality__SecurityKeys_Delete(Self,   idSecurityKey);
end;

procedure TMODELUserFunctionality__SecurityKeys_AddKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SecurityKeys_AddKeyByCode(const Code: WideString);
begin
TMODELUserFunctionality__SecurityKeys_AddKeyByCode(Self,   Code);
end;

procedure TMODELUserFunctionality__SecurityKeys_RemoveKeyByCode(Functionality: TFunctionality;   const Code: WideString); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SecurityKeys_RemoveKeyByCode(const Code: WideString);
begin
TMODELUserFunctionality__SecurityKeys_RemoveKeyByCode(Self,   Code);
end;

function TMODELUserFunctionality__SecurityKeys_CreateAndAddNewKey(Functionality: TFunctionality;   const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.SecurityKeys_CreateAndAddNewKey(const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer;
begin
Result:=TMODELUserFunctionality__SecurityKeys_CreateAndAddNewKey(Self,   pName,pInfo,KeyCode);
end;

procedure TMODELUserFunctionality__GetMessageBoards(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetMessageBoards(out List: TList);
begin
TMODELUserFunctionality__GetMessageBoards(Self,   List);
end;

procedure TMODELUserFunctionality__GetMessageBoards1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetMessageBoards1(out List: TByteArray);
begin
TMODELUserFunctionality__GetMessageBoards1(Self,   List);
end;

function TMODELUserFunctionality__HaveUnreadMessages(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.HaveUnreadMessages: boolean;
begin
Result:=TMODELUserFunctionality__HaveUnreadMessages(Self);
end;

procedure TMODELUserFunctionality__GetMessages(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TList); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetMessages(const flUnreadOnly: boolean; out MessageList: TList);
begin
TMODELUserFunctionality__GetMessages(Self,   flUnreadOnly,MessageList);
end;

procedure TMODELUserFunctionality__GetMessages1(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetMessages1(const flUnreadOnly: boolean; out MessageList: TByteArray);
begin
TMODELUserFunctionality__GetMessages1(Self,   flUnreadOnly,MessageList);
end;

procedure TMODELUserFunctionality__IncomingMessages_SendNew(Functionality: TFunctionality;   const Message: TMemoryStream; const SenderID: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_SendNew(const Message: TMemoryStream; const SenderID: integer);
begin
TMODELUserFunctionality__IncomingMessages_SendNew(Self,   Message,SenderID);
end;

procedure TMODELUserFunctionality__IncomingMessages_SendNew1(Functionality: TFunctionality;   const Message: TByteArray; const SenderID: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_SendNew1(const Message: TByteArray; const SenderID: integer);
begin
TMODELUserFunctionality__IncomingMessages_SendNew1(Self,   Message,SenderID);
end;

function TMODELUserFunctionality__IncomingMessages_GetUnread(Functionality: TFunctionality;   out MessageList: TList): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.IncomingMessages_GetUnread(out MessageList: TList): boolean;
begin
Result:=TMODELUserFunctionality__IncomingMessages_GetUnread(Self,   MessageList);
end;

function TMODELUserFunctionality__IncomingMessages_GetUnread1(Functionality: TFunctionality;   out MessageList: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.IncomingMessages_GetUnread1(out MessageList: TByteArray): boolean;
begin
Result:=TMODELUserFunctionality__IncomingMessages_GetUnread1(Self,   MessageList);
end;

procedure TMODELUserFunctionality__IncomingMessages_GetMessagesSince(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TList); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_GetMessagesSince(const TimeStamp: TDateTime; out MessageList: TList);
begin
TMODELUserFunctionality__IncomingMessages_GetMessagesSince(Self,   TimeStamp,MessageList);
end;

procedure TMODELUserFunctionality__IncomingMessages_GetMessagesSince1(Functionality: TFunctionality;   const TimeStamp: TDateTime; out MessageList: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_GetMessagesSince1(const TimeStamp: TDateTime; out MessageList: TByteArray);
begin
TMODELUserFunctionality__IncomingMessages_GetMessagesSince1(Self,   TimeStamp,MessageList);
end;

procedure TMODELUserFunctionality__IncomingMessages_GetMessage(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: TDateTime; out Message: TClientBlobStream; out SenderID: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_GetMessage(const MessageID: integer; out TimeStamp: TDateTime; out Message: TClientBlobStream; out SenderID: integer);
begin
TMODELUserFunctionality__IncomingMessages_GetMessage(Self,   MessageID,TimeStamp,Message,SenderID);
end;

procedure TMODELUserFunctionality__IncomingMessages_GetMessage1(Functionality: TFunctionality;   const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_GetMessage1(const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer);
begin
TMODELUserFunctionality__IncomingMessages_GetMessage1(Self,   MessageID,TimeStamp,Message,SenderID);
end;

procedure TMODELUserFunctionality__IncomingMessages_DeleteTo(Functionality: TFunctionality;   const TimeStamp: TDateTime); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.IncomingMessages_DeleteTo(const TimeStamp: TDateTime);
begin
TMODELUserFunctionality__IncomingMessages_DeleteTo(Self,   TimeStamp);
end;

function TMODELUserFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality.getName: string;
begin
Result:=TMODELUserFunctionality__getName(Self);
end;

procedure TMODELUserFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setName(Value: string);
begin
TMODELUserFunctionality__setName(Self,   Value);
end;

function TMODELUserFunctionality__getFullName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality.getFullName: string;
begin
Result:=TMODELUserFunctionality__getFullName(Self);
end;

procedure TMODELUserFunctionality__setFullName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setFullName(Value: string);
begin
TMODELUserFunctionality__setFullName(Self,   Value);
end;

function TMODELUserFunctionality__getContactInfo(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality.getContactInfo: string;
begin
Result:=TMODELUserFunctionality__getContactInfo(Self);
end;

procedure TMODELUserFunctionality__setContactInfo(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setContactInfo(Value: string);
begin
TMODELUserFunctionality__setContactInfo(Self,   Value);
end;

function TMODELUserFunctionality__getPassword(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality.getPassword: string;
begin
Result:=TMODELUserFunctionality__getPassword(Self);
end;

procedure TMODELUserFunctionality__setPassword(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setPassword(Value: string);
begin
TMODELUserFunctionality__setPassword(Self,   Value);
end;

function TMODELUserFunctionality__getIdSecurityFileForClone(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getIdSecurityFileForClone: integer;
begin
Result:=TMODELUserFunctionality__getIdSecurityFileForClone(Self);
end;

procedure TMODELUserFunctionality__setIdSecurityFileForClone(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setIdSecurityFileForClone(Value: integer);
begin
TMODELUserFunctionality__setIdSecurityFileForClone(Self,   Value);
end;

function TMODELUserFunctionality__getidSecurityFileForPrivate(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getidSecurityFileForPrivate: integer;
begin
Result:=TMODELUserFunctionality__getidSecurityFileForPrivate(Self);
end;

procedure TMODELUserFunctionality__setidSecurityFileForPrivate(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setidSecurityFileForPrivate(Value: integer);
begin
TMODELUserFunctionality__setidSecurityFileForPrivate(Self,   Value);
end;

function TMODELUserFunctionality__getDATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getDATASize: integer;
begin
Result:=TMODELUserFunctionality__getDATASize(Self);
end;

procedure TMODELUserFunctionality__setDATASize(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setDATASize(Value: integer);
begin
TMODELUserFunctionality__setDATASize(Self,   Value);
end;

function TMODELUserFunctionality__getMaxDATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getMaxDATASize: integer;
begin
Result:=TMODELUserFunctionality__getMaxDATASize(Self);
end;

procedure TMODELUserFunctionality__setMaxDATASize(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setMaxDATASize(Value: integer);
begin
TMODELUserFunctionality__setMaxDATASize(Self,   Value);
end;

function TMODELUserFunctionality__getSpaceSquare(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TMODELUserFunctionality.getSpaceSquare: Double;
begin
Result:=TMODELUserFunctionality__getSpaceSquare(Self);
end;

procedure TMODELUserFunctionality__setSpaceSquare(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setSpaceSquare(Value: Double);
begin
TMODELUserFunctionality__setSpaceSquare(Self,   Value);
end;

function TMODELUserFunctionality__getMaxSpaceSquare(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getMaxSpaceSquare: integer;
begin
Result:=TMODELUserFunctionality__getMaxSpaceSquare(Self);
end;

procedure TMODELUserFunctionality__setMaxSpaceSquare(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setMaxSpaceSquare(Value: integer);
begin
TMODELUserFunctionality__setMaxSpaceSquare(Self,   Value);
end;

function TMODELUserFunctionality__getMaxSpaceSquarePerObject(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.getMaxSpaceSquarePerObject: integer;
begin
Result:=TMODELUserFunctionality__getMaxSpaceSquarePerObject(Self);
end;

procedure TMODELUserFunctionality__setMaxSpaceSquarePerObject(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setMaxSpaceSquarePerObject(Value: integer);
begin
TMODELUserFunctionality__setMaxSpaceSquarePerObject(Self,   Value);
end;

function TMODELUserFunctionality__getDisabled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.getDisabled: boolean;
begin
Result:=TMODELUserFunctionality__getDisabled(Self);
end;

procedure TMODELUserFunctionality__setDisabled(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setDisabled(Value: boolean);
begin
TMODELUserFunctionality__setDisabled(Self,   Value);
end;

procedure TMODELUserFunctionality__GetStartObj(Functionality: TFunctionality;   out idTStartObj,idStartObj: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.GetStartObj(out idTStartObj,idStartObj: integer);
begin
TMODELUserFunctionality__GetStartObj(Self,   idTStartObj,idStartObj);
end;

procedure TMODELUserFunctionality__SetStartObj(Functionality: TFunctionality;   const idTStartObj,idStartObj: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SetStartObj(const idTStartObj,idStartObj: integer);
begin
TMODELUserFunctionality__SetStartObj(Self,   idTStartObj,idStartObj);
end;

function TMODELUserFunctionality__getDomains(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMODELUserFunctionality.getDomains: string;
begin
Result:=TMODELUserFunctionality__getDomains(Self);
end;

procedure TMODELUserFunctionality__setDomains(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setDomains(Value: string);
begin
TMODELUserFunctionality__setDomains(Self,   Value);
end;

function TMODELUserFunctionality__getTaskEnabled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.getTaskEnabled: boolean;
begin
Result:=TMODELUserFunctionality__getTaskEnabled(Self);
end;

procedure TMODELUserFunctionality__setTaskEnabled(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.setTaskEnabled(Value: boolean);
begin
TMODELUserFunctionality__setTaskEnabled(Self,   Value);
end;

procedure TMODELUserFunctionality__CheckDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.CheckDATASize(const pAddDATASize: integer);
begin
TMODELUserFunctionality__CheckDATASize(Self,   pAddDATASize);
end;

procedure TMODELUserFunctionality__AddDATASize(Functionality: TFunctionality;   const pAddDATASize: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.AddDATASize(const pAddDATASize: integer);
begin
TMODELUserFunctionality__AddDATASize(Self,   pAddDATASize);
end;

procedure TMODELUserFunctionality__SubDATASize(Functionality: TFunctionality;   const pSubDATASize: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SubDATASize(const pSubDATASize: integer);
begin
TMODELUserFunctionality__SubDATASize(Self,   pSubDATASize);
end;

procedure TMODELUserFunctionality__CheckSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.CheckSpaceSquare(const pAddSpaceSquare: Double);
begin
TMODELUserFunctionality__CheckSpaceSquare(Self,   pAddSpaceSquare);
end;

procedure TMODELUserFunctionality__AddSpaceSquare(Functionality: TFunctionality;   const pAddSpaceSquare: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.AddSpaceSquare(const pAddSpaceSquare: Double);
begin
TMODELUserFunctionality__AddSpaceSquare(Self,   pAddSpaceSquare);
end;

procedure TMODELUserFunctionality__SubSpaceSquare(Functionality: TFunctionality;   const pSubSpaceSquare: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.SubSpaceSquare(const pSubSpaceSquare: Double);
begin
TMODELUserFunctionality__SubSpaceSquare(Self,   pSubSpaceSquare);
end;

procedure TMODELUserFunctionality__CheckMaxSpaceSquarePerObject(Functionality: TFunctionality;   const pObjectSpaceSquare: Double); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.CheckMaxSpaceSquarePerObject(const pObjectSpaceSquare: Double);
begin
TMODELUserFunctionality__CheckMaxSpaceSquarePerObject(Self,   pObjectSpaceSquare);
end;

procedure TMODELUserFunctionality__ServerFolder_GetSubFoldersList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.ServerFolder_GetSubFoldersList(const RelativePath: WideString; out List: WideString);
begin
TMODELUserFunctionality__ServerFolder_GetSubFoldersList(Self,   RelativePath,List);
end;

procedure TMODELUserFunctionality__ServerFolder_GetFilesList(Functionality: TFunctionality;   const RelativePath: WideString; out List: WideString); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.ServerFolder_GetFilesList(const RelativePath: WideString; out List: WideString);
begin
TMODELUserFunctionality__ServerFolder_GetFilesList(Self,   RelativePath,List);
end;

function TMODELUserFunctionality__ServerFolder_AddFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_AddFile(const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean;
begin
Result:=TMODELUserFunctionality__ServerFolder_AddFile(Self,   RelativePath,FileName,FileData);
end;

function TMODELUserFunctionality__ServerFolder_RemoveFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_RemoveFile(const RelativePath: WideString; const FileName: WideString): boolean;
begin
Result:=TMODELUserFunctionality__ServerFolder_RemoveFile(Self,   RelativePath,FileName);
end;

function TMODELUserFunctionality__ServerFolder_ReadFile(Functionality: TFunctionality;   const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_ReadFile(const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean;
begin
Result:=TMODELUserFunctionality__ServerFolder_ReadFile(Self,   RelativePath,FileName,FileData);
end;

function TMODELUserFunctionality__ServerFolder_AddSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_AddSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;
begin
Result:=TMODELUserFunctionality__ServerFolder_AddSubFolder(Self,   RelativePath,SubFolderName);
end;

function TMODELUserFunctionality__ServerFolder_AddSubFolder1(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_AddSubFolder1(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean;
begin
Result:=TMODELUserFunctionality__ServerFolder_AddSubFolder1(Self,   RelativePath,SubFolderName,SubFolderData);
end;

function TMODELUserFunctionality__ServerFolder_RemoveSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_RemoveSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;
begin
Result:=TMODELUserFunctionality__ServerFolder_RemoveSubFolder(Self,   RelativePath,SubFolderName);
end;

function TMODELUserFunctionality__ServerFolder_ReadSubFolder(Functionality: TFunctionality;   const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_ReadSubFolder(const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean;
begin
Result:=TMODELUserFunctionality__ServerFolder_ReadSubFolder(Self,   Version,RelativePath,SubFolderName,Excludes,SubFolderData);
end;

function TMODELUserFunctionality__ServerFolder_ExchangeSubFolder(Functionality: TFunctionality;   const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean; stdcall; external TypesDLL;
function TMODELUserFunctionality.ServerFolder_ExchangeSubFolder(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean;
begin
Result:=TMODELUserFunctionality__ServerFolder_ExchangeSubFolder(Self,   RelativePath,SubFolderName,SubFolderInData,Excludes,SubFolderOutData);
end;

function TMODELUserFunctionality__Tasks_AddNew(Functionality: TFunctionality;   const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer; stdcall; external TypesDLL;
function TMODELUserFunctionality.Tasks_AddNew(const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer;
begin
Result:=TMODELUserFunctionality__Tasks_AddNew(Self,   pPriority,pType,pService,pTaskData,pComment);
end;

procedure TMODELUserFunctionality__Tasks_RemoveItem(Functionality: TFunctionality;   const idTask: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_RemoveItem(const idTask: integer);
begin
TMODELUserFunctionality__Tasks_RemoveItem(Self,   idTask);
end;

procedure TMODELUserFunctionality__Tasks_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Clear;
begin
TMODELUserFunctionality__Tasks_Clear(Self);
end;

procedure TMODELUserFunctionality__Tasks_GetData(Functionality: TFunctionality;   const Version: integer; const flOnlyActive: boolean; out oData: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_GetData(const Version: integer; const flOnlyActive: boolean; out oData: TByteArray);
begin
TMODELUserFunctionality__Tasks_GetData(Self,   Version,flOnlyActive,oData);
end;

procedure TMODELUserFunctionality__Tasks_Item_GetTaskData(Functionality: TFunctionality;   const idTask: integer; out oTaskData: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_GetTaskData(const idTask: integer; out oTaskData: TByteArray);
begin
TMODELUserFunctionality__Tasks_Item_GetTaskData(Self,   idTask,oTaskData);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetPriority(Functionality: TFunctionality;   const idTask: integer; const pPriority: integer); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetPriority(const idTask: integer; const pPriority: integer);
begin
TMODELUserFunctionality__Tasks_Item_SetPriority(Self,   idTask,pPriority);
end;

procedure TMODELUserFunctionality__Tasks_Item_GetStatus(Functionality: TFunctionality;   const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_GetStatus(const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string);
begin
TMODELUserFunctionality__Tasks_Item_GetStatus(Self,   idTask,oStatus,oStatusReason,oStatusComment);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetStatus(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetStatus(const idTask: integer; const pStatus: integer; const pStatusComment: string);
begin
TMODELUserFunctionality__Tasks_Item_SetStatus(Self,   idTask,pStatus,pStatusComment);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetStatus1(Functionality: TFunctionality;   const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetStatus1(const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string);
begin
TMODELUserFunctionality__Tasks_Item_SetStatus1(Self,   idTask,pStatus,pStatusReason,pStatusComment);
end;

procedure TMODELUserFunctionality__Tasks_Item_GetResultData(Functionality: TFunctionality;   const idTask: integer; out oResultData: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_GetResultData(const idTask: integer; out oResultData: TByteArray);
begin
TMODELUserFunctionality__Tasks_Item_GetResultData(Self,   idTask,oResultData);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetResult(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetResult(const idTask: integer; const pResultCode: integer; const pResultComment: string);
begin
TMODELUserFunctionality__Tasks_Item_SetResult(Self,   idTask,pResultCode,pResultComment);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetResult1(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetResult1(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string);
begin
TMODELUserFunctionality__Tasks_Item_SetResult1(Self,   idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultComment);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetResult2(Functionality: TFunctionality;   const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetResult2(const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);
begin
TMODELUserFunctionality__Tasks_Item_SetResult2(Self,   idTask,pResultCode,pResultData,pResultComment);
end;

procedure TMODELUserFunctionality__Tasks_Item_SetResult3(Functionality: TFunctionality;   const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.Tasks_Item_SetResult3(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);
begin
TMODELUserFunctionality__Tasks_Item_SetResult3(Self,   idTask,pCompletedStatusReason,pCompletedStatusComment,pResultCode,pResultData,pResultComment);
end;

procedure TMODELUserFunctionality__ClientProgram_GetReleases(Functionality: TFunctionality;   const ProgramID: integer; const Localization: WideString; out Data: TByteArray); stdcall; external TypesDLL;
procedure TMODELUserFunctionality.ClientProgram_GetReleases(const ProgramID: integer; const Localization: WideString; out Data: TByteArray);
begin
TMODELUserFunctionality__ClientProgram_GetReleases(Self,   ProgramID,Localization,Data);
end;


{TTTextureFunctionality}
function TTTextureFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTextureFunctionality._CreateInstance: integer;
begin
Result:=TTTextureFunctionality___CreateInstance(Self);
end;

procedure TTTextureFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTextureFunctionality._DestroyInstance(const idObj: integer);
begin
TTTextureFunctionality___DestroyInstance(Self,   idObj);
end;

function TTTextureFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTextureFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTextureFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTextureFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTextureFunctionality.getName: string;
begin
Result:=TTTextureFunctionality__getName(Self);
end;

function TTTextureFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTextureFunctionality.getImage: TTypeImage;
begin
Result:=TTTextureFunctionality__getImage(Self);
end;

procedure TTTextureFunctionality__GetInstanceListMatchingBy(Functionality: TFunctionality;   const NameContext: string; out List: TList); stdcall; external TypesDLL;
procedure TTTextureFunctionality.GetInstanceListMatchingBy(const NameContext: string; out List: TList);
begin
TTTextureFunctionality__GetInstanceListMatchingBy(Self,   NameContext,List);
end;

procedure TTTextureFunctionality__GetInstanceListMatchingBy1(Functionality: TFunctionality;   const NameContext: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTTextureFunctionality.GetInstanceListMatchingBy1(const NameContext: string; out List: TByteArray);
begin
TTTextureFunctionality__GetInstanceListMatchingBy1(Self,   NameContext,List);
end;


{TTextureFunctionality}
procedure TTextureFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTextureFunctionality._ToClone(out idClone: integer);
begin
TTextureFunctionality___ToClone(Self,   idClone);
end;

procedure TTextureFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TTextureFunctionality.LoadFromFile(const FileName: string);
begin
TTextureFunctionality__LoadFromFile(Self,   FileName);
end;

function TTextureFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTextureFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTextureFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTextureFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTextureFunctionality.getName: string;
begin
Result:=TTextureFunctionality__getName(Self);
end;

function TTextureFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTextureFunctionality.getHint: string;
begin
Result:=TTextureFunctionality__getHint(Self);
end;

procedure TTextureFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType); stdcall; external TypesDLL;
procedure TTextureFunctionality.GetDATA(out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType);
begin
TTextureFunctionality__GetDATA(Self,   DATAStream,DATAType);
end;

procedure TTextureFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TTextureFunctionality.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer);
begin
TTextureFunctionality__GetDATA1(Self,   DATAStream,DATAType);
end;

procedure TTextureFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TTextureDATAType); stdcall; external TypesDLL;
procedure TTextureFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TTextureDATAType);
begin
TTextureFunctionality__SetDATA(Self,   DATAStream,DATAType);
end;

procedure TTextureFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall; external TypesDLL;
procedure TTextureFunctionality.SetDATA1(DATAStream: TByteArray; const DATAType: Integer);
begin
TTextureFunctionality__SetDATA1(Self,   DATAStream,DATAType);
end;

procedure TTextureFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TTextureFunctionality.GetBitmapDATA(out BMPDATAStream: TMemoryStream);
begin
TTextureFunctionality__GetBitmapDATA(Self,   BMPDATAStream);
end;

procedure TTextureFunctionality__GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall; external TypesDLL;
procedure TTextureFunctionality.GetBitmapDATA1(out BMPDATAStream: TByteArray);
begin
TTextureFunctionality__GetBitmapDATA1(Self,   BMPDATAStream);
end;

procedure TTextureFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTextureFunctionality.setName(Value: string);
begin
TTextureFunctionality__setName(Self,   Value);
end;


{TTBuffered3DVisualizationFunctionality}
function TTBuffered3DVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTBuffered3DVisualizationFunctionality___CreateInstance(Self);
end;

function TTBuffered3DVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTBuffered3DVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTBuffered3DVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality.getName: string;
begin
Result:=TTBuffered3DVisualizationFunctionality__getName(Self);
end;

function TTBuffered3DVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTBuffered3DVisualizationFunctionality__getImage(Self);
end;

function TTBuffered3DVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTBuffered3DVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTBuffered3DVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TBuffered3DVisualizationFunctionality}
procedure TBuffered3DVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality._ToClone(out idClone: integer);
begin
TBuffered3DVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TBuffered3DVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.DestroyData;
begin
TBuffered3DVisualizationFunctionality__DestroyData(Self);
end;

procedure TBuffered3DVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.CloneData(out idClone: integer);
begin
TBuffered3DVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TBuffered3DVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.LoadFromFile(const FileName: string);
begin
TBuffered3DVisualizationFunctionality__LoadFromFile(Self,   FileName);
end;

procedure TBuffered3DVisualizationFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.UpdateDATA;
begin
TBuffered3DVisualizationFunctionality__UpdateDATA(Self);
end;

procedure TBuffered3DVisualizationFunctionality__GetData(Functionality: TFunctionality;   out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Double; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Double); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.GetData(out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Double; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Double);
begin
TBuffered3DVisualizationFunctionality__GetData(Self,   vMeshes,vptrTransforMatrix,vScale,vTranslate_X,vTranslate_Y,vTranslate_Z,vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ);
end;

function TBuffered3DVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TBuffered3DVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

procedure TBuffered3DVisualizationFunctionality__ReflectInScene(Functionality: TFunctionality;   Scene: TScene); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.ReflectInScene(Scene: TScene);
begin
TBuffered3DVisualizationFunctionality__ReflectInScene(Self,   Scene);
end;

function TBuffered3DVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TBuffered3DVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBuffered3DVisualizationFunctionality__DATASize(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.DATASize: integer;
begin
Result:=TBuffered3DVisualizationFunctionality__DATASize(Self);
end;

function TBuffered3DVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TBuffered3DVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TBuffered3DVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.getName: string;
begin
Result:=TBuffered3DVisualizationFunctionality__getName(Self);
end;

function TBuffered3DVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.getHint: string;
begin
Result:=TBuffered3DVisualizationFunctionality__getHint(Self);
end;

procedure TBuffered3DVisualizationFunctionality__LoadFromStream(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.LoadFromStream(DATAStream: TMemoryStream; const DATAType: TComponentFileType);
begin
TBuffered3DVisualizationFunctionality__LoadFromStream(Self,   DATAStream,DATAType);
end;

procedure TBuffered3DVisualizationFunctionality__LoadFromStream1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: integer); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.LoadFromStream1(DATAStream: TByteArray; const DATAType: integer);
begin
TBuffered3DVisualizationFunctionality__LoadFromStream1(Self,   DATAStream,DATAType);
end;

procedure TBuffered3DVisualizationFunctionality__Get__Translate_XY(Functionality: TFunctionality;   out vTranslate_X,vTranslate_Y: Double); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.Get__Translate_XY(out vTranslate_X,vTranslate_Y: Double);
begin
TBuffered3DVisualizationFunctionality__Get__Translate_XY(Self,   vTranslate_X,vTranslate_Y);
end;

procedure TBuffered3DVisualizationFunctionality__SetPropertiesLocal(Functionality: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
begin
TBuffered3DVisualizationFunctionality__SetPropertiesLocal(Self,   pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
end;

function TBuffered3DVisualizationFunctionality__GetMinMax(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix; out Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Double): boolean; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.GetMinMax(const TransforMatrix: TTransforMatrix; out Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Double): boolean;
begin
Result:=TBuffered3DVisualizationFunctionality__GetMinMax(Self,   TransforMatrix,Xmin,Ymin,Zmin,Xmax,Ymax,Zmax);
end;

procedure TBuffered3DVisualizationFunctionality__UpdateXOYProjection(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.UpdateXOYProjection;
begin
TBuffered3DVisualizationFunctionality__UpdateXOYProjection(Self);
end;

function TBuffered3DVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.getDATAFileID: integer;
begin
Result:=TBuffered3DVisualizationFunctionality__getDATAFileID(Self);
end;

procedure TBuffered3DVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.setDATAFileID(Value: integer);
begin
TBuffered3DVisualizationFunctionality__setDATAFileID(Self,   Value);
end;

procedure TBuffered3DVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.DATAFile_Clear;
begin
TBuffered3DVisualizationFunctionality__DATAFile_Clear(Self);
end;

function TBuffered3DVisualizationFunctionality__GetMeshesNodesApproximator(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix): TNodesApproximator; stdcall; external TypesDLL;
function TBuffered3DVisualizationFunctionality.GetMeshesNodesApproximator(const TransforMatrix: TTransforMatrix): TNodesApproximator;
begin
Result:=TBuffered3DVisualizationFunctionality__GetMeshesNodesApproximator(Self,   TransforMatrix);
end;

procedure TBuffered3DVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double); stdcall; external TypesDLL;
procedure TBuffered3DVisualizationFunctionality.GetParams(out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double);
begin
TBuffered3DVisualizationFunctionality__GetParams(Self,   oScale,oTranslate_X,oTranslate_Y,oTranslate_Z,oRotate_AngleX,oRotate_AngleY,oRotate_AngleZ);
end;


{TTDATAFileFunctionality}
function TTDATAFileFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDATAFileFunctionality._CreateInstance: integer;
begin
Result:=TTDATAFileFunctionality___CreateInstance(Self);
end;

procedure TTDATAFileFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTDATAFileFunctionality._DestroyInstance(const idObj: integer);
begin
TTDATAFileFunctionality___DestroyInstance(Self,   idObj);
end;

function TTDATAFileFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDATAFileFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTDATAFileFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTDATAFileFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDATAFileFunctionality.getName: string;
begin
Result:=TTDATAFileFunctionality__getName(Self);
end;

function TTDATAFileFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDATAFileFunctionality.getImage: TTypeImage;
begin
Result:=TTDATAFileFunctionality__getImage(Self);
end;


{TDATAFileFunctionality}
procedure TDATAFileFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDATAFileFunctionality._ToClone(out idClone: integer);
begin
TDATAFileFunctionality___ToClone(Self,   idClone);
end;

procedure TDATAFileFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.LoadFromFile(const FileName: string);
begin
TDATAFileFunctionality__LoadFromFile(Self,   FileName);
end;

procedure TDATAFileFunctionality__SaveToFile(Functionality: TFunctionality;   var FileName: string); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.SaveToFile(var FileName: string);
begin
TDATAFileFunctionality__SaveToFile(Self,   FileName);
end;

procedure TDATAFileFunctionality__Activate(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.Activate;
begin
TDATAFileFunctionality__Activate(Self);
end;

function TDATAFileFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TDATAFileFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TDATAFileFunctionality__Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TDATAFileFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDATAFileFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TDATAFileFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDATAFileFunctionality___GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external TypesDLL;
function TDATAFileFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Result:=TDATAFileFunctionality___GetDataDocument(Self,   DataModel,DataType,flWithComponents,Document);
end;

procedure TDATAFileFunctionality__Check(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.Check;
begin
TDATAFileFunctionality__Check(Self);
end;

function TDATAFileFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDATAFileFunctionality.getName: string;
begin
Result:=TDATAFileFunctionality__getName(Self);
end;

function TDATAFileFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDATAFileFunctionality.getHint: string;
begin
Result:=TDATAFileFunctionality__getHint(Self);
end;

function TDATAFileFunctionality__IsNull(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TDATAFileFunctionality.IsNull: boolean;
begin
Result:=TDATAFileFunctionality__IsNull(Self);
end;

procedure TDATAFileFunctionality__Empty(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.Empty;
begin
TDATAFileFunctionality__Empty(Self);
end;

procedure TDATAFileFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TClientBlobStream); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.GetDATA(out Value: TClientBlobStream);
begin
TDATAFileFunctionality__GetDATA(Self,   Value);
end;

procedure TDATAFileFunctionality__GetDATA1(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.GetDATA1(out Value: TByteArray);
begin
TDATAFileFunctionality__GetDATA1(Self,   Value);
end;

procedure TDATAFileFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.SetDATA(Value: TMemoryStream);
begin
TDATAFileFunctionality__SetDATA(Self,   Value);
end;

procedure TDATAFileFunctionality__SetDATA1(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.SetDATA1(Value: TByteArray);
begin
TDATAFileFunctionality__SetDATA1(Self,   Value);
end;

function TDATAFileFunctionality__getDATAType(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDATAFileFunctionality.getDATAType: string;
begin
Result:=TDATAFileFunctionality__getDATAType(Self);
end;

procedure TDATAFileFunctionality__setDATAType(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TDATAFileFunctionality.setDATAType(Value: string);
begin
TDATAFileFunctionality__setDATAType(Self,   Value);
end;


{TTCoComponentFunctionality}
function TTCoComponentFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCoComponentFunctionality._CreateInstance: integer;
begin
Result:=TTCoComponentFunctionality___CreateInstance(Self);
end;

procedure TTCoComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCoComponentFunctionality._DestroyInstance(const idObj: integer);
begin
TTCoComponentFunctionality___DestroyInstance(Self,   idObj);
end;

function TTCoComponentFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoComponentFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCoComponentFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCoComponentFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoComponentFunctionality.getName: string;
begin
Result:=TTCoComponentFunctionality__getName(Self);
end;

function TTCoComponentFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCoComponentFunctionality.getImage: TTypeImage;
begin
Result:=TTCoComponentFunctionality__getImage(Self);
end;

procedure TTCoComponentFunctionality__GetInstanceListByCoType(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TList); stdcall; external TypesDLL;
procedure TTCoComponentFunctionality.GetInstanceListByCoType(const idCoType: integer; out InstanceList: TList);
begin
TTCoComponentFunctionality__GetInstanceListByCoType(Self,   idCoType,InstanceList);
end;

procedure TTCoComponentFunctionality__GetInstanceListByCoType1(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TByteArray); stdcall; external TypesDLL;
procedure TTCoComponentFunctionality.GetInstanceListByCoType1(const idCoType: integer; out InstanceList: TByteArray);
begin
TTCoComponentFunctionality__GetInstanceListByCoType1(Self,   idCoType,InstanceList);
end;


{TCoComponentFunctionality}
procedure TCoComponentFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoComponentFunctionality._ToClone(out idClone: integer);
begin
TCoComponentFunctionality___ToClone(Self,   idClone);
end;

function TCoComponentFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external TypesDLL;
function TCoComponentFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TCoComponentFunctionality__Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TCoComponentFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoComponentFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCoComponentFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentFunctionality.getName: string;
begin
Result:=TCoComponentFunctionality__getName(Self);
end;

function TCoComponentFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentFunctionality.getHint: string;
begin
Result:=TCoComponentFunctionality__getHint(Self);
end;

function TCoComponentFunctionality__idCoType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoComponentFunctionality.idCoType: integer;
begin
Result:=TCoComponentFunctionality__idCoType(Self);
end;

function TCoComponentFunctionality__GetIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall; external TypesDLL;
function TCoComponentFunctionality.GetIconImage(out Image: TBitmap): boolean;
begin
Result:=TCoComponentFunctionality__GetIconImage(Self,   Image);
end;

function TCoComponentFunctionality__GetIconImage1(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall; external TypesDLL;
function TCoComponentFunctionality.GetIconImage1(out oImage: TByteArray): boolean;
begin
Result:=TCoComponentFunctionality__GetIconImage1(Self,   oImage);
end;

function TCoComponentFunctionality__GetVisualizationComponent(Functionality: TFunctionality;   out idTVisualization,idVisualization: integer): boolean; stdcall; external TypesDLL;
function TCoComponentFunctionality.GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
begin
Result:=TCoComponentFunctionality__GetVisualizationComponent(Self,   idTVisualization,idVisualization);
end;


{TTCoComponentTypeMarkerFunctionality}
function TTCoComponentTypeMarkerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCoComponentTypeMarkerFunctionality._CreateInstance: integer;
begin
Result:=TTCoComponentTypeMarkerFunctionality___CreateInstance(Self);
end;

procedure TTCoComponentTypeMarkerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCoComponentTypeMarkerFunctionality._DestroyInstance(const idObj: integer);
begin
TTCoComponentTypeMarkerFunctionality___DestroyInstance(Self,   idObj);
end;

function TTCoComponentTypeMarkerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoComponentTypeMarkerFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCoComponentTypeMarkerFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCoComponentTypeMarkerFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoComponentTypeMarkerFunctionality.getName: string;
begin
Result:=TTCoComponentTypeMarkerFunctionality__getName(Self);
end;

function TTCoComponentTypeMarkerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCoComponentTypeMarkerFunctionality.getImage: TTypeImage;
begin
Result:=TTCoComponentTypeMarkerFunctionality__getImage(Self);
end;


{TCoComponentTypeMarkerFunctionality}
procedure TCoComponentTypeMarkerFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoComponentTypeMarkerFunctionality._ToClone(out idClone: integer);
begin
TCoComponentTypeMarkerFunctionality___ToClone(Self,   idClone);
end;

function TCoComponentTypeMarkerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCoComponentTypeMarkerFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentTypeMarkerFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TCoComponentTypeMarkerFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TCoComponentTypeMarkerFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.getName: string;
begin
Result:=TCoComponentTypeMarkerFunctionality__getName(Self);
end;

function TCoComponentTypeMarkerFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.getHint: string;
begin
Result:=TCoComponentTypeMarkerFunctionality__getHint(Self);
end;

function TCoComponentTypeMarkerFunctionality__GetTypeIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.GetTypeIconImage(out Image: TBitmap): boolean;
begin
Result:=TCoComponentTypeMarkerFunctionality__GetTypeIconImage(Self,   Image);
end;

function TCoComponentTypeMarkerFunctionality__GetTypeIconImage1(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.GetTypeIconImage1(out oImage: TByteArray): boolean;
begin
Result:=TCoComponentTypeMarkerFunctionality__GetTypeIconImage1(Self,   oImage);
end;

procedure TCoComponentTypeMarkerFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TCoComponentTypeMarkerFunctionality.setName(Value: string);
begin
TCoComponentTypeMarkerFunctionality__setName(Self,   Value);
end;

function TCoComponentTypeMarkerFunctionality__getIDCoComponentType(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoComponentTypeMarkerFunctionality.getIDCoComponentType: integer;
begin
Result:=TCoComponentTypeMarkerFunctionality__getIDCoComponentType(Self);
end;


{TTCoComponentTypeFunctionality}
function TTCoComponentTypeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCoComponentTypeFunctionality._CreateInstance: integer;
begin
Result:=TTCoComponentTypeFunctionality___CreateInstance(Self);
end;

procedure TTCoComponentTypeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCoComponentTypeFunctionality._DestroyInstance(const idObj: integer);
begin
TTCoComponentTypeFunctionality___DestroyInstance(Self,   idObj);
end;

function TTCoComponentTypeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCoComponentTypeFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCoComponentTypeFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCoComponentTypeFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCoComponentTypeFunctionality.getName: string;
begin
Result:=TTCoComponentTypeFunctionality__getName(Self);
end;

function TTCoComponentTypeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCoComponentTypeFunctionality.getImage: TTypeImage;
begin
Result:=TTCoComponentTypeFunctionality__getImage(Self);
end;

procedure TTCoComponentTypeFunctionality__GetInstanceListByFileType(Functionality: TFunctionality;   const FileType: shortstring; out List: TList); stdcall; external TypesDLL;
procedure TTCoComponentTypeFunctionality.GetInstanceListByFileType(const FileType: shortstring; out List: TList);
begin
TTCoComponentTypeFunctionality__GetInstanceListByFileType(Self,   FileType,List);
end;

procedure TTCoComponentTypeFunctionality__GetInstanceListByFileType1(Functionality: TFunctionality;   const FileType: WideString; out List: TByteArray); stdcall; external TypesDLL;
procedure TTCoComponentTypeFunctionality.GetInstanceListByFileType1(const FileType: WideString; out List: TByteArray);
begin
TTCoComponentTypeFunctionality__GetInstanceListByFileType1(Self,   FileType,List);
end;


{TCoComponentTypeFunctionality}
procedure TCoComponentTypeFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality._ToClone(out idClone: integer);
begin
TCoComponentTypeFunctionality___ToClone(Self,   idClone);
end;

function TCoComponentTypeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCoComponentTypeFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentTypeFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.getName: string;
begin
Result:=TCoComponentTypeFunctionality__getName(Self);
end;

function TCoComponentTypeFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.getHint: string;
begin
Result:=TCoComponentTypeFunctionality__getHint(Self);
end;

procedure TCoComponentTypeFunctionality__GetDescription(Functionality: TFunctionality;   Value: TStringList); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.GetDescription(Value: TStringList);
begin
TCoComponentTypeFunctionality__GetDescription(Self,   Value);
end;

procedure TCoComponentTypeFunctionality__GetDescription1(Functionality: TFunctionality;   out Value: TByteArray); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.GetDescription1(out Value: TByteArray);
begin
TCoComponentTypeFunctionality__GetDescription1(Self,   Value);
end;

procedure TCoComponentTypeFunctionality__SetDescription(Functionality: TFunctionality;   Value: TStringList); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.SetDescription(Value: TStringList);
begin
TCoComponentTypeFunctionality__SetDescription(Self,   Value);
end;

procedure TCoComponentTypeFunctionality__SetDescription1(Functionality: TFunctionality;   Value: TByteArray); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.SetDescription1(Value: TByteArray);
begin
TCoComponentTypeFunctionality__SetDescription1(Self,   Value);
end;

procedure TCoComponentTypeFunctionality__GetMarkersList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.GetMarkersList(out List: TList);
begin
TCoComponentTypeFunctionality__GetMarkersList(Self,   List);
end;

procedure TCoComponentTypeFunctionality__GetMarkersList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.GetMarkersList1(out List: TByteArray);
begin
TCoComponentTypeFunctionality__GetMarkersList1(Self,   List);
end;

function TCoComponentTypeFunctionality__GetIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.GetIconImage(out Image: TBitmap): boolean;
begin
Result:=TCoComponentTypeFunctionality__GetIconImage(Self,   Image);
end;

function TCoComponentTypeFunctionality__GetIconImage1(Functionality: TFunctionality;   out oImage: TByteArray): boolean; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.GetIconImage1(out oImage: TByteArray): boolean;
begin
Result:=TCoComponentTypeFunctionality__GetIconImage1(Self,   oImage);
end;

procedure TCoComponentTypeFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.setName(Value: string);
begin
TCoComponentTypeFunctionality__setName(Self,   Value);
end;

function TCoComponentTypeFunctionality__getUID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.getUID: integer;
begin
Result:=TCoComponentTypeFunctionality__getUID(Self);
end;

function TCoComponentTypeFunctionality__getDateCreated(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.getDateCreated: TDateTime;
begin
Result:=TCoComponentTypeFunctionality__getDateCreated(Self);
end;

function TCoComponentTypeFunctionality__getFileType(Functionality: TFunctionality): shortstring; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.getFileType: shortstring;
begin
Result:=TCoComponentTypeFunctionality__getFileType(Self);
end;

procedure TCoComponentTypeFunctionality__setFileType(Functionality: TFunctionality;   Value: shortstring); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.setFileType(Value: shortstring);
begin
TCoComponentTypeFunctionality__setFileType(Self,   Value);
end;

function TCoComponentTypeFunctionality__getCoComponentPrototypeID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TCoComponentTypeFunctionality.getCoComponentPrototypeID: integer;
begin
Result:=TCoComponentTypeFunctionality__getCoComponentPrototypeID(Self);
end;

procedure TCoComponentTypeFunctionality__setCoComponentPrototypeID(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TCoComponentTypeFunctionality.setCoComponentPrototypeID(Value: integer);
begin
TCoComponentTypeFunctionality__setCoComponentPrototypeID(Self,   Value);
end;


{TTAddressFunctionality}
function TTAddressFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTAddressFunctionality._CreateInstance: integer;
begin
Result:=TTAddressFunctionality___CreateInstance(Self);
end;

procedure TTAddressFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTAddressFunctionality._DestroyInstance(const idObj: integer);
begin
TTAddressFunctionality___DestroyInstance(Self,   idObj);
end;

function TTAddressFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTAddressFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTAddressFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTAddressFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTAddressFunctionality.getName: string;
begin
Result:=TTAddressFunctionality__getName(Self);
end;

function TTAddressFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTAddressFunctionality.getImage: TTypeImage;
begin
Result:=TTAddressFunctionality__getImage(Self);
end;

procedure TTAddressFunctionality__Points_GetTypeNames(Functionality: TFunctionality;   out List: TStringList); stdcall; external TypesDLL;
procedure TTAddressFunctionality.Points_GetTypeNames(out List: TStringList);
begin
TTAddressFunctionality__Points_GetTypeNames(Self,   List);
end;

procedure TTAddressFunctionality__Points_GetTypeNames1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTAddressFunctionality.Points_GetTypeNames1(out List: TByteArray);
begin
TTAddressFunctionality__Points_GetTypeNames1(Self,   List);
end;

procedure TTAddressFunctionality__Streets_GetTypeNames(Functionality: TFunctionality;   out List: TStringList); stdcall; external TypesDLL;
procedure TTAddressFunctionality.Streets_GetTypeNames(out List: TStringList);
begin
TTAddressFunctionality__Streets_GetTypeNames(Self,   List);
end;

procedure TTAddressFunctionality__Streets_GetTypeNames1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTAddressFunctionality.Streets_GetTypeNames1(out List: TByteArray);
begin
TTAddressFunctionality__Streets_GetTypeNames1(Self,   List);
end;


{TAddressFunctionality}
procedure TAddressFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TAddressFunctionality._ToClone(out idClone: integer);
begin
TAddressFunctionality___ToClone(Self,   idClone);
end;

function TAddressFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TAddressFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TAddressFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAddressFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality.getName: string;
begin
Result:=TAddressFunctionality__getName(Self);
end;

function TAddressFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality.getHint: string;
begin
Result:=TAddressFunctionality__getHint(Self);
end;

function TAddressFunctionality__getIdPoint(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TAddressFunctionality.getIdPoint: integer;
begin
Result:=TAddressFunctionality__getIdPoint(Self);
end;

procedure TAddressFunctionality__setIdPoint(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TAddressFunctionality.setIdPoint(Value: integer);
begin
TAddressFunctionality__setIdPoint(Self,   Value);
end;

function TAddressFunctionality__getPoint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality.getPoint: string;
begin
Result:=TAddressFunctionality__getPoint(Self);
end;

function TAddressFunctionality__getIdStreet(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TAddressFunctionality.getIdStreet: integer;
begin
Result:=TAddressFunctionality__getIdStreet(Self);
end;

procedure TAddressFunctionality__setIdStreet(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TAddressFunctionality.setIdStreet(Value: integer);
begin
TAddressFunctionality__setIdStreet(Self,   Value);
end;

function TAddressFunctionality__getStreet(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality.getStreet: string;
begin
Result:=TAddressFunctionality__getStreet(Self);
end;

function TAddressFunctionality__getHouse(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality.getHouse: string;
begin
Result:=TAddressFunctionality__getHouse(Self);
end;

procedure TAddressFunctionality__setHouse(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TAddressFunctionality.setHouse(Value: string);
begin
TAddressFunctionality__setHouse(Self,   Value);
end;

function TAddressFunctionality__getCorps(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TAddressFunctionality.getCorps: integer;
begin
Result:=TAddressFunctionality__getCorps(Self);
end;

procedure TAddressFunctionality__setCorps(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TAddressFunctionality.setCorps(Value: integer);
begin
TAddressFunctionality__setCorps(Self,   Value);
end;

function TAddressFunctionality__getApartment(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TAddressFunctionality.getApartment: string;
begin
Result:=TAddressFunctionality__getApartment(Self);
end;

procedure TAddressFunctionality__setApartment(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TAddressFunctionality.setApartment(Value: string);
begin
TAddressFunctionality__setApartment(Self,   Value);
end;

function TAddressFunctionality__getEntrance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TAddressFunctionality.getEntrance: integer;
begin
Result:=TAddressFunctionality__getEntrance(Self);
end;

procedure TAddressFunctionality__setEntrance(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TAddressFunctionality.setEntrance(Value: integer);
begin
TAddressFunctionality__setEntrance(Self,   Value);
end;


{TTTransportRouteFunctionality}
function TTTransportRouteFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTransportRouteFunctionality._CreateInstance: integer;
begin
Result:=TTTransportRouteFunctionality___CreateInstance(Self);
end;

procedure TTTransportRouteFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTransportRouteFunctionality._DestroyInstance(const idObj: integer);
begin
TTTransportRouteFunctionality___DestroyInstance(Self,   idObj);
end;

function TTTransportRouteFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTransportRouteFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTransportRouteFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTransportRouteFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTransportRouteFunctionality.getName: string;
begin
Result:=TTTransportRouteFunctionality__getName(Self);
end;

function TTTransportRouteFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTransportRouteFunctionality.getImage: TTypeImage;
begin
Result:=TTTransportRouteFunctionality__getImage(Self);
end;

procedure TTTransportRouteFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTTransportRouteFunctionality.GetInstanceList(out List: TList);
begin
TTTransportRouteFunctionality__GetInstanceList(Self,   List);
end;

procedure TTTransportRouteFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTTransportRouteFunctionality.GetInstanceList1(out List: TByteArray);
begin
TTTransportRouteFunctionality__GetInstanceList1(Self,   List);
end;


{TTransportRouteFunctionality}
procedure TTransportRouteFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality._ToClone(out idClone: integer);
begin
TTransportRouteFunctionality___ToClone(Self,   idClone);
end;

function TTransportRouteFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTransportRouteFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTransportRouteFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportRouteFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportRouteFunctionality.getName: string;
begin
Result:=TTransportRouteFunctionality__getName(Self);
end;

procedure TTransportRouteFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.setName(Value: string);
begin
TTransportRouteFunctionality__setName(Self,   Value);
end;

function TTransportRouteFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportRouteFunctionality.getHint: string;
begin
Result:=TTransportRouteFunctionality__getHint(Self);
end;

function TTransportRouteFunctionality__getidTTransport(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTransportRouteFunctionality.getidTTransport: integer;
begin
Result:=TTransportRouteFunctionality__getidTTransport(Self);
end;

procedure TTransportRouteFunctionality__setidTTransport(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.setidTTransport(Value: integer);
begin
TTransportRouteFunctionality__setidTTransport(Self,   Value);
end;

function TTransportRouteFunctionality__getValid(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTransportRouteFunctionality.getValid: boolean;
begin
Result:=TTransportRouteFunctionality__getValid(Self);
end;

procedure TTransportRouteFunctionality__setValid(Functionality: TFunctionality;   Value: boolean); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.setValid(Value: boolean);
begin
TTransportRouteFunctionality__setValid(Self,   Value);
end;

function TTransportRouteFunctionality__getRemarks(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportRouteFunctionality.getRemarks: string;
begin
Result:=TTransportRouteFunctionality__getRemarks(Self);
end;

procedure TTransportRouteFunctionality__setRemarks(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.setRemarks(Value: string);
begin
TTransportRouteFunctionality__setRemarks(Self,   Value);
end;

function TTransportRouteFunctionality__IsNodesExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTransportRouteFunctionality.IsNodesExist: boolean;
begin
Result:=TTransportRouteFunctionality__IsNodesExist(Self);
end;

procedure TTransportRouteFunctionality__Nodes_GetList(Functionality: TFunctionality;   out List: TRouteNodesList); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.Nodes_GetList(out List: TRouteNodesList);
begin
TTransportRouteFunctionality__Nodes_GetList(Self,   List);
end;

procedure TTransportRouteFunctionality__Nodes_GetList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.Nodes_GetList1(out List: TByteArray);
begin
TTransportRouteFunctionality__Nodes_GetList1(Self,   List);
end;

function TTransportRouteFunctionality__Nodes_IsNodeExist(Functionality: TFunctionality;   const idNode: integer): boolean; stdcall; external TypesDLL;
function TTransportRouteFunctionality.Nodes_IsNodeExist(const idNode: integer): boolean;
begin
Result:=TTransportRouteFunctionality__Nodes_IsNodeExist(Self,   idNode);
end;

procedure TTransportRouteFunctionality__Nodes_ChangeNodeOrder(Functionality: TFunctionality;   const idItem: integer; const Order: integer); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.Nodes_ChangeNodeOrder(const idItem: integer; const Order: integer);
begin
TTransportRouteFunctionality__Nodes_ChangeNodeOrder(Self,   idItem,Order);
end;

function TTransportRouteFunctionality__Nodes__Node_DistanceBefore(Functionality: TFunctionality;   const idItem: integer): integer; stdcall; external TypesDLL;
function TTransportRouteFunctionality.Nodes__Node_DistanceBefore(const idItem: integer): integer;
begin
Result:=TTransportRouteFunctionality__Nodes__Node_DistanceBefore(Self,   idItem);
end;

procedure TTransportRouteFunctionality__Nodes__Node_SetDistanceBefore(Functionality: TFunctionality;   const idItem: integer; const D: integer); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.Nodes__Node_SetDistanceBefore(const idItem: integer; const D: integer);
begin
TTransportRouteFunctionality__Nodes__Node_SetDistanceBefore(Self,   idItem,D);
end;

function TTransportRouteFunctionality__Nodes__Node_OrderPrice(Functionality: TFunctionality;   const idItem: integer): string; stdcall; external TypesDLL;
function TTransportRouteFunctionality.Nodes__Node_OrderPrice(const idItem: integer): string;
begin
Result:=TTransportRouteFunctionality__Nodes__Node_OrderPrice(Self,   idItem);
end;

procedure TTransportRouteFunctionality__Nodes__Node_SetOrderPrice(Functionality: TFunctionality;   const idItem: integer; const Price: string); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.Nodes__Node_SetOrderPrice(const idItem: integer; const Price: string);
begin
TTransportRouteFunctionality__Nodes__Node_SetOrderPrice(Self,   idItem,Price);
end;

function TTransportRouteFunctionality__Nodes_Insert(Functionality: TFunctionality;   const idNode: integer): integer; stdcall; external TypesDLL;
function TTransportRouteFunctionality.Nodes_Insert(const idNode: integer): integer;
begin
Result:=TTransportRouteFunctionality__Nodes_Insert(Self,   idNode);
end;

procedure TTransportRouteFunctionality__Nodes_Remove(Functionality: TFunctionality;   const idItem: integer); stdcall; external TypesDLL;
procedure TTransportRouteFunctionality.Nodes_Remove(const idItem: integer);
begin
TTransportRouteFunctionality__Nodes_Remove(Self,   idItem);
end;


{TTTransportNodeFunctionality}
function TTTransportNodeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTransportNodeFunctionality._CreateInstance: integer;
begin
Result:=TTTransportNodeFunctionality___CreateInstance(Self);
end;

procedure TTTransportNodeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTransportNodeFunctionality._DestroyInstance(const idObj: integer);
begin
TTTransportNodeFunctionality___DestroyInstance(Self,   idObj);
end;

function TTTransportNodeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTransportNodeFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTransportNodeFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTransportNodeFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTransportNodeFunctionality.getName: string;
begin
Result:=TTTransportNodeFunctionality__getName(Self);
end;

function TTTransportNodeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTransportNodeFunctionality.getImage: TTypeImage;
begin
Result:=TTTransportNodeFunctionality__getImage(Self);
end;

procedure TTTransportNodeFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTTransportNodeFunctionality.GetInstanceList(out List: TList);
begin
TTTransportNodeFunctionality__GetInstanceList(Self,   List);
end;

procedure TTTransportNodeFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTTransportNodeFunctionality.GetInstanceList1(out List: TByteArray);
begin
TTTransportNodeFunctionality__GetInstanceList1(Self,   List);
end;


{TTransportNodeFunctionality}
procedure TTransportNodeFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTransportNodeFunctionality._ToClone(out idClone: integer);
begin
TTransportNodeFunctionality___ToClone(Self,   idClone);
end;

function TTransportNodeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTransportNodeFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTransportNodeFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportNodeFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportNodeFunctionality.getName: string;
begin
Result:=TTransportNodeFunctionality__getName(Self);
end;

procedure TTransportNodeFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTransportNodeFunctionality.setName(Value: string);
begin
TTransportNodeFunctionality__setName(Self,   Value);
end;

function TTransportNodeFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTransportNodeFunctionality.getHint: string;
begin
Result:=TTransportNodeFunctionality__getHint(Self);
end;

function TTransportNodeFunctionality__IsRoutesExist(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TTransportNodeFunctionality.IsRoutesExist: boolean;
begin
Result:=TTransportNodeFunctionality__IsRoutesExist(Self);
end;


{TTOfferGoodsFunctionality}
function TTOfferGoodsFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOfferGoodsFunctionality._CreateInstance: integer;
begin
Result:=TTOfferGoodsFunctionality___CreateInstance(Self);
end;

procedure TTOfferGoodsFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTOfferGoodsFunctionality._DestroyInstance(const idObj: integer);
begin
TTOfferGoodsFunctionality___DestroyInstance(Self,   idObj);
end;

function TTOfferGoodsFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOfferGoodsFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOfferGoodsFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOfferGoodsFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOfferGoodsFunctionality.getName: string;
begin
Result:=TTOfferGoodsFunctionality__getName(Self);
end;

function TTOfferGoodsFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOfferGoodsFunctionality.getImage: TTypeImage;
begin
Result:=TTOfferGoodsFunctionality__getImage(Self);
end;


{TOfferGoodsFunctionality}
procedure TOfferGoodsFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality._ToClone(out idClone: integer);
begin
TOfferGoodsFunctionality___ToClone(Self,   idClone);
end;

function TOfferGoodsFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOfferGoodsFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOfferGoodsFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TOfferGoodsFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TOfferGoodsFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getName: string;
begin
Result:=TOfferGoodsFunctionality__getName(Self);
end;

function TOfferGoodsFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getHint: string;
begin
Result:=TOfferGoodsFunctionality__getHint(Self);
end;

function TOfferGoodsFunctionality__idOffer(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.idOffer: integer;
begin
Result:=TOfferGoodsFunctionality__idOffer(Self);
end;

function TOfferGoodsFunctionality__getIdGoods(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getIdGoods: integer;
begin
Result:=TOfferGoodsFunctionality__getIdGoods(Self);
end;

procedure TOfferGoodsFunctionality__setIdGoods(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality.setIdGoods(Value: integer);
begin
TOfferGoodsFunctionality__setIdGoods(Self,   Value);
end;

function TOfferGoodsFunctionality__getAmount(Functionality: TFunctionality): Double; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getAmount: Double;
begin
Result:=TOfferGoodsFunctionality__getAmount(Self);
end;

procedure TOfferGoodsFunctionality__setAmount(Functionality: TFunctionality;   Value: Double); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality.setAmount(Value: Double);
begin
TOfferGoodsFunctionality__setAmount(Self,   Value);
end;

function TOfferGoodsFunctionality__getIdMeasureUnit(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getIdMeasureUnit: integer;
begin
Result:=TOfferGoodsFunctionality__getIdMeasureUnit(Self);
end;

procedure TOfferGoodsFunctionality__setIdMeasureUnit(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality.setIdMeasureUnit(Value: integer);
begin
TOfferGoodsFunctionality__setIdMeasureUnit(Self,   Value);
end;

function TOfferGoodsFunctionality__getMeasureUnit(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getMeasureUnit: string;
begin
Result:=TOfferGoodsFunctionality__getMeasureUnit(Self);
end;

function TOfferGoodsFunctionality__getMinPrice(Functionality: TFunctionality): Currency; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getMinPrice: Currency;
begin
Result:=TOfferGoodsFunctionality__getMinPrice(Self);
end;

procedure TOfferGoodsFunctionality__setMinPrice(Functionality: TFunctionality;   Value: Currency); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality.setMinPrice(Value: Currency);
begin
TOfferGoodsFunctionality__setMinPrice(Self,   Value);
end;

function TOfferGoodsFunctionality__getMisc(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferGoodsFunctionality.getMisc: string;
begin
Result:=TOfferGoodsFunctionality__getMisc(Self);
end;

procedure TOfferGoodsFunctionality__setMisc(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOfferGoodsFunctionality.setMisc(Value: string);
begin
TOfferGoodsFunctionality__setMisc(Self,   Value);
end;


{TTTLFStationTMTFunctionality}
function TTTLFStationTMTFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTLFStationTMTFunctionality._CreateInstance: integer;
begin
Result:=TTTLFStationTMTFunctionality___CreateInstance(Self);
end;

procedure TTTLFStationTMTFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTTLFStationTMTFunctionality._DestroyInstance(const idObj: integer);
begin
TTTLFStationTMTFunctionality___DestroyInstance(Self,   idObj);
end;

function TTTLFStationTMTFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTLFStationTMTFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTLFStationTMTFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTLFStationTMTFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTLFStationTMTFunctionality.getName: string;
begin
Result:=TTTLFStationTMTFunctionality__getName(Self);
end;

function TTTLFStationTMTFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTLFStationTMTFunctionality.getImage: TTypeImage;
begin
Result:=TTTLFStationTMTFunctionality__getImage(Self);
end;

procedure TTTLFStationTMTFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTTLFStationTMTFunctionality.GetInstanceList(out List: TList);
begin
TTTLFStationTMTFunctionality__GetInstanceList(Self,   List);
end;

procedure TTTLFStationTMTFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTTLFStationTMTFunctionality.GetInstanceList1(out List: TByteArray);
begin
TTTLFStationTMTFunctionality__GetInstanceList1(Self,   List);
end;


{TTLFStationTMTFunctionality}
procedure TTLFStationTMTFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTLFStationTMTFunctionality._ToClone(out idClone: integer);
begin
TTLFStationTMTFunctionality___ToClone(Self,   idClone);
end;

function TTLFStationTMTFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTLFStationTMTFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTLFStationTMTFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality.getName: string;
begin
Result:=TTLFStationTMTFunctionality__getName(Self);
end;

function TTLFStationTMTFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality.getHint: string;
begin
Result:=TTLFStationTMTFunctionality__getHint(Self);
end;

function TTLFStationTMTFunctionality__getHostName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality.getHostName: string;
begin
Result:=TTLFStationTMTFunctionality__getHostName(Self);
end;

procedure TTLFStationTMTFunctionality__setHostName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTLFStationTMTFunctionality.setHostName(Value: string);
begin
TTLFStationTMTFunctionality__setHostName(Self,   Value);
end;

function TTLFStationTMTFunctionality__getTestChanel(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLFStationTMTFunctionality.getTestChanel: string;
begin
Result:=TTLFStationTMTFunctionality__getTestChanel(Self);
end;

procedure TTLFStationTMTFunctionality__setTestChanel(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TTLFStationTMTFunctionality.setTestChanel(Value: string);
begin
TTLFStationTMTFunctionality__setTestChanel(Self,   Value);
end;


{TTNameFunctionality}
function TTNameFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTNameFunctionality._CreateInstance: integer;
begin
Result:=TTNameFunctionality___CreateInstance(Self);
end;

procedure TTNameFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTNameFunctionality._DestroyInstance(const idObj: integer);
begin
TTNameFunctionality___DestroyInstance(Self,   idObj);
end;

function TTNameFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTNameFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTNameFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTNameFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTNameFunctionality.getName: string;
begin
Result:=TTNameFunctionality__getName(Self);
end;

function TTNameFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTNameFunctionality.getImage: TTypeImage;
begin
Result:=TTNameFunctionality__getImage(Self);
end;


{TNameFunctionality}
procedure TNameFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TNameFunctionality._ToClone(out idClone: integer);
begin
TNameFunctionality___ToClone(Self,   idClone);
end;

function TNameFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TNameFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TNameFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TNameFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TNameFunctionality.getName: string;
begin
Result:=TNameFunctionality__getName(Self);
end;

function TNameFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TNameFunctionality.getHint: string;
begin
Result:=TNameFunctionality__getHint(Self);
end;

function TNameFunctionality__Value(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TNameFunctionality.Value: string;
begin
Result:=TNameFunctionality__Value(Self);
end;

procedure TNameFunctionality__SetValue(Functionality: TFunctionality;   const NewValue: string); stdcall; external TypesDLL;
procedure TNameFunctionality.SetValue(const NewValue: string);
begin
TNameFunctionality__SetValue(Self,   NewValue);
end;


{TTVisualizationFunctionality}
function TTVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTVisualizationFunctionality___CreateInstance(Self);
end;

function TTVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTVisualizationFunctionality.getName: string;
begin
Result:=TTVisualizationFunctionality__getName(Self);
end;

function TTVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTVisualizationFunctionality__getImage(Self);
end;

function TTVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TVisualizationFunctionality}
procedure TVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TVisualizationFunctionality._ToClone(out idClone: integer);
begin
TVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TVisualizationFunctionality.DestroyData;
begin
TVisualizationFunctionality__DestroyData(Self);
end;

procedure TVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TVisualizationFunctionality.CloneData(out idClone: integer);
begin
TVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TVisualizationFunctionality__ContainerFilled(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function TVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TVisualizationFunctionality__ContainerFilled(Self);
end;

function TVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVisualizationFunctionality.getName: string;
begin
Result:=TVisualizationFunctionality__getName(Self);
end;

function TVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TVisualizationFunctionality.getHint: string;
begin
Result:=TVisualizationFunctionality__getHint(Self);
end;


{TTHREFVisualizationFunctionality}
function TTHREFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHREFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHREFVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHREFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHREFVisualizationFunctionality.getName: string;
begin
Result:=TTHREFVisualizationFunctionality__getName(Self);
end;

function TTHREFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHREFVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTHREFVisualizationFunctionality__getImage(Self);
end;


{THREFVisualizationFunctionality}
function THREFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function THREFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=THREFVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function THREFVisualizationFunctionality__DoOnOver(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function THREFVisualizationFunctionality.DoOnOver: boolean;
begin
Result:=THREFVisualizationFunctionality__DoOnOver(Self);
end;

function THREFVisualizationFunctionality__DoOnClick(Functionality: TFunctionality): boolean; stdcall; external TypesDLL;
function THREFVisualizationFunctionality.DoOnClick: boolean;
begin
Result:=THREFVisualizationFunctionality__DoOnClick(Self);
end;

function THREFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function THREFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=THREFVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;


{TTTTFVisualizationFunctionality}
function TTTTFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTTTFVisualizationFunctionality___CreateInstance(Self);
end;

function TTTTFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTTTFVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTTTFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality.getName: string;
begin
Result:=TTTTFVisualizationFunctionality__getName(Self);
end;

function TTTTFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTTTFVisualizationFunctionality__getImage(Self);
end;

function TTTTFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall; external TypesDLL;
function TTTTFVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTTTFVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TTTFVisualizationFunctionality}
procedure TTTFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality._ToClone(out idClone: integer);
begin
TTTFVisualizationFunctionality___ToClone(Self,   idClone);
end;

procedure TTTFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality.DestroyData;
begin
TTTFVisualizationFunctionality__DestroyData(Self);
end;

procedure TTTFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality.CloneData(out idClone: integer);
begin
TTTFVisualizationFunctionality__CloneData(Self,   idClone);
end;

procedure TTTFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Double); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TTTFVisualizationFunctionality__DoOnChangeScale(Self,   ChangeCoef);
end;

function TTTFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TTTFVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TTTFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TTTFVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTTFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TTTFVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TTTFVisualizationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality.getName: string;
begin
Result:=TTTFVisualizationFunctionality__getName(Self);
end;

function TTTFVisualizationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality.getHint: string;
begin
Result:=TTTFVisualizationFunctionality__getHint(Self);
end;

function TTTFVisualizationFunctionality__getStr(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTTFVisualizationFunctionality.getStr: string;
begin
Result:=TTTFVisualizationFunctionality__getStr(Self);
end;

procedure TTTFVisualizationFunctionality__setStr(Functionality: TFunctionality;   const Value: string); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality.setStr(const Value: string);
begin
TTTFVisualizationFunctionality__setStr(Self,   Value);
end;

procedure TTTFVisualizationFunctionality__GetParams(Functionality: TFunctionality;   out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality.GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString);
begin
TTTFVisualizationFunctionality__GetParams(Self,   oStr,oFont_Width,oFont_Height,oFont_Name);
end;

procedure TTTFVisualizationFunctionality__SetParams(Functionality: TFunctionality;   const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString); stdcall; external TypesDLL;
procedure TTTFVisualizationFunctionality.SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString);
begin
TTTFVisualizationFunctionality__SetParams(Self,   pStr,pFont_Width,pFont_Height,pFont_Name);
end;


{TTObjectFunctionality}
function TTObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTObjectFunctionality._CreateInstance: integer;
begin
Result:=TTObjectFunctionality___CreateInstance(Self);
end;

procedure TTObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTObjectFunctionality._DestroyInstance(const idObj: integer);
begin
TTObjectFunctionality___DestroyInstance(Self,   idObj);
end;

function TTObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTObjectFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTObjectFunctionality.getName: string;
begin
Result:=TTObjectFunctionality__getName(Self);
end;

function TTObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTObjectFunctionality.getImage: TTypeImage;
begin
Result:=TTObjectFunctionality__getImage(Self);
end;


{TObjectFunctionality}
procedure TObjectFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TObjectFunctionality._ToClone(out idClone: integer);
begin
TObjectFunctionality___ToClone(Self,   idClone);
end;

function TObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TObjectFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TObjectFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TObjectFunctionality.getName: string;
begin
Result:=TObjectFunctionality__getName(Self);
end;

function TObjectFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TObjectFunctionality.getHint: string;
begin
Result:=TObjectFunctionality__getHint(Self);
end;


{TTLabelFunctionality}
function TTLabelFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTLabelFunctionality._CreateInstance: integer;
begin
Result:=TTLabelFunctionality___CreateInstance(Self);
end;

procedure TTLabelFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTLabelFunctionality._DestroyInstance(const idObj: integer);
begin
TTLabelFunctionality___DestroyInstance(Self,   idObj);
end;

function TTLabelFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTLabelFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTLabelFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTLabelFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLabelFunctionality.getName: string;
begin
Result:=TTLabelFunctionality__getName(Self);
end;

function TTLabelFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTLabelFunctionality.getImage: TTypeImage;
begin
Result:=TTLabelFunctionality__getImage(Self);
end;


{TLabelFunctionality}
procedure TLabelFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TLabelFunctionality._ToClone(out idClone: integer);
begin
TLabelFunctionality___ToClone(Self,   idClone);
end;

function TLabelFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TLabelFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TLabelFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLabelFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TLabelFunctionality.getName: string;
begin
Result:=TLabelFunctionality__getName(Self);
end;

function TLabelFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TLabelFunctionality.getHint: string;
begin
Result:=TLabelFunctionality__getHint(Self);
end;


{TTStationFunctionality}
function TTStationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTStationFunctionality._CreateInstance: integer;
begin
Result:=TTStationFunctionality___CreateInstance(Self);
end;

procedure TTStationFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTStationFunctionality._DestroyInstance(const idObj: integer);
begin
TTStationFunctionality___DestroyInstance(Self,   idObj);
end;

function TTStationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTStationFunctionality.getName: string;
begin
Result:=TTStationFunctionality__getName(Self);
end;

function TTStationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTStationFunctionality.getImage: TTypeImage;
begin
Result:=TTStationFunctionality__getImage(Self);
end;

function TTStationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTStationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTStationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

procedure TTStationFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTStationFunctionality.GetInstanceList(out List: TList);
begin
TTStationFunctionality__GetInstanceList(Self,   List);
end;

procedure TTStationFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTStationFunctionality.GetInstanceList1(out List: TByteArray);
begin
TTStationFunctionality__GetInstanceList1(Self,   List);
end;


{TStationFunctionality}
procedure TStationFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TStationFunctionality._ToClone(out idClone: integer);
begin
TStationFunctionality___ToClone(Self,   idClone);
end;

function TStationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TStationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TStationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TStationFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TStationFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TStationFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TStationFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TStationFunctionality.getName: string;
begin
Result:=TStationFunctionality__getName(Self);
end;

function TStationFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TStationFunctionality.getHint: string;
begin
Result:=TStationFunctionality__getHint(Self);
end;

procedure TStationFunctionality__GetNumbersBound(Functionality: TFunctionality;   out BegNumber,EndNumber: integer); stdcall; external TypesDLL;
procedure TStationFunctionality.GetNumbersBound(out BegNumber,EndNumber: integer);
begin
TStationFunctionality__GetNumbersBound(Self,   BegNumber,EndNumber);
end;


{TTMainLineFunctionality}
function TTMainLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMainLineFunctionality._CreateInstance: integer;
begin
Result:=TTMainLineFunctionality___CreateInstance(Self);
end;

procedure TTMainLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMainLineFunctionality._DestroyInstance(const idObj: integer);
begin
TTMainLineFunctionality___DestroyInstance(Self,   idObj);
end;

function TTMainLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMainLineFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMainLineFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMainLineFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMainLineFunctionality.getName: string;
begin
Result:=TTMainLineFunctionality__getName(Self);
end;

function TTMainLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMainLineFunctionality.getImage: TTypeImage;
begin
Result:=TTMainLineFunctionality__getImage(Self);
end;


{TMainLineFunctionality}
procedure TMainLineFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMainLineFunctionality._ToClone(out idClone: integer);
begin
TMainLineFunctionality___ToClone(Self,   idClone);
end;

function TMainLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMainLineFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMainLineFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMainLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TMainLineFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TMainLineFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TMainLineFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMainLineFunctionality.getName: string;
begin
Result:=TMainLineFunctionality__getName(Self);
end;

function TMainLineFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMainLineFunctionality.getHint: string;
begin
Result:=TMainLineFunctionality__getHint(Self);
end;

function TMainLineFunctionality__GetSTNOwner(Functionality: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external TypesDLL;
function TMainLineFunctionality.GetSTNOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TMainLineFunctionality__GetSTNOwner(Self,   idTOwner,idOwner);
end;


{TTDescriptionFunctionality}
function TTDescriptionFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDescriptionFunctionality._CreateInstance: integer;
begin
Result:=TTDescriptionFunctionality___CreateInstance(Self);
end;

procedure TTDescriptionFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTDescriptionFunctionality._DestroyInstance(const idObj: integer);
begin
TTDescriptionFunctionality___DestroyInstance(Self,   idObj);
end;

function TTDescriptionFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDescriptionFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTDescriptionFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTDescriptionFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDescriptionFunctionality.getName: string;
begin
Result:=TTDescriptionFunctionality__getName(Self);
end;

function TTDescriptionFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDescriptionFunctionality.getImage: TTypeImage;
begin
Result:=TTDescriptionFunctionality__getImage(Self);
end;


{TDescriptionFunctionality}
procedure TDescriptionFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDescriptionFunctionality.UpdateDATA;
begin
TDescriptionFunctionality__UpdateDATA(Self);
end;

procedure TDescriptionFunctionality__ClearDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TDescriptionFunctionality.ClearDATA;
begin
TDescriptionFunctionality__ClearDATA(Self);
end;

procedure TDescriptionFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDescriptionFunctionality._ToClone(out idClone: integer);
begin
TDescriptionFunctionality___ToClone(Self,   idClone);
end;

function TDescriptionFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDescriptionFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TDescriptionFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDescriptionFunctionality___GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external TypesDLL;
function TDescriptionFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Result:=TDescriptionFunctionality___GetDataDocument(Self,   DataModel,DataType,flWithComponents,Document);
end;

function TDescriptionFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDescriptionFunctionality.getName: string;
begin
Result:=TDescriptionFunctionality__getName(Self);
end;

function TDescriptionFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDescriptionFunctionality.getHint: string;
begin
Result:=TDescriptionFunctionality__getHint(Self);
end;

procedure TDescriptionFunctionality__GetValue(Functionality: TFunctionality;   vText: TStringList); stdcall; external TypesDLL;
procedure TDescriptionFunctionality.GetValue(vText: TStringList);
begin
TDescriptionFunctionality__GetValue(Self,   vText);
end;

procedure TDescriptionFunctionality__GetValue1(Functionality: TFunctionality;   out vText: TByteArray); stdcall; external TypesDLL;
procedure TDescriptionFunctionality.GetValue1(out vText: TByteArray);
begin
TDescriptionFunctionality__GetValue1(Self,   vText);
end;

procedure TDescriptionFunctionality__SetValue(Functionality: TFunctionality;   NewValue: TStringList); stdcall; external TypesDLL;
procedure TDescriptionFunctionality.SetValue(NewValue: TStringList);
begin
TDescriptionFunctionality__SetValue(Self,   NewValue);
end;

procedure TDescriptionFunctionality__SetValue1(Functionality: TFunctionality;   NewValue: TByteArray); stdcall; external TypesDLL;
procedure TDescriptionFunctionality.SetValue1(NewValue: TByteArray);
begin
TDescriptionFunctionality__SetValue1(Self,   NewValue);
end;


{TTImageFunctionality}
function TTImageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTImageFunctionality._CreateInstance: integer;
begin
Result:=TTImageFunctionality___CreateInstance(Self);
end;

procedure TTImageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTImageFunctionality._DestroyInstance(const idObj: integer);
begin
TTImageFunctionality___DestroyInstance(Self,   idObj);
end;

function TTImageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTImageFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTImageFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTImageFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTImageFunctionality.getName: string;
begin
Result:=TTImageFunctionality__getName(Self);
end;

function TTImageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTImageFunctionality.getImage: TTypeImage;
begin
Result:=TTImageFunctionality__getImage(Self);
end;


{TImageFunctionality}
procedure TImageFunctionality__UpdateDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TImageFunctionality.UpdateDATA;
begin
TImageFunctionality__UpdateDATA(Self);
end;

procedure TImageFunctionality__ClearDATA(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TImageFunctionality.ClearDATA;
begin
TImageFunctionality__ClearDATA(Self);
end;

procedure TImageFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TImageFunctionality._ToClone(out idClone: integer);
begin
TImageFunctionality___ToClone(Self,   idClone);
end;

procedure TImageFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall; external TypesDLL;
procedure TImageFunctionality.LoadFromFile(const FileName: string);
begin
TImageFunctionality__LoadFromFile(Self,   FileName);
end;

function TImageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TImageFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TImageFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TImageFunctionality___GetDataDocument(Functionality: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external TypesDLL;
function TImageFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Result:=TImageFunctionality___GetDataDocument(Self,   DataModel,DataType,flWithComponents,Document);
end;

function TImageFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TImageFunctionality.getName: string;
begin
Result:=TImageFunctionality__getName(Self);
end;

function TImageFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TImageFunctionality.getHint: string;
begin
Result:=TImageFunctionality__getHint(Self);
end;

function TImageFunctionality__GetDATAType(Functionality: TFunctionality): TImageDATAType; stdcall; external TypesDLL;
function TImageFunctionality.GetDATAType: TImageDATAType;
begin
Result:=TImageFunctionality__GetDATAType(Self);
end;

function TImageFunctionality__GetDATAType1(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TImageFunctionality.GetDATAType1: integer;
begin
Result:=TImageFunctionality__GetDATAType1(Self);
end;

procedure TImageFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall; external TypesDLL;
procedure TImageFunctionality.GetDATA(out DATAStream: TClientBlobStream; out DATAType: TImageDATAType);
begin
TImageFunctionality__GetDATA(Self,   DATAStream,DATAType);
end;

procedure TImageFunctionality__GetDATA1(Functionality: TFunctionality;   out DATAStream: TByteArray; out DATAType: Integer); stdcall; external TypesDLL;
procedure TImageFunctionality.GetDATA1(out DATAStream: TByteArray; out DATAType: Integer);
begin
TImageFunctionality__GetDATA1(Self,   DATAStream,DATAType);
end;

procedure TImageFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall; external TypesDLL;
procedure TImageFunctionality.SetDATA(DATAStream: TMemoryStream; const DATAType: TImageDATAType);
begin
TImageFunctionality__SetDATA(Self,   DATAStream,DATAType);
end;

procedure TImageFunctionality__SetDATA1(Functionality: TFunctionality;   DATAStream: TByteArray; const DATAType: Integer); stdcall; external TypesDLL;
procedure TImageFunctionality.SetDATA1(DATAStream: TByteArray; const DATAType: Integer);
begin
TImageFunctionality__SetDATA1(Self,   DATAStream,DATAType);
end;

procedure TImageFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall; external TypesDLL;
procedure TImageFunctionality.GetBitmapDATA(out BMPDATAStream: TMemoryStream);
begin
TImageFunctionality__GetBitmapDATA(Self,   BMPDATAStream);
end;

procedure TImageFunctionality__GetBitmapDATA1(Functionality: TFunctionality;   out BMPDATAStream: TByteArray); stdcall; external TypesDLL;
procedure TImageFunctionality.GetBitmapDATA1(out BMPDATAStream: TByteArray);
begin
TImageFunctionality__GetBitmapDATA1(Self,   BMPDATAStream);
end;


{TTWellFunctionality}
function TTWellFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTWellFunctionality._CreateInstance: integer;
begin
Result:=TTWellFunctionality___CreateInstance(Self);
end;

procedure TTWellFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTWellFunctionality._DestroyInstance(const idObj: integer);
begin
TTWellFunctionality___DestroyInstance(Self,   idObj);
end;

function TTWellFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTWellFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTWellFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTWellFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTWellFunctionality.getName: string;
begin
Result:=TTWellFunctionality__getName(Self);
end;

function TTWellFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTWellFunctionality.getImage: TTypeImage;
begin
Result:=TTWellFunctionality__getImage(Self);
end;


{TWellFunctionality}
procedure TWellFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TWellFunctionality._ToClone(out idClone: integer);
begin
TWellFunctionality___ToClone(Self,   idClone);
end;

function TWellFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TWellFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TWellFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWellFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWellFunctionality.getName: string;
begin
Result:=TWellFunctionality__getName(Self);
end;

function TWellFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TWellFunctionality.getHint: string;
begin
Result:=TWellFunctionality__getHint(Self);
end;


{TTBoxFunctionality}
function TTBoxFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTBoxFunctionality._CreateInstance: integer;
begin
Result:=TTBoxFunctionality___CreateInstance(Self);
end;

procedure TTBoxFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTBoxFunctionality._DestroyInstance(const idObj: integer);
begin
TTBoxFunctionality___DestroyInstance(Self,   idObj);
end;

function TTBoxFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTBoxFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTBoxFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTBoxFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTBoxFunctionality.getName: string;
begin
Result:=TTBoxFunctionality__getName(Self);
end;

function TTBoxFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTBoxFunctionality.getImage: TTypeImage;
begin
Result:=TTBoxFunctionality__getImage(Self);
end;


{TBoxFunctionality}
procedure TBoxFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TBoxFunctionality._ToClone(out idClone: integer);
begin
TBoxFunctionality___ToClone(Self,   idClone);
end;

function TBoxFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TBoxFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TBoxFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBoxFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TBoxFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TBoxFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TBoxFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBoxFunctionality.getName: string;
begin
Result:=TBoxFunctionality__getName(Self);
end;

function TBoxFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TBoxFunctionality.getHint: string;
begin
Result:=TBoxFunctionality__getHint(Self);
end;


{TTCableBoxFunctionality}
function TTCableBoxFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCableBoxFunctionality._CreateInstance: integer;
begin
Result:=TTCableBoxFunctionality___CreateInstance(Self);
end;

procedure TTCableBoxFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCableBoxFunctionality._DestroyInstance(const idObj: integer);
begin
TTCableBoxFunctionality___DestroyInstance(Self,   idObj);
end;

function TTCableBoxFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCableBoxFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCableBoxFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCableBoxFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCableBoxFunctionality.getName: string;
begin
Result:=TTCableBoxFunctionality__getName(Self);
end;

function TTCableBoxFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCableBoxFunctionality.getImage: TTypeImage;
begin
Result:=TTCableBoxFunctionality__getImage(Self);
end;


{TCableBoxFunctionality}
procedure TCableBoxFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCableBoxFunctionality._ToClone(out idClone: integer);
begin
TCableBoxFunctionality___ToClone(Self,   idClone);
end;

function TCableBoxFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCableBoxFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCableBoxFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCableBoxFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCableBoxFunctionality.getName: string;
begin
Result:=TCableBoxFunctionality__getName(Self);
end;

function TCableBoxFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCableBoxFunctionality.getHint: string;
begin
Result:=TCableBoxFunctionality__getHint(Self);
end;


{TTDistrLineFunctionality}
function TTDistrLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDistrLineFunctionality._CreateInstance: integer;
begin
Result:=TTDistrLineFunctionality___CreateInstance(Self);
end;

procedure TTDistrLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTDistrLineFunctionality._DestroyInstance(const idObj: integer);
begin
TTDistrLineFunctionality___DestroyInstance(Self,   idObj);
end;

function TTDistrLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDistrLineFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTDistrLineFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTDistrLineFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDistrLineFunctionality.getName: string;
begin
Result:=TTDistrLineFunctionality__getName(Self);
end;

function TTDistrLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDistrLineFunctionality.getImage: TTypeImage;
begin
Result:=TTDistrLineFunctionality__getImage(Self);
end;


{TDistrLineFunctionality}
procedure TDistrLineFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDistrLineFunctionality._ToClone(out idClone: integer);
begin
TDistrLineFunctionality___ToClone(Self,   idClone);
end;

function TDistrLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDistrLineFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TDistrLineFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDistrLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TDistrLineFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TDistrLineFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TDistrLineFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDistrLineFunctionality.getName: string;
begin
Result:=TDistrLineFunctionality__getName(Self);
end;

function TDistrLineFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDistrLineFunctionality.getHint: string;
begin
Result:=TDistrLineFunctionality__getHint(Self);
end;


{TTClientFunctionality}
function TTClientFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTClientFunctionality._CreateInstance: integer;
begin
Result:=TTClientFunctionality___CreateInstance(Self);
end;

procedure TTClientFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTClientFunctionality._DestroyInstance(const idObj: integer);
begin
TTClientFunctionality___DestroyInstance(Self,   idObj);
end;

function TTClientFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTClientFunctionality.getName: string;
begin
Result:=TTClientFunctionality__getName(Self);
end;

function TTClientFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTClientFunctionality.getImage: TTypeImage;
begin
Result:=TTClientFunctionality__getImage(Self);
end;

function TTClientFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTClientFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTClientFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

procedure TTClientFunctionality__GetInstanceList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TTClientFunctionality.GetInstanceList(out List: TList);
begin
TTClientFunctionality__GetInstanceList(Self,   List);
end;

procedure TTClientFunctionality__GetInstanceList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TTClientFunctionality.GetInstanceList1(out List: TByteArray);
begin
TTClientFunctionality__GetInstanceList1(Self,   List);
end;


{TClientFunctionality}
procedure TClientFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TClientFunctionality._ToClone(out idClone: integer);
begin
TClientFunctionality___ToClone(Self,   idClone);
end;

function TClientFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TClientFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TClientFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TClientFunctionality__GetDebet(Functionality: TFunctionality;   out Value: Double): boolean; stdcall; external TypesDLL;
function TClientFunctionality.GetDebet(out Value: Double): boolean;
begin
Result:=TClientFunctionality__GetDebet(Self,   Value);
end;

function TClientFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TClientFunctionality.getName: string;
begin
Result:=TClientFunctionality__getName(Self);
end;

function TClientFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TClientFunctionality.getHint: string;
begin
Result:=TClientFunctionality__getHint(Self);
end;


{TTHouseFunctionality}
function TTHouseFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHouseFunctionality._CreateInstance: integer;
begin
Result:=TTHouseFunctionality___CreateInstance(Self);
end;

procedure TTHouseFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTHouseFunctionality._DestroyInstance(const idObj: integer);
begin
TTHouseFunctionality___DestroyInstance(Self,   idObj);
end;

function TTHouseFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHouseFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHouseFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHouseFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHouseFunctionality.getName: string;
begin
Result:=TTHouseFunctionality__getName(Self);
end;

function TTHouseFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHouseFunctionality.getImage: TTypeImage;
begin
Result:=TTHouseFunctionality__getImage(Self);
end;


{THouseFunctionality}
procedure THouseFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THouseFunctionality._ToClone(out idClone: integer);
begin
THouseFunctionality___ToClone(Self,   idClone);
end;

function THouseFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THouseFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=THouseFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THouseFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function THouseFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=THouseFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function THouseFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THouseFunctionality.getName: string;
begin
Result:=THouseFunctionality__getName(Self);
end;

function THouseFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THouseFunctionality.getHint: string;
begin
Result:=THouseFunctionality__getHint(Self);
end;


{TTCommNodeFunctionality}
function TTCommNodeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCommNodeFunctionality._CreateInstance: integer;
begin
Result:=TTCommNodeFunctionality___CreateInstance(Self);
end;

procedure TTCommNodeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCommNodeFunctionality._DestroyInstance(const idObj: integer);
begin
TTCommNodeFunctionality___DestroyInstance(Self,   idObj);
end;

function TTCommNodeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCommNodeFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCommNodeFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCommNodeFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCommNodeFunctionality.getName: string;
begin
Result:=TTCommNodeFunctionality__getName(Self);
end;

function TTCommNodeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCommNodeFunctionality.getImage: TTypeImage;
begin
Result:=TTCommNodeFunctionality__getImage(Self);
end;


{TCommNodeFunctionality}
procedure TCommNodeFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCommNodeFunctionality._ToClone(out idClone: integer);
begin
TCommNodeFunctionality___ToClone(Self,   idClone);
end;

function TCommNodeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCommNodeFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCommNodeFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCommNodeFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCommNodeFunctionality.getName: string;
begin
Result:=TCommNodeFunctionality__getName(Self);
end;

function TCommNodeFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCommNodeFunctionality.getHint: string;
begin
Result:=TCommNodeFunctionality__getHint(Self);
end;


{TTCrossFunctionality}
function TTCrossFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCrossFunctionality._CreateInstance: integer;
begin
Result:=TTCrossFunctionality___CreateInstance(Self);
end;

procedure TTCrossFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCrossFunctionality._DestroyInstance(const idObj: integer);
begin
TTCrossFunctionality___DestroyInstance(Self,   idObj);
end;

function TTCrossFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCrossFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCrossFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCrossFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCrossFunctionality.getName: string;
begin
Result:=TTCrossFunctionality__getName(Self);
end;

function TTCrossFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCrossFunctionality.getImage: TTypeImage;
begin
Result:=TTCrossFunctionality__getImage(Self);
end;


{TCrossFunctionality}
procedure TCrossFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCrossFunctionality._ToClone(out idClone: integer);
begin
TCrossFunctionality___ToClone(Self,   idClone);
end;

function TCrossFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCrossFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCrossFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCrossFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCrossFunctionality.getName: string;
begin
Result:=TCrossFunctionality__getName(Self);
end;

function TCrossFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCrossFunctionality.getHint: string;
begin
Result:=TCrossFunctionality__getHint(Self);
end;


{TTCaseFunctionality}
function TTCaseFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCaseFunctionality._CreateInstance: integer;
begin
Result:=TTCaseFunctionality___CreateInstance(Self);
end;

procedure TTCaseFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCaseFunctionality._DestroyInstance(const idObj: integer);
begin
TTCaseFunctionality___DestroyInstance(Self,   idObj);
end;

function TTCaseFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCaseFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCaseFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCaseFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCaseFunctionality.getName: string;
begin
Result:=TTCaseFunctionality__getName(Self);
end;

function TTCaseFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCaseFunctionality.getImage: TTypeImage;
begin
Result:=TTCaseFunctionality__getImage(Self);
end;


{TCaseFunctionality}
procedure TCaseFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCaseFunctionality._ToClone(out idClone: integer);
begin
TCaseFunctionality___ToClone(Self,   idClone);
end;

function TCaseFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCaseFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCaseFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCaseFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCaseFunctionality.getName: string;
begin
Result:=TCaseFunctionality__getName(Self);
end;

function TCaseFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCaseFunctionality.getHint: string;
begin
Result:=TCaseFunctionality__getHint(Self);
end;


{TTStreetFunctionality}
function TTStreetFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTStreetFunctionality._CreateInstance: integer;
begin
Result:=TTStreetFunctionality___CreateInstance(Self);
end;

procedure TTStreetFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTStreetFunctionality._DestroyInstance(const idObj: integer);
begin
TTStreetFunctionality___DestroyInstance(Self,   idObj);
end;

function TTStreetFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTStreetFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTStreetFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTStreetFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTStreetFunctionality.getName: string;
begin
Result:=TTStreetFunctionality__getName(Self);
end;

function TTStreetFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTStreetFunctionality.getImage: TTypeImage;
begin
Result:=TTStreetFunctionality__getImage(Self);
end;


{TStreetFunctionality}
procedure TStreetFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TStreetFunctionality._ToClone(out idClone: integer);
begin
TStreetFunctionality___ToClone(Self,   idClone);
end;

function TStreetFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TStreetFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TStreetFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TStreetFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TStreetFunctionality.getName: string;
begin
Result:=TStreetFunctionality__getName(Self);
end;

function TStreetFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TStreetFunctionality.getHint: string;
begin
Result:=TStreetFunctionality__getHint(Self);
end;


{TTOtherObjFunctionality}
function TTOtherObjFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOtherObjFunctionality._CreateInstance: integer;
begin
Result:=TTOtherObjFunctionality___CreateInstance(Self);
end;

procedure TTOtherObjFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTOtherObjFunctionality._DestroyInstance(const idObj: integer);
begin
TTOtherObjFunctionality___DestroyInstance(Self,   idObj);
end;

function TTOtherObjFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOtherObjFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOtherObjFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOtherObjFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOtherObjFunctionality.getName: string;
begin
Result:=TTOtherObjFunctionality__getName(Self);
end;

function TTOtherObjFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOtherObjFunctionality.getImage: TTypeImage;
begin
Result:=TTOtherObjFunctionality__getImage(Self);
end;


{TOtherObjFunctionality}
procedure TOtherObjFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOtherObjFunctionality._ToClone(out idClone: integer);
begin
TOtherObjFunctionality___ToClone(Self,   idClone);
end;

function TOtherObjFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOtherObjFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOtherObjFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOtherObjFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOtherObjFunctionality.getName: string;
begin
Result:=TOtherObjFunctionality__getName(Self);
end;

function TOtherObjFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOtherObjFunctionality.getHint: string;
begin
Result:=TOtherObjFunctionality__getHint(Self);
end;


{TTSpanFunctionality}
function TTSpanFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTSpanFunctionality._CreateInstance: integer;
begin
Result:=TTSpanFunctionality___CreateInstance(Self);
end;

procedure TTSpanFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTSpanFunctionality._DestroyInstance(const idObj: integer);
begin
TTSpanFunctionality___DestroyInstance(Self,   idObj);
end;

function TTSpanFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTSpanFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTSpanFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTSpanFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTSpanFunctionality.getName: string;
begin
Result:=TTSpanFunctionality__getName(Self);
end;

function TTSpanFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTSpanFunctionality.getImage: TTypeImage;
begin
Result:=TTSpanFunctionality__getImage(Self);
end;


{TSpanFunctionality}
procedure TSpanFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TSpanFunctionality._ToClone(out idClone: integer);
begin
TSpanFunctionality___ToClone(Self,   idClone);
end;

function TSpanFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TSpanFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TSpanFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSpanFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSpanFunctionality.getName: string;
begin
Result:=TSpanFunctionality__getName(Self);
end;

function TSpanFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TSpanFunctionality.getHint: string;
begin
Result:=TSpanFunctionality__getHint(Self);
end;


{TTChanelFunctionality}
function TTChanelFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTChanelFunctionality._CreateInstance: integer;
begin
Result:=TTChanelFunctionality___CreateInstance(Self);
end;

procedure TTChanelFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTChanelFunctionality._DestroyInstance(const idObj: integer);
begin
TTChanelFunctionality___DestroyInstance(Self,   idObj);
end;

function TTChanelFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTChanelFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTChanelFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTChanelFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTChanelFunctionality.getName: string;
begin
Result:=TTChanelFunctionality__getName(Self);
end;

function TTChanelFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTChanelFunctionality.getImage: TTypeImage;
begin
Result:=TTChanelFunctionality__getImage(Self);
end;


{TChanelFunctionality}
procedure TChanelFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TChanelFunctionality._ToClone(out idClone: integer);
begin
TChanelFunctionality___ToClone(Self,   idClone);
end;

function TChanelFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TChanelFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TChanelFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TChanelFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TChanelFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TChanelFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TChanelFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TChanelFunctionality.getName: string;
begin
Result:=TChanelFunctionality__getName(Self);
end;

function TChanelFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TChanelFunctionality.getHint: string;
begin
Result:=TChanelFunctionality__getHint(Self);
end;


{TTHandHoldFunctionality}
function TTHandHoldFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTHandHoldFunctionality._CreateInstance: integer;
begin
Result:=TTHandHoldFunctionality___CreateInstance(Self);
end;

procedure TTHandHoldFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTHandHoldFunctionality._DestroyInstance(const idObj: integer);
begin
TTHandHoldFunctionality___DestroyInstance(Self,   idObj);
end;

function TTHandHoldFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTHandHoldFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTHandHoldFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTHandHoldFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTHandHoldFunctionality.getName: string;
begin
Result:=TTHandHoldFunctionality__getName(Self);
end;

function TTHandHoldFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTHandHoldFunctionality.getImage: TTypeImage;
begin
Result:=TTHandHoldFunctionality__getImage(Self);
end;


{THandHoldFunctionality}
procedure THandHoldFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure THandHoldFunctionality._ToClone(out idClone: integer);
begin
THandHoldFunctionality___ToClone(Self,   idClone);
end;

function THandHoldFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function THandHoldFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=THandHoldFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THandHoldFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THandHoldFunctionality.getName: string;
begin
Result:=THandHoldFunctionality__getName(Self);
end;

function THandHoldFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function THandHoldFunctionality.getHint: string;
begin
Result:=THandHoldFunctionality__getHint(Self);
end;


{TTLineDistFunctionality}
function TTLineDistFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTLineDistFunctionality._CreateInstance: integer;
begin
Result:=TTLineDistFunctionality___CreateInstance(Self);
end;

procedure TTLineDistFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTLineDistFunctionality._DestroyInstance(const idObj: integer);
begin
TTLineDistFunctionality___DestroyInstance(Self,   idObj);
end;

function TTLineDistFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTLineDistFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTLineDistFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTLineDistFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTLineDistFunctionality.getName: string;
begin
Result:=TTLineDistFunctionality__getName(Self);
end;

function TTLineDistFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTLineDistFunctionality.getImage: TTypeImage;
begin
Result:=TTLineDistFunctionality__getImage(Self);
end;


{TLineDistFunctionality}
procedure TLineDistFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TLineDistFunctionality._ToClone(out idClone: integer);
begin
TLineDistFunctionality___ToClone(Self,   idClone);
end;

function TLineDistFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TLineDistFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TLineDistFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLineDistFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TLineDistFunctionality.getName: string;
begin
Result:=TLineDistFunctionality__getName(Self);
end;

function TLineDistFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TLineDistFunctionality.getHint: string;
begin
Result:=TLineDistFunctionality__getHint(Self);
end;


{TTMuffFunctionality}
function TTMuffFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTMuffFunctionality._CreateInstance: integer;
begin
Result:=TTMuffFunctionality___CreateInstance(Self);
end;

procedure TTMuffFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTMuffFunctionality._DestroyInstance(const idObj: integer);
begin
TTMuffFunctionality___DestroyInstance(Self,   idObj);
end;

function TTMuffFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTMuffFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTMuffFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTMuffFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTMuffFunctionality.getName: string;
begin
Result:=TTMuffFunctionality__getName(Self);
end;

function TTMuffFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTMuffFunctionality.getImage: TTypeImage;
begin
Result:=TTMuffFunctionality__getImage(Self);
end;


{TMuffFunctionality}
procedure TMuffFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TMuffFunctionality._ToClone(out idClone: integer);
begin
TMuffFunctionality___ToClone(Self,   idClone);
end;

function TMuffFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TMuffFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TMuffFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMuffFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMuffFunctionality.getName: string;
begin
Result:=TMuffFunctionality__getName(Self);
end;

function TMuffFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TMuffFunctionality.getHint: string;
begin
Result:=TMuffFunctionality__getHint(Self);
end;


{TTOfferFunctionality}
function TTOfferFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTOfferFunctionality._CreateInstance: integer;
begin
Result:=TTOfferFunctionality___CreateInstance(Self);
end;

procedure TTOfferFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTOfferFunctionality._DestroyInstance(const idObj: integer);
begin
TTOfferFunctionality___DestroyInstance(Self,   idObj);
end;

function TTOfferFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTOfferFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTOfferFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTOfferFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTOfferFunctionality.getName: string;
begin
Result:=TTOfferFunctionality__getName(Self);
end;

function TTOfferFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTOfferFunctionality.getImage: TTypeImage;
begin
Result:=TTOfferFunctionality__getImage(Self);
end;

function TTOfferFunctionality__GetOfferByHumanID(Functionality: TFunctionality;   const HumanID: integer; out idOffer: integer): boolean; stdcall; external TypesDLL;
function TTOfferFunctionality.GetOfferByHumanID(const HumanID: integer; out idOffer: integer): boolean;
begin
Result:=TTOfferFunctionality__GetOfferByHumanID(Self,   HumanID,idOffer);
end;


{TOfferFunctionality}
procedure TOfferFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TOfferFunctionality._ToClone(out idClone: integer);
begin
TOfferFunctionality___ToClone(Self,   idClone);
end;

function TOfferFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TOfferFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TOfferFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOfferFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TOfferFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TOfferFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TOfferFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferFunctionality.getName: string;
begin
Result:=TOfferFunctionality__getName(Self);
end;

procedure TOfferFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOfferFunctionality.setName(Value: string);
begin
TOfferFunctionality__setName(Self,   Value);
end;

function TOfferFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferFunctionality.getHint: string;
begin
Result:=TOfferFunctionality__getHint(Self);
end;

function TOfferFunctionality__getSchedule(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferFunctionality.getSchedule: string;
begin
Result:=TOfferFunctionality__getSchedule(Self);
end;

procedure TOfferFunctionality__setSchedule(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOfferFunctionality.setSchedule(Value: string);
begin
TOfferFunctionality__setSchedule(Self,   Value);
end;

function TOfferFunctionality__getPassword(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferFunctionality.getPassword: string;
begin
Result:=TOfferFunctionality__getPassword(Self);
end;

procedure TOfferFunctionality__setPassword(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TOfferFunctionality.setPassword(Value: string);
begin
TOfferFunctionality__setPassword(Self,   Value);
end;

function TOfferFunctionality__getContactTLF(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferFunctionality.getContactTLF: integer;
begin
Result:=TOfferFunctionality__getContactTLF(Self);
end;

procedure TOfferFunctionality__setContactTLF(Functionality: TFunctionality;   Value: integer); stdcall; external TypesDLL;
procedure TOfferFunctionality.setContactTLF(Value: integer);
begin
TOfferFunctionality__setContactTLF(Self,   Value);
end;

function TOfferFunctionality__getLastUpdated(Functionality: TFunctionality): TDateTime; stdcall; external TypesDLL;
function TOfferFunctionality.getLastUpdated: TDateTime;
begin
Result:=TOfferFunctionality__getLastUpdated(Self);
end;

procedure TOfferFunctionality__setLastUpdated(Functionality: TFunctionality;   Value: TDateTime); stdcall; external TypesDLL;
procedure TOfferFunctionality.setLastUpdated(Value: TDateTime);
begin
TOfferFunctionality__setLastUpdated(Self,   Value);
end;

procedure TOfferFunctionality__LoadDATAFromStream(Functionality: TFunctionality;   Stream: TStream); stdcall; external TypesDLL;
procedure TOfferFunctionality.LoadDATAFromStream(Stream: TStream);
begin
TOfferFunctionality__LoadDATAFromStream(Self,   Stream);
end;

procedure TOfferFunctionality__LoadDATAFromStream1(Functionality: TFunctionality;   Stream: TByteArray); stdcall; external TypesDLL;
procedure TOfferFunctionality.LoadDATAFromStream1(Stream: TByteArray);
begin
TOfferFunctionality__LoadDATAFromStream1(Self,   Stream);
end;

function TOfferFunctionality__UserID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferFunctionality.UserID: integer;
begin
Result:=TOfferFunctionality__UserID(Self);
end;

function TOfferFunctionality__UID(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferFunctionality.UID: integer;
begin
Result:=TOfferFunctionality__UID(Self);
end;

function TOfferFunctionality__AddressStr(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TOfferFunctionality.AddressStr: string;
begin
Result:=TOfferFunctionality__AddressStr(Self);
end;

function TOfferFunctionality__Goods_Insert(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TOfferFunctionality.Goods_Insert: integer;
begin
Result:=TOfferFunctionality__Goods_Insert(Self);
end;

procedure TOfferFunctionality__Goods_GetList(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TOfferFunctionality.Goods_GetList(out List: TList);
begin
TOfferFunctionality__Goods_GetList(Self,   List);
end;

procedure TOfferFunctionality__Goods_GetList1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TOfferFunctionality.Goods_GetList1(out List: TByteArray);
begin
TOfferFunctionality__Goods_GetList1(Self,   List);
end;

procedure TOfferFunctionality__Goods_Remove(Functionality: TFunctionality;   const idOfferGoods: integer); stdcall; external TypesDLL;
procedure TOfferFunctionality.Goods_Remove(const idOfferGoods: integer);
begin
TOfferFunctionality__Goods_Remove(Self,   idOfferGoods);
end;

procedure TOfferFunctionality__Goods_Clear(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TOfferFunctionality.Goods_Clear;
begin
TOfferFunctionality__Goods_Clear(Self);
end;


{TTDemandFunctionality}
function TTDemandFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTDemandFunctionality._CreateInstance: integer;
begin
Result:=TTDemandFunctionality___CreateInstance(Self);
end;

procedure TTDemandFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTDemandFunctionality._DestroyInstance(const idObj: integer);
begin
TTDemandFunctionality___DestroyInstance(Self,   idObj);
end;

function TTDemandFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTDemandFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTDemandFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTDemandFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTDemandFunctionality.getName: string;
begin
Result:=TTDemandFunctionality__getName(Self);
end;

function TTDemandFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTDemandFunctionality.getImage: TTypeImage;
begin
Result:=TTDemandFunctionality__getImage(Self);
end;


{TDemandFunctionality}
procedure TDemandFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TDemandFunctionality._ToClone(out idClone: integer);
begin
TDemandFunctionality___ToClone(Self,   idClone);
end;

function TDemandFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TDemandFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TDemandFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDemandFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TDemandFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TDemandFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TDemandFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDemandFunctionality.getName: string;
begin
Result:=TDemandFunctionality__getName(Self);
end;

function TDemandFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TDemandFunctionality.getHint: string;
begin
Result:=TDemandFunctionality__getHint(Self);
end;


{TTCommLineFunctionality}
function TTCommLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCommLineFunctionality._CreateInstance: integer;
begin
Result:=TTCommLineFunctionality___CreateInstance(Self);
end;

procedure TTCommLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCommLineFunctionality._DestroyInstance(const idObj: integer);
begin
TTCommLineFunctionality___DestroyInstance(Self,   idObj);
end;

function TTCommLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCommLineFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCommLineFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCommLineFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCommLineFunctionality.getName: string;
begin
Result:=TTCommLineFunctionality__getName(Self);
end;

function TTCommLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCommLineFunctionality.getImage: TTypeImage;
begin
Result:=TTCommLineFunctionality__getImage(Self);
end;


{TCommLineFunctionality}
procedure TCommLineFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCommLineFunctionality._ToClone(out idClone: integer);
begin
TCommLineFunctionality___ToClone(Self,   idClone);
end;

function TCommLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCommLineFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCommLineFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCommLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external TypesDLL;
function TCommLineFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TCommLineFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

function TCommLineFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCommLineFunctionality.getName: string;
begin
Result:=TCommLineFunctionality__getName(Self);
end;

function TCommLineFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCommLineFunctionality.getHint: string;
begin
Result:=TCommLineFunctionality__getHint(Self);
end;


{TTGoodsFunctionality}
function TTGoodsFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTGoodsFunctionality._CreateInstance: integer;
begin
Result:=TTGoodsFunctionality___CreateInstance(Self);
end;

procedure TTGoodsFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTGoodsFunctionality._DestroyInstance(const idObj: integer);
begin
TTGoodsFunctionality___DestroyInstance(Self,   idObj);
end;

function TTGoodsFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTGoodsFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTGoodsFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTGoodsFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTGoodsFunctionality.getName: string;
begin
Result:=TTGoodsFunctionality__getName(Self);
end;

function TTGoodsFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTGoodsFunctionality.getImage: TTypeImage;
begin
Result:=TTGoodsFunctionality__getImage(Self);
end;

procedure TTGoodsFunctionality__GetInstanceListContainingContext(Functionality: TFunctionality;   const Context: string; out List: TStringList); stdcall; external TypesDLL;
procedure TTGoodsFunctionality.GetInstanceListContainingContext(const Context: string; out List: TStringList);
begin
TTGoodsFunctionality__GetInstanceListContainingContext(Self,   Context,List);
end;

procedure TTGoodsFunctionality__GetInstanceListContainingContext1(Functionality: TFunctionality;   const Context: string; out List: TByteArray); stdcall; external TypesDLL;
procedure TTGoodsFunctionality.GetInstanceListContainingContext1(const Context: string; out List: TByteArray);
begin
TTGoodsFunctionality__GetInstanceListContainingContext1(Self,   Context,List);
end;

function TTGoodsFunctionality__IsInstanceExist(Functionality: TFunctionality;   const pName: string; out idGoods: integer): boolean; stdcall; external TypesDLL;
function TTGoodsFunctionality.IsInstanceExist(const pName: string; out idGoods: integer): boolean;
begin
Result:=TTGoodsFunctionality__IsInstanceExist(Self,   pName,idGoods);
end;


{TGoodsFunctionality}
procedure TGoodsFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TGoodsFunctionality._ToClone(out idClone: integer);
begin
TGoodsFunctionality___ToClone(Self,   idClone);
end;

function TGoodsFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TGoodsFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TGoodsFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGoodsFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGoodsFunctionality.getName: string;
begin
Result:=TGoodsFunctionality__getName(Self);
end;

procedure TGoodsFunctionality__setName(Functionality: TFunctionality;   Value: string); stdcall; external TypesDLL;
procedure TGoodsFunctionality.setName(Value: string);
begin
TGoodsFunctionality__setName(Self,   Value);
end;

function TGoodsFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGoodsFunctionality.getHint: string;
begin
Result:=TGoodsFunctionality__getHint(Self);
end;

function TGoodsFunctionality__StdAmount(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TGoodsFunctionality.StdAmount: integer;
begin
Result:=TGoodsFunctionality__StdAmount(Self);
end;

function TGoodsFunctionality__StdMeasureUnit(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TGoodsFunctionality.StdMeasureUnit: string;
begin
Result:=TGoodsFunctionality__StdMeasureUnit(Self);
end;


{TTCollectionFunctionality}
function TTCollectionFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall; external TypesDLL;
function TTCollectionFunctionality._CreateInstance: integer;
begin
Result:=TTCollectionFunctionality___CreateInstance(Self);
end;

procedure TTCollectionFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall; external TypesDLL;
procedure TTCollectionFunctionality._DestroyInstance(const idObj: integer);
begin
TTCollectionFunctionality___DestroyInstance(Self,   idObj);
end;

function TTCollectionFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external TypesDLL;
function TTCollectionFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTCollectionFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTCollectionFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TTCollectionFunctionality.getName: string;
begin
Result:=TTCollectionFunctionality__getName(Self);
end;

function TTCollectionFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall; external TypesDLL;
function TTCollectionFunctionality.getImage: TTypeImage;
begin
Result:=TTCollectionFunctionality__getImage(Self);
end;


{TCollectionFunctionality}
procedure TCollectionFunctionality___ToClone(Functionality: TFunctionality;   out idClone: integer); stdcall; external TypesDLL;
procedure TCollectionFunctionality._ToClone(out idClone: integer);
begin
TCollectionFunctionality___ToClone(Self,   idClone);
end;

function TCollectionFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external TypesDLL;
function TCollectionFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TCollectionFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCollectionFunctionality__getName(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCollectionFunctionality.getName: string;
begin
Result:=TCollectionFunctionality__getName(Self);
end;

procedure TCollectionFunctionality__setName(Functionality: TFunctionality;   const Value: string); stdcall; external TypesDLL;
procedure TCollectionFunctionality.setName(const Value: string);
begin
TCollectionFunctionality__setName(Self,   Value);
end;

function TCollectionFunctionality__getHint(Functionality: TFunctionality): string; stdcall; external TypesDLL;
function TCollectionFunctionality.getHint: string;
begin
Result:=TCollectionFunctionality__getHint(Self);
end;

function TCollectionFunctionality__InsertItem(Functionality: TFunctionality;   const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer; stdcall; external TypesDLL;
function TCollectionFunctionality.InsertItem(const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer;
begin
Result:=TCollectionFunctionality__InsertItem(Self,   idTItem,idItem,Alias,ListOrder);
end;

procedure TCollectionFunctionality__RemoveItem(Functionality: TFunctionality;   const id: integer); stdcall; external TypesDLL;
procedure TCollectionFunctionality.RemoveItem(const id: integer);
begin
TCollectionFunctionality__RemoveItem(Self,   id);
end;

procedure TCollectionFunctionality__Item_ChangeAlias(Functionality: TFunctionality;   const id: integer; const pAlias: string); stdcall; external TypesDLL;
procedure TCollectionFunctionality.Item_ChangeAlias(const id: integer; const pAlias: string);
begin
TCollectionFunctionality__Item_ChangeAlias(Self,   id,pAlias);
end;

procedure TCollectionFunctionality__Item_ChangeListOrder(Functionality: TFunctionality;   const id: integer; const Order: integer); stdcall; external TypesDLL;
procedure TCollectionFunctionality.Item_ChangeListOrder(const id: integer; const Order: integer);
begin
TCollectionFunctionality__Item_ChangeListOrder(Self,   id,Order);
end;

procedure TCollectionFunctionality__RemoveItems(Functionality: TFunctionality); stdcall; external TypesDLL;
procedure TCollectionFunctionality.RemoveItems;
begin
TCollectionFunctionality__RemoveItems(Self);
end;

function TCollectionFunctionality__IsItemExist(Functionality: TFunctionality;   const idTItem,idItem: integer): boolean; stdcall; external TypesDLL;
function TCollectionFunctionality.IsItemExist(const idTItem,idItem: integer): boolean;
begin
Result:=TCollectionFunctionality__IsItemExist(Self,   idTItem,idItem);
end;

procedure TCollectionFunctionality__GetListItems(Functionality: TFunctionality;   out List: TList); stdcall; external TypesDLL;
procedure TCollectionFunctionality.GetListItems(out List: TList);
begin
TCollectionFunctionality__GetListItems(Self,   List);
end;

procedure TCollectionFunctionality__GetListItems1(Functionality: TFunctionality;   out List: TByteArray); stdcall; external TypesDLL;
procedure TCollectionFunctionality.GetListItems1(out List: TByteArray);
begin
TCollectionFunctionality__GetListItems1(Self,   List);
end;

procedure TCollectionFunctionality__SaveListItems(Functionality: TFunctionality;   List: TList); stdcall; external TypesDLL;
procedure TCollectionFunctionality.SaveListItems(List: TList);
begin
TCollectionFunctionality__SaveListItems(Self,   List);
end;

procedure TCollectionFunctionality__SaveListItems1(Functionality: TFunctionality;   const List: TByteArray); stdcall; external TypesDLL;
procedure TCollectionFunctionality.SaveListItems1(const List: TByteArray);
begin
TCollectionFunctionality__SaveListItems1(Self,   List);
end;


