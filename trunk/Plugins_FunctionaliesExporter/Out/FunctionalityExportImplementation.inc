//. the export routines

{TComponentFunctionality}
function TComponentFunctionality__getTypeSystem(_Functionality_: TFunctionality): TTypeSystem; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getTypeSystem;
end;

function TComponentFunctionality__getTableName(_Functionality_: TFunctionality): string; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getTableName;
end;

procedure TComponentFunctionality__Check(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).Check;
end;

procedure TComponentFunctionality__CheckUserOperation(_Functionality_: TFunctionality;   const idOperation: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).CheckUserOperation(idOperation);
end;

procedure TComponentFunctionality__InsertComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer;  var id: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).InsertComponent(idTComponent,idComponent,id);
end;

procedure TComponentFunctionality__RemoveComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).RemoveComponent(idTComponent,idComponent);
end;

procedure TComponentFunctionality___ToClone(_Functionality_: TFunctionality;   var idClone: integer); stdcall;
begin
TComponentFunctionality(_Functionality_)._ToClone(idClone);
end;

procedure TComponentFunctionality__ToClone(_Functionality_: TFunctionality;   var idClone: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).ToClone(idClone);
end;

procedure TComponentFunctionality__ToCloneUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer; var idClone: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).ToCloneUsingObject(idTUseObj,idUseObj,idClone);
end;

function TComponentFunctionality__CanDestroy(_Functionality_: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).CanDestroy(Reason);
end;

procedure TComponentFunctionality__Notify(_Functionality_: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).Notify(NotifyType,pidTObj,pidObj);
end;

function TComponentFunctionality__GetOwner(_Functionality_: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetOwner(idTOwner,idOwner);
end;

function TComponentFunctionality__SetComponentsUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

procedure TComponentFunctionality__DestroyComponents(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).DestroyComponents;
end;

procedure TComponentFunctionality__RemoveSelfAsComponent(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).RemoveSelfAsComponent;
end;

function TComponentFunctionality__IsUnReferenced(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).IsUnReferenced;
end;

function TComponentFunctionality__IsEmpty(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).IsEmpty;
end;

function TComponentFunctionality__DATASize(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).DATASize;
end;

procedure TComponentFunctionality__LoadFromFile(_Functionality_: TFunctionality;   const FileName: string); stdcall;
begin
TComponentFunctionality(_Functionality_).LoadFromFile(FileName);
end;

procedure TComponentFunctionality__LoadFromStream(_Functionality_: TFunctionality;   const Stream: TStream); stdcall;
begin
TComponentFunctionality(_Functionality_).LoadFromStream(Stream);
end;

procedure TComponentFunctionality__GetComponentsList(_Functionality_: TFunctionality;   var ComponentsList: TComponentsList); stdcall;
begin
TComponentFunctionality(_Functionality_).GetComponentsList(ComponentsList);
end;

function TComponentFunctionality__QueryComponents(_Functionality_: TFunctionality;   FunctionalityClass: TFunctionalityClass; out ComponentsList: TComponentsList): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).QueryComponents(FunctionalityClass,ComponentsList);
end;

function TComponentFunctionality__QueryComponents1(_Functionality_: TFunctionality;   const idTNeededType: integer; out ComponentsList: TComponentsList): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).QueryComponents(idTNeededType,ComponentsList);
end;

function TComponentFunctionality__QueryComponent(_Functionality_: TFunctionality;   const idTNeededType: integer; out idTComponent,idComponent: integer): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).QueryComponent(idTNeededType,idTComponent,idComponent);
end;

function TComponentFunctionality__QueryComponentFunctionality(_Functionality_: TFunctionality;   NeededFunctionalityClass: TFunctionalityClass; out Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).QueryComponentFunctionality(NeededFunctionalityClass,Functionality);
end;

function TComponentFunctionality__ComponentsCount(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).ComponentsCount;
end;

