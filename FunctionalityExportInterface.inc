//. the export routines defines

{TTypeFunctionality}
function TTypeFunctionality___UserName(_Functionality_: TFunctionality): WideString; stdcall;

function TTypeFunctionality___UserPassword(_Functionality_: TFunctionality): WideString; stdcall;

procedure TTypeFunctionality___SetUser(_Functionality_: TFunctionality;   const pUserName: WideString; const pUserPassword: WideString); stdcall;

function TTypeFunctionality____CreateInstance(_Functionality_: TFunctionality): integer; stdcall;

function TTypeFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall;

function TTypeFunctionality___CreateInstanceUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer): integer; stdcall;

procedure TTypeFunctionality____DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;

procedure TTypeFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;

procedure TTypeFunctionality___GetInstanceList(_Functionality_: TFunctionality;   out List: TList); stdcall;

procedure TTypeFunctionality___GetInstanceList1(_Functionality_: TFunctionality;   out List: TByteArray); stdcall;

procedure TTypeFunctionality___GetInstanceNames(_Functionality_: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); stdcall;

procedure TTypeFunctionality___GetInstanceOwnerNames(_Functionality_: TFunctionality;   const IDs: TByteArray; out Data: TByteArray); stdcall;

procedure TTypeFunctionality___GetComponentDatas(_Functionality_: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; const DataFlags: TComponentDataFlags; out Datas: TComponentDatas); stdcall;

procedure TTypeFunctionality___GetComponentOwnerDatas(_Functionality_: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); stdcall;

function TTypeFunctionality___CheckImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTypeFunctionality___ImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTypeFunctionality___TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

procedure TTypeFunctionality___DoOnComponentOperation(_Functionality_: TFunctionality;   const idTObj,idObj: integer; const Operation: TComponentOperation); stdcall;

function TTypeFunctionality___getSpace(_Functionality_: TFunctionality): TProxySpace; stdcall;

function TTypeFunctionality___getidType(_Functionality_: TFunctionality): integer; stdcall;

function TTypeFunctionality___getName(_Functionality_: TFunctionality): string; stdcall;

function TTypeFunctionality___getImage(_Functionality_: TFunctionality): TTypeImage; stdcall;

function TTypeFunctionality___getTableName(_Functionality_: TFunctionality): string; stdcall;

function TTypeFunctionality___getImageList_Index(_Functionality_: TFunctionality): integer; stdcall;


{TComponentFunctionality}
procedure TComponentFunctionality___UpdateDATA(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality___ClearDATA(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality___UserName(_Functionality_: TFunctionality): WideString; stdcall;

function TComponentFunctionality___UserPassword(_Functionality_: TFunctionality): WideString; stdcall;

procedure TComponentFunctionality___SetUser(_Functionality_: TFunctionality;   const pUserName: WideString; const pUserPassword: WideString); stdcall;

function TComponentFunctionality___UserProfileFolder(_Functionality_: TFunctionality): string; stdcall;

function TComponentFunctionality___GetObjTID(_Functionality_: TFunctionality): integer; stdcall;

function TComponentFunctionality___GetObjID(_Functionality_: TFunctionality): integer; stdcall;

procedure TComponentFunctionality___Check(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality___CreationTimestamp(_Functionality_: TFunctionality): double; stdcall;

procedure TComponentFunctionality___CheckUserOperation(_Functionality_: TFunctionality;   const idOperation: integer); stdcall;

function TComponentFunctionality___GetSecurityComponent(_Functionality_: TFunctionality;   out idSecurityComponent: integer): boolean; stdcall;

procedure TComponentFunctionality___ChangeSecurity(_Functionality_: TFunctionality;   const pidSecurityFile: integer); stdcall;

function TComponentFunctionality___IsUserDataExists(_Functionality_: TFunctionality;   const DataName: string): boolean; stdcall;

function TComponentFunctionality___DeleteUserData(_Functionality_: TFunctionality;   const DataName: string): boolean; stdcall;

procedure TComponentFunctionality___SetUserData(_Functionality_: TFunctionality;   const DataName: string; const Data: TMemoryStream); stdcall;

procedure TComponentFunctionality___GetUserData(_Functionality_: TFunctionality;   const DataName: string; out Data: TMemoryStream); stdcall;

procedure TComponentFunctionality___InsertComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer;  out id: integer); stdcall;

procedure TComponentFunctionality___CloneAndInsertComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer; out idClone: integer; out id: integer); stdcall;

procedure TComponentFunctionality___ImportAndInsertComponents(_Functionality_: TFunctionality;   const ImportFileName: string; out ComponentsList: TComponentsList); stdcall;

procedure TComponentFunctionality___DestroyComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer); stdcall;

