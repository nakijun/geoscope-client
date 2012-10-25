//. import functionality routines

  //. TTypeFunctionality
  TTypeFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTypeSOAPFunctionality: ITTypeSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTypeSOAPFunctionality: ITTypeSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function CreateInstance: integer;
    function CreateInstanceUsingObject(const idTUseObj,idUseObj: integer): integer;
    procedure DestroyInstance(const idObj: integer);
    procedure GetInstanceList(out List: TByteArray);
    procedure GetInstanceOwnerNames(const IDs: TByteArray; out Data: TByteArray);
    procedure GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
    function getName: string;
  end;

  //. TComponentFunctionality
  TComponentFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTComponentSOAPFunctionality: ITComponentSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TComponentSOAPFunctionality: ITComponentSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure Check;
    procedure CheckUserOperation(const idOperation: integer);
    function CreationTimestamp: double;
    procedure CloneAndInsertComponent(const idTComponent,idComponent: integer; out idClone: integer; out id: integer);
    procedure ImportAndInsertComponents(const DATAStream: TByteArray; out ComponentsList: TByteArray);
    procedure DestroyComponent(const idTComponent,idComponent: integer);
    procedure RemoveComponent(const idTComponent,idComponent: integer);
    procedure ToClone(out idClone: integer);
    procedure ToCloneUsingObject(const idTUseObj,idUseObj: integer; out idClone: integer);
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    procedure DestroyComponents;
    procedure RemoveSelfAsComponent;
    function IsUnReferenced: boolean;
    function IsEmpty: boolean;
    function DATASize: integer;
    procedure GetComponentsList(out ComponentsList: TByteArray);
    function QueryComponentsWithTag(const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean;
    function QueryComponent(const idTNeededType: integer; out idTComponent,idComponent: integer): boolean;
    function QueryComponentWithTag(const pTag: integer; out idTComponent,idComponent: integer): boolean;
    function QueryComponentWithTag1(const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean;
    function ComponentsCount: integer;
    function GetRootOwner(out idTOwner,idOwner: integer): boolean;
    procedure RealityRating_AddUserRate(const Rate: integer; const RateReason: WideString);
    procedure RealityRating_GetAverageRate(out AvrRate: double; out RateCount: integer);
    procedure RealityRating_GetData(out RatingData: TByteArray);
    procedure ActualityInterval_GetTimestamps(out BeginTimestamp,EndTimestamp: double);
    procedure ActualityInterval_SetEndTimestamp(const Value: double);
    function ActualityInterval_IsActualForTime(const pTime: double): boolean;
    function ActualityInterval_IsActualForTimeInterval(const IntervalBeginTimestamp,IntervalEndTimestamp: double): boolean;
    procedure ActualityInterval_Actualize;
    procedure ActualityInterval_Deactualize;
    procedure CreateNewPanelProps;
    procedure DestroyPanelProps;
    function IsPanelPropsExist: boolean;
    function GetPanelPropsLeftTop(out PanelProps_Left,PanelProps_Top: integer): boolean;
    function GetPanelPropsWidthHeight(out PanelProps_Width,PanelProps_Height: integer): boolean;
    procedure SetPanelPropsLeftTop(const PanelProps_OfsX,PanelProps_OfsY: integer);
    procedure SetPanelPropsWidthHeight(const PanelProps_Width,PanelProps_Height: integer);
    function IsCustomPanelPropsExist: boolean;
    function idCustomPanelProps: integer;
    function CustomPanelProps1: TByteArray;
    procedure SetCustomPanelProps(Stream: TByteArray; const flNewValue: boolean{если = true, то заменяет панелью с новым ID});
    procedure SetCustomPanelPropsByID(const idPanelProps: integer);
    procedure ReleaseCustomPanelProps;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getTag: integer;
    procedure setTag(Value: integer);
    function GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean;
    function GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
    function GetSecurityComponent(out idSecurityComponent: integer): boolean;
    procedure ChangeSecurity(const pidSecurityFile: integer);
    procedure NotifyOnComponentUpdate;
    function GetComponentDATA(const Version: integer): TByteArray;
    procedure SetComponentDATA(const Data: TByteArray);
  end;

  //. TTProxyObjectFunctionality
  TTProxyObjectFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTProxyObjectSOAPFunctionality: ITTProxyObjectSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTProxyObjectSOAPFunctionality: ITTProxyObjectSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

  //. TProxyObjectFunctionality
  TProxyObjectFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTProxyObjectSOAPFunctionality: ITProxyObjectSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TProxyObjectSOAPFunctionality: ITProxyObjectSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function GetReference(out idTOwner,idOwner: integer): boolean;
    procedure SetReference(const idTOwner,idOwner: integer);
    function getName: string;
    function getHint: string;
  end;

  //. TTBaseVisualizationFunctionality
  TTBaseVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTBaseVisualizationSOAPFunctionality: ITTBaseVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTBaseVisualizationSOAPFunctionality: ITTBaseVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
    function CanCreateAsDetail: boolean;
  end;

  //. TBaseVisualizationFunctionality
  TBaseVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTBaseVisualizationSOAPFunctionality: ITBaseVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TBaseVisualizationSOAPFunctionality: ITBaseVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function Ptr: TPtr;
    function IsUnReferenced: boolean;
    procedure Scaling(const pScale: Double);
    procedure SetPosition(const X,Y,Z: Double);
    procedure Move(const dX,dY,dZ: Double);
    procedure ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
    procedure Rotate(const Xbind,Ybind: Double; const Angle: Double);
    procedure Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
    procedure SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
    procedure GetOwnerByVisualization(out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr);
    function GetCoVisualizationSpaces(out List: TByteArray): boolean;
    function getStrobing: boolean;
    procedure setStrobing(Value: boolean);
    function getStrobingInterval: integer;
    procedure setStrobingInterval(Value: integer);
  end;

  //. TTBase2DVisualizationFunctionality
  TTBase2DVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTBase2DVisualizationSOAPFunctionality: ITTBase2DVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTBase2DVisualizationSOAPFunctionality: ITTBase2DVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function CreateInstanceEx(const ptrOwner: TPtr): integer;
    procedure GetDisproportionObjects(const Factor: double; out ObjectsList: TByteArray);
  end;

  //. TBase2DVisualizationFunctionality
  TBase2DVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTBase2DVisualizationSOAPFunctionality: ITBase2DVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TBase2DVisualizationSOAPFunctionality: ITBase2DVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetLayInfo(out Lay,SubLay: integer);
    procedure GetProps(out oflagLoop: boolean; out oColor: TColor; out oWidth: Double; out oflagFill: boolean; out oColorFill: TColor);
    procedure SetProps(const pflagLoop: boolean; const pColor: TColor; const pWidth: Double; const pflagFill: boolean; const pColorFill: TColor);
    procedure CreateNode(const CreateNodeIndex: integer; const X,Y: Double);
    procedure DestroyNode(const DestroyNodeIndex: integer);
    procedure SetNode(const SetNodeIndex: integer; const newX,newY: Double);
    procedure GetNodes(out Nodes: TByteArray);
    procedure SetNodes(const Nodes: TByteArray; const pWidth: double);
    procedure CheckPlace(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
    procedure Move(const dX,dY,dZ: Double);
    procedure SetPosition(const X,Y,Z: Double);
    procedure SetPositionAndRotate(const X,Y: Double; const Angle: Double);
    procedure Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
    procedure ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
    procedure Rotate(const Xbind,Ybind: Double; const Angle: Double);
    procedure ChangeLay(const NewLayID: integer);
    procedure ChangeOwner(const ptrNewOwner: TPtr);
    function Square: Double;
    function Square1(const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: Double; const NewWidth: Double; const pScale: Double): Double;
    procedure GetInsideObjectsList(out List: TByteArray);
    function getIdLay: integer;
    function getWidth: Double;
    procedure setWidth(Value: Double);
    function getflUserSecurity: boolean;
    procedure setflUserSecurity(Value: boolean);
    function getflDetailsNoIndex: boolean;
    procedure setflDetailsNoIndex(Value: boolean);
    function getflNotifyOwnerOnChange: boolean;
    procedure setflNotifyOwnerOnChange(Value: boolean);
  end;

  //. TTLay2DVisualizationFunctionality
  TTLay2DVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTLay2DVisualizationSOAPFunctionality: ITTLay2DVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTLay2DVisualizationSOAPFunctionality: ITTLay2DVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

  //. TLay2DVisualizationFunctionality
  TLay2DVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTLay2DVisualizationSOAPFunctionality: ITLay2DVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TLay2DVisualizationSOAPFunctionality: ITLay2DVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function isEmpty: boolean;
    function getNumber: integer;
    procedure GetParams(out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
    procedure GetParams1(out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
    procedure SetParams(const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double);
  end;

