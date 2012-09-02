//. the export routines

{TTypeFunctionality}
function TTypeFunctionality__UserName(_Functionality_: TFunctionality): WideString; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).UserName;
end;

function TTypeFunctionality__UserPassword(_Functionality_: TFunctionality): WideString; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).UserPassword;
end;

function TTypeFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_)._CreateInstance;
end;

function TTypeFunctionality__CreateInstance(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).CreateInstance;
end;

function TTypeFunctionality__CreateInstanceUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer): integer; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).CreateInstanceUsingObject(idTUseObj,idUseObj);
end;

procedure TTypeFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;
begin
TTypeFunctionality(_Functionality_)._DestroyInstance(idObj);
end;

procedure TTypeFunctionality__DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall;
begin
TTypeFunctionality(_Functionality_).DestroyInstance(idObj);
end;

procedure TTypeFunctionality__GetInstanceList(_Functionality_: TFunctionality;   out List: TList); stdcall;
begin
TTypeFunctionality(_Functionality_).GetInstanceList(List);
end;

procedure TTypeFunctionality__GetInstanceList1(_Functionality_: TFunctionality;   out List: TByteArray); stdcall;
begin
TTypeFunctionality(_Functionality_).GetInstanceList(List);
end;

procedure TTypeFunctionality__GetInstanceNames(_Functionality_: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); stdcall;
begin
TTypeFunctionality(_Functionality_).GetInstanceNames(IDs,IDs_Offset,IDs_Size,Names);
end;

procedure TTypeFunctionality__GetInstanceOwnerNames(_Functionality_: TFunctionality;   const IDs: TByteArray; out Data: TByteArray); stdcall;
begin
TTypeFunctionality(_Functionality_).GetInstanceOwnerNames(IDs,Data);
end;

procedure TTypeFunctionality__GetComponentDatas(_Functionality_: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; const DataFlags: TComponentDataFlags; out Datas: TComponentDatas); stdcall;
begin
TTypeFunctionality(_Functionality_).GetComponentDatas(IDs,IDs_Offset,IDs_Size,DataFlags,Datas);
end;

procedure TTypeFunctionality__GetComponentOwnerDatas(_Functionality_: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); stdcall;
begin
TTypeFunctionality(_Functionality_).GetComponentOwnerDatas(IDs,DataFlags,Data);
end;

function TTypeFunctionality__CheckImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).CheckImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTypeFunctionality__ImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).ImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTypeFunctionality__TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).TComponentFunctionality_Create(idComponent);
end;

procedure TTypeFunctionality__DoOnComponentOperation(_Functionality_: TFunctionality;   const idTObj,idObj: integer; const Operation: TComponentOperation); stdcall;
begin
TTypeFunctionality(_Functionality_).DoOnComponentOperation(idTObj,idObj,Operation);
end;

function TTypeFunctionality__getSpace(_Functionality_: TFunctionality): TProxySpace; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).getSpace;
end;

function TTypeFunctionality__getidType(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).getidType;
end;

function TTypeFunctionality__getName(_Functionality_: TFunctionality): string; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).getName;
end;

function TTypeFunctionality__getImage(_Functionality_: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).getImage;
end;

function TTypeFunctionality__getTableName(_Functionality_: TFunctionality): string; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).getTableName;
end;

function TTypeFunctionality__getImageList_Index(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TTypeFunctionality(_Functionality_).getImageList_Index;
end;


{TComponentFunctionality}
procedure TComponentFunctionality__UpdateDATA(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).UpdateDATA;
end;

procedure TComponentFunctionality__ClearDATA(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).ClearDATA;
end;

function TComponentFunctionality__UserName(_Functionality_: TFunctionality): WideString; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).UserName;
end;

function TComponentFunctionality__UserPassword(_Functionality_: TFunctionality): WideString; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).UserPassword;
end;

procedure TComponentFunctionality__SetUser(_Functionality_: TFunctionality;   const pUserName: WideString; const pUserPassword: WideString); stdcall;
begin
TComponentFunctionality(_Functionality_).SetUser(pUserName,pUserPassword);
end;

function TComponentFunctionality__UserProfileFolder(_Functionality_: TFunctionality): string; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).UserProfileFolder;
end;

