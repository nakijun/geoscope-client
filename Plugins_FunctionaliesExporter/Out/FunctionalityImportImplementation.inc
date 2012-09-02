//. import  functionality routines implementations

{TTypeFunctionality}
function TTypeFunctionality__UserName(_Functionality_: TFunctionality): WideString; stdcall; external FunctionalityDLL;
function TTypeFunctionality.UserName: WideString;
begin
Result:=TTypeFunctionality__UserName(Self);
end;

function TTypeFunctionality__UserPassword(_Functionality_: TFunctionality): WideString; stdcall; external FunctionalityDLL;
function TTypeFunctionality.UserPassword: WideString;
begin
Result:=TTypeFunctionality__UserPassword(Self);
end;

function TTypeFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality._CreateInstance: integer;
begin
Result:=TTypeFunctionality___CreateInstance(Self);
end;

function TTypeFunctionality__CreateInstance(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality.CreateInstance: integer;
begin
Result:=TTypeFunctionality__CreateInstance(Self);
end;

function TTypeFunctionality__CreateInstanceUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality.CreateInstanceUsingObject(const idTUseObj,idUseObj: integer): integer;
begin
Result:=TTypeFunctionality__CreateInstanceUsingObject(Self,   idTUseObj,idUseObj);
end;

procedure TTypeFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality._DestroyInstance(const idObj: integer);
begin
TTypeFunctionality___DestroyInstance(Self,   idObj);
end;

procedure TTypeFunctionality__DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.DestroyInstance(const idObj: integer);
begin
TTypeFunctionality__DestroyInstance(Self,   idObj);
end;

procedure TTypeFunctionality__GetInstanceList(_Functionality_: TFunctionality;   out List: TList); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.GetInstanceList(out List: TList);
begin
TTypeFunctionality__GetInstanceList(Self,   List);
end;

procedure TTypeFunctionality__GetInstanceList1(_Functionality_: TFunctionality;   out List: TByteArray); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.GetInstanceList1(out List: TByteArray);
begin
TTypeFunctionality__GetInstanceList1(Self,   List);
end;

procedure TTypeFunctionality__GetInstanceNames(_Functionality_: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.GetInstanceNames(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList);
begin
TTypeFunctionality__GetInstanceNames(Self,   IDs,IDs_Offset,IDs_Size,Names);
end;

procedure TTypeFunctionality__GetInstanceOwnerNames(_Functionality_: TFunctionality;   const IDs: TByteArray; out Data: TByteArray); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.GetInstanceOwnerNames(const IDs: TByteArray; out Data: TByteArray);
begin
TTypeFunctionality__GetInstanceOwnerNames(Self,   IDs,Data);
end;

procedure TTypeFunctionality__GetComponentDatas(_Functionality_: TFunctionality;   const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; const DataFlags: TComponentDataFlags; out Datas: TComponentDatas); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.GetComponentDatas(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; const DataFlags: TComponentDataFlags; out Datas: TComponentDatas);
begin
TTypeFunctionality__GetComponentDatas(Self,   IDs,IDs_Offset,IDs_Size,DataFlags,Datas);
end;

procedure TTypeFunctionality__GetComponentOwnerDatas(_Functionality_: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
begin
TTypeFunctionality__GetComponentOwnerDatas(Self,   IDs,DataFlags,Data);
end;

function TTypeFunctionality__CheckImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality.CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
Result:=TTypeFunctionality__CheckImportInstance(Self,   ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTypeFunctionality__ImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality.ImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
Result:=TTypeFunctionality__ImportInstance(Self,   ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTypeFunctionality__TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external FunctionalityDLL;
function TTypeFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTypeFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

procedure TTypeFunctionality__DoOnComponentOperation(_Functionality_: TFunctionality;   const idTObj,idObj: integer; const Operation: TComponentOperation); stdcall; external FunctionalityDLL;
procedure TTypeFunctionality.DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
begin
TTypeFunctionality__DoOnComponentOperation(Self,   idTObj,idObj,Operation);
end;

function TTypeFunctionality__getSpace(_Functionality_: TFunctionality): TProxySpace; stdcall; external FunctionalityDLL;
function TTypeFunctionality.getSpace: TProxySpace;
begin
Result:=TTypeFunctionality__getSpace(Self);
end;

function TTypeFunctionality__getidType(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality.getidType: integer;
begin
Result:=TTypeFunctionality__getidType(Self);
end;

function TTypeFunctionality__getName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TTypeFunctionality.getName: string;
begin
Result:=TTypeFunctionality__getName(Self);
end;

function TTypeFunctionality__getImage(_Functionality_: TFunctionality): TTypeImage; stdcall; external FunctionalityDLL;
function TTypeFunctionality.getImage: TTypeImage;
begin
Result:=TTypeFunctionality__getImage(Self);
end;

function TTypeFunctionality__getTableName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TTypeFunctionality.getTableName: string;
begin
Result:=TTypeFunctionality__getTableName(Self);
end;

function TTypeFunctionality__getImageList_Index(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TTypeFunctionality.getImageList_Index: integer;
begin
Result:=TTypeFunctionality__getImageList_Index(Self);
end;


{TComponentFunctionality}
procedure TComponentFunctionality__UpdateDATA(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.UpdateDATA;
begin
TComponentFunctionality__UpdateDATA(Self);
end;

procedure TComponentFunctionality__ClearDATA(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ClearDATA;
begin
TComponentFunctionality__ClearDATA(Self);
end;

function TComponentFunctionality__UserName(_Functionality_: TFunctionality): WideString; stdcall; external FunctionalityDLL;
function TComponentFunctionality.UserName: WideString;
begin
Result:=TComponentFunctionality__UserName(Self);
end;

function TComponentFunctionality__UserPassword(_Functionality_: TFunctionality): WideString; stdcall; external FunctionalityDLL;
function TComponentFunctionality.UserPassword: WideString;
begin
Result:=TComponentFunctionality__UserPassword(Self);
end;

procedure TComponentFunctionality__SetUser(_Functionality_: TFunctionality;   const pUserName: WideString; const pUserPassword: WideString); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetUser(const pUserName: WideString; const pUserPassword: WideString);
begin
TComponentFunctionality__SetUser(Self,   pUserName,pUserPassword);
end;

function TComponentFunctionality__UserProfileFolder(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TComponentFunctionality.UserProfileFolder: string;
begin
Result:=TComponentFunctionality__UserProfileFolder(Self);
end;

function TComponentFunctionality__GetObjTID(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetObjTID: integer;
begin
Result:=TComponentFunctionality__GetObjTID(Self);
end;

function TComponentFunctionality__GetObjID(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetObjID: integer;
begin
Result:=TComponentFunctionality__GetObjID(Self);
end;

procedure TComponentFunctionality__Check(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.Check;
begin
TComponentFunctionality__Check(Self);
end;

function TComponentFunctionality__CreationTimestamp(_Functionality_: TFunctionality): double; stdcall; external FunctionalityDLL;
function TComponentFunctionality.CreationTimestamp: double;
begin
Result:=TComponentFunctionality__CreationTimestamp(Self);
end;

procedure TComponentFunctionality__CheckUserOperation(_Functionality_: TFunctionality;   const idOperation: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.CheckUserOperation(const idOperation: integer);
begin
TComponentFunctionality__CheckUserOperation(Self,   idOperation);
end;

function TComponentFunctionality__GetSecurityComponent(_Functionality_: TFunctionality;   out idSecurityComponent: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetSecurityComponent(out idSecurityComponent: integer): boolean;
begin
Result:=TComponentFunctionality__GetSecurityComponent(Self,   idSecurityComponent);
end;

procedure TComponentFunctionality__ChangeSecurity(_Functionality_: TFunctionality;   const pidSecurityFile: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ChangeSecurity(const pidSecurityFile: integer);
begin
TComponentFunctionality__ChangeSecurity(Self,   pidSecurityFile);
end;

function TComponentFunctionality__IsUserDataExists(_Functionality_: TFunctionality;   const DataName: string): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.IsUserDataExists(const DataName: string): boolean;
begin
Result:=TComponentFunctionality__IsUserDataExists(Self,   DataName);
end;

function TComponentFunctionality__DeleteUserData(_Functionality_: TFunctionality;   const DataName: string): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.DeleteUserData(const DataName: string): boolean;
begin
Result:=TComponentFunctionality__DeleteUserData(Self,   DataName);
end;

procedure TComponentFunctionality__SetUserData(_Functionality_: TFunctionality;   const DataName: string; const Data: TMemoryStream); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetUserData(const DataName: string; const Data: TMemoryStream);
begin
TComponentFunctionality__SetUserData(Self,   DataName,Data);
end;

procedure TComponentFunctionality__GetUserData(_Functionality_: TFunctionality;   const DataName: string; out Data: TMemoryStream); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.GetUserData(const DataName: string; out Data: TMemoryStream);
begin
TComponentFunctionality__GetUserData(Self,   DataName,Data);
end;

procedure TComponentFunctionality__InsertComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer;  out id: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.InsertComponent(const idTComponent,idComponent: integer;  out id: integer);
begin
TComponentFunctionality__InsertComponent(Self,   idTComponent,idComponent,id);
end;

procedure TComponentFunctionality__CloneAndInsertComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer; out idClone: integer; out id: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.CloneAndInsertComponent(const idTComponent,idComponent: integer; out idClone: integer; out id: integer);
begin
TComponentFunctionality__CloneAndInsertComponent(Self,   idTComponent,idComponent,idClone,id);
end;

procedure TComponentFunctionality__ImportAndInsertComponents(_Functionality_: TFunctionality;   const ImportFileName: string; out ComponentsList: TComponentsList); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ImportAndInsertComponents(const ImportFileName: string; out ComponentsList: TComponentsList);
begin
TComponentFunctionality__ImportAndInsertComponents(Self,   ImportFileName,ComponentsList);
end;

procedure TComponentFunctionality__DestroyComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.DestroyComponent(const idTComponent,idComponent: integer);
begin
TComponentFunctionality__DestroyComponent(Self,   idTComponent,idComponent);
end;

procedure TComponentFunctionality__RemoveComponent(_Functionality_: TFunctionality;   const idTComponent,idComponent: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.RemoveComponent(const idTComponent,idComponent: integer);
begin
TComponentFunctionality__RemoveComponent(Self,   idTComponent,idComponent);
end;

procedure TComponentFunctionality___ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality._ToClone(out idClone: integer);
begin
TComponentFunctionality___ToClone(Self,   idClone);
end;

procedure TComponentFunctionality__ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ToClone(out idClone: integer);
begin
TComponentFunctionality__ToClone(Self,   idClone);
end;

procedure TComponentFunctionality__ToCloneUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer; out idClone: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ToCloneUsingObject(const idTUseObj,idUseObj: integer; out idClone: integer);
begin
TComponentFunctionality__ToCloneUsingObject(Self,   idTUseObj,idUseObj,idClone);
end;

function TComponentFunctionality__CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.CanDestroy(out Reason: string): boolean;
begin
Result:=TComponentFunctionality__CanDestroy(Self,   Reason);
end;

function TComponentFunctionality__Notify(_Functionality_: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult; stdcall; external FunctionalityDLL;
function TComponentFunctionality.Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
begin
Result:=TComponentFunctionality__Notify(Self,   NotifyType,pidTObj,pidObj);
end;

function TComponentFunctionality__GetOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TComponentFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TComponentFunctionality__SetComponentsUsingObject(_Functionality_: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TComponentFunctionality__SetComponentsUsingObject(Self,   idTUseObj,idUseObj);
end;

procedure TComponentFunctionality__DestroyComponents(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.DestroyComponents;
begin
TComponentFunctionality__DestroyComponents(Self);
end;

procedure TComponentFunctionality__RemoveSelfAsComponent(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.RemoveSelfAsComponent;
begin
TComponentFunctionality__RemoveSelfAsComponent(Self);
end;

function TComponentFunctionality__IsUnReferenced(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.IsUnReferenced: boolean;
begin
Result:=TComponentFunctionality__IsUnReferenced(Self);
end;

function TComponentFunctionality__IsEmpty(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.IsEmpty: boolean;
begin
Result:=TComponentFunctionality__IsEmpty(Self);
end;

function TComponentFunctionality__DATASize(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.DATASize: integer;
begin
Result:=TComponentFunctionality__DATASize(Self);
end;

procedure TComponentFunctionality__LoadFromFile(_Functionality_: TFunctionality;   const FileName: string); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.LoadFromFile(const FileName: string);
begin
TComponentFunctionality__LoadFromFile(Self,   FileName);
end;

procedure TComponentFunctionality__LoadFromStream(_Functionality_: TFunctionality;   const Stream: TStream); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.LoadFromStream(const Stream: TStream);
begin
TComponentFunctionality__LoadFromStream(Self,   Stream);
end;

procedure TComponentFunctionality__GetComponentsList(_Functionality_: TFunctionality;   out ComponentsList: TComponentsList); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.GetComponentsList(out ComponentsList: TComponentsList);
begin
TComponentFunctionality__GetComponentsList(Self,   ComponentsList);
end;

procedure TComponentFunctionality__GetComponentsList1(_Functionality_: TFunctionality;   out ComponentsList: TByteArray); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.GetComponentsList1(out ComponentsList: TByteArray);
begin
TComponentFunctionality__GetComponentsList1(Self,   ComponentsList);
end;

function TComponentFunctionality__QueryComponents(_Functionality_: TFunctionality;   FunctionalityClass: TFunctionalityClass; out ComponentsList: TComponentsList): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponents(FunctionalityClass: TFunctionalityClass; out ComponentsList: TComponentsList): boolean;
begin
Result:=TComponentFunctionality__QueryComponents(Self,   FunctionalityClass,ComponentsList);
end;

function TComponentFunctionality__QueryComponents1(_Functionality_: TFunctionality;   const idTNeededType: integer; out ComponentsList: TComponentsList): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponents1(const idTNeededType: integer; out ComponentsList: TComponentsList): boolean;
begin
Result:=TComponentFunctionality__QueryComponents1(Self,   idTNeededType,ComponentsList);
end;

function TComponentFunctionality__QueryComponentsWithTag(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out ComponentsList: TComponentsList): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponentsWithTag(const idTNeededType: integer; const pTag: integer; out ComponentsList: TComponentsList): boolean;
begin
Result:=TComponentFunctionality__QueryComponentsWithTag(Self,   idTNeededType,pTag,ComponentsList);
end;

function TComponentFunctionality__QueryComponentsWithTag1(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponentsWithTag1(const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean;
begin
Result:=TComponentFunctionality__QueryComponentsWithTag1(Self,   idTNeededType,pTag,ComponentsList);
end;

function TComponentFunctionality__QueryComponent(_Functionality_: TFunctionality;   const idTNeededType: integer; out idTComponent,idComponent: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponent(const idTNeededType: integer; out idTComponent,idComponent: integer): boolean;
begin
Result:=TComponentFunctionality__QueryComponent(Self,   idTNeededType,idTComponent,idComponent);
end;

function TComponentFunctionality__QueryComponentWithTag(_Functionality_: TFunctionality;   const pTag: integer; out idTComponent,idComponent: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponentWithTag(const pTag: integer; out idTComponent,idComponent: integer): boolean;
begin
Result:=TComponentFunctionality__QueryComponentWithTag(Self,   pTag,idTComponent,idComponent);
end;

function TComponentFunctionality__QueryComponentWithTag1(_Functionality_: TFunctionality;   const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponentWithTag1(const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean;
begin
Result:=TComponentFunctionality__QueryComponentWithTag1(Self,   idTNeededType,pTag,idTComponent,idComponent);
end;

function TComponentFunctionality__QueryComponentFunctionality(_Functionality_: TFunctionality;   NeededFunctionalityClass: TFunctionalityClass; out Functionality: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.QueryComponentFunctionality(NeededFunctionalityClass: TFunctionalityClass; out Functionality: TFunctionality): boolean;
begin
Result:=TComponentFunctionality__QueryComponentFunctionality(Self,   NeededFunctionalityClass,Functionality);
end;

function TComponentFunctionality__ComponentsCount(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ComponentsCount: integer;
begin
Result:=TComponentFunctionality__ComponentsCount(Self);
end;

function TComponentFunctionality__GetRootOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetRootOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TComponentFunctionality__GetRootOwner(Self,   idTOwner,idOwner);
end;

function TComponentFunctionality__TPresentUpdater_Create(_Functionality_: TFunctionality;   pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater; stdcall; external FunctionalityDLL;
function TComponentFunctionality.TPresentUpdater_Create(pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater;
begin
Result:=TComponentFunctionality__TPresentUpdater_Create(Self,   pUpdateProc,pOffProc);
end;

function TComponentFunctionality__TContextComponentHolder_Create(_Functionality_: TFunctionality): TComponentPresentUpdater; stdcall; external FunctionalityDLL;
function TComponentFunctionality.TContextComponentHolder_Create: TComponentPresentUpdater;
begin
Result:=TComponentFunctionality__TContextComponentHolder_Create(Self);
end;

procedure TComponentFunctionality__RealityRating_AddUserRate(_Functionality_: TFunctionality;   const Rate: integer; const RateReason: WideString); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.RealityRating_AddUserRate(const Rate: integer; const RateReason: WideString);
begin
TComponentFunctionality__RealityRating_AddUserRate(Self,   Rate,RateReason);
end;

procedure TComponentFunctionality__RealityRating_GetAverageRate(_Functionality_: TFunctionality;   out AvrRate: double; out RateCount: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.RealityRating_GetAverageRate(out AvrRate: double; out RateCount: integer);
begin
TComponentFunctionality__RealityRating_GetAverageRate(Self,   AvrRate,RateCount);
end;

procedure TComponentFunctionality__RealityRating_GetData(_Functionality_: TFunctionality;   out RatingData: TByteArray); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.RealityRating_GetData(out RatingData: TByteArray);
begin
TComponentFunctionality__RealityRating_GetData(Self,   RatingData);
end;

function TComponentFunctionality__ActualityInterval_Get(_Functionality_: TFunctionality): TComponentActualityInterval; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ActualityInterval_Get: TComponentActualityInterval;
begin
Result:=TComponentFunctionality__ActualityInterval_Get(Self);
end;

procedure TComponentFunctionality__ActualityInterval_GetTimestamps(_Functionality_: TFunctionality;   out BeginTimestamp,EndTimestamp: double); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ActualityInterval_GetTimestamps(out BeginTimestamp,EndTimestamp: double);
begin
TComponentFunctionality__ActualityInterval_GetTimestamps(Self,   BeginTimestamp,EndTimestamp);
end;

function TComponentFunctionality__ActualityInterval_GetLocally(_Functionality_: TFunctionality): TComponentActualityInterval; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ActualityInterval_GetLocally: TComponentActualityInterval;
begin
Result:=TComponentFunctionality__ActualityInterval_GetLocally(Self);
end;

procedure TComponentFunctionality__ActualityInterval_SetEndTimestamp(_Functionality_: TFunctionality;   const Value: double); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ActualityInterval_SetEndTimestamp(const Value: double);
begin
TComponentFunctionality__ActualityInterval_SetEndTimestamp(Self,   Value);
end;

function TComponentFunctionality__ActualityInterval_IsActualForTime(_Functionality_: TFunctionality;   const pTime: double): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ActualityInterval_IsActualForTime(const pTime: double): boolean;
begin
Result:=TComponentFunctionality__ActualityInterval_IsActualForTime(Self,   pTime);
end;

function TComponentFunctionality__ActualityInterval_IsActualForTimeInterval(_Functionality_: TFunctionality;   const pInterval: TComponentActualityInterval): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ActualityInterval_IsActualForTimeInterval(const pInterval: TComponentActualityInterval): boolean;
begin
Result:=TComponentFunctionality__ActualityInterval_IsActualForTimeInterval(Self,   pInterval);
end;

function TComponentFunctionality__ActualityInterval_IsActualForTimeLocally(_Functionality_: TFunctionality;   const pTime: double): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ActualityInterval_IsActualForTimeLocally(const pTime: double): boolean;
begin
Result:=TComponentFunctionality__ActualityInterval_IsActualForTimeLocally(Self,   pTime);
end;

function TComponentFunctionality__ActualityInterval_IsActualForTimeIntervalLocally(_Functionality_: TFunctionality;   const pInterval: TComponentActualityInterval): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.ActualityInterval_IsActualForTimeIntervalLocally(const pInterval: TComponentActualityInterval): boolean;
begin
Result:=TComponentFunctionality__ActualityInterval_IsActualForTimeIntervalLocally(Self,   pInterval);
end;

procedure TComponentFunctionality__ActualityInterval_Actualize(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ActualityInterval_Actualize;
begin
TComponentFunctionality__ActualityInterval_Actualize(Self);
end;

procedure TComponentFunctionality__ActualityInterval_Deactualize(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ActualityInterval_Deactualize;
begin
TComponentFunctionality__ActualityInterval_Deactualize(Self);
end;

procedure TComponentFunctionality__CreateNewPanelProps(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.CreateNewPanelProps;
begin
TComponentFunctionality__CreateNewPanelProps(Self);
end;

procedure TComponentFunctionality__DestroyPanelProps(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.DestroyPanelProps;
begin
TComponentFunctionality__DestroyPanelProps(Self);
end;

function TComponentFunctionality__IsPanelPropsExist(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.IsPanelPropsExist: boolean;
begin
Result:=TComponentFunctionality__IsPanelPropsExist(Self);
end;

function TComponentFunctionality__GetPanelPropsLeftTop(_Functionality_: TFunctionality;   out PanelProps_Left,PanelProps_Top: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetPanelPropsLeftTop(out PanelProps_Left,PanelProps_Top: integer): boolean;
begin
Result:=TComponentFunctionality__GetPanelPropsLeftTop(Self,   PanelProps_Left,PanelProps_Top);
end;

function TComponentFunctionality__GetPanelPropsWidthHeight(_Functionality_: TFunctionality;   out PanelProps_Width,PanelProps_Height: integer): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetPanelPropsWidthHeight(out PanelProps_Width,PanelProps_Height: integer): boolean;
begin
Result:=TComponentFunctionality__GetPanelPropsWidthHeight(Self,   PanelProps_Width,PanelProps_Height);
end;

procedure TComponentFunctionality__SetPanelPropsLeftTop(_Functionality_: TFunctionality;   const PanelProps_OfsX,PanelProps_OfsY: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetPanelPropsLeftTop(const PanelProps_OfsX,PanelProps_OfsY: integer);
begin
TComponentFunctionality__SetPanelPropsLeftTop(Self,   PanelProps_OfsX,PanelProps_OfsY);
end;

procedure TComponentFunctionality__SetPanelPropsWidthHeight(_Functionality_: TFunctionality;   const PanelProps_Width,PanelProps_Height: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetPanelPropsWidthHeight(const PanelProps_Width,PanelProps_Height: integer);
begin
TComponentFunctionality__SetPanelPropsWidthHeight(Self,   PanelProps_Width,PanelProps_Height);
end;

function TComponentFunctionality__IsCustomPanelPropsExist(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.IsCustomPanelPropsExist: boolean;
begin
Result:=TComponentFunctionality__IsCustomPanelPropsExist(Self);
end;

function TComponentFunctionality__idCustomPanelProps(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.idCustomPanelProps: integer;
begin
Result:=TComponentFunctionality__idCustomPanelProps(Self);
end;

function TComponentFunctionality__CustomPanelProps(_Functionality_: TFunctionality): TMemoryStream; stdcall; external FunctionalityDLL;
function TComponentFunctionality.CustomPanelProps: TMemoryStream;
begin
Result:=TComponentFunctionality__CustomPanelProps(Self);
end;

procedure TComponentFunctionality__SetCustomPanelProps(_Functionality_: TFunctionality;   Stream: TStream; const flNewValue: boolean{если = true, то заменяет панелью с новым ID}); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetCustomPanelProps(Stream: TStream; const flNewValue: boolean{если = true, то заменяет панелью с новым ID});
begin
TComponentFunctionality__SetCustomPanelProps(Self,   Stream,flNewValue);
end;

procedure TComponentFunctionality__SetCustomPanelPropsByID(_Functionality_: TFunctionality;   const idPanelProps: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetCustomPanelPropsByID(const idPanelProps: integer);
begin
TComponentFunctionality__SetCustomPanelPropsByID(Self,   idPanelProps);
end;

procedure TComponentFunctionality__ReleaseCustomPanelProps(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.ReleaseCustomPanelProps;
begin
TComponentFunctionality__ReleaseCustomPanelProps(Self);
end;

function TComponentFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external FunctionalityDLL;
function TComponentFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TComponentFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TComponentFunctionality__getSpace(_Functionality_: TFunctionality): TProxySpace; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getSpace: TProxySpace;
begin
Result:=TComponentFunctionality__getSpace(Self);
end;

function TComponentFunctionality__getidTObj(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getidTObj: integer;
begin
Result:=TComponentFunctionality__getidTObj(Self);
end;

function TComponentFunctionality__getName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getName: string;
begin
Result:=TComponentFunctionality__getName(Self);
end;

procedure TComponentFunctionality__setName(_Functionality_: TFunctionality;   Value: string); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.setName(Value: string);
begin
TComponentFunctionality__setName(Self,   Value);
end;

function TComponentFunctionality__getHint(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getHint: string;
begin
Result:=TComponentFunctionality__getHint(Self);
end;

function TComponentFunctionality__getTag(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getTag: integer;
begin
Result:=TComponentFunctionality__getTag(Self);
end;

procedure TComponentFunctionality__setTag(_Functionality_: TFunctionality;   Value: integer); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.setTag(Value: integer);
begin
TComponentFunctionality__setTag(Self,   Value);
end;

function TComponentFunctionality__GetIconImage(_Functionality_: TFunctionality;   out Image: TBitmap): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetIconImage(out Image: TBitmap): boolean;
begin
Result:=TComponentFunctionality__GetIconImage(Self,   Image);
end;

procedure TComponentFunctionality__DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.DoOnComponentUpdate;
begin
TComponentFunctionality__DoOnComponentUpdate(Self);
end;

procedure TComponentFunctionality__GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.GetExportDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList);
begin
TComponentFunctionality__GetExportDATA(Self,   Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;

function TComponentFunctionality___GetDataDocument(_Functionality_: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality._GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
begin
Result:=TComponentFunctionality___GetDataDocument(Self,   DataModel,DataType,flWithComponents,Document);
end;

function TComponentFunctionality__GetDataDocument(_Functionality_: TFunctionality;   const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean;
begin
Result:=TComponentFunctionality__GetDataDocument(Self,   DataModel,DataType,flWithComponents,Document);
end;

function TComponentFunctionality__GetHintInfo(_Functionality_: TFunctionality;   const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
begin
Result:=TComponentFunctionality__GetHintInfo(Self,   InfoType,InfoFormat,HintInfo);
end;

procedure TComponentFunctionality__NotifyOnComponentUpdate(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.NotifyOnComponentUpdate;
begin
TComponentFunctionality__NotifyOnComponentUpdate(Self);
end;

function TComponentFunctionality__GetComponentDATA(_Functionality_: TFunctionality;   const Version: integer): TByteArray; stdcall; external FunctionalityDLL;
function TComponentFunctionality.GetComponentDATA(const Version: integer): TByteArray;
begin
Result:=TComponentFunctionality__GetComponentDATA(Self,   Version);
end;

procedure TComponentFunctionality__SetComponentDATA(_Functionality_: TFunctionality;   const Data: TByteArray); stdcall; external FunctionalityDLL;
procedure TComponentFunctionality.SetComponentDATA(const Data: TByteArray);
begin
TComponentFunctionality__SetComponentDATA(Self,   Data);
end;

function TComponentFunctionality__getTypeSystem(_Functionality_: TFunctionality): TTypeSystem; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getTypeSystem: TTypeSystem;
begin
Result:=TComponentFunctionality__getTypeSystem(Self);
end;

function TComponentFunctionality__getTableName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TComponentFunctionality.getTableName: string;
begin
Result:=TComponentFunctionality__getTableName(Self);
end;


{TTProxyObjectFunctionality}
function TTProxyObjectFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TTProxyObjectFunctionality._CreateInstance: integer;
begin
Result:=TTProxyObjectFunctionality___CreateInstance(Self);
end;

procedure TTProxyObjectFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall; external FunctionalityDLL;
procedure TTProxyObjectFunctionality._DestroyInstance(const idObj: integer);
begin
TTProxyObjectFunctionality___DestroyInstance(Self,   idObj);
end;

function TTProxyObjectFunctionality__TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external FunctionalityDLL;
function TTProxyObjectFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTProxyObjectFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTProxyObjectFunctionality__getName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TTProxyObjectFunctionality.getName: string;
begin
Result:=TTProxyObjectFunctionality__getName(Self);
end;

function TTProxyObjectFunctionality__getImage(_Functionality_: TFunctionality): TTypeImage; stdcall; external FunctionalityDLL;
function TTProxyObjectFunctionality.getImage: TTypeImage;
begin
Result:=TTProxyObjectFunctionality__getImage(Self);
end;


{TProxyObjectFunctionality}
procedure TProxyObjectFunctionality___ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall; external FunctionalityDLL;
procedure TProxyObjectFunctionality._ToClone(out idClone: integer);
begin
TProxyObjectFunctionality___ToClone(Self,   idClone);
end;

function TProxyObjectFunctionality__CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall; external FunctionalityDLL;
function TProxyObjectFunctionality.CanDestroy(out Reason: string): boolean;
begin
Result:=TProxyObjectFunctionality__CanDestroy(Self,   Reason);
end;

function TProxyObjectFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external FunctionalityDLL;
function TProxyObjectFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TProxyObjectFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TProxyObjectFunctionality__getName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TProxyObjectFunctionality.getName: string;
begin
Result:=TProxyObjectFunctionality__getName(Self);
end;

function TProxyObjectFunctionality__getHint(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TProxyObjectFunctionality.getHint: string;
begin
Result:=TProxyObjectFunctionality__getHint(Self);
end;

function TProxyObjectFunctionality__GetReference(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external FunctionalityDLL;
function TProxyObjectFunctionality.GetReference(out idTOwner,idOwner: integer): boolean;
begin
Result:=TProxyObjectFunctionality__GetReference(Self,   idTOwner,idOwner);
end;

procedure TProxyObjectFunctionality__SetReference(_Functionality_: TFunctionality;   const idTOwner,idOwner: integer); stdcall; external FunctionalityDLL;
procedure TProxyObjectFunctionality.SetReference(const idTOwner,idOwner: integer);
begin
TProxyObjectFunctionality__SetReference(Self,   idTOwner,idOwner);
end;


{TTBaseVisualizationFunctionality}
procedure TTBaseVisualizationFunctionality__GetComponentOwnerDatas(_Functionality_: TFunctionality;   const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); stdcall; external FunctionalityDLL;
procedure TTBaseVisualizationFunctionality.GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
begin
TTBaseVisualizationFunctionality__GetComponentOwnerDatas(Self,   IDs,DataFlags,Data);
end;

function TTBaseVisualizationFunctionality__CanCreateAsDetail(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TTBaseVisualizationFunctionality.CanCreateAsDetail: boolean;
begin
Result:=TTBaseVisualizationFunctionality__CanCreateAsDetail(Self);
end;

function TTBaseVisualizationFunctionality__ImportInstance(_Functionality_: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall; external FunctionalityDLL;
function TTBaseVisualizationFunctionality.ImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
begin
Result:=TTBaseVisualizationFunctionality__ImportInstance(Self,   ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTBaseVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall; external FunctionalityDLL;
function TTBaseVisualizationFunctionality.getReflector: TAbstractReflector;
begin
Result:=TTBaseVisualizationFunctionality__getReflector(Self);
end;

procedure TTBaseVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall; external FunctionalityDLL;
procedure TTBaseVisualizationFunctionality.setReflector(Value: TAbstractReflector);
begin
TTBaseVisualizationFunctionality__setReflector(Self,   Value);
end;


{TBaseVisualizationFunctionality}
procedure TBaseVisualizationFunctionality__DestroyData(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.DestroyData;
begin
TBaseVisualizationFunctionality__DestroyData(Self);
end;

procedure TBaseVisualizationFunctionality__CloneData(_Functionality_: TFunctionality;   out idClone: integer); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.CloneData(out idClone: integer);
begin
TBaseVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TBaseVisualizationFunctionality__Ptr(_Functionality_: TFunctionality): TPtr; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.Ptr: TPtr;
begin
Result:=TBaseVisualizationFunctionality__Ptr(Self);
end;

procedure TBaseVisualizationFunctionality__DoOnChangeScale(_Functionality_: TFunctionality;   const ChangeCoef: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.DoOnChangeScale(const ChangeCoef: Double);
begin
TBaseVisualizationFunctionality__DoOnChangeScale(Self,   ChangeCoef);
end;

function TBaseVisualizationFunctionality__IsUnReferenced(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.IsUnReferenced: boolean;
begin
Result:=TBaseVisualizationFunctionality__IsUnReferenced(Self);
end;

function TBaseVisualizationFunctionality__TVisualizationUpdating_Create(_Functionality_: TFunctionality;   Reflecting: TReflecting): TObject; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
begin
Result:=TBaseVisualizationFunctionality__TVisualizationUpdating_Create(Self,   Reflecting);
end;

procedure TBaseVisualizationFunctionality__ReflectInScene(_Functionality_: TFunctionality;   Scene: TScene); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.ReflectInScene(Scene: TScene);
begin
TBaseVisualizationFunctionality__ReflectInScene(Self,   Scene);
end;

procedure TBaseVisualizationFunctionality__Scaling(_Functionality_: TFunctionality;   const pScale: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.Scaling(const pScale: Double);
begin
TBaseVisualizationFunctionality__Scaling(Self,   pScale);
end;

procedure TBaseVisualizationFunctionality__SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.SetPosition(const X,Y,Z: Double);
begin
TBaseVisualizationFunctionality__SetPosition(Self,   X,Y,Z);
end;

procedure TBaseVisualizationFunctionality__Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.Move(const dX,dY,dZ: Double);
begin
TBaseVisualizationFunctionality__Move(Self,   dX,dY,dZ);
end;

procedure TBaseVisualizationFunctionality__ChangeScale(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
begin
TBaseVisualizationFunctionality__ChangeScale(Self,   Xbind,Ybind,pScale);
end;

procedure TBaseVisualizationFunctionality__Rotate(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const Angle: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.Rotate(const Xbind,Ybind: Double; const Angle: Double);
begin
TBaseVisualizationFunctionality__Rotate(Self,   Xbind,Ybind,Angle);
end;

procedure TBaseVisualizationFunctionality__Transform(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
TBaseVisualizationFunctionality__Transform(Self,   Xbind,Ybind,pScale,Angle,dX,dY);
end;

procedure TBaseVisualizationFunctionality__SetPropertiesLocal(_Functionality_: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
begin
TBaseVisualizationFunctionality__SetPropertiesLocal(Self,   pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
end;

procedure TBaseVisualizationFunctionality__DoOnComponentUpdate(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.DoOnComponentUpdate;
begin
TBaseVisualizationFunctionality__DoOnComponentUpdate(Self);
end;

function TBaseVisualizationFunctionality__DoOnOver(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.DoOnOver: boolean;
begin
Result:=TBaseVisualizationFunctionality__DoOnOver(Self);
end;

function TBaseVisualizationFunctionality__DoOnClick(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.DoOnClick: boolean;
begin
Result:=TBaseVisualizationFunctionality__DoOnClick(Self);
end;

function TBaseVisualizationFunctionality__DoOnDblClick(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.DoOnDblClick: boolean;
begin
Result:=TBaseVisualizationFunctionality__DoOnDblClick(Self);
end;

procedure TBaseVisualizationFunctionality__GetExportDATA(_Functionality_: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.GetExportDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList);
begin
TBaseVisualizationFunctionality__GetExportDATA(Self,   Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;

procedure TBaseVisualizationFunctionality__GetOwnerByVisualization(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.GetOwnerByVisualization(out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr);
begin
TBaseVisualizationFunctionality__GetOwnerByVisualization(Self,   idTOwner,idOwner,ptrOwnerVisualization);
end;

function TBaseVisualizationFunctionality__GetCoVisualizationSpaces(_Functionality_: TFunctionality;   out List: TList): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.GetCoVisualizationSpaces(out List: TList): boolean;
begin
Result:=TBaseVisualizationFunctionality__GetCoVisualizationSpaces(Self,   List);
end;

function TBaseVisualizationFunctionality__GetCoVisualizationSpaces1(_Functionality_: TFunctionality;   out List: TByteArray): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.GetCoVisualizationSpaces1(out List: TByteArray): boolean;
begin
Result:=TBaseVisualizationFunctionality__GetCoVisualizationSpaces1(Self,   List);
end;

function TBaseVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.getReflector: TAbstractReflector;
begin
Result:=TBaseVisualizationFunctionality__getReflector(Self);
end;

procedure TBaseVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.setReflector(Value: TAbstractReflector);
begin
TBaseVisualizationFunctionality__setReflector(Self,   Value);
end;

function TBaseVisualizationFunctionality__getStrobing(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.getStrobing: boolean;
begin
Result:=TBaseVisualizationFunctionality__getStrobing(Self);
end;

procedure TBaseVisualizationFunctionality__setStrobing(_Functionality_: TFunctionality;   Value: boolean); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.setStrobing(Value: boolean);
begin
TBaseVisualizationFunctionality__setStrobing(Self,   Value);
end;

function TBaseVisualizationFunctionality__getStrobingInterval(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TBaseVisualizationFunctionality.getStrobingInterval: integer;
begin
Result:=TBaseVisualizationFunctionality__getStrobingInterval(Self);
end;

procedure TBaseVisualizationFunctionality__setStrobingInterval(_Functionality_: TFunctionality;   Value: integer); stdcall; external FunctionalityDLL;
procedure TBaseVisualizationFunctionality.setStrobingInterval(Value: integer);
begin
TBaseVisualizationFunctionality__setStrobingInterval(Self,   Value);
end;


{TTBase2DVisualizationFunctionality}
function TTBase2DVisualizationFunctionality___CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external FunctionalityDLL;
function TTBase2DVisualizationFunctionality._CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer;
begin
Result:=TTBase2DVisualizationFunctionality___CreateInstanceEx(Self,   pObjectVisualization,ptrOwner);
end;

function TTBase2DVisualizationFunctionality__CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external FunctionalityDLL;
function TTBase2DVisualizationFunctionality.CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer;
begin
Result:=TTBase2DVisualizationFunctionality__CreateInstanceEx(Self,   pObjectVisualization,ptrOwner);
end;

procedure TTBase2DVisualizationFunctionality___DestroyInstance(_Functionality_: TFunctionality;   const idObj: integer); stdcall; external FunctionalityDLL;
procedure TTBase2DVisualizationFunctionality._DestroyInstance(const idObj: integer);
begin
TTBase2DVisualizationFunctionality___DestroyInstance(Self,   idObj);
end;

function TTBase2DVisualizationFunctionality__CreateObj(_Functionality_: TFunctionality;   pReflector: TAbstractReflector; pObjectVisualization: TObjectVisualization; const flAbsoluteCoords: boolean; const idTObj,idObj: integer; ptrOwner: TPtr): TPtr; stdcall; external FunctionalityDLL;
function TTBase2DVisualizationFunctionality.CreateObj(pReflector: TAbstractReflector; pObjectVisualization: TObjectVisualization; const flAbsoluteCoords: boolean; const idTObj,idObj: integer; ptrOwner: TPtr): TPtr;
begin
Result:=TTBase2DVisualizationFunctionality__CreateObj(Self,   pReflector,pObjectVisualization,flAbsoluteCoords,idTObj,idObj,ptrOwner);
end;

procedure TTBase2DVisualizationFunctionality__DestroyObj(_Functionality_: TFunctionality;   const ptrDestrObj: TPtr); stdcall; external FunctionalityDLL;
procedure TTBase2DVisualizationFunctionality.DestroyObj(const ptrDestrObj: TPtr);
begin
TTBase2DVisualizationFunctionality__DestroyObj(Self,   ptrDestrObj);
end;

procedure TTBase2DVisualizationFunctionality__GetDisproportionObjects(_Functionality_: TFunctionality;   const Factor: double; out ObjectsList: TByteArray); stdcall; external FunctionalityDLL;
procedure TTBase2DVisualizationFunctionality.GetDisproportionObjects(const Factor: double; out ObjectsList: TByteArray);
begin
TTBase2DVisualizationFunctionality__GetDisproportionObjects(Self,   Factor,ObjectsList);
end;

function TTBase2DVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall; external FunctionalityDLL;
function TTBase2DVisualizationFunctionality.getReflector: TAbstractReflector;
begin
Result:=TTBase2DVisualizationFunctionality__getReflector(Self);
end;

procedure TTBase2DVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall; external FunctionalityDLL;
procedure TTBase2DVisualizationFunctionality.setReflector(Value: TAbstractReflector);
begin
TTBase2DVisualizationFunctionality__setReflector(Self,   Value);
end;

function TTBase2DVisualizationFunctionality__StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall; external FunctionalityDLL;
function TTBase2DVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTBase2DVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TBase2DVisualizationFunctionality}
function TBase2DVisualizationFunctionality__Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TBase2DVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

function TBase2DVisualizationFunctionality__ReflectOnCanvas(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
begin
Result:=TBase2DVisualizationFunctionality__ReflectOnCanvas(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TBase2DVisualizationFunctionality__CreateClone(_Functionality_: TFunctionality;   const ptrObj: TPtr; const ptrCloneOwner: TPtr; out idClone: integer); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.CreateClone(const ptrObj: TPtr; const ptrCloneOwner: TPtr; out idClone: integer);
begin
TBase2DVisualizationFunctionality__CreateClone(Self,   ptrObj,ptrCloneOwner,idClone);
end;

procedure TBase2DVisualizationFunctionality__GetLayInfo(_Functionality_: TFunctionality;   out Lay,SubLay: integer); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.GetLayInfo(out Lay,SubLay: integer);
begin
TBase2DVisualizationFunctionality__GetLayInfo(Self,   Lay,SubLay);
end;

function TBase2DVisualizationFunctionality__GetDetailsList(_Functionality_: TFunctionality;   out DetailsList: TComponentsList): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.GetDetailsList(out DetailsList: TComponentsList): boolean;
begin
Result:=TBase2DVisualizationFunctionality__GetDetailsList(Self,   DetailsList);
end;

function TBase2DVisualizationFunctionality__ReflectAsNotLoaded(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pCanvas: TCanvas): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.ReflectAsNotLoaded(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pCanvas: TCanvas): boolean;
begin
Result:=TBase2DVisualizationFunctionality__ReflectAsNotLoaded(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pCanvas);
end;

function TBase2DVisualizationFunctionality__ContainerFilled(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.ContainerFilled: boolean;
begin
Result:=TBase2DVisualizationFunctionality__ContainerFilled(Self);
end;

procedure TBase2DVisualizationFunctionality__GetProps(_Functionality_: TFunctionality;   out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.GetProps(out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor);
begin
TBase2DVisualizationFunctionality__GetProps(Self,   oflagLoop,oColor,oWidth,oflagFill,oColorFill);
end;

procedure TBase2DVisualizationFunctionality__SetProps(_Functionality_: TFunctionality;   const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.SetProps(const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor);
begin
TBase2DVisualizationFunctionality__SetProps(Self,   pflagLoop,pColor,pWidth,pflagFill,pColorFill);
end;

procedure TBase2DVisualizationFunctionality__CreateNode(_Functionality_: TFunctionality;   const CreateNodeIndex: integer; const X,Y: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.CreateNode(const CreateNodeIndex: integer; const X,Y: Double);
begin
TBase2DVisualizationFunctionality__CreateNode(Self,   CreateNodeIndex,X,Y);
end;

procedure TBase2DVisualizationFunctionality__DestroyNode(_Functionality_: TFunctionality;   const DestroyNodeIndex: integer); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.DestroyNode(const DestroyNodeIndex: integer);
begin
TBase2DVisualizationFunctionality__DestroyNode(Self,   DestroyNodeIndex);
end;

procedure TBase2DVisualizationFunctionality__SetNode(_Functionality_: TFunctionality;   const SetNodeIndex: integer; const newX,newY: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.SetNode(const SetNodeIndex: integer; const newX,newY: Double);
begin
TBase2DVisualizationFunctionality__SetNode(Self,   SetNodeIndex,newX,newY);
end;

procedure TBase2DVisualizationFunctionality__GetNodes(_Functionality_: TFunctionality;   out Nodes: TByteArray); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.GetNodes(out Nodes: TByteArray);
begin
TBase2DVisualizationFunctionality__GetNodes(Self,   Nodes);
end;

procedure TBase2DVisualizationFunctionality__SetNodes(_Functionality_: TFunctionality;   const Nodes: TByteArray; const pWidth: double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.SetNodes(const Nodes: TByteArray; const pWidth: double);
begin
TBase2DVisualizationFunctionality__SetNodes(Self,   Nodes,pWidth);
end;

procedure TBase2DVisualizationFunctionality__CheckPlace(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.CheckPlace(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
TBase2DVisualizationFunctionality__CheckPlace(Self,   Xbind,Ybind,pScale,Angle,dX,dY);
end;

procedure TBase2DVisualizationFunctionality__Move(_Functionality_: TFunctionality;   const dX,dY,dZ: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.Move(const dX,dY,dZ: Double);
begin
TBase2DVisualizationFunctionality__Move(Self,   dX,dY,dZ);
end;

procedure TBase2DVisualizationFunctionality__SetPosition(_Functionality_: TFunctionality;   const X,Y,Z: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.SetPosition(const X,Y,Z: Double);
begin
TBase2DVisualizationFunctionality__SetPosition(Self,   X,Y,Z);
end;

procedure TBase2DVisualizationFunctionality__ChangeScale(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
begin
TBase2DVisualizationFunctionality__ChangeScale(Self,   Xbind,Ybind,pScale);
end;

procedure TBase2DVisualizationFunctionality__Rotate(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const Angle: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.Rotate(const Xbind,Ybind: Double; const Angle: Double);
begin
TBase2DVisualizationFunctionality__Rotate(Self,   Xbind,Ybind,Angle);
end;

procedure TBase2DVisualizationFunctionality__ChangeLay(_Functionality_: TFunctionality;   const NewLayID: integer); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.ChangeLay(const NewLayID: integer);
begin
TBase2DVisualizationFunctionality__ChangeLay(Self,   NewLayID);
end;

procedure TBase2DVisualizationFunctionality__ChangeOwner(_Functionality_: TFunctionality;   const ptrNewOwner: TPtr); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.ChangeOwner(const ptrNewOwner: TPtr);
begin
TBase2DVisualizationFunctionality__ChangeOwner(Self,   ptrNewOwner);
end;

procedure TBase2DVisualizationFunctionality__Transform(_Functionality_: TFunctionality;   const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
TBase2DVisualizationFunctionality__Transform(Self,   Xbind,Ybind,pScale,Angle,dX,dY);
end;

function TBase2DVisualizationFunctionality__Square(_Functionality_: TFunctionality): Double; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.Square: Double;
begin
Result:=TBase2DVisualizationFunctionality__Square(Self);
end;

function TBase2DVisualizationFunctionality__Square1(_Functionality_: TFunctionality;   const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: TCrd; const NewWidth: Double; const pScale: Double): Double; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.Square1(const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: TCrd; const NewWidth: Double; const pScale: Double): Double;
begin
Result:=TBase2DVisualizationFunctionality__Square1(Self,   ExceptPointPtr,ExceptPointValueX,ExceptPointValueY,NewWidth,pScale);
end;

function TBase2DVisualizationFunctionality__GetFormatNodes(_Functionality_: TFunctionality;   out NodesList: TList; out SizeX,SizeY: integer): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.GetFormatNodes(out NodesList: TList; out SizeX,SizeY: integer): boolean;
begin
Result:=TBase2DVisualizationFunctionality__GetFormatNodes(Self,   NodesList,SizeX,SizeY);
end;

procedure TBase2DVisualizationFunctionality__GetInsideObjectsList(_Functionality_: TFunctionality;   out List: TComponentsList); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.GetInsideObjectsList(out List: TComponentsList);
begin
TBase2DVisualizationFunctionality__GetInsideObjectsList(Self,   List);
end;

function TBase2DVisualizationFunctionality__getReflector(_Functionality_: TFunctionality): TAbstractReflector; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.getReflector: TAbstractReflector;
begin
Result:=TBase2DVisualizationFunctionality__getReflector(Self);
end;

procedure TBase2DVisualizationFunctionality__setReflector(_Functionality_: TFunctionality;   Value: TAbstractReflector); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.setReflector(Value: TAbstractReflector);
begin
TBase2DVisualizationFunctionality__setReflector(Self,   Value);
end;

function TBase2DVisualizationFunctionality__getIdLay(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.getIdLay: integer;
begin
Result:=TBase2DVisualizationFunctionality__getIdLay(Self);
end;

function TBase2DVisualizationFunctionality__getWidth(_Functionality_: TFunctionality): Double; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.getWidth: Double;
begin
Result:=TBase2DVisualizationFunctionality__getWidth(Self);
end;

procedure TBase2DVisualizationFunctionality__setWidth(_Functionality_: TFunctionality;   Value: Double); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.setWidth(Value: Double);
begin
TBase2DVisualizationFunctionality__setWidth(Self,   Value);
end;

function TBase2DVisualizationFunctionality__getflUserSecurity(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.getflUserSecurity: boolean;
begin
Result:=TBase2DVisualizationFunctionality__getflUserSecurity(Self);
end;

procedure TBase2DVisualizationFunctionality__setflUserSecurity(_Functionality_: TFunctionality;   Value: boolean); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.setflUserSecurity(Value: boolean);
begin
TBase2DVisualizationFunctionality__setflUserSecurity(Self,   Value);
end;

function TBase2DVisualizationFunctionality__getflDetailsNoIndex(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.getflDetailsNoIndex: boolean;
begin
Result:=TBase2DVisualizationFunctionality__getflDetailsNoIndex(Self);
end;

procedure TBase2DVisualizationFunctionality__setflDetailsNoIndex(_Functionality_: TFunctionality;   Value: boolean); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.setflDetailsNoIndex(Value: boolean);
begin
TBase2DVisualizationFunctionality__setflDetailsNoIndex(Self,   Value);
end;

function TBase2DVisualizationFunctionality__getflNotifyOwnerOnChange(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TBase2DVisualizationFunctionality.getflNotifyOwnerOnChange: boolean;
begin
Result:=TBase2DVisualizationFunctionality__getflNotifyOwnerOnChange(Self);
end;

procedure TBase2DVisualizationFunctionality__setflNotifyOwnerOnChange(_Functionality_: TFunctionality;   Value: boolean); stdcall; external FunctionalityDLL;
procedure TBase2DVisualizationFunctionality.setflNotifyOwnerOnChange(Value: boolean);
begin
TBase2DVisualizationFunctionality__setflNotifyOwnerOnChange(Self,   Value);
end;


{TTLay2DVisualizationFunctionality}
function TTLay2DVisualizationFunctionality___CreateInstance(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TTLay2DVisualizationFunctionality._CreateInstance: integer;
begin
Result:=TTLay2DVisualizationFunctionality___CreateInstance(Self);
end;

function TTLay2DVisualizationFunctionality__TComponentFunctionality_Create(_Functionality_: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall; external FunctionalityDLL;
function TTLay2DVisualizationFunctionality.TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
begin
Result:=TTLay2DVisualizationFunctionality__TComponentFunctionality_Create(Self,   idComponent);
end;

function TTLay2DVisualizationFunctionality__getName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TTLay2DVisualizationFunctionality.getName: string;
begin
Result:=TTLay2DVisualizationFunctionality__getName(Self);
end;

function TTLay2DVisualizationFunctionality__getImage(_Functionality_: TFunctionality): TTypeImage; stdcall; external FunctionalityDLL;
function TTLay2DVisualizationFunctionality.getImage: TTypeImage;
begin
Result:=TTLay2DVisualizationFunctionality__getImage(Self);
end;

function TTLay2DVisualizationFunctionality___CreateInstanceEx(_Functionality_: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall; external FunctionalityDLL;
function TTLay2DVisualizationFunctionality._CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer;
begin
Result:=TTLay2DVisualizationFunctionality___CreateInstanceEx(Self,   pObjectVisualization,ptrOwner);
end;

function TTLay2DVisualizationFunctionality__StdObjectVisualization(_Functionality_: TFunctionality): TObjectVisualization; stdcall; external FunctionalityDLL;
function TTLay2DVisualizationFunctionality.StdObjectVisualization: TObjectVisualization;
begin
Result:=TTLay2DVisualizationFunctionality__StdObjectVisualization(Self);
end;


{TLay2DVisualizationFunctionality}
procedure TLay2DVisualizationFunctionality__DestroyData(_Functionality_: TFunctionality); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.DestroyData;
begin
TLay2DVisualizationFunctionality__DestroyData(Self);
end;

procedure TLay2DVisualizationFunctionality___ToClone(_Functionality_: TFunctionality;   out idClone: integer); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality._ToClone(out idClone: integer);
begin
TLay2DVisualizationFunctionality___ToClone(Self,   idClone);
end;

function TLay2DVisualizationFunctionality__CanDestroy(_Functionality_: TFunctionality;   out Reason: string): boolean; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.CanDestroy(out Reason: string): boolean;
begin
Result:=TLay2DVisualizationFunctionality__CanDestroy(Self,   Reason);
end;

function TLay2DVisualizationFunctionality__TPanelProps_Create(_Functionality_: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
begin
Result:=TLay2DVisualizationFunctionality__TPanelProps_Create(Self,   pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLay2DVisualizationFunctionality__GetOwner(_Functionality_: TFunctionality;   out idTOwner,idOwner: integer): boolean; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TLay2DVisualizationFunctionality__GetOwner(Self,   idTOwner,idOwner);
end;

function TLay2DVisualizationFunctionality__getName(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.getName: string;
begin
Result:=TLay2DVisualizationFunctionality__getName(Self);
end;

procedure TLay2DVisualizationFunctionality__setName(_Functionality_: TFunctionality;   Value: string); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.setName(Value: string);
begin
TLay2DVisualizationFunctionality__setName(Self,   Value);
end;

function TLay2DVisualizationFunctionality__getHint(_Functionality_: TFunctionality): string; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.getHint: string;
begin
Result:=TLay2DVisualizationFunctionality__getHint(Self);
end;

procedure TLay2DVisualizationFunctionality__CloneData(_Functionality_: TFunctionality;   out idClone: integer); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.CloneData(out idClone: integer);
begin
TLay2DVisualizationFunctionality__CloneData(Self,   idClone);
end;

function TLay2DVisualizationFunctionality__Reflect(_Functionality_: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
begin
Result:=TLay2DVisualizationFunctionality__Reflect(Self,   pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas,ptrCancelFlag);
end;

procedure TLay2DVisualizationFunctionality__GetObjectPointersList(_Functionality_: TFunctionality;   out List: TList); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.GetObjectPointersList(out List: TList);
begin
TLay2DVisualizationFunctionality__GetObjectPointersList(Self,   List);
end;

function TLay2DVisualizationFunctionality__isEmpty(_Functionality_: TFunctionality): boolean; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.isEmpty: boolean;
begin
Result:=TLay2DVisualizationFunctionality__isEmpty(Self);
end;

function TLay2DVisualizationFunctionality__getNumber(_Functionality_: TFunctionality): integer; stdcall; external FunctionalityDLL;
function TLay2DVisualizationFunctionality.getNumber: integer;
begin
Result:=TLay2DVisualizationFunctionality__getNumber(Self);
end;

procedure TLay2DVisualizationFunctionality__GetParams(_Functionality_: TFunctionality;   out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.GetParams(out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
begin
TLay2DVisualizationFunctionality__GetParams(Self,   oName,oVisibleMinScale,oVisibleMaxScale);
end;

procedure TLay2DVisualizationFunctionality__GetParams1(_Functionality_: TFunctionality;   out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.GetParams1(out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
begin
TLay2DVisualizationFunctionality__GetParams1(Self,   oName,oNumber,oVisibleMinScale,oVisibleMaxScale);
end;

procedure TLay2DVisualizationFunctionality__SetParams(_Functionality_: TFunctionality;   const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double); stdcall; external FunctionalityDLL;
procedure TLay2DVisualizationFunctionality.SetParams(const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double);
begin
TLay2DVisualizationFunctionality__SetParams(Self,   pName,pVisibleMinScale,pVisibleMaxScale);
end;


