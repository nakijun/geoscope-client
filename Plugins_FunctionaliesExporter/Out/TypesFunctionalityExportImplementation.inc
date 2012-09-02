//. the export routines

{TTAGIFVisualizationFunctionality}
function TTAGIFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTAGIFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTAGIFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality).getName;
end;

function TTAGIFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality).getImage;
end;

function TTAGIFVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTAGIFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTAGIFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TAGIFVisualizationFunctionality}
procedure TAGIFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TAGIFVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TAGIFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAGIFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TAGIFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).getName;
end;

function TAGIFVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).getHint;
end;

procedure TAGIFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TAGIFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TAGIFVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TMemoryStream); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).GetDATA(Value);
end;

procedure TAGIFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).SetDATA(Value);
end;

procedure TAGIFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TAGIFVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TAGIFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TAGIFVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;
begin
Result:=TAGIFVisualizationFunctionality(Functionality).TVisualizationUpdating_Create(Reflecting);
end;


{TTOrientedVIDEOVisualizationFunctionality}
function TTOrientedVIDEOVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOrientedVIDEOVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOrientedVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality).getName;
end;

function TTOrientedVIDEOVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality).getImage;
end;

function TTOrientedVIDEOVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTOrientedVIDEOVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOrientedVIDEOVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOrientedVIDEOVisualizationFunctionality}
procedure TOrientedVIDEOVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TOrientedVIDEOVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TOrientedVIDEOVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedVIDEOVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOrientedVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).getName;
end;

function TOrientedVIDEOVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).getHint;
end;

function TOrientedVIDEOVisualizationFunctionality__getDataServer(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).getDataServer;
end;

procedure TOrientedVIDEOVisualizationFunctionality__setDataServer(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality).setDataServer(Value);
end;

function TOrientedVIDEOVisualizationFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).getObjectID;
end;

procedure TOrientedVIDEOVisualizationFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality).setObjectID(Value);
end;

procedure TOrientedVIDEOVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOrientedVIDEOVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOrientedVIDEOVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TOrientedVIDEOVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TOrientedVIDEOVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;
begin
Result:=TOrientedVIDEOVisualizationFunctionality(Functionality).TVisualizationUpdating_Create(Reflecting);
end;


{TTVIDEOVisualizationFunctionality}
function TTVIDEOVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTVIDEOVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality).getName;
end;

function TTVIDEOVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality).getImage;
end;

function TTVIDEOVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTVIDEOVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTVIDEOVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TVIDEOVisualizationFunctionality}
procedure TVIDEOVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TVIDEOVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TVIDEOVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TVIDEOVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TVIDEOVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).getName;
end;

function TVIDEOVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).getHint;
end;

function TVIDEOVisualizationFunctionality__getDataServer(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).getDataServer;
end;

procedure TVIDEOVisualizationFunctionality__setDataServer(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality).setDataServer(Value);
end;

function TVIDEOVisualizationFunctionality__getObjectID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).getObjectID;
end;

procedure TVIDEOVisualizationFunctionality__setObjectID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality).setObjectID(Value);
end;

procedure TVIDEOVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TVIDEOVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TVIDEOVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TVIDEOVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

function TVIDEOVisualizationFunctionality__TVisualizationUpdating_Create(Functionality: TFunctionality;   Reflecting: TReflecting): TObject; stdcall;
begin
Result:=TVIDEOVisualizationFunctionality(Functionality).TVisualizationUpdating_Create(Reflecting);
end;


{TTOPPVisualizationFunctionality}
function TTOPPVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOPPVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOPPVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality).getName;
end;

function TTOPPVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality).getImage;
end;

function TTOPPVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTOPPVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOPPVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOPPVisualizationFunctionality}
procedure TOPPVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TOPPVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TOPPVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOPPVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TOPPVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).getName;
end;

function TOPPVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).getHint;
end;

function TOPPVisualizationFunctionality__getPropsPanel_idTObj(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).getPropsPanel_idTObj;
end;

procedure TOPPVisualizationFunctionality__setPropsPanel_idTObj(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).setPropsPanel_idTObj(Value);
end;

function TOPPVisualizationFunctionality__getPropsPanel_idObj(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).getPropsPanel_idObj;
end;

procedure TOPPVisualizationFunctionality__setPropsPanel_idObj(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).setPropsPanel_idObj(Value);
end;

procedure TOPPVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOPPVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOPPVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TOPPVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TOPPVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;


{TTMODELServerFunctionality}
function TTMODELServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality)._CreateInstance;
end;

procedure TTMODELServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMODELServerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMODELServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMODELServerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality).getName;
end;

function TTMODELServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality).getImage;
end;

function TTMODELServerFunctionality__GetInstanceByIPAddress(Functionality: TFunctionality;   const IPAddress: string;  out id: integer): boolean; stdcall;
begin
Result:=TTMODELServerFunctionality(Functionality).GetInstanceByIPAddress(IPAddress,id);
end;


{TMODELServerFunctionality}
procedure TMODELServerFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TMODELServerFunctionality(Functionality)._ToClone(idClone);
end;

function TMODELServerFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).CanDestroy(Reason);
end;

function TMODELServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMODELServerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).getName;
end;

procedure TMODELServerFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TMODELServerFunctionality(Functionality).setName(Value);
end;

function TMODELServerFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).getHint;
end;

procedure TMODELServerFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer); stdcall;
begin
TMODELServerFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TMODELServerFunctionality__getIPAddress(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).getIPAddress;
end;

procedure TMODELServerFunctionality__setIPAddress(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TMODELServerFunctionality(Functionality).setIPAddress(Value);
end;

function TMODELServerFunctionality__IsUserExist(Functionality: TFunctionality;   const UserName,UserPassword: string): boolean; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).IsUserExist(UserName,UserPassword);
end;

function TMODELServerFunctionality__IsOnLine(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).IsOnLine;
end;

function TMODELServerFunctionality__Info(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMODELServerFunctionality(Functionality).Info;
end;

procedure TMODELServerFunctionality__GetLicense(Functionality: TFunctionality;   out License: WideString); stdcall;
begin
TMODELServerFunctionality(Functionality).GetLicense(License);
end;


{TTCoReferenceFunctionality}
function TTCoReferenceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoReferenceFunctionality(Functionality)._CreateInstance;
end;

procedure TTCoReferenceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCoReferenceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCoReferenceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoReferenceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoReferenceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTCoReferenceFunctionality(Functionality).getName;
end;

function TTCoReferenceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoReferenceFunctionality(Functionality).getImage;
end;


{TCoReferenceFunctionality}
procedure TCoReferenceFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TCoReferenceFunctionality(Functionality)._ToClone(idClone);
end;

function TCoReferenceFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TCoReferenceFunctionality(Functionality).CanDestroy(Reason);
end;

function TCoReferenceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoReferenceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoReferenceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCoReferenceFunctionality(Functionality).getName;
end;

procedure TCoReferenceFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TCoReferenceFunctionality(Functionality).setName(Value);
end;

function TCoReferenceFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCoReferenceFunctionality(Functionality).getHint;
end;

procedure TCoReferenceFunctionality__GetReferencedObject(Functionality: TFunctionality;   out idTReferencedObject,idReferencedObject: integer); stdcall;
begin
TCoReferenceFunctionality(Functionality).GetReferencedObject(idTReferencedObject,idReferencedObject);
end;

procedure TCoReferenceFunctionality__SetReferencedObject(Functionality: TFunctionality;   const idTReferencedObject,idReferencedObject: integer); stdcall;
begin
TCoReferenceFunctionality(Functionality).SetReferencedObject(idTReferencedObject,idReferencedObject);
end;

procedure TCoReferenceFunctionality__ShowReferencedObjectPanelProps(Functionality: TFunctionality); stdcall;
begin
TCoReferenceFunctionality(Functionality).ShowReferencedObjectPanelProps;
end;


{TTPositionerFunctionality}
function TTPositionerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTPositionerFunctionality(Functionality)._CreateInstance;
end;

procedure TTPositionerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTPositionerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTPositionerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTPositionerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTPositionerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTPositionerFunctionality(Functionality).getName;
end;

function TTPositionerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTPositionerFunctionality(Functionality).getImage;
end;


{TPositionerFunctionality}
function TPositionerFunctionality__getPositionName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).getPositionName;
end;

procedure TPositionerFunctionality__setPositionName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TPositionerFunctionality(Functionality).setPositionName(Value);
end;

procedure TPositionerFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TPositionerFunctionality(Functionality)._ToClone(idClone);
end;

function TPositionerFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).CanDestroy(Reason);
end;

function TPositionerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPositionerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).getName;
end;

function TPositionerFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TPositionerFunctionality(Functionality).getHint;
end;

procedure TPositionerFunctionality__Get2DPosition(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Extended); stdcall;
begin
TPositionerFunctionality(Functionality).Get2DPosition(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TPositionerFunctionality__Save2DPosition(Functionality: TFunctionality;   Reflector: TReflector); stdcall;
begin
TPositionerFunctionality(Functionality).Save2DPosition(Reflector);
end;

procedure TPositionerFunctionality__SetPosition(Functionality: TFunctionality); stdcall;
begin
TPositionerFunctionality(Functionality).SetPosition;
end;


{TTOrientedWMFVisualizationFunctionality}
function TTOrientedWMFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOrientedWMFVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).ImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTOrientedWMFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOrientedWMFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).getName;
end;

function TTOrientedWMFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).getImage;
end;

function TTOrientedWMFVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTOrientedWMFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOrientedWMFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOrientedWMFVisualizationFunctionality}
function TOrientedWMFVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TOrientedWMFVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TOrientedWMFVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

function TOrientedWMFVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Extended): boolean; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).IsNewContainerAcceptable(NewWidth,NewHeight,NewScale);
end;

procedure TOrientedWMFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TOrientedWMFVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TOrientedWMFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedWMFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

procedure TOrientedWMFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TOrientedWMFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getName;
end;

function TOrientedWMFVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getHint;
end;

procedure TOrientedWMFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TOrientedWMFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TOrientedWMFVisualizationFunctionality__getWidth(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getWidth;
end;

procedure TOrientedWMFVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).setWidth(Value);
end;

function TOrientedWMFVisualizationFunctionality__getHeight(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getHeight;
end;

procedure TOrientedWMFVisualizationFunctionality__setHeight(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).setHeight(Value);
end;

function TOrientedWMFVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).getOrientation;
end;

procedure TOrientedWMFVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).setOrientation(Value);
end;

procedure TOrientedWMFVisualizationFunctionality__ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Extended); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).ChangeScale(ScaleFactor);
end;

procedure TOrientedWMFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOrientedWMFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TOrientedWMFVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).UpdateContainer;
end;

function TOrientedWMFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TOrientedWMFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TOrientedWMFVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;
begin
TOrientedWMFVisualizationFunctionality(Functionality).GetExportDATA(Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;


{TTCELLVisualizationFunctionality}
function TTCELLVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTCELLVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCELLVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality).getName;
end;

function TTCELLVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality).getImage;
end;

function TTCELLVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTCELLVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTCELLVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TCELLVisualizationFunctionality}
function TCELLVisualizationFunctionality__getColCount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getColCount;
end;

procedure TCELLVisualizationFunctionality__setColCount(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).setColCount(Value);
end;

function TCELLVisualizationFunctionality__getRowCount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getRowCount;
end;

procedure TCELLVisualizationFunctionality__setRowCount(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).setRowCount(Value);
end;

function TCELLVisualizationFunctionality__getLineWidth(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getLineWidth;
end;

procedure TCELLVisualizationFunctionality__setLineWidth(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).setLineWidth(Value);
end;

function TCELLVisualizationFunctionality__getColSize(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getColSize;
end;

function TCELLVisualizationFunctionality__getRowSize(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getRowSize;
end;

procedure TCELLVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TCELLVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TCELLVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCELLVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TCELLVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getName;
end;

function TCELLVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).getHint;
end;

procedure TCELLVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TCELLVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TCELLVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TCELLVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TCELLVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TCELLVisualizationFunctionality__GetCoordinates(Functionality: TFunctionality;   out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Extended); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).GetCoordinates(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
end;

procedure TCELLVisualizationFunctionality__SetReflectorView(Functionality: TFunctionality); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).SetReflectorView;
end;

procedure TCELLVisualizationFunctionality__Change(Functionality: TFunctionality;   const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer); stdcall;
begin
TCELLVisualizationFunctionality(Functionality).Change(Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows);
end;


{TTEllipseVisualizationFunctionality}
function TTEllipseVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTEllipseVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTEllipseVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality).getName;
end;

function TTEllipseVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality).getImage;
end;

function TTEllipseVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTEllipseVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTEllipseVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TEllipseVisualizationFunctionality}
function TEllipseVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getColor;
end;

procedure TEllipseVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).setColor(Value);
end;