function TComponentFunctionality__GetRootOwner(_Functionality_: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetRootOwner(idTOwner,idOwner);
end;

function TComponentFunctionality__TPresentUpdater_Create(_Functionality_: TFunctionality;   pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).TPresentUpdater_Create(pUpdateProc,pOffProc);
end;

procedure TComponentFunctionality__CreateNewPanelProps(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).CreateNewPanelProps;
end;

procedure TComponentFunctionality__DestroyPanelProps(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).DestroyPanelProps;
end;

function TComponentFunctionality__IsPanelPropsExist(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).IsPanelPropsExist;
end;

function TComponentFunctionality__GetPanelPropsLeftTop(_Functionality_: TFunctionality;   var PanelProps_Left,PanelProps_Top: integer): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetPanelPropsLeftTop(PanelProps_Left,PanelProps_Top);
end;

function TComponentFunctionality__GetPanelPropsWidthHeight(_Functionality_: TFunctionality;   var PanelProps_Width,PanelProps_Height: integer): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetPanelPropsWidthHeight(PanelProps_Width,PanelProps_Height);
end;

procedure TComponentFunctionality__SetPanelPropsLeftTop(_Functionality_: TFunctionality;   const PanelProps_OfsX,PanelProps_OfsY: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).SetPanelPropsLeftTop(PanelProps_OfsX,PanelProps_OfsY);
end;

procedure TComponentFunctionality__SetPanelPropsWidthHeight(_Functionality_: TFunctionality;   const PanelProps_Width,PanelProps_Height: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).SetPanelPropsWidthHeight(PanelProps_Width,PanelProps_Height);
end;

function TComponentFunctionality__IsCustomPanelPropsExist(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).IsCustomPanelPropsExist;
end;

function TComponentFunctionality__idCustomPanelProps(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).idCustomPanelProps;
end;

function TComponentFunctionality__CustomPanelProps(_Functionality_: TFunctionality): TClientBlobStream; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).CustomPanelProps;
end;

procedure TComponentFunctionality__SetCustomPanelProps(_Functionality_: TFunctionality;   Stream: TStream; const flNewValue: boolean{если = true, то заменяет панелью с новым ID}); stdcall;
begin
TComponentFunctionality(_Functionality_).SetCustomPanelProps(Stream,flNewValue);
end;

procedure TComponentFunctionality__SetCustomPanelPropsByID(_Functionality_: TFunctionality;   const idPanelProps: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).SetCustomPanelPropsByID(idPanelProps);
end;

procedure TComponentFunctionality__ReleaseCustomPanelProps(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).ReleaseCustomPanelProps;
end;

function TComponentFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TComponentFunctionality__getName(_Functionality_: TFunctionality): shortstring; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getName;
end;

procedure TComponentFunctionality__setName(_Functionality_: TFunctionality;   Value: shortstring); stdcall;
begin
TComponentFunctionality(_Functionality_).setName(Value);
end;

function TComponentFunctionality__getHint(_Functionality_: TFunctionality): shortstring; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getHint;
end;

function TComponentFunctionality__GetIconImage(_Functionality_: TFunctionality;   out Image: TBitmap): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetIconImage(Image);
end;

function TComponentFunctionality__getidTObj(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getidTObj;
end;

function TComponentFunctionality__getSpace(_Functionality_: TFunctionality): TProxySpace; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getSpace;
end;

procedure TComponentFunctionality__DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).DoOnComponentUpdate;
end;

