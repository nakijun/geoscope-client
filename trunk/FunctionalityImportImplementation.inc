//. import functionality routines implementations

{TTypeFunctionality}
Constructor TTypeFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTypeSOAPFunctionality:=nil;
end;

Destructor TTypeFunctionalityRemoted.Destroy;
begin
FTTypeSOAPFunctionality:=nil;
Inherited;
end;

function TTypeFunctionalityRemoted.TTypeSOAPFunctionality: ITTypeSOAPFunctionality;
begin
if FTTypeSOAPFunctionality = nil
  then FTTypeSOAPFunctionality:=GetITTypeSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTypeSOAPFunctionality;
end;

function TTypeFunctionalityRemoted.CreateInstance: integer;
begin
Result:=TTypeSOAPFunctionality.CreateInstance(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType);
end;

function TTypeFunctionalityRemoted.CreateInstanceUsingObject(const idTUseObj,idUseObj: integer): integer;
begin
Result:=TTypeSOAPFunctionality.CreateInstanceUsingObject(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   idTUseObj,idUseObj);
end;

procedure TTypeFunctionalityRemoted.DestroyInstance(const idObj: integer);
begin
TTypeSOAPFunctionality.DestroyInstance(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   idObj);
end;

procedure TTypeFunctionalityRemoted.GetInstanceList(out List: TByteArray);
begin
TTypeSOAPFunctionality.GetInstanceList(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   List);
end;

procedure TTypeFunctionalityRemoted.GetInstanceOwnerNames(const IDs: TByteArray; out Data: TByteArray);
begin
TTypeSOAPFunctionality.GetInstanceOwnerNames(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   IDs,Data);
end;

procedure TTypeFunctionalityRemoted.GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
begin
TTypeSOAPFunctionality.GetComponentOwnerDatas(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   IDs,DataFlags,Data);
end;

function TTypeFunctionalityRemoted.getName: string;
begin
Result:=TTypeSOAPFunctionality.getName(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType);
end;


{TComponentFunctionality}
Constructor TComponentFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTComponentSOAPFunctionality:=nil;
end;

Destructor TComponentFunctionalityRemoted.Destroy;
begin
FTComponentSOAPFunctionality:=nil;
Inherited;
end;

function TComponentFunctionalityRemoted.TComponentSOAPFunctionality: ITComponentSOAPFunctionality;
begin
if FTComponentSOAPFunctionality = nil
  then FTComponentSOAPFunctionality:=GetITComponentSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTComponentSOAPFunctionality;
end;

procedure TComponentFunctionalityRemoted.Check;
begin
TComponentSOAPFunctionality.Check(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TComponentFunctionalityRemoted.CheckUserOperation(const idOperation: integer);
begin
TComponentSOAPFunctionality.CheckUserOperation(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idOperation);
end;

function TComponentFunctionalityRemoted.CreationTimestamp: double;
begin
Result:=TComponentSOAPFunctionality.CreationTimestamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TComponentFunctionalityRemoted.CloneAndInsertComponent(const idTComponent,idComponent: integer; out idClone: integer; out id: integer);
begin
TComponentSOAPFunctionality.CloneAndInsertComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTComponent,idComponent,idClone,id);
end;

procedure TComponentFunctionalityRemoted.ImportAndInsertComponents(const DATAStream: TByteArray; out ComponentsList: TByteArray);
begin
TComponentSOAPFunctionality.ImportAndInsertComponents(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   DATAStream,ComponentsList);
end;

procedure TComponentFunctionalityRemoted.DestroyComponent(const idTComponent,idComponent: integer);
begin
TComponentSOAPFunctionality.DestroyComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTComponent,idComponent);
end;

procedure TComponentFunctionalityRemoted.RemoveComponent(const idTComponent,idComponent: integer);
begin
TComponentSOAPFunctionality.RemoveComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTComponent,idComponent);
end;

