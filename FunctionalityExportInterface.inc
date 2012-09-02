//. the export routines defines

{TTypeFunctionality}
function TTypeFunctionality__UserName(_Functionality_: TFunctionality): WideString; stdcall;

function TTypeFunctionality__UserPassword(_Functionality_: TFunctionality): WideString; stdcall;

function TTypeFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall;

function TTypeFunctionality__CreateInstance(_Functionality_: TFunctionality): integer; stdcall;

function TTypeFunctionality__CreateInstanceUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer): integer; stdcall;

procedure TTypeFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;

procedure TTypeFunctionality__DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;

procedure TTypeFunctionality__GetInstanceList(_Functionality_: TFunctionality;   out List: TList); stdcall;

procedure TTypeFunctionality__GetInstanceList1(_Functionality_: TFunctionality;   out List: TByteArray); stdcall;

procedure TTypeFunctionality__GetInstanceNames(_Functionality_: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); stdcall;

procedure TTypeFunctionality__GetInstanceOwnerNames(_Functionality_: TFunctionality;   const IDs: TByteArray; out Data: TByteArray); stdcall;

procedure TTypeFunctionality__GetComponentDatas(_Functionality_: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; const DataFlags: TComponentDataFlags; out Datas: TComponentDatas); stdcall;

procedure TTypeFunctionality__GetComponentOwnerDatas(_Functionality_: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); stdcall;

function TTypeFunctionality__CheckImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTypeFunctionality__ImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTypeFunctionality__TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

procedure TTypeFunctionality__DoOnComponentOperation(_Functionality_: TFunctionality;   const idTObj,idObj: integer; const Operation: TComponentOperation); stdcall;

function TTypeFunctionality__getSpace(_Functionality_: TFunctionality): TProxySpace; stdcall;

function TTypeFunctionality__getidType(_Functionality_: TFunctionality): integer; stdcall;

function TTypeFunctionality__getName(_Functionality_: TFunctionality): string; stdcall;

function TTypeFunctionality__getImage(_Functionality_: TFunctionality): TTypeImage; stdcall;

function TTypeFunctionality__getTableName(_Functionality_: TFunctionality): string; stdcall;

function TTypeFunctionality__getImageList_Index(_Functionality_: TFunctionality): integer; stdcall;


{TComponentFunctionality}
procedure TComponentFunctionality__UpdateDATA(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality__ClearDATA(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality__UserName(_Functionality_: TFunctionality): WideString; stdcall;

function TComponentFunctionality__UserPassword(_Functionality_: TFunctionality): WideString; stdcall;

procedure TComponentFunctionality__SetUser(_Functionality_: TFunctionality;   const pUserName: WideString; const pUserPassword: WideString); stdcall;

function TComponentFunctionality__UserProfileFolder(_Functionality_: TFunctionality): string; stdcall;

function TComponentFunctionality__GetObjTID(_Functionality_: TFunctionality): integer; stdcall;

function TComponentFunctionality__GetObjID(_Functionality_: TFunctionality): integer; stdcall;

procedure TComponentFunctionality__Check(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality__CreationTimestamp(_Functionality_: TFunctionality): double; stdcall;

procedure TComponentFunctionality__CheckUserOperation(_Functionality_: TFunctionality;   const idOperation: integer); stdcall;

function TComponentFunctionality__GetSecurityComponent(_Functionality_: TFunctionality;   out idSecurityComponent: integer): boolean; stdcall;

procedure TComponentFunctionality__ChangeSecurity(_Functionality_: TFunctionality;   const pidSecurityFile: integer); stdcall;

function TComponentFunctionality__IsUserDataExists(_Functionality_: TFunctionality;   const DataName: string): boolean; stdcall;

function TComponentFunctionality__DeleteUserData(_Functionality_: TFunctionality;   const DataName: string): boolean; stdcall;

procedure TComponentFunctionality__SetUserData(_Functionality_: TFunctionality;   const DataName: string; const Data: TMemoryStream); stdcall;

procedure TComponentFunctionality__GetUserData(_Functionality_: TFunctionality;   const DataName: string; out Data: TMemoryStream); stdcall;

procedure TComponentFunctionality__InsertComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer;  out id: integer); stdcall;

procedure TComponentFunctionality__CloneAndInsertComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer; out idClone: integer; out id: integer); stdcall;

procedure TComponentFunctionality__ImportAndInsertComponents(_Functionality_: TFunctionality;   const ImportFileName: string; out ComponentsList: TComponentsList); stdcall;

procedure TComponentFunctionality__DestroyComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer); stdcall;