function TComponentFunctionality__GetObjTID(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetObjTID;
end;

function TComponentFunctionality__GetObjID(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetObjID;
end;

procedure TComponentFunctionality__Check(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).Check;
end;

function TComponentFunctionality__CreationTimestamp(_Functionality_: TFunctionality): double; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).CreationTimestamp;
end;

procedure TComponentFunctionality__CheckUserOperation(_Functionality_: TFunctionality;   const idOperation: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).CheckUserOperation(idOperation);
end;

function TComponentFunctionality__GetSecurityComponent(_Functionality_: TFunctionality;   out idSecurityComponent: integer): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetSecurityComponent(idSecurityComponent);
end;

procedure TComponentFunctionality__ChangeSecurity(_Functionality_: TFunctionality;   const pidSecurityFile: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).ChangeSecurity(pidSecurityFile);
end;

function TComponentFunctionality__IsUserDataExists(_Functionality_: TFunctionality;   const DataName: string): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).IsUserDataExists(DataName);
end;

function TComponentFunctionality__DeleteUserData(_Functionality_: TFunctionality;   const DataName: string): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).DeleteUserData(DataName);
end;

procedure TComponentFunctionality__SetUserData(_Functionality_: TFunctionality;   const DataName: string; const Data: TMemoryStream); stdcall;
begin
TComponentFunctionality(_Functionality_).SetUserData(DataName,Data);
end;

procedure TComponentFunctionality__GetUserData(_Functionality_: TFunctionality;   const DataName: string; out Data: TMemoryStream); stdcall;
begin
TComponentFunctionality(_Functionality_).GetUserData(DataName,Data);
end;

procedure TComponentFunctionality__InsertComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer;  out id: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).InsertComponent(idTComponent,idComponent,id);
end;

procedure TComponentFunctionality__CloneAndInsertComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer; out idClone: integer; out id: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).CloneAndInsertComponent(idTComponent,idComponent,idClone,id);
end;

procedure TComponentFunctionality__ImportAndInsertComponents(_Functionality_: TFunctionality;   const ImportFileName: string; out ComponentsList: TComponentsList); stdcall;
begin
TComponentFunctionality(_Functionality_).ImportAndInsertComponents(ImportFileName,ComponentsList);
end;

procedure TComponentFunctionality__DestroyComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).DestroyComponent(idTComponent,idComponent);
end;

procedure TComponentFunctionality__RemoveComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).RemoveComponent(idTComponent,idComponent);
end;

procedure TComponentFunctionality___ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall;
begin
TComponentFunctionality(_Functionality_)._ToClone(idClone);
end;

procedure TComponentFunctionality__ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).ToClone(idClone);
end;

procedure TComponentFunctionality__ToCloneUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer; out idClone: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).ToCloneUsingObject(idTUseObj,idUseObj,idClone);
end;

function TComponentFunctionality__CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).CanDestroy(Reason);
end;

function TComponentFunctionality__Notify(_Functionality_: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).Notify(NotifyType,pidTObj,pidObj);
end;

function TComponentFunctionality__GetOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
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

procedure TComponentFunctionality__GetComponentsList(_Functionality_: TFunctionality;   out ComponentsList: TComponentsList); stdcall;
begin
TComponentFunctionality(_Functionality_).GetComponentsList(ComponentsList);
end;

procedure TComponentFunctionality__GetComponentsList1(_Functionality_: TFunctionality;   out ComponentsList: TByteArray); stdcall;
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

function TComponentFunctionality__QueryComponentsWithTag(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out ComponentsList: TComponentsList): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).QueryComponentsWithTag(idTNeededType,pTag,ComponentsList);
end;

function TComponentFunctionality__QueryComponentsWithTag1(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).QueryComponentsWithTag(idTNeededType,pTag,ComponentsList);
end;

function TComponentFunctionality__QueryComponent(_Functionality_: TFunctionality;   const idTNeededType: integer; out idTComponent,idComponent: integer): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).QueryComponent(idTNeededType,idTComponent,idComponent);
end;

function TComponentFunctionality__QueryComponentWithTag(_Functionality_: TFunctionality;   const pTag: integer; out idTComponent,idComponent: integer): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).QueryComponentWithTag(pTag,idTComponent,idComponent);
end;

