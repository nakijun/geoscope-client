//. import functionality routines implementations

{$IFDEF EmbeddedServer}
{$I ServerFunctionalityImportImplementation.inc}
{$ENDIF}

{TTypeFunctionality}
Constructor TTypeFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTypeSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTypeFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTypeSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTypeFunctionalityRemoted.TTypeSOAPFunctionality: ITTypeSOAPFunctionality;
begin
if (FTTypeSOAPFunctionality = nil)
  then FTTypeSOAPFunctionality:=GetITTypeSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTypeSOAPFunctionality;
end;
{$ELSE}
function TTypeFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTypeFunctionalityRemoted.CreateInstance: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTypeSOAPFunctionality.CreateInstance(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType);
{$ELSE}
Result:=TTypeFunctionality_CreateInstance(ServerFunctionality());
{$ENDIF}
end;

function TTypeFunctionalityRemoted.CreateInstanceUsingObject(const idTUseObj,idUseObj: integer): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTypeSOAPFunctionality.CreateInstanceUsingObject(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   idTUseObj,idUseObj);
{$ELSE}
Result:=TTypeFunctionality_CreateInstanceUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

procedure TTypeFunctionalityRemoted.DestroyInstance(const idObj: integer);
begin
{$IFNDEF EmbeddedServer}
TTypeSOAPFunctionality.DestroyInstance(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   idObj);
{$ELSE}
TTypeFunctionality_DestroyInstance(ServerFunctionality(),   idObj);
{$ENDIF}
end;

procedure TTypeFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTypeSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   List);
{$ELSE}
TTypeFunctionality_GetInstanceList(ServerFunctionality(),   List);
{$ENDIF}
end;

