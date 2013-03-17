//. import  functionality routines

const FunctionalityDLL = 'SOAPClient.exe';

//. TTypeFunctionality
Type

  TComponentFunctionality = class;

  TTypeFunctionality = class(TFunctionality)
  public
    function UserName: WideString;
    function UserPassword: WideString;
    procedure SetUser(const pUserName: WideString; const pUserPassword: WideString);
    function _CreateInstance: integer;
    function CreateInstance: integer;
    function CreateInstanceUsingObject(const idTUseObj,idUseObj: integer): integer;
    procedure _DestroyInstance(const idObj: integer);
    procedure DestroyInstance(const idObj: integer);
    procedure GetInstanceList(out List: TList);
    procedure GetInstanceList1(out List: TByteArray);
    procedure GetInstanceNames(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList);
    procedure GetInstanceOwnerNames(const IDs: TByteArray; out Data: TByteArray);
    procedure GetComponentDatas(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; const DataFlags: TComponentDataFlags; out Datas: TComponentDatas);
    procedure GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
    function CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
    function ImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    procedure DoOnComponentOperation(const idTObj,idObj: integer; const Operation: TComponentOperation);
    function getSpace: TProxySpace;
    function getidType: integer;
    function getName: string;
    function getImage: TTypeImage;
    function getTableName: string;
    function getImageList_Index: integer;
    property  Space: TProxySpace read getSpace;
    property  idType: integer read getidType;
    property  TableName: string read getTableName;
    property  Name: string read getName;
    property  Image: TTypeImage read getImage;
    property  ImageList_Index: integer read getImageList_Index;
  end;


  TComponentFileType = (cftNone,cftEXE,cftTXT,cft3DS,cftMAX,cftQDC,cftBMP,cftJPEG,cftWMF,cftEMF,cftPNG);


  TComponentNotifyType = (ontComponentInserted,ontComponentRemoved,ontBecomeComponent,ontBecomeFree,ontVisualizationClick,ontVisualizationDblClick,ontVisualizationComponentIsChanged);


  TComponentNotifyResult = (cnrUnknown,cnrProcessed,cnrQueued,cnrUnprocessed);

//. TComponentFunctionality
  TComponentFunctionality = class(TFunctionality)
  public
    procedure UpdateDATA;
    procedure ClearDATA;
    function UserName: WideString;
    function UserPassword: WideString;
    procedure SetUser(const pUserName: WideString; const pUserPassword: WideString);
    function UserProfileFolder: string;
    function GetObjTID: integer;
    function GetObjID: integer;
    procedure Check;
    function CreationTimestamp: double;
    procedure CheckUserOperation(const idOperation: integer);
    function GetSecurityComponent(out idSecurityComponent: integer): boolean;
    procedure ChangeSecurity(const pidSecurityFile: integer);
    function IsUserDataExists(const DataName: string): boolean;
    function DeleteUserData(const DataName: string): boolean;
    procedure SetUserData(const DataName: string; const Data: TMemoryStream);
    procedure GetUserData(const DataName: string; out Data: TMemoryStream);
    procedure InsertComponent(const idTComponent,idComponent: integer;  out id: integer);
    procedure CloneAndInsertComponent(const idTComponent,idComponent: integer; out idClone: integer; out id: integer);
    procedure ImportAndInsertComponents(const ImportFileName: string; out ComponentsList: TComponentsList);
    procedure DestroyComponent(const idTComponent,idComponent: integer);
    procedure RemoveComponent(const idTComponent,idComponent: integer);
    procedure _ToClone(out idClone: integer);
    procedure ToClone(out idClone: integer);
    procedure ToCloneUsingObject(const idTUseObj,idUseObj: integer; out idClone: integer);
    function CanDestroy(out Reason: string): boolean;
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    procedure DestroyComponents;
    procedure RemoveSelfAsComponent;
    function IsUnReferenced: boolean;
    function IsEmpty: boolean;
    function DATASize: integer;
    procedure LoadFromFile(const FileName: string);
    procedure LoadFromStream(const Stream: TStream);
    procedure GetComponentsList(out ComponentsList: TComponentsList);
    procedure GetComponentsList1(out ComponentsList: TByteArray);
    function QueryComponents(FunctionalityClass: TFunctionalityClass; out ComponentsList: TComponentsList): boolean;
    function QueryComponents1(const idTNeededType: integer; out ComponentsList: TComponentsList): boolean;
    function QueryComponentsWithTag(const idTNeededType: integer; const pTag: integer; out ComponentsList: TComponentsList): boolean;
    function QueryComponentsWithTag1(const idTNeededType: integer; const pTag: integer; out ComponentsList: TByteArray): boolean;
    function QueryComponent(const idTNeededType: integer; out idTComponent,idComponent: integer): boolean;
    function QueryComponentWithTag(const pTag: integer; out idTComponent,idComponent: integer): boolean;
    function QueryComponentWithTag1(const idTNeededType: integer; const pTag: integer; out idTComponent,idComponent: integer): boolean;
    function QueryComponentFunctionality(NeededFunctionalityClass: TFunctionalityClass; out Functionality: TFunctionality): boolean;
    function ComponentsCount: integer;
    function GetRootOwner(out idTOwner,idOwner: integer): boolean;
    function TPresentUpdater_Create(pUpdateProc: TProc; pOffProc: TProc): TComponentPresentUpdater;
    function TContextComponentHolder_Create: TComponentPresentUpdater;
    procedure RealityRating_AddUserRate(const Rate: integer; const RateReason: WideString);
    procedure RealityRating_GetAverageRate(out AvrRate: double; out RateCount: integer);
    procedure RealityRating_GetData(out RatingData: TByteArray);
    function ActualityInterval_Get: TComponentActualityInterval;
    procedure ActualityInterval_GetTimestamps(out BeginTimestamp,EndTimestamp: double);
    function ActualityInterval_GetLocally: TComponentActualityInterval;
    procedure ActualityInterval_SetEndTimestamp(const Value: double);
    function ActualityInterval_IsActualForTime(const pTime: double): boolean;
    function ActualityInterval_IsActualForTimeInterval(const pInterval: TComponentActualityInterval): boolean;
    function ActualityInterval_IsActualForTimeLocally(const pTime: double): boolean;
    function ActualityInterval_IsActualForTimeIntervalLocally(const pInterval: TComponentActualityInterval): boolean;
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
    function CustomPanelProps: TMemoryStream;
    procedure SetCustomPanelProps(Stream: TStream; const flNewValue: boolean{если = true, то заменяет панелью с новым ID});
    procedure SetCustomPanelPropsByID(const idPanelProps: integer);
    procedure ReleaseCustomPanelProps;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getSpace: TProxySpace;
    function getidTObj: integer;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getTag: integer;
    procedure setTag(Value: integer);
    function GetIconImage(out Image: TBitmap): boolean;
    procedure DoOnComponentUpdate;
    procedure GetExportDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList);
    function _GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;
    function GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; out Document: TByteArray): boolean;
    function GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
    procedure NotifyOnComponentUpdate;
    function GetComponentDATA(const Version: integer): TByteArray;
    procedure SetComponentDATA(const Data: TByteArray);
    function getTypeSystem: TTypeSystem;
    function getTableName: string;
    property  Space: TProxySpace read getSpace;
    property  idTObj: integer read getidTObj;
    property  TypeSystem: TTypeSystem read getTypeSystem;
    property  Name: string read getName write setName;
    property  Hint: string read getHint;
    property  Tag: integer read getTag write setTag;
    property  TableName: string read getTableName;
  end;

