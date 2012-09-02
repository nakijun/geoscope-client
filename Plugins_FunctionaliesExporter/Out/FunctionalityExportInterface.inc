//. the export routines defines

{TComponentFunctionality}
function TComponentFunctionality__getTypeSystem(_Functionality_: TFunctionality): TTypeSystem; stdcall;

function TComponentFunctionality__getTableName(_Functionality_: TFunctionality): string; stdcall;

procedure TComponentFunctionality__Check(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality__CheckUserOperation(_Functionality_: TFunctionality;   const idOperation: integer); stdcall;

procedure TComponentFunctionality__InsertComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer;  var id: integer); stdcall;

procedure TComponentFunctionality__RemoveComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer); stdcall;

procedure TComponentFunctionality___ToClone(_Functionality_: TFunctionality;   var idClone: integer); stdcall;

procedure TComponentFunctionality__ToClone(_Functionality_: TFunctionality;   var idClone: integer); stdcall;

procedure TComponentFunctionality__ToCloneUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer; var idClone: integer); stdcall;

function TComponentFunctionality__CanDestroy(_Functionality_: TFunctionality;   var Reason: shortstring): boolean; stdcall;

procedure TComponentFunctionality__Notify(_Functionality_: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer); stdcall;

function TComponentFunctionality__GetOwner(_Functionality_: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TComponentFunctionality__SetComponentsUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

procedure TComponentFunctionality__DestroyComponents(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality__RemoveSelfAsComponent(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality__IsUnReferenced(_Functionality_: TFunctionality): boolean; stdcall;

function TComponentFunctionality__IsEmpty(_Functionality_: TFunctionality): boolean; stdcall;

function TComponentFunctionality__DATASize(_Functionality_: TFunctionality): integer; stdcall;

procedure TComponentFunctionality__LoadFromFile(_Functionality_: TFunctionality;   const FileName: string); stdcall;

procedure TComponentFunctionality__LoadFromStream(_Functionality_: TFunctionality;   const Stream: TStream); stdcall;

procedure TComponentFunctionality__GetComponentsList(_Functionality_: TFunctionality;   var ComponentsList: TComponentsList); stdcall;

function TComponentFunctionality__QueryComponents(_Functionality_: TFunctionality;   FunctionalityClass: TFunctionalityClass; out ComponentsList: TComponentsList): boolean; stdcall;

function TComponentFunctionality__QueryComponents1(_Functionality_: TFunctionality;   const idTNeededType: integer; out ComponentsList: TComponentsList): boolean; stdcall;

function TComponentFunctionality__QueryComponent(_Functionality_: TFunctionality;   const idTNeededType: integer; out idTComponent,idComponent: integer): boolean; stdcall;

function TComponentFunctionality__QueryComponentFunctionality(_Functionality_: TFunctionality;   NeededFunctionalityClass: TFunctionalityClass; out Functionality: TFunctionality): boolean; stdcall;

function TComponentFunctionality__ComponentsCount(_Functionality_: TFunctionality): integer; stdcall;

function TComponentFunctionality__GetRootOwner(_Functionality_: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TComponentFunctionality__TPresentUpdater_Create(_Functionality_: TFunctionality;   pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater; stdcall;

procedure TComponentFunctionality__CreateNewPanelProps(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality__DestroyPanelProps(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality__IsPanelPropsExist(_Functionality_: TFunctionality): boolean; stdcall;

function TComponentFunctionality__GetPanelPropsLeftTop(_Functionality_: TFunctionality;   var PanelProps_Left,PanelProps_Top: integer): boolean; stdcall;

function TComponentFunctionality__GetPanelPropsWidthHeight(_Functionality_: TFunctionality;   var PanelProps_Width,PanelProps_Height: integer): boolean; stdcall;

procedure TComponentFunctionality__SetPanelPropsLeftTop(_Functionality_: TFunctionality;   const PanelProps_OfsX,PanelProps_OfsY: integer); stdcall;

procedure TComponentFunctionality__SetPanelPropsWidthHeight(_Functionality_: TFunctionality;   const PanelProps_Width,PanelProps_Height: integer); stdcall;

function TComponentFunctionality__IsCustomPanelPropsExist(_Functionality_: TFunctionality): boolean; stdcall;

function TComponentFunctionality__idCustomPanelProps(_Functionality_: TFunctionality): integer; stdcall;

function TComponentFunctionality__CustomPanelProps(_Functionality_: TFunctionality): TClientBlobStream; stdcall;

procedure TComponentFunctionality__SetCustomPanelProps(_Functionality_: TFunctionality;   Stream: TStream; const flNewValue: boolean{если = true, то заменяет панелью с новым ID}); stdcall;

procedure TComponentFunctionality__SetCustomPanelPropsByID(_Functionality_: TFunctionality;   const idPanelProps: integer); stdcall;

procedure TComponentFunctionality__ReleaseCustomPanelProps(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TComponentFunctionality__getName(_Functionality_: TFunctionality): shortstring; stdcall;

procedure TComponentFunctionality__setName(_Functionality_: TFunctionality;   Value: shortstring); stdcall;

function TComponentFunctionality__getHint(_Functionality_: TFunctionality): shortstring; stdcall;

function TComponentFunctionality__GetIconImage(_Functionality_: TFunctionality;   out Image: TBitmap): boolean; stdcall;

function TComponentFunctionality__getidTObj(_Functionality_: TFunctionality): integer; stdcall;

function TComponentFunctionality__getSpace(_Functionality_: TFunctionality): TProxySpace; stdcall;

procedure TComponentFunctionality__DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality__GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;


{TTProxyObjectFunctionality}
function TTProxyObjectFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall;

procedure TTProxyObjectFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;

function TTProxyObjectFunctionality__TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTProxyObjectFunctionality__getName(_Functionality_: TFunctionality): shortstring; stdcall;

function TTProxyObjectFunctionality__getImage(_Functionality_: TFunctionality): TTypeImage; stdcall;


{TProxyObjectFunctionality}
procedure TProxyObjectFunctionality___ToClone(_Functionality_: TFunctionality;   var idClone: integer); stdcall;

function TProxyObjectFunctionality__CanDestroy(_Functionality_: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TProxyObjectFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TProxyObjectFunctionality__getName(_Functionality_: TFunctionality): shortstring; stdcall;

function TProxyObjectFunctionality__getHint(_Functionality_: TFunctionality): shortstring; stdcall;

function TProxyObjectFunctionality__GetReference(_Functionality_: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

procedure TProxyObjectFunctionality__SetReference(_Functionality_: TFunctionality;   const idTOwner,idOwner: integer); stdcall;


{TTBaseVisualizationFunctionality}
function TTBaseVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;

procedure TTBaseVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;

function TTBaseVisualizationFunctionality__CanCreateAsDetail(_Functionality_: TFunctionality): boolean; stdcall;

function TTBaseVisualizationFunctionality__ImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;


{TBaseVisualizationFunctionality}
function TBaseVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;

procedure TBaseVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;

function TBaseVisualizationFunctionality__getStrobing(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBaseVisualizationFunctionality__setStrobing(_Functionality_: TFunctionality;   Value: boolean); stdcall;

function TBaseVisualizationFunctionality__getStrobingInterval(_Functionality_: TFunctionality): integer; stdcall;

procedure TBaseVisualizationFunctionality__setStrobingInterval(_Functionality_: TFunctionality;   Value: integer); stdcall;

procedure TBaseVisualizationFunctionality__CheckUserOperation(_Functionality_: TFunctionality;   const idOperation: integer); stdcall;

procedure TBaseVisualizationFunctionality__DestroyData(_Functionality_: TFunctionality); stdcall;

procedure TBaseVisualizationFunctionality__CloneData(_Functionality_: TFunctionality;   var idClone: integer); stdcall;

function TBaseVisualizationFunctionality__Ptr(_Functionality_: TFunctionality): TPtr; stdcall;

procedure TBaseVisualizationFunctionality__DoOnChangeScale(_Functionality_: TFunctionality;   const ChangeCoef: Extended); stdcall;

function TBaseVisualizationFunctionality__IsUnReferenced(_Functionality_: TFunctionality): boolean; stdcall;

function TBaseVisualizationFunctionality__TVisualizationUpdating_Create(_Functionality_: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;

procedure TBaseVisualizationFunctionality__ReflectInScene(_Functionality_: TFunctionality;   Scene: TScene); stdcall;

procedure TBaseVisualizationFunctionality__Scaling(_Functionality_: TFunctionality;   const Scale: Extended); stdcall;

procedure TBaseVisualizationFunctionality__SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Extended); stdcall;

procedure TBaseVisualizationFunctionality__Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Extended); stdcall;

procedure TBaseVisualizationFunctionality__SetPropertiesLocal(_Functionality_: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Extended); stdcall;

procedure TBaseVisualizationFunctionality__DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall;

procedure TBaseVisualizationFunctionality__DoOnDblClick(_Functionality_: TFunctionality); stdcall;

procedure TBaseVisualizationFunctionality__GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;


{TTBase2DVisualizationFunctionality}
function TTBase2DVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;

procedure TTBase2DVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;

function TTBase2DVisualizationFunctionality___CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTBase2DVisualizationFunctionality__CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

procedure TTBase2DVisualizationFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;

function TTBase2DVisualizationFunctionality__CreateObj(_Functionality_: TFunctionality;   pReflector: TAbstractReflector; pObjectVisualization: TObjectVisualization; const flAbsoluteCoords: boolean; const idTObj,idObj: integer; ptrOwner: TPtr): TPtr; stdcall;

procedure TTBase2DVisualizationFunctionality__DestroyObj(_Functionality_: TFunctionality;   const ptrDestrObj: TPtr); stdcall;

function TTBase2DVisualizationFunctionality__StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall;


{TBase2DVisualizationFunctionality}
function TBase2DVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;

procedure TBase2DVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;

function TBase2DVisualizationFunctionality__getIdLay(_Functionality_: TFunctionality): integer; stdcall;

function TBase2DVisualizationFunctionality__Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TBase2DVisualizationFunctionality__CreateClone(_Functionality_: TFunctionality;   const ptrObj: TPtr; const ptrCloneOwner: TPtr; var idClone: integer); stdcall;

procedure TBase2DVisualizationFunctionality__GetLayInfo(_Functionality_: TFunctionality;   var Lay,SubLay: integer); stdcall;

function TBase2DVisualizationFunctionality__ReflectAsNotLoaded(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TBase2DVisualizationFunctionality__CheckPlace(_Functionality_: TFunctionality;   const Xbind,Ybind: Extended; const Scale: Extended; const Angle: Extended; const dX,dY: Extended); stdcall;

procedure TBase2DVisualizationFunctionality__Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Extended); stdcall;

procedure TBase2DVisualizationFunctionality__SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Extended); stdcall;

procedure TBase2DVisualizationFunctionality__ChangeScale(_Functionality_: TFunctionality;   const Xbind,Ybind: Extended; const Scale: Extended); stdcall;

procedure TBase2DVisualizationFunctionality__Rotate(_Functionality_: TFunctionality;   const Xbind,Ybind: Extended; const Angle: Extended); stdcall;

function TBase2DVisualizationFunctionality__Square(_Functionality_: TFunctionality): Extended; stdcall;

function TBase2DVisualizationFunctionality__Square1(_Functionality_: TFunctionality;   const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: TCrd; const WidthCoef: Extended; const Scale: Extended): Extended; stdcall;


{TTLay2DVisualizationFunctionality}
function TTLay2DVisualizationFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall;

function TTLay2DVisualizationFunctionality__TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTLay2DVisualizationFunctionality__getName(_Functionality_: TFunctionality): shortstring; stdcall;

function TTLay2DVisualizationFunctionality__getImage(_Functionality_: TFunctionality): TTypeImage; stdcall;

function TTLay2DVisualizationFunctionality___CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTLay2DVisualizationFunctionality__StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall;


{TLay2DVisualizationFunctionality}
function TLay2DVisualizationFunctionality__getNumber(_Functionality_: TFunctionality): integer; stdcall;

procedure TLay2DVisualizationFunctionality__CheckUserOperation(_Functionality_: TFunctionality;   const idOperation: integer); stdcall;

procedure TLay2DVisualizationFunctionality__DestroyData(_Functionality_: TFunctionality); stdcall;

procedure TLay2DVisualizationFunctionality___ToClone(_Functionality_: TFunctionality;   var idClone: integer); stdcall;

function TLay2DVisualizationFunctionality__CanDestroy(_Functionality_: TFunctionality;   var Reason: shortstring): boolean; stdcall;

function TLay2DVisualizationFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TLay2DVisualizationFunctionality__GetOwner(_Functionality_: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;

function TLay2DVisualizationFunctionality__getName(_Functionality_: TFunctionality): shortstring; stdcall;

procedure TLay2DVisualizationFunctionality__setName(_Functionality_: TFunctionality;   Value: shortstring); stdcall;

function TLay2DVisualizationFunctionality__getHint(_Functionality_: TFunctionality): shortstring; stdcall;

procedure TLay2DVisualizationFunctionality__CloneData(_Functionality_: TFunctionality;   var idClone: integer); stdcall;

function TLay2DVisualizationFunctionality__Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TLay2DVisualizationFunctionality__GetObjectPointersList(_Functionality_: TFunctionality;   var List: TList); stdcall;

function TLay2DVisualizationFunctionality__isEmpty(_Functionality_: TFunctionality): boolean; stdcall;


