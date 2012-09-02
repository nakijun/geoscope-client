//. the export routines defines

{TTAGIFVisualizationFunctionality}
function TTAGIFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTAGIFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTAGIFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTAGIFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTAGIFVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTAGIFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TAGIFVisualizationFunctionality}
procedure TAGIFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TAGIFVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TAGIFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TAGIFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TAGIFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TAGIFVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TAGIFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TAGIFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

procedure TAGIFVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TMemoryStream); stdcall;

procedure TAGIFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;

procedure TAGIFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TAGIFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

function TAGIFVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;


{TTOrientedVIDEOVisualizationFunctionality}
function TTOrientedVIDEOVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOrientedVIDEOVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOrientedVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTOrientedVIDEOVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOrientedVIDEOVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTOrientedVIDEOVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOrientedVIDEOVisualizationFunctionality}
procedure TOrientedVIDEOVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TOrientedVIDEOVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TOrientedVIDEOVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOrientedVIDEOVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TOrientedVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TOrientedVIDEOVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TOrientedVIDEOVisualizationFunctionality__getDataServer(Functionality: TFunctionality): shortstring; stdcall;

procedure TOrientedVIDEOVisualizationFunctionality__setDataServer(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TOrientedVIDEOVisualizationFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedVIDEOVisualizationFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedVIDEOVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TOrientedVIDEOVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TOrientedVIDEOVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

function TOrientedVIDEOVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;


{TTVIDEOVisualizationFunctionality}
function TTVIDEOVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTVIDEOVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTVIDEOVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTVIDEOVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTVIDEOVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TVIDEOVisualizationFunctionality}
procedure TVIDEOVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TVIDEOVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TVIDEOVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TVIDEOVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TVIDEOVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TVIDEOVisualizationFunctionality__getDataServer(Functionality: TFunctionality): shortstring; stdcall;

procedure TVIDEOVisualizationFunctionality__setDataServer(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TVIDEOVisualizationFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall;

procedure TVIDEOVisualizationFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TVIDEOVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TVIDEOVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TVIDEOVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

function TVIDEOVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;


{TTOPPVisualizationFunctionality}
function TTOPPVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOPPVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOPPVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTOPPVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOPPVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTOPPVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOPPVisualizationFunctionality}
procedure TOPPVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TOPPVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TOPPVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOPPVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TOPPVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TOPPVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TOPPVisualizationFunctionality__getPropsPanel_idTObj(Functionality: TFunctionality): integer; stdcall;

procedure TOPPVisualizationFunctionality__setPropsPanel_idTObj(Functionality: TFunctionality;   Value: integer); stdcall;

function TOPPVisualizationFunctionality__getPropsPanel_idObj(Functionality: TFunctionality): integer; stdcall;

procedure TOPPVisualizationFunctionality__setPropsPanel_idObj(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOPPVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TOPPVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TOPPVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;


{TTMODELServerFunctionality}
function TTMODELServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMODELServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMODELServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMODELServerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTMODELServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMODELServerFunctionality__GetInstanceByIPAddress(Functionality: TFunctionality;   const IPAddress: string;  out id: integer): boolean; stdcall;


{TMODELServerFunctionality}
procedure TMODELServerFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TMODELServerFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TMODELServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMODELServerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

procedure TMODELServerFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TMODELServerFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TMODELServerFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer); stdcall;

function TMODELServerFunctionality__getIPAddress(Functionality: TFunctionality): shortstring; stdcall;

procedure TMODELServerFunctionality__setIPAddress(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TMODELServerFunctionality__IsUserExist(Functionality: TFunctionality;   const UserName,UserPassword: string): boolean; stdcall;

function TMODELServerFunctionality__IsOnLine(Functionality: TFunctionality): boolean; stdcall;

function TMODELServerFunctionality__Info(Functionality: TFunctionality): shortstring; stdcall;

procedure TMODELServerFunctionality__GetLicense(Functionality: TFunctionality;   out License: WideString); stdcall;


{TTCoReferenceFunctionality}
function TTCoReferenceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCoReferenceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCoReferenceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoReferenceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTCoReferenceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCoReferenceFunctionality}
procedure TCoReferenceFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TCoReferenceFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TCoReferenceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCoReferenceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

procedure TCoReferenceFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TCoReferenceFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TCoReferenceFunctionality__GetReferencedObject(Functionality: TFunctionality;   out idTReferencedObject,idReferencedObject: integer); stdcall;

procedure TCoReferenceFunctionality__SetReferencedObject(Functionality: TFunctionality;   const idTReferencedObject,idReferencedObject: integer); stdcall;

procedure TCoReferenceFunctionality__ShowReferencedObjectPanelProps(Functionality: TFunctionality); stdcall;


{TTPositionerFunctionality}
function TTPositionerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTPositionerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTPositionerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTPositionerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTPositionerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TPositionerFunctionality}
function TPositionerFunctionality__getPositionName(Functionality: TFunctionality): shortstring; stdcall;

procedure TPositionerFunctionality__setPositionName(Functionality: TFunctionality;   Value: shortstring); stdcall;

procedure TPositionerFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TPositionerFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TPositionerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TPositionerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TPositionerFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TPositionerFunctionality__Get2DPosition(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Extended); stdcall;

procedure TPositionerFunctionality__Save2DPosition(Functionality: TFunctionality;   Reflector: TReflector); stdcall;

procedure TPositionerFunctionality__SetPosition(Functionality: TFunctionality); stdcall;


{TTOrientedWMFVisualizationFunctionality}
function TTOrientedWMFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOrientedWMFVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTOrientedWMFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOrientedWMFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTOrientedWMFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOrientedWMFVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTOrientedWMFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOrientedWMFVisualizationFunctionality}
function TOrientedWMFVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedWMFVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

function TOrientedWMFVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Extended): boolean; stdcall;

procedure TOrientedWMFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TOrientedWMFVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TOrientedWMFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOrientedWMFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

procedure TOrientedWMFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;

function TOrientedWMFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TOrientedWMFVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TOrientedWMFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TOrientedWMFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TOrientedWMFVisualizationFunctionality__getWidth(Functionality: TFunctionality): Extended; stdcall;

procedure TOrientedWMFVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: Extended); stdcall;

function TOrientedWMFVisualizationFunctionality__getHeight(Functionality: TFunctionality): Extended; stdcall;

procedure TOrientedWMFVisualizationFunctionality__setHeight(Functionality: TFunctionality;   Value: Extended); stdcall;

function TOrientedWMFVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedWMFVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality__ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Extended); stdcall;

procedure TOrientedWMFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TOrientedWMFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