procedure TComponentFunctionalityRemoted.ToClone(out idClone: integer);
begin
TComponentSOAPFunctionality.ToClone(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idClone);
end;

procedure TComponentFunctionalityRemoted.ToCloneUsingObject(const idTUseObj,idUseObj: integer; out idClone: integer);
begin
TComponentSOAPFunctionality.ToCloneUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTUseObj,idUseObj,idClone);
end;

function TComponentFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TComponentSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TComponentFunctionalityRemoted.SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
begin
Result:=TComponentSOAPFunctionality.SetComponentsUsingObject(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTUseObj,idUseObj);
end;

procedure TComponentFunctionalityRemoted.DestroyComponents;
begin
TComponentSOAPFunctionality.DestroyComponents(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TComponentFunctionalityRemoted.RemoveSelfAsComponent;
begin
TComponentSOAPFunctionality.RemoveSelfAsComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TComponentFunctionalityRemoted.IsUnReferenced: boolean;
begin
Result:=TComponentSOAPFunctionality.IsUnReferenced(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TComponentFunctionalityRemoted.IsEmpty: boolean;
begin
Result:=TComponentSOAPFunctionality.IsEmpty(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TComponentFunctionalityRemoted.DATASize: integer;
begin
Result:=TComponentSOAPFunctionality.DATASize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TComponentFunctionalityRemoted.GetComponentsList(out ComponentsList: TByteArray);
begin
TComponentSOAPFunctionality.GetComponentsList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   ComponentsList);
end;

function TComponentFunctionalityRemoted.QueryComponentsWithTag(const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean;
begin
Result:=TComponentSOAPFunctionality.QueryComponentsWithTag(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTNeededType,pTag,ComponentsList);
end;

function TComponentFunctionalityRemoted.QueryComponent(const idTNeededType: integer; out idTComponent,idComponent: integer): boolean;
begin
Result:=TComponentSOAPFunctionality.QueryComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTNeededType,idTComponent,idComponent);
end;

function TComponentFunctionalityRemoted.QueryComponentWithTag(const pTag: integer; out idTComponent,idComponent: integer): boolean;
begin
Result:=TComponentSOAPFunctionality.QueryComponentWithTag(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pTag,idTComponent,idComponent);
end;

function TComponentFunctionalityRemoted.QueryComponentWithTag1(const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean;
begin
Result:=TComponentSOAPFunctionality.QueryComponentWithTag1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTNeededType,pTag,idTComponent,idComponent);
end;

function TComponentFunctionalityRemoted.ComponentsCount: integer;
begin
Result:=TComponentSOAPFunctionality.ComponentsCount(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TComponentFunctionalityRemoted.GetRootOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TComponentSOAPFunctionality.GetRootOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

procedure TComponentFunctionalityRemoted.RealityRating_AddUserRate(const Rate: integer; const RateReason: WideString);
begin
TComponentSOAPFunctionality.RealityRating_AddUserRate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Rate,RateReason);
end;

procedure TComponentFunctionalityRemoted.RealityRating_GetAverageRate(out AvrRate: double; out RateCount: integer);
begin
TComponentSOAPFunctionality.RealityRating_GetAverageRate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   AvrRate,RateCount);
end;

procedure TComponentFunctionalityRemoted.RealityRating_GetData(out RatingData: TByteArray);
begin
TComponentSOAPFunctionality.RealityRating_GetData(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   RatingData);
end;

procedure TComponentFunctionalityRemoted.ActualityInterval_GetTimestamps(out BeginTimestamp,EndTimestamp: double);
begin
TComponentSOAPFunctionality.ActualityInterval_GetTimestamps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   BeginTimestamp,EndTimestamp);
end;