function TComponentFunctionality__QueryComponentWithTag1(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).QueryComponentWithTag(idTNeededType,pTag,idTComponent,idComponent);
end;

function TComponentFunctionality__QueryComponentFunctionality(_Functionality_: TFunctionality;   NeededFunctionalityClass: TFunctionalityClass; out Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).QueryComponentFunctionality(NeededFunctionalityClass,Functionality);
end;

function TComponentFunctionality__ComponentsCount(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).ComponentsCount;
end;

function TComponentFunctionality__GetRootOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetRootOwner(idTOwner,idOwner);
end;

function TComponentFunctionality__TPresentUpdater_Create(_Functionality_: TFunctionality;   pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).TPresentUpdater_Create(pUpdateProc,pOffProc);
end;

function TComponentFunctionality__TContextComponentHolder_Create(_Functionality_: TFunctionality): TComponentPresentUpdater; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).TContextComponentHolder_Create;
end;

procedure TComponentFunctionality__RealityRating_AddUserRate(_Functionality_: TFunctionality;   const Rate: integer; const RateReason: WideString); stdcall;
begin
TComponentFunctionality(_Functionality_).RealityRating_AddUserRate(Rate,RateReason);
end;

procedure TComponentFunctionality__RealityRating_GetAverageRate(_Functionality_: TFunctionality;   out AvrRate: double; out RateCount: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).RealityRating_GetAverageRate(AvrRate,RateCount);
end;

procedure TComponentFunctionality__RealityRating_GetData(_Functionality_: TFunctionality;   out RatingData: TByteArray); stdcall;
begin
TComponentFunctionality(_Functionality_).RealityRating_GetData(RatingData);
end;

function TComponentFunctionality__ActualityInterval_Get(_Functionality_: TFunctionality): TComponentActualityInterval; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).ActualityInterval_Get;
end;

procedure TComponentFunctionality__ActualityInterval_GetTimestamps(_Functionality_: TFunctionality;   out BeginTimestamp,EndTimestamp: double); stdcall;
begin
TComponentFunctionality(_Functionality_).ActualityInterval_GetTimestamps(BeginTimestamp,EndTimestamp);
end;

function TComponentFunctionality__ActualityInterval_GetLocally(_Functionality_: TFunctionality): TComponentActualityInterval; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).ActualityInterval_GetLocally;
end;

procedure TComponentFunctionality__ActualityInterval_SetEndTimestamp(_Functionality_: TFunctionality;   const Value: double); stdcall;
begin
TComponentFunctionality(_Functionality_).ActualityInterval_SetEndTimestamp(Value);
end;

function TComponentFunctionality__ActualityInterval_IsActualForTime(_Functionality_: TFunctionality;   const pTime: double): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).ActualityInterval_IsActualForTime(pTime);
end;

function TComponentFunctionality__ActualityInterval_IsActualForTimeInterval(_Functionality_: TFunctionality;   const pInterval: TComponentActualityInterval): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).ActualityInterval_IsActualForTimeInterval(pInterval);
end;

function TComponentFunctionality__ActualityInterval_IsActualForTimeLocally(_Functionality_: TFunctionality;   const pTime: double): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).ActualityInterval_IsActualForTimeLocally(pTime);
end;

function TComponentFunctionality__ActualityInterval_IsActualForTimeIntervalLocally(_Functionality_: TFunctionality;   const pInterval: TComponentActualityInterval): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).ActualityInterval_IsActualForTimeIntervalLocally(pInterval);
end;

procedure TComponentFunctionality__ActualityInterval_Actualize(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).ActualityInterval_Actualize;
end;

procedure TComponentFunctionality__ActualityInterval_Deactualize(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).ActualityInterval_Deactualize;
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

function TComponentFunctionality__GetPanelPropsLeftTop(_Functionality_: TFunctionality;   out PanelProps_Left,PanelProps_Top: integer): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetPanelPropsLeftTop(PanelProps_Left,PanelProps_Top);
end;

function TComponentFunctionality__GetPanelPropsWidthHeight(_Functionality_: TFunctionality;   out PanelProps_Width,PanelProps_Height: integer): boolean; stdcall;
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

function TComponentFunctionality__CustomPanelProps(_Functionality_: TFunctionality): TMemoryStream; stdcall;
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