function TEllipseVisualizationFunctionality__getBorderColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getBorderColor;
end;

procedure TEllipseVisualizationFunctionality__setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).setBorderColor(Value);
end;

function TEllipseVisualizationFunctionality__getBorderWidth(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getBorderWidth;
end;

procedure TEllipseVisualizationFunctionality__setBorderWidth(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).setBorderWidth(Value);
end;

procedure TEllipseVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TEllipseVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TEllipseVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TEllipseVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TEllipseVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getName;
end;

function TEllipseVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).getHint;
end;

procedure TEllipseVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TEllipseVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TEllipseVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;
begin
TEllipseVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TEllipseVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TEllipseVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;


{TTWMFVisualizationFunctionality}
function TTWMFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTWMFVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).ImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTWMFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTWMFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).getName;
end;

function TTWMFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).getImage;
end;

function TTWMFVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTWMFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTWMFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TWMFVisualizationFunctionality}
function TWMFVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TWMFVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TWMFVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

procedure TWMFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TWMFVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TWMFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWMFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TWMFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).getName;
end;

function TWMFVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).getHint;
end;

procedure TWMFVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TWMFVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TWMFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TWMFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TWMFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TWMFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TWMFVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;
begin
TWMFVisualizationFunctionality(Functionality).GetExportDATA(Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;


{TTPictureVisualizationFunctionality}
function TTPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTPictureVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).ImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTPictureVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).getName;
end;

function TTPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).getImage;
end;

function TTPictureVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTPictureVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TPictureVisualizationFunctionality}
function TPictureVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TPictureVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TPictureVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

procedure TPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TPictureVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TPictureVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).getName;
end;

function TPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).getHint;
end;

procedure TPictureVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TPictureVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TPictureVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TPictureVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;
begin
TPictureVisualizationFunctionality(Functionality).GetExportDATA(Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;


{TTRoundVisualizationFunctionality}
function TTRoundVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTRoundVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTRoundVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality).getName;
end;

function TTRoundVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality).getImage;
end;

function TTRoundVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTRoundVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTRoundVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TRoundVisualizationFunctionality}
function TRoundVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getColor;
end;

procedure TRoundVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).setColor(Value);
end;

function TRoundVisualizationFunctionality__getBorderColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getBorderColor;
end;

procedure TRoundVisualizationFunctionality__setBorderColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).setBorderColor(Value);
end;

function TRoundVisualizationFunctionality__getBorderWidth(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getBorderWidth;
end;

procedure TRoundVisualizationFunctionality__setBorderWidth(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).setBorderWidth(Value);
end;

procedure TRoundVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TRoundVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TRoundVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TRoundVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TRoundVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TRoundVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getName;
end;

function TRoundVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).getHint;
end;

procedure TRoundVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TRoundVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TRoundVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;
begin
TRoundVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TRoundVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TRoundVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;


{TTGeodesyPointFunctionality}
function TTGeodesyPointFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality)._CreateInstance;
end;

procedure TTGeodesyPointFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGeodesyPointFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGeodesyPointFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGeodesyPointFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).getName;
end;

function TTGeodesyPointFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).getImage;
end;

function TTGeodesyPointFunctionality__ConvertSpaceCRDToGeoCRD(Functionality: TFunctionality;   const X,Y: Extended; out Latitude,Longitude: Extended): boolean; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).ConvertSpaceCRDToGeoCRD(X,Y,Latitude,Longitude);
end;

function TTGeodesyPointFunctionality__ConvertGeoCRDToSpaceCRD(Functionality: TFunctionality;   const Latitude,Longitude: Extended; out X,Y: Extended): boolean; stdcall;
begin
Result:=TTGeodesyPointFunctionality(Functionality).ConvertGeoCRDToSpaceCRD(Latitude,Longitude,X,Y);
end;


{TGeodesyPointFunctionality}
function TGeodesyPointFunctionality__getLatitude(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getLatitude;
end;

procedure TGeodesyPointFunctionality__setLatitude(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TGeodesyPointFunctionality(Functionality).setLatitude(Value);
end;

function TGeodesyPointFunctionality__getLongitude(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getLongitude;
end;

procedure TGeodesyPointFunctionality__setLongitude(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TGeodesyPointFunctionality(Functionality).setLongitude(Value);
end;

procedure TGeodesyPointFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TGeodesyPointFunctionality(Functionality)._ToClone(idClone);
end;

function TGeodesyPointFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).CanDestroy(Reason);
end;

function TGeodesyPointFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGeodesyPointFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getName;
end;

function TGeodesyPointFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TGeodesyPointFunctionality(Functionality).getHint;
end;


{TTPrivateAreaVisualizationFunctionality}
function TTPrivateAreaVisualizationFunctionality__CanCreateAsDetail(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).CanCreateAsDetail;
end;

function TTPrivateAreaVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTPrivateAreaVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTPrivateAreaVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).getName;
end;

function TTPrivateAreaVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).getImage;
end;

function TTPrivateAreaVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTPrivateAreaVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTPrivateAreaVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TPrivateAreaVisualizationFunctionality}
procedure TPrivateAreaVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TPrivateAreaVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TPrivateAreaVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TPrivateAreaVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TPrivateAreaVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TPrivateAreaVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).getName;
end;

function TPrivateAreaVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).getHint;
end;

procedure TPrivateAreaVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TPrivateAreaVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TPrivateAreaVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TPrivateAreaVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TPrivateAreaVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TPrivateAreaVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;


{TTHyperTextFunctionality}
function TTHyperTextFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHyperTextFunctionality(Functionality)._CreateInstance;
end;

procedure TTHyperTextFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTHyperTextFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTHyperTextFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHyperTextFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHyperTextFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTHyperTextFunctionality(Functionality).getName;
end;

function TTHyperTextFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHyperTextFunctionality(Functionality).getImage;
end;


{THyperTextFunctionality}
procedure THyperTextFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
THyperTextFunctionality(Functionality)._ToClone(idClone);
end;

function THyperTextFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=THyperTextFunctionality(Functionality).CanDestroy(Reason);
end;

function THyperTextFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THyperTextFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THyperTextFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=THyperTextFunctionality(Functionality).getName;
end;

function THyperTextFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=THyperTextFunctionality(Functionality).getHint;
end;

procedure THyperTextFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream); stdcall;
begin
THyperTextFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure THyperTextFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
THyperTextFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure THyperTextFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
THyperTextFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure THyperTextFunctionality__SaveToFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
THyperTextFunctionality(Functionality).SaveToFile(FileName);
end;


{TTComponentsFindServiceFunctionality}
function TTComponentsFindServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTComponentsFindServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTComponentsFindServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTComponentsFindServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTComponentsFindServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTComponentsFindServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTComponentsFindServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTComponentsFindServiceFunctionality(Functionality).getName;
end;

function TTComponentsFindServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTComponentsFindServiceFunctionality(Functionality).getImage;
end;


{TComponentsFindServiceFunctionality}
procedure TComponentsFindServiceFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TComponentsFindServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TComponentsFindServiceFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TComponentsFindServiceFunctionality(Functionality).CanDestroy(Reason);
end;

function TComponentsFindServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TComponentsFindServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TComponentsFindServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TComponentsFindServiceFunctionality(Functionality).getName;
end;

function TComponentsFindServiceFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TComponentsFindServiceFunctionality(Functionality).getHint;
end;


{TTUsersServiceFunctionality}
function TTUsersServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTUsersServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTUsersServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTUsersServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTUsersServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTUsersServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTUsersServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTUsersServiceFunctionality(Functionality).getName;
end;

function TTUsersServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTUsersServiceFunctionality(Functionality).getImage;
end;


{TUsersServiceFunctionality}
procedure TUsersServiceFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TUsersServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TUsersServiceFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TUsersServiceFunctionality(Functionality).CanDestroy(Reason);
end;

function TUsersServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TUsersServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TUsersServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TUsersServiceFunctionality(Functionality).getName;
end;

function TUsersServiceFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TUsersServiceFunctionality(Functionality).getHint;
end;


{TTTransportServiceFunctionality}
function TTTransportServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTransportServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTTransportServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTransportServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTransportServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTransportServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTransportServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTTransportServiceFunctionality(Functionality).getName;
end;

function TTTransportServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTransportServiceFunctionality(Functionality).getImage;
end;


{TTransportServiceFunctionality}
procedure TTransportServiceFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TTransportServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TTransportServiceFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TTransportServiceFunctionality(Functionality).CanDestroy(Reason);
end;

function TTransportServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTransportServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTransportServiceFunctionality(Functionality).getName;
end;

function TTransportServiceFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTransportServiceFunctionality(Functionality).getHint;
end;


{TTMarketServiceFunctionality}
function TTMarketServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMarketServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTMarketServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMarketServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMarketServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMarketServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMarketServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTMarketServiceFunctionality(Functionality).getName;
end;

function TTMarketServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMarketServiceFunctionality(Functionality).getImage;
end;


{TMarketServiceFunctionality}
procedure TMarketServiceFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TMarketServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TMarketServiceFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TMarketServiceFunctionality(Functionality).CanDestroy(Reason);
end;

function TMarketServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMarketServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMarketServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMarketServiceFunctionality(Functionality).getName;
end;

function TMarketServiceFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMarketServiceFunctionality(Functionality).getHint;
end;


{TTTelecomServiceFunctionality}
function TTTelecomServiceFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTelecomServiceFunctionality(Functionality)._CreateInstance;
end;

procedure TTTelecomServiceFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTelecomServiceFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTelecomServiceFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTelecomServiceFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTelecomServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTTelecomServiceFunctionality(Functionality).getName;
end;

function TTTelecomServiceFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTelecomServiceFunctionality(Functionality).getImage;
end;


{TTelecomServiceFunctionality}
procedure TTelecomServiceFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TTelecomServiceFunctionality(Functionality)._ToClone(idClone);
end;

function TTelecomServiceFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TTelecomServiceFunctionality(Functionality).CanDestroy(Reason);
end;

function TTelecomServiceFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTelecomServiceFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTelecomServiceFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTelecomServiceFunctionality(Functionality).getName;
end;

function TTelecomServiceFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTelecomServiceFunctionality(Functionality).getHint;
end;


{TTWNDVisualizationFunctionality}
function TTWNDVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTWNDVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).ImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTWNDVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTWNDVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).getName;
end;

function TTWNDVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).getImage;
end;

function TTWNDVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTWNDVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTWNDVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TWNDVisualizationFunctionality}
function TWNDVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TWNDVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TWNDVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

procedure TWNDVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TWNDVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TWNDVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWNDVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TWNDVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).getName;
end;

function TWNDVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).getHint;
end;

procedure TWNDVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TWNDVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TWNDVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TWNDVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TWNDVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TWNDVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TWNDVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;
begin
TWNDVisualizationFunctionality(Functionality).GetExportDATA(Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;


{TTMRKVisualizationFunctionality}
function TTMRKVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTMRKVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).ImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTMRKVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMRKVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).getName;
end;

function TTMRKVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).getImage;
end;

function TTMRKVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTMRKVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTMRKVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TMRKVisualizationFunctionality}
function TMRKVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TMRKVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TMRKVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

procedure TMRKVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TMRKVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TMRKVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMRKVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TMRKVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getName;
end;

function TMRKVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getHint;
end;

procedure TMRKVisualizationFunctionality__DoOnComponentUpdate(Functionality: TFunctionality); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).DoOnComponentUpdate;
end;

procedure TMRKVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TMRKVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TMRKVisualizationFunctionality__getBindingPointIndex(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getBindingPointIndex;
end;

procedure TMRKVisualizationFunctionality__setBindingPointIndex(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).setBindingPointIndex(Value);
end;

function TMRKVisualizationFunctionality__getAlign(Functionality: TFunctionality): TMRKVisualizationAlign; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).getAlign;
end;

procedure TMRKVisualizationFunctionality__setAlign(Functionality: TFunctionality;   Value: TMRKVisualizationAlign); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).setAlign(Value);
end;

procedure TMRKVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TMRKVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TMRKVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TMRKVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TMRKVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;
begin
TMRKVisualizationFunctionality(Functionality).GetExportDATA(Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;


{TTOrientedPictureVisualizationFunctionality}
function TTOrientedPictureVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOrientedPictureVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).ImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTOrientedPictureVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOrientedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).getName;
end;

function TTOrientedPictureVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).getImage;
end;

function TTOrientedPictureVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTOrientedPictureVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOrientedPictureVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOrientedPictureVisualizationFunctionality}
function TOrientedPictureVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TOrientedPictureVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TOrientedPictureVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

function TOrientedPictureVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewWidth,NewHeight,NewScale: Extended): boolean; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).IsNewContainerAcceptable(NewWidth,NewHeight,NewScale);
end;

procedure TOrientedPictureVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TOrientedPictureVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TOrientedPictureVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedPictureVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

procedure TOrientedPictureVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TOrientedPictureVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getName;
end;

function TOrientedPictureVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getHint;
end;

procedure TOrientedPictureVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TOrientedPictureVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

function TOrientedPictureVisualizationFunctionality__getWidth(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getWidth;
end;

procedure TOrientedPictureVisualizationFunctionality__setWidth(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).setWidth(Value);
end;

function TOrientedPictureVisualizationFunctionality__getHeight(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getHeight;
end;

procedure TOrientedPictureVisualizationFunctionality__setHeight(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).setHeight(Value);
end;

function TOrientedPictureVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).getOrientation;
end;

procedure TOrientedPictureVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).setOrientation(Value);
end;

procedure TOrientedPictureVisualizationFunctionality__ChangeScale(Functionality: TFunctionality;   const ScaleFactor: Extended); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).ChangeScale(ScaleFactor);
end;

procedure TOrientedPictureVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOrientedPictureVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TOrientedPictureVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).UpdateContainer;
end;

function TOrientedPictureVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TOrientedPictureVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TOrientedPictureVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;
begin
TOrientedPictureVisualizationFunctionality(Functionality).GetExportDATA(Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;


{TTOrientedTTFVisualizationFunctionality}
function TTOrientedTTFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTOrientedTTFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOrientedTTFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality).getName;
end;

function TTOrientedTTFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality).getImage;
end;

function TTOrientedTTFVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTOrientedTTFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTOrientedTTFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TOrientedTTFVisualizationFunctionality}
function TOrientedTTFVisualizationFunctionality__IsNewContainerAcceptable(Functionality: TFunctionality;   const NewFontWidth,NewFontHeight,NewCharInterval: Extended; const flNewStr: boolean; const NewStr: TStringOrientedTTFVisualization): boolean; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).IsNewContainerAcceptable(NewFontWidth,NewFontHeight,NewCharInterval,flNewStr,NewStr);
end;

procedure TOrientedTTFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TOrientedTTFVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TOrientedTTFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOrientedTTFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

procedure TOrientedTTFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TOrientedTTFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getName;
end;

function TOrientedTTFVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getHint;
end;

function TOrientedTTFVisualizationFunctionality__getStr(Functionality: TFunctionality): TStringOrientedTTFVisualization; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getStr;
end;

procedure TOrientedTTFVisualizationFunctionality__setStr(Functionality: TFunctionality;   const Value: TStringOrientedTTFVisualization); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setStr(Value);
end;

function TOrientedTTFVisualizationFunctionality__getColor(Functionality: TFunctionality): TColor; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getColor;
end;

procedure TOrientedTTFVisualizationFunctionality__setColor(Functionality: TFunctionality;   Value: TColor); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setColor(Value);
end;

function TOrientedTTFVisualizationFunctionality__getFont_Name(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getFont_Name;
end;

procedure TOrientedTTFVisualizationFunctionality__setFont_Name(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setFont_Name(Value);
end;

function TOrientedTTFVisualizationFunctionality__getFont_Width(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getFont_Width;
end;

procedure TOrientedTTFVisualizationFunctionality__setFont_Width(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setFont_Width(Value);
end;

function TOrientedTTFVisualizationFunctionality__getFont_Height(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getFont_Height;
end;

procedure TOrientedTTFVisualizationFunctionality__setFont_Height(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setFont_Height(Value);
end;

function TOrientedTTFVisualizationFunctionality__getCharInterval(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getCharInterval;
end;

procedure TOrientedTTFVisualizationFunctionality__setCharInterval(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setCharInterval(Value);
end;

function TOrientedTTFVisualizationFunctionality__getOrientation(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).getOrientation;
end;

procedure TOrientedTTFVisualizationFunctionality__setOrientation(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).setOrientation(Value);
end;

procedure TOrientedTTFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TOrientedTTFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TOrientedTTFVisualizationFunctionality__UpdateContainer(Functionality: TFunctionality); stdcall;
begin
TOrientedTTFVisualizationFunctionality(Functionality).UpdateContainer;
end;

function TOrientedTTFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TOrientedTTFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;


{TTIconFunctionality}
function TTIconFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTIconFunctionality(Functionality)._CreateInstance;
end;

procedure TTIconFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTIconFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTIconFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTIconFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTIconFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTIconFunctionality(Functionality).getName;
end;

function TTIconFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTIconFunctionality(Functionality).getImage;
end;


{TIconFunctionality}
procedure TIconFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TIconFunctionality(Functionality)._ToClone(idClone);
end;

function TIconFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TIconFunctionality(Functionality).CanDestroy(Reason);
end;

function TIconFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TIconFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TIconFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TIconFunctionality(Functionality).getName;
end;

function TIconFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TIconFunctionality(Functionality).getHint;
end;

procedure TIconFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall;
begin
TIconFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TIconFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall;
begin
TIconFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TIconFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;
begin
TIconFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;

procedure TIconFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TIconFunctionality(Functionality).LoadFromFile(FileName);
end;


{TTMessageBoardMessageFunctionality}
procedure TTMessageBoardMessageFunctionality__CheckUserOperation(Functionality: TFunctionality;   const idObj: integer; const idOperation: integer); stdcall;
begin
TTMessageBoardMessageFunctionality(Functionality).CheckUserOperation(idObj,idOperation);
end;

function TTMessageBoardMessageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMessageBoardMessageFunctionality(Functionality)._CreateInstance;
end;

procedure TTMessageBoardMessageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMessageBoardMessageFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMessageBoardMessageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMessageBoardMessageFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMessageBoardMessageFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTMessageBoardMessageFunctionality(Functionality).getName;
end;

function TTMessageBoardMessageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMessageBoardMessageFunctionality(Functionality).getImage;
end;


{TMessageBoardMessageFunctionality}
procedure TMessageBoardMessageFunctionality__CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).CheckUserOperation(idOperation);
end;

procedure TMessageBoardMessageFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality)._ToClone(idClone);
end;

function TMessageBoardMessageFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).CanDestroy(Reason);
end;

function TMessageBoardMessageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMessageBoardMessageFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getName;
end;

function TMessageBoardMessageFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getHint;
end;

function TMessageBoardMessageFunctionality__getIdMessageBoard(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getIdMessageBoard;
end;

procedure TMessageBoardMessageFunctionality__setIdMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).setIdMessageBoard(Value);
end;

function TMessageBoardMessageFunctionality__getIdSenderMessageBoard(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getIdSenderMessageBoard;
end;

procedure TMessageBoardMessageFunctionality__setIdSenderMessageBoard(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).setIdSenderMessageBoard(Value);
end;

function TMessageBoardMessageFunctionality__DateCreated(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).DateCreated;
end;

function TMessageBoardMessageFunctionality__getSubject(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getSubject;
end;

procedure TMessageBoardMessageFunctionality__setSubject(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).setSubject(Value);
end;

procedure TMessageBoardMessageFunctionality__GetBody(Functionality: TFunctionality;   Value: TStrings); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).GetBody(Value);
end;

procedure TMessageBoardMessageFunctionality__SetBody(Functionality: TFunctionality;   Value: TStrings); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).SetBody(Value);
end;

function TMessageBoardMessageFunctionality__getFlRead(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).getFlRead;
end;

procedure TMessageBoardMessageFunctionality__setFlRead(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TMessageBoardMessageFunctionality(Functionality).setFlRead(Value);
end;

function TMessageBoardMessageFunctionality__IsEmpty(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).IsEmpty;
end;

function TMessageBoardMessageFunctionality__IsCreatedByUser(Functionality: TFunctionality;   const pidUser: integer): boolean; stdcall;
begin
Result:=TMessageBoardMessageFunctionality(Functionality).IsCreatedByUser(pidUser);
end;


{TTMessageBoardFunctionality}
function TTMessageBoardFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMessageBoardFunctionality(Functionality)._CreateInstance;
end;

procedure TTMessageBoardFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMessageBoardFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMessageBoardFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMessageBoardFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMessageBoardFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTMessageBoardFunctionality(Functionality).getName;
end;

function TTMessageBoardFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMessageBoardFunctionality(Functionality).getImage;
end;


{TMessageBoardFunctionality}
function TMessageBoardFunctionality__getIdUser(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).getIdUser;
end;

procedure TMessageBoardFunctionality__setIdUser(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMessageBoardFunctionality(Functionality).setIdUser(Value);
end;

procedure TMessageBoardFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TMessageBoardFunctionality(Functionality)._ToClone(idClone);
end;

function TMessageBoardFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).CanDestroy(Reason);
end;

procedure TMessageBoardFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer); stdcall;
begin
TMessageBoardFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TMessageBoardFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMessageBoardFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).getName;
end;

procedure TMessageBoardFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TMessageBoardFunctionality(Functionality).setName(Value);
end;

function TMessageBoardFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).getHint;
end;

function TMessageBoardFunctionality__IsUnreadMessageExist(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMessageBoardFunctionality(Functionality).IsUnreadMessageExist;
end;

procedure TMessageBoardFunctionality__GetMessagesList(Functionality: TFunctionality;   var List: TList); stdcall;
begin
TMessageBoardFunctionality(Functionality).GetMessagesList(List);
end;


{TTQDCVisualizationFunctionality}
function TTQDCVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTQDCVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).ImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTQDCVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTQDCVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).getName;
end;

function TTQDCVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).getImage;
end;

function TTQDCVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTQDCVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTQDCVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TQDCVisualizationFunctionality}
function TQDCVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TQDCVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TQDCVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

procedure TQDCVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TQDCVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TQDCVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TQDCVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TQDCVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TQDCVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).getName;
end;

function TQDCVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).getHint;
end;

procedure TQDCVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TQDCVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).CloneData(idClone);
end;

procedure TQDCVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).GetExportDATA(Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;

function TQDCVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TQDCVisualizationFunctionality__ReflectInScene(Functionality: TFunctionality;   Scene: TScene); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).ReflectInScene(Scene);
end;

function TQDCVisualizationFunctionality__GetDATA(Functionality: TFunctionality;   out DATAPtr: pointer): boolean; stdcall;
begin
Result:=TQDCVisualizationFunctionality(Functionality).GetDATA(DATAPtr);
end;

procedure TQDCVisualizationFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).SetDATA(DATAStream);
end;

procedure TQDCVisualizationFunctionality__LoadFromBitmap(Functionality: TFunctionality;   Bitmap: TBitmap); stdcall;
begin
TQDCVisualizationFunctionality(Functionality).LoadFromBitmap(Bitmap);
end;


{TTOffersServerFunctionality}
function TTOffersServerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOffersServerFunctionality(Functionality)._CreateInstance;
end;

procedure TTOffersServerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTOffersServerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTOffersServerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOffersServerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOffersServerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTOffersServerFunctionality(Functionality).getName;
end;

function TTOffersServerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOffersServerFunctionality(Functionality).getImage;
end;


{TOffersServerFunctionality}
function TOffersServerFunctionality__getMailROBOT_Inbox(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getMailROBOT_Inbox;
end;

procedure TOffersServerFunctionality__setMailROBOT_Inbox(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TOffersServerFunctionality(Functionality).setMailROBOT_Inbox(Value);
end;

function TOffersServerFunctionality__getMailROBOT_User(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getMailROBOT_User;
end;

procedure TOffersServerFunctionality__setMailROBOT_User(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TOffersServerFunctionality(Functionality).setMailROBOT_User(Value);
end;

function TOffersServerFunctionality__getMailROBOT_Password(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getMailROBOT_Password;
end;

procedure TOffersServerFunctionality__setMailROBOT_Password(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TOffersServerFunctionality(Functionality).setMailROBOT_Password(Value);
end;

procedure TOffersServerFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOffersServerFunctionality(Functionality)._ToClone(idClone);
end;

function TOffersServerFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).CanDestroy(Reason);
end;

function TOffersServerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOffersServerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getName;
end;

function TOffersServerFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOffersServerFunctionality(Functionality).getHint;
end;


{TTSecurityComponentOperationFunctionality}
function TTSecurityComponentOperationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSecurityComponentOperationFunctionality(Functionality)._CreateInstance;
end;

procedure TTSecurityComponentOperationFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityComponentOperationFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSecurityComponentOperationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSecurityComponentOperationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSecurityComponentOperationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTSecurityComponentOperationFunctionality(Functionality).getName;
end;

function TTSecurityComponentOperationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSecurityComponentOperationFunctionality(Functionality).getImage;
end;


{TSecurityComponentOperationFunctionality}
procedure TSecurityComponentOperationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TSecurityComponentOperationFunctionality(Functionality)._ToClone(idClone);
end;

function TSecurityComponentOperationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).CanDestroy(Reason);
end;

function TSecurityComponentOperationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityComponentOperationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).getName;
end;

procedure TSecurityComponentOperationFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TSecurityComponentOperationFunctionality(Functionality).setName(Value);
end;

function TSecurityComponentOperationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).getHint;
end;

function TSecurityComponentOperationFunctionality__getSQLInfo(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSecurityComponentOperationFunctionality(Functionality).getSQLInfo;
end;

procedure TSecurityComponentOperationFunctionality__setSQLInfo(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TSecurityComponentOperationFunctionality(Functionality).setSQLInfo(Value);
end;


{TTSecurityKeyFunctionality}
function TTSecurityKeyFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality)._CreateInstance;
end;

procedure TTSecurityKeyFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityKeyFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSecurityKeyFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSecurityKeyFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality).getName;
end;

function TTSecurityKeyFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSecurityKeyFunctionality(Functionality).getImage;
end;


{TSecurityKeyFunctionality}
procedure TSecurityKeyFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TSecurityKeyFunctionality(Functionality)._ToClone(idClone);
end;

function TSecurityKeyFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).CanDestroy(Reason);
end;

function TSecurityKeyFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityKeyFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).getName;
end;

