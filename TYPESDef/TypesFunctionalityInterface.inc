//. typesfunctionalities interfaces

Type
  {TTTileServerVisualizationFunctionality}
  TTTileServerVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTTileServerVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TTileServerVisualizationFunctionality}
  TTileServerVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTileServerVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    procedure SetParams(const pWidth: integer; const pHeight: integer);
    procedure SetProportion(const Value: double);
    procedure Clear;
    function GetSegmentsStorageType: integer;
    procedure SetSegmentsStorageType(Value: integer);
    function ContainerFilled: boolean;override; 
    procedure GetLevelsInfoLocally(out Info: TByteArray);
    function TLevelsPropsPanel_Create: TForm;
    procedure Level_ConvertPixPosToXY(const idLevel: integer; const PixX,PixY: integer; out X,Y: double);
    procedure Level_ConvertXYToPixPos(const idLevel: integer; const X,Y: double; out PixX,PixY: integer);
    function UserData_GetTileProviderID(out oTileProviderID: integer): boolean;
    procedure UserData_SetTileProviderID(const pTileProviderID: integer);
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetParams(out oWidth: integer; out oHeight: integer);overload; 
    procedure GetParams(out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer);overload; 
    procedure SetServerType(const Value: integer);
    procedure SetServerURL(const Value: string);
    procedure SetServerData(const pData: TMemoryStream);overload; 
    procedure SetServerData(const Data: TByteArray);overload; 
    procedure GenerateFromImage(DATAStream: TByteArray);
    procedure GenerateFromTiles(const TilesFolder: string; const SizePowerOf2: integer);
    procedure RegenerateRegionFromLevel(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
    procedure RegenerateRegion(const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
    procedure AddNewLevelAndRegenerate;
    procedure GetLevelsInfo(out Info: TByteArray);
    procedure Level_GetParams(const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double);
    procedure Level_SetParams(const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double);
    procedure Level_GetSegments(const TileProviderID: integer; const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray);
    procedure Level_GetSegmentsByIDs(const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray);
    procedure Level_GetSegmentsHashes(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray);
    procedure Level_SetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray);
    procedure GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
    property  Name: string read getName;
  end;

Type
  {TTMeasurementObjectFunctionality}
  TTMeasurementObjectFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTMeasurementObjectFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function CreateNewInstance(const pName: string; const pDomains: string): integer;
    function CreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
    function CheckCreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
    procedure GetInstanceListByNameContext(const pName: string; out List: TByteArray);
    procedure GetInstanceDataByNameContext(const pName: string; const Version: integer; out oData: TByteArray);
    function GetInstanceByGUID(const pGUID: string): integer;
    function GetInstanceByGSOMeasurement(const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer;
    property  Name: string read getName;
  end;

Type
  {TMeasurementObjectFunctionality}
  TMeasurementObjectFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TMeasurementObjectFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    procedure setName(Value: string);
    function getHint: string;override; 
    function getGUID: string;
    function getDomains: string;
    procedure setDomains(Value: string);
    procedure GetParams(out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string);
    procedure GSOMeasurements_GetList(out List: TByteArray);
    procedure GSOMeasurements_GetData(const Version: integer; out oData: TByteArray);
    procedure GSOMeasurements_Item_GetParams(const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);overload; 
    procedure GSOMeasurements_Item_GetParams(const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);overload; 
    procedure GSOMeasurements_Item_GetData(const idMeasurement: integer; out oData: TByteArray);overload; 
    procedure GSOMeasurements_Item_GetData(const TimeID: Double; out oData: TByteArray);overload; 
    property  Name: string read getName write setName;
    property  GUID: string read getGUID;
    property  Domains: string read getDomains write setDomains;
  end;

Type
  {TTAreaNotificationServerFunctionality}
  TTAreaNotificationServerFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTAreaNotificationServerFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TAreaNotificationServerFunctionality}
  TAreaNotificationServerFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TAreaNotificationServerFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    procedure setName(Value: string);
    function getHint: string;override; 
    function getInfo: string;
    procedure setInfo(Value: string);
    property  Name: string read getName write setName;
    property  Info: string read getInfo write setInfo;
  end;

Type
  {TTMODELServerVisualizationFunctionality}
  TTMODELServerVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTMODELServerVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TMODELServerVisualizationFunctionality}
  TMODELServerVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TMODELServerVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;override; 
    function ContainerFilled: boolean;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getServerURL: string;
    procedure setServerURL(Value: string);
    property  Name: string read getName;
    property  ServerURL: string read getServerURL write setServerURL;
  end;

Type
  {TTDoubleVarFunctionality}
  TTDoubleVarFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTDoubleVarFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TDoubleVarFunctionality}
  TDoubleVarFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TDoubleVarFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getValue: Double;
    procedure setValue(_Value: Double);
    function getSetTimeStamp: TDateTime;
    property  Name: string read getName;
    property  Value: Double read getValue write setValue;
    property  SetTimeStamp: TDateTime read getSetTimeStamp;
  end;

Type
  {TTInt32VarFunctionality}
  TTInt32VarFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTInt32VarFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TInt32VarFunctionality}
  TInt32VarFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TInt32VarFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getValue: integer;
    procedure setValue(_Value: integer);
    function getSetTimeStamp: TDateTime;
    property  Name: string read getName;
    property  Value: integer read getValue write setValue;
    property  SetTimeStamp: TDateTime read getSetTimeStamp;
  end;

Type
  {TTURLFunctionality}
  TTURLFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTURLFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TURLFunctionality}
  TURLFunctionality = class(TComponentFunctionality)
    public
      _URL: string;
      _URLName: string;
      _flPanelBrowser: boolean;
      

    RemotedFunctionality: TURLFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure UpdateDATA;override; 
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getURL: string;
    procedure setURL(Value: string);
    function getURLName: string;
    procedure setURLName(Value: string);
    function getflPanelBrowser: boolean;
    procedure setflPanelBrowser(Value: boolean);
    procedure GetParams(out oURL: string; out oURLName: string; out oflPanelBrowser: boolean);
    procedure SetParams(const pURL: string; const pURLName: string; const pflPanelBrowser: boolean);
    property  Name: string read getName;
    property  URL: string read getURL write setURL;
    property  URLName: string read getURLName write setURLName;
    property  flPanelBrowser: boolean read getflPanelBrowser write setflPanelBrowser;
  end;

Type
  {TTPatternVisualizationFunctionality}
  TTPatternVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTPatternVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TPatternVisualizationFunctionality}
  TPatternVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TPatternVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);overload; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);overload; 
    procedure SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);overload; 
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);overload; 
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    property  Name: string read getName;
    property  DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

Type
  {TTMapFormatObjectFunctionality}
  TTMapFormatObjectFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTMapFormatObjectFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetInstanceNames(const IDs: array of Int64; const IDs_Offset: integer; const IDs_Size: integer; var Names: TStringList);override; 
    function GetDATAHash(DATAStream: TMemoryStream): integer;overload; 
    function GetDATAHash(DATAStream: TByteArray): integer;overload; 
    property  Name: string read getName;
  end;

Type
  {TMapFormatObjectFunctionality}
  TMapFormatObjectFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TMapFormatObjectFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATAPanel_Create: TForm;
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;override; 
    function _GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;override; 
    function GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;override; 
    function getidMap: integer;
    procedure setidMap(Value: integer);
    function getFormatID: integer;
    procedure setFormatID(Value: integer);
    function getKindID: integer;
    procedure setKindID(Value: integer);
    function getTypeID: integer;
    procedure setTypeID(Value: integer);
    function getName: string;override; 
    procedure setName(Value: string);
    procedure GetDATA(out DATAStream: TMemoryStream);overload; 
    procedure GetDATA(out DATAStream: TByteArray);overload; 
    procedure SetDATA(DATAStream: TMemoryStream);overload; 
    procedure SetDATA(DATAStream: TByteArray);overload; 
    function getDATAHash: integer;
    procedure setDATAHash(Value: integer);
    procedure GetParams(out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string);
    procedure SetParams(const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string);
    procedure SetObjectByDATA;
    procedure UpdateDATAHash;
    procedure Compile;
    procedure Build(const flUsePrototype: boolean);
    property  idMap: integer read getidMap write setidMap;
    property  FormatID: integer read getFormatID write setFormatID;
    property  KindID: integer read getKindID write setKindID;
    property  TypeID: integer read getTypeID write setTypeID;
    property  DATAHash: integer read getDATAHash write setDATAHash;
    property  Name: string read getName write setName;
  end;

Type
  {TTMapFormatMapFunctionality}
  TTMapFormatMapFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTMapFormatMapFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetInstanceListByGeoSpace(const idGeoSpace: integer; out List: TByteArray);
    property  Name: string read getName;
  end;

Type
  {TMapFormatMapFunctionality}
  TMapFormatMapFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TMapFormatMapFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getGeoSpaceID: integer;
    procedure setGeoSpaceID(Value: integer);
    function getFormatID: integer;
    procedure setFormatID(Value: integer);
    function getName: string;override; 
    procedure setName(Value: string);
    procedure GetDATA(out DATAStream: TMemoryStream);overload; 
    procedure GetDATA(out DATAStream: TByteArray);overload; 
    procedure SetDATA(DATAStream: TMemoryStream);overload; 
    procedure SetDATA(DATAStream: TByteArray);overload; 
    procedure GetObjectPrototypesDATA(out DATAStream: TMemoryStream);overload; 
    procedure GetObjectPrototypesDATA(out DATAStream: TByteArray);overload; 
    procedure SetObjectPrototypesDATA(DATAStream: TMemoryStream);overload; 
    procedure SetObjectPrototypesDATA(DATAStream: TByteArray);overload; 
    function GetObjectPrototype(const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean;
    procedure GetParams(out oGeoSpaceID: integer; out oFormatID: integer; out oName: string);
    procedure SetParams(const pGeoSpaceID: integer; const pFormatID: integer; const pName: string);
    function ObjectsCounter: integer;
    procedure GetObjectsList(out List: TByteArray);overload; 
    procedure GetObjectsList(const KindID: integer; out List: TByteArray);overload; 
    procedure GetObjectsList(const KindID: integer; const TypeID: integer; out List: TByteArray);overload; 
    procedure GetObjectsList(const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray);overload; 
    function GetObject(const DATAHash: integer; out idMapFormatObject: integer): boolean;overload; 
    function GetObject(const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean;overload; 
    procedure ExportMap(const pFormatID: integer; out ZipData: TByteArray);
    procedure RemoveObjects;overload; 
    procedure RemoveObjects(const KindID: integer; const TypeID: integer);overload; 
    procedure UpdateObjectDATAHashes;
    procedure RecalculateMapArea;
    procedure RemoveIrrelevantObjectsInMapArea;
    property  GeoSpaceID: integer read getGeoSpaceID write setGeoSpaceID;
    property  FormatID: integer read getFormatID write setFormatID;
    property  Name: string read getName write setName;
  end;

Type
  {TTSPLVisualizationFunctionality}
  TTSPLVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTSPLVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TSPLVisualizationFunctionality}
  TSPLVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TSPLVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetParams(out SPLType: integer; out SPLDATA: TByteArray);
    procedure SetParams(const SPLType: integer; const SPLDATA: TByteArray);
    property  Name: string read getName;
  end;

Type
  {TTBoolVarFunctionality}
  TTBoolVarFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTBoolVarFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TBoolVarFunctionality}
  TBoolVarFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TBoolVarFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getValue: boolean;
    procedure setValue(_Value: boolean);
    function getSetTimeStamp: TDateTime;
    property  Name: string read getName;
    property  Value: boolean read getValue write setValue;
    property  SetTimeStamp: TDateTime read getSetTimeStamp;
  end;