Const
  
  ComponentsFilesTypesExtensions: array[TComponentFileType] of string = ('','exe','txt','3ds','max','qdc','bmp','jpeg','wmf','emf','png');



//. TTProxyObjectFunctionality
Type
  TTProxyObjectFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    procedure _DestroyInstance(const idObj: integer);
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property  Name: string read getName;
  end;

//. TProxyObjectFunctionality
Type
  TProxyObjectFunctionality = class(TFunctionality)
  public
    procedure _ToClone(out idClone: integer);
    function CanDestroy(out Reason: string): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function getName: string;
    function getHint: string;
    property  Name: string read getName;
    function GetReference(out idTOwner,idOwner: integer): boolean;
    procedure SetReference(const idTOwner,idOwner: integer);
  end;

//. TTBaseVisualizationFunctionality
Type
  TTBaseVisualizationFunctionality = class(TFunctionality)
  public
    procedure GetComponentOwnerDatas(const IDs: TByteArray; const DataFlags: TComponentDataFlags; out Data: TByteArray);
    function CanCreateAsDetail: boolean;
    function ImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;
    function getReflector: TAbstractReflector;
    procedure setReflector(Value: TAbstractReflector);
    property  Reflector: TAbstractReflector read getReflector write setReflector;
  end;

//. TBaseVisualizationFunctionality
Type
  TBaseVisualizationFunctionality = class(TFunctionality)
  public
    procedure DestroyData;
    procedure CloneData(out idClone: integer);
    function Ptr: TPtr;
    procedure DoOnChangeScale(const ChangeCoef: Double);
    function IsUnReferenced: boolean;
    function TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;
    procedure ReflectInScene(Scene: TScene);
    procedure Scaling(const pScale: Double);
    procedure SetPosition(const X,Y,Z: Double);
    procedure Move(const dX,dY,dZ: Double);
    procedure ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
    procedure Rotate(const Xbind,Ybind: Double; const Angle: Double);
    procedure Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
    procedure SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
    procedure DoOnComponentUpdate;
    function DoOnOver: boolean;
    function DoOnClick: boolean;
    function DoOnDblClick: boolean;
    procedure GetExportDATA(Document: IXMLDOMDocument; ParentNode: IXMLDOMElement; PropsPanelsList: TList; ComponentsFilesList: TList);
    procedure GetOwnerByVisualization(out idTOwner,idOwner: integer; out ptrOwnerVisualization: TPtr);
    function GetCoVisualizationSpaces(out List: TList): boolean;
    function GetCoVisualizationSpaces1(out List: TByteArray): boolean;
    function getReflector: TAbstractReflector;
    procedure setReflector(Value: TAbstractReflector);
    function getStrobing: boolean;
    procedure setStrobing(Value: boolean);
    function getStrobingInterval: integer;
    procedure setStrobingInterval(Value: integer);
    property  Reflector: TAbstractReflector read getReflector write setReflector;
    property  Strobing: boolean read getStrobing write setStrobing;
    property  StrobingInterval: integer read getStrobingInterval write setStrobingInterval;
  end;