procedure TOrientedWMFVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall;

function TOrientedWMFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TOrientedWMFVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;


{TTCELLVisualizationFunctionality}
function TTCELLVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTCELLVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCELLVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTCELLVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTCELLVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTCELLVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TCELLVisualizationFunctionality}
function TCELLVisualizationFunctionality__getColCount(Functionality: TFunctionality): integer; stdcall;

procedure TCELLVisualizationFunctionality__setColCount(Functionality: TFunctionality;   Value: integer); stdcall;

function TCELLVisualizationFunctionality__getRowCount(Functionality: TFunctionality): integer; stdcall;

procedure TCELLVisualizationFunctionality__setRowCount(Functionality: TFunctionality;   Value: integer); stdcall;

function TCELLVisualizationFunctionality__getLineWidth(Functionality: TFunctionality): Extended; stdcall;

procedure TCELLVisualizationFunctionality__setLineWidth(Functionality: TFunctionality;   Value: Extended); stdcall;

function TCELLVisualizationFunctionality__getColSize(Functionality: TFunctionality): Extended; stdcall;

function TCELLVisualizationFunctionality__getRowSize(Functionality: TFunctionality): Extended; stdcall;

procedure TCELLVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TCELLVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TCELLVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCELLVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TCELLVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TCELLVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TCELLVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TCELLVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

procedure TCELLVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;

function TCELLVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TCELLVisualizationFunctionality__GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Extended); stdcall;

procedure TCELLVisualizationFunctionality__SetReflectorView(Functionality: TFunctionality); stdcall;

procedure TCELLVisualizationFunctionality__Change(Functionality: TFunctionality;   const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer); stdcall;


{TTEllipseVisualizationFunctionality}
function TTEllipseVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTEllipseVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTEllipseVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTEllipseVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTEllipseVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTEllipseVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TEllipseVisualizationFunctionality}
function TEllipseVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall;

procedure TEllipseVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TEllipseVisualizationFunctionality__getBorderColor(Functionality: TFunctionality): TColor; stdcall;

procedure TEllipseVisualizationFunctionality__setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TEllipseVisualizationFunctionality__getBorderWidth(Functionality: TFunctionality): Extended; stdcall;

procedure TEllipseVisualizationFunctionality__setBorderWidth(Functionality: TFunctionality;   Value: Extended); stdcall;

procedure TEllipseVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TEllipseVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TEllipseVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TEllipseVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TEllipseVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TEllipseVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TEllipseVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TEllipseVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

procedure TEllipseVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;

function TEllipseVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;


{TTWMFVisualizationFunctionality}
function TTWMFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTWMFVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTWMFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTWMFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTWMFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTWMFVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTWMFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TWMFVisualizationFunctionality}
function TWMFVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TWMFVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TWMFVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

procedure TWMFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TWMFVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TWMFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TWMFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TWMFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TWMFVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TWMFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TWMFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TWMFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TWMFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TWMFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TWMFVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;


{TTPictureVisualizationFunctionality}
function TTPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTPictureVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTPictureVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTPictureVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TPictureVisualizationFunctionality}
function TPictureVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TPictureVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TPictureVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

procedure TPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TPictureVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TPictureVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TPictureVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TPictureVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TPictureVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;


{TTRoundVisualizationFunctionality}
function TTRoundVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTRoundVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTRoundVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTRoundVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTRoundVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTRoundVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TRoundVisualizationFunctionality}
function TRoundVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall;

procedure TRoundVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TRoundVisualizationFunctionality__getBorderColor(Functionality: TFunctionality): TColor; stdcall;

procedure TRoundVisualizationFunctionality__setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TRoundVisualizationFunctionality__getBorderWidth(Functionality: TFunctionality): Extended; stdcall;

procedure TRoundVisualizationFunctionality__setBorderWidth(Functionality: TFunctionality;   Value: Extended); stdcall;

procedure TRoundVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TRoundVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TRoundVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TRoundVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TRoundVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TRoundVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TRoundVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TRoundVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

procedure TRoundVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;

function TRoundVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;


{TTGeodesyPointFunctionality}
function TTGeodesyPointFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGeodesyPointFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGeodesyPointFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGeodesyPointFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTGeodesyPointFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTGeodesyPointFunctionality__ConvertSpaceCRDToGeoCRD(Functionality: TFunctionality;   const X,Y: Extended; out Latitude,Longitude: Extended): boolean; stdcall;

function TTGeodesyPointFunctionality__ConvertGeoCRDToSpaceCRD(Functionality: TFunctionality;   const Latitude,Longitude: Extended; out X,Y: Extended): boolean; stdcall;


{TGeodesyPointFunctionality}
function TGeodesyPointFunctionality__getLatitude(Functionality: TFunctionality): Extended; stdcall;

procedure TGeodesyPointFunctionality__setLatitude(Functionality: TFunctionality;   Value: Extended); stdcall;

function TGeodesyPointFunctionality__getLongitude(Functionality: TFunctionality): Extended; stdcall;

procedure TGeodesyPointFunctionality__setLongitude(Functionality: TFunctionality;   Value: Extended); stdcall;

procedure TGeodesyPointFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TGeodesyPointFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TGeodesyPointFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TGeodesyPointFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TGeodesyPointFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTPrivateAreaVisualizationFunctionality}
function TTPrivateAreaVisualizationFunctionality__CanCreateAsDetail(Functionality: TFunctionality): boolean; stdcall;

function TTPrivateAreaVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTPrivateAreaVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTPrivateAreaVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTPrivateAreaVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTPrivateAreaVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTPrivateAreaVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TPrivateAreaVisualizationFunctionality}
procedure TPrivateAreaVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TPrivateAreaVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TPrivateAreaVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TPrivateAreaVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TPrivateAreaVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TPrivateAreaVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TPrivateAreaVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TPrivateAreaVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TPrivateAreaVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;


{TTHyperTextFunctionality}
function TTHyperTextFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTHyperTextFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTHyperTextFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHyperTextFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTHyperTextFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{THyperTextFunctionality}
procedure THyperTextFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function THyperTextFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function THyperTextFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function THyperTextFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function THyperTextFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure THyperTextFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream); stdcall;

procedure THyperTextFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure THyperTextFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure THyperTextFunctionality__SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;