procedure TSecurityKeyFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TSecurityKeyFunctionality(Functionality).setName(Value);
end;

function TSecurityKeyFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).getHint;
end;

function TSecurityKeyFunctionality__getInfo(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSecurityKeyFunctionality(Functionality).getInfo;
end;

procedure TSecurityKeyFunctionality__setInfo(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TSecurityKeyFunctionality(Functionality).setInfo(Value);
end;

procedure TSecurityKeyFunctionality__GetAssotiatedUsers(Functionality: TFunctionality;   out Users: TList); stdcall;
begin
TSecurityKeyFunctionality(Functionality).GetAssotiatedUsers(Users);
end;


{TTSecurityFileFunctionality}
function TTSecurityFileFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSecurityFileFunctionality(Functionality)._CreateInstance;
end;

procedure TTSecurityFileFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityFileFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSecurityFileFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSecurityFileFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSecurityFileFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTSecurityFileFunctionality(Functionality).getName;
end;

function TTSecurityFileFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSecurityFileFunctionality(Functionality).getImage;
end;


{TSecurityFileFunctionality}
procedure TSecurityFileFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TSecurityFileFunctionality(Functionality)._ToClone(idClone);
end;

function TSecurityFileFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).CanDestroy(Reason);
end;

function TSecurityFileFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityFileFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).getName;
end;

procedure TSecurityFileFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TSecurityFileFunctionality(Functionality).setName(Value);
end;

function TSecurityFileFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).getHint;
end;

function TSecurityFileFunctionality__getInfo(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).getInfo;
end;

procedure TSecurityFileFunctionality__setInfo(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TSecurityFileFunctionality(Functionality).setInfo(Value);
end;

function TSecurityFileFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TMemoryStream): boolean; stdcall;
begin
Result:=TSecurityFileFunctionality(Functionality).GetDATA(DATAStream);
end;

procedure TSecurityFileFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream); stdcall;
begin
TSecurityFileFunctionality(Functionality).SetDATA(DATAStream);
end;


{TTSecurityComponentFunctionality}
function TTSecurityComponentFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality)._CreateInstance;
end;

procedure TTSecurityComponentFunctionality__DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityComponentFunctionality(Functionality).DestroyInstance(idObj);
end;

procedure TTSecurityComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSecurityComponentFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSecurityComponentFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality).ImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTSecurityComponentFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSecurityComponentFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality).getName;
end;

function TTSecurityComponentFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSecurityComponentFunctionality(Functionality).getImage;
end;


{TSecurityComponentFunctionality}
function TSecurityComponentFunctionality__getIdSecurityFile(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).getIdSecurityFile;
end;

procedure TSecurityComponentFunctionality__setIdSecurityFile(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TSecurityComponentFunctionality(Functionality).setIdSecurityFile(Value);
end;

function TSecurityComponentFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

procedure TSecurityComponentFunctionality__ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TSecurityComponentFunctionality(Functionality).ToClone(idClone);
end;

procedure TSecurityComponentFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TSecurityComponentFunctionality(Functionality)._ToClone(idClone);
end;

function TSecurityComponentFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).CanDestroy(Reason);
end;

function TSecurityComponentFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSecurityComponentFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).getName;
end;

function TSecurityComponentFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSecurityComponentFunctionality(Functionality).getHint;
end;


{TTMODELUserFunctionality}
function TTMODELUserFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality)._CreateInstance;
end;

procedure TTMODELUserFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMODELUserFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMODELUserFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMODELUserFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality).getName;
end;

function TTMODELUserFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality).getImage;
end;

function TTMODELUserFunctionality__IsUserExist(Functionality: TFunctionality;   const UserName: string; out idUser: integer): boolean; stdcall;
begin
Result:=TTMODELUserFunctionality(Functionality).IsUserExist(UserName,idUser);
end;


{TMODELUserFunctionality}
function TMODELUserFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getName;
end;

procedure TMODELUserFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TMODELUserFunctionality(Functionality).setName(Value);
end;

function TMODELUserFunctionality__getFullName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getFullName;
end;

procedure TMODELUserFunctionality__setFullName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TMODELUserFunctionality(Functionality).setFullName(Value);
end;

function TMODELUserFunctionality__getContactInfo(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getContactInfo;
end;

procedure TMODELUserFunctionality__setContactInfo(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TMODELUserFunctionality(Functionality).setContactInfo(Value);
end;

function TMODELUserFunctionality__getPassword(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getPassword;
end;

procedure TMODELUserFunctionality__setPassword(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TMODELUserFunctionality(Functionality).setPassword(Value);
end;

function TMODELUserFunctionality__getIdSecurityFileForClone(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getIdSecurityFileForClone;
end;

procedure TMODELUserFunctionality__setIdSecurityFileForClone(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setIdSecurityFileForClone(Value);
end;

function TMODELUserFunctionality__getDATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getDATASize;
end;

procedure TMODELUserFunctionality__setDATASize(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setDATASize(Value);
end;

function TMODELUserFunctionality__getMaxDATASize(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getMaxDATASize;
end;

procedure TMODELUserFunctionality__setMaxDATASize(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setMaxDATASize(Value);
end;

function TMODELUserFunctionality__getSpaceSquare(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getSpaceSquare;
end;

procedure TMODELUserFunctionality__setSpaceSquare(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TMODELUserFunctionality(Functionality).setSpaceSquare(Value);
end;

function TMODELUserFunctionality__getMaxSpaceSquare(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getMaxSpaceSquare;
end;

procedure TMODELUserFunctionality__setMaxSpaceSquare(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setMaxSpaceSquare(Value);
end;

function TMODELUserFunctionality__getMaxSpaceSquarePerObject(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getMaxSpaceSquarePerObject;
end;

procedure TMODELUserFunctionality__setMaxSpaceSquarePerObject(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).setMaxSpaceSquarePerObject(Value);
end;

function TMODELUserFunctionality__getDisabled(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getDisabled;
end;

procedure TMODELUserFunctionality__setDisabled(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TMODELUserFunctionality(Functionality).setDisabled(Value);
end;

procedure TMODELUserFunctionality__CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).CheckUserOperation(idOperation);
end;

procedure TMODELUserFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TMODELUserFunctionality(Functionality)._ToClone(idClone);
end;

function TMODELUserFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).CanDestroy(Reason);
end;

function TMODELUserFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMODELUserFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).getHint;
end;

function TMODELUserFunctionality__GetActiveStateInfo(Functionality: TFunctionality;   out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).GetActiveStateInfo(ProxySpaceID,ProxySpaceIP,ProxySpaceState);
end;

procedure TMODELUserFunctionality__GetSecurityKeysList(Functionality: TFunctionality;   out SecurityKeys: TList); stdcall;
begin
TMODELUserFunctionality(Functionality).GetSecurityKeysList(SecurityKeys);
end;

function TMODELUserFunctionality__SecurityKeys_IsKeyExist(Functionality: TFunctionality;   const idSecurityKey: integer): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).SecurityKeys_IsKeyExist(idSecurityKey);
end;

procedure TMODELUserFunctionality__SecurityKeys_Insert(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).SecurityKeys_Insert(idSecurityKey);
end;

procedure TMODELUserFunctionality__SecurityKeys_Delete(Functionality: TFunctionality;   const idSecurityKey: integer); stdcall;
begin
TMODELUserFunctionality(Functionality).SecurityKeys_Delete(idSecurityKey);
end;

function TMODELUserFunctionality__HaveUnreadMessages(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TMODELUserFunctionality(Functionality).HaveUnreadMessages;
end;

procedure TMODELUserFunctionality__GetMessages(Functionality: TFunctionality;   const flUnreadOnly: boolean; out MessageList: TList); stdcall;
begin
TMODELUserFunctionality(Functionality).GetMessages(flUnreadOnly,MessageList);
end;


{TTTextureFunctionality}
function TTTextureFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTextureFunctionality(Functionality)._CreateInstance;
end;

procedure TTTextureFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTextureFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTextureFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTextureFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTextureFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTTextureFunctionality(Functionality).getName;
end;

function TTTextureFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTextureFunctionality(Functionality).getImage;
end;

procedure TTTextureFunctionality__GetInstanceListMatchingBy(Functionality: TFunctionality;   const NameContext: string; var List: TList); stdcall;
begin
TTTextureFunctionality(Functionality).GetInstanceListMatchingBy(NameContext,List);
end;


{TTextureFunctionality}
procedure TTextureFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TTextureFunctionality(Functionality).setName(Value);
end;

procedure TTextureFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TTextureFunctionality(Functionality)._ToClone(idClone);
end;

function TTextureFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TTextureFunctionality(Functionality).CanDestroy(Reason);
end;

function TTextureFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTextureFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTextureFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTextureFunctionality(Functionality).getName;
end;

function TTextureFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTextureFunctionality(Functionality).getHint;
end;

procedure TTextureFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType); stdcall;
begin
TTextureFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TTextureFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TTextureDATAType); stdcall;
begin
TTextureFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TTextureFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;
begin
TTextureFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;

procedure TTextureFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TTextureFunctionality(Functionality).LoadFromFile(FileName);
end;


{TTBuffered3DVisualizationFunctionality}
function TTBuffered3DVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTBuffered3DVisualizationFunctionality__ImportInstance(Functionality: TFunctionality;   ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).ImportInstance(ComponentNode,PropsPanelsList,ComponentsFilesList);
end;

function TTBuffered3DVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTBuffered3DVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).getName;
end;

function TTBuffered3DVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).getImage;
end;

function TTBuffered3DVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTBuffered3DVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTBuffered3DVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TBuffered3DVisualizationFunctionality}
function TBuffered3DVisualizationFunctionality__getDATAFileID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).getDATAFileID;
end;

procedure TBuffered3DVisualizationFunctionality__setDATAFileID(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).setDATAFileID(Value);
end;

procedure TBuffered3DVisualizationFunctionality__DATAFile_Clear(Functionality: TFunctionality); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).DATAFile_Clear;
end;

function TBuffered3DVisualizationFunctionality__GetMeshesNodesApproximator(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix): TNodesApproximator; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).GetMeshesNodesApproximator(TransforMatrix);
end;

procedure TBuffered3DVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TBuffered3DVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TBuffered3DVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBuffered3DVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TBuffered3DVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).getName;
end;

function TBuffered3DVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).getHint;
end;

procedure TBuffered3DVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TBuffered3DVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TBuffered3DVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;

procedure TBuffered3DVisualizationFunctionality__GetExportDATA(Functionality: TFunctionality;   Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).GetExportDATA(Document,ParentNode,PropsPanelsList,ComponentsFilesList);
end;

procedure TBuffered3DVisualizationFunctionality__ReflectInScene(Functionality: TFunctionality;   Scene: TScene); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).ReflectInScene(Scene);
end;

procedure TBuffered3DVisualizationFunctionality__GetData(Functionality: TFunctionality;   out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Extended; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Extended); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).GetData(vMeshes,vptrTransforMatrix,vScale,vTranslate_X,vTranslate_Y,vTranslate_Z,vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ);
end;

procedure TBuffered3DVisualizationFunctionality__Update(Functionality: TFunctionality); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).Update;
end;

procedure TBuffered3DVisualizationFunctionality__LoadFromStream(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TComponentFileType); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).LoadFromStream(DATAStream,DATAType);
end;

procedure TBuffered3DVisualizationFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TBuffered3DVisualizationFunctionality__Get__Translate_XY(Functionality: TFunctionality;   out vTranslate_X,vTranslate_Y: Extended); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).Get__Translate_XY(vTranslate_X,vTranslate_Y);
end;