function TComponentFunctionality__getSpace(_Functionality_: TFunctionality): TProxySpace; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getSpace;
end;

function TComponentFunctionality__getidTObj(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getidTObj;
end;

function TComponentFunctionality__getName(_Functionality_: TFunctionality): string; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getName;
end;

procedure TComponentFunctionality__setName(_Functionality_: TFunctionality;   Value: string); stdcall;
begin
TComponentFunctionality(_Functionality_).setName(Value);
end;

function TComponentFunctionality__getHint(_Functionality_: TFunctionality): string; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getHint;
end;

function TComponentFunctionality__getTag(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getTag;
end;

procedure TComponentFunctionality__setTag(_Functionality_: TFunctionality;   Value: integer); stdcall;
begin
TComponentFunctionality(_Functionality_).setTag(Value);
end;

function TComponentFunctionality__GetIconImage(_Functionality_: TFunctionality;   out Image: TBitmap): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetIconImage(Image);
end;

procedure TComponentFunctionality__DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).DoOnComponentUpdate;
end;

procedure TComponentFunctionality__GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;
begin
TComponentFunctionality(_Functionality_).GetExportDATA(Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;

function TComponentFunctionality___GetDataDocument(_Functionality_: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_)._GetDataDocument(DataModel,DataType,flWithComponents,Document);
end;

function TComponentFunctionality__GetDataDocument(_Functionality_: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetDataDocument(DataModel,DataType,flWithComponents,Document);
end;

function TComponentFunctionality__GetHintInfo(_Functionality_: TFunctionality;   const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetHintInfo(InfoType,InfoFormat,HintInfo);
end;

procedure TComponentFunctionality__NotifyOnComponentUpdate(_Functionality_: TFunctionality); stdcall;
begin
TComponentFunctionality(_Functionality_).NotifyOnComponentUpdate;
end;

function TComponentFunctionality__GetComponentDATA(_Functionality_: TFunctionality;   const Version: integer): TByteArray; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).GetComponentDATA(Version);
end;

procedure TComponentFunctionality__SetComponentDATA(_Functionality_: TFunctionality;   const Data: TByteArray); stdcall;
begin
TComponentFunctionality(_Functionality_).SetComponentDATA(Data);
end;

function TComponentFunctionality__getTypeSystem(_Functionality_: TFunctionality): TTypeSystem; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getTypeSystem;
end;

function TComponentFunctionality__getTableName(_Functionality_: TFunctionality): string; stdcall;
begin
Result:=TComponentFunctionality(_Functionality_).getTableName;
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

function TTProxyObjectFunctionality__getName(_Functionality_: TFunctionality): string; stdcall;
begin
Result:=TTProxyObjectFunctionality(_Functionality_).getName;
end;

function TTProxyObjectFunctionality__getImage(_Functionality_: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTProxyObjectFunctionality(_Functionality_).getImage;
end;


{TProxyObjectFunctionality}
procedure TProxyObjectFunctionality___ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall;
begin
TProxyObjectFunctionality(_Functionality_)._ToClone(idClone);
end;

function TProxyObjectFunctionality__CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall;
begin
Result:=TProxyObjectFunctionality(_Functionality_).CanDestroy(Reason);
end;

function TProxyObjectFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TProxyObjectFunctionality(_Functionality_).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TProxyObjectFunctionality__getName(_Functionality_: TFunctionality): string; stdcall;
begin
Result:=TProxyObjectFunctionality(_Functionality_).getName;
end;

function TProxyObjectFunctionality__getHint(_Functionality_: TFunctionality): string; stdcall;
begin
Result:=TProxyObjectFunctionality(_Functionality_).getHint;
end;

function TProxyObjectFunctionality__GetReference(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TProxyObjectFunctionality(_Functionality_).GetReference(idTOwner,idOwner);
end;

procedure TProxyObjectFunctionality__SetReference(_Functionality_: TFunctionality;   const idTOwner,idOwner: integer); stdcall;
begin
TProxyObjectFunctionality(_Functionality_).SetReference(idTOwner,idOwner);
end;


{TTBaseVisualizationFunctionality}
procedure TTBaseVisualizationFunctionality__GetComponentOwnerDatas(_Functionality_: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); stdcall;
begin
TTBaseVisualizationFunctionality(_Functionality_).GetComponentOwnerDatas(IDs,DataFlags,Data);
end;

function TTBaseVisualizationFunctionality__CanCreateAsDetail(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TTBaseVisualizationFunctionality(_Functionality_).CanCreateAsDetail;
end;

function TTBaseVisualizationFunctionality__ImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTBaseVisualizationFunctionality(_Functionality_).ImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTBaseVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;
begin
Result:=TTBaseVisualizationFunctionality(_Functionality_).getReflector;
end;

procedure TTBaseVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;
begin
TTBaseVisualizationFunctionality(_Functionality_).setReflector(Value);
end;


{TBaseVisualizationFunctionality}
procedure TBaseVisualizationFunctionality__DestroyData(_Functionality_: TFunctionality); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).DestroyData;
end;

procedure TBaseVisualizationFunctionality__CloneData(_Functionality_: TFunctionality;   out idClone: integer); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).CloneData(idClone);
end;

function TBaseVisualizationFunctionality__Ptr(_Functionality_: TFunctionality): TPtr; stdcall;
begin
Result:=TBaseVisualizationFunctionality(_Functionality_).Ptr;
end;

procedure TBaseVisualizationFunctionality__DoOnChangeScale(_Functionality_: TFunctionality;   const ChangeCoef: Double); stdcall;
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

procedure TBaseVisualizationFunctionality__Scaling(_Functionality_: TFunctionality;   const pScale: Double); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).Scaling(pScale);
end;

procedure TBaseVisualizationFunctionality__SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Double); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).SetPosition(X,Y,Z);
end;

procedure TBaseVisualizationFunctionality__Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Double); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).Move(dX,dY,dZ);
end;

