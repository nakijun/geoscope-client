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
    {$IFNDEF EmbeddedServer}
    FTTTileServerVisualizationSOAPFunctionality: ITTTileServerVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTTileServerVisualizationSOAPFunctionality: ITTTileServerVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TTileServerVisualizationFunctionality
Type
  TTileServerVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTileServerVisualizationSOAPFunctionality: ITTileServerVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTileServerVisualizationSOAPFunctionality: ITTileServerVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTMeasurementObjectSOAPFunctionality: ITTMeasurementObjectSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTMeasurementObjectSOAPFunctionality: ITTMeasurementObjectSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTMeasurementObjectSOAPFunctionality: ITMeasurementObjectSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TMeasurementObjectSOAPFunctionality: ITMeasurementObjectSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTAreaNotificationServerSOAPFunctionality: ITTAreaNotificationServerSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTAreaNotificationServerSOAPFunctionality: ITTAreaNotificationServerSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TAreaNotificationServerFunctionality
Type
  TAreaNotificationServerFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTAreaNotificationServerSOAPFunctionality: ITAreaNotificationServerSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TAreaNotificationServerSOAPFunctionality: ITAreaNotificationServerSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTMODELServerVisualizationSOAPFunctionality: ITTMODELServerVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTMODELServerVisualizationSOAPFunctionality: ITTMODELServerVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TMODELServerVisualizationFunctionality
Type
  TMODELServerVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTMODELServerVisualizationSOAPFunctionality: ITMODELServerVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TMODELServerVisualizationSOAPFunctionality: ITMODELServerVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTDoubleVarSOAPFunctionality: ITTDoubleVarSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTDoubleVarSOAPFunctionality: ITTDoubleVarSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TDoubleVarFunctionality
Type
  TDoubleVarFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTDoubleVarSOAPFunctionality: ITDoubleVarSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TDoubleVarSOAPFunctionality: ITDoubleVarSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTInt32VarSOAPFunctionality: ITTInt32VarSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTInt32VarSOAPFunctionality: ITTInt32VarSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TInt32VarFunctionality
Type
  TInt32VarFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTInt32VarSOAPFunctionality: ITInt32VarSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TInt32VarSOAPFunctionality: ITInt32VarSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTURLSOAPFunctionality: ITTURLSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTURLSOAPFunctionality: ITTURLSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TURLFunctionality
Type
  TURLFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTURLSOAPFunctionality: ITURLSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TURLSOAPFunctionality: ITURLSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTPatternVisualizationSOAPFunctionality: ITTPatternVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTPatternVisualizationSOAPFunctionality: ITTPatternVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TPatternVisualizationFunctionality
Type
  TPatternVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTPatternVisualizationSOAPFunctionality: ITPatternVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TPatternVisualizationSOAPFunctionality: ITPatternVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTMapFormatObjectSOAPFunctionality: ITTMapFormatObjectSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTMapFormatObjectSOAPFunctionality: ITTMapFormatObjectSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function GetDATAHash(DATAStream: TByteArray): integer;
  end;

//. TMapFormatObjectFunctionality
Type
  TMapFormatObjectFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTMapFormatObjectSOAPFunctionality: ITMapFormatObjectSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TMapFormatObjectSOAPFunctionality: ITMapFormatObjectSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTMapFormatMapSOAPFunctionality: ITTMapFormatMapSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTMapFormatMapSOAPFunctionality: ITTMapFormatMapSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceListByGeoSpace(const idGeoSpace: integer; out List: TByteArray);
  end;

//. TMapFormatMapFunctionality
Type
  TMapFormatMapFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTMapFormatMapSOAPFunctionality: ITMapFormatMapSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TMapFormatMapSOAPFunctionality: ITMapFormatMapSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTSPLVisualizationSOAPFunctionality: ITTSPLVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTSPLVisualizationSOAPFunctionality: ITTSPLVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TSPLVisualizationFunctionality
Type
  TSPLVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTSPLVisualizationSOAPFunctionality: ITSPLVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TSPLVisualizationSOAPFunctionality: ITSPLVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTBoolVarSOAPFunctionality: ITTBoolVarSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTBoolVarSOAPFunctionality: ITTBoolVarSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TBoolVarFunctionality
Type
  TBoolVarFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTBoolVarSOAPFunctionality: ITBoolVarSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TBoolVarSOAPFunctionality: ITBoolVarSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTGeoSpaceSOAPFunctionality: ITTGeoSpaceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTGeoSpaceSOAPFunctionality: ITTGeoSpaceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TGeoSpaceFunctionality
Type
  TGeoSpaceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTGeoSpaceSOAPFunctionality: ITGeoSpaceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TGeoSpaceSOAPFunctionality: ITGeoSpaceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTUserAlertSOAPFunctionality: ITTUserAlertSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTUserAlertSOAPFunctionality: ITTUserAlertSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetActiveInstanceList(out List: TByteArray);
  end;