Type
  {TTGeoSpaceFunctionality}
  TTGeoSpaceFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTGeoSpaceFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TGeoSpaceFunctionality}
  TGeoSpaceFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TGeoSpaceFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function GetDatumIDLocally: integer;
    function ConvertGeoToXYLocally(const Lat,Long: Extended; out Xr,Yr: Extended): boolean;
    function ConvertXYToGeoLocally(const X,Y: Extended; out Lat,Long: Extended): boolean;
    function GetDistanceBetweenTwoXYPointsLocally(const X0,Y0,X1,Y1: Extended; out Distance: Extended): boolean;
    function getName: string;override; 
    procedure setName(Value: string);
    function getHint: string;override; 
    function getDatumID: integer;
    procedure setDatumID(Value: integer);
    function getProjectionID: integer;
    procedure setProjectionID(Value: integer);
    function ConvertXYToLatLong(const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean;
    function ConvertXYToDatumLatLong(const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean;
    function ConvertLatLongToXY(const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
    function ConvertDatumLatLongToXY(const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
    procedure GetGeoCrdSystemList(out List: TList);overload; 
    procedure GetGeoCrdSystemList(out List: TByteArray);overload; 
    procedure GetMapFormatMapList(out List: TList);overload; 
    procedure GetMapFormatMapList(out List: TByteArray);overload; 
    procedure GetMapFormatMapObjectsByNameContext(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TList);overload; 
    procedure GetMapFormatMapObjectsByNameContext(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray);overload; 
    property  Name: string read getName write setName;
    property  DatumID: integer read getDatumID write setDatumID;
    property  ProjectionID: integer read getProjectionID write setProjectionID;
  end;

Type
  {TTUserAlertFunctionality}
  TTUserAlertFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTUserAlertFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetActiveInstanceList(out List: TList);overload; 
    procedure GetActiveInstanceList(out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TUserAlertFunctionality}
  TUserAlertFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TUserAlertFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getUserID: integer;
    procedure setUserID(Value: integer);
    function getTimeStamp: TDateTime;
    procedure setTimeStamp(Value: TDateTime);
    function getActive: boolean;
    procedure setActive(Value: boolean);
    function getAlertID: integer;
    procedure setAlertID(Value: integer);
    function getSeverity: integer;
    procedure setSeverity(Value: integer);
    function getDescription: string;
    procedure setDescription(Value: string);
    procedure GetDATA(out DATAStream: TMemoryStream);overload; 
    procedure GetDATA(out DATAStream: TByteArray);overload; 
    procedure SetDATA(DATAStream: TMemoryStream);overload; 
    procedure SetDATA(DATAStream: TByteArray);overload; 
    property  Name: string read getName;
    property  UserID: integer read getUserID write setUserID;
    property  TimeStamp: TDateTime read getTimeStamp write setTimeStamp;
    property  Active: boolean read getActive write setActive;
    property  AlertID: integer read getAlertID write setAlertID;
    property  Severity: integer read getSeverity write setSeverity;
    property  Description: string read getDescription write setDescription;
  end;

Type
  {TTGeoGraphServerObjectFunctionality}
  TTGeoGraphServerObjectFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTGeoGraphServerObjectFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function GetInstanceByServerObject(const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean;
    property  Name: string read getName;
  end;

Type
  {TGeoGraphServerObjectFunctionality}
  TGeoGraphServerObjectFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TGeoGraphServerObjectFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    procedure AttachObject;
    procedure DetachObject;
    function getName: string;override; 
    function getHint: string;override; 
    function getGeoGraphServerID: integer;
    procedure setGeoGraphServerID(Value: integer);
    function getObjectID: integer;
    procedure setObjectID(Value: integer);
    function getBusinessModelID: integer;
    procedure setBusinessModelID(Value: integer);
    function getDomains: string;
    procedure setDomains(Value: string);
    procedure GetParams(out oGeoGraphServerID: integer; out oObjectID: integer; out oObjectType: integer; out oBusinessModel: integer);
    procedure ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
    function GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
    function GetNearestMapFormatObjects(const MaxDistance: double; out List: TByteArray): boolean;
    function GetNearestMapFormatObjectsNames(const MaxDistance: double; out Names: WideString): boolean;
    function Measurements_AddNew(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer;overload; 
    function Measurements_AddNew(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer;overload; 
    procedure Measurements_Remove(const pidMeasurement: integer);
    procedure Measurements_Item_UpdateData(const pTimeID: Double; const pData: TByteArray);
    property  Name: string read getName;
    property  GeoGraphServerID: integer read getGeoGraphServerID write setGeoGraphServerID;
    property  ObjectID: integer read getObjectID write setObjectID;
    property  BusinessModelID: integer read getBusinessModelID write setBusinessModelID;
    property  Domains: string read getDomains write setDomains;
  end;

Type
  {TTGeoGraphServerFunctionality}
  TTGeoGraphServerFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTGeoGraphServerFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetActiveInstanceList(out List: TList);overload; 
    procedure GetActiveInstanceList(out List: TByteArray);overload; 
    function GetInstanceForRegistration: integer;
    property  Name: string read getName;
  end;

Type
  {TGeoGraphServerFunctionality}
  TGeoGraphServerFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TGeoGraphServerFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    procedure SetData(DATAStream: TMemoryStream);
    function getName: string;override; 
    procedure setName(Value: string);
    function getHint: string;override; 
    function getAddress: string;
    procedure setAddress(Value: string);
    function getInternalAddress: string;
    procedure setInternalAddress(Value: string);
    function getInfo: string;
    procedure setInfo(Value: string);
    procedure GetData(out DATAStream: TMemoryStream);overload; 
    procedure GetData(out DATAStream: TByteArray);overload; 
    function RegisterObject(const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;overload; 
    function RegisterObject(const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;overload; 
    function RegisterObject(const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer;overload; 
    procedure UnRegisterObject(const ObjectID: integer);
    function ObjectCounter: integer;
    procedure ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
    procedure Object_GetProperties(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer);overload; 
    procedure Object_GetProperties(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer);overload; 
    procedure Object_SetProperties(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer);overload; 
    procedure Object_SetProperties(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer);overload; 
    function Object_GetObjectType(const ObjectID: integer): integer;
    procedure Object_SetObjectType(const ObjectID: integer; const ObjectType: integer);
    function Object_GetBusinessType(const ObjectID: integer): integer;
    procedure Object_SetBusinessType(const ObjectID: integer; const BusinessType: integer);
    function Object_GetComponentID(const ObjectID: integer): integer;
    procedure Object_SetComponentID(const ObjectID: integer; const ObjectComponentID: integer);
    procedure Object_ExecuteOperation(const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray);
    function DataID: integer;
    property  Name: string read getName write setName;
    property  Address: string read getAddress write setAddress;
    property  InternalAddress: string read getInternalAddress write setInternalAddress;
    property  Info: string read getInfo write setInfo;
  end;

Type
  {TTGeoCrdSystemFunctionality}
  TTGeoCrdSystemFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTGeoCrdSystemFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetInstanceByLatLongLocally(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);overload; 
    procedure GetInstanceByLatLongLocally(const pLatitude,pLongitude: double; out oGeoSpaceID: integer; out idCrdSys: integer);overload; 
    procedure GetInstanceByXYLocally(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);overload; 
    procedure GetInstanceByXYLocally(const pX,pY: double; out oGeoSpaceID: integer; out idCrdSys: integer);overload; 
    procedure GetInstanceList(out List: TList);overload; override; 
    procedure GetInstanceList(out List: TByteArray);overload; 
    procedure GetInstanceByLatLong(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
    procedure GetInstanceByXY(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
    property  Name: string read getName;
  end;

Type
  {TGeoCrdSystemFunctionality}
  TGeoCrdSystemFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TGeoCrdSystemFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer; pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    procedure GetDataLocally(out oGeoSpaceID: integer; out oName: string; out oDatum: string; out oProjection: string; out oProjectionData: TMemoryStream);
    procedure GetGeodesyPointsLocally(out Points: TByteArray);
    function getGeoSpaceID: integer;
    procedure setGeoSpaceID(Value: integer);
    function getName: string;override; 
    procedure setName(Value: string);
    function getHint: string;override; 
    function getDatum: string;
    procedure setDatum(Value: string);
    function getProjection: string;
    procedure setProjection(Value: string);
    procedure GetProjectionDATA(out DATAStream: TMemoryStream);overload; 
    procedure GetProjectionDATA(out DATAStream: TByteArray);overload; 
    procedure SetProjectionDATA(DATAStream: TMemoryStream);overload; 
    procedure SetProjectionDATA(DATAStream: TByteArray);overload; 
    procedure GetGeodesyPoints(out Points: TByteArray);
    property  GeoSpaceID: integer read getGeoSpaceID write setGeoSpaceID;
    property  Name: string read getName write setName;
    property  Datum: string read getDatum write setDatum;
    property  Projection: string read getProjection write setProjection;
  end;

Type
  {TTFilterVisualizationFunctionality}
  TTFilterVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTFilterVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TFilterVisualizationFunctionality}
  TFilterVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TFilterVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetParams(out FilterType: integer; out FilterDATA: TByteArray);
    procedure SetParams(const FilterType: integer; const FilterDATA: TByteArray);
    property  Name: string read getName;
  end;

Type
  {TTHINTVisualizationFunctionality}
  TTHINTVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTHINTVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    procedure GetInstanceParams(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
    procedure GetInstanceParams1(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
    procedure GetInstanceOwnerDatasAndParams(const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray);
    property  Name: string read getName;
  end;

Type
  {THINTVisualizationFunctionality}
  THINTVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: THINTVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);overload; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);overload; 
    procedure SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);overload; 
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);overload; 
    procedure GetPrivateDATA(out DATAStream: TMemoryStream);overload; 
    procedure GetPrivateDATA(out DATAStream: TMemoryStream; const MaxSize: integer);overload; 
    procedure GetPrivateDATA(out DATAStream: TByteArray);overload; 
    procedure GetPrivateDATA(out DATAStream: TByteArray; const MaxSize: integer);overload; 
    procedure SetPrivateDATA(DATAStream: TMemoryStream);overload; 
    procedure SetPrivateDATA(DATAStream: TByteArray);overload; 
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    property  Name: string read getName;
    property  DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

Type
  {TTDetailedPictureVisualizationFunctionality}
  TTDetailedPictureVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTDetailedPictureVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function CheckImportInstance(ComponentNode: IXMLDOMNode; PropsPanelsList,ComponentsFilesList: TList): integer;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TDetailedPictureVisualizationFunctionality}
  TDetailedPictureVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TDetailedPictureVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function ReflectOnCanvas(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    procedure SetParams(const pWidth: integer; const pHeight: integer);
    procedure SetProportion(const Value: double);
    procedure Clear;
    function GetSegmentsStorageType: integer;
    procedure SetSegmentsStorageType(Value: integer);
    function ContainerFilled: boolean;override; 
    procedure GetLevelsInfoLocally(out Info: TByteArray);
    function TLevelsPropsPanel_Create: TForm;
    procedure Level_ConvertPixPosToXY(const idLevel: integer; const PixX,PixY: integer; out X,Y: double);
    procedure Level_ConvertXYToPixPos(const idLevel: integer; const X,Y: double; out PixX,PixY: integer);
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GenerateFromImage(DATAStream: TByteArray);
    procedure GenerateFromTiles(const TilesFolder: string; const SizePowerOf2: integer);
    procedure RegenerateRegionFromLevel(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
    procedure RegenerateRegion(const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer);
    procedure AddNewLevelAndRegenerate;
    procedure GetLevelsInfo(out Info: TByteArray);
    procedure Level_GetParams(const idLevel: integer; out DivX: integer; out DivY: integer; out SegmentWidth: double; out SegmentHeight: double; out VisibleMinScale: double; out VisibleMaxScale: double);
    procedure Level_SetParams(const idLevel: integer; const DivX: integer; const DivY: integer; const SegmentWidth: double; const SegmentHeight: double; const VisibleMinScale: double; const VisibleMaxScale: double);
    procedure Level_GetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out Segments: TByteArray);
    procedure Level_GetSegmentsByIDs(const idLevel: integer; const SegmentsIDs: TByteArray; out Segments: TByteArray);
    procedure Level_GetSegmentsHashes(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const ExceptSegments: TByteArray; out SegmentsHashes: TByteArray);
    procedure Level_SetSegments(const idLevel: integer; const XIndexMin,XIndexMax: integer; const YIndexMin,YIndexMax: integer; const Segments: TByteArray);
    procedure GetParams(out oWidth: integer; out oHeight: integer);
    procedure GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
    property  Name: string read getName;
  end;

Type
  {TTCoVisualizationFunctionality}
  TTCoVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTCoVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TCoVisualizationFunctionality}
  TCoVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TCoVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    procedure UpdateContainer(out oContainer: TExtendedContainerCoord);
    procedure DATAFile_Clear;
    function GetOwnSpaceHINTVisualizationLocally(out idHINTVisualization: integer): boolean;
    procedure ToClone(out idClone: integer);override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetSpace(out DATAStream: TMemoryStream);overload; 
    procedure GetSpace(out DATAStream: TMemoryStream; const MaxSize: integer);overload; 
    procedure GetSpace(out DATAStream: TByteArray);overload; 
    procedure GetSpace(out DATAStream: TByteArray; const MaxSize: integer);overload; 
    procedure SetSpace(DATAStream: TMemoryStream);overload; 
    procedure SetSpace(DATAStream: TByteArray);overload; 
    function GetOwnSpaceHINTVisualization(out idHINTVisualization: integer): boolean;
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure Pack;
    procedure UnPack;
    function IsPacked: boolean;
    property  Name: string read getName;
    property  DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

Type
  {TTForumMessageFunctionality}
  TTForumMessageFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTForumMessageFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TForumMessageFunctionality}
  TForumMessageFunctionality = class(TComponentFunctionality)
    public
      _FunctionalityUserID: integer;
      _idForum: integer;
      _idUser: integer;
      _SentTime: TDateTime;
      _idForMessage: integer;
      _LastModified: TDateTime;
      _Message: TMemoryStream;


    RemotedFunctionality: TForumMessageFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure UpdateDATA;override; 
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function FunctionalityUserID: integer;
    procedure setidUser(Value: integer);
    procedure Modified;
    function getName: string;override; 
    function getHint: string;override; 
    function getidForum: integer;
    procedure setidForum(Value: integer);
    function idUser: integer;
    procedure Send;
    function SentTime: TDateTime;
    function getidForMessage: integer;
    procedure setidForMessage(Value: integer);
    function LastModified: TDateTime;
    procedure GetMessage(out Message: TMemoryStream);overload; 
    procedure GetMessage(out Message: TByteArray);overload; 
    procedure SetMessage(const Message: TMemoryStream);overload; 
    procedure SetMessage(const Message: TByteArray);overload; 
    function ReplyMessageCount: integer;
    procedure GetReplyMessageList(out MessageList: TList);overload; 
    procedure GetReplyMessageList(out MessageList: TByteArray);overload; 
    property  Name: string read getName;
    property  idForum: integer read getidForum write setidForum;
    property  idForMessage: integer read getidForMessage write setidForMessage;
  end;

Type
  {TTForumFunctionality}
  TTForumFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTForumFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TForumFunctionality}
  TForumFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TForumFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    procedure DeleteOldMessages(const pMessageLifeTime: TDateTime);
    function getName: string;override; 
    procedure setName(Value: string);
    function getMessageLifeTime: TDateTime;
    procedure setMessageLifeTime(Value: TDateTime);
    function getHint: string;override; 
    function RootMessageCount: integer;
    procedure GetRootMessageList(out MessageList: TList);overload; 
    procedure GetRootMessageList(out MessageList: TByteArray);overload; 
    function MessageCount: integer;
    procedure GetMessageList(out MessageList: TList);overload; 
    procedure GetMessageList(out MessageList: TByteArray);overload; 
    function AddMessage(const pidUser: integer; const pidForMessage: integer): integer;
    procedure DestroyMessage(const pidMessage: integer);
    property  Name: string read getName write setName;
    property  MessageLifeTime: TDateTime read getMessageLifeTime write setMessageLifeTime;
  end;

Type
  {TTCUSTOMVisualizationFunctionality}
  TTCUSTOMVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTCUSTOMVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TCUSTOMVisualizationFunctionality}
  TCUSTOMVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TCUSTOMVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function ContainerFilled: boolean;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getMODULEName: string;
    procedure setMODULEName(Value: string);
    function getFunctionName: string;
    procedure setFunctionName(Value: string);
    function getFunctionVersion: integer;
    procedure setFunctionVersion(Value: integer);
    procedure GetParams(out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer);
    property  Name: string read getName;
    property  MODULEName: string read getMODULEName write setMODULEName;
    property  FunctionName: string read getFunctionName write setFunctionName;
    property  FunctionVersion: integer read getFunctionVersion write setFunctionVersion;
  end;

Type
  {TTOLEVisualizationFunctionality}
  TTOLEVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTOLEVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TOLEVisualizationFunctionality}
  TOLEVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TOLEVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    procedure LoadFromFile(const FileName: string);override; 
    procedure SaveToFile(const FileName: string);
    procedure EditDATA;
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function DATASize: integer;
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out Value: TClientBlobStream);overload; 
    procedure GetDATA(out Value: TClientBlobStream; const MaxSize: integer);overload; 
    procedure GetDATA(out Value: TByteArray);overload; 
    procedure GetDATA(out Value: TByteArray; const MaxSize: integer);overload; 
    procedure SetDATA(Value: TMemoryStream);overload; 
    procedure SetDATA(Value: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TTHTMLVisualizationFunctionality}
  TTHTMLVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTHTMLVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {THTMLVisualizationFunctionality}
  THTMLVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: THTMLVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    procedure SaveToFile(const FileName: string);
    procedure EditDATA;
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getWidth: integer;
    procedure setWidth(Value: integer);
    procedure GetDATA(out Value: TClientBlobStream);overload; 
    procedure GetDATA(out Value: TClientBlobStream; const MaxSize: integer);overload; 
    procedure GetDATA(out Value: TByteArray);overload; 
    procedure GetDATA(out Value: TByteArray; const MaxSize: integer);overload; 
    procedure SetDATA(Value: TMemoryStream);overload; 
    procedure SetDATA(Value: TByteArray);overload; 
    property  Name: string read getName;
    property  Width: integer read getWidth write setWidth;
  end;

Type
  {TTBZRVisualizationFunctionality}
  TTBZRVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTBZRVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TBZRVisualizationFunctionality}
  TBZRVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TBZRVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTAGIFVisualizationFunctionality}
  TTAGIFVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTAGIFVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TAGIFVisualizationFunctionality}
  TAGIFVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    private
      XF: XFORM;
      _Width: Double;
      b: Double;
    public

    RemotedFunctionality: TAGIFVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function ContainerFilled: boolean;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out Value: TClientBlobStream);overload; 
    procedure GetDATA(out Value: TClientBlobStream; const MaxSize: integer);overload; 
    procedure GetDATA(out Value: TByteArray);overload; 
    procedure GetDATA(out Value: TByteArray; const MaxSize: integer);overload; 
    procedure SetDATA(Value: TMemoryStream);overload; 
    procedure SetDATA(Value: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TTOrientedVIDEOVisualizationFunctionality}
  TTOrientedVIDEOVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTOrientedVIDEOVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TOrientedVIDEOVisualizationFunctionality}
  TOrientedVIDEOVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    private
      Xc: Double;
      Yc: Double;
      D: Double;
    public

    RemotedFunctionality: TOrientedVIDEOVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getDataServer: string;
    procedure setDataServer(Value: string);
    function getObjectID: integer;
    procedure setObjectID(Value: integer);
    property  Name: string read getName;
    property  DataServer: string read getDataServer write setDataServer;
    property  ObjectID: integer read getObjectID write setObjectID;
  end;