procedure TComponentFunctionalityRemoted.ActualityInterval_SetEndTimestamp(const Value: double);
begin
TComponentSOAPFunctionality.ActualityInterval_SetEndTimestamp(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
end;

function TComponentFunctionalityRemoted.ActualityInterval_IsActualForTime(const pTime: double): boolean;
begin
Result:=TComponentSOAPFunctionality.ActualityInterval_IsActualForTime(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pTime);
end;

function TComponentFunctionalityRemoted.ActualityInterval_IsActualForTimeInterval(const IntervalBeginTimestamp,IntervalEndTimestamp: double): boolean;
begin
Result:=TComponentSOAPFunctionality.ActualityInterval_IsActualForTimeInterval(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   IntervalBeginTimestamp,IntervalEndTimestamp);
end;

procedure TComponentFunctionalityRemoted.ActualityInterval_Actualize;
begin
TComponentSOAPFunctionality.ActualityInterval_Actualize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TComponentFunctionalityRemoted.ActualityInterval_Deactualize;
begin
TComponentSOAPFunctionality.ActualityInterval_Deactualize(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TComponentFunctionalityRemoted.CreateNewPanelProps;
begin
TComponentSOAPFunctionality.CreateNewPanelProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TComponentFunctionalityRemoted.DestroyPanelProps;
begin
TComponentSOAPFunctionality.DestroyPanelProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TComponentFunctionalityRemoted.IsPanelPropsExist: boolean;
begin
Result:=TComponentSOAPFunctionality.IsPanelPropsExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TComponentFunctionalityRemoted.GetPanelPropsLeftTop(out PanelProps_Left,PanelProps_Top: integer): boolean;
begin
Result:=TComponentSOAPFunctionality.GetPanelPropsLeftTop(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   PanelProps_Left,PanelProps_Top);
end;

function TComponentFunctionalityRemoted.GetPanelPropsWidthHeight(out PanelProps_Width,PanelProps_Height: integer): boolean;
begin
Result:=TComponentSOAPFunctionality.GetPanelPropsWidthHeight(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   PanelProps_Width,PanelProps_Height);
end;

procedure TComponentFunctionalityRemoted.SetPanelPropsLeftTop(const PanelProps_OfsX,PanelProps_OfsY: integer);
begin
TComponentSOAPFunctionality.SetPanelPropsLeftTop(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   PanelProps_OfsX,PanelProps_OfsY);
end;

procedure TComponentFunctionalityRemoted.SetPanelPropsWidthHeight(const PanelProps_Width,PanelProps_Height: integer);
begin
TComponentSOAPFunctionality.SetPanelPropsWidthHeight(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   PanelProps_Width,PanelProps_Height);
end;

function TComponentFunctionalityRemoted.IsCustomPanelPropsExist: boolean;
begin
Result:=TComponentSOAPFunctionality.IsCustomPanelPropsExist(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TComponentFunctionalityRemoted.idCustomPanelProps: integer;
begin
Result:=TComponentSOAPFunctionality.idCustomPanelProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TComponentFunctionalityRemoted.CustomPanelProps1: TByteArray;
begin
Result:=TComponentSOAPFunctionality.CustomPanelProps1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TComponentFunctionalityRemoted.SetCustomPanelProps(Stream: TByteArray; const flNewValue: boolean{если = true, то заменяет панелью с новым ID});
begin
TComponentSOAPFunctionality.SetCustomPanelProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Stream,flNewValue);
end;

procedure TComponentFunctionalityRemoted.SetCustomPanelPropsByID(const idPanelProps: integer);
begin
TComponentSOAPFunctionality.SetCustomPanelPropsByID(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idPanelProps);
end;

procedure TComponentFunctionalityRemoted.ReleaseCustomPanelProps;
begin
TComponentSOAPFunctionality.ReleaseCustomPanelProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TComponentFunctionalityRemoted.getName: string;
begin
Result:=TComponentSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TComponentFunctionalityRemoted.setName(Value: string);
begin
TComponentSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
end;

function TComponentFunctionalityRemoted.getHint: string;
begin
Result:=TComponentSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TComponentFunctionalityRemoted.getTag: integer;
begin
Result:=TComponentSOAPFunctionality.getTag(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TComponentFunctionalityRemoted.setTag(Value: integer);
begin
TComponentSOAPFunctionality.setTag(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
end;

function TComponentFunctionalityRemoted.GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean;
begin
Result:=TComponentSOAPFunctionality.GetDataDocument(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   DataModel,DataType,flWithComponents,Document);
end;

function TComponentFunctionalityRemoted.GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
begin
Result:=TComponentSOAPFunctionality.GetHintInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   InfoType,InfoFormat,HintInfo);
end;

function TComponentFunctionalityRemoted.GetSecurityComponent(out idSecurityComponent: integer): boolean;
begin
Result:=TComponentSOAPFunctionality.GetSecurityComponent(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idSecurityComponent);
end;

procedure TComponentFunctionalityRemoted.ChangeSecurity(const pidSecurityFile: integer);
begin
TComponentSOAPFunctionality.ChangeSecurity(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pidSecurityFile);
end;

procedure TComponentFunctionalityRemoted.NotifyOnComponentUpdate;
begin
TComponentSOAPFunctionality.NotifyOnComponentUpdate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TComponentFunctionalityRemoted.GetComponentDATA(const Version: integer): TByteArray;
begin
Result:=TComponentSOAPFunctionality.GetComponentDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Version);
end;

procedure TComponentFunctionalityRemoted.SetComponentDATA(const Data: TByteArray);
begin
TComponentSOAPFunctionality.SetComponentDATA(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Data);
end;


{TTProxyObjectFunctionality}
Constructor TTProxyObjectFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTProxyObjectSOAPFunctionality:=nil;
end;

Destructor TTProxyObjectFunctionalityRemoted.Destroy;
begin
FTTProxyObjectSOAPFunctionality:=nil;
Inherited;
end;

function TTProxyObjectFunctionalityRemoted.TTProxyObjectSOAPFunctionality: ITTProxyObjectSOAPFunctionality;
begin
if FTTProxyObjectSOAPFunctionality = nil
  then FTTProxyObjectSOAPFunctionality:=GetITTProxyObjectSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTProxyObjectSOAPFunctionality;
end;


{TProxyObjectFunctionality}
Constructor TProxyObjectFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTProxyObjectSOAPFunctionality:=nil;
end;

Destructor TProxyObjectFunctionalityRemoted.Destroy;
begin
FTProxyObjectSOAPFunctionality:=nil;
Inherited;
end;

function TProxyObjectFunctionalityRemoted.TProxyObjectSOAPFunctionality: ITProxyObjectSOAPFunctionality;
begin
if FTProxyObjectSOAPFunctionality = nil
  then FTProxyObjectSOAPFunctionality:=GetITProxyObjectSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTProxyObjectSOAPFunctionality;
end;

function TProxyObjectFunctionalityRemoted.GetReference(out idTOwner,idOwner: integer): boolean;
begin
Result:=TProxyObjectSOAPFunctionality.GetReference(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

procedure TProxyObjectFunctionalityRemoted.SetReference(const idTOwner,idOwner: integer);
begin
TProxyObjectSOAPFunctionality.SetReference(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TProxyObjectFunctionalityRemoted.getName: string;
begin
Result:=TProxyObjectSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TProxyObjectFunctionalityRemoted.getHint: string;
begin
Result:=TProxyObjectSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;


{TTBaseVisualizationFunctionality}
Constructor TTBaseVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTBaseVisualizationSOAPFunctionality:=nil;
end;

Destructor TTBaseVisualizationFunctionalityRemoted.Destroy;
begin
FTTBaseVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTBaseVisualizationFunctionalityRemoted.TTBaseVisualizationSOAPFunctionality: ITTBaseVisualizationSOAPFunctionality;
begin
if FTTBaseVisualizationSOAPFunctionality = nil
  then FTTBaseVisualizationSOAPFunctionality:=GetITTBaseVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTBaseVisualizationSOAPFunctionality;
end;

procedure TTBaseVisualizationFunctionalityRemoted.GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
begin
TTBaseVisualizationSOAPFunctionality.GetComponentOwnerDatas(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   IDs,DataFlags,Data);
end;

function TTBaseVisualizationFunctionalityRemoted.CanCreateAsDetail: boolean;
begin
Result:=TTBaseVisualizationSOAPFunctionality.CanCreateAsDetail(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType);
end;


{TBaseVisualizationFunctionality}
Constructor TBaseVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTBaseVisualizationSOAPFunctionality:=nil;
end;

Destructor TBaseVisualizationFunctionalityRemoted.Destroy;
begin
FTBaseVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TBaseVisualizationFunctionalityRemoted.TBaseVisualizationSOAPFunctionality: ITBaseVisualizationSOAPFunctionality;
begin
if FTBaseVisualizationSOAPFunctionality = nil
  then FTBaseVisualizationSOAPFunctionality:=GetITBaseVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTBaseVisualizationSOAPFunctionality;
end;

function TBaseVisualizationFunctionalityRemoted.Ptr: TPtr;
begin
Result:=TBaseVisualizationSOAPFunctionality.Ptr(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TBaseVisualizationFunctionalityRemoted.IsUnReferenced: boolean;
begin
Result:=TBaseVisualizationSOAPFunctionality.IsUnReferenced(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TBaseVisualizationFunctionalityRemoted.Scaling(const pScale: Double);
begin
TBaseVisualizationSOAPFunctionality.Scaling(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pScale);
end;

procedure TBaseVisualizationFunctionalityRemoted.SetPosition(const X,Y,Z: Double);
begin
TBaseVisualizationSOAPFunctionality.SetPosition(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   X,Y,Z);
end;

procedure TBaseVisualizationFunctionalityRemoted.Move(const dX,dY,dZ: Double);
begin
TBaseVisualizationSOAPFunctionality.Move(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   dX,dY,dZ);
end;

procedure TBaseVisualizationFunctionalityRemoted.ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
begin
TBaseVisualizationSOAPFunctionality.ChangeScale(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,pScale);
end;

procedure TBaseVisualizationFunctionalityRemoted.Rotate(const Xbind,Ybind: Double; const Angle: Double);
begin
TBaseVisualizationSOAPFunctionality.Rotate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,Angle);
end;

procedure TBaseVisualizationFunctionalityRemoted.Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
TBaseVisualizationSOAPFunctionality.Transform(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,pScale,Angle,dX,dY);
end;

procedure TBaseVisualizationFunctionalityRemoted.SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
begin
TBaseVisualizationSOAPFunctionality.SetPropertiesLocal(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
end;

procedure TBaseVisualizationFunctionalityRemoted.GetOwnerByVisualization(out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr);
begin
TBaseVisualizationSOAPFunctionality.GetOwnerByVisualization(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTOwner,idOwner,ptrOwnerVisualization);
end;

function TBaseVisualizationFunctionalityRemoted.GetCoVisualizationSpaces(out List: TByteArray): boolean;
begin
Result:=TBaseVisualizationSOAPFunctionality.GetCoVisualizationSpaces(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   List);
end;

function TBaseVisualizationFunctionalityRemoted.getStrobing: boolean;
begin
Result:=TBaseVisualizationSOAPFunctionality.getStrobing(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TBaseVisualizationFunctionalityRemoted.setStrobing(Value: boolean);
begin
TBaseVisualizationSOAPFunctionality.setStrobing(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
end;

function TBaseVisualizationFunctionalityRemoted.getStrobingInterval: integer;
begin
Result:=TBaseVisualizationSOAPFunctionality.getStrobingInterval(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TBaseVisualizationFunctionalityRemoted.setStrobingInterval(Value: integer);
begin
TBaseVisualizationSOAPFunctionality.setStrobingInterval(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
end;


{TTBase2DVisualizationFunctionality}
Constructor TTBase2DVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTBase2DVisualizationSOAPFunctionality:=nil;
end;

Destructor TTBase2DVisualizationFunctionalityRemoted.Destroy;
begin
FTTBase2DVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTBase2DVisualizationFunctionalityRemoted.TTBase2DVisualizationSOAPFunctionality: ITTBase2DVisualizationSOAPFunctionality;
begin
if FTTBase2DVisualizationSOAPFunctionality = nil
  then FTTBase2DVisualizationSOAPFunctionality:=GetITTBase2DVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTBase2DVisualizationSOAPFunctionality;
end;

function TTBase2DVisualizationFunctionalityRemoted.CreateInstanceEx(const ptrOwner: TPtr): integer;
begin
Result:=TTBase2DVisualizationSOAPFunctionality.CreateInstanceEx(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   ptrOwner);
end;

procedure TTBase2DVisualizationFunctionalityRemoted.GetDisproportionObjects(const Factor: double; out ObjectsList: TByteArray);
begin
TTBase2DVisualizationSOAPFunctionality.GetDisproportionObjects(TypeFunctionality.UserName,TypeFunctionality.UserPassword, TypeFunctionality.idType,   Factor,ObjectsList);
end;


{TBase2DVisualizationFunctionality}
Constructor TBase2DVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTBase2DVisualizationSOAPFunctionality:=nil;
end;

Destructor TBase2DVisualizationFunctionalityRemoted.Destroy;
begin
FTBase2DVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TBase2DVisualizationFunctionalityRemoted.TBase2DVisualizationSOAPFunctionality: ITBase2DVisualizationSOAPFunctionality;
begin
if FTBase2DVisualizationSOAPFunctionality = nil
  then FTBase2DVisualizationSOAPFunctionality:=GetITBase2DVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTBase2DVisualizationSOAPFunctionality;
end;

procedure TBase2DVisualizationFunctionalityRemoted.GetLayInfo(out Lay,SubLay: integer);
begin
TBase2DVisualizationSOAPFunctionality.GetLayInfo(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Lay,SubLay);
end;

procedure TBase2DVisualizationFunctionalityRemoted.GetProps(out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor);
begin
TBase2DVisualizationSOAPFunctionality.GetProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   oflagLoop,oColor,oWidth,oflagFill,oColorFill);
end;

procedure TBase2DVisualizationFunctionalityRemoted.SetProps(const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor);
begin
TBase2DVisualizationSOAPFunctionality.SetProps(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pflagLoop,pColor,pWidth,pflagFill,pColorFill);
end;

procedure TBase2DVisualizationFunctionalityRemoted.CreateNode(const CreateNodeIndex: integer; const X,Y: Double);
begin
TBase2DVisualizationSOAPFunctionality.CreateNode(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   CreateNodeIndex,X,Y);
end;

procedure TBase2DVisualizationFunctionalityRemoted.DestroyNode(const DestroyNodeIndex: integer);
begin
TBase2DVisualizationSOAPFunctionality.DestroyNode(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   DestroyNodeIndex);
end;

procedure TBase2DVisualizationFunctionalityRemoted.SetNode(const SetNodeIndex: integer; const newX,newY: Double);
begin
TBase2DVisualizationSOAPFunctionality.SetNode(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   SetNodeIndex,newX,newY);
end;

procedure TBase2DVisualizationFunctionalityRemoted.GetNodes(out Nodes: TByteArray);
begin
TBase2DVisualizationSOAPFunctionality.GetNodes(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Nodes);
end;

procedure TBase2DVisualizationFunctionalityRemoted.SetNodes(const Nodes: TByteArray; const pWidth: double);
begin
TBase2DVisualizationSOAPFunctionality.SetNodes(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Nodes,pWidth);
end;

procedure TBase2DVisualizationFunctionalityRemoted.CheckPlace(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
TBase2DVisualizationSOAPFunctionality.CheckPlace(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,pScale,Angle,dX,dY);
end;

procedure TBase2DVisualizationFunctionalityRemoted.Move(const dX,dY,dZ: Double);
begin
TBase2DVisualizationSOAPFunctionality.Move(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   dX,dY,dZ);
end;

procedure TBase2DVisualizationFunctionalityRemoted.SetPosition(const X,Y,Z: Double);
begin
TBase2DVisualizationSOAPFunctionality.SetPosition(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   X,Y,Z);
end;

procedure TBase2DVisualizationFunctionalityRemoted.SetPositionAndRotate(const X,Y: Double; const Angle: Double);
begin
TBase2DVisualizationSOAPFunctionality.SetPositionAndRotate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   X,Y,Angle);
end;

procedure TBase2DVisualizationFunctionalityRemoted.Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
begin
TBase2DVisualizationSOAPFunctionality.Transform(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,pScale,Angle,dX,dY);
end;

procedure TBase2DVisualizationFunctionalityRemoted.ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
begin
TBase2DVisualizationSOAPFunctionality.ChangeScale(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,pScale);
end;

procedure TBase2DVisualizationFunctionalityRemoted.Rotate(const Xbind,Ybind: Double; const Angle: Double);
begin
TBase2DVisualizationSOAPFunctionality.Rotate(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Xbind,Ybind,Angle);
end;

procedure TBase2DVisualizationFunctionalityRemoted.ChangeLay(const NewLayID: integer);
begin
TBase2DVisualizationSOAPFunctionality.ChangeLay(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   NewLayID);
end;

procedure TBase2DVisualizationFunctionalityRemoted.ChangeOwner(const ptrNewOwner: TPtr);
begin
TBase2DVisualizationSOAPFunctionality.ChangeOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   ptrNewOwner);
end;

function TBase2DVisualizationFunctionalityRemoted.Square: Double;
begin
Result:=TBase2DVisualizationSOAPFunctionality.Square(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TBase2DVisualizationFunctionalityRemoted.Square1(const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: Double; const NewWidth: Double; const pScale: Double): Double;
begin
Result:=TBase2DVisualizationSOAPFunctionality.Square1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   ExceptPointPtr,ExceptPointValueX,ExceptPointValueY,NewWidth,pScale);
end;

procedure TBase2DVisualizationFunctionalityRemoted.GetInsideObjectsList(out List: TByteArray);
begin
TBase2DVisualizationSOAPFunctionality.GetInsideObjectsList(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   List);
end;

function TBase2DVisualizationFunctionalityRemoted.getIdLay: integer;
begin
Result:=TBase2DVisualizationSOAPFunctionality.getIdLay(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TBase2DVisualizationFunctionalityRemoted.getWidth: Double;
begin
Result:=TBase2DVisualizationSOAPFunctionality.getWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TBase2DVisualizationFunctionalityRemoted.setWidth(Value: Double);
begin
TBase2DVisualizationSOAPFunctionality.setWidth(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
end;

function TBase2DVisualizationFunctionalityRemoted.getflUserSecurity: boolean;
begin
Result:=TBase2DVisualizationSOAPFunctionality.getflUserSecurity(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TBase2DVisualizationFunctionalityRemoted.setflUserSecurity(Value: boolean);
begin
TBase2DVisualizationSOAPFunctionality.setflUserSecurity(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
end;

function TBase2DVisualizationFunctionalityRemoted.getflDetailsNoIndex: boolean;
begin
Result:=TBase2DVisualizationSOAPFunctionality.getflDetailsNoIndex(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TBase2DVisualizationFunctionalityRemoted.setflDetailsNoIndex(Value: boolean);
begin
TBase2DVisualizationSOAPFunctionality.setflDetailsNoIndex(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
end;

function TBase2DVisualizationFunctionalityRemoted.getflNotifyOwnerOnChange: boolean;
begin
Result:=TBase2DVisualizationSOAPFunctionality.getflNotifyOwnerOnChange(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TBase2DVisualizationFunctionalityRemoted.setflNotifyOwnerOnChange(Value: boolean);
begin
TBase2DVisualizationSOAPFunctionality.setflNotifyOwnerOnChange(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
end;


{TTLay2DVisualizationFunctionality}
Constructor TTLay2DVisualizationFunctionalityRemoted.Create(const pTypeFunctionality: TTypeFunctionality);
begin
Inherited Create;
TypeFunctionality:=pTypeFunctionality;
FTTLay2DVisualizationSOAPFunctionality:=nil;
end;

Destructor TTLay2DVisualizationFunctionalityRemoted.Destroy;
begin
FTTLay2DVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TTLay2DVisualizationFunctionalityRemoted.TTLay2DVisualizationSOAPFunctionality: ITTLay2DVisualizationSOAPFunctionality;
begin
if FTTLay2DVisualizationSOAPFunctionality = nil
  then FTTLay2DVisualizationSOAPFunctionality:=GetITTLay2DVisualizationSOAPFunctionality(TypeFunctionality.Space.SOAPServerURL);
Result:=FTTLay2DVisualizationSOAPFunctionality;
end;


{TLay2DVisualizationFunctionality}
Constructor TLay2DVisualizationFunctionalityRemoted.Create(const pComponentFunctionality: TComponentFunctionality);
begin
Inherited Create;
ComponentFunctionality:=pComponentFunctionality;
FTLay2DVisualizationSOAPFunctionality:=nil;
end;

Destructor TLay2DVisualizationFunctionalityRemoted.Destroy;
begin
FTLay2DVisualizationSOAPFunctionality:=nil;
Inherited;
end;

function TLay2DVisualizationFunctionalityRemoted.TLay2DVisualizationSOAPFunctionality: ITLay2DVisualizationSOAPFunctionality;
begin
if FTLay2DVisualizationSOAPFunctionality = nil
  then FTLay2DVisualizationSOAPFunctionality:=GetITLay2DVisualizationSOAPFunctionality(ComponentFunctionality.Space.SOAPServerURL);
Result:=FTLay2DVisualizationSOAPFunctionality;
end;

function TLay2DVisualizationFunctionalityRemoted.GetOwner(out idTOwner,idOwner: integer): boolean;
begin
Result:=TLay2DVisualizationSOAPFunctionality.GetOwner(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   idTOwner,idOwner);
end;

function TLay2DVisualizationFunctionalityRemoted.getName: string;
begin
Result:=TLay2DVisualizationSOAPFunctionality.getName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TLay2DVisualizationFunctionalityRemoted.setName(Value: string);
begin
TLay2DVisualizationSOAPFunctionality.setName(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   Value);
end;

function TLay2DVisualizationFunctionalityRemoted.getHint: string;
begin
Result:=TLay2DVisualizationSOAPFunctionality.getHint(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TLay2DVisualizationFunctionalityRemoted.isEmpty: boolean;
begin
Result:=TLay2DVisualizationSOAPFunctionality.isEmpty(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

function TLay2DVisualizationFunctionalityRemoted.getNumber: integer;
begin
Result:=TLay2DVisualizationSOAPFunctionality.getNumber(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj);
end;

procedure TLay2DVisualizationFunctionalityRemoted.GetParams(out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
begin
TLay2DVisualizationSOAPFunctionality.GetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   oName,oVisibleMinScale,oVisibleMaxScale);
end;

procedure TLay2DVisualizationFunctionalityRemoted.GetParams1(out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
begin
TLay2DVisualizationSOAPFunctionality.GetParams1(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   oName,oNumber,oVisibleMinScale,oVisibleMaxScale);
end;

procedure TLay2DVisualizationFunctionalityRemoted.SetParams(const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double);
begin
TLay2DVisualizationSOAPFunctionality.SetParams(ComponentFunctionality.UserName,ComponentFunctionality.UserPassword, ComponentFunctionality.idTObj,ComponentFunctionality.idObj,   pName,pVisibleMinScale,pVisibleMaxScale);
end;