procedure TComponentFunctionality___RemoveComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer); stdcall;

procedure TComponentFunctionality____ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall;

procedure TComponentFunctionality___ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall;

procedure TComponentFunctionality___ToCloneUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer; out idClone: integer); stdcall;

function TComponentFunctionality___CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall;

function TComponentFunctionality___Notify(_Functionality_: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;

function TComponentFunctionality___GetOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TComponentFunctionality___SetComponentsUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;

procedure TComponentFunctionality___DestroyComponents(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality___RemoveSelfAsComponent(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality___IsUnReferenced(_Functionality_: TFunctionality): boolean; stdcall;

function TComponentFunctionality___IsEmpty(_Functionality_: TFunctionality): boolean; stdcall;

function TComponentFunctionality___DATASize(_Functionality_: TFunctionality): integer; stdcall;

procedure TComponentFunctionality___LoadFromFile(_Functionality_: TFunctionality;   const FileName: string); stdcall;

procedure TComponentFunctionality___LoadFromStream(_Functionality_: TFunctionality;   const Stream: TStream); stdcall;

procedure TComponentFunctionality___GetComponentsList(_Functionality_: TFunctionality;   out ComponentsList: TComponentsList); stdcall;

procedure TComponentFunctionality___GetComponentsList1(_Functionality_: TFunctionality;   out ComponentsList: TByteArray); stdcall;

function TComponentFunctionality___QueryComponents(_Functionality_: TFunctionality;   FunctionalityClass: TFunctionalityClass; out ComponentsList: TComponentsList): boolean; stdcall;

function TComponentFunctionality___QueryComponents1(_Functionality_: TFunctionality;   const idTNeededType: integer; out ComponentsList: TComponentsList): boolean; stdcall;

function TComponentFunctionality___QueryComponentsWithTag(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out ComponentsList: TComponentsList): boolean; stdcall;

function TComponentFunctionality___QueryComponentsWithTag1(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean; stdcall;

function TComponentFunctionality___QueryComponent(_Functionality_: TFunctionality;   const idTNeededType: integer; out idTComponent,idComponent: integer): boolean; stdcall;

function TComponentFunctionality___QueryComponentWithTag(_Functionality_: TFunctionality;   const pTag: integer; out idTComponent,idComponent: integer): boolean; stdcall;

function TComponentFunctionality___QueryComponentWithTag1(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean; stdcall;

function TComponentFunctionality___QueryComponentFunctionality(_Functionality_: TFunctionality;   NeededFunctionalityClass: TFunctionalityClass; out Functionality: TFunctionality): boolean; stdcall;

function TComponentFunctionality___ComponentsCount(_Functionality_: TFunctionality): integer; stdcall;

function TComponentFunctionality___GetRootOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TComponentFunctionality___TPresentUpdater_Create(_Functionality_: TFunctionality;   pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater; stdcall;

function TComponentFunctionality___TContextComponentHolder_Create(_Functionality_: TFunctionality): TComponentPresentUpdater; stdcall;

procedure TComponentFunctionality___RealityRating_AddUserRate(_Functionality_: TFunctionality;   const Rate: integer; const RateReason: WideString); stdcall;

procedure TComponentFunctionality___RealityRating_GetAverageRate(_Functionality_: TFunctionality;   out AvrRate: double; out RateCount: integer); stdcall;

procedure TComponentFunctionality___RealityRating_GetData(_Functionality_: TFunctionality;   out RatingData: TByteArray); stdcall;

function TComponentFunctionality___ActualityInterval_Get(_Functionality_: TFunctionality): TComponentActualityInterval; stdcall;

procedure TComponentFunctionality___ActualityInterval_GetTimestamps(_Functionality_: TFunctionality;   out BeginTimestamp,EndTimestamp: double); stdcall;

function TComponentFunctionality___ActualityInterval_GetLocally(_Functionality_: TFunctionality): TComponentActualityInterval; stdcall;

procedure TComponentFunctionality___ActualityInterval_SetEndTimestamp(_Functionality_: TFunctionality;   const Value: double); stdcall;

function TComponentFunctionality___ActualityInterval_IsActualForTime(_Functionality_: TFunctionality;   const pTime: double): boolean; stdcall;

function TComponentFunctionality___ActualityInterval_IsActualForTimeInterval(_Functionality_: TFunctionality;   const pInterval: TComponentActualityInterval): boolean; stdcall;

function TComponentFunctionality___ActualityInterval_IsActualForTimeLocally(_Functionality_: TFunctionality;   const pTime: double): boolean; stdcall;

function TComponentFunctionality___ActualityInterval_IsActualForTimeIntervalLocally(_Functionality_: TFunctionality;   const pInterval: TComponentActualityInterval): boolean; stdcall;

procedure TComponentFunctionality___ActualityInterval_Actualize(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality___ActualityInterval_Deactualize(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality___CreateNewPanelProps(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality___DestroyPanelProps(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality___IsPanelPropsExist(_Functionality_: TFunctionality): boolean; stdcall;

function TComponentFunctionality___GetPanelPropsLeftTop(_Functionality_: TFunctionality;   out PanelProps_Left,PanelProps_Top: integer): boolean; stdcall;

function TComponentFunctionality___GetPanelPropsWidthHeight(_Functionality_: TFunctionality;   out PanelProps_Width,PanelProps_Height: integer): boolean; stdcall;

procedure TComponentFunctionality___SetPanelPropsLeftTop(_Functionality_: TFunctionality;   const PanelProps_OfsX,PanelProps_OfsY: integer); stdcall;

procedure TComponentFunctionality___SetPanelPropsWidthHeight(_Functionality_: TFunctionality;   const PanelProps_Width,PanelProps_Height: integer); stdcall;

function TComponentFunctionality___IsCustomPanelPropsExist(_Functionality_: TFunctionality): boolean; stdcall;

function TComponentFunctionality___idCustomPanelProps(_Functionality_: TFunctionality): integer; stdcall;

function TComponentFunctionality___CustomPanelProps(_Functionality_: TFunctionality): TMemoryStream; stdcall;

procedure TComponentFunctionality___SetCustomPanelProps(_Functionality_: TFunctionality;   Stream: TStream; const flNewValue: boolean{если = true, то заменяет панелью с новым ID}); stdcall;

procedure TComponentFunctionality___SetCustomPanelPropsByID(_Functionality_: TFunctionality;   const idPanelProps: integer); stdcall;

procedure TComponentFunctionality___ReleaseCustomPanelProps(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality___TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TComponentFunctionality___getSpace(_Functionality_: TFunctionality): TProxySpace; stdcall;

function TComponentFunctionality___getidTObj(_Functionality_: TFunctionality): integer; stdcall;

function TComponentFunctionality___getName(_Functionality_: TFunctionality): string; stdcall;

procedure TComponentFunctionality___setName(_Functionality_: TFunctionality;   Value: string); stdcall;

function TComponentFunctionality___getHint(_Functionality_: TFunctionality): string; stdcall;

function TComponentFunctionality___getTag(_Functionality_: TFunctionality): integer; stdcall;

procedure TComponentFunctionality___setTag(_Functionality_: TFunctionality;   Value: integer); stdcall;

function TComponentFunctionality___GetIconImage(_Functionality_: TFunctionality;   out Image: TBitmap): boolean; stdcall;

procedure TComponentFunctionality___DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall;

procedure TComponentFunctionality___GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;

function TComponentFunctionality____GetDataDocument(_Functionality_: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;

function TComponentFunctionality___GetDataDocument(_Functionality_: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean; stdcall;

function TComponentFunctionality___GetHintInfo(_Functionality_: TFunctionality;   const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall;

procedure TComponentFunctionality___NotifyOnComponentUpdate(_Functionality_: TFunctionality); stdcall;

function TComponentFunctionality___GetComponentDATA(_Functionality_: TFunctionality;   const Version: integer): TByteArray; stdcall;

procedure TComponentFunctionality___SetComponentDATA(_Functionality_: TFunctionality;   const Data: TByteArray); stdcall;

function TComponentFunctionality___getTypeSystem(_Functionality_: TFunctionality): TTypeSystem; stdcall;

function TComponentFunctionality___getTableName(_Functionality_: TFunctionality): string; stdcall;


{TTProxyObjectFunctionality}
function TTProxyObjectFunctionality____CreateInstance(_Functionality_: TFunctionality): integer; stdcall;

procedure TTProxyObjectFunctionality____DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;

function TTProxyObjectFunctionality___TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTProxyObjectFunctionality___getName(_Functionality_: TFunctionality): string; stdcall;

function TTProxyObjectFunctionality___getImage(_Functionality_: TFunctionality): TTypeImage; stdcall;


{TProxyObjectFunctionality}
procedure TProxyObjectFunctionality____ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall;

function TProxyObjectFunctionality___CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall;

function TProxyObjectFunctionality___TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TProxyObjectFunctionality___getName(_Functionality_: TFunctionality): string; stdcall;

function TProxyObjectFunctionality___getHint(_Functionality_: TFunctionality): string; stdcall;

function TProxyObjectFunctionality___GetReference(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

procedure TProxyObjectFunctionality___SetReference(_Functionality_: TFunctionality;   const idTOwner,idOwner: integer); stdcall;


{TTBaseVisualizationFunctionality}
procedure TTBaseVisualizationFunctionality___GetComponentOwnerDatas(_Functionality_: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); stdcall;

function TTBaseVisualizationFunctionality___CanCreateAsDetail(_Functionality_: TFunctionality): boolean; stdcall;

function TTBaseVisualizationFunctionality___ImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;

function TTBaseVisualizationFunctionality___getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;

procedure TTBaseVisualizationFunctionality___setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;


{TBaseVisualizationFunctionality}
procedure TBaseVisualizationFunctionality___DestroyData(_Functionality_: TFunctionality); stdcall;

procedure TBaseVisualizationFunctionality___CloneData(_Functionality_: TFunctionality;   out idClone: integer); stdcall;

function TBaseVisualizationFunctionality___Ptr(_Functionality_: TFunctionality): TPtr; stdcall;

procedure TBaseVisualizationFunctionality___DoOnChangeScale(_Functionality_: TFunctionality;   const ChangeCoef: Double); stdcall;

function TBaseVisualizationFunctionality___IsUnReferenced(_Functionality_: TFunctionality): boolean; stdcall;

function TBaseVisualizationFunctionality___TVisualizationUpdating_Create(_Functionality_: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;

procedure TBaseVisualizationFunctionality___ReflectInScene(_Functionality_: TFunctionality;   Scene: TScene); stdcall;

procedure TBaseVisualizationFunctionality___Scaling(_Functionality_: TFunctionality;   const pScale: Double); stdcall;

procedure TBaseVisualizationFunctionality___SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Double); stdcall;

procedure TBaseVisualizationFunctionality___Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Double); stdcall;

procedure TBaseVisualizationFunctionality___ChangeScale(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double); stdcall;

procedure TBaseVisualizationFunctionality___Rotate(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const Angle: Double); stdcall;

procedure TBaseVisualizationFunctionality___Transform(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;

procedure TBaseVisualizationFunctionality___SetPropertiesLocal(_Functionality_: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall;

procedure TBaseVisualizationFunctionality___DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall;

function TBaseVisualizationFunctionality___DoOnOver(_Functionality_: TFunctionality): boolean; stdcall;

function TBaseVisualizationFunctionality___DoOnClick(_Functionality_: TFunctionality): boolean; stdcall;

function TBaseVisualizationFunctionality___DoOnDblClick(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBaseVisualizationFunctionality___GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;

procedure TBaseVisualizationFunctionality___GetOwnerByVisualization(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr); stdcall;

function TBaseVisualizationFunctionality___GetCoVisualizationSpaces(_Functionality_: TFunctionality;   out List: TList): boolean; stdcall;

function TBaseVisualizationFunctionality___GetCoVisualizationSpaces1(_Functionality_: TFunctionality;   out List: TByteArray): boolean; stdcall;

function TBaseVisualizationFunctionality___getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;

procedure TBaseVisualizationFunctionality___setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;

function TBaseVisualizationFunctionality___getStrobing(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBaseVisualizationFunctionality___setStrobing(_Functionality_: TFunctionality;   Value: boolean); stdcall;

function TBaseVisualizationFunctionality___getStrobingInterval(_Functionality_: TFunctionality): integer; stdcall;

procedure TBaseVisualizationFunctionality___setStrobingInterval(_Functionality_: TFunctionality;   Value: integer); stdcall;


{TTBase2DVisualizationFunctionality}
function TTBase2DVisualizationFunctionality____CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTBase2DVisualizationFunctionality___CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

procedure TTBase2DVisualizationFunctionality____DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;

function TTBase2DVisualizationFunctionality___CreateObj(_Functionality_: TFunctionality;   pReflector: TAbstractReflector; pObjectVisualization: TObjectVisualization; const flAbsoluteCoords: boolean; const idTObj,idObj: integer; ptrOwner: TPtr): TPtr; stdcall;

procedure TTBase2DVisualizationFunctionality___DestroyObj(_Functionality_: TFunctionality;   const ptrDestrObj: TPtr); stdcall;

procedure TTBase2DVisualizationFunctionality___GetDisproportionObjects(_Functionality_: TFunctionality;   const Factor: double; out ObjectsList: TByteArray); stdcall;

function TTBase2DVisualizationFunctionality___getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;

procedure TTBase2DVisualizationFunctionality___setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;

function TTBase2DVisualizationFunctionality___StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall;


{TBase2DVisualizationFunctionality}
function TBase2DVisualizationFunctionality___Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

function TBase2DVisualizationFunctionality___ReflectOnCanvas(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;

procedure TBase2DVisualizationFunctionality___CreateClone(_Functionality_: TFunctionality;   const ptrObj: TPtr; const ptrCloneOwner: TPtr; out idClone: integer); stdcall;

procedure TBase2DVisualizationFunctionality___GetLayInfo(_Functionality_: TFunctionality;   out Lay,SubLay: integer); stdcall;

function TBase2DVisualizationFunctionality___GetDetailsList(_Functionality_: TFunctionality;   out DetailsList: TComponentsList): boolean; stdcall;

function TBase2DVisualizationFunctionality___ReflectAsNotLoaded(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pCanvas: TCanvas): boolean; stdcall;

function TBase2DVisualizationFunctionality___ContainerFilled(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBase2DVisualizationFunctionality___GetProps(_Functionality_: TFunctionality;   out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor); stdcall;

procedure TBase2DVisualizationFunctionality___SetProps(_Functionality_: TFunctionality;   const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor); stdcall;

procedure TBase2DVisualizationFunctionality___CreateNode(_Functionality_: TFunctionality;   const CreateNodeIndex: integer; const X,Y: Double); stdcall;

procedure TBase2DVisualizationFunctionality___DestroyNode(_Functionality_: TFunctionality;   const DestroyNodeIndex: integer); stdcall;

procedure TBase2DVisualizationFunctionality___SetNode(_Functionality_: TFunctionality;   const SetNodeIndex: integer; const newX,newY: Double); stdcall;

procedure TBase2DVisualizationFunctionality___GetNodes(_Functionality_: TFunctionality;   out Nodes: TByteArray); stdcall;

procedure TBase2DVisualizationFunctionality___SetNodes(_Functionality_: TFunctionality;   const Nodes: TByteArray; const pWidth: double); stdcall;

procedure TBase2DVisualizationFunctionality___CheckPlace(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;

procedure TBase2DVisualizationFunctionality___Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Double); stdcall;

procedure TBase2DVisualizationFunctionality___SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Double); stdcall;

procedure TBase2DVisualizationFunctionality___ChangeScale(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double); stdcall;

procedure TBase2DVisualizationFunctionality___Rotate(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const Angle: Double); stdcall;

procedure TBase2DVisualizationFunctionality___ChangeLay(_Functionality_: TFunctionality;   const NewLayID: integer); stdcall;

procedure TBase2DVisualizationFunctionality___ChangeOwner(_Functionality_: TFunctionality;   const ptrNewOwner: TPtr); stdcall;

procedure TBase2DVisualizationFunctionality___Transform(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;

function TBase2DVisualizationFunctionality___Square(_Functionality_: TFunctionality): Double; stdcall;

function TBase2DVisualizationFunctionality___Square1(_Functionality_: TFunctionality;   const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: TCrd; const NewWidth: Double; const pScale: Double): Double; stdcall;

function TBase2DVisualizationFunctionality___GetFormatNodes(_Functionality_: TFunctionality;   out NodesList: TList; out SizeX,SizeY: integer): boolean; stdcall;

procedure TBase2DVisualizationFunctionality___GetInsideObjectsList(_Functionality_: TFunctionality;   out List: TComponentsList); stdcall;

function TBase2DVisualizationFunctionality___getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;

procedure TBase2DVisualizationFunctionality___setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;

function TBase2DVisualizationFunctionality___getIdLay(_Functionality_: TFunctionality): integer; stdcall;

function TBase2DVisualizationFunctionality___getWidth(_Functionality_: TFunctionality): Double; stdcall;

procedure TBase2DVisualizationFunctionality___setWidth(_Functionality_: TFunctionality;   Value: Double); stdcall;

function TBase2DVisualizationFunctionality___getflUserSecurity(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBase2DVisualizationFunctionality___setflUserSecurity(_Functionality_: TFunctionality;   Value: boolean); stdcall;

function TBase2DVisualizationFunctionality___getflDetailsNoIndex(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBase2DVisualizationFunctionality___setflDetailsNoIndex(_Functionality_: TFunctionality;   Value: boolean); stdcall;

function TBase2DVisualizationFunctionality___getflNotifyOwnerOnChange(_Functionality_: TFunctionality): boolean; stdcall;

procedure TBase2DVisualizationFunctionality___setflNotifyOwnerOnChange(_Functionality_: TFunctionality;   Value: boolean); stdcall;


{TTLay2DVisualizationFunctionality}
function TTLay2DVisualizationFunctionality____CreateInstance(_Functionality_: TFunctionality): integer; stdcall;

function TTLay2DVisualizationFunctionality___TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;

function TTLay2DVisualizationFunctionality___getName(_Functionality_: TFunctionality): string; stdcall;

function TTLay2DVisualizationFunctionality___getImage(_Functionality_: TFunctionality): TTypeImage; stdcall;

function TTLay2DVisualizationFunctionality____CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;

function TTLay2DVisualizationFunctionality___StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall;


{TLay2DVisualizationFunctionality}
procedure TLay2DVisualizationFunctionality___DestroyData(_Functionality_: TFunctionality); stdcall;

procedure TLay2DVisualizationFunctionality____ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall;

function TLay2DVisualizationFunctionality___CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall;

function TLay2DVisualizationFunctionality___TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;

function TLay2DVisualizationFunctionality___GetOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;

function TLay2DVisualizationFunctionality___getName(_Functionality_: TFunctionality): string; stdcall;

procedure TLay2DVisualizationFunctionality___setName(_Functionality_: TFunctionality;   Value: string); stdcall;

function TLay2DVisualizationFunctionality___getHint(_Functionality_: TFunctionality): string; stdcall;

procedure TLay2DVisualizationFunctionality___CloneData(_Functionality_: TFunctionality;   out idClone: integer); stdcall;

function TLay2DVisualizationFunctionality___Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;

procedure TLay2DVisualizationFunctionality___GetObjectPointersList(_Functionality_: TFunctionality;   out List: TList); stdcall;

function TLay2DVisualizationFunctionality___isEmpty(_Functionality_: TFunctionality): boolean; stdcall;

function TLay2DVisualizationFunctionality___getNumber(_Functionality_: TFunctionality): integer; stdcall;

procedure TLay2DVisualizationFunctionality___GetParams(_Functionality_: TFunctionality;   out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); stdcall;

procedure TLay2DVisualizationFunctionality___GetParams1(_Functionality_: TFunctionality;   out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); stdcall;

procedure TLay2DVisualizationFunctionality___SetParams(_Functionality_: TFunctionality;   const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double); stdcall;