//. TUserAlertFunctionality
Type
  TUserAlertFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTUserAlertSOAPFunctionality: ITUserAlertSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TUserAlertSOAPFunctionality: ITUserAlertSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTGeoGraphServerObjectSOAPFunctionality: ITTGeoGraphServerObjectSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTGeoGraphServerObjectSOAPFunctionality: ITTGeoGraphServerObjectSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function GetInstanceByServerObject(const pGeoGraphServerID: integer; const pObjectID: integer; out idInstance: integer): boolean;
  end;

//. TGeoGraphServerObjectFunctionality
Type
  TGeoGraphServerObjectFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTGeoGraphServerObjectSOAPFunctionality: ITGeoGraphServerObjectSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TGeoGraphServerObjectSOAPFunctionality: ITGeoGraphServerObjectSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTGeoGraphServerSOAPFunctionality: ITTGeoGraphServerSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTGeoGraphServerSOAPFunctionality: ITTGeoGraphServerSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetActiveInstanceList(out List: TByteArray);
    function GetInstanceForRegistration: integer;
  end;

//. TGeoGraphServerFunctionality
Type
  TGeoGraphServerFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTGeoGraphServerSOAPFunctionality: ITGeoGraphServerSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TGeoGraphServerSOAPFunctionality: ITGeoGraphServerSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTGeoCrdSystemSOAPFunctionality: ITTGeoCrdSystemSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTGeoCrdSystemSOAPFunctionality: ITTGeoCrdSystemSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceList(out List: TByteArray);
    procedure GetInstanceByLatLong(const pGeoSpaceID: integer; const pLatitude,pLongitude: double; out idCrdSys: integer);
    procedure GetInstanceByXY(const pGeoSpaceID: integer; const pX,pY: double; out idCrdSys: integer);
  end;

//. TGeoCrdSystemFunctionality
Type
  TGeoCrdSystemFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTGeoCrdSystemSOAPFunctionality: ITGeoCrdSystemSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TGeoCrdSystemSOAPFunctionality: ITGeoCrdSystemSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTFilterVisualizationSOAPFunctionality: ITTFilterVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTFilterVisualizationSOAPFunctionality: ITTFilterVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TFilterVisualizationFunctionality
