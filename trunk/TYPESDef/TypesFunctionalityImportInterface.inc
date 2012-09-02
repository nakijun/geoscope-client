//. import types functionality routines

Type
      TTileServerType = (
      tstNative = 0,
      tstYandexMaps = 1,
      tstGoogleMaps = 2,
      tstOpenStreetMaps = 3,
      tstNavitelMaps = 4
    );

//. TTTileServerVisualizationFunctionality
Type
  TTTileServerVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTTileServerVisualizationSOAPFunctionality: ITTTileServerVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTTileServerVisualizationSOAPFunctionality: ITTTileServerVisualizationSOAPFunctionality;
  end;

//. TTileServerVisualizationFunctionality
Type
  TTileServerVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTTileServerVisualizationSOAPFunctionality: ITTileServerVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TTileServerVisualizationSOAPFunctionality: ITTileServerVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetParams(out oWidth: integer; out oHeight: integer);
    procedure GetParams1(out oServerType: integer; out oServerURL: string; out oServerData: TByteArray; out oTileProviderID: integer; out oWidth: integer; out oHeight: integer);
    procedure SetServerType(const Value: integer);
    procedure SetServerURL(const Value: string);
    procedure SetServerData(const Data: TByteArray);
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
  end;

//. TTMeasurementObjectFunctionality
Type
  TTMeasurementObjectFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTMeasurementObjectSOAPFunctionality: ITTMeasurementObjectSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTMeasurementObjectSOAPFunctionality: ITTMeasurementObjectSOAPFunctionality;
    function CreateNewInstance(const pName: string; const pDomains: string): integer;
    function CreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
    function CheckCreateInstanceByGUID(const pGUID: string; const pName: string; const pDomains: string): integer;
    procedure GetInstanceListByNameContext(const pName: string; out List: TByteArray);
    procedure GetInstanceDataByNameContext(const pName: string; const Version: integer; out oData: TByteArray);
    function GetInstanceByGUID(const pGUID: string): integer;
    function GetInstanceByGSOMeasurement(const pidGeographServerObject: integer; const pMeasurementTimeID: Double): integer;
  end;

//. TMeasurementObjectFunctionality
Type
  TMeasurementObjectFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTMeasurementObjectSOAPFunctionality: ITMeasurementObjectSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TMeasurementObjectSOAPFunctionality: ITMeasurementObjectSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getGUID: string;
    function getDomains: string;
    procedure setDomains(Value: string);
    procedure GetParams(out oGUID: string; out oidOwner: integer; out oName: string; out oDomains: string);
    procedure GSOMeasurements_GetList(out List: TByteArray);
    procedure GSOMeasurements_GetData(const Version: integer; out oData: TByteArray);
    procedure GSOMeasurements_Item_GetParams(const idMeasurement: integer; out oTimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);
    procedure GSOMeasurements_Item_GetParams1(const TimeID: Double; out oidGeographServerObject: integer; out oDataType: integer);
    procedure GSOMeasurements_Item_GetData(const idMeasurement: integer; out oData: TByteArray);
    procedure GSOMeasurements_Item_GetData1(const TimeID: Double; out oData: TByteArray);
  end;

//. TTAreaNotificationServerFunctionality
Type
  TTAreaNotificationServerFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTAreaNotificationServerSOAPFunctionality: ITTAreaNotificationServerSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTAreaNotificationServerSOAPFunctionality: ITTAreaNotificationServerSOAPFunctionality;
  end;

//. TAreaNotificationServerFunctionality
Type
  TAreaNotificationServerFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTAreaNotificationServerSOAPFunctionality: ITAreaNotificationServerSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TAreaNotificationServerSOAPFunctionality: ITAreaNotificationServerSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getInfo: string;
    procedure setInfo(Value: string);
  end;

//. TTMODELServerVisualizationFunctionality
Type
  TTMODELServerVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTMODELServerVisualizationSOAPFunctionality: ITTMODELServerVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTMODELServerVisualizationSOAPFunctionality: ITTMODELServerVisualizationSOAPFunctionality;
  end;

//. TMODELServerVisualizationFunctionality
Type
  TMODELServerVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTMODELServerVisualizationSOAPFunctionality: ITMODELServerVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TMODELServerVisualizationSOAPFunctionality: ITMODELServerVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getServerURL: string;
    procedure setServerURL(Value: string);
  end;

//. TTDoubleVarFunctionality
Type
  TTDoubleVarFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTDoubleVarSOAPFunctionality: ITTDoubleVarSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTDoubleVarSOAPFunctionality: ITTDoubleVarSOAPFunctionality;
  end;

//. TDoubleVarFunctionality
Type
  TDoubleVarFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTDoubleVarSOAPFunctionality: ITDoubleVarSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TDoubleVarSOAPFunctionality: ITDoubleVarSOAPFunctionality;
    function getName: string;
    function getHint: string;
    function getValue: Double;
    procedure setValue(_Value: Double);
    function getSetTimeStamp: TDateTime;
  end;

//. TTInt32VarFunctionality
Type
  TTInt32VarFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTInt32VarSOAPFunctionality: ITTInt32VarSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTInt32VarSOAPFunctionality: ITTInt32VarSOAPFunctionality;
  end;

//. TInt32VarFunctionality
Type
  TInt32VarFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTInt32VarSOAPFunctionality: ITInt32VarSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TInt32VarSOAPFunctionality: ITInt32VarSOAPFunctionality;
    function getName: string;
    function getHint: string;
    function getValue: integer;
    procedure setValue(_Value: integer);
    function getSetTimeStamp: TDateTime;
  end;

//. TTURLFunctionality
Type
  TTURLFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTURLSOAPFunctionality: ITTURLSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTURLSOAPFunctionality: ITTURLSOAPFunctionality;
  end;

//. TURLFunctionality
Type
  TURLFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTURLSOAPFunctionality: ITURLSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TURLSOAPFunctionality: ITURLSOAPFunctionality;
    function getName: string;
    function getHint: string;
    function getURL: string;
    procedure setURL(Value: string);
    function getURLName: string;
    procedure setURLName(Value: string);
    function getflPanelBrowser: boolean;
    procedure setflPanelBrowser(Value: boolean);
    procedure GetParams(out oURL: string; out oURLName: string; out oflPanelBrowser: boolean);
    procedure SetParams(const pURL: string; const pURLName: string; const pflPanelBrowser: boolean);
  end;

//. TTPatternVisualizationFunctionality
Type
  TTPatternVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTPatternVisualizationSOAPFunctionality: ITTPatternVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTPatternVisualizationSOAPFunctionality: ITTPatternVisualizationSOAPFunctionality;
  end;

//. TPatternVisualizationFunctionality
Type
  TPatternVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTPatternVisualizationSOAPFunctionality: ITPatternVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TPatternVisualizationSOAPFunctionality: ITPatternVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
  end;

//. TTMapFormatObjectFunctionality
Type
  TTMapFormatObjectFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTMapFormatObjectSOAPFunctionality: ITTMapFormatObjectSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTMapFormatObjectSOAPFunctionality: ITTMapFormatObjectSOAPFunctionality;
    function GetDATAHash(DATAStream: TByteArray): integer;
  end;

//. TMapFormatObjectFunctionality
Type
  TMapFormatObjectFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTMapFormatObjectSOAPFunctionality: ITMapFormatObjectSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TMapFormatObjectSOAPFunctionality: ITMapFormatObjectSOAPFunctionality;
    function GetHintInfo(const InfoType: integer; const InfoFormat: integer; out HintInfo: TByteArray): boolean;
    function getidMap: integer;
    procedure setidMap(Value: integer);
    function getFormatID: integer;
    procedure setFormatID(Value: integer);
    function getKindID: integer;
    procedure setKindID(Value: integer);
    function getTypeID: integer;
    procedure setTypeID(Value: integer);
    function getName: string;
    procedure setName(Value: string);
    procedure GetDATA(out DATAStream: TByteArray);
    procedure SetDATA(DATAStream: TByteArray);
    function getDATAHash: integer;
    procedure setDATAHash(Value: integer);
    procedure GetParams(out oidMap: integer; out oFormatID: integer; out oKindID: integer; out oTypeID: integer; out oName: string);
    procedure SetParams(const pidMap: integer; const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const pName: string);
    procedure SetObjectByDATA;
    procedure UpdateDATAHash;
    procedure Compile;
    procedure Build(const flUsePrototype: boolean);
  end;

Type
      TMapFormat = (
      mfUnknown = 0,
      mfPolish
    );

//. TTMapFormatMapFunctionality
Type
  TTMapFormatMapFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTMapFormatMapSOAPFunctionality: ITTMapFormatMapSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTMapFormatMapSOAPFunctionality: ITTMapFormatMapSOAPFunctionality;
    procedure GetInstanceListByGeoSpace(const idGeoSpace: integer; out List: TByteArray);
  end;

//. TMapFormatMapFunctionality
Type
  TMapFormatMapFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTMapFormatMapSOAPFunctionality: ITMapFormatMapSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TMapFormatMapSOAPFunctionality: ITMapFormatMapSOAPFunctionality;
    function getGeoSpaceID: integer;
    procedure setGeoSpaceID(Value: integer);
    function getFormatID: integer;
    procedure setFormatID(Value: integer);
    function getName: string;
    procedure setName(Value: string);
    procedure GetDATA(out DATAStream: TByteArray);
    procedure SetDATA(DATAStream: TByteArray);
    procedure GetObjectPrototypesDATA(out DATAStream: TByteArray);
    procedure SetObjectPrototypesDATA(DATAStream: TByteArray);
    function GetObjectPrototype(const KindID: integer; const TypeID: integer; out PrototypeID: integer; out LayID: integer): boolean;
    procedure GetParams(out oGeoSpaceID: integer; out oFormatID: integer; out oName: string);
    procedure SetParams(const pGeoSpaceID: integer; const pFormatID: integer; const pName: string);
    function ObjectsCounter: integer;
    procedure GetObjectsList(out List: TByteArray);
    procedure GetObjectsList1(const KindID: integer; out List: TByteArray);
    procedure GetObjectsList2(const KindID: integer; const TypeID: integer; out List: TByteArray);
    procedure GetObjectsList3(const KindID: integer; const TypeID: integer; const NameContext: string; out List: TByteArray);
    function GetObject(const DATAHash: integer; out idMapFormatObject: integer): boolean;
    function GetObject1(const KindID: integer; const DATAHash: integer; out idMapFormatObject: integer): boolean;
    procedure ExportMap(const pFormatID: integer; out ZipData: TByteArray);
    procedure RemoveObjects;
    procedure RemoveObjects1(const KindID: integer; const TypeID: integer);
    procedure UpdateObjectDATAHashes;
    procedure RecalculateMapArea;
    procedure RemoveIrrelevantObjectsInMapArea;
  end;