{TTComponentsFindServiceFunctionality}
function TTComponentsFindServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTComponentsFindServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTComponentsFindServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTComponentsFindServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTComponentsFindServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TComponentsFindServiceFunctionality}
procedure TComponentsFindServiceFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TComponentsFindServiceFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TComponentsFindServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TComponentsFindServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TComponentsFindServiceFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTUsersServiceFunctionality}
function TTUsersServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTUsersServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTUsersServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTUsersServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTUsersServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TUsersServiceFunctionality}
procedure TUsersServiceFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TUsersServiceFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TUsersServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TUsersServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TUsersServiceFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTTransportServiceFunctionality}
function TTTransportServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTransportServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTransportServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTransportServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTTransportServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TTransportServiceFunctionality}
procedure TTransportServiceFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TTransportServiceFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TTransportServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTransportServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTransportServiceFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTMarketServiceFunctionality}
function TTMarketServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMarketServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMarketServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMarketServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTMarketServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMarketServiceFunctionality}
procedure TMarketServiceFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TMarketServiceFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TMarketServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMarketServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TMarketServiceFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTTelecomServiceFunctionality}
function TTTelecomServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTelecomServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTelecomServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTelecomServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTTelecomServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TTelecomServiceFunctionality}
procedure TTelecomServiceFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TTelecomServiceFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TTelecomServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTelecomServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTelecomServiceFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTWNDVisualizationFunctionality}
function TTWNDVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTWNDVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTWNDVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTWNDVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTWNDVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTWNDVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTWNDVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TWNDVisualizationFunctionality}
function TWNDVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TWNDVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TWNDVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

procedure TWNDVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TWNDVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TWNDVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TWNDVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TWNDVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TWNDVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TWNDVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TWNDVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TWNDVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TWNDVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TWNDVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TWNDVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;


{TTMRKVisualizationFunctionality}
function TTMRKVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTMRKVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTMRKVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMRKVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTMRKVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMRKVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTMRKVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TMRKVisualizationFunctionality}
function TMRKVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TMRKVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TMRKVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

procedure TMRKVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TMRKVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TMRKVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMRKVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TMRKVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TMRKVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TMRKVisualizationFunctionality__DoOnComponentUpdate(Functionality: TFunctionality); stdcall;

procedure TMRKVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TMRKVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TMRKVisualizationFunctionality__getBindingPointIndex(Functionality: TFunctionality): integer; stdcall;

procedure TMRKVisualizationFunctionality__setBindingPointIndex(Functionality: TFunctionality;   Value: integer); stdcall;

function TMRKVisualizationFunctionality__getAlign(Functionality: TFunctionality): TMRKVisualizationAlign; stdcall;

procedure TMRKVisualizationFunctionality__setAlign(Functionality: TFunctionality;   Value: TMRKVisualizationAlign); stdcall;

procedure TMRKVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TMRKVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TMRKVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TMRKVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;


{TTOrientedPictureVisualizationFunctionality}
function TTOrientedPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOrientedPictureVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTOrientedPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOrientedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTOrientedPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOrientedPictureVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTOrientedPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOrientedPictureVisualizationFunctionality}
function TOrientedPictureVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedPictureVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

function TOrientedPictureVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Extended): boolean; stdcall;

procedure TOrientedPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TOrientedPictureVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TOrientedPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOrientedPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

procedure TOrientedPictureVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;

function TOrientedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TOrientedPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TOrientedPictureVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TOrientedPictureVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

function TOrientedPictureVisualizationFunctionality__getWidth(Functionality: TFunctionality): Extended; stdcall;

procedure TOrientedPictureVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: Extended); stdcall;

function TOrientedPictureVisualizationFunctionality__getHeight(Functionality: TFunctionality): Extended; stdcall;

procedure TOrientedPictureVisualizationFunctionality__setHeight(Functionality: TFunctionality;   Value: Extended); stdcall;

function TOrientedPictureVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedPictureVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality__ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Extended); stdcall;

procedure TOrientedPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TOrientedPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

procedure TOrientedPictureVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall;

function TOrientedPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TOrientedPictureVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;


{TTOrientedTTFVisualizationFunctionality}
function TTOrientedTTFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTOrientedTTFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOrientedTTFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTOrientedTTFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOrientedTTFVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTOrientedTTFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TOrientedTTFVisualizationFunctionality}
function TOrientedTTFVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewFontWidth,NewFontHeight,NewCharInterval: Extended; const flNewStr: boolean; const NewStr: TStringOrientedTTFVisualization): boolean; stdcall;

procedure TOrientedTTFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TOrientedTTFVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TOrientedTTFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOrientedTTFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

procedure TOrientedTTFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;

function TOrientedTTFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TOrientedTTFVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TOrientedTTFVisualizationFunctionality__getStr(Functionality: TFunctionality): TStringOrientedTTFVisualization; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setStr(Functionality: TFunctionality;   const Value: TStringOrientedTTFVisualization); stdcall;

function TOrientedTTFVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall;

function TOrientedTTFVisualizationFunctionality__getFont_Name(Functionality: TFunctionality): shortstring; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setFont_Name(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TOrientedTTFVisualizationFunctionality__getFont_Width(Functionality: TFunctionality): Extended; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setFont_Width(Functionality: TFunctionality;   Value: Extended); stdcall;

function TOrientedTTFVisualizationFunctionality__getFont_Height(Functionality: TFunctionality): Extended; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setFont_Height(Functionality: TFunctionality;   Value: Extended); stdcall;

function TOrientedTTFVisualizationFunctionality__getCharInterval(Functionality: TFunctionality): Extended; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setCharInterval(Functionality: TFunctionality;   Value: Extended); stdcall;

function TOrientedTTFVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall;

procedure TOrientedTTFVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TOrientedTTFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TOrientedTTFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

procedure TOrientedTTFVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall;

function TOrientedTTFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;


{TTIconFunctionality}
function TTIconFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTIconFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTIconFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTIconFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTIconFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TIconFunctionality}
procedure TIconFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TIconFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TIconFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TIconFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TIconFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TIconFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall;

procedure TIconFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall;

procedure TIconFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;

procedure TIconFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;


{TTMessageBoardMessageFunctionality}
procedure TTMessageBoardMessageFunctionality__CheckUserOperation(Functionality: TFunctionality;   const idObj: integer; const idOperation: integer); stdcall;

function TTMessageBoardMessageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMessageBoardMessageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMessageBoardMessageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMessageBoardMessageFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTMessageBoardMessageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMessageBoardMessageFunctionality}
procedure TMessageBoardMessageFunctionality__CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall;

procedure TMessageBoardMessageFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TMessageBoardMessageFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TMessageBoardMessageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMessageBoardMessageFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TMessageBoardMessageFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TMessageBoardMessageFunctionality__getIdMessageBoard(Functionality: TFunctionality): integer; stdcall;