Type
  TFilterVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTFilterVisualizationSOAPFunctionality: ITFilterVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TFilterVisualizationSOAPFunctionality: ITFilterVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTHINTVisualizationSOAPFunctionality: ITTHINTVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTHINTVisualizationSOAPFunctionality: ITTHINTVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceParams(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
    procedure GetInstanceParams1(const IDs: TByteArray; const MaxInstanceSize: integer; out Params: TByteArray);
    procedure GetInstanceOwnerDatasAndParams(const IDs: TByteArray; const DataFlags: TComponentDataFlags; const MaxInstanceSize: integer; out Data: TByteArray; out Params: TByteArray);
  end;

//. THINTVisualizationFunctionality
Type
  THINTVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTHINTVisualizationSOAPFunctionality: ITHINTVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function THINTVisualizationSOAPFunctionality: ITHINTVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTDetailedPictureVisualizationSOAPFunctionality: ITTDetailedPictureVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTDetailedPictureVisualizationSOAPFunctionality: ITTDetailedPictureVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TDetailedPictureVisualizationFunctionality
Type
  TDetailedPictureVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTDetailedPictureVisualizationSOAPFunctionality: ITDetailedPictureVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TDetailedPictureVisualizationSOAPFunctionality: ITDetailedPictureVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTCoVisualizationSOAPFunctionality: ITTCoVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCoVisualizationSOAPFunctionality: ITTCoVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TCoVisualizationFunctionality
Type
  TCoVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCoVisualizationSOAPFunctionality: ITCoVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCoVisualizationSOAPFunctionality: ITCoVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTForumMessageSOAPFunctionality: ITTForumMessageSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTForumMessageSOAPFunctionality: ITTForumMessageSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TForumMessageFunctionality
Type
  TForumMessageFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTForumMessageSOAPFunctionality: ITForumMessageSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TForumMessageSOAPFunctionality: ITForumMessageSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTForumSOAPFunctionality: ITTForumSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTForumSOAPFunctionality: ITTForumSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TForumFunctionality
Type
  TForumFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTForumSOAPFunctionality: ITForumSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TForumSOAPFunctionality: ITForumSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTCUSTOMVisualizationSOAPFunctionality: ITTCUSTOMVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCUSTOMVisualizationSOAPFunctionality: ITTCUSTOMVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TCUSTOMVisualizationFunctionality
Type
  TCUSTOMVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCUSTOMVisualizationSOAPFunctionality: ITCUSTOMVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCUSTOMVisualizationSOAPFunctionality: ITCUSTOMVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTOLEVisualizationSOAPFunctionality: ITTOLEVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTOLEVisualizationSOAPFunctionality: ITTOLEVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TOLEVisualizationFunctionality
Type
  TOLEVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTOLEVisualizationSOAPFunctionality: ITOLEVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TOLEVisualizationSOAPFunctionality: ITOLEVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTHTMLVisualizationSOAPFunctionality: ITTHTMLVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTHTMLVisualizationSOAPFunctionality: ITTHTMLVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. THTMLVisualizationFunctionality
Type
  THTMLVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTHTMLVisualizationSOAPFunctionality: ITHTMLVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function THTMLVisualizationSOAPFunctionality: ITHTMLVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTBZRVisualizationSOAPFunctionality: ITTBZRVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTBZRVisualizationSOAPFunctionality: ITTBZRVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TBZRVisualizationFunctionality
Type
  TBZRVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTBZRVisualizationSOAPFunctionality: ITBZRVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TBZRVisualizationSOAPFunctionality: ITBZRVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTAGIFVisualizationFunctionality
Type
  TTAGIFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTAGIFVisualizationSOAPFunctionality: ITTAGIFVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTAGIFVisualizationSOAPFunctionality: ITTAGIFVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TAGIFVisualizationFunctionality
Type
  TAGIFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTAGIFVisualizationSOAPFunctionality: ITAGIFVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TAGIFVisualizationSOAPFunctionality: ITAGIFVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTOrientedVIDEOVisualizationSOAPFunctionality: ITTOrientedVIDEOVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTOrientedVIDEOVisualizationSOAPFunctionality: ITTOrientedVIDEOVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TOrientedVIDEOVisualizationFunctionality
Type
  TOrientedVIDEOVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTOrientedVIDEOVisualizationSOAPFunctionality: ITOrientedVIDEOVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TOrientedVIDEOVisualizationSOAPFunctionality: ITOrientedVIDEOVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTVIDEOVisualizationSOAPFunctionality: ITTVIDEOVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTVIDEOVisualizationSOAPFunctionality: ITTVIDEOVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TVIDEOVisualizationFunctionality
Type
  TVIDEOVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTVIDEOVisualizationSOAPFunctionality: ITVIDEOVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TVIDEOVisualizationSOAPFunctionality: ITVIDEOVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTOPPVisualizationSOAPFunctionality: ITTOPPVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTOPPVisualizationSOAPFunctionality: ITTOPPVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TOPPVisualizationFunctionality
Type
  TOPPVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTOPPVisualizationSOAPFunctionality: ITOPPVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TOPPVisualizationSOAPFunctionality: ITOPPVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTMODELServerSOAPFunctionality: ITTMODELServerSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTMODELServerSOAPFunctionality: ITTMODELServerSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function GetInstanceByIPAddress(const IPAddress: string;  out id: integer): boolean;
  end;

//. TMODELServerFunctionality
Type
  TMODELServerFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTMODELServerSOAPFunctionality: ITMODELServerSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TMODELServerSOAPFunctionality: ITMODELServerSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTCoReferenceSOAPFunctionality: ITTCoReferenceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCoReferenceSOAPFunctionality: ITTCoReferenceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TCoReferenceFunctionality
Type
  TCoReferenceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCoReferenceSOAPFunctionality: ITCoReferenceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCoReferenceSOAPFunctionality: ITCoReferenceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTPositionerSOAPFunctionality: ITTPositionerSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTPositionerSOAPFunctionality: ITTPositionerSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TPositionerFunctionality
Type
  TPositionerFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTPositionerSOAPFunctionality: ITPositionerSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TPositionerSOAPFunctionality: ITPositionerSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTOrientedWMFVisualizationSOAPFunctionality: ITTOrientedWMFVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTOrientedWMFVisualizationSOAPFunctionality: ITTOrientedWMFVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TOrientedWMFVisualizationFunctionality
Type
  TOrientedWMFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTOrientedWMFVisualizationSOAPFunctionality: ITOrientedWMFVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TOrientedWMFVisualizationSOAPFunctionality: ITOrientedWMFVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTCELLVisualizationSOAPFunctionality: ITTCELLVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCELLVisualizationSOAPFunctionality: ITTCELLVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TCELLVisualizationFunctionality
Type
  TCELLVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCELLVisualizationSOAPFunctionality: ITCELLVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCELLVisualizationSOAPFunctionality: ITCELLVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTEllipseVisualizationSOAPFunctionality: ITTEllipseVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTEllipseVisualizationSOAPFunctionality: ITTEllipseVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TEllipseVisualizationFunctionality
Type
  TEllipseVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTEllipseVisualizationSOAPFunctionality: ITEllipseVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TEllipseVisualizationSOAPFunctionality: ITEllipseVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTWMFVisualizationSOAPFunctionality: ITTWMFVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTWMFVisualizationSOAPFunctionality: ITTWMFVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TWMFVisualizationFunctionality
Type
  TWMFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTWMFVisualizationSOAPFunctionality: ITWMFVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TWMFVisualizationSOAPFunctionality: ITWMFVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTPictureVisualizationSOAPFunctionality: ITTPictureVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTPictureVisualizationSOAPFunctionality: ITTPictureVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TPictureVisualizationFunctionality
Type
  TPictureVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTPictureVisualizationSOAPFunctionality: ITPictureVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TPictureVisualizationSOAPFunctionality: ITPictureVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTRoundVisualizationSOAPFunctionality: ITTRoundVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTRoundVisualizationSOAPFunctionality: ITTRoundVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TRoundVisualizationFunctionality
Type
  TRoundVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTRoundVisualizationSOAPFunctionality: ITRoundVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TRoundVisualizationSOAPFunctionality: ITRoundVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTGeodesyPointSOAPFunctionality: ITTGeodesyPointSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTGeodesyPointSOAPFunctionality: ITTGeodesyPointSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTGeodesyPointSOAPFunctionality: ITGeodesyPointSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TGeodesyPointSOAPFunctionality: ITGeodesyPointSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTPrivateAreaVisualizationSOAPFunctionality: ITTPrivateAreaVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTPrivateAreaVisualizationSOAPFunctionality: ITTPrivateAreaVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function CanCreateAsDetail: boolean;
  end;

//. TPrivateAreaVisualizationFunctionality
Type
  TPrivateAreaVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTPrivateAreaVisualizationSOAPFunctionality: ITPrivateAreaVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TPrivateAreaVisualizationSOAPFunctionality: ITPrivateAreaVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTHyperTextSOAPFunctionality: ITTHyperTextSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTHyperTextSOAPFunctionality: ITTHyperTextSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. THyperTextFunctionality
Type
  THyperTextFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTHyperTextSOAPFunctionality: ITHyperTextSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function THyperTextSOAPFunctionality: ITHyperTextSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTComponentsFindServiceSOAPFunctionality: ITTComponentsFindServiceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTComponentsFindServiceSOAPFunctionality: ITTComponentsFindServiceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TComponentsFindServiceFunctionality
Type
  TComponentsFindServiceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTComponentsFindServiceSOAPFunctionality: ITComponentsFindServiceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TComponentsFindServiceSOAPFunctionality: ITComponentsFindServiceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTUsersServiceFunctionality
Type
  TTUsersServiceFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTUsersServiceSOAPFunctionality: ITTUsersServiceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTUsersServiceSOAPFunctionality: ITTUsersServiceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TUsersServiceFunctionality
Type
  TUsersServiceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTUsersServiceSOAPFunctionality: ITUsersServiceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TUsersServiceSOAPFunctionality: ITUsersServiceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTTransportServiceFunctionality
Type
  TTTransportServiceFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTTransportServiceSOAPFunctionality: ITTTransportServiceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTTransportServiceSOAPFunctionality: ITTTransportServiceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TTransportServiceFunctionality
Type
  TTransportServiceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTransportServiceSOAPFunctionality: ITTransportServiceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTransportServiceSOAPFunctionality: ITTransportServiceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTMarketServiceFunctionality
Type
  TTMarketServiceFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTMarketServiceSOAPFunctionality: ITTMarketServiceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTMarketServiceSOAPFunctionality: ITTMarketServiceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TMarketServiceFunctionality
Type
  TMarketServiceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTMarketServiceSOAPFunctionality: ITMarketServiceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TMarketServiceSOAPFunctionality: ITMarketServiceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTTelecomServiceFunctionality
Type
  TTTelecomServiceFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTTelecomServiceSOAPFunctionality: ITTTelecomServiceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTTelecomServiceSOAPFunctionality: ITTTelecomServiceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TTelecomServiceFunctionality
Type
  TTelecomServiceFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTelecomServiceSOAPFunctionality: ITTelecomServiceSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTelecomServiceSOAPFunctionality: ITTelecomServiceSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTWNDVisualizationFunctionality
Type
  TTWNDVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTWNDVisualizationSOAPFunctionality: ITTWNDVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTWNDVisualizationSOAPFunctionality: ITTWNDVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TWNDVisualizationFunctionality
Type
  TWNDVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTWNDVisualizationSOAPFunctionality: ITWNDVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TWNDVisualizationSOAPFunctionality: ITWNDVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTMRKVisualizationSOAPFunctionality: ITTMRKVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTMRKVisualizationSOAPFunctionality: ITTMRKVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TMRKVisualizationFunctionality
Type
  TMRKVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTMRKVisualizationSOAPFunctionality: ITMRKVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TMRKVisualizationSOAPFunctionality: ITMRKVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTOrientedPictureVisualizationSOAPFunctionality: ITTOrientedPictureVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTOrientedPictureVisualizationSOAPFunctionality: ITTOrientedPictureVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TOrientedPictureVisualizationFunctionality
Type
  TOrientedPictureVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTOrientedPictureVisualizationSOAPFunctionality: ITOrientedPictureVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TOrientedPictureVisualizationSOAPFunctionality: ITOrientedPictureVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTOrientedTTFVisualizationSOAPFunctionality: ITTOrientedTTFVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTOrientedTTFVisualizationSOAPFunctionality: ITTOrientedTTFVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TOrientedTTFVisualizationFunctionality
Type
  TOrientedTTFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTOrientedTTFVisualizationSOAPFunctionality: ITOrientedTTFVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TOrientedTTFVisualizationSOAPFunctionality: ITOrientedTTFVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTIconSOAPFunctionality: ITTIconSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTIconSOAPFunctionality: ITTIconSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TIconFunctionality
Type
  TIconFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTIconSOAPFunctionality: ITIconSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TIconSOAPFunctionality: ITIconSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTMessageBoardMessageSOAPFunctionality: ITTMessageBoardMessageSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTMessageBoardMessageSOAPFunctionality: ITTMessageBoardMessageSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TMessageBoardMessageFunctionality
Type
  TMessageBoardMessageFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTMessageBoardMessageSOAPFunctionality: ITMessageBoardMessageSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TMessageBoardMessageSOAPFunctionality: ITMessageBoardMessageSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTMessageBoardSOAPFunctionality: ITTMessageBoardSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTMessageBoardSOAPFunctionality: ITTMessageBoardSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TMessageBoardFunctionality
Type
  TMessageBoardFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTMessageBoardSOAPFunctionality: ITMessageBoardSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TMessageBoardSOAPFunctionality: ITMessageBoardSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTHREFSOAPFunctionality: ITTHREFSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTHREFSOAPFunctionality: ITTHREFSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. THREFFunctionality
Type
  THREFFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTHREFSOAPFunctionality: ITHREFSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function THREFSOAPFunctionality: ITHREFSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTQDCVisualizationSOAPFunctionality: ITTQDCVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTQDCVisualizationSOAPFunctionality: ITTQDCVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TQDCVisualizationFunctionality
Type
  TQDCVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTQDCVisualizationSOAPFunctionality: ITQDCVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TQDCVisualizationSOAPFunctionality: ITQDCVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTOffersServerSOAPFunctionality: ITTOffersServerSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTOffersServerSOAPFunctionality: ITTOffersServerSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TOffersServerFunctionality
Type
  TOffersServerFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTOffersServerSOAPFunctionality: ITOffersServerSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TOffersServerSOAPFunctionality: ITOffersServerSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTSecurityComponentOperationSOAPFunctionality: ITTSecurityComponentOperationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTSecurityComponentOperationSOAPFunctionality: ITTSecurityComponentOperationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceListByContext(const Context: WideString; out List: TByteArray);
  end;

//. TSecurityComponentOperationFunctionality
Type
  TSecurityComponentOperationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTSecurityComponentOperationSOAPFunctionality: ITSecurityComponentOperationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TSecurityComponentOperationSOAPFunctionality: ITSecurityComponentOperationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTSecurityKeySOAPFunctionality: ITTSecurityKeySOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTSecurityKeySOAPFunctionality: ITTSecurityKeySOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function GetInstanceByCode(const Code: string;  out idInstance: integer): boolean;
    procedure GetInstanceListByContext(const Context: WideString; out List: TByteArray);
  end;

//. TSecurityKeyFunctionality
Type
  TSecurityKeyFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTSecurityKeySOAPFunctionality: ITSecurityKeySOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TSecurityKeySOAPFunctionality: ITSecurityKeySOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTSecurityFileSOAPFunctionality: ITTSecurityFileSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTSecurityFileSOAPFunctionality: ITTSecurityFileSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceListByContext(const Context: WideString;out List: TByteArray);
  end;

//. TSecurityFileFunctionality
Type
  TSecurityFileFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTSecurityFileSOAPFunctionality: ITSecurityFileSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TSecurityFileSOAPFunctionality: ITSecurityFileSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTSecurityComponentSOAPFunctionality: ITTSecurityComponentSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTSecurityComponentSOAPFunctionality: ITTSecurityComponentSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure DestroyInstance(const idObj: integer);
  end;

//. TSecurityComponentFunctionality
Type
  TSecurityComponentFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTSecurityComponentSOAPFunctionality: ITSecurityComponentSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TSecurityComponentSOAPFunctionality: ITSecurityComponentSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTMODELUserSOAPFunctionality: ITTMODELUserSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTMODELUserSOAPFunctionality: ITTMODELUserSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTMODELUserSOAPFunctionality: ITMODELUserSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TMODELUserSOAPFunctionality: ITMODELUserSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTTextureSOAPFunctionality: ITTTextureSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTTextureSOAPFunctionality: ITTTextureSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceListMatchingBy(const NameContext: string; out List: TByteArray);
  end;

//. TTextureFunctionality
Type
  TTextureFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTextureSOAPFunctionality: ITTextureSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTextureSOAPFunctionality: ITTextureSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTBuffered3DVisualizationSOAPFunctionality: ITTBuffered3DVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTBuffered3DVisualizationSOAPFunctionality: ITTBuffered3DVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TBuffered3DVisualizationFunctionality
Type
  TBuffered3DVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTBuffered3DVisualizationSOAPFunctionality: ITBuffered3DVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TBuffered3DVisualizationSOAPFunctionality: ITBuffered3DVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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

Type
      TDATAFileStorageType = (
      dfstBlob = 0,
      dfstFile = 1
    );

//. TTDATAFileFunctionality
Type
  TTDATAFileFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTDATAFileSOAPFunctionality: ITTDATAFileSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTDATAFileSOAPFunctionality: ITTDATAFileSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TDATAFileFunctionality
Type
  TDATAFileFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTDATAFileSOAPFunctionality: ITDATAFileSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TDATAFileSOAPFunctionality: ITDATAFileSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure Check;
    function getName: string;
    function getHint: string;
    function IsNull: boolean;
    procedure Empty;
    function getDATASize: integer;
    procedure GetDATA(out Value: TByteArray);
    procedure SetDATA(Value: TByteArray);
    function getDATAType: string;
    procedure setDATAType(Value: string);
    procedure SetDATAByFileName(const FileName: string);
    function getStorageType: integer;
  end;

//. TTCoComponentFunctionality
Type
  TTCoComponentFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTCoComponentSOAPFunctionality: ITTCoComponentSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCoComponentSOAPFunctionality: ITTCoComponentSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceListByCoType(const idCoType: integer; out InstanceList: TByteArray);
  end;

//. TCoComponentFunctionality
Type
  TCoComponentFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCoComponentSOAPFunctionality: ITCoComponentSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCoComponentSOAPFunctionality: ITCoComponentSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTCoComponentTypeMarkerSOAPFunctionality: ITTCoComponentTypeMarkerSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCoComponentTypeMarkerSOAPFunctionality: ITTCoComponentTypeMarkerSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TCoComponentTypeMarkerFunctionality
Type
  TCoComponentTypeMarkerFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCoComponentTypeMarkerSOAPFunctionality: ITCoComponentTypeMarkerSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCoComponentTypeMarkerSOAPFunctionality: ITCoComponentTypeMarkerSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTCoComponentTypeSOAPFunctionality: ITTCoComponentTypeSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCoComponentTypeSOAPFunctionality: ITTCoComponentTypeSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceListByFileType(const FileType: WideString; out List: TByteArray);
  end;

//. TCoComponentTypeFunctionality
Type
  TCoComponentTypeFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCoComponentTypeSOAPFunctionality: ITCoComponentTypeSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCoComponentTypeSOAPFunctionality: ITCoComponentTypeSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTAddressSOAPFunctionality: ITTAddressSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTAddressSOAPFunctionality: ITTAddressSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure Points_GetTypeNames(out List: TByteArray);
    procedure Streets_GetTypeNames(out List: TByteArray);
  end;

//. TAddressFunctionality
Type
  TAddressFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTAddressSOAPFunctionality: ITAddressSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TAddressSOAPFunctionality: ITAddressSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTTransportRouteSOAPFunctionality: ITTTransportRouteSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTTransportRouteSOAPFunctionality: ITTTransportRouteSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceList(out List: TByteArray);
  end;

//. TTransportRouteFunctionality
Type
  TTransportRouteFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTransportRouteSOAPFunctionality: ITTransportRouteSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTransportRouteSOAPFunctionality: ITTransportRouteSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTTransportNodeSOAPFunctionality: ITTTransportNodeSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTTransportNodeSOAPFunctionality: ITTTransportNodeSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceList(out List: TByteArray);
  end;

//. TTransportNodeFunctionality
Type
  TTransportNodeFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTransportNodeSOAPFunctionality: ITTransportNodeSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTransportNodeSOAPFunctionality: ITTransportNodeSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTOfferGoodsSOAPFunctionality: ITTOfferGoodsSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTOfferGoodsSOAPFunctionality: ITTOfferGoodsSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TOfferGoodsFunctionality
Type
  TOfferGoodsFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTOfferGoodsSOAPFunctionality: ITOfferGoodsSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TOfferGoodsSOAPFunctionality: ITOfferGoodsSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTTLFStationTMTSOAPFunctionality: ITTTLFStationTMTSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTTLFStationTMTSOAPFunctionality: ITTTLFStationTMTSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceList(out List: TByteArray);
  end;

//. TTLFStationTMTFunctionality
Type
  TTLFStationTMTFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTLFStationTMTSOAPFunctionality: ITTLFStationTMTSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTLFStationTMTSOAPFunctionality: ITTLFStationTMTSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTNameSOAPFunctionality: ITTNameSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTNameSOAPFunctionality: ITTNameSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TNameFunctionality
Type
  TNameFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTNameSOAPFunctionality: ITNameSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TNameSOAPFunctionality: ITNameSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTVisualizationSOAPFunctionality: ITTVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTVisualizationSOAPFunctionality: ITTVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TVisualizationFunctionality
Type
  TVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTVisualizationSOAPFunctionality: ITVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TVisualizationSOAPFunctionality: ITVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTHREFVisualizationFunctionality
Type
  TTHREFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTHREFVisualizationSOAPFunctionality: ITTHREFVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTHREFVisualizationSOAPFunctionality: ITTHREFVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. THREFVisualizationFunctionality
Type
  THREFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTHREFVisualizationSOAPFunctionality: ITHREFVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function THREFVisualizationSOAPFunctionality: ITHREFVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function GetOwner(out idTOwner,idOwner: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTTTFVisualizationFunctionality
Type
  TTTTFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTTTFVisualizationSOAPFunctionality: ITTTTFVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTTTFVisualizationSOAPFunctionality: ITTTTFVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TTTFVisualizationFunctionality
Type
  TTTFVisualizationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTTFVisualizationSOAPFunctionality: ITTTFVisualizationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTTFVisualizationSOAPFunctionality: ITTTFVisualizationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTObjectSOAPFunctionality: ITTObjectSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTObjectSOAPFunctionality: ITTObjectSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TObjectFunctionality
Type
  TObjectFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTObjectSOAPFunctionality: ITObjectSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TObjectSOAPFunctionality: ITObjectSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTLabelFunctionality
Type
  TTLabelFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTLabelSOAPFunctionality: ITTLabelSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTLabelSOAPFunctionality: ITTLabelSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TLabelFunctionality
Type
  TLabelFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTLabelSOAPFunctionality: ITLabelSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TLabelSOAPFunctionality: ITLabelSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTStationFunctionality
Type
  TTStationFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTStationSOAPFunctionality: ITTStationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTStationSOAPFunctionality: ITTStationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceList(out List: TByteArray);
  end;

//. TStationFunctionality
Type
  TStationFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTStationSOAPFunctionality: ITStationSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TStationSOAPFunctionality: ITStationSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTMainLineSOAPFunctionality: ITTMainLineSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTMainLineSOAPFunctionality: ITTMainLineSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TMainLineFunctionality
Type
  TMainLineFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTMainLineSOAPFunctionality: ITMainLineSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TMainLineSOAPFunctionality: ITMainLineSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTDescriptionSOAPFunctionality: ITTDescriptionSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTDescriptionSOAPFunctionality: ITTDescriptionSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TDescriptionFunctionality
Type
  TDescriptionFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTDescriptionSOAPFunctionality: ITDescriptionSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TDescriptionSOAPFunctionality: ITDescriptionSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTImageSOAPFunctionality: ITTImageSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTImageSOAPFunctionality: ITTImageSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TImageFunctionality
Type
  TImageFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTImageSOAPFunctionality: ITImageSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TImageSOAPFunctionality: ITImageSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTWellSOAPFunctionality: ITTWellSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTWellSOAPFunctionality: ITTWellSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TWellFunctionality
Type
  TWellFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTWellSOAPFunctionality: ITWellSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TWellSOAPFunctionality: ITWellSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTTLFSOAPFunctionality: ITTTLFSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTTLFSOAPFunctionality: ITTTLFSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetIDInstanceByNumber(out ID: integer; const Number: integer);
  end;

//. TTLFFunctionality
Type
  TTLFFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTLFSOAPFunctionality: ITTLFSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTLFSOAPFunctionality: ITTLFSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTBoxSOAPFunctionality: ITTBoxSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTBoxSOAPFunctionality: ITTBoxSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TBoxFunctionality
Type
  TBoxFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTBoxSOAPFunctionality: ITBoxSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TBoxSOAPFunctionality: ITBoxSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTCableBoxFunctionality
Type
  TTCableBoxFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTCableBoxSOAPFunctionality: ITTCableBoxSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCableBoxSOAPFunctionality: ITTCableBoxSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TCableBoxFunctionality
Type
  TCableBoxFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCableBoxSOAPFunctionality: ITCableBoxSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCableBoxSOAPFunctionality: ITCableBoxSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTDistrLineFunctionality
Type
  TTDistrLineFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTDistrLineSOAPFunctionality: ITTDistrLineSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTDistrLineSOAPFunctionality: ITTDistrLineSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TDistrLineFunctionality
Type
  TDistrLineFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTDistrLineSOAPFunctionality: ITDistrLineSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TDistrLineSOAPFunctionality: ITDistrLineSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTClientFunctionality
Type
  TTClientFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTClientSOAPFunctionality: ITTClientSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTClientSOAPFunctionality: ITTClientSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceList(out List: TByteArray);
  end;

//. TClientFunctionality
Type
  TClientFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTClientSOAPFunctionality: ITClientSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TClientSOAPFunctionality: ITClientSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function GetDebet(out Value: Double): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTHouseFunctionality
Type
  TTHouseFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTHouseSOAPFunctionality: ITTHouseSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTHouseSOAPFunctionality: ITTHouseSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. THouseFunctionality
Type
  THouseFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTHouseSOAPFunctionality: ITHouseSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function THouseSOAPFunctionality: ITHouseSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTCommNodeFunctionality
Type
  TTCommNodeFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTCommNodeSOAPFunctionality: ITTCommNodeSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCommNodeSOAPFunctionality: ITTCommNodeSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TCommNodeFunctionality
Type
  TCommNodeFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCommNodeSOAPFunctionality: ITCommNodeSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCommNodeSOAPFunctionality: ITCommNodeSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTCrossFunctionality
Type
  TTCrossFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTCrossSOAPFunctionality: ITTCrossSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCrossSOAPFunctionality: ITTCrossSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TCrossFunctionality
Type
  TCrossFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCrossSOAPFunctionality: ITCrossSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCrossSOAPFunctionality: ITCrossSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTCaseFunctionality
Type
  TTCaseFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTCaseSOAPFunctionality: ITTCaseSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCaseSOAPFunctionality: ITTCaseSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TCaseFunctionality
Type
  TCaseFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCaseSOAPFunctionality: ITCaseSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCaseSOAPFunctionality: ITCaseSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTStreetFunctionality
Type
  TTStreetFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTStreetSOAPFunctionality: ITTStreetSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTStreetSOAPFunctionality: ITTStreetSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TStreetFunctionality
Type
  TStreetFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTStreetSOAPFunctionality: ITStreetSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TStreetSOAPFunctionality: ITStreetSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTOtherObjFunctionality
Type
  TTOtherObjFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTOtherObjSOAPFunctionality: ITTOtherObjSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTOtherObjSOAPFunctionality: ITTOtherObjSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TOtherObjFunctionality
Type
  TOtherObjFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTOtherObjSOAPFunctionality: ITOtherObjSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TOtherObjSOAPFunctionality: ITOtherObjSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTSpanFunctionality
Type
  TTSpanFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTSpanSOAPFunctionality: ITTSpanSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTSpanSOAPFunctionality: ITTSpanSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TSpanFunctionality
Type
  TSpanFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTSpanSOAPFunctionality: ITSpanSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TSpanSOAPFunctionality: ITSpanSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTChanelFunctionality
Type
  TTChanelFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTChanelSOAPFunctionality: ITTChanelSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTChanelSOAPFunctionality: ITTChanelSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TChanelFunctionality
Type
  TChanelFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTChanelSOAPFunctionality: ITChanelSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TChanelSOAPFunctionality: ITChanelSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTHandHoldFunctionality
Type
  TTHandHoldFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTHandHoldSOAPFunctionality: ITTHandHoldSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTHandHoldSOAPFunctionality: ITTHandHoldSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. THandHoldFunctionality
Type
  THandHoldFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTHandHoldSOAPFunctionality: ITHandHoldSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function THandHoldSOAPFunctionality: ITHandHoldSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTLineDistFunctionality
Type
  TTLineDistFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTLineDistSOAPFunctionality: ITTLineDistSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTLineDistSOAPFunctionality: ITTLineDistSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TLineDistFunctionality
Type
  TLineDistFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTLineDistSOAPFunctionality: ITLineDistSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TLineDistSOAPFunctionality: ITLineDistSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTMuffFunctionality
Type
  TTMuffFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTMuffSOAPFunctionality: ITTMuffSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTMuffSOAPFunctionality: ITTMuffSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TMuffFunctionality
Type
  TMuffFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTMuffSOAPFunctionality: ITMuffSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TMuffSOAPFunctionality: ITMuffSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function getName: string;
    function getHint: string;
  end;

//. TTOfferFunctionality
Type
  TTOfferFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTOfferSOAPFunctionality: ITTOfferSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTOfferSOAPFunctionality: ITTOfferSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function GetOfferByHumanID(const HumanID: integer; out idOffer: integer): boolean;
  end;

//. TOfferFunctionality
Type
  TOfferFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTOfferSOAPFunctionality: ITOfferSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TOfferSOAPFunctionality: ITOfferSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTDemandSOAPFunctionality: ITTDemandSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTDemandSOAPFunctionality: ITTDemandSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TDemandFunctionality
Type
  TDemandFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTDemandSOAPFunctionality: ITDemandSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TDemandSOAPFunctionality: ITDemandSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTCommLineFunctionality
Type
  TTCommLineFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTCommLineSOAPFunctionality: ITTCommLineSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCommLineSOAPFunctionality: ITTCommLineSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TCommLineFunctionality
Type
  TCommLineFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCommLineSOAPFunctionality: ITCommLineSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCommLineSOAPFunctionality: ITCommLineSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    function SetComponentsUsingObject(const idTUseObj,idUseObj: integer): boolean;
    function getName: string;
    function getHint: string;
  end;

//. TTGoodsFunctionality
Type
  TTGoodsFunctionalityRemoted = class(TFunctionality)
  public
    TypeFunctionality: TTypeFunctionality;
    {$IFNDEF EmbeddedServer}
    FTTGoodsSOAPFunctionality: ITTGoodsSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTGoodsSOAPFunctionality: ITTGoodsSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
    procedure GetInstanceListContainingContext(const Context: string; out List: TByteArray);
    function IsInstanceExist(const pName: string; out idGoods: integer): boolean;
  end;

//. TGoodsFunctionality
Type
  TGoodsFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTGoodsSOAPFunctionality: ITGoodsSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TGoodsSOAPFunctionality: ITGoodsSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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
    {$IFNDEF EmbeddedServer}
    FTTCollectionSOAPFunctionality: ITTCollectionSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pTypeFunctionality: TTypeFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TTCollectionSOAPFunctionality: ITTCollectionSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
  end;

//. TCollectionFunctionality
Type
  TCollectionFunctionalityRemoted = class(TFunctionality)
  public
    ComponentFunctionality: TComponentFunctionality;
    {$IFNDEF EmbeddedServer}
    FTCollectionSOAPFunctionality: ITCollectionSOAPFunctionality;
    {$ELSE}
    FServerFunctionality: TFunctionality;
    {$ENDIF}

    Constructor Create(const pComponentFunctionality: TComponentFunctionality);
    Destructor Destroy; override;
    {$IFNDEF EmbeddedServer}
    function TCollectionSOAPFunctionality: ITCollectionSOAPFunctionality;
    {$ELSE}
    function ServerFunctionality(): TFunctionality;
    {$ENDIF}
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