Type
  {TTVIDEOVisualizationFunctionality}
  TTVIDEOVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTVIDEOVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TVIDEOVisualizationFunctionality}
  TVIDEOVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    private
      XF: XFORM;
      _Width: Double;
      b: Double;
    public

    RemotedFunctionality: TVIDEOVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TVisualizationUpdating_Create(Reflecting: TReflecting): TObject;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function ContainerFilled: boolean;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getDataServer: string;
    procedure setDataServer(Value: string);
    function getObjectID: integer;
    procedure setObjectID(Value: integer);
    property  Name: string read getName;
    property  DataServer: string read getDataServer write setDataServer;
    property  ObjectID: integer read getObjectID write setObjectID;
  end;

Type
  {TTOPPVisualizationFunctionality}
  TTOPPVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTOPPVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TOPPVisualizationFunctionality}
  TOPPVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TOPPVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getPropsPanel_idTObj: integer;
    procedure setPropsPanel_idTObj(Value: integer);
    function getPropsPanel_idObj: integer;
    procedure setPropsPanel_idObj(Value: integer);
    procedure GetParams(out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer);
    property  Name: string read getName;
    property  PropsPanel_idTObj: integer read getPropsPanel_idTObj write setPropsPanel_idTObj;
    property  PropsPanel_idObj: integer read getPropsPanel_idObj write setPropsPanel_idObj;
  end;