procedure TMessageBoardMessageFunctionality__setIdMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall;

function TMessageBoardMessageFunctionality__getIdSenderMessageBoard(Functionality: TFunctionality): integer; stdcall;

procedure TMessageBoardMessageFunctionality__setIdSenderMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall;

function TMessageBoardMessageFunctionality__DateCreated(Functionality: TFunctionality): TDateTime; stdcall;

function TMessageBoardMessageFunctionality__getSubject(Functionality: TFunctionality): shortstring; stdcall;

procedure TMessageBoardMessageFunctionality__setSubject(Functionality: TFunctionality;   Value: shortstring); stdcall;

procedure TMessageBoardMessageFunctionality__GetBody(Functionality: TFunctionality;   Value: TStrings); stdcall;

procedure TMessageBoardMessageFunctionality__SetBody(Functionality: TFunctionality;   Value: TStrings); stdcall;

function TMessageBoardMessageFunctionality__getFlRead(Functionality: TFunctionality): boolean; stdcall;

procedure TMessageBoardMessageFunctionality__setFlRead(Functionality: TFunctionality;   Value: boolean); stdcall;

function TMessageBoardMessageFunctionality__IsEmpty(Functionality: TFunctionality): boolean; stdcall;

function TMessageBoardMessageFunctionality__IsCreatedByUser(Functionality: TFunctionality;   const pidUser: integer): boolean; stdcall;


{TTMessageBoardFunctionality}
function TTMessageBoardFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMessageBoardFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMessageBoardFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMessageBoardFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTMessageBoardFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMessageBoardFunctionality}
function TMessageBoardFunctionality__getIdUser(Functionality: TFunctionality): integer; stdcall;

procedure TMessageBoardFunctionality__setIdUser(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TMessageBoardFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TMessageBoardFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

procedure TMessageBoardFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer); stdcall;

function TMessageBoardFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMessageBoardFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

procedure TMessageBoardFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TMessageBoardFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TMessageBoardFunctionality__IsUnreadMessageExist(Functionality: TFunctionality): boolean; stdcall;

procedure TMessageBoardFunctionality__GetMessagesList(Functionality: TFunctionality;   var List: TList); stdcall;


{TTQDCVisualizationFunctionality}
function TTQDCVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTQDCVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTQDCVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTQDCVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTQDCVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTQDCVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTQDCVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TQDCVisualizationFunctionality}
function TQDCVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TQDCVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TQDCVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

procedure TQDCVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TQDCVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TQDCVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TQDCVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TQDCVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TQDCVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TQDCVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TQDCVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

procedure TQDCVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;

function TQDCVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TQDCVisualizationFunctionality__ReflectInScene(Functionality: TFunctionality;   Scene: TScene); stdcall;

function TQDCVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAPtr: pointer): boolean; stdcall;

procedure TQDCVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;

procedure TQDCVisualizationFunctionality__LoadFromBitmap(Functionality: TFunctionality;   Bitmap: TBitmap); stdcall;


{TTOffersServerFunctionality}
function TTOffersServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTOffersServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTOffersServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOffersServerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTOffersServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TOffersServerFunctionality}
function TOffersServerFunctionality__getMailROBOT_Inbox(Functionality: TFunctionality): shortstring; stdcall;

procedure TOffersServerFunctionality__setMailROBOT_Inbox(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TOffersServerFunctionality__getMailROBOT_User(Functionality: TFunctionality): shortstring; stdcall;

procedure TOffersServerFunctionality__setMailROBOT_User(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TOffersServerFunctionality__getMailROBOT_Password(Functionality: TFunctionality): shortstring; stdcall;

procedure TOffersServerFunctionality__setMailROBOT_Password(Functionality: TFunctionality;   Value: shortstring); stdcall;

procedure TOffersServerFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TOffersServerFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TOffersServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOffersServerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TOffersServerFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTSecurityComponentOperationFunctionality}
function TTSecurityComponentOperationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSecurityComponentOperationFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSecurityComponentOperationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSecurityComponentOperationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTSecurityComponentOperationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TSecurityComponentOperationFunctionality}
procedure TSecurityComponentOperationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TSecurityComponentOperationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TSecurityComponentOperationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSecurityComponentOperationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

procedure TSecurityComponentOperationFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TSecurityComponentOperationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TSecurityComponentOperationFunctionality__getSQLInfo(Functionality: TFunctionality): shortstring; stdcall;

procedure TSecurityComponentOperationFunctionality__setSQLInfo(Functionality: TFunctionality;   Value: shortstring); stdcall;


{TTSecurityKeyFunctionality}
function TTSecurityKeyFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSecurityKeyFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSecurityKeyFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSecurityKeyFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTSecurityKeyFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TSecurityKeyFunctionality}
procedure TSecurityKeyFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TSecurityKeyFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TSecurityKeyFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSecurityKeyFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

procedure TSecurityKeyFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TSecurityKeyFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TSecurityKeyFunctionality__getInfo(Functionality: TFunctionality): shortstring; stdcall;

procedure TSecurityKeyFunctionality__setInfo(Functionality: TFunctionality;   Value: shortstring); stdcall;

procedure TSecurityKeyFunctionality__GetAssotiatedUsers(Functionality: TFunctionality;   out Users: TList); stdcall;


{TTSecurityFileFunctionality}
function TTSecurityFileFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSecurityFileFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSecurityFileFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSecurityFileFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTSecurityFileFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TSecurityFileFunctionality}
procedure TSecurityFileFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TSecurityFileFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TSecurityFileFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSecurityFileFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

procedure TSecurityFileFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TSecurityFileFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TSecurityFileFunctionality__getInfo(Functionality: TFunctionality): shortstring; stdcall;

procedure TSecurityFileFunctionality__setInfo(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TSecurityFileFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream): boolean; stdcall;

procedure TSecurityFileFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;


{TTSecurityComponentFunctionality}
function TTSecurityComponentFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSecurityComponentFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

procedure TTSecurityComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSecurityComponentFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTSecurityComponentFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSecurityComponentFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTSecurityComponentFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TSecurityComponentFunctionality}
function TSecurityComponentFunctionality__getIdSecurityFile(Functionality: TFunctionality): integer; stdcall;

procedure TSecurityComponentFunctionality__setIdSecurityFile(Functionality: TFunctionality;   Value: integer); stdcall;

function TSecurityComponentFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

procedure TSecurityComponentFunctionality__ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