procedure TTypeFunctionalityRemoted.GetInstanceOwnerNames(const IDs: TByteArray; out Data: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTypeSOAPFunctionality.GetInstanceOwnerNames(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   IDs,Data);
{$ELSE}
TTypeFunctionality_GetInstanceOwnerNames(ServerFunctionality(),   IDs,Data);
{$ENDIF}
end;

procedure TTypeFunctionalityRemoted.GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTypeSOAPFunctionality.GetComponentOwnerDatas(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   IDs,DataFlags,Data);
{$ELSE}
TTypeFunctionality_GetComponentOwnerDatas(ServerFunctionality(),   IDs,DataFlags,Data);
{$ENDIF}
end;

function TTypeFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TTypeSOAPFunctionality.getName(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType);
{$ELSE}
Result:=TTypeFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;


{TComponentFunctionality}
Constructor TComponentFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTComponentSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TComponentFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTComponentSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TComponentFunctionalityRemoted.TComponentSOAPFunctionality: ITComponentSOAPFunctionality;
begin
if (FTComponentSOAPFunctionality = nil)
  then FTComponentSOAPFunctionality:=GetITComponentSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTComponentSOAPFunctionality;
end;
{$ELSE}
function TComponentFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TComponentFunctionalityRemoted.Check;
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.Check(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
TComponentFunctionality_Check(ServerFunctionality());
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.CheckUserOperation(const idOperation: integer);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.CheckUserOperation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idOperation);
{$ELSE}
TComponentFunctionality_CheckUserOperation(ServerFunctionality(),   idOperation);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.CreationTimestamp: double;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.CreationTimestamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentFunctionality_CreationTimestamp(ServerFunctionality());
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.CloneAndInsertComponent(const idTComponent,idComponent: integer; out idClone: integer; out id: integer);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.CloneAndInsertComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTComponent,idComponent,idClone,id);
{$ELSE}
TComponentFunctionality_CloneAndInsertComponent(ServerFunctionality(),   idTComponent,idComponent,idClone,id);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.ImportAndInsertComponents(const DATAStream: TByteArray; out ComponentsList: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.ImportAndInsertComponents(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   DATAStream,ComponentsList);
{$ELSE}
TComponentFunctionality_ImportAndInsertComponents(ServerFunctionality(),   DATAStream,ComponentsList);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.DestroyComponent(const idTComponent,idComponent: integer);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.DestroyComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTComponent,idComponent);
{$ELSE}
TComponentFunctionality_DestroyComponent(ServerFunctionality(),   idTComponent,idComponent);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.RemoveComponent(const idTComponent,idComponent: integer);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.RemoveComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTComponent,idComponent);
{$ELSE}
TComponentFunctionality_RemoveComponent(ServerFunctionality(),   idTComponent,idComponent);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.ToClone(out idClone: integer);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.ToClone(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idClone);
{$ELSE}
TComponentFunctionality_ToClone(ServerFunctionality(),   idClone);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.ToCloneUsingObject(const idTUseObj,idUseObj: integer; out idClone: integer);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.ToCloneUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTUseObj,idUseObj,idClone);
{$ELSE}
TComponentFunctionality_ToCloneUsingObject(ServerFunctionality(),   idTUseObj,idUseObj,idClone);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TComponentFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTUseObj,idUseObj);
{$ELSE}
Result:=TComponentFunctionality_SetComponentsUsingObject(ServerFunctionality(),   idTUseObj,idUseObj);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.DestroyComponents;
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.DestroyComponents(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
TComponentFunctionality_DestroyComponents(ServerFunctionality());
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.RemoveSelfAsComponent;
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.RemoveSelfAsComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
TComponentFunctionality_RemoveSelfAsComponent(ServerFunctionality());
{$ENDIF}
end;

function TComponentFunctionalityRemoted.IsUnReferenced: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.IsUnReferenced(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentFunctionality_IsUnReferenced(ServerFunctionality());
{$ENDIF}
end;

function TComponentFunctionalityRemoted.IsEmpty: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.IsEmpty(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentFunctionality_IsEmpty(ServerFunctionality());
{$ENDIF}
end;

function TComponentFunctionalityRemoted.DATASize: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.DATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentFunctionality_DATASize(ServerFunctionality());
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.GetComponentsList(out ComponentsList: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.GetComponentsList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   ComponentsList);
{$ELSE}
TComponentFunctionality_GetComponentsList(ServerFunctionality(),   ComponentsList);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.QueryComponentsWithTag(const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.QueryComponentsWithTag(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTNeededType,pTag,ComponentsList);
{$ELSE}
Result:=TComponentFunctionality_QueryComponentsWithTag(ServerFunctionality(),   idTNeededType,pTag,ComponentsList);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.QueryComponent(const idTNeededType: integer; out idTComponent,idComponent: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.QueryComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTNeededType,idTComponent,idComponent);
{$ELSE}
Result:=TComponentFunctionality_QueryComponent(ServerFunctionality(),   idTNeededType,idTComponent,idComponent);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.QueryComponentWithTag(const pTag: integer; out idTComponent,idComponent: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.QueryComponentWithTag(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pTag,idTComponent,idComponent);
{$ELSE}
Result:=TComponentFunctionality_QueryComponentWithTag(ServerFunctionality(),   pTag,idTComponent,idComponent);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.QueryComponentWithTag1(const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.QueryComponentWithTag1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTNeededType,pTag,idTComponent,idComponent);
{$ELSE}
Result:=TComponentFunctionality_QueryComponentWithTag1(ServerFunctionality(),   idTNeededType,pTag,idTComponent,idComponent);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.ComponentsCount: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.ComponentsCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentFunctionality_ComponentsCount(ServerFunctionality());
{$ENDIF}
end;

function TComponentFunctionalityRemoted.GetRootOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.GetRootOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TComponentFunctionality_GetRootOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.RealityRating_AddUserRate(const Rate: integer; const RateReason: WideString);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.RealityRating_AddUserRate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Rate,RateReason);
{$ELSE}
TComponentFunctionality_RealityRating_AddUserRate(ServerFunctionality(),   Rate,RateReason);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.RealityRating_GetAverageRate(out AvrRate: double; out RateCount: integer);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.RealityRating_GetAverageRate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   AvrRate,RateCount);
{$ELSE}
TComponentFunctionality_RealityRating_GetAverageRate(ServerFunctionality(),   AvrRate,RateCount);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.RealityRating_GetData(out RatingData: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.RealityRating_GetData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   RatingData);
{$ELSE}
TComponentFunctionality_RealityRating_GetData(ServerFunctionality(),   RatingData);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.ActualityInterval_GetTimestamps(out BeginTimestamp,EndTimestamp: double);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.ActualityInterval_GetTimestamps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   BeginTimestamp,EndTimestamp);
{$ELSE}
TComponentFunctionality_ActualityInterval_GetTimestamps(ServerFunctionality(),   BeginTimestamp,EndTimestamp);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.ActualityInterval_SetEndTimestamp(const Value: double);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.ActualityInterval_SetEndTimestamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
{$ELSE}
TComponentFunctionality_ActualityInterval_SetEndTimestamp(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.ActualityInterval_IsActualForTime(const pTime: double): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.ActualityInterval_IsActualForTime(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pTime);
{$ELSE}
Result:=TComponentFunctionality_ActualityInterval_IsActualForTime(ServerFunctionality(),   pTime);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.ActualityInterval_IsActualForTimeInterval(const IntervalBeginTimestamp,IntervalEndTimestamp: double): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.ActualityInterval_IsActualForTimeInterval(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   IntervalBeginTimestamp,IntervalEndTimestamp);
{$ELSE}
Result:=TComponentFunctionality_ActualityInterval_IsActualForTimeInterval(ServerFunctionality(),   IntervalBeginTimestamp,IntervalEndTimestamp);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.ActualityInterval_Actualize;
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.ActualityInterval_Actualize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
TComponentFunctionality_ActualityInterval_Actualize(ServerFunctionality());
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.ActualityInterval_Deactualize;
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.ActualityInterval_Deactualize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
TComponentFunctionality_ActualityInterval_Deactualize(ServerFunctionality());
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.CreateNewPanelProps;
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.CreateNewPanelProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
TComponentFunctionality_CreateNewPanelProps(ServerFunctionality());
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.DestroyPanelProps;
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.DestroyPanelProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
TComponentFunctionality_DestroyPanelProps(ServerFunctionality());
{$ENDIF}
end;

function TComponentFunctionalityRemoted.IsPanelPropsExist: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.IsPanelPropsExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentFunctionality_IsPanelPropsExist(ServerFunctionality());
{$ENDIF}
end;

function TComponentFunctionalityRemoted.GetPanelPropsLeftTop(out PanelProps_Left,PanelProps_Top: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.GetPanelPropsLeftTop(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   PanelProps_Left,PanelProps_Top);
{$ELSE}
Result:=TComponentFunctionality_GetPanelPropsLeftTop(ServerFunctionality(),   PanelProps_Left,PanelProps_Top);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.GetPanelPropsWidthHeight(out PanelProps_Width,PanelProps_Height: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.GetPanelPropsWidthHeight(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   PanelProps_Width,PanelProps_Height);
{$ELSE}
Result:=TComponentFunctionality_GetPanelPropsWidthHeight(ServerFunctionality(),   PanelProps_Width,PanelProps_Height);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.SetPanelPropsLeftTop(const PanelProps_OfsX,PanelProps_OfsY: integer);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.SetPanelPropsLeftTop(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   PanelProps_OfsX,PanelProps_OfsY);
{$ELSE}
TComponentFunctionality_SetPanelPropsLeftTop(ServerFunctionality(),   PanelProps_OfsX,PanelProps_OfsY);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.SetPanelPropsWidthHeight(const PanelProps_Width,PanelProps_Height: integer);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.SetPanelPropsWidthHeight(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   PanelProps_Width,PanelProps_Height);
{$ELSE}
TComponentFunctionality_SetPanelPropsWidthHeight(ServerFunctionality(),   PanelProps_Width,PanelProps_Height);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.IsCustomPanelPropsExist: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.IsCustomPanelPropsExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentFunctionality_IsCustomPanelPropsExist(ServerFunctionality());
{$ENDIF}
end;

function TComponentFunctionalityRemoted.idCustomPanelProps: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.idCustomPanelProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentFunctionality_idCustomPanelProps(ServerFunctionality());
{$ENDIF}
end;

function TComponentFunctionalityRemoted.CustomPanelProps1: TByteArray;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.CustomPanelProps1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentFunctionality_CustomPanelProps1(ServerFunctionality());
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.SetCustomPanelProps(Stream: TByteArray; const flNewValue: boolean{если = true, то заменяет панелью с новым ID});
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.SetCustomPanelProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Stream,flNewValue);
{$ELSE}
TComponentFunctionality_SetCustomPanelProps(ServerFunctionality(),   Stream,flNewValue);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.SetCustomPanelPropsByID(const idPanelProps: integer);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.SetCustomPanelPropsByID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idPanelProps);
{$ELSE}
TComponentFunctionality_SetCustomPanelPropsByID(ServerFunctionality(),   idPanelProps);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.ReleaseCustomPanelProps;
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.ReleaseCustomPanelProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
TComponentFunctionality_ReleaseCustomPanelProps(ServerFunctionality());
{$ENDIF}
end;

function TComponentFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
{$ELSE}
TComponentFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TComponentFunctionalityRemoted.getTag: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.getTag(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TComponentFunctionality_getTag(ServerFunctionality());
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.setTag(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.setTag(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
{$ELSE}
TComponentFunctionality_setTag(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.GetDataDocument(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   DataModel,DataType,flWithComponents,Document);
{$ELSE}
Result:=TComponentFunctionality_GetDataDocument(ServerFunctionality(),   DataModel,DataType,flWithComponents,Document);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.GetHintInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   InfoType,InfoFormat,HintInfo);
{$ELSE}
Result:=TComponentFunctionality_GetHintInfo(ServerFunctionality(),   InfoType,InfoFormat,HintInfo);
{$ENDIF}
end;

function TComponentFunctionalityRemoted.GetSecurityComponent(out idSecurityComponent: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.GetSecurityComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idSecurityComponent);
{$ELSE}
Result:=TComponentFunctionality_GetSecurityComponent(ServerFunctionality(),   idSecurityComponent);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.ChangeSecurity(const pidSecurityFile: integer);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.ChangeSecurity(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pidSecurityFile);
{$ELSE}
TComponentFunctionality_ChangeSecurity(ServerFunctionality(),   pidSecurityFile);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.NotifyOnComponentUpdate;
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.NotifyOnComponentUpdate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
TComponentFunctionality_NotifyOnComponentUpdate(ServerFunctionality());
{$ENDIF}
end;

function TComponentFunctionalityRemoted.GetComponentDATA(const Version: integer): TByteArray;
begin
{$IFNDEF EmbeddedServer}
Result:=TComponentSOAPFunctionality.GetComponentDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Version);
{$ELSE}
Result:=TComponentFunctionality_GetComponentDATA(ServerFunctionality(),   Version);
{$ENDIF}
end;

procedure TComponentFunctionalityRemoted.SetComponentDATA(const Data: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TComponentSOAPFunctionality.SetComponentDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Data);
{$ELSE}
TComponentFunctionality_SetComponentDATA(ServerFunctionality(),   Data);
{$ENDIF}
end;


{TTProxyObjectFunctionality}
Constructor TTProxyObjectFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTProxyObjectSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTProxyObjectFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTProxyObjectSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTProxyObjectFunctionalityRemoted.TTProxyObjectSOAPFunctionality: ITTProxyObjectSOAPFunctionality;
begin
if (FTTProxyObjectSOAPFunctionality = nil)
  then FTTProxyObjectSOAPFunctionality:=GetITTProxyObjectSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTProxyObjectSOAPFunctionality;
end;
{$ELSE}
function TTProxyObjectFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TProxyObjectFunctionality}
Constructor TProxyObjectFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTProxyObjectSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TProxyObjectFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTProxyObjectSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TProxyObjectFunctionalityRemoted.TProxyObjectSOAPFunctionality: ITProxyObjectSOAPFunctionality;
begin
if (FTProxyObjectSOAPFunctionality = nil)
  then FTProxyObjectSOAPFunctionality:=GetITProxyObjectSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTProxyObjectSOAPFunctionality;
end;
{$ELSE}
function TProxyObjectFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TProxyObjectFunctionalityRemoted.GetReference(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TProxyObjectSOAPFunctionality.GetReference(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TProxyObjectFunctionality_GetReference(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

procedure TProxyObjectFunctionalityRemoted.SetReference(const idTOwner,idOwner: integer);
begin
{$IFNDEF EmbeddedServer}
TProxyObjectSOAPFunctionality.SetReference(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
TProxyObjectFunctionality_SetReference(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TProxyObjectFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TProxyObjectSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TProxyObjectFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

function TProxyObjectFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TProxyObjectSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TProxyObjectFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;


{TTBaseVisualizationFunctionality}
Constructor TTBaseVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTBaseVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTBaseVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTBaseVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTBaseVisualizationFunctionalityRemoted.TTBaseVisualizationSOAPFunctionality: ITTBaseVisualizationSOAPFunctionality;
begin
if (FTTBaseVisualizationSOAPFunctionality = nil)
  then FTTBaseVisualizationSOAPFunctionality:=GetITTBaseVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTBaseVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTBaseVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TTBaseVisualizationFunctionalityRemoted.GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTBaseVisualizationSOAPFunctionality.GetComponentOwnerDatas(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   IDs,DataFlags,Data);
{$ELSE}
TTBaseVisualizationFunctionality_GetComponentOwnerDatas(ServerFunctionality(),   IDs,DataFlags,Data);
{$ENDIF}
end;

function TTBaseVisualizationFunctionalityRemoted.CanCreateAsDetail: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TTBaseVisualizationSOAPFunctionality.CanCreateAsDetail(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType);
{$ELSE}
Result:=TTBaseVisualizationFunctionality_CanCreateAsDetail(ServerFunctionality());
{$ENDIF}
end;


{TBaseVisualizationFunctionality}
Constructor TBaseVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTBaseVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TBaseVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTBaseVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TBaseVisualizationFunctionalityRemoted.TBaseVisualizationSOAPFunctionality: ITBaseVisualizationSOAPFunctionality;
begin
if (FTBaseVisualizationSOAPFunctionality = nil)
  then FTBaseVisualizationSOAPFunctionality:=GetITBaseVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTBaseVisualizationSOAPFunctionality;
end;
{$ELSE}
function TBaseVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TBaseVisualizationFunctionalityRemoted.Ptr: TPtr;
begin
{$IFNDEF EmbeddedServer}
Result:=TBaseVisualizationSOAPFunctionality.Ptr(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TBaseVisualizationFunctionality_Ptr(ServerFunctionality());
{$ENDIF}
end;

function TBaseVisualizationFunctionalityRemoted.IsUnReferenced: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TBaseVisualizationSOAPFunctionality.IsUnReferenced(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TBaseVisualizationFunctionality_IsUnReferenced(ServerFunctionality());
{$ENDIF}
end;

procedure TBaseVisualizationFunctionalityRemoted.Scaling(const pScale: Double);
begin
{$IFNDEF EmbeddedServer}
TBaseVisualizationSOAPFunctionality.Scaling(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pScale);
{$ELSE}
TBaseVisualizationFunctionality_Scaling(ServerFunctionality(),   pScale);
{$ENDIF}
end;

procedure TBaseVisualizationFunctionalityRemoted.SetPosition(const X,Y,Z: Double);
begin
{$IFNDEF EmbeddedServer}
TBaseVisualizationSOAPFunctionality.SetPosition(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   X,Y,Z);
{$ELSE}
TBaseVisualizationFunctionality_SetPosition(ServerFunctionality(),   X,Y,Z);
{$ENDIF}
end;

procedure TBaseVisualizationFunctionalityRemoted.Move(const dX,dY,dZ: Double);
begin
{$IFNDEF EmbeddedServer}
TBaseVisualizationSOAPFunctionality.Move(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   dX,dY,dZ);
{$ELSE}
TBaseVisualizationFunctionality_Move(ServerFunctionality(),   dX,dY,dZ);
{$ENDIF}
end;

procedure TBaseVisualizationFunctionalityRemoted.ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
begin
{$IFNDEF EmbeddedServer}
TBaseVisualizationSOAPFunctionality.ChangeScale(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,pScale);
{$ELSE}
TBaseVisualizationFunctionality_ChangeScale(ServerFunctionality(),   Xbind,Ybind,pScale);
{$ENDIF}
end;

procedure TBaseVisualizationFunctionalityRemoted.Rotate(const Xbind,Ybind: Double; const Angle: Double);
begin
{$IFNDEF EmbeddedServer}
TBaseVisualizationSOAPFunctionality.Rotate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,Angle);
{$ELSE}
TBaseVisualizationFunctionality_Rotate(ServerFunctionality(),   Xbind,Ybind,Angle);
{$ENDIF}
end;

procedure TBaseVisualizationFunctionalityRemoted.Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
{$IFNDEF EmbeddedServer}
TBaseVisualizationSOAPFunctionality.Transform(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,pScale,Angle,dX,dY);
{$ELSE}
TBaseVisualizationFunctionality_Transform(ServerFunctionality(),   Xbind,Ybind,pScale,Angle,dX,dY);
{$ENDIF}
end;

procedure TBaseVisualizationFunctionalityRemoted.SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
begin
{$IFNDEF EmbeddedServer}
TBaseVisualizationSOAPFunctionality.SetPropertiesLocal(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
{$ELSE}
TBaseVisualizationFunctionality_SetPropertiesLocal(ServerFunctionality(),   pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
{$ENDIF}
end;

procedure TBaseVisualizationFunctionalityRemoted.GetOwnerByVisualization(out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr);
begin
{$IFNDEF EmbeddedServer}
TBaseVisualizationSOAPFunctionality.GetOwnerByVisualization(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTOwner,idOwner,ptrOwnerVisualization);
{$ELSE}
TBaseVisualizationFunctionality_GetOwnerByVisualization(ServerFunctionality(),   idTOwner,idOwner,ptrOwnerVisualization);
{$ENDIF}
end;

function TBaseVisualizationFunctionalityRemoted.GetCoVisualizationSpaces(out List: TByteArray): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TBaseVisualizationSOAPFunctionality.GetCoVisualizationSpaces(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   List);
{$ELSE}
Result:=TBaseVisualizationFunctionality_GetCoVisualizationSpaces(ServerFunctionality(),   List);
{$ENDIF}
end;

function TBaseVisualizationFunctionalityRemoted.getStrobing: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TBaseVisualizationSOAPFunctionality.getStrobing(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TBaseVisualizationFunctionality_getStrobing(ServerFunctionality());
{$ENDIF}
end;

procedure TBaseVisualizationFunctionalityRemoted.setStrobing(Value: boolean);
begin
{$IFNDEF EmbeddedServer}
TBaseVisualizationSOAPFunctionality.setStrobing(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
{$ELSE}
TBaseVisualizationFunctionality_setStrobing(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TBaseVisualizationFunctionalityRemoted.getStrobingInterval: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TBaseVisualizationSOAPFunctionality.getStrobingInterval(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TBaseVisualizationFunctionality_getStrobingInterval(ServerFunctionality());
{$ENDIF}
end;

procedure TBaseVisualizationFunctionalityRemoted.setStrobingInterval(Value: integer);
begin
{$IFNDEF EmbeddedServer}
TBaseVisualizationSOAPFunctionality.setStrobingInterval(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
{$ELSE}
TBaseVisualizationFunctionality_setStrobingInterval(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTBase2DVisualizationFunctionality}
Constructor TTBase2DVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTBase2DVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTBase2DVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTBase2DVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTBase2DVisualizationFunctionalityRemoted.TTBase2DVisualizationSOAPFunctionality: ITTBase2DVisualizationSOAPFunctionality;
begin
if (FTTBase2DVisualizationSOAPFunctionality = nil)
  then FTTBase2DVisualizationSOAPFunctionality:=GetITTBase2DVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTBase2DVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTBase2DVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TTBase2DVisualizationFunctionalityRemoted.CreateInstanceEx(const ptrOwner: TPtr): integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TTBase2DVisualizationSOAPFunctionality.CreateInstanceEx(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   ptrOwner);
{$ELSE}
Result:=TTBase2DVisualizationFunctionality_CreateInstanceEx(ServerFunctionality(),   ptrOwner);
{$ENDIF}
end;

procedure TTBase2DVisualizationFunctionalityRemoted.GetDisproportionObjects(const Factor: double; out ObjectsList: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TTBase2DVisualizationSOAPFunctionality.GetDisproportionObjects(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   Factor,ObjectsList);
{$ELSE}
TTBase2DVisualizationFunctionality_GetDisproportionObjects(ServerFunctionality(),   Factor,ObjectsList);
{$ENDIF}
end;


{TBase2DVisualizationFunctionality}
Constructor TBase2DVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTBase2DVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TBase2DVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTBase2DVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TBase2DVisualizationFunctionalityRemoted.TBase2DVisualizationSOAPFunctionality: ITBase2DVisualizationSOAPFunctionality;
begin
if (FTBase2DVisualizationSOAPFunctionality = nil)
  then FTBase2DVisualizationSOAPFunctionality:=GetITBase2DVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTBase2DVisualizationSOAPFunctionality;
end;
{$ELSE}
function TBase2DVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

procedure TBase2DVisualizationFunctionalityRemoted.GetLayInfo(out Lay,SubLay: integer);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.GetLayInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Lay,SubLay);
{$ELSE}
TBase2DVisualizationFunctionality_GetLayInfo(ServerFunctionality(),   Lay,SubLay);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.GetProps(out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.GetProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   oflagLoop,oColor,oWidth,oflagFill,oColorFill);
{$ELSE}
TBase2DVisualizationFunctionality_GetProps(ServerFunctionality(),   oflagLoop,oColor,oWidth,oflagFill,oColorFill);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.SetProps(const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.SetProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pflagLoop,pColor,pWidth,pflagFill,pColorFill);
{$ELSE}
TBase2DVisualizationFunctionality_SetProps(ServerFunctionality(),   pflagLoop,pColor,pWidth,pflagFill,pColorFill);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.CreateNode(const CreateNodeIndex: integer; const X,Y: Double);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.CreateNode(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   CreateNodeIndex,X,Y);
{$ELSE}
TBase2DVisualizationFunctionality_CreateNode(ServerFunctionality(),   CreateNodeIndex,X,Y);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.DestroyNode(const DestroyNodeIndex: integer);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.DestroyNode(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   DestroyNodeIndex);
{$ELSE}
TBase2DVisualizationFunctionality_DestroyNode(ServerFunctionality(),   DestroyNodeIndex);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.SetNode(const SetNodeIndex: integer; const newX,newY: Double);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.SetNode(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   SetNodeIndex,newX,newY);
{$ELSE}
TBase2DVisualizationFunctionality_SetNode(ServerFunctionality(),   SetNodeIndex,newX,newY);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.GetNodes(out Nodes: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.GetNodes(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Nodes);
{$ELSE}
TBase2DVisualizationFunctionality_GetNodes(ServerFunctionality(),   Nodes);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.SetNodes(const Nodes: TByteArray; const pWidth: double);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.SetNodes(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Nodes,pWidth);
{$ELSE}
TBase2DVisualizationFunctionality_SetNodes(ServerFunctionality(),   Nodes,pWidth);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.CheckPlace(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.CheckPlace(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,pScale,Angle,dX,dY);
{$ELSE}
TBase2DVisualizationFunctionality_CheckPlace(ServerFunctionality(),   Xbind,Ybind,pScale,Angle,dX,dY);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.Move(const dX,dY,dZ: Double);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.Move(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   dX,dY,dZ);
{$ELSE}
TBase2DVisualizationFunctionality_Move(ServerFunctionality(),   dX,dY,dZ);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.SetPosition(const X,Y,Z: Double);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.SetPosition(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   X,Y,Z);
{$ELSE}
TBase2DVisualizationFunctionality_SetPosition(ServerFunctionality(),   X,Y,Z);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.SetPositionAndRotate(const X,Y: Double; const Angle: Double);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.SetPositionAndRotate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   X,Y,Angle);
{$ELSE}
TBase2DVisualizationFunctionality_SetPositionAndRotate(ServerFunctionality(),   X,Y,Angle);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.Transform(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,pScale,Angle,dX,dY);
{$ELSE}
TBase2DVisualizationFunctionality_Transform(ServerFunctionality(),   Xbind,Ybind,pScale,Angle,dX,dY);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.ChangeScale(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,pScale);
{$ELSE}
TBase2DVisualizationFunctionality_ChangeScale(ServerFunctionality(),   Xbind,Ybind,pScale);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.Rotate(const Xbind,Ybind: Double; const Angle: Double);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.Rotate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,Angle);
{$ELSE}
TBase2DVisualizationFunctionality_Rotate(ServerFunctionality(),   Xbind,Ybind,Angle);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.ChangeLay(const NewLayID: integer);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.ChangeLay(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   NewLayID);
{$ELSE}
TBase2DVisualizationFunctionality_ChangeLay(ServerFunctionality(),   NewLayID);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.ChangeOwner(const ptrNewOwner: TPtr);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.ChangeOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   ptrNewOwner);
{$ELSE}
TBase2DVisualizationFunctionality_ChangeOwner(ServerFunctionality(),   ptrNewOwner);
{$ENDIF}
end;

function TBase2DVisualizationFunctionalityRemoted.Square: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TBase2DVisualizationSOAPFunctionality.Square(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TBase2DVisualizationFunctionality_Square(ServerFunctionality());
{$ENDIF}
end;

function TBase2DVisualizationFunctionalityRemoted.Square1(const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: Double; const NewWidth: Double; const pScale: Double): Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TBase2DVisualizationSOAPFunctionality.Square1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   ExceptPointPtr,ExceptPointValueX,ExceptPointValueY,NewWidth,pScale);
{$ELSE}
Result:=TBase2DVisualizationFunctionality_Square1(ServerFunctionality(),   ExceptPointPtr,ExceptPointValueX,ExceptPointValueY,NewWidth,pScale);
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.GetInsideObjectsList(out List: TByteArray);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.GetInsideObjectsList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   List);
{$ELSE}
TBase2DVisualizationFunctionality_GetInsideObjectsList(ServerFunctionality(),   List);
{$ENDIF}
end;

function TBase2DVisualizationFunctionalityRemoted.getIdLay: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TBase2DVisualizationSOAPFunctionality.getIdLay(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TBase2DVisualizationFunctionality_getIdLay(ServerFunctionality());
{$ENDIF}
end;

function TBase2DVisualizationFunctionalityRemoted.getWidth: Double;
begin
{$IFNDEF EmbeddedServer}
Result:=TBase2DVisualizationSOAPFunctionality.getWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TBase2DVisualizationFunctionality_getWidth(ServerFunctionality());
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.setWidth(Value: Double);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.setWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
{$ELSE}
TBase2DVisualizationFunctionality_setWidth(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TBase2DVisualizationFunctionalityRemoted.getflUserSecurity: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TBase2DVisualizationSOAPFunctionality.getflUserSecurity(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TBase2DVisualizationFunctionality_getflUserSecurity(ServerFunctionality());
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.setflUserSecurity(Value: boolean);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.setflUserSecurity(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
{$ELSE}
TBase2DVisualizationFunctionality_setflUserSecurity(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TBase2DVisualizationFunctionalityRemoted.getflDetailsNoIndex: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TBase2DVisualizationSOAPFunctionality.getflDetailsNoIndex(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TBase2DVisualizationFunctionality_getflDetailsNoIndex(ServerFunctionality());
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.setflDetailsNoIndex(Value: boolean);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.setflDetailsNoIndex(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
{$ELSE}
TBase2DVisualizationFunctionality_setflDetailsNoIndex(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TBase2DVisualizationFunctionalityRemoted.getflNotifyOwnerOnChange: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TBase2DVisualizationSOAPFunctionality.getflNotifyOwnerOnChange(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TBase2DVisualizationFunctionality_getflNotifyOwnerOnChange(ServerFunctionality());
{$ENDIF}
end;

procedure TBase2DVisualizationFunctionalityRemoted.setflNotifyOwnerOnChange(Value: boolean);
begin
{$IFNDEF EmbeddedServer}
TBase2DVisualizationSOAPFunctionality.setflNotifyOwnerOnChange(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
{$ELSE}
TBase2DVisualizationFunctionality_setflNotifyOwnerOnChange(ServerFunctionality(),   Value);
{$ENDIF}
end;


{TTLay2DVisualizationFunctionality}
Constructor TTLay2DVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
{$IFNDEF EmbeddedServer}
FTTLay2DVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TTLay2DVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTTLay2DVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TTLay2DVisualizationFunctionalityRemoted.TTLay2DVisualizationSOAPFunctionality: ITTLay2DVisualizationSOAPFunctionality;
begin
if (FTTLay2DVisualizationSOAPFunctionality = nil)
  then FTTLay2DVisualizationSOAPFunctionality:=GetITTLay2DVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTLay2DVisualizationSOAPFunctionality;
end;
{$ELSE}
function TTLay2DVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TTypeFunctionality_Create(TypeFunctionality.idType,TypeFunctionality.UserName,TypeFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}


{TLay2DVisualizationFunctionality}
Constructor TLay2DVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
{$IFNDEF EmbeddedServer}
FTLay2DVisualizationSOAPFunctionality:=nil;
{$ELSE}
FServerFunctionality:=nil;
{$ENDIF}
end;

Destructor TLay2DVisualizationFunctionalityRemoted.Destroy;
begin
{$IFNDEF EmbeddedServer}
FTLay2DVisualizationSOAPFunctionality:=nil;
{$ELSE}
if (FServerFunctionality <> nil) then Space_TFunctionality_Release({ref} FServerFunctionality);
{$ENDIF}
Inherited;
end;

{$IFNDEF EmbeddedServer}
function TLay2DVisualizationFunctionalityRemoted.TLay2DVisualizationSOAPFunctionality: ITLay2DVisualizationSOAPFunctionality;
begin
if (FTLay2DVisualizationSOAPFunctionality = nil)
  then FTLay2DVisualizationSOAPFunctionality:=GetITLay2DVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTLay2DVisualizationSOAPFunctionality;
end;
{$ELSE}
function TLay2DVisualizationFunctionalityRemoted.ServerFunctionality(): TFunctionality;
begin
if (FServerFunctionality = nil)
  then FServerFunctionality:=Space_TComponentFunctionality_Create(ComponentFunctionality.idTObj,ComponentFunctionality.idObj,ComponentFunctionality.UserName,ComponentFunctionality.UserPassword);
Result:=FServerFunctionality;
end;
{$ENDIF}

function TLay2DVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TLay2DVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTOwner,idOwner);
{$ELSE}
Result:=TLay2DVisualizationFunctionality_GetOwner(ServerFunctionality(),   idTOwner,idOwner);
{$ENDIF}
end;

function TLay2DVisualizationFunctionalityRemoted.getName: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TLay2DVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TLay2DVisualizationFunctionality_getName(ServerFunctionality());
{$ENDIF}
end;

procedure TLay2DVisualizationFunctionalityRemoted.setName(Value: string);
begin
{$IFNDEF EmbeddedServer}
TLay2DVisualizationSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
{$ELSE}
TLay2DVisualizationFunctionality_setName(ServerFunctionality(),   Value);
{$ENDIF}
end;

function TLay2DVisualizationFunctionalityRemoted.getHint: string;
begin
{$IFNDEF EmbeddedServer}
Result:=TLay2DVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TLay2DVisualizationFunctionality_getHint(ServerFunctionality());
{$ENDIF}
end;

function TLay2DVisualizationFunctionalityRemoted.isEmpty: boolean;
begin
{$IFNDEF EmbeddedServer}
Result:=TLay2DVisualizationSOAPFunctionality.isEmpty(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TLay2DVisualizationFunctionality_isEmpty(ServerFunctionality());
{$ENDIF}
end;

function TLay2DVisualizationFunctionalityRemoted.getNumber: integer;
begin
{$IFNDEF EmbeddedServer}
Result:=TLay2DVisualizationSOAPFunctionality.getNumber(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
{$ELSE}
Result:=TLay2DVisualizationFunctionality_getNumber(ServerFunctionality());
{$ENDIF}
end;

procedure TLay2DVisualizationFunctionalityRemoted.GetParams(out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
begin
{$IFNDEF EmbeddedServer}
TLay2DVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   oName,oVisibleMinScale,oVisibleMaxScale);
{$ELSE}
TLay2DVisualizationFunctionality_GetParams(ServerFunctionality(),   oName,oVisibleMinScale,oVisibleMaxScale);
{$ENDIF}
end;

procedure TLay2DVisualizationFunctionalityRemoted.GetParams1(out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
begin
{$IFNDEF EmbeddedServer}
TLay2DVisualizationSOAPFunctionality.GetParams1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   oName,oNumber,oVisibleMinScale,oVisibleMaxScale);
{$ELSE}
TLay2DVisualizationFunctionality_GetParams1(ServerFunctionality(),   oName,oNumber,oVisibleMinScale,oVisibleMaxScale);
{$ENDIF}
end;

procedure TLay2DVisualizationFunctionalityRemoted.SetParams(const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double);
begin
{$IFNDEF EmbeddedServer}
TLay2DVisualizationSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pName,pVisibleMinScale,pVisibleMaxScale);
{$ELSE}
TLay2DVisualizationFunctionality_SetParams(ServerFunctionality(),   pName,pVisibleMinScale,pVisibleMaxScale);
{$ENDIF}
end;