procedure TComponentFunctionality__GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;
begin
TComponentFunctionality(_Functionality_).GetExportDATA(Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;


{TTProxyObjectFunctionality}
function TTProxyObjectFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TTProxyObjectFunctionality(_Functionality_)._CreateInstance;
end;

procedure TTProxyObjectFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;
begin
TTProxyObjectFunctionality(_Functionality_)._DestroyInstance(idObj);
end;

function TTProxyObjectFunctionality__TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTProxyObjectFunctionality(_Functionality_).TComponentFunctionality_Create(idComponent);
end;

function TTProxyObjectFunctionality__getName(_Functionality_: TFunctionality): shortstring; stdcall;
begin
Result:=TTProxyObjectFunctionality(_Functionality_).getName;
end;

function TTProxyObjectFunctionality__getImage(_Functionality_: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTProxyObjectFunctionality(_Functionality_).getImage;
end;


{TProxyObjectFunctionality}
procedure TProxyObjectFunctionality___ToClone(_Functionality_: TFunctionality;   var idClone: integer); stdcall;
begin
TProxyObjectFunctionality(_Functionality_)._ToClone(idClone);
end;

function TProxyObjectFunctionality__CanDestroy(_Functionality_: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TProxyObjectFunctionality(_Functionality_).CanDestroy(Reason);
end;

function TProxyObjectFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TProxyObjectFunctionality(_Functionality_).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TProxyObjectFunctionality__getName(_Functionality_: TFunctionality): shortstring; stdcall;
begin
Result:=TProxyObjectFunctionality(_Functionality_).getName;
end;

function TProxyObjectFunctionality__getHint(_Functionality_: TFunctionality): shortstring; stdcall;
begin
Result:=TProxyObjectFunctionality(_Functionality_).getHint;
end;

function TProxyObjectFunctionality__GetReference(_Functionality_: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TProxyObjectFunctionality(_Functionality_).GetReference(idTOwner,idOwner);
end;

procedure TProxyObjectFunctionality__SetReference(_Functionality_: TFunctionality;   const idTOwner,idOwner: integer); stdcall;
begin
TProxyObjectFunctionality(_Functionality_).SetReference(idTOwner,idOwner);
end;


{TTBaseVisualizationFunctionality}
function TTBaseVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;
begin
Result:=TTBaseVisualizationFunctionality(_Functionality_).getReflector;
end;

procedure TTBaseVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;
begin
TTBaseVisualizationFunctionality(_Functionality_).setReflector(Value);
end;

function TTBaseVisualizationFunctionality__CanCreateAsDetail(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TTBaseVisualizationFunctionality(_Functionality_).CanCreateAsDetail;
end;

function TTBaseVisualizationFunctionality__ImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTBaseVisualizationFunctionality(_Functionality_).ImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;


{TBaseVisualizationFunctionality}
function TBaseVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;
begin
Result:=TBaseVisualizationFunctionality(_Functionality_).getReflector;
end;

procedure TBaseVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).setReflector(Value);
end;

function TBaseVisualizationFunctionality__getStrobing(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TBaseVisualizationFunctionality(_Functionality_).getStrobing;
end;

procedure TBaseVisualizationFunctionality__setStrobing(_Functionality_: TFunctionality;   Value: boolean); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).setStrobing(Value);
end;

function TBaseVisualizationFunctionality__getStrobingInterval(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TBaseVisualizationFunctionality(_Functionality_).getStrobingInterval;
end;

procedure TBaseVisualizationFunctionality__setStrobingInterval(_Functionality_: TFunctionality;   Value: integer); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).setStrobingInterval(Value);
end;

procedure TBaseVisualizationFunctionality__CheckUserOperation(_Functionality_: TFunctionality;   const idOperation: integer); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).CheckUserOperation(idOperation);
end;

procedure TBaseVisualizationFunctionality__DestroyData(_Functionality_: TFunctionality); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).DestroyData;
end;

procedure TBaseVisualizationFunctionality__CloneData(_Functionality_: TFunctionality;   var idClone: integer); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).CloneData(idClone);
end;

function TBaseVisualizationFunctionality__Ptr(_Functionality_: TFunctionality): TPtr; stdcall;
begin
Result:=TBaseVisualizationFunctionality(_Functionality_).Ptr;
end;

procedure TBaseVisualizationFunctionality__DoOnChangeScale(_Functionality_: TFunctionality;   const ChangeCoef: Extended); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).DoOnChangeScale(ChangeCoef);
end;