procedure TBuffered3DVisualizationFunctionality__SetPropertiesLocal(Functionality: TFunctionality;   const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Extended); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).SetPropertiesLocal(pScale,pTranslate_X,pTranslate_Y,pTranslate_Z,pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ);
end;

function TBuffered3DVisualizationFunctionality__GetMinMax(Functionality: TFunctionality;   const TransforMatrix: TTransforMatrix; var Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Extended): boolean; stdcall;
begin
Result:=TBuffered3DVisualizationFunctionality(Functionality).GetMinMax(TransforMatrix,Xmin,Ymin,Zmin,Xmax,Ymax,Zmax);
end;

procedure TBuffered3DVisualizationFunctionality__UpdateXOYProjection(Functionality: TFunctionality); stdcall;
begin
TBuffered3DVisualizationFunctionality(Functionality).UpdateXOYProjection;
end;


{TTDATAFileFunctionality}
function TTDATAFileFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDATAFileFunctionality(Functionality)._CreateInstance;
end;

procedure TTDATAFileFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDATAFileFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDATAFileFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDATAFileFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDATAFileFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTDATAFileFunctionality(Functionality).getName;
end;

function TTDATAFileFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDATAFileFunctionality(Functionality).getImage;
end;


{TDATAFileFunctionality}
procedure TDATAFileFunctionality__GetDATA(Functionality: TFunctionality;   out Value: TMemoryStream); stdcall;
begin
TDATAFileFunctionality(Functionality).GetDATA(Value);
end;

procedure TDATAFileFunctionality__SetDATA(Functionality: TFunctionality;   Value: TMemoryStream); stdcall;
begin
TDATAFileFunctionality(Functionality).SetDATA(Value);
end;

function TDATAFileFunctionality__getDATAType(Functionality: TFunctionality): string; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).getDATAType;
end;

procedure TDATAFileFunctionality__setDATAType(Functionality: TFunctionality;   Value: string); stdcall;
begin
TDATAFileFunctionality(Functionality).setDATAType(Value);
end;

procedure TDATAFileFunctionality__Check(Functionality: TFunctionality); stdcall;
begin
TDATAFileFunctionality(Functionality).Check;
end;

procedure TDATAFileFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TDATAFileFunctionality(Functionality)._ToClone(idClone);
end;

function TDATAFileFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).CanDestroy(Reason);
end;

function TDATAFileFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDATAFileFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).getName;
end;

function TDATAFileFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).getHint;
end;

procedure TDATAFileFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer); stdcall;
begin
TDATAFileFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TDATAFileFunctionality__IsNull(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TDATAFileFunctionality(Functionality).IsNull;
end;

procedure TDATAFileFunctionality__Empty(Functionality: TFunctionality); stdcall;
begin
TDATAFileFunctionality(Functionality).Empty;
end;

procedure TDATAFileFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TDATAFileFunctionality(Functionality).LoadFromFile(FileName);
end;

procedure TDATAFileFunctionality__SaveToFile(Functionality: TFunctionality;   var FileName: string); stdcall;
begin
TDATAFileFunctionality(Functionality).SaveToFile(FileName);
end;

procedure TDATAFileFunctionality__Activate(Functionality: TFunctionality); stdcall;
begin
TDATAFileFunctionality(Functionality).Activate;
end;


{TTCoComponentFunctionality}
function TTCoComponentFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoComponentFunctionality(Functionality)._CreateInstance;
end;

procedure TTCoComponentFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCoComponentFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCoComponentFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoComponentFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoComponentFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTCoComponentFunctionality(Functionality).getName;
end;

function TTCoComponentFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoComponentFunctionality(Functionality).getImage;
end;

procedure TTCoComponentFunctionality__GetInstanceListByCoType(Functionality: TFunctionality;   const idCoType: integer; out InstanceList: TList); stdcall;
begin
TTCoComponentFunctionality(Functionality).GetInstanceListByCoType(idCoType,InstanceList);
end;


{TCoComponentFunctionality}
procedure TCoComponentFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TCoComponentFunctionality(Functionality)._ToClone(idClone);
end;

function TCoComponentFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).CanDestroy(Reason);
end;

function TCoComponentFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).getName;
end;

function TCoComponentFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).getHint;
end;

procedure TCoComponentFunctionality__Notify(Functionality: TFunctionality;   const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer); stdcall;
begin
TCoComponentFunctionality(Functionality).Notify(NotifyType,pidTObj,pidObj);
end;

function TCoComponentFunctionality__idCoType(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).idCoType;
end;

function TCoComponentFunctionality__GetIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;
begin
Result:=TCoComponentFunctionality(Functionality).GetIconImage(Image);
end;


{TTCoComponentTypeMarkerFunctionality}
function TTCoComponentTypeMarkerFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoComponentTypeMarkerFunctionality(Functionality)._CreateInstance;
end;

procedure TTCoComponentTypeMarkerFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCoComponentTypeMarkerFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCoComponentTypeMarkerFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoComponentTypeMarkerFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoComponentTypeMarkerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTCoComponentTypeMarkerFunctionality(Functionality).getName;
end;

function TTCoComponentTypeMarkerFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoComponentTypeMarkerFunctionality(Functionality).getImage;
end;


{TCoComponentTypeMarkerFunctionality}
procedure TCoComponentTypeMarkerFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TCoComponentTypeMarkerFunctionality(Functionality).setName(Value);
end;

function TCoComponentTypeMarkerFunctionality__getIDCoComponentType(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).getIDCoComponentType;
end;

function TCoComponentTypeMarkerFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

procedure TCoComponentTypeMarkerFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TCoComponentTypeMarkerFunctionality(Functionality)._ToClone(idClone);
end;

function TCoComponentTypeMarkerFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).CanDestroy(Reason);
end;

function TCoComponentTypeMarkerFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentTypeMarkerFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).getName;
end;

function TCoComponentTypeMarkerFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).getHint;
end;

function TCoComponentTypeMarkerFunctionality__GetTypeIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;
begin
Result:=TCoComponentTypeMarkerFunctionality(Functionality).GetTypeIconImage(Image);
end;


{TTCoComponentTypeFunctionality}
function TTCoComponentTypeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCoComponentTypeFunctionality(Functionality)._CreateInstance;
end;

procedure TTCoComponentTypeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCoComponentTypeFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCoComponentTypeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCoComponentTypeFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCoComponentTypeFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTCoComponentTypeFunctionality(Functionality).getName;
end;

function TTCoComponentTypeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCoComponentTypeFunctionality(Functionality).getImage;
end;


{TCoComponentTypeFunctionality}
procedure TCoComponentTypeFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).setName(Value);
end;

function TCoComponentTypeFunctionality__getUID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getUID;
end;

function TCoComponentTypeFunctionality__getDateCreated(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getDateCreated;
end;

procedure TCoComponentTypeFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TCoComponentTypeFunctionality(Functionality)._ToClone(idClone);
end;

function TCoComponentTypeFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).CanDestroy(Reason);
end;

function TCoComponentTypeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCoComponentTypeFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getName;
end;

function TCoComponentTypeFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).getHint;
end;

procedure TCoComponentTypeFunctionality__GetDescription(Functionality: TFunctionality;   Value: TStrings); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).GetDescription(Value);
end;

procedure TCoComponentTypeFunctionality__SetDescription(Functionality: TFunctionality;   Value: TStrings); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).SetDescription(Value);
end;

procedure TCoComponentTypeFunctionality__GetMarkersList(Functionality: TFunctionality;   var List: TList); stdcall;
begin
TCoComponentTypeFunctionality(Functionality).GetMarkersList(List);
end;

function TCoComponentTypeFunctionality__GetIconImage(Functionality: TFunctionality;   out Image: TBitmap): boolean; stdcall;
begin
Result:=TCoComponentTypeFunctionality(Functionality).GetIconImage(Image);
end;


{TTAddressFunctionality}
function TTAddressFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTAddressFunctionality(Functionality)._CreateInstance;
end;

procedure TTAddressFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTAddressFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTAddressFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTAddressFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTAddressFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTAddressFunctionality(Functionality).getName;
end;

function TTAddressFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTAddressFunctionality(Functionality).getImage;
end;

procedure TTAddressFunctionality__Points_GetTypeNames(Functionality: TFunctionality;   var List: TStringList); stdcall;
begin
TTAddressFunctionality(Functionality).Points_GetTypeNames(List);
end;

procedure TTAddressFunctionality__Streets_GetTypeNames(Functionality: TFunctionality;   var List: TStringList); stdcall;
begin
TTAddressFunctionality(Functionality).Streets_GetTypeNames(List);
end;


{TAddressFunctionality}
procedure TAddressFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TAddressFunctionality(Functionality)._ToClone(idClone);
end;

function TAddressFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TAddressFunctionality(Functionality).CanDestroy(Reason);
end;

function TAddressFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TAddressFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TAddressFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getName;
end;

function TAddressFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getHint;
end;