Type
  {TTMODELServerFunctionality}
  TTMODELServerFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTMODELServerFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function GetInstanceByIPAddress(const IPAddress: string;  out id: integer): boolean;
    property  Name: string read getName;
  end;

Type
  {TMODELServerFunctionality}
  TMODELServerFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TMODELServerFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    procedure setName(Value: string);
    function getHint: string;override; 
    function getIPAddress: string;
    procedure setIPAddress(Value: string);
    function IsUserExist(const _UserName,_UserPassword: string): boolean;
    function GetUserID(const _UserName,_UserPassword: string): integer;
    function IsOnLine: boolean;
    function Info: string;
    procedure GetLicense(out License: WideString);
    procedure CreateNewUserByDefaultPrototype(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer);
    procedure CreateNewUserByDefaultPrototype1(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString; const Signature: WideString;  out idNewUser: integer);
    property  Name: string read getName write setName;
    property  IPAddress: string read getIPAddress write setIPAddress;
  end;

Type
  {TTCoReferenceFunctionality}
  TTCoReferenceFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTCoReferenceFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TCoReferenceFunctionality}
  TCoReferenceFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TCoReferenceFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    procedure ShowReferencedObjectPanelProps;
    function getName: string;override; 
    procedure setName(Value: string);override; 
    function getHint: string;override; 
    procedure GetReferencedObject(out idTReferencedObject,idReferencedObject: integer);
    procedure SetReferencedObject(const idTReferencedObject,idReferencedObject: integer);
    property  Name: string read getName write setName;
  end;

Type
  {TTPositionerFunctionality}
  TTPositionerFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTPositionerFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TPositionerFunctionality}
  TPositionerFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TPositionerFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    procedure SetPosition;
    function getName: string;override; 
    function getHint: string;override; 
    procedure Get2DPosition(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
    procedure Save2DPosition(Reflector: TReflector);overload; 
    procedure Save2DPosition(const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);overload; 
    function getPositionName: string;
    procedure setPositionName(Value: string);
    property  Name: string read getName;
    property  PositionName: string read getPositionName write setPositionName;
  end;

Type
  {TTOrientedWMFVisualizationFunctionality}
  TTOrientedWMFVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTOrientedWMFVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TOrientedWMFVisualizationFunctionality}
  TOrientedWMFVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TOrientedWMFVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure DoOnChangeScale(const ChangeCoef: Double);override; 
    procedure LoadFromFile(const FileName: string);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);overload; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);overload; 
    procedure GetJPEGDATA(out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);overload; 
    procedure GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);overload; 
    procedure SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);overload; 
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);overload; 
    function getWidth: Double;
    procedure setWidth(Value: Double);
    function getHeight: Double;
    procedure setHeight(Value: Double);
    function getOrientation: integer;
    procedure setOrientation(Value: integer);
    procedure ChangeScale(const ScaleFactor: Double);
    procedure UpdateContainer;
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    function IsNewContainerAcceptable(const NewWidth,NewHeight,NewScale: Double): boolean;
    procedure GetParams(out oWidth: Double; out oHeight: Double; out oOrientation: integer);
    property  Name: string read getName;
    property  DATAFileID: integer read getDATAFileID write setDATAFileID;
    property  Width: Double read getWidth write setWidth;
    property  Height: Double read getHeight write setHeight;
    property  Orientation: integer read getOrientation write setOrientation;
  end;

Type
  {TTCELLVisualizationFunctionality}
  TTCELLVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTCELLVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TCELLVisualizationFunctionality}
  TCELLVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TCELLVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure DoOnChangeScale(const ChangeCoef: Double);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    procedure SetReflectorView;
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
    procedure Change(const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer);
    function GetFormatNodes(out NodesList: TList; out SizeX,SizeY: integer): boolean;overload; override; 
    function GetFormatNodes(out NodesList: TByteArray; out SizeX,SizeY: integer): boolean;overload; 
    procedure DoQuad;
    procedure GetInsideObjectsList(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TComponentsList);overload; 
    procedure GetInsideObjectsList(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray);overload; 
    function getColCount: integer;
    procedure setColCount(Value: integer);
    function getRowCount: integer;
    procedure setRowCount(Value: integer);
    function getLineWidth: Double;
    procedure setLineWidth(Value: Double);
    function getColSize: Double;
    function getRowSize: Double;
    procedure GetParams(out oColCount: integer; out oRowCount: integer; out oLineWidth: Double);
    property  Name: string read getName;
    property  ColCount: integer read getColCount write setColCount;
    property  RowCount: integer read getRowCount write setRowCount;
    property  LineWidth: Double read getLineWidth write setLineWidth;
    property  ColSize: Double read getColSize;
    property  RowSize: Double read getRowSize;
  end;

Type
  {TTEllipseVisualizationFunctionality}
  TTEllipseVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTEllipseVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TEllipseVisualizationFunctionality}
  TEllipseVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TEllipseVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure DoOnChangeScale(const ChangeCoef: Double);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getColor: TColor;
    procedure setColor(Value: TColor);
    function getBorderColor: TColor;
    procedure setBorderColor(Value: TColor);
    function getBorderWidth: Double;
    procedure setBorderWidth(Value: Double);
    property  Name: string read getName;
    property  Color: TColor read getColor write setColor;
    property  BorderColor: TColor read getBorderColor write setBorderColor;
    property  BorderWidth: Double read getBorderWidth write setBorderWidth;
  end;

Type
  {TTWMFVisualizationFunctionality}
  TTWMFVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTWMFVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TWMFVisualizationFunctionality}
  TWMFVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TWMFVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);overload; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);overload; 
    procedure GetJPEGDATA(out DATAStream: TMemoryStream; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);overload; 
    procedure GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);overload; 
    procedure SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);overload; 
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);overload; 
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    procedure SetProportion;
    property  Name: string read getName;
    property  DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

Type
  {TTPictureVisualizationFunctionality}
  TTPictureVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTPictureVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TPictureVisualizationFunctionality}
  TPictureVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TPictureVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    function ContainerFilled: boolean;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);overload; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);overload; 
    procedure SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);overload; 
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);overload; 
    procedure GetBMP(out BMP: TBitmap);overload; 
    procedure GetBMP(out BMP: TByteArray);overload; 
    procedure SetProportion;
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    procedure GetParams(out VisibleMinScale: double; out VisibleMaxScale: double);
    procedure SetParams(const VisibleMinScale: double; const VisibleMaxScale: double);
    property  Name: string read getName;
    property  DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

Type
  {TTRoundVisualizationFunctionality}
  TTRoundVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTRoundVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TRoundVisualizationFunctionality}
  TRoundVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TRoundVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure DoOnChangeScale(const ChangeCoef: Double);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getColor: TColor;
    procedure setColor(Value: TColor);
    function getBorderColor: TColor;
    procedure setBorderColor(Value: TColor);
    function getBorderWidth: Double;
    procedure setBorderWidth(Value: Double);
    property  Name: string read getName;
    property  Color: TColor read getColor write setColor;
    property  BorderColor: TColor read getBorderColor write setBorderColor;
    property  BorderWidth: Double read getBorderWidth write setBorderWidth;
  end;

Type
  {TTGeodesyPointFunctionality}
  TTGeodesyPointFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTGeodesyPointFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function ConvertSpaceCRDToGeoCRD(const X,Y: Double; out Latitude,Longitude: Double): boolean;
    function ConvertGeoCRDToSpaceCRD(const Latitude,Longitude: Double; out X,Y: Double): boolean;
    procedure GetNearestCrdSys(const pLatitude,pLongitude: double; out idCrdSys: integer);
    procedure GetInstanceListByCrdSys(const idCrdSys: integer; out List: TByteArray);
    function CrdSys_GetNearestGeoPoints(const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean;
    function CrdSys_GetNearestXYPoints(const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean;
    property  Name: string read getName;
  end;

Type
  {TGeodesyPointFunctionality}
  TGeodesyPointFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TGeodesyPointFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getidCrdSys: integer;
    procedure setidCrdSys(Value: integer);
    function getX: Double;
    procedure setX(Value: Double);
    function getY: Double;
    procedure setY(Value: Double);
    function getLatitude: Double;
    procedure setLatitude(Value: Double);
    function getLongitude: Double;
    procedure setLongitude(Value: Double);
    procedure GetParams(out oidCrdSys: integer; out oX,oY: double; out oLatitude,oLongitude: double);
    procedure SetParams(const pidCrdSys: integer; const pX,pY: double; const pLatitude,pLongitude: double);
    procedure ValidateByVisualizationComponent;
    property  Name: string read getName;
    property  idCrdSys: integer read getidCrdSys write setidCrdSys;
    property  X: Double read getX write setX;
    property  Y: Double read getY write setY;
    property  Latitude: Double read getLatitude write setLatitude;
    property  Longitude: Double read getLongitude write setLongitude;
  end;

Type
  {TTPrivateAreaVisualizationFunctionality}
  TTPrivateAreaVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTPrivateAreaVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function CanCreateAsDetail: boolean;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TPrivateAreaVisualizationFunctionality}
  TPrivateAreaVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TPrivateAreaVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getAcquireObjectsInside: boolean;
    procedure setAcquireObjectsInside(Value: boolean);
    property  Name: string read getName;
    property  AcquireObjectsInside: boolean read getAcquireObjectsInside write setAcquireObjectsInside;
  end;

Type
  {TTHyperTextFunctionality}
  TTHyperTextFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTHyperTextFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {THyperTextFunctionality}
  THyperTextFunctionality = class(TComponentFunctionality)
    public
      _DATA: TClientBlobStream;
      

    RemotedFunctionality: THyperTextFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure UpdateDATA;override; 
    procedure ClearDATA;override; 
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    procedure LoadFromFile(const FileName: string);override; 
    procedure SaveToFile(const FileName: string);
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out Value: TClientBlobStream);overload; 
    procedure GetDATA(out Value: TByteArray);overload; 
    procedure SetDATA(Value: TMemoryStream);overload; 
    procedure SetDATA(Value: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TTComponentsFindServiceFunctionality}
  TTComponentsFindServiceFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTComponentsFindServiceFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TComponentsFindServiceFunctionality}
  TComponentsFindServiceFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TComponentsFindServiceFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTUsersServiceFunctionality}
  TTUsersServiceFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTUsersServiceFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TUsersServiceFunctionality}
  TUsersServiceFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TUsersServiceFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTTransportServiceFunctionality}
  TTTransportServiceFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTTransportServiceFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TTransportServiceFunctionality}
  TTransportServiceFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TTransportServiceFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTMarketServiceFunctionality}
  TTMarketServiceFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTMarketServiceFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TMarketServiceFunctionality}
  TMarketServiceFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TMarketServiceFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTTelecomServiceFunctionality}
  TTTelecomServiceFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTTelecomServiceFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TTelecomServiceFunctionality}
  TTelecomServiceFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TTelecomServiceFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTWNDVisualizationFunctionality}
  TTWNDVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTWNDVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TWNDVisualizationFunctionality}
  TWNDVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TWNDVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    function ContainerFilled: boolean;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);overload; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);overload; 
    procedure SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);overload; 
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);overload; 
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    property  Name: string read getName;
    property  DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