function TBaseVisualizationFunctionality__IsUnReferenced(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TBaseVisualizationFunctionality(_Functionality_).IsUnReferenced;
end;

function TBaseVisualizationFunctionality__TVisualizationUpdating_Create(_Functionality_: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;
begin
Result:=TBaseVisualizationFunctionality(_Functionality_).TVisualizationUpdating_Create(Reflecting);
end;

procedure TBaseVisualizationFunctionality__ReflectInScene(_Functionality_: TFunctionality;   Scene: TScene); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).ReflectInScene(Scene);
end;

procedure TBaseVisualizationFunctionality__Scaling(_Functionality_: TFunctionality;   const Scale: Extended); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).Scaling(Scale);
end;

procedure TBaseVisualizationFunctionality__SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Extended); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).SetPosition(X,Y,Z);
end;

procedure TBaseVisualizationFunctionality__Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Extended); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).Move(dX,dY,dZ);
end;

procedure TBaseVisualizationFunctionality__SetPropertiesLocal(_Functionality_: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Extended); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).SetPropertiesLocal(pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
end;

procedure TBaseVisualizationFunctionality__DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).DoOnComponentUpdate;
end;

procedure TBaseVisualizationFunctionality__DoOnDblClick(_Functionality_: TFunctionality); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).DoOnDblClick;
end;

procedure TBaseVisualizationFunctionality__GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).GetExportDATA(Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;


{TTBase2DVisualizationFunctionality}
function TTBase2DVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;
begin
Result:=TTBase2DVisualizationFunctionality(_Functionality_).getReflector;
end;

procedure TTBase2DVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;
begin
TTBase2DVisualizationFunctionality(_Functionality_).setReflector(Value);
end;

function TTBase2DVisualizationFunctionality___CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTBase2DVisualizationFunctionality(_Functionality_)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTBase2DVisualizationFunctionality__CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTBase2DVisualizationFunctionality(_Functionality_).CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

procedure TTBase2DVisualizationFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;
begin
TTBase2DVisualizationFunctionality(_Functionality_)._DestroyInstance(idObj);
end;

function TTBase2DVisualizationFunctionality__CreateObj(_Functionality_: TFunctionality;   pReflector: TAbstractReflector; pObjectVisualization: TObjectVisualization; const flAbsoluteCoords: boolean; const idTObj,idObj: integer; ptrOwner: TPtr): TPtr; stdcall;
begin
Result:=TTBase2DVisualizationFunctionality(_Functionality_).CreateObj(pReflector,pObjectVisualization,flAbsoluteCoords,idTObj,idObj,ptrOwner);
end;

procedure TTBase2DVisualizationFunctionality__DestroyObj(_Functionality_: TFunctionality;   const ptrDestrObj: TPtr); stdcall;
begin
TTBase2DVisualizationFunctionality(_Functionality_).DestroyObj(ptrDestrObj);
end;

function TTBase2DVisualizationFunctionality__StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTBase2DVisualizationFunctionality(_Functionality_).StdObjectVisualization;
end;


{TBase2DVisualizationFunctionality}
function TBase2DVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).getReflector;
end;

procedure TBase2DVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).setReflector(Value);
end;

function TBase2DVisualizationFunctionality__getIdLay(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).getIdLay;
end;

function TBase2DVisualizationFunctionality__Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TBase2DVisualizationFunctionality__CreateClone(_Functionality_: TFunctionality;   const ptrObj: TPtr; const ptrCloneOwner: TPtr; var idClone: integer); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).CreateClone(ptrObj,ptrCloneOwner,idClone);
end;

procedure TBase2DVisualizationFunctionality__GetLayInfo(_Functionality_: TFunctionality;   var Lay,SubLay: integer); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).GetLayInfo(Lay,SubLay);
end;

function TBase2DVisualizationFunctionality__ReflectAsNotLoaded(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).ReflectAsNotLoaded(pFigure,pAdditionalFigure,pReflectionWindow,pCanvas);
end;