Const
  
  MapFormatStrings: array[TMapFormat] of string = (
    'Unknown',
    'Polish (MP)'
  );






//. TTSPLVisualizationFunctionality
Type
  TTSPLVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTSPLVisualizationSOAPFunctionality: ITTSPLVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTSPLVisualizationSOAPFunctionality: ITTSPLVisualizationSOAPFunctionality;
  end;

//. TSPLVisualizationFunctionality
Type
  TSPLVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTSPLVisualizationSOAPFunctionality: ITSPLVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TSPLVisualizationSOAPFunctionality: ITSPLVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetParams(out SPLType: integer; out SPLDATA: TByteArray);
    procedure SetParams(const SPLType: integer; const SPLDATA: TByteArray);
  end;

//. TTBoolVarFunctionality
Type
  TTBoolVarFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTBoolVarSOAPFunctionality: ITTBoolVarSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTBoolVarSOAPFunctionality: ITTBoolVarSOAPFunctionality;
  end;

//. TBoolVarFunctionality
Type
  TBoolVarFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTBoolVarSOAPFunctionality: ITBoolVarSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TBoolVarSOAPFunctionality: ITBoolVarSOAPFunctionality;
    function getName: string;
    function getHint: string;
    function getValue: boolean;
    procedure setValue(_Value: boolean);
    function getSetTimeStamp: TDateTime;
  end;

//. TTGeoSpaceFunctionality
Type
  TTGeoSpaceFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTGeoSpaceSOAPFunctionality: ITTGeoSpaceSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTGeoSpaceSOAPFunctionality: ITTGeoSpaceSOAPFunctionality;
  end;