procedure TSecurityComponentFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TSecurityComponentFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TSecurityComponentFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSecurityComponentFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TSecurityComponentFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTMODELUserFunctionality}
function TTMODELUserFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMODELUserFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMODELUserFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMODELUserFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTMODELUserFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTMODELUserFunctionality__IsUserExist(Functionality: TFunctionality;   const UserName: string; out idUser: integer): boolean; stdcall;


{TMODELUserFunctionality}
function TMODELUserFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

procedure TMODELUserFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TMODELUserFunctionality__getFullName(Functionality: TFunctionality): shortstring; stdcall;

procedure TMODELUserFunctionality__setFullName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TMODELUserFunctionality__getContactInfo(Functionality: TFunctionality): shortstring; stdcall;

procedure TMODELUserFunctionality__setContactInfo(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TMODELUserFunctionality__getPassword(Functionality: TFunctionality): shortstring; stdcall;

procedure TMODELUserFunctionality__setPassword(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TMODELUserFunctionality__getIdSecurityFileForClone(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality__setIdSecurityFileForClone(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality__getDATASize(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality__setDATASize(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality__getMaxDATASize(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality__setMaxDATASize(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality__getSpaceSquare(Functionality: TFunctionality): Extended; stdcall;

procedure TMODELUserFunctionality__setSpaceSquare(Functionality: TFunctionality;   Value: Extended); stdcall;

function TMODELUserFunctionality__getMaxSpaceSquare(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality__setMaxSpaceSquare(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality__getMaxSpaceSquarePerObject(Functionality: TFunctionality): integer; stdcall;

procedure TMODELUserFunctionality__setMaxSpaceSquarePerObject(Functionality: TFunctionality;   Value: integer); stdcall;

function TMODELUserFunctionality__getDisabled(Functionality: TFunctionality): boolean; stdcall;

procedure TMODELUserFunctionality__setDisabled(Functionality: TFunctionality;   Value: boolean); stdcall;

procedure TMODELUserFunctionality__CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall;

procedure TMODELUserFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TMODELUserFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TMODELUserFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMODELUserFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TMODELUserFunctionality__GetActiveStateInfo(Functionality: TFunctionality;   out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean; stdcall;

procedure TMODELUserFunctionality__GetSecurityKeysList(Functionality: TFunctionality;   out SecurityKeys: TList); stdcall;

function TMODELUserFunctionality__SecurityKeys_IsKeyExist(Functionality: TFunctionality;   const idSecurityKey: integer): boolean; stdcall;

procedure TMODELUserFunctionality__SecurityKeys_Insert(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall;

procedure TMODELUserFunctionality__SecurityKeys_Delete(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall;

function TMODELUserFunctionality__HaveUnreadMessages(Functionality: TFunctionality): boolean; stdcall;

procedure TMODELUserFunctionality__GetMessages(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TList); stdcall;


{TTTextureFunctionality}
function TTTextureFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTextureFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTextureFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTextureFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTTextureFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTTextureFunctionality__GetInstanceListMatchingBy(Functionality: TFunctionality;   const NameContext: string; var List: TList); stdcall;


{TTextureFunctionality}
procedure TTextureFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

procedure TTextureFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TTextureFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TTextureFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTextureFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTextureFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TTextureFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType); stdcall;

procedure TTextureFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TTextureDATAType); stdcall;

procedure TTextureFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;

procedure TTextureFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;


{TTBuffered3DVisualizationFunctionality}
function TTBuffered3DVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTBuffered3DVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTBuffered3DVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTBuffered3DVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTBuffered3DVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTBuffered3DVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTBuffered3DVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TBuffered3DVisualizationFunctionality}
function TBuffered3DVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;

procedure TBuffered3DVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;

procedure TBuffered3DVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;

function TBuffered3DVisualizationFunctionality__GetMeshesNodesApproximator(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix): TNodesApproximator; stdcall;

procedure TBuffered3DVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TBuffered3DVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TBuffered3DVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TBuffered3DVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TBuffered3DVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TBuffered3DVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TBuffered3DVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TBuffered3DVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TBuffered3DVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TBuffered3DVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;

procedure TBuffered3DVisualizationFunctionality__ReflectInScene(Functionality: TFunctionality;   Scene: TScene); stdcall;

procedure TBuffered3DVisualizationFunctionality__GetData(Functionality: TFunctionality;   out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Extended; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Extended); stdcall;

procedure TBuffered3DVisualizationFunctionality__Update(Functionality: TFunctionality); stdcall;

procedure TBuffered3DVisualizationFunctionality__LoadFromStream(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;

procedure TBuffered3DVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TBuffered3DVisualizationFunctionality__Get__Translate_XY(Functionality: TFunctionality;   out vTranslate_X,vTranslate_Y: Extended); stdcall;

procedure TBuffered3DVisualizationFunctionality__SetPropertiesLocal(Functionality: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Extended); stdcall;

function TBuffered3DVisualizationFunctionality__GetMinMax(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix; var Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Extended): boolean; stdcall;

procedure TBuffered3DVisualizationFunctionality__UpdateXOYProjection(Functionality: TFunctionality); stdcall;


{TTDATAFileFunctionality}
function TTDATAFileFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDATAFileFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDATAFileFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDATAFileFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTDATAFileFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDATAFileFunctionality}
procedure TDATAFileFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TMemoryStream); stdcall;

procedure TDATAFileFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;

function TDATAFileFunctionality__getDATAType(Functionality: TFunctionality): string; stdcall;

procedure TDATAFileFunctionality__setDATAType(Functionality: TFunctionality;   Value: string); stdcall;

procedure TDATAFileFunctionality__Check(Functionality: TFunctionality); stdcall;

procedure TDATAFileFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TDATAFileFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TDATAFileFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDATAFileFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TDATAFileFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TDATAFileFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer); stdcall;

function TDATAFileFunctionality__IsNull(Functionality: TFunctionality): boolean; stdcall;

procedure TDATAFileFunctionality__Empty(Functionality: TFunctionality); stdcall;

procedure TDATAFileFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;

procedure TDATAFileFunctionality__SaveToFile(Functionality: TFunctionality;   var FileName: string); stdcall;

procedure TDATAFileFunctionality__Activate(Functionality: TFunctionality); stdcall;


{TTCoComponentFunctionality}
function TTCoComponentFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCoComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCoComponentFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoComponentFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTCoComponentFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTCoComponentFunctionality__GetInstanceListByCoType(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TList); stdcall;


{TCoComponentFunctionality}
procedure TCoComponentFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TCoComponentFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TCoComponentFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCoComponentFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TCoComponentFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TCoComponentFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer); stdcall;

function TCoComponentFunctionality__idCoType(Functionality: TFunctionality): integer; stdcall;

function TCoComponentFunctionality__GetIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;


{TTCoComponentTypeMarkerFunctionality}
function TTCoComponentTypeMarkerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCoComponentTypeMarkerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCoComponentTypeMarkerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoComponentTypeMarkerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTCoComponentTypeMarkerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCoComponentTypeMarkerFunctionality}
procedure TCoComponentTypeMarkerFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TCoComponentTypeMarkerFunctionality__getIDCoComponentType(Functionality: TFunctionality): integer; stdcall;

function TCoComponentTypeMarkerFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

procedure TCoComponentTypeMarkerFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TCoComponentTypeMarkerFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TCoComponentTypeMarkerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCoComponentTypeMarkerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TCoComponentTypeMarkerFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TCoComponentTypeMarkerFunctionality__GetTypeIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;


{TTCoComponentTypeFunctionality}
function TTCoComponentTypeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCoComponentTypeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCoComponentTypeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCoComponentTypeFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTCoComponentTypeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCoComponentTypeFunctionality}
procedure TCoComponentTypeFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TCoComponentTypeFunctionality__getUID(Functionality: TFunctionality): integer; stdcall;

function TCoComponentTypeFunctionality__getDateCreated(Functionality: TFunctionality): TDateTime; stdcall;

procedure TCoComponentTypeFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TCoComponentTypeFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TCoComponentTypeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCoComponentTypeFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TCoComponentTypeFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TCoComponentTypeFunctionality__GetDescription(Functionality: TFunctionality;   Value: TStrings); stdcall;

procedure TCoComponentTypeFunctionality__SetDescription(Functionality: TFunctionality;   Value: TStrings); stdcall;

procedure TCoComponentTypeFunctionality__GetMarkersList(Functionality: TFunctionality;   var List: TList); stdcall;

function TCoComponentTypeFunctionality__GetIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;


{TTAddressFunctionality}
function TTAddressFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTAddressFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTAddressFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTAddressFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTAddressFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTAddressFunctionality__Points_GetTypeNames(Functionality: TFunctionality;   var List: TStringList); stdcall;

procedure TTAddressFunctionality__Streets_GetTypeNames(Functionality: TFunctionality;   var List: TStringList); stdcall;


{TAddressFunctionality}
procedure TAddressFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TAddressFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TAddressFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TAddressFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TAddressFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

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

function TTTransportRouteFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTTransportRouteFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTTransportRouteFunctionality__GetInstanceList(Functionality: TFunctionality;   var List: TList); stdcall;


{TTransportRouteFunctionality}
procedure TTransportRouteFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TTransportRouteFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TTransportRouteFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTransportRouteFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

procedure TTransportRouteFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TTransportRouteFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TTransportRouteFunctionality__getidTTransport(Functionality: TFunctionality): integer; stdcall;

procedure TTransportRouteFunctionality__setidTTransport(Functionality: TFunctionality;   Value: integer); stdcall;

function TTransportRouteFunctionality__getValid(Functionality: TFunctionality): boolean; stdcall;

procedure TTransportRouteFunctionality__setValid(Functionality: TFunctionality;   Value: boolean); stdcall;

function TTransportRouteFunctionality__getRemarks(Functionality: TFunctionality): shortstring; stdcall;

procedure TTransportRouteFunctionality__setRemarks(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TTransportRouteFunctionality__IsNodesExist(Functionality: TFunctionality): boolean; stdcall;

procedure TTransportRouteFunctionality__Nodes_GetList(Functionality: TFunctionality;   var List: TRouteNodesList); stdcall;

function TTransportRouteFunctionality__Nodes_IsNodeExist(Functionality: TFunctionality;   const idNode: integer): boolean; stdcall;

procedure TTransportRouteFunctionality__Nodes_ChangeNodeOrder(Functionality: TFunctionality;   const idItem: integer; const Order: integer); stdcall;

function TTransportRouteFunctionality__Nodes__Node_DistanceBefore(Functionality: TFunctionality;   const idItem: integer): integer; stdcall;

procedure TTransportRouteFunctionality__Nodes__Node_SetDistanceBefore(Functionality: TFunctionality;   const idItem: integer; const D: integer); stdcall;

function TTransportRouteFunctionality__Nodes__Node_OrderPrice(Functionality: TFunctionality;   const idItem: integer): shortstring; stdcall;

procedure TTransportRouteFunctionality__Nodes__Node_SetOrderPrice(Functionality: TFunctionality;   const idItem: integer; const Price: shortstring); stdcall;

function TTransportRouteFunctionality__Nodes_Insert(Functionality: TFunctionality;   const idNode: integer): integer; stdcall;

procedure TTransportRouteFunctionality__Nodes_Remove(Functionality: TFunctionality;   const idItem: integer); stdcall;


{TTTransportNodeFunctionality}
function TTTransportNodeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTransportNodeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTransportNodeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTransportNodeFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTTransportNodeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTTransportNodeFunctionality__GetInstanceList(Functionality: TFunctionality;   var List: TList); stdcall;


{TTransportNodeFunctionality}
procedure TTransportNodeFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TTransportNodeFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TTransportNodeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTransportNodeFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

procedure TTransportNodeFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TTransportNodeFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TTransportNodeFunctionality__IsRoutesExist(Functionality: TFunctionality): boolean; stdcall;


{TTOfferGoodsFunctionality}
function TTOfferGoodsFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTOfferGoodsFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTOfferGoodsFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOfferGoodsFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTOfferGoodsFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TOfferGoodsFunctionality}
function TOfferGoodsFunctionality__getIdGoods(Functionality: TFunctionality): integer; stdcall;

procedure TOfferGoodsFunctionality__setIdGoods(Functionality: TFunctionality;   Value: integer); stdcall;

function TOfferGoodsFunctionality__getAmount(Functionality: TFunctionality): Extended; stdcall;

procedure TOfferGoodsFunctionality__setAmount(Functionality: TFunctionality;   Value: Extended); stdcall;

function TOfferGoodsFunctionality__getIdMeasureUnit(Functionality: TFunctionality): integer; stdcall;

procedure TOfferGoodsFunctionality__setIdMeasureUnit(Functionality: TFunctionality;   Value: integer); stdcall;

function TOfferGoodsFunctionality__getMeasureUnit(Functionality: TFunctionality): string; stdcall;

function TOfferGoodsFunctionality__getMinPrice(Functionality: TFunctionality): Currency; stdcall;

procedure TOfferGoodsFunctionality__setMinPrice(Functionality: TFunctionality;   Value: Currency); stdcall;

function TOfferGoodsFunctionality__getMisc(Functionality: TFunctionality): string; stdcall;

procedure TOfferGoodsFunctionality__setMisc(Functionality: TFunctionality;   Value: string); stdcall;

procedure TOfferGoodsFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TOfferGoodsFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TOfferGoodsFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TOfferGoodsFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOfferGoodsFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TOfferGoodsFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TOfferGoodsFunctionality__CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall;

function TOfferGoodsFunctionality__idOffer(Functionality: TFunctionality): integer; stdcall;


{TMeasureUnitFunctionality}
function TMeasureUnitFunctionality__getName(Functionality: TFunctionality): string; stdcall;


{TTTLFStationTMTFunctionality}
function TTTLFStationTMTFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTTLFStationTMTFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTTLFStationTMTFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

procedure TTTLFStationTMTFunctionality__GetInstanceList(Functionality: TFunctionality;   var List: TList); stdcall;

function TTTLFStationTMTFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTTLFStationTMTFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TTLFStationTMTFunctionality}
function TTLFStationTMTFunctionality__getHostName(Functionality: TFunctionality): string; stdcall;

procedure TTLFStationTMTFunctionality__setHostName(Functionality: TFunctionality;   Value: string); stdcall;

function TTLFStationTMTFunctionality__getTestChanel(Functionality: TFunctionality): string; stdcall;

procedure TTLFStationTMTFunctionality__setTestChanel(Functionality: TFunctionality;   Value: string); stdcall;

procedure TTLFStationTMTFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TTLFStationTMTFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TTLFStationTMTFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTLFStationTMTFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTLFStationTMTFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTNameFunctionality}
function TTNameFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTNameFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTNameFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTNameFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTNameFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TNameFunctionality}
procedure TNameFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TNameFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TNameFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TNameFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TNameFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TNameFunctionality__Value(Functionality: TFunctionality): string; stdcall;

procedure TNameFunctionality__SetValue(Functionality: TFunctionality;   const NewValue: shortstring); stdcall;


{TTVisualizationFunctionality}
function TTVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TVisualizationFunctionality}
procedure TVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;


{TTTTFVisualizationFunctionality}
function TTTTFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

function TTTTFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTTTFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTTTFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTTTFVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTTTFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;


{TTTFVisualizationFunctionality}
function TTTFVisualizationFunctionality__getStr(Functionality: TFunctionality): TStringTTFVisualization; stdcall;

procedure TTTFVisualizationFunctionality__setStr(Functionality: TFunctionality;   const Value: TStringTTFVisualization); stdcall;

procedure TTTFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TTTFVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TTTFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TTTFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

procedure TTTFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;

function TTTFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTTFVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TTTFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;

procedure TTTFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TTTFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;


{TTObjectFunctionality}
function TTObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTObjectFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TObjectFunctionality}
procedure TObjectFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TObjectFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TObjectFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TObjectFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTLabelFunctionality}
function TTLabelFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTLabelFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTLabelFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTLabelFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTLabelFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TLabelFunctionality}
procedure TLabelFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TLabelFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TLabelFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TLabelFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TLabelFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTStationFunctionality}
function TTStationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTStationFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTStationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