Type
  {TTMRKVisualizationFunctionality}
  TTMRKVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTMRKVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TMRKVisualizationFunctionality}
  TMRKVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TMRKVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    procedure DoOnComponentUpdate;override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);overload; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);overload; 
    procedure SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);overload; 
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);overload; 
    function getBindingPointIndex: integer;
    procedure setBindingPointIndex(Value: integer);
    function getAlign: TMRKVisualizationAlign;
    function getAlign1: integer;
    procedure setAlign(Value: TMRKVisualizationAlign);
    procedure setAlign1(Value: integer);
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    procedure GetParams(out oAlign: integer; out oBindingPointIndex: integer);
    property  Name: string read getName;
    property  DATAFileID: integer read getDATAFileID write setDATAFileID;
    property  BindingPointIndex: integer read getBindingPointIndex write setBindingPointIndex;
    property  Align: TMRKVisualizationAlign read getAlign write setAlign;
  end;

Type
  {TTOrientedPictureVisualizationFunctionality}
  TTOrientedPictureVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTOrientedPictureVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TOrientedPictureVisualizationFunctionality}
  TOrientedPictureVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TOrientedPictureVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    procedure DoOnChangeScale(const ChangeCoef: Double);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType);overload; 
    procedure GetDATA(out DATAStream: TMemoryStream; out DATAType: TComponentFileType; const MaxSize: integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);overload; 
    procedure SetDATA(DATAStream: TMemoryStream; const DATAType: TComponentFileType);overload; 
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);overload; 
    function getWidth: Double;
    procedure setWidth(Value: Double);
    function getHeight: Double;
    procedure setHeight(Value: Double);
    function getOrientation: integer;
    procedure setOrientation(Value: integer);
    procedure ChangeScale(const ScaleFactor: Double);
    procedure UpdateContainer;
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    function IsNewContainerAcceptable(const NewWidth,NewHeight,NewScale: Double): boolean;
    procedure GetParams(out oWidth: Double; out oHeight: Double; out oOrientation: integer);
    property  Name: string read getName;
    property  DATAFileID: integer read getDATAFileID write setDATAFileID;
    property  Width: Double read getWidth write setWidth;
    property  Height: Double read getHeight write setHeight;
    property  Orientation: integer read getOrientation write setOrientation;
  end;

Type
  {TTOrientedTTFVisualizationFunctionality}
  TTOrientedTTFVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTOrientedTTFVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TOrientedTTFVisualizationFunctionality}
  TOrientedTTFVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TOrientedTTFVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure DoOnChangeScale(const ChangeCoef: Double);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getStr: string;
    procedure setStr(const Value: string);
    function getColor: TColor;
    procedure setColor(Value: TColor);
    function getFont_Name: string;
    procedure setFont_Name(Value: string);
    function getFont_Width: Double;
    procedure setFont_Width(Value: Double);
    function getFont_Height: Double;
    procedure setFont_Height(Value: Double);
    function getCharInterval: Double;
    procedure setCharInterval(Value: Double);
    function getOrientation: integer;
    procedure setOrientation(Value: integer);
    procedure UpdateContainer;
    function IsNewContainerAcceptable(const NewFontWidth,NewFontHeight,NewCharInterval: Double; const flNewStr: boolean; const NewStr: string): boolean;
    procedure GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString; out oCharInterval: Double; out oOrientation: integer);
    procedure SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString; const pCharInterval: Double; const pOrientation: integer);
    property  Name: string read getName;
    property  Str: string read getStr write setStr;
    property  Color: TColor read getColor write setColor;
    property  Font_Name: string read getFont_Name write setFont_Name;
    property  Font_Width: Double read getFont_Width write setFont_Width;
    property  Font_Height: Double read getFont_Height write setFont_Height;
    property  CharInterval: Double read getCharInterval write setCharInterval;
    property  Orientation: integer read getOrientation write setOrientation;
  end;

Type
  {TTIconFunctionality}
  TTIconFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTIconFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TIconFunctionality}
  TIconFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TIconFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out DATAStream: TClientBlobStream; out DATAType: TImageDATAType);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);overload; 
    procedure SetDATA(DATAStream: TMemoryStream; const DATAType: TImageDATAType);overload; 
    procedure SetDATA(DATAStream: TByteArray; const DATAType: Integer);overload; 
    procedure GetBitmapDATA(out BMPDATAStream: TMemoryStream);overload; 
    procedure GetBitmapDATA(out BMPDATAStream: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TTMessageBoardMessageFunctionality}
  TTMessageBoardMessageFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTMessageBoardMessageFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TMessageBoardMessageFunctionality}
  TMessageBoardMessageFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TMessageBoardMessageFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getIdMessageBoard: integer;
    procedure setIdMessageBoard(Value: integer);
    function getIdSenderMessageBoard: integer;
    procedure setIdSenderMessageBoard(Value: integer);
    function DateCreated: TDateTime;
    function getSubject: string;
    procedure setSubject(Value: string);
    procedure GetBody(Value: TStringList);overload; 
    procedure GetBody(out Value: TByteArray);overload; 
    procedure SetBody(Value: TStringList);overload; 
    procedure SetBody(Value: TByteArray);overload; 
    function getFlRead: boolean;
    procedure setFlRead(Value: boolean);
    function IsEmpty: boolean;
    function IsCreatedByUser(const pidUser: integer): boolean;
    property  Name: string read getName;
    property  idMessageBoard: integer read getIdMessageBoard write setIdMessageBoard;
    property  idSenderMessageBoard: integer read getIdSenderMessageBoard write setIdSenderMessageBoard;
    property  Subject: string read getSubject write setSubject;
    property  flRead: boolean read getFlRead write setFlRead;
  end;

Type
  {TTMessageBoardFunctionality}
  TTMessageBoardFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTMessageBoardFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TMessageBoardFunctionality}
  TMessageBoardFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TMessageBoardFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    procedure setName(Value: string);
    function getHint: string;override; 
    function IsUnreadMessageExist: boolean;
    procedure GetMessagesList(out List: TList);overload; 
    procedure GetMessagesList(out List: TByteArray);overload; 
    function CreateNewMessage: integer;
    procedure SendMessage(const idMessage: integer);
    function getIdUser: integer;
    procedure setIdUser(Value: integer);
    property  Name: string read getName write setName;
    property  idUser: integer read getIdUser write setIdUSer;
  end;

Type
  {TTHREFFunctionality}
  TTHREFFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTHREFFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {THREFFunctionality}
  THREFFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: THREFFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;override; 
    procedure Activate;
    function getName: string;override; 
    function getHint: string;override; 
    function getURL: string;
    procedure setURL(Value: string);
    function getAutoStart: boolean;
    procedure setAutoStart(Value: boolean);
    property  Name: string read getName;
    property  URL: string read getURL write setURL;
    property  AutoStart: boolean read getAutoStart write setAutoStart;
  end;

Type
  {TTQDCVisualizationFunctionality}
  TTQDCVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTQDCVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TQDCVisualizationFunctionality}
  TQDCVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TQDCVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function GetDATA(out DATAPtr: pointer): boolean;
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure SetDATA(DATAStream: TMemoryStream);overload; 
    procedure SetDATA(DATAStream: TByteArray);overload; 
    procedure LoadFromBitmap(Bitmap: TBitmap);overload; 
    procedure LoadFromBitmap(Bitmap: TByteArray);overload; 
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    property  Name: string read getName;
    property  DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

Type
  {TTOffersServerFunctionality}
  TTOffersServerFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTOffersServerFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TOffersServerFunctionality}
  TOffersServerFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TOffersServerFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getMailROBOT_Inbox: string;
    procedure setMailROBOT_Inbox(Value: string);
    function getMailROBOT_User: string;
    procedure setMailROBOT_User(Value: string);
    function getMailROBOT_Password: string;
    procedure setMailROBOT_Password(Value: string);
    property  Name: string read getName;
    property  MailROBOT_Inbox: string read getMailROBOT_Inbox write setMailROBOT_Inbox;
    property  MailROBOT_User: string read getMailROBOT_User write setMailROBOT_User;
    property  MailROBOT_Password: string read getMailROBOT_Password write setMailROBOT_Password;
  end;

Type
  {TTSecurityComponentOperationFunctionality}
  TTSecurityComponentOperationFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTSecurityComponentOperationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetInstanceListByContext(const Context: WideString; out List: TList);overload; 
    procedure GetInstanceListByContext(const Context: WideString; out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TSecurityComponentOperationFunctionality}
  TSecurityComponentOperationFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TSecurityComponentOperationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    procedure setName(Value: string);
    function getHint: string;override; 
    function getSQLInfo: string;
    procedure setSQLInfo(Value: string);
    property  Name: string read getName write setName;
    property  SQLInfo: string read getSQLInfo write setSQLInfo;
  end;

Type
  {TTSecurityKeyFunctionality}
  TTSecurityKeyFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTSecurityKeyFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function GetInstanceByCode(const Code: string;  out idInstance: integer): boolean;
    procedure GetInstanceListByContext(const Context: WideString; out List: TList);overload; 
    procedure GetInstanceListByContext(const Context: WideString; out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TSecurityKeyFunctionality}
  TSecurityKeyFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TSecurityKeyFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    procedure setName(Value: string);
    function getHint: string;override; 
    function getInfo: string;
    procedure setInfo(Value: string);
    procedure GetAssotiatedUsers(out Users: TList);overload; 
    procedure GetAssotiatedUsers(out Users: TByteArray);overload; 
    procedure GenerateCode;
    function Code: string;
    property  Name: string read getName write setName;
    property  Info: string read getInfo write setInfo;
  end;

Type
  {TTSecurityFileFunctionality}
  TTSecurityFileFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTSecurityFileFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetInstanceListByContext(const Context: WideString; out List: TList);overload; 
    procedure GetInstanceListByContext(const Context: WideString;out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TSecurityFileFunctionality}
  TSecurityFileFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TSecurityFileFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    procedure setName(Value: string);
    function getHint: string;override; 
    function getInfo: string;
    procedure setInfo(Value: string);
    function GetDATA(out Value: TClientBlobStream): boolean;overload; 
    function GetDATA(out Value: TByteArray): boolean;overload; 
    procedure SetDATA(Value: TMemoryStream);overload; 
    procedure SetDATA(Value: TByteArray);overload; 
    function AddOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
    function RemoveOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
    procedure GetAssotiatedSecurityComponents(out SecurityComponents: TList);overload; 
    procedure GetAssotiatedSecurityComponents(out SecurityComponents: TByteArray);overload; 
    property  Name: string read getName write setName;
    property  Info: string read getInfo write setInfo;
  end;

Type
  {TTSecurityComponentFunctionality}
  TTSecurityComponentFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTSecurityComponentFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure DestroyInstance(const idObj: integer);override; 
    property  Name: string read getName;
  end;