procedure TComponentFunctionality__RemoveComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer); stdcall;

procedure TComponentFunctionality___ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall;

procedure TComponentFunctionality__ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall;

procedure TComponentFunctionality__ToCloneUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer; out idClone: integer); stdcall;

function TComponentFunctionality__CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall;

function TComponentFunctionality__Notify(_Functionality_: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TComponentFunctionality__GetOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TComponentFunctionality__SetComponentsUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

procedure TComponentFunctionality__DestroyComponents(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality__RemoveSelfAsComponent(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality__IsUnReferenced(_Functionality_: TFunctionality): boolean; stdcall;

function TComponentFunctionality__IsEmpty(_Functionality_: TFunctionality): boolean; stdcall;

function TComponentFunctionality__DATASize(_Functionality_: TFunctionality): integer; stdcall;

procedure TComponentFunctionality__LoadFromFile(_Functionality_: TFunctionality;   const FileName: string); stdcall;

procedure TComponentFunctionality__LoadFromStream(_Functionality_: TFunctionality;   const Stream: TStream); stdcall;

procedure TComponentFunctionality__GetComponentsList(_Functionality_: TFunctionality;   out ComponentsList: TComponentsList); stdcall;

procedure TComponentFunctionality__GetComponentsList1(_Functionality_: TFunctionality;   out ComponentsList: TByteArray); stdcall;

function TComponentFunctionality__QueryComponents(_Functionality_: TFunctionality;   FunctionalityClass: TFunctionalityClass; out ComponentsList: TComponentsList): boolean; stdcall;

function TComponentFunctionality__QueryComponents1(_Functionality_: TFunctionality;   const idTNeededType: integer; out ComponentsList: TComponentsList): boolean; stdcall;

function TComponentFunctionality__QueryComponentsWithTag(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out ComponentsList: TComponentsList): boolean; stdcall;

function TComponentFunctionality__QueryComponentsWithTag1(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean; stdcall;

function TComponentFunctionality__QueryComponent(_Functionality_: TFunctionality;   const idTNeededType: integer; out idTComponent,idComponent: integer): boolean; stdcall;

function TComponentFunctionality__QueryComponentWithTag(_Functionality_: TFunctionality;   const pTag: integer; out idTComponent,idComponent: integer): boolean; stdcall;

function TComponentFunctionality__QueryComponentWithTag1(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean; stdcall;

function TComponentFunctionality__QueryComponentFunctionality(_Functionality_: TFunctionality;   NeededFunctionalityClass: TFunctionalityClass; out Functionality: TFunctionality): boolean; stdcall;

function TComponentFunctionality__ComponentsCount(_Functionality_: TFunctionality): integer; stdcall;

function TComponentFunctionality__GetRootOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TComponentFunctionality__TPresentUpdater_Create(_Functionality_: TFunctionality;   pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater; stdcall;

function TComponentFunctionality__TContextComponentHolder_Create(_Functionality_: TFunctionality): TComponentPresentUpdater; stdcall;

procedure TComponentFunctionality__RealityRating_AddUserRate(_Functionality_: TFunctionality;   const Rate: integer; const RateReason: WideString); stdcall;

procedure TComponentFunctionality__RealityRating_GetAverageRate(_Functionality_: TFunctionality;   out AvrRate: double; out RateCount: integer); stdcall;

procedure TComponentFunctionality__RealityRating_GetData(_Functionality_: TFunctionality;   out RatingData: TByteArray); stdcall;

function TComponentFunctionality__ActualityInterval_Get(_Functionality_: TFunctionality): TComponentActualityInterval; stdcall;

procedure TComponentFunctionality__ActualityInterval_GetTimestamps(_Functionality_: TFunctionality;   out BeginTimestamp,EndTimestamp: double); stdcall;

function TComponentFunctionality__ActualityInterval_GetLocally(_Functionality_: TFunctionality): TComponentActualityInterval; stdcall;

procedure TComponentFunctionality__ActualityInterval_SetEndTimestamp(_Functionality_: TFunctionality;   const Value: double); stdcall;

function TComponentFunctionality__ActualityInterval_IsActualForTime(_Functionality_: TFunctionality;   const pTime: double): boolean; stdcall;

function TComponentFunctionality__ActualityInterval_IsActualForTimeInterval(_Functionality_: TFunctionality;   const pInterval: TComponentActualityInterval): boolean; stdcall;

function TComponentFunctionality__ActualityInterval_IsActualForTimeLocally(_Functionality_: TFunctionality;   const pTime: double): boolean; stdcall;

function TComponentFunctionality__ActualityInterval_IsActualForTimeIntervalLocally(_Functionality_: TFunctionality;   const pInterval: TComponentActualityInterval): boolean; stdcall;

procedure TComponentFunctionality__ActualityInterval_Actualize(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality__ActualityInterval_Deactualize(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality__CreateNewPanelProps(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality__DestroyPanelProps(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality__IsPanelPropsExist(_Functionality_: TFunctionality): boolean; stdcall;

function TComponentFunctionality__GetPanelPropsLeftTop(_Functionality_: TFunctionality;   out PanelProps_Left,PanelProps_Top: integer): boolean; stdcall;

function TComponentFunctionality__GetPanelPropsWidthHeight(_Functionality_: TFunctionality;   out PanelProps_Width,PanelProps_Height: integer): boolean; stdcall;

procedure TComponentFunctionality__SetPanelPropsLeftTop(_Functionality_: TFunctionality;   const PanelProps_OfsX,PanelProps_OfsY: integer); stdcall;

procedure TComponentFunctionality__SetPanelPropsWidthHeight(_Functionality_: TFunctionality;   const PanelProps_Width,PanelProps_Height: integer); stdcall;

function TComponentFunctionality__IsCustomPanelPropsExist(_Functionality_: TFunctionality): boolean; stdcall;

function TComponentFunctionality__idCustomPanelProps(_Functionality_: TFunctionality): integer; stdcall;

function TComponentFunctionality__CustomPanelProps(_Functionality_: TFunctionality): TMemoryStream; stdcall;

procedure TComponentFunctionality__SetCustomPanelProps(_Functionality_: TFunctionality;   Stream: TStream; const flNewValue: boolean{если = true, то заменяет панелью с новым ID}); stdcall;

procedure TComponentFunctionality__SetCustomPanelPropsByID(_Functionality_: TFunctionality;   const idPanelProps: integer); stdcall;

procedure TComponentFunctionality__ReleaseCustomPanelProps(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TComponentFunctionality__getSpace(_Functionality_: TFunctionality): TProxySpace; stdcall;

function TComponentFunctionality__getidTObj(_Functionality_: TFunctionality): integer; stdcall;

function TComponentFunctionality__getName(_Functionality_: TFunctionality): string; stdcall;

procedure TComponentFunctionality__setName(_Functionality_: TFunctionality;   Value: string); stdcall;

function TComponentFunctionality__getHint(_Functionality_: TFunctionality): string; stdcall;

function TComponentFunctionality__getTag(_Functionality_: TFunctionality): integer; stdcall;

procedure TComponentFunctionality__setTag(_Functionality_: TFunctionality;   Value: integer); stdcall;

function TComponentFunctionality__GetIconImage(_Functionality_: TFunctionality;   out Image: TBitmap): boolean; stdcall;

procedure TComponentFunctionality__DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality__GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;

function TComponentFunctionality___GetDataDocument(_Functionality_: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;

function TComponentFunctionality__GetDataDocument(_Functionality_: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean; stdcall;

function TComponentFunctionality__GetHintInfo(_Functionality_: TFunctionality;   const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall;

procedure TComponentFunctionality__NotifyOnComponentUpdate(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality__GetComponentDATA(_Functionality_: TFunctionality;   const Version: integer): TByteArray; stdcall;

procedure TComponentFunctionality__SetComponentDATA(_Functionality_: TFunctionality;   const Data: TByteArray); stdcall;

function TComponentFunctionality__getTypeSystem(_Functionality_: TFunctionality): TTypeSystem; stdcall;

function TComponentFunctionality__getTableName(_Functionality_: TFunctionality): string; stdcall;


{TTProxyObjectFunctionality}
function TTProxyObjectFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall;

procedure TTProxyObjectFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;

function TTProxyObjectFunctionality__TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTProxyObjectFunctionality__getName(_Functionality_: TFunctionality): string; stdcall;

function TTProxyObjectFunctionality__getImage(_Functionality_: TFunctionality): TTypeImage; stdcall;


{TProxyObjectFunctionality}
procedure TProxyObjectFunctionality___ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall;

function TProxyObjectFunctionality__CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall;

function TProxyObjectFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TProxyObjectFunctionality__getName(_Functionality_: TFunctionality): string; stdcall;

function TProxyObjectFunctionality__getHint(_Functionality_: TFunctionality): string; stdcall;

function TProxyObjectFunctionality__GetReference(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

procedure TProxyObjectFunctionality__SetReference(_Functionality_: TFunctionality;   const idTOwner,idOwner: integer); stdcall;


{TTBaseVisualizationFunctionality}
procedure TTBaseVisualizationFunctionality__GetComponentOwnerDatas(_Functionality_: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); stdcall;

function TTBaseVisualizationFunctionality__CanCreateAsDetail(_Functionality_: TFunctionality): boolean; stdcall;

function TTBaseVisualizationFunctionality__ImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTBaseVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;

procedure TTBaseVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;


{TBaseVisualizationFunctionality}
procedure TBaseVisualizationFunctionality__DestroyData(_Functionality_: TFunctionality); stdcall;

procedure TBaseVisualizationFunctionality__CloneData(_Functionality_: TFunctionality;   out idClone: integer); stdcall;

function TBaseVisualizationFunctionality__Ptr(_Functionality_: TFunctionality): TPtr; stdcall;

procedure TBaseVisualizationFunctionality__DoOnChangeScale(_Functionality_: TFunctionality;   const ChangeCoef: Double); stdcall;

function TBaseVisualizationFunctionality__IsUnReferenced(_Functionality_: TFunctionality): boolean; stdcall;

function TBaseVisualizationFunctionality__TVisualizationUpdating_Create(_Functionality_: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;

procedure TBaseVisualizationFunctionality__ReflectInScene(_Functionality_: TFunctionality;   Scene: TScene); stdcall;

procedure TBaseVisualizationFunctionality__Scaling(_Functionality_: TFunctionality;   const pScale: Double); stdcall;

procedure TBaseVisualizationFunctionality__SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Double); stdcall;

procedure TBaseVisualizationFunctionality__Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Double); stdcall;

procedure TBaseVisualizationFunctionality__ChangeScale(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double); stdcall;

procedure TBaseVisualizationFunctionality__Rotate(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const Angle: Double); stdcall;

procedure TBaseVisualizationFunctionality__Transform(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;

procedure TBaseVisualizationFunctionality__SetPropertiesLocal(_Functionality_: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall;

procedure TBaseVisualizationFunctionality__DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall;

function TBaseVisualizationFunctionality__DoOnOver(_Functionality_: TFunctionality): boolean; stdcall;

function TBaseVisualizationFunctionality__DoOnClick(_Functionality_: TFunctionality): boolean; stdcall;

function TBaseVisualizationFunctionality__DoOnDblClick(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBaseVisualizationFunctionality__GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;

procedure TBaseVisualizationFunctionality__GetOwnerByVisualization(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr); stdcall;

function TBaseVisualizationFunctionality__GetCoVisualizationSpaces(_Functionality_: TFunctionality;   out List: TList): boolean; stdcall;

function TBaseVisualizationFunctionality__GetCoVisualizationSpaces1(_Functionality_: TFunctionality;   out List: TByteArray): boolean; stdcall;

function TBaseVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;

procedure TBaseVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;

function TBaseVisualizationFunctionality__getStrobing(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBaseVisualizationFunctionality__setStrobing(_Functionality_: TFunctionality;   Value: boolean); stdcall;

function TBaseVisualizationFunctionality__getStrobingInterval(_Functionality_: TFunctionality): integer; stdcall;

procedure TBaseVisualizationFunctionality__setStrobingInterval(_Functionality_: TFunctionality;   Value: integer); stdcall;


{TTBase2DVisualizationFunctionality}
function TTBase2DVisualizationFunctionality___CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTBase2DVisualizationFunctionality__CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

procedure TTBase2DVisualizationFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;

function TTBase2DVisualizationFunctionality__CreateObj(_Functionality_: TFunctionality;   pReflector: TAbstractReflector; pObjectVisualization: TObjectVisualization; const flAbsoluteCoords: boolean; const idTObj,idObj: integer; ptrOwner: TPtr): TPtr; stdcall;

procedure TTBase2DVisualizationFunctionality__DestroyObj(_Functionality_: TFunctionality;   const ptrDestrObj: TPtr); stdcall;

procedure TTBase2DVisualizationFunctionality__GetDisproportionObjects(_Functionality_: TFunctionality;   const Factor: double; out ObjectsList: TByteArray); stdcall;

function TTBase2DVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;

procedure TTBase2DVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;

function TTBase2DVisualizationFunctionality__StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall;


{TBase2DVisualizationFunctionality}
function TBase2DVisualizationFunctionality__Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TBase2DVisualizationFunctionality__ReflectOnCanvas(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TBase2DVisualizationFunctionality__CreateClone(_Functionality_: TFunctionality;   const ptrObj: TPtr; const ptrCloneOwner: TPtr; out idClone: integer); stdcall;

procedure TBase2DVisualizationFunctionality__GetLayInfo(_Functionality_: TFunctionality;   out Lay,SubLay: integer); stdcall;

function TBase2DVisualizationFunctionality__GetDetailsList(_Functionality_: TFunctionality;   out DetailsList: TComponentsList): boolean; stdcall;

function TBase2DVisualizationFunctionality__ReflectAsNotLoaded(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pCanvas: TCanvas): boolean; stdcall;

function TBase2DVisualizationFunctionality__ContainerFilled(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBase2DVisualizationFunctionality__GetProps(_Functionality_: TFunctionality;   out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor); stdcall;

procedure TBase2DVisualizationFunctionality__SetProps(_Functionality_: TFunctionality;   const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor); stdcall;

procedure TBase2DVisualizationFunctionality__CreateNode(_Functionality_: TFunctionality;   const CreateNodeIndex: integer; const X,Y: Double); stdcall;

procedure TBase2DVisualizationFunctionality__DestroyNode(_Functionality_: TFunctionality;   const DestroyNodeIndex: integer); stdcall;

procedure TBase2DVisualizationFunctionality__SetNode(_Functionality_: TFunctionality;   const SetNodeIndex: integer; const newX,newY: Double); stdcall;

procedure TBase2DVisualizationFunctionality__GetNodes(_Functionality_: TFunctionality;   out Nodes: TByteArray); stdcall;

procedure TBase2DVisualizationFunctionality__SetNodes(_Functionality_: TFunctionality;   const Nodes: TByteArray; const pWidth: double); stdcall;

procedure TBase2DVisualizationFunctionality__CheckPlace(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;

procedure TBase2DVisualizationFunctionality__Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Double); stdcall;

procedure TBase2DVisualizationFunctionality__SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Double); stdcall;

procedure TBase2DVisualizationFunctionality__ChangeScale(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double); stdcall;

procedure TBase2DVisualizationFunctionality__Rotate(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const Angle: Double); stdcall;

procedure TBase2DVisualizationFunctionality__ChangeLay(_Functionality_: TFunctionality;   const NewLayID: integer); stdcall;

procedure TBase2DVisualizationFunctionality__ChangeOwner(_Functionality_: TFunctionality;   const ptrNewOwner: TPtr); stdcall;

procedure TBase2DVisualizationFunctionality__Transform(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;

function TBase2DVisualizationFunctionality__Square(_Functionality_: TFunctionality): Double; stdcall;

function TBase2DVisualizationFunctionality__Square1(_Functionality_: TFunctionality;   const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: TCrd; const NewWidth: Double; const pScale: Double): Double; stdcall;

function TBase2DVisualizationFunctionality__GetFormatNodes(_Functionality_: TFunctionality;   out NodesList: TList; out SizeX,SizeY: integer): boolean; stdcall;

procedure TBase2DVisualizationFunctionality__GetInsideObjectsList(_Functionality_: TFunctionality;   out List: TComponentsList); stdcall;

function TBase2DVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;

procedure TBase2DVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;

function TBase2DVisualizationFunctionality__getIdLay(_Functionality_: TFunctionality): integer; stdcall;

function TBase2DVisualizationFunctionality__getWidth(_Functionality_: TFunctionality): Double; stdcall;

procedure TBase2DVisualizationFunctionality__setWidth(_Functionality_: TFunctionality;   Value: Double); stdcall;

function TBase2DVisualizationFunctionality__getflUserSecurity(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBase2DVisualizationFunctionality__setflUserSecurity(_Functionality_: TFunctionality;   Value: boolean); stdcall;

function TBase2DVisualizationFunctionality__getflDetailsNoIndex(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBase2DVisualizationFunctionality__setflDetailsNoIndex(_Functionality_: TFunctionality;   Value: boolean); stdcall;

function TBase2DVisualizationFunctionality__getflNotifyOwnerOnChange(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBase2DVisualizationFunctionality__setflNotifyOwnerOnChange(_Functionality_: TFunctionality;   Value: boolean); stdcall;


{TTLay2DVisualizationFunctionality}
function TTLay2DVisualizationFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall;

function TTLay2DVisualizationFunctionality__TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTLay2DVisualizationFunctionality__getName(_Functionality_: TFunctionality): string; stdcall;

function TTLay2DVisualizationFunctionality__getImage(_Functionality_: TFunctionality): TTypeImage; stdcall;

function TTLay2DVisualizationFunctionality___CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTLay2DVisualizationFunctionality__StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall;


{TLay2DVisualizationFunctionality}
procedure TLay2DVisualizationFunctionality__DestroyData(_Functionality_: TFunctionality); stdcall;

procedure TLay2DVisualizationFunctionality___ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall;

function TLay2DVisualizationFunctionality__CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall;

function TLay2DVisualizationFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TLay2DVisualizationFunctionality__GetOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TLay2DVisualizationFunctionality__getName(_Functionality_: TFunctionality): string; stdcall;

procedure TLay2DVisualizationFunctionality__setName(_Functionality_: TFunctionality;   Value: string); stdcall;

function TLay2DVisualizationFunctionality__getHint(_Functionality_: TFunctionality): string; stdcall;

procedure TLay2DVisualizationFunctionality__CloneData(_Functionality_: TFunctionality;   out idClone: integer); stdcall;

function TLay2DVisualizationFunctionality__Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

procedure TLay2DVisualizationFunctionality__GetObjectPointersList(_Functionality_: TFunctionality;   out List: TList); stdcall;

function TLay2DVisualizationFunctionality__isEmpty(_Functionality_: TFunctionality): boolean; stdcall;

function TLay2DVisualizationFunctionality__getNumber(_Functionality_: TFunctionality): integer; stdcall;

procedure TLay2DVisualizationFunctionality__GetParams(_Functionality_: TFunctionality;   out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); stdcall;

procedure TLay2DVisualizationFunctionality__GetParams1(_Functionality_: TFunctionality;   out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); stdcall;

procedure TLay2DVisualizationFunctionality__SetParams(_Functionality_: TFunctionality;   const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double); stdcall;


