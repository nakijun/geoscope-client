//. functionalities soap-interfaces

Type
  {TTypeFunctionality-soap-interface}
  ITTypeSOAPFunctionality = Interface(IInvokable)
    ['{35F53257-4136-491B-983B-C9F4CBA96CE3}']
    function CreateInstance(const pUserName,pUserPassword: WideString; const pidType: integer): integer; stdcall;
    function CreateInstanceUsingObject(const pUserName,pUserPassword: WideString; const pidType: integer;  const idTUseObj,idUseObj: integer): integer; stdcall;
    procedure DestroyInstance(const pUserName,pUserPassword: WideString; const pidType: integer;  const idObj: integer); stdcall;
    procedure GetInstanceList(const pUserName,pUserPassword: WideString; const pidType: integer;  out List: TByteArray); stdcall;
    procedure GetInstanceOwnerNames(const pUserName,pUserPassword: WideString; const pidType: integer;  const IDs: TByteArray; out Data: TByteArray); stdcall;
    procedure GetComponentOwnerDatas(const pUserName,pUserPassword: WideString; const pidType: integer;  const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidType: integer): string; stdcall;
  end;
  //. "get interface" routine
  function GetITTypeSOAPFunctionality(const ServerURL: WideString): ITTypeSOAPFunctionality;