procedure TTStationFunctionality__GetInstanceList(Functionality: TFunctionality;   var List: TList); stdcall;

function TTStationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTStationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TStationFunctionality}
procedure TStationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TStationFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TStationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TStationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TStationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TStationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TStationFunctionality__GetNumbersBound(Functionality: TFunctionality;   var BegNumber,EndNumber: integer); stdcall;


{TTMainLineFunctionality}
function TTMainLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMainLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMainLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMainLineFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTMainLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMainLineFunctionality}
procedure TMainLineFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TMainLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TMainLineFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TMainLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMainLineFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TMainLineFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TMainLineFunctionality__GetSTNOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;


{TTDescriptionFunctionality}
function TTDescriptionFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDescriptionFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDescriptionFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDescriptionFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTDescriptionFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDescriptionFunctionality}
procedure TDescriptionFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TDescriptionFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TDescriptionFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDescriptionFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TDescriptionFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TDescriptionFunctionality__GetValue(Functionality: TFunctionality;   vText: TStrings); stdcall;

procedure TDescriptionFunctionality__SetValue(Functionality: TFunctionality;   NewValue: TStrings); stdcall;


{TTImageFunctionality}
function TTImageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTImageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTImageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTImageFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTImageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TImageFunctionality}
procedure TImageFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TImageFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TImageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TImageFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TImageFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