procedure TBaseVisualizationFunctionality__ChangeScale(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).ChangeScale(Xbind,Ybind,pScale);
end;

procedure TBaseVisualizationFunctionality__Rotate(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const Angle: Double); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).Rotate(Xbind,Ybind,Angle);
end;

procedure TBaseVisualizationFunctionality__Transform(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).Transform(Xbind,Ybind,pScale,Angle,dX,dY);
end;

procedure TBaseVisualizationFunctionality__SetPropertiesLocal(_Functionality_: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).SetPropertiesLocal(pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
end;

procedure TBaseVisualizationFunctionality__DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).DoOnComponentUpdate;
end;

function TBaseVisualizationFunctionality__DoOnOver(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TBaseVisualizationFunctionality(_Functionality_).DoOnOver;
end;

function TBaseVisualizationFunctionality__DoOnClick(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TBaseVisualizationFunctionality(_Functionality_).DoOnClick;
end;

function TBaseVisualizationFunctionality__DoOnDblClick(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TBaseVisualizationFunctionality(_Functionality_).DoOnDblClick;
end;

procedure TBaseVisualizationFunctionality__GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).GetExportDATA(Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;

procedure TBaseVisualizationFunctionality__GetOwnerByVisualization(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr); stdcall;
begin
TBaseVisualizationFunctionality(_Functionality_).GetOwnerByVisualization(idTOwner,idOwner,ptrOwnerVisualization);
end;

function TBaseVisualizationFunctionality__GetCoVisualizationSpaces(_Functionality_: TFunctionality;   out List: TList): boolean; stdcall;
begin
Result:=TBaseVisualizationFunctionality(_Functionality_).GetCoVisualizationSpaces(List);
end;

function TBaseVisualizationFunctionality__GetCoVisualizationSpaces1(_Functionality_: TFunctionality;   out List: TByteArray): boolean; stdcall;
begin
Result:=TBaseVisualizationFunctionality(_Functionality_).GetCoVisualizationSpaces(List);
end;

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


{TTBase2DVisualizationFunctionality}
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

procedure TTBase2DVisualizationFunctionality__GetDisproportionObjects(_Functionality_: TFunctionality;   const Factor: double; out ObjectsList: TByteArray); stdcall;
begin
TTBase2DVisualizationFunctionality(_Functionality_).GetDisproportionObjects(Factor,ObjectsList);
end;

function TTBase2DVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall;
begin
Result:=TTBase2DVisualizationFunctionality(_Functionality_).getReflector;
end;

procedure TTBase2DVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall;
begin
TTBase2DVisualizationFunctionality(_Functionality_).setReflector(Value);
end;

function TTBase2DVisualizationFunctionality__StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTBase2DVisualizationFunctionality(_Functionality_).StdObjectVisualization;
end;


{TBase2DVisualizationFunctionality}
function TBase2DVisualizationFunctionality__Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TBase2DVisualizationFunctionality__ReflectOnCanvas(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).ReflectOnCanvas(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TBase2DVisualizationFunctionality__CreateClone(_Functionality_: TFunctionality;   const ptrObj: TPtr; const ptrCloneOwner: TPtr; out idClone: integer); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).CreateClone(ptrObj,ptrCloneOwner,idClone);
end;

procedure TBase2DVisualizationFunctionality__GetLayInfo(_Functionality_: TFunctionality;   out Lay,SubLay: integer); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).GetLayInfo(Lay,SubLay);
end;

function TBase2DVisualizationFunctionality__GetDetailsList(_Functionality_: TFunctionality;   out DetailsList: TComponentsList): boolean; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).GetDetailsList(DetailsList);
end;

function TBase2DVisualizationFunctionality__ReflectAsNotLoaded(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).ReflectAsNotLoaded(pFigure,pAdditionalFigure,pReflectionWindow,pCanvas);
end;

function TBase2DVisualizationFunctionality__ContainerFilled(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).ContainerFilled;
end;

procedure TBase2DVisualizationFunctionality__GetProps(_Functionality_: TFunctionality;   out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).GetProps(oflagLoop,oColor,oWidth,oflagFill,oColorFill);
end;

procedure TBase2DVisualizationFunctionality__SetProps(_Functionality_: TFunctionality;   const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).SetProps(pflagLoop,pColor,pWidth,pflagFill,pColorFill);
end;

procedure TBase2DVisualizationFunctionality__CreateNode(_Functionality_: TFunctionality;   const CreateNodeIndex: integer; const X,Y: Double); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).CreateNode(CreateNodeIndex,X,Y);
end;