Type
  {TSecurityComponentFunctionality}
  TSecurityComponentFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TSecurityComponentFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    procedure ToClone(out idClone: integer);override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getIdSecurityFile: integer;
    procedure setIdSecurityFile(Value: integer);
    property  Name: string read getName;
    property  idSecurityFile: integer read getIdSecurityFile write setIdSecurityFile;
  end;

Type
  {TTMODELUserFunctionality}
  TTMODELUserFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTMODELUserFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function IsUserExist(const UserName: string; out idUser: integer): boolean;
    procedure GetInstanceListByContext(const Context: WideString; out List: TList);overload; 
    procedure GetInstanceListByContext(const Context: WideString; out List: TByteArray);overload; 
    procedure GetOnlineUsersForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TList);overload; 
    procedure GetOnlineUsersForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);overload; 
    procedure GetOnlineExpertsForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TList);overload; 
    procedure GetOnlineExpertsForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TMODELUserFunctionality}
  TMODELUserFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TMODELUserFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getHint: string;override; 
    function GetActiveStateInfo(out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean;
    function IsUserOnLine(const MaxDelay: Double): boolean;
    procedure Logout;
    procedure GetSecurityKeysList(out SecurityKeys: TList);overload; 
    procedure GetSecurityKeysList(out SecurityKeys: TByteArray);overload; 
    function SecurityKeys_IsKeyExist(const idSecurityKey: integer): boolean;
    procedure SecurityKeys_Insert(const idSecurityKey: integer);
    procedure SecurityKeys_Delete(const idSecurityKey: integer);
    procedure SecurityKeys_AddKeyByCode(const Code: WideString);
    procedure SecurityKeys_RemoveKeyByCode(const Code: WideString);
    function SecurityKeys_CreateAndAddNewKey(const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer;
    procedure GetMessageBoards(out List: TList);overload; 
    procedure GetMessageBoards(out List: TByteArray);overload; 
    function HaveUnreadMessages: boolean;
    procedure GetMessages(const flUnreadOnly: boolean; out MessageList: TList);overload; 
    procedure GetMessages(const flUnreadOnly: boolean; out MessageList: TByteArray);overload; 
    procedure IncomingMessages_SendNew(const Message: TMemoryStream; const SenderID: integer);overload; 
    procedure IncomingMessages_SendNew(const Message: TByteArray; const SenderID: integer);overload; 
    function IncomingMessages_GetUnread(out MessageList: TList): boolean;overload; 
    function IncomingMessages_GetUnread(out MessageList: TByteArray): boolean;overload; 
    procedure IncomingMessages_GetMessagesSince(const TimeStamp: TDateTime; out MessageList: TList);overload; 
    procedure IncomingMessages_GetMessagesSince(const TimeStamp: TDateTime; out MessageList: TByteArray);overload; 
    procedure IncomingMessages_GetMessage(const MessageID: integer; out TimeStamp: TDateTime; out Message: TClientBlobStream; out SenderID: integer);overload; 
    procedure IncomingMessages_GetMessage(const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer);overload; 
    procedure IncomingMessages_DeleteTo(const TimeStamp: TDateTime);
    function getName: string;override; 
    procedure setName(Value: string);
    function getFullName: string;
    procedure setFullName(Value: string);
    function getContactInfo: string;
    procedure setContactInfo(Value: string);
    function getPassword: string;
    procedure setPassword(Value: string);
    function getIdSecurityFileForClone: integer;
    procedure setIdSecurityFileForClone(Value: integer);
    function getidSecurityFileForPrivate: integer;
    procedure setidSecurityFileForPrivate(Value: integer);
    function getDATASize: integer;
    procedure setDATASize(Value: integer);
    function getMaxDATASize: integer;
    procedure setMaxDATASize(Value: integer);
    function getSpaceSquare: Double;
    procedure setSpaceSquare(Value: Double);
    function getMaxSpaceSquare: integer;
    procedure setMaxSpaceSquare(Value: integer);
    function getMaxSpaceSquarePerObject: integer;
    procedure setMaxSpaceSquarePerObject(Value: integer);
    function getDisabled: boolean;
    procedure setDisabled(Value: boolean);
    procedure GetStartObj(out idTStartObj,idStartObj: integer);
    procedure SetStartObj(const idTStartObj,idStartObj: integer);
    function getDomains: string;
    procedure setDomains(Value: string);
    function getTaskEnabled: boolean;
    procedure setTaskEnabled(Value: boolean);
    function getBillingType: integer;
    procedure setBillingType(Value: integer);
    procedure CheckDATASize(const pAddDATASize: integer);
    procedure AddDATASize(const pAddDATASize: integer);
    procedure SubDATASize(const pSubDATASize: integer);
    procedure CheckSpaceSquare(const pAddSpaceSquare: Double);
    procedure AddSpaceSquare(const pAddSpaceSquare: Double);
    procedure SubSpaceSquare(const pSubSpaceSquare: Double);
    procedure CheckMaxSpaceSquarePerObject(const pObjectSpaceSquare: Double);
    procedure ServerFolder_GetSubFoldersList(const RelativePath: WideString; out List: WideString);
    procedure ServerFolder_GetFilesList(const RelativePath: WideString; out List: WideString);
    function ServerFolder_AddFile(const RelativePath: WideString; const FileName: WideString; const FileData: TByteArray): boolean;
    function ServerFolder_RemoveFile(const RelativePath: WideString; const FileName: WideString): boolean;
    function ServerFolder_ReadFile(const RelativePath: WideString; const FileName: WideString; out FileData: TByteArray): boolean;
    function ServerFolder_AddSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;overload; 
    function ServerFolder_AddSubFolder(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean;overload; 
    function ServerFolder_RemoveSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;
    function ServerFolder_ReadSubFolder(const Version: integer; const RelativePath: WideString; const SubFolderName: WideString; const Excludes: WideString; out SubFolderData: TByteArray): boolean;
    function ServerFolder_ExchangeSubFolder(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderInData: TByteArray; const Excludes: WideString; out SubFolderOutData: TByteArray): boolean;
    function Tasks_AddNew(const pPriority: integer; const pType: integer; const pService: integer; const pTaskData: TByteArray; const pComment: string): integer;
    procedure Tasks_RemoveItem(const idTask: integer);
    procedure Tasks_Clear;
    procedure Tasks_GetData(const Version: integer; const flOnlyActive: boolean; out oData: TByteArray);
    procedure Tasks_Item_GetTaskData(const idTask: integer; out oTaskData: TByteArray);
    procedure Tasks_Item_SetPriority(const idTask: integer; const pPriority: integer);
    procedure Tasks_Item_GetStatus(const idTask: integer; out oStatus: integer; out oStatusReason: integer; out oStatusComment: string);
    procedure Tasks_Item_SetStatus(const idTask: integer; const pStatus: integer; const pStatusComment: string);overload; 
    procedure Tasks_Item_SetStatus(const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string);overload; 
    procedure Tasks_Item_GetResultData(const idTask: integer; out oResultData: TByteArray);
    procedure Tasks_Item_SetResult(const idTask: integer; const pResultCode: integer; const pResultComment: string);overload; 
    procedure Tasks_Item_SetResult(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string);overload; 
    procedure Tasks_Item_SetResult(const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);overload; 
    procedure Tasks_Item_SetResult(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);overload; 
    function Billing_Account: double;
    function Billing_Transactions_AddNew(const pReason: integer; const pDelta: double; const pComment: string): integer;
    procedure Billing_Transactions_Remove(const idTransaction: integer);
    procedure Billing_Transactions_Clear;
    procedure Billing_Transactions_GetData(const Version: integer; out oData: TByteArray);
    procedure ClientProgram_GetReleases(const ProgramID: integer; const Localization: WideString; out Data: TByteArray);
    property  Name: string read getName write setName;
    property  FullName: string read getFullName write setFullName;
    property  ContactInfo: string read getContactInfo write setContactInfo;
    property  Password: string read getPassword write setPassword;
    property  idSecurityFileForClone: integer read getIdSecurityFileForClone write setIdSecurityFileForClone;
    property  idSecurityFileForPrivate: integer read getidSecurityFileForPrivate write setidSecurityFileForPrivate;
    property  DATASize: integer read getDATASize write setDATASize;
    property  MaxDATASize: integer read getMaxDATASize write setMaxDATASize;
    property  SpaceSquare: Double read getSpaceSquare write setSpaceSquare;
    property  MaxSpaceSquare: integer read getMaxSpaceSquare write setMaxSpaceSquare;
    property  MaxSpaceSquarePerObject: integer read getMaxSpaceSquarePerObject write setMaxSpaceSquarePerObject;
    property  Disabled: boolean read getDisabled write setDisabled;
    property  Domains: string read getDomains write setDomains;
    property  TaskEnabled: boolean read getTaskEnabled write setTaskEnabled;
    property  BillingType: integer read getBillingType write setBillingType;
  end;

Type
  {TTTextureFunctionality}
  TTTextureFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTTextureFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetInstanceListMatchingBy(const NameContext: string; out List: TList);overload; 
    procedure GetInstanceListMatchingBy(const NameContext: string; out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TTextureFunctionality}
  TTextureFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TTextureFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDATA(out DATAStream: TClientBlobStream; out DATAType: TTextureDATAType);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);overload; 
    procedure SetDATA(DATAStream: TMemoryStream; const DATAType: TTextureDATAType);overload; 
    procedure SetDATA(DATAStream: TByteArray; const DATAType: Integer);overload; 
    procedure GetBitmapDATA(out BMPDATAStream: TMemoryStream);overload; 
    procedure GetBitmapDATA(out BMPDATAStream: TByteArray);overload; 
    procedure setName(Value: string);
    property  Name: string read getName write setName;
  end;

Type
  {TTBuffered3DVisualizationFunctionality}
  TTBuffered3DVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTBuffered3DVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TBuffered3DVisualizationFunctionality}
  TBuffered3DVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public
      ptrTransforMatrix: pointer;


    RemotedFunctionality: TBuffered3DVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    procedure UpdateDATA;override; 
    procedure GetData(out vMeshes: TMeshes; out vptrTransforMatrix: pointer; out vScale,vTranslate_X,vTranslate_Y,vTranslate_Z: Double; out vRotate_AngleX,vRotate_AngleY,vRotate_AngleZ: Double);
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    procedure ReflectInScene(Scene: TScene);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function DATASize: integer;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure LoadFromStream(DATAStream: TMemoryStream; const DATAType: TComponentFileType);overload; 
    procedure LoadFromStream(DATAStream: TByteArray; const DATAType: integer);overload; 
    procedure Get__Translate_XY(out vTranslate_X,vTranslate_Y: Double);
    procedure SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);override; 
    function GetMinMax(const TransforMatrix: TTransforMatrix; out Xmin,Ymin,Zmin, Xmax,Ymax,Zmax: Double): boolean;
    procedure UpdateXOYProjection;
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    function GetMeshesNodesApproximator(const TransforMatrix: TTransforMatrix): TNodesApproximator;
    procedure GetParams(out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double);
    property  Name: string read getName;
    property  DATAFileID: integer read getDATAFileID write setDATAFileID;
  end;