procedure TImageFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall;

procedure TImageFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall;

procedure TImageFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;

procedure TImageFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;


{TTWellFunctionality}
function TTWellFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTWellFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTWellFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTWellFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTWellFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TWellFunctionality}
procedure TWellFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TWellFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TWellFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TWellFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TWellFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTBoxFunctionality}
function TTBoxFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTBoxFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTBoxFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTBoxFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTBoxFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TBoxFunctionality}
procedure TBoxFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TBoxFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TBoxFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TBoxFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TBoxFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TBoxFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTCableBoxFunctionality}
function TTCableBoxFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCableBoxFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCableBoxFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCableBoxFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTCableBoxFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCableBoxFunctionality}
procedure TCableBoxFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TCableBoxFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TCableBoxFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCableBoxFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TCableBoxFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTDistrLineFunctionality}
function TTDistrLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDistrLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDistrLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDistrLineFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTDistrLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDistrLineFunctionality}
procedure TDistrLineFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TDistrLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TDistrLineFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TDistrLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDistrLineFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TDistrLineFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTClientFunctionality}
function TTClientFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTClientFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

procedure TTClientFunctionality__GetInstanceList(Functionality: TFunctionality;   var List: TList); stdcall;

function TTClientFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTClientFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTClientFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TClientFunctionality}
procedure TClientFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TClientFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TClientFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TClientFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TClientFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TClientFunctionality__GetDebet(Functionality: TFunctionality;   var Value: Double): boolean; stdcall;


