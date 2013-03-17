//. import  functionality routines implementations

{TTypeFunctionality}
function TTypeFunctionality___UserName(_Functionality_: TFunctionality): WideString; stdcall; external FunctionalityDLL;
function TTypeFunctionality.UserName: WideString;
begin
Result:=TTypeFunctionality___UserName(Self);
end;

function TTypeFunctionality___UserPassword(_Functionality_: TFunctionality): WideString; stdcall; external FunctionalityDLL;
function TTypeFunctionality.UserPassword: WideString;
begin
Result:=TTypeFunctionality___UserPassword(Self);
end;

procedure TTypeFunctionality___SetUser(_Functionality_: TFunctionality;   const pUserName: WideString; const pUserPassword: WideString); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.SetUser(const pUserName: WideString; const pUserPassword: WideString);
begin
TTypeFunctionality___SetUser(Self,   pUserName,pUserPassword);
end;

function TTypeFunctionality____CreateInstance(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality._CreateInstance: integer;
begin
Result:=TTypeFunctionality____CreateInstance(Self);
end;

function TTypeFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality.CreateInstance: integer;
begin
Result:=TTypeFunctionality___CreateInstance(Self);
end;

function TTypeFunctionality___CreateInstanceUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality.CreateInstanceUsingObject(const idTUseObj,idUseObj: integer): integer;
begin
Result:=TTypeFunctionality___CreateInstanceUsingObject(Self,   idTUseObj,idUseObj);
end;

procedure TTypeFunctionality____DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality._DestroyInstance(const idObj: integer);
begin
TTypeFunctionality____DestroyInstance(Self,   idObj);
end;

procedure TTypeFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.DestroyInstance(const idObj: integer);
begin
TTypeFunctionality___DestroyInstance(Self,   idObj);
end;

procedure TTypeFunctionality___GetInstanceList(_Functionality_: TFunctionality;   out List: TList); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.GetInstanceList(out List: TList);
begin
TTypeFunctionality___GetInstanceList(Self,   List);
end;

procedure TTypeFunctionality___GetInstanceList1(_Functionality_: TFunctionality;   out List: TByteArray); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.GetInstanceList1(out List: TByteArray);
begin
TTypeFunctionality___GetInstanceList1(Self,   List);
end;

procedure TTypeFunctionality___GetInstanceNames(_Functionality_: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.GetInstanceNames(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList);
begin
TTypeFunctionality___GetInstanceNames(Self,   IDs,IDs_Offset,IDs_Size,Names);
end;

procedure TTypeFunctionality___GetInstanceOwnerNames(_Functionality_: TFunctionality;   const IDs: TByteArray; out Data: TByteArray); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.GetInstanceOwnerNames(const IDs: TByteArray; out Data: TByteArray);
begin
TTypeFunctionality___GetInstanceOwnerNames(Self,   IDs,Data);
end;

procedure TTypeFunctionality___GetComponentDatas(_Functionality_: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; const DataFlags: TComponentDataFlags; out Datas: TComponentDatas); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.GetComponentDatas(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; const DataFlags: TComponentDataFlags; out Datas: TComponentDatas);
begin
TTypeFunctionality___GetComponentDatas(Self,   IDs,IDs_Offset,IDs_Size,DataFlags,Datas);
end;

procedure TTypeFunctionality___GetComponentOwnerDatas(_Functionality_: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
begin
TTypeFunctionality___GetComponentOwnerDatas(Self,   IDs,DataFlags,Data);
end;

function TTypeFunctionality___CheckImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality.CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
Result:=TTypeFunctionality___CheckImportInstance(Self,   ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTypeFunctionality___ImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality.ImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
Result:=TTypeFunctionality___ImportInstance(Self,   ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTypeFunctionality___TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external FunctionalityDLL;
function TTypeFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTypeFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

procedure TTypeFunctionality___DoOnComponentOperation(_Functionality_: TFunctionality;   const idTObj,idObj: integer; const Operation: TComponentOperation); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
TTypeFunctionality___DoOnComponentOperation(Self,   idTObj,idObj,Operation);
end;

function TTypeFunctionality___getSpace(_Functionality_: TFunctionality): TProxySpace; stdcall; external FunctionalityDLL;
function TTypeFunctionality.getSpace: TProxySpace;
begin
Result:=TTypeFunctionality___getSpace(Self);
end;

function TTypeFunctionality___getidType(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality.getidType: integer;
begin
Result:=TTypeFunctionality___getidType(Self);
end;

function TTypeFunctionality___getName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TTypeFunctionality.getName: string;
begin
Result:=TTypeFunctionality___getName(Self);
end;

function TTypeFunctionality___getImage(_Functionality_: TFunctionality): TTypeImage; stdcall; external FunctionalityDLL;
function TTypeFunctionality.getImage: TTypeImage;
begin
Result:=TTypeFunctionality___getImage(Self);
end;

function TTypeFunctionality___getTableName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TTypeFunctionality.getTableName: string;
begin
Result:=TTypeFunctionality___getTableName(Self);
end;

function TTypeFunctionality___getImageList_Index(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality.getImageList_Index: integer;
begin
Result:=TTypeFunctionality___getImageList_Index(Self);
end;


{TComponentFunctionality}
procedure TComponentFunctionality___UpdateDATA(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.UpdateDATA;
begin
TComponentFunctionality___UpdateDATA(Self);
end;

procedure TComponentFunctionality___ClearDATA(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ClearDATA;
begin
TComponentFunctionality___ClearDATA(Self);
end;

function TComponentFunctionality___UserName(_Functionality_: TFunctionality): WideString; stdcall; external FunctionalityDLL;
function TComponentFunctionality.UserName: WideString;
begin
Result:=TComponentFunctionality___UserName(Self);
end;

function TComponentFunctionality___UserPassword(_Functionality_: TFunctionality): WideString; stdcall; external FunctionalityDLL;
function TComponentFunctionality.UserPassword: WideString;
begin
Result:=TComponentFunctionality___UserPassword(Self);
end;

procedure TComponentFunctionality___SetUser(_Functionality_: TFunctionality;   const pUserName: WideString; const pUserPassword: WideString); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetUser(const pUserName: WideString; const pUserPassword: WideString);
begin
TComponentFunctionality___SetUser(Self,   pUserName,pUserPassword);
end;

function TComponentFunctionality___UserProfileFolder(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TComponentFunctionality.UserProfileFolder: string;
begin
Result:=TComponentFunctionality___UserProfileFolder(Self);
end;

function TComponentFunctionality___GetObjTID(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetObjTID: integer;
begin
Result:=TComponentFunctionality___GetObjTID(Self);
end;

function TComponentFunctionality___GetObjID(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetObjID: integer;
begin
Result:=TComponentFunctionality___GetObjID(Self);
end;

procedure TComponentFunctionality___Check(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.Check;
begin
TComponentFunctionality___Check(Self);
end;

function TComponentFunctionality___CreationTimestamp(_Functionality_: TFunctionality): double; stdcall; external FunctionalityDLL;
function TComponentFunctionality.CreationTimestamp: double;
begin
Result:=TComponentFunctionality___CreationTimestamp(Self);
end;

procedure TComponentFunctionality___CheckUserOperation(_Functionality_: TFunctionality;   const idOperation: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.CheckUserOperation(const idOperation: integer);
begin
TComponentFunctionality___CheckUserOperation(Self,   idOperation);
end;

function TComponentFunctionality___GetSecurityComponent(_Functionality_: TFunctionality;   out idSecurityComponent: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetSecurityComponent(out idSecurityComponent: integer): boolean;
begin
Result:=TComponentFunctionality___GetSecurityComponent(Self,   idSecurityComponent);
end;

procedure TComponentFunctionality___ChangeSecurity(_Functionality_: TFunctionality;   const pidSecurityFile: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ChangeSecurity(const pidSecurityFile: integer);
begin
TComponentFunctionality___ChangeSecurity(Self,   pidSecurityFile);
end;

function TComponentFunctionality___IsUserDataExists(_Functionality_: TFunctionality;   const DataName: string): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.IsUserDataExists(const DataName: string): boolean;
begin
Result:=TComponentFunctionality___IsUserDataExists(Self,   DataName);
end;

function TComponentFunctionality___DeleteUserData(_Functionality_: TFunctionality;   const DataName: string): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.DeleteUserData(const DataName: string): boolean;
begin
Result:=TComponentFunctionality___DeleteUserData(Self,   DataName);
end;

procedure TComponentFunctionality___SetUserData(_Functionality_: TFunctionality;   const DataName: string; const Data: TMemoryStream); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetUserData(const DataName: string; const Data: TMemoryStream);
begin
TComponentFunctionality___SetUserData(Self,   DataName,Data);
end;

procedure TComponentFunctionality___GetUserData(_Functionality_: TFunctionality;   const DataName: string; out Data: TMemoryStream); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.GetUserData(const DataName: string; out Data: TMemoryStream);
begin
TComponentFunctionality___GetUserData(Self,   DataName,Data);
end;

procedure TComponentFunctionality___InsertComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer;  out id: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.InsertComponent(const idTComponent,idComponent: integer;  out id: integer);
begin
TComponentFunctionality___InsertComponent(Self,   idTComponent,idComponent,id);
end;

procedure TComponentFunctionality___CloneAndInsertComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer; out idClone: integer; out id: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.CloneAndInsertComponent(const idTComponent,idComponent: integer; out idClone: integer; out id: integer);
begin
TComponentFunctionality___CloneAndInsertComponent(Self,   idTComponent,idComponent,idClone,id);
end;

procedure TComponentFunctionality___ImportAndInsertComponents(_Functionality_: TFunctionality;   const ImportFileName: string; out ComponentsList: TComponentsList); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ImportAndInsertComponents(const ImportFileName: string; out ComponentsList: TComponentsList);
begin
TComponentFunctionality___ImportAndInsertComponents(Self,   ImportFileName,ComponentsList);
end;

procedure TComponentFunctionality___DestroyComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.DestroyComponent(const idTComponent,idComponent: integer);
begin
TComponentFunctionality___DestroyComponent(Self,   idTComponent,idComponent);
end;

procedure TComponentFunctionality___RemoveComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.RemoveComponent(const idTComponent,idComponent: integer);
begin
TComponentFunctionality___RemoveComponent(Self,   idTComponent,idComponent);
end;

procedure TComponentFunctionality____ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality._ToClone(out idClone: integer);
begin
TComponentFunctionality____ToClone(Self,   idClone);
end;

procedure TComponentFunctionality___ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ToClone(out idClone: integer);
begin
TComponentFunctionality___ToClone(Self,   idClone);
end;

procedure TComponentFunctionality___ToCloneUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer; out idClone: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ToCloneUsingObject(const idTUseObj,idUseObj: integer; out idClone: integer);
begin
TComponentFunctionality___ToCloneUsingObject(Self,   idTUseObj,idUseObj,idClone);
end;

function TComponentFunctionality___CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.CanDestroy(out Reason: string): boolean;
begin
Result:=TComponentFunctionality___CanDestroy(Self,   Reason);
end;

function TComponentFunctionality___Notify(_Functionality_: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external FunctionalityDLL;
function TComponentFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TComponentFunctionality___Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TComponentFunctionality___GetOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TComponentFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TComponentFunctionality___SetComponentsUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TComponentFunctionality___SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

procedure TComponentFunctionality___DestroyComponents(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.DestroyComponents;
begin
TComponentFunctionality___DestroyComponents(Self);
end;

procedure TComponentFunctionality___RemoveSelfAsComponent(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.RemoveSelfAsComponent;
begin
TComponentFunctionality___RemoveSelfAsComponent(Self);
end;

function TComponentFunctionality___IsUnReferenced(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.IsUnReferenced: boolean;
begin
Result:=TComponentFunctionality___IsUnReferenced(Self);
end;

function TComponentFunctionality___IsEmpty(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.IsEmpty: boolean;
begin
Result:=TComponentFunctionality___IsEmpty(Self);
end;

function TComponentFunctionality___DATASize(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.DATASize: integer;
begin
Result:=TComponentFunctionality___DATASize(Self);
end;

procedure TComponentFunctionality___LoadFromFile(_Functionality_: TFunctionality;   const FileName: string); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.LoadFromFile(const FileName: string);
begin
TComponentFunctionality___LoadFromFile(Self,   FileName);
end;

procedure TComponentFunctionality___LoadFromStream(_Functionality_: TFunctionality;   const Stream: TStream); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.LoadFromStream(const Stream: TStream);
begin
TComponentFunctionality___LoadFromStream(Self,   Stream);
end;

procedure TComponentFunctionality___GetComponentsList(_Functionality_: TFunctionality;   out ComponentsList: TComponentsList); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.GetComponentsList(out ComponentsList: TComponentsList);
begin
TComponentFunctionality___GetComponentsList(Self,   ComponentsList);
end;

procedure TComponentFunctionality___GetComponentsList1(_Functionality_: TFunctionality;   out ComponentsList: TByteArray); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.GetComponentsList1(out ComponentsList: TByteArray);
begin
TComponentFunctionality___GetComponentsList1(Self,   ComponentsList);
end;

function TComponentFunctionality___QueryComponents(_Functionality_: TFunctionality;   FunctionalityClass: TFunctionalityClass; out ComponentsList: TComponentsList): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponents(FunctionalityClass: TFunctionalityClass; out ComponentsList: TComponentsList): boolean;
begin
Result:=TComponentFunctionality___QueryComponents(Self,   FunctionalityClass,ComponentsList);
end;

function TComponentFunctionality___QueryComponents1(_Functionality_: TFunctionality;   const idTNeededType: integer; out ComponentsList: TComponentsList): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponents1(const idTNeededType: integer; out ComponentsList: TComponentsList): boolean;
begin
Result:=TComponentFunctionality___QueryComponents1(Self,   idTNeededType,ComponentsList);
end;

function TComponentFunctionality___QueryComponentsWithTag(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out ComponentsList: TComponentsList): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponentsWithTag(const idTNeededType: integer; const pTag: integer; out ComponentsList: TComponentsList): boolean;
begin
Result:=TComponentFunctionality___QueryComponentsWithTag(Self,   idTNeededType,pTag,ComponentsList);
end;

function TComponentFunctionality___QueryComponentsWithTag1(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponentsWithTag1(const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean;
begin
Result:=TComponentFunctionality___QueryComponentsWithTag1(Self,   idTNeededType,pTag,ComponentsList);
end;

function TComponentFunctionality___QueryComponent(_Functionality_: TFunctionality;   const idTNeededType: integer; out idTComponent,idComponent: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponent(const idTNeededType: integer; out idTComponent,idComponent: integer): boolean;
begin
Result:=TComponentFunctionality___QueryComponent(Self,   idTNeededType,idTComponent,idComponent);
end;

function TComponentFunctionality___QueryComponentWithTag(_Functionality_: TFunctionality;   const pTag: integer; out idTComponent,idComponent: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponentWithTag(const pTag: integer; out idTComponent,idComponent: integer): boolean;
begin
Result:=TComponentFunctionality___QueryComponentWithTag(Self,   pTag,idTComponent,idComponent);
end;

function TComponentFunctionality___QueryComponentWithTag1(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponentWithTag1(const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean;
begin
Result:=TComponentFunctionality___QueryComponentWithTag1(Self,   idTNeededType,pTag,idTComponent,idComponent);
end;

function TComponentFunctionality___QueryComponentFunctionality(_Functionality_: TFunctionality;   NeededFunctionalityClass: TFunctionalityClass; out Functionality: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponentFunctionality(NeededFunctionalityClass: TFunctionalityClass; out Functionality: TFunctionality): boolean;
begin
Result:=TComponentFunctionality___QueryComponentFunctionality(Self,   NeededFunctionalityClass,Functionality);
end;

function TComponentFunctionality___ComponentsCount(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ComponentsCount: integer;
begin
Result:=TComponentFunctionality___ComponentsCount(Self);
end;

function TComponentFunctionality___GetRootOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetRootOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TComponentFunctionality___GetRootOwner(Self,   idTOwner,idOwner);
end;

function TComponentFunctionality___TPresentUpdater_Create(_Functionality_: TFunctionality;   pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater; stdcall; external FunctionalityDLL;
function TComponentFunctionality.TPresentUpdater_Create(pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater;
begin
Result:=TComponentFunctionality___TPresentUpdater_Create(Self,   pUpdateProc,pOffProc);
end;

function TComponentFunctionality___TContextComponentHolder_Create(_Functionality_: TFunctionality): TComponentPresentUpdater; stdcall; external FunctionalityDLL;
function TComponentFunctionality.TContextComponentHolder_Create: TComponentPresentUpdater;
begin
Result:=TComponentFunctionality___TContextComponentHolder_Create(Self);
end;

procedure TComponentFunctionality___RealityRating_AddUserRate(_Functionality_: TFunctionality;   const Rate: integer; const RateReason: WideString); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.RealityRating_AddUserRate(const Rate: integer; const RateReason: WideString);
begin
TComponentFunctionality___RealityRating_AddUserRate(Self,   Rate,RateReason);
end;

procedure TComponentFunctionality___RealityRating_GetAverageRate(_Functionality_: TFunctionality;   out AvrRate: double; out RateCount: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.RealityRating_GetAverageRate(out AvrRate: double; out RateCount: integer);
begin
TComponentFunctionality___RealityRating_GetAverageRate(Self,   AvrRate,RateCount);
end;

procedure TComponentFunctionality___RealityRating_GetData(_Functionality_: TFunctionality;   out RatingData: TByteArray); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.RealityRating_GetData(out RatingData: TByteArray);
begin
TComponentFunctionality___RealityRating_GetData(Self,   RatingData);
end;

function TComponentFunctionality___ActualityInterval_Get(_Functionality_: TFunctionality): TComponentActualityInterval; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ActualityInterval_Get: TComponentActualityInterval;
begin
Result:=TComponentFunctionality___ActualityInterval_Get(Self);
end;

procedure TComponentFunctionality___ActualityInterval_GetTimestamps(_Functionality_: TFunctionality;   out BeginTimestamp,EndTimestamp: double); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ActualityInterval_GetTimestamps(out BeginTimestamp,EndTimestamp: double);
begin
TComponentFunctionality___ActualityInterval_GetTimestamps(Self,   BeginTimestamp,EndTimestamp);
end;

function TComponentFunctionality___ActualityInterval_GetLocally(_Functionality_: TFunctionality): TComponentActualityInterval; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ActualityInterval_GetLocally: TComponentActualityInterval;
begin
Result:=TComponentFunctionality___ActualityInterval_GetLocally(Self);
end;

procedure TComponentFunctionality___ActualityInterval_SetEndTimestamp(_Functionality_: TFunctionality;   const Value: double); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ActualityInterval_SetEndTimestamp(const Value: double);
begin
TComponentFunctionality___ActualityInterval_SetEndTimestamp(Self,   Value);
end;

function TComponentFunctionality___ActualityInterval_IsActualForTime(_Functionality_: TFunctionality;   const pTime: double): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ActualityInterval_IsActualForTime(const pTime: double): boolean;
begin
Result:=TComponentFunctionality___ActualityInterval_IsActualForTime(Self,   pTime);
end;

function TComponentFunctionality___ActualityInterval_IsActualForTimeInterval(_Functionality_: TFunctionality;   const pInterval: TComponentActualityInterval): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ActualityInterval_IsActualForTimeInterval(const pInterval: TComponentActualityInterval): boolean;
begin
Result:=TComponentFunctionality___ActualityInterval_IsActualForTimeInterval(Self,   pInterval);
end;

function TComponentFunctionality___ActualityInterval_IsActualForTimeLocally(_Functionality_: TFunctionality;   const pTime: double): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ActualityInterval_IsActualForTimeLocally(const pTime: double): boolean;
begin
Result:=TComponentFunctionality___ActualityInterval_IsActualForTimeLocally(Self,   pTime);
end;

function TComponentFunctionality___ActualityInterval_IsActualForTimeIntervalLocally(_Functionality_: TFunctionality;   const pInterval: TComponentActualityInterval): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ActualityInterval_IsActualForTimeIntervalLocally(const pInterval: TComponentActualityInterval): boolean;
begin
Result:=TComponentFunctionality___ActualityInterval_IsActualForTimeIntervalLocally(Self,   pInterval);
end;

procedure TComponentFunctionality___ActualityInterval_Actualize(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ActualityInterval_Actualize;
begin
TComponentFunctionality___ActualityInterval_Actualize(Self);
end;

procedure TComponentFunctionality___ActualityInterval_Deactualize(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ActualityInterval_Deactualize;
begin
TComponentFunctionality___ActualityInterval_Deactualize(Self);
end;

procedure TComponentFunctionality___CreateNewPanelProps(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.CreateNewPanelProps;
begin
TComponentFunctionality___CreateNewPanelProps(Self);
end;

procedure TComponentFunctionality___DestroyPanelProps(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.DestroyPanelProps;
begin
TComponentFunctionality___DestroyPanelProps(Self);
end;

function TComponentFunctionality___IsPanelPropsExist(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.IsPanelPropsExist: boolean;
begin
Result:=TComponentFunctionality___IsPanelPropsExist(Self);
end;

function TComponentFunctionality___GetPanelPropsLeftTop(_Functionality_: TFunctionality;   out PanelProps_Left,PanelProps_Top: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetPanelPropsLeftTop(out PanelProps_Left,PanelProps_Top: integer): boolean;
begin
Result:=TComponentFunctionality___GetPanelPropsLeftTop(Self,   PanelProps_Left,PanelProps_Top);
end;

function TComponentFunctionality___GetPanelPropsWidthHeight(_Functionality_: TFunctionality;   out PanelProps_Width,PanelProps_Height: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetPanelPropsWidthHeight(out PanelProps_Width,PanelProps_Height: integer): boolean;
begin
Result:=TComponentFunctionality___GetPanelPropsWidthHeight(Self,   PanelProps_Width,PanelProps_Height);
end;

procedure TComponentFunctionality___SetPanelPropsLeftTop(_Functionality_: TFunctionality;   const PanelProps_OfsX,PanelProps_OfsY: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetPanelPropsLeftTop(const PanelProps_OfsX,PanelProps_OfsY: integer);
begin
TComponentFunctionality___SetPanelPropsLeftTop(Self,   PanelProps_OfsX,PanelProps_OfsY);
end;

procedure TComponentFunctionality___SetPanelPropsWidthHeight(_Functionality_: TFunctionality;   const PanelProps_Width,PanelProps_Height: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetPanelPropsWidthHeight(const PanelProps_Width,PanelProps_Height: integer);
begin
TComponentFunctionality___SetPanelPropsWidthHeight(Self,   PanelProps_Width,PanelProps_Height);
end;

function TComponentFunctionality___IsCustomPanelPropsExist(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.IsCustomPanelPropsExist: boolean;
begin
Result:=TComponentFunctionality___IsCustomPanelPropsExist(Self);
end;

function TComponentFunctionality___idCustomPanelProps(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.idCustomPanelProps: integer;
begin
Result:=TComponentFunctionality___idCustomPanelProps(Self);
end;

function TComponentFunctionality___CustomPanelProps(_Functionality_: TFunctionality): TMemoryStream; stdcall; external FunctionalityDLL;
function TComponentFunctionality.CustomPanelProps: TMemoryStream;
begin
Result:=TComponentFunctionality___CustomPanelProps(Self);
end;

procedure TComponentFunctionality___SetCustomPanelProps(_Functionality_: TFunctionality;   Stream: TStream; const flNewValue: boolean{если = true, то заменяет панелью с новым ID}); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetCustomPanelProps(Stream: TStream; const flNewValue: boolean{если = true, то заменяет панелью с новым ID});
begin
TComponentFunctionality___SetCustomPanelProps(Self,   Stream,flNewValue);
end;

procedure TComponentFunctionality___SetCustomPanelPropsByID(_Functionality_: TFunctionality;   const idPanelProps: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetCustomPanelPropsByID(const idPanelProps: integer);
begin
TComponentFunctionality___SetCustomPanelPropsByID(Self,   idPanelProps);
end;

procedure TComponentFunctionality___ReleaseCustomPanelProps(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ReleaseCustomPanelProps;
begin
TComponentFunctionality___ReleaseCustomPanelProps(Self);
end;

function TComponentFunctionality___TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external FunctionalityDLL;
function TComponentFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TComponentFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TComponentFunctionality___getSpace(_Functionality_: TFunctionality): TProxySpace; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getSpace: TProxySpace;
begin
Result:=TComponentFunctionality___getSpace(Self);
end;

function TComponentFunctionality___getidTObj(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getidTObj: integer;
begin
Result:=TComponentFunctionality___getidTObj(Self);
end;

function TComponentFunctionality___getName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getName: string;
begin
Result:=TComponentFunctionality___getName(Self);
end;

procedure TComponentFunctionality___setName(_Functionality_: TFunctionality;   Value: string); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.setName(Value: string);
begin
TComponentFunctionality___setName(Self,   Value);
end;

function TComponentFunctionality___getHint(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getHint: string;
begin
Result:=TComponentFunctionality___getHint(Self);
end;

function TComponentFunctionality___getTag(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getTag: integer;
begin
Result:=TComponentFunctionality___getTag(Self);
end;

procedure TComponentFunctionality___setTag(_Functionality_: TFunctionality;   Value: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.setTag(Value: integer);
begin
TComponentFunctionality___setTag(Self,   Value);
end;

function TComponentFunctionality___GetIconImage(_Functionality_: TFunctionality;   out Image: TBitmap): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetIconImage(out Image: TBitmap): boolean;
begin
Result:=TComponentFunctionality___GetIconImage(Self,   Image);
end;

procedure TComponentFunctionality___DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.DoOnComponentUpdate;
begin
TComponentFunctionality___DoOnComponentUpdate(Self);
end;

procedure TComponentFunctionality___GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.GetExportDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList);
begin
TComponentFunctionality___GetExportDATA(Self,   Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;

function TComponentFunctionality____GetDataDocument(_Functionality_: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Result:=TComponentFunctionality____GetDataDocument(Self,   DataModel,DataType,flWithComponents,Document);
end;

function TComponentFunctionality___GetDataDocument(_Functionality_: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean;
begin
Result:=TComponentFunctionality___GetDataDocument(Self,   DataModel,DataType,flWithComponents,Document);
end;

function TComponentFunctionality___GetHintInfo(_Functionality_: TFunctionality;   const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
begin
Result:=TComponentFunctionality___GetHintInfo(Self,   InfoType,InfoFormat,HintInfo);
end;

procedure TComponentFunctionality___NotifyOnComponentUpdate(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.NotifyOnComponentUpdate;
begin
TComponentFunctionality___NotifyOnComponentUpdate(Self);
end;

function TComponentFunctionality___GetComponentDATA(_Functionality_: TFunctionality;   const Version: integer): TByteArray; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetComponentDATA(const Version: integer): TByteArray;
begin
Result:=TComponentFunctionality___GetComponentDATA(Self,   Version);
end;

procedure TComponentFunctionality___SetComponentDATA(_Functionality_: TFunctionality;   const Data: TByteArray); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetComponentDATA(const Data: TByteArray);
begin
TComponentFunctionality___SetComponentDATA(Self,   Data);
end;

function TComponentFunctionality___getTypeSystem(_Functionality_: TFunctionality): TTypeSystem; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getTypeSystem: TTypeSystem;
begin
Result:=TComponentFunctionality___getTypeSystem(Self);
end;

function TComponentFunctionality___getTableName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getTableName: string;
begin
Result:=TComponentFunctionality___getTableName(Self);
end;


{TTProxyObjectFunctionality}
function TTProxyObjectFunctionality____CreateInstance(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TTProxyObjectFunctionality._CreateInstance: integer;
begin
Result:=TTProxyObjectFunctionality____CreateInstance(Self);
end;

procedure TTProxyObjectFunctionality____DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall; external FunctionalityDLL;
procedure TTProxyObjectFunctionality._DestroyInstance(const idObj: integer);
begin
TTProxyObjectFunctionality____DestroyInstance(Self,   idObj);
end;

function TTProxyObjectFunctionality___TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external FunctionalityDLL;
function TTProxyObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTProxyObjectFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTProxyObjectFunctionality___getName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TTProxyObjectFunctionality.getName: string;
begin
Result:=TTProxyObjectFunctionality___getName(Self);
end;

function TTProxyObjectFunctionality___getImage(_Functionality_: TFunctionality): TTypeImage; stdcall; external FunctionalityDLL;
function TTProxyObjectFunctionality.getImage: TTypeImage;
begin
Result:=TTProxyObjectFunctionality___getImage(Self);
end;


{TProxyObjectFunctionality}
procedure TProxyObjectFunctionality____ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall; external FunctionalityDLL;
procedure TProxyObjectFunctionality._ToClone(out idClone: integer);
begin
TProxyObjectFunctionality____ToClone(Self,   idClone);
end;

function TProxyObjectFunctionality___CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall; external FunctionalityDLL;
function TProxyObjectFunctionality.CanDestroy(out Reason: string): boolean;
begin
Result:=TProxyObjectFunctionality___CanDestroy(Self,   Reason);
end;

function TProxyObjectFunctionality___TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external FunctionalityDLL;
function TProxyObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TProxyObjectFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TProxyObjectFunctionality___getName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TProxyObjectFunctionality.getName: string;
begin
Result:=TProxyObjectFunctionality___getName(Self);
end;

function TProxyObjectFunctionality___getHint(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TProxyObjectFunctionality.getHint: string;
begin
Result:=TProxyObjectFunctionality___getHint(Self);
end;

function TProxyObjectFunctionality___GetReference(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external FunctionalityDLL;
function TProxyObjectFunctionality.GetReference(out idTOwner,idOwner: integer): boolean;
begin
Result:=TProxyObjectFunctionality___GetReference(Self,   idTOwner,idOwner);
end;

procedure TProxyObjectFunctionality___SetReference(_Functionality_: TFunctionality;   const idTOwner,idOwner: integer); stdcall; external FunctionalityDLL;
procedure TProxyObjectFunctionality.SetReference(const idTOwner,idOwner: integer);
begin
TProxyObjectFunctionality___SetReference(Self,   idTOwner,idOwner);
end;


{TTBaseVisualizationFunctionality}
procedure TTBaseVisualizationFunctionality___GetComponentOwnerDatas(_Functionality_: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); stdcall; external FunctionalityDLL;
procedure TTBaseVisualizationFunctionality.GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
begin
TTBaseVisualizationFunctionality___GetComponentOwnerDatas(Self,   IDs,DataFlags,Data);
end;

function TTBaseVisualizationFunctionality___CanCreateAsDetail(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TTBaseVisualizationFunctionality.CanCreateAsDetail: boolean;
begin
Result:=TTBaseVisualizationFunctionality___CanCreateAsDetail(Self);
end;

function TTBaseVisualizationFunctionality___ImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external FunctionalityDLL;
function TTBaseVisualizationFunctionality.ImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
Result:=TTBaseVisualizationFunctionality___ImportInstance(Self,   ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTBaseVisualizationFunctionality___getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall; external FunctionalityDLL;
function TTBaseVisualizationFunctionality.getReflector: TAbstractReflector;
begin
Result:=TTBaseVisualizationFunctionality___getReflector(Self);
end;

procedure TTBaseVisualizationFunctionality___setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall; external FunctionalityDLL;
procedure TTBaseVisualizationFunctionality.setReflector(Value: TAbstractReflector);
begin
TTBaseVisualizationFunctionality___setReflector(Self,   Value);
end;


{TBaseVisualizationFunctionality}
procedure TBaseVisualizationFunctionality___DestroyData(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.DestroyData;
begin
TBaseVisualizationFunctionality___DestroyData(Self);
end;

procedure TBaseVisualizationFunctionality___CloneData(_Functionality_: TFunctionality;   out idClone: integer); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.CloneData(out idClone: integer);
begin
TBaseVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TBaseVisualizationFunctionality___Ptr(_Functionality_: TFunctionality): TPtr; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.Ptr: TPtr;
begin
Result:=TBaseVisualizationFunctionality___Ptr(Self);
end;

procedure TBaseVisualizationFunctionality___DoOnChangeScale(_Functionality_: TFunctionality;   const ChangeCoef: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TBaseVisualizationFunctionality___DoOnChangeScale(Self,   ChangeCoef);
end;

function TBaseVisualizationFunctionality___IsUnReferenced(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.IsUnReferenced: boolean;
begin
Result:=TBaseVisualizationFunctionality___IsUnReferenced(Self);
end;

function TBaseVisualizationFunctionality___TVisualizationUpdating_Create(_Functionality_: TFunctionality;   Reflecting: TReflecting): TObject; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
begin
Result:=TBaseVisualizationFunctionality___TVisualizationUpdating_Create(Self,   Reflecting);
end;

procedure TBaseVisualizationFunctionality___ReflectInScene(_Functionality_: TFunctionality;   Scene: TScene); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.ReflectInScene(Scene: TScene);
begin
TBaseVisualizationFunctionality___ReflectInScene(Self,   Scene);
end;

procedure TBaseVisualizationFunctionality___Scaling(_Functionality_: TFunctionality;   const pScale: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.Scaling(const pScale: Double);
begin
TBaseVisualizationFunctionality___Scaling(Self,   pScale);
end;

procedure TBaseVisualizationFunctionality___SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.SetPosition(const X,Y,Z: Double);
begin
TBaseVisualizationFunctionality___SetPosition(Self,   X,Y,Z);
end;

procedure TBaseVisualizationFunctionality___Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.Move(const dX,dY,dZ: Double);
begin
TBaseVisualizationFunctionality___Move(Self,   dX,dY,dZ);
end;

procedure TBaseVisualizationFunctionality___ChangeScale(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
begin
TBaseVisualizationFunctionality___ChangeScale(Self,   Xbind,Ybind,pScale);
end;

procedure TBaseVisualizationFunctionality___Rotate(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const Angle: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.Rotate(const Xbind,Ybind: Double; const Angle: Double);
begin
TBaseVisualizationFunctionality___Rotate(Self,   Xbind,Ybind,Angle);
end;

procedure TBaseVisualizationFunctionality___Transform(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
TBaseVisualizationFunctionality___Transform(Self,   Xbind,Ybind,pScale,Angle,dX,dY);
end;

procedure TBaseVisualizationFunctionality___SetPropertiesLocal(_Functionality_: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
begin
TBaseVisualizationFunctionality___SetPropertiesLocal(Self,   pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
end;

procedure TBaseVisualizationFunctionality___DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.DoOnComponentUpdate;
begin
TBaseVisualizationFunctionality___DoOnComponentUpdate(Self);
end;

function TBaseVisualizationFunctionality___DoOnOver(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.DoOnOver: boolean;
begin
Result:=TBaseVisualizationFunctionality___DoOnOver(Self);
end;

function TBaseVisualizationFunctionality___DoOnClick(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.DoOnClick: boolean;
begin
Result:=TBaseVisualizationFunctionality___DoOnClick(Self);
end;

function TBaseVisualizationFunctionality___DoOnDblClick(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.DoOnDblClick: boolean;
begin
Result:=TBaseVisualizationFunctionality___DoOnDblClick(Self);
end;

procedure TBaseVisualizationFunctionality___GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.GetExportDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList);
begin
TBaseVisualizationFunctionality___GetExportDATA(Self,   Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;

procedure TBaseVisualizationFunctionality___GetOwnerByVisualization(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.GetOwnerByVisualization(out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr);
begin
TBaseVisualizationFunctionality___GetOwnerByVisualization(Self,   idTOwner,idOwner,ptrOwnerVisualization);
end;

function TBaseVisualizationFunctionality___GetCoVisualizationSpaces(_Functionality_: TFunctionality;   out List: TList): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.GetCoVisualizationSpaces(out List: TList): boolean;
begin
Result:=TBaseVisualizationFunctionality___GetCoVisualizationSpaces(Self,   List);
end;

function TBaseVisualizationFunctionality___GetCoVisualizationSpaces1(_Functionality_: TFunctionality;   out List: TByteArray): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.GetCoVisualizationSpaces1(out List: TByteArray): boolean;
begin
Result:=TBaseVisualizationFunctionality___GetCoVisualizationSpaces1(Self,   List);
end;

function TBaseVisualizationFunctionality___getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.getReflector: TAbstractReflector;
begin
Result:=TBaseVisualizationFunctionality___getReflector(Self);
end;

procedure TBaseVisualizationFunctionality___setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.setReflector(Value: TAbstractReflector);
begin
TBaseVisualizationFunctionality___setReflector(Self,   Value);
end;

function TBaseVisualizationFunctionality___getStrobing(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.getStrobing: boolean;
begin
Result:=TBaseVisualizationFunctionality___getStrobing(Self);
end;

procedure TBaseVisualizationFunctionality___setStrobing(_Functionality_: TFunctionality;   Value: boolean); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.setStrobing(Value: boolean);
begin
TBaseVisualizationFunctionality___setStrobing(Self,   Value);
end;

function TBaseVisualizationFunctionality___getStrobingInterval(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.getStrobingInterval: integer;
begin
Result:=TBaseVisualizationFunctionality___getStrobingInterval(Self);
end;

procedure TBaseVisualizationFunctionality___setStrobingInterval(_Functionality_: TFunctionality;   Value: integer); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.setStrobingInterval(Value: integer);
begin
TBaseVisualizationFunctionality___setStrobingInterval(Self,   Value);
end;


{TTBase2DVisualizationFunctionality}
function TTBase2DVisualizationFunctionality____CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external FunctionalityDLL;
function TTBase2DVisualizationFunctionality._CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer;
begin
Result:=TTBase2DVisualizationFunctionality____CreateInstanceEx(Self,   pObjectVisualization,ptrOwner);
end;

function TTBase2DVisualizationFunctionality___CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external FunctionalityDLL;
function TTBase2DVisualizationFunctionality.CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer;
begin
Result:=TTBase2DVisualizationFunctionality___CreateInstanceEx(Self,   pObjectVisualization,ptrOwner);
end;

procedure TTBase2DVisualizationFunctionality____DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall; external FunctionalityDLL;
procedure TTBase2DVisualizationFunctionality._DestroyInstance(const idObj: integer);
begin
TTBase2DVisualizationFunctionality____DestroyInstance(Self,   idObj);
end;

function TTBase2DVisualizationFunctionality___CreateObj(_Functionality_: TFunctionality;   pReflector: TAbstractReflector; pObjectVisualization: TObjectVisualization; const flAbsoluteCoords: boolean; const idTObj,idObj: integer; ptrOwner: TPtr): TPtr; stdcall; external FunctionalityDLL;
function TTBase2DVisualizationFunctionality.CreateObj(pReflector: TAbstractReflector; pObjectVisualization: TObjectVisualization; const flAbsoluteCoords: boolean; const idTObj,idObj: integer; ptrOwner: TPtr): TPtr;
begin
Result:=TTBase2DVisualizationFunctionality___CreateObj(Self,   pReflector,pObjectVisualization,flAbsoluteCoords,idTObj,idObj,ptrOwner);
end;

procedure TTBase2DVisualizationFunctionality___DestroyObj(_Functionality_: TFunctionality;   const ptrDestrObj: TPtr); stdcall; external FunctionalityDLL;
procedure TTBase2DVisualizationFunctionality.DestroyObj(const ptrDestrObj: TPtr);
begin
TTBase2DVisualizationFunctionality___DestroyObj(Self,   ptrDestrObj);
end;

procedure TTBase2DVisualizationFunctionality___GetDisproportionObjects(_Functionality_: TFunctionality;   const Factor: double; out ObjectsList: TByteArray); stdcall; external FunctionalityDLL;
procedure TTBase2DVisualizationFunctionality.GetDisproportionObjects(const Factor: double; out ObjectsList: TByteArray);
begin
TTBase2DVisualizationFunctionality___GetDisproportionObjects(Self,   Factor,ObjectsList);
end;

function TTBase2DVisualizationFunctionality___getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall; external FunctionalityDLL;
function TTBase2DVisualizationFunctionality.getReflector: TAbstractReflector;
begin
Result:=TTBase2DVisualizationFunctionality___getReflector(Self);
end;

procedure TTBase2DVisualizationFunctionality___setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall; external FunctionalityDLL;
procedure TTBase2DVisualizationFunctionality.setReflector(Value: TAbstractReflector);
begin
TTBase2DVisualizationFunctionality___setReflector(Self,   Value);
end;

function TTBase2DVisualizationFunctionality___StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall; external FunctionalityDLL;
function TTBase2DVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTBase2DVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TBase2DVisualizationFunctionality}
function TBase2DVisualizationFunctionality___Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TBase2DVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TBase2DVisualizationFunctionality___ReflectOnCanvas(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
begin
Result:=TBase2DVisualizationFunctionality___ReflectOnCanvas(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TBase2DVisualizationFunctionality___CreateClone(_Functionality_: TFunctionality;   const ptrObj: TPtr; const ptrCloneOwner: TPtr; out idClone: integer); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.CreateClone(const ptrObj: TPtr; const ptrCloneOwner: TPtr; out idClone: integer);
begin
TBase2DVisualizationFunctionality___CreateClone(Self,   ptrObj,ptrCloneOwner,idClone);
end;

procedure TBase2DVisualizationFunctionality___GetLayInfo(_Functionality_: TFunctionality;   out Lay,SubLay: integer); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.GetLayInfo(out Lay,SubLay: integer);
begin
TBase2DVisualizationFunctionality___GetLayInfo(Self,   Lay,SubLay);
end;

function TBase2DVisualizationFunctionality___GetDetailsList(_Functionality_: TFunctionality;   out DetailsList: TComponentsList): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.GetDetailsList(out DetailsList: TComponentsList): boolean;
begin
Result:=TBase2DVisualizationFunctionality___GetDetailsList(Self,   DetailsList);
end;

function TBase2DVisualizationFunctionality___ReflectAsNotLoaded(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pCanvas: TCanvas): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.ReflectAsNotLoaded(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pCanvas: TCanvas): boolean;
begin
Result:=TBase2DVisualizationFunctionality___ReflectAsNotLoaded(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pCanvas);
end;

function TBase2DVisualizationFunctionality___ContainerFilled(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TBase2DVisualizationFunctionality___ContainerFilled(Self);
end;

procedure TBase2DVisualizationFunctionality___GetProps(_Functionality_: TFunctionality;   out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.GetProps(out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor);
begin
TBase2DVisualizationFunctionality___GetProps(Self,   oflagLoop,oColor,oWidth,oflagFill,oColorFill);
end;

procedure TBase2DVisualizationFunctionality___SetProps(_Functionality_: TFunctionality;   const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.SetProps(const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor);
begin
TBase2DVisualizationFunctionality___SetProps(Self,   pflagLoop,pColor,pWidth,pflagFill,pColorFill);
end;

procedure TBase2DVisualizationFunctionality___CreateNode(_Functionality_: TFunctionality;   const CreateNodeIndex: integer; const X,Y: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.CreateNode(const CreateNodeIndex: integer; const X,Y: Double);
begin
TBase2DVisualizationFunctionality___CreateNode(Self,   CreateNodeIndex,X,Y);
end;

procedure TBase2DVisualizationFunctionality___DestroyNode(_Functionality_: TFunctionality;   const DestroyNodeIndex: integer); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.DestroyNode(const DestroyNodeIndex: integer);
begin
TBase2DVisualizationFunctionality___DestroyNode(Self,   DestroyNodeIndex);
end;

procedure TBase2DVisualizationFunctionality___SetNode(_Functionality_: TFunctionality;   const SetNodeIndex: integer; const newX,newY: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.SetNode(const SetNodeIndex: integer; const newX,newY: Double);
begin
TBase2DVisualizationFunctionality___SetNode(Self,   SetNodeIndex,newX,newY);
end;

procedure TBase2DVisualizationFunctionality___GetNodes(_Functionality_: TFunctionality;   out Nodes: TByteArray); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.GetNodes(out Nodes: TByteArray);
begin
TBase2DVisualizationFunctionality___GetNodes(Self,   Nodes);
end;

procedure TBase2DVisualizationFunctionality___SetNodes(_Functionality_: TFunctionality;   const Nodes: TByteArray; const pWidth: double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.SetNodes(const Nodes: TByteArray; const pWidth: double);
begin
TBase2DVisualizationFunctionality___SetNodes(Self,   Nodes,pWidth);
end;

procedure TBase2DVisualizationFunctionality___CheckPlace(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.CheckPlace(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
TBase2DVisualizationFunctionality___CheckPlace(Self,   Xbind,Ybind,pScale,Angle,dX,dY);
end;

procedure TBase2DVisualizationFunctionality___Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.Move(const dX,dY,dZ: Double);
begin
TBase2DVisualizationFunctionality___Move(Self,   dX,dY,dZ);
end;

procedure TBase2DVisualizationFunctionality___SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.SetPosition(const X,Y,Z: Double);
begin
TBase2DVisualizationFunctionality___SetPosition(Self,   X,Y,Z);
end;

procedure TBase2DVisualizationFunctionality___ChangeScale(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
begin
TBase2DVisualizationFunctionality___ChangeScale(Self,   Xbind,Ybind,pScale);
end;

procedure TBase2DVisualizationFunctionality___Rotate(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const Angle: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.Rotate(const Xbind,Ybind: Double; const Angle: Double);
begin
TBase2DVisualizationFunctionality___Rotate(Self,   Xbind,Ybind,Angle);
end;

procedure TBase2DVisualizationFunctionality___ChangeLay(_Functionality_: TFunctionality;   const NewLayID: integer); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.ChangeLay(const NewLayID: integer);
begin
TBase2DVisualizationFunctionality___ChangeLay(Self,   NewLayID);
end;

procedure TBase2DVisualizationFunctionality___ChangeOwner(_Functionality_: TFunctionality;   const ptrNewOwner: TPtr); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.ChangeOwner(const ptrNewOwner: TPtr);
begin
TBase2DVisualizationFunctionality___ChangeOwner(Self,   ptrNewOwner);
end;

procedure TBase2DVisualizationFunctionality___Transform(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
TBase2DVisualizationFunctionality___Transform(Self,   Xbind,Ybind,pScale,Angle,dX,dY);
end;

function TBase2DVisualizationFunctionality___Square(_Functionality_: TFunctionality): Double; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.Square: Double;
begin
Result:=TBase2DVisualizationFunctionality___Square(Self);
end;

function TBase2DVisualizationFunctionality___Square1(_Functionality_: TFunctionality;   const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: TCrd; const NewWidth: Double; const pScale: Double): Double; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.Square1(const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: TCrd; const NewWidth: Double; const pScale: Double): Double;
begin
Result:=TBase2DVisualizationFunctionality___Square1(Self,   ExceptPointPtr,ExceptPointValueX,ExceptPointValueY,NewWidth,pScale);
end;

function TBase2DVisualizationFunctionality___GetFormatNodes(_Functionality_: TFunctionality;   out NodesList: TList; out SizeX,SizeY: integer): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.GetFormatNodes(out NodesList: TList; out SizeX,SizeY: integer): boolean;
begin
Result:=TBase2DVisualizationFunctionality___GetFormatNodes(Self,   NodesList,SizeX,SizeY);
end;

procedure TBase2DVisualizationFunctionality___GetInsideObjectsList(_Functionality_: TFunctionality;   out List: TComponentsList); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.GetInsideObjectsList(out List: TComponentsList);
begin
TBase2DVisualizationFunctionality___GetInsideObjectsList(Self,   List);
end;

function TBase2DVisualizationFunctionality___getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.getReflector: TAbstractReflector;
begin
Result:=TBase2DVisualizationFunctionality___getReflector(Self);
end;

procedure TBase2DVisualizationFunctionality___setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.setReflector(Value: TAbstractReflector);
begin
TBase2DVisualizationFunctionality___setReflector(Self,   Value);
end;

function TBase2DVisualizationFunctionality___getIdLay(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.getIdLay: integer;
begin
Result:=TBase2DVisualizationFunctionality___getIdLay(Self);
end;

function TBase2DVisualizationFunctionality___getWidth(_Functionality_: TFunctionality): Double; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.getWidth: Double;
begin
Result:=TBase2DVisualizationFunctionality___getWidth(Self);
end;

procedure TBase2DVisualizationFunctionality___setWidth(_Functionality_: TFunctionality;   Value: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.setWidth(Value: Double);
begin
TBase2DVisualizationFunctionality___setWidth(Self,   Value);
end;

function TBase2DVisualizationFunctionality___getflUserSecurity(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.getflUserSecurity: boolean;
begin
Result:=TBase2DVisualizationFunctionality___getflUserSecurity(Self);
end;

procedure TBase2DVisualizationFunctionality___setflUserSecurity(_Functionality_: TFunctionality;   Value: boolean); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.setflUserSecurity(Value: boolean);
begin
TBase2DVisualizationFunctionality___setflUserSecurity(Self,   Value);
end;

function TBase2DVisualizationFunctionality___getflDetailsNoIndex(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.getflDetailsNoIndex: boolean;
begin
Result:=TBase2DVisualizationFunctionality___getflDetailsNoIndex(Self);
end;

procedure TBase2DVisualizationFunctionality___setflDetailsNoIndex(_Functionality_: TFunctionality;   Value: boolean); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.setflDetailsNoIndex(Value: boolean);
begin
TBase2DVisualizationFunctionality___setflDetailsNoIndex(Self,   Value);
end;

function TBase2DVisualizationFunctionality___getflNotifyOwnerOnChange(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.getflNotifyOwnerOnChange: boolean;
begin
Result:=TBase2DVisualizationFunctionality___getflNotifyOwnerOnChange(Self);
end;

procedure TBase2DVisualizationFunctionality___setflNotifyOwnerOnChange(_Functionality_: TFunctionality;   Value: boolean); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.setflNotifyOwnerOnChange(Value: boolean);
begin
TBase2DVisualizationFunctionality___setflNotifyOwnerOnChange(Self,   Value);
end;


{TTLay2DVisualizationFunctionality}
function TTLay2DVisualizationFunctionality____CreateInstance(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TTLay2DVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTLay2DVisualizationFunctionality____CreateInstance(Self);
end;

function TTLay2DVisualizationFunctionality___TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external FunctionalityDLL;
function TTLay2DVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTLay2DVisualizationFunctionality___TComponentFunctionality_Create(Self,   idComponent);
end;

function TTLay2DVisualizationFunctionality___getName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TTLay2DVisualizationFunctionality.getName: string;
begin
Result:=TTLay2DVisualizationFunctionality___getName(Self);
end;

function TTLay2DVisualizationFunctionality___getImage(_Functionality_: TFunctionality): TTypeImage; stdcall; external FunctionalityDLL;
function TTLay2DVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTLay2DVisualizationFunctionality___getImage(Self);
end;

function TTLay2DVisualizationFunctionality____CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external FunctionalityDLL;
function TTLay2DVisualizationFunctionality._CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer;
begin
Result:=TTLay2DVisualizationFunctionality____CreateInstanceEx(Self,   pObjectVisualization,ptrOwner);
end;

function TTLay2DVisualizationFunctionality___StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall; external FunctionalityDLL;
function TTLay2DVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTLay2DVisualizationFunctionality___StdObjectVisualization(Self);
end;


{TLay2DVisualizationFunctionality}
procedure TLay2DVisualizationFunctionality___DestroyData(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.DestroyData;
begin
TLay2DVisualizationFunctionality___DestroyData(Self);
end;

procedure TLay2DVisualizationFunctionality____ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality._ToClone(out idClone: integer);
begin
TLay2DVisualizationFunctionality____ToClone(Self,   idClone);
end;

function TLay2DVisualizationFunctionality___CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.CanDestroy(out Reason: string): boolean;
begin
Result:=TLay2DVisualizationFunctionality___CanDestroy(Self,   Reason);
end;

function TLay2DVisualizationFunctionality___TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TLay2DVisualizationFunctionality___TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLay2DVisualizationFunctionality___GetOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TLay2DVisualizationFunctionality___GetOwner(Self,   idTOwner,idOwner);
end;

function TLay2DVisualizationFunctionality___getName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.getName: string;
begin
Result:=TLay2DVisualizationFunctionality___getName(Self);
end;

procedure TLay2DVisualizationFunctionality___setName(_Functionality_: TFunctionality;   Value: string); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.setName(Value: string);
begin
TLay2DVisualizationFunctionality___setName(Self,   Value);
end;

function TLay2DVisualizationFunctionality___getHint(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.getHint: string;
begin
Result:=TLay2DVisualizationFunctionality___getHint(Self);
end;

procedure TLay2DVisualizationFunctionality___CloneData(_Functionality_: TFunctionality;   out idClone: integer); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.CloneData(out idClone: integer);
begin
TLay2DVisualizationFunctionality___CloneData(Self,   idClone);
end;

function TLay2DVisualizationFunctionality___Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TLay2DVisualizationFunctionality___Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

procedure TLay2DVisualizationFunctionality___GetObjectPointersList(_Functionality_: TFunctionality;   out List: TList); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.GetObjectPointersList(out List: TList);
begin
TLay2DVisualizationFunctionality___GetObjectPointersList(Self,   List);
end;

function TLay2DVisualizationFunctionality___isEmpty(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.isEmpty: boolean;
begin
Result:=TLay2DVisualizationFunctionality___isEmpty(Self);
end;

function TLay2DVisualizationFunctionality___getNumber(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.getNumber: integer;
begin
Result:=TLay2DVisualizationFunctionality___getNumber(Self);
end;

procedure TLay2DVisualizationFunctionality___GetParams(_Functionality_: TFunctionality;   out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.GetParams(out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
begin
TLay2DVisualizationFunctionality___GetParams(Self,   oName,oVisibleMinScale,oVisibleMaxScale);
end;

procedure TLay2DVisualizationFunctionality___GetParams1(_Functionality_: TFunctionality;   out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.GetParams1(out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
begin
TLay2DVisualizationFunctionality___GetParams1(Self,   oName,oNumber,oVisibleMinScale,oVisibleMaxScale);
end;

procedure TLay2DVisualizationFunctionality___SetParams(_Functionality_: TFunctionality;   const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.SetParams(const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double);
begin
TLay2DVisualizationFunctionality___SetParams(Self,   pName,pVisibleMinScale,pVisibleMaxScale);
end;