procedure TBase2DVisualizationFunctionality__DestroyNode(_Functionality_: TFunctionality;   const DestroyNodeIndex: integer); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).DestroyNode(DestroyNodeIndex);
end;

procedure TBase2DVisualizationFunctionality__SetNode(_Functionality_: TFunctionality;   const SetNodeIndex: integer; const newX,newY: Double); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).SetNode(SetNodeIndex,newX,newY);
end;

procedure TBase2DVisualizationFunctionality__GetNodes(_Functionality_: TFunctionality;   out Nodes: TByteArray); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).GetNodes(Nodes);
end;

procedure TBase2DVisualizationFunctionality__SetNodes(_Functionality_: TFunctionality;   const Nodes: TByteArray; const pWidth: double); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).SetNodes(Nodes,pWidth);
end;

procedure TBase2DVisualizationFunctionality__CheckPlace(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).CheckPlace(Xbind,Ybind,pScale,Angle,dX,dY);
end;

procedure TBase2DVisualizationFunctionality__Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Double); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).Move(dX,dY,dZ);
end;

procedure TBase2DVisualizationFunctionality__SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Double); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).SetPosition(X,Y,Z);
end;

procedure TBase2DVisualizationFunctionality__ChangeScale(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).ChangeScale(Xbind,Ybind,pScale);
end;

procedure TBase2DVisualizationFunctionality__Rotate(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const Angle: Double); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).Rotate(Xbind,Ybind,Angle);
end;

procedure TBase2DVisualizationFunctionality__ChangeLay(_Functionality_: TFunctionality;   const NewLayID: integer); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).ChangeLay(NewLayID);
end;

procedure TBase2DVisualizationFunctionality__ChangeOwner(_Functionality_: TFunctionality;   const ptrNewOwner: TPtr); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).ChangeOwner(ptrNewOwner);
end;

procedure TBase2DVisualizationFunctionality__Transform(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).Transform(Xbind,Ybind,pScale,Angle,dX,dY);
end;

function TBase2DVisualizationFunctionality__Square(_Functionality_: TFunctionality): Double; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).Square;
end;