{TTHouseFunctionality}
function TTHouseFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTHouseFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTHouseFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHouseFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTHouseFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{THouseFunctionality}
procedure THouseFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function THouseFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function THouseFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function THouseFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function THouseFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function THouseFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTCommNodeFunctionality}
function TTCommNodeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCommNodeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCommNodeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCommNodeFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTCommNodeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCommNodeFunctionality}
procedure TCommNodeFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TCommNodeFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TCommNodeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCommNodeFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TCommNodeFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTCrossFunctionality}
function TTCrossFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCrossFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCrossFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCrossFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTCrossFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCrossFunctionality}
procedure TCrossFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TCrossFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TCrossFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCrossFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TCrossFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTCaseFunctionality}
function TTCaseFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCaseFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCaseFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCaseFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTCaseFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCaseFunctionality}
procedure TCaseFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TCaseFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TCaseFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCaseFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TCaseFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTStreetFunctionality}
function TTStreetFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTStreetFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTStreetFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTStreetFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTStreetFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TStreetFunctionality}
procedure TStreetFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TStreetFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TStreetFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TStreetFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TStreetFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTOtherObjFunctionality}
function TTOtherObjFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTOtherObjFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTOtherObjFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOtherObjFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTOtherObjFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TOtherObjFunctionality}
procedure TOtherObjFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TOtherObjFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TOtherObjFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOtherObjFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TOtherObjFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTSpanFunctionality}
function TTSpanFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTSpanFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTSpanFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTSpanFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTSpanFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TSpanFunctionality}
procedure TSpanFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TSpanFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TSpanFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TSpanFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TSpanFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTChanelFunctionality}
function TTChanelFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTChanelFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTChanelFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTChanelFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTChanelFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TChanelFunctionality}
procedure TChanelFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TChanelFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TChanelFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TChanelFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TChanelFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TChanelFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTHandHoldFunctionality}
function TTHandHoldFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTHandHoldFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTHandHoldFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTHandHoldFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTHandHoldFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{THandHoldFunctionality}
procedure THandHoldFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function THandHoldFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function THandHoldFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function THandHoldFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function THandHoldFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTLineDistFunctionality}
function TTLineDistFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTLineDistFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTLineDistFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTLineDistFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTLineDistFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TLineDistFunctionality}
procedure TLineDistFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TLineDistFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TLineDistFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TLineDistFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TLineDistFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTMuffFunctionality}
function TTMuffFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTMuffFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTMuffFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTMuffFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTMuffFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TMuffFunctionality}
procedure TMuffFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TMuffFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TMuffFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TMuffFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TMuffFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTOfferFunctionality}
function TTOfferFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTOfferFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTOfferFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTOfferFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTOfferFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

function TTOfferFunctionality__GetOfferByHumanID(Functionality: TFunctionality;   const HumanID: integer; out idOffer: integer): boolean; stdcall;


{TOfferFunctionality}
procedure TOfferFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TOfferFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TOfferFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TOfferFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TOfferFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

procedure TOfferFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TOfferFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TOfferFunctionality__getSchedule(Functionality: TFunctionality): shortstring; stdcall;

procedure TOfferFunctionality__setSchedule(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TOfferFunctionality__getPassword(Functionality: TFunctionality): string; stdcall;

procedure TOfferFunctionality__setPassword(Functionality: TFunctionality;   Value: string); stdcall;

function TOfferFunctionality__getContactTLF(Functionality: TFunctionality): integer; stdcall;

procedure TOfferFunctionality__setContactTLF(Functionality: TFunctionality;   Value: integer); stdcall;

function TOfferFunctionality__getLastUpdated(Functionality: TFunctionality): TDateTime; stdcall;

procedure TOfferFunctionality__setLastUpdated(Functionality: TFunctionality;   Value: TDateTime); stdcall;

procedure TOfferFunctionality__LoadDATAFromStream(Functionality: TFunctionality;   Stream: TStream); stdcall;

function TOfferFunctionality__idUser(Functionality: TFunctionality): integer; stdcall;

function TOfferFunctionality__UID(Functionality: TFunctionality): integer; stdcall;

function TOfferFunctionality__AddressStr(Functionality: TFunctionality): string; stdcall;

function TOfferFunctionality__Goods_Insert(Functionality: TFunctionality): integer; stdcall;

procedure TOfferFunctionality__Goods_GetList(Functionality: TFunctionality;   var List: TList); stdcall;

procedure TOfferFunctionality__Goods_Remove(Functionality: TFunctionality;   const idOfferGoods: integer); stdcall;

procedure TOfferFunctionality__Goods_Clear(Functionality: TFunctionality); stdcall;


{TTDemandFunctionality}
function TTDemandFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTDemandFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTDemandFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTDemandFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTDemandFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TDemandFunctionality}
procedure TDemandFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TDemandFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TDemandFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TDemandFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TDemandFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TDemandFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTCommLineFunctionality}
function TTCommLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCommLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCommLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCommLineFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTCommLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCommLineFunctionality}
procedure TCommLineFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TCommLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

function TCommLineFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TCommLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCommLineFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TCommLineFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;


{TTGoodsFunctionality}
function TTGoodsFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTGoodsFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTGoodsFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTGoodsFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTGoodsFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;

procedure TTGoodsFunctionality__GetInstanceListContainingContext(Functionality: TFunctionality;   const Context: shortstring; var List: TStringList); stdcall;

function TTGoodsFunctionality__IsInstanceExist(Functionality: TFunctionality;   const pName: shortstring; out idGoods: integer): boolean; stdcall;


{TGoodsFunctionality}
procedure TGoodsFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TGoodsFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TGoodsFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TGoodsFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

procedure TGoodsFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;

function TGoodsFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TGoodsFunctionality__StdAmount(Functionality: TFunctionality): integer; stdcall;

function TGoodsFunctionality__StdMeasureUnit(Functionality: TFunctionality): shortstring; stdcall;


{TTCollectionFunctionality}
function TTCollectionFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;

procedure TTCollectionFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;

function TTCollectionFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTCollectionFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

function TTCollectionFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;


{TCollectionFunctionality}
procedure TCollectionFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;

function TCollectionFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TCollectionFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TCollectionFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;

procedure TCollectionFunctionality__setName(Functionality: TFunctionality;   const Value: shortstring); stdcall;

function TCollectionFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;

function TCollectionFunctionality__InsertItem(Functionality: TFunctionality;   const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer; stdcall;

procedure TCollectionFunctionality__RemoveItem(Functionality: TFunctionality;   const id: integer); stdcall;

procedure TCollectionFunctionality__Item_ChangeAlias(Functionality: TFunctionality;   const id: integer; const pAlias: string); stdcall;

procedure TCollectionFunctionality__Item_ChangeListOrder(Functionality: TFunctionality;   const id: integer; const Order: integer); stdcall;

procedure TCollectionFunctionality__RemoveItems(Functionality: TFunctionality); stdcall;

function TCollectionFunctionality__IsItemExist(Functionality: TFunctionality;   const idTItem,idItem: integer): boolean; stdcall;

procedure TCollectionFunctionality__GetListItems(Functionality: TFunctionality;   var List: TList); stdcall;

procedure TCollectionFunctionality__SaveListItems(Functionality: TFunctionality;   List: TList); stdcall;