//. TGeoSpaceFunctionality
Type
  TGeoSpaceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTGeoSpaceSOAPFunctionality: ITGeoSpaceSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TGeoSpaceSOAPFunctionality: ITGeoSpaceSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getDatumID: integer;
    procedure setDatumID(Value: integer);
    function getProjectionID: integer;
    procedure setProjectionID(Value: integer);
    function ConvertXYToLatLong(const X: double; const Y: double; out Latitude: double; out Longitude: double): boolean;
    function ConvertXYToDatumLatLong(const X: double; const Y: double; const pDatumID: integer; out Latitude: double; out Longitude: double): boolean;
    function ConvertLatLongToXY(const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
    function ConvertDatumLatLongToXY(const pDatumID: integer; const Latitude: double; const Longitude: double; out X: double; out Y: double): boolean;
    procedure GetGeoCrdSystemList(out List: TByteArray);
    procedure GetMapFormatMapList(out List: TByteArray);
    procedure GetMapFormatMapObjectsByNameContext(const pFormatID: integer; const pKindID: integer; const pTypeID: integer; const NameContext: string; out List: TByteArray);
  end;

//. TTUserAlertFunctionality
Type
  TTUserAlertFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTUserAlertSOAPFunctionality: ITTUserAlertSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTUserAlertSOAPFunctionality: ITTUserAlertSOAPFunctionality;
    procedure GetActiveInstanceList(out List: TByteArray);
  end;

//. TUserAlertFunctionality
Type
  TUserAlertFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTUserAlertSOAPFunctionality: ITUserAlertSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TUserAlertSOAPFunctionality: ITUserAlertSOAPFunctionality;
    function getName: string;
    function getHint: string;
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
    procedure GetDATA(out DATAStream: TByteArray);
    procedure SetDATA(DATAStream: TByteArray);
  end;

Const
  
    GEOGRAPHSERVEROBJECT_MEASUREMENT_TYPE_CARDIO_ECG = 1;
    GEOGRAPHSERVEROBJECT_MEASUREMENT_TYPE_CARDIO_HOLTER = 2;
    //.
    GEOGRAPHSERVEROBJECT_MEASUREMENT_SOURCE_DATABASE    = 1;
    GEOGRAPHSERVEROBJECT_MEASUREMENT_SOURCE_LOCALFOLDER = 2;


//. TTGeoGraphServerObjectFunctionality
Type
  TTGeoGraphServerObjectFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTGeoGraphServerObjectSOAPFunctionality: ITTGeoGraphServerObjectSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTGeoGraphServerObjectSOAPFunctionality: ITTGeoGraphServerObjectSOAPFunctionality;
    function GetInstanceByServerObject(const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean;
  end;

//. TGeoGraphServerObjectFunctionality
Type
  TGeoGraphServerObjectFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTGeoGraphServerObjectSOAPFunctionality: ITGeoGraphServerObjectSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TGeoGraphServerObjectSOAPFunctionality: ITGeoGraphServerObjectSOAPFunctionality;
    function getName: string;
    function getHint: string;
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
    function Measurements_AddNew(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pData: TByteArray): integer;
    function Measurements_AddNew1(const pTimeID: Double; const pidMeasurementObject: integer; const pguidMeasurementObject: string; const pDataType: integer; const pDataSource: integer; const pData: TByteArray): integer;
    procedure Measurements_Remove(const pidMeasurement: integer);
    procedure Measurements_Item_UpdateData(const pTimeID: Double; const pData: TByteArray);
  end;

//. TTGeoGraphServerFunctionality
Type
  TTGeoGraphServerFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTGeoGraphServerSOAPFunctionality: ITTGeoGraphServerSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTGeoGraphServerSOAPFunctionality: ITTGeoGraphServerSOAPFunctionality;
    procedure GetActiveInstanceList(out List: TByteArray);
    function GetInstanceForRegistration: integer;
  end;

//. TGeoGraphServerFunctionality
Type
  TGeoGraphServerFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTGeoGraphServerSOAPFunctionality: ITGeoGraphServerSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TGeoGraphServerSOAPFunctionality: ITGeoGraphServerSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getAddress: string;
    procedure setAddress(Value: string);
    function getInternalAddress: string;
    procedure setInternalAddress(Value: string);
    function getInfo: string;
    procedure setInfo(Value: string);
    procedure GetData(out DATAStream: TByteArray);
    function RegisterObject(const ObjectName: string; const VisualizationType: integer; const VisualizationID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;
    function RegisterObject1(const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const GeoCrdSystemID: integer; const HintID: integer): integer;
    function RegisterObject2(const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer): integer;
    procedure UnRegisterObject(const ObjectID: integer);
    function ObjectCounter: integer;
    procedure ExecuteOperation(const InData: TByteArray; out OutData: TByteArray);
    procedure Object_GetProperties(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out ObjectDatumID: integer; out VisualizationType: integer; out VisualizationID: integer; out GeoSpaceID: integer; out HintID: integer);
    procedure Object_GetProperties1(const ObjectID: integer;  out ObjectName: string; out ObjectType: integer; out BusinessType: integer; out ObjectComponentID: integer);
    procedure Object_SetProperties(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const ObjectDatumID: integer; const VisualizationType: integer; const VisualizationID: integer; const GeoSpaceID: integer; const HintID: integer);
    procedure Object_SetProperties1(const ObjectID: integer;  const ObjectName: string; const ObjectType: integer; const BusinessType: integer; const ObjectComponentID: integer);
    function Object_GetObjectType(const ObjectID: integer): integer;
    procedure Object_SetObjectType(const ObjectID: integer; const ObjectType: integer);
    function Object_GetBusinessType(const ObjectID: integer): integer;
    procedure Object_SetBusinessType(const ObjectID: integer; const BusinessType: integer);
    function Object_GetComponentID(const ObjectID: integer): integer;
    procedure Object_SetComponentID(const ObjectID: integer; const ObjectComponentID: integer);
    procedure Object_ExecuteOperation(const ObjectID: integer; const InData: TByteArray; out OutData: TByteArray);
    function DataID: integer;
  end;

Const
  
  TGeoGraphServerFunctionality_ResurceQuotaOfRegisterObject = 1000*1024;











//. TTGeoCrdSystemFunctionality
Type
  TTGeoCrdSystemFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTGeoCrdSystemSOAPFunctionality: ITTGeoCrdSystemSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTGeoCrdSystemSOAPFunctionality: ITTGeoCrdSystemSOAPFunctionality;
    procedure GetInstanceList(out List: TByteArray);
    procedure GetInstanceByLatLong(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
    procedure GetInstanceByXY(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
  end;

//. TGeoCrdSystemFunctionality
Type
  TGeoCrdSystemFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTGeoCrdSystemSOAPFunctionality: ITGeoCrdSystemSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TGeoCrdSystemSOAPFunctionality: ITGeoCrdSystemSOAPFunctionality;
    function getGeoSpaceID: integer;
    procedure setGeoSpaceID(Value: integer);
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getDatum: string;
    procedure setDatum(Value: string);
    function getProjection: string;
    procedure setProjection(Value: string);
    procedure GetProjectionDATA(out DATAStream: TByteArray);
    procedure SetProjectionDATA(DATAStream: TByteArray);
    procedure GetGeodesyPoints(out Points: TByteArray);
  end;

//. TTFilterVisualizationFunctionality
Type
  TTFilterVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTFilterVisualizationSOAPFunctionality: ITTFilterVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTFilterVisualizationSOAPFunctionality: ITTFilterVisualizationSOAPFunctionality;
  end;

//. TFilterVisualizationFunctionality
Type
  TFilterVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTFilterVisualizationSOAPFunctionality: ITFilterVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TFilterVisualizationSOAPFunctionality: ITFilterVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetParams(out FilterType: integer; out FilterDATA: TByteArray);
    procedure SetParams(const FilterType: integer; const FilterDATA: TByteArray);
  end;

//. TTHINTVisualizationFunctionality
Type
  TTHINTVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTHINTVisualizationSOAPFunctionality: ITTHINTVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTHINTVisualizationSOAPFunctionality: ITTHINTVisualizationSOAPFunctionality;
    procedure GetInstanceParams(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
    procedure GetInstanceParams1(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
    procedure GetInstanceOwnerDatasAndParams(const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray);
  end;

//. THINTVisualizationFunctionality
Type
  THINTVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTHINTVisualizationSOAPFunctionality: ITHINTVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function THINTVisualizationSOAPFunctionality: ITHINTVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    procedure GetPrivateDATA(out DATAStream: TByteArray);
    procedure GetPrivateDATA1(out DATAStream: TByteArray; const MaxSize: integer);
    procedure SetPrivateDATA(DATAStream: TByteArray);
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
  end;

//. TTDetailedPictureVisualizationFunctionality
Type
  TTDetailedPictureVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTDetailedPictureVisualizationSOAPFunctionality: ITTDetailedPictureVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTDetailedPictureVisualizationSOAPFunctionality: ITTDetailedPictureVisualizationSOAPFunctionality;
  end;

//. TDetailedPictureVisualizationFunctionality
Type
  TDetailedPictureVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTDetailedPictureVisualizationSOAPFunctionality: ITDetailedPictureVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TDetailedPictureVisualizationSOAPFunctionality: ITDetailedPictureVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
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
  end;

//. TTCoVisualizationFunctionality
Type
  TTCoVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCoVisualizationSOAPFunctionality: ITTCoVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCoVisualizationSOAPFunctionality: ITTCoVisualizationSOAPFunctionality;
  end;

//. TCoVisualizationFunctionality
Type
  TCoVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCoVisualizationSOAPFunctionality: ITCoVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCoVisualizationSOAPFunctionality: ITCoVisualizationSOAPFunctionality;
    procedure ToClone(out idClone: integer);
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetSpace(out DATAStream: TByteArray);
    procedure GetSpace1(out DATAStream: TByteArray; const MaxSize: integer);
    procedure SetSpace(DATAStream: TByteArray);
    function GetOwnSpaceHINTVisualization(out idHINTVisualization: integer): boolean;
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure Pack;
    procedure UnPack;
    function IsPacked: boolean;
  end;

//. TTForumMessageFunctionality
Type
  TTForumMessageFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTForumMessageSOAPFunctionality: ITTForumMessageSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTForumMessageSOAPFunctionality: ITTForumMessageSOAPFunctionality;
  end;

//. TForumMessageFunctionality
Type
  TForumMessageFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTForumMessageSOAPFunctionality: ITForumMessageSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TForumMessageSOAPFunctionality: ITForumMessageSOAPFunctionality;
    function getName: string;
    function getHint: string;
    function getidForum: integer;
    procedure setidForum(Value: integer);
    function idUser: integer;
    procedure Send;
    function SentTime: TDateTime;
    function getidForMessage: integer;
    procedure setidForMessage(Value: integer);
    function LastModified: TDateTime;
    procedure GetMessage(out Message: TByteArray);
    procedure SetMessage(const Message: TByteArray);
    function ReplyMessageCount: integer;
    procedure GetReplyMessageList(out MessageList: TByteArray);
  end;

//. TTForumFunctionality
Type
  TTForumFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTForumSOAPFunctionality: ITTForumSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTForumSOAPFunctionality: ITTForumSOAPFunctionality;
  end;

//. TForumFunctionality
Type
  TForumFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTForumSOAPFunctionality: ITForumSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TForumSOAPFunctionality: ITForumSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getMessageLifeTime: TDateTime;
    procedure setMessageLifeTime(Value: TDateTime);
    function getHint: string;
    function RootMessageCount: integer;
    procedure GetRootMessageList(out MessageList: TByteArray);
    function MessageCount: integer;
    procedure GetMessageList(out MessageList: TByteArray);
    function AddMessage(const pidUser: integer; const pidForMessage: integer): integer;
    procedure DestroyMessage(const pidMessage: integer);
  end;

//. TTCUSTOMVisualizationFunctionality
Type
  TTCUSTOMVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCUSTOMVisualizationSOAPFunctionality: ITTCUSTOMVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCUSTOMVisualizationSOAPFunctionality: ITTCUSTOMVisualizationSOAPFunctionality;
  end;

//. TCUSTOMVisualizationFunctionality
Type
  TCUSTOMVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCUSTOMVisualizationSOAPFunctionality: ITCUSTOMVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCUSTOMVisualizationSOAPFunctionality: ITCUSTOMVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getMODULEName: string;
    procedure setMODULEName(Value: string);
    function getFunctionName: string;
    procedure setFunctionName(Value: string);
    function getFunctionVersion: integer;
    procedure setFunctionVersion(Value: integer);
    procedure GetParams(out oMODULEName: WideString; out oFunctionName: WideString; out oFunctionVersion: integer);
  end;

//. TTOLEVisualizationFunctionality
Type
  TTOLEVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTOLEVisualizationSOAPFunctionality: ITTOLEVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTOLEVisualizationSOAPFunctionality: ITTOLEVisualizationSOAPFunctionality;
  end;

//. TOLEVisualizationFunctionality
Type
  TOLEVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTOLEVisualizationSOAPFunctionality: ITOLEVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TOLEVisualizationSOAPFunctionality: ITOLEVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out Value: TByteArray);
    procedure GetDATA1(out Value: TByteArray; const MaxSize: integer);
    procedure SetDATA(Value: TByteArray);
  end;

//. TTHTMLVisualizationFunctionality
Type
  TTHTMLVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTHTMLVisualizationSOAPFunctionality: ITTHTMLVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTHTMLVisualizationSOAPFunctionality: ITTHTMLVisualizationSOAPFunctionality;
  end;

//. THTMLVisualizationFunctionality
Type
  THTMLVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTHTMLVisualizationSOAPFunctionality: ITHTMLVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function THTMLVisualizationSOAPFunctionality: ITHTMLVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getWidth: integer;
    procedure setWidth(Value: integer);
    procedure GetDATA(out Value: TByteArray);
    procedure GetDATA1(out Value: TByteArray; const MaxSize: integer);
    procedure SetDATA(Value: TByteArray);
  end;

//. TTBZRVisualizationFunctionality
Type
  TTBZRVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTBZRVisualizationSOAPFunctionality: ITTBZRVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTBZRVisualizationSOAPFunctionality: ITTBZRVisualizationSOAPFunctionality;
  end;

//. TBZRVisualizationFunctionality
Type
  TBZRVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTBZRVisualizationSOAPFunctionality: ITBZRVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TBZRVisualizationSOAPFunctionality: ITBZRVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTAGIFVisualizationFunctionality
Type
  TTAGIFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTAGIFVisualizationSOAPFunctionality: ITTAGIFVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTAGIFVisualizationSOAPFunctionality: ITTAGIFVisualizationSOAPFunctionality;
  end;

//. TAGIFVisualizationFunctionality
Type
  TAGIFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTAGIFVisualizationSOAPFunctionality: ITAGIFVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TAGIFVisualizationSOAPFunctionality: ITAGIFVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out Value: TByteArray);
    procedure GetDATA1(out Value: TByteArray; const MaxSize: integer);
    procedure SetDATA(Value: TByteArray);
  end;

//. TTOrientedVIDEOVisualizationFunctionality
Type
  TTOrientedVIDEOVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTOrientedVIDEOVisualizationSOAPFunctionality: ITTOrientedVIDEOVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTOrientedVIDEOVisualizationSOAPFunctionality: ITTOrientedVIDEOVisualizationSOAPFunctionality;
  end;

//. TOrientedVIDEOVisualizationFunctionality
Type
  TOrientedVIDEOVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTOrientedVIDEOVisualizationSOAPFunctionality: ITOrientedVIDEOVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TOrientedVIDEOVisualizationSOAPFunctionality: ITOrientedVIDEOVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getDataServer: string;
    procedure setDataServer(Value: string);
    function getObjectID: integer;
    procedure setObjectID(Value: integer);
  end;

//. TTVIDEOVisualizationFunctionality
Type
  TTVIDEOVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTVIDEOVisualizationSOAPFunctionality: ITTVIDEOVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTVIDEOVisualizationSOAPFunctionality: ITTVIDEOVisualizationSOAPFunctionality;
  end;

//. TVIDEOVisualizationFunctionality
Type
  TVIDEOVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTVIDEOVisualizationSOAPFunctionality: ITVIDEOVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TVIDEOVisualizationSOAPFunctionality: ITVIDEOVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getDataServer: string;
    procedure setDataServer(Value: string);
    function getObjectID: integer;
    procedure setObjectID(Value: integer);
  end;

//. TTOPPVisualizationFunctionality
Type
  TTOPPVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTOPPVisualizationSOAPFunctionality: ITTOPPVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTOPPVisualizationSOAPFunctionality: ITTOPPVisualizationSOAPFunctionality;
  end;

//. TOPPVisualizationFunctionality
Type
  TOPPVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTOPPVisualizationSOAPFunctionality: ITOPPVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TOPPVisualizationSOAPFunctionality: ITOPPVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getPropsPanel_idTObj: integer;
    procedure setPropsPanel_idTObj(Value: integer);
    function getPropsPanel_idObj: integer;
    procedure setPropsPanel_idObj(Value: integer);
    procedure GetParams(out oPropsPanel_idTObj: integer; out oPropsPanel_idObj: integer);
  end;

//. TTMODELServerFunctionality
Type
  TTMODELServerFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTMODELServerSOAPFunctionality: ITTMODELServerSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTMODELServerSOAPFunctionality: ITTMODELServerSOAPFunctionality;
    function GetInstanceByIPAddress(const IPAddress: string;  out id: integer): boolean;
  end;

//. TMODELServerFunctionality
Type
  TMODELServerFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTMODELServerSOAPFunctionality: ITMODELServerSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TMODELServerSOAPFunctionality: ITMODELServerSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getIPAddress: string;
    procedure setIPAddress(Value: string);
    function IsUserExist(const _UserName,_UserPassword: string): boolean;
    function GetUserID(const _UserName,_UserPassword: string): integer;
    function IsOnLine: boolean;
    function Info: string;
    procedure GetLicense(out License: WideString);
    procedure CreateNewUserByDefaultPrototype(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString;  out idNewUser: integer);
    procedure CreateNewUserByDefaultPrototype1(const NewUserName: WideString; const NewUserPassword: WideString; const NewUserFullName: WideString; const NewUserContactInfo: WideString; const Signature: WideString;  out idNewUser: integer);
  end;

//. TTCoReferenceFunctionality
Type
  TTCoReferenceFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCoReferenceSOAPFunctionality: ITTCoReferenceSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCoReferenceSOAPFunctionality: ITTCoReferenceSOAPFunctionality;
  end;

//. TCoReferenceFunctionality
Type
  TCoReferenceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCoReferenceSOAPFunctionality: ITCoReferenceSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCoReferenceSOAPFunctionality: ITCoReferenceSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    procedure GetReferencedObject(out idTReferencedObject,idReferencedObject: integer);
    procedure SetReferencedObject(const idTReferencedObject,idReferencedObject: integer);
  end;

//. TTPositionerFunctionality
Type
  TTPositionerFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTPositionerSOAPFunctionality: ITTPositionerSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTPositionerSOAPFunctionality: ITTPositionerSOAPFunctionality;
  end;

//. TPositionerFunctionality
Type
  TPositionerFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTPositionerSOAPFunctionality: ITPositionerSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TPositionerSOAPFunctionality: ITPositionerSOAPFunctionality;
    function getName: string;
    function getHint: string;
    procedure Get2DPosition(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
    procedure Save2DPosition(const X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
    function getPositionName: string;
    procedure setPositionName(Value: string);
  end;

//. TTOrientedWMFVisualizationFunctionality
Type
  TTOrientedWMFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTOrientedWMFVisualizationSOAPFunctionality: ITTOrientedWMFVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTOrientedWMFVisualizationSOAPFunctionality: ITTOrientedWMFVisualizationSOAPFunctionality;
  end;

//. TOrientedWMFVisualizationFunctionality
Type
  TOrientedWMFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTOrientedWMFVisualizationSOAPFunctionality: ITOrientedWMFVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TOrientedWMFVisualizationSOAPFunctionality: ITOrientedWMFVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
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
  end;

//. TTCELLVisualizationFunctionality
Type
  TTCELLVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCELLVisualizationSOAPFunctionality: ITTCELLVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCELLVisualizationSOAPFunctionality: ITTCELLVisualizationSOAPFunctionality;
  end;

//. TCELLVisualizationFunctionality
Type
  TCELLVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCELLVisualizationSOAPFunctionality: ITCELLVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCELLVisualizationSOAPFunctionality: ITCELLVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetCoordinates(out X0,Y0, X1,Y1, X2,Y2, X3,Y3: Double);
    procedure Change(const Left_dColumns,Top_dRows,Right_dColumns,Bottom_dRows: integer);
    function GetFormatNodes(out NodesList: TByteArray; out SizeX,SizeY: integer): boolean;
    procedure DoQuad;
    procedure GetInsideObjectsList(const FindTypeID: integer; const flBuiltInType: boolean;  out List: TByteArray);
    function getColCount: integer;
    procedure setColCount(Value: integer);
    function getRowCount: integer;
    procedure setRowCount(Value: integer);
    function getLineWidth: Double;
    procedure setLineWidth(Value: Double);
    function getColSize: Double;
    function getRowSize: Double;
    procedure GetParams(out oColCount: integer; out oRowCount: integer; out oLineWidth: Double);
  end;

//. TTEllipseVisualizationFunctionality
Type
  TTEllipseVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTEllipseVisualizationSOAPFunctionality: ITTEllipseVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTEllipseVisualizationSOAPFunctionality: ITTEllipseVisualizationSOAPFunctionality;
  end;

//. TEllipseVisualizationFunctionality
Type
  TEllipseVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTEllipseVisualizationSOAPFunctionality: ITEllipseVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TEllipseVisualizationSOAPFunctionality: ITEllipseVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getColor: TColor;
    procedure setColor(Value: TColor);
    function getBorderColor: TColor;
    procedure setBorderColor(Value: TColor);
    function getBorderWidth: Double;
    procedure setBorderWidth(Value: Double);
  end;

//. TTWMFVisualizationFunctionality
Type
  TTWMFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTWMFVisualizationSOAPFunctionality: ITTWMFVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTWMFVisualizationSOAPFunctionality: ITTWMFVisualizationSOAPFunctionality;
  end;

//. TWMFVisualizationFunctionality
Type
  TWMFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTWMFVisualizationSOAPFunctionality: ITWMFVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TWMFVisualizationSOAPFunctionality: ITWMFVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure GetJPEGDATA(out DATAStream: TByteArray; const pWidth: integer; const pHeight: integer; const pQuality: integer; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    procedure SetProportion;
  end;

//. TTPictureVisualizationFunctionality
Type
  TTPictureVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTPictureVisualizationSOAPFunctionality: ITTPictureVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTPictureVisualizationSOAPFunctionality: ITTPictureVisualizationSOAPFunctionality;
  end;

//. TPictureVisualizationFunctionality
Type
  TPictureVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTPictureVisualizationSOAPFunctionality: ITPictureVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TPictureVisualizationSOAPFunctionality: ITPictureVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    procedure GetBMP(out BMP: TByteArray);
    procedure SetProportion;
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    procedure GetParams(out VisibleMinScale: double; out VisibleMaxScale: double);
    procedure SetParams(const VisibleMinScale: double; const VisibleMaxScale: double);
  end;

//. TTRoundVisualizationFunctionality
Type
  TTRoundVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTRoundVisualizationSOAPFunctionality: ITTRoundVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTRoundVisualizationSOAPFunctionality: ITTRoundVisualizationSOAPFunctionality;
  end;

//. TRoundVisualizationFunctionality
Type
  TRoundVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTRoundVisualizationSOAPFunctionality: ITRoundVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TRoundVisualizationSOAPFunctionality: ITRoundVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getColor: TColor;
    procedure setColor(Value: TColor);
    function getBorderColor: TColor;
    procedure setBorderColor(Value: TColor);
    function getBorderWidth: Double;
    procedure setBorderWidth(Value: Double);
  end;

//. TTGeodesyPointFunctionality
Type
  TTGeodesyPointFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTGeodesyPointSOAPFunctionality: ITTGeodesyPointSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTGeodesyPointSOAPFunctionality: ITTGeodesyPointSOAPFunctionality;
    function ConvertSpaceCRDToGeoCRD(const X,Y: Double; out Latitude,Longitude: Double): boolean;
    function ConvertGeoCRDToSpaceCRD(const Latitude,Longitude: Double; out X,Y: Double): boolean;
    procedure GetNearestCrdSys(const pLatitude,pLongitude: double; out idCrdSys: integer);
    procedure GetInstanceListByCrdSys(const idCrdSys: integer; out List: TByteArray);
    function CrdSys_GetNearestGeoPoints(const idCrdSys: integer; const pLatitude,pLongitude: double; const PointsCount: integer; out Points: TByteArray): boolean;
    function CrdSys_GetNearestXYPoints(const idCrdSys: integer; const pX,pY: double; const PointsCount: integer; out Points: TByteArray): boolean;
  end;

//. TGeodesyPointFunctionality
Type
  TGeodesyPointFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTGeodesyPointSOAPFunctionality: ITGeodesyPointSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TGeodesyPointSOAPFunctionality: ITGeodesyPointSOAPFunctionality;
    function getName: string;
    function getHint: string;
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
  end;

//. TTPrivateAreaVisualizationFunctionality
Type
  TTPrivateAreaVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTPrivateAreaVisualizationSOAPFunctionality: ITTPrivateAreaVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTPrivateAreaVisualizationSOAPFunctionality: ITTPrivateAreaVisualizationSOAPFunctionality;
    function CanCreateAsDetail: boolean;
  end;

//. TPrivateAreaVisualizationFunctionality
Type
  TPrivateAreaVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTPrivateAreaVisualizationSOAPFunctionality: ITPrivateAreaVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TPrivateAreaVisualizationSOAPFunctionality: ITPrivateAreaVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getAcquireObjectsInside: boolean;
    procedure setAcquireObjectsInside(Value: boolean);
  end;

//. TTHyperTextFunctionality
Type
  TTHyperTextFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTHyperTextSOAPFunctionality: ITTHyperTextSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTHyperTextSOAPFunctionality: ITTHyperTextSOAPFunctionality;
  end;

//. THyperTextFunctionality
Type
  THyperTextFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTHyperTextSOAPFunctionality: ITHyperTextSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function THyperTextSOAPFunctionality: ITHyperTextSOAPFunctionality;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out Value: TByteArray);
    procedure SetDATA(Value: TByteArray);
  end;

//. TTComponentsFindServiceFunctionality
Type
  TTComponentsFindServiceFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTComponentsFindServiceSOAPFunctionality: ITTComponentsFindServiceSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTComponentsFindServiceSOAPFunctionality: ITTComponentsFindServiceSOAPFunctionality;
  end;

//. TComponentsFindServiceFunctionality
Type
  TComponentsFindServiceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTComponentsFindServiceSOAPFunctionality: ITComponentsFindServiceSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TComponentsFindServiceSOAPFunctionality: ITComponentsFindServiceSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTUsersServiceFunctionality
Type
  TTUsersServiceFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTUsersServiceSOAPFunctionality: ITTUsersServiceSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTUsersServiceSOAPFunctionality: ITTUsersServiceSOAPFunctionality;
  end;

//. TUsersServiceFunctionality
Type
  TUsersServiceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTUsersServiceSOAPFunctionality: ITUsersServiceSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TUsersServiceSOAPFunctionality: ITUsersServiceSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTTransportServiceFunctionality
Type
  TTTransportServiceFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTTransportServiceSOAPFunctionality: ITTTransportServiceSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTTransportServiceSOAPFunctionality: ITTTransportServiceSOAPFunctionality;
  end;

//. TTransportServiceFunctionality
Type
  TTransportServiceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTTransportServiceSOAPFunctionality: ITTransportServiceSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TTransportServiceSOAPFunctionality: ITTransportServiceSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTMarketServiceFunctionality
Type
  TTMarketServiceFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTMarketServiceSOAPFunctionality: ITTMarketServiceSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTMarketServiceSOAPFunctionality: ITTMarketServiceSOAPFunctionality;
  end;

//. TMarketServiceFunctionality
Type
  TMarketServiceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTMarketServiceSOAPFunctionality: ITMarketServiceSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TMarketServiceSOAPFunctionality: ITMarketServiceSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTTelecomServiceFunctionality
Type
  TTTelecomServiceFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTTelecomServiceSOAPFunctionality: ITTTelecomServiceSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTTelecomServiceSOAPFunctionality: ITTTelecomServiceSOAPFunctionality;
  end;

//. TTelecomServiceFunctionality
Type
  TTelecomServiceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTTelecomServiceSOAPFunctionality: ITTelecomServiceSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TTelecomServiceSOAPFunctionality: ITTelecomServiceSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTWNDVisualizationFunctionality
Type
  TTWNDVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTWNDVisualizationSOAPFunctionality: ITTWNDVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTWNDVisualizationSOAPFunctionality: ITTWNDVisualizationSOAPFunctionality;
  end;

//. TWNDVisualizationFunctionality
Type
  TWNDVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTWNDVisualizationSOAPFunctionality: ITWNDVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TWNDVisualizationSOAPFunctionality: ITWNDVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
  end;

Type
      TMRKVisualizationAlign = (mvaLT,mvaTC,mvaTR,mvaRC,mvaRB,mvaBC,mvaBL,mvaLC,mvaC);

//. TTMRKVisualizationFunctionality
Type
  TTMRKVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTMRKVisualizationSOAPFunctionality: ITTMRKVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTMRKVisualizationSOAPFunctionality: ITTMRKVisualizationSOAPFunctionality;
  end;

//. TMRKVisualizationFunctionality
Type
  TMRKVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTMRKVisualizationSOAPFunctionality: ITMRKVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TMRKVisualizationSOAPFunctionality: ITMRKVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
    function getBindingPointIndex: integer;
    procedure setBindingPointIndex(Value: integer);
    function getAlign1: integer;
    procedure setAlign1(Value: integer);
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    procedure GetParams(out oAlign: integer; out oBindingPointIndex: integer);
  end;

Const
  
  TMRKVisualizationAlignStrings: Array[TMRKVisualizationAlign] of string = ('left-top','top-center','top-right','right-center','right-bottom','bottom-center','bottom-left','left-center','center');













//. TTOrientedPictureVisualizationFunctionality
Type
  TTOrientedPictureVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTOrientedPictureVisualizationSOAPFunctionality: ITTOrientedPictureVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTOrientedPictureVisualizationSOAPFunctionality: ITTOrientedPictureVisualizationSOAPFunctionality;
  end;

//. TOrientedPictureVisualizationFunctionality
Type
  TOrientedPictureVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTOrientedPictureVisualizationSOAPFunctionality: ITOrientedPictureVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TOrientedPictureVisualizationSOAPFunctionality: ITOrientedPictureVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure GetDATA1(out DATAStream: TByteArray; out DATAType: Integer; const MaxSize: integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: integer);
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
  end;

//. TTOrientedTTFVisualizationFunctionality
Type
  TTOrientedTTFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTOrientedTTFVisualizationSOAPFunctionality: ITTOrientedTTFVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTOrientedTTFVisualizationSOAPFunctionality: ITTOrientedTTFVisualizationSOAPFunctionality;
  end;

//. TOrientedTTFVisualizationFunctionality
Type
  TOrientedTTFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTOrientedTTFVisualizationSOAPFunctionality: ITOrientedTTFVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TOrientedTTFVisualizationSOAPFunctionality: ITOrientedTTFVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
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
  end;

Type
    TImageDATAType = (idtBMP,idtJPG,idtGIF);

Const
  
  ImagesDATATypesFilesExtensions: array[TImageDATAType] of string = ('bmp','jpg','gif');





//. TTIconFunctionality
Type
  TTIconFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTIconSOAPFunctionality: ITTIconSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTIconSOAPFunctionality: ITTIconSOAPFunctionality;
  end;

//. TIconFunctionality
Type
  TIconFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTIconSOAPFunctionality: ITIconSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TIconSOAPFunctionality: ITIconSOAPFunctionality;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: Integer);
    procedure GetBitmapDATA(out BMPDATAStream: TByteArray);
  end;

//. TTMessageBoardMessageFunctionality
Type
  TTMessageBoardMessageFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTMessageBoardMessageSOAPFunctionality: ITTMessageBoardMessageSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTMessageBoardMessageSOAPFunctionality: ITTMessageBoardMessageSOAPFunctionality;
  end;

//. TMessageBoardMessageFunctionality
Type
  TMessageBoardMessageFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTMessageBoardMessageSOAPFunctionality: ITMessageBoardMessageSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TMessageBoardMessageSOAPFunctionality: ITMessageBoardMessageSOAPFunctionality;
    function getName: string;
    function getHint: string;
    function getIdMessageBoard: integer;
    procedure setIdMessageBoard(Value: integer);
    function getIdSenderMessageBoard: integer;
    procedure setIdSenderMessageBoard(Value: integer);
    function DateCreated: TDateTime;
    function getSubject: string;
    procedure setSubject(Value: string);
    procedure GetBody(out Value: TByteArray);
    procedure SetBody(Value: TByteArray);
    function getFlRead: boolean;
    procedure setFlRead(Value: boolean);
    function IsEmpty: boolean;
    function IsCreatedByUser(const pidUser: integer): boolean;
  end;

//. TTMessageBoardFunctionality
Type
  TTMessageBoardFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTMessageBoardSOAPFunctionality: ITTMessageBoardSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTMessageBoardSOAPFunctionality: ITTMessageBoardSOAPFunctionality;
  end;

//. TMessageBoardFunctionality
Type
  TMessageBoardFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTMessageBoardSOAPFunctionality: ITMessageBoardSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TMessageBoardSOAPFunctionality: ITMessageBoardSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function IsUnreadMessageExist: boolean;
    procedure GetMessagesList(out List: TByteArray);
    function CreateNewMessage: integer;
    procedure SendMessage(const idMessage: integer);
    function getIdUser: integer;
    procedure setIdUser(Value: integer);
  end;

//. TTHREFFunctionality
Type
  TTHREFFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTHREFSOAPFunctionality: ITTHREFSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTHREFSOAPFunctionality: ITTHREFSOAPFunctionality;
  end;

//. THREFFunctionality
Type
  THREFFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTHREFSOAPFunctionality: ITHREFSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function THREFSOAPFunctionality: ITHREFSOAPFunctionality;
    function getName: string;
    function getHint: string;
    function getURL: string;
    procedure setURL(Value: string);
    function getAutoStart: boolean;
    procedure setAutoStart(Value: boolean);
  end;

//. TTQDCVisualizationFunctionality
Type
  TTQDCVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTQDCVisualizationSOAPFunctionality: ITTQDCVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTQDCVisualizationSOAPFunctionality: ITTQDCVisualizationSOAPFunctionality;
  end;

//. TQDCVisualizationFunctionality
Type
  TQDCVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTQDCVisualizationSOAPFunctionality: ITQDCVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TQDCVisualizationSOAPFunctionality: ITQDCVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure SetDATA(DATAStream: TByteArray);
    procedure LoadFromBitmap(Bitmap: TByteArray);
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
  end;

//. TTOffersServerFunctionality
Type
  TTOffersServerFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTOffersServerSOAPFunctionality: ITTOffersServerSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTOffersServerSOAPFunctionality: ITTOffersServerSOAPFunctionality;
  end;

//. TOffersServerFunctionality
Type
  TOffersServerFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTOffersServerSOAPFunctionality: ITOffersServerSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TOffersServerSOAPFunctionality: ITOffersServerSOAPFunctionality;
    function getName: string;
    function getHint: string;
    function getMailROBOT_Inbox: string;
    procedure setMailROBOT_Inbox(Value: string);
    function getMailROBOT_User: string;
    procedure setMailROBOT_User(Value: string);
    function getMailROBOT_Password: string;
    procedure setMailROBOT_Password(Value: string);
  end;

//. TTSecurityComponentOperationFunctionality
Type
  TTSecurityComponentOperationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTSecurityComponentOperationSOAPFunctionality: ITTSecurityComponentOperationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTSecurityComponentOperationSOAPFunctionality: ITTSecurityComponentOperationSOAPFunctionality;
    procedure GetInstanceListByContext(const Context: WideString; out List: TByteArray);
  end;

//. TSecurityComponentOperationFunctionality
Type
  TSecurityComponentOperationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTSecurityComponentOperationSOAPFunctionality: ITSecurityComponentOperationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TSecurityComponentOperationSOAPFunctionality: ITSecurityComponentOperationSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getSQLInfo: string;
    procedure setSQLInfo(Value: string);
  end;

//. TTSecurityKeyFunctionality
Type
  TTSecurityKeyFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTSecurityKeySOAPFunctionality: ITTSecurityKeySOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTSecurityKeySOAPFunctionality: ITTSecurityKeySOAPFunctionality;
    function GetInstanceByCode(const Code: string;  out idInstance: integer): boolean;
    procedure GetInstanceListByContext(const Context: WideString; out List: TByteArray);
  end;

//. TSecurityKeyFunctionality
Type
  TSecurityKeyFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTSecurityKeySOAPFunctionality: ITSecurityKeySOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TSecurityKeySOAPFunctionality: ITSecurityKeySOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getInfo: string;
    procedure setInfo(Value: string);
    procedure GetAssotiatedUsers(out Users: TByteArray);
    procedure GenerateCode;
    function Code: string;
  end;

//. TTSecurityFileFunctionality
Type
  TTSecurityFileFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTSecurityFileSOAPFunctionality: ITTSecurityFileSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTSecurityFileSOAPFunctionality: ITTSecurityFileSOAPFunctionality;
    procedure GetInstanceListByContext(const Context: WideString;out List: TByteArray);
  end;

//. TSecurityFileFunctionality
Type
  TSecurityFileFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTSecurityFileSOAPFunctionality: ITSecurityFileSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TSecurityFileSOAPFunctionality: ITSecurityFileSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getInfo: string;
    procedure setInfo(Value: string);
    function GetDATA(out Value: TByteArray): boolean;
    procedure SetDATA(Value: TByteArray);
    function AddOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
    function RemoveOperationSecurityKey(const OperationID: integer; const SecurityKeyID: integer): boolean;
    procedure GetAssotiatedSecurityComponents(out SecurityComponents: TByteArray);
  end;

//. TTSecurityComponentFunctionality
Type
  TTSecurityComponentFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTSecurityComponentSOAPFunctionality: ITTSecurityComponentSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTSecurityComponentSOAPFunctionality: ITTSecurityComponentSOAPFunctionality;
    procedure DestroyInstance(const idObj: integer);
  end;

//. TSecurityComponentFunctionality
Type
  TSecurityComponentFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTSecurityComponentSOAPFunctionality: ITSecurityComponentSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TSecurityComponentSOAPFunctionality: ITSecurityComponentSOAPFunctionality;
    procedure ToClone(out idClone: integer);
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    function getIdSecurityFile: integer;
    procedure setIdSecurityFile(Value: integer);
  end;

Type
      TMODELUSerClientProgram  = (
      mucpSOAPClient = 1,
      mucpCSharpSOAPClient = 2,
      mucpModel1GeoLogAndroidClient = 3,
      mucpModel2TrackLogger1Client = 4,
      mucpModel2GeoLogAndroidClient = 5
    );

Const
  
  UserServerFoldersRoot = 'Folder';


Const
  
    MODELUSER_TASK_PRIORITY_Normal      = 0;
    MODELUSER_TASK_PRIORITY_Minor       = 1;
    MODELUSER_TASK_PRIORITY_Major       = 2;
    MODELUSER_TASK_PRIORITY_Critical    = 3;
    //.
    MODELUSER_TASK_STATUS_Open                  = 1;  //. new task opened
    MODELUSER_TASK_STATUS_Accepted              = 2;  //. task accepted to process
    MODELUSER_TASK_STATUS_Rejected              = 3;  //. task rejected
    MODELUSER_TASK_STATUS_Processing            = 4;  //. task in process (work in progress)
    MODELUSER_TASK_STATUS_Completed             = 5;  //. task is completed with result
    MODELUSER_TASK_STATUS_Cancelled             = 6;  //. task is cencelled
    MODELUSER_TASK_STATUS_Errored               = 7;  //. task data error
    MODELUSER_TASK_STATUS_OutOfExperience       = 8;  //. task is out of experience of user
    MODELUSER_TASK_STATUS_NotNeeded             = 9;  //. task is not needed
    MODELUSER_TASK_STATUS_Deferred              = 10; //. task is deferred
    MODELUSER_TASK_STATUS_Redirected            = 11; //. task is redirected
    MODELUSER_TASK_STATUS_Dispatched            = 12; //. task has been dispatched to user
    MODELUSER_TASK_STATUS_UserNotAvailable      = 13; //. task user is not available
    MODELUSER_TASK_STATUS_ServerPreprocessed    = 14; //. task is preprocessed by server
    MODELUSER_TASK_STATUS_NeedInfo              = 15; //. task required more task information
    MODELUSER_TASK_STATUS_Consulting            = 16; //. task expert consulting with another expert
    MODELUSER_TASK_STATUS_ReceivedByExpert      = 17; //. expert received task
    //.
    MODELUSER_TASK_TYPE_GMMDCardioExpert        = 1;
    //.
    MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_ECGAnalysis            = 1;
    MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_ECGConsultation        = 2;
    MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_HolterAnalysis         = 3;
    MODELUSER_TASK_TYPE_GMMDCardioExpert_SERVICE_HolterConsultation     = 4;



//. TTMODELUserFunctionality
Type
  TTMODELUserFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTMODELUserSOAPFunctionality: ITTMODELUserSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTMODELUserSOAPFunctionality: ITTMODELUserSOAPFunctionality;
    function IsUserExist(const UserName: string; out idUser: integer): boolean;
    procedure GetInstanceListByContext(const Context: WideString; out List: TByteArray);
    procedure GetOnlineUsersForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
    procedure GetOnlineExpertsForDomains(const pOnlineMaxDelay: Double; const pDomains: string; out List: TByteArray);
  end;

//. TMODELUserFunctionality
Type
  TMODELUserFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTMODELUserSOAPFunctionality: ITMODELUserSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TMODELUserSOAPFunctionality: ITMODELUserSOAPFunctionality;
    function getHint: string;
    function GetActiveStateInfo(out ProxySpaceID: integer; out ProxySpaceIP: widestring; out ProxySpaceState: integer): boolean;
    function IsUserOnLine(const MaxDelay: Double): boolean;
    procedure Logout;
    procedure GetSecurityKeysList(out SecurityKeys: TByteArray);
    function SecurityKeys_IsKeyExist(const idSecurityKey: integer): boolean;
    procedure SecurityKeys_Insert(const idSecurityKey: integer);
    procedure SecurityKeys_Delete(const idSecurityKey: integer);
    procedure SecurityKeys_AddKeyByCode(const Code: WideString);
    procedure SecurityKeys_RemoveKeyByCode(const Code: WideString);
    function SecurityKeys_CreateAndAddNewKey(const pName: WideString; const pInfo: WideString;  out KeyCode: WideString): integer;
    procedure GetMessageBoards(out List: TByteArray);
    function HaveUnreadMessages: boolean;
    procedure GetMessages(const flUnreadOnly: boolean; out MessageList: TByteArray);
    procedure IncomingMessages_SendNew(const Message: TByteArray; const SenderID: integer);
    function IncomingMessages_GetUnread(out MessageList: TByteArray): boolean;
    procedure IncomingMessages_GetMessagesSince(const TimeStamp: TDateTime; out MessageList: TByteArray);
    procedure IncomingMessages_GetMessage(const MessageID: integer; out TimeStamp: Double; out Message: TByteArray; out SenderID: integer);
    procedure IncomingMessages_DeleteTo(const TimeStamp: TDateTime);
    function getName: string;
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
    function ServerFolder_AddSubFolder(const RelativePath: WideString; const SubFolderName: WideString): boolean;
    function ServerFolder_AddSubFolder1(const RelativePath: WideString; const SubFolderName: WideString; const SubFolderData: TByteArray): boolean;
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
    procedure Tasks_Item_SetStatus(const idTask: integer; const pStatus: integer; const pStatusComment: string);
    procedure Tasks_Item_SetStatus1(const idTask: integer; const pStatus: integer; const pStatusReason: integer; const pStatusComment: string);
    procedure Tasks_Item_GetResultData(const idTask: integer; out oResultData: TByteArray);
    procedure Tasks_Item_SetResult(const idTask: integer; const pResultCode: integer; const pResultComment: string);
    procedure Tasks_Item_SetResult1(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultComment: string);
    procedure Tasks_Item_SetResult2(const idTask: integer; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);
    procedure Tasks_Item_SetResult3(const idTask: integer; const pCompletedStatusReason: integer; pCompletedStatusComment: string; const pResultCode: integer; const pResultData: TByteArray; const pResultComment: string);
    function Billing_Account: double;
    function Billing_Transactions_AddNew(const pReason: integer; const pDelta: double; const pComment: string): integer;
    procedure Billing_Transactions_Remove(const idTransaction: integer);
    procedure Billing_Transactions_Clear;
    procedure Billing_Transactions_GetData(const Version: integer; out oData: TByteArray);
    procedure ClientProgram_GetReleases(const ProgramID: integer; const Localization: WideString; out Data: TByteArray);
  end;

Type
    TTextureDATAType = (tdtBMP,tdtJPG,tdtGIF);

Const
  
  TexturesDATATypesFilesExtensions: array[TTextureDATAType] of string = ('bmp','jpg','gif');

  


//. TTTextureFunctionality
Type
  TTTextureFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTTextureSOAPFunctionality: ITTTextureSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTTextureSOAPFunctionality: ITTTextureSOAPFunctionality;
    procedure GetInstanceListMatchingBy(const NameContext: string; out List: TByteArray);
  end;

//. TTextureFunctionality
Type
  TTextureFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTTextureSOAPFunctionality: ITTextureSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TTextureSOAPFunctionality: ITTextureSOAPFunctionality;
    function getName: string;
    function getHint: string;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: Integer);
    procedure GetBitmapDATA(out BMPDATAStream: TByteArray);
    procedure setName(Value: string);
  end;

//. TTBuffered3DVisualizationFunctionality
Type
  TTBuffered3DVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTBuffered3DVisualizationSOAPFunctionality: ITTBuffered3DVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTBuffered3DVisualizationSOAPFunctionality: ITTBuffered3DVisualizationSOAPFunctionality;
  end;

//. TBuffered3DVisualizationFunctionality
Type
  TBuffered3DVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTBuffered3DVisualizationSOAPFunctionality: ITBuffered3DVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TBuffered3DVisualizationSOAPFunctionality: ITBuffered3DVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure LoadFromStream(DATAStream: TByteArray; const DATAType: integer);
    procedure Get__Translate_XY(out vTranslate_X,vTranslate_Y: Double);
    procedure SetPropertiesLocal(const pScale, pTranslate_X,pTranslate_Y,pTranslate_Z, pRotate_AngleX,pRotate_AngleY,pRotate_AngleZ: Double);
    procedure UpdateXOYProjection;
    function getDATAFileID: integer;
    procedure setDATAFileID(Value: integer);
    procedure DATAFile_Clear;
    procedure GetParams(out oScale: Double; out oTranslate_X: Double; out oTranslate_Y: Double; out oTranslate_Z: Double; out oRotate_AngleX: Double; out oRotate_AngleY: Double; out oRotate_AngleZ: Double);
  end;

//. TTDATAFileFunctionality
Type
  TTDATAFileFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTDATAFileSOAPFunctionality: ITTDATAFileSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTDATAFileSOAPFunctionality: ITTDATAFileSOAPFunctionality;
  end;

//. TDATAFileFunctionality
Type
  TDATAFileFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTDATAFileSOAPFunctionality: ITDATAFileSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TDATAFileSOAPFunctionality: ITDATAFileSOAPFunctionality;
    procedure Check;
    function getName: string;
    function getHint: string;
    function IsNull: boolean;
    procedure Empty;
    procedure GetDATA(out Value: TByteArray);
    procedure SetDATA(Value: TByteArray);
    function getDATAType: string;
    procedure setDATAType(Value: string);
  end;

//. TTCoComponentFunctionality
Type
  TTCoComponentFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCoComponentSOAPFunctionality: ITTCoComponentSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCoComponentSOAPFunctionality: ITTCoComponentSOAPFunctionality;
    procedure GetInstanceListByCoType(const idCoType: integer; out InstanceList: TByteArray);
  end;

//. TCoComponentFunctionality
Type
  TCoComponentFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCoComponentSOAPFunctionality: ITCoComponentSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCoComponentSOAPFunctionality: ITCoComponentSOAPFunctionality;
    function getName: string;
    function getHint: string;
    function idCoType: integer;
    function GetIconImage(out oImage: TByteArray): boolean;
    function GetVisualizationComponent(out idTVisualization,idVisualization: integer): boolean;
  end;

//. TTCoComponentTypeMarkerFunctionality
Type
  TTCoComponentTypeMarkerFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCoComponentTypeMarkerSOAPFunctionality: ITTCoComponentTypeMarkerSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCoComponentTypeMarkerSOAPFunctionality: ITTCoComponentTypeMarkerSOAPFunctionality;
  end;

//. TCoComponentTypeMarkerFunctionality
Type
  TCoComponentTypeMarkerFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCoComponentTypeMarkerSOAPFunctionality: ITCoComponentTypeMarkerSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCoComponentTypeMarkerSOAPFunctionality: ITCoComponentTypeMarkerSOAPFunctionality;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    function GetTypeIconImage(out oImage: TByteArray): boolean;
    procedure setName(Value: string);
    function getIDCoComponentType: integer;
  end;

//. TTCoComponentTypeFunctionality
Type
  TTCoComponentTypeFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCoComponentTypeSOAPFunctionality: ITTCoComponentTypeSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCoComponentTypeSOAPFunctionality: ITTCoComponentTypeSOAPFunctionality;
    procedure GetInstanceListByFileType(const FileType: WideString; out List: TByteArray);
  end;

//. TCoComponentTypeFunctionality
Type
  TCoComponentTypeFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCoComponentTypeSOAPFunctionality: ITCoComponentTypeSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCoComponentTypeSOAPFunctionality: ITCoComponentTypeSOAPFunctionality;
    function getName: string;
    function getHint: string;
    procedure GetDescription(out Value: TByteArray);
    procedure SetDescription(Value: TByteArray);
    procedure GetMarkersList(out List: TByteArray);
    function GetIconImage(out oImage: TByteArray): boolean;
    procedure setName(Value: string);
    function getUID: integer;
    function getDateCreated: TDateTime;
    function getFileType: shortstring;
    procedure setFileType(Value: shortstring);
    function getCoComponentPrototypeID: integer;
    procedure setCoComponentPrototypeID(Value: integer);
  end;

//. TTAddressFunctionality
Type
  TTAddressFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTAddressSOAPFunctionality: ITTAddressSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTAddressSOAPFunctionality: ITTAddressSOAPFunctionality;
    procedure Points_GetTypeNames(out List: TByteArray);
    procedure Streets_GetTypeNames(out List: TByteArray);
  end;

//. TAddressFunctionality
Type
  TAddressFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTAddressSOAPFunctionality: ITAddressSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TAddressSOAPFunctionality: ITAddressSOAPFunctionality;
    function getName: string;
    function getHint: string;
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
  end;

//. TTTransportRouteFunctionality
Type
  TTTransportRouteFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTTransportRouteSOAPFunctionality: ITTTransportRouteSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTTransportRouteSOAPFunctionality: ITTTransportRouteSOAPFunctionality;
    procedure GetInstanceList(out List: TByteArray);
  end;

//. TTransportRouteFunctionality
Type
  TTransportRouteFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTTransportRouteSOAPFunctionality: ITTransportRouteSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TTransportRouteSOAPFunctionality: ITTransportRouteSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getidTTransport: integer;
    procedure setidTTransport(Value: integer);
    function getValid: boolean;
    procedure setValid(Value: boolean);
    function getRemarks: string;
    procedure setRemarks(Value: string);
    function IsNodesExist: boolean;
    procedure Nodes_GetList(out List: TByteArray);
    function Nodes_IsNodeExist(const idNode: integer): boolean;
    procedure Nodes_ChangeNodeOrder(const idItem: integer; const Order: integer);
    function Nodes__Node_DistanceBefore(const idItem: integer): integer;
    procedure Nodes__Node_SetDistanceBefore(const idItem: integer; const D: integer);
    function Nodes__Node_OrderPrice(const idItem: integer): string;
    procedure Nodes__Node_SetOrderPrice(const idItem: integer; const Price: string);
    function Nodes_Insert(const idNode: integer): integer;
    procedure Nodes_Remove(const idItem: integer);
  end;

//. TTTransportNodeFunctionality
Type
  TTTransportNodeFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTTransportNodeSOAPFunctionality: ITTTransportNodeSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTTransportNodeSOAPFunctionality: ITTTransportNodeSOAPFunctionality;
    procedure GetInstanceList(out List: TByteArray);
  end;

//. TTransportNodeFunctionality
Type
  TTransportNodeFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTTransportNodeSOAPFunctionality: ITTransportNodeSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TTransportNodeSOAPFunctionality: ITTransportNodeSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function IsRoutesExist: boolean;
  end;

//. TTOfferGoodsFunctionality
Type
  TTOfferGoodsFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTOfferGoodsSOAPFunctionality: ITTOfferGoodsSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTOfferGoodsSOAPFunctionality: ITTOfferGoodsSOAPFunctionality;
  end;

//. TOfferGoodsFunctionality
Type
  TOfferGoodsFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTOfferGoodsSOAPFunctionality: ITOfferGoodsSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TOfferGoodsSOAPFunctionality: ITOfferGoodsSOAPFunctionality;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
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
  end;

//. TTTLFStationTMTFunctionality
Type
  TTTLFStationTMTFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTTLFStationTMTSOAPFunctionality: ITTTLFStationTMTSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTTLFStationTMTSOAPFunctionality: ITTTLFStationTMTSOAPFunctionality;
    procedure GetInstanceList(out List: TByteArray);
  end;

//. TTLFStationTMTFunctionality
Type
  TTLFStationTMTFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTTLFStationTMTSOAPFunctionality: ITTLFStationTMTSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TTLFStationTMTSOAPFunctionality: ITTLFStationTMTSOAPFunctionality;
    function getName: string;
    function getHint: string;
    function getHostName: string;
    procedure setHostName(Value: string);
    function getTestChanel: string;
    procedure setTestChanel(Value: string);
  end;

//. TTNameFunctionality
Type
  TTNameFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTNameSOAPFunctionality: ITTNameSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTNameSOAPFunctionality: ITTNameSOAPFunctionality;
  end;

//. TNameFunctionality
Type
  TNameFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTNameSOAPFunctionality: ITNameSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TNameSOAPFunctionality: ITNameSOAPFunctionality;
    function getName: string;
    function getHint: string;
    function Value: string;
    procedure SetValue(const NewValue: string);
  end;

//. TTVisualizationFunctionality
Type
  TTVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTVisualizationSOAPFunctionality: ITTVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTVisualizationSOAPFunctionality: ITTVisualizationSOAPFunctionality;
  end;

//. TVisualizationFunctionality
Type
  TVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTVisualizationSOAPFunctionality: ITVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TVisualizationSOAPFunctionality: ITVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTHREFVisualizationFunctionality
Type
  TTHREFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTHREFVisualizationSOAPFunctionality: ITTHREFVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTHREFVisualizationSOAPFunctionality: ITTHREFVisualizationSOAPFunctionality;
  end;

//. THREFVisualizationFunctionality
Type
  THREFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTHREFVisualizationSOAPFunctionality: ITHREFVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function THREFVisualizationSOAPFunctionality: ITHREFVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
  end;

//. TTTTFVisualizationFunctionality
Type
  TTTTFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTTTFVisualizationSOAPFunctionality: ITTTTFVisualizationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTTTFVisualizationSOAPFunctionality: ITTTTFVisualizationSOAPFunctionality;
  end;

//. TTTFVisualizationFunctionality
Type
  TTTFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTTTFVisualizationSOAPFunctionality: ITTTFVisualizationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TTTFVisualizationSOAPFunctionality: ITTTFVisualizationSOAPFunctionality;
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
    function getStr: string;
    procedure setStr(const Value: string);
    procedure GetParams(out oStr: WideString; out oFont_Width: Double; out oFont_Height: Double; out oFont_Name: WideString);
    procedure SetParams(const pStr: WideString; const pFont_Width: Double; const pFont_Height: Double; const pFont_Name: WideString);
  end;

//. TTObjectFunctionality
Type
  TTObjectFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTObjectSOAPFunctionality: ITTObjectSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTObjectSOAPFunctionality: ITTObjectSOAPFunctionality;
  end;

//. TObjectFunctionality
Type
  TObjectFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTObjectSOAPFunctionality: ITObjectSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TObjectSOAPFunctionality: ITObjectSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTLabelFunctionality
Type
  TTLabelFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTLabelSOAPFunctionality: ITTLabelSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTLabelSOAPFunctionality: ITTLabelSOAPFunctionality;
  end;

//. TLabelFunctionality
Type
  TLabelFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTLabelSOAPFunctionality: ITLabelSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TLabelSOAPFunctionality: ITLabelSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTStationFunctionality
Type
  TTStationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTStationSOAPFunctionality: ITTStationSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTStationSOAPFunctionality: ITTStationSOAPFunctionality;
    procedure GetInstanceList(out List: TByteArray);
  end;

//. TStationFunctionality
Type
  TStationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTStationSOAPFunctionality: ITStationSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TStationSOAPFunctionality: ITStationSOAPFunctionality;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    procedure GetNumbersBound(out BegNumber,EndNumber: integer);
  end;

//. TTMainLineFunctionality
Type
  TTMainLineFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTMainLineSOAPFunctionality: ITTMainLineSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTMainLineSOAPFunctionality: ITTMainLineSOAPFunctionality;
  end;

//. TMainLineFunctionality
Type
  TMainLineFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTMainLineSOAPFunctionality: ITMainLineSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TMainLineSOAPFunctionality: ITMainLineSOAPFunctionality;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    function GetSTNOwner(out idTOwner,idOwner: integer): boolean;
  end;

//. TTDescriptionFunctionality
Type
  TTDescriptionFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTDescriptionSOAPFunctionality: ITTDescriptionSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTDescriptionSOAPFunctionality: ITTDescriptionSOAPFunctionality;
  end;

//. TDescriptionFunctionality
Type
  TDescriptionFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTDescriptionSOAPFunctionality: ITDescriptionSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TDescriptionSOAPFunctionality: ITDescriptionSOAPFunctionality;
    function getName: string;
    function getHint: string;
    procedure GetValue(out vText: TByteArray);
    procedure SetValue(NewValue: TByteArray);
  end;

//. TTImageFunctionality
Type
  TTImageFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTImageSOAPFunctionality: ITTImageSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTImageSOAPFunctionality: ITTImageSOAPFunctionality;
  end;

//. TImageFunctionality
Type
  TImageFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTImageSOAPFunctionality: ITImageSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TImageSOAPFunctionality: ITImageSOAPFunctionality;
    function getName: string;
    function getHint: string;
    function GetDATAType1: integer;
    procedure GetDATA(out DATAStream: TByteArray; out DATAType: Integer);
    procedure SetDATA(DATAStream: TByteArray; const DATAType: Integer);
    procedure GetBitmapDATA(out BMPDATAStream: TByteArray);
  end;

//. TTWellFunctionality
Type
  TTWellFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTWellSOAPFunctionality: ITTWellSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTWellSOAPFunctionality: ITTWellSOAPFunctionality;
  end;

//. TWellFunctionality
Type
  TWellFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTWellSOAPFunctionality: ITWellSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TWellSOAPFunctionality: ITWellSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

Type
    TAbonentKind = (
    akNormal,   // не спаренный
    akSparedA,  // спаренный A
    akSparedB,  // спаренный B
    akBlockA,   // спаренный через блокиратор A
    akBlockB);

Const
  
  TAbonentKindStrings: array[TAbonentKind] of string = (
    'основной',
    'спаренный А',
    'спаренный Б',
    'блок. А',
    'блок. Б'
  );


//. TTTLFFunctionality
Type
  TTTLFFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTTLFSOAPFunctionality: ITTTLFSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTTLFSOAPFunctionality: ITTTLFSOAPFunctionality;
    procedure GetIDInstanceByNumber(out ID: integer; const Number: integer);
  end;

//. TTLFFunctionality
Type
  TTLFFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTTLFSOAPFunctionality: ITTLFSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TTLFSOAPFunctionality: ITTLFSOAPFunctionality;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
    function Number: integer;
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
  end;

//. TTBoxFunctionality
Type
  TTBoxFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTBoxSOAPFunctionality: ITTBoxSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTBoxSOAPFunctionality: ITTBoxSOAPFunctionality;
  end;

//. TBoxFunctionality
Type
  TBoxFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTBoxSOAPFunctionality: ITBoxSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TBoxSOAPFunctionality: ITBoxSOAPFunctionality;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTCableBoxFunctionality
Type
  TTCableBoxFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCableBoxSOAPFunctionality: ITTCableBoxSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCableBoxSOAPFunctionality: ITTCableBoxSOAPFunctionality;
  end;

//. TCableBoxFunctionality
Type
  TCableBoxFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCableBoxSOAPFunctionality: ITCableBoxSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCableBoxSOAPFunctionality: ITCableBoxSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTDistrLineFunctionality
Type
  TTDistrLineFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTDistrLineSOAPFunctionality: ITTDistrLineSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTDistrLineSOAPFunctionality: ITTDistrLineSOAPFunctionality;
  end;

//. TDistrLineFunctionality
Type
  TDistrLineFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTDistrLineSOAPFunctionality: ITDistrLineSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TDistrLineSOAPFunctionality: ITDistrLineSOAPFunctionality;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTClientFunctionality
Type
  TTClientFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTClientSOAPFunctionality: ITTClientSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTClientSOAPFunctionality: ITTClientSOAPFunctionality;
    procedure GetInstanceList(out List: TByteArray);
  end;

//. TClientFunctionality
Type
  TClientFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTClientSOAPFunctionality: ITClientSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TClientSOAPFunctionality: ITClientSOAPFunctionality;
    function GetDebet(out Value: Double): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTHouseFunctionality
Type
  TTHouseFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTHouseSOAPFunctionality: ITTHouseSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTHouseSOAPFunctionality: ITTHouseSOAPFunctionality;
  end;

//. THouseFunctionality
Type
  THouseFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTHouseSOAPFunctionality: ITHouseSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function THouseSOAPFunctionality: ITHouseSOAPFunctionality;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTCommNodeFunctionality
Type
  TTCommNodeFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCommNodeSOAPFunctionality: ITTCommNodeSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCommNodeSOAPFunctionality: ITTCommNodeSOAPFunctionality;
  end;

//. TCommNodeFunctionality
Type
  TCommNodeFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCommNodeSOAPFunctionality: ITCommNodeSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCommNodeSOAPFunctionality: ITCommNodeSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTCrossFunctionality
Type
  TTCrossFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCrossSOAPFunctionality: ITTCrossSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCrossSOAPFunctionality: ITTCrossSOAPFunctionality;
  end;

//. TCrossFunctionality
Type
  TCrossFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCrossSOAPFunctionality: ITCrossSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCrossSOAPFunctionality: ITCrossSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTCaseFunctionality
Type
  TTCaseFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCaseSOAPFunctionality: ITTCaseSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCaseSOAPFunctionality: ITTCaseSOAPFunctionality;
  end;

//. TCaseFunctionality
Type
  TCaseFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCaseSOAPFunctionality: ITCaseSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCaseSOAPFunctionality: ITCaseSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTStreetFunctionality
Type
  TTStreetFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTStreetSOAPFunctionality: ITTStreetSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTStreetSOAPFunctionality: ITTStreetSOAPFunctionality;
  end;

//. TStreetFunctionality
Type
  TStreetFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTStreetSOAPFunctionality: ITStreetSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TStreetSOAPFunctionality: ITStreetSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTOtherObjFunctionality
Type
  TTOtherObjFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTOtherObjSOAPFunctionality: ITTOtherObjSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTOtherObjSOAPFunctionality: ITTOtherObjSOAPFunctionality;
  end;

//. TOtherObjFunctionality
Type
  TOtherObjFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTOtherObjSOAPFunctionality: ITOtherObjSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TOtherObjSOAPFunctionality: ITOtherObjSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTSpanFunctionality
Type
  TTSpanFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTSpanSOAPFunctionality: ITTSpanSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTSpanSOAPFunctionality: ITTSpanSOAPFunctionality;
  end;

//. TSpanFunctionality
Type
  TSpanFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTSpanSOAPFunctionality: ITSpanSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TSpanSOAPFunctionality: ITSpanSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTChanelFunctionality
Type
  TTChanelFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTChanelSOAPFunctionality: ITTChanelSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTChanelSOAPFunctionality: ITTChanelSOAPFunctionality;
  end;

//. TChanelFunctionality
Type
  TChanelFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTChanelSOAPFunctionality: ITChanelSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TChanelSOAPFunctionality: ITChanelSOAPFunctionality;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTHandHoldFunctionality
Type
  TTHandHoldFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTHandHoldSOAPFunctionality: ITTHandHoldSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTHandHoldSOAPFunctionality: ITTHandHoldSOAPFunctionality;
  end;

//. THandHoldFunctionality
Type
  THandHoldFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTHandHoldSOAPFunctionality: ITHandHoldSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function THandHoldSOAPFunctionality: ITHandHoldSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTLineDistFunctionality
Type
  TTLineDistFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTLineDistSOAPFunctionality: ITTLineDistSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTLineDistSOAPFunctionality: ITTLineDistSOAPFunctionality;
  end;

//. TLineDistFunctionality
Type
  TLineDistFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTLineDistSOAPFunctionality: ITLineDistSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TLineDistSOAPFunctionality: ITLineDistSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTMuffFunctionality
Type
  TTMuffFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTMuffSOAPFunctionality: ITTMuffSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTMuffSOAPFunctionality: ITTMuffSOAPFunctionality;
  end;

//. TMuffFunctionality
Type
  TMuffFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTMuffSOAPFunctionality: ITMuffSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TMuffSOAPFunctionality: ITMuffSOAPFunctionality;
    function getName: string;
    function getHint: string;
  end;

//. TTOfferFunctionality
Type
  TTOfferFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTOfferSOAPFunctionality: ITTOfferSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTOfferSOAPFunctionality: ITTOfferSOAPFunctionality;
    function GetOfferByHumanID(const HumanID: integer; out idOffer: integer): boolean;
  end;

//. TOfferFunctionality
Type
  TOfferFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTOfferSOAPFunctionality: ITOfferSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TOfferSOAPFunctionality: ITOfferSOAPFunctionality;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function getSchedule: string;
    procedure setSchedule(Value: string);
    function getPassword: string;
    procedure setPassword(Value: string);
    function getContactTLF: integer;
    procedure setContactTLF(Value: integer);
    function getLastUpdated: TDateTime;
    procedure setLastUpdated(Value: TDateTime);
    procedure LoadDATAFromStream(Stream: TByteArray);
    function UserID: integer;
    function UID: integer;
    function AddressStr: string;
    function Goods_Insert: integer;
    procedure Goods_GetList(out List: TByteArray);
    procedure Goods_Remove(const idOfferGoods: integer);
    procedure Goods_Clear;
  end;

//. TTDemandFunctionality
Type
  TTDemandFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTDemandSOAPFunctionality: ITTDemandSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTDemandSOAPFunctionality: ITTDemandSOAPFunctionality;
  end;

//. TDemandFunctionality
Type
  TDemandFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTDemandSOAPFunctionality: ITDemandSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TDemandSOAPFunctionality: ITDemandSOAPFunctionality;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTCommLineFunctionality
Type
  TTCommLineFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCommLineSOAPFunctionality: ITTCommLineSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCommLineSOAPFunctionality: ITTCommLineSOAPFunctionality;
  end;

//. TCommLineFunctionality
Type
  TCommLineFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCommLineSOAPFunctionality: ITCommLineSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCommLineSOAPFunctionality: ITCommLineSOAPFunctionality;
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTGoodsFunctionality
Type
  TTGoodsFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTGoodsSOAPFunctionality: ITTGoodsSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTGoodsSOAPFunctionality: ITTGoodsSOAPFunctionality;
    procedure GetInstanceListContainingContext(const Context: string; out List: TByteArray);
    function IsInstanceExist(const pName: string; out idGoods: integer): boolean;
  end;

//. TGoodsFunctionality
Type
  TGoodsFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTGoodsSOAPFunctionality: ITGoodsSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TGoodsSOAPFunctionality: ITGoodsSOAPFunctionality;
    function getName: string;
    procedure setName(Value: string);
    function getHint: string;
    function StdAmount: integer;
    function StdMeasureUnit: string;
  end;

Const
  
    idUnknownGoods = 16;
    sUnknownGoods = '?';
    idUnknownMeasureUnit = 10;
    sUnknownMeasureUnit = '?';





//. TTCollectionFunctionality
Type
  TTCollectionFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    FTTCollectionSOAPFunctionality: ITTCollectionSOAPFunctionality;

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    function TTCollectionSOAPFunctionality: ITTCollectionSOAPFunctionality;
  end;

//. TCollectionFunctionality
Type
  TCollectionFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    FTCollectionSOAPFunctionality: ITCollectionSOAPFunctionality;

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    function TCollectionSOAPFunctionality: ITCollectionSOAPFunctionality;
    function getName: string;
    procedure setName(const Value: string);
    function getHint: string;
    function InsertItem(const idTItem,idItem: integer; const Alias: string; const ListOrder: integer): integer;
    procedure RemoveItem(const id: integer);
    procedure Item_ChangeAlias(const id: integer; const pAlias: string);
    procedure Item_ChangeListOrder(const id: integer; const Order: integer);
    procedure RemoveItems;
    function IsItemExist(const idTItem,idItem: integer): boolean;
    procedure GetListItems(out List: TByteArray);
    procedure SaveListItems(const List: TByteArray);
  end;