function TAddressFunctionality__getIdPoint(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getIdPoint;
end;

procedure TAddressFunctionality__setIdPoint(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TAddressFunctionality(Functionality).setIdPoint(Value);
end;

function TAddressFunctionality__getPoint(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getPoint;
end;

function TAddressFunctionality__getIdStreet(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getIdStreet;
end;

procedure TAddressFunctionality__setIdStreet(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TAddressFunctionality(Functionality).setIdStreet(Value);
end;

function TAddressFunctionality__getStreet(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getStreet;
end;

function TAddressFunctionality__getHouse(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getHouse;
end;

procedure TAddressFunctionality__setHouse(Functionality: TFunctionality;   Value: string); stdcall;
begin
TAddressFunctionality(Functionality).setHouse(Value);
end;

function TAddressFunctionality__getCorps(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getCorps;
end;

procedure TAddressFunctionality__setCorps(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TAddressFunctionality(Functionality).setCorps(Value);
end;

function TAddressFunctionality__getApartment(Functionality: TFunctionality): string; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getApartment;
end;

procedure TAddressFunctionality__setApartment(Functionality: TFunctionality;   Value: string); stdcall;
begin
TAddressFunctionality(Functionality).setApartment(Value);
end;

function TAddressFunctionality__getEntrance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TAddressFunctionality(Functionality).getEntrance;
end;

procedure TAddressFunctionality__setEntrance(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TAddressFunctionality(Functionality).setEntrance(Value);
end;


{TTTransportRouteFunctionality}
function TTTransportRouteFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTransportRouteFunctionality(Functionality)._CreateInstance;
end;

procedure TTTransportRouteFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTransportRouteFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTransportRouteFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTransportRouteFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTransportRouteFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTTransportRouteFunctionality(Functionality).getName;
end;

function TTTransportRouteFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTransportRouteFunctionality(Functionality).getImage;
end;

procedure TTTransportRouteFunctionality__GetInstanceList(Functionality: TFunctionality;   var List: TList); stdcall;
begin
TTTransportRouteFunctionality(Functionality).GetInstanceList(List);
end;


{TTransportRouteFunctionality}
procedure TTransportRouteFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality)._ToClone(idClone);
end;

function TTransportRouteFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).CanDestroy(Reason);
end;

function TTransportRouteFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportRouteFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getName;
end;

procedure TTransportRouteFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TTransportRouteFunctionality(Functionality).setName(Value);
end;

function TTransportRouteFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getHint;
end;

function TTransportRouteFunctionality__getidTTransport(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getidTTransport;
end;

procedure TTransportRouteFunctionality__setidTTransport(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality).setidTTransport(Value);
end;

function TTransportRouteFunctionality__getValid(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getValid;
end;

procedure TTransportRouteFunctionality__setValid(Functionality: TFunctionality;   Value: boolean); stdcall;
begin
TTransportRouteFunctionality(Functionality).setValid(Value);
end;

function TTransportRouteFunctionality__getRemarks(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).getRemarks;
end;

procedure TTransportRouteFunctionality__setRemarks(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TTransportRouteFunctionality(Functionality).setRemarks(Value);
end;

function TTransportRouteFunctionality__IsNodesExist(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).IsNodesExist;
end;

procedure TTransportRouteFunctionality__Nodes_GetList(Functionality: TFunctionality;   var List: TRouteNodesList); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes_GetList(List);
end;

function TTransportRouteFunctionality__Nodes_IsNodeExist(Functionality: TFunctionality;   const idNode: integer): boolean; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).Nodes_IsNodeExist(idNode);
end;

procedure TTransportRouteFunctionality__Nodes_ChangeNodeOrder(Functionality: TFunctionality;   const idItem: integer; const Order: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes_ChangeNodeOrder(idItem,Order);
end;

function TTransportRouteFunctionality__Nodes__Node_DistanceBefore(Functionality: TFunctionality;   const idItem: integer): integer; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).Nodes__Node_DistanceBefore(idItem);
end;

procedure TTransportRouteFunctionality__Nodes__Node_SetDistanceBefore(Functionality: TFunctionality;   const idItem: integer; const D: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes__Node_SetDistanceBefore(idItem,D);
end;

function TTransportRouteFunctionality__Nodes__Node_OrderPrice(Functionality: TFunctionality;   const idItem: integer): shortstring; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).Nodes__Node_OrderPrice(idItem);
end;

procedure TTransportRouteFunctionality__Nodes__Node_SetOrderPrice(Functionality: TFunctionality;   const idItem: integer; const Price: shortstring); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes__Node_SetOrderPrice(idItem,Price);
end;

function TTransportRouteFunctionality__Nodes_Insert(Functionality: TFunctionality;   const idNode: integer): integer; stdcall;
begin
Result:=TTransportRouteFunctionality(Functionality).Nodes_Insert(idNode);
end;

procedure TTransportRouteFunctionality__Nodes_Remove(Functionality: TFunctionality;   const idItem: integer); stdcall;
begin
TTransportRouteFunctionality(Functionality).Nodes_Remove(idItem);
end;


{TTTransportNodeFunctionality}
function TTTransportNodeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTransportNodeFunctionality(Functionality)._CreateInstance;
end;

procedure TTTransportNodeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTransportNodeFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTransportNodeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTransportNodeFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTransportNodeFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTTransportNodeFunctionality(Functionality).getName;
end;

function TTTransportNodeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTransportNodeFunctionality(Functionality).getImage;
end;

procedure TTTransportNodeFunctionality__GetInstanceList(Functionality: TFunctionality;   var List: TList); stdcall;
begin
TTTransportNodeFunctionality(Functionality).GetInstanceList(List);
end;


{TTransportNodeFunctionality}
procedure TTransportNodeFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TTransportNodeFunctionality(Functionality)._ToClone(idClone);
end;

function TTransportNodeFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).CanDestroy(Reason);
end;

function TTransportNodeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTransportNodeFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).getName;
end;

procedure TTransportNodeFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TTransportNodeFunctionality(Functionality).setName(Value);
end;

function TTransportNodeFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).getHint;
end;

function TTransportNodeFunctionality__IsRoutesExist(Functionality: TFunctionality): boolean; stdcall;
begin
Result:=TTransportNodeFunctionality(Functionality).IsRoutesExist;
end;


{TTOfferGoodsFunctionality}
function TTOfferGoodsFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOfferGoodsFunctionality(Functionality)._CreateInstance;
end;

procedure TTOfferGoodsFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTOfferGoodsFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTOfferGoodsFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOfferGoodsFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOfferGoodsFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTOfferGoodsFunctionality(Functionality).getName;
end;

function TTOfferGoodsFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOfferGoodsFunctionality(Functionality).getImage;
end;


{TOfferGoodsFunctionality}
function TOfferGoodsFunctionality__getIdGoods(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getIdGoods;
end;

procedure TOfferGoodsFunctionality__setIdGoods(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setIdGoods(Value);
end;

function TOfferGoodsFunctionality__getAmount(Functionality: TFunctionality): Extended; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getAmount;
end;

procedure TOfferGoodsFunctionality__setAmount(Functionality: TFunctionality;   Value: Extended); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setAmount(Value);
end;

function TOfferGoodsFunctionality__getIdMeasureUnit(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getIdMeasureUnit;
end;

procedure TOfferGoodsFunctionality__setIdMeasureUnit(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setIdMeasureUnit(Value);
end;

function TOfferGoodsFunctionality__getMeasureUnit(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getMeasureUnit;
end;

function TOfferGoodsFunctionality__getMinPrice(Functionality: TFunctionality): Currency; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getMinPrice;
end;

procedure TOfferGoodsFunctionality__setMinPrice(Functionality: TFunctionality;   Value: Currency); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setMinPrice(Value);
end;

function TOfferGoodsFunctionality__getMisc(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getMisc;
end;

procedure TOfferGoodsFunctionality__setMisc(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOfferGoodsFunctionality(Functionality).setMisc(Value);
end;

procedure TOfferGoodsFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOfferGoodsFunctionality(Functionality)._ToClone(idClone);
end;

function TOfferGoodsFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TOfferGoodsFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).CanDestroy(Reason);
end;

function TOfferGoodsFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOfferGoodsFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getName;
end;

function TOfferGoodsFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).getHint;
end;

procedure TOfferGoodsFunctionality__CheckUserOperation(Functionality: TFunctionality;   const idOperation: integer); stdcall;
begin
TOfferGoodsFunctionality(Functionality).CheckUserOperation(idOperation);
end;

function TOfferGoodsFunctionality__idOffer(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferGoodsFunctionality(Functionality).idOffer;
end;


{TMeasureUnitFunctionality}
function TMeasureUnitFunctionality__getName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TMeasureUnitFunctionality(Functionality).getName;
end;


{TTTLFStationTMTFunctionality}
function TTTLFStationTMTFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTLFStationTMTFunctionality(Functionality)._CreateInstance;
end;

procedure TTTLFStationTMTFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTTLFStationTMTFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTTLFStationTMTFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTLFStationTMTFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

procedure TTTLFStationTMTFunctionality__GetInstanceList(Functionality: TFunctionality;   var List: TList); stdcall;
begin
TTTLFStationTMTFunctionality(Functionality).GetInstanceList(List);
end;

function TTTLFStationTMTFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTTLFStationTMTFunctionality(Functionality).getName;
end;

function TTTLFStationTMTFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTLFStationTMTFunctionality(Functionality).getImage;
end;


{TTLFStationTMTFunctionality}
function TTLFStationTMTFunctionality__getHostName(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).getHostName;
end;

procedure TTLFStationTMTFunctionality__setHostName(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTLFStationTMTFunctionality(Functionality).setHostName(Value);
end;

function TTLFStationTMTFunctionality__getTestChanel(Functionality: TFunctionality): string; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).getTestChanel;
end;

procedure TTLFStationTMTFunctionality__setTestChanel(Functionality: TFunctionality;   Value: string); stdcall;
begin
TTLFStationTMTFunctionality(Functionality).setTestChanel(Value);
end;

procedure TTLFStationTMTFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TTLFStationTMTFunctionality(Functionality)._ToClone(idClone);
end;

function TTLFStationTMTFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).CanDestroy(Reason);
end;

function TTLFStationTMTFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTLFStationTMTFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).getName;
end;

function TTLFStationTMTFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTLFStationTMTFunctionality(Functionality).getHint;
end;


{TTNameFunctionality}
function TTNameFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTNameFunctionality(Functionality)._CreateInstance;
end;

procedure TTNameFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTNameFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTNameFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTNameFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTNameFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTNameFunctionality(Functionality).getName;
end;

function TTNameFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTNameFunctionality(Functionality).getImage;
end;


{TNameFunctionality}
procedure TNameFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TNameFunctionality(Functionality)._ToClone(idClone);
end;

function TNameFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TNameFunctionality(Functionality).CanDestroy(Reason);
end;

function TNameFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TNameFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TNameFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TNameFunctionality(Functionality).getName;
end;

function TNameFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TNameFunctionality(Functionality).getHint;
end;

function TNameFunctionality__Value(Functionality: TFunctionality): string; stdcall;
begin
Result:=TNameFunctionality(Functionality).Value;
end;

procedure TNameFunctionality__SetValue(Functionality: TFunctionality;   const NewValue: shortstring); stdcall;
begin
TNameFunctionality(Functionality).SetValue(NewValue);
end;


{TTVisualizationFunctionality}
function TTVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality).getName;
end;

function TTVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality).getImage;
end;

function TTVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TVisualizationFunctionality}
procedure TVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

function TVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).getName;
end;

function TVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).getHint;
end;

procedure TVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;


{TTTTFVisualizationFunctionality}
function TTTTFVisualizationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality)._CreateInstance;
end;

function TTTTFVisualizationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTTTFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality).getName;
end;

function TTTTFVisualizationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality).getImage;
end;

function TTTTFVisualizationFunctionality___CreateInstanceEx(Functionality: TFunctionality;   pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality)._CreateInstanceEx(pObjectVisualization,ptrOwner);
end;

function TTTTFVisualizationFunctionality__StdObjectVisualization(Functionality: TFunctionality): TObjectVisualization; stdcall;
begin
Result:=TTTTFVisualizationFunctionality(Functionality).StdObjectVisualization;
end;


{TTTFVisualizationFunctionality}
function TTTFVisualizationFunctionality__getStr(Functionality: TFunctionality): TStringTTFVisualization; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).getStr;
end;

procedure TTTFVisualizationFunctionality__setStr(Functionality: TFunctionality;   const Value: TStringTTFVisualization); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).setStr(Value);
end;

procedure TTTFVisualizationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TTTFVisualizationFunctionality(Functionality)._ToClone(idClone);
end;

function TTTFVisualizationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).CanDestroy(Reason);
end;

function TTTFVisualizationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TTTFVisualizationFunctionality__GetOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).GetOwner(idTOwner,idOwner);
end;

procedure TTTFVisualizationFunctionality__DoOnChangeScale(Functionality: TFunctionality;   const ChangeCoef: Extended); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).DoOnChangeScale(ChangeCoef);
end;

function TTTFVisualizationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).getName;
end;

function TTTFVisualizationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).getHint;
end;

procedure TTTFVisualizationFunctionality__DestroyData(Functionality: TFunctionality); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).DestroyData;
end;

procedure TTTFVisualizationFunctionality__CloneData(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TTTFVisualizationFunctionality(Functionality).CloneData(idClone);
end;

function TTTFVisualizationFunctionality__Reflect(Functionality: TFunctionality;   pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean; stdcall;
begin
Result:=TTTFVisualizationFunctionality(Functionality).Reflect(pFigure,pAdditionalFigure,pReflectionWindow,pAttractionWindow,pCanvas);
end;


{TTObjectFunctionality}
function TTObjectFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTObjectFunctionality(Functionality)._CreateInstance;
end;

procedure TTObjectFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTObjectFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTObjectFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTObjectFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTObjectFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTObjectFunctionality(Functionality).getName;
end;

function TTObjectFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTObjectFunctionality(Functionality).getImage;
end;


{TObjectFunctionality}
procedure TObjectFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TObjectFunctionality(Functionality)._ToClone(idClone);
end;

function TObjectFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TObjectFunctionality(Functionality).CanDestroy(Reason);
end;

function TObjectFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TObjectFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TObjectFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TObjectFunctionality(Functionality).getName;
end;

function TObjectFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TObjectFunctionality(Functionality).getHint;
end;


{TTLabelFunctionality}
function TTLabelFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTLabelFunctionality(Functionality)._CreateInstance;
end;

procedure TTLabelFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTLabelFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTLabelFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTLabelFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTLabelFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTLabelFunctionality(Functionality).getName;
end;

function TTLabelFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTLabelFunctionality(Functionality).getImage;
end;


{TLabelFunctionality}
procedure TLabelFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TLabelFunctionality(Functionality)._ToClone(idClone);
end;

function TLabelFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TLabelFunctionality(Functionality).CanDestroy(Reason);
end;

function TLabelFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TLabelFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLabelFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TLabelFunctionality(Functionality).getName;
end;

function TLabelFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TLabelFunctionality(Functionality).getHint;
end;


{TTStationFunctionality}
function TTStationFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTStationFunctionality(Functionality)._CreateInstance;
end;

procedure TTStationFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTStationFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTStationFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTStationFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

procedure TTStationFunctionality__GetInstanceList(Functionality: TFunctionality;   var List: TList); stdcall;
begin
TTStationFunctionality(Functionality).GetInstanceList(List);
end;

function TTStationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTStationFunctionality(Functionality).getName;
end;

function TTStationFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTStationFunctionality(Functionality).getImage;
end;


{TStationFunctionality}
procedure TStationFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TStationFunctionality(Functionality)._ToClone(idClone);
end;

function TStationFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TStationFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TStationFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TStationFunctionality(Functionality).CanDestroy(Reason);
end;

function TStationFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TStationFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TStationFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TStationFunctionality(Functionality).getName;
end;

function TStationFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TStationFunctionality(Functionality).getHint;
end;

procedure TStationFunctionality__GetNumbersBound(Functionality: TFunctionality;   var BegNumber,EndNumber: integer); stdcall;
begin
TStationFunctionality(Functionality).GetNumbersBound(BegNumber,EndNumber);
end;


{TTMainLineFunctionality}
function TTMainLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMainLineFunctionality(Functionality)._CreateInstance;
end;

procedure TTMainLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMainLineFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMainLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMainLineFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMainLineFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTMainLineFunctionality(Functionality).getName;
end;

function TTMainLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMainLineFunctionality(Functionality).getImage;
end;


{TMainLineFunctionality}
procedure TMainLineFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TMainLineFunctionality(Functionality)._ToClone(idClone);
end;

function TMainLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TMainLineFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).CanDestroy(Reason);
end;

function TMainLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMainLineFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).getName;
end;

function TMainLineFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).getHint;
end;

function TMainLineFunctionality__GetSTNOwner(Functionality: TFunctionality;   var idTOwner,idOwner: integer): boolean; stdcall;
begin
Result:=TMainLineFunctionality(Functionality).GetSTNOwner(idTOwner,idOwner);
end;


{TTDescriptionFunctionality}
function TTDescriptionFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDescriptionFunctionality(Functionality)._CreateInstance;
end;

procedure TTDescriptionFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDescriptionFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDescriptionFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDescriptionFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDescriptionFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTDescriptionFunctionality(Functionality).getName;
end;

function TTDescriptionFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDescriptionFunctionality(Functionality).getImage;
end;


{TDescriptionFunctionality}
procedure TDescriptionFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TDescriptionFunctionality(Functionality)._ToClone(idClone);
end;

function TDescriptionFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TDescriptionFunctionality(Functionality).CanDestroy(Reason);
end;

function TDescriptionFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDescriptionFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDescriptionFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TDescriptionFunctionality(Functionality).getName;
end;

function TDescriptionFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TDescriptionFunctionality(Functionality).getHint;
end;

procedure TDescriptionFunctionality__GetValue(Functionality: TFunctionality;   vText: TStrings); stdcall;
begin
TDescriptionFunctionality(Functionality).GetValue(vText);
end;

procedure TDescriptionFunctionality__SetValue(Functionality: TFunctionality;   NewValue: TStrings); stdcall;
begin
TDescriptionFunctionality(Functionality).SetValue(NewValue);
end;


{TTImageFunctionality}
function TTImageFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTImageFunctionality(Functionality)._CreateInstance;
end;

procedure TTImageFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTImageFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTImageFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTImageFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTImageFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTImageFunctionality(Functionality).getName;
end;

function TTImageFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTImageFunctionality(Functionality).getImage;
end;


{TImageFunctionality}
procedure TImageFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TImageFunctionality(Functionality)._ToClone(idClone);
end;

function TImageFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TImageFunctionality(Functionality).CanDestroy(Reason);
end;

function TImageFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TImageFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TImageFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TImageFunctionality(Functionality).getName;
end;

function TImageFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TImageFunctionality(Functionality).getHint;
end;

procedure TImageFunctionality__GetDATA(Functionality: TFunctionality;   out DATAStream: TClientBlobStream; out DATAType: TImageDATAType); stdcall;
begin
TImageFunctionality(Functionality).GetDATA(DATAStream,DATAType);
end;

procedure TImageFunctionality__SetDATA(Functionality: TFunctionality;   DATAStream: TMemoryStream; const DATAType: TImageDATAType); stdcall;
begin
TImageFunctionality(Functionality).SetDATA(DATAStream,DATAType);
end;

procedure TImageFunctionality__GetBitmapDATA(Functionality: TFunctionality;   out BMPDATAStream: TMemoryStream); stdcall;
begin
TImageFunctionality(Functionality).GetBitmapDATA(BMPDATAStream);
end;

procedure TImageFunctionality__LoadFromFile(Functionality: TFunctionality;   const FileName: string); stdcall;
begin
TImageFunctionality(Functionality).LoadFromFile(FileName);
end;


{TTWellFunctionality}
function TTWellFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTWellFunctionality(Functionality)._CreateInstance;
end;

procedure TTWellFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTWellFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTWellFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTWellFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTWellFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTWellFunctionality(Functionality).getName;
end;

function TTWellFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTWellFunctionality(Functionality).getImage;
end;


{TWellFunctionality}
procedure TWellFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TWellFunctionality(Functionality)._ToClone(idClone);
end;

function TWellFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TWellFunctionality(Functionality).CanDestroy(Reason);
end;

function TWellFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TWellFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TWellFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TWellFunctionality(Functionality).getName;
end;

function TWellFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TWellFunctionality(Functionality).getHint;
end;


{TTBoxFunctionality}
function TTBoxFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTBoxFunctionality(Functionality)._CreateInstance;
end;

procedure TTBoxFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTBoxFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTBoxFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTBoxFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTBoxFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTBoxFunctionality(Functionality).getName;
end;

function TTBoxFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTBoxFunctionality(Functionality).getImage;
end;


{TBoxFunctionality}
procedure TBoxFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TBoxFunctionality(Functionality)._ToClone(idClone);
end;

function TBoxFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TBoxFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TBoxFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TBoxFunctionality(Functionality).CanDestroy(Reason);
end;

function TBoxFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TBoxFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TBoxFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TBoxFunctionality(Functionality).getName;
end;

function TBoxFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TBoxFunctionality(Functionality).getHint;
end;


{TTCableBoxFunctionality}
function TTCableBoxFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCableBoxFunctionality(Functionality)._CreateInstance;
end;

procedure TTCableBoxFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCableBoxFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCableBoxFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCableBoxFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCableBoxFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTCableBoxFunctionality(Functionality).getName;
end;

function TTCableBoxFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCableBoxFunctionality(Functionality).getImage;
end;


{TCableBoxFunctionality}
procedure TCableBoxFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TCableBoxFunctionality(Functionality)._ToClone(idClone);
end;

function TCableBoxFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TCableBoxFunctionality(Functionality).CanDestroy(Reason);
end;

function TCableBoxFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCableBoxFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCableBoxFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCableBoxFunctionality(Functionality).getName;
end;

function TCableBoxFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCableBoxFunctionality(Functionality).getHint;
end;


{TTDistrLineFunctionality}
function TTDistrLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDistrLineFunctionality(Functionality)._CreateInstance;
end;

procedure TTDistrLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDistrLineFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDistrLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDistrLineFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDistrLineFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTDistrLineFunctionality(Functionality).getName;
end;

function TTDistrLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDistrLineFunctionality(Functionality).getImage;
end;


{TDistrLineFunctionality}
procedure TDistrLineFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TDistrLineFunctionality(Functionality)._ToClone(idClone);
end;

function TDistrLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TDistrLineFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).CanDestroy(Reason);
end;

function TDistrLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDistrLineFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).getName;
end;

function TDistrLineFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TDistrLineFunctionality(Functionality).getHint;
end;


{TTClientFunctionality}
function TTClientFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTClientFunctionality(Functionality)._CreateInstance;
end;

procedure TTClientFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTClientFunctionality(Functionality)._DestroyInstance(idObj);
end;

procedure TTClientFunctionality__GetInstanceList(Functionality: TFunctionality;   var List: TList); stdcall;
begin
TTClientFunctionality(Functionality).GetInstanceList(List);
end;

function TTClientFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTClientFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTClientFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTClientFunctionality(Functionality).getName;
end;

function TTClientFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTClientFunctionality(Functionality).getImage;
end;


{TClientFunctionality}
procedure TClientFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TClientFunctionality(Functionality)._ToClone(idClone);
end;

function TClientFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TClientFunctionality(Functionality).CanDestroy(Reason);
end;

function TClientFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TClientFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TClientFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TClientFunctionality(Functionality).getName;
end;

function TClientFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TClientFunctionality(Functionality).getHint;
end;

function TClientFunctionality__GetDebet(Functionality: TFunctionality;   var Value: Double): boolean; stdcall;
begin
Result:=TClientFunctionality(Functionality).GetDebet(Value);
end;


{TTHouseFunctionality}
function TTHouseFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHouseFunctionality(Functionality)._CreateInstance;
end;

procedure TTHouseFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTHouseFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTHouseFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHouseFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHouseFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTHouseFunctionality(Functionality).getName;
end;

function TTHouseFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHouseFunctionality(Functionality).getImage;
end;


{THouseFunctionality}
procedure THouseFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
THouseFunctionality(Functionality)._ToClone(idClone);
end;

function THouseFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=THouseFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function THouseFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=THouseFunctionality(Functionality).CanDestroy(Reason);
end;

function THouseFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THouseFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THouseFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=THouseFunctionality(Functionality).getName;
end;

function THouseFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=THouseFunctionality(Functionality).getHint;
end;


{TTCommNodeFunctionality}
function TTCommNodeFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCommNodeFunctionality(Functionality)._CreateInstance;
end;

procedure TTCommNodeFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCommNodeFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCommNodeFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCommNodeFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCommNodeFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTCommNodeFunctionality(Functionality).getName;
end;

function TTCommNodeFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCommNodeFunctionality(Functionality).getImage;
end;


{TCommNodeFunctionality}
procedure TCommNodeFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TCommNodeFunctionality(Functionality)._ToClone(idClone);
end;

function TCommNodeFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TCommNodeFunctionality(Functionality).CanDestroy(Reason);
end;

function TCommNodeFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCommNodeFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCommNodeFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCommNodeFunctionality(Functionality).getName;
end;

function TCommNodeFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCommNodeFunctionality(Functionality).getHint;
end;


{TTCrossFunctionality}
function TTCrossFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCrossFunctionality(Functionality)._CreateInstance;
end;

procedure TTCrossFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCrossFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCrossFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCrossFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCrossFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTCrossFunctionality(Functionality).getName;
end;

function TTCrossFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCrossFunctionality(Functionality).getImage;
end;


{TCrossFunctionality}
procedure TCrossFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TCrossFunctionality(Functionality)._ToClone(idClone);
end;

function TCrossFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TCrossFunctionality(Functionality).CanDestroy(Reason);
end;

function TCrossFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCrossFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCrossFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCrossFunctionality(Functionality).getName;
end;

function TCrossFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCrossFunctionality(Functionality).getHint;
end;


{TTCaseFunctionality}
function TTCaseFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCaseFunctionality(Functionality)._CreateInstance;
end;

procedure TTCaseFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCaseFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCaseFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCaseFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCaseFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTCaseFunctionality(Functionality).getName;
end;

function TTCaseFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCaseFunctionality(Functionality).getImage;
end;


{TCaseFunctionality}
procedure TCaseFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TCaseFunctionality(Functionality)._ToClone(idClone);
end;

function TCaseFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TCaseFunctionality(Functionality).CanDestroy(Reason);
end;

function TCaseFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCaseFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCaseFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCaseFunctionality(Functionality).getName;
end;

function TCaseFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCaseFunctionality(Functionality).getHint;
end;


{TTStreetFunctionality}
function TTStreetFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTStreetFunctionality(Functionality)._CreateInstance;
end;

procedure TTStreetFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTStreetFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTStreetFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTStreetFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTStreetFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTStreetFunctionality(Functionality).getName;
end;

function TTStreetFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTStreetFunctionality(Functionality).getImage;
end;


{TStreetFunctionality}
procedure TStreetFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TStreetFunctionality(Functionality)._ToClone(idClone);
end;

function TStreetFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TStreetFunctionality(Functionality).CanDestroy(Reason);
end;

function TStreetFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TStreetFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TStreetFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TStreetFunctionality(Functionality).getName;
end;

function TStreetFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TStreetFunctionality(Functionality).getHint;
end;


{TTOtherObjFunctionality}
function TTOtherObjFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOtherObjFunctionality(Functionality)._CreateInstance;
end;

procedure TTOtherObjFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTOtherObjFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTOtherObjFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOtherObjFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOtherObjFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTOtherObjFunctionality(Functionality).getName;
end;

function TTOtherObjFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOtherObjFunctionality(Functionality).getImage;
end;


{TOtherObjFunctionality}
procedure TOtherObjFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOtherObjFunctionality(Functionality)._ToClone(idClone);
end;

function TOtherObjFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TOtherObjFunctionality(Functionality).CanDestroy(Reason);
end;

function TOtherObjFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOtherObjFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOtherObjFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOtherObjFunctionality(Functionality).getName;
end;

function TOtherObjFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOtherObjFunctionality(Functionality).getHint;
end;


{TTSpanFunctionality}
function TTSpanFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTSpanFunctionality(Functionality)._CreateInstance;
end;

procedure TTSpanFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTSpanFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTSpanFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTSpanFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTSpanFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTSpanFunctionality(Functionality).getName;
end;

function TTSpanFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTSpanFunctionality(Functionality).getImage;
end;


{TSpanFunctionality}
procedure TSpanFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TSpanFunctionality(Functionality)._ToClone(idClone);
end;

function TSpanFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TSpanFunctionality(Functionality).CanDestroy(Reason);
end;

function TSpanFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TSpanFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TSpanFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSpanFunctionality(Functionality).getName;
end;

function TSpanFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TSpanFunctionality(Functionality).getHint;
end;


{TTChanelFunctionality}
function TTChanelFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTChanelFunctionality(Functionality)._CreateInstance;
end;

procedure TTChanelFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTChanelFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTChanelFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTChanelFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTChanelFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTChanelFunctionality(Functionality).getName;
end;

function TTChanelFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTChanelFunctionality(Functionality).getImage;
end;


{TChanelFunctionality}
procedure TChanelFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TChanelFunctionality(Functionality)._ToClone(idClone);
end;

function TChanelFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TChanelFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TChanelFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TChanelFunctionality(Functionality).CanDestroy(Reason);
end;

function TChanelFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TChanelFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TChanelFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TChanelFunctionality(Functionality).getName;
end;

function TChanelFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TChanelFunctionality(Functionality).getHint;
end;


{TTHandHoldFunctionality}
function TTHandHoldFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTHandHoldFunctionality(Functionality)._CreateInstance;
end;

procedure TTHandHoldFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTHandHoldFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTHandHoldFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTHandHoldFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTHandHoldFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTHandHoldFunctionality(Functionality).getName;
end;

function TTHandHoldFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTHandHoldFunctionality(Functionality).getImage;
end;


{THandHoldFunctionality}
procedure THandHoldFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
THandHoldFunctionality(Functionality)._ToClone(idClone);
end;

function THandHoldFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=THandHoldFunctionality(Functionality).CanDestroy(Reason);
end;

function THandHoldFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=THandHoldFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function THandHoldFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=THandHoldFunctionality(Functionality).getName;
end;

function THandHoldFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=THandHoldFunctionality(Functionality).getHint;
end;


{TTLineDistFunctionality}
function TTLineDistFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTLineDistFunctionality(Functionality)._CreateInstance;
end;

procedure TTLineDistFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTLineDistFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTLineDistFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTLineDistFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTLineDistFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTLineDistFunctionality(Functionality).getName;
end;

function TTLineDistFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTLineDistFunctionality(Functionality).getImage;
end;


{TLineDistFunctionality}
procedure TLineDistFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TLineDistFunctionality(Functionality)._ToClone(idClone);
end;

function TLineDistFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TLineDistFunctionality(Functionality).CanDestroy(Reason);
end;

function TLineDistFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TLineDistFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TLineDistFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TLineDistFunctionality(Functionality).getName;
end;

function TLineDistFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TLineDistFunctionality(Functionality).getHint;
end;


{TTMuffFunctionality}
function TTMuffFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTMuffFunctionality(Functionality)._CreateInstance;
end;

procedure TTMuffFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTMuffFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTMuffFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTMuffFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTMuffFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTMuffFunctionality(Functionality).getName;
end;

function TTMuffFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTMuffFunctionality(Functionality).getImage;
end;


{TMuffFunctionality}
procedure TMuffFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TMuffFunctionality(Functionality)._ToClone(idClone);
end;

function TMuffFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TMuffFunctionality(Functionality).CanDestroy(Reason);
end;

function TMuffFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TMuffFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TMuffFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMuffFunctionality(Functionality).getName;
end;

function TMuffFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TMuffFunctionality(Functionality).getHint;
end;


{TTOfferFunctionality}
function TTOfferFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTOfferFunctionality(Functionality)._CreateInstance;
end;

procedure TTOfferFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTOfferFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTOfferFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTOfferFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTOfferFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTOfferFunctionality(Functionality).getName;
end;

function TTOfferFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTOfferFunctionality(Functionality).getImage;
end;

function TTOfferFunctionality__GetOfferByHumanID(Functionality: TFunctionality;   const HumanID: integer; out idOffer: integer): boolean; stdcall;
begin
Result:=TTOfferFunctionality(Functionality).GetOfferByHumanID(HumanID,idOffer);
end;


{TOfferFunctionality}
procedure TOfferFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TOfferFunctionality(Functionality)._ToClone(idClone);
end;

function TOfferFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TOfferFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TOfferFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TOfferFunctionality(Functionality).CanDestroy(Reason);
end;

function TOfferFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TOfferFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TOfferFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getName;
end;

procedure TOfferFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TOfferFunctionality(Functionality).setName(Value);
end;

function TOfferFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getHint;
end;

function TOfferFunctionality__getSchedule(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getSchedule;
end;

procedure TOfferFunctionality__setSchedule(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TOfferFunctionality(Functionality).setSchedule(Value);
end;

function TOfferFunctionality__getPassword(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getPassword;
end;

procedure TOfferFunctionality__setPassword(Functionality: TFunctionality;   Value: string); stdcall;
begin
TOfferFunctionality(Functionality).setPassword(Value);
end;

function TOfferFunctionality__getContactTLF(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getContactTLF;
end;

procedure TOfferFunctionality__setContactTLF(Functionality: TFunctionality;   Value: integer); stdcall;
begin
TOfferFunctionality(Functionality).setContactTLF(Value);
end;

function TOfferFunctionality__getLastUpdated(Functionality: TFunctionality): TDateTime; stdcall;
begin
Result:=TOfferFunctionality(Functionality).getLastUpdated;
end;

procedure TOfferFunctionality__setLastUpdated(Functionality: TFunctionality;   Value: TDateTime); stdcall;
begin
TOfferFunctionality(Functionality).setLastUpdated(Value);
end;

procedure TOfferFunctionality__LoadDATAFromStream(Functionality: TFunctionality;   Stream: TStream); stdcall;
begin
TOfferFunctionality(Functionality).LoadDATAFromStream(Stream);
end;

function TOfferFunctionality__idUser(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferFunctionality(Functionality).idUser;
end;

function TOfferFunctionality__UID(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferFunctionality(Functionality).UID;
end;

function TOfferFunctionality__AddressStr(Functionality: TFunctionality): string; stdcall;
begin
Result:=TOfferFunctionality(Functionality).AddressStr;
end;

function TOfferFunctionality__Goods_Insert(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TOfferFunctionality(Functionality).Goods_Insert;
end;

procedure TOfferFunctionality__Goods_GetList(Functionality: TFunctionality;   var List: TList); stdcall;
begin
TOfferFunctionality(Functionality).Goods_GetList(List);
end;

procedure TOfferFunctionality__Goods_Remove(Functionality: TFunctionality;   const idOfferGoods: integer); stdcall;
begin
TOfferFunctionality(Functionality).Goods_Remove(idOfferGoods);
end;

procedure TOfferFunctionality__Goods_Clear(Functionality: TFunctionality); stdcall;
begin
TOfferFunctionality(Functionality).Goods_Clear;
end;


{TTDemandFunctionality}
function TTDemandFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTDemandFunctionality(Functionality)._CreateInstance;
end;

procedure TTDemandFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTDemandFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTDemandFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTDemandFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTDemandFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTDemandFunctionality(Functionality).getName;
end;

function TTDemandFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTDemandFunctionality(Functionality).getImage;
end;


{TDemandFunctionality}
procedure TDemandFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TDemandFunctionality(Functionality)._ToClone(idClone);
end;

function TDemandFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TDemandFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TDemandFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TDemandFunctionality(Functionality).CanDestroy(Reason);
end;

function TDemandFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TDemandFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TDemandFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TDemandFunctionality(Functionality).getName;
end;

function TDemandFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TDemandFunctionality(Functionality).getHint;
end;


{TTCommLineFunctionality}
function TTCommLineFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCommLineFunctionality(Functionality)._CreateInstance;
end;

procedure TTCommLineFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCommLineFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCommLineFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCommLineFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCommLineFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTCommLineFunctionality(Functionality).getName;
end;

function TTCommLineFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCommLineFunctionality(Functionality).getImage;
end;


{TCommLineFunctionality}
procedure TCommLineFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TCommLineFunctionality(Functionality)._ToClone(idClone);
end;

function TCommLineFunctionality__SetComponentsUsingObject(Functionality: TFunctionality;   const idTUseObj,idUseObj: integer): boolean; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).SetComponentsUsingObject(idTUseObj,idUseObj);
end;

function TCommLineFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).CanDestroy(Reason);
end;

function TCommLineFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCommLineFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).getName;
end;

function TCommLineFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCommLineFunctionality(Functionality).getHint;
end;


{TTGoodsFunctionality}
function TTGoodsFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality)._CreateInstance;
end;

procedure TTGoodsFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTGoodsFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTGoodsFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTGoodsFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality).getName;
end;

function TTGoodsFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality).getImage;
end;

procedure TTGoodsFunctionality__GetInstanceListContainingContext(Functionality: TFunctionality;   const Context: shortstring; var List: TStringList); stdcall;
begin
TTGoodsFunctionality(Functionality).GetInstanceListContainingContext(Context,List);
end;

function TTGoodsFunctionality__IsInstanceExist(Functionality: TFunctionality;   const pName: shortstring; out idGoods: integer): boolean; stdcall;
begin
Result:=TTGoodsFunctionality(Functionality).IsInstanceExist(pName,idGoods);
end;


{TGoodsFunctionality}
procedure TGoodsFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TGoodsFunctionality(Functionality)._ToClone(idClone);
end;

function TGoodsFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).CanDestroy(Reason);
end;

function TGoodsFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TGoodsFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).getName;
end;

procedure TGoodsFunctionality__setName(Functionality: TFunctionality;   Value: shortstring); stdcall;
begin
TGoodsFunctionality(Functionality).setName(Value);
end;

function TGoodsFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).getHint;
end;

function TGoodsFunctionality__StdAmount(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).StdAmount;
end;

function TGoodsFunctionality__StdMeasureUnit(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TGoodsFunctionality(Functionality).StdMeasureUnit;
end;


{TTCollectionFunctionality}
function TTCollectionFunctionality___CreateInstance(Functionality: TFunctionality): integer; stdcall;
begin
Result:=TTCollectionFunctionality(Functionality)._CreateInstance;
end;

procedure TTCollectionFunctionality___DestroyInstance(Functionality: TFunctionality;   const idObj: integer); stdcall;
begin
TTCollectionFunctionality(Functionality)._DestroyInstance(idObj);
end;

function TTCollectionFunctionality__TComponentFunctionality_Create(Functionality: TFunctionality;   const idComponent: integer): TComponentFunctionality; stdcall;
begin
Result:=TTCollectionFunctionality(Functionality).TComponentFunctionality_Create(idComponent);
end;

function TTCollectionFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TTCollectionFunctionality(Functionality).getName;
end;

function TTCollectionFunctionality__getImage(Functionality: TFunctionality): TTypeImage; stdcall;
begin
Result:=TTCollectionFunctionality(Functionality).getImage;
end;


{TCollectionFunctionality}
procedure TCollectionFunctionality___ToClone(Functionality: TFunctionality;   var idClone: integer); stdcall;
begin
TCollectionFunctionality(Functionality)._ToClone(idClone);
end;

function TCollectionFunctionality__CanDestroy(Functionality: TFunctionality;   var Reason: shortstring): boolean; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).CanDestroy(Reason);
end;

function TCollectionFunctionality__TPanelProps_Create(Functionality: TFunctionality;   pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).TPanelProps_Create(pflReadOnly,pidOwnerObjectProp,pOwnerPanelsProps,pProxyObject);
end;

function TCollectionFunctionality__getName(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).getName;
end;

procedure TCollectionFunctionality__setName(Functionality: TFunctionality;   const Value: shortstring); stdcall;
begin
TCollectionFunctionality(Functionality).setName(Value);
end;

function TCollectionFunctionality__getHint(Functionality: TFunctionality): shortstring; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).getHint;
end;

function TCollectionFunctionality__InsertItem(Functionality: TFunctionality;   const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).InsertItem(idTItem,idItem,Alias,ListOrder);
end;

procedure TCollectionFunctionality__RemoveItem(Functionality: TFunctionality;   const id: integer); stdcall;
begin
TCollectionFunctionality(Functionality).RemoveItem(id);
end;

procedure TCollectionFunctionality__Item_ChangeAlias(Functionality: TFunctionality;   const id: integer; const pAlias: string); stdcall;
begin
TCollectionFunctionality(Functionality).Item_ChangeAlias(id,pAlias);
end;

procedure TCollectionFunctionality__Item_ChangeListOrder(Functionality: TFunctionality;   const id: integer; const Order: integer); stdcall;
begin
TCollectionFunctionality(Functionality).Item_ChangeListOrder(id,Order);
end;

procedure TCollectionFunctionality__RemoveItems(Functionality: TFunctionality); stdcall;
begin
TCollectionFunctionality(Functionality).RemoveItems;
end;

function TCollectionFunctionality__IsItemExist(Functionality: TFunctionality;   const idTItem,idItem: integer): boolean; stdcall;
begin
Result:=TCollectionFunctionality(Functionality).IsItemExist(idTItem,idItem);
end;

procedure TCollectionFunctionality__GetListItems(Functionality: TFunctionality;   var List: TList); stdcall;
begin
TCollectionFunctionality(Functionality).GetListItems(List);
end;

procedure TCollectionFunctionality__SaveListItems(Functionality: TFunctionality;   List: TList); stdcall;
begin
TCollectionFunctionality(Functionality).SaveListItems(List);
end;