Type
  {TComponentFunctionality-soap-interface}
  ITComponentSOAPFunctionality = Interface(IInvokable)
    ['{19A0949A-5DAD-4C44-BD04-99D5D5F4B7B4}']
    procedure Check(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64); stdcall;
    procedure CheckUserOperation(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const idOperation: integer); stdcall;
    function CreationTimestamp(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): double; stdcall;
    procedure CloneAndInsertComponent(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const idTComponent,idComponent: integer; out idClone: integer; out id: integer); stdcall;
    procedure ImportAndInsertComponents(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const DATAStream: TByteArray; out ComponentsList: TByteArray); stdcall;
    procedure DestroyComponent(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const idTComponent,idComponent: integer); stdcall;
    procedure RemoveComponent(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const idTComponent,idComponent: integer); stdcall;
    procedure ToClone(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out idClone: integer); stdcall;
    procedure ToCloneUsingObject(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const idTUseObj,idUseObj: integer; out idClone: integer); stdcall;
    function GetOwner(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function SetComponentsUsingObject(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const idTUseObj,idUseObj: integer): boolean; stdcall;
    procedure DestroyComponents(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64); stdcall;
    procedure RemoveSelfAsComponent(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64); stdcall;
    function IsUnReferenced(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): boolean; stdcall;
    function IsEmpty(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): boolean; stdcall;
    function DATASize(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): integer; stdcall;
    procedure GetComponentsList(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out ComponentsList: TByteArray); stdcall;
    function QueryComponentsWithTag(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean; stdcall;
    function QueryComponent(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const idTNeededType: integer; out idTComponent,idComponent: integer): boolean; stdcall;
    function QueryComponentWithTag(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const pTag: integer; out idTComponent,idComponent: integer): boolean; stdcall;
    function QueryComponentWithTag1(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean; stdcall;
    function ComponentsCount(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): integer; stdcall;
    function GetRootOwner(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    procedure RealityRating_AddUserRate(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const Rate: integer; const RateReason: WideString); stdcall;
    procedure RealityRating_GetAverageRate(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out AvrRate: double; out RateCount: integer); stdcall;
    procedure RealityRating_GetData(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out RatingData: TByteArray); stdcall;
    procedure ActualityInterval_GetTimestamps(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out BeginTimestamp,EndTimestamp: double); stdcall;
    procedure ActualityInterval_SetEndTimestamp(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const Value: double); stdcall;
    function ActualityInterval_IsActualForTime(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const pTime: double): boolean; stdcall;
    function ActualityInterval_IsActualForTimeInterval(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const IntervalBeginTimestamp,IntervalEndTimestamp: double): boolean; stdcall;
    procedure ActualityInterval_Actualize(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64); stdcall;
    procedure ActualityInterval_Deactualize(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64); stdcall;
    procedure CreateNewPanelProps(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64); stdcall;
    procedure DestroyPanelProps(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64); stdcall;
    function IsPanelPropsExist(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): boolean; stdcall;
    function GetPanelPropsLeftTop(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out PanelProps_Left,PanelProps_Top: integer): boolean; stdcall;
    function GetPanelPropsWidthHeight(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out PanelProps_Width,PanelProps_Height: integer): boolean; stdcall;
    procedure SetPanelPropsLeftTop(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const PanelProps_OfsX,PanelProps_OfsY: integer); stdcall;
    procedure SetPanelPropsWidthHeight(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const PanelProps_Width,PanelProps_Height: integer); stdcall;
    function IsCustomPanelPropsExist(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): boolean; stdcall;
    function idCustomPanelProps(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): integer; stdcall;
    function CustomPanelProps1(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): TByteArray; stdcall;
    procedure SetCustomPanelProps(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  Stream: TByteArray; const flNewValue: boolean{если = true, то заменяет панелью с новым ID}); stdcall;
    procedure SetCustomPanelPropsByID(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const idPanelProps: integer); stdcall;
    procedure ReleaseCustomPanelProps(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64); stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): string; stdcall;
    function getTag(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): integer; stdcall;
    procedure setTag(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  Value: integer); stdcall;
    function GetDataDocument(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean; stdcall;
    function GetHintInfo(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean; stdcall;
    function GetSecurityComponent(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out idSecurityComponent: integer): boolean; stdcall;
    procedure ChangeSecurity(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const pidSecurityFile: integer); stdcall;
    procedure NotifyOnComponentUpdate(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64); stdcall;
    function GetComponentDATA(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const Version: integer): TByteArray; stdcall;
    procedure SetComponentDATA(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const Data: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITComponentSOAPFunctionality(const ServerURL: WideString): ITComponentSOAPFunctionality;

Type
  {TTProxyObjectFunctionality-soap-interface}
  ITTProxyObjectSOAPFunctionality = Interface(IInvokable)
    ['{279FD5F8-0F64-4AC1-B30D-BFB665CA0140}']
  end;
  //. "get interface" routine
  function GetITTProxyObjectSOAPFunctionality(const ServerURL: WideString): ITTProxyObjectSOAPFunctionality;

Type
  {TProxyObjectFunctionality-soap-interface}
  ITProxyObjectSOAPFunctionality = Interface(IInvokable)
    ['{9389258F-724A-429E-B563-7EBB3B87DAAF}']
    function GetReference(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    procedure SetReference(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const idTOwner,idOwner: integer); stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): string; stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): string; stdcall;
  end;
  //. "get interface" routine
  function GetITProxyObjectSOAPFunctionality(const ServerURL: WideString): ITProxyObjectSOAPFunctionality;

Type
  {TTBaseVisualizationFunctionality-soap-interface}
  ITTBaseVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{40008DE6-29AA-4F3F-B725-4B1CC702811F}']
    procedure GetComponentOwnerDatas(const pUserName,pUserPassword: WideString; const pidType: integer;  const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray); stdcall;
    function CanCreateAsDetail(const pUserName,pUserPassword: WideString; const pidType: integer): boolean; stdcall;
  end;
  //. "get interface" routine
  function GetITTBaseVisualizationSOAPFunctionality(const ServerURL: WideString): ITTBaseVisualizationSOAPFunctionality;

Type
  {TBaseVisualizationFunctionality-soap-interface}
  ITBaseVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{4E98DD2E-01DF-41B9-BB6C-570CF0F75496}']
    function Ptr(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): TPtr; stdcall;
    function IsUnReferenced(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): boolean; stdcall;
    procedure Scaling(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const pScale: Double); stdcall;
    procedure SetPosition(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const X,Y,Z: Double); stdcall;
    procedure Move(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const dX,dY,dZ: Double); stdcall;
    procedure ChangeScale(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const Xbind,Ybind: Double; const pScale: Double); stdcall;
    procedure Rotate(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const Xbind,Ybind: Double; const Angle: Double); stdcall;
    procedure Transform(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;
    procedure SetPropertiesLocal(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double); stdcall;
    procedure GetOwnerByVisualization(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr); stdcall;
    function GetCoVisualizationSpaces(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out List: TByteArray): boolean; stdcall;
    function getStrobing(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): boolean; stdcall;
    procedure setStrobing(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  Value: boolean); stdcall;
    function getStrobingInterval(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): integer; stdcall;
    procedure setStrobingInterval(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  Value: integer); stdcall;
  end;
  //. "get interface" routine
  function GetITBaseVisualizationSOAPFunctionality(const ServerURL: WideString): ITBaseVisualizationSOAPFunctionality;

Type
  {TTBase2DVisualizationFunctionality-soap-interface}
  ITTBase2DVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{D583C1E1-899C-42F9-8C1A-51754DEF0C5A}']
    function CreateInstanceEx(const pUserName,pUserPassword: WideString; const pidType: integer;  const ptrOwner: TPtr): integer; stdcall;
    procedure GetDisproportionObjects(const pUserName,pUserPassword: WideString; const pidType: integer;  const Factor: double; out ObjectsList: TByteArray); stdcall;
  end;
  //. "get interface" routine
  function GetITTBase2DVisualizationSOAPFunctionality(const ServerURL: WideString): ITTBase2DVisualizationSOAPFunctionality;

Type
  {TBase2DVisualizationFunctionality-soap-interface}
  ITBase2DVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{561EBC52-F161-4BEA-91E1-0E63332D6F8F}']
    procedure GetLayInfo(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out Lay,SubLay: integer); stdcall;
    procedure GetProps(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor); stdcall;
    procedure SetProps(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor); stdcall;
    procedure CreateNode(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const CreateNodeIndex: integer; const X,Y: Double); stdcall;
    procedure DestroyNode(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const DestroyNodeIndex: integer); stdcall;
    procedure SetNode(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const SetNodeIndex: integer; const newX,newY: Double); stdcall;
    procedure GetNodes(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out Nodes: TByteArray); stdcall;
    procedure SetNodes(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const Nodes: TByteArray; const pWidth: double); stdcall;
    procedure CheckPlace(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;
    procedure Move(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const dX,dY,dZ: Double); stdcall;
    procedure SetPosition(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const X,Y,Z: Double); stdcall;
    procedure SetPositionAndRotate(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const X,Y: Double; const Angle: Double); stdcall;
    procedure Transform(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double); stdcall;
    procedure ChangeScale(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const Xbind,Ybind: Double; const pScale: Double); stdcall;
    procedure Rotate(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const Xbind,Ybind: Double; const Angle: Double); stdcall;
    procedure ChangeLay(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const NewLayID: integer); stdcall;
    procedure ChangeOwner(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const ptrNewOwner: TPtr); stdcall;
    function Square(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): Double; stdcall;
    function Square1(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: Double; const NewWidth: Double; const pScale: Double): Double; stdcall;
    procedure GetInsideObjectsList(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out List: TByteArray); stdcall;
    function getIdLay(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): integer; stdcall;
    function getWidth(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): Double; stdcall;
    procedure setWidth(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  Value: Double); stdcall;
    function getflUserSecurity(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): boolean; stdcall;
    procedure setflUserSecurity(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  Value: boolean); stdcall;
    function getflDetailsNoIndex(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): boolean; stdcall;
    procedure setflDetailsNoIndex(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  Value: boolean); stdcall;
    function getflNotifyOwnerOnChange(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): boolean; stdcall;
    procedure setflNotifyOwnerOnChange(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  Value: boolean); stdcall;
  end;
  //. "get interface" routine
  function GetITBase2DVisualizationSOAPFunctionality(const ServerURL: WideString): ITBase2DVisualizationSOAPFunctionality;

Type
  {TTLay2DVisualizationFunctionality-soap-interface}
  ITTLay2DVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{61DBE7F9-E769-4DB0-925B-EB5F30278A71}']
  end;
  //. "get interface" routine
  function GetITTLay2DVisualizationSOAPFunctionality(const ServerURL: WideString): ITTLay2DVisualizationSOAPFunctionality;

Type
  {TLay2DVisualizationFunctionality-soap-interface}
  ITLay2DVisualizationSOAPFunctionality = Interface(IInvokable)
    ['{FF2F3116-6B9B-462E-ADAD-84AA68A321D1}']
    function GetOwner(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out idTOwner,idOwner: integer): boolean; stdcall;
    function getName(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): string; stdcall;
    procedure setName(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  Value: string); stdcall;
    function getHint(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): string; stdcall;
    function isEmpty(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): boolean; stdcall;
    function getNumber(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64): integer; stdcall;
    procedure GetParams(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); stdcall;
    procedure GetParams1(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double); stdcall;
    procedure SetParams(const pUserName,pUserPassword: WideString; const pidTObj: integer; const pidObj: Int64;  const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double); stdcall;
  end;
  //. "get interface" routine
  function GetITLay2DVisualizationSOAPFunctionality(const ServerURL: WideString): ITLay2DVisualizationSOAPFunctionality;