Type
  {TTDATAFileFunctionality}
  TTDATAFileFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTDATAFileFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TDATAFileFunctionality}
  TDATAFileFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TDATAFileFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    procedure SaveToFile(var FileName: string);
    procedure Activate;
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function _GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;override; 
    procedure Check;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function IsNull: boolean;
    procedure Empty;
    procedure GetDATA(out Value: TClientBlobStream);overload; 
    procedure GetDATA(out Value: TByteArray);overload; 
    procedure SetDATA(Value: TMemoryStream);overload; 
    procedure SetDATA(Value: TByteArray);overload; 
    function getDATAType: string;
    procedure setDATAType(Value: string);
    property  Name: string read getName;
    property  DATAType: string read getDATAType write setDATAType;
  end;

Type
  {TTCoComponentFunctionality}
  TTCoComponentFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTCoComponentFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetInstanceListByCoType(const idCoType: integer; out InstanceList: TList);overload; 
    procedure GetInstanceListByCoType(const idCoType: integer; out InstanceList: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TCoComponentFunctionality}
  TCoComponentFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TCoComponentFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function Notify(const NotifyType: TComponentNotifyType;  const pidTObj,pidObj: integer): TComponentNotifyResult;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function idCoType: integer;
    function GetIconImage(out Image: TBitmap): boolean;overload; override; 
    function GetIconImage(out oImage: TByteArray): boolean;overload; 
    function GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
    property  Name: string read getName;
  end;

Type
  {TTCoComponentTypeMarkerFunctionality}
  TTCoComponentTypeMarkerFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTCoComponentTypeMarkerFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TCoComponentTypeMarkerFunctionality}
  TCoComponentTypeMarkerFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TCoComponentTypeMarkerFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function GetTypeIconImage(out Image: TBitmap): boolean;overload; 
    function GetTypeIconImage(out oImage: TByteArray): boolean;overload; 
    procedure setName(Value: string);
    function getIDCoComponentType: integer;
    property  Name: string read getName write setName;
    property  idCoComponentType: integer read getIDCoComponentType;
  end;

Type
  {TTCoComponentTypeFunctionality}
  TTCoComponentTypeFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTCoComponentTypeFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetInstanceListByFileType(const FileType: shortstring; out List: TList);overload; 
    procedure GetInstanceListByFileType(const FileType: WideString; out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TCoComponentTypeFunctionality}
  TCoComponentTypeFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TCoComponentTypeFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetDescription(Value: TStringList);overload; 
    procedure GetDescription(out Value: TByteArray);overload; 
    procedure SetDescription(Value: TStringList);overload; 
    procedure SetDescription(Value: TByteArray);overload; 
    procedure GetMarkersList(out List: TList);overload; 
    procedure GetMarkersList(out List: TByteArray);overload; 
    function GetIconImage(out Image: TBitmap): boolean;overload; override; 
    function GetIconImage(out oImage: TByteArray): boolean;overload; 
    procedure setName(Value: string);
    function getUID: integer;
    function getDateCreated: TDateTime;
    function getFileType: shortstring;
    procedure setFileType(Value: shortstring);
    function getCoComponentPrototypeID: integer;
    procedure setCoComponentPrototypeID(Value: integer);
    property  Name: string read getName write setName;
    property  UID: integer read getUID;
    property  DateCreated: TDateTime read getDateCreated;
    property  FileType: shortstring read getFileType write setFileType;
    property  CoComponentPrototypeID: integer read getCoComponentPrototypeID write setCoComponentPrototypeID;
  end;

Type
  {TTAddressFunctionality}
  TTAddressFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTAddressFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure Points_GetTypeNames(out List: TStringList);overload; 
    procedure Points_GetTypeNames(out List: TByteArray);overload; 
    procedure Streets_GetTypeNames(out List: TStringList);overload; 
    procedure Streets_GetTypeNames(out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TAddressFunctionality}
  TAddressFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TAddressFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getIdPoint: integer;
    procedure setIdPoint(Value: integer);
    function getPoint: string;
    function getIdStreet: integer;
    procedure setIdStreet(Value: integer);
    function getStreet: string;
    function getHouse: string;
    procedure setHouse(Value: string);
    function getCorps: integer;
    procedure setCorps(Value: integer);
    function getApartment: string;
    procedure setApartment(Value: string);
    function getEntrance: integer;
    procedure setEntrance(Value: integer);
    property  Name: string read getName;
    property  idPoint: integer read getIdPoint write setIdPoint;
    property  Point: string read getPoint;
    property  idStreet: integer read getIdStreet write setIdStreet;
    property  Street: string read getStreet;
    property  House: string read getHouse write setHouse;
    property  Corps: integer read getCorps write setCorps;
    property  Apartment: string read getApartment write setApartment;
    property  Entrance: integer read getEntrance write setEntrance;
  end;

Type
  {TTTransportRouteFunctionality}
  TTTransportRouteFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTTransportRouteFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetInstanceList(out List: TList);overload; override; 
    procedure GetInstanceList(out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TTransportRouteFunctionality}
  TTransportRouteFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TTransportRouteFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    procedure setName(Value: string);override; 
    function getHint: string;override; 
    function getidTTransport: integer;
    procedure setidTTransport(Value: integer);
    function getValid: boolean;
    procedure setValid(Value: boolean);
    function getRemarks: string;
    procedure setRemarks(Value: string);
    function IsNodesExist: boolean;
    procedure Nodes_GetList(out List: TRouteNodesList);overload; 
    procedure Nodes_GetList(out List: TByteArray);overload; 
    function Nodes_IsNodeExist(const idNode: integer): boolean;
    procedure Nodes_ChangeNodeOrder(const idItem: integer; const Order: integer);
    function Nodes__Node_DistanceBefore(const idItem: integer): integer;
    procedure Nodes__Node_SetDistanceBefore(const idItem: integer; const D: integer);
    function Nodes__Node_OrderPrice(const idItem: integer): string;
    procedure Nodes__Node_SetOrderPrice(const idItem: integer; const Price: string);
    function Nodes_Insert(const idNode: integer): integer;
    procedure Nodes_Remove(const idItem: integer);
    property  Name: string read getName write setName;
    property  idTTransport: integer read getidTTransport write setidTTransport;
    property  Valid: boolean read getValid write setValid;
    property  Remarks: string read getRemarks write setRemarks;
  end;

Type
  {TTTransportNodeFunctionality}
  TTTransportNodeFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTTransportNodeFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetInstanceList(out List: TList);overload; override; 
    procedure GetInstanceList(out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TTransportNodeFunctionality}
  TTransportNodeFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TTransportNodeFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    procedure setName(Value: string);override; 
    function getHint: string;override; 
    function IsRoutesExist: boolean;
    property  Name: string read getName write setName;
  end;

Type
  {TTOfferGoodsFunctionality}
  TTOfferGoodsFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTOfferGoodsFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TOfferGoodsFunctionality}
  TOfferGoodsFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TOfferGoodsFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function idOffer: integer;
    function getIdGoods: integer;
    procedure setIdGoods(Value: integer);
    function getAmount: Double;
    procedure setAmount(Value: Double);
    function getIdMeasureUnit: integer;
    procedure setIdMeasureUnit(Value: integer);
    function getMeasureUnit: string;
    function getMinPrice: Currency;
    procedure setMinPrice(Value: Currency);
    function getMisc: string;
    procedure setMisc(Value: string);
    property  Name: string read getName;
    property  idGoods: integer read getIdGoods write setIdGoods;
    property  Amount: Double read getAmount write setAmount;
    property  idMeasureUnit: integer read getIdMeasureUnit write setIdMeasureUnit;
    property  MeasureUnit: string read getMeasureUnit;
    property  MinPrice: Currency read getMinPrice write setMinPrice;
    property  Misc: string read getMisc write setMisc;
  end;

Type
  {TTTLFStationTMTFunctionality}
  TTTLFStationTMTFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTTLFStationTMTFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetInstanceList(out List: TList);overload; override; 
    procedure GetInstanceList(out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TTLFStationTMTFunctionality}
  TTLFStationTMTFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TTLFStationTMTFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getHostName: string;
    procedure setHostName(Value: string);
    function getTestChanel: string;
    procedure setTestChanel(Value: string);
    property  Name: string read getName;
    property  HostName: string read getHostName write setHostName;
    property  TestChanel: string read getTestChanel write setTestChanel;
  end;

Type
  {TTNameFunctionality}
  TTNameFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTNameFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TNameFunctionality}
  TNameFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TNameFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function Value: string;
    procedure SetValue(const NewValue: string);
    property  Name: string read getName;
  end;

Type
  {TTVisualizationFunctionality}
  TTVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TVisualizationFunctionality}
  TVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public
      //переопределяемые методы

    RemotedFunctionality: TVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function ContainerFilled: boolean;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTHREFVisualizationFunctionality}
  TTHREFVisualizationFunctionality = class(TTVisualizationFunctionality)
    public

    RemotedFunctionality: TTHREFVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
  end;

Type
  {THREFVisualizationFunctionality}
  THREFVisualizationFunctionality = class(TVisualizationFunctionality)
    public

    RemotedFunctionality: THREFVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function DoOnOver: boolean;override; 
    function DoOnClick: boolean;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
  end;

Type
  {TTTTFVisualizationFunctionality}
  TTTTFVisualizationFunctionality = class(TTBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTTTFVisualizationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function StdObjectVisualization: TObjectVisualization;override; 
    property  Name: string read getName;
  end;

Type
  {TTTFVisualizationFunctionality}
  TTTFVisualizationFunctionality = class(TBase2DVisualizationFunctionality)
    public

    RemotedFunctionality: TTTFVisualizationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    procedure DestroyData;override; 
    procedure CloneData(out idClone: integer);override; 
    procedure DoOnChangeScale(const ChangeCoef: Double);override; 
    function Reflect(pFigure: TFigureWinRefl; pAdditionalFigure: TFigureWinRefl; pReflectionWindow: TReflectionWindow; pAttractionWindow: TWindow; pCanvas: TCanvas; const ptrCancelFlag: pointer): boolean;override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function GetOwner(out idTOwner,idOwner: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function getStr: string;
    procedure setStr(const Value: string);
    procedure GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString);
    procedure SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString);
    property  Name: string read getName;
    property  Str: string read getStr write setStr;
  end;

Type
  {TTObjectFunctionality}
  TTObjectFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTObjectFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TObjectFunctionality}
  TObjectFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TObjectFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTLabelFunctionality}
  TTLabelFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTLabelFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TLabelFunctionality}
  TLabelFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TLabelFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTStationFunctionality}
  TTStationFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTStationFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    procedure GetInstanceList(out List: TList);overload; override; 
    procedure GetInstanceList(out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TStationFunctionality}
  TStationFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TStationFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetNumbersBound(out BegNumber,EndNumber: integer);
    property  Name: string read getName;
  end;