function TBase2DVisualizationFunctionality__Square1(_Functionality_: TFunctionality;   const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: TCrd; const NewWidth: Double; const pScale: Double): Double; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).Square(ExceptPointPtr,ExceptPointValueX,ExceptPointValueY,NewWidth,pScale);
end;

function TBase2DVisualizationFunctionality__GetFormatNodes(_Functionality_: TFunctionality;   out NodesList: TList; out SizeX,SizeY: integer): boolean; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).GetFormatNodes(NodesList,SizeX,SizeY);
end;

procedure TBase2DVisualizationFunctionality__GetInsideObjectsList(_Functionality_: TFunctionality;   out List: TComponentsList); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).GetInsideObjectsList(List);
end;

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

function TBase2DVisualizationFunctionality__getWidth(_Functionality_: TFunctionality): Double; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).getWidth;
end;

procedure TBase2DVisualizationFunctionality__setWidth(_Functionality_: TFunctionality;   Value: Double); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).setWidth(Value);
end;

function TBase2DVisualizationFunctionality__getflUserSecurity(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).getflUserSecurity;
end;

procedure TBase2DVisualizationFunctionality__setflUserSecurity(_Functionality_: TFunctionality;   Value: boolean); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).setflUserSecurity(Value);
end;

function TBase2DVisualizationFunctionality__getflDetailsNoIndex(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).getflDetailsNoIndex;
end;

procedure TBase2DVisualizationFunctionality__setflDetailsNoIndex(_Functionality_: TFunctionality;   Value: boolean); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).setflDetailsNoIndex(Value);
end;

function TBase2DVisualizationFunctionality__getflNotifyOwnerOnChange(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TBase2DVisualizationFunctionality(_Functionality_).getflNotifyOwnerOnChange;
end;

procedure TBase2DVisualizationFunctionality__setflNotifyOwnerOnChange(_Functionality_: TFunctionality;   Value: boolean); stdcall;
begin
TBase2DVisualizationFunctionality(_Functionality_).setflNotifyOwnerOnChange(Value);
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

function TTLay2DVisualizationFunctionality__getName(_Functionality_: TFunctionality): string; stdcall;
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
procedure TLay2DVisualizationFunctionality__DestroyData(_Functionality_: TFunctionality); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_).DestroyData;
end;

procedure TLay2DVisualizationFunctionality___ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_)._ToClone(idClone);
end;

function TLay2DVisualizationFunctionality__CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).CanDestroy(Reason);
end;

function TLay2DVisualizationFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLay2DVisualizationFunctionality__GetOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).GetOwner(idTOwner,idOwner);
end;

function TLay2DVisualizationFunctionality__getName(_Functionality_: TFunctionality): string; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).getName;
end;

procedure TLay2DVisualizationFunctionality__setName(_Functionality_: TFunctionality;   Value: string); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_).setName(Value);
end;

function TLay2DVisualizationFunctionality__getHint(_Functionality_: TFunctionality): string; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).getHint;
end;

procedure TLay2DVisualizationFunctionality__CloneData(_Functionality_: TFunctionality;   out idClone: integer); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_).CloneData(idClone);
end;

function TLay2DVisualizationFunctionality__Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

procedure TLay2DVisualizationFunctionality__GetObjectPointersList(_Functionality_: TFunctionality;   out List: TList); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_).GetObjectPointersList(List);
end;

function TLay2DVisualizationFunctionality__isEmpty(_Functionality_: TFunctionality): boolean; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).isEmpty;
end;

function TLay2DVisualizationFunctionality__getNumber(_Functionality_: TFunctionality): integer; stdcall;
begin
Result:=TLay2DVisualizationFunctionality(_Functionality_).getNumber;
end;

procedure TLay2DVisualizationFunctionality__GetParams(_Functionality_: TFunctionality;   out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_).GetParams(oName,oVisibleMinScale,oVisibleMaxScale);
end;

procedure TLay2DVisualizationFunctionality__GetParams1(_Functionality_: TFunctionality;   out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_).GetParams(oName,oNumber,oVisibleMinScale,oVisibleMaxScale);
end;

procedure TLay2DVisualizationFunctionality__SetParams(_Functionality_: TFunctionality;   const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double); stdcall;
begin
TLay2DVisualizationFunctionality(_Functionality_).SetParams(pName,pVisibleMinScale,pVisibleMaxScale);
end;