//. TTBase2DVisualizationFunctionality
Type
  TTBase2DVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer;
    function CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer;
    procedure _DestroyInstance(const idObj: integer);
    function CreateObj(pReflector: TAbstractReflector; pObjectVisualization: TObjectVisualization; const flAbsoluteCoords: boolean; const idTObj,idObj: integer; ptrOwner: TPtr): TPtr;
    procedure DestroyObj(const ptrDestrObj: TPtr);
    procedure GetDisproportionObjects(const Factor: double; out ObjectsList: TByteArray);
    function getReflector: TAbstractReflector;
    procedure setReflector(Value: TAbstractReflector);
    function StdObjectVisualization: TObjectVisualization;
    property  Reflector: TAbstractReflector read getReflector write setReflector;
  end;

//. TBase2DVisualizationFunctionality
Type
  TBase2DVisualizationFunctionality = class(TFunctionality)
  public
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    function ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;
    procedure CreateClone(const ptrObj: TPtr; const ptrCloneOwner: TPtr; out idClone: integer);
    procedure GetLayInfo(out Lay,SubLay: integer);
    function GetDetailsList(out DetailsList: TComponentsList): boolean;
    function ReflectAsNotLoaded(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pCanvas: TCanvas): boolean;
    function ContainerFilled: boolean;
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
    procedure ChangeScale(const Xbind,Ybind: Double; const pScale: Double);
    procedure Rotate(const Xbind,Ybind: Double; const Angle: Double);
    procedure ChangeLay(const NewLayID: integer);
    procedure ChangeOwner(const ptrNewOwner: TPtr);
    procedure Transform(const Xbind,Ybind: Double; const pScale: Double; const Angle: Double; const dX,dY: Double);
    function Square: Double;
    function Square1(const ExceptPointPtr: TPtr; const ExceptPointValueX,ExceptPointValueY: TCrd; const NewWidth: Double; const pScale: Double): Double;
    function GetFormatNodes(out NodesList: TList; out SizeX,SizeY: integer): boolean;
    procedure GetInsideObjectsList(out List: TComponentsList);
    function getReflector: TAbstractReflector;
    procedure setReflector(Value: TAbstractReflector);
    function getIdLay: integer;
    function getWidth: Double;
    procedure setWidth(Value: Double);
    function getflUserSecurity: boolean;
    procedure setflUserSecurity(Value: boolean);
    function getflDetailsNoIndex: boolean;
    procedure setflDetailsNoIndex(Value: boolean);
    function getflNotifyOwnerOnChange: boolean;
    procedure setflNotifyOwnerOnChange(Value: boolean);
    property  Reflector: TAbstractReflector read getReflector write setReflector;
    property  idLay: integer read getIdLay;
    property  Width: Double read getWidth write setWidth;
    property  flUserSecurity: boolean read getflUserSecurity write setflUserSecurity;
    property  flDetailsNoIndex: boolean read getflDetailsNoIndex write setflDetailsNoIndex;
    property  flNotifyOwnerOnChange: boolean read getflNotifyOwnerOnChange write setflNotifyOwnerOnChange;
  end;

//. TTLay2DVisualizationFunctionality
Type
  TTLay2DVisualizationFunctionality = class(TFunctionality)
  public
    function _CreateInstance: integer;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;
    function getName: string;
    function getImage: TTypeImage;
    property  Name: string read getName;
    function _CreateInstanceEx(pObjectVisualization: TObjectVisualization; ptrOwner: TPtr): integer;
    function StdObjectVisualization: TObjectVisualization;
  end;

//. TLay2DVisualizationFunctionality
Type
  TLay2DVisualizationFunctionality = class(TFunctionality)
  public
    procedure DestroyData;
    procedure _ToClone(out idClone: integer);
    function CanDestroy(out Reason: string): boolean;
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    property  Name: string read getName write setName;
    procedure CloneData(out idClone: integer);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;
    procedure GetObjectPointersList(out List: TList);
    function isEmpty: boolean;
    function getNumber: integer;
    procedure GetParams(out oName: string; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
    procedure GetParams1(out oName: string; out oNumber: integer; out oVisibleMinScale: Double; out oVisibleMaxScale: Double);
    procedure SetParams(const pName: string; const pVisibleMinScale: Double; const pVisibleMaxScale: Double);
    property  Number: integer read getNumber;
  end;