Type
  {TTMainLineFunctionality}
  TTMainLineFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTMainLineFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TMainLineFunctionality}
  TMainLineFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TMainLineFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function GetSTNOwner(out idTOwner,idOwner: integer): boolean;
    property  Name: string read getName;
  end;

Type
  {TTDescriptionFunctionality}
  TTDescriptionFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTDescriptionFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TDescriptionFunctionality}
  TDescriptionFunctionality = class(TComponentFunctionality)
    public
      _DATA: TStringList;
      

    RemotedFunctionality: TDescriptionFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure UpdateDATA;override; 
    procedure ClearDATA;override; 
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function _GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    procedure GetValue(vText: TStringList);overload; 
    procedure GetValue(out vText: TByteArray);overload; 
    procedure SetValue(NewValue: TStringList);overload; 
    procedure SetValue(NewValue: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TTImageFunctionality}
  TTImageFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTImageFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TImageFunctionality}
  TImageFunctionality = class(TComponentFunctionality)
    public
      _DATA: TMemoryStream;
      

    RemotedFunctionality: TImageFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure UpdateDATA;override; 
    procedure ClearDATA;override; 
    procedure _ToClone(out idClone: integer);override; 
    procedure LoadFromFile(const FileName: string);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function _GetDataDocument(const DataModel: integer; const DataType: integer; const flWithComponents: boolean; var Document: TByteArray): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function GetDATAType: TImageDATAType;
    function GetDATAType1: integer;
    procedure GetDATA(out DATAStream: TClientBlobStream; out DATAType: TImageDATAType);overload; 
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);overload; 
    procedure SetDATA(DATAStream: TMemoryStream; const DATAType: TImageDATAType);overload; 
    procedure SetDATA(DATAStream: TByteArray; const DATAType: Integer);overload; 
    procedure GetBitmapDATA(out BMPDATAStream: TMemoryStream);overload; 
    procedure GetBitmapDATA(out BMPDATAStream: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TTWellFunctionality}
  TTWellFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTWellFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TWellFunctionality}
  TWellFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TWellFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTTLFFunctionality}
  TTTLFFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTTLFFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetIDInstanceByNumber(out ID: integer; const Number: integer);
    property  Name: string read getName;
  end;

Type
  {TTLFFunctionality}
  TTLFFunctionality = class(TComponentFunctionality)
    public
      //переопределяемые методы

    RemotedFunctionality: TTLFFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    function Number: integer;
    function Kind: TAbonentKind;
    function LocalELockExist: boolean;
    function GlobalELockExist: boolean;
    function GetFinishDevice(out vidTObj,vidObj: integer): boolean;
    function IsDamaged: boolean;
    function idDamage: integer;
    function getDamage_TimeNote: TDateTime;
    procedure setDamage_TimeNote(Value: TDateTime);
    function getDamage_Note: string;
    procedure setDamage_Note(Value: string);
    function getDamage_Measured: string;
    procedure setDamage_Measured(Value: string);
    function getDamage_Acceptor: string;
    procedure setDamage_Acceptor(Value: string);
    function getDamage_TimeBegRepair: TDateTime;
    procedure setDamage_TimeBegRepair(Value: TDateTime);
    function getDamage_TimeEndRepair: TDateTime;
    procedure setDamage_TimeEndRepair(Value: TDateTime);
    function getDamage_Damage: string;
    procedure setDamage_Damage(Value: string);
    function getDamage_Executor: string;
    procedure setDamage_Executor(Value: string);
    function getDamage_Remarks: string;
    procedure setDamage_Remarks(Value: string);
    procedure WriteEvent(const Event: string; const EventTime: TDateTime);
    property  Name: string read getName;
    property  Damage_TimeNote: TDateTime read getDamage_TimeNote write setDamage_TimeNote;
    property  Damage_Note: string read getDamage_Note write setDamage_Note;
    property  Damage_Measured: string read getDamage_Measured write setDamage_Measured;
    property  Damage_Acceptor: string read getDamage_Acceptor write setDamage_Acceptor;
    property  Damage_TimeBegRepair: TDateTime read getDamage_TimeBegRepair write setDamage_TimeBegRepair;
    property  Damage_TimeEndRepair: TDateTime read getDamage_TimeEndRepair write setDamage_TimeEndRepair;
    property  Damage_Damage: string read getDamage_Damage write setDamage_Damage;
    property  Damage_Executor: string read getDamage_Executor write setDamage_Executor;
    property  Damage_Remarks: string read getDamage_Remarks write setDamage_Remarks;
  end;

Type
  {TTBoxFunctionality}
  TTBoxFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTBoxFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TBoxFunctionality}
  TBoxFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TBoxFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTCableBoxFunctionality}
  TTCableBoxFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTCableBoxFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TCableBoxFunctionality}
  TCableBoxFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TCableBoxFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTDistrLineFunctionality}
  TTDistrLineFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTDistrLineFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TDistrLineFunctionality}
  TDistrLineFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TDistrLineFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTClientFunctionality}
  TTClientFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTClientFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    procedure GetInstanceList(out List: TList);overload; override; 
    procedure GetInstanceList(out List: TByteArray);overload; 
    property  Name: string read getName;
  end;

Type
  {TClientFunctionality}
  TClientFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TClientFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function GetDebet(out Value: Double): boolean;
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTHouseFunctionality}
  TTHouseFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTHouseFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {THouseFunctionality}
  THouseFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: THouseFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTCommNodeFunctionality}
  TTCommNodeFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTCommNodeFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TCommNodeFunctionality}
  TCommNodeFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TCommNodeFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTCrossFunctionality}
  TTCrossFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTCrossFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TCrossFunctionality}
  TCrossFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TCrossFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTCaseFunctionality}
  TTCaseFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTCaseFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TCaseFunctionality}
  TCaseFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TCaseFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTStreetFunctionality}
  TTStreetFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTStreetFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TStreetFunctionality}
  TStreetFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TStreetFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTOtherObjFunctionality}
  TTOtherObjFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTOtherObjFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TOtherObjFunctionality}
  TOtherObjFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TOtherObjFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTSpanFunctionality}
  TTSpanFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTSpanFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TSpanFunctionality}
  TSpanFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TSpanFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTChanelFunctionality}
  TTChanelFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTChanelFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TChanelFunctionality}
  TChanelFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TChanelFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTHandHoldFunctionality}
  TTHandHoldFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTHandHoldFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {THandHoldFunctionality}
  THandHoldFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: THandHoldFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTLineDistFunctionality}
  TTLineDistFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTLineDistFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TLineDistFunctionality}
  TLineDistFunctionality = class(TComponentFunctionality)
    public
      //переопределяемые методы

    RemotedFunctionality: TLineDistFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTMuffFunctionality}
  TTMuffFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTMuffFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TMuffFunctionality}
  TMuffFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TMuffFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTOfferFunctionality}
  TTOfferFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTOfferFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    function GetOfferByHumanID(const HumanID: integer; out idOffer: integer): boolean;
    property  Name: string read getName;
  end;

Type
  {TOfferFunctionality}
  TOfferFunctionality = class(TComponentFunctionality)
    public
      //переопределяемые методы

    RemotedFunctionality: TOfferFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    procedure setName(Value: string);override; 
    function getHint: string;override; 
    function getSchedule: string;
    procedure setSchedule(Value: string);
    function getPassword: string;
    procedure setPassword(Value: string);
    function getContactTLF: integer;
    procedure setContactTLF(Value: integer);
    function getLastUpdated: TDateTime;
    procedure setLastUpdated(Value: TDateTime);
    procedure LoadDATAFromStream(Stream: TStream);overload; 
    procedure LoadDATAFromStream(Stream: TByteArray);overload; 
    function UserID: integer;
    function UID: integer;
    function AddressStr: string;
    function Goods_Insert: integer;
    procedure Goods_GetList(out List: TList);overload; 
    procedure Goods_GetList(out List: TByteArray);overload; 
    procedure Goods_Remove(const idOfferGoods: integer);
    procedure Goods_Clear;
    property  Name: string read getName write setName;
    property  Schedule: string read getSchedule write setSchedule;
    property  Password: string read getPassword write setPassword;
    property  ContactTLF: integer read getContactTLF write setContactTLF;
    property  LastUpdated: TDateTime read getLastUpdated write setLastUpdated;
  end;

Type
  {TTDemandFunctionality}
  TTDemandFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTDemandFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TDemandFunctionality}
  TDemandFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TDemandFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTCommLineFunctionality}
  TTCommLineFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTCommLineFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TCommLineFunctionality}
  TCommLineFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TCommLineFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;override; 
    function getName: string;override; 
    function getHint: string;override; 
    property  Name: string read getName;
  end;

Type
  {TTGoodsFunctionality}
  TTGoodsFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTGoodsFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    procedure GetInstanceListContainingContext(const Context: string; out List: TStringList);overload; 
    procedure GetInstanceListContainingContext(const Context: string; out List: TByteArray);overload; 
    function IsInstanceExist(const pName: string; out idGoods: integer): boolean;
    property  Name: string read getName;
  end;

Type
  {TGoodsFunctionality}
  TGoodsFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TGoodsFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    procedure setName(Value: string);
    function getHint: string;override; 
    function StdAmount: integer;
    function StdMeasureUnit: string;
    property  Name: string read getName write setName;
  end;

Type
  {TTCollectionFunctionality}
  TTCollectionFunctionality = class(TTypeFunctionality)
    public

    RemotedFunctionality: TTCollectionFunctionalityRemoted;

    Constructor Create; override;
    Destructor Destroy; override;
    function _CreateInstance: integer;override; 
    procedure _DestroyInstance(const idObj: integer);override; 
    function TComponentFunctionality_Create(const idComponent: integer): TComponentFunctionality;override; 
    function getName: string;override; 
    function getImage: TTypeImage;override; 
    property  Name: string read getName;
  end;

Type
  {TCollectionFunctionality}
  TCollectionFunctionality = class(TComponentFunctionality)
    public

    RemotedFunctionality: TCollectionFunctionalityRemoted;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality; const pidObj: integer); override;
    Destructor Destroy; override;
    procedure _ToClone(out idClone: integer);override; 
    function TPanelProps_Create(pflReadOnly: boolean; pidOwnerObjectProp: integer;pOwnerPanelsProps: TAbstractSpaceObjPanelsProps; const pProxyObject: TObjectDescr): TAbstractSpaceObjPanelProps;override; 
    function getName: string;override; 
    procedure setName(const Value: string);
    function getHint: string;override; 
    function InsertItem(const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer;
    procedure RemoveItem(const id: integer);
    procedure Item_ChangeAlias(const id: integer; const pAlias: string);
    procedure Item_ChangeListOrder(const id: integer; const Order: integer);
    procedure RemoveItems;
    function IsItemExist(const idTItem,idItem: integer): boolean;
    procedure GetListItems(out List: TList);overload; 
    procedure GetListItems(out List: TByteArray);overload; 
    procedure SaveListItems(List: TList);overload; 
    procedure SaveListItems(const List: TByteArray);overload; 
    property  Name: string read getName;
  end;