procedure TBase2DVisualizationFunctionality__CheckPlace(_Functionality_: TFunctionality;   const Xbind,Ybind: Extended; const Scale: Extended; const Angle: Extended; const dX,dY: Extended); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).CheckPlace(Xbind,Ybind,Scale,Angle,dX,dY);
end;

procedure TBase2DVisualizationFunctionality__Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Extended); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).Move(dX,dY,dZ);
end;

procedure TBase2DVisualizationFunctionality__SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Extended); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).SetPosition(X,Y,Z);
end;

procedure TBase2DVisualizationFunctionality__ChangeScale(_Functionality_: TFunctionality;   const Xbind,Ybind: Extended; const Scale: Extended); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).ChangeScale(Xbind,Ybind,Scale);
end;

procedure TBase2DVisualizationFunctionality__Rotate(_Functionality_: TFunctionality;   const Xbind,Ybind: Extended; const Angle: Extended); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).Rotate(Xbind,Ybind,Angle);
end;

function TBase2DVisualizationFunctionality__Square(_Functionality_: TFunctionality): Extended; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).Square;
end;

function TBase2DVisualizationFunctionality__Square1(_Functionality_: TFunctionality;   const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: TCrd; const WidthCoef: Extended; const Scale: Extended): Extended; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).Square(ExceptPointPtr,ExceptPointValueX,ExceptPointValueY,WidthCoef,Scale);
end;


{TTLay2DVisualizationFunctionality}
function TTLay2DVisualizationFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TTLay2DVisualizationFunctionality(_Functionality_)._CreateInstance;
end;

function TTLay2DVisualizationFunctionality__TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTLay2DVisualizationFunctionality(_Functionality_).TComponentFunctionality_Create(idComponent);
end;

function TTLay2DVisualizationFunctionality__getName(_Functionality_: TFunctionality): shortstring; stdcall;
begin
Result:=TTLay2DVisualizationFunctionality(_Functionality_).getName;
end;

function TTLay2DVisualizationFunctionality__getImage(_Functionality_: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTLay2DVisualizationFunctionality(_Functionality_).getImage;
end;

function TTLay2DVisualizationFunctionality___CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTLay2DVisualizationFunctionality(_Functionality_)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTLay2DVisualizationFunctionality__StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTLay2DVisualizationFunctionality(_Functionality_).StdObjectVisualization;
end;


{TLay2DVisualizationFunctionality}
function TLay2DVisualizationFunctionality__getNumber(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).getNumber;
end;

procedure TLay2DVisualizationFunctionality__CheckUserOperation(_Functionality_: TFunctionality;   const idOperation: integer); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_).CheckUserOperation(idOperation);
end;

procedure TLay2DVisualizationFunctionality__DestroyData(_Functionality_: TFunctionality); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_).DestroyData;
end;

procedure TLay2DVisualizationFunctionality___ToClone(_Functionality_: TFunctionality;   var idClone: integer); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_)._ToClone(idClone);
end;

function TLay2DVisualizationFunctionality__CanDestroy(_Functionality_: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).CanDestroy(Reason);
end;

function TLay2DVisualizationFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLay2DVisualizationFunctionality__GetOwner(_Functionality_: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).GetOwner(idTOwner,idOwner);
end;

function TLay2DVisualizationFunctionality__getName(_Functionality_: TFunctionality): shortstring; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).getName;
end;

procedure TLay2DVisualizationFunctionality__setName(_Functionality_: TFunctionality;   Value: shortstring); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_).setName(Value);
end;

function TLay2DVisualizationFunctionality__getHint(_Functionality_: TFunctionality): shortstring; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).getHint;
end;

procedure TLay2DVisualizationFunctionality__CloneData(_Functionality_: TFunctionality;   var idClone: integer); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_).CloneData(idClone);
end;

function TLay2DVisualizationFunctionality__Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TLay2DVisualizationFunctionality__GetObjectPointersList(_Functionality_: TFunctionality;   var List: TList); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_).GetObjectPointersList(List);
end;

function TLay2DVisualizationFunctionality__isEmpty(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).isEmpty;
end;


